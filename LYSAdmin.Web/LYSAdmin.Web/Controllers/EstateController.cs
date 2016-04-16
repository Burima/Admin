using LYSAdmin.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LYSAdmin.Web.Utilities;
using Newtonsoft.Json;
using LYSAdmin.Domain.HouseManagement;
using LYSAdmin.Domain.PGDetailManagement;
using System.IO;
using LYSAdmin.Web.Services.Common;

namespace LYSAdmin.Web.Controllers
{
    [LYSAdminAuthorize]
    public class EstateController : Controller
    {
        private IHouseManagement houseManagement;
        private IPGDetailManagement pgDetailManagement;
        PGDetail pgDetail = new PGDetail();
        HouseViewModel houseViewModel = new HouseViewModel();
       
        public EstateController(HouseManagement houseManagement, PGDetailManagement pgDetailManagement)
        {
            this.houseManagement = houseManagement;
            this.pgDetailManagement = pgDetailManagement;

        }
        // GET: Estate
        public ActionResult Index()
        {
            return RedirectToAction("Houses", "Estate");
        }

        //POST : Estate/UpdateLocation
        [HttpPost]
        public JsonResult UpdateLocation(int CityID, int AreaID, string CityName, string AreaName)
        {
            if (CityID > 0 && AreaID > 0 && CityName != String.Empty && AreaName != String.Empty)
            {
                Session["CityID"] = CityID;
                Session["AreaID"] = AreaID;
                Session["CityName"] = CityName;
                Session["AreaName"] = AreaName;
                return Json("SUCCESS");

            }
            else
            {
                return Json("FAILED");
            }

        }

