using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["CustomerDate"] != null)
            {
                string cDate = Application["CustomerDate"].ToString();
                contDateTextBox.Text = cDate;
            }
        }
    }
}