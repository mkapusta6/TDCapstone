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
    public partial class WebForm29 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["CustomerDate"] != null)
            {
                string cDate = Application["CustomerDate"].ToString();
                contDateTextBox.Text = cDate;
            }
        }

        protected void popBtn_Click(object sender, EventArgs e)
        {

        }

        protected void clrBt_Click(object sender, EventArgs e)
        {

        }

        protected void addAuctionBtn_Click(object sender, EventArgs e)
        {
            //Connection and Insertion statements
            String DBConn;

            DBConn = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;


            using (SqlConnection myConnection = new SqlConnection(DBConn))
            {


                //SqlCommand MyCommand = new SqlCommand("INSERT INTO Auction (R_CustomerName, CustomerID, ServiceTicketID, ) Values (@R_CustomerName, @, @AuctionBringIn, @AuctionPickUp, @CustomerID, @ServiceTicketID, @ContactDate, @StorageLocation, @Cosignor, @AppraisalDate, @SaleDate, @PBringInDate, @PPickUpDate, @PLookAtDate, @PAppraisalDate, @PSaleDate)", myConnection);
                SqlCommand MyCommand = new SqlCommand("INSERT INTO AuctionPickUp (AuctionLookAt, AuctionBringIn, AuctionPickUp, CustomerID, AuctionID, ServiceTicketID, ContactDate, StorageLocation, Cosignor, AppraisalDate, SaleDate, PBringInDate, PPickUpDate, PLookAtDate, PAppraisalDate, PSaleDate) Values (@AuctionLookAt, @AuctionBringIn, @AuctionPickUp, @CustomerID, @AuctionID, @ServiceTicketID, @ContactDate, @StorageLocation, @Cosignor, @AppraisalDate, @SaleDate, @PBringInDate, @PPickUpDate, @PLookAtDate, @PAppraisalDate, @PSaleDate)", myConnection);


                MyCommand.Parameters.AddWithValue("@AuctionLookAt", lookAtTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@AuctionBringIn", bringInTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@AuctionPickUp", pickUpTextBox.Text);
                MyCommand.Parameters.AddWithValue("@CustomerID", custDropDownList1.SelectedValue);
                MyCommand.Parameters.AddWithValue("@AuctionID", custDropDownList1.SelectedValue);
                MyCommand.Parameters.AddWithValue("@ServiceTicketID", sTicketDropDownList.SelectedValue);
                //Application["CustomerInterest"] = interestList.SelectedValue;

                MyCommand.Parameters.AddWithValue("@ContactDate", contDateTextBox.Text);
                MyCommand.Parameters.AddWithValue("@StorageLocation", storageTextBox7.Text);
                MyCommand.Parameters.AddWithValue("@Cosignor", cosignorTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@AppraisalDate", appraisalTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@SaleDate", saleTxtBox.Text);

                MyCommand.Parameters.AddWithValue("@PBringInDate", pBringInTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@PPickUpDate", pPickUpTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@PLookAtDate", pLookAtTextBox.Text);
                MyCommand.Parameters.AddWithValue("@PAppraisalDate", pAppraisalTextBox.Text);
                MyCommand.Parameters.AddWithValue("@PSaleDate", pSaleDateTxtBox.Text);
                //MyCommand.Parameters.AddWithValue("@AmountToBeSold", howMuchDropDownList.SelectedValue);
                //MyCommand.Parameters.AddWithValue("@WhatIsToBeSold", whatIsBeingSoldTxtBox.Text);
                //MyCommand.Parameters.AddWithValue("@DesiredDeadlineDate", addDeadlineTxtBox.Text);
                //MyCommand.Parameters.AddWithValue("@CAddress", addAddressTxtBox.Text);
                //Application["CAddress"] = addAddressTxtBox.Text;
                //MyCommand.Parameters.AddWithValue("@EmployeeHandler", creatorList.SelectedValue);

                //MyCommand.Parameters.AddWithValue("@CustomerDate", currentDateTxtBox.Text);
                //Application["CustomerDate"] = currentDateTxtBox.Text;

                myConnection.Open();
                MyCommand.ExecuteNonQuery();
            }
        }
    }
}