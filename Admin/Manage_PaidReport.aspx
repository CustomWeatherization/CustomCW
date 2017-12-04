<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true" CodeFile="Manage_PaidReport.aspx.cs" Inherits="Manage_PaidReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <h1>Manage Payments</h1>
    <asp:HiddenField ID="hdnID" Value="" runat="server" />
    <table align="center">
        <tr>
            <td>Job Number:</td>
            <td>
                <asp:TextBox ID="txtJobNumber" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Total Amount:</td>
            <td>
                <asp:TextBox ID="txtTamt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Paid Amount:</td>
            <td>
                <asp:TextBox ID="txtPamt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Remaining Amount:</td>
            <td>
                <asp:TextBox ID="txtRamt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="rtn_Update" runat="server" Text="Update" OnClick="rtn_Update_Click" />
            </td>
        </tr>
    </table>

</asp:Content>

