using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    public class Notification
    {
        [Key]
        public int NotificationId { get; set; }

        public string Content { get; set; }

        public virtual UserProfile Recipient { get; set; }
                
    }
}
