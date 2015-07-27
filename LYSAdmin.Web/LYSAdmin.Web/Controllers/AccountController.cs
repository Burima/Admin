using LYSAdmin.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LYSAdmin.Domain.UserManagement;
using LYSAdmin.Web.Utilities;

namespace LYSAdmin.Web.Controllers
{
    public class AccountController : Controller
    {

        private IUserManagement userManagement;
        
        public AccountController(UserManagement userManagement)
        {
            this.userManagement = userManagement;//Initializing UserManageManagement
        }

        //GET: Account
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }


        //POST : Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel loginViewModel)
        {
           
            if (ModelState.IsValid)
            {

                var user_Check = userManagement.ValidateUser(loginViewModel);//Sending form values to UserManagement Service to check the credentials
                if (user_Check != null && user_Check.UserID>0)
                {
                    //Return To Home Page
                    Session["User"] = user_Check;
                    return RedirectToAction("Dashboard", "Dashboard");
                }
                else
                {
                    //Invalid Credentials
                    ViewBag.Error = "Invalid Username or Password";
                    return View(loginViewModel);
                }

            }
            else
            {
                return View(loginViewModel);
            }
        }

        //GET: Account/ForgotPassword
        public ActionResult ForgotPassword()
        {
            return View();
        }

        //GET: Account/Logout
        public ActionResult Logout()
        {

            Session.Abandon();//Clear Session details
            return RedirectToAction("Login", "Account"); //Redirect to login page
        }

        [LYSAdminAuthorize]
        //GET : Account/ProfileView
        public ActionResult ViewProfile()
        {
            return View();
        }

    }
}