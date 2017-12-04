<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true" EnableEventValidation="false"
    CodeFile="PaidUnPaidInvoice.aspx.cs" Inherits="PaidUnPaidInvoice" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .paidBtn {
            background: #28A3D1;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            padding: 5px 20px; /* border-bottom-left-radius: 5px; */
            cursor: pointer;
        }

        .paidBtnDis {
            background: #A1DCF2;
            color: #fff;
            border: 0;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            padding: 5px 20px; /* border-bottom-left-radius: 5px; */
            cursor: pointer;
        }

        .PayBtn {
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

        .RejectBtn {
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

        .JobBtn {
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
    <%-- <ajaxToolkit:ToolkitScriptManager ID="scrpt" runat="server">
    </ajaxToolkit:ToolkitScriptManager>--%>
    <br />
    <br />
    <div style="width: 98%;">
        <asp:UpdatePanel ID="upPnl" runat="server">
            <ContentTemplate>
                <div id="Divpaging" runat="server" style="float: right;">
                    <strong>Page Size:&nbsp;</strong>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        <asp:ListItem Text="15" Value="15"></asp:ListItem>
                        <asp:ListItem Text="20" Value="20"></asp:ListItem>
                        <asp:ListItem Text="ALL" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form_div" id="divrangeFilter" runat="server">
                    Range&nbsp;
        <asp:DropDownList ID="DDL_Range" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_Range_SelectedIndexChanged" Width="150px">
            <asp:ListItem Text="choose one.." Value="0"></asp:ListItem>
            <asp:ListItem Text="Last Pay Date" Value="1"></asp:ListItem>
            <asp:ListItem Text="This Month" Value="2"></asp:ListItem>
            <asp:ListItem Text="This Qtr" Value="3"></asp:ListItem>
            <asp:ListItem Text="This Year" Value="4"></asp:ListItem>
            <asp:ListItem Text="Last Month" Value="5"></asp:ListItem>
            <asp:ListItem Text="Last Qtr" Value="6"></asp:ListItem>
            <asp:ListItem Text="Last Year" Value="7"></asp:ListItem>
            <asp:ListItem Text="-----------" Value="8"></asp:ListItem>
            <asp:ListItem Text="First Qtr" Value="9"></asp:ListItem>
            <asp:ListItem Text="Second Qtr" Value="10"></asp:ListItem>
            <asp:ListItem Text="Third Qtr" Value="11"></asp:ListItem>
            <asp:ListItem Text="Fourth Qtr" Value="12"></asp:ListItem>
        </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp; From Date:&nbsp;
        <asp:TextBox ID="txt_FromDate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txt_FromDate">
                    </ajaxToolkit:CalendarExtender>
                    To Date:&nbsp;<asp:TextBox ID="txt_ToDate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_ToDate">
                    </ajaxToolkit:CalendarExtender>
                    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" CssClass="btn_all"
            OnClick="btnSearch_Click" />
                </div>
                <asp:Button ID="btnNotPay" runat="server" Text="Not Paid" CssClass="paidBtn" OnClick="btnNotPay_Click" />
                <asp:Button ID="btnPay" runat="server" Text="Paid" CssClass="paidBtnDis" OnClick="btnPay_Click" />
                <div class="rounded_corners" style="width: 100%;">
                    <asp:GridView ID="grdSubmitPayment" runat="server" Width="100%" DataKeyNames="Submit_Id"
                        EmptyDataText="No Record !!" AutoGenerateColumns="false" PageSize="10" AllowPaging="true"
                        AllowSorting="true" OnPageIndexChanging="grdSubmitPayment_PageIndexChanging"
                        HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
                        AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A" OnRowDataBound="grdSubmitPayment_RowDataBound"
                        OnSorting="grdSubmitPayment_Sorting" OnDataBound="grdSubmitPayment_DataBound1">
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkRow" runat="server" onClick="JobRejectBtn(this.id)" ValidationGroup='<%#Eval("Submit_Id")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Client Name">
                                <ItemTemplate>
                                    <%#Eval("ClientName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="JobNumber">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_D_JobNum" runat="server" Text='<%#Eval("JobNumber")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Submitted By" SortExpression="SubmittedBy">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_D_Submitted" runat="server" Text='<%#Eval("SubmittedBy")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Submitted Date">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_D_SD" runat="server" Text='<%#Eval("DateSubmitted","{0:d}") %>'></asp:Label>
                                    <asp:Label ID="LBL_SD_Blank" runat="server" Text="-"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date approved for payment">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_D_DAP" runat="server" Text='<%#Eval("DateApprovePayment","{0:d}") %>'></asp:Label>
                                    <asp:Label ID="LBL_DAP_Blank" runat="server" Text="-"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit Date">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_D_ROD" runat="server" Text='<%#Eval("ReOpenDate","{0:d}") %>'></asp:Label>
                                    <asp:Label ID="LBL_ROD_Blank" runat="server" Text="-"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Submitted For">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_G_Audit" runat="server" Text="Audit" Visible="false"></asp:Label>
                                    <asp:Label ID="lbl_G_Invoice" runat="server" Text="Invoice" Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Job Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_D_InvoiceAmt" runat="server" Text="$"></asp:Label><asp:Label ID="lbl_G_InvoiceAmt"
                                        runat="server" Text='<%#Eval("InvoiceAmt")%>'></asp:Label>
                                    <asp:Label ID="lbl_G_Blank1" runat="server" Text="-" Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Percentage">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_G_Percentage" runat="server" Text='<%#Eval("PersentRate")%>'></asp:Label><asp:Label
                                        ID="lbl_D_Percentage" runat="server" Text="%"></asp:Label>
                                    <asp:Label ID="lbl_G_Blank2" runat="server" Text="-" Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PPl Audit">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_D_AuditRate" runat="server" Text="$"></asp:Label><asp:Label ID="lbl_G_AuditRate"
                                        runat="server" Text='<%# Eval("AuditRate")%>'></asp:Label>
                                    <asp:Label ID="lbl_G_Blank3" runat="server" Text="-" Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="METED Audit">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_D_MetedRate" runat="server" Text="$"></asp:Label><asp:Label ID="lbl_G_MetedRate"
                                        runat="server" Text='<%# Eval("MetedAuditRate")%>'></asp:Label>
                                    <asp:Label ID="lbl_G_BlankMetedRate" runat="server" Text="-" Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Extra Measures">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_E_Measures" runat="server" Text="$"></asp:Label><asp:Label ID="lbl_G_ExtraMeasures"
                                        runat="server" Text='<%#Eval("ExtraMesr") %>'></asp:Label>
                                    <asp:Label ID="lbl_G_Blank5" runat="server" Text="-" Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Amount Owed">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_D_GrandTotal" runat="server" Text="$"></asp:Label>
                                    <asp:Label ID="lbl_G_GrandTotal" runat="server" Text='<%# addGrandTotal(Eval("TotalAmount"))%>'></asp:Label>
                                    <asp:Label ID="lbl_G_Blank4" runat="server" Text="-" Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Invoice/Audit">
                                <ItemTemplate>
                                    <div class="top_icons">
                                        <ul>
                                            <li>
                                                <asp:LinkButton ValidationGroup='<%#Eval("InvNo") %>' CommandArgument='<%#Eval("utility") %>'
                                                    ID="Audi" runat="server" Visible="false" class="audit"></asp:LinkButton>
                                                <asp:LinkButton ValidationGroup='<%#Eval("InvNo") %>' CommandArgument='<%#Eval("utility") %>'
                                                    ID="Inv" runat="server" Visible="false" class="billing"></asp:LinkButton>
                                            </li>
                                        </ul>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <br />
                <div style="float: right; margin-right: 45px;">
                    Grand Total:-&nbsp;<b>
                        <asp:Label ID="lbl_GrandTotal" runat="server"></asp:Label></b>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
