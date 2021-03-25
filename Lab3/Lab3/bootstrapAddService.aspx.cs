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
    public partial class WebForm23 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["CustomerInterest"] != null)
            {
                string customerInterest = Application["CustomerInterest"].ToString();
                serviceTxtBox.Text = customerInterest;
                serviceTypeLbl.Text = "Service Type: " + customerInterest;

            }
        }

        protected void addServiceBtn_Click(object sender, EventArgs e)
        {
            dateLastModifiedTxtBox.Text = HttpUtility.HtmlEncode(dateLastModifiedTxtBox.Text);
            srvcDescriptionTxtBox.Text = HttpUtility.HtmlEncode(srvcDescriptionTxtBox.Text);


            String DBConn;

            DBConn = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;

            using (SqlConnection myConnection = new SqlConnection(DBConn))
            {
                SqlCommand MyCommand = new SqlCommand("INSERT INTO Service_T (ServiceType, dateLastModified, " +
                    "ServiceDescription) Values (@ServiceType, @dateLastModified, @ServiceDescription)", myConnection);

                MyCommand.Parameters.AddWithValue("@ServiceType", serviceTxtBox.Text);
                Application["ServiceType"] = serviceTxtBox.Text;
                MyCommand.Parameters.AddWithValue("@dateLastModified", dateLastModifiedTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@ServiceDescription", srvcDescriptionTxtBox.Text);
                Application["ServiceDescription"] = srvcDescriptionTxtBox.Text;

                myConnection.Open();
                MyCommand.ExecuteNonQuery();
                addedLbl.Text = "Service Successfully Created.";
                Response.Redirect("CreateNewTicketPage.aspx");
            }
            dateLastModifiedTxtBox.Text = String.Empty;
            srvcDescriptionTxtBox.Text = String.Empty;
            serviceTypeLbl.Text = String.Empty;
            serviceTxtBox.Text = String.Empty;
        }

        protected void populateServiceBtn_Click(object sender, EventArgs e)
        {
            dateLastModifiedTxtBox.Text = "2/12/2021";
            srvcDescriptionTxtBox.Text = "Auctioning car parts.";
        }

        protected void clearServiceBtn_Click(object sender, EventArgs e)
        {
            dateLastModifiedTxtBox.Text = String.Empty;
            srvcDescriptionTxtBox.Text = String.Empty;
            serviceTxtBox.Text = String.Empty;
            serviceTypeLbl.Text = String.Empty;
        }
    }
}