        #region PGDetails
        [Route("Hostels", Name = RouteNames.Hostels)]
        public ActionResult Hostels()
        {
            if (Session["AreaID"] != null)
            {
                PGDetailsViewModel pgDetailsViewModel = new PGDetailsViewModel();
                pgDetailsViewModel.PGDetails = pgDetailManagement.GetPGsByOwnerIDandAreaID(LYSAdmin.Web.Services.SessionManager.GetSessionUser().Id, Convert.ToInt32(Session["AreaID"]));
                return View(pgDetailsViewModel);
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult AddHostel(PGDetailsViewModel pgDetailsViewModel)
        {
            if (ModelState.IsValid)
            {
                var User = (User)Session["User"];
                pgDetailsViewModel.PGDetail.Status = true;
                pgDetailsViewModel.PGDetail.IsPg = true;
                pgDetailsViewModel.PGDetail.CreatedBy = User.Id; /****commented due to identity or DB update****/
                pgDetailsViewModel.PGDetail.UserID = User.Id;//User.RoleID <= 3 ? User.Id : User.ManagerID; /****commented due to identity or DB update****/
                if (Session["AreaID"] != null && Convert.ToInt32(Session["AreaID"]) > 0)
                {
                    pgDetailsViewModel.PGDetail.AreaID = Convert.ToInt32(Session["AreaID"]);
                    int successCount = pgDetailManagement.AddHostel(pgDetailsViewModel.PGDetail);
                    if (successCount > 0)
                    {
                        //Hostel Inserted Successfully
                        TempData["Message"] = "Hostel Added Successfully";
                    }
                    else
                    {
                        //Insertion failed
                        TempData["Message"] = "Hostel couldn't be added. Please try again later.";
                    }
                }
                else
                {
                    TempData["Message"] = "SelectArea"; //Area is not selected for session..Redirect to View to Selet the Area
                }
            }
            else
            {
                //Insertion failed
                TempData["Message"] = "Apartment couldn't be added. Please try again later.";

            }

            return RedirectToAction("Hostels", "Estate");

        }

        [HttpPost]
        public JsonResult GetHostelByID(string pgDetailID)
        {
            pgDetail = pgDetailManagement.GetHostelByID(JsonConvert.DeserializeObject<int>(pgDetailID));
            return Json(pgDetail);
        }

        //Edit Hostel
        [HttpPost]
        public ActionResult EditHostel(PGDetailsViewModel pgDetailsViewModel)
        {
            int count = pgDetailManagement.UpdateHostel(pgDetailsViewModel);
            if (count > 0)
            {
                TempData["Message"] = "Hostel updated Successfully";
            }
            else
            {
                TempData["Message"] = "Hostel couldn't be updated. Please try again later.";
            }
            return RedirectToAction("Hostels", "Estate");
        }

        //[HttpPost]
        //public ActionResult DeleteHostel(string pDetailID)
        //{
        //    //int count = 
        //}

        #endregion

        

        #region Houses
        
        // GET: Estate/Houses
        [HttpGet]
        [Route("Houses", Name = RouteNames.Houses)]
        public ActionResult Houses()
        {
            if (Session["AreaID"] != null && Convert.ToInt32(Session["AreaID"]) > 0)
            {
                houseViewModel.PGDetails = houseManagement.GetPGsByOwnerIDAndAreaID(LYSAdmin.Web.Services.SessionManager.GetSessionUser().Id, GetAreaID());
            }
            else
            {
                TempData["Message"] = "SelectArea"; 
            }
            //houseViewModel.AddedHouseID = AddedHouseID;
            return View("Houses", houseViewModel);

        }

        // POST: Estate/AddHouse
        [HttpPost]
        public ActionResult AddHouse(HouseViewModel houseViewModel)
        {
            int houseID =0;
            if (ModelState.IsValid)
            {
                //IDictionary<int, List<string>> houseImage = new Dictionary<int, List<string>>();
                houseViewModel.House.CreatedBy = LYSAdmin.Web.Services.SessionManager.GetSessionUser().Id; /****commented due to identity or DB update****/
                if (Session["AreaID"] != null && Convert.ToInt32(Session["AreaID"]) > 0)
                {
                    houseID = houseManagement.AddHouse(houseViewModel);
                    if (houseID <=0)
                    {
                        TempData["Message"] = "Houses couldn't be added. Please try again later.";
                    }
                   
                }
                else
                {
                    TempData["Message"] = "SelectArea"; //Area is not selected for session..Redirect to View to Selet the Area
                }
            }
            else
            {
                //Insertion failed
                TempData["Message"] = "House couldn't be added. Please try again later.";

            }
            return RedirectToAction("Houses", "Estate", new { AddedHouseID = houseID }); 
        }

        [HttpPost]
        public ActionResult SaveHouseImageToServerPath(HouseViewModel houseViewModel)
        {
            IDictionary<int, List<string>> houseImageMap;
            int houseID = houseViewModel.AddedHouseID;
            foreach (var fileKey in Request.Files.AllKeys)
            {
                var file = Request.Files[fileKey];
               
                try
                {
                    if (file != null)
                    {

                        var fileName = Path.GetFileName(file.FileName);
                        var path = Server.MapPath("~/files/HouseImages/" + houseID + "/");
                        bool isExists = System.IO.Directory.Exists(path);
                        if (!isExists)
                            System.IO.Directory.CreateDirectory(path);

                        path =   Path.Combine(path, fileName);
                        file.SaveAs(path);
                        if (Session["HouseImageList"] == null)
                        {
                            houseImageMap = new Dictionary<int, List<string>>();
                            houseImageMap.Add(houseID, new List<string>() { path});
                            Session["HouseImageList"] = houseImageMap;
                        }
                        
                        else
                        {
                            houseImageMap = (Dictionary<int, List<string>>)Session["HouseImageList"];
                            houseImageMap[houseID].Add(path);
                        }
                       
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    return Json(new { Message = "Error in saving file" });
                }
            }
          
            return Json(new { Message = "File saved" });
           
        }

        [HttpPost]
        public ActionResult HouseImageUpload()
        {
            int count = houseManagement.InsertHouseImages((Dictionary<int, List<string>>)Session["HouseImageList"]);
            if (count > 0)
            {
               
                TempData["Message"] = "Images uploaded successfully";
                Session["HouseImageList"] = null;
                return Json("SUCCESS");
            }
            else
            {
                Session["HouseImageList"] = null;
                TempData["Message"] = "Uploading images failed.Please try again.";
                return Json("FAILED");
            }
            
           }
        #endregion Houses
      
        public ActionResult Rooms()
        {
            RoomViewModel roomViewModel = new RoomViewModel();
            if (Session["AreaID"] != null && Convert.ToInt32(Session["AreaID"]) > 0)
            {
               //roomViewModel.Houses =
            }
            else
            {
                TempData["Message"] = "SelectArea";
            }
            
           return View("Rooms", roomViewModel);
        }

        #region HelperMethods
        private dynamic GetOwnerID()
        {
            var user = (Model.User)Session["User"];
            int ownerID = 0;
            if (user != null)
            {
                //ownerID = user.RoleID <= 3 ? user.UserID : user.ManagerID; /****commented due to identity or DB update****/
                return ownerID;
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }

        }
        private dynamic GetAreaID()
        {
                return Convert.ToInt32(Session["AreaID"]);
        }
        #endregion Helpermethods




    }
}