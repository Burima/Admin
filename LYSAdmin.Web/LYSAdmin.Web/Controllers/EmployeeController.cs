using LYSAdmin.Web.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LYSAdmin.Web.Controllers
{
    [LYSAdminAuthorize]
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Employee()
        {
            return View();
        }
    }
}