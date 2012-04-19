﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Semplest.Core.Models;
using SemplestWebApp.Models;
using SemplestWebApp.Services;
using KendoGridBinder;
using Microsoft.Practices.EnterpriseLibrary.Logging;
using SemplestWebApp.Helpers;
using SemplestWebApp.Models.Repositories;

namespace Semplest.Core.Controllers
{
    public class CampaignController : Controller
    {
        private ICampaignRepository campaignRepository;
        public CampaignController(ICampaignRepository iCampaignRepository)
        {
            campaignRepository = iCampaignRepository;
        }
        [AuthorizeRole]
        public ActionResult CampaignSetup()
        {
            LogEntry logEnty = new LogEntry();
            logEnty.ActivityId = Guid.NewGuid();
            logEnty.Message = "Loading";
            Logger.Write(logEnty);
            LogService logService = new LogService();
            logService.AddToLog(1, "Campaign Setup Accessed", "CampaignSetup//CampaignSetup//CampaignSetup", 1);
            var campaignSetupModel = new CampaignSetupModel();
            return View(campaignSetupModel);
        }
        [HttpPost]
        public ActionResult CampaignSetup(CampaignSetupModel model)
        {
            if (ModelState.IsValid)
            {
                SemplestDataService service = new SemplestDataService();
                service.SaveAd(model);
            }
            return View(model);
        }
        [HttpPost]
        public JsonResult AdditionalLinks(KendoGridRequest request)
        {
            var employees = new List<AdditionalLinks>
            {
                new AdditionalLinks { Id = 1, Name = "Bill", Url= "Jones"},
                new AdditionalLinks { Id = 2, Name = "Rob", Url = "Johnson"},
                new AdditionalLinks { Id = 3, Name = "Jane", Url = "Smith"},
            };
            var grid = new KendoGrid<AdditionalLinks>(request, employees);
            return Json(grid);
        }

        [HttpPost]
        public void UpdateAdditionalLinks(KendoGridRequest request)
        {
        }
    }
}
