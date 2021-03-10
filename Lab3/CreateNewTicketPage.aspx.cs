using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                tcktStatusDropDownList.Items.Add(new ListItem("New"));
                tcktStatusDropDownList.Items.Add(new ListItem("In Progress"));
                tcktStatusDropDownList.Items.Add(new ListItem("Completed"));

            }
        }

        protected void popBtn_Click(object sender, EventArgs e)
        {
            ticketStrtTxtBox.Text = "02/28/2021";
            tcktNameTxtBox.Text = "Test Ticket";
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            ticketStrtTxtBox.Text = String.Empty;
            tcktNameTxtBox.Text = String.Empty;
        }

        protected void createSrvcTckt_Click(object sender, EventArgs e)
        {
            ticketStrtTxtBox.Text = HttpUtility.HtmlEncode(ticketStrtTxtBox.Text);
            tcktNameTxtBox.Text = HttpUtility.HtmlEncode(tcktNameTxtBox.Text);
            ticketStrtTxtBox.Text = DateTime.Now.ToString();

            String DBConnection;
            DBConnection = WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString;
            using (SqlConnection myConection = new SqlConnection(DBConnection))
            {
                SqlCommand Mycommand = new SqlCommand("INSERT INTO ServiceTicket(TicketStatus, TicketStartDate, CustomerID, ServiceID, EmployeeID, ServiceTicketName)" +
                    " VALUES (@TicketStatus, @TicketStartDate, @CustomerID, @ServiceID, @EmployeeID, @ServiceTicketName)", myConection);

                int CustomerID = int.Parse(custDropDownList.SelectedValue);
                int ServiceID = int.Parse(srvcDropDownList.SelectedValue);
                int EmployeeID = int.Parse(empDropDownList.SelectedValue);

                Mycommand.Parameters.AddWithValue("@TicketStatus", tcktStatusDropDownList.SelectedValue);
                Mycommand.Parameters.AddWithValue("@TicketStartDate", ticketStrtTxtBox.Text);
                Mycommand.Parameters.AddWithValue("@CustomerID", custDropDownList.SelectedValue);
                Mycommand.Parameters.AddWithValue("@ServiceID", srvcDropDownList.SelectedValue);
                Mycommand.Parameters.AddWithValue("@EmployeeID", empDropDownList.SelectedValue);
                Mycommand.Parameters.AddWithValue("@ServiceTicketName", tcktNameTxtBox.Text);

                myConection.Open();
                Mycommand.ExecuteNonQuery();
                myConection.Close();

                ticketStrtTxtBox.Text = String.Empty;
                tcktNameTxtBox.Text = String.Empty;
                addedLbl.Text = "Ticket Successfully Created";
            }
        }
    }
}