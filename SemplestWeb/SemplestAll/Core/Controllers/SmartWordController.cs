﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web.Mvc;
using System.Web.UI;
using Semplest.Core.Models.Repositories;
using Semplest.SharedResources.Services;
using SemplestModel;
using Semplest.Core.Models;
using Semplest.SharedResources.Helpers;

namespace Semplest.Core.Controllers
{
    [ExceptionHelper]
    [AuthorizeRole]
    [RequireHttpsHelper]
    [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
    public class SmartWordController : Controller
    {
        //
        // GET: /SmartWord/

        public ActionResult Index()
        {
            var dbContext = new SemplestModel.Semplest();
            var cred = ((Credential) (Session[Semplest.SharedResources.SEMplestConstants.SESSION_USERID]));

            var child = new HomeModelChild();
            IQueryable<Credential> cCred = dbContext.Credentials.Where(x => x.UsersFK == cred.UsersFK);
            ViewBag.Title = cCred.First().User.FirstName + " " + cCred.First().User.LastName + " - " +
                            cCred.First().User.Customer.Name;
            child.ProductGroups = cCred.First().User.Customer.ProductGroups;
            return View(child);
        }

        [HttpGet]
        [RequireRequestValue("promotionId")]
        public ActionResult Setup(int promotionId)
        {
            Session["AllCategories"] = null;
            Session["AllKeyWords"] = null;
            Session["PromoId"] = null;
            Session["NegativeSmartWords"] = null;
            var swr = new SmartWordRepository();
            var swsm = swr.GetSetupModelForPromotionId(promotionId, GetCustomerId());
            ViewBag.Title = swsm.ProductGroup.ProductGroupName + " " + swsm.ProductGroup.ProductPromotionName;
            Session.Add("PromoId", promotionId);
            Session.Add("NegativeSmartwords", swsm.NegativeKeywords);
            Session.Add("NegativeSmartwordsText", swsm.NegativeKeywordsText);
            return View(swsm);
        }

        [HttpPost]
        [ActionName("Setup")]
        [AcceptSubmitType(Name = "Command", Type = "Setup")]
        public ActionResult Setup(SmartWordSetupModel swsm)
        {
            var swr = new SmartWordRepository();
             var newIds = swr.SavePromotionDetails(swsm, swsm, GetCustomerId());
            var scw = new ServiceClientWrapper();
            if (!string.IsNullOrEmpty(newIds))
            {
                foreach (var nvp in newIds.Split(',').Select(items => items.Split('=')))
                {
                    var item = swsm.Addresses.SingleOrDefault(t => t.UID == nvp[0]);
                    if (item != null)
                        item.GeoTargetingPK = int.Parse(nvp[1]);
                }
            }


            var categories = scw.GetCategories(null, swsm.ProductGroup.ProductPromotionName,
                                            swsm.ProductGroup.Words,
                                            null, swsm.LandingUrl);
             var categoryModels= new List<CampaignSetupModel.CategoriesModel>();
             if (categories != null && categories.Count > 0)
             {
                 categoryModels.AddRange(categories.Select((t, i) => new CampaignSetupModel.CategoriesModel {Id = i, Name = t}));
                 Session.Add("AllCategories", categoryModels);
             }


            // get the categoris from the web service
            
            return Json(new { newKeys = newIds, name = "Categories" });

            

        }

        public ActionResult Categories()
        {
            var categoryModels = (List<CampaignSetupModel.CategoriesModel>)Session["AllCategories"];
            if (categoryModels == null)
            {
                //var scw = new ServiceClientWrapper();
                //categoryModels = new List<CampaignSetupModel.CategoriesModel>();
                //model = scw.GetCategories((CampaignSetupModel)Session["CampaignSetupModel"]);
                //Session["CampaignSetupModel"] = model;
                //Session["AllCategories"] = model.AllCategories;
            }
            var promoId = (int)Session["PromoId"];
            //var promoId = _campaignRepository.GetPromotionId(userid, model.ProductGroup.ProductGroupName,
            //                                                 model.ProductGroup.ProductPromotionName);
            var dbContext = new SemplestModel.Semplest();
            var cats = dbContext.KeywordCategories.Where(x => x.PromotionFK == promoId);
            var i = 0;
            var selectedIds = new List<int>();
            if (cats.Any())
            {
                foreach (CampaignSetupModel.CategoriesModel cm in categoryModels)
                {
                    if (cats.Any(x => x.KeywordCategory1 == cm.Name))
                        selectedIds.Add(i);
                    i += 1;
                }

            }
            var swm = new SmartWordSetupModel();
            swm.CategoryIds = selectedIds;
            swm.AllCategories = categoryModels;
            return PartialView(swm);
        }    

        private int GetCustomerId()
        {
            var customerFk =
                ((Credential) System.Web.HttpContext.Current.Session[SharedResources.SEMplestConstants.SESSION_USERID]).
                    User.CustomerFK;
            return customerFk.Value;
        }

        [HttpPost]
        [ActionName("Setup")]
        [AcceptSubmitType(Name = "Command", Type = "GetKeywords")]
        public ActionResult GetKeywords(SmartWordSetupModel model)
        {
            //        var promoId = _campaignRepository.GetPromotionId(userid, model.ProductGroup.ProductGroupName,
            //                                        model.ProductGroup.ProductPromotionName);
            //        _campaignRepository.SaveSelectedCategories(promoId, catList);
            int userid =
                       ((Credential)(Session[Semplest.SharedResources.SEMplestConstants.SESSION_USERID])).UsersFK;
            var catList = new List<string>();
            var categoryModels = (List<CampaignSetupModel.CategoriesModel>)Session["AllCategories"];
            foreach (var cat in categoryModels)
                catList.AddRange(model.CategoryIds.Where(t => cat.Id == t).Select(t => cat.Name));
            var scw = new ServiceClientWrapper();
            var keywords = scw.GetKeywords(catList, null, new string[]{"MSN", "Google"}, 
                                           model.ProductGroup.ProductPromotionName,
                                           model.ProductGroup.Words,null, model.LandingUrl,
                                           null);
            var campaignRepository = new CampaignRepository();
            var kpos = new List<KeywordProbabilityObject>();
            kpos.AddRange(keywords);
            var dbcontext = new SemplestModel.Semplest();
            var promotionRepository = new PromotionRepository(dbcontext);
            var promoId = promotionRepository.GetPromotionId(userid, model.ProductGroup.ProductGroupName,
                                            model.ProductGroup.ProductPromotionName);
            campaignRepository.SaveKeywords(promoId, kpos, null,
             model.ProductGroup.ProductGroupName, model.ProductGroup.ProductPromotionName);
            foreach (var kwm in kpos.Where(key => key.isDeleted == false).Select(key => new CampaignSetupModel.KeywordsModel { Name = key.keyword, Id = key.id }))
                model.AllKeywords.Add(kwm);

            Session.Add("AllKeyWords", model.AllKeywords);



            return Json(new { name = "ViewSmartWords" });
            //        // get the keywords from web service
            //        model = _campaignRepository.GetKeyWords(model, promoId);

                   
            //        model.BillingLaunch.KeywordsCount = model.AllKeywordProbabilityObjects.Count(x => x.isDeleted == false);
            //        Session.Add("CampaignSetupModel", model);

            //        return Json("Billing & Launch");
            //    }
                return Json("ModelState Invalid required data is missing");
            //}
            //catch (Exception ex)
            //{
            //    ExceptionHelper.LogException(ex);
            //    if (ex.Message.Contains("Not enough data provided"))
            //        return Json("Invalid words/phrases, URL or ADs<~>Please check your Landing URL and your words/phrases<br>describing your business.  The System was unable to<br>determine Keyword Categories.");
            //    else
            //        return Json(ex.ToString());
            //}
        }

        public ActionResult Words()
        {
            var keyWordModels = (List<CampaignSetupModel.KeywordsModel>)Session["AllKeyWords"];
            var swm = new SmartWordSetupModel();
            swm.AllKeywords = keyWordModels;
            swm.WordCount = keyWordModels.Count();
            return PartialView(swm);
        }

        [HttpPost]
        [ActionName("Setup")]
        [AcceptSubmitType(Name = "Command", Type = "SetNegativeKeywords")]
        public ActionResult SetNegativeKeywords(SmartWordSetupModel model)
        {
            try
            {
                if (!string.IsNullOrEmpty(model.NegativeKeywordsText))
                {
                    var addl = model.NegativeKeywordsText.Split(',').ToList();
                    addl.ForEach(t => model.NegativeKeywords.Add(t.Trim()));
                }
                Session["NegativeSmartwords"] = model.NegativeKeywords;
                Session["NegativeSmartwordsText"] = model.NegativeKeywordsText;
                var cred =
                    (Credential)(Session[Semplest.SharedResources.SEMplestConstants.SESSION_USERID]);
                var dbcontext = new SemplestModel.Semplest();
                IPromotionRepository pr = new PromotionRepository(dbcontext);
                IKeyWordRepository kwr = new KeyWordRepository(dbcontext);
                var customerFK = GetCustomerId();
                var promo = pr.GetPromoitionFromCampaign(customerFK, model);
                model.AllKeywords = kwr.SaveNegativeKeywords(model, customerFK, promo);
                return Json("NegativeKeywords");
            }
            catch (Exception ex)
            {
                ExceptionHelper.LogException(ex);
                return Json(ExceptionHelper.GetErrorMessage(ex));
            }
        }

        public ActionResult NegativeSmartWords(SmartWordSetupModel model)
        {
            if (Session["NegativeSmartwords"] != null)
            {
                model.NegativeKeywords = (List<string>)Session["NegativeSmartwords"];
                model.NegativeKeywordsText = (string)Session["NegativeSmartwordsText"];
            }
            return PartialView("NegativeSmartWords", model);
        }

        //[HttpPost]
        //[ActionName("Setup")]
        //[AcceptSubmitType(Name = "Command", Type = "ExportSmartWords")]
        public ActionResult ExportSmartWords()
        {
            var keyWordModels = (List<CampaignSetupModel.KeywordsModel>)Session["AllKeyWords"];
            var grid = new System.Web.UI.WebControls.GridView {DataSource = keyWordModels};
            grid.DataBind();
            //HttpContext.Response.Buffer = true;
            //Response.ClearContent();
            //Response.AddHeader("content-disposition", "attachment; filename=YourFileName.xls");
            //Response.ContentType = "application/vnd.ms-excel"; 
            var sw = new StringWriter();
            var htw = new HtmlTextWriter(sw);
            grid.RenderControl(htw);
            //Response.Write(sw.ToString());
            //Response.End();
            var sm = new MemoryStream(Encoding.ASCII.GetBytes( sw.ToString() ));
            return File(sm, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet","SmartWords.xlsx");
            //return new ExcelResult
            //           {
            //               FileName = "sample.xls",
            //               Path = "~/Content/sample.xlsx"
            //           };
        }

        public class ExcelResult : ActionResult
        {
            public string FileName { get; set; }
            public string Path { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                context.HttpContext.Response.Buffer = true;
                context.HttpContext.Response.Clear();
                context.HttpContext.Response.AddHeader("content-disposition", "attachment; filename=" + FileName);
                context.HttpContext.Response.ContentType = "application/vnd.ms-excel";
                context.HttpContext.Response.WriteFile(context.HttpContext.Server.MapPath(Path));
            }
        }

        #region Nested type: AcceptSubmitTypeAttribute

        public class AcceptSubmitTypeAttribute : ActionMethodSelectorAttribute
        {
            public string Name { get; set; }
            public string Type { get; set; }

            public override bool IsValidForRequest(ControllerContext controllerContext, MethodInfo methodInfo)
            {
                return controllerContext.RequestContext.HttpContext
                           .Request.Form[Name] == Type;
            }
        }

        #endregion
    }
}