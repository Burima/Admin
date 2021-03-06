﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class Bed
    {
        public int BedID { get; set; }
        public int RoomID { get; set; }
        public int UserID { get; set; }
        public bool Status { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }
        public Nullable<int> BedStatus { get; set; }
        public Nullable<System.DateTime> StatusUpdateDate { get; set; }

        public virtual Room Room { get; set; }
        public virtual User User { get; set; }
    }
}
