<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootstrapMovingForm.aspx.cs" Inherits="Lab3.WebForm26" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-6">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="lblCreateNewCustomer" runat="server" Text="Moving Form" Class="h3 m-2"></asp:Label>

            </div>
            <br />
            <br />

            <%--<div class="card-body form-group">--%>
            <%--<asp:Label ID="outputLbl" runat="server" Text=""></asp:Label>--%>

            <%--Customer Dropdown--%>
            <div class="form-group">
                <fieldset>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="storiesLbl" runat="server" Text="# Of Stories:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="storiesDropDownList" DataTextField="HouseStories" DataValueField="HouseStories" runat="server" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="distanceLbl" runat="server" Text="Distance From Truck:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="distDropDownList" DataTextField="DistanceFromTruck" DataValueField="DistanceFromTruck" runat="server" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="dWayAccessLbl" runat="server" Text="Driveway Accessibility:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="dwayDropDownList1" DataTextField="DrivewayAccessibility" DataValueField="DrivewayAccessibility" runat="server" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="loadingLbl" runat="server" Text="Loading Conditions:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList
                                    ID="loadDropDownList"
                                    runat="server"
                                    DataTextField="LoadingConditions"
                                    DataValueField="LoadingConditions" CssClass="form-control">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="sectionLbl" runat="server" Text="House Section:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList
                                    ID="sectionDropDownList"
                                    runat="server"
                                    DataTextField="HouseSection"
                                    DataValueField="HouseSection" CssClass="form-control">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="floorLbl" runat="server" Text="Floor:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="floorDropDownList" DataTextField="Mfloor" DataValueField="Mfloor" runat="server" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <%--<asp:Label ID="mediaLbl" runat="server" Text="Media:"></asp:Label>
        <asp:TextBox ID="mediaTxtBox" runat="server"></asp:TextBox>
        <br />--%>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="boxTypeLbl" runat="server" Text="Box Type:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="boxTypeTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="numBoxLbl" runat="server" Text="# Of Boxes:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="numBoxTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="blanketLbl" runat="server" Text="Blankets:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="blanketTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="itemsLabel" runat="server" Text="Items:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="itemsTextBox" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="accessLbl" runat="server" Text="Room Accessibility:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="accessTextBox" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="valueLabel" runat="server" Text="Item Value:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="valDropDownList1" DataTextField="ValueOfItem" DataValueField="ValueOfItem" runat="server" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="notesLabel" runat="server" Text="Additional Notes:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="notesTextBox" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="customerLabel" runat="server" Text="Customer:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="customerDropDownList" DataSourceID="custDtaSrc" runat="server" DataTextField="CustomerName" DataValueField="CustomerID" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:TextBox ID="serviceTypeTxtBox" runat="server" Visible="false"></asp:TextBox>
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="popBtn" runat="server" Text="Populate Fields" class="btn btn-primary btn-lg" OnClick="popBtn_Click" CausesValidation="false" />
                            </td>
                            <td>
                                <asp:Button ID="clearBtn" runat="server" Text="Clear Fields" class="btn btn-primary btn-lg" OnClick="clearBtn_Click" CausesValidation="false" />
                            </td>
                            <td>
                                <asp:Button ID="createSrvcTckt" runat="server" Text="Create Service Ticket" class="btn btn-primary btn-lg" OnClick="createSrvcTckt_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
                </fieldset>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="custDtaSrc" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="Select CustomerID, CustomerName from Customer"></asp:SqlDataSource>
</asp:Content>
