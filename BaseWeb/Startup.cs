using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BaseWeb.Startup))]
namespace BaseWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
