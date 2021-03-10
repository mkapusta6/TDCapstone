<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerPortalPage.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Lab3.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="usrnameLbl" runat="server" Text="Username:"></asp:Label>
    <asp:TextBox ID="usrnameTxtBox" runat="server" style="margin-left: 3px"></asp:TextBox>
    <asp:RequiredFieldValidator 
        ID="RequiredUsrName" 
        runat="server" 
        ErrorMessage="Username Required" 
        ControlToValidate="usrnameTxtBox" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="pswrdLbl" runat="server" Text="Password:"></asp:Label>
    <asp:TextBox ID="pswrdTxtBox" runat="server" style="margin-left: 6px" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator 
        ID="RequiredPswrd" 
        runat="server" 
        ControlToValidate="pswrdTxtBox" 
        ErrorMessage="Password Required" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblIncorrectLogin" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
    
    <br />
    <asp:Button ID="clearTxtBtn" runat="server" Text="Clear Fields" style="margin-left: 65px" OnClick="clearTxtBtn_Click"/>
    <asp:Button ID= "loginBtn" runat="server" Text="Login" Width="105px" OnClick="loginBtn_Click"/>
</asp:Content>

