using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TelerikedIn.Web.Filters;
using TelerikedIn.Model;
using WebMatrix.WebData;

namespace TelerikedIn.Web.Controllers
{
    public class MessagesController : Controller
    {
        TelerikedIn.Model.TelerikedInDb telerikedInDb = new Model.TelerikedInDb();

        //
        // GET: /Messages/
        [InitializeSimpleMembership]
        [Authorize]
        public ActionResult MessagesView() 
        {
            using(telerikedInDb)
            {
                try
                {

                    var userMessages = telerikedInDb.Messages
                        .Where(mes => mes.Recipients.Any(res => res.UserId == WebSecurity.CurrentUserId))
                        .Select(mes => new MessageViewModel
                        {
                            Title = mes.Title,
                            Author = mes.Author.UserName,
                            Content = mes.Content
                        }).ToList();

                    return View(userMessages);
                }
                catch (Exception ex)
                {
                    return Error("Error on reading from database");
                }
            }            
        }

        [InitializeSimpleMembership]
        [Authorize]
        public ActionResult Compose()
        {
            using (telerikedInDb)
            {
                try
                {
                    var userNames = telerikedInDb.UserProfiles.Select(us => us.UserName).ToList();
                    var messageComposeModel = new MessageComposeViewModel { Recipients = userNames };
                    return View(messageComposeModel);
                }
                catch (Exception ex)
                {
                    return Error("Error on reading from database");
                }
            }
        }

        [Authorize]
        [InitializeSimpleMembership]
        [HttpPost]
        public ActionResult Send(MessageComposeViewModel composed)
        {
            using (telerikedInDb)
            {
                try
                {
                    var recipients = composed.Recipients[0].Split(new char[] { ',', ' ' }, StringSplitOptions.RemoveEmptyEntries);

                    var author = telerikedInDb.UserProfiles.
                                FirstOrDefault(prof => prof.UserId == WebSecurity.CurrentUserId);

                    var recipientUsers = telerikedInDb.UserProfiles.Where(res => recipients.Contains(res.UserName));

                    var message = new Message
                    {
                        Author = author,
                        Title = composed.Title,
                        Read = false,
                        Archived = false,
                        Content = Server.HtmlDecode(composed.Content),
                        Recipients = recipientUsers.ToList(),
                    };

                    telerikedInDb.Messages.Add(message);
                    telerikedInDb.SaveChanges();

                    return View();
                }
                catch (Exception ex)
                {
                    return Error("Error on sending message");
                }
            }
        }    

        #region Error Methods
        private ActionResult Error(string message = null, bool partialResult = false)
        {
            if (message == null)
            {
                message = "Error trying to save/load from database...";
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
