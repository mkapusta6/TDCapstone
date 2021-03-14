<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="AuctionPickUpPage.aspx.cs" Inherits="Lab3.WebForm19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Auction Pick Up Form</legend>
        <asp:Label ID="contactInfoLabel" runat="server" Text="Select Customer Contact Info:"></asp:Label>
        <asp:DropDownList ID="custDropDownList1" runat="server" DataSourceID="custSrc" DataTextField="CustomerName" DataValueField="CustomerID"></asp:DropDownList>
        <br />
        <asp:Label ID="contDateLabel" runat="server" Text="ContactDate:"></asp:Label>
        <asp:TextBox ID="contDateTextBox" runat="server"></asp:TextBox>
    </fieldset>
    <fieldset>
        <legend>Dates</legend>
        <asp:Label ID="bringInLbl" runat="server" Text="Bring In date:"></asp:Label>
        <asp:TextBox ID="bringInTextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="pickUpLabel4" runat="server" Text="Pick Up Date:"></asp:Label>
        <asp:TextBox ID="pickUpTextBox3" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lookAtLabel5" runat="server" Text="Look At Date:"></asp:Label>
        <asp:TextBox ID="lookAtTextBox4" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="appraisalDateLabel6" runat="server" Text="Appraisal Date:"></asp:Label>
        <asp:TextBox ID="appraisalTextBox5" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="saleDateLabel7" runat="server" Text="Sale Date:"></asp:Label>
        <asp:TextBox ID="saleDateTextBox6" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="storageLabel8" runat="server" Text="Storage Location:"></asp:Label>
        <asp:TextBox ID="storageTextBox7" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="cosignerLabel9" runat="server" Text="Cosigner Letter:"></asp:Label>
    </fieldset>

    <asp:SqlDataSource ID="custSrc" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT * FROM Customer"></asp:SqlDataSource>
</asp:Content>
