using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class House
    {
        public int HouseID { get; set; }
        public string HouseName { get; set; }
        public string DisplayName { get; set; }
        public string Description { get; set; }
        public Nullable<bool> Status { get; set; }
        public Nullable<int> OwnerID { get; set; }
        public Nullable<int> BlockID { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }
        public Nullable<int> LinkID { get; set; }
        public Nullable<int> LinkTypeID { get; set; }
        public Nullable<bool> isDeleted { get; set; }
        public Nullable<int> DeletedBy { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    

        public virtual ICollection<BasicAmenity> BasicAmenities { get; set; }
        public virtual ICollection<HouseDescription> HouseDescriptions { get; set; }
        public virtual ICollection<HouseImage> HouseImages { get; set; }
        public virtual ICollection<Room> Rooms { get; set; }
    }
}
