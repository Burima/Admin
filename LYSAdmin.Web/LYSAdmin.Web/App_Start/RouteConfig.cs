using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace LYSAdmin.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //Employee
            routes.MapRoute(
                name: "Account",
                url: "Account/{action}",
                defaults: new { controller = "Account", action = "Login" }
            );

            //Employee
            routes.MapRoute(
                name: "Employee",
                url: "Employee/{action}",
                defaults: new { controller = "Employee", action = "Employee" }
            );

            //Employee
            routes.MapRoute(
                name: "Estate",
                url: "Estate/{action}",
                defaults: new { controller = "Estate", action = "Houses" }
            );
            
            //Default
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Account", action = "Login", id = UrlParameter.Optional }
            );
        }

    }
}
