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
    public partial class WebForm18 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["EmpSelected"] = EmpDropDown.SelectedValue.ToString();
                DataTable trucksTable = new DataTable();
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con.Open();

                String query = "SELECT EquipmentID, EquipmentName, EquipmentType FROM Equipment WHERE EquipmentType = @EquipmentType";
                SqlDataAdapter adapter = new SqlDataAdapter(query, con);
                adapter.SelectCommand.Parameters.AddWithValue("@EquipmentType", "Truck");

                adapter.Fill(trucksTable); 
                TruckDropDown.DataSource = trucksTable;
                TruckDropDown.DataTextField = "EquipmentName";
                TruckDropDown.DataValueField = "EquipmentID";
                TruckDropDown.DataBind();

                DataTable empTable = new DataTable();
                String query2 = "Select EmployeeID, EmployeeName FROM Employee";
                SqlDataAdapter adapter2 = new SqlDataAdapter(query2, con);
                adapter2.Fill(empTable);
                EmpDropDown.DataSource = empTable;
                EmpDropDown.DataTextField = "EmployeeName";
                EmpDropDown.DataValueField = "EmployeeID";
                EmpDropDown.DataBind();
                con.Close();
            }




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

        protected void TruckDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void EmpDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["EmpSelected"] = EmpDropDown.SelectedValue.ToString();

        }

        protected void AddEmpButton_Click(object sender, EventArgs e)
        {

        }

        protected void AddTruckButton_Click(object sender, EventArgs e)
        {

        }

        protected void EditEmpButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();
            String query = "Select * from Employee Where EmployeeID = @EmployeeID";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@EmployeeID", EmpDropDown.SelectedValue.ToString());

            SqlDataAdapter adapter = new SqlDataAdapter();

            cmd.Connection = con;
            adapter.SelectCommand = cmd;

            DataTable datatable = new DataTable();
            adapter.Fill(datatable);
            EmpDetailsView.DataSource = datatable;
            EmpDetailsView.DataBind();
            EmpDetailsView.Visible = true;
            con.Close();
        }

        protected void EditTruckButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();
            String query = "Select * from Equipment where EquipmentID = @EquipmentID";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@EquipmentID", TruckDropDown.SelectedValue.ToString());

            SqlDataAdapter adapter = new SqlDataAdapter();

            cmd.Connection = con;
            adapter.SelectCommand = cmd;

            DataTable dt = new DataTable();
            adapter.Fill(dt);
            TruckDetailsView.DataSource = dt;
            TruckDetailsView.DataBind();
            TruckDetailsView.Visible = true;
            con.Close();

        }
    }
}