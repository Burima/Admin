using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class HouseDescription
    {
        public int DescrID { get; set; }
        public int HouseID { get; set; }
        public string Address { get; set; }
        public string Gender { get; set; }
        public string Landmark { get; set; }
        public string Description { get; set; }
        public int NoOfRooms { get; set; }
        public int NoOfBathrooms { get; set; }
        public Nullable<int> NoOfBalconnies { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }

        public virtual House House { get; set; }
    }
}
