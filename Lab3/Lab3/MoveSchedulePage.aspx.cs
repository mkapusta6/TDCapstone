using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            foodHotelDropDownList.Items.Add(new ListItem("Yes"));
            foodHotelDropDownList.Items.Add(new ListItem("No"));

            if (Application["CAddress"] != null)
            {
                string address = Application["CAddress"].ToString();
                addressTxtBox.Text = address;
            }

           if (Application["LookAtDate"] != null)
            {
                string lookAt = Application["LookAtDate"].ToString();
                lookAtTxtBox.Text = lookAt;
            }
        }

        protected void truckListBtn_Click(object sender, EventArgs e)
        {

        }

        protected void empListBtn_Click(object sender, EventArgs e)
        {

        }
    }
}