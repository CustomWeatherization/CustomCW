<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Welcome to Cweather</title>
    <link href="css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .InputBox
        {
            border: 1px solid #c7c7c7;
            background-color: #fff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #686868;
            border-radius: 5px;
            padding: 13px 10px;
            width: 253px;
            margin: 0 0 22px 0;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="fix_div">
        <!-- login box -->
        <div class="login_div">
            <h1 class="logotext">
                <a href="#">
                    <img src="images/logo.jpg" /></a></h1>
            <div class="login_box">
                <div class="login_form">
                    <h2>
                        Custom Weatherization Login</h2>
                    <label>
                        User Login</label>
                    <%--<input name="" type="text" />--%>
                    <asp:TextBox ID="txtUserLogin" runat="server" MaxLength="20" class="InputBox"></asp:TextBox>
                    <div class="clear">
                    </div>
                    <label>
                        Password</label>
                    <%--<input name="" type="text" />--%>
                    <asp:TextBox ID="txtPassword" runat="server" MaxLength="20" TextMode="Password" class="InputBox"></asp:TextBox>
                    <div class="clear">
                    </div>
                    <label>
                    </label>
                    <%-- <input name="" type="button" value="Submit" />--%>
                    <asp:Button ID="btnLogin" runat="server" Text="Submit" class="btn_all" OnClick="btnLogin_Click" />
                    <div>
                        <a href="Registration.aspx" style="width: 122px; color: #686868; font-size: 16px;
                            float: left; margin: -3px 91px 0px;">New Registration</a>
                    </div>
                    <div style="position: absolute; float: left; margin-left: 333px; margin-top: -55px;" runat="server" id="punchclock">
                        <a href="EmployeeTimeTracking.aspx">
                            <img src="images/3d-man-stopwatch-concept-17230689.jpg" style="width: 50px; height: 50px;" />
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- end login box -->
        <!-- footer -->
        <div class="footer">
            Custom Weatherization, LLC © 2013</div>
        <!-- end footer -->
    </div>
    </form>
</body>
</html>
