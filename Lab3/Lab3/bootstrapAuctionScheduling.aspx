<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootstrapAuctionScheduling.aspx.cs" Inherits="Lab3.WebForm27" %>

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
                <asp:Label ID="lblCreateNewCustomer" runat="server" Text="Auction Scheduling Form" Class="h3 m-2"></asp:Label>

            </div>
            <br />
            <br />

            <%--<div class="card-body form-group">--%>
            <%--<asp:Label ID="outputLbl" runat="server" Text=""></asp:Label>--%>

            <%--Customer Dropdown--%>
            <div class="form-group">
                <fieldset>
                    <legend>Auction House</legend>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="auctionName" runat="server" Text="Auction Name:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="auctionTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="customerItem" runat="server" Text="Item(s):"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="custItemTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="srvcLbl" runat="server" Text="Service Ticket:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="tryDropDownList1" runat="server" DataSourceID="date1Src" DataTextField="ServiceTicketName" DataValueField="ServiceTicketID" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="fromWhoLbl" runat="server" Text="From:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="fromWhoDropDownList" DataSourceID="dtaSrcCust" DataTextField="CustomerName"
                                    DataValueField="CustomerID"
                                    runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="dateLbl" runat="server" Text="Occurence Date:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="dateTextBox" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="truckAccessLabel" runat="server" Text="Truck Accessibility:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="truckDropDownList1" runat="server" DataTextField="TruckAccess" DataValueField="TruckAccess" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="suppliesLabel" runat="server" Text="Supplies Needed:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="suppliesTextBox" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
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
                                <asp:TextBox ID="numBoxTextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="typeBoxLabel" runat="server" Text="Type Of Boxes:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="typeBoxTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="crewLabel" runat="server" Text="Crew:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="crewDropDownList" runat="server" DataTextField="Crew" DataValueField="Crew" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="numOfTrucksLabel" runat="server" Text="# Of Trucks:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="numOfTrucksTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="truckTypeLbl" runat="server" Text="Type Of Trucks:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="truckTypeDropDownList" runat="server" DataTextField="TruckTypes" DataValueField="TruckTypes" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="statusLabel" runat="server" Text="Active/Inactive:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="statusDropDownList1" DataTextField="EquipmentStatus" DataValueField="EquipmentStatus" runat="server" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="popBtn" runat="server" CssClass="btn btn-secondary btn-sm" Text="Populate Fields" OnClick="popBtn_Click" />
                            </td>
                            <td>
                                <asp:Button ID="clrBt" runat="server" Text="Clear Fields" OnClick="clrBt_Click" />
                            </td>
                            <td>
                                <asp:Button ID="addAuctionBtn" runat="server" Text="Make Auction Live" OnClick="addAuctionBtn_Click" />
                            </td>
                           
                        </tr>
                    </table>
                    <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
                </fieldset>
                <br />
                <fieldset>
                    <legend>View Bring Ins And Look Ats' Form</legend>
                    <asp:Button ID="bringInBtn" runat="server" Text="Show Bring In Dates" CssClass="btn btn-secondary btn-sm" OnClick="bringInBtn_Click" />
                    <asp:Button ID="srchAuctionDateBtn" runat="server" Text="Search Auction Dates For Cosignors" OnClick="srchAuctionDateBtn_Click" />
                    <br />
                    <asp:Label ID="uploadLbl" runat="server" Text="Upload Scanned Inventory Paper:"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <asp:Image ID="Image1" runat="server" />
                    <br />



                </fieldset>

                <asp:SqlDataSource ID="date1Src" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
                    SelectCommand="Select ServiceTicketID, ServiceTicketName from ServiceTicket"></asp:SqlDataSource>


                <asp:SqlDataSource ID="dtaSrcCust" runat="server"
                    ConnectionString="<%$ ConnectionStrings:Lab3 %>"
                    SelectCommand="Select CustomerID, CustomerFirstName, CustomerLastName, InitialContact, Discovered, CustomerPhone, CustomerInterest, CustomerEmail, CustomerState, CustomerCity, CustomerZip, CustomerDate, CustomerName from Customer"></asp:SqlDataSource>

                <br />
                <br />
                <br />




                <%--Bottom Grid where information is to be shown to user--%>
                <fieldset>
                    <legend>Information: </legend>
                    <asp:GridView
                        ID="grdServiceReults"
                        runat="server"
                        AlternatingRowStyle-BackColor="#eaaaff"
                        EmptyDataText="" CssClass="table table-striped table-bordered table-condensed">
                    </asp:GridView>
                </fieldset>
            </div>
        </div>
    </div>

</asp:Content>
