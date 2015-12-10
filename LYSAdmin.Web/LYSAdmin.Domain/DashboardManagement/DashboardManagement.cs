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

        private IBaseRepository<Data.DBEntity.Bed> bedRepository = null;
        private IBaseRepository<Data.DBEntity.Room> roomRepository = null;
        private IBaseRepository<Data.DBEntity.House> houseRepository = null;
        private IBaseRepository<Data.DBEntity.PGReview> houseReviewRepository = null;
        private IBaseRepository<Data.DBEntity.User> userRepository = null;

        public DashboardManagement()
        {
            unitOfWork = new UnitOfWork();
            bedRepository = new BaseRepository<Data.DBEntity.Bed>(unitOfWork);
            roomRepository = new BaseRepository<Data.DBEntity.Room>(unitOfWork);
            houseRepository = new BaseRepository<Data.DBEntity.House>(unitOfWork);
            houseReviewRepository = new BaseRepository<Data.DBEntity.PGReview>(unitOfWork);
            userRepository = new BaseRepository<Data.DBEntity.User>(unitOfWork);
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
            DashboardViewModel dashboardViewModel = new DashboardViewModel();
            IList<Model.HouseComment> houseComments = new List<Model.HouseComment>();
            IList<Model.HouseRating> houseRatings = new List<Model.HouseRating>();
            IList<Model.House> houses = new List<Model.House>();

            houses = (from p in houseRepository.Get(p => p.isDeleted == false //&& p.OwnerID == OwnerID /****commented due to identity or DB update****/
                          )
                      select new Model.House
                      {
                          HouseID = p.HouseID,
                          DisplayName = p.DisplayName,
                          /****commented due to identity or DB update****/
                          //HouseReviews = (from g in p.HouseReviews
                          //                select new LYSAdmin.Model.PGReview
                          //                {
                          //                    HouseID = g.HouseID,
                          //                    Comments = g.Comments,
                          //                    CommentTime = g.CommentTime,
                          //                    Rating = g.Rating,
                          //                    User = (from u in userRepository.Get(u => u.UserID == g.UserID)
                          //                            select new LYSAdmin.Model.User
                          //                            {
                          //                                FirstName = u.FirstName,
                          //                                LastName = u.LastName
                          //                            }).FirstOrDefault()

                          //                }).OrderBy(g => g.CommentTime).ToList()
                      }).ToList();
           
            foreach (House house in houses)
            {
                HouseRating houseRating = new HouseRating();
                houseRating.HouseID = house.HouseID;
                houseRating.DisplayName = house.DisplayName;
                //houseRating.AverageRating = (decimal)house.HouseReviews.Average(p => p.Rating); /****commented due to identity or DB update****/
                houseRatings.Add(houseRating);
                /****commented due to identity or DB update****/
                //foreach (Model.PGReview houseReview in house.HouseReviews)
                //{
                //    Model.HouseComment comment = new Model.HouseComment();
                //    comment.Message = houseReview.Comments;
                //    comment.FeedbackTime = ((DateTime)houseReview.CommentTime).ToString("o");
                //    comment.HouseName = house.DisplayName;
                //    comment.Rating = (decimal)houseReview.Rating;
                //    comment.UserName = houseReview.User.FirstName +" "+ houseReview.User.LastName;
                //    houseComments.Add(comment);
                //}
            }
            dashboardViewModel.HouseComments = houseComments;
            dashboardViewModel.HouseRatings = houseRatings;
            dashboardViewModel.DonughtChart = GetDonught(OwnerID);

            return dashboardViewModel;
        }

    }
}
