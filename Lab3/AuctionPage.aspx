<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="AuctionPage.aspx.cs" Inherits="Lab3.WebForm3" %>
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

        <asp:Label ID="fromWhoLbl" runat="server" Text="From:"></asp:Label>
        <asp:DropDownList 
            ID="fromWhoDropDownList" 
            DataSourceID="dtaSrcCust" 
            DataTextField="CustomerName" 
            DataValueField="CustomerID"
            runat="server"></asp:DropDownList>
        
        <br />

        <asp:Label ID="dateLbl" runat="server" Text="Occurence Date:"></asp:Label>
        <asp:TextBox ID="dateTextBox" runat="server"></asp:TextBox> FORMAT: DD/MM/YYYY
        
        <br />

        <asp:Button ID="popBtn" runat="server" Text="Populate Fields" OnClick="popBtn_Click"/>
        <asp:Button ID="clrBt" runat="server" Text="Clear Fields" OnClick="clrBt_Click"/>
        <asp:Button ID="addAuctionBtn" runat="server" Text="Make Auction Live" OnClick="addAuctionBtn_Click"/>
        
        <br />

        <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
    </fieldset>

    <fieldset>
        <legend>Display Auctions</legend>
        <asp:DropDownList 
            ID="AuctionDropDownList1" 
            runat="server" 
            DataSourceID="dtaScrcAuction" 
            DataTextField="AuctionHeading" 
            DataValueField="AuctionID"></asp:DropDownList>
        <asp:Button ID="Button2" runat="server" Text="Display Auction Info" OnClick="Button2_Click" />
    </fieldset>

    <asp:GridView 
        ID="GridView1" 
        runat="server" 
        EmptyDataText="Does Not Exist"></asp:GridView>

    <asp:SqlDataSource ID="dtaSrcCust" runat="server"
        ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
        SelectCommand ="Select CustomerID, CustomerFirstName, CustomerLastName, InitialContact, Discovered, CustomerPhone, CustomerInterest, CustomerEmail, CustomerState, CustomerCity, CustomerZip, CustomerDate, CustomerName from Customer"
    ></asp:SqlDataSource>

    <asp:SqlDataSource ID="dtaScrcAuction" runat="server"
        ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
        SelectCommand ="Select AuctionID, AuctionHeading, AuctionDate, R_CustomerName, R_Item, CustomerID from Auction"
    ></asp:SqlDataSource>

</asp:Content>
