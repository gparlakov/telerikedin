using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TelerikedIn.Model;
using TelerikedIn.Web.Areas.Admin.Models;
using WebMatrix.WebData;
using TelerikedIn.Web.Filters;

namespace TelerikedIn.Web.Areas.Admin.Controllers
{
    public class UserProfilesController : Controller
    {
        TelerikedIn.Model.TelerikedInDb telerikedInDb = new Model.TelerikedInDb();
        
        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult ShowInitial()
        {
            try
            {
                var allUsers = telerikedInDb.UserProfiles;

                return View(allUsers);
            }
            catch
            {
                return ErrorOnReadFromDb();
            }                        
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult Show([DataSourceRequest]DataSourceRequest request)
        {
            using (telerikedInDb)
            {
                try
                {
                    var result = telerikedInDb.UserProfiles;
                    DataSourceResult returnValues = result.ToDataSourceResult(request, res => new UserProfile
                    {
                        UserId = res.UserId,
                        UserName = res.UserName
                    });
                    return Json(returnValues);
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("DeleteUser", ex.Message);
                    return Json(ModelState.ToDataSourceResult());
                }
            }
        }

        [Authorize(Roles = "admin")]
        public ActionResult EditUser(UserProfile profile)
        {
            try
            {
                using (telerikedInDb)
                {
                    var profileBuffer = telerikedInDb.UserProfiles
                        .FirstOrDefault(u => u.UserId == profile.UserId);
                    profileBuffer.UserName = profile.UserName;

                    telerikedInDb.SaveChanges();
                    return Content("User edited successful","text/html");                    
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("DeleteUser", ex.Message);
                return Json(ModelState.ToDataSourceResult());
            }
        }

        [Authorize(Roles = "admin")]
        [InitializeSimpleMembership]
        public ActionResult CreateUser(UserProfile profile)
        {
            using (telerikedInDb)
            {
                try
                {
                    WebSecurity.CreateUserAndAccount(profile.UserName, profile.UserName);

                    telerikedInDb.SaveChanges();

                    return Content("User created successful","text/html");    
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("DeleteUser", ex.Message);
                    return Json(ModelState.ToDataSourceResult());
                }
            }
        }

        [Authorize(Roles = "admin")]
        public ActionResult DeleteUser(UserProfile profile)
        {
            using (telerikedInDb)
            {
                try
                {
                    var user = telerikedInDb.UserProfiles.FirstOrDefault(us => us.UserId == profile.UserId);
                    if (user != null)
                    {                        
                        telerikedInDb.UserProfiles.Remove(user);
                    }
                    telerikedInDb.SaveChanges();

                    return Json(new { message = "OK"});
                }
                catch(Exception ex)
                {    
                    ModelState.AddModelError("DeleteUser", ex.Message);
                    return Json(ModelState.ToDataSourceResult());
                }
            }
        }

        [Authorize(Roles = "admin")]
        public ActionResult ChangeUserPassword()
        {
            using (telerikedInDb)
            {
                try
                {
                    var userNames = telerikedInDb.UserProfiles.Select(x => x.UserName).ToList();
                    return View(userNames);
                }
                catch (Exception)
                {
                    return ErrorOnReadFromDb();
                }                
            }            
        }
        
        [Authorize(Roles = "admin")]
        [InitializeSimpleMembership]
        [HttpPost]
        public ActionResult GeneratePasswordResetToken(string userName)
        {
            var user = telerikedInDb.UserProfiles.FirstOrDefault(u => u.UserName == userName);

            if (user == null)
            {
                return ErrorOnReadFromDb("No such user found");
            }

            var token = WebSecurity.GeneratePasswordResetToken(userName);            
            return Content(string.Format("<h2>The user may reset his password at " +
                "<server>/Admin/UserProfiles/ResetPassword using the token: <strong>{0}</strong> </h2> ", token));
        }

        [HttpGet]
        public ActionResult ResetPassword()
        {
            return View();
        }
        
        [InitializeSimpleMembership]
        [HttpPost]
        public ActionResult DoResetPassord(string resetToken, string newPassword)
        {
            if (WebSecurity.ResetPassword(resetToken, newPassword))
            {
                return Redirect("../../PublicProfile/BrowseOwnProfile");
            }
            else
            {
                return ErrorOnReadFromDb("The reset token or the new password were invalid!");
            }            
        }

        #region Error Methods

        private ActionResult ErrorOnWriteInDb(string message = null, bool partialResult = false)
        {
            if (message == null)
            {
                message = "Error trying to save changes in database...";
            }
            ViewBag.Message = message;

            if (partialResult)
            {
                return PartialView("Error");
            }
            return View("Error");
        }

        private ActionResult ErrorOnReadFromDb(string message = null, bool partialResult = false)
        {
            if (message == null)
            {
                message = "Error trying to read from database..";
            }
            ViewBag.Message = message;

            if (partialResult)
            {
                return PartialView("Error");
            }
            return View("Error");
        }

        #endregion
        
    }
}
