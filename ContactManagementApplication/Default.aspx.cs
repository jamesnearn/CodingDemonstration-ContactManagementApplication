using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ContactManagementApplication
{
    public partial class Default1 : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // instructions say to let anything in!
            Response.Redirect("ContactsList.aspx");
        }
    }
}