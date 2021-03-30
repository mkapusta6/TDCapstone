<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootstrapCompletionForm.aspx.cs" Inherits="Lab3.WebForm30" %>
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
                <asp:Label ID="lblCreateNewCustomer" runat="server" Text="Completion Form" Class="h3 m-2"></asp:Label>

            </div>
            <br />
            <br />

            <%--<div class="card-body form-group">--%>
            <%--<asp:Label ID="outputLbl" runat="server" Text=""></asp:Label>--%>

            <%--Customer Dropdown--%>
            <div class="form-group">
    <fieldset>
        <legend>Completion Options:</legend>
        <asp:Label ID="ifAuction" runat="server" Text="Completion Type:"></asp:Label>
        <asp:CheckBox ID="auctionCheckBox" runat="server" OnCheckedChanged="auctionCheckBox_CheckedChanged" CssClass="form-control" Text="Complete Auction" />
        <br />
        <asp:CheckBox ID="moveCheckbox" runat="server" CssClass="form-control" Text="Complete Move" />
        <br />
        <asp:CheckBox ID="bothCheckBox" runat="server" CssClass="form-control" Text="Complete Both" />
        <br />

        <asp:Label ID="AuctionHeaderLbl" runat="server" Text="Auction Title:"></asp:Label>
        <asp:DropDownList ID="auctionTitleList" runat="server" DataTextField="AuctionHeading" DataValueField="AuctionID" DataSourceID="auctionL" CssClass="form-control"></asp:DropDownList>
        <br />
        <asp:Label ID="contactInfoLabel" runat="server" Text="Select Customer Contact Info:"></asp:Label>
        <asp:DropDownList ID="custDropDownList1" runat="server" DataSourceID="custSrc" DataTextField="CustomerName" DataValueField="CustomerID" CssClass="form-control"></asp:DropDownList>
        <br />
        <asp:Label ID="sTicketLbl" runat="server" Text="Service Ticket"></asp:Label>
        <asp:DropDownList ID="sTicketDropDownList" runat="server" DataTextField="ServiceTicketName" DataValueField="ServiceTicketID" DataSourceID="sDrop" CssClass="form-control"></asp:DropDownList>
        <br />
        <asp:Label ID="moveLabel" runat="server" Text="Move Title:"></asp:Label>
        <asp:DropDownList ID="moveDropDownList1" runat="server" DataTextField="MoveName" DataValueField="MovingID" DataSourceID="moveList" CssClass="form-control"></asp:DropDownList>
    </fieldset>

       <br />

    <fieldset>
        <legend>Details:</legend>

        <asp:Label ID="finalCostLbl" runat="server" Text="Final Cost:"></asp:Label>
        <asp:TextBox ID="finalCostTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="paymentReceived" runat="server" Text="Payment Received?:"></asp:Label>
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Yes" CssClass="form-control"/>
        <asp:CheckBox ID="CheckBox2" runat="server" Text="No" CssClass="form-control"/>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Create Follow Up" CssClass="btn btn-secondary" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="crewLbl" runat="server" Text="Crew"></asp:Label>
        <asp:TextBox ID="crewTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="fromAddressLbl" runat="server" Text="From Address:"></asp:Label>
        <asp:TextBox ID="fromAddressTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="toAddressLbl" runat="server" Text="To Address:"></asp:Label>
        <asp:TextBox ID="toAddressTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="milageLbl" runat="server" Text="Mileage:"></asp:Label>
        <asp:TextBox ID="mileageTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="trucksLbl" runat="server" Text="Trucks Used:"></asp:Label>
        <asp:TextBox ID="trucksTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Additional Notes:"></asp:Label>
<%--        <asp:CheckBox ID="CheckBox3" runat="server" Text="Customer Comments" CssClass="form-control" />
        <br />--%>
        <asp:TextBox ID="addNotes" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Button ID="popBtn" runat="server" CssClass="btn btn-success btn-sm" Text="Populate Fields" OnClick="popBtn_Click"/>
        <asp:Button ID="clrBt" runat="server" Text="Clear Fields" OnClick="clrBt_Click" CssClass="btn btn-success btn-sm"/>
        <asp:Button ID="addAuctionBtn" runat="server" Text="Finalize Pick Up" OnClick="addAuctionBtn_Click" CssClass="btn btn-warning"/>
    </fieldset>

                </div>
            </div>
         </div>

     <asp:SqlDataSource ID="custSrc" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT * FROM Customer"></asp:SqlDataSource>

    <asp:SqlDataSource ID="moveList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT * FROM Moving"></asp:SqlDataSource>

    <asp:SqlDataSource ID="auctionL" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT * FROM Auction"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sDrop" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT * FROM  ServiceTicket"></asp:SqlDataSource>
</asp:Content>