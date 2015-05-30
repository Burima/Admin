using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    class EstateViewModels
    {
    }
    public class ApartmentViewModel
    {
        public Apartment Apartment { get; set; }
        public List<Apartment> Apartments { get; set; }
    }

    public class HouseViewModel
    {
        public House House { get; set; }
        public List<House> Houses { get; set; }
        public List<Apartment> Apartments { get; set; }
    }
}
