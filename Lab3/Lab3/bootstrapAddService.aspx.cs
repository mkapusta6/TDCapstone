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
            if (!IsPostBack)
            {
                DateTime now = DateTime.Now;

                string reqDate = now.ToString();

                r_DateLbl.Text = "Request Date: " + reqDate;
                r_DateTxtBox.Text = reqDate;
            }




            if (Application["CustomerInterest"] != null)
            {
                string customerInterest = Application["CustomerInterest"].ToString();
                serviceTxtBox.Text = customerInterest;
                serviceTypeLbl.Text = "Service Type: " + customerInterest;

            }

            if (Application["ServiceType"] != null)
            {
                string serviceType = Application["ServiceType"].ToString();
                serviceTypeTxtBox.Text = serviceType;
            }


            if (Application["CustomerName"] != null)
            {
                string custName = Application["CustomerName"].ToString();
                nameLbl.Text = "Customer Name: " + custName;
                custNameTextBox.Text = custName;
            }

            if (Application["CustomerEmail"] != null)
            {
                string custEmail = Application["CustomerEmail"].ToString();
                emailRequestLbl.Text = "Customer Email: " + custEmail;
                emailRequestTxtBox.Text = custEmail;
            }

            //if (Application["CustomerDate"] != null)
            //{
            //    string reqDate = Application["CustomerDate"].ToString();
            //    r_DateLbl.Text = "Request Date: " + reqDate;
            //    r_DateTxtBox.Text = reqDate;
            //}
        }

        protected void addServiceBtn_Click(object sender, EventArgs e)
        {
            dateLastModifiedTxtBox.Text = HttpUtility.HtmlEncode(dateLastModifiedTxtBox.Text);
            srvcDescriptionTxtBox.Text = HttpUtility.HtmlEncode(srvcDescriptionTxtBox.Text);


            

            String DBConnection;
            DBConnection = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            using (SqlConnection myConection = new SqlConnection(DBConnection))
            {


                SqlCommand otherCommand = new SqlCommand("INSERT INTO Service_T (ServiceType, dateLastModified, " +
                       "ServiceDescription) Values (@ServiceType, @dateLastModified, @ServiceDescription)", myConection);

                SqlCommand requestcommand = new SqlCommand("INSERT INTO Request(EmailRequest, ServiceType, R_Description, R_Date)" +
                    " VALUES (@EmailRequest, @ServiceType, @R_Description, @R_Date)", myConection);




                otherCommand.Parameters.AddWithValue("@ServiceType", serviceTxtBox.Text);
                Application["ServiceType"] = serviceTxtBox.Text;
                otherCommand.Parameters.AddWithValue("@dateLastModified", dateLastModifiedTxtBox.Text);
                otherCommand.Parameters.AddWithValue("@ServiceDescription", srvcDescriptionTxtBox.Text);
                Application["ServiceDescription"] = srvcDescriptionTxtBox.Text;





                requestcommand.Parameters.AddWithValue("@EmailRequest", emailRequestTxtBox.Text);
                requestcommand.Parameters.AddWithValue("@ServiceType", serviceTxtBox.Text);
                requestcommand.Parameters.AddWithValue("R_Description", srvcDescriptionTxtBox.Text);
                requestcommand.Parameters.AddWithValue("@R_Date", DateTime.Now);

                myConection.Open();
                otherCommand.ExecuteNonQuery();
                requestcommand.ExecuteNonQuery();
                //addedLbl.Text = "Service Successfully Created.";
                myConection.Close();
                Response.Redirect("bootstrapCreateNewTicket.aspx");
            }
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