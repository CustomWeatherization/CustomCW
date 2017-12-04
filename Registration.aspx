<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Registration</title>
<asp:PlaceHolder Runat="server">
    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>

    <script type="text/javascript">

        function Check() {

            var Email = document.getElementById("<%=txt_loginId.ClientID %>").value;
        

            $.ajax({

                type: "Post",
                url: "SearchName.asmx/CheckEmail",
                data: "{'Email' : '" + Email + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(msg) {

                    if (msg.d == "True") {
                        //document.getElementById("<%=txt_loginId.ClientID%>").value = '';

                        alert('Login Id already exist');

                    }


                }

            });
        }
    </script>

    <link href="css/default.css" rel="stylesheet" type="text/css" />
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
            width: 910px;
            float: left;
            background-color: #D0EAFF;
            border-radius: 5px;
            margin: 0px 10px;
            padding: 15px 30px;
        }
    </style>
    </asp:PlaceHolder>
</head>
<body> <form id="Form2" method="post" runat="server">

    <div class="fix_div">
        <div class="header">
            <div class="logo_div">
                <a href="Home.aspx">
                    <img src="images/logo.jpg" /></a></div>
            <div class="header_middiv">
                Registration</div>
        </div>
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" >
        </ajaxToolkit:ToolkitScriptManager>
        <div class="section">
            <div class="back_color">
                <h1>
                    Registration</h1>
                <br />
                <table width="100%" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                        <td width="20%">
                            First Name:
                        </td>
                        <td width="25%">
                            <asp:TextBox ID="txt_Firstname" runat="server" MaxLength="15" CssClass="text_style"
                                Width="100%" onkeyup="MakeUserId()"></asp:TextBox>
                        </td>
                        <td width="5%" style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="req_name" runat="server" ErrorMessage="*" ControlToValidate="txt_Firstname"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="G"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                FilterType="Custom,LowercaseLetters,UppercaseLetters" ValidChars=" " TargetControlID="txt_Firstname">
                            </ajaxToolkit:FilteredTextBoxExtender>
                        </td>
                        <td width="20%">
                            Last Name:
                        </td>
                        <td width="25%">
                            <asp:TextBox ID="txt_lastname" runat="server" MaxLength="15" CssClass="text_style"
                                Width="100%" onkeyup="MakeUserId()"></asp:TextBox>
                        </td>
                        <td style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="req_last" runat="server" ErrorMessage="*" ControlToValidate="txt_lastname"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="G"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                FilterType="Custom,LowercaseLetters,UppercaseLetters" ValidChars=" " TargetControlID="txt_lastname">
                            </ajaxToolkit:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            Phone Number:
                        </td>
                        <td width="25%">
                            <asp:TextBox ID="txt_phone" runat="server" MaxLength="12" CssClass="text_style" Width="100%"
                                onkeyup="mask(event,this);" onkeydown="mask(event,this)"></asp:TextBox>
                        </td>
                        <td width="5%" style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="req_phone" runat="server" ErrorMessage="*" ControlToValidate="txt_phone"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="G"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                FilterType="Numbers,Custom" ValidChars="-" TargetControlID="txt_phone">
                            </ajaxToolkit:FilteredTextBoxExtender>
                        </td>
                        <td width="20%">
                            Address:
                        </td>
                        <td width="25%" style="height: 20px;">
                            <asp:TextBox ID="txtAddress_Mailing" runat="server" TextMode="MultiLine" Width="100%"
                                CssClass="text_style" onkeyup="CheckedChangeAddressOnKeyUP()"></asp:TextBox>
                        </td>
                        <td style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtAddress_Mailing"
                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            City:
                        </td>
                        <td>
                            <asp:TextBox ID="txtCity_Mailing" runat="server" MaxLength="25" Width="100%" CssClass="text_style"
                                onkeyup="CheckedChangeAddressOnKeyUP()"></asp:TextBox>
                        </td>
                        <td width="5%" style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtCity_Mailing"
                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="fltrTxt_City_Mailing" runat="server" FilterType="Custom,LowercaseLetters,UppercaseLetters"
                                ValidChars=" " TargetControlID="txtCity_Mailing">
                            </ajaxToolkit:FilteredTextBoxExtender>
                        </td>
                        <td width="20%">
                            State:
                        </td>
                        <td width="25%">
                            <asp:DropDownList ID="ddl_State_Mailing" runat="server" Width="109%" CssClass="text_style">
                            </asp:DropDownList>
                        </td>
                        <td style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddl_State_Mailing"
                                InitialValue="Select State" Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            Zipcode:
                        </td>
                        <td>
                            <asp:TextBox ID="txtZipCode_Mailing" runat="server" onkeyup="CheckedChangeAddressOnKeyUP()"
                                MaxLength="8" Width="100%" CssClass="text_style"></asp:TextBox>
                        </td>
                        <td width="5%" style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtZipCode_Mailing"
                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                FilterType="Numbers" TargetControlID="txtZipCode_Mailing">
                            </ajaxToolkit:FilteredTextBoxExtender>
                        </td>
                        <td width="20%">
                            County:
                        </td>
                        <td width="25%">
                            <asp:DropDownList ID="ddlCounty" runat="server" Width="109%" CssClass="text_style">
                            </asp:DropDownList>
                        </td>
                        <td style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlCounty"
                                InitialValue="Select County" Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            Email:
                        </td>
                        <td width="25%">
                            <asp:TextBox ID="txt_email" runat="server" MaxLength="60" Width="100%" CssClass="text_style"
                                onchange="cutSt();"></asp:TextBox>
                        </td>
                        <td width="5%" style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="req_email" runat="server" ErrorMessage="*" ControlToValidate="txt_email"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="G"></asp:RequiredFieldValidator>
                        </td>
                        <td width="20%">
                            Login Id
                        </td>
                        <td width="25%">
                            <asp:TextBox ID="txt_loginId" runat="server" MaxLength="30" Width="100%" CssClass="text_style"></asp:TextBox>
                        </td>
                        <td style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="req_login" runat="server" ErrorMessage="*" ControlToValidate="txt_loginId"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="G"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            Password:
                        </td>
                        <td width="25%">
                            <asp:TextBox ID="txt_pwd" runat="server" MaxLength="10" Width="100%" CssClass="text_style"
                                TextMode="Password"></asp:TextBox>
                        </td>
                        <td width="5%" style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="req_pwd" runat="server" ErrorMessage="*" ControlToValidate="txt_pwd"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="G"></asp:RequiredFieldValidator>
                        </td>
                        <td width="20%">
                            Confirm Password
                        </td>
                        <td width="25%">
                            <asp:TextBox ID="txt_confirm" runat="server" MaxLength="10" Width="100%" CssClass="text_style"
                                TextMode="Password"></asp:TextBox>
                        </td>
                        <td style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="req_comp" runat="server" ErrorMessage="*" ControlToValidate="txt_confirm"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="G"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="comp_pwd" ControlToCompare="txt_pwd" runat="server" ControlToValidate="txt_confirm"
                                ErrorMessage="*" ValidationGroup="G" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            Passcode:
                        </td>
                        <td width="25%">
                            <asp:TextBox ID="txtPasscode" runat="server" MaxLength="4" Width="100%" Enabled="false"
                                CssClass="text_style"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="fltr_txtPasscode" runat="server" FilterType="Numbers"
                                TargetControlID="txtPasscode">
                            </ajaxToolkit:FilteredTextBoxExtender>
                        </td>
                        <td width="5%" style="padding: 15px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                ControlToValidate="txtPasscode" ForeColor="Red" Display="Dynamic" ValidationGroup="G"></asp:RequiredFieldValidator>
                        </td>
                        <td width="20%">
                        Birth Day:
                        </td>
                        <td width="25%">
                        <asp:TextBox ID="txtBirthDate" runat="server" Width="100%" CssClass="text_style">   </asp:TextBox>
                           
                        </td>
                        <td style="padding: 15px;">
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                ControlToValidate="txtBirthDate" ForeColor="Red" Display="Dynamic" ValidationGroup="G"></asp:RequiredFieldValidator>
                                 <ajaxToolkit:CalendarExtender ID="txtBirthDate_CalendarExtender" runat="server" BehaviorID="txtBirthDate_CalendarExtender" TargetControlID="txtBirthDate">
                    </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                </table>
                <div>
                    <asp:Button ID="btn_submit" Text="Submit" runat="server" ValidationGroup="G" CssClass="BtnPrintHistory"
                        OnClick="btn_submit_Click" Style="margin-left: 308px;" />
                    <asp:Button ID="btn_cancel" Text="Cancel" runat="server" PostBackUrl="~/Login.aspx"
                        CssClass="BtnPrintHistory" />
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="clear">
    </div>
    <!-- footer -->
    <div class="footer" style="padding-bottom: 40px;">
        Custom Weatherization, LLC © 2013</div>
    <!-- end footer -->

    <script type="text/javascript">

        function mask(e, f) {
            var len = f.value.length;
            var key = whichKey(e);
            if (key == 8) {
                len = len - 1;

            }
            else if (key > 47 && key < 58 || key > 95 && key < 106) {
                if (len == 3) f.value = f.value + '-'
                else if (len == 7)
                    f.value = f.value + '-'
                else f.value = f.value;
            }
            else {
                f.value = f.value.replace(/[^0-9-]/, '')
                f.value = f.value.replace('--', '-')
            }
        }

        function whichKey(e) {
            var code;
            if (!e) var e = window.event;
            if (e.keyCode) code = e.keyCode;
            else if (e.which) code = e.which;
            return code
            // return String.fromCharCode(code);
        }


        function MakeUserId() {
            var Fname = document.getElementById('<%=txt_Firstname.ClientID %>').value;
            var Lname = document.getElementById('<%=txt_lastname.ClientID %>').value;
            var UserId = document.getElementById('<%=txt_loginId.ClientID %>').value;

            if (Fname == '') {
                document.getElementById('<%=txt_loginId.ClientID %>').value = '';
                document.getElementById('<%=txt_lastname.ClientID %>').value = '';
            }
            else {
                var newfirst = Fname.charAt(0);
                var comb = Lname.concat("." + newfirst);
                document.getElementById('<%=txt_loginId.ClientID %>').value = comb;
            }
        }
    
    </script>

    </form>
</body>
</html>
