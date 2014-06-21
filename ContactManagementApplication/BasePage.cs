using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ContactManagementApplication
{
    public class BasePage : System.Web.UI.Page
    {
        public string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["dbCMA"].ConnectionString;
            }
        }

        public SqlCommand ProcCmd(string procName)
        {
            SqlCommand cmd = new SqlCommand(procName, new SqlConnection(ConnectionString));
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 300;
            return cmd;
        }

        public DataTable GetDataTable(SqlCommand cmd)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            cmd.Connection.Open();
            adapter.Fill(dt);

            if (cmd.Connection.State != ConnectionState.Closed)
                cmd.Connection.Close();

            cmd.Dispose();
            return dt;
        }
    }
}