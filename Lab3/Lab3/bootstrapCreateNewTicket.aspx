<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootstrapCreateNewTicket.aspx.cs" Inherits="Lab3.WebForm25" %>

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
                <asp:Label ID="lblCreateNewCustomer" runat="server" Text="Service Order Form (Continued)" Class="h3 m-2"></asp:Label>

            </div>
            <br />
            <br />

            <%--<div class="card-body form-group">--%>
            <%--<asp:Label ID="outputLbl" runat="server" Text=""></asp:Label>--%>

            <%--Customer Dropdown--%>
            <div class="form-group">
                <fieldset>
                    <legend>Continued Service Form</legend>

                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="srvcTcktName" runat="server" Text="Service Ticket Name:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="tcktNameTxtBox" runat="server" class="form-control"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="tcktNameRequiredFieldValidator" ControlToValidate="tcktNameTxtBox" runat="server" ErrorMessage="Ticket Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="tcktStatusLbl" runat="server" Text="Ticket Status:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList
                                    ID="tcktStatusDropDownList"
                                    runat="server"
                                    DataTextField="TicketStatus"
                                    DataValueField="TicketStatus" class="form-control">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="custLbl" runat="server" Text="Customer:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList
                                    ID="custDropDownList"
                                    runat="server"
                                    DataSourceID="dtaSrcCust"
                                    DataTextField="CustomerName"
                                    DataValueField="CustomerID" class="form-control">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="srvcLbl" runat="server" Text="Service:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList
                                    ID="srvcDropDownList"
                                    runat="server"
                                    DataSourceID="dtaSrcSrvc"
                                    DataTextField="ServiceDescription"
                                    DataValueField="ServiceID" class="form-control">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="empLbl" runat="server" Text="Employee:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList
                                    ID="empDropDownList"
                                    runat="server"
                                    DataSourceID="dtaSrcEmp"
                                    DataTextField="EmployeeName"
                                    DataValueField="EmployeeID" class="form-control">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="ticketStrtLbl" runat="server" Text="Date Started:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="ticketStrtTxtBox" runat="server" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="tcktStartRequiredFieldValidator" ControlToValidate="ticketStrtTxtBox" runat="server" ErrorMessage="Date Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="date1Lbl" runat="server" Text="Date/Time Option #1:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="date1TxtBox" runat="server" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="date2Lbl" runat="server" Text="Date/Time Option #2:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="date2TxtBox" runat="server" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lookAtLbl" runat="server" Text="Look At Date:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="lookAtTextBox" runat="server" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="bringInLbl" runat="server" Text="Bring In Date:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="bringInTextBox" runat="server" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="pickUpLbl" runat="server" Text="Pick Up Date:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="pickUpTextBox" runat="server" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="addSrvcList" runat="server" Text="Additional Services:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="addServicesDDL" DataTextField="AddServices" DataValueField="AddServices" runat="server" class="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="serviceTypeTxtBox" runat="server" Visible="false" class="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="popBtn" runat="server" Text="Populate Fields" class="btn btn-primary btn-lg" OnClick="popBtn_Click" CausesValidation="false" />
                            </td>
                            <td>
                                <asp:Button ID="clearBtn" runat="server" Text="Clear Fields" class="btn btn-primary btn-lg" OnClick="clearBtn_Click" CausesValidation="false" />
                            </td>
                            <td>
                                <asp:Button ID="createSrvcTckt" runat="server" Text="Complete Service Form" class="btn btn-primary btn-lg" OnClick="createSrvcTckt_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
                </fieldset>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="dtaSrcCust" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="Select CustomerID, CustomerName, CustomerPhone, CustomerEmail, InitialContact, Discovered, CustomerInterest, CustomerCity, CustomerState, CustomerZip from Customer"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dtaSrcEmp" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="Select EmployeeID, EmployeeName, EmployeePhone, CustomerEmail, EmployeeType, EmployeeTerm from Employee"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dtaSrcSrvc" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="Select ServiceID, ServiceType, DateStarted, DateCompleted, DateLastModified, CompletionPercentage, ServiceDescription from Service_T"></asp:SqlDataSource>
</asp:Content>
