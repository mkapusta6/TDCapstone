<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="TrackTicketsPage.aspx.cs" Inherits="Lab3.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: left; position: relative">
            <%--Beginning section of page layout and buttons--%>
            <fieldset style="text-align: left; position: relative; background-color: #FFFF99; top: 0px; left: 0px; height: 63px;">
                <legend>View Ticket History Information</legend>
                <asp:Label ID="ticketHistDropLbl" runat="server" Text="Select Service Ticket History To View"></asp:Label>
                <asp:DropDownList
                    ID="DropDownListHistory"
                    runat="server"
                    DataSourceID="histListSrc"
                    DataTextField="ServiceTicketName"
                    DataValueField="ServiceTicketID"
                    AutoPostBack="true"></asp:DropDownList>
                <asp:Button ID="viewNotesBtn" runat="server" Text="View Notes & Updates" OnClick="viewNotesBtn_Click" />
                </fieldset>
               

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

        <asp:SqlDataSource ID="histListSrc" runat="server"
            ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
            SelectCommand="Select ServiceTicketID, ServiceTicketName, TicketStatus, TicketStartDate, CustomerID, ServiceID, EmployeeID from ServiceTicket"></asp:SqlDataSource>
        <asp:SqlDataSource ID="histListSrc1" runat="server"
            ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
            SelectCommand="Select TicketHistoryID, TicketMovingStatus, TicketDateChanged, ServiceTicketID, EmployeeID, NoteHeading, NoteContents from TicketHistory" />
        </div>



</asp:Content>

