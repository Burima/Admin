using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LYSAdmin.Model
{
    public class PGDetail
    {
        public int PGdetailID { get; set; }
        public string PGName { get; set; }
        public int AreaID { get; set; }
        public int OwnerID { get; set; }

        public virtual Area Area { get; set; }
        public virtual User User { get; set; }
    }
}
