using LYSAdmin.Data.DBRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using LYSAdmin.Model;

namespace LYSAdmin.Domain.HouseManagement
{
    public class HouseManagement : IHouseManagement
    {
        private IUnitOfWork unitOfWork = null;
        private IBaseRepository<Data.DBEntity.House> houseRepository = null;
        private IBaseRepository<Data.DBEntity.HouseAmenity> houseAmenityRepository = null;
        private IBaseRepository<Data.DBEntity.PGDetail> pgDetailRepository = null;
        private IBaseRepository<Data.DBEntity.Room> roomRepository = null;
        private IBaseRepository<Data.DBEntity.Bed> bedRepository = null;
        private IBaseRepository<Data.DBEntity.HouseImage> houseImageRepository = null;
        public HouseManagement()
        {
            unitOfWork = new UnitOfWork();
            houseRepository = new BaseRepository<Data.DBEntity.House>(unitOfWork);
            houseAmenityRepository = new BaseRepository<Data.DBEntity.HouseAmenity>(unitOfWork);
            pgDetailRepository = new BaseRepository<Data.DBEntity.PGDetail>(unitOfWork);
            roomRepository = new BaseRepository<Data.DBEntity.Room>(unitOfWork);
            bedRepository = new BaseRepository<Data.DBEntity.Bed>(unitOfWork);
            houseImageRepository = new BaseRepository<Data.DBEntity.HouseImage>(unitOfWork);
            //automapper 
            Mapper.CreateMap<LYSAdmin.Model.House, LYSAdmin.Data.DBEntity.House>();
            Mapper.CreateMap<LYSAdmin.Model.HouseAmenity, LYSAdmin.Data.DBEntity.HouseAmenity>();

        }
        public IList<Model.House> GetHouses(int OwnerID)
        {
            IList<Model.House> houses = (from p in houseRepository.Get(p => p.isDeleted == false //&& p.OwnerID == OwnerID /****commented due to identity or DB update****/
                                             , q => q.OrderByDescending(p => p.LastUpdatedOn))
                                         select new Model.House
                                         {
                                             HouseID = p.HouseID,
                                             HouseName = p.HouseName,
                                             Gender = p.Gender,
                                             NoOfBalconnies = p.NoOfBalconnies,
                                             NoOfBathrooms = p.NoOfBathrooms,
                                             LastUpdatedOn = p.LastUpdatedOn,
                                             HouseAmenities = (from g in p.HouseAmenities
                                                               select new LYSAdmin.Model.HouseAmenity
                                                       {
                                                           HouseAmenityID = g.HouseAmenityID,
                                                           AC = g.AC,
                                                           Aquaguard = g.Aquaguard,
                                                           AttachBathrooms = g.AttachBathrooms,
                                                           BreakFastGiven = g.BreakFastGiven,
                                                           Clubhouse = g.Clubhouse,
                                                           CommonTV = g.CommonTV,
                                                           CreatedOn = g.CreatedOn,
                                                           DinnerGiven = g.DinnerGiven,
                                                           EmergencyMedicalServices = g.EmergencyMedicalServices,
                                                           FourWheelerCloseParking = g.FourWheelerCloseParking,
                                                           FourWheelerOpenParking = g.FourWheelerOpenParking,
                                                           Fridge = g.Fridge,
                                                           GuardianEntry = g.GuardianEntry,
                                                           GYM = g.GYM,
                                                           HotColdWaterSupply = g.HotColdWaterSupply,
                                                           Housekeeping = g.Housekeeping,
                                                           IndividualTV = g.IndividualTV,
                                                           IntercomFacility = g.IntercomFacility,
                                                           IroningWashingServices = g.IroningWashingServices,
                                                           KitchenFacilityWithGas = g.KitchenFacilityWithGas,
                                                           LCDTVCableConnection = g.LCDTVCableConnection,
                                                           Lift = g.Lift,
                                                           Lockers = g.Lockers,
                                                           LunchGiven = g.LunchGiven,
                                                           MineralDrinkingWater = g.MineralDrinkingWater,
                                                           Newspaper = g.Newspaper,
                                                           NoBoysEntry = g.NoBoysEntry,
                                                           NoDrinking = g.NoDrinking,
                                                           NoSmoking = g.NoSmoking,
                                                           NonVegAllowed = g.NonVegAllowed,
                                                           Partyhall = g.Partyhall,
                                                           Playground = g.Playground,
                                                           Powerbackup = g.Powerbackup,
                                                           RoomService = g.RoomService,
                                                           Security = g.Security,
                                                           SwimmingPool = g.SwimmingPool,
                                                           TwoWheelerCloseParking = g.TwoWheelerCloseParking,
                                                           TwoWheelerOpenParking = g.TwoWheelerOpenParking,
                                                           VideoSurveillance = g.VideoSurveillance,
                                                           Wardrobes = g.Wardrobes,
                                                           Washingmachine = g.Washingmachine,
                                                           WaterSupply = g.WaterSupply,
                                                           Wifi = g.Wifi

                                                       }).ToList(),                                            

                                             HouseImages = (from i in p.HouseImages
                                                            select new LYSAdmin.Model.HouseImage
                                                            {
                                                                HouseImageID = i.HouseImageID,
                                                                ImagePath = i.ImagePath
                                                            }).ToList(),

                                             Rooms = (from r in p.Rooms
                                                      select new LYSAdmin.Model.Room
                                                      {
                                                          RoomID = r.RoomID,
                                                          RoomNumber = r.RoomNumber,
                                                          MonthlyRent = r.MonthlyRent,
                                                          Deposit = r.Deposit,
                                                          NoOfBeds = r.NoOfBeds
                                                      }).ToList()

                                         }).ToList();



            return houses;
        }

