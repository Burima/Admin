﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class User
    {
        public int UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int RoleID { get; set; }
        public string MobileNumber { get; set; }
        public bool IsBackGroundVerified { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }
        public bool Status { get; set; }
        public int ManagerID { get; set; }
        public string ProfilePicture { get; set; }
        public Nullable<int> Gender { get; set; }

        public virtual ICollection<Apartment> Apartments { get; set; }
        public virtual ICollection<Bed> Beds { get; set; }
        public virtual ICollection<HouseReview> HouseReviews { get; set; }
        public virtual ICollection<PGDetail> PGDetails { get; set; }
        public virtual Role Role { get; set; }
        public virtual ICollection<UserDetail> UserDetails { get; set; }
    }
}
