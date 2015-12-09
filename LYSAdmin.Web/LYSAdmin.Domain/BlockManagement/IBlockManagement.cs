using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Domain.BlockManagement
{
    public interface IBlockManagement
    {
        int SaveBlocks(List<LYSAdmin.Model.Block> blocks);
    }
}
