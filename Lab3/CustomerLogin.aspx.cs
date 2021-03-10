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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void clearTxtBtn_Click(object sender, EventArgs e)
        {
            usrnameTxtBox.Text = String.Empty;
            pswrdTxtBox.Text = String.Empty;
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            String DBConn;

            DBConn = WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString;


            using (SqlConnection myConnection = new SqlConnection(DBConn))
            {


                SqlCommand MyCommand = new SqlCommand("Select PasswordHash from Pass where Username = @Username", myConnection);

                MyCommand.Parameters.Add(new SqlParameter("@Username", usrnameTxtBox.Text));
                Application["Username"] = usrnameTxtBox.Text;


                myConnection.Open();

                SqlDataReader reader = MyCommand.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        string storedHash = reader["PasswordHash"].ToString();
                        if (HashPassword.ValidatePassword(pswrdTxtBox.Text, storedHash))
                        {
                            lblIncorrectLogin.Text = "Login Successful";
                            Session["Userame"] = usrnameTxtBox.Text;
                            Response.Redirect("InitialContactPage.aspx");
                        }
                        else
                        {
                            lblIncorrectLogin.Text = "Username and/or Password is incorrect";
                        }
                    }
                }


            }

            usrnameTxtBox.Text = HttpUtility.HtmlEncode(usrnameTxtBox.Text);
            pswrdTxtBox.Text = HttpUtility.HtmlEncode(pswrdTxtBox.Text);
        }
    }
}