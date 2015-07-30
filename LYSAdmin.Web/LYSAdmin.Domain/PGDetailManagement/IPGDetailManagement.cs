using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Domain.PGDetailManagement
{
    public interface IPGDetailManagement
    {
        List<Model.PGDetail> GetPGsByOwnerIDandAreaID(int OwnerID, int AreaID);
    }
}
