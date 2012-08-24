﻿using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
using Semplest.WebSite.Models;
using SemplestModel;
using SharedResources.Models;
using Semplest.SharedResources.Services;

namespace Semplest.WebSite.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SEMAbout()
        {
            return View();
        }

        public ActionResult Team()
        {
            return View();
        }
        public ActionResult OpenInvitation()
        {
            return View();
        }
        public ActionResult ContactUs()
        {
            return View();
        }

        public ActionResult Contact()
        { return View(); }

        [HttpPost]
        public ActionResult Contact(SEMCustomerDetail model)
        {
            if (ModelState.IsValid && !(model.CallMe == false && model.EmailMe == false))
            {
                try
                {
                    model.CreatedDate = DateTime.Now;
                    using (var dbContext = new SemplestModel.Semplest())
                    {
                        string semEmail = dbContext.Configurations.Select(m => m.DefalutEmailContactMe).FirstOrDefault();

                        if (model.EmailMe == false)
                        {
                            model.email = "";
                        }
                        else if (model.CallMe == false)
                        {
                            model.Phone = "";
                        }
                        dbContext.SEMCustomerDetails.Add(model);
                        dbContext.SaveChanges();

                        // send email using smtp server
                            SendMail(model, semEmail);
                    }
                }
                catch (Exception ex)
                {
                    string errMsg = "Error: " + ex.Message + "\r\n" + ex.StackTrace;
                    var errModel = new ErrorModel() { MsgToLog = errMsg, MsgToShow = "Error" };
                    return View("ErrorPage", errModel);
                }
                return RedirectToAction("ThankYou");
            }
            else
            {
                return View(model);
            }
        }
        public ActionResult ThankYou()
        {
            return View();
        }
        public ActionResult ErrorPage()
        {
            return View();
        }
        public ActionResult TermsOfUse()
        {
            StaticModel vm = new StaticModel(StaticPages.TermsAndConditions);
            return View("TermsOfUse", vm);
        }
        public ActionResult PrivacyPolicy()
        {
            StaticModel vm = new StaticModel(StaticPages.PrivacyPolicy);
            return View("PrivacyPolicy", vm);
        }
        [HttpPost]
        public ActionResult ContactUs(SEMCustomerDetail model)
        {
            if (ModelState.IsValid && !(model.CallMe == false && model.EmailMe == false))
            {
                try
                {
                    model.CreatedDate = DateTime.Now;
                    using (var dbContext = new SemplestModel.Semplest())
                    {
                        string semEmail = dbContext.Configurations.Select(m => m.DefalutEmailContactMe).FirstOrDefault();

                        if (model.EmailMe == false)
                        {
                            model.email = "";
                        }
                        else if (model.CallMe == false)
                        {
                            model.Phone = "";
                        }
                        dbContext.SEMCustomerDetails.Add(model);
                        dbContext.SaveChanges();

                        // send email using smtp server
                        
                        SendMail(model, semEmail);
                    }
                }
                catch (Exception ex)
                {
                    string errMsg = "Error: " + ex.Message + "\r\n" + ex.StackTrace;
                    var errModel = new ErrorModel() { MsgToLog = errMsg, MsgToShow = "Error" };
                    return View("ErrorPage", errModel);
                }
                return RedirectToAction("ThankYou");
            }
            else
            {

                return View(model);
            }
        }

        private void SendMail(SEMCustomerDetail model, string sEmail)
        {
            using (SemplestModel.Semplest dbcontext = new SemplestModel.Semplest())
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendLine("Name: " + model.FirstName + " " + model.LastName);
                sb.AppendLine("Company: " + model.Company);
                if (!String.IsNullOrEmpty(model.Phone))
                    sb.AppendLine("Phone: " + model.Phone);
                if (!String.IsNullOrEmpty(model.email))
                    sb.AppendLine("Email: " + model.email);
                sb.AppendLine("Notes: " + model.notes);
                var scw = new ServiceClientWrapper();
                scw.SendEmail(dbcontext.Configurations.First().RunMode + " - Semplest Website Inquiry", "website@semplest.com", sEmail, sb.ToString());
            }

        }
    }
}