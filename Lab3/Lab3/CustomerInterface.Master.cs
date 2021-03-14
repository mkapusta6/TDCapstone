using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class CustomerInterface : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["Username"] != null)
            {
                string Name = Application["Username"].ToString();
                custName.Text = "User: " + Name;
            }

        }

        protected void logOutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginDecisionPage.aspx");

        }
    }
}