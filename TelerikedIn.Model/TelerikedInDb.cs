using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    public class TelerikedInDb : DbContext
    {
        public TelerikedInDb() 
            :base("DefaultConnection")
        {
        }

        public DbSet<UserProfile> UserProfiles { get; set; }

        public DbSet<PublicUserProfile> PublicUserProfiles { get; set; }

        public DbSet<Occupation> Occupations { get; set; }        

        public DbSet<Connection> Connections { get; set; }

        public DbSet<Endorsment> Endorsments { get; set; }

        public DbSet<Skill> Skills { get; set; }

        public DbSet<Message> Messages { get; set; }

        public DbSet<Notification> Notifications { get; set; }        
    }
}
