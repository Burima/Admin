using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LYSAdmin.Data.DBEntity;
using LYSAdmin.Data.DBRepository;
using LYSAdmin.Model;
using AutoMapper;
using System.Collections;

namespace LYSAdmin.Domain.UserManagement
{
    public class UserManagement : IUserManagement
    {
        private IUnitOfWork unitOfWork = null;
        private IBaseRepository<Data.DBEntity.User> userRepository = null;
        private IBaseRepository<Data.DBEntity.UserDetail> userDetailRepository = null;

        public UserManagement()
        {
            unitOfWork = new UnitOfWork();
            userRepository = new BaseRepository<Data.DBEntity.User>(unitOfWork);//Initializing userRepository through BaseRepository
            userDetailRepository = new BaseRepository<Data.DBEntity.UserDetail>(unitOfWork);//Initializing userRepository through BaseRepository
            Mapper.CreateMap<Data.DBEntity.User, Model.User>();//Initilizing Mapper S:Data.DBEntity.User, D:Model.User
            Mapper.CreateMap<Model.User, Data.DBEntity.User>();
        }
        public Model.User ValidateUser(Model.LoginViewModel user)
        {
            var userDeatils = userRepository.FirstOrDefault(m => m.Username == user.Username & m.Password == user.Password);//Check in DB through repository
            Model.User modelUser = new Model.User();

            if (userDeatils != null)
            {
                modelUser = ConvertUserDBtoModel(userDeatils);//Converting Data.DBEntity.User to Model.User

            }

            return modelUser;
        }

        //convert from db to model
        private Model.User ConvertUserDBtoModel(Data.DBEntity.User dbUser)
        {
            Model.User modelUser = new Model.User();
            modelUser.UserID = dbUser.UserID;
            modelUser.FirstName = dbUser.FirstName;
            modelUser.LastName = dbUser.LastName;
            modelUser.Username = dbUser.Username;
            modelUser.Password = dbUser.Password;
            modelUser.Sex = dbUser.Sex;
            modelUser.RoleID = dbUser.RoleID;
            modelUser.MobileNumber = dbUser.MobileNumber;
            modelUser.IsBackGroundVerified = dbUser.IsBackGroundVerified;
            modelUser.CreatedBy = dbUser.CreatedBy;
            modelUser.CreatedOn = dbUser.CreatedOn;
            modelUser.LastUpdatedOn = dbUser.LastUpdatedOn;
            modelUser.Status = dbUser.Status;
            modelUser.Photo = dbUser.Photo;
            modelUser.UserDetails = (from p in userDetailRepository.Get(p => p.UserID == dbUser.UserID)
                                     select new Model.UserDetail
                                     {

                                     }).ToList();//Check in DB through repository
            return modelUser;
        }

    }
}
