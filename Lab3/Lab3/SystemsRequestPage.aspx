<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerInterface.Master" AutoEventWireup="true" CodeBehind="SystemsRequestPage.aspx.cs" Inherits="Lab3.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>System Request Form</legend>
        <asp:Label ID="srvcLbl" runat="server" Text="Service Type:"></asp:Label>
        <asp:DropDownList 
            ID="srvcDropDownList" 
            runat="server"
            DataTextField="ServiceType"
            DataValueField="ServiceID"
            AutoPostBack ="true" style="margin-left: 50px"
            ></asp:DropDownList>
        <br />
        <asp:Label ID="ticketStrtLbl" runat="server" Text="Date:"></asp:Label>
        <asp:TextBox ID="ticketStrtTxtBox" runat="server" style="margin-left: 102px"></asp:TextBox> Format: DD/MM/YYYY
        <asp:RequiredFieldValidator ID="tcktStartRequiredFieldValidator" ControlToValidate="ticketStrtTxtBox" runat="server" ErrorMessage="Date Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="descrLbl" runat="server" Text="Desciption Of Needs:"></asp:Label>
        <asp:TextBox ID="descriptionTxtBox" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:TextBox ID="emailTxtBox" runat="server" Visible="false"></asp:TextBox>
        <br />
        <asp:Button ID="popBtn" runat="server" Text="Populate Fields" OnClick="popBtn_Click" CausesValidation="false"/>
        <asp:Button ID="clearBtn" runat="server" Text="Clear Fields" OnClick="clearBtn_Click" CausesValidation="false"/>
        <asp:Button ID="createSrvcTckt" runat="server" Text="Generate Request" OnClick="createSrvcTckt_Click"/>
        <br />
        <asp:Label ID="msgLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
    </fieldset>

</asp:Content>

