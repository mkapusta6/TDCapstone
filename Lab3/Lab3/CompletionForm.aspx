<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="CompletionForm.aspx.cs" Inherits="Lab3.WebForm20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Completion Form</legend>
    <asp:Label ID="finalCostLabel1" runat="server" Text="Final Cost"></asp:Label>
    <asp:TextBox ID="finalCostTextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="paymentLbl" runat="server" Text="Payment Received:"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
    <br />
    <asp:Label ID="expereinceLbl" runat="server" Text="Positive/Negative Experiences"></asp:Label>
    <asp:TextBox ID="experienceTextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Label ID="reviewFollowUpLabel3" runat="server" Text="Review Follow Up:"></asp:Label>
    <br />
    <asp:Label ID="crewLabel1" runat="server" Text="Crew Involved"></asp:Label>
    <br />
    <asp:Label ID="adressesMilageLabel1" runat="server" Text="Addresses & Milage:"></asp:Label>
    <asp:TextBox ID="addressMilageTextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Label ID="trucksUsedLabel4" runat="server" Text="Trucks Used:"></asp:Label>
    <br />
    <asp:Label ID="addiotionalNotesLabel1" runat="server" Text="additionalNotes"></asp:Label>
    <asp:TextBox ID="noteTextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
        </fieldset>
</asp:Content>
