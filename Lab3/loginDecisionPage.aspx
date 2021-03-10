<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="loginDecisionPage.aspx.cs" Inherits="Lab3.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Employees -> <asp:Button ID="employeeLoginBtn" runat="server" Text="Login As Employee" OnClick="employeeLoginBtn_Click" style="margin-left: 188px" Width="269px" />
    <br />
    Returning Customers -> <asp:Button ID="customerLoginBtn" runat="server" Text="Login As Customer" OnClick="customerLoginBtn_Click" style="margin-left: 121px" Width="269px" />
    <br />
    <br />
    <br />
    New Customers Create An Account Here ->
    <asp:Button ID="customerCreateButton" runat="server" Text="Create New Customer Account" OnClick="customerCreateButton_Click" Width="288px" />
</asp:Content>
