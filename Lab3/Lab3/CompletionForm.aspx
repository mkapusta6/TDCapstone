<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="CompletionForm.aspx.cs" Inherits="Lab3.WebForm20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Completion Form</legend>
     <asp:Table ID="CompletionTable" runat="server" CellSpacing="15">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="finalCostLabel1" runat="server" Text="Final Cost:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="finalCostTextBox1" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="paymentLbl" runat="server" Text="Payment Received?:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList
                        ID="PaymentReceivedDD"
                        runat="server">
                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                        <asp:ListItem Value="No">No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="expereinceLbl" runat="server" Text="Positive/Negative Experiences:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="experienceTextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="ReviewFollowUpLbl" runat="server" Text="Review Follow Up:"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="crewLabel1" runat="server" Text="Crew Involved"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="StartAddressLbl" runat="server" Text="Start Address: "></asp:Label>
                    <asp:TextBox ID="StartAddressTBox" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="DestAddressLbl" runat="server" Text="Destination Address: "></asp:Label>
                    <asp:TextBox ID="DestAddressTBox" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="MileageLbl" runat="server" Text="Mileage: "></asp:Label>
                    <asp:TextBox ID="MileageTBox" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="TrucksUsedLbl" runat="server" Text="Trucks Used: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:GridView
                        ID="TrucksGridView"
                        runat="server">
                    </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="addiotionalNotesLabel1" runat="server" Text="Additional Notes:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="noteTextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
    </fieldset> 
</asp:Content>