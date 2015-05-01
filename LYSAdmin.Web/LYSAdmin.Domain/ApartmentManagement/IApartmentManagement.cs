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
    }
}
