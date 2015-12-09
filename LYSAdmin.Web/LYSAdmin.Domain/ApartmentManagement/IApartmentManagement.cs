using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LYSAdmin.Model;

namespace LYSAdmin.Domain.ApartmentManagement
{
    public interface IApartmentManagement
    {
        int AddApartment(Apartment apartmentViewModel);
        IList<Model.Apartment> GetApartments(int OwnerID);

        LYSAdmin.Model.Apartment GetApartmentByID(int apartmentID);

        int UpdateApartment(LYSAdmin.Model.ApartmentViewModel apartmentViewModel);

        IList<Model.Apartment> GetApartmentsByAreaID(int OwnerID, int AreaID);
    }
}
