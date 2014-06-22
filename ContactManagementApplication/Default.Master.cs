using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ContactManagementApplication
{
    public partial class Default : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreRender(EventArgs e)
        {
            hypContactsList.Visible = (Session["UserID"] != null);
            hypLogout.Visible = (Session["UserID"] != null);
            base.OnPreRender(e);
        }
    }
}