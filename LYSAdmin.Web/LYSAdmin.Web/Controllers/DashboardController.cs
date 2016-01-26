
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LYSAdmin.Web.Utilities;
using LYSAdmin.Domain.DashboardManagement;
using LYSAdmin.Model;
using LYSAdmin.Web.Services;
using LYSAdmin.Web.Services.Common;

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
         [Route("Dashboard", Name = RouteNames.Dashboard)]
        public ActionResult Dashboard()
        {
            return View("Dashboard", dashboardManagement.GetCommentsAndRating(SessionManager.GetSessionUser().Id));
        }

     }
}