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
    public partial class WebForm25 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                tcktStatusDropDownList.Items.Add(new ListItem("New"));
                tcktStatusDropDownList.Items.Add(new ListItem("In Progress"));
                tcktStatusDropDownList.Items.Add(new ListItem("Completed"));

                addServicesDDL.Items.Add(new ListItem("N/A"));
                addServicesDDL.Items.Add(new ListItem("Storage"));
                addServicesDDL.Items.Add(new ListItem("Cleaning"));
                addServicesDDL.Items.Add(new ListItem("Trash Removal"));




            }

            if (Application["CustomerInterest"] != null)
            {
                string customerInterest = Application["CustomerInterest"].ToString();
                serviceTxtBox.Text = customerInterest;
                serviceTypeLbl.Text = "Service Type: " + customerInterest;

            }

            if (Application["ServiceType"] != null)
            {
                string serviceType = Application["ServiceType"].ToString();
                serviceTypeTxtBox.Text = serviceType;
            }
        }

        protected void popBtn_Click(object sender, EventArgs e)
        {
            ticketStrtTxtBox.Text = "02/28/2021";
            tcktNameTxtBox.Text = "Test Ticket";
            date1TxtBox.Text = "03/20/2021";
            date2TxtBox.Text = "03/22/2021";
            lookAtTextBox.Text = "03/23/2021";
            bringInTextBox.Text = "03/24/2021";
            pickUpTextBox.Text = "03/21/2021";
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            ticketStrtTxtBox.Text = String.Empty;
            tcktNameTxtBox.Text = String.Empty;
            date1TxtBox.Text = String.Empty;
            date2TxtBox.Text = String.Empty;
            lookAtTextBox.Text = String.Empty;
            bringInTextBox.Text = String.Empty;
            pickUpTextBox.Text = String.Empty;
        }

        protected void createSrvcTckt_Click(object sender, EventArgs e)
        {
            ticketStrtTxtBox.Text = HttpUtility.HtmlEncode(ticketStrtTxtBox.Text);
            tcktNameTxtBox.Text = HttpUtility.HtmlEncode(tcktNameTxtBox.Text);
            ticketStrtTxtBox.Text = DateTime.Now.ToString();

            String DBConnection;
            DBConnection = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            using (SqlConnection myConection = new SqlConnection(DBConnection))
            {
                SqlCommand Mycommand = new SqlCommand("INSERT INTO ServiceTicket(TicketStatus, TicketStartDate, CustomerID, ServiceID, EmployeeID, ServiceTicketName, DateTimeOptionOne, DateTimeOptionTwo, LookAtDate, BringInDate, PickUpDate, AddServices, ServiceType)" +
                    " VALUES (@TicketStatus, @TicketStartDate, @CustomerID, @ServiceID, @EmployeeID, @ServiceTicketName, @DateTimeOptionOne, @DateTimeOptionTwo, @LookAtDate, @BringInDate, @PickUpDate, @AddServices, @ServiceType)", myConection);

                SqlCommand otherCommand = new SqlCommand("INSERT INTO Service_T (ServiceType, dateLastModified, " +
                       "ServiceDescription) Values (@ServiceType, @dateLastModified, @ServiceDescription)", myConection);

                int CustomerID = int.Parse(custDropDownList.SelectedValue);


                int ServiceID = int.Parse(srvcDropDownList.SelectedValue);


                int EmployeeID = int.Parse(empDropDownList.SelectedValue);

                Mycommand.Parameters.AddWithValue("@TicketStatus", tcktStatusDropDownList.SelectedValue);
                Mycommand.Parameters.AddWithValue("@TicketStartDate", ticketStrtTxtBox.Text);
                Mycommand.Parameters.AddWithValue("@CustomerID", custDropDownList.SelectedValue);
                Mycommand.Parameters.AddWithValue("@ServiceID", srvcDropDownList.SelectedValue);
                Mycommand.Parameters.AddWithValue("@EmployeeID", empDropDownList.SelectedValue);
                Mycommand.Parameters.AddWithValue("@ServiceTicketName", tcktNameTxtBox.Text);
                Mycommand.Parameters.AddWithValue("@DateTimeOptionOne", date1TxtBox.Text);
                Mycommand.Parameters.AddWithValue("@DateTimeOptionTwo", date2TxtBox.Text);
                Mycommand.Parameters.AddWithValue("@LookAtDate", lookAtTextBox.Text);
                Application["LookAtDate"] = lookAtTextBox.Text;
                Mycommand.Parameters.AddWithValue("@BringInDate", bringInTextBox.Text);
                Mycommand.Parameters.AddWithValue("@PickUpDate", pickUpTextBox.Text);
                Mycommand.Parameters.AddWithValue("@AddServices", addServicesDDL.SelectedValue);
                Mycommand.Parameters.AddWithValue("@ServiceType", serviceTypeTxtBox.Text);


                    otherCommand.Parameters.AddWithValue("@ServiceType", serviceTxtBox.Text);
                    Application["ServiceType"] = serviceTxtBox.Text;
                    otherCommand.Parameters.AddWithValue("@dateLastModified", dateLastModifiedTxtBox.Text);
                    otherCommand.Parameters.AddWithValue("@ServiceDescription", srvcDescriptionTxtBox.Text);
                    Application["ServiceDescription"] = srvcDescriptionTxtBox.Text;

                    myConection.Open();
                    Mycommand.ExecuteNonQuery();
                    otherCommand.ExecuteNonQuery();
                    //addedLbl.Text = "Service Successfully Created.";
                    myConection.Close();
            }

                ticketStrtTxtBox.Text = String.Empty;
                tcktNameTxtBox.Text = String.Empty;
                date1TxtBox.Text = String.Empty;
                date2TxtBox.Text = String.Empty;
                lookAtTextBox.Text = String.Empty;
                bringInTextBox.Text = String.Empty;
                pickUpTextBox.Text = String.Empty;

                addedLbl.Text = "Successfuly created";
        }
    }
}