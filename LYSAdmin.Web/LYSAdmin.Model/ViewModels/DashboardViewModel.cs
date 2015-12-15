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
        public IList<PGReviews> PGReviewList { get; set; }

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

    public class PGReviews
    {
        public int PGDetailID { get; set; }
        public String PGName { get; set; }
        public IList<PGComments> PGCommentList { get; set; }
        public Nullable<decimal> AverageRating { get; set; }
    }

    public class PGComments
    {
        public String Message { get; set; }

        public String PGName { get; set; }

        public String UserName { get; set; }
        public Nullable<DateTime> CommentTime { get; set; }
    }

 }
