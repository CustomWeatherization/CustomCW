<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="ManagePaidReport.aspx.cs" Inherits="Admin_ManagePaidReport" Title="Custom Weatherization/ Report Manage" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagePaidReport.aspx.cs" Inherits="ManagePaidReport"
    Title="Custom Weatherization/ Report Manage" EnableEventValidation="false" %>--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

<title></title>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>--%>
    <link rel="stylesheet" href="../css/jquery-ui.css" />

    <script type="text/javascript" language="javascript" src="../js/jquery-1.10.2.js"></script>

    <script type="text/javascript" language="javascript" src="../js/jquery-ui.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
        
            var rmng = localStorage.getItem("TCount");
            rmng = parseFloat(rmng).toFixed(2);
            var total=document.getElementById("<%=txt_Total.ClientID%>").value;
            // $("#ctl00_ContentPlaceHolder1_txt_Remaining").val(rmng);
            var PaidAmt = '0.00';
            if (parseFloat(rmng) > 0) {
            
              //  PaidAmt = parseFloat($("#ctl00_ContentPlaceHolder1_txt_Total").val()) - parseFloat($("#ctl00_ContentPlaceHolder1_txt_Remaining").val());
                PaidAmt = parseFloat(total) - parseFloat(total);
              
                PaidAmt = parseFloat(PaidAmt).toFixed(2);
            }
            else {
           
                PaidAmt = parseFloat(total);
                PaidAmt = parseFloat(PaidAmt).toFixed(2);
            }
            // $("#ctl00_ContentPlaceHolder1_txt_Paid").val(PaidAmt);
            document.getElementById('<%= txt_NewInvoiceAmount.ClientID %>').value=PaidAmt;
            var LSPT_ = localStorage.getItem("LSPT");
            var LSCN_ = localStorage.getItem("LSCN");

            document.getElementById('<%= txt_PaymentType.ClientID %>').value=LSPT_;
            if (LSPT_ == 'Credit Card') {
                LSCN_ = "";
            }
            document.getElementById('<%= txt_Payment_no.ClientID %>').value=LSCN_;
            document.getElementById('<%= hdn_txt_PaymentType.ClientID %>').value=LSPT_;
            document.getElementById('<%= txt_Payment_no.ClientID %>').value=LSCN_;
            document.getElementById("<%=txt_Payment_no.ClientID%>").value=LSCN_;
        });
    </script>

    <style type="text/css">
        .cd-popup-container
        {
            top: 168px;
            text-align: left !important;
            border: 3px solid #333;
            border-radius: 1.25em !important;
            padding: 20px 0;
            width: 900px !important;
        }
        .ui-widget-content
        {
            background: #d0eaff;
        }
        .ui-dialog .ui-dialog-content
        {
            background: #fff;
        }
        .ui-dialog .ui-dialog-titlebar
        {
            background: #d0eaff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<body>--%>
    <br />
    <br />
    <div class="cd-popup is-visible" role="alert">
        <div class="cd-popup-container">
            <table width="60%" cellpadding="5" cellspacing="5" border="0" align="center">
                <tr>
                    <td width="40%">
                        Job Number:
                    </td>
                    <td>
                        <asp:TextBox ID="txt_JobNumber" runat="server" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                        Total Amount:
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Total" runat="server" Enabled="false"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txt_Total" runat="server" TargetControlID="txt_Total"
                            FilterType="Custom,Numbers" ValidChars=".-">
                        </ajx:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="rfv_txt_Total" runat="server" ControlToValidate="txt_Total"
                            ErrorMessage="*" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                        Paid Amount:
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Paid" runat="server" onkeydown="SetCalculation();" onkeyup="SetCalculation();"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txt_Paid" runat="server" TargetControlID="txt_Paid"
                            FilterType="Custom,Numbers" ValidChars=".-">
                        </ajx:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="rfv_txt_Paid" runat="server" ControlToValidate="txt_Paid"
                            ErrorMessage="*" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                        Remaning Amount:
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Remaining" runat="server" Enabled="false"></asp:TextBox>
                        <asp:HiddenField ID="hdn_txt_Remaining" runat="server" />
                        <ajx:FilteredTextBoxExtender ID="Fltr_txt_Remaining" runat="server" TargetControlID="txt_Remaining"
                            FilterType="Custom,Numbers" ValidChars=".-">
                        </ajx:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="rfv_txt_Remaining" runat="server" ControlToValidate="txt_Remaining"
                            ErrorMessage="*" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                        Keep Remaining:
                    </td>
                    <td>
                        <asp:CheckBox ID="ChkYes" runat="server" Text="Yes" onclick="ChkAct129(this.id);" />&nbsp;&nbsp;<asp:CheckBox
                            ID="ChkNo" runat="server" Text="No" Checked="true" onclick="ChkAct129(this.id);" />
                        <asp:HiddenField ID="hdn_Keeping" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                        New Invoice Amount:
                    </td>
                    <td>
                        <asp:TextBox ID="txt_NewInvoiceAmount" runat="server"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="fltr_txt_NewInvoiceAmount" runat="server" TargetControlID="txt_NewInvoiceAmount"
                            FilterType="Custom,Numbers" ValidChars=".-">
                        </ajx:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_NewInvoiceAmount"
                            ErrorMessage="*" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr style="display:none">
                    <td width="40%" >
                        Payment Type:
                    </td>
                    <td visible="false">
                        <asp:TextBox ID="txt_PaymentType" runat="server" onkeyup="Check_Cash();" Enabled="false"
                            onblur="Check_Cash();" ></asp:TextBox>
                        <asp:HiddenField ID="hdn_txt_PaymentType" runat="server" />
                        <ajx:FilteredTextBoxExtender ID="Fltr_txt_PaymentType" runat="server" TargetControlID="txt_PaymentType"
                            FilterType="UppercaseLetters,LowercaseLetters,Custom" ValidChars=" ">
                        </ajx:FilteredTextBoxExtender>
                      
                    </td>
                </tr>
                <tr style="display:none">
                    <td width="40%">
                        Payment Type No.:
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Payment_no" runat="server" Enabled="false"></asp:TextBox>
                        <asp:HiddenField ID="hdn_txt_Payment_no" runat="server" />
                        <ajx:FilteredTextBoxExtender ID="Fltr_txt_Payment_no" runat="server" TargetControlID="txt_Payment_no"
                            FilterType="Custom,Numbers,UppercaseLetters,LowercaseLetters" ValidChars="/- ">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr style="display: none;">
                    <td width="20%">
                        Paid Status:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPaidStaus" runat="server">
                            <asp:ListItem><-- Select --></asp:ListItem>
                            <asp:ListItem>Not Paid</asp:ListItem>
                            <asp:ListItem>Paid</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                        Reason:
                    </td>
                    <td>
                       
                        <asp:DropDownList ID="DDL_Quetion" runat="server" Width="53%">
                            <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                            <asp:ListItem Text="Travel Time Was Charged When Not Allowed" Value="Travel Time Was Charged When Not Allowed"></asp:ListItem>
                            <asp:ListItem Text="Billing Error" Value="Billing Error"></asp:ListItem>
                            <asp:ListItem Text="Billed in Invoice But Not Mentioned In Audit" Value="Billed in Invoice But Not Mentioned In Audit"></asp:ListItem>
                            <asp:ListItem Text="Refrigerator/Freezer Test Not Billed" Value="Refrigerator/Freezer Test Not Billed"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DDL_Quetion" InitialValue="Select"
                            ErrorMessage="*" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td width="40%" valign="top">
                        Comment:
                    </td>
                    <td>
                        <asp:TextBox ID="txtComment" TextMode="MultiLine" runat="server" Rows="10" Columns="40"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtComment"
                            ErrorMessage="*" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                    </td>
                    <td>
                        <asp:Button ID="btn_SaveChange" runat="server" Text="Save" CssClass="btn_all" OnClick="btn_SaveChange_Click"
                            OnClientClick="SetLocal();" ValidationGroup="rfv" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="hidtag" runat="server" />
            <asp:LinkButton ID="lnkBtnClose" runat="server" CssClass="cd-popup-close img-replace"
                OnClick="lnkBtnClose_Click"></asp:LinkButton>
        </div>
    </div>

    <script type="text/javascript">

        function SetLocal() {
            localStorage.setItem("TCount", "0.00");
            //localStorage.setItem("LSCN", "");
            //localStorage.setItem("LSPT", "");
        }
        function ChkAct129(ID) {
      
            var CheckBox = document.getElementById(ID);
            var checkvalueyes=document.getElementById('<%= ChkYes.ClientID %>');
            var checkvalueno=document.getElementById('<%= ChkNo.ClientID %>');
            document.getElementById('<%= ChkYes.ClientID %>').checked = false;
            document.getElementById('<%= ChkNo.ClientID %>').checked = false;
            CheckBox.checked = true;
            if (CheckBox == checkvalueyes) {
            var newamount=document.getElementById('<%= txt_NewInvoiceAmount.ClientID%>')
            var totalamount=document.getElementById('<%= txt_Total.ClientID%>');
                newamount.value=parseFloat(totalamount.value).toFixed(2);
                document.getElementById('<%= hdn_Keeping.ClientID %>').value = "Y";
            }
            else if (CheckBox == checkvalueno) {
            var paidamount=document.getElementById('<%= txt_Paid.ClientID%>');
                var Newtotl = parseFloat(paidamount.value);
                document.getElementById('<%= txt_NewInvoiceAmount.ClientID%>').value=Newtotl;
                document.getElementById('<%= hdn_Keeping.ClientID %>').value = "N";
            }
    }

    function SetCalculation() {
    
        var total = document.getElementById('<%=txt_Total.ClientID%>').value;
        var paidAmt = document.getElementById('<%=txt_Paid.ClientID%>').value;
        var rmngAmt = parseFloat(total) - parseFloat(paidAmt);
        document.getElementById('<%=txt_Remaining.ClientID%>').value = rmngAmt.toFixed(2);
        document.getElementById('<%=hdn_txt_Remaining.ClientID%>').value = rmngAmt.toFixed(2);
        if (parseFloat(paidAmt) > parseFloat(total)) {
            document.getElementById('<%= ChkNo.ClientID %>').checked = true;
            document.getElementById('<%= hdn_Keeping.ClientID %>').value = "N";
            document.getElementById('<%= ChkYes.ClientID %>').checked = false;
            document.getElementById('<%= ChkYes.ClientID %>').disabled = true;
            document.getElementById('<%= ChkNo.ClientID %>').disabled = true;
        }
        else {
            document.getElementById('<%= ChkNo.ClientID %>').checked = true;
            document.getElementById('<%= hdn_Keeping.ClientID %>').value = "N";
            document.getElementById('<%= ChkYes.ClientID %>').checked = false;
            document.getElementById('<%= ChkYes.ClientID %>').disabled = false;
            document.getElementById('<%= ChkNo.ClientID %>').disabled = false;
        }

        if ((parseFloat(paidAmt) > parseFloat(total)) && (document.getElementById('<%= ChkNo.ClientID %>').checked == true)) {
            //$("#ctl00_ContentPlaceHolder1_txt_NewInvoiceAmount").val(paidAmt.toFixed(2));
            document.getElementById('<%= txt_NewInvoiceAmount.ClientID%>').value=parseFloat(paidAmt);
        }
        else {
            if (document.getElementById('<%= ChkNo.ClientID %>').checked == true) {
                var Newtotl = parseFloat(paidAmt);
                document.getElementById('<%= txt_NewInvoiceAmount.ClientID%>').value=Newtotl;
            }
        }
    }


    function Check_Cash() {
        var PaymentType = document.getElementById('<%=txt_PaymentType.ClientID%>');
        if (PaymentType.value.toLowerCase() == 'cash') {
            document.getElementById('<%=txt_Payment_no.ClientID%>').disabled = true;
        }
    }
    </script>

    <%--</body>
</html>--%>
</asp:Content>
