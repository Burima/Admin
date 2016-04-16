using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    class EstateViewModels
    {
    }
  
    public class HouseViewModel
    {
        public House House { get; set; }
        public HouseAmenity HouseAmenity { get; set; }               
        
        public IList<Room> Rooms { get; set; }
        public IList<PGDetail> PGDetails { get; set; }

        public IList<string> HouseImages { get; set; }
        public int PGDetailID { get; set; }
        public int OwnerID { get; set; }

        public int NoOfRooms { get; set; }
        public PGDetail PGdetail { get; set; }

        public bool HasApartment { get; set; }

        public int AddedHouseID { get; set; }

    }

    public class PGDetailsViewModel
    {
        public PGDetail PGDetail { get; set; }
        public IList<PGDetail> PGDetails { get; set; } 
    }

    public class RoomViewModel
    {
        public Room Room { get; set; }

        public IList<PGDetail> PGDetails { get; set; }

        public IList<Bed> Beds { get; set; }

        public IList<House> Houses { get; set; }
    }
}
