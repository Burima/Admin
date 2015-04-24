using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LYSAdmin.Web.Controllers
{
    public class EstateController : Controller
    {
        // GET: Estate
        public ActionResult Index()
        {
            return View("Houses");
        }

        public ActionResult Apartments()
        {
            return View();
        }

        public ActionResult Blocks()
        {
            return View();
        }
        public ActionResult Houses()
        {
            return View();
        }

        public ActionResult Rooms()
        {
            return View();
        }
    }
}