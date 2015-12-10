using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    class UserLogin
    {
        public string LoginProvider { get; set; }
        public string ProviderKey { get; set; }
        public long UserID { get; set; }

        public virtual User User { get; set; }
    }
}
