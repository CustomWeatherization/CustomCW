<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="EmployeeInformation.aspx.cs" Inherits="Admin_EmployeeInformation" EnableEventValidation="false" Title="Untitled Page" %>
<%--<%@ Register Assembly="ColorPicker" Namespace="ColorPickerTest" TagPrefix="cc1" %>--%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" language="javascript" src="../js/jquery-1.10.2.js"></script>

    <script type="text/javascript" language="javascript" src="../js/jquery-ui.js"></script>
    <style type="text/css">
        .text_style
        {
            border: 1px solid #CCC;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 14px;
            color: #000;
            border-radius: 5px;
            padding: 8px;
            margin: 0px;
        }
        .back_color
        {
            width: 845px;
            float: left;
            background-color: #D0EAFF;
            border-radius: 5px;
            margin: 0px 10px;
            padding: 15px 30px;
        }
    </style>
    <link href="Styles/jqColor.css" rel="stylesheet" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <div class="section">
        <div class="back_color">
            <h1>
                Employee Information</h1>
            <br />
            <asp:UpdatePanel ID="UpPnl" runat="server">
                <ContentTemplate>
                    <asp:CheckBox ID="Chk_SetAuditor" runat="server" AutoPostBack="true" OnCheckedChanged="Chk_SetAuditor_CheckedChanged" />Is
                    this User an Auditor?</ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <table width="100%" border="0" cellspacing="2" cellpadding="2">
                <tr>
                    <td width="20%">
                        First Name:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_Firstname" runat="server" MaxLength="15" Enabled="false" CssClass="text_style"
                            Width="100%"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        Last Name:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_lastname" runat="server" MaxLength="15" Enabled="false" CssClass="text_style"
                            Width="100%"></asp:TextBox>
                    </td>
                    <td style="padding: 15px;">
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Phone Number:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_phone" runat="server" Enabled="false" MaxLength="12" CssClass="text_style"
                            Width="100%"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        Address:
                    </td>
                    <td width="25%" style="height: 20px;">
                        <asp:TextBox ID="txtAddress_Mailing" runat="server" TextMode="MultiLine" Width="100%"
                            CssClass="text_style" Enabled="false"></asp:TextBox>
                    </td>
                    <td style="padding: 15px;">
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        City:
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity_Mailing" runat="server" Enabled="false" MaxLength="25" Width="100%"
                            CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        State:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtState" runat="server" MaxLength="25" Width="100%" Enabled="false"
                            CssClass="text_style"></asp:TextBox>
                    </td>
                    <td style="padding: 15px;">
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Zipcode:
                    </td>
                    <td>
                        <asp:TextBox ID="txtZipCode_Mailing" runat="server" MaxLength="8" Width="100%" Enabled="false"
                            CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        Login Id:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_loginId" runat="server" MaxLength="30" Width="100%" Enabled="false"
                            CssClass="text_style"></asp:TextBox>
                    </td>
                    <td style="padding: 15px;">
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Email:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_email" runat="server" MaxLength="60" Width="100%" Enabled="false"
                            CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        PPL Audit Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_AuditRate" runat="server" MaxLength="10" Width="100%" CssClass="text_style"
                            onblur="Currency_Format(this.id);"></asp:TextBox>
                    </td>
                    <td style="padding: 15px;">
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_PersentRate" runat="server" MaxLength="10" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        METED Audit Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtMetedAudit" runat="server" Width="100%" CssClass="text_style"
                            onblur="Currency_Format(this.id);"></asp:TextBox>
                    </td>
                    <td style="padding: 15px;">
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        BCOC Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtBCOCInvoiceRate" runat="server" MaxLength="10" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        DCED Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtDCEDInvoiceRate" runat="server" Width="100%" CssClass="text_style" ></asp:TextBox>
                    </td>
                    <td style="padding: 15px;">
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Private Customer Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtPCInvoiceRate" runat="server" MaxLength="10" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        UGI Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtUGIInvoiceRate" runat="server" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td style="padding: 15px;">
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Passcode:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtPasscode" runat="server" MaxLength="4" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        Hourly Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtHourlyRate" runat="server" MaxLength="10" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td style="padding: 15px;">
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Question:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtQuestion" runat="server" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        Extra Measure:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtExtraMesr" runat="server" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td style="padding: 15px;">
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        PPL Z1 & Z2 Invoice Rate:
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txtZ1Z2Rate" runat="server" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                    </td>
                    <td width="20%">
                        Color Picker
                    </td>
                    <td width="25%">
                       <%-- <cc1:ColorPicker ID="ColorPicker1" runat="server"></cc1:ColorPicker> --%>
                        <input id="ColorPickerId" type="text" runat="server"  class="color" onclick="return color();" value="#3a87ad" style="width:100%;" />


                    </td>
                    <td style="padding: 15px;">
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Inspection Rate</td>
                    <td width="25%">
                        <asp:TextBox ID="txtInspectionRate" runat="server" Width="100%" CssClass="text_style"></asp:TextBox>
                    </td>
                    <td width="5%" style="padding: 15px;">
                        &nbsp;</td>
                    <td width="20%">
                        &nbsp;</td>
                    <td width="25%">
                        &nbsp;</td>
                    <td style="padding: 15px;">
                        &nbsp;</td>
                </tr>
            </table>
            <div>
                <asp:Button ID="btn_submit" Text="Update" runat="server" ValidationGroup="G" CssClass="BtnPrintHistory"
                    Style="margin-left: 308px;" OnClick="btn_submit_Click" />
                <asp:Button ID="btn_cancel" Text="Cancel" runat="server" OnClick="btn_cancel_Click"
                    CssClass="BtnPrintHistory" />
                
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
     <script type="text/javascript" src="Scripts/colors.js"></script>
  
    <script type="text/javascript" src="Scripts/colorPicker.data.js"></script>
    <script type="text/javascript" src="Scripts/colorPicker.js"></script>
      <script type="text/javascript" src="Scripts/jqColor.js"></script>
     <script type="text/javascript">
         var $colors = $('input.color').colorPicker({
             customBG: '#222',
             readOnly: true,
             init: function (elm, colors) { // colors is a different instance (not connected to colorPicker)
                
                 if (elm.value != "")
                 {
                     elm.style.backgroundColor = elm.value;
                     
                 } else {
                     elm.style.backgroundColor = "#3a87ad";
                 }
                 elm.style.color = colors.rgbaMixCustom.luminance > 0.22 ? '#222' : '#ddd';
             }
         }).each(function (idx, elm) {
             // $(elm).css({'background-color': this.value})
         });
