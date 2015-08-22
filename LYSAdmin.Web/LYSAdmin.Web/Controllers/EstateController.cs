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
        public ActionResult Apartments(int Operation = 1)
        {
            if (Session["AreaID"] != null)
            {
                ApartmentViewModel apartmentViewModel = new ApartmentViewModel();
                apartmentViewModel.Apartments = apartmentManagement.GetApartmentsByAreaID(GetOwnerID(), Convert.ToInt32(Session["AreaID"]));
                apartmentViewModel.Operation = Operation;
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
        public JsonResult AddApartment(string ApartmentName, string HouseNo, string Description)
        {

            var User = (User)Session["User"];
            apartment.ApartmentName = JsonConvert.DeserializeObject<string>(ApartmentName);
            apartment.HouseNo = JsonConvert.DeserializeObject<string>(HouseNo);
            apartment.Description = JsonConvert.DeserializeObject<string>(Description);
            apartment.Status = true;
            apartment.CreatedOn = DateTime.Now;
            apartment.LastUpdatedOn = DateTime.Now;
            apartment.IsDeleted = false;
            apartment.CreatedBy = User.UserID;
            apartment.OwnerID = User.RoleID <= 3 ? User.UserID : User.ManagerID;
            //Session["AreaID"] = 1;//test data
            if (Session["AreaID"] != null && Convert.ToInt32(Session["AreaID"]) > 0)
            {
                apartment.AreaID = Convert.ToInt32(Session["AreaID"]);
                int successCount = apartmentManagement.AddApartment(apartment);
                if (successCount > 0)
                {
                    //Apartment Inserted Successfully
                    return Json("SUCCESS");
                }
                else
                {
                    //Insertion failed
                    return Json("Failed");
                }
            }
            else
            {
                return Json("SelectArea");//Area is not selected for session..Redirect to View to Selet the Area
            }

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
            apartmentViewModel.Apartment.Status = true;
            apartmentViewModel.Apartment.LastUpdatedOn = DateTime.Now;
            int count = apartmentManagement.UpdateApartment(apartmentViewModel);
            return View(apartmentViewModel);
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
            houseViewModel.PGDetails = pgDetailManagement.GetPGsByOwnerIDandAreaID(GetOwnerID(), GetAreaID());

            return Json(JsonConvert.SerializeObject(houseViewModel.PGDetails), JsonRequestBehavior.AllowGet);
        }

        // GET: Estate/Houses
        [HttpGet]
        public ActionResult Houses()
        {
            houseViewModel.Apartments = apartmentManagement.GetApartmentsByAreaID(GetOwnerID(), GetAreaID());
            return View("Houses", houseViewModel);

        }

        // POST: Estate/AddHouse
        [HttpPost]
        public ActionResult AddHouse(HouseViewModel houseViewModel)
        {
            houseViewModel.AreaID = GetAreaID();
            houseViewModel.House.OwnerID = GetOwnerID();            
            houseViewModel.House.CreatedBy = ((User)Session["User"]).UserID;
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
                ownerID = user.RoleID <= 3 ? user.UserID : user.ManagerID;
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