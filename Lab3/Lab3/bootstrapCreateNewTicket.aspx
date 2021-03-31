<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootstrapCreateNewTicket.aspx.cs" Inherits="Lab3.WebForm25" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
     <div class="container col-6">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="serviceContHeaderLbl" runat="server" Text="Service Order Form" Class="h3 m-2"></asp:Label>

            </div>
            <br />
            <br />

            <div class="form-group">
    <fieldset>
        <legend>Service Order Form</legend>
        <asp:Label ID="nameLbl" runat="server" Text="Customer Name:"></asp:Label>
        <asp:TextBox ID="custNameTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="emailRequestLbl" runat="server" Text="Customer Email"></asp:Label>
        <asp:TextBox ID="emailRequestTxtBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="r_descriptionLbl" runat="server" Text="Customer Description"></asp:Label>
        <asp:TextBox ID="descriptionTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="r_DateLbl" runat="server" Text="Customer Date"></asp:Label>
        <asp:TextBox ID="r_DateTxtBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="serviceTypeLbl" runat="server" Text="" ></asp:Label>
            <asp:TextBox ID="serviceTxtBox" runat="server" Visible="false"></asp:TextBox>
            <br />
            <asp:Label ID="dateLastModifiedLbl" runat="server" Text="Last Updated"></asp:Label>
            <asp:TextBox ID="dateLastModifiedTxtBox" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorDateLastModified" ControlToValidate="dateLastModifiedTxtBox" runat="server" ErrorMessage="Last Update Info Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            <br />
            <asp:Label ID="srvcDescriptionLbl" runat="server" Text="Service Description"></asp:Label>
            <asp:TextBox ID="srvcDescriptionTxtBox" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSrvcDescription" ControlToValidate="srvcDescriptionTxtBox" runat="server" ErrorMessage="Service Description Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
        <asp:Label ID="srvcTcktName" runat="server" Text="Service Ticket Name:"></asp:Label>
        <asp:TextBox ID="tcktNameTxtBox" runat="server" class="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="tcktNameRequiredFieldValidator" ControlToValidate="tcktNameTxtBox" runat="server" ErrorMessage="Ticket Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="tcktStatusLbl" runat="server" Text="Ticket Status:"></asp:Label>
        <asp:DropDownList 
            ID="tcktStatusDropDownList"
            DataSourceID =""
            runat="server"
            DataTextField ="TicketStatus"
            DataValueFIeld ="TicketStatus" class="form-control"
            ></asp:DropDownList>
        <br />
        <asp:Label ID="custLbl" runat="server" Text="Customer:"></asp:Label>
        <asp:DropDownList 
            ID="custDropDownList" 
            runat="server"
            DataSourceID ="dtaSrcCust"
            DataTextField="CustomerName"
            DataValueField="CustomerID" class="form-control"
            ></asp:DropDownList>
        <br />
        <asp:Label ID="srvcLbl" runat="server" Text="Service:"></asp:Label>
        <asp:DropDownList 
            ID="srvcDropDownList" 
            runat="server"
            DataSourceID ="dtaSrcSrvc"
            DataTextField="ServiceDescription"
            DataValueField="ServiceID" class="form-control"
            ></asp:DropDownList>
        <br />
        <asp:Label ID="empLbl" runat="server" Text="Employee:"></asp:Label>
        <asp:DropDownList 
            ID="empDropDownList"
            runat="server"
            DataSourceID="dtaSrcEmp"
            DataTextField ="EmployeeName"
            DataValueField="EmployeeID" class="form-control"
            ></asp:DropDownList>
        <br />
        <asp:Label ID="ticketStrtLbl" runat="server" Text="Date Started:"></asp:Label>
        <asp:TextBox ID="ticketStrtTxtBox" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
        <%--<asp:RequiredFieldValidator ID="tcktStartRequiredFieldValidator" ControlToValidate="ticketStrtTxtBox" runat="server" ErrorMessage="Date Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
        <br />
        <asp:Label ID="date1Lbl" runat="server" Text="Date/Time Option #1:"></asp:Label>
        <asp:TextBox ID="date1TxtBox" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
        <br />
        <asp:Label ID="date2Lbl" runat="server" Text="Date/Time Option #2:"></asp:Label>
        <asp:TextBox ID="date2TxtBox" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
        <br />
        <asp:Label ID="lookAtLbl" runat="server" Text="Look At Date:"></asp:Label>
        <asp:TextBox ID="lookAtTextBox" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
        <br />
        <asp:Label ID="bringInLbl" runat="server" Text="Bring In Date:"></asp:Label>
        <asp:TextBox ID="bringInTextBox" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
        <br />
        <asp:Label ID="pickUpLbl" runat="server" Text="Pick Up Date:"></asp:Label>
        <asp:TextBox ID="pickUpTextBox" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
        <br />

        <asp:Label ID="addSrvcList" runat="server" Text="Additional Services:"></asp:Label>
        <asp:DropDownList ID="addServicesDDL" DataTextField="AddServices" DataValueField="AddServices" runat="server" class="form-control"></asp:DropDownList>
        <br />
        <asp:TextBox ID="serviceTypeTxtBox" runat="server" Visible="false" class="form-control"></asp:TextBox>
        <asp:Button ID="popBtn" runat="server" Text="Populate Fields" class="btn btn-success btn-sm" OnClick="popBtn_Click" CausesValidation="false"/>
        <asp:Button ID="clearBtn" runat="server" Text="Clear Fields" class="btn btn-success btn-sm" OnClick="clearBtn_Click" CausesValidation="false"/>
        <asp:Button ID="createSrvcTckt" runat="server" Text="Complete Service Request" class="btn btn-warning" OnClick="createSrvcTckt_Click"/>
        <%--<asp:Button ID="populateServiceBtn" runat="server" Text="Populate Fields" CausesValidation="false" OnClick="populateServiceBtn_Click" class="btn btn-success btn-sm"/>
        <asp:Button ID="clearServiceBtn" runat="server" Text="Clear Fields" CausesValidation="false" OnClick="clearServiceBtn_Click" class="btn btn-success btn-sm" />
        <asp:Button ID="addServiceBtn" runat="server" Text="Save And Continue To Next Part Of Service Form" OnClick="addServiceBtn_Click" class="btn btn-warning" />--%>
        <%--<asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>--%>
    </fieldset>
    </div>
            </div>
         </div>

    <asp:SqlDataSource ID="dtaSrcCust" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand ="Select CustomerID, CustomerName, CustomerPhone, CustomerEmail, InitialContact, Discovered, CustomerInterest, CustomerCity, CustomerState, CustomerZip from Customer"></asp:SqlDataSource>
   
    <asp:SqlDataSource ID="dtaSrcEmp" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand ="Select EmployeeID, EmployeeName, EmployeePhone, CustomerEmail, EmployeeType, EmployeeTerm from Employee"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dtaSrcTicket" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand ="Select * from ServiceTicket"></asp:SqlDataSource>

     <asp:SqlDataSource ID="dtaSrcSrvc" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand ="Select ServiceID, ServiceType, DateStarted, DateCompleted, DateLastModified, CompletionPercentage, ServiceDescription from Service_T"></asp:SqlDataSource>
</asp:Content>
