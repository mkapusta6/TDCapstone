<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerPortalPage.Master" AutoEventWireup="true" CodeBehind="NewCustomerAccountPage.aspx.cs" Inherits="Lab3.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Label ID="usrnameLbl" runat="server" Text="Create Username:"></asp:Label>
    <asp:TextBox ID="usrnameTxtBox" runat="server" style="margin-left: 3px"></asp:TextBox> Use email
    <asp:RequiredFieldValidator ID="RequiredUsrName" runat="server" ErrorMessage="Username Required" ControlToValidate="usrnameTxtBox" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="pswrdLbl" runat="server" Text="Create Password:"></asp:Label>
    <asp:TextBox ID="pswrdTxtBox" runat="server" style="margin-left: 6px" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredPswrd" runat="server" ControlToValidate="pswrdTxtBox" ErrorMessage="Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblIncorrectLogin" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
    
    <br />
    <asp:Button ID= "loginBtn" runat="server" Text="Create Account And Go To Login Page" Width="105px" OnClick="loginBtn_Click"/>
</asp:Content>
