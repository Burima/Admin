using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class PgInfo
    {
        public int PgInfoID { get; set; }
        public string Name { get; set; }
        public int AreaID { get; set; }
        public int OwnerID { get; set; }

        public virtual Area Area { get; set; }
        public virtual User User { get; set; }
    }
}
