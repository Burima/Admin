using LYSAdmin.Data.DBRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LYSAdmin.Model;
using AutoMapper;

namespace LYSAdmin.Domain.PGDetailManagement
{
    public class PGDetailManagement:IPGDetailManagement
    {
        private IUnitOfWork unitOfWork = null;
        private IBaseRepository<Data.DBEntity.PGDetail> pgDetailRepository = null;
        public PGDetailManagement()
        {
            unitOfWork = new UnitOfWork();
            pgDetailRepository = new BaseRepository<Data.DBEntity.PGDetail>(unitOfWork);
            Mapper.CreateMap<LYSAdmin.Model.PGDetail, LYSAdmin.Data.DBEntity.PGDetail>();
        }
        //Get All the PGs filter by Owner and Area for a session
        public List<Model.PGDetail> GetPGsByOwnerIDandAreaID(long OwnerID, int AreaID)
        {
            List<Model.PGDetail> allPGs = (from p in pgDetailRepository.Get(p => p.UserID == OwnerID && p.AreaID == AreaID, q => q.OrderByDescending(p => p.PGName))
                                         select new Model.PGDetail
                                         {
                                            PGDetailID = p.PGDetailID,
                                            PGName=p.PGName,
                                            AreaID=p.AreaID,
                                            UserID=p.UserID,
                                            Landmark = p.Landmark,
                                            Latitude = p.Latitude,
                                            Longitude = p.Longitude,
                                            Address = p.Address,
                                            Description = p.Description,
                                            //Houses = (from a in p.Houses.Where(a=> a.isDeleted == false)
                                            //                  select new LYSAdmin.Model.Apartment{
                                            //                      ApartmentID = a.ApartmentID,
                                            //                      ApartmentName = a.ApartmentName,
                                            //                      Blocks = (from b in a.Blocks.Where(b => b.IsDefault == false)
                                            //                                select new LYSAdmin.Model.Block
                                            //                                {
                                            //                                    BlockID = b.BlockID,
                                            //                                    BlockName = b.BlockName
                                            //                                }).ToList()
                                            //                  }).ToList(),
                                         }).ToList();
            return allPGs;
        }

        public int AddHostel(PGDetail pgDetail)
        {
            var dbPGDetail = Mapper.Map<LYSAdmin.Model.PGDetail, LYSAdmin.Data.DBEntity.PGDetail>(pgDetail);//Converting Model.Apartment to Data.Apartment
            pgDetailRepository.Insert(dbPGDetail);//Inserting new lead
            return unitOfWork.SaveChanges();//Saving the changes to DB
        }

        public int UpdateHostel(LYSAdmin.Model.PGDetailsViewModel pgDetailsViewModel)
        {
            var dbPGDetail = (from p in pgDetailRepository.Where(x => x.PGDetailID == pgDetailsViewModel.PGDetail.PGDetailID)
                               select p).FirstOrDefault();
            if (dbPGDetail != null)
            {
                dbPGDetail.PGName = pgDetailsViewModel.PGDetail.PGName;
                dbPGDetail.Landmark = pgDetailsViewModel.PGDetail.Landmark;
                dbPGDetail.Description = pgDetailsViewModel.PGDetail.Description;
                dbPGDetail.Latitude = pgDetailsViewModel.PGDetail.Latitude;
                dbPGDetail.Longitude = pgDetailsViewModel.PGDetail.Longitude;
                dbPGDetail.Address = pgDetailsViewModel.PGDetail.Address;
                pgDetailRepository.Update(dbPGDetail);

                return unitOfWork.SaveChanges();
            }
            else
            {
                return 0;
            }
        }

        public LYSAdmin.Model.PGDetail GetHostelByID(int pgDetailID)
        {

            var pgDetail = (from p in pgDetailRepository.Where(x => x.PGDetailID == pgDetailID)
                            select new LYSAdmin.Model.PGDetail
                            {
                                PGDetailID = p.PGDetailID,
                                PGName = p.PGName,
                                AreaID = p.AreaID,
                                Description = p.Description,
                                Address = p.Address,
                                IsPg = p.IsPg,
                                Landmark = p.Landmark,
                                Latitude = p.Latitude,
                                Longitude = p.Longitude,
                                Status = p.Status,
                                UserID = p.UserID,
                                CreatedBy = p.CreatedBy
                            }).FirstOrDefault();
                                
            return pgDetail;

        }

        //int DeleteHostel(string PGDetailID)
        //{
        //    var dbPGDetail = (from p in pgDetailRepository.Where(x => x.PGDetailID == pgDetailsViewModel.PGDetail.PGDetailID)
        //                      select p).FirstOrDefault();
        //    if (dbPGDetail != null)
        //    {
        //       // dbPGDetail.d
        //    }
        //}
    }
}
