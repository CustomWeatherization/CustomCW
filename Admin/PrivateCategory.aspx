<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="PrivateCategory.aspx.cs" Inherits="Admin_PrivateCategory" Title="Category Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <h1 align="center">
        Private Customer Category Page</h1>
    <br />
    <table align="center">
        <tr>
            <td>
                <strong>Category</strong>
            </td>
            <td>
                <asp:TextBox ID="txtCategory" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 300px;"
                    MaxLength="40"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_txtCategory" runat="server" ErrorMessage="*"
                    Display="Dynamic" ControlToValidate="txtCategory" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                <%--<ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtCategory" runat="server" TargetControlID="txtCategory"
                    FilterType="LowercaseLetters,UppercaseLetters,Custom" FilterMode="ValidChars"
                    ValidChars=" /.">
                </ajaxToolkit:FilteredTextBoxExtender>--%>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" class="top_btn" Style="margin-left: 70px;"
                    ValidationGroup="rfv" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="top_btn" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
    <br />
    <div style="float: right;">
        <strong>Page Size:&nbsp;</strong>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Text="10" Value="10"></asp:ListItem>
            <asp:ListItem Text="15" Value="15"></asp:ListItem>
            <asp:ListItem Text="20" Value="20"></asp:ListItem>
            <asp:ListItem Text="ALL" Value="0"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <br />
    <div class="rounded_corners" style="width: 100%;">
        <asp:GridView ID="grdCategory" runat="server" Width="100%" DataKeyNames="CatID" AutoGenerateColumns="false"
            OnRowUpdating="grdCategory_RowUpdating" OnRowDeleting="grdCategory_RowDeleting"
            PageSize="10" AllowPaging="true" OnPageIndexChanging="grdCategory_PageIndexChanging"
            HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
            AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A">
            <Columns>
                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <%#Eval("Category") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnk_Edit" runat="server" Text="Edit" CommandName="Update"></asp:LinkButton>
                        <asp:LinkButton ID="lnk_Delete" runat="server" Text="Delete" CommandName="Delete"
                            OnClientClick="return confirm('Are you sure you want to delete this Category?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
