using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class Activities : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void customerLnkBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("AddCustomerPage.aspx");

        }

        protected void serviceLnkBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("AddServicePage.aspx");

        }

        protected void Ticket_Click(object sender, EventArgs e)
        {

            Response.Redirect("ViewInfoPage.aspx");

        }

        protected void TicketHistory_Click(object sender, EventArgs e)
        {

            Response.Redirect("TicketPage.aspx");

        }

        protected void createNewTicket_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateNewTicketPage.aspx");

        }

        protected void updateTicket_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditTicketPage.aspx");
        }

        protected void allTicketHistoryUpdates_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrackTicketsPage.aspx");
        }

        protected void auctionBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AuctionPage.aspx");
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("LoginPage.aspx");
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            statusLbl2.Text = String.Empty;
            statusLbl3.Text = String.Empty;
            string sqlQuery = "Select Customer.CustomerName, ServiceTicket.ServiceTicketName, " +
            "ServiceTicket.TicketStatus, ServiceTicket.TicketStartDate, " +
            "Service_T.ServiceType, Service_T.ServiceDescription, TicketHistory.NoteHeading, " +
            "TicketHistory.NoteContents from Customer inner join ServiceTicket on Customer.CustomerID = " +
            "ServiceTicket.CustomerID inner join Service_T on ServiceTicket.ServiceID = Service_T.ServiceID inner join TicketHistory on ServiceTicket.ServiceTicketID = TicketHistory.ServiceTicketID " +
            "WHERE Customer.CustomerName LIKE '%" + searchTxtBox.Text + "%'";

            SqlConnection sqlConnect = new
            SqlConnection("Server=localhost;Database=Lab3;Trusted_Connection=Yes;");
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable dtforGridview = new DataTable();
            sqlAdapter.Fill(dtforGridview);
            searchForCustGrd.DataSource = dtforGridview;
            searchForCustGrd.DataBind();

            int rowCount = searchForCustGrd.Rows.Count;
            searchForCustGrd.DataBind();
            rowCount = searchForCustGrd.Rows.Count;

            if (rowCount == 0)
            {
                statusLbl.Text = String.Empty;

                statusLbl.Text = "The user you have typed has either not yet been through the entire ticket process or does not exist. You can check for existence using the other button.";
            }
        }

        protected void srchBtn_Click(object sender, EventArgs e)
        {
            statusLbl.Text = String.Empty;
            string sqlQuery = "Select Customer.CustomerName, Customer.CustomerEmail, Customer.CustomerPhone from Customer WHERE Customer.CustomerName LIKE '%" + searchTxtBox.Text + "%'";

            SqlConnection sqlConnect = new
            SqlConnection("Server=localhost;Database=Lab3;Trusted_Connection=Yes;");
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable dtforGridview = new DataTable();
            sqlAdapter.Fill(dtforGridview);
            searchForCustGrd.DataSource = dtforGridview;
            searchForCustGrd.DataBind();

            int rowCount = searchForCustGrd.Rows.Count;
            searchForCustGrd.DataBind();
            rowCount = searchForCustGrd.Rows.Count;

            if (rowCount <= 0)
            {
                statusLbl.Text = String.Empty;
                statusLbl3.Text = String.Empty;
                statusLbl3.Text = "Customer does not exist.";
            }
            else
            {
                statusLbl.Text = String.Empty;
                statusLbl2.Text = String.Empty;
                statusLbl2.Text = "Customer exists.";
            }
        }

        protected void viewNotifications_Click(object sender, EventArgs e)
        {
            string sqlQuery = "Select EmailRequest as 'User', ServiceType as 'Service', R_Date as 'Date Generated', R_Description as 'Description' from Request";

            SqlConnection sqlConnect = new
            SqlConnection("Server=localhost;Database=Lab3;Trusted_Connection=Yes;");
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable dtforGridView = new DataTable();
            sqlAdapter.Fill(dtforGridView);
            searchForCustGrd.DataSource = dtforGridView;
            searchForCustGrd.DataBind();
        }
    }
}