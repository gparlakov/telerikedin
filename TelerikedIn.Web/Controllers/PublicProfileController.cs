using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TelerikedIn.Model;
using TelerikedIn.Web.Filters;
using WebMatrix.WebData;

namespace TelerikedIn.Web.Controllers
{
    public class PublicProfileController : Controller
    {
        const string OwnProfile = "OwnProfile";
        const string ProfileStr = "Profile";

        TelerikedInDb telerikedInDB = new TelerikedInDb();
        
        [Authorize]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [InitializeSimpleMembership]
        public ActionResult DoCreate(PublicUserProfile profile)
        {
            using (telerikedInDB)
            {
                try
                {
                    profile.UserId = WebSecurity.CurrentUserId;

                    telerikedInDB.PublicUserProfiles.Add(profile);
                    telerikedInDB.SaveChanges();

                    return Redirect("BrowseUserProfile/" + profile.UserId);
                }
                catch
                {
                    return ErrorOnWriteInDb("Could't write the account in DB.");
                }
            }
        }

        [Authorize]
        [HttpGet]
        [InitializeSimpleMembership]
        public ActionResult BrowseOwnProfile()
        {
            using (this.telerikedInDB)
            {
                return  RedirectToAction("/BrowseUserProfile/" + WebSecurity.CurrentUserId);               
            }
        }
                
        [Authorize]
        [HttpGet]
        [InitializeSimpleMembership]
        public ActionResult BrowseUserProfile(int userIdToBrowse)
        {
            using (this.telerikedInDB)
            {
                var currentUserId = WebSecurity.CurrentUserId;
                                
                var cachedProfile = GetCachedBrowseViewModel(userIdToBrowse, currentUserId);
                               
                if (cachedProfile != null)
                {
                    //updates  is is browsing own profile - maybe not needed but it doesen't add too much overhead so ...
                    IsOwnProfileUpdate(cachedProfile, currentUserId);

                    UpdateDatabaseChangables(cachedProfile);

                    return View(cachedProfile);
                }
                                                
                var profileToBrowse = telerikedInDB.
                    PublicUserProfiles.FirstOrDefault(x => x.UserId == userIdToBrowse);
                
                if (profileToBrowse == null)
                {
                    if (userIdToBrowse == currentUserId)
                    {
                        return Redirect("../Create");
                    }

                    return ErrorOnReadFromDb("No such user profile was found - try searching " +
                        "users inside your \"Add connections\" menu");
                }

                //only hides properties the first time we load the profile in session - 
                //ignores the changes made since login - for db reasons - and the data has been visible 
                if (userIdToBrowse != currentUserId)
                {
                    profileToBrowse = HidePrivate(profileToBrowse);
                }                

                var browseViewModel = BuildBrowseViewModel(currentUserId, profileToBrowse);

                CacheBrowseViewModel(browseViewModel);                

                return View(browseViewModel);                
            }
        } 

        [Authorize]
        [InitializeSimpleMembership]
        public ActionResult Edit()
        {
            var ownViewProfileModel = Session[OwnProfile];

            if (ownViewProfileModel == null)
            {
                return Redirect("/PublicProfile/BrowseUserProfile/" + WebSecurity.CurrentUserId);
            }

            return View(ownViewProfileModel);         
        }

        [Authorize]
        [HttpPost]
        [InitializeSimpleMembership]
        public ActionResult DoEdit(PublicUserProfile editedProfile)
        {
            using (this.telerikedInDB)
            {
                var currentUserId = WebSecurity.CurrentUserId;
                
                var currentProfile = this.telerikedInDB.PublicUserProfiles
                    .FirstOrDefault(x => x.UserId == currentUserId);
                                
                currentProfile = UpdateOrCreateProfile(editedProfile, currentProfile);

                UpdateOrSaveOwnBrowseViewModelToSession(editedProfile, currentUserId, currentProfile);

                telerikedInDB.SaveChanges();

                return Redirect("/PublicProfile/BrowseOwnProfile"); 
            }
        }

        [Authorize]
        public ActionResult AddConnections()
        {
            return View();
        }

        [Authorize]
        [InitializeSimpleMembership]
        [HttpGet]
        public ActionResult AddUserAsAConnection(int userToAddId)
        {
            var currentUserId = WebSecurity.CurrentUserId;

            var twoUsers = SelectTwoUsersToConnect(userToAddId, currentUserId);

            if (twoUsers.Count() < 2)
            {
                return ErrorOnReadFromDb("No such user profile was found - try " +
                    "searching users inside your \"Add connections\" menu");
            }

            var currentUser = twoUsers.FirstOrDefault(x=>x.UserId == currentUserId);
            var userToAdd = twoUsers.FirstOrDefault(x=>x.UserId == userToAddId);

            //adds one way connection

            var connectionTo = GenerateConnection(currentUserId, userToAddId, userToAdd);
            this.telerikedInDB.Connections.Add(connectionTo);

            //adds the other way also
            var connectionFrom = GenerateConnection(userToAddId, currentUserId, currentUser);                
            this.telerikedInDB.Connections.Add(connectionFrom);
                       
            telerikedInDB.SaveChanges();

            UpdateConnectionInSessionBrowseModel(connectionTo);

            return PartialView("_UserAddedPartial");            
        }

