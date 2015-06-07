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
                                                     BasicAmenities = (from g in p.BasicAmenities
                                                               select new LYSAdmin.Model.BasicAmenity
                                                               {
                                                                   AminityID = g.AminityID,
                                                                   AC = g.AC,
                                                                   Aqua_guard = g.Aqua_guard,
                                                                   Attach_bathrooms = g.Attach_bathrooms,
                                                                   BreakFast_Given = g.BreakFast_Given,
                                                                   Club_house = g.Club_house,
                                                                   Common_TV = g.Common_TV,
                                                                   CreatedOn = g.CreatedOn,
                                                                   Dinner_Given = g.Dinner_Given,
                                                                   Emergency_Medical_Services = g.Emergency_Medical_Services,
                                                                   Four_wheeler_close_parking = g.Four_wheeler_close_parking,
                                                                   Four_wheeler_open_parking = g.Four_wheeler_open_parking,
                                                                   Fridge = g.Fridge,
                                                                   Guardian_Entry = g.Guardian_Entry,
                                                                   GYM = g.GYM,
                                                                   Hot_Cold_Water_Supply = g.Hot_Cold_Water_Supply,
                                                                   House_Keeping = g.House_Keeping,
                                                                   Individual_TV =g.Individual_TV,
                                                                  Intercom_facility = g.Intercom_facility,
                                                                  Ironing_washing_services = g.Ironing_washing_services,
                                                                  Kitchen_Facility_with_Gas = g.Kitchen_Facility_with_Gas,
                                                                  LCD_TV_cable_connection = g.LCD_TV_cable_connection,
                                                                  Lift = g.Lift,
                                                                  Lockers = g.Lockers,
                                                                  Lunch_Given = g.Lunch_Given,
                                                                  Mineral_drinking_water= g.Mineral_drinking_water,
                                                                  Newspaper = g.Newspaper,
                                                                  No_Boys_Entry= g.No_Boys_Entry,
                                                                  No_Drinking=g.No_Drinking,
                                                                  No_Smoking= g.No_Smoking,
                                                                  NonVeg_allowed= g.NonVeg_allowed,
                                                                  Party_Hall = g.Party_Hall,
                                                                  Playground = g.Playground,
                                                                  Power_back_up = g.Power_back_up,
                                                                  Room_service = g.Room_service,
                                                                  Security = g.Security,
                                                                  Swimming_pool = g.Swimming_pool,
                                                                  Two_wheeler_close_parking = g.Two_wheeler_close_parking,
                                                                  Two_wheeler_open_parking =g.Two_wheeler_open_parking,
                                                                  Video_Surveillance = g.Video_Surveillance,
                                                                  Ward_robes = g.Ward_robes,
                                                                  Washing_machine = g.Washing_machine,
                                                                  Water_supply = g.Water_supply,
                                                                  Wifi = g.Wifi                                                             
                                                                   
                                                               }).ToList(),
                                                     HouseDescriptions = (from h in p.HouseDescriptions
                                                                          select new LYSAdmin.Model.HouseDescription{
                                                                             DescrID = h.DescrID,
                                                                             Description = h.Description,
                                                                             Address = h.Address,
                                                                            Gender = h.Gender,
                                                                            Landmark = h.Landmark,
                                                                            No_of_Balconnies = h.No_of_Balconnies,
                                                                            No_of_Bathrooms = h.No_of_Bathrooms,
                                                                            No_of_Rooms = h.No_of_Rooms
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
                                                                 Monthly_Rent = r.Monthly_Rent,
                                                                 Deposit = r.Deposit,
                                                                 No_of_Beds = r.No_of_Beds
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
                             BasicAmenities = (from g in p.BasicAmenities
                                               select new LYSAdmin.Model.BasicAmenity
                                               {
                                                   AminityID = g.AminityID,
                                                   AC = g.AC,
                                                   Aqua_guard = g.Aqua_guard,
                                                   Attach_bathrooms = g.Attach_bathrooms,
                                                   BreakFast_Given = g.BreakFast_Given,
                                                   Club_house = g.Club_house,
                                                   Common_TV = g.Common_TV,
                                                   CreatedOn = g.CreatedOn,
                                                   Dinner_Given = g.Dinner_Given,
                                                   Emergency_Medical_Services = g.Emergency_Medical_Services,
                                                   Four_wheeler_close_parking = g.Four_wheeler_close_parking,
                                                   Four_wheeler_open_parking = g.Four_wheeler_open_parking,
                                                   Fridge = g.Fridge,
                                                   Guardian_Entry = g.Guardian_Entry,
                                                   GYM = g.GYM,
                                                   Hot_Cold_Water_Supply = g.Hot_Cold_Water_Supply,
                                                   House_Keeping = g.House_Keeping,
                                                   Individual_TV = g.Individual_TV,
                                                   Intercom_facility = g.Intercom_facility,
                                                   Ironing_washing_services = g.Ironing_washing_services,
                                                   Kitchen_Facility_with_Gas = g.Kitchen_Facility_with_Gas,
                                                   LCD_TV_cable_connection = g.LCD_TV_cable_connection,
                                                   Lift = g.Lift,
                                                   Lockers = g.Lockers,
                                                   Lunch_Given = g.Lunch_Given,
                                                   Mineral_drinking_water = g.Mineral_drinking_water,
                                                   Newspaper = g.Newspaper,
                                                   No_Boys_Entry = g.No_Boys_Entry,
                                                   No_Drinking = g.No_Drinking,
                                                   No_Smoking = g.No_Smoking,
                                                   NonVeg_allowed = g.NonVeg_allowed,
                                                   Party_Hall = g.Party_Hall,
                                                   Playground = g.Playground,
                                                   Power_back_up = g.Power_back_up,
                                                   Room_service = g.Room_service,
                                                   Security = g.Security,
                                                   Swimming_pool = g.Swimming_pool,
                                                   Two_wheeler_close_parking = g.Two_wheeler_close_parking,
                                                   Two_wheeler_open_parking = g.Two_wheeler_open_parking,
                                                   Video_Surveillance = g.Video_Surveillance,
                                                   Ward_robes = g.Ward_robes,
                                                   Washing_machine = g.Washing_machine,
                                                   Water_supply = g.Water_supply,
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
                                                      No_of_Balconnies = h.No_of_Balconnies,
                                                      No_of_Bathrooms = h.No_of_Bathrooms,
                                                      No_of_Rooms = h.No_of_Rooms
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
                                          Monthly_Rent = r.Monthly_Rent,
                                          Deposit = r.Deposit,
                                          No_of_Beds = r.No_of_Beds
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
