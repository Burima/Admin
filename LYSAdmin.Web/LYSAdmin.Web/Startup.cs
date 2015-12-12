using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LYSAdmin.Web.Startup))]
namespace LYSAdmin.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
