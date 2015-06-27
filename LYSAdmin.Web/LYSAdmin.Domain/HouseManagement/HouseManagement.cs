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
        public HouseManagement()
        {
            unitOfWork = new UnitOfWork();
            houseRepository = new BaseRepository<Data.DBEntity.House>(unitOfWork);
        }

        public IList<Model.House> GetHouses(int OwnerID)
        {
            IList<Model.House> houses = (from p in houseRepository.Get(p => p.isDeleted == false && p.OwnerID == OwnerID, q => q.OrderByDescending(p => p.LastUpdatedOn))
                                                 select new Model.House
                                                 {
                                                     HouseID = p.HouseID,
                                                     HouseName = p.HouseName,
                                                     Description = p.Description,
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
                                                                   IndividualTV =g.IndividualTV,
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
                                                     HouseDescriptions = (from h in p.HouseDescriptions
                                                                          select new LYSAdmin.Model.HouseDescription{
                                                                             DescrID = h.DescrID,
                                                                             Description = h.Description,
                                                                             Address = h.Address,
                                                                            Gender = h.Gender,
                                                                            Landmark = h.Landmark,
                                                                             NoOfBalconnies = h.NoOfBalconnies,
                                                                             NoOfBathrooms = h.NoOfBathrooms,
                                                                             NoOfRooms = h.NoOfRooms
                                                             } ).ToList(),

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
                                                             } ).ToList()

                                                 }).ToList();
                                                        


            return houses;
        }

        public Model.House GetHouseByID(int LinkTypeID)
        {
            var house = (from p in houseRepository.Get(p => p.isDeleted == false && p.LinkTypeID == LinkTypeID)
                         select new Model.House
                         {
                             HouseID = p.HouseID,
                             HouseName = p.HouseName,
                             Description = p.Description,
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
                             HouseDescriptions = (from h in p.HouseDescriptions
                                                  select new LYSAdmin.Model.HouseDescription
                                                  {
                                                      DescrID = h.DescrID,
                                                      Description = h.Description,
                                                      Address = h.Address,
                                                      Gender = h.Gender,
                                                      Landmark = h.Landmark,
                                                      NoOfBalconnies = h.NoOfBalconnies,
                                                      NoOfBathrooms = h.NoOfBathrooms,
                                                      NoOfRooms = h.NoOfRooms
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
            var dbHouse = Mapper.Map<LYSAdmin.Model.House, LYSAdmin.Data.DBEntity.House>(houseViewModel.House);//Converting Model.Apartment to Data.Apartment
            houseRepository.Insert(dbHouse);//Inserting new lead
            return unitOfWork.SaveChanges();//Saving the changes to DB

        }
        public int UpdateHouse(LYSAdmin.Model.HouseViewModel houseViewModel)
        {
            var dbHouse = Mapper.Map<LYSAdmin.Model.House, LYSAdmin.Data.DBEntity.House>(houseViewModel.House);
            houseRepository.Update(dbHouse);
            return unitOfWork.SaveChanges();
        }
    }
}
