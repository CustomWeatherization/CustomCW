<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VendorInvoice.aspx.cs" Inherits="Vendor_VendorInvoice"
    EnableEventValidation="false" MasterPageFile="~/Vendor/Vendor.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style type="text/css">
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
            float: left;
        }
        .JobBtn_
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
        }
        .In input[type="text"]
        {
            width: 80%;
        }
    </style>
    <ajaxToolkit:ToolkitScriptManager ID="ajxTlktScrptMngr" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <div class="form_div">
        <div style="width: 100%; line-height: 50px; text-align: center;">
            <div style="float: left;">
                <asp:Image ID="ImgVen" runat="server" Height="50px" />
            </div>
            <h1 id="spnNewPay" runat="server" style="vertical-align: middle;">
                Add New Payment Due
            </h1>
        </div>
        <table id="tblNewInv" runat="server" width="100%" style="clear: both;" border="0"
            cellspacing="2" cellpadding="2">
            <tr>
                <td>
                    Invoice Date:
                </td>
                <td id="tdSpnDueDate" runat="server" visible="false">
                    Due Date:
                </td>
                <td>
                    Invoice#:
                </td>
                <td>
                    Invoice Amount:
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtVendorInvoiceDate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtVendorInvoiceDate">
                    </ajaxToolkit:CalendarExtender>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" runat="server"
                        TargetControlID="txtVendorInvoiceDate" FilterType="Custom,Numbers" ValidChars="/">
                    </ajaxToolkit:FilteredTextBoxExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVendorInvoiceDate"
                        ErrorMessage="*" ValidationGroup="invc"></asp:RequiredFieldValidator>
                </td>
                <td id="tdTxtDueDate" runat="server" visible="false">
                    <asp:TextBox ID="TxtDueDate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TxtDueDate">
                    </ajaxToolkit:CalendarExtender>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                        TargetControlID="TxtDueDate" FilterType="Custom,Numbers" ValidChars="/">
                    </ajaxToolkit:FilteredTextBoxExtender>
                </td>
                <td>
                    <asp:TextBox ID="txtVendorInvoiceNumber" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvVendorInvoiceNumber" runat="server" ControlToValidate="txtVendorInvoiceNumber"
                        ErrorMessage="*" ValidationGroup="invc"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txtVendorInvoiceAmnt" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtVendorInvoiceAmnt"
                        ErrorMessage="*" ValidationGroup="invc"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Button ID="btnAddVendorInvoice" runat="server" Text="Add" OnClick="btnAddVendorInvoice_Click"
                        class="JobBtn" ValidationGroup="invc" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btn_Paid" class="JobBtn" Style="float: right;" runat="server" Text="Pay Selected"
            OnClick="btn_Paid_Click" />
        <div>
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
            <div class="rounded_corners" style="width: 80%;">
                <asp:GridView runat="server" ID="GrdVendorInvoice" Width="100%" EmptyDataText="No Record !!"
                    AutoGenerateColumns="false" DataKeyNames="InvoiceId" HeaderStyle-BackColor="#3AC0F2"
                    HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                    RowStyle-ForeColor="#3A3A3A" OnRowUpdating="GrdVendorInvoice_RowUpdating" CssClass="tblvendor"
                    OnRowCancelingEdit="GrdVendorInvoice_RowCancelingEdit" OnRowDeleting="GrdVendorInvoice_RowDeleting"
                    OnRowEditing="GrdVendorInvoice_RowEditing">
                    <RowStyle BackColor="#A1DCF2" ForeColor="#3A3A3A"></RowStyle>
                    <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkRow" runat="server" ValidationGroup='<%#Eval("InvoiceId")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Invoice Date">
                            <ItemTemplate>
                                <%# Eval("InvoiceDate", "{0:MM/dd/yyyy}")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Txt_G_InvDate" runat="server" Width="72px" Text='<%# Eval("InvoiceDate", "{0:MM/dd/yyyy}")%>'></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CE_G_InvDate" runat="server" TargetControlID="Txt_G_InvDate">
                                </ajaxToolkit:CalendarExtender>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Due Date">
                            <ItemTemplate>
                                <%# Eval("DueDate", "{0:MM/dd/yyyy}")%>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                                <asp:TextBox ID="Txt_G_InvDate" runat="server" Width="72px" Text='<%# Eval("InvoiceDate", "{0:MM/dd/yyyy}")%>'></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CE_G_InvDate" runat="server" TargetControlID="Txt_G_InvDate">
                                </ajaxToolkit:CalendarExtender>
                            </EditItemTemplate>--%>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Invoice #">
                            <ItemTemplate>
                                <%#Eval("InvoiceNo")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Txt_G_InvNo" runat="server" Width="72px" Text='<%#Eval("InvoiceNo")%>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Invoice Amount">
                            <ItemTemplate>
                                $
                                <asp:Label ID="lbl_G_InvoiceAmnt" runat="server" Text='<%# Eval("InvoiceAmnt", "{0:0.00}")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                $
                                <asp:TextBox ID="Txt_G_InvoiceAmnt" runat="server" Width="72px" Text='<%# Eval("InvoiceAmnt", "{0:0.00}")%>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="BtnPayInvoice" Style="padding: 1px 10px; color: White; float: right;
                                    margin-right: 35%;" runat="server" Text="Pay" CommandName="Update" class="JobBtn"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LnkBtnEdit" Style="padding: 1px 10px; color: White;" runat="server"
                                    CommandName="Edit" Text="Edit" class="JobBtn"></asp:LinkButton>
                                <asp:LinkButton ID="LnkBtnDelete" Style="padding: 1px 10px; color: White;" runat="server"
                                    OnClientClick="return confirm('Are you sure you want to delete this Invoice?');"
                                    CommandName="Delete" Text="Delete" class="JobBtn"></asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="LnkBtnUpdate" Style="padding: 1px 10px; color: White;" runat="server"
                                    CommandName="Update" Text="Update" class="JobBtn"></asp:LinkButton>
                                <asp:LinkButton ID="LnkBtnCancel" Style="padding: 1px 10px; color: White;" runat="server"
                                    CommandName="Cancel" Text="Cancel" class="JobBtn"></asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Button ID="modelPopup" runat="server" Style="display: none" />
            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="modelPopup"
                PopupControlID="updatePanel" CancelControlID="btnCancel" BackgroundCssClass="tableBackground">
            </asp:ModalPopupExtender>
            <asp:Panel ID="updatePanel" runat="server" BorderStyle="Solid" BackColor="White"
                Height="140px" Width="990px" Style="display: none">
                <br />
                <br />
                <asp:HiddenField ID="hdnInvId" runat="server" />
                <asp:HiddenField ID="hdnInvAmt" runat="server" />
                <table width="100%" cellspacing="4" class="In">
                    <tr>
                        <td>
                            Paid Date:
                        </td>
                        <td id="tdSpnPa" runat="server">
                            Paid Amount:
                        </td>
                        <td>
                            Payment Type:
                        </td>
                        <td>
                            Person Making Payment:
                        </td>
                        <td>
                            Check #/Confirmation #
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtPaidDate" runat="server" />
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtPaidDate">
                            </ajaxToolkit:CalendarExtender>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                TargetControlID="txtPaidDate" FilterType="Custom,Numbers" ValidChars="/">
                            </ajaxToolkit:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPaidDate"
                                ErrorMessage="*" ValidationGroup="invcp"></asp:RequiredFieldValidator>
                        </td>
                        <td id="tdTxtPa" runat="server">
                            <asp:TextBox ID="txtPaidAmnt" runat="server" />
                            <asp:RequiredFieldValidator ID="rfv_txtPaidAmnt" runat="server" ControlToValidate="txtPaidAmnt"
                                ErrorMessage="*" ValidationGroup="invcp"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPaymentType" runat="server">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Check" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Credit Card" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_DDL_AllDates" runat="server" ValidationGroup="invcp"
                                ControlToValidate="ddlPaymentType" ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPaidBy" runat="server">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="invcp"
                                ControlToValidate="ddlPaidBy" ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtChckConfrm" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtChckConfrm"
                                ErrorMessage="*" ValidationGroup="invcp"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="5">
                            <asp:Button ID="btnUpdate" runat="server" class="JobBtn_" CommandName="Update" OnClick="btnModity_Click"
                                Text="Pay" ValidationGroup="invcp" />&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" class="JobBtn_" Text="Cancel" />
                        </td>
                        <%--<td align="justify">
                            
                        </td>--%>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <br />
        <hr />
        <h1 align="center">
            <i>Payment History</i></h1>
        <br />
        <div class="rounded_corners" style="width: 100%;">
            <asp:GridView runat="server" ID="GrdPaymentHistory" Visible="true" Width="100%" EmptyDataText="No Record !!"
                AutoGenerateColumns="false" DataKeyNames="InvoiceId" HeaderStyle-BackColor="#3AC0F2"
                HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                RowStyle-ForeColor="#3A3A3A" CssClass="tblvendor" OnRowCancelingEdit="GrdPaymentHistory_RowCancelingEdit"
                OnRowDeleting="GrdPaymentHistory_RowDeleting" OnRowEditing="GrdPaymentHistory_RowEditing"
                OnRowUpdating="GrdPaymentHistory_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="Invoice Date">
                        <ItemTemplate>
                            <%# Eval("InvoiceDate", "{0:MM/dd/yyyy}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_G_InvDate" runat="server" Width="72px" Text='<%# Eval("InvoiceDate", "{0:MM/dd/yyyy}")%>'></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CE_G_InvDate" runat="server" TargetControlID="Txt_G_InvDate">
                            </ajaxToolkit:CalendarExtender>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Due Date">
                        <ItemTemplate>
                            <%# Eval("DueDate", "{0:MM/dd/yyyy}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_G_DueDate" runat="server" Width="72px" Text='<%# Eval("DueDate", "{0:MM/dd/yyyy}")%>'></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CE_G_DueDate" runat="server" TargetControlID="Txt_G_DueDate">
                            </ajaxToolkit:CalendarExtender>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Invoice #">
                        <ItemTemplate>
                            <%#Eval("InvoiceNo")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_G_InvNo" runat="server" Width="72px" Text='<%#Eval("InvoiceNo")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Invoice Amount">
                        <ItemTemplate>
                            $
                            <%# Eval("InvoiceAmnt", "{0:0.00}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            $
                            <asp:TextBox ID="Txt_G_InvoiceAmnt" runat="server" Width="72px" Text='<%# Eval("InvoiceAmnt", "{0:0.00}")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Paid Date">
                        <ItemTemplate>
                            <%# Eval("PaidDate", "{0:MM/dd/yyyy}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_G_PaidDate" runat="server" Width="72px" Text='<%# Eval("PaidDate", "{0:MM/dd/yyyy}")%>'></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CE_G_PaidDate" runat="server" TargetControlID="Txt_G_PaidDate">
                            </ajaxToolkit:CalendarExtender>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payment Type">
                        <ItemTemplate>
                            <%#Eval("PaymentType")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_G_PaymentType" runat="server" Width="72px" Text='<%# Eval("PaymentType")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Person Making Payment">
                        <ItemTemplate>
                            <%#Eval("PaidBy")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_G_PaidBy" runat="server" Width="72px" Text='<%# Eval("PaidBy")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Check #/Confirmation #">
                        <ItemTemplate>
                            <%#Eval("CheckNo")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txt_G_CheckNo" runat="server" Width="72px" Text='<%# Eval("CheckNo")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Paid Amount">
                        <ItemTemplate>
                            $
                            <%# Eval("PaidAmnt", "{0:0.00}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            $
                            <asp:TextBox ID="Txt_G_PaidAmnt" runat="server" Width="72px" onblur="Calculation()"
                                Text='<%# Eval("PaidAmnt", "{0:0.00}")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <b><span style="color: Green;">
                                <%# Eval("Status")%></span></b>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LnkBtnEdit" Style="padding: 1px 10px; color: White;" runat="server"
                                Text="Edit" class="JobBtn" CommandName="Edit"></asp:LinkButton>
                            <asp:LinkButton ID="LnkBtnDelete" Style="padding: 1px 10px; color: White;" runat="server"
                                Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this Invoice?');"
                                class="JobBtn"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LnkBtnUpdate" Style="padding: 1px 10px; color: White;" runat="server"
                                CommandName="Update" Text="Update" class="JobBtn"></asp:LinkButton>
                            <asp:LinkButton ID="LnkBtnCancel" Style="padding: 1px 10px; color: White;" runat="server"
                                CommandName="Cancel" Text="Cancel" class="JobBtn"></asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div>
        </div>
    </div>

    <script type="text/javascript">
 function Calculation() {  
    var grid = document.getElementById("<%= GrdPaymentHistory.ClientID%>");  
    for (var i = 0; i < grid.rows.length - 1; i++) {  
    var Txt_G_PaidAmnt = $("input[id*=Txt_G_PaidAmnt]")  
    if (Txt_G_PaidAmnt[i].value != '') {  
    var numbers = parseFloat(Txt_G_PaidAmnt[i].value);
    var AmtComma = numbers.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
    Txt_G_PaidAmnt[i].value = AmtComma;}}}
    </script>

</asp:Content>
