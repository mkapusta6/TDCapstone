<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootstrapClientFolder.aspx.cs" Inherits="Lab3.WebForm31" %>
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
                <fieldset style="text-align: left; position: relative; background-color: #FFFF99; top: 0px; left: 0px; height: 63px;">
                <legend>Information Toggle Form</legend>
                <asp:Label ID="DropDownListLbl" runat="server" Text="Select Customer" CssClass="form-control"></asp:Label>
                <asp:DropDownList
                    ID="ddlCustomerList"
                    runat="server"
                    DataSourceID="dtasrcCustomerList"
                    DataTextField="CustomerName"
                    DataValueField="CustomerID"
                    AutoPostBack="true" CssClass="form-control">
                </asp:DropDownList>
                <asp:Button ID="btnLoadCustomerData" runat="server" Text="Show Customer Information" CausesValidation="false" OnClick="btnLoadCustomerData_Click" CssClass="btn btn-sm btn-secondary" />
                <asp:Button ID="btnShowAll" runat="server" Text="Show All Customers" CausesValidation="false" OnClick="btnShowAll_Click" CssClass="btn btn-sm btn-secondary" />
                <asp:Button ID="btnShowServices" runat="server" Text="Display Services" CausesValidation="false" OnClick="btnShowServices_Click" CssClass="btn btn-sm btn-secondary"/>
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
        </div>
            </div>
         </div>

        <asp:SqlDataSource ID="dtasrcCustomerList" runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab3 %>"
            SelectCommand="Select CustomerID, CustomerName from Customer" />
</asp:Content>
