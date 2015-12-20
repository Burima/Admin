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
                                            Description = p.Description
                                         }).ToList();
            return allPGs;
        }

        public int AddHostel(PGDetail pgDetail)
        {
            var dbPGDetail = Mapper.Map<LYSAdmin.Model.PGDetail, LYSAdmin.Data.DBEntity.PGDetail>(pgDetail);//Converting Model.Apartment to Data.Apartment
            pgDetailRepository.Insert(dbPGDetail);//Inserting new lead
            return unitOfWork.SaveChanges();//Saving the changes to DB
        }
    }
}
