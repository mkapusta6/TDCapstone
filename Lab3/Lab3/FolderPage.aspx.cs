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
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInitialContactForm_Click(object sender, EventArgs e)
        {
            String nl = Environment.NewLine;
            String sqlQuery = "Select CustomerName, CustomerEmail, Discovered, CustomerPhone," +
                " CustomerState, CustomerCity, CustomerZip, CAddress, CustomerDate" + nl + "CustomerInterest, IfAuction, FromAddress" + nl + "ToAddress, Downsizing, SellingEstate, AmountToBeSold, WhatIsToBeSold, DesiredDeadlineDate, EmployeeHandler from Customer where Customer.CustomerID = " + ddlCustomerList.SelectedValue;

            SqlConnection sqlConnection = new
               SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnection);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            grdServiceReults.DataSource = dtForGridView;
            grdServiceReults.DataBind();
        }

        protected void btnServiceForm_Click(object sender, EventArgs e)
        {
            String nl = Environment.NewLine;
            String sqlQuery = "Select ServiceTicket.ServiceType, ServiceTicket.TicketStatus, ServiceTicket.TicketStartDate, ServiceTicket.ServiceTicketName, ServiceTicket.DateTimeOptionOne, ServiceTicket.DateTimeOptionTwo, ServiceTicket.BringInDate, ServiceTicket.AddServices," +
                "Customer.CustomerName, Customer.CustomerEmail, Customer.CustomerPhone, Employee.EmployeeName" +
                " from ServiceTicket INNER JOIN Customer on ServiceTicket.CustomerID = Customer.CustomerID inner join Employee on ServiceTicket.EmployeeID = Employee.EmployeeID where ServiceTicket.ServiceTicketID = " + ddlCustomerList.SelectedValue;


            SqlConnection sqlConnection = new
               SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnection);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            grdServiceReults.DataSource = dtForGridView;
            grdServiceReults.DataBind();
        }

        protected void btnMoveForm_Click(object sender, EventArgs e)
        {
            String nl = Environment.NewLine;
            String sqlQuery = "Select Customer.CustomerName, Customer.CustomerEmail, Customer.CustomerPhone, Customer.CAddress, Moving.HouseStories, Moving.DistanceFromTruck, Moving.DrivewayAccessibility, Moving.LoadingConditions, Moving.HouseSection, Moving.Mfloor, " +
                    "Moving.BoxType, Moving.NumberOfBoxes, Moving.Blankets, Moving.Items, Moving.Accessibility, Moving.ValueOfItem, Moving.AdditionalNotes from Moving inner join Customer on Moving.CustomerID = Customer.CustomerID where Moving.CustomerID = " + ddlCustomerList.SelectedValue;


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