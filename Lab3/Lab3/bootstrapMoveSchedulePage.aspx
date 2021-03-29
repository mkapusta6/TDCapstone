<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootstrapMoveSchedulePage.aspx.cs" Inherits="Lab3.WebForm28" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container col-6">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="lblCreateNewCustomer" runat="server" Text="Move Scheduling Form" Class="h3 m-2"></asp:Label>

            </div>
            <br />
            <br />
    <fieldset>
        <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green"></asp:Label>
        <legend>Move Form</legend>
    <%--use application to get address and look at date--%>
        <asp:Label ID="moveNameLbl" runat="server" Text="Move Title:"></asp:Label>
        <asp:DropDownList ID="moveTitleLst" runat="server" DataSourceID="dtaSrcMove" AutoPostBack="true" DataTextField="MoveName" DataValueField ="MovingID" CssClass="form-control"></asp:DropDownList>
        <br />
        <asp:Label ID="moveForLbl" runat="server" Text="Move For:"></asp:Label>
        <asp:DropDownList ID="moveForDdl" runat="server" DataSourceID="dtaSrcCust" DataTextField="CustomerName" DataValueField="CustomerID" CssClass="form-control"></asp:DropDownList>
        <br />
        <asp:Label ID="srvcLbl" runat="server" Text="Service Ticket:"></asp:Label>
        <asp:DropDownList ID="srvcDdl" runat="server" DataSourceID="date1Src" DataTextField="ServiceTicketName" DataValueField="ServiceTicketID" CssClass="form-control"></asp:DropDownList>
        <br />
        <asp:Label ID="fromAddress" runat="server" Text="From Address:"></asp:Label>
        <asp:TextBox ID="fromTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Label ID="toAddress" runat="server" Text="To Address:"></asp:Label>
        <asp:TextBox ID="toTextBox2" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="lookAtLbl" runat="server" Text="Look At Date:"></asp:Label>
        <asp:TextBox ID="lookAtTxtBox" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        <br />
    <asp:Label ID="moveDateFinalLbl" runat="server" Text="Move Date Final:"></asp:Label>
    <asp:TextBox ID="moveDateFinalTxtBox" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    <br />
        <asp:Label ID="pricingMethodLbl" runat="server" Text="Pricing Method:"></asp:Label>
        <asp:TextBox ID="pricingTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="numOfTrucks" runat="server" Text="# Of Trucks:"></asp:Label>
        <asp:TextBox ID="numTrucksTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:DropDownList 
            ID="TruckDropDown" 
            runat="server"
            AutoPostBack="true"
            onSelectedIndexChanged="TruckDropDown_SelectedIndexChanged"
            class="form-control"
            ></asp:DropDownList>
        <asp:Button ID="AddTruckButton" runat="server" Text="Add Truck to Move" OnClick="AddTruckButton_Click" CssClass="btn btn-secondary" />
        <asp:Button ID="EditTruckButton" runat="server" Text="Edit Selected Truck Information" OnClick="EditTruckButton_Click" CssClass="btn btn-secondary"  />
        <asp:DetailsView 
            ID="TruckDetailsView" 
            runat="server" 
            Height="50px" 
            Width="125px"
            AutoGenerateRows="true"
            DataKeyNames="EquipmentID"
            visible="false"></asp:DetailsView>
        <br />
        <asp:Label ID="menAmountLbl" runat="server" Text="# Of Men:"></asp:Label>
        <asp:TextBox ID="menAmountTextBox" runat="server" CssClass="form-control"></asp:TextBox><br />
        <br />
        <asp:DropDownList 
            ID="EmpDropDown" 
            runat="server"
            OnSelectedIndexChanged="EmpDropDown_SelectedIndexChanged"
            class="form-control"></asp:DropDownList>
        <asp:Button ID="AddEmpButton" runat="server" Text="Add Employee To Move" OnClick="AddEmpButton_Click" CssClass="btn btn-secondary"  />
        <asp:Button ID="EditEmpButton" runat="server" Text="Edit Selected Employee Information" OnClick="EditEmpButton_Click" CssClass="btn btn-secondary"  />
        <asp:DetailsView 
            ID="EmpDetailsView" 
            runat="server" 
            Height="50px"  
            Width="125px"
            AutoGenerateRows="true"
            DataKeyNames="EmployeeID"
            visible="false"
            ></asp:DetailsView>
        <br />
        <asp:Label ID="contractPriceLbl" runat="server" Text="Contract Price Estimate:"></asp:Label>
        <asp:TextBox ID="contractTextBox1" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="costOfSuppliesLabel" runat="server" Text="Cost Of Supplies:"></asp:Label>
        <asp:TextBox ID="suppliesTextBox2" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="mHoursLbl" runat="server" Text="Estimated Time:"></asp:Label>
        <asp:TextBox ID="mHoursTextBox3" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="milageLabel" runat="server" Text="Milage:"></asp:Label>
        <asp:TextBox ID="milageTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="fuelLabel" runat="server" Text="Fuel:"></asp:Label>
        <asp:TextBox ID="fuelTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="insuranceLabel" runat="server" Text="Insurance:"></asp:Label>
        <asp:TextBox ID="insuranceTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="workerCostLabel" runat="server" Text="Cost Per Worker:"></asp:Label>
        <asp:TextBox ID="workerCostTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="foodHotelLabel" runat="server" Text="Food/Hotel?:"></asp:Label>
        <asp:DropDownList ID="foodHotelDropDownList" DataTextField="FoodHotelReq" DataValueField="FoodHotelReq" runat="server" CssClass="form-control"></asp:DropDownList>
        
        <br />

        <asp:Button ID="Button1" runat="server" Text="Clear Fields" CssClass="btn btn-success btn-sm" />
        <asp:Button ID="Button2" runat="server" Text="Button" CssClass="btn btn-success btn-sm" />
        <asp:Button ID="submitBtn" runat="server" Text="Submit" CssClass="btn btn-warning" OnClick="submitBtn_Click"/>

    </fieldset>

            <asp:SqlDataSource ID="dtaSrcMove" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand ="Select MovingID, MoveName from Moving"
    ></asp:SqlDataSource>


            <asp:SqlDataSource ID="date1Src" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand ="Select ServiceTicketID, ServiceTicketName from ServiceTicket"></asp:SqlDataSource>

             <asp:SqlDataSource ID="dtaSrcCust" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand ="Select CustomerID, CustomerFirstName, CustomerLastName, InitialContact, Discovered, CustomerPhone, CustomerInterest, CustomerEmail, CustomerState, CustomerCity, CustomerZip, CustomerDate, CustomerName from Customer"
    ></asp:SqlDataSource>

</asp:Content>
