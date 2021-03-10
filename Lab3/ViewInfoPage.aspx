<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="ViewInfoPage.aspx.cs" Inherits="Lab3.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="text-align: left; position: relative">
            <%--Beginning section of page layout and buttons--%>
            <fieldset style="text-align: left; position: relative; background-color: #FFFF99; top: 0px; left: 0px; height: 63px;">
                <legend>Information Toggle Form</legend>
                <asp:Label ID="DropDownListLbl" runat="server" Text="Select Customer"></asp:Label>
                <asp:DropDownList
                    ID="ddlCustomerList"
                    runat="server"
                    DataSourceID="dtasrcCustomerList"
                    DataTextField="CustomerName"
                    DataValueField="CustomerID"
                    AutoPostBack="true">
                </asp:DropDownList>
                <asp:Button ID="btnLoadCustomerData" runat="server" Text="Show Customer Information" CausesValidation="false" OnClick="btnLoadCustomerData_Click" />
                <asp:Button ID="btnShowAll" runat="server" Text="Show All Customers" CausesValidation="false" OnClick="btnShowAll_Click" />
                <asp:Button ID="btnShowServices" runat="server" Text="Display Services" CausesValidation="false" OnClick="btnShowServices_Click"/>
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
        <asp:SqlDataSource ID="dtasrcCustomerList" runat="server"
            ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
            SelectCommand="Select CustomerID, CustomerName from Customer" />
</asp:Content>

