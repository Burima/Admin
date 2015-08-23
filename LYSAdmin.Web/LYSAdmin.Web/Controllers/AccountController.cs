using LYSAdmin.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LYSAdmin.Domain.UserManagement;
using LYSAdmin.Web.Utilities;
using System.Net;
using System.Web.Routing;
using LYSAdmin.Domain;
using System.Configuration;


namespace LYSAdmin.Web.Controllers
{
    public class AccountController : Controller
    {

        private IUserManagement userManagement;
        UserViewModel userViewModel = new UserViewModel();
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
                if (user_Check != null && user_Check.UserID > 0)
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
        [HttpGet]
        //GET : Account/ProfileView
        public ActionResult ViewProfile()
        {
            if (Session["User"] != null) {
               
                userViewModel.User = (User)Session["User"];
                userViewModel.UserDetail = ((User)Session["User"]).UserDetails.FirstOrDefault();
            }
            return View(userViewModel);
        }

        //Edit View
        [LYSAdminAuthorize]
        [HttpPost]

        public ActionResult ViewProfile(UserViewModel userViewModel)
        {
            userViewModel.User.Status = true;
            userViewModel.User.LastUpdatedOn = DateTime.Now;
            userViewModel.User.UserID = TempData["UserID"] != null ? Convert.ToInt32(TempData["UserID"]) : 0;

            if (userViewModel.User.UserID == 0)
            {
                Logout();
                
            }
           
            int count = userManagement.UpdateUser(userViewModel);
            if (count > 0)
            {
                TempData["message"] = "Profile updated successfully!";
            }
            else
            {
                TempData["message"] = "Error in updating your profile.Please try again later";
            }
            return View(userViewModel);
        }


       [HttpPost]
        public virtual ActionResult CropImage(string imagePath, decimal? cropPointX, decimal? cropPointY, decimal? imageCropWidth, decimal? imageCropHeight, string fileName)
        {
            if (string.IsNullOrEmpty(imagePath) || !cropPointX.HasValue || !cropPointY.HasValue || !imageCropWidth.HasValue || !imageCropHeight.HasValue)
            {
                return new HttpStatusCodeResult((int)HttpStatusCode.BadRequest);
            }
            byte[] imageBytes = null;
            string[] imageUriPart = imagePath.Split(',');
            string base64String = imageUriPart[1];
            imageBytes = Convert.FromBase64String(base64String);
            byte[] croppedImage = ImageHelper.CropImage(imageBytes, (int)cropPointX.Value, (int)cropPointY.Value, (int)imageCropWidth.Value, (int)imageCropHeight.Value);

            if (!string.IsNullOrEmpty(fileName))
            {
                string[] getID = fileName.Split('_');
                string tempFolderName = Server.MapPath("~/files/croppedImages/" + getID[0]);
                DateTime timestamp = DateTime.Now;
                string filename = getID[0] + String.Format("{0:d-M-yyyy HH-mm-ss}", timestamp);
                FileHelper.SaveFile(croppedImage, tempFolderName, filename);

                string photoPath = string.Concat("../files/croppedImages/", "/" + getID[0], "/" + filename + ".png");
                return Json(new { PhotoPath = photoPath, filename = filename + ".png" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return new HttpStatusCodeResult((int)HttpStatusCode.BadRequest);
            }
        }

    }
}