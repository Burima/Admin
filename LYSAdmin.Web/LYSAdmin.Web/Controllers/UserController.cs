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
    public class UserController : Controller
    {
         private IUserManagement userManagement;
        UserViewModel userViewModel = new UserViewModel();
        public UserController(UserManagement userManagement)
        {
            this.userManagement = userManagement;//Initializing UserManageManagement
        }

        [LYSAdminAuthorize]
        [HttpGet]
        //GET : Account/ProfileView
        public ActionResult ViewProfile()
        {
            if (Session["User"] != null)
            {
                /****commented due to identity or DB update****/
                //userViewModel.User = (User)Session["User"];
                //userViewModel.UserDetail = ((User)Session["User"]).UserDetails.FirstOrDefault();
            }
            return View(userViewModel);
        }

        //Edit View
        [LYSAdminAuthorize]
        [HttpPost]

        public ActionResult ViewProfile(UserViewModel userViewModel)
        {
            userViewModel.Status = 1;
            userViewModel.LastUpdatedOn = DateTime.Now;
            userViewModel.UserID = TempData["UserID"] != null ? Convert.ToInt32(TempData["UserID"]) : 0;

            if (userViewModel.UserID == 0)
            {
                AccountController accountController = new AccountController();
                accountController.LogOff();

            }

            int count = userManagement.UpdateUser(userViewModel);
            if (count > 0)
            {
                var user = (User)Session["User"];
                user.ProfilePicture = userViewModel.ProfilePicture;
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