using LYSAdmin.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Domain.HouseManagement
{
    public interface IHouseManagement
    {
        IList<Model.House> GetHouses(int OwnerID);
        Model.House GetHouseByID(int LinkTypeID);
        int AddHouse(HouseViewModel house);
    }
}
