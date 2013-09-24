using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace TelerikedIn.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //routes.MapRoute(
            //    name: "Messages",
            //    url: "Messages/{action}/{id}",
            //    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            //);

            //
            ////PublicProfile/SearchPublicProfile/{searchString}
            routes.MapRoute(
                name: "SearchPublicProfilesPartial",
                url: "PublicProfile/SearchPublicProfilesPartial/{searchString}",
                defaults: new
                {
                    controller = "PublicProfile",
                    action = "SearchPublicProfilesPartial"
                }
            );


            //
            //PublciProfile/AddUserAsAConnection/{userToAddId}
            routes.MapRoute(
                name: "AddUser",
                url: "PublicProfile/AddUserAsAConnection/{userToAddId}",
                defaults: new
                {
                    controller = "PublicProfile",
                    action = "AddUserAsAConnection"
                }
            );


            //
            //PublicProfile/BrowseUserProfile/{userIdToBrowse}
            routes.MapRoute(
                name: "BrowseUserProfile",
                url: "PublicProfile/BrowseUserProfile/{userIdToBrowse}",
                defaults: new 
                {
                    controller = "PublicProfile",
                    action = "BrowseUserProfile" 
                }
            );

            //
            //PublicProfile/Endorse/{skillId}/To/{profileIdOfEndorsee}
            routes.MapRoute(
                name: "Endorse",
                url: "PublicProfile/Endorse/{skillId}/To/{profileIdOfEndorsee}",
                defaults: new { controller = "PublicProfile", action = "Endorse" }
            );


            //            
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}