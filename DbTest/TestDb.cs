using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DbTest
{
    class TestDb
    {
        static void Main(string[] args)
        {
            TelerikedIn.Model.TelerikedInDb db = new TelerikedIn.Model.TelerikedInDb();
            var connections = db.Connections.Distinct().ToList();
            foreach (var con in connections)
            {
                Console.WriteLine(con.ConnectionName);
            }
        }
    }
}
