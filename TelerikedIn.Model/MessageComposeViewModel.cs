using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    public class MessageComposeViewModel: MessageViewModel
    {
        public List<string> Recipients { get; set; }
    }
}
