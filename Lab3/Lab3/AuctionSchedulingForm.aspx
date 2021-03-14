<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="AuctionSchedulingForm.aspx.cs" Inherits="Lab3.WebForm17" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Auction House</legend>
        <asp:Label ID="auctionName" runat="server" Text="Auction Name:"></asp:Label>
        <asp:TextBox ID="auctionTxtBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="customerItem" runat="server" Text ="Item(s):"></asp:Label>
        <asp:TextBox ID="custItemTxtBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="srvcLbl" runat="server" Text="Service Ticket:"></asp:Label>
        <asp:DropDownList ID="tryDropDownList1" runat="server" DataSourceID="date1Src" DataTextField="ServiceTicketName" DataValueField="ServiceTicketID"></asp:DropDownList>
        <br />
        <asp:Label ID="fromWhoLbl" runat="server" Text="From:"></asp:Label>
        <asp:DropDownList ID="fromWhoDropDownList" DataSourceID="dtaSrcCust" DataTextField="CustomerName" 
            DataValueField="CustomerID"
            runat="server"></asp:DropDownList>
        <br />
        <asp:Label ID="dateLbl" runat="server" Text="Occurence Date:"></asp:Label>
        <asp:TextBox ID="dateTextBox" runat="server"></asp:TextBox> FORMAT: DD/MM/YYYY
        <br />
        <asp:Label ID="truckAccessLabel" runat="server" Text="Truck Accessibility:"></asp:Label>
        <asp:DropDownList ID="truckDropDownList1" runat="server" DataTextField="TruckAccess" DataValueField="TruckAccess"></asp:DropDownList>
        <br />
        <asp:Label ID="suppliesLabel" runat="server" Text="Supplies Needed:"></asp:Label>
        <asp:TextBox ID="suppliesTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Label ID="numBoxLbl" runat="server" Text="# Of Boxes:"></asp:Label>
        <asp:TextBox ID="numBoxTextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="typeBoxLabel" runat="server" Text="Type Of Boxes:"></asp:Label>
        <asp:TextBox ID="typeBoxTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="crewLabel" runat="server" Text="Crew:"></asp:Label>
        <asp:DropDownList ID="crewDropDownList" runat="server" DataTextField="Crew" DataValueField="Crew"></asp:DropDownList>
        <br />

        <asp:Label ID="numOfTrucksLabel" runat="server" Text="# Of Trucks:"></asp:Label>
        <asp:TextBox ID="numOfTrucksTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="truckTypeLbl" runat="server" Text="Type Of Trucks:"></asp:Label>
        <asp:DropDownList ID="truckTypeDropDownList" runat="server" DataTextField="TruckTypes" DataValueField="TruckTypes"></asp:DropDownList>
        <br />

        <asp:Label ID="statusLabel" runat="server" Text="Active/Inactive:"></asp:Label>
        <asp:DropDownList ID="statusDropDownList1" DataTextField="EquipmentStatus" DataValueField="EquipmentStatus" runat="server"></asp:DropDownList>
        <br />

        <asp:Button ID="popBtn" runat="server" Text="Populate Fields" OnClick="popBtn_Click"/>
        <asp:Button ID="clrBt" runat="server" Text="Clear Fields" OnClick="clrBt_Click"/>
        <asp:Button ID="addAuctionBtn" runat="server" Text="Make Auction Live" OnClick="addAuctionBtn_Click"/>
        <br />
        <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
    </fieldset>
    <br />
    <fieldset style="text-align: left; position: relative; background-color: #FFFF99; top: 0px; left: 0px; height: 63px;">
        <legend>View Bring Ins And Look Ats' Form</legend>
        <asp:Button ID="bringInBtn" runat="server" Text="Show Bring In Dates" OnClick="bringInBtn_Click" />
        <asp:Button ID="srchAuctionDateBtn" runat="server" Text="Search Auction Dates For Cosignors" OnClick="srchAuctionDateBtn_Click" />
        <br />
        <asp:Label ID="uploadLbl" runat="server" Text="Upload Scanned Inventory Paper:"></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <asp:Image ID="Image1" runat="server" />
        <br />
        
       
        
    </fieldset>

    <asp:SqlDataSource ID="date1Src" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand ="Select ServiceTicketID, ServiceTicketName from ServiceTicket"></asp:SqlDataSource>


     <asp:SqlDataSource ID="dtaSrcCust" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand ="Select CustomerID, CustomerFirstName, CustomerLastName, InitialContact, Discovered, CustomerPhone, CustomerInterest, CustomerEmail, CustomerState, CustomerCity, CustomerZip, CustomerDate, CustomerName from Customer"
    ></asp:SqlDataSource>

    <br />
    <br />
    <br />




    <%--Bottom Grid where information is to be shown to user--%>
    <fieldset>
        <legend>Information: </legend>
        <asp:GridView
            ID="grdServiceReults"
            runat="server"
            AlternatingRowStyle-BackColor="#eaaaff"
            EmptyDataText="">
        </asp:GridView>
    </fieldset>
</asp:Content>
