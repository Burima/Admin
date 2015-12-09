using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class DashboardViewModel
    {
        public DonughtChart DonughtChart { get; set; }
        public IList<HouseComment> HouseComments { get; set; }

        public IList<HouseRating> HouseRatings { get; set; }
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

    public class HouseComment
    {
        public String Message { get; set; }

        public String UserName { get; set; }

        public string FeedbackTime { get; set; }

        public String HouseName { get; set; }

        public decimal Rating { get; set; }

    }

    public class HouseRating
    {
        public int HouseID { get; set; }

        public string DisplayName { get; set; }

        public decimal AverageRating { get; set; }
    }
}
