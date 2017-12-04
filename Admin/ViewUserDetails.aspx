<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true" CodeFile="ViewUserDetails.aspx.cs" Inherits="Admin_ViewUserDetails" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
        .modalPopup
        {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding: 10px;
            width: 500px;
            height: auto;
        }
        .paidBtn
        {
            background: #28A3D1;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            padding: 5px 20px; /* border-bottom-left-radius: 5px; */
            cursor: pointer;
        }
        .paidBtnDis
        {
            background: #A1DCF2;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            padding: 5px 20px; /* border-bottom-left-radius: 5px; */
            cursor: pointer;
        }
        .PayBtn
        {
            background: #28A3D1;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-bottom-left-radius: 5px;
            padding: 5px 20px; /* border-bottom-left-radius: 5px; */
            cursor: pointer;
            float: right; /*margin-right: -175px;*/
            margin-top: 30px;
        }
        .RejectBtn
        {
            background: #28A3D1;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-right-radius: 5px;
            padding: 5px 20px;
            border-bottom-left-radius: 5px;
            cursor: pointer;
            margin-top: 30px;
        }
        .JobBtn
        {
            background: #28A3D1;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-right-radius: 5px;
            padding: 5px 20px;
            border-bottom-left-radius: 5px;
            cursor: pointer;
            margin-top: 30px;
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
    <br />
    <br />
    <br />
     <div style="text-align:center;     width: 100% !important;" class="divalign">
     <strong>Employee:-</strong>&nbsp;<asp:DropDownList ID="DDL_Employee" runat="server"
                    Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                    color: black; border-radius: 5px; padding: 8px; margin: 0; width: 200px;" maxlength="40"
                    AutoPostBack="true" OnSelectedIndexChanged="DDL_Employee_SelectedIndexChanged">
                </asp:DropDownList>
                </div><br />
  
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
    <%-- <asp:UpdatePanel ID="upPnl" runat="server">
        <ContentTemplate>--%>
         <asp:Button ID="btnNotPay" runat="server" Text="Active" CssClass="paidBtn" OnClick="btnActive_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnPay" runat="server" Text="DeActivated" CssClass="paidBtnDis" OnClick="btnDeactive_Click" />
            <br /> 
    <div class="rounded_corners" style="width: 100%;" id="div_grid" runat="server">
      <div class="rounded_corners" style="width: 100%; overflow: auto; max-height: 600px;">
        <asp:GridView ID="grdCategory" runat="server" Width="100%" DataKeyNames="User_Id"
            AutoGenerateColumns="false" PageSize="10" AllowPaging="true" OnPageIndexChanging="grdCategory_PageIndexChanging"
            HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
          RowStyle-ForeColor="#3A3A3A" OnRowDataBound="grdCategory_RowDataBound" HorizontalAlign="Left">
            <RowStyle BackColor="white" ForeColor="#3A3A3A"   ></RowStyle>
            <Columns>
              <asp:TemplateField HeaderText="Login Id" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Login" runat="server" Text='<%#Eval("CWLogin")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
         <asp:TemplateField HeaderText="ProfileImage">
                    <ItemTemplate>
                      <asp:Image ID="imgProfileImage" runat="server" ImageUrl='<%#Eval("ProfileImage")%>' AlternateText="Profile Image" width="100px" Height="120px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                    <b><asp:Label ID="lblUserName" runat="server" Text='<%#Eval("Name")%>' ></asp:Label></b><br />
                   <b> <asp:Label ID="lblJobTitleBind" runat="server" Text='<%#Eval("JobTitle")%>' ForeColor="Blue"></asp:Label></b>
                 
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone No. and Email Id">
                    <ItemTemplate >
                     <b><asp:Label ID="lblPhoneNumber" runat="server" Text='<%#Eval("phone")%>' ForeColor="Blue"></asp:Label></b><br />
                    <b><asp:Label ID="lblAlternatePhoneNumber" runat="server" Text='<%#Eval("AlternatePhoneNo")%>' ForeColor="Blue"></asp:Label></b>
                  <b><asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email")%>' ForeColor="Blue"></asp:Label></b>
                 
                      <%--  <%#Eval("phone")%>
                         <%#Eval("AlternatePhoneNo")%><br />
                            <%#Eval("Email")%>--%>
                    </ItemTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total Hours" >
           
                    <ItemTemplate>
                   
                       <b><asp:Label ID="lblTotalHours" runat="server"></asp:Label></b>
                       <asp:HiddenField ID="hdnTotalMaxHours" runat="server" Value='<%#Eval("MaxVacationHours")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
             <%--   <asp:TemplateField HeaderText="Manager">
                    <ItemTemplate>
                      
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Manager and Action">
                    <ItemTemplate>
                    <b><asp:Label ID="lblManager" runat="server" Text='<%# Eval("Manager")%>'></asp:Label></b> <br /><br />
                        <a href="viewEmployee.aspx?Uid=<%#Eval("User_Id")%>" title="View">
                            <img src="../images/View_img.png" alt="" width="20" height="20" />
                        </a>
                         <a href="viewEmployee.aspx?Uid1=<%#Eval("User_Id")%>" title="Edit">
                            <img src="../images/Edit_img.png" alt="" width="20" height="20" />
                        </a>
                     
                        <asp:ImageButton ID="img_del" runat="server" CommandArgument='<%#Eval("CWLogin")%>'
                            ToolTip="Delete" ImageUrl="../images/Del_img.png" Width="20" Height="20" OnClick="img_del_Click"  OnClientClick="return confirm('Are you sure you want to delete this Record?');"/>
                         <asp:ImageButton ID="Img_IsActStatus" runat="server" CommandArgument='<%# Eval("CWLogin")%>'
                            ImageUrl="../images/ico_active.gif" Visible='<%# Eval("AuditorPayOutPermissionLevel").ToString() == "1" %>'
                            ToolTip="Click To DeActive Status" OnClick="Img_IsActStatus_Click" Style="margin-left: 2px;" />
                        <asp:ImageButton ID="Img_IsDeActStatus" runat="server" CommandArgument='<%# Eval("CWLogin")%>'
                            ImageUrl="../images/ico_inactive.png" Visible='<%# Eval("AuditorPayOutPermissionLevel").ToString() == "0" %>'
                            ToolTip="Click To Active Status" OnClick="Img_IsDeActStatus_Click" Style="margin-left: 2px;" />
                        <asp:DropDownList ID="ddl_status" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_status_SelectedIndexChanged">
                            <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                            <asp:ListItem Text="Normal" Value="User"></asp:ListItem>
                            <asp:ListItem Text="Special" Value="Usr_Adm"></asp:ListItem>
                        </asp:DropDownList>
                     
                    </ItemTemplate>
                </asp:TemplateField>
              <%--  <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                      
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
            <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
           <%-- <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>--%>
        </asp:GridView>
        </div>
    </div>
    
    <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
    <%--tanveer pop up--%>
    <asp:Panel ID="pnl_update" runat="server" BackColor="#E6E6ED" Width="425px" Style="display: none; border: 1px solid #B4B2B2; padding-left: 15px;">
        <h4 style="text-align: center; margin: 10px 0 0;">Update
        </h4>


       
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
