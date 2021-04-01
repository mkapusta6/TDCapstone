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
    public partial class WebForm21 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            String query2 = "Select * from Request";

            SqlCommand cmd1 = new SqlCommand(query2, con);
            SqlDataReader reader = cmd1.ExecuteReader();


            // Logic to make sure duplicate customer names cannot be added
            if (!IsPostBack && reader.HasRows)
            {
                //Response.Write("<script>alert('You have a(n) new service request(s)')</script>");
                //Make go away after clicking view requests button
                pushNotificationLabel.Text = "You have a(n) new service request(s)";
            }
            else
            {
                reader.Close();
            }
        }

        protected void formsBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("bootsrapFormSelection.aspx");
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            statusLbl.Text = String.Empty;
            string sqlQuery = "Select Customer.CustomerName, Customer.CustomerEmail, Customer.CustomerPhone from Customer WHERE Customer.CustomerName LIKE '%" + searchBox.Text + "%'";

            SqlConnection sqlConnect = new
            SqlConnection("Server=localhost;Database=Lab3;Trusted_Connection=Yes;");
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable dtforGridview = new DataTable();
            sqlAdapter.Fill(dtforGridview);
            searchForCustGrd.DataSource = dtforGridview;
            searchForCustGrd.DataBind();

            int rowCount = searchForCustGrd.Rows.Count;
            searchForCustGrd.DataBind();
            rowCount = searchForCustGrd.Rows.Count;

            if (rowCount <= 0)
            {
                statusLbl.Text = String.Empty;
                statusLbl3.Text = String.Empty;
                statusLbl3.Text = "Customer does not exist.";
            }
            else
            {
                statusLbl.Text = String.Empty;
                statusLbl2.Text = String.Empty;
                statusLbl2.Text = "Customer exists.";
            }
        }

        protected void notificationBtn_Click(object sender, EventArgs e)
        {
           // string sqlQuery = "Select EmailRequest as 'User', ServiceType as 'Service', R_Date as 'Date Generated', R_Description as 'Description' from Request";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            //SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            //DataTable dtforGridView = new DataTable();
            //sqlAdapter.Fill(dtforGridView);
            //searchForCustGrd.DataSource = dtforGridView;
            //searchForCustGrd.DataBind();


            string sqlQuery2 = "Select RequestID, EmailRequest, ServiceType, R_Description, R_Date from Request";
            SqlDataAdapter adapter2 = new SqlDataAdapter(sqlQuery2, sqlConnect);

            DataTable dtforRequests = new DataTable();
            adapter2.Fill(dtforRequests);
            RequestGrid.DataSource = dtforRequests;
            RequestGrid.DataBind();
        }

        protected void RequestGrid_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                //Response.Redirect("bootstrapMovingForm.aspx");

                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow selectedRow = RequestGrid.Rows[index];

                int requestID = (int)RequestGrid.DataKeys[selectedRow.RowIndex].Value;


                TableCell email = selectedRow.Cells[1];
                TableCell serviceType = selectedRow.Cells[2];
                TableCell description = selectedRow.Cells[3];
                TableCell date = selectedRow.Cells[4];

                Session["RequestID"] = requestID.ToString();
                Session["email"] = email.Text;
                Session["serviceType"] = serviceType.Text;
                Session["description"] = description.Text;
                Session["date"] = date.Text;

                if (serviceType.Text == "Auction")
                {
                    Response.Redirect("bootstrapAuctionPickUpPage.aspx");
                }
                else if (serviceType.Text == "Moving")
                {
                    Response.Redirect("bootstrapMovingForm.aspx");
                }
            }
        }

        // This is aspx side from example
        //        <%this is the client side code for the design and display%>
        //<asp:Panel ID = "Panel1" runat="server" DefaultButton="btnSubmit">
        //    <p>
        //        Please Fill the Following to Send Mail.</p>
        //    <p>
        //        Your name:
        //        <asp:RequiredFieldValidator ID = "RequiredFieldValidator11" runat="server" ErrorMessage="*"
        //            ControlToValidate="YourName" ValidationGroup="save" /><br />
        //        <asp:TextBox ID = "YourName" runat="server" Width="250px" /><br />
        //        Your email address:
        //        <asp:RequiredFieldValidator ID = "RequiredFieldValidator1" runat="server" ErrorMessage="*"
        //            ControlToValidate="YourEmail" ValidationGroup="save" /><br />
        //        <asp:TextBox ID = "YourEmail" runat="server" Width="250px" />
        //        <asp:RegularExpressionValidator runat = "server" ID="RegularExpressionValidator23"
        //            SetFocusOnError="true" Text="Example: username@gmail.com" ControlToValidate="YourEmail"
        //            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
        //            ValidationGroup="save" /><br />
        //        Subject:
        //        <asp:RequiredFieldValidator ID = "RequiredFieldValidator2" runat="server" ErrorMessage="*"
        //            ControlToValidate="YourSubject" ValidationGroup="save" /><br />
        //        <asp:TextBox ID = "YourSubject" runat="server" Width="400px" /><br />
        //        Your Question:
        //        <asp:RequiredFieldValidator ID = "RequiredFieldValidator3" runat="server" ErrorMessage="*"
        //            ControlToValidate="Comments" ValidationGroup="save" /><br />
        //        <asp:TextBox ID = "Comments" runat="server" 
        //                TextMode="MultiLine" Rows="10" Width="400px" />
        //    </p>
        //    <p>
        //        <asp:Button ID = "btnSubmit" runat="server" Text="Send" 
        //                    OnClick="Button1_Click" ValidationGroup="save" />
        //    </p>
        //</asp:Panel>
        //<p>
        //    <asp:Label ID = "DisplayMessage" runat="server" Visible="false" />
        //</p>  
        //    }

        // This is C# side to get email to send
        //protected void SendMail()
        //{
        //    // Gmail Address from where you send the mail
        //    var fromAddress = "Gmail@gmail.com";
        //    // any address where the email will be sending
        //    var toAddress = YourEmail.Text.ToString();
        //    //Password of your gmail address
        //    const string fromPassword = "Password";
        //    // Passing the values and make a email formate to display
        //    string subject = YourSubject.Text.ToString();
        //    string body = "From: " + YourName.Text + "\n";
        //    body += "Email: " + YourEmail.Text + "\n";
        //    body += "Subject: " + YourSubject.Text + "\n";
        //    body += "Question: \n" + Comments.Text + "\n";
        //    // smtp settings
        //    var smtp = new System.Net.Mail.SmtpClient();
        //    {
        //        smtp.Host = "smtp.gmail.com";
        //        smtp.Port = 587;
        //        smtp.EnableSsl = true;
        //        smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
        //        smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
        //        smtp.Timeout = 20000;
        //    }
        //    // Passing values to smtp object
        //    smtp.Send(fromAddress, toAddress, subject, body);
        //}

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        //here on button click what will done 
        //        SendMail();
        //        DisplayMessage.Text = "Your Comments after sending the mail";
        //        DisplayMessage.Visible = true;
        //        YourSubject.Text = "";
        //        YourEmail.Text = "";
        //        YourName.Text = "";
        //        Comments.Text = "";
        //    }
        //    catch (Exception) { }
        //}
    }
}