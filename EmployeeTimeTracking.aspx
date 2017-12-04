<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeTimeTracking.aspx.cs"
    Inherits="EmployeeTimeTracking" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Time Track</title>
    <meta http-equiv="REFRESH" content="300" />
    <link href="css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .InputBox {
            border: 1px solid #c7c7c7;
            background-color: #fff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #686868;
            border-radius: 5px;
            padding: 13px 10px;
            width: 153px;
            margin: 0 0 22px 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        .disable {
            width: 100px !important;
            background-color: #8CA5BA !important;
            box-shadow: none;
            color: #D7D7D7 !important;
            text-shadow: none !important;
            cursor: default !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scrpt" runat="server">
        </asp:ScriptManager>
        <div class="fix_div">
            <!-- login box -->
            <div class="login_div">
                <h1 class="logotext">
                    <a href="Login.aspx" id="imgLogo" runat="server">
                        <img src="images/logo.jpg" /></a></h1>
                <div class="login_box">
                    <div class="login_form">
                        <h2>Custom Weatherization
                        <br />
                            Time Tracking</h2>
                        <%--<label>
                        User Login</label>
                    <%--<input name="" type="text" />
                    <asp:TextBox ID="txtUserLogin" runat="server" MaxLength="20" class="InputBox"></asp:TextBox>
                    <div class="clear">
                    </div>
                        --%>
                        <div>
                            <asp:UpdatePanel runat="server" ID="updatePanel1">
                                <ContentTemplate>
                                    <h2 class="pull-right">
                                        <asp:Label ID="lblTime" runat="server"></asp:Label>
                                        <asp:Timer ID="Timer1" Interval="500" runat="server" OnTick="Timer1_Tick"></asp:Timer>
                                    </h2>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <label>
                            Passcode</label>
                        <%--<input name="" type="text" />--%>
                        <asp:TextBox ID="txtPasscode" runat="server" MaxLength="4" TextMode="Password" class="InputBox"
                            Style="width: 216px;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtPasscode" runat="server" ErrorMessage="*" ControlToValidate="txtPasscode" ValidationGroup="a"></asp:RequiredFieldValidator>
                        <%--<asp:Button
                            ID="btnOk" runat="server" Text="OK" class="btn_all" Style="width: 40px; border-top-left-radius: 0px;
                            border-bottom-left-radius: 0px; float: left; margin-top: 0px; text-align: center;
                            padding: 0px; height: 44px;" OnClick="btnOk_OnClick" />--%>
                        <div class="clear">
                        </div>
                        <label>
                        </label>
                      <%--  <table><tr><td style="width: 50%;">
                        <%-- <input name="" type="button" value="Submit" />
                        <asp:Button ID="btnPunchIn" runat="server" Text="Clock-In" ValidationGroup="a" OnClick="btnOk_OnClick" /></td>
                       <td style="width: 50%;"> <asp:Button ID="btnPunchOut" runat="server" Text="Clock-Out" ValidationGroup="a" OnClick="btnPunchOut_OnClick" style="float:right;margin-right:18%;"/>
                       </td></tr></table>--%>
                       
                       
                        <asp:Button ID="btnPunchIn" runat="server" Text="Clock-In" ValidationGroup="a" OnClick="btnOk_OnClick" />
                       <asp:Button ID="btnPunchOut" runat="server" Text="Clock-Out" ValidationGroup="a" OnClick="btnPunchOut_OnClick" />
                      
                       
                        <h4 >In Time:
                        <asp:Label ID="lblPunchInTime" runat="server"></asp:Label></h4>
                        <h4 style="float: right; margin-top: -40px; margin-right: 4px;">Out Time:
                        <asp:Label ID="lblPunchOutTime" runat="server"></asp:Label></h4>
                        <%--OnClick="btnStart_Click"      OnClick="btnEnd_Click"            <div>
                        <a href="Registration.aspx" style="width: 122px; color: #686868; font-size: 16px;
                            float: left; margin: -3px 91px 0px;">New Registration</a> <a href="#" style="width: 122px;
                                color: #686868; font-size: 16px; float: left; margin: -3px 91px 0px;">Star Tracking
                                !!</a>       JWC0R5
                    </div>--%>
                        <h2>
                            <asp:Label ID="lblError" runat="server"></asp:Label></h2>
                    </div>
                </div>
            </div>
            <!-- end login box -->
            <!-- footer -->
            <div class="footer">
                Custom Weatherization, LLC © 2013
            </div>
            <!-- end footer -->
        </div>
        <script type="text/javascript">
            function HideLabel() {
                var seconds = 10;
                setTimeout(function () {
                    window.location = 'EmployeeTimeTracking.aspx?Flag=Home';
                }, seconds * 1000);
            };
        </script>
    </form>
</body>
</html>