        public Model.House GetHouseByID(int LinkTypeID)
        {
            var house = (from p in houseRepository.Get(p => p.isDeleted == false //&& p.LinkTypeID == LinkTypeID /****commented due to identity or DB update****/
                             )
                         select new Model.House
                         {
                             HouseID = p.HouseID,
                             HouseName = p.HouseName,
                             Gender = p.Gender,
                             NoOfBalconnies = p.NoOfBalconnies,
                             NoOfBathrooms = p.NoOfBathrooms,

                             HouseAmenities = (from g in p.HouseAmenities
                                               select new LYSAdmin.Model.HouseAmenity
                                               {
                                                   HouseAmenityID = g.HouseAmenityID,
                                                   AC = g.AC,
                                                   Aquaguard = g.Aquaguard,
                                                   AttachBathrooms = g.AttachBathrooms,
                                                   BreakFastGiven = g.BreakFastGiven,
                                                   Clubhouse = g.Clubhouse,
                                                   CommonTV = g.CommonTV,
                                                   CreatedOn = g.CreatedOn,
                                                   DinnerGiven = g.DinnerGiven,
                                                   EmergencyMedicalServices = g.EmergencyMedicalServices,
                                                   FourWheelerCloseParking = g.FourWheelerCloseParking,
                                                   FourWheelerOpenParking = g.FourWheelerOpenParking,
                                                   Fridge = g.Fridge,
                                                   GuardianEntry = g.GuardianEntry,
                                                   GYM = g.GYM,
                                                   HotColdWaterSupply = g.HotColdWaterSupply,
                                                   Housekeeping = g.Housekeeping,
                                                   IndividualTV = g.IndividualTV,
                                                   IntercomFacility = g.IntercomFacility,
                                                   IroningWashingServices = g.IroningWashingServices,
                                                   KitchenFacilityWithGas = g.KitchenFacilityWithGas,
                                                   LCDTVCableConnection = g.LCDTVCableConnection,
                                                   Lift = g.Lift,
                                                   Lockers = g.Lockers,
                                                   LunchGiven = g.LunchGiven,
                                                   MineralDrinkingWater = g.MineralDrinkingWater,
                                                   Newspaper = g.Newspaper,
                                                   NoBoysEntry = g.NoBoysEntry,
                                                   NoDrinking = g.NoDrinking,
                                                   NoSmoking = g.NoSmoking,
                                                   NonVegAllowed = g.NonVegAllowed,
                                                   Partyhall = g.Partyhall,
                                                   Playground = g.Playground,
                                                   Powerbackup = g.Powerbackup,
                                                   RoomService = g.RoomService,
                                                   Security = g.Security,
                                                   SwimmingPool = g.SwimmingPool,
                                                   TwoWheelerCloseParking = g.TwoWheelerCloseParking,
                                                   TwoWheelerOpenParking = g.TwoWheelerOpenParking,
                                                   VideoSurveillance = g.VideoSurveillance,
                                                   Wardrobes = g.Wardrobes,
                                                   Washingmachine = g.Washingmachine,
                                                   WaterSupply = g.WaterSupply,
                                                   Wifi = g.Wifi

                                               }).ToList(),
                             

                             HouseImages = (from i in p.HouseImages
                                            select new LYSAdmin.Model.HouseImage
                                            {
                                                HouseImageID = i.HouseImageID,
                                                ImagePath = i.ImagePath
                                            }).ToList(),

                             Rooms = (from r in p.Rooms
                                      select new LYSAdmin.Model.Room
                                      {
                                          RoomID = r.RoomID,
                                          RoomNumber = r.RoomNumber,
                                          MonthlyRent = r.MonthlyRent,
                                          Deposit = r.Deposit,
                                          NoOfBeds = r.NoOfBeds
                                      }).ToList()
                         }).FirstOrDefault();

            return house;
        }

