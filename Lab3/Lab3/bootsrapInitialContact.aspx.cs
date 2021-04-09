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
    public partial class WebForm24 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initialContactList.Items.Add("In Person");
                initialContactList.Items.Add("Via Phone");
                initialContactList.Items.Add("Via Email");

                //interestList.Items.Add("Moving");
                //interestList.Items.Add("Auction");
                //interestList.Items.Add("Appraisal");
                //interestList.Items.Add("Consignment");
                //interestList.Items.Add("Combination");

                ifAuctionDropDownList.Items.Add("N/A");
                ifAuctionDropDownList.Items.Add("Bringing Items Themeselves");
                ifAuctionDropDownList.Items.Add("Need Auction LookOut");

                downsizeDropDownList.Items.Add("Yes");
                downsizeDropDownList.Items.Add("No");

                estateDropDownList.Items.Add("Yes");
                estateDropDownList.Items.Add("No");

                howMuchDropDownList.Items.Add("N/A");
                howMuchDropDownList.Items.Add("Large Amount");
                howMuchDropDownList.Items.Add("Medium Amount");
                howMuchDropDownList.Items.Add("Small Amount");


                creatorList.Items.Add("Laura");
                creatorList.Items.Add("Creg");
                creatorList.Items.Add("Sherll");
                creatorList.Items.Add("Elizabeth");
                creatorList.Items.Add("Sierra");

                currentDateTxtBox.Text += DateTime.Now.ToString();

            }
            //    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            //    con.Open();

            //    String query2 = "Select * from Request";

            //    SqlCommand cmd1 = new SqlCommand(query2, con);
            //    SqlDataReader reader = cmd1.ExecuteReader();


            //    // Logic to make sure duplicate customer names cannot be added
            //    if (!IsPostBack && reader.HasRows)
            //    {
            //        //Response.Write("<script>alert('You have a(n) new service request(s)')</script>");
            //        //Make go away after clicking view requests button
            //        pushNotificationLabel.Text = "You have a(n) new service request(s)";
            //    }
            //    else
            //    {
            //        reader.Close();
            //    }
            //}
        }

        protected void addCustBtn_Click(object sender, EventArgs e)
        {
            addCustFirstName.Text = HttpUtility.HtmlEncode(addCustFirstName.Text);
            addCustLastName.Text = HttpUtility.HtmlEncode(addCustLastName.Text);
            addCPhone.Text = HttpUtility.HtmlEncode(addCPhone.Text);
            addCEmail.Text = HttpUtility.HtmlEncode(addCEmail.Text);
            addCStreet.Text = HttpUtility.HtmlEncode(addCStreet.Text);
            addCCity.Text = HttpUtility.HtmlEncode(addCCity.Text);
            addCZip.Text = HttpUtility.HtmlEncode(addCZip.Text);
            dscvrdtxtbox.Text = HttpUtility.HtmlEncode(dscvrdtxtbox.Text);
            fromtxtBox.Text = HttpUtility.HtmlEncode(fromtxtBox.Text);
            toTxtBox.Text = HttpUtility.HtmlEncode(toTxtBox.Text);
            whatIsBeingSoldTxtBox.Text = HttpUtility.HtmlEncode(whatIsBeingSoldTxtBox.Text);
            addDeadlineTxtBox.Text = HttpUtility.HtmlEncode(addDeadlineTxtBox.Text);
            addAddressTxtBox.Text = HttpUtility.HtmlEncode(addAddressTxtBox.Text);



            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            String query2 = "Select * from Customer where CustomerFirstName = @CustomerFirstName AND CustomerLastName = @CustomerLastName";

            SqlCommand cmd1 = new SqlCommand(query2, con);
            cmd1.Parameters.AddWithValue("@CustomerFirstName", addCustFirstName.Text);
            cmd1.Parameters.AddWithValue("@CustomerLastName", addCustLastName.Text);
            SqlDataReader reader = cmd1.ExecuteReader();


            // Logic to make sure duplicate customer names cannot be added
            if (reader.HasRows)
            {
                System.Windows.Forms.MessageBox.Show("This customer already exists.");
            }
            else
            {
                reader.Close();

                // Connection and Insertion statements
                String DBConn;

                DBConn = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;


                using (SqlConnection myConnection = new SqlConnection(DBConn))
                {


                    SqlCommand MyCommand = new SqlCommand("INSERT INTO Customer (CustomerFirstName, CustomerLastName, InitialContact, Discovered, CustomerPhone, CustomerInterest, CustomerEmail, CustomerState, " +
                        "CustomerCity, CustomerZip, CustomerName, IfAuction, FromAddress, ToAddress, Downsizing, SellingEstate, AmountToBeSold, WhatIsToBeSold, DesiredDeadlineDate, CAddress, EmployeeHandler, CustomerDate) Values (@CustomerFirstName, @CustomerLastName, @InitialContact, @Discovered,  @CustomerPhone, @CustomerInterest, @CustomerEmail, @CustomerState," +
                        " @CustomerCity, @CustomerZip, @CustomerName, @IfAuction, @FromAddress, @ToAddress, @Downsizing, @SellingEstate, @AmountToBeSold, @WhatIsToBeSold, @DesiredDeadlineDate, @CAddress, @EmployeeHandler, @CustomerDate)", myConnection);

                    MyCommand.Parameters.AddWithValue("@CustomerFirstName", addCustFirstName.Text);
                    MyCommand.Parameters.AddWithValue("@CustomerLastName", addCustLastName.Text);
                    MyCommand.Parameters.AddWithValue("@InitialContact", initialContactList.SelectedValue);
                    MyCommand.Parameters.AddWithValue("@Discovered", dscvrdtxtbox.Text);

                    MyCommand.Parameters.AddWithValue("@CustomerPhone", addCPhone.Text);
                    MyCommand.Parameters.AddWithValue("@CustomerInterest", interestListTextBox.Text);
                    Application["CustomerInterest"] = interestListTextBox.Text;

                    MyCommand.Parameters.AddWithValue("@CustomerEmail", addCEmail.Text);
                    Application["CustomerEmail"] = addCEmail.Text;
                    MyCommand.Parameters.AddWithValue("@CustomerState", addCStreet.Text);
                    MyCommand.Parameters.AddWithValue("@CustomerCity", addCCity.Text);
                    MyCommand.Parameters.AddWithValue("@CustomerZip", addCZip.Text);
                    MyCommand.Parameters.AddWithValue("@CustomerName", addCustFirstName.Text + ' ' + addCustLastName.Text);
                    Application["CustomerName"] = addCustFirstName.Text + ' ' + addCustLastName.Text;

                    MyCommand.Parameters.AddWithValue("@IfAuction", ifAuctionDropDownList.SelectedValue);
                    MyCommand.Parameters.AddWithValue("@FromAddress", fromtxtBox.Text);
                    MyCommand.Parameters.AddWithValue("@ToAddress", toTxtBox.Text);
                    MyCommand.Parameters.AddWithValue("@Downsizing", downsizeDropDownList.SelectedValue);
                    MyCommand.Parameters.AddWithValue("@SellingEstate", estateDropDownList.SelectedValue);
                    MyCommand.Parameters.AddWithValue("@AmountToBeSold", howMuchDropDownList.SelectedValue);
                    MyCommand.Parameters.AddWithValue("@WhatIsToBeSold", whatIsBeingSoldTxtBox.Text);
                    MyCommand.Parameters.AddWithValue("@DesiredDeadlineDate", addDeadlineTxtBox.Text);
                    MyCommand.Parameters.AddWithValue("@CAddress", addAddressTxtBox.Text);
                    Application["CAddress"] = addAddressTxtBox.Text;
                    MyCommand.Parameters.AddWithValue("@EmployeeHandler", creatorList.SelectedValue);

                    MyCommand.Parameters.AddWithValue("@CustomerDate", currentDateTxtBox.Text);
                    Application["CustomerDate"] = currentDateTxtBox.Text;

                    myConnection.Open();
                    MyCommand.ExecuteNonQuery();


                    //addCustomerTxtBox.Text = String.Empty;
                    addCustFirstName.Text = String.Empty;
                    addCustLastName.Text = String.Empty;
                    addCPhone.Text = String.Empty;
                    addCEmail.Text = String.Empty;
                    addCStreet.Text = String.Empty;
                    addCCity.Text = String.Empty;
                    addCZip.Text = String.Empty;
                    dscvrdtxtbox.Text = String.Empty;
                    fromtxtBox.Text = String.Empty;
                    toTxtBox.Text = String.Empty;
                    whatIsBeingSoldTxtBox.Text = String.Empty;
                    addDeadlineTxtBox.Text = String.Empty;
                    addAddressTxtBox.Text = String.Empty;

                    addedLbl.Text = "Customer Successully Added";

                    Response.Redirect("bootstrapAddService.aspx");

                }

            }
        }

        protected void populateBtn_Click(object sender, EventArgs e)
        {
            //addCustomerTxtBox.Text += "Jazmine Sullivan";
            addCustFirstName.Text += "Jazmine";
            addCustLastName.Text += "Sullivan";
            addCPhone.Text += 8782223549;
            addCEmail.Text += "sullivan@gmail.com";
            addCStreet.Text += "VA";
            addCCity.Text += "Fairfax";
            addCZip.Text += "22304";
            dscvrdtxtbox.Text += "Web Advertisement";
            addDeadlineTxtBox.Text += "04/24/2021";
            addAddressTxtBox.Text += "12231 Washington Blvd.";
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            //addCustomerTxtBox.Text = String.Empty;
            addCustFirstName.Text = String.Empty;
            addCustLastName.Text = String.Empty;
            addCPhone.Text = String.Empty;
            addCEmail.Text = String.Empty;
            addCStreet.Text = String.Empty;
            addCCity.Text = String.Empty;
            addCZip.Text = String.Empty;
            dscvrdtxtbox.Text = String.Empty;
            fromtxtBox.Text = String.Empty;
            toTxtBox.Text = String.Empty;
            whatIsBeingSoldTxtBox.Text = String.Empty;
            addDeadlineTxtBox.Text = String.Empty;
            addAddressTxtBox.Text = String.Empty;
        }

        protected void auctionCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (auctionCheckBox.Checked)
            {
                interestListTextBox.Text = "Auction";
                ifAuctionLbl.Visible = true;
                ifAuctionDropDownList.Visible = true;
                howMuchToSellLbl.Visible = true;
                howMuchDropDownList.Visible = true;
                whatIsBeingSoldLbl.Visible = true;
                whatIsBeingSoldTxtBox.Visible = true;


            }
        }

        protected void moveCheckbox_CheckedChanged(object sender, EventArgs e)
        {
            if (moveCheckbox.Checked)
            {
                interestListTextBox.Text = "Moving";
                ifMovingLbl.Visible = true;
                fromtxtBox.Visible = true;
                toAddressLbl.Visible = true;
                toTxtBox.Visible = true;
                downsizingLbl.Visible = true;
                downsizeDropDownList.Visible = true;
                sellingEstateLbl.Visible = true;
                estateDropDownList.Visible = true;


            }
           
        }
    }
}