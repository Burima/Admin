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
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> LastUpdatedOn { get; set; }
        public int No_of_Rooms { get; set; }
        public int No_of_Bathrooms { get; set; }
        public Nullable<int> No_of_Balconnies { get; set; }

        public virtual House House { get; set; }
    }
}
