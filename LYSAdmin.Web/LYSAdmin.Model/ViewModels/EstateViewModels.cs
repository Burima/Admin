﻿using System;
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
        public List<Apartment> Apartments { get; set; }

        //operation is to specify which partial view to render
        //1(View All Apartments), 2(Add new Apartment)
        public int Operation { get; set; }
    }

    public class HouseViewModel
    {
        public House House { get; set; }
        public HouseAmenity HouseAmenity { get; set; }               
        public List<House> Houses { get; set; }
        public List<Apartment> Apartments { get; set; }
        public List<Room> Rooms { get; set; }
        public List<PGDetail> PGDetails { get; set; }
        public int CityID { get; set; }
        public int AreaID { get; set; }
        public int ApartmentID { get; set; }
        public int BlockID { get; set; }        
        public int OwnerID { get; set; }

        public int NoOfRooms { get; set; }
        public PGDetail PGdetail { get; set; }


    }

    
}
