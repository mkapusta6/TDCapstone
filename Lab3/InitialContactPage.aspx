<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerInterface.Master" AutoEventWireup="true" CodeBehind="InitialContactPage.aspx.cs" Inherits="Lab3.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Beginning section of page layout and buttons--%>
        Submit The Form Below To Finalize Your Account!
        <fieldset style="text-align: left; position: relative; background-color: #FFFF99; top: 0px; left: 0px; height: 404px;">
            <legend>Account Creation Continued</legend>

            <%-- Labels and Textboxes--%>
           <%-- <asp:Label ID="cusNameLbl" runat="server" Text="Name:" Style="text-align: right"></asp:Label>
            <asp:TextBox ID="addCustomerTxtBox" runat="server" Width="128px" Style="margin-left: 123px; margin-top: 0px;" Height="18px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredCustomerName" ControlToValidate="addCustomerTxtBox" runat="server" ErrorMessage="Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />--%>
            <asp:Label ID="cusFirstNameLbl" runat="server" Text="First Name" ></asp:Label>
            <asp:TextBox ID="addCustFirstName" runat="server"  Width="128px" Style="margin-left: 95px; margin-top: 0px;" Height="18px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFirstName" ControlToValidate="addCustFirstName" runat="server" ErrorMessage="First Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="cusLastNameLbl" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="addCustLastName" runat="server" Width="128px" Style="margin-left: 97px; margin-top: 0px;" Height="18px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredLastName" ControlToValidate="addCustLastName" runat="server" ErrorMessage="Last Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="initialContactLbl" runat="server" Text="Initial Contact"></asp:Label>
            <asp:DropDownList ID="initialContactList" DataTextField="InitialContact" DataValueField="InitialContact"  runat="server" style="margin-left: 97px"></asp:DropDownList>
            <br />
            <asp:Label ID="otherTxtBoxLbl" runat="server" Text="Other"></asp:Label>
            <asp:TextBox ID="otherTxtBox" runat="server" style="margin-left: 126px" Width="114px"></asp:TextBox>
            <br />
            <asp:Label ID="discoveredLbl" Text="Source Of Exposure?" runat ="server"></asp:Label>
            <asp:TextBox ID="dscvrdtxtbox" runat="server" style="margin-left: 26px" Width="114px"></asp:TextBox>
            <br />
            <asp:Label ID="cusPhoneLbl" runat="server" Text="Phone:" Width="40px"></asp:Label>
            <asp:TextBox ID="addCPhone" runat="server" Width="128px" Style="margin-left: 122px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredPhoneNumber" ControlToValidate="addCPhone" runat="server" ErrorMessage="Phone Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidatorPhone" ControlToValidate="addCPhone" runat="server" ErrorMessage="Invalid Number" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <br 
            <asp:Label ID="interestLbl" runat="server" Text="Service Interested In"></asp:Label>
            <asp:DropDownList ID="interestList" DataTextField="CustomerInterest" DataValueField="CustomerInterest"  runat="server" style="margin-left: 67px"></asp:DropDownList>
            <br />
            <asp:Label ID="cusEmailLbl" runat="server" Text="Email:" Width="40px"></asp:Label>
            <asp:TextBox ID="addCEmail" runat="server" Style="margin-top: 0px; margin-left: 121px;" Width="128px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCusEmail" ControlToValidate="addCEmail" runat="server" ErrorMessage="Email Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="cusStreetLbl" runat="server" Text="State:" Width="40px"></asp:Label>
            <asp:TextBox ID="addCStreet" runat="server" Width="128px" Style="margin-left: 121px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCusStreet" ControlToValidate="addCStreet" runat="server" ErrorMessage="State Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="cusCityLbl" runat="server" Text="City:" Width="55px"></asp:Label>
            <asp:TextBox ID="addCCity" runat="server" Width="128px" Style="margin-left: 106px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCusCity" ControlToValidate="addCCity" runat="server" ErrorMessage="City Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="cusZipLbl" runat="server" Text="Zip:" Style="text-align: right" Width="26px"></asp:Label>
            <asp:TextBox ID="addCZip" runat="server" Width="128px" Style="margin-left: 134px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCusZip" ControlToValidate="AddCZip" runat="server" ErrorMessage="Zip Code Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="currentDateLbl" runat="server" Text="Date Of Submission"></asp:Label>
            <asp:TextBox ID="currentDateTxtBox" runat="server"></asp:TextBox>
            <asp:TextBox ID="customerEmailTxtBox" runat="server" Visible="false"></asp:TextBox>
            <br />
            <asp:Button ID="addCustBtn" runat="server" Text="Add Info & Go To System Request" OnClick="addCustBtn_Click" Style="margin-top: 29px" />
            <asp:Button ID="populateBtn" runat="server" Text="Populate Fields" OnClick="populateBtn_Click" CausesValidation="false" Width="174px" />
            <asp:Button ID="clearBtn" runat="server" Text="Clear Form" OnClick="clearBtn_Click" CausesValidation="false" Width="174px" />
        </fieldset>
    <asp:SqlDataSource ID="srcAddCustomer" runat="server"
        ConnectionString="<%$ ConnectionStrings:Sprint1 %>"
        SelectCommand="Select CustomerID, CustomerName from Customer" />
</asp:Content>

