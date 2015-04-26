using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LYSAdmin.Data.DBEntity;
using LYSAdmin.Data.DBRepository;
using LYSAdmin.Model;
using AutoMapper;

namespace LYSAdmin.Domain.UserManagement
{
    public class UserManagement : IUserManagement
    {
        private IUnitOfWork unitOfWork = null;
        private IBaseRepository<Data.DBEntity.User> userRepository=null;        

        public UserManagement()
        {
            unitOfWork = new UnitOfWork();
            userRepository = new BaseRepository<Data.DBEntity.User>(unitOfWork);//Initializing userRepository through BaseRepository

            Mapper.CreateMap<Data.DBEntity.User, Model.User>();//Initilizing Mapper S:Data.DBEntity.User, D:Model.User
            Mapper.CreateMap<Model.User, Data.DBEntity.User>();
        }
        public Model.User ValidateUser(Model.LoginViewModel user)
        {
            var userDeatils = userRepository.FirstOrDefault(m => m.Username==user.Username & m.Password==user.Password);//Check in DB through repository
            Model.User modelUser = new Model.User();

            if(userDeatils!=null)
            {
                modelUser = Mapper.Map<Data.DBEntity.User, Model.User>(userDeatils);//Converting Data.DBEntity.User to Model.User
            }

            return modelUser;
        }
    }
}
