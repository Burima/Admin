using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LYSAdmin.Data.DBEntity;
using LYSAdmin.Model;

namespace LYSAdmin.Domain.UserManagement
{
    public interface IUserManagement
    {
        Model.User ValidateUser(Model.LoginViewModel user);
    }
}
