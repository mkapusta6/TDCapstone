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

        protected void ConfirmedBringInDate_SelectionChanged(object sender, EventArgs e)
        {
            bringInTextBox2.Text = ConfirmedBringInDate.SelectedDate.ToString();
        }

        protected void ConfirmedPickupDateCld_SelectionChanged(object sender, EventArgs e)
        {
            pickUpTextBox3.Text = ConfirmedPickupDateCld.SelectedDate.ToString();
        }

        protected void ConfirmedLookAtDateCld_SelectionChanged(object sender, EventArgs e)
        {
            lookAtTextBox4.Text = ConfirmedLookAtDateCld.SelectedDate.ToString();
        }

        protected void ConfirmedAppraisalDateCld_SelectionChanged(object sender, EventArgs e)
        {
            appraisalTextBox5.Text = ConfirmedAppraisalDateCld.SelectedDate.ToString();
        }

        protected void ConfirmedSaleDateCld_SelectionChanged(object sender, EventArgs e)
        {
            saleDateTextBox6.Text = ConfirmedSaleDateCld.SelectedDate.ToString();
        }

        protected void PossibleBringInDateCld_SelectionChanged(object sender, EventArgs e)
        {
            PossibleBringInTBox.Text = PossibleBringInDateCld.SelectedDate.ToString();
        }

        protected void PossiblePickUpCld_SelectionChanged(object sender, EventArgs e)
        {
            PossiblePickUpTBox.Text = PossiblePickUpCld.SelectedDate.ToString();
        }

        protected void PossibleLookAtCld_SelectionChanged(object sender, EventArgs e)
        {
            PossibleLookAtTBox.Text = PossibleLookAtCld.SelectedDate.ToString();
        }

        protected void PossibleAppraisalCld_SelectionChanged(object sender, EventArgs e)
        {
            PossibleAppraisalTBox.Text = PossibleAppraisalCld.SelectedDate.ToString();
        }

        protected void PossibleSaleDateCld_SelectionChanged(object sender, EventArgs e)
        {
            PossibleSaleDateTBox.Text = PossibleSaleDateCld.SelectedDate.ToString();
        }
    }
}