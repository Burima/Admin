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
        public HouseManagement()
        {
            unitOfWork = new UnitOfWork();
            houseRepository = new BaseRepository<Data.DBEntity.House>(unitOfWork);
            houseAmenityRepository = new BaseRepository<Data.DBEntity.HouseAmenity>(unitOfWork);
            pgDetailRepository = new BaseRepository<Data.DBEntity.PGDetail>(unitOfWork);
            roomRepository = new BaseRepository<Data.DBEntity.Room>(unitOfWork);
            bedRepository = new BaseRepository<Data.DBEntity.Bed>(unitOfWork);
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
                                             /****commented due to identity or DB update****/
                                             //Latitude=p.Latitude,
                                             //Longitude=p.Longitude,
                                             //Address = p.Address,                                            
                                             //Landmark = p.Landmark,
                                             Gender = p.Gender,
                                             NoOfBalconnies = p.NoOfBalconnies,
                                             NoOfBathrooms = p.NoOfBathrooms,
                                             /****commented due to identity or DB update****/
                                             //Description = p.Description,
                                             LastUpdatedOn = p.LastUpdatedOn,
                                             HouseAmenities = (from g in p.HouseAmenities
                                                               select new LYSAdmin.Model.HouseAmenity
                                                       {
                                                           AminityID = g.AminityID,
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
                             /****commented due to identity or DB update****/
                             //Latitude = p.Latitude,
                             //Longitude = p.Longitude,
                             //Address = p.Address,
                             //Landmark = p.Landmark,
                             Gender = p.Gender,
                             NoOfBalconnies = p.NoOfBalconnies,
                             NoOfBathrooms = p.NoOfBathrooms,

                             HouseAmenities = (from g in p.HouseAmenities
                                               select new LYSAdmin.Model.HouseAmenity
                                               {
                                                   AminityID = g.AminityID,
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
            #region LinkTypeIDandLinkIDFunctionality

            //block selected, so as apartment
            if (houseViewModel.BlockID > 0)
            {
                /****commented due to identity or DB update****/
                //houseViewModel.House.LinkTypeID = 1;
                //houseViewModel.House.LinkID = houseViewModel.BlockID;
            }
            else
            {
                //block not selected but apartment selected
                if (houseViewModel.ApartmentID > 0)
                {
                    /****commented due to identity or DB update****/
                    //houseViewModel.House.LinkTypeID = 2;
                    //houseViewModel.House.LinkID = houseViewModel.ApartmentID;
                }
                //block and apartment both not selected
                else
                {
                    /****commented due to identity or DB update****/
                    //houseViewModel.House.LinkTypeID = 3;
                    //houseViewModel.House.LinkID = houseViewModel.AreaID;
                }
            }

            #endregion LinkTypeIDandLinkIDFunctionality

            /*-------------------------------------------------------------------------------------------------------------------------------------------------*/

            #region PGSelectioFunctionality
            //PG is selected existing PGs n dropdown
            if (houseViewModel.PGdetail.PGDetailID > 0)
            {
                houseViewModel.House.PGDetailID = houseViewModel.PGdetail.PGDetailID;
                /****commented due to identity or DB update****/
                //houseViewModel.House.IsPg = true;
            }
            else
            {
                if (houseViewModel.PGdetail.PGName != null && houseViewModel.PGdetail.PGName != String.Empty)
                {
                    //set details to inserta new PG
                    var pgDetail = new Data.DBEntity.PGDetail();
                    pgDetail.PGName = houseViewModel.PGdetail.PGName;
                    pgDetail.AreaID = houseViewModel.AreaID;
                    pgDetail.UserID = houseViewModel.OwnerID;
                    //Insert into DB
                    pgDetailRepository.Insert(pgDetail);
                    unitOfWork.SaveChanges();
                    //set PGDetailID for House Table
                    houseViewModel.House.PGDetailID = pgDetail.PGDetailID;
                    /****commented due to identity or DB update****/
                   // houseViewModel.House.IsPg = true;

                }
                else
                {
                    //is not a PG type House
                    houseViewModel.House.PGDetailID = 0;
                    /****commented due to identity or DB update****/
                    //houseViewModel.House.IsPg = false;

                }
            }
            #endregion PGSelectioFunctionality

            /*----------------------------------------------------------------------------------------------------------------------------------------------------*/

            //insert House
            var dbHouse = Mapper.Map<LYSAdmin.Model.House, LYSAdmin.Data.DBEntity.House>(houseViewModel.House);//Converting Model.House to Data.House
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

            return count;//Saving the changes to DB

        }
        public int UpdateHouse(LYSAdmin.Model.HouseViewModel houseViewModel)
        {
            var dbHouse = Mapper.Map<LYSAdmin.Model.House, LYSAdmin.Data.DBEntity.House>(houseViewModel.House);
            houseRepository.Update(dbHouse);
            return unitOfWork.SaveChanges();
        }


    }
}
