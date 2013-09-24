using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    public class SkillsEndorsmentsViewModel
    {
        public List<Skill> Skills { get; set; }
        public List<Endorsment> Endorsments { get; set; }
        public PublicUserProfile PublicProfileBeingBrowsed { get; set; }
        public bool IsOwnProfile { get; set; }
        public int ProfileIdOfBrowsingUser { get; set; }
    }
}
