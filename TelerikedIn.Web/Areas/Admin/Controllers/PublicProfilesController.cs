using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.Resources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TelerikedIn.Model;

namespace TelerikedIn.Web.Areas.Admin.Controllers
{
    public class PublicProfilesController : Controller
    {
        TelerikedIn.Model.TelerikedInDb telerikedInDb = new Model.TelerikedInDb();

        //
        // GET: /Admin/PublicProfiles/

        [Authorize(Roles="admin")]        
        public ActionResult Show()
        {
            try
            {
                var publicProfiles = telerikedInDb.PublicUserProfiles;

                return View(publicProfiles);
            }
            catch
            {
                ModelState.AddModelError("ShowOther", "Couldn't load wanted values.\n");
                return Json(ModelState);
            }
            
        }

        [HttpPost]
        [Authorize(Roles = "admin")]
        public ActionResult ShowOther([DataSourceRequest]DataSourceRequest request)
        {
            try
            {
                var extracted = telerikedInDb.PublicUserProfiles;

                var result = extracted.ToDataSourceResult(request);

                return Json(result);
            }
            catch
            {
                ModelState.AddModelError("ShowOther", "Couldn't load wanted values.\n");
                return Json(ModelState);
            }
        }

        [HttpPost]
        [Authorize(Roles = "admin")]
        public ActionResult Edit([DataSourceRequest]DataSourceRequest request, PublicUserProfile profile)
        {
            using (telerikedInDb)
            {
                try
                {
                    var currentProfile = telerikedInDb.PublicUserProfiles.FirstOrDefault(prof => prof.UserId == profile.UserId);

                    if (currentProfile == null)
                    {
                        currentProfile = new PublicUserProfile();
                        telerikedInDb.PublicUserProfiles.Attach(currentProfile);
                    }

                    foreach (var property in profile.GetType().GetProperties())
                    {
                        if (property.GetValue(currentProfile) != property.GetValue(profile))
                        {
                            property.SetValue(currentProfile, property.GetValue(profile));
                        }
                    }

                    telerikedInDb.SaveChanges();

                    return Json(new { Message = "Edit successful" });
                }
                catch
                {
                    ModelState.AddModelError("Edit", "Couldn't edit wanted values.\n");
                    return Json(ModelState);
                }

            }
        }

        [HttpPost]
        [Authorize(Roles = "admin")]
        public ActionResult Delete([DataSourceRequest]DataSourceRequest request, PublicUserProfile profile)
        {
            using (telerikedInDb)
            {
                try
                {
                    var found = telerikedInDb.PublicUserProfiles.FirstOrDefault(p => p.UserId == profile.UserId);
                    
                    telerikedInDb.PublicUserProfiles.Remove(found);

                    telerikedInDb.SaveChanges();

                    return Json(new {Message = "Removed!"});
                }
                catch(Exception ex)
                {
                    ModelState.AddModelError("ShowOther", ex);
                    return Json(ModelState);
                }
            }
        }
    }
}
