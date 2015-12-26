using LYSAdmin.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LYSAdmin.Web.Utilities;
using LYSAdmin.Domain.ApartmentManagement;
using LYSAdmin.Domain.BlockManagement;
using Newtonsoft.Json;
using LYSAdmin.Domain.HouseManagement;
using LYSAdmin.Domain.PGDetailManagement;

namespace LYSAdmin.Web.Controllers
{
    [LYSAdminAuthorize]
    public class EstateController : Controller
    {
        private IApartmentManagement apartmentManagement;
        private IBlockManagement blockManagement;
        private IHouseManagement houseManagement;
        private IPGDetailManagement pgDetailManagement;
        Apartment apartment = new Apartment();
        PGDetail pgDetail = new PGDetail();
        HouseViewModel houseViewModel = new HouseViewModel();
        public EstateController(ApartmentManagement apartmentManagement, BlockManagement blockManagement, HouseManagement houseManagement, PGDetailManagement pgDetailManagement)
        {
            this.apartmentManagement = apartmentManagement;
            this.blockManagement = blockManagement;
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
                        //Apartment Inserted Successfully
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

        //Edit Apartment
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

        #endregion

        #region Apartment
        /// <summary>
        /// Show List of All Apatments
        /// </summary>
        /// <param name="Operation">
        ///     Operation 1:view (default)
        ///               2: Add
        ///               
        /// </param>
        /// <returns></returns>
        public ActionResult Apartments()
        {
            if (Session["AreaID"] != null)
            {
                ApartmentViewModel apartmentViewModel = apartmentManagement.GetApartmentsByAreaID(
                    LYSAdmin.Web.Services.SessionManager.GetSessionUser().Id, Convert.ToInt32(Session["AreaID"]));
                
                return View(apartmentViewModel);
            }
            else
            {
                return View();
            }
        }


        /// <summary>
        /// Add New partment
        /// </summary>
        /// <param name="apartmentViewModel"></param>
        /// <returns></returns>

        [HttpPost]
        public ActionResult AddApartment(ApartmentViewModel apartmentViewModel)
        {
            if (ModelState.IsValid)
            {
                var User = (User)Session["User"];
                apartmentViewModel.Apartment.Status = true;
                apartmentViewModel.Apartment.CreatedOn = DateTime.Now;
                apartmentViewModel.Apartment.LastUpdatedOn = DateTime.Now;
                apartmentViewModel.Apartment.IsDeleted = false;
                apartmentViewModel.Apartment.CreatedBy = User.Id; 
                if (Session["AreaID"] != null && Convert.ToInt32(Session["AreaID"]) > 0)
                {
                   
                    int successCount = apartmentManagement.AddApartment(apartmentViewModel.Apartment);
                    if (successCount > 0)
                    {
                        //Apartment Inserted Successfully
                        TempData["Message"] = "Apartment Added Successfully";                        
                    }
                    else
                    {
                        //Insertion failed
                        TempData["Message"] = "Apartment couldn't be added. Please try again later.";   
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

            return RedirectToAction("Apartments", "Estate");

        }

        [HttpPost]
        public JsonResult GetApartmentByID(string apartmentID)
        {
            apartment = apartmentManagement.GetApartmentByID(JsonConvert.DeserializeObject<int>(apartmentID));
            return Json(apartment);
        }

        //Edit Apartment
        [HttpPost]
        public ActionResult EditApartment(ApartmentViewModel apartmentViewModel)
        {
            int count = apartmentManagement.UpdateApartment(apartmentViewModel);
            if (count > 0)
            {
                TempData["Message"] = "Apartment updated Successfully";     
            }
            else
            {
                TempData["Message"] = "Apartment couldn't be updated. Please try again later.";  
            }
            return RedirectToAction("Apartments", "Estate");
        }

        #endregion Apartment

        #region Blocks
        public ActionResult Blocks()
        {
            return View();
        }

        [HttpPost]
        public JsonResult SaveBlocks(string Blocksarray)
        {
            List<Block> blocks = JsonConvert.DeserializeObject<List<Block>>(Blocksarray);
            int count = blockManagement.SaveBlocks(blocks);
            if (count > 0)
            {
                return Json("Success");
            }
            else
            {
                return Json("Failed");
            }
        }

        #endregion Blocks

        #region Houses
        /// <summary>
        /// get all the PG/Hostel for a Area filter by OwnerID
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public JsonResult GetPGsByOwnerIDandAreaID()
        {
            houseViewModel.PGDetails = pgDetailManagement.GetPGsByOwnerIDandAreaID(LYSAdmin.Web.Services.SessionManager.GetSessionUser().Id, GetAreaID());

            return Json(JsonConvert.SerializeObject(houseViewModel.PGDetails), JsonRequestBehavior.AllowGet);
        }

        // GET: Estate/Houses
        [HttpGet]
        public ActionResult Houses()
        {
            //houseViewModel.apartmentViewModel = apartmentManagement.GetApartmentsByAreaID(LYSAdmin.Web.Services.SessionManager.GetSessionUser().Id, GetAreaID());
            houseViewModel.PGDetails = pgDetailManagement.GetPGsByOwnerIDandAreaID(LYSAdmin.Web.Services.SessionManager.GetSessionUser().Id, GetAreaID());
            return View("Houses", houseViewModel);

        }

        // POST: Estate/AddHouse
        [HttpPost]
        public ActionResult AddHouse(HouseViewModel houseViewModel)
        {
            houseViewModel.AreaID = GetAreaID();
            //houseViewModel.House.OwnerID = GetOwnerID();     /****commented due to identity or DB update****/     
            //houseViewModel.House.CreatedBy = ((User)Session["User"]).Id; /****commented due to identity or DB update****/
            int count = houseManagement.AddHouse(houseViewModel);

            return RedirectToAction("Houses", "Estate");
        }

        #endregion Houses
        public ActionResult Rooms()
        {
            return View();
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