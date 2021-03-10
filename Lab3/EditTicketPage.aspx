<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="EditTicketPage.aspx.cs" Inherits="Lab3.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Update Service Ticket</legend>
        <asp:Label ID="tcktHistStatus" runat="server" Text="Ticket Moving Status"></asp:Label>
        <asp:DropDownList
            ID="tcktHistDropDownList"
            runat="server"
            DataTextField="TicketMovingStatus"
            DataValueField ="TicketMovingStatus"
            ></asp:DropDownList>
        <br />
        <asp:Label ID="srvcTicktLbl" runat="server" Text="Service Ticket:"></asp:Label>
        <asp:DropDownList 
            ID="srvcTcktDropDownList1"
            runat="server"
            DataSourceID="dtaSrvcTckt1"
            DataTextField="ServiceTicketName"
            DataValueField="ServiceTicketID"></asp:DropDownList>
        <br />
        <asp:Label ID="empLBL" runat="server" Text="Employee"></asp:Label>
        <asp:DropDownList 
            ID="empDropDownList1"
            runat="server"
            DataSourceID="srcEMp"
            DataTextField ="EmployeeName"
            DataValueField="EmployeeID"></asp:DropDownList>
        <br />

        <asp:Label ID="noteHeadingLbl" runat="server" Text="Subject:"></asp:Label>
        <asp:TextBox ID="noteHeadingTxtBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="noteBodyLbl" runat="server" Text="Body:"></asp:Label>
        <asp:TextBox ID="noteBodyTxtBox" runat="server" TextMode="MultiLine"></asp:TextBox>
        
        <br />
        <asp:Label ID="dateChange" runat="server" Text="Date Updated:"></asp:Label>
        <asp:TextBox ID="tcktChangeDateTxtBox" runat="server"></asp:TextBox>

        <br />

        <asp:Button ID="popuBtn" runat="server" Text="Populate Fields" OnClick="popuBtn_Click" />
        <asp:Button ID="clearuBtn" runat="server" Text="Clear Fields" OnClick="clearuBtn_Click" />
        <asp:Button ID="addNoteBtn" runat="server" Text="Update" OnClick="addNoteBtn_Click" />

        <br />
        <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>

    </fieldset>

    <asp:SqlDataSource
        ID="dtaSrvcTckt1"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
        SelectCommand="Select ServiceTicketID, TicketStatus, TicketStartDate, CustomerID, ServiceID, EmployeeID, ServiceTicketName from ServiceTicket"></asp:SqlDataSource>

    <asp:SqlDataSource
        ID="srcEmp"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
        SelectCommand="Select EmployeeID, EmployeeName, EmployeePhone, CustomerEmail, EmployeeType, EmployeeTerm from Employee"></asp:SqlDataSource>

</asp:Content>

