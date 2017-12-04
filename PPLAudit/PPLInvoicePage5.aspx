<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PPLInvoicePage5.aspx.cs"
    Inherits="PPLAudit_PPLInvoicePage5" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PPL Invoice Page5</title>

    <script type="text/javascript" src="../Js/ajaxtooltip.js"></script>

    <script type="text/javascript" src="../Js/jquery-1.2.2.pack.js"></script>

    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        h2
        {
            font-size: 20px;
            padding-left: 20px;
        }
        table
        {
            border: 0;
        }
        p span
        {
            font-size: 18px;
            color: #000000;
            text-decoration: underline;
        }
        table tr td span
        {
            font-size: 11px;
            color: #000000;
        }
        .txt_name
        {
            border: none;
            border-bottom: solid 1px rgb(219, 219, 219);
            font-weight: normal;
            color: rgb(153, 153, 153);
            width: 100%;
        }
        .txt_name
        {
            border-bottom: none;
        }
        .txt_Contractor
        {
            border: none;
            width: 100%;
        }
    </style>
    <style type="text/css">
        .ajaxtooltip
        {
            position: absolute; /*leave this alone*/
            display: none; /*leave this alone*/
            width: 300px;
            left: 0; /*leave this alone*/
            top: 0; /*leave this alone*/
            background: lightyellow;
            border: 2px solid gray;
            border-width: 1px 2px 2px 1px;
            padding: 5px;
        }
    </style>
    <style type="text/css">
        .inv_table th, td
        {
            font-size: 12px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <div class="fix_div">
        <%--font-weight: bold;
    text-decoration: underline;--%>
        <!-- header -->
        <div class="header">
            <div class="logo_div">
                <a href="../Home.aspx">
                    <img src="../images/logo.jpg" /></a></div>
            <div class="header_middiv">
            </div>
            <div class="head_right">
                <div class="top_icons">
                    <ul>
                        <li><a href="../Home.aspx" title="Home" class="home"></a></li>
                        <li>
                            <asp:LinkButton ID="LnkAudit" runat="server" title="Audit" CssClass="audit" OnClick="LnkAudit_Click"></asp:LinkButton></li>
                    </ul>
                </div>
            </div>
            <div class="head_link">
                <a href="../Admin/Admin_Login.aspx">Administer Database</a> |
                <asp:LinkButton ID="lnkLogin" runat="server" Text="Logout" OnClick="lnkLogin_Click"></asp:LinkButton></div>
        </div>
        <!-- end header -->
        <div class="clear">
        </div>
        <!-- form section -->
        <div class="searchbynumber">
            <div class="main">
                <!-- inv_table begin -->
                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr>
                        <td>
                            Job Number: <span id="JobNumber" runat="server"></span>
                        </td>
                        <td align="center">
                            Customer Name:
                            <%= StrUserName %>
                        </td>
                        <td align="right">
                            CUSTOM WEATHERIZATION, LLC
                        </td>
                    </tr>
                </table>
                <!--  HEADER Section End   -->
                <div class="right_text" runat="server">
                    Go to page <a href="PPL_Invoice_Page1.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                        1</a> <a href="PPL_Invoice_Page2.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                            2</a> <a href="PPL_Invoice_Page3.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                3</a> <a href="PPL_Invoice_Page4.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                    4</a> <a href="PPLInvoicePage5.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>"
                                        class="active">5</a>
                </div>
                <div class="top_text" runat="server">
                    <span class="txt_orng" id="spann_final" runat="server">**** FINALIZED PPL Invoice *****</span>
                    <span class="txt_orng" style="display: none;">Job Number: <span id="JobNumber2" runat="server">
                    </span>Page # 5</span>
                </div>
                <div class="top_invoicelinks" runat="server">
                    <asp:HiddenField ID="hdn_Finalize" runat="server" />
                    <asp:Button ID="btn_SaveCurrentPg" runat="server" Text="Save" class="top_btn" Visible="true"
                        OnClick="btn_SaveCurrentPg_Click" />
                    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" class="top_btn" OnClick="btn_Cancel_Click" />
                    <asp:Button ID="btn_FinalizeInvoice" runat="server" Text="Finalize" class="top_btn"
                        Visible="true" OnClick="btn_FinalizeInvoice_Click" />
                    <asp:Button ID="btn_PrintInvoice" runat="server" Text="Print" class="top_btn" OnClick="btn_PrintInvoice_Click" />
                </div>
                <asp:Panel ID="panelReadOnly" runat="server">
                    <div class="inv_table">
                        <table width="100%" border="1" cellspacing="0" cellpadding="5">
                            <tr>
                                <th width="120">
                                    Location
                                </th>
                                <th width="80">
                                    Category
                                </th>
                                <th>
                                    LIURP
                                    <br />
                                    Code
                                </th>
                                <th width="350">
                                    MEASURE DESCRIPTION
                                </th>
                                <th>
                                    S/C
                                </th>
                                <th width="50">
                                    Unit
                                </th>
                                <th>
                                    Labor Rate
                                </th>
                                <th>
                                    THW
                                </th>
                                <th>
                                    TMC
                                </th>
                                <th>
                                    Cost Per Unit
                                </th>
                                <th>
                                    QTY<br />
                                    (all req)
                                </th>
                                <th width="50">
                                    TOTAL
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line1_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                    <strong>WATER HEATING</strong>
                                </td>
                                <td align="center">
                                    5
                                </td>
                                <td>
                                    Water - Pipe Insulation 1 1/4"
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Lin.Ft.
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    2.36
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line1_Qty" runat="server" class="txt_val" onblur="CalculateLine1(this.id)"
                                        onkeyup="CalculateLine1(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line1_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line1_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line2_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    5
                                </td>
                                <td>
                                    Water - Pipe Insulation 1/2"
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Lin.Ft.
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    1.50
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line2_Qty" runat="server" class="txt_val" onblur="CalculateLine2(this.id)"
                                        onkeyup="CalculateLine2(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line2_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line2_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line3_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    5
                                </td>
                                <td>
                                    Water - Pipe Insulation 2"
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Lin.Ft.
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    2.83
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line3_Qty" runat="server" class="txt_val" onblur="CalculateLine3(this.id)"
                                        onkeyup="CalculateLine3(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line3_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line3_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line4_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    5
                                </td>
                                <td>
                                    Water - Pipe Insulation 3/4"
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Lin.Ft.
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    1.61
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line4_Qty" runat="server" class="txt_val" onblur="CalculateLine4(this.id)"
                                        onkeyup="CalculateLine4(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line4_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line4_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line5_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    8
                                </td>
                                <td>
                                    Water Element Test
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Each
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    5.50
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line5_Qty" runat="server" class="txt_val" onblur="CalculateLine5(this.id)"
                                        onkeyup="CalculateLine5(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line5_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line5_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line6_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    8
                                </td>
                                <td>
                                    Water Heater Element Replace
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Each
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    58.57
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line6_Qty" runat="server" class="txt_val" onblur="CalculateLine6(this.id)"
                                        onkeyup="CalculateLine6(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line6_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line6_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line7_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    9
                                </td>
                                <td>
                                    Water Heater Replace - 30 Gallon
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Each
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    591.60
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line7_Qty" runat="server" class="txt_val" onblur="CalculateLine7(this.id)"
                                        onkeyup="CalculateLine7(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line7_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line7_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line8_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    9
                                </td>
                                <td>
                                    Water Heater Replace - 40 Gallon
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Each
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    592.40
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line8_Qty" runat="server" class="txt_val" onblur="CalculateLine8(this.id)"
                                        onkeyup="CalculateLine8(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line8_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line8_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line9_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    9
                                </td>
                                <td>
                                    Water Heater Replace - 50 Gallon
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Each
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    581.60
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line9_Qty" runat="server" class="txt_val" onblur="CalculateLine9(this.id)"
                                        onkeyup="CalculateLine9(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line9_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line9_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line10_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    6
                                </td>
                                <td>
                                    Water Heater Temp Set Back
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Each
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    5.29
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line10_Qty" runat="server" class="txt_val" onblur="CalculateLine10(this.id)"
                                        onkeyup="CalculateLine10(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line10_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line10_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line11_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    SW
                                </td>
                                <td>
                                    Solar Water Heating Two Collector Standard - LABOR ONLY
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Each
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    2592.04
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line11_Qty" runat="server" class="txt_val" onblur="CalculateLine11(this.id)"
                                        onkeyup="CalculateLine11(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line11_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line11_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line12_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line12_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line12_LIURP" runat="server" class="txt_val" onblur="CalculateLine12Code()"
                                        Style="text-align: center;" onkeyup="CalculateLine12Code()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line12_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line12_SC" runat="server" class="small_field" onblur="CalculateLine12SC()"
                                        Style="text-align: center;" onkeyup="CalculateLine12SC()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line12_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line12_LaborRate" runat="server" class="txt_val" Text="43/68"
                                        Style="text-align: center;" onblur="CalculateLine12LaborRate()" onkeyup="CalculateLine12LaborRate()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line12_THW" runat="server" class="txt_thw" onblur="CalculateLine12THW()"
                                        onkeyup="CalculateLine12THW()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line12_TMC" runat="server" class="txt_thw" onblur="CalculateLine12TMC()"
                                        onkeyup="CalculateLine12TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line12_Qty" runat="server" class="txt_val" onblur="CalculateLine12()"
                                        onkeyup="CalculateLine12()"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line12_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line12_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line13_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line13_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line13_LIURP" runat="server" class="txt_val" onblur="CalculateLine13Code()"
                                        Style="text-align: center;" onkeyup="CalculateLine13Code()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line13_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line13_SC" runat="server" class="small_field" onblur="CalculateLine13SC()"
                                        Style="text-align: center;" onkeyup="CalculateLine13SC()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line13_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line13_LaborRate" runat="server" class="txt_val" Text="43/68"
                                        Style="text-align: center;" onblur="CalculateLine13LaborRate()" onkeyup="CalculateLine13LaborRate()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line13_THW" runat="server" class="txt_thw" onblur="CalculateLine13THW()"
                                        onkeyup="CalculateLine13THW()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line13_TMC" runat="server" class="txt_thw" onblur="CalculateLine13TMC()"
                                        onkeyup="CalculateLine13TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line13_Qty" runat="server" class="txt_val" onblur="CalculateLine13()"
                                        onkeyup="CalculateLine13()"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line13_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line13_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line14_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                    <strong>WINDOWS</strong>
                                </td>
                                <td align="center">
                                    31
                                </td>
                                <td>
                                    Window - Reglaze Only
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Each
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    27.86
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line14_Qty" runat="server" class="txt_val" onblur="CalculateLine14(this.id)"
                                        onkeyup="CalculateLine14(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line14_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line14_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line15_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    W2
                                </td>
                                <td>
                                    Window Film
                                </td>
                                <td align="center">
                                    S
                                </td>
                                <td align="center">
                                    Each
                                </td>
                                <td align="center">
                                    43
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    3.17
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line15_Qty" runat="server" class="txt_val" onblur="CalculateLine15(this.id)"
                                        onkeyup="CalculateLine15(this.id)"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line15_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line15_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line16_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line16_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line16_LIURP" runat="server" class="txt_val" onblur="CalculateLine16Code()"
                                        Style="text-align: center;" onkeyup="CalculateLine16Code()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line16_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line16_SC" runat="server" class="small_field" onblur="CalculateLine16SC()"
                                        Style="text-align: center;" onkeyup="CalculateLine16SC()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line16_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line16_LaborRate" runat="server" class="txt_val" Text="43/68"
                                        Style="text-align: center;" onblur="CalculateLine16LaborRate()" onkeyup="CalculateLine16LaborRate()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line16_THW" runat="server" class="txt_thw" onblur="CalculateLine16THW()"
                                        onkeyup="CalculateLine16THW()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line16_TMC" runat="server" class="txt_thw" onblur="CalculateLine16TMC()"
                                        onkeyup="CalculateLine16TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line16_Qty" runat="server" class="txt_val" onblur="CalculateLine16()"
                                        onkeyup="CalculateLine16()"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line16_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line16_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="12" align="center">
                                    <strong>Use the space below for custom items with other categories, see listing. You
                                        may use this space also if there is not enough room under the categories above.</strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line17_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line17_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line17_LIURP" runat="server" class="txt_val" onblur="CalculateLine17Code()"
                                        Style="text-align: center;" onkeyup="CalculateLine17Code()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line17_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line17_SC" runat="server" class="small_field" onblur="CalculateLine17SC()"
                                        Style="text-align: center;" onkeyup="CalculateLine17SC()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line17_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line17_LaborRate" runat="server" class="txt_val" Text="43/68"
                                        Style="text-align: center;" onblur="CalculateLine17LaborRate()" onkeyup="CalculateLine17LaborRate()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line17_THW" runat="server" class="txt_thw" onblur="CalculateLine17THW()"
                                        onkeyup="CalculateLine17THW()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line17_TMC" runat="server" class="txt_thw" onblur="CalculateLine17TMC()"
                                        onkeyup="CalculateLine17TMC()"></asp:TextBox>
                                </td>
                                <td align="right" bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line17_Qty" runat="server" class="txt_val" onblur="CalculateLine17()"
                                        onkeyup="CalculateLine17()"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line17_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line17_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line18_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line18_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line18_LIURP" runat="server" class="txt_val" onblur="CalculateLine18Code()"
                                        Style="text-align: center;" onkeyup="CalculateLine18Code()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line18_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line18_SC" runat="server" class="new_field" onblur="CalculateLine18SC()"
                                        Style="text-align: center;" onkeyup="CalculateLine18SC()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line18_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line18_LaborRate" runat="server" class="txt_val" Text="43/68"
                                        Style="text-align: center;" onblur="CalculateLine18LaborRate()" onkeyup="CalculateLine18LaborRate()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line18_THW" runat="server" class="txt_thw" onblur="CalculateLine18THW()"
                                        onkeyup="CalculateLine18THW()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line18_TMC" runat="server" class="txt_thw" onblur="CalculateLine18TMC()"
                                        onkeyup="CalculateLine18TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line18_Qty" runat="server" class="txt_val" onblur="CalculateLine18()"
                                        onkeyup="CalculateLine18()"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line18_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line18_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line19_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line19_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line19_LIURP" runat="server" class="txt_val" onblur="CalculateLine19Code()"
                                        Style="text-align: center;" onkeyup="CalculateLine19Code()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line19_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line19_SC" runat="server" class="small_field" onblur="CalculateLine19SC()"
                                        Style="text-align: center;" onkeyup="CalculateLine19SC()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line19_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line19_LaborRate" runat="server" class="txt_val" Text="43/68"
                                        Style="text-align: center;" onblur="CalculateLine19LaborRate()" onkeyup="CalculateLine19LaborRate()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line19_THW" runat="server" class="txt_thw" onblur="CalculateLine19THW()"
                                        onkeyup="CalculateLine19THW()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line19_TMC" runat="server" class="txt_thw" onblur="CalculateLine19TMC()"
                                        onkeyup="CalculateLine19TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line19_Qty" runat="server" class="txt_val" onblur="CalculateLine19()"
                                        onkeyup="CalculateLine19()"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line19_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line19_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line20_Location" runat="server" class="txt_hour"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line20_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line20_LIURP" runat="server" class="txt_val" onblur="CalculateLine20Code()"
                                        Style="text-align: center;" onkeyup="CalculateLine20Code()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line20_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line20_SC" runat="server" class="small_field" onblur="CalculateLine20SC()"
                                        Style="text-align: center;" onkeyup="CalculateLine20SC()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line20_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line20_LaborRate" runat="server" class="txt_val" Text="43/68"
                                        Style="text-align: center;" onblur="CalculateLine20LaborRate()" onkeyup="CalculateLine20LaborRate()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line20_THW" runat="server" class="txt_thw" onblur="CalculateLine20THW()"
                                        onkeyup="CalculateLine20THW()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line20_TMC" runat="server" class="txt_thw" onblur="CalculateLine20TMC()"
                                        onkeyup="CalculateLine20TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_Line20_Qty" runat="server" class="txt_val" onblur="CalculateLine20()"
                                        onkeyup="CalculateLine20()"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="txt_Line20_Total" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdn_Line20_Total" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="9">
                                    Page1=<asp:TextBox ID="txt_TotalPage1" runat="server" class="txt_mob" value="$151.95"
                                        onblur="CalculateGrandTotal()" onkeyup="CalculateGrandTotal()"></asp:TextBox>Page2=<asp:TextBox
                                            ID="txt_TotalPage2" runat="server" class="txt_mob" value="$1,214.95" onblur="CalculateGrandTotal()"
                                            onkeyup="CalculateGrandTotal()"></asp:TextBox>Page3=<asp:TextBox ID="txt_TotalPage3"
                                                runat="server" class="txt_mob" value="$59.91" onblur="CalculateGrandTotal()"
                                                onkeyup="CalculateGrandTotal()"></asp:TextBox>Page4=<asp:TextBox ID="txt_TotalPage4"
                                                    runat="server" class="txt_mob" value="$38.62" onblur="CalculateGrandTotal()"
                                                    onkeyup="CalculateGrandTotal()"></asp:TextBox>Page5=<asp:TextBox ID="txt_TotalPage5"
                                                        runat="server" class="txt_mob" value="$136.00" onblur="CalculateGrandTotal()"
                                                        onkeyup="CalculateGrandTotal()"></asp:TextBox>(Page 5 and Invoice
                                    total not current until SAVE)
                                </td>
                                <td colspan="2">
                                    <strong>INVOICE TOTAL:</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_GrandTotal" runat="server" class="new_field" Font-Bold="true"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <h3>
                            Specialty Contractors Needed for this Job</h3>
                        <table width="100%" border="1" cellspacing="0" cellpadding="5">
                            <tr>
                                <td>
                                    <strong>Type of Contractors</strong>
                                </td>
                                <td>
                                    <strong>Name of Contractor</strong>
                                </td>
                                <td>
                                    <strong>Call Date</strong>
                                </td>
                                <th>
                                    Brief Description of Work to be Completed
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine1Type" runat="server" value="Electrical" class="txt_Contractor"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine1Name" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine1CallDate" runat="server" class="txt_mob"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine1Comments" runat="server" class="new_field" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine2Type" runat="server" value="Plumbing" class="txt_Contractor"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine2Name" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine2CallDate" runat="server" class="txt_mob"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine2Comments" runat="server" class="new_field" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine3Type" runat="server" value="Furnace/Heat Pump"
                                        class="txt_Contractor"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine3Name" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine3CallDate" runat="server" class="txt_mob"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine3Comments" runat="server" class="new_field" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine4Type" runat="server" value="" class="txt_Contractor"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine4Name" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine4CallDate" runat="server" class="txt_mob"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ContractorLine4Comments" runat="server" class="new_field" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Date Invoice Submitted
                                    <asp:TextBox ID="txt_DateInvoiceSubmitted" runat="server" class="txt_Deg"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="Calander" runat="server" TargetControlID="txt_DateInvoiceSubmitted"
                                        OnClientDateSelectionChanged="checkDate">
                                    </ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server"
                                        TargetControlID="txt_DateInvoiceSubmitted" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                    I hearby attest that all of the work invoiced was completed on the date stated on
                                    the invoice.
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Date Work Completed
                                    <asp:TextBox ID="txt_DateWorkCompleted" runat="server" class="txt_Deg" ReadOnly="true"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_DateWorkCompleted"
                                        OnClientDateSelectionChanged="checkDate">
                                    </ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                        TargetControlID="txt_DateWorkCompleted" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                    Signature of Contractor:
                                    <asp:TextBox ID="txt_SignatureofContractor" runat="server" class="txt_ver"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
                <!-- inv_table end -->
            </div>
        </div>
    </div>
    </form>

    <script type="text/javascript">

        //------------------------------------------------

        function CalculateGrandTotal() {
            var TotalPage1 = document.getElementById('<%=txt_TotalPage1.ClientID %>').value;
            var TotalPage2 = document.getElementById('<%=txt_TotalPage2.ClientID %>').value;
            var TotalPage3 = document.getElementById('<%=txt_TotalPage3.ClientID %>').value;
            var TotalPage4 = document.getElementById('<%=txt_TotalPage4.ClientID %>').value;
            var TotalPage5 = document.getElementById('<%=txt_TotalPage5.ClientID %>').value;
            TotalPage1 = TotalPage1.replace('$', '');
            TotalPage2 = TotalPage2.replace('$', '');
            TotalPage3 = TotalPage3.replace('$', '');
            TotalPage4 = TotalPage4.replace('$', '');
            TotalPage5 = TotalPage5.replace('$', '');

            if (isNaN(TotalPage1) || TotalPage1 == '') {
                TotalPage1 = 0;
            }
            if (isNaN(TotalPage2) || TotalPage2 == '') {
                TotalPage2 = 0;
            }
            if (isNaN(TotalPage3) || TotalPage3 == '') {
                TotalPage3 = 0;
            }
            if (isNaN(TotalPage4) || TotalPage4 == '') {
                TotalPage4 = 0;
            }
            if (isNaN(TotalPage5) || TotalPage5 == '') {
                TotalPage5 = 0;
            }

            var GrandTotal = parseInt(TotalPage1) + parseInt(TotalPage2) + parseInt(TotalPage3) + parseInt(TotalPage4) + parseInt(TotalPage5);
            document.getElementById('<%=txt_GrandTotal.ClientID %>').value = '$' + GrandTotal;
        }

        //------------------------------------------------
        function CalculateLine1(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            var Qty = document.getElementById(ID).value;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var CostUnit = 2.36;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line1_Total = document.getElementById('<%=txt_Line1_Total.ClientID %>');
                Line1_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line1_Total.innerHTML);
                num = num.toFixed(2);
                Line1_Total.innerHTML = num;
                Line1_Total.innerHTML = "$" + Line1_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line1_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line1_Total.innerHTML);
                    num = num.toFixed(2);
                    Line1_Total.innerHTML = num;
                    Line1_Total.innerHTML = "$" + Line1_Total.innerHTML;
                    document.getElementById('<%=hdn_Line1_Total.ClientID %>').value = Line1_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line1_Total.ClientID %>').value = Line1_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine2(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            var Qty = document.getElementById(ID).value;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var CostUnit = 1.50;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line2_Total = document.getElementById('<%=txt_Line2_Total.ClientID %>');
                Line2_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line2_Total.innerHTML);
                num = num.toFixed(2);
                Line2_Total.innerHTML = num;
                Line2_Total.innerHTML = "$" + Line2_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line2_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line2_Total.innerHTML);
                    num = num.toFixed(2);
                    Line2_Total.innerHTML = num;
                    Line2_Total.innerHTML = "$" + Line2_Total.innerHTML;
                    document.getElementById('<%=hdn_Line2_Total.ClientID %>').value = Line2_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line2_Total.ClientID %>').value = Line2_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine3(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 2.83;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line3_Total = document.getElementById('<%=txt_Line3_Total.ClientID %>');
                Line3_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line3_Total.innerHTML);
                num = num.toFixed(2);
                Line3_Total.innerHTML = num;
                Line3_Total.innerHTML = "$" + Line3_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line3_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line3_Total.innerHTML);
                    num = num.toFixed(2);
                    Line3_Total.innerHTML = num;
                    Line3_Total.innerHTML = "$" + Line3_Total.innerHTML;
                    document.getElementById('<%=hdn_Line3_Total.ClientID %>').value = Line3_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line3_Total.ClientID %>').value = Line3_Total.innerHTML;
            }
        }


        //------------------------------------------------
        function CalculateLine4(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 1.61;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line4_Total = document.getElementById('<%= txt_Line4_Total.ClientID %>');
                Line4_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line4_Total.innerHTML);
                num = num.toFixed(2);
                Line4_Total.innerHTML = num;
                Line4_Total.innerHTML = "$" + Line4_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line4_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line4_Total.innerHTML);
                    num = num.toFixed(2);
                    Line4_Total.innerHTML = num;
                    Line4_Total.innerHTML = "$" + Line4_Total.innerHTML;
                    document.getElementById('<%=hdn_Line4_Total.ClientID %>').value = Line4_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line4_Total.ClientID %>').value = Line4_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine5(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 5.50;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line5_Total = document.getElementById('<%=txt_Line5_Total.ClientID %>');
                Line5_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line5_Total.innerHTML);
                num = num.toFixed(2);
                Line5_Total.innerHTML = num;
                Line5_Total.innerHTML = "$" + Line5_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line5_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line5_Total.innerHTML);
                    num = num.toFixed(2);
                    Line5_Total.innerHTML = num;
                    Line5_Total.innerHTML = "$" + Line5_Total.innerHTML;
                    document.getElementById('<%=hdn_Line5_Total.ClientID %>').value = Line5_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line5_Total.ClientID %>').value = Line5_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine6(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {

                var Qty = document.getElementById(ID).value;
                var CostUnit = 58.57;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line6_Total = document.getElementById('<%=txt_Line6_Total.ClientID %>');
                Line6_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line6_Total.innerHTML);
                num = num.toFixed(2);
                Line6_Total.innerHTML = num;
                Line6_Total.innerHTML = "$" + Line6_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line6_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line6_Total.innerHTML);
                    num = num.toFixed(2);
                    Line6_Total.innerHTML = num;
                    Line6_Total.innerHTML = "$" + Line6_Total.innerHTML;
                    document.getElementById('<%=hdn_Line6_Total.ClientID %>').value = Line6_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line6_Total.ClientID %>').value = Line6_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine7(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 591.60;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line7_Total = document.getElementById('<%=txt_Line7_Total.ClientID %>');
                Line7_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line7_Total.innerHTML);
                num = num.toFixed(2);
                Line7_Total.innerHTML = num;
                Line7_Total.innerHTML = "$" + Line7_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line7_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line7_Total.innerHTML);
                    num = num.toFixed(2);
                    Line7_Total.innerHTML = num;
                    Line7_Total.innerHTML = "$" + Line7_Total.innerHTML;
                    document.getElementById('<%=hdn_Line7_Total.ClientID %>').value = Line7_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line7_Total.ClientID %>').value = Line7_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine8(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 592.40;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line8_Total = document.getElementById('<%=txt_Line8_Total.ClientID %>');
                Line8_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line8_Total.innerHTML);
                num = num.toFixed(2);
                Line8_Total.innerHTML = num;
                Line8_Total.innerHTML = "$" + Line8_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line8_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line8_Total.innerHTML);
                    num = num.toFixed(2);
                    Line8_Total.innerHTML = num;
                    Line8_Total.innerHTML = "$" + Line8_Total.innerHTML;
                    document.getElementById('<%=hdn_Line8_Total.ClientID %>').value = Line8_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line8_Total.ClientID %>').value = Line8_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine9(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 581.60;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line9_Total = document.getElementById('<%=txt_Line9_Total.ClientID %>');
                Line9_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line9_Total.innerHTML);
                num = num.toFixed(2);
                Line9_Total.innerHTML = num;
                Line9_Total.innerHTML = "$" + Line9_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line9_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line9_Total.innerHTML);
                    num = num.toFixed(2);
                    Line9_Total.innerHTML = num;
                    Line9_Total.innerHTML = "$" + Line9_Total.innerHTML;
                    document.getElementById('<%=hdn_Line9_Total.ClientID %>').value = Line9_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line9_Total.ClientID %>').value = Line9_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine10(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 5.29;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line10_Total = document.getElementById('<%=txt_Line10_Total.ClientID %>');
                Line10_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line10_Total.innerHTML);
                num = num.toFixed(2);
                Line10_Total.innerHTML = num;
                Line10_Total.innerHTML = "$" + Line10_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line10_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line10_Total.innerHTML);
                    num = num.toFixed(2);
                    Line10_Total.innerHTML = num;
                    Line10_Total.innerHTML = "$" + Line10_Total.innerHTML;
                    document.getElementById('<%=hdn_Line10_Total.ClientID %>').value = Line10_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line10_Total.ClientID %>').value = Line10_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine11(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 2592.04;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line11_Total = document.getElementById('<%=txt_Line11_Total.ClientID %>');
                Line11_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line11_Total.innerHTML);
                num = num.toFixed(2);
                Line11_Total.innerHTML = num;
                Line11_Total.innerHTML = "$" + Line11_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line11_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line11_Total.innerHTML);
                    num = num.toFixed(2);
                    Line11_Total.innerHTML = num;
                    Line11_Total.innerHTML = "$" + Line11_Total.innerHTML;
                    document.getElementById('<%=hdn_Line11_Total.ClientID %>').value = Line11_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line11_Total.ClientID %>').value = Line11_Total.innerHTML;
            }
        }
        //------------------------------------------------




        function CalculateLine12LaborRate() {
            var len = document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine12THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line12_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line12_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line12_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line12_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine12();
            }
        }


        function CalculateLine12TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line12_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line12_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line12_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line12_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine12();
            }
        }







        function CalculateLine12SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line12_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line12_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line12_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line12_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line12_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine12Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line12_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line12_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line12_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line12_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line12_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line12_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line12_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line12_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line12_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line12_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line12_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line12_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line12_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line12_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line12_Qty.ClientID %>').value = Qty;

                    var Line12_Total = document.getElementById('<%=txt_Line12_Total.ClientID %>');
                    Line12_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line12_Total.innerHTML = "$" + Line12_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line12_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line12_Total.innerHTML = "$" + Line12_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine12() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line12_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line12_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line12_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line12_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line12_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line12_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line12_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line12_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line12_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value;

                        if (isNaN(THW)) {
                            THW = 0;
                        }

                        if (isNaN(TMC)) {
                            TMC = 0;
                        }

                        if (isNaN(Rate)) {
                            Rate = 0;
                        }
                        var Cal1 = parseFloat(THW) * parseFloat(Rate);
                        var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                        if (isNaN(Qty)) {
                            Qty = 0;
                            alert('Please enter valid quantity');
                            document.getElementById('<%=txt_Line12_Qty.ClientID %>').value = '';
                        }
                        var Line12_Total = document.getElementById('<%=txt_Line12_Total.ClientID %>');
                        Line12_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line12_Total.innerHTML);
                        num = num.toFixed(2);
                        Line12_Total.innerHTML = num;
                        Line12_Total.innerHTML = "$" + Line12_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line12_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line12_Total.innerHTML);
                            num = num.toFixed(2);
                            Line12_Total.innerHTML = num;
                            Line12_Total.innerHTML = "$" + Line12_Total.innerHTML;
                            document.getElementById('<%=hdn_Line12_Total.ClientID %>').value = Line12_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line12_Total.ClientID %>').value = Line12_Total.innerHTML;
                    }
                }
            }
        }

        //------------------------------------------------




        function CalculateLine13LaborRate() {
            var len = document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine13THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line13_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line13_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line13_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line13_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine13();
            }
        }


        function CalculateLine13TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line13_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line13_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line13_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line13_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine13();
            }
        }



        function CalculateLine13SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line13_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line13_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line13_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line13_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line13_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine13Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line13_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line13_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line13_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line13_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line13_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line13_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line13_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line13_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line13_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line13_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line13_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line13_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line13_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line13_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line13_Qty.ClientID %>').value = Qty;

                    var Line13_Total = document.getElementById('<%=txt_Line13_Total.ClientID %>');
                    Line13_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line13_Total.innerHTML = "$" + Line13_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line13_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line13_Total.innerHTML = "$" + Line13_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine13() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line13_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line13_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line13_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line13_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line13_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line13_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line13_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line13_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line13_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line13_LaborRate.ClientID %>').value;

                        if (isNaN(THW)) {
                            THW = 0;
                        }

                        if (isNaN(TMC)) {
                            TMC = 0;
                        }

                        if (isNaN(Rate)) {
                            Rate = 0;
                        }
                        var Cal1 = parseFloat(THW) * parseFloat(Rate);
                        var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                        if (isNaN(Qty)) {
                            Qty = 0;
                            alert('Please enter valid quantity');
                            document.getElementById('<%=txt_Line13_Qty.ClientID %>').value = '';
                        }
                        var Line13_Total = document.getElementById('<%=txt_Line13_Total.ClientID %>');
                        Line13_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line13_Total.innerHTML);
                        num = num.toFixed(2);
                        Line13_Total.innerHTML = num;
                        Line13_Total.innerHTML = "$" + Line13_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line13_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line13_Total.innerHTML);
                            num = num.toFixed(2);
                            Line13_Total.innerHTML = num;
                            Line13_Total.innerHTML = "$" + Line13_Total.innerHTML;
                            document.getElementById('<%=hdn_Line13_Total.ClientID %>').value = Line13_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line13_Total.ClientID %>').value = Line13_Total.innerHTML;
                    }
                }
            }
        }



        //------------------------------------------------
        function CalculateLine14(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 27.86;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line14_Total = document.getElementById('<%=txt_Line14_Total.ClientID %>');
                Line14_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line14_Total.innerHTML);
                num = num.toFixed(2);
                Line14_Total.innerHTML = num;
                Line14_Total.innerHTML = "$" + Line14_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line14_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line14_Total.innerHTML);
                    num = num.toFixed(2);
                    Line14_Total.innerHTML = num;
                    Line14_Total.innerHTML = "$" + Line14_Total.innerHTML;
                    document.getElementById('<%=hdn_Line14_Total.ClientID %>').value = Line14_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line14_Total.ClientID %>').value = Line14_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine15(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 3.17;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line15_Total = document.getElementById('<%=txt_Line15_Total.ClientID %>');
                Line15_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line15_Total.innerHTML);
                num = num.toFixed(2);
                Line15_Total.innerHTML = num;
                Line15_Total.innerHTML = "$" + Line15_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line15_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line15_Total.innerHTML);
                    num = num.toFixed(2);
                    Line15_Total.innerHTML = num;
                    Line15_Total.innerHTML = "$" + Line15_Total.innerHTML;
                    document.getElementById('<%=hdn_Line15_Total.ClientID %>').value = Line15_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line15_Total.ClientID %>').value = Line15_Total.innerHTML;
            }
        }
        //------------------------------------------------




        function CalculateLine16LaborRate() {
            var len = document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine16THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line16_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line16_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line16_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line16_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine16();
            }
        }


        function CalculateLine16TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line16_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line16_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line16_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line16_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine16();
            }
        }





        function CalculateLine16SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line16_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line16_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line16_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line16_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line16_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine16Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line16_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line16_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line16_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line16_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line16_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line16_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line16_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line16_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line16_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line16_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line16_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line16_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line16_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line16_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line16_Qty.ClientID %>').value = Qty;

                    var Line16_Total = document.getElementById('<%=txt_Line16_Total.ClientID %>');
                    Line16_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line16_Total.innerHTML = "$" + Line16_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line16_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line16_Total.innerHTML = "$" + Line16_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine16() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line16_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line16_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line16_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line16_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line16_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line16_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line16_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line16_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line16_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value;

                        if (isNaN(THW)) {
                            THW = 0;
                        }

                        if (isNaN(TMC)) {
                            TMC = 0;
                        }

                        if (isNaN(Rate)) {
                            Rate = 0;
                        }
                        var Cal1 = parseFloat(THW) * parseFloat(Rate);
                        var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                        if (isNaN(Qty)) {
                            Qty = 0;
                            alert('Please enter valid quantity');
                            document.getElementById('<%=txt_Line16_Qty.ClientID %>').value = '';
                        }
                        var Line16_Total = document.getElementById('<%=txt_Line16_Total.ClientID %>');
                        Line16_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line16_Total.innerHTML);
                        num = num.toFixed(2);
                        Line16_Total.innerHTML = num;
                        Line16_Total.innerHTML = "$" + Line16_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line16_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line16_Total.innerHTML);
                            num = num.toFixed(2);
                            Line16_Total.innerHTML = num;
                            Line16_Total.innerHTML = "$" + Line16_Total.innerHTML;
                            document.getElementById('<%=hdn_Line16_Total.ClientID %>').value = Line16_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line16_Total.ClientID %>').value = Line16_Total.innerHTML;
                    }
                }
            }
        }

        //------------------------------------------------




        function CalculateLine17LaborRate() {
            var len = document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine17THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line17_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line17_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line17_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line17_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine17();
            }
        }


        function CalculateLine17TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line17_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line17_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line17_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line17_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine17();
            }
        }








        function CalculateLine17SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line17_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line17_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line17_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line17_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line17_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine17Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line17_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line17_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line17_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line17_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line17_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line17_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line17_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line17_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line17_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line17_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line17_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line17_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line17_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line17_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line17_Qty.ClientID %>').value = Qty;

                    var Line17_Total = document.getElementById('<%=txt_Line17_Total.ClientID %>');
                    Line17_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line17_Total.innerHTML = "$" + Line17_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line17_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line17_Total.innerHTML = "$" + Line17_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine17() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line17_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line17_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line17_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line17_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line17_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line17_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line17_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line17_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line17_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value;

                        if (isNaN(THW)) {
                            THW = 0;
                        }

                        if (isNaN(TMC)) {
                            TMC = 0;
                        }

                        if (isNaN(Rate)) {
                            Rate = 0;
                        }
                        var Cal1 = parseFloat(THW) * parseFloat(Rate);
                        var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                        if (isNaN(Qty)) {
                            Qty = 0;
                            alert('Please enter valid quantity');
                            document.getElementById('<%=txt_Line17_Qty.ClientID %>').value = '';
                        }
                        var Line17_Total = document.getElementById('<%=txt_Line17_Total.ClientID %>');
                        Line17_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line17_Total.innerHTML);
                        num = num.toFixed(2);
                        Line17_Total.innerHTML = num;
                        Line17_Total.innerHTML = "$" + Line17_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line17_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line17_Total.innerHTML);
                            num = num.toFixed(2);
                            Line17_Total.innerHTML = num;
                            Line17_Total.innerHTML = "$" + Line17_Total.innerHTML;
                            document.getElementById('<%=hdn_Line17_Total.ClientID %>').value = Line17_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line17_Total.ClientID %>').value = Line17_Total.innerHTML;
                    }
                }
            }
        }

        //------------------------------------------------




        function CalculateLine18LaborRate() {
            var len = document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine18THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line18_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line18_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line18_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line18_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine18();
            }
        }


        function CalculateLine18TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line18_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line18_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line18_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line18_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine18();
            }
        }








        function CalculateLine18SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line18_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line18_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line18_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line18_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line18_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine18Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line18_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line18_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line18_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line18_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line18_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line18_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line18_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line18_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line18_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line18_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line18_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line18_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line18_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line18_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line18_Qty.ClientID %>').value = Qty;

                    var Line18_Total = document.getElementById('<%=txt_Line18_Total.ClientID %>');
                    Line18_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line18_Total.innerHTML = "$" + Line18_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line18_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line18_Total.innerHTML = "$" + Line18_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine18() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line18_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line18_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line18_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line18_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line18_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line18_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line18_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line18_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line18_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value;

                        if (isNaN(THW)) {
                            THW = 0;
                        }

                        if (isNaN(TMC)) {
                            TMC = 0;
                        }

                        if (isNaN(Rate)) {
                            Rate = 0;
                        }
                        var Cal1 = parseFloat(THW) * parseFloat(Rate);
                        var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                        if (isNaN(Qty)) {
                            Qty = 0;
                            alert('Please enter valid quantity');
                            document.getElementById('<%=txt_Line18_Qty.ClientID %>').value = '';
                        }
                        var Line18_Total = document.getElementById('<%=txt_Line18_Total.ClientID %>');
                        Line18_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line18_Total.innerHTML);
                        num = num.toFixed(2);
                        Line18_Total.innerHTML = num;
                        Line18_Total.innerHTML = "$" + Line18_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line18_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line18_Total.innerHTML);
                            num = num.toFixed(2);
                            Line18_Total.innerHTML = num;
                            Line18_Total.innerHTML = "$" + Line18_Total.innerHTML;
                            document.getElementById('<%=hdn_Line18_Total.ClientID %>').value = Line18_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line18_Total.ClientID %>').value = Line18_Total.innerHTML;
                    }
                }
            }
        }

        //------------------------------------------------




        function CalculateLine19LaborRate() {
            var len = document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine19THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line19_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line19_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line19_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line19_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine19();
            }
        }


        function CalculateLine19TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line19_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line19_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line19_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line19_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine19();
            }
        }








        function CalculateLine19SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line19_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line19_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line19_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line19_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line19_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine19Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line19_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line19_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line19_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line19_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line19_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line19_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line19_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line19_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line19_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line19_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line19_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line19_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line19_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line19_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line19_Qty.ClientID %>').value = Qty;

                    var Line19_Total = document.getElementById('<%=txt_Line19_Total.ClientID %>');
                    Line19_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line19_Total.innerHTML = "$" + Line19_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line19_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line19_Total.innerHTML = "$" + Line19_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine19() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line19_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line19_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line19_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line19_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line19_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line19_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line19_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line19_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line19_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value;

                        if (isNaN(THW)) {
                            THW = 0;
                        }

                        if (isNaN(TMC)) {
                            TMC = 0;
                        }

                        if (isNaN(Rate)) {
                            Rate = 0;
                        }
                        var Cal1 = parseFloat(THW) * parseFloat(Rate);
                        var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                        if (isNaN(Qty)) {
                            Qty = 0;
                            alert('Please enter valid quantity');
                            document.getElementById('<%=txt_Line19_Qty.ClientID %>').value = '';
                        }
                        var Line19_Total = document.getElementById('<%=txt_Line19_Total.ClientID %>');
                        Line19_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line19_Total.innerHTML);
                        num = num.toFixed(2);
                        Line19_Total.innerHTML = num;
                        Line19_Total.innerHTML = "$" + Line19_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line19_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line19_Total.innerHTML);
                            num = num.toFixed(2);
                            Line19_Total.innerHTML = num;
                            Line19_Total.innerHTML = "$" + Line19_Total.innerHTML;
                            document.getElementById('<%=hdn_Line19_Total.ClientID %>').value = Line19_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line19_Total.ClientID %>').value = Line19_Total.innerHTML;
                    }
                }
            }
        }

        //------------------------------------------------




        function CalculateLine20LaborRate() {
            var len = document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine20THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line20_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line20_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line20_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line20_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine20();
            }
        }


        function CalculateLine20TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line20_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line20_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line20_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line20_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine20();
            }
        }






        function CalculateLine20SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line20_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line20_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line20_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line20_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line20_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine20Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line20_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line20_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line20_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line20_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line20_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line20_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line20_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line20_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line20_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line20_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line20_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line20_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line20_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line20_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line20_Qty.ClientID %>').value = Qty;

                    var Line20_Total = document.getElementById('<%=txt_Line20_Total.ClientID %>');
                    Line20_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line20_Total.innerHTML = "$" + Line20_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line20_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line20_Total.innerHTML = "$" + Line20_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine20() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line20_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line20_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line20_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line20_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line20_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line20_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line20_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line20_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line20_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value;

                        if (isNaN(THW)) {
                            THW = 0;
                        }

                        if (isNaN(TMC)) {
                            TMC = 0;
                        }

                        if (isNaN(Rate)) {
                            Rate = 0;
                        }
                        var Cal1 = parseFloat(THW) * parseFloat(Rate);
                        var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                        if (isNaN(Qty)) {
                            Qty = 0;
                            alert('Please enter valid quantity');
                            document.getElementById('<%=txt_Line20_Qty.ClientID %>').value = '';
                        }
                        var Line20_Total = document.getElementById('<%=txt_Line20_Total.ClientID %>');
                        Line20_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line20_Total.innerHTML);
                        num = num.toFixed(2);
                        Line20_Total.innerHTML = num;
                        Line20_Total.innerHTML = "$" + Line20_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line20_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line20_Total.innerHTML);
                            num = num.toFixed(2);
                            Line20_Total.innerHTML = num;
                            Line20_Total.innerHTML = "$" + Line20_Total.innerHTML;
                            document.getElementById('<%=hdn_Line20_Total.ClientID %>').value = Line20_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line20_Total.ClientID %>').value = Line20_Total.innerHTML;
                    }
                }
            }
        }


        function checkDate(sender, args) {
            if (sender._selectedDate < new Date()) {
                alert("You cannot select a day earlier than today !");
                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))
            }
        }

    </script>

</body>
</html>
