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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tcktHistDropDownList.Items.Add(new ListItem("New"));
                tcktHistDropDownList.Items.Add(new ListItem("In Progress"));
                tcktHistDropDownList.Items.Add(new ListItem("Completed"));
            }
        }

        protected void popuBtn_Click(object sender, EventArgs e)
        {
            tcktChangeDateTxtBox.Text = "02/27/2021";
            noteHeadingTxtBox.Text = "Test Subject";
            noteBodyTxtBox.Text = "Test Note Body Information";
        }

        protected void clearuBtn_Click(object sender, EventArgs e)
        {
            tcktChangeDateTxtBox.Text = String.Empty;
            noteHeadingTxtBox.Text = String.Empty;
            noteBodyTxtBox.Text = String.Empty;
        }

        protected void addNoteBtn_Click(object sender, EventArgs e)
        {
            tcktChangeDateTxtBox.Text = HttpUtility.HtmlEncode(tcktChangeDateTxtBox.Text);
            noteHeadingTxtBox.Text = HttpUtility.HtmlEncode(noteHeadingTxtBox.Text);
            noteBodyTxtBox.Text = HttpUtility.HtmlEncode(noteBodyTxtBox.Text);

            tcktChangeDateTxtBox.Text = DateTime.Now.ToString();

            String DBConnection;
            DBConnection = WebConfigurationManager.ConnectionStrings["Sprint1"].ConnectionString;
            using (SqlConnection myConnection = new SqlConnection(DBConnection))
            {
                SqlCommand MyCommand = new SqlCommand("INSERT INTO TicketHistory(TicketMovingStatus, TicketDateChanged, ServiceTicketID, EmployeeID, NoteHeading, NoteContents) VALUES (@TicketMovingStatus, @TicketDateChanged, @ServiceTicketID, @EmployeeID, @NoteHeading, @NoteContents)", myConnection);

                int ServiceTicketID = int.Parse(srvcTcktDropDownList1.SelectedValue);
                int EmployeeID = int.Parse(empDropDownList1.SelectedValue);

                MyCommand.Parameters.AddWithValue("@TicketMovingStatus", tcktHistDropDownList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@TicketDateChanged", tcktChangeDateTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@ServiceTicketID", srvcTcktDropDownList1.SelectedValue);
                MyCommand.Parameters.AddWithValue("@EmployeeID", empDropDownList1.SelectedValue);
                MyCommand.Parameters.AddWithValue("@NoteHeading", noteHeadingTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@NoteContents", noteBodyTxtBox.Text);

                myConnection.Open();
                MyCommand.ExecuteNonQuery();
                myConnection.Close();

                tcktChangeDateTxtBox.Text = String.Empty;
                noteHeadingTxtBox.Text = String.Empty;
                noteBodyTxtBox.Text = String.Empty;

                addedLbl.Text = "Ticket Successfuly Updated";
            }
        }
    }
}