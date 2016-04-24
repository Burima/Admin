using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LYSAdmin.Model;

namespace LYSAdmin.Domain.RoomManagement
{
    public interface IRoomManagement
    {
        IList<PGDetail> GetHousesByOwnerIDAndAreaID(long OwnerID, int AreaID);

        int AddRoom(RoomViewModel roomViewModel);
    }
}
