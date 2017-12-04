<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Invoice_Crystal.aspx.cs"
    Inherits="Invoice_Crystal" ClientTarget="uplevel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="CrystalDecisions.Web" Namespace="CrystalDecisions.Web" Tagprefix="CR" %> 
<%--<%@ Register Assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice</title>
    <link href="css/default.css" rel="stylesheet" type="text/css" />
   
    <style type="text/css">
        .headercol
        {
            top: 56px;
            left: 2px;
            width: 750px;
            height: 263px;
            background: #efefef;
        }
        .view
        {
            width: 1010px;
            margin: 0 auto;
            border: 2px solid burlywood;
            border-radius: 5px;
            padding: 10px;
        }
          .crystalstyle
        {
        top: 29px !important;
          left: 0px !important;
        }
        .crgrptr
        {
        	display:none !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="scrpt" runat="server">
    </asp:ToolkitScriptManager>
    <table width="100%">
        <tr>
            <td align="center">
                <h2 id="EdtDate" runat="server" style="color: Red;">
                    Is "Submitted Date" Correct?
                </h2>
                <%--<a href="PPLAudit/AddOrManageInvoice.aspx?InvoiceNo=<%=Request.QueryString["InvoiceNo"].ToString()%>&Jobs=<%=Request.QueryString["jobs"].ToString()%>&Utility=<%=Request.QueryString["Utility"].ToString()%>"
        class="top_btn">Edit</a>--%>
                <asp:LinkButton ID="lnkEdit" runat="server" class="top_btn" Text="Edit" OnClick="lnkEdit_Click"
                    Style="margin: 3px 0px;"></asp:LinkButton>
                <%--<input type="button" id="btn_back" class="top_btn" value="Back" visible="false" />--%>
                <asp:LinkButton ID="lnkBack" runat="server" class="top_btn" Text="Back" OnClick="lnkBack_Click"
                    Style="margin: 3px 0px;"></asp:LinkButton>
               <%-- <asp:Button ID="btnShow" runat="server" Text="Set Date" class="top_btn" Style="margin: 3px 0px;"
                    OnClick="btnShow_Click" />--%>
                <asp:LinkButton ID="lnkCreateInvoice" runat="server" class="top_btn" Text="Create Invoice"
                    Visible="false" OnClick="lnkCreateInvoice_Click" Style="margin: 3px 0px;"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <div class="view">
        
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
            EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False"
            Height="500" HasCrystalLogo="False" ToolbarStyle-Width="1010px" HasExportButton="False"
            HasToggleGroupTreeButton="False" HasSearchButton="False" HasZoomFactorList="False" />
       <%-- DisplayGroupTree="false" --%>
    </div>
    </form>
</body>
</html>