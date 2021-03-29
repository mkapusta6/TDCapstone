<%@ Page Title="" Language="C#" MasterPageFile="~/navigationDash.Master" AutoEventWireup="true" CodeBehind="bootsrapInitialContact.aspx.cs" Inherits="Lab3.WebForm24" %>

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
                <asp:Label ID="lblCreateNewCustomer" runat="server" Text="Initial Contact Form" Class="h3 m-2"></asp:Label>

            </div>
            <br />
            <br />

            <%--<div class="card-body form-group">--%>
            <%--<asp:Label ID="outputLbl" runat="server" Text=""></asp:Label>--%>

            <%--Customer Dropdown--%>
            <div class="form-group">
                <table>

                    <tr>
                        <td>
                            <asp:Label ID="cusFirstNameLbl" runat="server" Text="First Name" for="addCustFirstName"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="addCustFirstName" runat="server" Placeholder="First Name" class="form-control"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFirstName" ControlToValidate="addCustFirstName" runat="server" ErrorMessage="First Name Required" ForeColor="Red"></asp:RequiredFieldValidator></td>

                        <%--<asp:Label ID="lblCustomers" runat="server" Text="Customer" for="ddlCustomer"></asp:Label>
                    <asp:DropDownList ID="ddlCustomer" runat="server" class="dropdown"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="ddlCustomer" Text="Select a Customer" ValidationGroup="CreateService"></asp:RequiredFieldValidator>--%>


                        <td>
                            <asp:Label ID="cusLastNameLbl" runat="server" Text="Last Name" for="addCustLastName"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="addCustLastName" runat="server" class="form-control" Placeholder="Last Name"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredLastName" ControlToValidate="addCustLastName" runat="server" ErrorMessage="Last Name Required" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    </tr>
                </table>
                <br />

                <table>
                    <tr>
                        <td>
                            <asp:Label ID="initialContactLbl" runat="server" Text="Initial Contact ->" for="initialContactList"></asp:Label>
                       
                            <asp:DropDownList ID="initialContactList" DataTextField="InitialContact" DataValueField="InitialContact" runat="server" CssClass="form-control"></asp:DropDownList>

                            </td>
                        </table>
                <br />
                            <asp:Label ID="discoveredLbl" Text="Source Of Exposure?" runat="server" for="dscvrdtxtbox"></asp:Label>
                            <asp:TextBox ID="dscvrdtxtbox" runat="server" class="form-control" Placeholder="***Fill in exactly what this is***"></asp:TextBox>
   
                
                <br />
                <asp:Label ID="cusPhoneLbl" runat="server" Text="Phone:" for="addCPhone"></asp:Label>
                <asp:TextBox ID="addCPhone" runat="server" class="form-control" Placeholder="Phone Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredPhoneNumber" ControlToValidate="addCPhone" runat="server" ErrorMessage="Phone Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidatorPhone" ControlToValidate="addCPhone" runat="server" ErrorMessage="Invalid Number" ForeColor="Red" Operator="DataTypeCheck" Type="String"></asp:CompareValidator>
                <br />
                <asp:Label ID="interestLbl" runat="server" Text="Service Interested In" for="interestList"></asp:Label>
                <asp:DropDownList ID="interestList" DataTextField="CustomerInterest" DataValueField="CustomerInterest" runat="server" class="form-control"></asp:DropDownList>
                <br />
                <asp:Label ID="ifAuctionLbl" runat="server" Text="If Auction:" for="ifAuctionDropDownList"></asp:Label>
                <asp:DropDownList ID="ifAuctionDropDownList" DataTextField="IfAuction" DataValueField="IfAuction" runat="server" class="form-control"></asp:DropDownList>
                <br />
                <asp:Label ID="ifMovingLbl" runat="server" Text="If Moving:"></asp:Label>
                From Address:
            <asp:TextBox ID="fromtxtBox" runat="server" CssClass="form-control" Placeholder="From Address"></asp:TextBox>
                To Address:
            <asp:TextBox ID="toTxtBox" runat="server" CssClass="form-control" Placeholder="To Address"></asp:TextBox>
                <br />
                <asp:Label ID="downsizingLbl" runat="server" Text="Downsizing?"></asp:Label>
                <asp:DropDownList ID="downsizeDropDownList" DataTextField="Downsizing" DataValueField="Downsizing" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:Label ID="sellingEstateLbl" runat="server" Text="Selling Estate?"></asp:Label>
                <asp:DropDownList ID="estateDropDownList" DataTextField="SellingEstate" DataValueField="SellingEstate" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:Label ID="howMuchToSellLbl" runat="server" Text="Amount Being Sold?"></asp:Label>
                <asp:DropDownList ID="howMuchDropDownList" DataTextField="AmountToBeSold" DataValueField="AmountToBeSold" runat="server" CssClass="form-control"></asp:DropDownList>
                <br />
                <asp:Label ID="whatIsBeingSoldLbl" runat="server" Text="What Is Being Sold?" for="whatIsBeingSoldTxtBox"></asp:Label>
                <asp:TextBox ID="whatIsBeingSoldTxtBox" runat="server" CssClass="form-control" Placeholder="What Is Being Sold"></asp:TextBox>
                <br />
                <asp:Label ID="deadlineLbl" runat="server" Text="Desired Deadline Date:"></asp:Label>
                <asp:TextBox ID="addDeadlineTxtBox" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <br />
                <asp:Label ID="cusEmailLbl" runat="server" Text="Email:" for="addCEmail"></asp:Label>
                <asp:TextBox ID="addCEmail" runat="server" class="form-control" Placeholder="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCusEmail" ControlToValidate="addCEmail" runat="server" ErrorMessage="Email Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="cusStreetLbl" runat="server" Text="State:" for="addCStreet"></asp:Label>
                <asp:TextBox ID="addCStreet" runat="server" class="form-control" Placeholder="Street"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCusStreet" ControlToValidate="addCStreet" runat="server" ErrorMessage="State Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="cusCityLbl" runat="server" Text="City:" for="addCCity"></asp:Label>
                <asp:TextBox ID="addCCity" runat="server" class="form-control" Placeholder="City"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCusCity" ControlToValidate="addCCity" runat="server" ErrorMessage="City Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="cusZipLbl" runat="server" Text="Zip:" for="addCZip"></asp:Label>
                <asp:TextBox ID="addCZip" runat="server" class="form-control" Placeholder="Zip Code"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCusZip" ControlToValidate="AddCZip" runat="server" ErrorMessage="Zip Code Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="addAddressLbl" runat="server" Text="Address" for="addAddressTxtBox"></asp:Label>
                <asp:TextBox ID="addAddressTxtBox" runat="server" CssClass="form-control" Placeholder="Address"></asp:TextBox>
                <asp:RequiredFieldValidator ID="addressRequiredFieldValidator" runat="server" ErrorMessage="Address Required" ControlToValidate="addAddressTxtBox" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="nameOfEmployee" runat="server" Text="Employee Who Is Creating Form:"></asp:Label>
                <asp:DropDownList ID="creatorList" DataTextField="EmployeeHandler" DataValueField="EmployeeHandler" runat="server" CssClass="form-control"></asp:DropDownList>
                <br />

                <asp:Label ID="currentDateLbl" runat="server" Text="Date Created"></asp:Label>
                <asp:TextBox ID="currentDateTxtBox" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <br />
               <%-- <asp:Button ID="addCustBtn" runat="server" Text="Add Customer" CssClass="btn btn-warning" OnClick="addCustBtn_Click" />--%>
                <asp:Button ID="populateBtn" runat="server" Text="Populate Fields" CssClass="btn btn-success btn-sm" CausesValidation="false" OnClick="populateBtn_Click" />
                <asp:Button ID="clearBtn" runat="server" Text="Clear Form" class="btn btn-success btn-sm" CausesValidation="false" OnClick="clearBtn_Click" />
                <asp:Button ID="addCustBtn" runat="server" Text="Add Customer" CssClass="btn btn-warning" OnClick="addCustBtn_Click" />
                <br />
                <asp:Label ID="addedLbl" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
            </div>
        </div>
        <asp:SqlDataSource ID="srcAddCustomer" runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab3 %>"
            SelectCommand="Select CustomerID, CustomerName from Customer" />

    </div>

    <%--<div class="row">
                <div class="form-group col-4">
                    <asp:Label ID="lblStartDate" runat="server" Text="Start Date" for="txtStartDate"></asp:Label>
                    <asp:TextBox ID="txtStartDate" runat="server" Placeholder="Start Date" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server"
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtStartDate"
                        Text="Please Select a Start Date" ValidationGroup="CreateService">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="form-group col-4">
                    <asp:Label ID="lblEndDate" runat="server" Text="End Date" for="txtEndDate"></asp:Label>
                    <asp:TextBox ID="txtEndDate" runat="server" Placeholder="End Date" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEndDate" runat="server"
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEndDate"
                        Text="Please Select an End Date" ValidationGroup="CreateService">
                    </asp:RequiredFieldValidator>--%>
    <%--<asp:CustomValidator ID="dateValidation" runat="server" Text="Start Date Must Be Before End Date" ErrorMessage="CustomValidator"
                            OnServerValidate="dateValidation_ServerValidate" ValidationGroup="CreateService"></asp:CustomValidator>--%>
    <%-- </div>
            </div>--%>

    <%--<asp:CustomValidator ID="checkNotOverlappingService" runat="server" ErrorMessage="CustomValidator" ValidationGroup="CreateService"
                    OnServerValidate="checkNotOverlappingService_ServerValidate" Text="This Overlaps with a Current Move for this customer"></asp:CustomValidator>--%>


    <%-- <div class="form-group">
                <asp:Label ID="lblServiceCost" runat="server" Text="Service Cost" for="txtServiceCost"></asp:Label>
                <asp:TextBox ID="txtServiceCost" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvServiceCost" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtServiceCost"
                    Text="Please Enter a Service Cost." ValidationGroup="CreateService">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="compareDouble" runat="server" ErrorMessage="CompareValidator"
                    ControlToValidate="txtServiceCost" Text="Invalid Cost" ValidationGroup="CreateService"
                    Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
            </div>--%>

    <%--  <asp:Label ID="Address" runat="server" Text="Auction Address"></asp:Label>
            <div class="form-group">
                <asp:TextBox ID="txtAddress" runat="server" Placeholder="Address" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAddress"
                    Text="Please Enter An Address." ValidationGroup="CreateService">
                </asp:RequiredFieldValidator>
            </div>

            <div class="row form-group">
                <div class="col-md-6">
                    <asp:TextBox ID="txtCity" runat="server" Placeholder="City" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCity"
                        Text="Please Enter A City." ValidationGroup="CreateService">
                    </asp:RequiredFieldValidator>
                </div>--%>

    <%--<div class="col-md-2">
                    <asp:DropDownList ID="ddlState" runat="server" class="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvState" runat="server"
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlState"
                        Text="Please Select A State." ValidationGroup="CreateService">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="col-md-4">
                    <asp:TextBox ID="txtZipCode" runat="server" Placeholder="Zip" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvZipCode" runat="server"
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtZipCode"
                        Text="Please Enter Zip Code." ValidationGroup="CreateService">
                    </asp:RequiredFieldValidator>
                </div>
            </div>--%>



    <%-- <asp:TextBox ID="txtNotes" runat="server" Placeholder="Notes or Employee Accomodations" TextMode="MultiLine" Class="form-control mb-2"></asp:TextBox>

            <div class="form-group">
                <div class="d-flex justify-content-around">
                    <asp:Button ID="btnClear" runat="server" Text="Clear" class="btn btn-primary btn-lg" CausesValidation="false" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary  btn-lg" ValidationGroup="CreateService" />
                    <asp:Button ID="btnPopulate" runat="server" Text="Populate" class="btn btn-secondary btn-lg" CausesValidation="false" />
                </div>
            </div>
        </div>
    </div>--%>

    <%--</div>--%>
</asp:Content>
