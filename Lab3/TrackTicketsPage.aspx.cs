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
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewNotesBtn_Click(object sender, EventArgs e)
        {
            String sqlQuery = "SELECT ServiceTicket.ServiceTicketName, TicketHistory.TicketDateChanged, TicketHistory.TicketMovingStatus, TicketHistory.NoteHeading, " +
               "TicketHistory.NoteContents, Employee.EmployeeName from ((TicketHistory Left Outer Join ServiceTicket on TicketHistory.ServiceTicketID = ServiceTicket.ServiceTicketID) left outer join Employee on TicketHistory.EmployeeID = Employee.EmployeeID)" +
               "where TicketHistory.ServiceTicketID = " + DropDownListHistory.SelectedValue;

            SqlConnection sqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnection);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            grdServiceReults.DataSource = dtForGridView;
            grdServiceReults.DataBind();
        }
    }
}