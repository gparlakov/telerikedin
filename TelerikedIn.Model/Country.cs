﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikedIn.Model
{
    public class Country
    {
        [Key]
        public int Id { get; set; }

        public string CountryName { get; set; }
    }
}
