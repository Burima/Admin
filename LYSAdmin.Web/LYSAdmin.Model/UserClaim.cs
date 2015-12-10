using Microsoft.AspNet.Identity.EntityFramework;

namespace LYSAdmin.Model
{
    public class UserClaim : IdentityUserClaim<long>
    {

        public virtual User User { get; set; }
    }
}
