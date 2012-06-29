﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Semplest.SharedResources.Models;
using SemplestModel;
using Semplest.SharedResources.Helpers;
using Semplest.SharedResources.Encryption;

namespace Semplest.SharedResources.Controllers
{
    [ExceptionHelper]
    [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")] 
    public class ProfileController : Controller
    {
        //
        // GET: /Profile/

        public ActionResult LogIn()
        {
            Session[Semplest.SharedResources.SEMplestConstants.SESSION_LOGINATTEMPTS] = null;
            Session[Semplest.SharedResources.SEMplestConstants.SESSION_LOGINATTEMPTS] = new Dictionary<string, int>();
            Session[Semplest.SharedResources.SEMplestConstants.SESSION_USERID] = null;
            return View(new ProfileModel());
        }

        [HttpPost]
        public ActionResult LogIn(Semplest.SharedResources.Models.ProfileModel pm, string ReturnUrl, string isAdmin, FormCollection f)
        {
            if (ModelState.IsValid)
            {
                ModelState.Clear();
                Dictionary<string, int> loginHash = (Dictionary<string, int>)Session[Semplest.SharedResources.SEMplestConstants.SESSION_LOGINATTEMPTS];
                if (loginHash == null)
                {
                    loginHash = new Dictionary<string, int>();
                    loginHash.Add(pm.UserName, 1);
                }
                else if (loginHash.ContainsKey(pm.UserName))
                    loginHash[pm.UserName] += 1;
                else
                    loginHash.Add(pm.UserName, 1);

                Session[Semplest.SharedResources.SEMplestConstants.SESSION_LOGINATTEMPTS] = loginHash;
                bool isAdminLogin = isAdmin == null ? false : true;
                using (var dbContext = new SemplestModel.Semplest())
                {
                    Credential cred = null;
                    if (Session[Semplest.SharedResources.SEMplestConstants.SESSION_USERID] != null)
                    {
                        cred = (Credential)Session[Semplest.SharedResources.SEMplestConstants.SESSION_USERID];
                    }
                    else
                    {
                        IQueryable<Credential> creds = null;
                        if(pm.LoggedInSucceeded)
                            creds = dbContext.Credentials.Where(c => c.Username == pm.UserName);
                        else
                            creds = dbContext.Credentials.Where(c => c.Username == pm.UserName && c.Password == pm.Password1);

                        if (creds.Count() == 1)
                        {
                            if ((isAdminLogin && creds.First().IsAdmin()) || (!isAdminLogin && !creds.First().IsAdmin()))
                                cred = creds.First();
                        }

                    }
                    if (cred == null)
                    {
                        pm.LoggedInSucceeded = false;
                        if (loginHash[pm.UserName] > 3)
                        {
                            var userCreds = dbContext.Credentials.Where(c => c.Username == pm.UserName);
                            if (userCreds.Count() > 0 && userCreds.First().User.IsActive)
                            {
                                userCreds.First().User.IsActive = false;
                                dbContext.SaveChanges();
                            }
                            pm.LoginFailedMessage = "Sorry, your account is currently locked. To enable your account, please email help@semplest.com for assistance. Thank you!";
                        }
                        else
                            pm.LoginFailedMessage = "The user name or password entered is incorrect. Please try again.";
                    }
                    else if (!cred.User.IsActive)
                    {
                        pm.LoggedInSucceeded = false;
                        pm.LoginFailedMessage = "Sorry, your account is currently locked. To enable your account, please email help@semplest.com for assistance. Thank you!";
                    }
                    else
                    {
                        Session[Semplest.SharedResources.SEMplestConstants.SESSION_USERID] = cred;
                        if (cred.User.IsRegistered)
                        {
                            //if the user doesn't have a parent in the customerparentfk column then they are a parent else they are a child
                            //if (cred.User.CustomerFK == null || string.IsNullOrEmpty(cred.User.Customer.CustomerHierarchies.First().CustomerParentFK.ToString()))
                            //    return RedirectToAction("Index", "Home");
                            //else if (cred.User.IsRegistered)
                            //user is a regular core user
                            if (cred.User.CustomerFK == null)
                                return RedirectToAction("Index", "Home");
                            else
                                return RedirectToAction("Index2", "Home");
                        }
                        else if (pm.LoggedInSucceeded)
                        {
                            Credential saveCred = dbContext.Credentials.Where(x => x.Username == cred.Username && x.Password == cred.Password).First();
                            //authenticated properly and submitted secondary form SecurityAnswer/SecurityQuestion
                            saveCred.SecurityAnswer = pm.SecurityAnswer;
                            saveCred.SecurityQuestion = pm.SecurityQuestion;
                            saveCred.Password = pm.Password2;
                            saveCred.User.IsRegistered = true;
                            int i = dbContext.SaveChanges();
                            return RedirectToAction("Index", "Home");
                        }
                        else
                        {
                            //authenticated properly and HAS NOT submitted secondary form SecurityAnswer/SecurityQuestion to complete registration
                            pm.IsRegistered = false;
                            pm.LoggedInSucceeded = true;
                        }
                    }
                }
            }
            return View(pm);
        }


        public ActionResult CreateToken(string token)
        {
            
            AesEncyrption ae = AesEncyrption.getInstance();
            Session.Add("aes", ae);

            string encryptedToken = ae.GenerateToken("51", DateTime.Now.ToString(), "userandre", "1");
            return Content(HttpUtility.UrlEncode(encryptedToken) + " " + ae.DecryptString(encryptedToken));
        }

        [HttpGet]
        public ActionResult Verify(string token)
        {
            
            string parentid, datetime, username, password;
            Encryption.AesEncyrption.getInstance().DecryptToken(token, out parentid, out datetime, out username, out password);
            using (var dbContext = new SemplestModel.Semplest())
            {
                IQueryable<Credential> creds;
                creds = dbContext.Credentials.Where(c => c.Username == username && c.Password == password);
                if (creds != null)
                {
                    int? parentKey = string.IsNullOrEmpty(parentid) ? -1 : int.Parse(parentid);
                    parentKey = parentKey == -1 ? null : parentKey;
                    if (creds.Count() == 1 && creds.First().User.Customer.CustomerHierarchies1.First().CustomerParentFK == parentKey)
                    {
                        return RedirectToAction("Login", "Profile");
                    }
                }
            }
            return Content("The URL is invalid.");
        }

        public void AddRightToDatabase(string label, string controllerName, string vAction)
        {
            return;
            bool found = false;
            string myController = ControllerContext.RouteData.Values["Controller"].ToString();
            if (controllerName != "Roles")
            {
                string controllerActionName = controllerName + "." + vAction;
                if (controllerName != myController && !string.IsNullOrEmpty(label))
                {
                    using (var dbContext = new SemplestModel.Semplest())
                    {
                        foreach (Right r in dbContext.Rights)
                        {
                            if (label == r.Label && controllerActionName == r.Controller)
                            {
                                found = true;
                                break;
                            }
                        }
                        try
                        {
                            if (!found)
                            {
                                dbContext.Rights.Add(new Right { Controller = controllerActionName, Label = label });
                                dbContext.SaveChanges();
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.ToString());
                        }
                    }
                }
            }
        }
    }
}
