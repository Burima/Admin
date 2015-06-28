using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class DashboardViewModel
    {

    }

    public class DonughtChart
    {
        public int Occupied { get; set; }

        public int Empty { get; set; }

        public int NewEntered { get; set; }

        public int Existing { get; set; }

        public int Leaving { get; set; }

        public int Staying { get; set; }
    }

    public class HouseComments
    {
        public String Comments { get; set; }

        public String UserName { get; set; }

        public DateTime FeedbackTime { get; set; }

        public String HouseName { get; set; }

        public float Rating { get; set; }
    }
}
