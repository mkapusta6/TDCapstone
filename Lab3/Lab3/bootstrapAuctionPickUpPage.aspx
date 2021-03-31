<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootstrapAuctionPickUpPage.aspx.cs" Inherits="Lab3.WebForm29" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green"></asp:Label>
     <div class="container col-6">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="auctionPickUpPageHeaderLbl" runat="server" Text="Auction Pick Up Form" Class="h3 m-2"></asp:Label>

            </div>
            <br />
            <br />

            <div class="form-group">
    <fieldset>
        <legend>Auction Pick Up Form</legend>
        <asp:Label ID="AuctionHeaderLbl" runat="server" Text="Auction Title:"></asp:Label>
        <asp:DropDownList ID="auctionTitleList" runat="server" DataTextField="AuctionHeading" DataValueField="AuctionID" DataSourceID="auctionL" CssClass="form-control"></asp:DropDownList>
        <br />
        <asp:Label ID="contactInfoLabel" runat="server" Text="Select Customer Contact Info:"></asp:Label>
        <asp:DropDownList ID="custDropDownList1" runat="server" DataSourceID="custSrc" DataTextField="CustomerName" DataValueField="CustomerID" CssClass="form-control"></asp:DropDownList>
        <br />
        <asp:Label ID="sTicketLbl" runat="server" Text="Service Ticket"></asp:Label>
        <asp:DropDownList ID="sTicketDropDownList" runat="server" DataTextField="ServiceTicketName" DataValueField="ServiceTicketID" DataSourceID="sDrop" CssClass="form-control"></asp:DropDownList>
        <br />
        <asp:Label ID="contDateLabel" runat="server" Text="ContactDate:"></asp:Label>
        <asp:TextBox ID="contDateTextBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
    </fieldset>

    <fieldset>
        <legend>Possible Auction Dates</legend>
        <asp:Table ID="PossibleActionTable" runat="server" CellSpacing="20">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="PossibleBringInLbl" runat="server" Text="Possible Bring In Date:" Font-Bold="true" ></asp:Label>
                    <asp:TextBox ID="pBringInTxtBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="PossiblePickUpLbl" runat="server" Text="Possible Pick Up Date:" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="pPickUpTxtBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="PossibleLookAtLbl" runat="server" Text="Possible Look At Date:" Font-Bold="true" ></asp:Label>
                    <asp:TextBox ID="pLookAtTextBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="PossibleAppraisalLbl" runat="server" Text="Possible Appraisal Date:" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="pAppraisalTextBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="PossibleSaleDateLbl" runat="server" Text="Possible Sale Date:" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="pSaleDateTxtBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

    </fieldset>


    <fieldset>
        <legend>Confirmed Auction Dates</legend>
        <asp:Table ID="ConfirmedDatesTable" runat="server" CellSpacing="20">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="bringInLbl" runat="server" Text="Confirmed Bring In date:" Font-Bold="true" ></asp:Label>
                    <asp:TextBox ID="bringInTxtBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="pickUpLabel4" runat="server" Text="Confirmed Pick Up Date:" Font-Bold="true" ></asp:Label>
                    <asp:TextBox ID="pickUpTextBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lookAtLabel5" runat="server" Text="Confirmed Look At Date:" Font-Bold="true" ></asp:Label>
                    <asp:TextBox ID="lookAtTxtBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="appraisalDateLabel6" runat="server" Text="Confirmed Appraisal Date:" Font-Bold="true" ></asp:Label>
                    <asp:TextBox ID="appraisalTxtBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="saleDateLabel7" runat="server" Text="Confirmed Sale Date:" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="saleTxtBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
        <asp:Label ID="storageLabel8" runat="server" Text="Storage Location (If not selling right away):"></asp:Label>
        <asp:TextBox ID="storageTextBox7" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="cosignerLabel9" runat="server" Text="Cosigner Letter:"></asp:Label>
        <asp:TextBox ID="cosignorTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Button ID="popBtn" runat="server" CssClass="btn btn-success btn-sm" Text="Populate Fields" OnClick="popBtn_Click"/>
        <asp:Button ID="clrBt" runat="server" Text="Clear Fields" OnClick="clrBt_Click" CssClass="btn btn-success btn-sm"/>
        <asp:Button ID="addAuctionBtn" runat="server" Text="Finalize Pick Up" OnClick="addAuctionBtn_Click" CssClass="btn btn-warning"/>
    </fieldset>

                </div>
            </div>
         </div>

    <asp:SqlDataSource ID="custSrc" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT * FROM Customer"></asp:SqlDataSource>

    <asp:SqlDataSource ID="auctionL" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT * FROM Auction"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sDrop" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT * FROM  ServiceTicket"></asp:SqlDataSource>

</asp:Content>
