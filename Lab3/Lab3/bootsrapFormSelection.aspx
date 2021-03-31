<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootsrapFormSelection.aspx.cs" Inherits="Lab3.WebForm22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 144px;
        }
        .auto-style2 {
            margin-left: 267px;
        }
        .auto-style3 {
            margin-left: 280px;
        }
        .auto-style4 {
            margin-left: 554px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-6">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="formSelectHeaderLbl" runat="server" Text="Form Selection Page" Class="h3 m-2"></asp:Label>

            </div>
            <br />
            <br />
    <asp:ImageButton ID="initialContactFormButton" runat="server" ImageUrl="images/InitialContactIcon.png" CssClass="auto-style1" Height="147px" Width="140px" OnClick="initialContactFormButton_Click" />
    <asp:ImageButton ID="serviceFormBtn" runat="server" ImageUrl="images/ServiceOrderIcon.png" CssClass="auto-style2" Height="147px" Width="140px" OnClick="serviceFormBtn_Click"  />
    <asp:ImageButton ID="auctionSchedulingFormBtn" runat="server" ImageUrl="images/AuctionSchedulingIcon.png" CssClass="auto-style3" Height="147px" Width="140px" OnClick="auctionSchedulingFormBtn_Click" />
    <br /> 
    <asp:ImageButton ID="movingFormBtn" runat="server" ImageUrl= "images/MovingFormIcon.png" CssClass="auto-style1" Height="147px" Width="140px" OnClick="movingFormBtn_Click" />
    <asp:ImageButton ID="movingScheduleFormBtn" runat="server" ImageUrl="images/MoveSchedulingIcon.png" CssClass="auto-style2" Height="147px" Width="140px" OnClick="movingScheduleFormBtn_Click" />
    <asp:ImageButton ID="pickUpFormBtn" runat="server" ImageUrl="images/AuctionPickUpIcon.png" CssClass="auto-style3" Height="147px" Width="140px" OnClick="pickUpFormBtn_Click" />
    <br />
    <asp:ImageButton ID="completionFormBtn" runat="server" ImageUrl="images/CompletionFormIcon.png" CssClass="auto-style4"  Height="147px" Width="140px" OnClick="completionFormBtn_Click" />

               
                </div>
            </div>
        </div>

</asp:Content>