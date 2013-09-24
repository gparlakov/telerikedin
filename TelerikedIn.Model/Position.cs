using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    public class Position
    {
        [Key]
        public int Id { get; set; }

        public string PostitionName { get; set; }
    }
}
