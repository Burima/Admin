using AutoMapper;
using LYSAdmin.Data.DBRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Domain.BlockManagement
{
    public class BlockManagement : IBlockManagement
    {
        private IUnitOfWork unitOfWork = null;
        private IBaseRepository<Data.DBEntity.Block> blockRepository = null;
        public BlockManagement()
        {
            unitOfWork = new UnitOfWork();
            blockRepository = new BaseRepository<Data.DBEntity.Block>(unitOfWork);

            Mapper.CreateMap<LYSAdmin.Model.Block, LYSAdmin.Data.DBEntity.Block>();
        }

        public int SaveBlocks(List<LYSAdmin.Model.Block> blocks)
        {
            foreach (var block in blocks)
            {
                var dbblock = Mapper.Map<LYSAdmin.Model.Block, LYSAdmin.Data.DBEntity.Block>(block);
                dbblock.LastUpdatedOn = DateTime.Now;
                dbblock.Status = true;
                if (dbblock.BlockID <= 0)
                {
                    blockRepository.Insert(dbblock);
                }
                else
                {
                    blockRepository.Update(dbblock);
                }
            }

            return unitOfWork.SaveChanges();
        }
    }
}
