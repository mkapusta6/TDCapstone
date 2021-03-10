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
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewTicketBtn_Click(object sender, EventArgs e)
        {
            String sqlQuery = "Select ServiceTicket.TicketStatus, ServiceTicket.TicketStartDate, " +
                "Customer.CustomerName, Customer.CustomerPhone, Employee.EmployeeName" +
                " from ServiceTicket INNER JOIN Customer on ServiceTicket.CustomerID = Customer.CustomerID inner join Employee on ServiceTicket.EmployeeID = Employee.EmployeeID where ServiceTicket.ServiceTicketID = " + serviceDDL.SelectedValue;

            
            SqlConnection sqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnection);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            grdServiceReults.DataSource = dtForGridView;
            grdServiceReults.DataBind();
        }

        protected void viewAllTicketsBtn_Click(object sender, EventArgs e)
        {
            String sqlQuery = "Select ServiceTicket.ServiceTicketName, ServiceTicket.TicketStatus," +
                " ServiceTicket.TicketStartDate, Customer.CustomerName, Customer.CustomerPhone, Employee.EmployeeName " +
                "from ((ServiceTicket inner join Customer on ServiceTicket.CustomerID = Customer.CustomerID) inner join Employee on ServiceTicket.EmployeeID = Employee.EmployeeID)";
            
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            grdServiceReults.DataSource = dtForGridView;
            grdServiceReults.DataBind();
        }
    }
}