<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="AuctionPickUpPage.aspx.cs" Inherits="Lab3.WebForm19" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Auction Pick Up Form</legend>
        <asp:Label ID="contactInfoLabel" runat="server" Text="Select Customer Contact Info:"></asp:Label>
        <asp:DropDownList ID="custDropDownList1" runat="server" DataSourceID="custSrc" DataTextField="CustomerName" DataValueField="CustomerID"></asp:DropDownList>
        <br />
        <asp:Label ID="contDateLabel" runat="server" Text="ContactDate:"></asp:Label>
        <asp:TextBox ID="contDateTextBox" runat="server"></asp:TextBox>
    </fieldset>

    <fieldset>
        <legend>Possible Action Dates</legend>
        <asp:Table ID="PossibleActionTable" runat="server" CellSpacing="20">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="PossibleBringInLbl" runat="server" Text="Possible Bring In Date:" Font-Bold="true" Font-Size="15"></asp:Label>
                    <asp:Calendar ID="PossibleBringInDateCld" runat="server" Height="100px" Width="100px" OnSelectionChanged="PossibleBringInDateCld_SelectionChanged"></asp:Calendar>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="PossiblePickUpLbl" runat="server" Text="Possible Pick Up Date:" Font-Bold="true" Font-Size="15"></asp:Label>
                    <asp:Calendar ID="PossiblePickUpCld" runat="server" Height="100px" Width="100px" OnSelectionChanged="PossiblePickUpCld_SelectionChanged"></asp:Calendar>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="PossibleLookAtLbl" runat="server" Text="Possible Look At Date:" Font-Bold="true" Font-Size="15"></asp:Label>
                    <asp:Calendar ID="PossibleLookAtCld" runat="server" Height="100px" Width="100px" OnSelectionChanged="PossibleLookAtCld_SelectionChanged"></asp:Calendar>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="PossibleAppraisalLbl" runat="server" Text="Possible Appraisal Date:" Font-Bold="true" Font-Size="15"></asp:Label>
                    <asp:Calendar ID="PossibleAppraisalCld" runat="server" Height="100px" Width="100px" OnSelectionChanged="PossibleAppraisalCld_SelectionChanged"></asp:Calendar>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="PossibleSaleDateLbl" runat="server" Text="Possible Sale Date:" Font-Bold="true" Font-Size="15"></asp:Label>
                    <asp:Calendar ID="PossibleSaleDateCld" runat="server" Height="100px" Width="100px" OnSelectionChanged="PossibleSaleDateCld_SelectionChanged"></asp:Calendar>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="PossibleBringInTBox" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="PossiblePickUpTBox" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="PossibleLookAtTBox" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="PossibleAppraisalTBox" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="PossibleSaleDateTBox" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

    </fieldset>


    <fieldset>
        <legend>Confirmaed Action Dates</legend>
        <asp:Table ID="ConfirmedDatesTable" runat="server" CellSpacing="20">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="bringInLbl" runat="server" Text="Confirmed Bring In date:" Font-Bold="true" Font-Size="15"></asp:Label>
                    <asp:Calendar ID="ConfirmedBringInDate" runat="server" Height="100px" Width="100px" OnSelectionChanged="ConfirmedBringInDate_SelectionChanged"></asp:Calendar>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="pickUpLabel4" runat="server" Text="Confirmed Pick Up Date:" Font-Bold="true" Font-Size="15"></asp:Label>
                    <asp:Calendar ID="ConfirmedPickupDateCld" runat="server" Height="100px" Width="100px" OnSelectionChanged="ConfirmedPickupDateCld_SelectionChanged"></asp:Calendar>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lookAtLabel5" runat="server" Text="Confirmed Look At Date:" Font-Bold="true" Font-Size="15"></asp:Label>
                    <asp:Calendar ID="ConfirmedLookAtDateCld" runat="server" Height="100px" Width="100px" OnSelectionChanged="ConfirmedLookAtDateCld_SelectionChanged"></asp:Calendar>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="appraisalDateLabel6" runat="server" Text="Confirmed Appraisal Date:" Font-Bold="true" Font-Size="15"></asp:Label>
                    <asp:Calendar ID="ConfirmedAppraisalDateCld" runat="server" Height="100px" Width="100px" OnSelectionChanged="ConfirmedAppraisalDateCld_SelectionChanged"></asp:Calendar>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="saleDateLabel7" runat="server" Text="Confirmed Sale Date:" Font-Bold="true" Font-Size="15"></asp:Label>
                    <asp:Calendar ID="ConfirmedSaleDateCld" runat="server" Height="100px" Width="100px" OnSelectionChanged="ConfirmedSaleDateCld_SelectionChanged"></asp:Calendar>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="bringInTextBox2" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="pickUpTextBox3" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="lookAtTextBox4" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="appraisalTextBox5" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="saleDateTextBox6" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
        <asp:Label ID="storageLabel8" runat="server" Text="Storage Location (If not selling right away):"></asp:Label>
        <asp:TextBox ID="storageTextBox7" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="cosignerLabel9" runat="server" Text="Cosigner Letter:"></asp:Label>
    </fieldset>

    <asp:SqlDataSource ID="custSrc" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT * FROM Customer"></asp:SqlDataSource>
</asp:Content>