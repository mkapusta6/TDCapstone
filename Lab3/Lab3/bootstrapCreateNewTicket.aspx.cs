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

                DateTime now = DateTime.Now;

                string reqDate = now.ToString();

                r_DateLbl.Text = "Request Date: " + reqDate;
                r_DateTxtBox.Text = reqDate;




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


            if (Application["CustomerName"] != null)
            {
                string custName = Application["CustomerName"].ToString();
                //nameLbl.Text = "Customer Name: " + custName;
                //custNameTextBox.Text = custName;
            }

            if (Application["CustomerEmail"] != null)
            {
                string custEmail = Application["CustomerEmail"].ToString();
                emailRequestLbl.Text = "Customer Email: " + custEmail;
                emailRequestTxtBox.Text = custEmail;
            }

            //if (Application["CustomerDate"] != null)
            //{
            //    string reqDate = Application["CustomerDate"].ToString();
            //    r_DateLbl.Text = "Request Date: " + reqDate;
            //    r_DateTxtBox.Text = reqDate;
            //}

            String DBConn;

            DBConn = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;


            using (SqlConnection myConnection = new SqlConnection(DBConn))
            {


                //Query for getting Count
                string QueryCnt = "select count(*) from dbo.Customer";
                string QueryCntSD = "select count(*) from Service_T";

                //Execute Queries and save results into variables
                SqlCommand CmdCnt = myConnection.CreateCommand();
                CmdCnt.CommandText = QueryCnt;
                SqlCommand CmdCntSD = myConnection.CreateCommand();
                CmdCntSD.CommandText = QueryCntSD;


                myConnection.Open();
                Int32 CustomerCnt = (Int32)CmdCnt.ExecuteScalar();
                int count = CustomerCnt - 1;
                Int32 SDCnt = (Int32)CmdCntSD.ExecuteScalar();
                int sdCount = SDCnt;
                myConnection.Close();


                
                custDropDownList.SelectedIndex = count;
                srvcDropDownList.SelectedIndex = sdCount - 1;
                //string i = CustomerCnt.ToString();
                //valDropDownList1.Items.Add(new ListItem(i));
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


                    myConection.Open();
                    Mycommand.ExecuteNonQuery();
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

            if (serviceTxtBox.Text == "Moving")
            {
                Response.Redirect("bootstrapMovingForm.aspx");
            }
            else if (serviceTxtBox.Text == "Auction") {
                Response.Redirect("bootstrapAuctionScheduling.aspx");
            }
        }

        //protected void continueBtn_Click(object sender, EventArgs e)
        //{

        //    srvcTcktName.Visible = true;
        //    tcktNameTxtBox.Visible = true;
        //    tcktStatusLbl.Visible = true;
        //    tcktStatusDropDownList.Visible = true;
        //    custLbl.Visible = true;
        //    custDropDownList.Visible = true;
        //    srvcLbl.Visible = true;
        //    srvcDropDownList.Visible = true;
        //    empLbl.Visible = true;
        //    empDropDownList.Visible = true;
        //    ticketStrtLbl.Visible = true;
        //    ticketStrtTxtBox.Visible = true;
        //    date1Lbl.Visible = true;
        //    date1TxtBox.Visible = true;
        //    date2Lbl.Visible = true;
        //    date2TxtBox.Visible = true;
        //    lookAtLbl.Visible = true;
        //    lookAtTextBox.Visible = true;
        //    bringInLbl.Visible = true;
        //    bringInTextBox.Visible = true;
        //    pickUpLbl.Visible = true;
        //    pickUpTextBox.Visible = true;
        //    addSrvcList.Visible = true;
        //    addServicesDDL.Visible = true;
        //    popBtn.Visible = true;
        //    clearBtn.Visible = true;
        //    createSrvcTckt.Visible = true;
        //    dateLastModifiedLbl.Visible = false;
        //    dateLastModifiedTxtBox.Visible = false;
        //    srvcDescriptionLbl.Visible = false;
        //    srvcDescriptionTxtBox.Visible = false;
        //    continueBtn.Visible = false;
            


        //    String DBConn;

        //    DBConn = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;


        //    using (SqlConnection myConnection = new SqlConnection(DBConn))
        //    {


        //        //Query for getting Count
        //        string QueryCnt = "select count(*) from dbo.Customer";
        //        string QueryCntSD = "select count(*) from Service_T";

        //        //Execute Queries and save results into variables
        //        SqlCommand CmdCnt = myConnection.CreateCommand();
        //        CmdCnt.CommandText = QueryCnt;
        //        SqlCommand CmdCntSD = myConnection.CreateCommand();
        //        CmdCntSD.CommandText = QueryCntSD;


        //        myConnection.Open();
        //        Int32 CustomerCnt = (Int32)CmdCnt.ExecuteScalar();
        //        int count = CustomerCnt - 1;
        //        Int32 SDCnt = (Int32)CmdCntSD.ExecuteScalar();
        //        int sdCount = SDCnt;
        //        myConnection.Close();


        //        custDropDownList.SelectedIndex = count;
        //        srvcDropDownList.SelectedIndex = sdCount - 1;
        //        //string i = CustomerCnt.ToString();
        //        //valDropDownList1.Items.Add(new ListItem(i));
        //    }

        //    String DBConnection;
        //    DBConnection = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
        //    using (SqlConnection myConection = new SqlConnection(DBConnection))
        //    {
                

        //        SqlCommand otherCommand = new SqlCommand("INSERT INTO Service_T (ServiceType, dateLastModified, " +
        //               "ServiceDescription) Values (@ServiceType, @dateLastModified, @ServiceDescription)", myConection);

        //        SqlCommand requestcommand = new SqlCommand("INSERT INTO Request(EmailRequest, ServiceType, R_Description, R_Date)" +
        //            " VALUES (@EmailRequest, @ServiceType, @R_Description, @R_Date)", myConection);




        //        otherCommand.Parameters.AddWithValue("@ServiceType", serviceTxtBox.Text);
        //        Application["ServiceType"] = serviceTxtBox.Text;
        //        otherCommand.Parameters.AddWithValue("@dateLastModified", dateLastModifiedTxtBox.Text);
        //        otherCommand.Parameters.AddWithValue("@ServiceDescription", srvcDescriptionTxtBox.Text);
        //        Application["ServiceDescription"] = srvcDescriptionTxtBox.Text;





        //        requestcommand.Parameters.AddWithValue("@EmailRequest", emailRequestTxtBox.Text);
        //        requestcommand.Parameters.AddWithValue("@ServiceType", serviceTxtBox.Text);
        //        requestcommand.Parameters.AddWithValue("R_Description", srvcDescriptionTxtBox.Text);
        //        requestcommand.Parameters.AddWithValue("@R_Date", DateTime.Now);

        //        myConection.Open();
        //        otherCommand.ExecuteNonQuery();
        //        requestcommand.ExecuteNonQuery();
        //        //addedLbl.Text = "Service Successfully Created.";
        //        myConection.Close();
        //    }


    }
}