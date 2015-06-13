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
            //entered static data
            //need to be filled by Enum

            var Empty = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.UserID == 2)
                                     select new Bed { }
                                     ).Count();
            var Occupied = (from b in bedRepository.Get(b => rooms.Contains(b.RoomID) && b.UserID == 3)
                                     select new Bed { }
                                     ).Count();
            donughtChart.Empty = ((Empty * 100) / (Empty + Occupied)); 

            donughtChart.Occupied = ((Occupied * 100) / (Empty + Occupied));

            return donughtChart;
        }

    }
}
