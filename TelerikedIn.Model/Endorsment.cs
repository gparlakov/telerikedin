using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    public class Endorsment
    {
        [Key]
        public int EndorsmentId { get; set; }

        public int EndorsedUserProfileId { get; set; }
        public int EndorsedByUserProfileId { get; set; }
        public int EndorsedSkillId { get; set; }
    }
}
