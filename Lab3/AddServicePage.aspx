<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="AddServicePage.aspx.cs" Inherits="Lab3.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: left; position: relative; top: 0px; left: 0px; height: 146px;">
        <%--Beginning section of page layout and buttons--%>
        <fieldset style="text-align: left; position: relative; background-color: #FFFF99; top: 0px; left: 0px; height: 157px;">
            <legend>Create Service</legend>
            <asp:Label ID="serviceTypeLbl" runat="server" Text="Service Type:" Width="127px"></asp:Label>
            <asp:DropDownList
                ID="ServiceDropDownList"
                runat="server"
                DataTextField="ServiceType"
                DataValueField="ServiceType"
                AutoPostBack="false" Width="128px" Style="margin-left: 9px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidatorService"
                ControlToValidate="ServiceDropDownList"
                runat="server"
                ErrorMessage="Service Type Required"
                ForeColor="Red"></asp:RequiredFieldValidator>

            <br />

            <asp:Label ID="dateLastModifiedLbl" runat="server" Text="Last Updated" Width="123px"></asp:Label>
            <asp:TextBox ID="dateLastModifiedTxtBox" runat="server" Width="128px" Style="margin-left: 13px"></asp:TextBox>
            Format as MM/DD/YYYY
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidatorDateLastModified"
                    ControlToValidate="dateLastModifiedTxtBox"
                    runat="server"
                    ErrorMessage="Last Update Info Required"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator
                ID="CompareValidatorDateLastModified"
                ControlToValidate="dateLastModifiedTxtBox"
                Operator="DataTypeCheck"
                Type="Date"
                runat="server"
                ErrorMessage="Invalid Date"
                ForeColor="Red"></asp:CompareValidator>
            
            <br />

            <asp:Label ID="srvcDescriptionLbl" runat="server" Text="Service Description" Width="136px"></asp:Label>
            <asp:TextBox ID="srvcDescriptionTxtBox" runat="server" Width="128px"></asp:TextBox>
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidatorSrvcDescription" 
                ControlToValidate="srvcDescriptionTxtBox" 
                runat="server" 
                ErrorMessage="Service Description Required" 
                ForeColor="Red"></asp:RequiredFieldValidator>

            <br />


            <asp:Button ID="addServiceBtn" runat="server" Text="Add Service" OnClick="addServiceBtn_Click" />
            <asp:Button ID="populateServiceBtn" runat="server" Text="Populate Fields" OnClick="populateServiceBtn_Click" CausesValidation="false" Style="margin-top: 21px" />
            <asp:Button ID="clearServiceBtn" runat="server" Text="Clear Fields" OnClick="clearServiceBtn_Click" CausesValidation="false" />
            <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
        </fieldset>
    </div>
</asp:Content>

