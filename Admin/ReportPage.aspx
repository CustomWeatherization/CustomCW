<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="ReportPage.aspx.cs" Inherits="Admin_ReportPage" Title="Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <%-- <table align="center" width="100%">
        <tr>
            <td>
                <asp:LinkButton ID="LnkViewReport" runat="server" Text="View Report"></asp:LinkButton>
            </td>
        </tr>
    </table>--%>
    <br />
    <br />
    <br />
    <div style="float: right;" id="div_page" runat="server">
        <strong>Page Size:&nbsp;</strong>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Text="10" Value="10"></asp:ListItem>
            <asp:ListItem Text="15" Value="15"></asp:ListItem>
            <asp:ListItem Text="20" Value="20"></asp:ListItem>
            <asp:ListItem Text="ALL" Value="0"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <br />
    <%--tanveer--%>
    <div class="rounded_corners" style="width: 100%; text-align: center;" runat="server"
        id="div_drop">
        <asp:DropDownList ID="ddl_jobno" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_jobno_SelectedIndexChanged"
            Style="width: 100%; margin-top: 15px;">
        </asp:DropDownList>
        <asp:DropDownList ID="ddl_invoice" runat="server" AutoPostBack="true" Style="width: 100%; margin-top: 15px;"
            OnSelectedIndexChanged="ddl_invoice_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Button ID="btn_buildR" class="top_btn" runat="server" Text="GO" OnClick="btn_buildR_Click"
            Style="margin-top: 15px;" />
    </div>
    <%--end--%>
    <div class="rounded_corners" style="width: 100%;" id="div_grid" runat="server">
        <asp:GridView ID="grdCategory" runat="server" Width="100%" DataKeyNames="User_Id"
            AutoGenerateColumns="false" PageSize="10" AllowPaging="true" OnPageIndexChanging="grdCategory_PageIndexChanging"
            HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
            AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A" OnRowDataBound="grdCategory_RowDataBound">
            <RowStyle BackColor="#A1DCF2" ForeColor="#3A3A3A"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText="Login Id">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Login" runat="server" Text='<%#Eval("CWLogin")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password">
                    <ItemTemplate>
                        <%#Eval("CWPassword")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <%#Eval("Name")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone No.">
                    <ItemTemplate>
                        <%#Eval("phone")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <%#Eval("FullAdd")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email Id">
                    <ItemTemplate>
                        <%#Eval("Email")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <a href="EmployeeInformation.aspx?Uid=<%#Eval("User_Id")%>" title="View">
                            <img src="../images/View_img.png" alt="" width="20" height="20" />
                        </a>
                        <asp:ImageButton ID="img_edit" runat="server" CommandArgument='<%#Eval("CWLogin")%>'
                            ToolTip="Edit" ImageUrl="../images/Edit_img.png" Width="20" Height="20" OnClick="img_edit_Click" />
                        <asp:ImageButton ID="img_del" runat="server" CommandArgument='<%#Eval("CWLogin")%>'
                            ToolTip="Delete" ImageUrl="../images/Del_img.png" Width="20" Height="20" OnClick="img_del_Click" />
                        <%-- <asp:LinkButton ID="lnk_view" runat="server" CommandArgument='<%#Eval("User_Id")%>' Text="View" OnClick="lnk_view_Click"></asp:LinkButton>
                       <asp:LinkButton ID="lnk_edit" runat="server" CommandArgument='<%#Eval("CWLogin")%>' Text="Edit" onclick="lnk_edit_Click" ></asp:LinkButton>
                       <asp:LinkButton ID="lnk_del" runat="server" CommandArgument='<%#Eval("CWLogin")%>' Text="Delete" onclick="lnk_del_Click"></asp:LinkButton>
                        --%>
                        <asp:DropDownList ID="ddl_status" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_status_SelectedIndexChanged">
                            <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                            <asp:ListItem Text="Normal" Value="User"></asp:ListItem>
                            <asp:ListItem Text="Special" Value="Usr_Adm"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:ImageButton ID="imgBtnIsActive" runat="server" CommandArgument='<%# Eval("CWLogin")%>' ImageUrl="../images/ico_active.gif" Visible='<%# Eval("CWPermissionLevel").ToString() == "Usr_Adm" %>' OnClick="imgBtndeActive_Click"  ToolTip="Special" style="margin-left: 15px;" />
                        <asp:ImageButton ID="imgBtndeActive" runat="server" CommandArgument='<%# Eval("CWLogin")%>' ImageUrl="../images/ico_inactive.png" Visible='<%# Eval("CWPermissionLevel").ToString() == "User" %>' OnClick="imgBtnIsActive_Click" ToolTip="Normal" style="margin-left: 15px;"  />
                        --%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:ImageButton ID="Img_IsActStatus" runat="server" CommandArgument='<%# Eval("CWLogin")%>'
                            ImageUrl="../images/ico_active.gif" Visible='<%# Eval("AuditorPayOutPermissionLevel").ToString() == "1" %>'
                            ToolTip="Click To DeActive Status" OnClick="Img_IsActStatus_Click" Style="margin-left: 15px;" />
                        <asp:ImageButton ID="Img_IsDeActStatus" runat="server" CommandArgument='<%# Eval("CWLogin")%>'
                            ImageUrl="../images/ico_inactive.png" Visible='<%# Eval("AuditorPayOutPermissionLevel").ToString() == "0" %>'
                            ToolTip="Click To Active Status" OnClick="Img_IsDeActStatus_Click" Style="margin-left: 15px;" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
        </asp:GridView>
    </div>
    <%--tanveer pop up--%>
    <asp:Panel ID="pnl_update" runat="server" BackColor="#E6E6ED" Width="425px" Style="display: none; border: 1px solid #B4B2B2; padding-left: 15px;">
        <h4 style="text-align: center; margin: 10px 0 0;">Update
        </h4>


        <%-- <asp:Label ID="lbl_user" runat="server"></asp:Label>--%>
        <asp:HiddenField ID="hid_Id" runat="server" />
        <table width="98%" align="Center" cellspacing="4" cellpadding="4">
            <tr>
                <td>Username:
                </td>
                <td style="text-align: center;">
                    <asp:TextBox ID="lbl_user" runat="server" MaxLength="30" Style="padding-left: 6px; margin-top: 15px; width: 220px; height: 23px; margin-right: 72px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Password:
                </td>
                <td style="text-align: center;">
                    <asp:TextBox ID="txt_pwd" runat="server" MaxLength="10" Style="padding-left: 6px; margin-top: 15px; width: 220px; height: 23px; margin-right: 72px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Phone:
                </td>
                <td style="text-align: center;">
                    <asp:TextBox ID="txt_phone" MaxLength="12" runat="server" Style="padding-left: 6px; margin-top: 15px; width: 220px; height: 23px; margin-right: 72px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Address:
                </td>
                <td style="text-align: center;">
                    <asp:TextBox ID="txt_add" runat="server" Style="padding-left: 6px; margin-top: 15px; width: 220px; height: 23px; margin-right: 72px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>City:
                </td>
                <td style="text-align: center;">
                    <asp:TextBox ID="txt_city" runat="server" MaxLength="20" Style="padding-left: 6px; margin-top: 15px; width: 220px; height: 23px; margin-right: 72px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>State:
                </td>
                <td style="text-align: center;">
                    <asp:TextBox ID="txt_state" MaxLength="6" runat="server" Style="padding-left: 6px; margin-top: 15px; width: 220px; height: 23px; margin-right: 72px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Zipcode:
                </td>
                <td style="text-align: center;">
                    <asp:TextBox ID="txt_zip" runat="server" MaxLength="6" Style="padding-left: 6px; margin-top: 15px; width: 220px; height: 23px; margin-right: 72px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 50px;">
                    <asp:Button ID="btn_Update" runat="server" Text="Update" class="top_btn" Style="margin: 0;"
                        OnClick="btn_Update_Click" />
                </td>
                <td>
                    <asp:Button ID="btn_Cancel" runat="server" Text="Close" class="top_btn" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Button ID="btnShowPopup" runat="server" Style="display: none" OnClick="btnShowPopup_Click1" />
    <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnl_update"
        TargetControlID="btnShowPopup" BackgroundCssClass="modalBackground" X="520" Y="200">
    </asp:ModalPopupExtender>
    <%-- end--%>
</asp:Content>
