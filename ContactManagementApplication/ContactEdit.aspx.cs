using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ContactManagementApplication
{
    public partial class ContactEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreRender(EventArgs e)
        {
            pnlID.Visible = (lblID.Text.Length > 0);
            pnlDateCreated.Visible = (lblDateCreated.Text.Length > 0);
            pnlDateModified.Visible = (lblDateModified.Text.Length > 0);
            base.OnPreRender(e);
        }
    }
}