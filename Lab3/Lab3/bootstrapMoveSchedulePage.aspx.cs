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
    public partial class WebForm28 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                foodHotelDropDownList.Items.Add(new ListItem("Yes"));
                foodHotelDropDownList.Items.Add(new ListItem("No"));

                DateTime now = DateTime.Now;

                string reqDate = now.ToString();

                r_DateLbl.Text = "Request Date: " + reqDate;
                r_DateTxtBox.Text = reqDate;

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






            if (Application["CAddress"] != null)
            {
                string address = Application["CAddress"].ToString();
                //addressTxtBox.Text = address;
            }

            if (Application["LookAtDate"] != null)
            {
                string lookAt = Application["LookAtDate"].ToString();
                lookAtTxtBox.Text = lookAt;
            }


            if (Application["CustomerInterest"] != null)
            {
                string customerInterest = Application["CustomerInterest"].ToString();
                serviceTxtBox.Text = customerInterest;
                serviceTypeLbl.Text = "Service Type: " + customerInterest;

            }

            

            if (Application["CustomerName"] != null)
            {
                string custName = Application["CustomerName"].ToString();
                nameLbl.Text = "Customer Name: " + custName;
                custNameTextBox.Text = custName;
            }

            if (Application["CustomerEmail"] != null)
            {
                string custEmail = Application["CustomerEmail"].ToString();
                emailRequestLbl.Text = "Customer Email: " + custEmail;
                emailRequestTxtBox.Text = custEmail;
            }


            String DBConn;

            DBConn = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;


            using (SqlConnection myConnection = new SqlConnection(DBConn))
            {


                //Query for getting Count
                string QueryCnt = "select count(*) from dbo.Customer";
                string QueryCntSD = "select count(*) from Service_T";
                string QueryCntMV = "select count(*) from Moving";

                //Execute Queries and save results into variables
                SqlCommand CmdCnt = myConnection.CreateCommand();
                CmdCnt.CommandText = QueryCnt;
                SqlCommand CmdCntSD = myConnection.CreateCommand();
                CmdCntSD.CommandText = QueryCntSD;
                SqlCommand CmdCntMV = myConnection.CreateCommand();
                CmdCntMV.CommandText = QueryCntMV;


                myConnection.Open();
                Int32 CustomerCnt = (Int32)CmdCnt.ExecuteScalar();
                int count = CustomerCnt - 1;
                Int32 SDCnt = (Int32)CmdCntSD.ExecuteScalar();
                int sdCount = SDCnt;
                Int32 moveCount = (Int32)CmdCntMV.ExecuteScalar();
                int mvCount = moveCount;
                myConnection.Close();


                moveTitleLst.SelectedIndex = mvCount - 1;
                moveForDdl.SelectedIndex = count;
                srvcDdl.SelectedIndex = sdCount - 1;

                //string i = CustomerCnt.ToString();
                //valDropDownList1.Items.Add(new ListItem(i));
            }
        }

        protected void AddTruckButton_Click(object sender, EventArgs e)
        {

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

        protected void AddEmpButton_Click(object sender, EventArgs e)
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

        protected void TruckDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void EmpDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["EmpSelected"] = EmpDropDown.SelectedValue.ToString();

        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            String DBConnection;
            DBConnection = WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
            using (SqlConnection myConnection = new SqlConnection(DBConnection))
            {
                SqlCommand MyCommand = new SqlCommand("INSERT INTO Moving(MoveName, PricingMethod, ContractPrice, FinalDate, FromAddress, ToAddress, CustomerID)" +
                    " VALUES (@MoveName, @PricingMethod, @ContractPrice, @FinalDate, @FromAddress, @ToAddress, @CustomerID)", myConnection);

                SqlCommand otherMyCommand = new SqlCommand("INSERT INTO MovingEmployeeEquipmentInv (MovingID, EmployeeID, ServiceTicketID, TruckName, CostOfSupplies, Mours, Milage, Fuel, Insurance, CostOfEachWorker, FoodHotelReq," +
                    " MenAmount, FromAddress, ToAddress) VALUES (@MovingID, @EmployeeID, @ServiceTicketID, @TruckName, @CostOfSupplies, @Mours, @Milage, @Fuel, @Insurance, @CostOfEachWorker, @FoodHotelReq," +
                    " @MenAmount, @FromAddress, @ToAddress)", myConnection);



                otherMyCommand.Parameters.AddWithValue("@MovingID", moveTitleLst.SelectedValue);
                otherMyCommand.Parameters.AddWithValue("@EmployeeID", EmpDropDown.SelectedValue);

                otherMyCommand.Parameters.AddWithValue("@ServiceTicketID", srvcDdl.SelectedValue);
                otherMyCommand.Parameters.AddWithValue("@TruckName", TruckDropDown.SelectedValue);
                otherMyCommand.Parameters.AddWithValue("@CostOfSupplies", suppliesTextBox2.Text);

                otherMyCommand.Parameters.AddWithValue("@Mours", mHoursTextBox3.Text);
                otherMyCommand.Parameters.AddWithValue("@Milage", milageTextBox.Text);

                otherMyCommand.Parameters.AddWithValue("@Fuel", fuelTextBox.Text);
                otherMyCommand.Parameters.AddWithValue("@Insurance", insuranceTextBox.Text);
                otherMyCommand.Parameters.AddWithValue("@costOfEachWorker", workerCostTextBox.Text);
                otherMyCommand.Parameters.AddWithValue("@FoodHotelReq", foodHotelDropDownList.SelectedValue);
                otherMyCommand.Parameters.AddWithValue("@MenAmount", menAmountTextBox.Text);
                otherMyCommand.Parameters.AddWithValue("@FromAddress", fromTextBox.Text);
                otherMyCommand.Parameters.AddWithValue("@ToAddress", toTextBox2.Text);

                string moveName = moveTitleLst.SelectedValue.ToString();
                MyCommand.Parameters.AddWithValue("@MoveName", moveName);
                MyCommand.Parameters.AddWithValue("@PricingMethod", pricingTextBox.Text);
                MyCommand.Parameters.AddWithValue("@ContractPrice", contractTextBox1.Text);
                MyCommand.Parameters.AddWithValue("@FinalDate", moveDateFinalTxtBox.Text);
                MyCommand.Parameters.AddWithValue("@FromAddress", fromTextBox.Text);
                MyCommand.Parameters.AddWithValue("@ToAddress", toTextBox2.Text);
                MyCommand.Parameters.AddWithValue("@CustomerID", moveForDdl.SelectedValue);



                myConnection.Open();
                otherMyCommand.ExecuteNonQuery();
                MyCommand.ExecuteNonQuery();
                myConnection.Close();

                fromTextBox.Text = String.Empty;
                toTextBox2.Text = String.Empty;
                pricingTextBox.Text = String.Empty;
                numTrucksTextBox.Text = String.Empty;
                menAmountTextBox.Text = String.Empty;
                contractTextBox1.Text = String.Empty;
                suppliesTextBox2.Text = String.Empty;
                mHoursTextBox3.Text = String.Empty;
                milageTextBox.Text = String.Empty;
                fuelTextBox.Text = String.Empty;
                insuranceTextBox.Text = String.Empty;
                workerCostTextBox.Text = String.Empty;

                addedLbl.Text = "Auction Successfully Added";

                Response.Redirect("bootstrapCompletionForm.aspx");
            }
        }

        protected void ButtonClr_Click(object sender, EventArgs e)
        {
            fromTextBox.Text = String.Empty;
            toTextBox2.Text = String.Empty;
            pricingTextBox.Text = String.Empty;
            numTrucksTextBox.Text = String.Empty;
            menAmountTextBox.Text = String.Empty;
            contractTextBox1.Text = String.Empty;
            suppliesTextBox2.Text = String.Empty;
            mHoursTextBox3.Text = String.Empty;
            milageTextBox.Text = String.Empty;
            fuelTextBox.Text = String.Empty;
            insuranceTextBox.Text = String.Empty;
            workerCostTextBox.Text = String.Empty;
        }

        protected void ButtonPop_Click(object sender, EventArgs e)
        {
            fromTextBox.Text = "11811 Woodland View";
            toTextBox2.Text = "22391 WoddPark Ln";
            pricingTextBox.Text = "Estimate";
            numTrucksTextBox.Text = "2";
            menAmountTextBox.Text = "3";
            contractTextBox1.Text = "120.00";
            suppliesTextBox2.Text = "24.00";
            mHoursTextBox3.Text = "15";
            milageTextBox.Text = "24";
            fuelTextBox.Text = "4 Galllons";
            insuranceTextBox.Text = "Progressive";
            workerCostTextBox.Text = "40.00";


        }
    }
}