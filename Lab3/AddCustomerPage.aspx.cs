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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initialContactList.Items.Add("In Person");
                initialContactList.Items.Add("Via Phone");
                initialContactList.Items.Add("Via Email");
                initialContactList.Items.Add("Via Text");
                initialContactList.Items.Add("Other");

                interestList.Items.Add("Moving");
                interestList.Items.Add("Auction");

                currentDateTxtBox.Text += DateTime.Now.ToString();
            }
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
            con.Open();

            String query2 = "Select * from Request";

            SqlCommand cmd1 = new SqlCommand(query2, con);
            SqlDataReader reader = cmd1.ExecuteReader();


            // Logic to make sure duplicate customer names cannot be added
            if (!IsPostBack && reader.HasRows)
            {
                Response.Write("<script>alert('You have a(n) new service request(s)')</script>");
            }
            else
            {
                reader.Close();
            }
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


            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString);
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

                DBConn = WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString;


                using (SqlConnection myConnection = new SqlConnection(DBConn))
                {


                    SqlCommand MyCommand = new SqlCommand("INSERT INTO Customer (CustomerFirstName, CustomerLastName, InitialContact, Discovered, CustomerPhone, CustomerInterest, CustomerEmail, CustomerState, " +
                        "CustomerCity, CustomerZip, CustomerName) Values (@CustomerFirstName, @CustomerLastName, @InitialContact, @Discovered,  @CustomerPhone, @CustomerInterest, @CustomerEmail, @CustomerState," +
                        " @CustomerCity, @CustomerZip, @CustomerName)", myConnection);

                    MyCommand.Parameters.AddWithValue("@CustomerFirstName", addCustFirstName.Text);
                    MyCommand.Parameters.AddWithValue("@CustomerLastName", addCustLastName.Text);
                    MyCommand.Parameters.AddWithValue("@InitialContact", initialContactList.SelectedValue);
                    MyCommand.Parameters.AddWithValue("@Discovered", dscvrdtxtbox.Text);

                    MyCommand.Parameters.AddWithValue("@CustomerPhone", addCPhone.Text);
                    MyCommand.Parameters.AddWithValue("@CustomerInterest", interestList.SelectedValue);

                    MyCommand.Parameters.AddWithValue("@CustomerEmail", addCEmail.Text);
                    MyCommand.Parameters.AddWithValue("@CustomerState", addCStreet.Text);
                    MyCommand.Parameters.AddWithValue("@CustomerCity", addCCity.Text);
                    MyCommand.Parameters.AddWithValue("@CustomerZip", addCZip.Text);
                    MyCommand.Parameters.AddWithValue("@CustomerName", addCustFirstName.Text + ' ' + addCustLastName.Text);


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

                    addedLbl.Text = "Customer Successully Added";



                }

            }
        }

        protected void populateBtn_Click(object sender, EventArgs e)
        {
            //addCustomerTxtBox.Text += "Jazmine Sullivan";
            addCustFirstName.Text += "Jazmine";
            addCustLastName.Text += "Sullivan";
            addCPhone.Text += "8782223549";
            addCEmail.Text += "sullivan@gmail.com";
            addCStreet.Text += "VA";
            addCCity.Text += "Fairfax";
            addCZip.Text += "22304";
            dscvrdtxtbox.Text += "Web Advertisement";
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
        }
    }
}