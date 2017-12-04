<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PPL_Invoice_Page3.aspx.cs"
    Inherits="PPLAudit_PPL_Invoice_Page3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PPL Invoice Page3</title>
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
        <%--text-decoration: underline;
            font-weight: bold;--%>
        <div class="fix_div">
            <!-- header -->
            <div class="header">
                <div class="logo_div">
                    <a href="../Home.aspx">
                        <img src="../images/logo.jpg" /></a></div>
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
                    <div class="right_text" runat="server">
                        Go to page <a href="PPL_Invoice_Page1.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                            1</a> <a href="PPL_Invoice_Page2.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                2</a> <a href="PPL_Invoice_Page3.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>"
                                    class="active">3</a> <a href="PPL_Invoice_Page4.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                        4</a> <a href="PPLInvoicePage5.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                            5</a>
                    </div>
                    <div class="top_text" runat="server">
                        <span class="txt_orng" id="spann_final" runat="server">**** FINALIZED PPL Invoice *****</span>
                        <span class="txt_orng" style="display: none;">Job Number: <span id="JobNumber2" runat="server">
                        </span>Page # 3</span>
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
                    <!-- Sudhanshu end -->
                    <!-- inv_table end -->
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
                                        <strong>ATTIC</strong>
                                    </td>
                                    <td align="center">
                                        50
                                    </td>
                                    <td>
                                        Attic - Blown Insulation R-38
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Cu. Ft.
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
                                        1.78
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
                                    <td rowspan="6" bgcolor="#eeeeee" align="center">
                                        Use these items when the R value of the insulation used to complete the work is
                                        R-38.
                                    </td>
                                    <td align="center">
                                        50
                                    </td>
                                    <td>
                                        Other: Wet Spray Cellulose Adder
                                    </td>
                                    <td align="center">
                                        SC
                                    </td>
                                    <td align="center">
                                        Cu. Ft.
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
                                        0.08
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
                                    <td align="center">
                                        50
                                    </td>
                                    <td>
                                        Strip Cut Opening in Roof (Hrs per Unit=0.168, Mtl per Unit=0.528)
                                    </td>
                                    <td align="center">
                                        SC
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
                                        7.75
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
                                    <td align="center">
                                        50
                                    </td>
                                    <td>
                                        Strip Cut floor to blow insulation (Hrs per Unit=0.112, Mtl per Unit=0.00)
                                    </td>
                                    <td align="center">
                                        SC
                                    </td>
                                    <td align="center">
                                        Sq. Ft.
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
                                        4.82
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
                                    <td align="center">
                                        50
                                    </td>
                                    <td>
                                        Make/repair access cut in dry wall (Hrs per Unit=0.96, Mtl per Unit=5.0)
                                    </td>
                                    <td align="center">
                                        SC
                                    </td>
                                    <td align="center">
                                        Sq. Ft.
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
                                        46.28
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
                                    <td align="center">
                                        50
                                    </td>
                                    <td>
                                        Drill 6" hole in wall:cap (Hrs per Unit=0.04, Mtl per Unit=2.9)
                                    </td>
                                    <td align="center">
                                        SC
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
                                        4.62
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
                                    <td align="center">
                                        50
                                    </td>
                                    <td>
                                        Drill 6" hole in wall:plug & 1st coat spackle (Hrs per Unit=0.112, Mtl per Unit=3.52)
                                    </td>
                                    <td align="center">
                                        SC
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
                                        8.34
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
                                        51
                                    </td>
                                    <td>
                                        Attic - Hatch Boxing
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
                                        39.60
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
                                        54
                                    </td>
                                    <td>
                                        Attic - Recessed Lighting Boxing
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
                                        41.23
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
                                        53
                                    </td>
                                    <td>
                                        Attic - Weatherstrip &amp; Construct Rigid Board Insulated Box for Pull PDS
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
                                        73.12
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
                                        C4
                                    </td>
                                    <td>
                                        Attic - Construct
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
                                        52.94
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
                                        57
                                    </td>
                                    <td>
                                        Eve Chutes
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
                                        5.18
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
                                        55
                                    </td>
                                    <td>
                                        Vent - Install Dome Vent
                                    </td>
                                    <td align="center">
                                        <span>S</span>
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
                                        45.51
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
                                        55
                                    </td>
                                    <td>
                                        Vent - Install Louver Design Vents in Attic Window &gt; 2.5 Sq. Ft.
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
                                        47.46
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
                                        55
                                    </td>
                                    <td>
                                        Vent - Install Louver Design Vents in Attic Window &gt; 4 Sq. Ft.
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
                                        57.66
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
                                    </td>
                                    <td align="center">
                                        18
                                    </td>
                                    <td>
                                        Weatherstrip Hatch
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
                                        25.74
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
                                        <asp:TextBox ID="txt_Line17_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_LIURP" runat="server" class="txt_val" onblur="CalculateLine17Code()"
                                            Style="text-align: center" onkeyup="CalculateLine17Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_SC" runat="server" class="small_field" onblur="CalculateLine17SC()"
                                            Style="text-align: center" onkeyup="CalculateLine17SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_Unit" runat="server" class="txt_val" Style="text-align: center"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center" onblur="CalculateLine17LaborRate()" onkeyup="CalculateLine17LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_THW" runat="server" class="txt_thw" onblur="CalculateLine17THW()"
                                            onkeyup="CalculateLine17THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_TMC" runat="server" class="txt_thw" onblur="CalculateLine17TMC()"
                                            onkeyup="CalculateLine17TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line17_Qty" runat="server" class="txt_val" onblur="CalculateLine17()"
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
                                            Style="text-align: center" onkeyup="CalculateLine18Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_SC" runat="server" class="small_field" onblur="CalculateLine18SC()"
                                            Style="text-align: center" onkeyup="CalculateLine18SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_Unit" runat="server" class="txt_val" Style="text-align: center"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center" onblur="CalculateLine18LaborRate()" onkeyup="CalculateLine18LaborRate()"></asp:TextBox>
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
                                            onkeyup="CalculateLine18(this.id)"></asp:TextBox>
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
                                        <strong>DOORS</strong>
                                    </td>
                                    <td align="center">
                                        21
                                    </td>
                                    <td>
                                        Door - Adjust hinges, remove door and shave for threshold installation
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
                                        54.82
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line19_Qty" runat="server" class="txt_val" onblur="CalculateLine19(this.id)"
                                            onkeyup="CalculateLine19(this.id)"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        20
                                    </td>
                                    <td>
                                        Door - Install / Replace Barrel Bolt - 3"
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
                                        8.53
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
                                        20
                                    </td>
                                    <td>
                                        Door - Install / Replace Barrel Bolt - 4"
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
                                        8.53
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
                                        <td align="center">
                                            20
                                        </td>
                                        <td>
                                            Door - Install / Replace Door Stop
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
                                            11.14
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
                                    </td>
                                    <td align="center">
                                        21
                                    </td>
                                    <td>
                                        Door - Install / Replace Threshold
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
                                        27.82
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line23_Qty" runat="server" class="txt_val" onblur="CalculateLine23(this.id)"
                                            onkeyup="CalculateLine23(this.id)"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        22
                                    </td>
                                    <td>
                                        Door - Interior Pre-Hung Wood Door
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
                                        257.74
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line24_Qty" runat="server" class="txt_val" onblur="CalculateLine24(this.id)"
                                            onkeyup="CalculateLine24(this.id)"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        20
                                    </td>
                                    <td>
                                        Door - Replace Exterior Lockset
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
                                        43.38
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line25_Qty" runat="server" class="txt_val" onblur="CalculateLine25(this.id)"
                                            onkeyup="CalculateLine25(this.id)"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        22
                                    </td>
                                    <td>
                                        Door - Replace Solid Wood Door
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
                                        301.50
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line26_Qty" runat="server" class="txt_val" onblur="CalculateLine26(this.id)"
                                            onkeyup="CalculateLine26(this.id)"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        22
                                    </td>
                                    <td>
                                        Door - Replace Steel Door
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
                                        387.50
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line27_Qty" runat="server" class="txt_val" onblur="CalculateLine27(this.id)"
                                            onkeyup="CalculateLine27(this.id)"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        25
                                    </td>
                                    <td>
                                        Door - Weatherstrip - Interior Door
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
                                        37.30
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line28_Qty" runat="server" class="txt_val" onblur="CalculateLine28(this.id)"
                                            onkeyup="CalculateLine28(this.id)"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        17
                                    </td>
                                    <td>
                                        Sweep - Metal Door Install
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
                                        <asp:TextBox ID="txt_Line29_Qty" runat="server" class="txt_val" onblur="CalculateLine29(this.id)"
                                            onkeyup="CalculateLine29(this.id)"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        17
                                    </td>
                                    <td>
                                        Sweep - Wood Door Install
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
                                        17
                                    </td>
                                    <td>
                                        Install Sweep
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
                                        18
                                    </td>
                                    <td>
                                        Weatherstrip - Exterior Door
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
                                        44.06
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
                                        <asp:TextBox ID="txt_Line33_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line33_LIURP" runat="server" class="txt_val" onblur="CalculateLine33Code()"
                                            Style="text-align: center" onkeyup="CalculateLine33Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line33_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line33_SC" runat="server" class="small_field" onblur="CalculateLine33SC()"
                                            Style="text-align: center" onkeyup="CalculateLine33SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line33_Unit" runat="server" class="txt_val" Style="text-align: center"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line33_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center" onblur="CalculateLine33LaborRate()" onkeyup="CalculateLine33LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line33_THW" runat="server" class="txt_thw" onblur="CalculateLine33THW()"
                                            onkeyup="CalculateLine33THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line33_TMC" runat="server" class="txt_thw" onblur="CalculateLine33TMC()"
                                            onkeyup="CalculateLine33TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line33_Qty" runat="server" class="txt_val" onblur="CalculateLine33()"
                                            onkeyup="CalculateLine33()"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_Line34_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_LIURP" runat="server" class="txt_val" onblur="CalculateLine34Code()"
                                            Style="text-align: center" onkeyup="CalculateLine34Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_SC" runat="server" class="small_field" onblur="CalculateLine34SC()"
                                            Style="text-align: center" onkeyup="CalculateLine34SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_Unit" runat="server" class="txt_val" Style="text-align: center"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_LaborRate" runat="server" class="txt_val" Text="43/68"
                                            Style="text-align: center" onblur="CalculateLine34LaborRate()" onkeyup="CalculateLine34LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_THW" runat="server" class="txt_thw" onblur="CalculateLine34THW()"
                                            onkeyup="CalculateLine34THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_TMC" runat="server" class="txt_thw" onblur="CalculateLine34TMC()"
                                            onkeyup="CalculateLine34TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line34_Qty" runat="server" class="txt_val" onblur="CalculateLine34()"
                                            onkeyup="CalculateLine34()"></asp:TextBox>
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
                                        <strong>FLOORS</strong>
                                    </td>
                                    <td align="center">
                                        60
                                    </td>
                                    <td>
                                        Floor/Basement - Faced Batt Fiberglass R-19
                                    </td>
                                    <td align="center">
                                        S
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
                                        1.14
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
                                        59
                                    </td>
                                    <td>
                                        Floor/Basement - Fiberglass R-19
                                    </td>
                                    <td align="center">
                                        S
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
                                        0.92
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
                                        61
                                    </td>
                                    <td>
                                        Floor/Basement - Install Encapsulated R-19 Vented Crawl Space
                                    </td>
                                    <td align="center">
                                        S
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
                                        1.39
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
                            </table>
                        </div>
                    </asp:Panel>
                    <!-- inv_table end -->
                    <!-- Sudhanshu end -->
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

        function CalculateLine1(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            var Qty = document.getElementById(ID).value;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var CostUnit = 1.78;

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
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 0.08;

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
                var CostUnit = 7.75;

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
                var CostUnit = 4.82;

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
                var CostUnit = 46.28;

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
                var CostUnit = 4.62;

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
                var CostUnit = 8.34;

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
                var CostUnit = 39.60;

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
                var CostUnit = 41.23;

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
                var CostUnit = 73.12;

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
                var CostUnit = 52.94;

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
                var CostUnit = 5.18;

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
                var CostUnit = 45.51;

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
                var CostUnit = 47.46;

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
                var CostUnit = 57.66;

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
                var CostUnit = 25.74;

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
                        document.getElementById('<%=hdn_Line17_Total.ClientID %>').value = Line17_Total.innerHTML;

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
        function CalculateLine19(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 54.82;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line19_Total = document.getElementById('<%=txt_Line19_Total.ClientID %>');
                Line19_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line19_Total.innerHTML);
                num = num.toFixed(2);
                Line19_Total.innerHTML = num;
                Line19_Total.innerHTML = "$" + Line19_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line19_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line19_Total.innerHTML);
                    num = num.toFixed(2);
                    Line19_Total.innerHTML = num;
                    Line19_Total.innerHTML = "$" + Line19_Total.innerHTML;
                    document.getElementById('<%=hdn_Line19_Total.ClientID %>').value = Line19_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line19_Total.ClientID %>').value = Line19_Total.innerHTML;
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
                var CostUnit = 8.53;

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
                var CostUnit = 8.53;

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
                var CostUnit = 11.14;

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
        function CalculateLine23(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 27.82;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line23_Total = document.getElementById('<%=txt_Line23_Total.ClientID %>');
                Line23_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line23_Total.innerHTML);
                num = num.toFixed(2);
                Line23_Total.innerHTML = num;
                Line23_Total.innerHTML = "$" + Line23_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line23_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line23_Total.innerHTML);
                    num = num.toFixed(2);
                    Line23_Total.innerHTML = num;
                    Line23_Total.innerHTML = "$" + Line23_Total.innerHTML;
                    document.getElementById('<%=hdn_Line23_Total.ClientID %>').value = Line23_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line23_Total.ClientID %>').value = Line23_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine24(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 257.74;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line24_Total = document.getElementById('<%=txt_Line24_Total.ClientID %>');
                Line24_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line24_Total.innerHTML);
                num = num.toFixed(2);
                Line24_Total.innerHTML = num;
                Line24_Total.innerHTML = "$" + Line24_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line24_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line24_Total.innerHTML);
                    num = num.toFixed(2);
                    Line24_Total.innerHTML = num;
                    Line24_Total.innerHTML = "$" + Line24_Total.innerHTML;
                    document.getElementById('<%=hdn_Line24_Total.ClientID %>').value = Line24_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line24_Total.ClientID %>').value = Line24_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine25(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 43.38;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line25_Total = document.getElementById('<%=txt_Line25_Total.ClientID %>');
                Line25_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line25_Total.innerHTML);
                num = num.toFixed(2);
                Line25_Total.innerHTML = num;
                Line25_Total.innerHTML = "$" + Line25_Total.innerHTML;
                document.getElementById('<%=hdn_Line25_Total.ClientID %>').value = Line25_Total.innerHTML;
                if (val.indexOf("firefox") > -1) {
                    Line25_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line25_Total.innerHTML);
                    num = num.toFixed(2);
                    Line25_Total.innerHTML = num;
                    Line25_Total.innerHTML = "$" + Line25_Total.innerHTML;
                    document.getElementById('<%=hdn_Line25_Total.ClientID %>').value = Line25_Total.innerHTML;
                }


            }
        }
        //------------------------------------------------
        function CalculateLine26(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 301.50;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line26_Total = document.getElementById('<%=txt_Line26_Total.ClientID %>');
                Line26_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line26_Total.innerHTML);
                num = num.toFixed(2);
                Line26_Total.innerHTML = num;
                Line26_Total.innerHTML = "$" + Line26_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line26_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line26_Total.innerHTML);
                    num = num.toFixed(2);
                    Line26_Total.innerHTML = num;
                    Line26_Total.innerHTML = "$" + Line26_Total.innerHTML;
                    document.getElementById('<%=hdn_Line26_Total.ClientID %>').value = Line26_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line26_Total.ClientID %>').value = Line26_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine27(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 387.50;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line27_Total = document.getElementById('<%=txt_Line27_Total.ClientID %>');
                Line27_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line27_Total.innerHTML);
                num = num.toFixed(2);
                Line27_Total.innerHTML = num;
                Line27_Total.innerHTML = "$" + Line27_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line27_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line27_Total.innerHTML);
                    num = num.toFixed(2);
                    Line27_Total.innerHTML = num;
                    Line27_Total.innerHTML = "$" + Line27_Total.innerHTML;
                    document.getElementById('<%=hdn_Line27_Total.ClientID %>').value = Line27_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line27_Total.ClientID %>').value = Line27_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine28(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = 37.30;

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line28_Total = document.getElementById('<%=txt_Line28_Total.ClientID %>');
                Line28_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line28_Total.innerHTML);
                num = num.toFixed(2);
                Line28_Total.innerHTML = num;
                Line28_Total.innerHTML = "$" + Line28_Total.innerHTML;
                document.getElementById('<%=hdn_Line28_Total.ClientID %>').value = Line28_Total.innerHTML;

                if (val.indexOf("firefox") > -1) {
                    Line28_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line28_Total.innerHTML);
                    num = num.toFixed(2);
                    Line28_Total.innerHTML = num;
                    Line28_Total.innerHTML = "$" + Line28_Total.innerHTML;
                    document.getElementById('<%=hdn_Line28_Total.ClientID %>').value = Line28_Total.innerHTML;
                }
            }
        }
        //------------------------------------------------
        function CalculateLine29(ID) {
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
                var Line29_Total = document.getElementById('<%=txt_Line29_Total.ClientID %>');
                Line29_Total.innerHTML = Qty * CostUnit;
                var num = parseFloat(Line29_Total.innerHTML);
                num = num.toFixed(2);
                Line29_Total.innerHTML = num;
                Line29_Total.innerHTML = "$" + Line29_Total.innerHTML;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    Line29_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line29_Total.innerHTML);
                    num = num.toFixed(2);
                    Line29_Total.innerHTML = num;
                    Line29_Total.innerHTML = "$" + Line29_Total.innerHTML;
                    document.getElementById('<%=hdn_Line29_Total.ClientID %>').value = Line29_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line29_Total.ClientID %>').value = Line29_Total.innerHTML;
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
                var CostUnit = 44.06;

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
                document.getElementById('<%=hdn_Line32_Total.ClientID %>').value = Line32_Total.innerHTML;

                if (val.indexOf("firefox") > -1) {
                    Line32_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line32_Total.innerHTML);
                    num = num.toFixed(2);
                    Line32_Total.innerHTML = num;
                    Line32_Total.innerHTML = "$" + Line32_Total.innerHTML;
                    document.getElementById('<%=hdn_Line32_Total.ClientID %>').value = Line32_Total.innerHTML;
                }
            }
        }
        //------------------------------------------------



        function CalculateLine33LaborRate() {
            var len = document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine33THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line33_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line33_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line33_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line33_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine33();
            }
        }


        function CalculateLine33TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line33_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line33_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line33_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line33_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine33();
            }
        }





        function CalculateLine33SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line33_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line33_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line33_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line33_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line33_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine33Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line33_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line33_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line33_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line33_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line33_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line33_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line33_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line33_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line33_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line33_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line33_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line33_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line33_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line33_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line33_Qty.ClientID %>').value = Qty;

                    var Line33_Total = document.getElementById('<%=txt_Line33_Total.ClientID %>');
                    Line33_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line33_Total.innerHTML = "$" + Line33_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line33_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line33_Total.innerHTML = "$" + Line33_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine33() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line33_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line33_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line33_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line33_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line33_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line33_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line33_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line33_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line33_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line33_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line33_Qty.ClientID %>').value = '';
                        }
                        var Line33_Total = document.getElementById('<%=txt_Line33_Total.ClientID %>');
                        Line33_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line33_Total.innerHTML);
                        num = num.toFixed(2);
                        Line33_Total.innerHTML = num;
                        Line33_Total.innerHTML = "$" + Line33_Total.innerHTML;
                        document.getElementById('<%=hdn_Line33_Total.ClientID %>').value = Line33_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line33_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line33_Total.innerHTML);
                            num = num.toFixed(2);
                            Line33_Total.innerHTML = num;
                            Line33_Total.innerHTML = "$" + Line33_Total.innerHTML;
                            document.getElementById('<%=hdn_Line33_Total.ClientID %>').value = Line33_Total.innerHTML;
                        }
                    }
                }
            }
        }

        //------------------------------------------------



        function CalculateLine34LaborRate() {
            var len = document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 43 or 68. ');
                }
                else if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value == '43/68') {
                    alert('Labor Rate can only be 43 or 68. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine34THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line34_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line34_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line34_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line34_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine34();
            }
        }


        function CalculateLine34TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line34_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line34_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line34_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line34_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine34();
            }
        }





        function CalculateLine34SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line34_SC.ClientID %>').readonly = true;

            }
            else {
                var SC = document.getElementById('<%=txt_Line34_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line34_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line34_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line34_SC.ClientID %>').value = '';
                }
            }
        }


        function CalculateLine34Code() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line34_LIURP.ClientID %>').readonly = true;

            }
            else {
                if (document.getElementById('<%=txt_Line34_LIURP.ClientID %>').value == '') {
                    document.getElementById('<%=txt_Line34_THW.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line34_TMC.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line34_Qty.ClientID %>').value = '';
                    document.getElementById('<%=txt_Line34_Total.ClientID %>').value = '';
                }
                else {
                    var THW = document.getElementById('<%=txt_Line34_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line34_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line34_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line34_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line34_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line34_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line34_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line34_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line34_Qty.ClientID %>').value = Qty;

                    var Line34_Total = document.getElementById('<%=txt_Line34_Total.ClientID %>');
                    Line34_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line34_Total.innerHTML = "$" + Line34_Total.innerHTML;


                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line34_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line34_Total.innerHTML = "$" + Line34_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine34() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line34_Qty.ClientID %>').readonly = true;

            }
            else {
                //For Multiply the Values and assign it to Total Coulmn
                if (document.getElementById('<%=txt_Line34_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line34_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line34_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value == '43/68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line34_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value != '43' && document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value != '68') {
                        alert('Labor Rate can only be 43 or 68. ');
                        document.getElementById('<%=txt_Line34_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line34_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line34_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line34_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line34_Qty.ClientID %>').value = '';
                        }
                        var Line34_Total = document.getElementById('<%=txt_Line34_Total.ClientID %>');
                        Line34_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line34_Total.innerHTML);
                        num = num.toFixed(2);
                        Line34_Total.innerHTML = num;
                        Line34_Total.innerHTML = "$" + Line34_Total.innerHTML;
                        document.getElementById('<%=hdn_Line34_Total.ClientID %>').value = Line34_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line34_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line34_Total.innerHTML);
                            num = num.toFixed(2);
                            Line34_Total.innerHTML = num;
                            Line34_Total.innerHTML = "$" + Line34_Total.innerHTML;
                            document.getElementById('<%=hdn_Line34_Total.ClientID %>').value = Line34_Total.innerHTML;
                        }
                    }
                }
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
                var CostUnit = 1.14;

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
                var CostUnit = 0.92;

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
                var CostUnit = 1.39;

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
    </script>

</body>
</html>
