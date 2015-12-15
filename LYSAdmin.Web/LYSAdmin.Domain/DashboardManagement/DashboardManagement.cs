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

        public DonughtChart GetDonught(int OwnerID)
        {
            DonughtChart donughtChart = new DonughtChart();

            IList<int> houses = new List<int>();
            IList<int> rooms = new List<int>();
            DateTime matchedDate = DateTime.Today.AddDays(-15);
            /****commented due to identity or DB update****/
            //houses = (from p in houseRepository
            //          //where p.OwnerID == OwnerID
            //         select p.HouseID).ToList();

            //rooms = (from r in roomRepository
            //         where houses.Contains(r.HouseID)
            //         select r.RoomID).ToList();

            //donughtChart.Empty = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.BedStatus == (int)Constants.Bed_Status.Vacant)
            //                      select new Bed { }
            //                         ).Count();

            //donughtChart.Occupied = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.BedStatus == (int)Constants.Bed_Status.Booked)
            //                         select new Bed { }
            //                         ).Count();

            //donughtChart.NewEntered = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.BedStatus == (int)Constants.Bed_Status.Staying
            //                               && DateTime.Compare(b.StatusUpdateDate.Value, matchedDate) > 0)
            //                         select new Bed { }
            //                         ).Count();

            //donughtChart.Existing = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.BedStatus == (int)Constants.Bed_Status.Staying
            //                               && DateTime.Compare(b.StatusUpdateDate.Value, matchedDate) <= 0)
            //                           select new Bed { }
            //                         ).Count();

            //donughtChart.Leaving = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.BedStatus == (int)Constants.Bed_Status.NoticeGiven
            //                               && DateTime.Compare(b.StatusUpdateDate.Value, matchedDate) > 0)
            //                         select new Bed { }
            //                         ).Count();

            //donughtChart.Staying = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && (b.BedStatus == (int)Constants.Bed_Status.NoticeGiven
            //                           || b.BedStatus == (int)Constants.Bed_Status.Staying)
            //                           && DateTime.Compare(b.StatusUpdateDate.Value, matchedDate) <= 0)
            //                        select new Bed { }
            //                         ).Count();


            return donughtChart;
        }

        public DashboardViewModel GetCommentsAndRating(int OwnerID)
        {
            DashboardViewModel DashboardViewModel = new DashboardViewModel();
            IList<Model.PGReviews> PGReviewList = new List<Model.PGReviews>();
            IList<Model.PGReview> pgReviews = new List<Model.PGReview>();
            IList<Model.PGDetail> pgDetails = new List<Model.PGDetail>();
            PGReviewList = (from p in PGDetailRepository.Get(p => p.UserID == OwnerID)
                           select new Model.PGReviews
                             {
                                 PGDetailID = p.PGDetailID,
                                 PGName = p.PGName,
                                 PGCommentList = (from g in PGReviewRepository.Where(g=> g.PGDetailID == p.PGDetailID).OrderBy(g=> g.CommentTime)
                                                  select new Model.PGComments
                                                  {

                                                  Message = g.Comments,
                                                  CommentTime = g.CommentTime,
                                                  PGName = p.PGName,
                                                  UserName = UserRepository.Get(u => u.UserID == g.UserID).Select(u=> u.FirstName+u.LastName).FirstOrDefault()

                                                  }).ToList(),
                                 AverageRating = PGReviewRepository.Where(g => g.PGDetailID == p.PGDetailID).Average(g=> g.Rating)
                            }).ToList();
           
            //houses = (from p in houseRepository.Get(p => p.isDeleted == false //&& p.OwnerID == OwnerID /****commented due to identity or DB update****/
            //              )
            //          select new Model.House
            //          {
            //              HouseID = p.HouseID,
            //              DisplayName = p.DisplayName,
            //              /****commented due to identity or DB update****/
            //              PGReviews = (from g in p.HouseReviews
            //                              select new LYSAdmin.Model.PGReview
            //                              {
            //                                  HouseID = g.HouseID,
            //                                  Comments = g.Comments,
            //                                  CommentTime = g.CommentTime,
            //                                  Rating = g.Rating,
            //                                  User = (from u in userRepository.Get(u => u.UserID == g.UserID)
            //                                          select new LYSAdmin.Model.User
            //                                          {
            //                                              FirstName = u.FirstName,
            //                                              LastName = u.LastName
            //                                          }).FirstOrDefault()

            //                              }).OrderBy(g => g.CommentTime).ToList()
            //          }).ToList();
           
            //foreach (House house in houses)
            //{
            //    HouseRating houseRating = new HouseRating();
            //    houseRating.HouseID = house.HouseID;
            //    houseRating.DisplayName = house.DisplayName;
            //    //houseRating.AverageRating = (decimal)house.HouseReviews.Average(p => p.Rating); /****commented due to identity or DB update****/
            //    houseRatings.Add(houseRating);
            //    /****commented due to identity or DB update****/
            //    //foreach (Model.PGReview houseReview in house.HouseReviews)
            //    //{
            //    //    Model.HouseComment comment = new Model.HouseComment();
            //    //    comment.Message = houseReview.Comments;
            //    //    comment.FeedbackTime = ((DateTime)houseReview.CommentTime).ToString("o");
            //    //    comment.HouseName = house.DisplayName;
            //    //    comment.Rating = (decimal)houseReview.Rating;
            //    //    comment.UserName = houseReview.User.FirstName +" "+ houseReview.User.LastName;
            //    //    houseComments.Add(comment);
            //    //}
            //}
            DashboardViewModel.PGReviewList = PGReviewList;
            DashboardViewModel.DonughtChart = GetDonught(OwnerID);

            return DashboardViewModel;
        }

    }
}
