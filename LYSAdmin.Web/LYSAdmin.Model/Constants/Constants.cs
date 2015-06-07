using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model.Constants
{
    public class Constants
    {
        public enum Roles
        {
            LYSAdmin = 1,
            LYSStaff = 2,
            OwnerAdmin = 3,
            OwnerStaff = 4,
            EndUser=5
        }

        public enum Bed_Status
        {
            Booked = 1,
            Staying = 2,
            NoticeGiven = 3,
            Exited = 4
        }

        public enum LinkTypeID
        {
            Apartment = 1,
            Block = 2,
            None = 3
        }
    }
}
