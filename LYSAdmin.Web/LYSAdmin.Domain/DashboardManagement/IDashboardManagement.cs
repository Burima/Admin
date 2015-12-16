using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LYSAdmin.Model;

namespace LYSAdmin.Domain.DashboardManagement
{
    public interface IDashboardManagement
    {
        DonughtChart GetDonught(long OwnerID);
    }
}
