using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace TelerikedIn.Model
{
    public class Connection
    {
        [Key]
        public int Id { get; set; }

        public int UserId { get; set; }

        public int ConnectionUserId { get; set; }

        public string ConnectionName { get; set; }

        public string ConnectionOccupation { get; set; }
    }
}
