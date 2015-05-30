using LYSAdmin.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LYSAdmin.Web.Utilities;
using LYSAdmin.Domain.ApartmentManagement;
using LYSAdmin.Domain.BlockManagement;
using LYSAdmin.Model;
using Newtonsoft.Json;

namespace LYSAdmin.Web.Controllers
{
    [LYSAdminAuthorize]
    public class EstateController : Controller
    {
        private IApartmentManagement apartmentManagement;
        private IBlockManagement blockManagement;
        Apartment apartment = new Apartment();
        HouseViewModel houseViewModel = new HouseViewModel();
        public EstateController(ApartmentManagement apartmentManagement, BlockManagement blockManagement)
        {
            this.apartmentManagement = apartmentManagement;
            this.blockManagement = blockManagement;
        }
        // GET: Estate
        public ActionResult Index()
        {
            return RedirectToAction("Houses", "Estate");
        }

        #region Apartment
        /// <summary>
        /// Show List of All Apatments
        /// </summary>
        /// <returns></returns>
        public ActionResult Apartments()
        {
            ApartmentViewModel apartmentViewModel = new ApartmentViewModel();
            apartmentViewModel.Apartments = apartmentManagement.GetApartments(GetOwnerID());
            return View(apartmentViewModel);
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
            Session["AreaID"] = 1;//test data
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
            if(count>0)
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
        // GET: Estate/Houses
        [HttpGet]
        public ActionResult Houses()
        {
            houseViewModel.Apartments = apartmentManagement.GetApartments(GetOwnerID());
            return View("Houses", houseViewModel);
        }

        #endregion Houses
        public ActionResult Rooms()
        {
            return View();
        }


        
    }
}