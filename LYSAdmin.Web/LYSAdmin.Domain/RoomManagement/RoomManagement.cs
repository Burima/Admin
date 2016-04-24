using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using LYSAdmin.Model;
using LYSAdmin.Data.DBRepository;

namespace LYSAdmin.Domain.RoomManagement
{
    public class RoomManagement : IRoomManagement
    {
         private IUnitOfWork unitOfWork = null;
         private IBaseRepository<Data.DBEntity.Room> roomRepository = null;
         private IBaseRepository<Data.DBEntity.Bed> bedRepository = null;
         private IBaseRepository<Data.DBEntity.PGDetail> pgDetailRepository = null;
         public RoomManagement()
        {
            unitOfWork = new UnitOfWork();
            roomRepository = new BaseRepository<Data.DBEntity.Room>(unitOfWork);
            bedRepository = new BaseRepository<Data.DBEntity.Bed>(unitOfWork);
            pgDetailRepository = new BaseRepository<Data.DBEntity.PGDetail>(unitOfWork);
            //automapper 
            Mapper.CreateMap<LYSAdmin.Model.Room, LYSAdmin.Data.DBEntity.Room>();
         
        }

         public IList<PGDetail> GetHousesByOwnerIDAndAreaID(long OwnerID, int AreaID)
         {
             List<Model.PGDetail> allPGs = (from p in pgDetailRepository.Get(p => p.UserID == OwnerID && p.AreaID == AreaID, q => q.OrderByDescending(p => p.PGName))
                                            select new Model.PGDetail
                                            {
                                                PGDetailID = p.PGDetailID,
                                                PGName = p.PGName,
                                                 Houses = (from h in p.Houses
                                                            select new LYSAdmin.Model.House
                                                            {
                                                                HouseID = h.HouseID,
                                                                HouseName = h.HouseName,
                                                                Rooms = (from r in h.Rooms
                                                                         select new LYSAdmin.Model.Room
                                                                         {
                                                                             RoomID = r.RoomID,
                                                                             RoomNumber = r.RoomNumber,
                                                                             MonthlyRent = r.MonthlyRent,
                                                                             Deposit = r.Deposit,
                                                                             NoOfBeds = r.NoOfBeds,
                                                                             Beds = (from b in r.Beds
                                                                                     select new LYSAdmin.Model.Bed
                                                                                     {
                                                                                         BedID = b.BedID,
                                                                                         BedStatus = b.BedStatus,
                                                                                         BookingFromDate = b.BookingFromDate,
                                                                                         BookingToDate = b.BookingToDate,
                                                                                         
                                                                                     }).ToList()
                                                                         }).ToList(),
                                                            }).ToList(),
                                            }).ToList();
             return allPGs;

         }

         public int AddRoom(RoomViewModel roomViewModel)
         {

             int count = 0;
             var dbRoom = Mapper.Map<LYSAdmin.Model.Room, LYSAdmin.Data.DBEntity.Room>(roomViewModel.Room);//Converting Model.Room to Data.Room 
             dbRoom.Status = true;
             dbRoom.CreatedOn = DateTime.Now;
             dbRoom.LastUpdatedOn = DateTime.Now;
             roomRepository.Insert(dbRoom);//Inserting new room
             count = unitOfWork.SaveChanges();

             if (count > 0)
             {
                 if (roomViewModel.Room.NoOfBeds > 0)
                 {
                     for (int i = 1; i <= roomViewModel.Room.NoOfBeds; i++)
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

            

             return count;
            }

   

  }
}








