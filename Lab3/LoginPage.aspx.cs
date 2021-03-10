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
    public partial class WebForm9 : System.Web.UI.Page
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
            SqlConnection DBConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);

            SqlCommand loginCommand = new SqlCommand();
            loginCommand.Connection = DBConn;
            loginCommand.CommandType = CommandType.StoredProcedure;
            loginCommand.CommandText = "JeremyEzellLab3";

            loginCommand.Parameters.AddWithValue("@EmpUsername", usrnameTxtBox.Text);
            loginCommand.Parameters.AddWithValue("@EmpPassword", usrnameTxtBox.Text);





            DBConn.Open();

            loginCommand.Connection = DBConn;

            SqlDataReader reader = loginCommand.ExecuteReader();


            if (reader.Read())
            {
                Session["Username"] = usrnameTxtBox.Text;
                Response.Redirect("AddCustomerPage.aspx");
            }
            else
            {
                lblIncorrectLogin.Text = "Username and/or Password is incorrect";
            }

            usrnameTxtBox.Text = HttpUtility.HtmlEncode(usrnameTxtBox.Text);
            pswrdTxtBox.Text = HttpUtility.HtmlEncode(pswrdTxtBox.Text);
        }
    }
}