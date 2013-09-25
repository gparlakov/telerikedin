using System;
using System.Configuration;
using System.Data.Entity;
using System.Linq;

namespace TelerikedIn.Model
{
    public class TelerikedInDb : DbContext
    {
        private const string DbConnectionSettingKey = "SQLSERVER_CONNECTION_STRING";

        public TelerikedInDb() 
            :base("DefaultConnection")
        {
            this.Database.Connection.ConnectionString = ConfigurationManager.AppSettings[DbConnectionSettingKey];
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
