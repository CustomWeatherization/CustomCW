<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master"
    AutoEventWireup="true" CodeFile="LeaveApproval.aspx.cs" Inherits="Admin_LeaveApproval" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- <link href="../css/default.css" rel="stylesheet" type="text/css" />--%>
    <style type="text/css">
        .leaves-tbl tr th
        {
            padding: 15px 10px;
        }
        .leaves-tbl tr td
        {
            padding: 3px 3px;
        }
        .leaves-tbl select
        {
            width: 100%;
            border-radius: 10px;
            padding: 8px;
        }
        .msg_count1
        {
            background-color: #ff0000;
            border: 1px solid #ac0000; /* position: absolute; */
            border-radius: 15px;
            font-size: 14px;
            color: #fff;
            top: 0;
            left: 80px;
            padding: 2px 2px;
            min-width: 30px;
            text-align: center;
        }
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
        .Background
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .Popup
        {
            padding: 20px 0px;
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: black;
            overflow: auto;
            padding-left: 10px;
            width: 800px;
            height: 850px;
            border-radius: 10px;
        }
        .Popup1
        {
            padding: 20px 0px;
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: black;
            padding-left: 10px;
            width: 600px;
            height: 220px;
            border-radius: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <table align="center">
        <tr>
            <td>
                <strong>Employee:-</strong>&nbsp;<asp:DropDownList ID="DDL_Employee" runat="server"
                    Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                    color: black; border-radius: 5px; padding: 8px; margin: 0; width: 200px;" maxlength="40"
                    AutoPostBack="true" OnSelectedIndexChanged="DDL_Employee_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp; <strong>Request Type:-</strong>&nbsp;<asp:DropDownList ID="ddlRequestType"
                    runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 200px;"
                    maxlength="40" AutoPostBack="true" OnSelectedIndexChanged="ddlRequestType_SelectedIndexChanged">
                    <asp:ListItem Text="All" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Vacation" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Sickness" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Unpaid" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Unpaid Sickness" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Emergency Paid Time Off" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Emergency Time Off" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Holiday Pay" Value="7"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
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
    <%-- <asp:UpdatePanel ID="upPnl" runat="server">
        <ContentTemplate>--%>
    <%--<asp:Button ID="btnRejectRP" runat="server" Text="Reject" OnClick="btnRejectRP_Click" />--%>
    <asp:Button ID="btnPending" runat="server" Text="Pending" CssClass="paidBtn" OnClick="btnPending_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="btnApprove" runat="server" Text="Approved" CssClass="paidBtnDis"
        OnClick="btnApprove_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="BtnRejected" runat="server" Text="Rejected" CssClass="paidBtnDis"
        OnClick="BtnRejected_Click" />
    <div class="rounded_corners" style="width: 100%;" id="div_grid" runat="server">
        <asp:GridView ID="grdCategory" runat="server" Width="100%" DataKeyNames="ID" class="leaves-tbl"
            AutoGenerateColumns="false" PageSize="10" AllowPaging="true" OnPageIndexChanging="grdCategory_PageIndexChanging"
            HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
            AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A" OnRowDataBound="grdCategory_RowDataBound"
            EmptyDataText="No Request Available">
            
            <RowStyle BackColor="#A1DCF2" ForeColor="#3A3A3A"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText="Login Id" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Login" runat="server" Text='<%#Eval("LoginID")%>'></asp:Label>
                        <asp:HiddenField ID="hdnEmployeeId" runat="server" Value='<%#Eval("ID")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User Name">
                    <ItemTemplate>
                        <asp:Label ID="lblUserName" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Request For">
                    <ItemTemplate>
                        <asp:Label ID="lblRequestType" runat="server" Text='<%#Eval("TypeOfRequesteType")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="From Date">
                    <ItemTemplate>
                        <asp:Label ID="lblFromDate" runat="server" Text='<%#Eval("FromDate")%>' ForeColor="Blue"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="To Date">
                    <ItemTemplate>
                        <asp:Label ID="lblToDate" runat="server" Text='<%#Eval("ToDate")%>' ForeColor="Blue"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="From Time">
                    <ItemTemplate>
                        <asp:Label ID="lblFromTime" runat="server" Text='<%# Eval("FromTime")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="To Time">
                    <ItemTemplate>
                        <asp:Label ID="lblToTime" runat="server" Text='<%# Eval("ToTime")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hours">
                    <ItemTemplate>
                        <asp:Label ID="lblTotalHours" runat="server" Text='<%# Eval("TotalHours")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comments">
                    <ItemTemplate>
                        <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comments")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reject Comments" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblRejectComments" runat="server" Text='<%# Eval("RejectComment")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Approve Date" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblApproveDate" runat="server" Text='<%# Eval("ApproveDate")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reject Date" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblRejectDate" runat="server" Text='<%# Eval("RejectDate")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                    <HeaderTemplate>
                        <asp:Label ID="lblStatusmsg" runat="server" Text="Status"></asp:Label>&nbsp;
                        <%--    <span class="msg_count1">
                    <asp:Label ID="lblMsg" runat="server" Title="Pending"></asp:Label>
                </span>onchange="Confirm(this)" --%>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="ddl_status" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_status_SelectedIndexChanged"
                            AppendDataBoundItems="true" ValidationGroup="G">
                            <asp:ListItem Text="Select Status" Value="Select Status"></asp:ListItem>
                            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                            <asp:ListItem Text="Approve" Value="Approve"></asp:ListItem>
                            <asp:ListItem Text="Reject" Value="Reject"></asp:ListItem>
                            <asp:ListItem Text="Cancel and Restore" Value="Cancel and Restore"></asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
        </asp:GridView>
    </div>
    <br />
    <asp:Panel ID="pnltotalHours" runat="server" Visible="false">
        <div id="DivGrndTotal" runat="server" style="float: right; margin-right: 45px;">
            Total Hours:-&nbsp;<b>
                <asp:Label ID="lbl_GrandTotal" runat="server"></asp:Label></b>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlRejectComment" Style="display: none" CssClass="Popup1">
        <div style="width: 100%">
            <div style="text-align: center; width: 100% !important;" class="divalign">
                <h1 class="assign" style="width: 100% !important;">
                    <b>
                        <asp:Label runat="server" ID="lblRequestedOff" Text="Comment"></asp:Label></b>
                    <asp:ImageButton ID="ImageButton1" runat="server" OnClick="btn_cancel_Click" ImageUrl="images/Cross3.png"
                        Height="35px" Width="35px" Style="float: right; margin-right: 20px;" /></h1>
            </div>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtComment" CssClass="textbox77"
                Width="98%" Height="120px"></asp:TextBox><br />
            <br />
            <div style="text-align: center">
                <asp:Button ID="btnSubmitTime" runat="server" Text="Submit" class="btn_all" OnClick="btnComment_Click"
                    ValidationGroup="R" CausesValidation="true" /></div>
        </div>
    </asp:Panel>
    <asp:Button ID="btnPanelShowOff" runat="server" Style="display: none" OnClick="btnPanelShowOff_Click1" />
    <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="pnlRejectComment"
        TargetControlID="btnPanelShowOff" BackgroundCssClass="Background" X="520" Y="150">
    </asp:ModalPopupExtender>

    <script language="javascript">

        function handleChange(opt) {
            debugger;
            if (opt.value == "Cancel and Restore") {
                if (!confirm('Are you sure you want to cancel this request?')) {
                    opt.selectedIndex = opt.oldIndex;
                }
                else {
                    __doPostBack('MyDropDown', '')
                }
            }
        }
      
    </script>

</asp:Content>
