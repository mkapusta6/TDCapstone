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
    public partial class WebForm26 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                storiesDropDownList.Items.Add(new ListItem("1"));
                storiesDropDownList.Items.Add(new ListItem("2"));
                storiesDropDownList.Items.Add(new ListItem("3"));
                storiesDropDownList.Items.Add(new ListItem("4"));

                distDropDownList.Items.Add(new ListItem("Far"));
                distDropDownList.Items.Add(new ListItem("Medium"));
                distDropDownList.Items.Add(new ListItem("Close"));


                dwayDropDownList1.Items.Add(new ListItem("Excellent"));
                dwayDropDownList1.Items.Add(new ListItem("Fair"));
                dwayDropDownList1.Items.Add(new ListItem("Poor"));

                loadDropDownList.Items.Add(new ListItem("Poor Access For Truck"));
                loadDropDownList.Items.Add(new ListItem("Narrow Gates"));
                loadDropDownList.Items.Add(new ListItem("Steep Driveway"));
                loadDropDownList.Items.Add(new ListItem("Normal"));

                sectionDropDownList.Items.Add(new ListItem("Main"));
                sectionDropDownList.Items.Add(new ListItem("Living Room"));
                sectionDropDownList.Items.Add(new ListItem("Library"));
                sectionDropDownList.Items.Add(new ListItem("Dining Room"));
                sectionDropDownList.Items.Add(new ListItem("Laundry Room"));
                sectionDropDownList.Items.Add(new ListItem("Basement"));
                sectionDropDownList.Items.Add(new ListItem("Attic"));
                sectionDropDownList.Items.Add(new ListItem("Garage"));
                sectionDropDownList.Items.Add(new ListItem("Bedroom #1"));
                sectionDropDownList.Items.Add(new ListItem("Bedroom #2"));
                sectionDropDownList.Items.Add(new ListItem("Bedroom #3"));
                sectionDropDownList.Items.Add(new ListItem("Bedroom #4"));


                floorDropDownList.Items.Add(new ListItem("1"));
                floorDropDownList.Items.Add(new ListItem("2"));
                floorDropDownList.Items.Add(new ListItem("3"));
                floorDropDownList.Items.Add(new ListItem("4"));

                valDropDownList1.Items.Add(new ListItem("High"));
                valDropDownList1.Items.Add(new ListItem("Medium"));
                valDropDownList1.Items.Add(new ListItem("Low"));






            }
        }

        protected void popBtn_Click(object sender, EventArgs e)
        {
            boxTypeTxtBox.Text = "taped";
            numBoxTxtBox.Text = "4";
            blanketTextBox.Text = "Necessary";
            itemsTextBox.Text = "Cards";
            accessTextBox.Text = "Low Ceilings";
            notesTextBox.Text = "Come through basement door.";
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            boxTypeTxtBox.Text = String.Empty;
            numBoxTxtBox.Text = String.Empty;
            blanketTextBox.Text = String.Empty;
            itemsTextBox.Text = String.Empty;
            accessTextBox.Text = String.Empty;
            notesTextBox.Text = String.Empty;
        }

        protected void createSrvcTckt_Click(object sender, EventArgs e)
        {
            String DBConn;

            DBConn = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;


            using (SqlConnection myConnection = new SqlConnection(DBConn))
            {


                SqlCommand MyCommand = new SqlCommand("INSERT INTO Moving (MoveName, HouseStories, DistanceFromTruck, DrivewayAccessibility, LoadingConditions, HouseSection, Mfloor, " +
                    "BoxType, NumberOfBoxes, Blankets, Items, Accessibility, ValueOfItem, AdditionalNotes, CustomerID) Values (@MoveName, @HouseStories, @DistanceFromTruck, " +
                    "@DrivewayAccessibility, @LoadingConditions, @HouseSection, @Mfloor, @BoxType, @NumberOfBoxes, @Blankets, @Items, @Accessibility," +
                    " @ValueOfItem, @AdditionalNotes, @CustomerID)", myConnection);


                int CustomerID = int.Parse(customerDropDownList.SelectedValue);

                MyCommand.Parameters.AddWithValue("@MoveName", moveNameTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@HouseStories", storiesDropDownList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@DistanceFromTruck", distDropDownList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@DrivewayAccessibility", dwayDropDownList1.SelectedValue);
                MyCommand.Parameters.AddWithValue("@LoadingConditions", loadDropDownList.SelectedValue);

                MyCommand.Parameters.AddWithValue("@HouseSection", sectionDropDownList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@Mfloor", floorDropDownList.SelectedValue);

                //MyCommand.Parameters.AddWithValue("@Media", mediaTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@BoxType", boxTypeTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@NumberOfBoxes", numBoxTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@Blankets", blanketTextBox.Text);
                MyCommand.Parameters.AddWithValue("@Items", itemsTextBox.Text);

                MyCommand.Parameters.AddWithValue("@Accessibility", accessTextBox.Text);
                MyCommand.Parameters.AddWithValue("@ValueOfItem", valDropDownList1.SelectedValue);
                MyCommand.Parameters.AddWithValue("@AdditionalNotes", notesTextBox.Text);


                MyCommand.Parameters.AddWithValue("@CustomerID", customerDropDownList.SelectedValue);


                myConnection.Open();
                MyCommand.ExecuteNonQuery();

                boxTypeTxtBox.Text = String.Empty;
                numBoxTxtBox.Text = String.Empty;
                blanketTextBox.Text = String.Empty;
                itemsTextBox.Text = String.Empty;
                accessTextBox.Text = String.Empty;
                notesTextBox.Text = String.Empty;

                addedLbl.Text = "Form Successfully Submitted";
            }
        }
    }
}