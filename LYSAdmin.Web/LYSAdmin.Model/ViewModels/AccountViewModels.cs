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
        public long UserID { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool IsBackGroundVerified { get; set; }
        public string ProfilePicture { get; set; }
        public Nullable<int> Gender { get; set; }
        public string Email { get; set; }
        public bool EmailConfirmed { get; set; }
        public string PhoneNumber { get; set; }
        public bool PhoneNumberConfirmed { get; set; }
        public string PresentAddress { get; set; }
        public string PermanentAddress { get; set; }
        public int GovtIDType { get; set; }
        public string GovtID { get; set; }
        public int UserProfession { get; set; }
        public string CurrentEmployer { get; set; }
        public string OfficeLocation { get; set; }
        public string EmployeeID { get; set; }
        public string HighestEducation { get; set; }
        public string InstitutionName { get; set; }
        public int Status { get; set; }

        public Nullable<System.DateTime> LastUpdatedOn { get; set; }

    }
}
