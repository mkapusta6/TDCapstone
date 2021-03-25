<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootsrapFormSelection.aspx.cs" Inherits="Lab3.WebForm22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 144px;
        }
        .auto-style2 {
            margin-left: 267px;
        }
        .auto-style3 {
            margin-left: 280px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-6">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="lblCreateNewCustomer" runat="server" Text="Form Selection Page" Class="h3 m-2"></asp:Label>

            </div>
            <br />
            <br />

            <%--<div class="card-body form-group">--%>
            <%--<asp:Label ID="outputLbl" runat="server" Text=""></asp:Label>--%>

            <%--Customer Dropdown--%>
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/formTemplateImage.png" CssClass="auto-style1" Height="147px" Width="140px" />
    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/formTemplateImage.png" CssClass="auto-style2" Height="147px" Width="140px" />
    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="images/formTemplateImage.png" CssClass="auto-style3" Height="147px" Width="140px" />
    <br /> 
    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="images/formTemplateImage.png" CssClass="auto-style1" Height="147px" Width="140px"  />
    <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="images/formTemplateImage.png" CssClass="auto-style2" Height="147px" Width="140px" />
    <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="images/formTemplateImage.png" CssClass="auto-style3" Height="147px" Width="140px" />

               
                </div>
            </div>
        </div>

</asp:Content>
