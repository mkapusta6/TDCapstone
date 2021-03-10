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
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                srvcDropDownList.Items.Add(new ListItem("Auction"));
                srvcDropDownList.Items.Add(new ListItem("Moving"));
                srvcDropDownList.Items.Add(new ListItem("Miscellaneous"));
            }

            if (Application["Username"] != null)
            {
                string email = Application["Username"].ToString();
                emailTxtBox.Text = email;

            }
        }

        protected void popBtn_Click(object sender, EventArgs e)
        {
            ticketStrtTxtBox.Text = "02/28/2021";
            descriptionTxtBox.Text = "I would like to auction my limited edition pokemon cards.";
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            ticketStrtTxtBox.Text = String.Empty;
            descriptionTxtBox.Text = String.Empty;
        }

        protected void createSrvcTckt_Click(object sender, EventArgs e)
        {
            emailTxtBox.Text = HttpUtility.HtmlEncode(emailTxtBox.Text);
            descriptionTxtBox.Text = HttpUtility.HtmlEncode(descriptionTxtBox.Text);
            ticketStrtTxtBox.Text = HttpUtility.HtmlEncode(ticketStrtTxtBox.Text);

            String DBConnection;
            DBConnection = WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString;
            using (SqlConnection myConection = new SqlConnection(DBConnection))
            {
                SqlCommand Mycommand = new SqlCommand("INSERT INTO Request(EmailRequest, ServiceType, R_Description, R_Date)" +
                    " VALUES (@EmailRequest, @ServiceType, @R_Description, @R_Date)", myConection);



                Mycommand.Parameters.AddWithValue("@EmailRequest", emailTxtBox.Text);
                Mycommand.Parameters.AddWithValue("@ServiceType", srvcDropDownList.SelectedValue);
                Mycommand.Parameters.AddWithValue("R_Description", descriptionTxtBox.Text);
                Mycommand.Parameters.AddWithValue("@R_Date", ticketStrtTxtBox.Text);

                myConection.Open();
                Mycommand.ExecuteNonQuery();
                myConection.Close();


                ticketStrtTxtBox.Text = String.Empty;
                descriptionTxtBox.Text = String.Empty;

                msgLbl.Text = "Service Request Successfully Was Made!";
            }
        }
    }
}