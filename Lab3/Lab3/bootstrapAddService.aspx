<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootstrapAddService.aspx.cs" Inherits="Lab3.WebForm23" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>

     <div class="container col-6">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="addServiceHeaderLbl" runat="server" Text="Service Order Form" Class="h3 m-2"></asp:Label>

            </div>
            <br />
            <br />

            <div class="form-group">
            <fieldset>
            <asp:Label ID="nameLbl" runat="server" Text="Customer Name:"></asp:Label>
        <asp:TextBox ID="custNameTextBox" runat="server" Visible="false"></asp:TextBox>
        <br />
        <asp:Label ID="emailRequestLbl" runat="server" Text="Customer Email:"></asp:Label>
        <asp:TextBox ID="emailRequestTxtBox" runat="server" Visible="false"></asp:TextBox>
        <br />
        <asp:Label ID="r_DateLbl" runat="server" Text="Customer Date"></asp:Label>
        <asp:TextBox ID="r_DateTxtBox" runat="server" Visible="false"></asp:TextBox>
        <br />
        <asp:Label ID="serviceTypeLbl" runat="server" Text="" ></asp:Label>
            <asp:TextBox ID="serviceTxtBox" runat="server" Visible="false"></asp:TextBox>
            <br />
            <asp:Label ID="dateLastModifiedLbl" runat="server" Text="Last Updated"></asp:Label>
            <asp:TextBox ID="dateLastModifiedTxtBox" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorDateLastModified" ControlToValidate="dateLastModifiedTxtBox" runat="server" ErrorMessage="Last Update Info Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            <br />
            <asp:Label ID="srvcDescriptionLbl" runat="server" Text="Service Description"></asp:Label>
            <asp:TextBox ID="srvcDescriptionTxtBox" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSrvcDescription" ControlToValidate="srvcDescriptionTxtBox" runat="server" ErrorMessage="Service Description Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
                <asp:TextBox ID="serviceTypeTxtBox" runat="server" Visible="false" class="form-control"></asp:TextBox>

                
            <%--<asp:Button ID="addServiceBtn" runat="server" Text="Save And Continue To Next Part Of Service Form" OnClick="addServiceBtn_Click" class="btn btn-warning" />--%>
                <asp:Button ID="populateServiceBtn" runat="server" Text="Populate Fields" CausesValidation="false" OnClick="populateServiceBtn_Click" class="btn btn-success btn-sm"/>
                <asp:Button ID="clearServiceBtn" runat="server" Text="Clear Fields" CausesValidation="false" OnClick="clearServiceBtn_Click" class="btn btn-success btn-sm" />
                <asp:Button ID="addServiceBtn" runat="server" Text="Save And Continue To Next Part Of Service Form" OnClick="addServiceBtn_Click" class="btn btn-warning" />
            
        </fieldset>
</div>
            </div>
    </div>
</asp:Content>
