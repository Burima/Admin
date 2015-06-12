
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LYSAdmin.Web.Utilities;
using LYSAdmin.Domain.DashboardManagement;
using LYSAdmin.Model;

namespace LYSAdmin.Web.Controllers
{
    [LYSAdminAuthorize]
    public class DashboardController : Controller
    {
        // GET: Dashboard       

        DashboardManagement dashboardManagement = new DashboardManagement();
        [HttpGet]
        public ActionResult Index()
        {
            return View("Dashboard");
        }

         [HttpGet]
        public ActionResult Dashboard()
        {
            DonughtChart CountLeads = dashboardManagement.GetDonught(GetOwnerID());
            return View("Dashboard", CountLeads);
        }

        public ActionResult Dashboard_2()
        {
            return View();
        }

        public ActionResult Dashboard_3()
        {
            return View();
        }

        public ActionResult Dashboard_4()
        {
            return View();
        }

        public ActionResult Dashboard_4_1()
        {
            return View();
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
    }
}