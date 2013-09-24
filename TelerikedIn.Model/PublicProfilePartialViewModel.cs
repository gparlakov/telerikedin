using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    public class PublicProfilePartialViewModel
    {
        public string Name { get; set; }

        public string Occupation { get; set; }

        public int UserIdToBrowse { get; set; }

        public bool IsOwnProfile { get; set; }
    }
}
