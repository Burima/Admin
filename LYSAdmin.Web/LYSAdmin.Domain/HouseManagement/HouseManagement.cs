using LYSAdmin.Data.DBRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
    }
}