        public int AddHouse(HouseViewModel houseViewModel)
        {
            int count = 0;
            int PGDetailID = houseViewModel.PGDetailID;
            int OwnerID = houseViewModel.OwnerID;
            int AddedHouseID = 0;           

           /*----------------------------------------------------------------------------------------------------------------------------------------------------*/

            //insert House
            var dbHouse = Mapper.Map<LYSAdmin.Model.House, LYSAdmin.Data.DBEntity.House>(houseViewModel.House);//Converting Model.House to Data.House
            dbHouse.PGDetailID = houseViewModel.PGDetailID; 
            dbHouse.Status = true;
            dbHouse.CreatedOn = DateTime.Now;
            dbHouse.LastUpdatedOn = DateTime.Now;
            houseRepository.Insert(dbHouse);//Inserting new house
            count = unitOfWork.SaveChanges();
            
            if (count > 0)
            {
                //insert house amenity
                var dbHouseAmenity = Mapper.Map<LYSAdmin.Model.HouseAmenity, LYSAdmin.Data.DBEntity.HouseAmenity>(houseViewModel.HouseAmenity);
                dbHouseAmenity.HouseID = dbHouse.HouseID;
                AddedHouseID = dbHouse.HouseID;
                dbHouseAmenity.CreatedOn = DateTime.Now;
                dbHouseAmenity.LastUpdatedOn = DateTime.Now;
                houseAmenityRepository.Insert(dbHouseAmenity);

                //save houseamenities 
                unitOfWork.SaveChanges();
                /*---------------------------------------------------------------------------------------------------------------------------------------------------*/

                #region RoomInsertion
                if (houseViewModel.Rooms.Count > 0)
                {
                    int roomnumber = 1;
                    foreach (var room in houseViewModel.Rooms)
                    {
                        var dbRoom = new Data.DBEntity.Room();
                        dbRoom.HouseID = dbHouse.HouseID;
                        dbRoom.RoomNumber = roomnumber;
                        dbRoom.MonthlyRent = room.MonthlyRent;
                        dbRoom.Deposit = room.Deposit;
                        dbRoom.NoOfBeds = room.NoOfBeds;
                        dbRoom.Status = true;
                        dbRoom.CreatedOn = DateTime.Now;
                        dbRoom.LastUpdatedOn = DateTime.Now;
                        //insert room
                        roomRepository.Insert(dbRoom);
                        int roomCount = unitOfWork.SaveChanges();
                        if (roomCount > 0)
                        {
                            if (room.NoOfBeds > 0)
                            {
                                for (int i = 1; i <= room.NoOfBeds; i++)
                                {
                                    var dbBed = new Data.DBEntity.Bed();
                                    dbBed.RoomID = dbRoom.RoomID;
                                    dbBed.UserID = 0;
                                    dbBed.Status = true;//active                                    
                                    dbBed.CreatedOn = DateTime.Now;
                                    dbBed.LastUpdatedOn = DateTime.Now;
                                    dbBed.BedStatus = 0;//empty
                                    dbBed.StatusUpdateDate = DateTime.Now;
                                    //insert Bed
                                    bedRepository.Insert(dbBed);
                                    unitOfWork.SaveChanges();
                                }
                            }
                        }

                        roomnumber++;
                    }
                }
                #endregion RoomInsertion

            }

            return AddedHouseID;//Saving the changes to DB

        }
        public int UpdateHouse(LYSAdmin.Model.HouseViewModel houseViewModel)
        {
            var dbHouse = Mapper.Map<LYSAdmin.Model.House, LYSAdmin.Data.DBEntity.House>(houseViewModel.House);
            houseRepository.Update(dbHouse);
            return unitOfWork.SaveChanges();
        }


