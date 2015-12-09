using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class AccountViewModels
    {
    }

    public class LoginViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "User Name")]
        public string Username { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }
       
    }

    public class UserViewModel
    {
        public User User { get; set; }

        public UserDetail UserDetail { get; set; }

    }
}
