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
        IList<Model.Apartment> GetApartmentsbyPGID(int PGDetailID);

        LYSAdmin.Model.Apartment GetApartmentByID(int apartmentID);

        int UpdateApartment(LYSAdmin.Model.ApartmentViewModel apartmentViewModel);

        ApartmentViewModel GetApartmentsByAreaID(long OwnerID, int AreaID);
    }
}
