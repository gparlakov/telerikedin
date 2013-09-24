using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    public class Experience
    {
        [Key]
        public int ExperienceId { get; set; }

        public DateTime From { get; set; }
        public DateTime To { get; set; }
        public bool Current { get; set; }
        public virtual Company WorkedInCompany { get; set; }
        public virtual Position WorkedOnPosition { get; set; }
    }
}
