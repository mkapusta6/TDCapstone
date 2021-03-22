using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class WebForm21 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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