﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace LYSAdmin.Model
{
    public class Block
    {
        public int BlockID { get; set; }

        [Required]
        public string BlockName { get; set; }
        public string Description { get; set; }
        public Nullable<bool> Status { get; set; }
        public Nullable<int> ApartmentID { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }

        public virtual Apartment Apartment { get; set; }
        public virtual ICollection<House> Houses { get; set; }

        public IList<Apartment> Aparments { get; set; }
    }
}