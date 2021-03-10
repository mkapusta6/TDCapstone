using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLoadCustomerData_Click(object sender, EventArgs e)
        {
            String sqlQuery = "Select CustomerFirstName, CustomerLastName, CustomerEmail, CustomerPhone," +
                " CustomerState, CustomerCity, CustomerZip from Customer where Customer.CustomerID = " + ddlCustomerList.SelectedValue;

            SqlConnection sqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnection);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            grdServiceReults.DataSource = dtForGridView;
            grdServiceReults.DataBind();
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            String sqlQuery = "Select CustomerFirstName, CustomerLastName, CustomerEmail, CustomerPhone, CustomerState, CustomerCity, CustomerZip from Customer";
         
            SqlConnection sqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnection);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            grdServiceReults.DataSource = dtForGridView;
            grdServiceReults.DataBind();
        }

        protected void btnShowServices_Click(object sender, EventArgs e)
        {
            String sqlQuery = "Select * FROM Service_T";

            SqlConnection sqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnection);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            grdServiceReults.DataSource = dtForGridView;
            grdServiceReults.DataBind();
        }
    }
}