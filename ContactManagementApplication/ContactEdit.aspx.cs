using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ContactManagementApplication
{
    public partial class ContactEdit : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ContactID"] != null)
                {
                    int ContactID = int.Parse(Request.QueryString["ContactID"]);
                    {

                    }
                }
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            pnlID.Visible = (lblID.Text.Length > 0);
            pnlDateCreated.Visible = (lblDateCreated.Text.Length > 0);
            pnlDateModified.Visible = (lblDateModified.Text.Length > 0);
            base.OnPreRender(e);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = ProcCmd("spContactSave");
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text).DbType = System.Data.DbType.String;
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text).DbType = System.Data.DbType.String;
            cmd.Parameters.AddWithValue("@Address1", txtAddress1.Text).DbType = System.Data.DbType.String;
            cmd.Parameters.AddWithValue("@Address2", txtAddress2.Text).DbType = System.Data.DbType.String;
            cmd.Parameters.AddWithValue("@City", txtCity.Text).DbType = System.Data.DbType.String;
            cmd.Parameters.AddWithValue("@State", txtState.Text).DbType = System.Data.DbType.String;
            cmd.Parameters.AddWithValue("@Zip", txtZip.Text).DbType = System.Data.DbType.String;
            cmd.Parameters.AddWithValue("@IsActive", chkIsActive.Checked).DbType = System.Data.DbType.Boolean;
            DataTable dt = GetDataTable(cmd);
            Response.Redirect("ContactsList.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactsList.aspx");
        }
    }
}