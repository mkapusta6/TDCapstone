<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="MoveSchedulePage.aspx.cs" Inherits="Lab3.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Move Schedule Form</legend>
    <%--use application to get address and look at date--%>
        <asp:Label ID="addressLbl" runat="server" Text="Address:"></asp:Label>
        <asp:TextBox ID="addressTxtBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lookAtLbl" runat="server" Text="Look At Date:"></asp:Label>
        <asp:TextBox ID="lookAtTxtBox" runat="server"></asp:TextBox>
        <br />
    <asp:Label ID="moveDateFinalLbl" runat="server" Text="Move Date Final:"></asp:Label>
    <asp:TextBox ID="moveDateFinalTxtBox" runat="server"></asp:TextBox>
    <br />
        <asp:Label ID="pricingMethodLbl" runat="server" Text="Pricing Method:"></asp:Label>
        <asp:TextBox ID="pricingTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="numOfTrucks" runat="server" Text="# Of Trucks:"></asp:Label>
        <asp:TextBox ID="numTrucksTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:DropDownList 
            ID="TruckDropDown" 
            runat="server"
            AutoPostBack="true"
            onSelectedIndexChanged="TruckDropDown_SelectedIndexChanged"
            ></asp:DropDownList>
        <asp:Button ID="AddTruckButton" runat="server" Text="Add Truck to Move" OnClick="AddTruckButton_Click" />
        <asp:Button ID="EditTruckButton" runat="server" Text="Edit Selected Truck Information" OnClick="EditTruckButton_Click" />
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
        <asp:TextBox ID="menAmountTextBox" runat="server"></asp:TextBox><br />
        <br />
        <asp:DropDownList 
            ID="EmpDropDown" 
            runat="server"
            OnSelectedIndexChanged="EmpDropDown_SelectedIndexChanged"></asp:DropDownList>
        <asp:Button ID="AddEmpButton" runat="server" Text="Add Employee To Move" OnClick="AddEmpButton_Click" />
        <asp:Button ID="EditEmpButton" runat="server" Text="Edit Selected Employee Information" OnClick="EditEmpButton_Click" />
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
        <asp:TextBox ID="contractTextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="costOfSuppliesLabel" runat="server" Text="Cost Of Supplies:"></asp:Label>
        <asp:TextBox ID="suppliesTextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="mHoursLbl" runat="server" Text="Estimated Time:"></asp:Label>
        <asp:TextBox ID="mHoursTextBox3" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="milageLabel" runat="server" Text="Milage:"></asp:Label>
        <asp:TextBox ID="milageTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="fuelLabel" runat="server" Text="Fuel:"></asp:Label>
        <asp:TextBox ID="fuelTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="insuranceLabel" runat="server" Text="Insurance:"></asp:Label>
        <asp:TextBox ID="insuranceTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="workerCostLabel" runat="server" Text="Cost Per Worker:"></asp:Label>
        <asp:TextBox ID="workerCostTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="foodHotelLabel" runat="server" Text="Food/Hotel?:"></asp:Label>
        <asp:DropDownList ID="foodHotelDropDownList" DataTextField="FoodHotelReq" DataValueField="FoodHotelReq" runat="server"></asp:DropDownList>
        <br />

    </fieldset>
      
</asp:Content>
