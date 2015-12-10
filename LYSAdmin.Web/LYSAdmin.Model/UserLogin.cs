using Microsoft.AspNet.Identity.EntityFramework;
namespace LYSAdmin.Model
{
    public class UserLogin : IdentityUserLogin<long>
    {
        public virtual User User { get; set; }
    }
}
