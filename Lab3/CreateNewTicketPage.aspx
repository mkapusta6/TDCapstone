<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="CreateNewTicketPage.aspx.cs" Inherits="Lab3.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Create New Service Ticket</legend>
        <asp:Label ID="srvcTcktName" runat="server" Text="Service Ticket Name:"></asp:Label>
        <asp:TextBox ID="tcktNameTxtBox" runat="server" style="margin-left: 25px"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="tcktNameRequiredFieldValidator" 
            ControlToValidate="tcktNameTxtBox" 
            runat="server" 
            ErrorMessage="Ticket Name Required" 
            ForeColor="Red"></asp:RequiredFieldValidator>
        
        <br />

        <asp:Label ID="tcktStatusLbl" runat="server" Text="Ticket Status:"></asp:Label>
        <asp:DropDownList 
            ID="tcktStatusDropDownList"
            runat="server"
            DataTextField ="TicketStatus"
            DataValueFIeld ="TicketStatus" style="margin-left: 86px"
            ></asp:DropDownList>
        
        <br />

        <asp:Label ID="custLbl" runat="server" Text="Customer:"></asp:Label>
        <asp:DropDownList 
            ID="custDropDownList" 
            runat="server"
            DataSourceID ="dtaSrcCust"
            DataTextField="CustomerName"
            DataValueField="CustomerID" style="margin-left: 102px"
            ></asp:DropDownList>
        
        <br />

        <asp:Label ID="srvcLbl" runat="server" Text="Service:"></asp:Label>
        <asp:DropDownList 
            ID="srvcDropDownList" 
            runat="server"
            DataSourceID ="dtaSrcSrvc"
            DataTextField="ServiceDescription"
            DataValueField="ServiceID" style="margin-left: 117px"
            ></asp:DropDownList>
        
        <br />

        <asp:Label ID="empLbl" runat="server" Text="Employee:"></asp:Label>
        <asp:DropDownList 
            ID="empDropDownList"
            runat="server"
            DataSourceID="dtaSrcEmp"
            DataTextField ="EmployeeName"
            DataValueField="EmployeeID" style="margin-left: 103px"
            ></asp:DropDownList>

        <br />

        <asp:Label ID="ticketStrtLbl" runat="server" Text="Date Started:"></asp:Label>
        <asp:TextBox ID="ticketStrtTxtBox" runat="server" style="margin-left: 67px"></asp:TextBox> Format: DD/MM/YYYY
        <asp:RequiredFieldValidator 
            ID="tcktStartRequiredFieldValidator" 
            ControlToValidate="ticketStrtTxtBox" 
            runat="server" 
            ErrorMessage="Date Required" 
            ForeColor="Red"></asp:RequiredFieldValidator>
        
        <br />

        <asp:Button ID="popBtn" runat="server" Text="Populate Fields" OnClick="popBtn_Click" CausesValidation="false"/>
        <asp:Button ID="clearBtn" runat="server" Text="Clear Fields" OnClick="clearBtn_Click" CausesValidation="false"/>
        <asp:Button ID="createSrvcTckt" runat="server" Text="Create Service Ticket" OnClick="createSrvcTckt_Click"/>
        
        <br />

        <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
    </fieldset>

    <asp:SqlDataSource ID="dtaSrcCust" runat="server"
        ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
        SelectCommand ="Select CustomerID, CustomerName, CustomerPhone, CustomerEmail, InitialContact, Discovered, CustomerInterest, CustomerCity, CustomerState, CustomerZip from Customer"></asp:SqlDataSource>
   
    <asp:SqlDataSource ID="dtaSrcEmp" runat="server"
        ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
        SelectCommand ="Select EmployeeID, EmployeeName, EmployeePhone, CustomerEmail, EmployeeType, EmployeeTerm from Employee"></asp:SqlDataSource>

     <asp:SqlDataSource ID="dtaSrcSrvc" runat="server"
        ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
        SelectCommand ="Select ServiceID, ServiceType, DateStarted, DateCompleted, DateLastModified, CompletionPercentage, ServiceDescription from Service_T"></asp:SqlDataSource>
</asp:Content>

