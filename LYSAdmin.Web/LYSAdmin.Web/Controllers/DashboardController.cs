
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LYSAdmin.Web.Utilities;

namespace LYSAdmin.Web.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Dashboard
        [LYSAdminAuthorize]
        public ActionResult Index()
        {
            return View("Dashboard");
        }
        public ActionResult Dashboard()
        {
            return View();
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
    }
}