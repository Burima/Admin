using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LYSAdmin.Model;

namespace LYSAdmin.Domain.PGDetailManagement
{
    public interface IPGDetailManagement
    {
        List<Model.PGDetail> GetPGsByOwnerIDandAreaID(long OwnerID, int AreaID);

        int AddHostel(PGDetail pgDetail);
    }
}
