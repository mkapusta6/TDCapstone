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
    public partial class WebForm30 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void auctionCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (auctionCheckBox.Checked)
            {
                AuctionHeaderLbl.Visible = true;
                auctionTitleList.Visible = true;
                contactInfoLabel.Visible = true;
                custDropDownList1.Visible = true;
                sTicketLbl.Visible = true;
                sTicketDropDownList.Visible = true;
                addAuctionBtn.Visible = true;

                
            }
            else
            {
                AuctionHeaderLbl.Visible = false;
                auctionTitleList.Visible = false;
                contactInfoLabel.Visible = false;
                custDropDownList1.Visible = false;
                sTicketLbl.Visible = false;
                sTicketDropDownList.Visible = false;
                addAuctionBtn.Visible = false;
            }
        }



        protected void popBtn_Click(object sender, EventArgs e)
        {
            finalCostTextBox.Text = "2.00";
            experienceTextBox.Text = "Overall good experience.";
            additionalExpensesTxtBox.Text = "Popped Tire: $64.00";
            followUpTxtBox.Text = "We have completed your work order please let us know if there is anything else we can do for you.";
            crewTxtBox.Text = "Information will be carried over in Sprint #3";
            fromAddressTxtBox.Text = "Information will be carried over in Sprint #3";
            toAddressTxtBox.Text = "Information will be carried over in Sprint #3";
            mileageTextBox.Text = "45";
            trucksTxtBox.Text = "Information will be carried over in Sprint #3";
            addNotesTextBox.Text = "Additional notes";

        }

        protected void clrBt_Click(object sender, EventArgs e)
        {
            finalCostTextBox.Text = String.Empty;
            experienceTextBox.Text = String.Empty;
            additionalExpensesTxtBox.Text = String.Empty;
            followUpTxtBox.Text = String.Empty;
            crewTxtBox.Text = String.Empty;
            fromAddressLbl.Text = String.Empty;
            toAddressTxtBox.Text = String.Empty;
            mileageTextBox.Text = String.Empty;
            trucksTxtBox.Text = String.Empty;
            addNotesTextBox.Text = String.Empty;
        }

        protected void addAuctionBtn_Click(object sender, EventArgs e)
        {

            // Connection and Insertion statements
            String DBConn;

            DBConn = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;


            using (SqlConnection myConnection = new SqlConnection(DBConn))
            {


                SqlCommand MyCommand = new SqlCommand("INSERT INTO AuctionCompletion (FinalCost, PaymentReceived, Experience, AdditionalExpenses, followUp, Crew, fromAddress, toAddress, trucksUsed, AdditionalNotes, AuctionID, ServiceTicketID, CustomerID) Values (@FinalCost, @PaymentReceived, @Experience, @AdditionalExpenses, @followUp, @Crew, @fromAddress, @toAddress, @trucksUsed, @AdditionalNotes, @AuctionID, @ServiceTicketID, @CustomerID)", myConnection);

                MyCommand.Parameters.AddWithValue("@FinalCost", finalCostTextBox.Text);

                Boolean paid = false;
                if (CheckBox1.Checked)
                {
                    paid = true;
                }
                if (CheckBox2.Checked)
                {
                    paid = false;
                }
                MyCommand.Parameters.AddWithValue("@PaymentReceived", paid);
                MyCommand.Parameters.AddWithValue("@Experience", experienceTextBox.Text);
                MyCommand.Parameters.AddWithValue("@AdditionalExpenses", additionalExpensesTxtBox.Text);

                MyCommand.Parameters.AddWithValue("@followUp", followUpTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@Crew", crewTxtBox.Text);
                //Application["CustomerInterest"] = interestList.SelectedValue;

                MyCommand.Parameters.AddWithValue("@toAddress", toAddressTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@fromAddress", fromAddressTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@trucksUsed", addNotesTextBox.Text);
                MyCommand.Parameters.AddWithValue("@AdditionalNotes", addNotesTextBox.Text);
                MyCommand.Parameters.AddWithValue("@AuctionID", auctionTitleList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@ServiceTicketID", sTicketDropDownList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@CustomerID", custDropDownList1.SelectedValue);

                myConnection.Open();
                MyCommand.ExecuteNonQuery();

                finalCostTextBox.Text = String.Empty;
                experienceTextBox.Text = String.Empty;
                additionalExpensesTxtBox.Text = String.Empty;
                followUpTxtBox.Text = String.Empty;
                crewTxtBox.Text = String.Empty;
                fromAddressLbl.Text = String.Empty;
                toAddressTxtBox.Text = String.Empty;
                mileageTextBox.Text = String.Empty;
                trucksTxtBox.Text = String.Empty;
                addNotesTextBox.Text = String.Empty;

                auctionAddLbl.Text = "Auction Completed Successfully";
            }
        }


        protected void moveCheckbox_CheckedChanged(object sender, EventArgs e)
        {
            if (moveCheckbox.Checked)
            {
                moveLabel.Visible = true;
                moveDropDownList1.Visible = true;
                contactInfoLabel.Visible = true;
                custDropDownList1.Visible = true;
                sTicketLbl.Visible = true;
                sTicketDropDownList.Visible = true;
                compMoveButton.Visible = true;
                
            }
            else
            {
                moveLabel.Visible = false;
                moveDropDownList1.Visible = false;
                contactInfoLabel.Visible = false;
                custDropDownList1.Visible = false;
                sTicketLbl.Visible = false;
                sTicketDropDownList.Visible = false;
                compMoveButton.Visible = false;
            }
        }

        protected void bothCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (bothCheckBox.Checked)
            {
                AuctionHeaderLbl.Visible = true;
                auctionTitleList.Visible = true;
                contactInfoLabel.Visible = true;
                custDropDownList1.Visible = true;
                sTicketLbl.Visible = true;
                sTicketDropDownList.Visible = true;
                moveLabel.Visible = true;
                moveDropDownList1.Visible = true;
                contactInfoLabel.Visible = true;
                custDropDownList1.Visible = true;
                sTicketLbl.Visible = true;
                sTicketDropDownList.Visible = true;
                compBothButton.Visible = true;
            }

            else
            {
                AuctionHeaderLbl.Visible = false;
                auctionTitleList.Visible = false;
                contactInfoLabel.Visible = false;
                custDropDownList1.Visible = false;
                sTicketLbl.Visible = false;
                sTicketDropDownList.Visible = false;
                moveLabel.Visible = false;
                moveDropDownList1.Visible = false;
                contactInfoLabel.Visible = false;
                custDropDownList1.Visible = false;
                sTicketLbl.Visible = false;
                sTicketDropDownList.Visible = false;
                compBothButton.Visible = false;
            }
        }

        protected void compMoveButton_Click(object sender, EventArgs e)
        {
            // Connection and Insertion statements
            String DBConn;

            DBConn = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;


            using (SqlConnection myConnection = new SqlConnection(DBConn))
            {


                SqlCommand MyCommand = new SqlCommand("INSERT INTO MoveCompletion (FinalCost, PaymentReceived, Experience, AdditionalExpenses, followUp, Crew, fromAddress, toAddress, trucksUsed, AdditionalNotes, MovingID, ServiceTicketID, CustomerID) Values (@FinalCost, @PaymentReceived, @Experience, @AdditionalExpenses, @followUp, @Crew, @fromAddress, @toAddress, @trucksUsed, @AdditionalNotes, @MovingID, @ServiceTicketID, @CustomerID)", myConnection);

                MyCommand.Parameters.AddWithValue("@FinalCost", finalCostTextBox.Text);

                Boolean paid = false;
                if (CheckBox1.Checked)
                {
                    paid = true;
                }
                if (CheckBox2.Checked)
                {
                    paid = false;
                }
                MyCommand.Parameters.AddWithValue("@PaymentReceived", paid);
                MyCommand.Parameters.AddWithValue("@Experience", experienceTextBox.Text);
                MyCommand.Parameters.AddWithValue("@AdditionalExpenses", additionalExpensesTxtBox.Text);

                MyCommand.Parameters.AddWithValue("@followUp", followUpTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@Crew", crewTxtBox.Text);
                //Application["CustomerInterest"] = interestList.SelectedValue;

                MyCommand.Parameters.AddWithValue("@toAddress", toAddressTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@fromAddress", fromAddressTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@trucksUsed", addNotesTextBox.Text);
                MyCommand.Parameters.AddWithValue("@AdditionalNotes", addNotesTextBox.Text);
                MyCommand.Parameters.AddWithValue("@MovingID", moveDropDownList1.SelectedValue);
                MyCommand.Parameters.AddWithValue("@ServiceTicketID", sTicketDropDownList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@CustomerID", custDropDownList1.SelectedValue);

                myConnection.Open();
                MyCommand.ExecuteNonQuery();

                finalCostTextBox.Text = String.Empty;
                experienceTextBox.Text = String.Empty;
                additionalExpensesTxtBox.Text = String.Empty;
                followUpTxtBox.Text = String.Empty;
                crewTxtBox.Text = String.Empty;
                fromAddressLbl.Text = String.Empty;
                toAddressTxtBox.Text = String.Empty;
                mileageTextBox.Text = String.Empty;
                trucksTxtBox.Text = String.Empty;
                addNotesTextBox.Text = String.Empty;

                moveAddLbl.Text = "Move Completed Successfully";
            }
        }

        protected void compBothButton_Click(object sender, EventArgs e)
        {

            // Connection and Insertion statements
            String DBConn;

            DBConn = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;


            using (SqlConnection myConnection = new SqlConnection(DBConn))
            {


                SqlCommand MyCommand = new SqlCommand("INSERT INTO AuctionCompletion (FinalCost, PaymentReceived, Experience, AdditionalExpenses, followUp, Crew, fromAddress, toAddress, trucksUsed, AdditionalNotes, AuctionID, ServiceTicketID, CustomerID) Values (@FinalCost, @PaymentReceived, @Experience, @AdditionalExpenses, @followUp, @Crew, @fromAddress, @toAddress, @trucksUsed, @AdditionalNotes, @AuctionID, @ServiceTicketID, @CustomerID)", myConnection);
                SqlCommand moveCommand = new SqlCommand("INSERT INTO MoveCompletion (FinalCost, PaymentReceived, Experience, AdditionalExpenses, followUp, Crew, fromAddress, toAddress, trucksUsed, AdditionalNotes, MovingID, ServiceTicketID, CustomerID) Values (@FinalCost, @PaymentReceived, @Experience, @AdditionalExpenses, @followUp, @Crew, @fromAddress, @toAddress, @trucksUsed, @AdditionalNotes, @MovingID, @ServiceTicketID, @CustomerID)", myConnection);

                moveCommand.Parameters.AddWithValue("@FinalCost", finalCostTextBox.Text);

                Boolean paid = false;
                if (CheckBox1.Checked)
                {
                    paid = true;
                }
                if (CheckBox2.Checked)
                {
                    paid = false;
                }
                moveCommand.Parameters.AddWithValue("@PaymentReceived", paid);
                moveCommand.Parameters.AddWithValue("@Experience", experienceTextBox.Text);
                moveCommand.Parameters.AddWithValue("@AdditionalExpenses", additionalExpensesTxtBox.Text);

                moveCommand.Parameters.AddWithValue("@followUp", followUpTxtBox.Text);
                moveCommand.Parameters.AddWithValue("@Crew", crewTxtBox.Text);
                //Application["CustomerInterest"] = interestList.SelectedValue;

                moveCommand.Parameters.AddWithValue("@toAddress", toAddressTxtBox.Text);
                moveCommand.Parameters.AddWithValue("@fromAddress", fromAddressTxtBox.Text);
                moveCommand.Parameters.AddWithValue("@trucksUsed", addNotesTextBox.Text);
                moveCommand.Parameters.AddWithValue("@AdditionalNotes", addNotesTextBox.Text);
                moveCommand.Parameters.AddWithValue("@MovingID", moveDropDownList1.SelectedValue);
                moveCommand.Parameters.AddWithValue("@ServiceTicketID", sTicketDropDownList.SelectedValue);
                moveCommand.Parameters.AddWithValue("@CustomerID", custDropDownList1.SelectedValue);

                

                MyCommand.Parameters.AddWithValue("@FinalCost", finalCostTextBox.Text);

                Boolean apaid = false;
                if (CheckBox1.Checked)
                {
                    apaid = true;
                }
                if (CheckBox2.Checked)
                {
                    apaid = false;
                }
                MyCommand.Parameters.AddWithValue("@PaymentReceived", apaid);
                MyCommand.Parameters.AddWithValue("@Experience", experienceTextBox.Text);
                MyCommand.Parameters.AddWithValue("@AdditionalExpenses", additionalExpensesTxtBox.Text);

                MyCommand.Parameters.AddWithValue("@followUp", followUpTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@Crew", crewTxtBox.Text);
                //Application["CustomerInterest"] = interestList.SelectedValue;

                MyCommand.Parameters.AddWithValue("@toAddress", toAddressTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@fromAddress", fromAddressTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@trucksUsed", addNotesTextBox.Text);
                MyCommand.Parameters.AddWithValue("@AdditionalNotes", addNotesTextBox.Text);
                MyCommand.Parameters.AddWithValue("@AuctionID", auctionTitleList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@ServiceTicketID", sTicketDropDownList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@CustomerID", custDropDownList1.SelectedValue);

                myConnection.Open();
                moveCommand.ExecuteNonQuery();
                MyCommand.ExecuteNonQuery();

                finalCostTextBox.Text = String.Empty;
                experienceTextBox.Text = String.Empty;
                additionalExpensesTxtBox.Text = String.Empty;
                followUpTxtBox.Text = String.Empty;
                crewTxtBox.Text = String.Empty;
                fromAddressLbl.Text = String.Empty;
                toAddressTxtBox.Text = String.Empty;
                mileageTextBox.Text = String.Empty;
                trucksTxtBox.Text = String.Empty;
                addNotesTextBox.Text = String.Empty;

                bothAddLbl.Text = "Both Completed Sucessfully";
            }
        }

        protected void followUpBtn_Click(object sender, EventArgs e)
        {

        }
    }
}