<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="Admin_Change.aspx.cs" Inherits="Admin_Admin_Change" Title="Custom Weatherization/ Change Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<table>
        <tr>
            <td align="left">
                <asp:Button ID="btn_Back" runat="server" Text="BACK" onclick="btn_Back_Click" />
            </td>
        </tr>
    </table>--%><br />
    <br />
    <h1 align="center">
        Change Password</h1>
    <table align="center">
        <tr>
            <td>
                Old User Name:
            </td>
            <td>
                <asp:TextBox ID="txt_OldUserName" runat="server" MaxLength="20" Style="width: 150px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txt_OldUserName" runat="server" ErrorMessage="*"
                    ValidationGroup="rfv" ControlToValidate="txt_OldUserName"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                New User Name:
            </td>
            <td>
                <asp:TextBox ID="txt_NewUserName" runat="server" MaxLength="20" Style="width: 150px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txt_NewUserName" runat="server" ErrorMessage="*"
                    ValidationGroup="rfv" ControlToValidate="txt_NewUserName"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Old Password:
            </td>
            <td>
                <asp:TextBox ID="txt_OldPasswd" runat="server" TextMode="Password" Style="width: 150px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txt_OldPasswd" runat="server" ErrorMessage="*"
                    ValidationGroup="rfv" ControlToValidate="txt_OldPasswd"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                New Password:
            </td>
            <td>
                <asp:TextBox ID="txt_NewPasswd" runat="server" TextMode="Password" MaxLength="20"
                    Style="width: 150px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txt_NewPasswd" runat="server" ErrorMessage="*"
                    ValidationGroup="rfv" ControlToValidate="txt_NewPasswd"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btn_ChangePasswd" runat="server" Text="Change" OnClick="btn_ChangePasswd_Click"
                    CssClass="btn_all" ValidationGroup="rfv" />
                &nbsp;&nbsp;
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click"
                    CssClass="btn_all" />
            </td>
        </tr>
    </table>
</asp:Content>
