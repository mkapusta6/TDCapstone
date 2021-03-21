<%@ Page Title="" Language="C#" MasterPageFile="~/Activities.Master" AutoEventWireup="true" CodeBehind="MoveFormPage.aspx.cs" Inherits="Lab3.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style12 {
            margin-left: 11px;
        }
        .auto-style13 {
            margin-left: 23px;
        }
        .auto-style14 {
            margin-left: 27px;
        }
        .auto-style15 {
            margin-left: 10px;
        }
        .auto-style16 {
            margin-left: 20px;
        }
        .auto-style17 {
            margin-left: 17px;
            margin-top: 16px;
        }
        .auto-style18 {
            margin-left: 20px;
            margin-top: 15px;
        }
        .auto-style19 {
            margin-left: 66px;
            margin-top: 11px;
        }
        .auto-style20 {
            margin-left: 26px;
        }
        .auto-style21 {
            margin-top: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<fieldset>
        <legend>Move Form</legend>
        <asp:Label ID="storiesLbl" runat="server" Text="# Of Stories:"></asp:Label>
        <asp:DropDownList ID="storiesDropDownList" DataTextField="HouseStories" DataValueField="HouseStories" runat="server"></asp:DropDownList>
        <br />
        <asp:Label ID="distanceLbl" runat="server" Text="Distance From Truck:"></asp:Label>
        <asp:DropDownList ID="distDropDownList" DataTextField="DistanceFromTruck" DataValueField="DistanceFromTruck" runat="server"></asp:DropDownList>
        <br />
        <asp:Label ID="dWayAccessLbl" runat="server" Text="Driveway Accessibility:"></asp:Label>
        <asp:DropDownList ID="dwayDropDownList1" DataTextField="DrivewayAccessibility" DataValueField="DrivewayAccessibility" runat="server"></asp:DropDownList>
        <br />
        <asp:Label ID="loadingLbl" runat="server" Text="Loading Conditions:"></asp:Label>
        <asp:DropDownList 
            ID="loadDropDownList" 
            runat="server"
            DataTextField="LoadingConditions"
            DataValueField="LoadingConditions" CssClass="auto-style12"
            ></asp:DropDownList>
        <br />
        <asp:Label ID="sectionLbl" runat="server" Text="House Section:"></asp:Label>
        <asp:DropDownList 
            ID="sectionDropDownList"
            runat="server"
            DataTextField ="HouseSection"
            DataValueField="HouseSection" CssClass="auto-style13"
            ></asp:DropDownList>
        <br />
        <asp:Label ID="floorLbl" runat="server" Text="Floor:"></asp:Label>
        <asp:DropDownList ID="floorDropDownList" DataTextField="Mfloor" DataValueField="Mfloor" runat="server" CssClass="auto-style14"></asp:DropDownList>
        <br />
        <%--<asp:Label ID="mediaLbl" runat="server" Text="Media:"></asp:Label>
        <asp:TextBox ID="mediaTxtBox" runat="server"></asp:TextBox>
        <br />--%>
        <asp:Label ID="boxTypeLbl" runat="server" Text="Box Type:"></asp:Label>
        <asp:TextBox ID="boxTypeTxtBox" runat="server" CssClass="auto-style15"></asp:TextBox>
        <br />
        <asp:Label ID="numBoxLbl" runat="server" Text="# Of Boxes:"></asp:Label>
        <asp:TextBox ID="numBoxTxtBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="blanketLbl" runat="server" Text="Blankets:"></asp:Label>
        <asp:TextBox ID="blanketTextBox" runat="server" CssClass="auto-style16"></asp:TextBox>
        <br />
        <asp:Label ID="itemsLabel" runat="server" Text="Items:"></asp:Label>
        <asp:TextBox ID="itemsTextBox" runat="server" TextMode="MultiLine" CssClass="auto-style17"></asp:TextBox>
        <br />
        <asp:Label ID="accessLbl" runat="server" Text="Room Accessibility:"></asp:Label>
        <asp:TextBox ID="accessTextBox" runat="server" TextMode="MultiLine" CssClass="auto-style18"></asp:TextBox>
        <br />
        <asp:Label ID="valueLabel" runat="server" Text="Item Value:"></asp:Label>
        <asp:DropDownList ID="valDropDownList1" DataTextField="ValueOfItem" DataValueField="ValueOfItem" runat="server" CssClass="auto-style19"></asp:DropDownList>
        <br />
        <asp:Label ID="notesLabel" runat="server" Text="Additional Notes:"></asp:Label>
        <asp:TextBox ID="notesTextBox" runat="server" TextMode="MultiLine" CssClass="auto-style20"></asp:TextBox>
        <br />
        <asp:Label ID="customerLabel" runat="server" Text="Customer:"></asp:Label>
        <asp:DropDownList ID="customerDropDownList" DataSourceID="custDtaSrc" runat="server" DataTextField="CustomerName" DataValueField="CustomerID" CssClass="auto-style21"></asp:DropDownList>
        <br />
        <asp:TextBox ID="serviceTypeTxtBox" runat="server" Visible="false"></asp:TextBox>
        <asp:Button ID="popBtn" runat="server" Text="Populate Fields" OnClick="popBtn_Click" CausesValidation="false"/>
        <asp:Button ID="clearBtn" runat="server" Text="Clear Fields" OnClick="clearBtn_Click" CausesValidation="false"/>
        <asp:Button ID="createSrvcTckt" runat="server" Text="Create Service Ticket" OnClick="createSrvcTckt_Click"/>
        <br />
        <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
    </fieldset>
    <asp:SqlDataSource ID="custDtaSrc" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="Select CustomerID, CustomerName from Customer"></asp:SqlDataSource>
</asp:Content>