        [Authorize]
        [InitializeSimpleMembership]
        [HttpGet]
        public ActionResult SearchPublicProfilesPartial(string searchString)
        {
            //return Content("Works now " + searchString);

            using (this.telerikedInDB)
            {
                var searchStringsSeparated = searchString.Split(' ');
                var found = new List<PublicUserProfile>();

                var connections = ((BrowseProfileViewModel)Session[OwnProfile]).Connections;
                
                try
                {
                    //TODO - find a way for less db queries
                    foreach (var searchStr in searchStringsSeparated)
                    {
                        var foundNext = telerikedInDB.PublicUserProfiles
                            .Where(x => x.FirstName.Contains(searchStr) || x.LastName.Contains(searchStr));
                        
                        found.AddRange(foundNext);
                    }

                    foreach (var conn in connections)
                    {
                        found.RemoveAll(f => f.UserId == conn.ConnectionUserId);
                    }

                    found.RemoveAll(x => x.UserId == WebSecurity.CurrentUserId); 
                    
                    var result = PartialView("_FoundConnectionsPartial", found);
                    return result;
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    return ErrorOnReadFromDb(partialResult: true);                    
                } 
            }
        }

        [Authorize]
        public ActionResult AddSkills()
        {
            using (this.telerikedInDB)
            {
                var allSkills = telerikedInDB.Skills
                    .Select(x => x.SkillName).ToArray();
                return View(allSkills);
            }
        }

        [Authorize]
        [InitializeSimpleMembership]
        [HttpGet]
        public ActionResult DoAddSkill(string skills)
        {
            
            using (this.telerikedInDB)
            {                
                if (skills != null)
                {
                    try
                    {
                        var cachedProfile = TakeCachedProfile(WebSecurity.CurrentUserId, true);

                        if (cachedProfile == null)
                        {
                            return ErrorOnReadFromDb("Cached profile can't be found - please reload main page.");
                        }
                        		                
                        var userProfile = cachedProfile.UserProfileToBrowse;
                        telerikedInDB.PublicUserProfiles.Attach(userProfile);

                        var skillsToAdd = skills
                            .Split(new string[] { ", " }, StringSplitOptions.RemoveEmptyEntries);

                        var allSkills = telerikedInDB.Skills.Select(skill => skill.SkillName);                  
                                                
                        //add new skills to the list 
                        //AddSkills(skillsToAdd, allSkills, userProfile);
                       
                        foreach (var skill in skillsToAdd)
                        {
                            var newSkill = new Skill { SkillName = skill };

                            if (!allSkills.Contains(skill))
                            {
                                telerikedInDB.Skills.Add(newSkill);
                            }

                            if (!userProfile.Skills.Any(x => x.SkillName == skill))
                            {
                                userProfile.Skills.Add(newSkill);
                            }
                        }

                        ////updates list in cached profile
                        cachedProfile.Skills = userProfile.Skills.ToList();
                        cachedProfile.UserProfileToBrowse = userProfile;
                        CacheBrowseViewModel(cachedProfile);                        
                        
                        //updates skills in DB
                        telerikedInDB.SaveChanges();
                    }
                    catch
                    {
                        return ErrorOnWriteInDb("An error in database transaction occured - Please reaload page... ");
                    }
                }
                else { /* empty skill passed - so no skill added...*/ }

                return Redirect("/PublicProfile/Edit");
            }
        }

        [Authorize]
        [InitializeSimpleMembership]
        public ActionResult Endorse(int skillId, int profileIdOfEndorsee)
        {
            var endorsedBy = WebSecurity.CurrentUserId;

            var endorsedUser = this.telerikedInDB.PublicUserProfiles
                .FirstOrDefault(x => x.ProfileId == profileIdOfEndorsee);

            if (endorsedUser == null)
            {
                return ErrorOnReadFromDb(
                    "An Error occured trying to read from database: Couldn't find user to endorse...");
            }

            var endorsment = new Endorsment
            {
                EndorsedByUserProfileId = endorsedBy,
                EndorsedUserProfileId = endorsedUser.ProfileId,
                EndorsedSkillId = skillId
            };

            try
            {
                telerikedInDB.Endorsments.Add(endorsment);
                telerikedInDB.SaveChanges();
            }
            catch
            {
                this.ErrorOnWriteInDb();
            }

            return PartialView();
            //return Redirect("/PublicProfile/BrowseUserProfile/" + 
            //    endorsedUser.ProfileId);
        }

