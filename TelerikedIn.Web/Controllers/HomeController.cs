using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TelerikedIn.Web.Filters;

namespace TelerikedIn.Model
{
    public class HomeController : Controller
    {        
        [InitializeSimpleMembership]
        public ActionResult Index()
        {   
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
