//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LYSAdmin.Data.DBEntity
{
    using System;
    using System.Collections.Generic;
    
    public partial class HouseDescription
    {
        public int DescrID { get; set; }
        public int HouseID { get; set; }
        public string Address { get; set; }
        public string Monthly_Rent { get; set; }
        public string SharingType { get; set; }
        public string Gender { get; set; }
        public string Deposit { get; set; }
        public Nullable<int> Bedroom_No { get; set; }
        public string Landmark { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }
    
        public virtual House House { get; set; }
    }
}