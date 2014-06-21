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
                    SqlCommand cmd = SqlCmd("select * from contacts where ContactID = @ContactID");
                    cmd.Parameters.AddWithValue("@ContactID", ContactID).DbType = DbType.Int32;
                    DataTable dt = GetDataTable(cmd);

                    if (dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        txtFirstName.Text = (string)dr["FirstName"];
                        txtLastName.Text = (string)dr["LastName"];
                        txtAddress1.Text = (string)dr["Address1"];
                        txtAddress2.Text = (string)dr["Address2"];
                        txtCity.Text = (string)dr["City"];
                        txtState.Text = (string)dr["State"];
                        txtZip.Text = (string)dr["Zip"];
                        chkIsActive.Checked = (bool)dr["IsActive"];
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
            if (Request.QueryString["ContactID"] != null)
            {
                int ContactID = int.Parse(Request.QueryString["ContactID"]);
                cmd.Parameters.AddWithValue("@ContactID", ContactID).DbType = System.Data.DbType.Int32;
            }
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