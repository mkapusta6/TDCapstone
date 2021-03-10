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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void popBtn_Click(object sender, EventArgs e)
        {
            auctionTxtBox.Text = "Memorabilia Auction";
            custItemTxtBox.Text = "Jerseys and Clothing";
            dateTextBox.Text = "03/12/2021";
        }

        protected void clrBt_Click(object sender, EventArgs e)
        {
            auctionTxtBox.Text = String.Empty;
            custItemTxtBox.Text = String.Empty;
            dateTextBox.Text = String.Empty;
        }

        protected void addAuctionBtn_Click(object sender, EventArgs e)
        {
            auctionTxtBox.Text = HttpUtility.HtmlEncode(auctionTxtBox.Text);
            dateTextBox.Text = HttpUtility.HtmlEncode(dateTextBox.Text);
            custItemTxtBox.Text = HttpUtility.HtmlEncode(custItemTxtBox.Text);

            String DBConnection;
            DBConnection = WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString;
            using (SqlConnection myConnection = new SqlConnection(DBConnection))
            {
                SqlCommand MyCommand = new SqlCommand("INSERT INTO Auction(AuctionHeading, AuctionDate, R_CustomerName, R_Item, CustomerID) VALUES (@AuctionHeading, @AuctionDate, @R_CustomerName, @R_Item, @CustomerID)", myConnection);



                MyCommand.Parameters.AddWithValue("@AuctionHeading", auctionTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@AuctionDate", dateTextBox.Text);
                MyCommand.Parameters.AddWithValue("@R_CustomerName", fromWhoDropDownList.SelectedItem.Text);
                MyCommand.Parameters.AddWithValue("@CustomerID", fromWhoDropDownList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@R_Item", custItemTxtBox.Text);

                myConnection.Open();
                MyCommand.ExecuteNonQuery();
                myConnection.Close();

                auctionTxtBox.Text = String.Empty;
                dateTextBox.Text = String.Empty;
                custItemTxtBox.Text = String.Empty;

                Response.Redirect("AuctionPage.aspx");
                addedLbl.Text = "Auction Successfully Added";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string sqlQuery = "Select AuctionHeading, AuctionDate, R_CustomerName as 'Customer', R_Item as 'Item' from Auction where Auction.AuctionID = " + AuctionDropDownList1.SelectedValue;

            
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
           
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable dtforGridView = new DataTable();
            sqlAdapter.Fill(dtforGridView);
            GridView1.DataSource = dtforGridView;
            GridView1.DataBind();
        }
    }
}