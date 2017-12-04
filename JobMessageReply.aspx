<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobMessageReply.aspx.cs"
    Inherits="JobMessageReply" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reply Mail</title>
    <style type="text/css">
        .btn_all
        {
            background-color: #3570a0;
            border-radius: 5px;
            border: 0;
            cursor: pointer;
            box-shadow: inset 0 0 5px #005396;
            font-size: 16px;
            color: #FFF;
            font-weight: bold;
            text-shadow: 1px 1px 0 #000;
            font-family: Arial, Helvetica, sans-serif;
            margin: 5px 0;
            font-family: Arial, Helvetica, sans-serif;
            width: 185px;
            padding: 8px 0;
            padding: 10px 0\9;
        }
        .btn_all:hover
        {
            background-color: #3570a0;
            box-shadow: 0 0 10px #61b8ff;
        }
        .jobstatus select
        {
            border: 1px solid #ccc;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #717171;
            border-radius: 5px;
            padding: 8px;
            margin: 0;
        }
        .clear
        {
            clear: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <!-- form section -->
        <div class="jobstatus" align="center">
            <h1>
                <%if (Request.QueryString["View"] == "ViewAll")
                  {%>
                Reply to all
                <%}
                  else
                  {%>
                Reply
                <%}%>
            </h1>
            <p>
                <asp:Label ID="lblOldMessage" runat="server"></asp:Label>
            </p>
            <table>
                <tr>
                    <td>
                        To:
                    </td>
                    <td id="tdCC" runat="server" visible="false">
                        Cc:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ListBox ID="lstEmployeeForSendSaveComments" runat="server" SelectionMode="Multiple">
                        </asp:ListBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="lstEmployeeForSendSaveComments"
                            Display="Dynamic" ErrorMessage="*" ValidationGroup="CmntandSave"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;
                        <asp:ListBox ID="lstEmployeeForSendSaveCommentsCC" runat="server" Visible="false"
                            SelectionMode="Multiple"></asp:ListBox>
                        <asp:HiddenField ID="hdnFrom" runat="server" />
                        <asp:HiddenField ID="hdnTo" runat="server" />
                        <asp:HiddenField ID="hdnCC" runat="server" />
                        <asp:HiddenField ID="hdnAllId" runat="server" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <p>
                Reply to the Message Below:</p>
            <asp:TextBox ID="txtReplyText" runat="server" Rows="10" Columns="70" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFtxtReplyText" runat="server" ControlToValidate="txtReplyText"
                Display="Dynamic" ErrorMessage="*" ValidationGroup="CmntandSave"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Font-Bold="true" Visible="false"></asp:Label>
        </div>
        <div class="clear">
        </div>
        <div style="text-align: center;">
            <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" ValidationGroup="CmntandSave"
                class="btn_all" OnClick="btnSendMessage_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="javascript: window.close();"
                class="btn_all" />
        </div>
        <!-- end form section -->
    </div>
    </form>
</body>
</html>
