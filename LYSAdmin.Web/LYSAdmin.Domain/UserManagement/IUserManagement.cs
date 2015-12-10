using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LYSAdmin.Model;

namespace LYSAdmin.Domain.UserManagement
{
    public interface IUserManagement
    {
        /****commented due to identity or DB update****/
     //   Model.User ValidateUser(Model.LoginViewModel user);
        int UpdateUser(UserViewModel userViewModel);
    }
}
