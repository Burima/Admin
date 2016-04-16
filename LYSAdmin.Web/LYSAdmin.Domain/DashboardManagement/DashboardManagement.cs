using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LYSAdmin.Data.DBRepository;
using LYSAdmin.Model;
using LYSAdmin.Model.Constants;

namespace LYSAdmin.Domain.DashboardManagement
{
    public class DashboardManagement : IDashboardManagement
    {
        private IUnitOfWork unitOfWork = null;

        private IBaseRepository<Data.DBEntity.Bed> BedRepository = null;
        private IBaseRepository<Data.DBEntity.Room> RoomRepository = null;
        private IBaseRepository<Data.DBEntity.House> HouseRepository = null;
        private IBaseRepository<Data.DBEntity.PGReview> PGReviewRepository = null;
        private IBaseRepository<Data.DBEntity.User> UserRepository = null;
        private IBaseRepository<Data.DBEntity.PGDetail> PGDetailRepository = null;

        public DashboardManagement()
        {
            unitOfWork = new UnitOfWork();
            BedRepository = new BaseRepository<Data.DBEntity.Bed>(unitOfWork);
            RoomRepository = new BaseRepository<Data.DBEntity.Room>(unitOfWork);
            HouseRepository = new BaseRepository<Data.DBEntity.House>(unitOfWork);
            PGReviewRepository = new BaseRepository<Data.DBEntity.PGReview>(unitOfWork);
            UserRepository = new BaseRepository<Data.DBEntity.User>(unitOfWork);

            PGDetailRepository = new BaseRepository<Data.DBEntity.PGDetail>(unitOfWork);
        }

        public DonughtChart GetDonught(long OwnerID)
        {
            DonughtChart donughtChart = new DonughtChart();

            IList<int> houses = new List<int>();
            IList<int> rooms = new List<int>();
            DateTime matchedDate = DateTime.Today.AddDays(-15);
            /****commented due to identity or DB update****/
            rooms = (from pg in PGDetailRepository.Get(pg => pg.UserID == OwnerID)
                     join h in HouseRepository.Get() on pg.PGDetailID equals h.PGDetailID
                     join r in RoomRepository.Get() on h.HouseID equals r.HouseID
                     select r.RoomID).ToList();

            donughtChart.Empty = (from b in BedRepository.Get(b => rooms.Contains(b.RoomID) && b.BedStatus == (int)Constants.Bed_Status.Vacant)
                                  select new Bed { }
                                     ).Count();

            donughtChart.Occupied = (from b in BedRepository.Get(b => rooms.Contains(b.RoomID) && b.BedStatus == (int)Constants.Bed_Status.Booked)
                                     select new Bed { }
                                     ).Count();

            donughtChart.NewEntered = (from b in BedRepository.Get(b => rooms.Contains(b.RoomID) && b.BedStatus == (int)Constants.Bed_Status.Staying
                                           && DateTime.Compare(b.StatusUpdateDate.Value, matchedDate) > 0)
                                       select new Bed { }
                                     ).Count();

            donughtChart.Existing = (from b in BedRepository.Get(b => rooms.Contains(b.RoomID) && b.BedStatus == (int)Constants.Bed_Status.Staying
                                           && DateTime.Compare(b.StatusUpdateDate.Value, matchedDate) <= 0)
                                     select new Bed { }
                                     ).Count();

            donughtChart.Leaving = (from b in BedRepository.Get(b => rooms.Contains(b.RoomID) && b.BedStatus == (int)Constants.Bed_Status.NoticeGiven
                                           && DateTime.Compare(b.StatusUpdateDate.Value, matchedDate) > 0)
                                    select new Bed { }
                                     ).Count();

            donughtChart.Staying = (from b in BedRepository.Get(b => rooms.Contains(b.RoomID) && (b.BedStatus == (int)Constants.Bed_Status.NoticeGiven
                                       || b.BedStatus == (int)Constants.Bed_Status.Staying)
                                       && DateTime.Compare(b.StatusUpdateDate.Value, matchedDate) <= 0)
                                    select new Bed { }
                                     ).Count();


            return donughtChart;
        }

        public DashboardViewModel GetCommentsAndRating(long OwnerID)
        {
            DashboardViewModel DashboardViewModel = new DashboardViewModel();
            IList<PGReviews> PGReviewList = new List<PGReviews>();
            PGReviewList = (from p in PGDetailRepository.Get(p => p.UserID == OwnerID)
                           select new Model.PGReviews
                             {
                                 PGDetailID = p.PGDetailID,
                                 PGName = p.PGName,
                                 PGCommentList = (from g in PGReviewRepository.Get(g => g.PGDetailID == p.PGDetailID).OrderBy(g=> g.CommentTime)
                                                  select new Model.PGComments
                                                  {

                                                  Message = g.Comments,
                                                  CommentTime = TimeAgo((DateTime)g.CommentTime),
                                                  PGName = p.PGName,
                                                  User = (from u in UserRepository.Where(u=> u.UserID == g.UserID)
                                                                select new Model.User{
                                                                     FirstName = u.FirstName,
                                                                     LastName = u.LastName
                                                                }).FirstOrDefault()

                                                  }).ToList(),
                                 AverageRating = PGReviewRepository.Get(g => g.PGDetailID == p.PGDetailID).Average(g=> g.Rating)
                            }).ToList();
           
           
            DashboardViewModel.PGReviewList = PGReviewList;
            DashboardViewModel.DonughtChart = GetDonught(OwnerID);

            return DashboardViewModel;
        }

        public string TimeAgo(DateTime date)
        {

            TimeSpan timeSince = DateTime.Now.Subtract(date);
            if (timeSince.TotalMilliseconds < 1) return "not yet";
            if (timeSince.TotalMinutes < 1) return "just now";
            if (timeSince.TotalMinutes < 2) return "1 minute ago";
            if (timeSince.TotalMinutes < 60) return string.Format("{0} minutes ago", timeSince.Minutes);
            if (timeSince.TotalMinutes < 120) return "1 hour ago";
            if (timeSince.TotalHours < 24) return string.Format("{0} hours ago", timeSince.Hours);
            if (timeSince.TotalDays < 2) return "yesterday";
            if (timeSince.TotalDays < 7) return string.Format("{0} days ago", timeSince.Days);
            if (timeSince.TotalDays < 14) return "last week";
            if (timeSince.TotalDays < 21) return "2 weeks ago";
            if (timeSince.TotalDays < 28) return "3 weeks ago";
            if (timeSince.TotalDays < 60) return "last month";
            if (timeSince.TotalDays < 365) return string.Format("{0} months ago", Math.Round(timeSince.TotalDays / 30));
            if (timeSince.TotalDays < 730) return "last year"; //last but not least...
            return string.Format("{0} years ago", Math.Round(timeSince.TotalDays / 365));
        }

    }
}
