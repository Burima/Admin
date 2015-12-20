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
    
    public partial class House
    {
        public House()
        {
            this.HouseAmenities = new HashSet<HouseAmenity>();
            this.HouseImages = new HashSet<HouseImage>();
            this.Rooms = new HashSet<Room>();
        }
    
        public int HouseID { get; set; }
        public string HouseName { get; set; }
        public Nullable<bool> Status { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }
        public Nullable<bool> isDeleted { get; set; }
        public Nullable<int> DeletedBy { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public string DisplayName { get; set; }
        public Nullable<int> Gender { get; set; }
        public Nullable<int> NoOfBathrooms { get; set; }
        public Nullable<int> NoOfBalconnies { get; set; }
        public int BlockID { get; set; }
        public string HouseNo { get; set; }
    
        public virtual Block Block { get; set; }
        public virtual ICollection<HouseAmenity> HouseAmenities { get; set; }
        public virtual ICollection<HouseImage> HouseImages { get; set; }
        public virtual ICollection<Room> Rooms { get; set; }
    }
}
