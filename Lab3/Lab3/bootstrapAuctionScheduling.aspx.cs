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
    public partial class WebForm27 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                truckDropDownList1.Items.Add(new ListItem("Accessible"));
                truckDropDownList1.Items.Add(new ListItem("Non-Accessible"));

                statusDropDownList1.Items.Add(new ListItem("Active"));
                statusDropDownList1.Items.Add(new ListItem("Inactive"));

                truckTypeDropDownList.Items.Add(new ListItem("2015"));
                truckTypeDropDownList.Items.Add(new ListItem("2011"));
                truckTypeDropDownList.Items.Add(new ListItem("Cube"));
                truckTypeDropDownList.Items.Add(new ListItem("GMC"));
                truckTypeDropDownList.Items.Add(new ListItem("Green"));
                truckTypeDropDownList.Items.Add(new ListItem("Van"));
                truckTypeDropDownList.Items.Add(new ListItem("Trailer"));

                crewDropDownList.Items.Add(new ListItem("Brad Campbell"));
                crewDropDownList.Items.Add(new ListItem("Sabastian"));
                crewDropDownList.Items.Add(new ListItem("Zach"));
                crewDropDownList.Items.Add(new ListItem("Creg"));
                crewDropDownList.Items.Add(new ListItem("Sam"));
                crewDropDownList.Items.Add(new ListItem("Scotty"));
            }
        }

        protected void popBtn_Click(object sender, EventArgs e)
        {
            auctionTxtBox.Text = "Memorabilia Auction";
            custItemTxtBox.Text = "Jerseys and Clothing";
            dateTextBox.Text = "03/12/2021";
            suppliesTextBox.Text = "Packing tape";
            numBoxTextBox1.Text = "4";
            typeBoxTextBox.Text = "Packing";
            numOfTrucksTextBox.Text = "2";
        }

        protected void clrBt_Click(object sender, EventArgs e)
        {
            auctionTxtBox.Text = String.Empty;
            custItemTxtBox.Text = String.Empty;
            dateTextBox.Text = String.Empty;
            suppliesTextBox.Text = String.Empty;
            numBoxTextBox1.Text = String.Empty;
            typeBoxTextBox.Text = String.Empty;
            numOfTrucksTextBox.Text = String.Empty;
        }

        protected void addAuctionBtn_Click(object sender, EventArgs e)
        {
            auctionTxtBox.Text = HttpUtility.HtmlEncode(auctionTxtBox.Text);
            dateTextBox.Text = HttpUtility.HtmlEncode(dateTextBox.Text);
            custItemTxtBox.Text = HttpUtility.HtmlEncode(custItemTxtBox.Text);

            String DBConnection;
            DBConnection = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            using (SqlConnection myConnection = new SqlConnection(DBConnection))
            {
                SqlCommand MyCommand = new SqlCommand("INSERT INTO Auction(AuctionHeading, AuctionDate, R_CustomerName, R_Item, CustomerID, ServiceTicketID) VALUES (@AuctionHeading, @AuctionDate, @R_CustomerName, @R_Item, @CustomerID, @ServiceTicketID)", myConnection);

                SqlCommand otherMyCommand = new SqlCommand("INSERT INTO Equipment (EquipmentStatus, SuppliesNeeded, TruckAccess, NumberOfBoxes, BoxType, Crew, NumberOfTrucks, TruckTypes) VALUES (@EquipmentStatus, @SuppliesNeeded, @TruckAccess, @NumberOfBoxes, @BoxType, @Crew, @NumberOfTrucks, @TruckTypes)", myConnection);


                otherMyCommand.Parameters.AddWithValue("@EquipmentStatus", statusDropDownList1.SelectedValue);
                otherMyCommand.Parameters.AddWithValue("@SuppliesNeeded", suppliesTextBox.Text);

                otherMyCommand.Parameters.AddWithValue("@TruckAccess", truckDropDownList1.SelectedValue);
                otherMyCommand.Parameters.AddWithValue("@NumberOfBoxes", numBoxTextBox1.Text);

                //MyCommand.Parameters.AddWithValue("@Media", mediaTxtBox.Text);
                otherMyCommand.Parameters.AddWithValue("@BoxType", typeBoxTextBox.Text);

                otherMyCommand.Parameters.AddWithValue("@Crew", crewDropDownList.SelectedValue);
                otherMyCommand.Parameters.AddWithValue("@NumberOfTrucks", numOfTrucksTextBox.Text);

                otherMyCommand.Parameters.AddWithValue("@TruckTypes", truckTypeDropDownList.SelectedValue);

                MyCommand.Parameters.AddWithValue("@AuctionHeading", auctionTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@AuctionDate", dateTextBox.Text);
                MyCommand.Parameters.AddWithValue("@R_CustomerName", fromWhoDropDownList.SelectedItem.Text);
                MyCommand.Parameters.AddWithValue("@CustomerID", fromWhoDropDownList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@R_Item", custItemTxtBox.Text);

                int serviceID = int.Parse(tryDropDownList1.SelectedValue);
                MyCommand.Parameters.AddWithValue("@ServiceTicketID", tryDropDownList1.SelectedValue);


                myConnection.Open();
                MyCommand.ExecuteNonQuery();
                myConnection.Close();

                auctionTxtBox.Text = String.Empty;
                dateTextBox.Text = String.Empty;
                custItemTxtBox.Text = String.Empty;
                dateTextBox.Text = String.Empty;
                suppliesTextBox.Text = String.Empty;
                numBoxTextBox1.Text = String.Empty;
                typeBoxTextBox.Text = String.Empty;
                numOfTrucksTextBox.Text = String.Empty;

                addedLbl.Text = "Auction Successfully Added";

            }
        }

        protected void bringInBtn_Click(object sender, EventArgs e)
        {
            String nl = Environment.NewLine;
            String sqlQuery = "Select Customer.CustomerName, Customer.CustomerEmail, Customer.CustomerPhone, Employee.EmployeeName," +
                " ServiceTicket.BringInDate, ServiceTicket.ServiceType, ServiceTicket.TicketStatus, ServiceTicket.ServiceTicketName " +
                "from ServiceTicket INNER JOIN Customer on ServiceTicket.CustomerID = Customer.CustomerID inner join Employee on" +
                " ServiceTicket.EmployeeID = Employee.EmployeeID";

            SqlConnection sqlConnection = new
               SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnection);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            grdServiceReults.DataSource = dtForGridView;
            grdServiceReults.DataBind();
        }

        protected void srchAuctionDateBtn_Click(object sender, EventArgs e)
        {
            String nl = Environment.NewLine;
            String sqlQuery = "Select Auction.AuctionHeading, Auction.AuctionDate, Auction.R_CustomerName from Auction";

            SqlConnection sqlConnection = new
               SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnection);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            grdServiceReults.DataSource = dtForGridView;
            grdServiceReults.DataBind();
        }
    }
}