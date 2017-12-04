<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PPL_Invoice_Page4.aspx.cs"
    Inherits="PPLAudit_PPL_Invoice_Page4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PPL Invoice Page4</title>
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
    <div>
        <%-- font-weight: bold;
     text-decoration: underline;--%>
        <div class="fix_div">
            <!-- header -->
            <div class="header">
                <div class="logo_div">
                    <a href="../Home.aspx">
                        <img src="../images/logo.jpg" alt="" /></a></div>
                <div class="header_middiv">
                </div>
                <div class="head_link">
                    <a href="../Admin/Admin_Login.aspx">Administer Database</a> |
                    <asp:LinkButton ID="lnkLogin" runat="server" Text="Logout" OnClick="lnkLogin_Click"></asp:LinkButton>
                </div>
            </div>
            <!-- end header -->
            <div class="clear">
            </div>
            <!-- form section -->
            <div class="searchbynumber">
                <div class="main">
                    <%--<div class="main_right">--%>
                    <!--main_right begin-->
                    <!-- form section -->
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
                    <!--  HEADER Section   -->
                    <div class="right_text" runat="server">
                        Go to page: <a href="PPL_Invoice_Page1.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                            1</a> <a href="PPL_Invoice_Page2.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                2</a> <a href="PPL_Invoice_Page3.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                    3</a> <a href="PPL_Invoice_Page4.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>"
                                        class="active">4</a> <a href="PPLInvoicePage5.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                            5</a>
                    </div>
                    <div class="top_text" runat="server">
                        <span class="txt_orng" id="spann_final" runat="server">**** FINALIZED PPL Invoice *****</span>
                        <span class="txt_orng" style="display: none;">Job Number: <span id="JobNumber2" runat="server">
                        </span>Page # 4</span>
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
                                    <th>
                                        TOTAL
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                        <strong>GARAGE INSUL.</strong>
                                    </td>
                                    <td align="center">
                                        66
                                    </td>
                                    <td>
                                        Garage - Fiberglass batt R-19
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Lin. Ft.
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
                                        0.94
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
                                        <asp:TextBox ID="txt_Line2_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_LIURP" runat="server" class="txt_val" onblur="CalculateLine2Code()"
                                            Style="text-align: center;" onkeyup="CalculateLine2Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_SC" runat="server" class="small_field" onblur="CalculateLine2SC()"
                                            Style="text-align: center;" onkeyup="CalculateLine2SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center;" onblur="CalculateLine2LaborRate()" onkeyup="CalculateLine2LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_THW" runat="server" class="txt_thw" onblur="CalculateLine2THW()"
                                            onkeyup="CalculateLine2THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_TMC" runat="server" class="txt_thw" onblur="CalculateLine2TMC()"
                                            onkeyup="CalculateLine2TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line2_Qty" runat="server" class="txt_val" onblur="CalculateLine2()"
                                            onkeyup="CalculateLine2()"></asp:TextBox>
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
                                        <strong>HVAC/ELECT.</strong>
                                    </td>
                                    <td align="center">
                                        81
                                    </td>
                                    <td>
                                        CO Detector
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
                                        55.73
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
                                        81
                                    </td>
                                    <td>
                                        CO & CAZ Safety/Efficiency test (billed as 1 test per job) Adjustment; Draft; Efficiency
                                    </td>
                                    <td align="center">
                                        SC
                                    </td>
                                    <td align="center">
                                        Sq.Ft.
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
                                        43.00
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
                                        84
                                    </td>
                                    <td>
                                        Duct - Insulate Duct Attic Round
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
                                        4.29
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
                                        84
                                    </td>
                                    <td>
                                        Duct - Insulate Duct Attic Square
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
                                        4.54
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
                                        84
                                    </td>
                                    <td>
                                        Duct - Insulate Duct Basement < 12" Round
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
                                        6.54
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
                                        84
                                    </td>
                                    <td>
                                        Duct - Insulate Duct Basement < 12" Square
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
                                        6.81
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
                                        84
                                    </td>
                                    <td>
                                        Duct - Insulate Duct Basement > 12" Round
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
                                        6.67
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
                                        84
                                    </td>
                                    <td>
                                        Duct - Insulate Duct Basement > 12" Square
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
                                        6.95
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
                                        84
                                    </td>
                                    <td>
                                        Duct - Insulate Crawl Space< 12" Round
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
                                        6.98
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
                                    </td>
                                    <td align="center">
                                        84
                                    </td>
                                    <td>
                                        Duct - Insulate Crawl Space< 12" Square
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
                                        6.98
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line12_Qty" runat="server" class="txt_val" onblur="CalculateLine12(this.id)"
                                            onkeyup="CalculateLine12(this.id)"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        84
                                    </td>
                                    <td>
                                        Duct - Insulate Crawl Space> 12" Round
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
                                        7.10
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line13_Qty" runat="server" class="txt_val" onblur="CalculateLine13(this.id)"
                                            onkeyup="CalculateLine13(this.id)"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        84
                                    </td>
                                    <td>
                                        Duct - Insulate Crawl Space> 12" Square
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
                                        7.10
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
                                        F2
                                    </td>
                                    <td>
                                        Furnace Filter - Clean
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
                                        9.29
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
                                        <td align="center">
                                            f2
                                        </td>
                                        <td>
                                            Furnace Filter - Replace
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
                                            22.65
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="txt_Line16_Qty" runat="server" class="txt_val" onblur="CalculateLine16(this.id)"
                                                onkeyup="CalculateLine16(this.id)"></asp:TextBox>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="txt_Line16_Total" runat="server"></asp:Label>
                                            <asp:HiddenField ID="hdn_Line16_Total" runat="server" />
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td align="center">
                                        B1
                                    </td>
                                    <td>
                                        Thermostat Replacement
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
                                        36.49
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line17_Qty" runat="server" class="txt_val" onblur="CalculateLine17(this.id)"
                                            onkeyup="CalculateLine17(this.id)"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_Line18_SC" runat="server" class="small_field" onblur="CalculateLine18SC()"
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
                                        <strong>MISC.</strong>
                                    </td>
                                    <td align="center">
                                        93
                                    </td>
                                    <td>
                                        Dryer Vent Install / Replace
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
                                        74.00
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line20_Qty" runat="server" class="txt_val" onblur="CalculateLine20(this.id)"
                                            onkeyup="CalculateLine20(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line20_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line20_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line21_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td align="center">
                                        93
                                    </td>
                                    <td>
                                        Install Dryer Vent (Regular)
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
                                        80.40
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line21_Qty" runat="server" class="txt_val" onblur="CalculateLine21(this.id)"
                                            onkeyup="CalculateLine21(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line21_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line21_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line22_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td align="center">
                                        92
                                    </td>
                                    <td>
                                        Install Vent Hose for Kitchen/Bath Fan
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
                                        31.69
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line22_Qty" runat="server" class="txt_val" onblur="CalculateLine22(this.id)"
                                            onkeyup="CalculateLine22(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line22_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line22_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_LIURP" runat="server" class="txt_val" onblur="CalculateLine23Code()"
                                            Style="text-align: center;" onkeyup="CalculateLine23Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_SC" runat="server" class="small_field" onblur="CalculateLine23SC()"
                                            Style="text-align: center;" onkeyup="CalculateLine23SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center;" onblur="CalculateLine23LaborRate()" onkeyup="CalculateLine23LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_THW" runat="server" class="txt_thw" onblur="CalculateLine23THW()"
                                            onkeyup="CalculateLine23THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_TMC" runat="server" class="txt_thw" onblur="CalculateLine23TMC()"
                                            onkeyup="CalculateLine23TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line23_Qty" runat="server" class="txt_val" onblur="CalculateLine23()"
                                            onkeyup="CalculateLine23()"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line23_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line23_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line24_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                        <%--<asp:TextBox ID="txt_Line24_Cat" runat="server" class="txt_mob" Text=""></asp:TextBox>--%>
                                        <strong>MOBILE HOME</strong>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_LIURP" runat="server" class="txt_val" onblur="CalculateLine24Code()"
                                            Style="text-align: center;" onkeyup="CalculateLine24Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line24_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_SC" runat="server" class="small_field" onblur="CalculateLine24SC()"
                                            Style="text-align: center;" onkeyup="CalculateLine24SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center;" onblur="CalculateLine24LaborRate()" onkeyup="CalculateLine24LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line24_THW" runat="server" class="txt_thw" onblur="CalculateLine24THW()"
                                            onkeyup="CalculateLine24THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line24_TMC" runat="server" class="txt_thw" onblur="CalculateLine24TMC()"
                                            onkeyup="CalculateLine24TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line24_Qty" runat="server" class="txt_val" onblur="CalculateLine24()"
                                            onkeyup="CalculateLine24()"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line24_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line24_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line25_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line25_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line25_LIURP" runat="server" class="txt_val" onblur="CalculateLine25Code()"
                                            Style="text-align: center;" onkeyup="CalculateLine25Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line25_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line25_SC" runat="server" class="small_field" onblur="CalculateLine25SC()"
                                            Style="text-align: center;" onkeyup="CalculateLine25SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line25_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line25_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center;" onblur="CalculateLine25LaborRate()" onkeyup="CalculateLine25LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line25_THW" runat="server" class="txt_thw" onblur="CalculateLine25THW()"
                                            onkeyup="CalculateLine25THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line25_TMC" runat="server" class="txt_thw" onblur="CalculateLine25TMC()"
                                            onkeyup="CalculateLine25TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line25_Qty" runat="server" class="txt_val" onblur="CalculateLine25()"
                                            onkeyup="CalculateLine25()"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line25_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line25_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line26_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line26_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_LIURP" runat="server" class="txt_val" onblur="CalculateLine26Code()"
                                            Style="text-align: center;" onkeyup="CalculateLine26Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line26_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_SC" runat="server" class="small_field" onblur="CalculateLine26SC()"
                                            Style="text-align: center;" onkeyup="CalculateLine26SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center;" onblur="CalculateLine26LaborRate()" onkeyup="CalculateLine26LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line26_THW" runat="server" class="txt_thw" onblur="CalculateLine26THW()"
                                            onkeyup="CalculateLine26THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line26_TMC" runat="server" class="txt_thw" onblur="CalculateLine26TMC()"
                                            onkeyup="CalculateLine26TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line26_Qty" runat="server" class="txt_val" onblur="CalculateLine26()"
                                            onkeyup="CalculateLine26()"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line26_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line26_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line27_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                        <%--<asp:TextBox ID="txt_Line27_Cat" runat="server" class="txt_mob" Text="WALLS"></asp:TextBox>--%>
                                        <strong>WALLS</strong>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line27_LIURP" runat="server" class="txt_val" onblur="CalculateLine27Code()"
                                            Style="text-align: center;" onkeyup="CalculateLine27Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line27_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line27_SC" runat="server" class="small_field" onblur="CalculateLine27SC()"
                                            Style="text-align: center;" onkeyup="CalculateLine27SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line27_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line27_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center;" onblur="CalculateLine27LaborRate()" onkeyup="CalculateLine27LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line27_THW" runat="server" class="txt_thw" onblur="CalculateLine27THW()"
                                            onkeyup="CalculateLine27THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line27_TMC" runat="server" class="txt_thw" onblur="CalculateLine27TMC()"
                                            onkeyup="CalculateLine27TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line27_Qty" runat="server" class="txt_val" onblur="CalculateLine27()"
                                            onkeyup="CalculateLine27()"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line27_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line27_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line28_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line28_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line28_LIURP" runat="server" class="txt_val" onblur="CalculateLine28Code()"
                                            Style="text-align: center;" onkeyup="CalculateLine28Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line28_MeasureDesc" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line28_SC" runat="server" class="small_field" onblur="CalculateLine28SC()"
                                            Style="text-align: center;" onkeyup="CalculateLine28SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line28_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line28_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center;" onblur="CalculateLine28LaborRate()" onkeyup="CalculateLine28LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line28_THW" runat="server" class="txt_thw" onblur="CalculateLine28THW()"
                                            onkeyup="CalculateLine28THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line28_TMC" runat="server" class="txt_thw" onblur="CalculateLine28TMC()"
                                            onkeyup="CalculateLine28TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line28_Qty" runat="server" class="txt_val" onblur="CalculateLine28()"
                                            onkeyup="CalculateLine28()"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line28_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line28_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_LIURP" runat="server" class="txt_val" onblur="CalculateLine29Code()"
                                            Style="text-align: center;" onkeyup="CalculateLine29Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_SC" runat="server" class="small_field" onblur="CalculateLine29SC()"
                                            Style="text-align: center;" onkeyup="CalculateLine29SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center;" onblur="CalculateLine29LaborRate()" onkeyup="CalculateLine29LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_THW" runat="server" class="txt_thw" onblur="CalculateLine29THW()"
                                            onkeyup="CalculateLine29THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_TMC" runat="server" class="txt_thw" onblur="CalculateLine29TMC()"
                                            onkeyup="CalculateLine29TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line29_Qty" runat="server" class="txt_val" onblur="CalculateLine29()"
                                            onkeyup="CalculateLine29()"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line29_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line29_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line30_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                        <strong>WATER HEATING</strong>
                                    </td>
                                    <td align="center">
                                        1
                                    </td>
                                    <td>
                                        Faucet Aerator - Bath
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
                                        15.85
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line30_Qty" runat="server" class="txt_val" onblur="CalculateLine30(this.id)"
                                            onkeyup="CalculateLine30(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line30_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line30_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line31_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td align="center">
                                        2
                                    </td>
                                    <td>
                                        Faucet Aerator - Kitchen
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
                                        15.85
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line31_Qty" runat="server" class="txt_val" onblur="CalculateLine31(this.id)"
                                            onkeyup="CalculateLine31(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line31_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line31_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line32_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td align="center">
                                        F1
                                    </td>
                                    <td>
                                        Faucet Replacement - Bathroom Sink
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
                                        130.58
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line32_Qty" runat="server" class="txt_val" onblur="CalculateLine32(this.id)"
                                            onkeyup="CalculateLine32(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line32_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line32_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line33_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td align="center">
                                        F1
                                    </td>
                                    <td>
                                        Faucet Replacement - Bathtub
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
                                        130.58
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line33_Qty" runat="server" class="txt_val" onblur="CalculateLine33(this.id)"
                                            onkeyup="CalculateLine33(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line33_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line33_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td align="center">
                                        F1
                                    </td>
                                    <td>
                                        Faucet Replacement - Kitchen
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
                                        130.58
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line34_Qty" runat="server" class="txt_val" onblur="CalculateLine34(this.id)"
                                            onkeyup="CalculateLine34(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line34_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line34_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line35_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td align="center">
                                        H1
                                    </td>
                                    <td>
                                        Heat Tape
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
                                        3.68
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line35_Qty" runat="server" class="txt_val" onblur="CalculateLine35(this.id)"
                                            onkeyup="CalculateLine35(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line35_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line35_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line36_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td align="center">
                                        3
                                    </td>
                                    <td>
                                        Low Flow Showerhead
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
                                        22.77
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line36_Qty" runat="server" class="txt_val" onblur="CalculateLine36(this.id)"
                                            onkeyup="CalculateLine36(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line36_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line36_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line37_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td align="center">
                                        5
                                    </td>
                                    <td>
                                        Water - Pipe Insulation - 1"
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
                                        1.95
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line37_Qty" runat="server" class="txt_val" onblur="CalculateLine37(this.id)"
                                            onkeyup="CalculateLine37(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line37_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line37_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line38_Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td align="center">
                                        5
                                    </td>
                                    <td>
                                        Water - Pipe Insulation - 1 1/2"
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
                                        2.62
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line38_Qty" runat="server" class="txt_val" onblur="CalculateLine38(this.id)"
                                            onkeyup="CalculateLine38(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line38_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line38_Total" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <!-- Sudhanshu end -->
                    <!-- inv_table end -->
                    <%--</div>--%>
                    <!--main_right end-->
                    <div class="clear">
                    </div>
                </div>
                <!--main div end-->
            </div>
            <!-- end form section -->
            <div class="clear">
            </div>
            <!-- footer -->
            <div class="footer">
                Custom Weatherization, LLC © 2013</div>
            <!-- end footer -->
        </div>
    </div>
    </form>

    <script type="text/javascript">


        //------------------------------------------------
        function CalculateLine1(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            var Qty = document.getElementById(ID).value;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var CostUnit = 0.94;

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



        function CalculateLine2LaborRate() {
            var len = document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine2THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line2_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line2_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line2_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line2_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine2();
            }
        }


        function CalculateLine2TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line2_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line2_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line2_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line2_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine2();
            }
        }


        function CalculateLine2SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line2_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line2_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line2_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line2_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line2_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine2Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line2_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line2_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line2_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line2_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line2_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line2_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line2_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line2_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line2_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line2_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line2_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line2_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line2_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = Qty;

                    var Line2_Total = document.getElementById('<%=txt_Line2_Total.ClientID %>');
                    Line2_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line2_Total.innerHTML = "$" + Line2_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line2_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line2_Total.innerHTML = "$" + Line2_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine2() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = '';

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line2_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line2_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line2_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line2_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = '';
                        }
                        var Line2_Total = document.getElementById('<%=txt_Line2_Total.ClientID %>');
                        Line2_Total.innerHTML = parseFloat(Qty * CostUnit);

                        var num = parseFloat(Line2_Total.innerHTML);
                        num = num.toFixed(2);
                        Line2_Total.innerHTML = num;
                        Line2_Total.innerHTML = "$" + Line2_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line2_Total.innerHTML = parseFloat(Qty * CostUnit);

                            var num = parseFloat(Line2_Total.innerHTML);
                            num = num.toFixed(2);
                            Line2_Total.innerHTML = num;
                            Line2_Total.innerHTML = "$" + Line2_Total.innerHTML;
                            document.getElementById('<%=hdn_Line2_Total.ClientID %>').value = Line2_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line2_Total.ClientID %>').value = Line2_Total.innerHTML;
                    }
                }
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
                var CostUnit = 55.73;

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
                var CostUnit = 43.00;

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
                var CostUnit = 4.29;

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
                var CostUnit = 4.54;

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
                var CostUnit = 6.54;

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
                var CostUnit = 6.81;

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
                var CostUnit = 6.67;

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
                var CostUnit = 6.95;

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
                var CostUnit = 6.98;

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
        function CalculateLine12(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 6.98;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line12_Total = document.getElementById('<%=txt_Line12_Total.ClientID %>');
                Line12_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line12_Total.innerHTML);
                num = num.toFixed(2);
                Line12_Total.innerHTML = num;
                Line12_Total.innerHTML = "$" + Line12_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line12_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line12_Total.innerHTML);
                    num = num.toFixed(2);
                    Line12_Total.innerHTML = num;
                    Line12_Total.innerHTML = "$" + Line12_Total.innerHTML;
                    document.getElementById('<%=hdn_Line12_Total.ClientID %>').value = Line12_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line12_Total.ClientID %>').value = Line12_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine13(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 7.10;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line13_Total = document.getElementById('<%=txt_Line13_Total.ClientID %>');
                Line13_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line13_Total.innerHTML);
                num = num.toFixed(2);
                Line13_Total.innerHTML = num;
                Line13_Total.innerHTML = "$" + Line13_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line13_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line13_Total.innerHTML);
                    num = num.toFixed(2);
                    Line13_Total.innerHTML = num;
                    Line13_Total.innerHTML = "$" + Line13_Total.innerHTML;
                    document.getElementById('<%=hdn_Line13_Total.ClientID %>').value = Line13_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line13_Total.ClientID %>').value = Line13_Total.innerHTML;
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
                var CostUnit = 7.10;

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
                var CostUnit = 9.29;

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
        function CalculateLine16(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 22.65;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line16_Total = document.getElementById('<%=txt_Line16_Total.ClientID %>');
                Line16_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line16_Total.innerHTML);
                num = num.toFixed(2);
                Line16_Total.innerHTML = num;
                Line16_Total.innerHTML = "$" + Line16_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line16_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line16_Total.innerHTML);
                    num = num.toFixed(2);
                    Line16_Total.innerHTML = num;
                    Line16_Total.innerHTML = "$" + Line16_Total.innerHTML;
                    document.getElementById('<%=hdn_Line16_Total.ClientID %>').value = Line16_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line16_Total.ClientID %>').value = Line16_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine17(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 36.49;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line17_Total = document.getElementById('<%=txt_Line17_Total.ClientID %>');
                Line17_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line17_Total.innerHTML);
                num = num.toFixed(2);
                Line17_Total.innerHTML = num;
                Line17_Total.innerHTML = "$" + Line17_Total.innerHTML;
                document.getElementById('<%=hdn_Line17_Total.ClientID %>').value = Line17_Total.innerHTML;
                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line17_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line17_Total.innerHTML);
                    num = num.toFixed(2);
                    Line17_Total.innerHTML = num;
                    Line17_Total.innerHTML = "$" + Line17_Total.innerHTML;
                    document.getElementById('<%=hdn_Line17_Total.ClientID %>').value = Line17_Total.innerHTML;
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
                        document.getElementById('<%=hdn_Line18_Total.ClientID %>').value = Line18_Total.innerHTML;
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
                        document.getElementById('<%=hdn_Line19_Total.ClientID %>').value = Line19_Total.innerHTML;
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
                    }
                }
            }
        }

        //------------------------------------------------
        function CalculateLine20(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 74.00;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line20_Total = document.getElementById('<%=txt_Line20_Total.ClientID %>');
                Line20_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line20_Total.innerHTML);
                num = num.toFixed(2);
                Line20_Total.innerHTML = num;
                Line20_Total.innerHTML = "$" + Line20_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line20_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line20_Total.innerHTML);
                    num = num.toFixed(2);
                    Line20_Total.innerHTML = num;
                    Line20_Total.innerHTML = "$" + Line20_Total.innerHTML;
                    document.getElementById('<%=hdn_Line20_Total.ClientID %>').value = Line20_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line20_Total.ClientID %>').value = Line20_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine21(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 80.40;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line21_Total = document.getElementById('<%=txt_Line21_Total.ClientID %>');
                Line21_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line21_Total.innerHTML);
                num = num.toFixed(2);
                Line21_Total.innerHTML = num;
                Line21_Total.innerHTML = "$" + Line21_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line21_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line21_Total.innerHTML);
                    num = num.toFixed(2);
                    Line21_Total.innerHTML = num;
                    Line21_Total.innerHTML = "$" + Line21_Total.innerHTML;
                    document.getElementById('<%=hdn_Line21_Total.ClientID %>').value = Line21_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line21_Total.ClientID %>').value = Line21_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine22(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 31.69;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line22_Total = document.getElementById('<%=txt_Line22_Total.ClientID %>');
                Line22_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line22_Total.innerHTML);
                num = num.toFixed(2);
                Line22_Total.innerHTML = num;
                Line22_Total.innerHTML = "$" + Line22_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line22_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line22_Total.innerHTML);
                    num = num.toFixed(2);
                    Line22_Total.innerHTML = num;
                    Line22_Total.innerHTML = "$" + Line22_Total.innerHTML;
                    document.getElementById('<%=hdn_Line22_Total.ClientID %>').value = Line22_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line22_Total.ClientID %>').value = Line22_Total.innerHTML;
            }
        }


        //------------------------------------------------



        function CalculateLine23LaborRate() {
            var len = document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine23THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line23_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line23_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line23_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line23_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine23();
            }
        }


        function CalculateLine23TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line23_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line23_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line23_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line23_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine23();
            }
        }




        function CalculateLine23SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line23_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line23_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line23_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line23_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line23_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine23Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line23_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line23_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line23_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line23_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line23_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line23_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line23_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line23_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line23_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line23_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line23_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line23_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line23_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line23_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line23_Qty.ClientID %>').value = Qty;

                    var Line23_Total = document.getElementById('<%=txt_Line23_Total.ClientID %>');
                    Line23_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line23_Total.innerHTML = "$" + Line23_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line23_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line23_Total.innerHTML = "$" + Line23_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine23() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line23_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line23_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line23_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line23_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line23_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line23_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line23_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line23_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line23_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line23_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line23_Qty.ClientID %>').value = '';
                        }
                        var Line23_Total = document.getElementById('<%=txt_Line23_Total.ClientID %>');
                        Line23_Total.innerHTML = parseFloat(Qty * CostUnit);

                        var num = parseFloat(Line23_Total.innerHTML);
                        num = num.toFixed(2);
                        Line23_Total.innerHTML = num;
                        Line23_Total.innerHTML = "$" + Line23_Total.innerHTML;
                        document.getElementById('<%=hdn_Line23_Total.ClientID %>').value = Line23_Total.innerHTML;
                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line23_Total.innerHTML = parseFloat(Qty * CostUnit);

                            var num = parseFloat(Line23_Total.innerHTML);
                            num = num.toFixed(2);
                            Line23_Total.innerHTML = num;
                            Line23_Total.innerHTML = "$" + Line23_Total.innerHTML;
                            document.getElementById('<%=hdn_Line23_Total.ClientID %>').value = Line23_Total.innerHTML;
                        }
                    }
                }
            }
        }

        //------------------------------------------------



        function CalculateLine24LaborRate() {
            var len = document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine24THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line24_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line24_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line24_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line24_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine24();
            }
        }


        function CalculateLine24TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line24_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line24_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line24_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line24_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine24();
            }
        }





        function CalculateLine24SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line24_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line24_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line24_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line24_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line24_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine24Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line24_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line24_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line24_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line24_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line24_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line24_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line24_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line24_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line24_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line24_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line24_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line24_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line24_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line24_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line24_Qty.ClientID %>').value = Qty;

                    var Line23_Total = document.getElementById('<%=txt_Line24_Total.ClientID %>');
                    Line24_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line24_Total.innerHTML = "$" + Line24_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line24_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line24_Total.innerHTML = "$" + Line24_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine24() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line24_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line24_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line24_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line24_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line24_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line24_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line24_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line24_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line24_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line24_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line24_Qty.ClientID %>').value = '';
                        }
                        var Line24_Total = document.getElementById('<%=txt_Line24_Total.ClientID %>');
                        Line24_Total.innerHTML = parseFloat(Qty * CostUnit);

                        var num = parseFloat(Line24_Total.innerHTML);
                        num = num.toFixed(2);
                        Line24_Total.innerHTML = num;
                        Line24_Total.innerHTML = "$" + Line24_Total.innerHTML;
                        document.getElementById('<%=hdn_Line24_Total.ClientID %>').value = Line24_Total.innerHTML;
                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line24_Total.innerHTML = parseFloat(Qty * CostUnit);

                            var num = parseFloat(Line24_Total.innerHTML);
                            num = num.toFixed(2);
                            Line24_Total.innerHTML = num;
                            Line24_Total.innerHTML = "$" + Line24_Total.innerHTML;
                            document.getElementById('<%=hdn_Line24_Total.ClientID %>').value = Line24_Total.innerHTML;
                        }
                    }
                }
            }
        }

        //------------------------------------------------



        function CalculateLine25LaborRate() {
            var len = document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine25THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line25_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line25_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line25_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line25_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine25();
            }
        }


        function CalculateLine25TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line25_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line25_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line25_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line25_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine25();
            }
        }




        function CalculateLine25SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line25_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line25_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line25_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line25_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line25_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine25Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line25_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line25_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line25_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line25_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line25_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line25_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line25_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line25_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line25_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line25_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line25_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line25_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line25_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line25_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line25_Qty.ClientID %>').value = Qty;

                    var Line25_Total = document.getElementById('<%=txt_Line25_Total.ClientID %>');
                    Line25_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line25_Total.innerHTML = "$" + Line25_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line25_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line25_Total.innerHTML = "$" + Line25_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine25() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line25_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line25_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line25_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line25_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line25_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line25_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line25_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line25_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line25_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line25_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line25_Qty.ClientID %>').value = '';
                        }
                        var Line25_Total = document.getElementById('<%=txt_Line25_Total.ClientID %>');
                        Line25_Total.innerHTML = parseFloat(Qty * CostUnit);

                        var num = parseFloat(Line25_Total.innerHTML);
                        num = num.toFixed(2);
                        Line25_Total.innerHTML = num;
                        Line25_Total.innerHTML = "$" + Line25_Total.innerHTML;
                        document.getElementById('<%=hdn_Line25_Total.ClientID %>').value = Line25_Total.innerHTML;
                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line25_Total.innerHTML = parseFloat(Qty * CostUnit);

                            var num = parseFloat(Line25_Total.innerHTML);
                            num = num.toFixed(2);
                            Line25_Total.innerHTML = num;
                            Line25_Total.innerHTML = "$" + Line25_Total.innerHTML;
                            document.getElementById('<%=hdn_Line25_Total.ClientID %>').value = Line25_Total.innerHTML;
                        }
                    }
                }
            }
        }


        //------------------------------------------------



        function CalculateLine26LaborRate() {
            var len = document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine26THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line26_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line26_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line26_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line26_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine26();
            }
        }


        function CalculateLine26TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line26_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line26_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line26_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line26_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine26();
            }
        }



        function CalculateLine26SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line26_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line26_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line26_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line26_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line26_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine26Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line26_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line26_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line26_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line26_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line26_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line26_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line26_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line26_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line26_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line26_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line26_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line26_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line26_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line26_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line26_Qty.ClientID %>').value = Qty;

                    var Line26_Total = document.getElementById('<%=txt_Line26_Total.ClientID %>');
                    Line26_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line26_Total.innerHTML = "$" + Line26_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line26_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line26_Total.innerHTML = "$" + Line26_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine26() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line26_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line26_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line26_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line26_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line26_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line26_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line26_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line26_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line26_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line26_Qty.ClientID %>').value = '';
                        }
                        var Line26_Total = document.getElementById('<%=txt_Line26_Total.ClientID %>');
                        Line26_Total.innerHTML = parseFloat(Qty * CostUnit);

                        var num = parseFloat(Line26_Total.innerHTML);
                        num = num.toFixed(2);
                        Line26_Total.innerHTML = num;
                        Line26_Total.innerHTML = "$" + Line26_Total.innerHTML;
                        document.getElementById('<%=hdn_Line26_Total.ClientID %>').value = Line26_Total.innerHTML;
                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line26_Total.innerHTML = parseFloat(Qty * CostUnit);

                            var num = parseFloat(Line26_Total.innerHTML);
                            num = num.toFixed(2);
                            Line26_Total.innerHTML = num;
                            Line26_Total.innerHTML = "$" + Line26_Total.innerHTML;
                            document.getElementById('<%=hdn_Line26_Total.ClientID %>').value = Line26_Total.innerHTML;
                        }
                    }
                }
            }
        }

        //------------------------------------------------



        function CalculateLine27LaborRate() {
            var len = document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine27THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line27_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line27_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line27_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line27_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine27();
            }
        }


        function CalculateLine27TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line27_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line27_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line27_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line27_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine27();
            }
        }




        function CalculateLine27SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line27_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line27_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line27_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line27_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line27_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine27Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line27_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line27_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line27_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line27_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line27_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line27_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line27_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line27_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line27_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line27_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line27_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line27_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line27_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line27_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line27_Qty.ClientID %>').value = Qty;

                    var Line27_Total = document.getElementById('<%=txt_Line27_Total.ClientID %>');
                    Line27_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line27_Total.innerHTML = "$" + Line27_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line27_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line27_Total.innerHTML = "$" + Line27_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine27() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line27_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line27_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line27_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line27_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line27_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line27_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line27_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line27_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line27_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line27_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line27_Qty.ClientID %>').value = '';
                        }
                        var Line27_Total = document.getElementById('<%=txt_Line27_Total.ClientID %>');
                        Line27_Total.innerHTML = parseFloat(Qty * CostUnit);

                        var num = parseFloat(Line27_Total.innerHTML);
                        num = num.toFixed(2);
                        Line27_Total.innerHTML = num;
                        Line27_Total.innerHTML = "$" + Line27_Total.innerHTML;
                        document.getElementById('<%=hdn_Line27_Total.ClientID %>').value = Line27_Total.innerHTML;
                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line27_Total.innerHTML = parseFloat(Qty * CostUnit);

                            var num = parseFloat(Line27_Total.innerHTML);
                            num = num.toFixed(2);
                            Line27_Total.innerHTML = num;
                            Line27_Total.innerHTML = "$" + Line27_Total.innerHTML;
                            document.getElementById('<%=hdn_Line27_Total.ClientID %>').value = Line27_Total.innerHTML;
                        }
                    }
                }
            }
        }

        //------------------------------------------------
        function CalculateLine28LaborRate() {
            var len = document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine28THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line28_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line28_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line28_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line28_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine28();
            }
        }


        function CalculateLine28TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line28_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line28_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line28_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line28_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine28();
            }
        }



        function CalculateLine28SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line28_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line28_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line28_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line28_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line28_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine28Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line28_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line28_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line28_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line28_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line28_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line28_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line28_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line28_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line28_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line28_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line28_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line28_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line28_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line28_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line28_Qty.ClientID %>').value = Qty;

                    var Line28_Total = document.getElementById('<%=txt_Line28_Total.ClientID %>');
                    Line28_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line28_Total.innerHTML = "$" + Line28_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line28_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line28_Total.innerHTML = "$" + Line28_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine28() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line28_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line28_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line28_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line28_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line28_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line28_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line28_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line28_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line28_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line28_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line28_Qty.ClientID %>').value = '';
                        }
                        var Line28_Total = document.getElementById('<%=txt_Line28_Total.ClientID %>');
                        Line28_Total.innerHTML = parseFloat(Qty * CostUnit);

                        var num = parseFloat(Line28_Total.innerHTML);
                        num = num.toFixed(2);
                        Line28_Total.innerHTML = num;
                        Line28_Total.innerHTML = "$" + Line28_Total.innerHTML;
                        document.getElementById('<%=hdn_Line28_Total.ClientID %>').value = Line28_Total.innerHTML;
                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line28_Total.innerHTML = parseFloat(Qty * CostUnit);

                            var num = parseFloat(Line28_Total.innerHTML);
                            num = num.toFixed(2);
                            Line28_Total.innerHTML = num;
                            Line28_Total.innerHTML = "$" + Line28_Total.innerHTML;
                            document.getElementById('<%=hdn_Line28_Total.ClientID %>').value = Line28_Total.innerHTML;
                        }
                    }
                }
            }
        }


        //------------------------------------------------



        function CalculateLine29LaborRate() {
            var len = document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine29THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line29_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line29_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line29_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line29_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine29();
            }
        }


        function CalculateLine29TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line29_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line29_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line29_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line29_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine29();
            }
        }





        function CalculateLine29SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line29_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line29_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line29_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line29_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line29_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine29Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line29_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line29_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line29_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line29_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line29_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line29_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line29_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line29_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line29_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line29_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line29_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line29_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line29_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line29_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line29_Qty.ClientID %>').value = Qty;

                    var Line29_Total = document.getElementById('<%=txt_Line29_Total.ClientID %>');
                    Line29_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line29_Total.innerHTML = "$" + Line29_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line29_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line29_Total.innerHTML = "$" + Line29_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine29() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line29_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line29_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line29_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line29_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line29_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line29_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line29_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line29_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line29_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line29_Qty.ClientID %>').value = '';
                        }
                        var Line29_Total = document.getElementById('<%=txt_Line29_Total.ClientID %>');
                        Line29_Total.innerHTML = parseFloat(Qty * CostUnit);

                        var num = parseFloat(Line29_Total.innerHTML);
                        num = num.toFixed(2);
                        Line29_Total.innerHTML = num;
                        Line29_Total.innerHTML = "$" + Line29_Total.innerHTML;
                        document.getElementById('<%=hdn_Line29_Total.ClientID %>').value = Line29_Total.innerHTML;
                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line29_Total.innerHTML = parseFloat(Qty * CostUnit);

                            var num = parseFloat(Line29_Total.innerHTML);
                            num = num.toFixed(2);
                            Line29_Total.innerHTML = num;
                            Line29_Total.innerHTML = "$" + Line29_Total.innerHTML;
                            document.getElementById('<%=hdn_Line29_Total.ClientID %>').value = Line29_Total.innerHTML;
                        }
                    }
                }
            }
        }

        //------------------------------------------------
        function CalculateLine30(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 15.85;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line30_Total = document.getElementById('<%=txt_Line30_Total.ClientID %>');
                Line30_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line30_Total.innerHTML);
                num = num.toFixed(2);
                Line30_Total.innerHTML = num;
                Line30_Total.innerHTML = "$" + Line30_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line30_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line30_Total.innerHTML);
                    num = num.toFixed(2);
                    Line30_Total.innerHTML = num;
                    Line30_Total.innerHTML = "$" + Line30_Total.innerHTML;
                    document.getElementById('<%=hdn_Line30_Total.ClientID %>').value = Line30_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line30_Total.ClientID %>').value = Line30_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine31(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 15.85;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line31_Total = document.getElementById('<%=txt_Line31_Total.ClientID %>');
                Line31_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line31_Total.innerHTML);
                num = num.toFixed(2);
                Line31_Total.innerHTML = num;
                Line31_Total.innerHTML = "$" + Line31_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line31_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line31_Total.innerHTML);
                    num = num.toFixed(2);
                    Line31_Total.innerHTML = num;
                    Line31_Total.innerHTML = "$" + Line31_Total.innerHTML;
                    document.getElementById('<%=hdn_Line31_Total.ClientID %>').value = Line31_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line31_Total.ClientID %>').value = Line31_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine32(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 130.58;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line32_Total = document.getElementById('<%=txt_Line32_Total.ClientID %>');
                Line32_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line32_Total.innerHTML);
                num = num.toFixed(2);
                Line32_Total.innerHTML = num;
                Line32_Total.innerHTML = "$" + Line32_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line32_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line32_Total.innerHTML);
                    num = num.toFixed(2);
                    Line32_Total.innerHTML = num;
                    Line32_Total.innerHTML = "$" + Line32_Total.innerHTML;
                    document.getElementById('<%=hdn_Line32_Total.ClientID %>').value = Line32_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line32_Total.ClientID %>').value = Line32_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine33(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 130.58;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line33_Total = document.getElementById('<%=txt_Line33_Total.ClientID %>');
                Line33_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line33_Total.innerHTML);
                num = num.toFixed(2);
                Line33_Total.innerHTML = num;
                Line33_Total.innerHTML = "$" + Line33_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line33_Total.innerHTML = Qty * CostUnit;


                    var num = parseFloat(Line33_Total.innerHTML);
                    num = num.toFixed(2);
                    Line33_Total.innerHTML = num;
                    Line33_Total.innerHTML = "$" + Line33_Total.innerHTML;
                    document.getElementById('<%=hdn_Line33_Total.ClientID %>').value = Line33_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line33_Total.ClientID %>').value = Line33_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine34(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 130.58;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line34_Total = document.getElementById('<%=txt_Line34_Total.ClientID %>');
                Line34_Total.innerHTML = Qty * CostUnit;


                var num = parseFloat(Line34_Total.innerHTML);
                num = num.toFixed(2);
                Line34_Total.innerHTML = num;
                Line34_Total.innerHTML = "$" + Line34_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line34_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line34_Total.innerHTML);
                    num = num.toFixed(2);
                    Line34_Total.innerHTML = num;
                    Line34_Total.innerHTML = "$" + Line34_Total.innerHTML;
                    document.getElementById('<%=hdn_Line34_Total.ClientID %>').value = Line34_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line34_Total.ClientID %>').value = Line34_Total.innerHTML;
            }
        }

        //------------------------------------------------
        function CalculateLine35(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 3.68;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line35_Total = document.getElementById('<%=txt_Line35_Total.ClientID %>');
                Line35_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line35_Total.innerHTML);
                num = num.toFixed(2);
                Line35_Total.innerHTML = num;
                Line35_Total.innerHTML = "$" + Line35_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line35_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line35_Total.innerHTML);
                    num = num.toFixed(2);
                    Line35_Total.innerHTML = num;
                    Line35_Total.innerHTML = "$" + Line35_Total.innerHTML;
                    document.getElementById('<%=hdn_Line35_Total.ClientID %>').value = Line35_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line35_Total.ClientID %>').value = Line35_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine36(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 22.77;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line36_Total = document.getElementById('<%=txt_Line36_Total.ClientID %>');
                Line36_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line36_Total.innerHTML);
                num = num.toFixed(2);
                Line36_Total.innerHTML = num;
                Line36_Total.innerHTML = "$" + Line36_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line36_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line36_Total.innerHTML);
                    num = num.toFixed(2);
                    Line36_Total.innerHTML = num;
                    Line36_Total.innerHTML = "$" + Line36_Total.innerHTML;
                    document.getElementById('<%=hdn_Line36_Total.ClientID %>').value = Line36_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line36_Total.ClientID %>').value = Line36_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine37(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 1.95;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line37_Total = document.getElementById('<%=txt_Line37_Total.ClientID %>');
                Line37_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line37_Total.innerHTML);
                num = num.toFixed(2);
                Line37_Total.innerHTML = num;
                Line37_Total.innerHTML = "$" + Line37_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line37_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line37_Total.innerHTML);
                    num = num.toFixed(2);
                    Line37_Total.innerHTML = num;
                    Line37_Total.innerHTML = "$" + Line37_Total.innerHTML;
                    document.getElementById('<%=hdn_Line37_Total.ClientID %>').value = Line37_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line37_Total.ClientID %>').value = Line37_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine38(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 2.62;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line38_Total = document.getElementById('<%=txt_Line38_Total.ClientID %>');
                Line38_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line38_Total.innerHTML);
                num = num.toFixed(2);
                Line38_Total.innerHTML = num;
                Line38_Total.innerHTML = "$" + Line38_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line38_Total.innerHTML = Qty * CostUnit;

                    var num = parseFloat(Line38_Total.innerHTML);
                    num = num.toFixed(2);
                    Line38_Total.innerHTML = num;
                    Line38_Total.innerHTML = "$" + Line38_Total.innerHTML;
                    document.getElementById('<%=hdn_Line38_Total.ClientID %>').value = Line38_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line38_Total.ClientID %>').value = Line38_Total.innerHTML;
            }
        }
        
    </script>

</body>
</html>
