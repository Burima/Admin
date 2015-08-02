using LYSAdmin.Data.DBRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
        }
        //Get All the PGs filter by Owner and Area for a session
        public List<Model.PGDetail> GetPGsByOwnerIDandAreaID(int OwnerID, int AreaID)
        {
            List<Model.PGDetail> allPGs = (from p in pgDetailRepository.Get(p => p.OwnerID == OwnerID && p.AreaID == AreaID, q => q.OrderByDescending(p => p.PGName))
                                         select new Model.PGDetail
                                         {
                                             PGDetailID = p.PGDetailID,
                                            PGName=p.PGName,
                                            AreaID=p.AreaID,
                                            OwnerID=p.OwnerID
                                         }).ToList();



            return allPGs;
        }
    }
}
