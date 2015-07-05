using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Domain.StaticContentManagement
{
    interface IStaticContentManagement
    {
        IList<Model.City> GetAllCities();
        IList<Model.Area> GetAllAreas();
    }
}
