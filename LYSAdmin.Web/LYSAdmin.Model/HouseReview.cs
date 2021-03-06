﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    
    public class HouseReview
    {
        public int HouseReviewID { get; set; }
        public int UserID { get; set; }
        public int HouseID { get; set; }
        public string Comments { get; set; }
        public Nullable<decimal> Rating { get; set; }
        public Nullable<System.DateTime> CommentTime { get; set; }

        public virtual House House { get; set; }
        public virtual User User { get; set; }
    }
}