</script>

    <script type="text/javascript">
        function CurrencyFormat(number) {
            var decimalplaces = 2;
            var decimalcharacter = ".";
            var thousandseparater = "";
            number = parseFloat(number);
            var sign = number < 0 ? "-" : "";
            var formatted = new String(number.toFixed(decimalplaces));
            if (decimalcharacter.length && decimalcharacter != ".") { formatted = formatted.replace(/\./, decimalcharacter); }
            var integer = "";
            var fraction = "";
            var strnumber = new String(formatted);
            var dotpos = decimalcharacter.length ? strnumber.indexOf(decimalcharacter) : -1;
            if (dotpos > -1) {
                if (dotpos) { integer = strnumber.substr(0, dotpos); }
                fraction = strnumber.substr(dotpos + 1);
            }
            else { integer = strnumber; }
            if (integer) { integer = String(Math.abs(integer)); }
            while (fraction.length < decimalplaces) { fraction += "0"; }
            temparray = new Array();
            while (integer.length > 3) {
                temparray.unshift(integer.substr(-3));
                integer = integer.substr(0, integer.length - 3);
            }
            temparray.unshift(integer);
            integer = temparray.join(thousandseparater);
            if (isNaN(integer)) {
                integer = '0';
            }
            return '$ ' + sign + integer + decimalcharacter + fraction;
        }
    </script>

    <script type="text/javascript">
        function Currency_Format(ID) {
            var cost = document.getElementById(ID).value;
            cost = cost.replace('$', '');
            var amt = CurrencyFormat(cost);
            document.getElementById(ID).value = amt;
        }

        

    </script>
   
</asp:Content>
