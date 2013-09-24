using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace TelerikedIn.Model
{
    public class PublicUserProfile
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ProfileId { get; set; }
        
        [Required]
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UserId { get; set; }        

        [Required]
        public string FirstName { get; set; }
        public bool FirstNameHidden { get; set; }

        public string MiddleName { get; set; }
        public bool MiddleNameHidden { get; set; }

        [Required]
        public string LastName { get; set; }
        public bool LastNameHidden { get; set; }

        [Required]
        public string Occupation { get; set; }
        public bool OccupationHidden { get; set; }

        public string Country { get; set; }
        public bool CountryHidden { get; set; }

        public string Industry { get; set; }
        public bool IndustryHidden { get; set; }

        public virtual IList<Experience> Experience { get; set; }
        public bool ExperienceHidden { get; set; }
        
        public virtual IList<Skill> Skills { get; set; }        

        public virtual IList<Endorsment> Endorsments { get; set; }

        public bool HideConnections { get; set; }
    }
}