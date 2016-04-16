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
    class RoomManagement : IRoomManagement
    {
         private IUnitOfWork unitOfWork = null;
         private IBaseRepository<Data.DBEntity.House> houseRepository = null;
         private IBaseRepository<Data.DBEntity.PGDetail> pgDetailRepository = null;

         public RoomManagement()
        {
            unitOfWork = new UnitOfWork();
            houseRepository = new BaseRepository<Data.DBEntity.House>(unitOfWork);
            pgDetailRepository = new BaseRepository<Data.DBEntity.PGDetail>(unitOfWork);
            //automapper 
            Mapper.CreateMap<LYSAdmin.Model.House, LYSAdmin.Data.DBEntity.House>();
         
        }

         //public IList<PGDetail> GetHousesByOwnerIDAndAreaID(long OwnerID, int AreaID)
         //{
         //    List<Model.PGDetail> allPGs = (from p in pgDetailRepository.Get(p => p.UserID == OwnerID && p.AreaID == AreaID, q => q.OrderByDescending(p => p.PGName))
         //                                   select new Model.PGDetail
         //                                   {
         //                                       PGDetailID = p.PGDetailID,
         //                                       Apartments = (from a in p.Apartments
         //                                                     select new LYSAdmin.Model.Apartment
         //                                                     {
         //                                                         ApartmentID = a.ApartmentID,
         //                                                         ApartmentName = a.ApartmentName,
         //                                                         IsDefault = a.IsDefault,
         //                                                         Blocks = (from b in a.Blocks
         //                                                                   select new LYSAdmin.Model.Block
         //                                                                   {
         //                                                                       BlockID = b.BlockID,
                                                                              
         //                                                                       Houses = (from h in b.Houses
         //                                                                                 select new LYSAdmin.Model.House
         //                                                                                 {
         //                                                                                     HouseID = h.HouseID,
         //                                                                                     HouseName = h.HouseName,

         //                                                                                 }).ToList()
         //                                                                   }).ToList()
         //                                                     }).ToList(),
         //                                   }).ToList();
         //    return allPGs;

         //}
    }
}