        protected override void Dispose(bool disposing)
        {
            telerikedInDB.Dispose();
            base.Dispose(disposing);
        }

        #region Private Methods

        #region Methods Update/Create for : Profile in Database; BrowseViewModel in Session

        private void UpdateOrSaveOwnBrowseViewModelToSession(PublicUserProfile editedProfile, int currentUserId, PublicUserProfile currentProfile)
        {
            var savedProfile = (BrowseProfileViewModel)Session[OwnProfile];

            if (savedProfile != null)
            {
                UpdateProfileWithEdited(savedProfile.UserProfileToBrowse, editedProfile);

                savedProfile.IsOwnProfile = true; // just in case....

                CacheBrowseViewModel(savedProfile);
            }
            else
            {
                savedProfile = BuildBrowseViewModel(currentUserId, currentProfile);
                CacheBrowseViewModel(savedProfile);
            }
        }

        private PublicUserProfile UpdateOrCreateProfile(PublicUserProfile editedProfile, PublicUserProfile currentProfile)
        {
            //means we are creating a new profile
            if (currentProfile == null)
            {
                telerikedInDB.PublicUserProfiles.Add(editedProfile);
                telerikedInDB.SaveChanges();
                currentProfile = editedProfile;
            }
            else
            {              
                UpdateProfileWithEdited(currentProfile, editedProfile);
            }

            return currentProfile;
        }

        private void UpdateProfileWithEdited(PublicUserProfile profileToUpdate, PublicUserProfile editedProfile)
        {
            profileToUpdate.FirstName = editedProfile.FirstName;
            profileToUpdate.FirstNameHidden = editedProfile.FirstNameHidden;

            profileToUpdate.MiddleName = editedProfile.MiddleName;
            profileToUpdate.MiddleNameHidden = editedProfile.MiddleNameHidden;

            profileToUpdate.LastName = editedProfile.LastName;
            profileToUpdate.LastNameHidden = editedProfile.LastNameHidden;

            profileToUpdate.Industry = editedProfile.Industry;
            profileToUpdate.IndustryHidden = editedProfile.IndustryHidden;

            profileToUpdate.Country = editedProfile.Country;
            profileToUpdate.CountryHidden = editedProfile.CountryHidden;

            profileToUpdate.Occupation = editedProfile.Occupation;
            profileToUpdate.OccupationHidden = editedProfile.OccupationHidden;
        }
        
        private PublicUserProfile HidePrivate(PublicUserProfile profile)
        {
            if (profile.FirstNameHidden)
            {
                profile.FirstName = null;
            }

            if (profile.MiddleNameHidden)
            {
                profile.MiddleName = null;
            }

            if (profile.LastNameHidden)
            {
                profile.LastName = null;
            }

            if (profile.OccupationHidden)
            {
                profile.Occupation = null;
            }

            if (profile.IndustryHidden)
            {
                profile.Industry = null;
            }

            if (profile.CountryHidden)
            {
                profile.Country = null;
            }

            return profile;
        }
        #endregion       

        #region BrowseViewModel methods - SaveToSession and BuildNewBrowseViewModel

        private BrowseProfileViewModel GetCachedBrowseViewModel(int userIdToBrowse, int currentUserId)
        {
            var cachedProfile = (BrowseProfileViewModel)Session[ProfileStr + userIdToBrowse];

            if (currentUserId == userIdToBrowse)
            {
                cachedProfile = (BrowseProfileViewModel)Session[OwnProfile];
            }
            return cachedProfile;
        }

        private void CacheBrowseViewModel(BrowseProfileViewModel browseViewModel)
        {
            if (browseViewModel.IsOwnProfile)
            {
                Session[OwnProfile] = browseViewModel;
            }
            else
            {
                var profileName = ProfileStr + browseViewModel.UserProfileToBrowse.UserId;

                Session[profileName] = browseViewModel;
            }
        }

        /// <summary>
        /// Builds a new BrowseViewModel with all data needed to show info about 
        /// user, his/her skills, connections, endorsments notifications and so on..
        /// </summary>
        /// <param name="browsingUserId"></param>
        /// <param name="profileToBrowse">The profile that will be shown on browser</param>
        /// <returns> The model which will be used to visualize data.</returns>
        private BrowseProfileViewModel BuildBrowseViewModel(int browsingUserId, PublicUserProfile profileToBrowse)
        {
            if (profileToBrowse.Skills == null)
            {
                profileToBrowse.Skills = new List<Skill>();
            }

            var userIdToBrowse = profileToBrowse.UserId;           

            var connections = GetConnectionsAsList(userIdToBrowse);

            var browseViewModel = new BrowseProfileViewModel
            {
                UserProfileToBrowse = profileToBrowse,
                ProfileIdOfBrowsingUser = browsingUserId,
                Connections = connections,
                IsOwnProfile = (userIdToBrowse == browsingUserId),
                Skills = profileToBrowse.Skills.ToList(),
            };

            UpdateDatabaseChangables(browseViewModel);

            return browseViewModel;
        }
  