        public IList<PGDetail> GetPGsByOwnerIDAndAreaID(long OwnerID, int AreaID)
        {
           List<Model.PGDetail> allPGs = (from p in pgDetailRepository.Get(p => p.UserID == OwnerID && p.AreaID == AreaID, q => q.OrderByDescending(p => p.PGName))
                                           select new Model.PGDetail
                                               {
                                                   PGDetailID = p.PGDetailID,
                                                   PGName = p.PGName,
                                                   UserID = p.UserID,
                                                    Houses = (from h in p.Houses
                                                                select new LYSAdmin.Model.House
                                                                {
                                                                    HouseID = h.HouseID,
                                                                    HouseName = h.HouseName,
                                                                    Gender = h.Gender,
                                                                    HouseAmenities = (from g in h.HouseAmenities
                                                                                    select new LYSAdmin.Model.HouseAmenity
                                                                                    {

                                                                                        HouseAmenityID = g.HouseAmenityID,
                                                                                        AC = g.AC,
                                                                                        Aquaguard = g.Aquaguard,
                                                                                        AttachBathrooms = g.AttachBathrooms,
                                                                                        BreakFastGiven = g.BreakFastGiven,
                                                                                        Clubhouse = g.Clubhouse,
                                                                                        CommonTV = g.CommonTV,
                                                                                        CreatedOn = g.CreatedOn,
                                                                                        DinnerGiven = g.DinnerGiven,
                                                                                        EmergencyMedicalServices = g.EmergencyMedicalServices,
                                                                                        FourWheelerCloseParking = g.FourWheelerCloseParking,
                                                                                        FourWheelerOpenParking = g.FourWheelerOpenParking,
                                                                                        Fridge = g.Fridge,
                                                                                        GuardianEntry = g.GuardianEntry,
                                                                                        GYM = g.GYM,
                                                                                        HotColdWaterSupply = g.HotColdWaterSupply,
                                                                                        Housekeeping = g.Housekeeping,
                                                                                        IndividualTV = g.IndividualTV,
                                                                                        IntercomFacility = g.IntercomFacility,
                                                                                        IroningWashingServices = g.IroningWashingServices,
                                                                                        KitchenFacilityWithGas = g.KitchenFacilityWithGas,
                                                                                        LCDTVCableConnection = g.LCDTVCableConnection,
                                                                                        Lift = g.Lift,
                                                                                        Lockers = g.Lockers,
                                                                                        LunchGiven = g.LunchGiven,
                                                                                        MineralDrinkingWater = g.MineralDrinkingWater,
                                                                                        Newspaper = g.Newspaper,
                                                                                        NoBoysEntry = g.NoBoysEntry,
                                                                                        NoDrinking = g.NoDrinking,
                                                                                        NoSmoking = g.NoSmoking,
                                                                                        NonVegAllowed = g.NonVegAllowed,
                                                                                        Partyhall = g.Partyhall,
                                                                                        Playground = g.Playground,
                                                                                        Powerbackup = g.Powerbackup,
                                                                                        RoomService = g.RoomService,
                                                                                        Security = g.Security,
                                                                                        SwimmingPool = g.SwimmingPool,
                                                                                        TwoWheelerCloseParking = g.TwoWheelerCloseParking,
                                                                                        TwoWheelerOpenParking = g.TwoWheelerOpenParking,
                                                                                        VideoSurveillance = g.VideoSurveillance,
                                                                                        Wardrobes = g.Wardrobes,
                                                                                        Washingmachine = g.Washingmachine,
                                                                                        WaterSupply = g.WaterSupply,
                                                                                        Wifi = g.Wifi
                                                                                    }).ToList()
                                                                }).ToList()
                                       }).ToList();

            return allPGs;
        }

        public int InsertHouseImages(IDictionary<int, List<string>> houseImageMap)
        {
            
            if (houseImageMap!= null && houseImageMap.Count > 0)
            {
               
                foreach (string imagePath in houseImageMap.Values.FirstOrDefault())
                {
                    var houseImage = new LYSAdmin.Data.DBEntity.HouseImage();
                    houseImage.HouseID = houseImageMap.Keys.FirstOrDefault();
                    houseImage.ImagePath = imagePath;
                    houseImage.CreatedOn = DateTime.Now;
                    houseImage.LastUpdatedOn = DateTime.Now;

                    houseImageRepository.Insert(houseImage);
                }
            }

            int count =  unitOfWork.SaveChanges();

            return count;
        }


    }
}
