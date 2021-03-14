<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="FolderPage.aspx.cs" Inherits="Lab3.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: left; position: relative">
            <%--Beginning section of page layout and buttons--%>
            <fieldset style="text-align: left; position: relative; background-color: #FFFF99; top: 0px; left: 0px; height: 63px;">
                <legend>Toggle Folders and Forms</legend>
                <asp:Label ID="DropDownListLbl" runat="server" Text="Select Client Folder"></asp:Label>
                <asp:DropDownList
                    ID="ddlCustomerList"
                    runat="server"
                    DataSourceID="dtasrcCustomerList"
                    DataTextField="CustomerName"
                    DataValueField="CustomerID"
                    AutoPostBack="true">
                </asp:DropDownList>
                <asp:Button ID="btnInitialContactForm" runat="server" Text="Initial Contact Form" CausesValidation="false" OnClick="btnInitialContactForm_Click" />
                <asp:Button ID="btnServiceForm" runat="server" Text="Service Order Form" CausesValidation="false" OnClick="btnServiceForm_Click" />
                <asp:Button ID="btnMoveForm" runat="server" Text="Move Form" CausesValidation="false" OnClick="btnMoveForm_Click" />
                </fieldset>
               
           
            <%--Bottom Grid where information is to be shown to user--%>
            <fieldset>
                <legend>Form View: </legend>
                <asp:GridView
                    ID="grdServiceReults"
                    runat="server"
                    AlternatingRowStyle-BackColor="#eaaaff"
                    EmptyDataText=""
                    >
                    
                </asp:GridView>
            </fieldset>
        </div>
        <asp:SqlDataSource ID="dtasrcCustomerList" runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab3 %>"
            SelectCommand="Select CustomerID, CustomerName from Customer" />
</asp:Content>
