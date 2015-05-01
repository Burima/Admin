using LYSAdmin.Data.DBRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using LYSAdmin.Model;

namespace LYSAdmin.Domain.ApartmentManagement
{
    public class ApartmentManagement:IApartmentManagement
    {
        private IUnitOfWork unitOfWork = null;
        private IBaseRepository<Data.DBEntity.Apartment> apartmentRepository = null;        
        public ApartmentManagement()
        {
            unitOfWork = new UnitOfWork();
            apartmentRepository = new BaseRepository<Data.DBEntity.Apartment>(unitOfWork);//Initializing apartmentRepository through BaseRepository
            Mapper.CreateMap<LYSAdmin.Model.Apartment, LYSAdmin.Data.DBEntity.Apartment>();
        }
        public int AddApartment(Apartment apartment)
        {
            var dbApartment = Mapper.Map<LYSAdmin.Model.Apartment, LYSAdmin.Data.DBEntity.Apartment>(apartment);//Converting Model.Apartment to Data.Apartment
            apartmentRepository.Insert(dbApartment);//Inserting new lead
            return unitOfWork.SaveChanges();//Saving the changes to DB
            
        }
    }
}
