<%@ Page Title="Common SubCategory" Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true" CodeFile="CommonSubCategory.aspx.cs" Inherits="Admin_CommonSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <br />
    <br />
    <br />
    <h1 align="center">
        Common Subcategory Page</h1>
    <br />
    <table align="center">
        <tr>
            <td>
                <strong>Category</strong>
            </td>
            <td>
                <asp:DropDownList ID="DDl_Category" runat="server" Style="border: 1px solid #ccc;
                    font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                    padding: 8px; margin: 0; width: 318px;" MaxLength="40">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFV_DDl_Category" runat="server" ErrorMessage="*"
                    InitialValue="Select" ControlToValidate="DDl_Category" Display="Dynamic" ValidationGroup="rfv"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <strong>Measure Description</strong>
            </td>
            <td>
                <asp:TextBox ID="txtSubCategory" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 300px;"
                    MaxLength="150"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_txtSubCategory" runat="server" ErrorMessage="*"
                    Display="Dynamic" ControlToValidate="txtSubCategory" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                <%--  <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtCategory" runat="server" TargetControlID="txtSubCategory"
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
       <asp:UpdatePanel ID="UpdatePanel1" 
                 UpdateMode="Conditional"
                 runat="server">
                 <ContentTemplate>
    <div style="float: right;">
        <strong>Page Size:&nbsp;</strong>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Text="10" Value="10"></asp:ListItem>
            <asp:ListItem Text="15" Value="15"></asp:ListItem>
            <asp:ListItem Text="20" Value="20"></asp:ListItem>
            <asp:ListItem Text="ALL" Value="0"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div style="float: left;">
        <a href="ManageCommonOrder.aspx" target="_blank">Click here to Manage Subcategory Order</a>
    </div>
    <br />
    <div class="rounded_corners" style="width: 100%;">
        <asp:GridView ID="grdSubCategory" runat="server" Width="100%" DataKeyNames="SubCatId"
            AllowPaging="true" AutoGenerateColumns="false" OnRowUpdating="grdSubCategory_RowUpdating"
            OnRowDeleting="grdSubCategory_RowDeleting" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
            RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A"
            OnRowCancelingEdit="grdSubCategory_RowCancelingEdit" OnRowEditing="grdSubCategory_RowEditing"
            OnPageIndexChanging="grdSubCategory_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <%#Eval("Category")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Measure Description">
                    <ItemTemplate>
                        <%#Eval("SubCatName")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_G_SubCatName" runat="server" TextMode="MultiLine" Text='<%#Eval("SubCatName")%>'
                            Style="width: 95%;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_G_txtSubCategory" runat="server" ErrorMessage="*"
                            Display="Dynamic" ControlToValidate="txt_G_SubCatName" ValidationGroup="rfv_G"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnk_Edit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="lnk_Delete" runat="server" Text="Delete" CommandName="Delete"
                            OnClientClick="return confirm('Are you sure you want to delete this Subcategory?');"></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="Lnk_Update" runat="server" Text="Update" CommandName="Update"
                            ValidationGroup="rfv_G"></asp:LinkButton>
                        <asp:LinkButton ID="lnk_Cancel" runat="server" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</ContentTemplate>
</asp:UpdatePanel>

</asp:Content>

