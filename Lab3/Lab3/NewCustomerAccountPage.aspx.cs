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
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);
            con.Open();

            String query2 = "Select * from CustomerCredentials where Username = @Username";

            SqlCommand cmd1 = new SqlCommand(query2, con);
            cmd1.Parameters.AddWithValue("@Username", usrnameTxtBox.Text);
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

                DBConn = WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString;


                using (SqlConnection myConnection = new SqlConnection(DBConn))
                {


                    SqlCommand MyCommand = new SqlCommand("INSERT INTO CustomerCredentials (Username) Values (@Username)", myConnection);

                    MyCommand.Parameters.Add(new SqlParameter("@Username", usrnameTxtBox.Text));


                    myConnection.Open();
                    MyCommand.ExecuteNonQuery();

                    SqlCommand passCommand = new SqlCommand("INSERT INTO Pass VALUES((select max(CustomerCredentialsID) from CustomerCredentials), @Username, @Password)", myConnection);

                    passCommand.Parameters.Add(new SqlParameter("@Username", usrnameTxtBox.Text));
                    passCommand.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(pswrdTxtBox.Text)));

                    passCommand.ExecuteNonQuery();




                    usrnameTxtBox.Text = HttpUtility.HtmlEncode(usrnameTxtBox.Text);
                    pswrdTxtBox.Text = HttpUtility.HtmlEncode(pswrdTxtBox.Text);

                    //addCustomerTxtBox.Text = String.Empty;
                    usrnameTxtBox.Text = String.Empty;
                    pswrdTxtBox.Text = String.Empty;



                    Response.Redirect("CustomerLogin.aspx");



                }
            }
        }
    }
}