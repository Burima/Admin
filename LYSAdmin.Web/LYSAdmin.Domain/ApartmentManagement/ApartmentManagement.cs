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
        private IBaseRepository<Data.DBEntity.Block> blockRepository = null;
        public ApartmentManagement()
        {
            unitOfWork = new UnitOfWork();
            apartmentRepository = new BaseRepository<Data.DBEntity.Apartment>(unitOfWork);//Initializing apartmentRepository through BaseRepository
            blockRepository = new BaseRepository<Data.DBEntity.Block>(unitOfWork);

            Mapper.CreateMap<LYSAdmin.Model.Apartment, LYSAdmin.Data.DBEntity.Apartment>();
        }

        public IList<Model.Apartment> GetApartments(int OwnerID)
        {
            IList<Model.Apartment> apartments = (from p in apartmentRepository.Get(p => p.IsDeleted == false //&& p.OwnerID==OwnerID /****commented due to identity or DB update****/
                                                     ,q=>q.OrderByDescending(p=>p.LastUpdatedOn))
                                                 select new Model.Apartment
                                                        {
                                                            ApartmentID=p.ApartmentID,
                                                            ApartmentName=p.ApartmentName,
                                                            HouseNo=p.HouseNo,
                                                            Description=p.Description,
                                                            LastUpdatedOn=p.LastUpdatedOn,
                                                            Blocks = (from g in p.Blocks
                                                                      select new LYSAdmin.Model.Block
                                                                      {
                                                                          BlockID=g.BlockID,
                                                                          BlockName=g.BlockName
                                                                      }).ToList()
                                                        }).ToList();


            return apartments;
        }

        /// <summary>
        /// Adding new Apartment
        /// </summary>
        /// <param name="apartment"></param>
        /// <returns></returns>
        public int AddApartment(Apartment apartment)
        {
            var dbApartment = Mapper.Map<LYSAdmin.Model.Apartment, LYSAdmin.Data.DBEntity.Apartment>(apartment);//Converting Model.Apartment to Data.Apartment
            apartmentRepository.Insert(dbApartment);//Inserting new lead
            return unitOfWork.SaveChanges();//Saving the changes to DB
        }

        public LYSAdmin.Model.Apartment GetApartmentByID(int apartmentID)
        {

            var apartment = (from p in apartmentRepository.Where(x => x.ApartmentID == apartmentID)
                             select new LYSAdmin.Model.Apartment
                             {
                                 ApartmentID = p.ApartmentID,
                                 ApartmentName = p.ApartmentName,
                                 HouseNo = p.HouseNo,
                                 Description = p.Description,
                                 // AreaID=p.AreaID,  /****commented due to identity or DB update****/
                                 CreatedOn=p.CreatedOn,
                                 CreatedBy=p.CreatedBy,
                                 //OwnerID=p.OwnerID,  /****commented due to identity or DB update****/
                                 LastUpdatedOn = p.LastUpdatedOn,
                                 Blocks = (from g in p.Blocks
                                           select new LYSAdmin.Model.Block
                                           {
                                               BlockID = g.BlockID,
                                               BlockName = g.BlockName
                                           }).ToList()
                             }).FirstOrDefault();
            return apartment;                              

        }

        public int UpdateApartment(LYSAdmin.Model.ApartmentViewModel apartmentViewModel)
        {
            var dbApartment = (from p in apartmentRepository.Where(x => x.ApartmentID == apartmentViewModel.Apartment.ApartmentID)                                   
                                select p).FirstOrDefault();
            if (dbApartment != null)
            {
                dbApartment.ApartmentName = apartmentViewModel.Apartment.ApartmentName;
                dbApartment.HouseNo = apartmentViewModel.Apartment.HouseNo;
                dbApartment.Description = apartmentViewModel.Apartment.Description;
                dbApartment.LastUpdatedOn = DateTime.Now;
                apartmentRepository.Update(dbApartment);

                return unitOfWork.SaveChanges();
            }
            else
            {
                return 0;
            }
        }

        /// <summary>
        /// this method is for getting all the apartments by a specific area
        /// </summary>
        /// <param name="OwnerID">Apartments will be Owner specific</param>
        /// <param name="AreaID">Apartments will be Area specific</param>
        /// <returns>IList of apartment</returns>
        public IList<Model.Apartment> GetApartmentsByAreaID(int OwnerID,int AreaID)
        {
            IList<Model.Apartment> apartments = (from p in apartmentRepository.Get(p => p.IsDeleted == false //&& p.OwnerID == OwnerID && p.AreaID==AreaID  /****commented due to identity or DB update****/ 
                                                     , q => q.OrderByDescending(p => p.LastUpdatedOn))
                                                 select new Model.Apartment
                                                 {
                                                     ApartmentID = p.ApartmentID,
                                                     ApartmentName = p.ApartmentName,
                                                     HouseNo = p.HouseNo,
                                                     Description = p.Description,
                                                     LastUpdatedOn = p.LastUpdatedOn,
                                                     Blocks = (from g in p.Blocks
                                                               select new LYSAdmin.Model.Block
                                                               {
                                                                   BlockID = g.BlockID,
                                                                   BlockName = g.BlockName
                                                               }).ToList()
                                                 }).ToList();


            return apartments;
        }
    }
}
