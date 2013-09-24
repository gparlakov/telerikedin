using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    public class BrowseProfileViewModel
    {
        public bool IsOwnProfile { get; set; }

        public int ProfileIdOfBrowsingUser { get; set; }

        public PublicUserProfile UserProfileToBrowse { get; set; }
        
        public List<Skill> Skills { get; set; }

        public List<Endorsment> Endorsments { get; set; }
        
        public List<Notification> Notifications { get; set; }

        public List<Connection> Connections { get; set; }
    }
}
