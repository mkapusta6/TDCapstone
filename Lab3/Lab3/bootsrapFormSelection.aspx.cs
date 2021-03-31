using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class WebForm22 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void initialContactFormButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("bootsrapInitialContact.aspx");
        }

        protected void serviceFormBtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("bootstrapCreateNewTicket.aspx");
        }

        protected void auctionSchedulingFormBtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("bootstrapAuctionScheduling.aspx");
        }

        protected void movingFormBtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("bootstrapMovingForm.aspx");
        }

        protected void movingScheduleFormBtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("bootstrapMoveSchedulePage.aspx");
        }

        protected void pickUpFormBtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("bootstrapAuctionPickUpPage.aspx");
        }

        protected void completionFormBtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("bootstrapCompletionForm.aspx");
        }
    }
}