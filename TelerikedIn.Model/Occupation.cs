using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    /// <summary>
    /// The type of work done
    /// </summary>
    public class Occupation
    {
        [Key]
        public int Id { get; set; }

        public string OccupationName { get; set; }
    }
}
