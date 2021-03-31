using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class navigationDash : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void searchButton_Click(object sender, EventArgs e)
        //{
        //    statusLbl.Text = String.Empty;
        //    string sqlQuery = "Select Customer.CustomerName, Customer.CustomerEmail, Customer.CustomerPhone from Customer WHERE Customer.CustomerName LIKE '%" + searchBox.Text + "%'";

        //    SqlConnection sqlConnect = new
        //    SqlConnection("Server=localhost;Database=Lab3;Trusted_Connection=Yes;");
        //    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

        //    DataTable dtforGridview = new DataTable();
        //    sqlAdapter.Fill(dtforGridview);
        //    searchForCustGrd.DataSource = dtforGridview;
        //    searchForCustGrd.DataBind();

        //    int rowCount = searchForCustGrd.Rows.Count;
        //    searchForCustGrd.DataBind();
        //    rowCount = searchForCustGrd.Rows.Count;

        //    if (rowCount <= 0)
        //    {
        //        statusLbl.Text = String.Empty;
        //        statusLbl3.Text = String.Empty;
        //        statusLbl3.Text = "Customer does not exist.";
        //    }
        //    else
        //    {
        //        statusLbl.Text = String.Empty;
        //        statusLbl2.Text = String.Empty;
        //        statusLbl2.Text = "Customer exists.";
        //    }
        //}

        //protected void notificationBtn_Click(object sender, EventArgs e)
        //{
        //    string sqlQuery = "Select EmailRequest as 'User', ServiceType as 'Service', R_Date as 'Date Generated', R_Description as 'Description' from Request";

        //    SqlConnection sqlConnect = new
        //    SqlConnection("Server=localhost;Database=Lab3;Trusted_Connection=Yes;");
        //    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

        //    DataTable dtforGridView = new DataTable();
        //    sqlAdapter.Fill(dtforGridView);
        //    searchForCustGrd.DataSource = dtforGridView;
        //    searchForCustGrd.DataBind();
        //}
    }
}