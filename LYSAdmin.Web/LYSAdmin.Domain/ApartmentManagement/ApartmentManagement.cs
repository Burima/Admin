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
        private IBaseRepository<Data.DBEntity.PGDetail> pgDetailRepository = null;
        public ApartmentManagement()
        {
            unitOfWork = new UnitOfWork();
            apartmentRepository = new BaseRepository<Data.DBEntity.Apartment>(unitOfWork);//Initializing apartmentRepository through BaseRepository
            blockRepository = new BaseRepository<Data.DBEntity.Block>(unitOfWork);
            pgDetailRepository = new BaseRepository<Data.DBEntity.PGDetail>(unitOfWork);
            Mapper.CreateMap<LYSAdmin.Model.Apartment, LYSAdmin.Data.DBEntity.Apartment>();
        }

       /********non-used method***********/
        public IList<Model.Apartment> GetApartmentsbyPGID(int PGDetailID)
        {
            IList<Model.Apartment> apartments = (from p in apartmentRepository.Get(p => p.IsDeleted == false && p.PGDetailID == PGDetailID
                                                     ,q=>q.OrderByDescending(p=>p.LastUpdatedOn)) 
                                                 select new Model.Apartment
                                                        {
                                                            ApartmentID=p.ApartmentID,
                                                            ApartmentName=p.ApartmentName,
                                                            HouseNo=p.HouseNo,
                                                            Description=p.Description,
                                                            LastUpdatedOn=p.LastUpdatedOn,
                                                            Blocks = (from g in p.Blocks.Where(g=> g.IsDefault == false)
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
                                 CreatedOn=p.CreatedOn,
                                 CreatedBy=p.CreatedBy,
                                 LastUpdatedOn = p.LastUpdatedOn,
                                 PGDetailID = p.PGDetailID,
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
                dbApartment.PGDetailID = apartmentViewModel.Apartment.PGDetailID;
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
        public ApartmentViewModel GetApartmentsByAreaID(long OwnerID,int AreaID)
        {
            ApartmentViewModel apartmentViewModel = new ApartmentViewModel();
            apartmentViewModel.PGDetails = (from p in pgDetailRepository.Get(p => p.UserID == OwnerID && p.AreaID == AreaID, q => q.OrderByDescending(p => p.PGName))
                                             select new Model.PGDetail
                                             {
                                                 PGDetailID = p.PGDetailID,
                                                 PGName = p.PGName,
                                                 AreaID = p.AreaID,
                                                 UserID = p.UserID,
                                                 Landmark = p.Landmark,
                                                 Latitude = p.Latitude,
                                                 Longitude = p.Longitude,
                                                 Address = p.Address,
                                                 Description = p.Description,

                                                 Apartments = (from a in p.Apartments.Where(a => a.IsDefault == false)
                                                               select new LYSAdmin.Model.Apartment
                                                               {
                                                                   ApartmentID = a.ApartmentID,
                                                                   ApartmentName = a.ApartmentName,
                                                                   HouseNo = a.HouseNo,
                                                                   Description = a.Description,
                                                                   LastUpdatedOn = a.LastUpdatedOn,
                                                                   PGDetail = (from h in pgDetailRepository.Get(h => h.PGDetailID == p.PGDetailID)
                                                                     select new Model.PGDetail
                                                                     {
                                                                        PGName = h.PGName
                                                                    }).FirstOrDefault(),
                                                                   Blocks = (from b in a.Blocks.Where(g => g.IsDefault == false)
                                                                             select new LYSAdmin.Model.Block
                                                                             {
                                                                                 BlockID = b.BlockID,
                                                                                 BlockName = b.BlockName
                                                                             }).ToList()
                                                               }).ToList(),
                                             }).ToList();

            return apartmentViewModel;
        }
    }
}
