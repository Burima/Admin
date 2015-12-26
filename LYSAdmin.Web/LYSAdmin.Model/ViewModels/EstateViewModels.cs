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
    public class ApartmentViewModel
    {
        public Apartment Apartment { get; set; }
       
        public IList<PGDetail> PGDetails { get; set; } 
        
    }

    public class HouseViewModel
    {
        public House House { get; set; }
        public HouseAmenity HouseAmenity { get; set; }               
        public IList<House> Houses { get; set; }
        public IList<Room> Rooms { get; set; }
        public IList<PGDetail> PGDetails { get; set; }
        public int CityID { get; set; }
        public int AreaID { get; set; }
        public int ApartmentID { get; set; }
        public int BlockID { get; set; }        
        public int OwnerID { get; set; }

        public int NoOfRooms { get; set; }
        public PGDetail PGdetail { get; set; }


    }

    public class PGDetailsViewModel
    {
        public PGDetail PGDetail { get; set; }
        public IList<PGDetail> PGDetails { get; set; } 
    }
}
