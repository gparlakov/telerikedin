using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    public class Message
    {   
        [Key]
        public int MessageId { get; set; }
                
        public string Title { get; set; }
        public string Content { get; set; }
        public bool Read { get; set; }
        public bool Archived { get; set; }

        public virtual List<UserProfile> Recipients { get; set; }
        public virtual UserProfile Author { get; set; }
    }
}
