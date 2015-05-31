﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class Room
    {

        public int RoomID { get; set; }
        public int HouseID { get; set; }
        public string RoomNumber { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime LastUpdatedOn { get; set; }
        public bool Status { get; set; }
        public string Monthly_Rent { get; set; }
        public int No_of_Beds { get; set; }
        public string Deposit { get; set; }

        public virtual ICollection<Bed> Beds { get; set; }
        public virtual House House { get; set; }
    }
}
