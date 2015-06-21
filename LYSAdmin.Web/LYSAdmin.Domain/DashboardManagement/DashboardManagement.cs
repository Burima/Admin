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

        public DashboardManagement()
        {
            unitOfWork = new UnitOfWork();
            bedRepository = new BaseRepository<Data.DBEntity.Bed>(unitOfWork);
            roomRepository = new BaseRepository<Data.DBEntity.Room>(unitOfWork);
            houseRepository = new BaseRepository<Data.DBEntity.House>(unitOfWork);
        }

        public DonughtChart GetDonught(int OwnerID)
        {
            DonughtChart donughtChart = new DonughtChart();

            IList<int> houses = new List<int>();
            IList<int> rooms = new List<int>();
            houses = (from p in houseRepository
                      where p.OwnerID == OwnerID
                     select p.HouseID).ToList();

            rooms = (from r in roomRepository
                     where houses.Contains(r.HouseID)
                     select r.RoomID).ToList();

            donughtChart.Empty = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.Bed_Status == (int)Constants.Bed_Status.Vacant)
                                  select new Bed { }
                                     ).Count();

            donughtChart.Occupied = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.Bed_Status == (int)Constants.Bed_Status.Booked)
                                     select new Bed { }
                                     ).Count();

            donughtChart.NewEntered = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.Bed_Status == (int)Constants.Bed_Status.Staying
                                           && DateTime.Compare(b.Status_Update_Date.Value,DateTime.Now) < 15)
                                     select new Bed { }
                                     ).Count();

            donughtChart.Existing = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.Bed_Status == (int)Constants.Bed_Status.Staying
                                           && DateTime.Compare(b.Status_Update_Date.Value, DateTime.Now) > 15)
                                       select new Bed { }
                                     ).Count();

            donughtChart.Leaving = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.Bed_Status == (int)Constants.Bed_Status.NoticeGiven
                                           && DateTime.Compare(b.Status_Update_Date.Value, DateTime.Now) < 15)
                                     select new Bed { }
                                     ).Count();

            donughtChart.Staying = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && (b.Bed_Status == (int)Constants.Bed_Status.NoticeGiven
                                       || b.Bed_Status == (int)Constants.Bed_Status.Staying) 
                                       && DateTime.Compare(b.Status_Update_Date.Value, DateTime.Now) > 15)
                                    select new Bed { }
                                     ).Count();


            return donughtChart;
        }

    }
}
