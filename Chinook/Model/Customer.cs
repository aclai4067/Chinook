﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Chinook.Model
{
    public class Customer
    {
        public int CustomerId { get; internal set; }
        public string FirstName { get; internal set; }
        public string LastName { get; internal set; }
        public string FullName { get; internal set; }
        public string Country { get; internal set; }
    }
}
