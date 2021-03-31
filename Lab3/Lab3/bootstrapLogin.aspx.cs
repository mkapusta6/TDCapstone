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
    public partial class bootstrapLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection DBConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);




            SqlCommand loginCommand = new SqlCommand();

            loginCommand.Connection = DBConn;
            loginCommand.CommandType = CommandType.StoredProcedure;
            loginCommand.CommandText = "JeremyEzellLab3";

            loginCommand.Parameters.AddWithValue("@EmpUsername", email.Text);
            loginCommand.Parameters.AddWithValue("@EmpPassword", password.Text);





            DBConn.Open();

            loginCommand.Connection = DBConn;

            SqlDataReader reader = loginCommand.ExecuteReader();


            if (reader.Read())
            {
                Session["Username"] = email.Text;
                Response.Redirect("dashboardItems.aspx");
            }
            //else
            //{
            //    lblIncorrectLogin.Text = "Username and/or Password is incorrect";
            //}

            //usrnameTxtBox.Text = HttpUtility.HtmlEncode(usrnameTxtBox.Text);
            //pswrdTxtBox.Text = HttpUtility.HtmlEncode(pswrdTxtBox.Text);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCustomerAccountPage.aspx");
        }
    }
}