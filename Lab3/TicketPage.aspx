<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="TicketPage.aspx.cs" Inherits="Lab3.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: left; position: relative">
            <%--Beginning section of page layout and buttons--%>
            <fieldset style="text-align: left; position: relative; background-color: #FFFF99; top: 0px; left: 0px; height: 267px;">
                <legend>Service Ticket Selection</legend>
                <asp:Label ID="srvcDDLLbl" runat="server" Text="Service ID's"></asp:Label>
                <asp:DropDownList 
                    ID="serviceDDL"
                    runat="server"
                    DataSourceID="ticketDtaSrc"
                    DataTextField="ServiceTicketName"
                    DataValueField="ServiceTicketID"
                    AutoPostBack="true">
                </asp:DropDownList>
                <asp:Button ID="viewTicketBtn" runat="server" Text="View Ticket" CausesValidation="false" OnClick="viewTicketBtn_Click" />
                <asp:Button ID="viewAllTicketsBtn" runat="server" Text="View All Tickets" CausesValidation="false" OnClick="viewAllTicketsBtn_Click" />
                <%--Bottom Grid where information is to be shown to user--%>
            <fieldset>
                <legend>Information To Be Displayed: </legend>
                <asp:GridView
                    ID="grdServiceReults"
                    runat="server"
                    AlternatingRowStyle-BackColor="#eaaaff"
                    EmptyDataText="">
                </asp:GridView>
            </fieldset>

                </fieldset>
            <%--<fieldset>
                <legend>Update Ticket</legend>
                <asp:Label ID="tcktStatusLbl" runat="server" Text="Ticket Status"></asp:Label>
                <asp:DropDownList 
                    ID="ticketHistoryList"
                    runat="server"
                    DataTextField="CustomerName"
                    DataValueField="CustomerID"
                    AutoPostBack="true" style="margin-left: 58px">
                </asp:DropDownList>
                <br />
                <asp:Label ID="dateModifiedLbl" runat="server" Text="Date Updated"></asp:Label>
                <asp:TextBox ID="dateModifiedTxtBox" runat="server" style="margin-left: 53px"></asp:TextBox> Format as MM/DD/YYYY
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" ControlToValidate="dateModifiedTxtBox" runat="server" ErrorMessage="Date Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="dateModifiedTxtBox" Operator="DataTypeCheck" Type="Date" runat="server" ErrorMessage="Invalid Date" ForeColor="Red"></asp:CompareValidator>
                <br />
                <asp:Label ID="srvcTicketIDLbl" runat="server" Text="Service Ticket ID"></asp:Label>
                <asp:DropDownList ID="srvcTcktDDL" runat="server" DataSourceID="plsBeOvr" DataTextField="CustomerName" DataValueField="CustomerID" AutoPostBack="true" style="margin-left: 32px"></asp:DropDownList>
                <br />
                <asp:Label ID="employeeIDLbl" runat="server" Text="Employee ID"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="plsBeOvr2" DataTextField="EmployeeName" DataValueField="EmployeeID" AutoPostBack="true" style="margin-left: 58px"></asp:DropDownList>
                <br />
            <br />
            <asp:Label ID="noteHeadLbl" runat="server" Text="Note Subject"></asp:Label>
                <asp:TextBox ID="noteHeadTxtBox" runat="server" style="margin-left: 8px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredNoteHead" ControlToValidate="noteHeadTxtBox"  runat ="server" ErrorMessage="Subject Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="noteContentLbl" runat="server" Text="Note Content"></asp:Label>
            <asp:TextBox ID="noteCntntTxtBox" runat="server" style="margin-left: 5px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorContent" ControlToValidate="noteCntntTxtBox" runat="server" ErrorMessage="Body Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
<%--                <asp:Button ID="updateTicketBtn" runat="server" Text="Update Ticket" OnClick="updateTicketBtn_Click" style="margin-left: 0px" />--%>
                <%--</fieldset>--%>

            
        </div>
        <asp:SqlDataSource ID="ticketDtaSrc" runat="server"
            ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
            SelectCommand="Select ServiceTicketID, ServiceTicketName, TicketStatus, TicketStartDate, CustomerID, ServiceID, EmployeeID from ServiceTicket" />

    <asp:SqlDataSource ID="plsBeOvr" runat="server"
            ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
            SelectCommand="Select CustomerID, CustomerName from Customer" />

    <asp:SqlDataSource ID="plsBeOvr2" runat="server"
            ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
            SelectCommand="Select EmployeeID, EmployeeName from Employee" />
            
</asp:Content>
