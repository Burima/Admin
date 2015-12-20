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
    
    public partial class Apartment
    {
        public Apartment()
        {
            this.Blocks = new HashSet<Block>();
        }
    
        public int ApartmentID { get; set; }
        public string ApartmentName { get; set; }
        public string HouseNo { get; set; }
        public string Description { get; set; }
        public Nullable<bool> Status { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<int> DeletedBy { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public int PGDetailID { get; set; }
        public bool IsDefault { get; set; }
    
        public virtual PGDetail PGDetail { get; set; }
        public virtual ICollection<Block> Blocks { get; set; }
    }
}