        private List<Connection> GetConnectionsAsList(int userId)
        {
            var connections = new List<Connection>(); 
            var connectionsFound = this.telerikedInDB.Connections.Where(con => con.UserId == userId);
              
            if (connectionsFound.Count() > 0)
            {
                connections = connectionsFound.ToList();
            }

            return connections;
        }

        /// <summary>
        /// By given UserProfile (from session) checks for new notifications, endosments, messages etc..
        /// </summary>
        /// <param name="profileToBrowse"></param>
        /// <returns></returns>
        private void UpdateDatabaseChangables(BrowseProfileViewModel browseViewModel)
        {
            var userIdToBrowse = browseViewModel.UserProfileToBrowse.UserId;

            //not hide skills and enorsments - on purpose It is about sills and enrosments fter all
            var endorsments = telerikedInDB.Endorsments.Where(x => x.EndorsedUserProfileId == userIdToBrowse).ToList();
            
            //var messages  = telerikedInDB.Messages.Where(x=>x.Recipients.Contains() //todo messages update

            browseViewModel.Endorsments = endorsments;

            if (userIdToBrowse == WebSecurity.CurrentUserId)
            {
                browseViewModel.Notifications = telerikedInDB.Notifications.Where(x => x.Recipient.UserId == userIdToBrowse).ToList();
            }

            if (userIdToBrowse == WebSecurity.CurrentUserId || !browseViewModel.UserProfileToBrowse.HideConnections)
            {
                browseViewModel.Connections = telerikedInDB.Connections.Where(x => x.UserId == userIdToBrowse).ToList();
            }            
        }
        
        private void IsOwnProfileUpdate(BrowseProfileViewModel cachedProfile, int currentUserId)
        {
            if (cachedProfile.UserProfileToBrowse.UserId == currentUserId)
            {
                cachedProfile.IsOwnProfile = true;
            }
            else
            {
                cachedProfile.IsOwnProfile = false;
            }
        }
        #endregion
        
        #region AddConnection Helper methods
            
        /// <summary>
        /// Generates connection from to users
        /// </summary>
        /// <param name="userToAddToId">Id of user to add connection to </param>
        /// <param name="userToAddId">Id of user to connect first user to</param>
        /// <param name="userToAdd">Ther profile of user to connecti first user to</param>
        /// <returns>the connection as an EntityFramework entity/object </returns>
        private Connection GenerateConnection(int userToAddToId, int userToAddId, PublicUserProfile userToAdd)
        {
            var connectionTo = new Connection
            {
                UserId = userToAddToId,
                ConnectionUserId = userToAddId,
                ConnectionName = userToAdd.LastName + ", " + userToAdd.FirstName,
                ConnectionOccupation = userToAdd.Occupation
            };
            return connectionTo;
        }

        /// <summary>
        /// Updates the newlymade connections in local (session) 
        /// browseViewModel for DB connection optimization
        /// </summary>
        /// <param name="connectionFrom">first connection</param>
        /// <param name="connectionTo">second connection </param>
        private void UpdateConnectionInSessionBrowseModel(Connection connectionTo)
        {
            var savedProfile = (BrowseProfileViewModel)Session[OwnProfile];
            savedProfile.Connections.Add(connectionTo);
            Session[OwnProfile] = savedProfile;
        }

        #endregion

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

        private List<PublicUserProfile> SelectTwoUsersToConnect(int userToConnectToId, int currenUserId)
        {
            var twoUsers = this.telerikedInDB.PublicUserProfiles
                                .Where(user => user.UserId == userToConnectToId || user.UserId == currenUserId)
                                .Select(usr => usr).ToList();  

            return twoUsers;
        }

        #region AddSkillsHelpers
        private void AddSkills(string[] skillsToAdd,
            IQueryable<string> allSkills, PublicUserProfile userProfile)
        {
            var userSkills = userProfile.Skills;
            foreach (var skill in skillsToAdd)
            {
                var newSkill = new Skill { SkillName = skill };

                if (!allSkills.Contains(skill))
                {
                    telerikedInDB.Skills.Add(newSkill);
                }

                if (!userSkills.Any(x => x.SkillName == skill))
                {
                    userSkills.Add(newSkill);
                }
            }
        }

        private BrowseProfileViewModel TakeCachedProfile(int userId, bool own = false)
        {
            if (own)
            {
                return (BrowseProfileViewModel)Session[OwnProfile];
            }

            return (BrowseProfileViewModel)Session[ProfileStr + userId];
        }
        #endregion
               
        #endregion
    }
}
