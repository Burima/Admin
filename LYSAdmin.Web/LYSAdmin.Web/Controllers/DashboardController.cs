
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LYSAdmin.Web.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Dashboard

        public ActionResult Index()
        {
            return View("Dashboard_1");
        }
        public ActionResult Dashboard_1()
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