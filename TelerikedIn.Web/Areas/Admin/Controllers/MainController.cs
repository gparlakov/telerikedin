using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TelerikedIn.Model;
using TelerikedIn.Web.Areas.Admin.Models;

namespace TelerikedIn.Web.Areas.Admin.Controllers
{
    public class MainController : Controller
    {
        //
        // GET: /Admin/Admin/

        [Authorize(Roles = "admin")]
        public ActionResult Index()
        {
            return View();
        }       
    }
}
