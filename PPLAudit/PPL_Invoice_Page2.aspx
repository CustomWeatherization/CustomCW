<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PPL_Invoice_Page2.aspx.cs"
    Inherits="PPLAudit_PPL_Invoice_Page2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PPL Invoice Page2</title>
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
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
                        Go to page: <a href="PPL_Invoice_Page1.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                            1</a> <a class="active" href="PPL_Invoice_Page2.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                2</a> <a href="PPL_Invoice_Page3.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                    3</a> <a href="PPL_Invoice_Page4.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                        4</a> <a href="PPLInvoicePage5.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                            5</a>
                    </div>
                    <div class="top_text" runat="server">
                        <span class="txt_orng" id="spann_final" runat="server">**** FINALIZED PPL Invoice *****</span>
                        <span class="txt_orng" style="display: none;">Job Number: <span id="JobNumber2" runat="server">
                        </span>Page # 2</span>
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
                                        <asp:TextBox ID="txt_Line1Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td rowspan="6" bgcolor="#CCCCCC" align="center">
                                        Use these items when the R value of the insulation used to complete the work is
                                        R-8.
                                    </td>
                                    <td align="center">
                                        43
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
                                        <asp:Label ID="lbl_Line1_CostUnit" runat="server" Text="0.08"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line1_Qty" runat="server" class="txt_val" onkeyup="CalculateLine1(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line1_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line1_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line2Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        43
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
                                        <asp:Label ID="lbl_Line2_CostUnit" runat="server" Text="7.75"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line2_Qty" runat="server" class="txt_val" onkeyup="CalculateLine2(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line2_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line2_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line3Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        43
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
                                        <asp:Label ID="lbl_Line3_CostUnit" runat="server" Text="4.82"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line3_Qty" runat="server" class="txt_val" onkeyup="CalculateLine3(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line3_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line3_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line4Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        43
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
                                        <asp:Label ID="lbl_line4_CostUnit" runat="server" Text="46.28"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line4_Qty" runat="server" class="txt_val" onkeyup="CalculateLine4(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line4_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line4_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line5Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        43
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
                                        <asp:Label ID="lbl_Line5_CostUnit" runat="server" Text="4.62"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line5_Qty" runat="server" class="txt_val" onkeyup="CalculateLine5(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line5_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line5_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line6Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        43
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
                                        <asp:Label ID="lbl_line6_CostUnit" runat="server" Text="8.34"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line6_Qty" runat="server" class="txt_val" onkeyup="CalculateLine6(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line6_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line6_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line7Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td rowspan="8" bgcolor="#CCCCCC">
                                        Use these items when the R value of the insulation used to complete the work is
                                        R-19.
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td>
                                        Attic - Blown Insulation R-19
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Cu. Ft
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
                                        <asp:Label ID="lbl_line7_CostUnit" runat="server" Text="0.89"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line7_Qty" runat="server" class="txt_val" onkeyup="CalculateLine7(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line7_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line7_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line8Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td>
                                        Attic - Flat Roof/Ceiling/Closed Blow:Blow to R-19
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Cu. Ft
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
                                        <asp:Label ID="lbl_Line8_CostUnit" runat="server" Text="0.73"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line8_Qty" runat="server" class="txt_val" onkeyup="CalculateLine8(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line8_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line8_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line9Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td>
                                        Other:Wet Spray Cellulose Adder
                                    </td>
                                    <td align="center">
                                        SC
                                    </td>
                                    <td align="center">
                                        Cu. Ft
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
                                        <asp:Label ID="lbl_Line9_CostUnit" runat="server" Text="0.08"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line9_Qty" runat="server" class="txt_val" onkeyup="CalculateLine9(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line9_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line9_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line10Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        45
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
                                        <asp:Label ID="lbl_Line10_CostUnit" runat="server" Text="7.75"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line10_Qty" runat="server" class="txt_val" onkeyup="CalculateLine10(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line10_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line10_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line11Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td>
                                        Strip Cut Floor To Blow Insulation(Hrs per Unit=0.112, Mtl per Unit=0.00)
                                    </td>
                                    <td align="center">
                                        SC
                                    </td>
                                    <td align="center">
                                        Sq. Ft.Ft.
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
                                        <asp:Label ID="lbl_Line11_CostUnit" runat="server" Text="4.82"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line11_Qty" runat="server" class="txt_val" onkeyup="CalculateLine11(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line11_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line11_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line12Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td>
                                        Make/Cut access cut in dry wall (Hrs per Unit=0.96, Mtl per Unit=5)
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
                                        <asp:Label ID="lbl_Line12_CostUnit" runat="server" Text="46.28"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line12_Qty" runat="server" class="txt_val" onkeyup="CalculateLine12(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line12_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line12_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line13Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td>
                                        Drill 6" hole in wall: cap (Hrs per Unit=0.04, Mtl per Unit=2.9)
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
                                        <asp:Label ID="lbl_Line13_CostUnit" runat="server" Text="4.62"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line13_Qty" runat="server" class="txt_val" onkeyup="CalculateLine13(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line13_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line13_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line14Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td>
                                        Drill 6" hole in wall: plaug & 1st coat spackle (Hrs per Unit=0.112, Mtl per Unit=3.52)
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
                                        <asp:Label ID="lbl_Line14_CostUnit" runat="server" Text="8.34"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line14_Qty" runat="server" class="txt_val" onkeyup="CalculateLine14(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line14_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line14_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line15Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td rowspan="7" bgcolor="#CCCCCC" align="center">
                                        Use these items when the R value of the insulation used to complete the work is
                                        R-24.
                                    </td>
                                    <td align="center">
                                        47
                                    </td>
                                    <td>
                                        Attic - Flat Roof / Ceiling / Closed Blow: Blow to R-24
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
                                        <asp:Label ID="lbl_Line15_CostUnit" runat="server" Text="1.38"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line15_Qty" runat="server" class="txt_val" onkeyup="CalculateLine15(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line15_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line15_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line16Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        47
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
                                        <asp:Label ID="lbl_Line16_CostUnit" runat="server" Text="0.08"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line16_Qty" runat="server" class="txt_val" onkeyup="CalculateLine16(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line16_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line16_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line17Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        47
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
                                        <asp:Label ID="lbl_Line17_CostUnit" runat="server" Text="7.75"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line17_Qty" runat="server" class="txt_val" onkeyup="CalculateLine17(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line17_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line17_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line18Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        47
                                    </td>
                                    <td>
                                        Strip Cut Floor To Blow Insulation(Hrs per Unit=0.112, Mtl per Unit=0.00)
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
                                        <asp:Label ID="lbl_Line18_CostUnit" runat="server" Text="4.82"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line18_Qty" runat="server" class="txt_val" onkeyup="CalculateLine18(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line18_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line18_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line19Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        47
                                    </td>
                                    <td>
                                        Make/Cut access cut in dry wall (Hrs per Unit=0.96, Mtl per Unit=5)
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
                                        <asp:Label ID="lbl_Line19_CostUnit" runat="server" Text="46.28"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line19_Qty" runat="server" class="txt_val" onkeyup="CalculateLine19(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line19_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line19_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line20Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        47
                                    </td>
                                    <td>
                                        Drill 6" hole in wall: cap (Hrs per Unit=0.04, Mtl per Unit=2.9)
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
                                        <asp:Label ID="lbl_Line20_CostUnit" runat="server" Text="4.62"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line20_Qty" runat="server" class="txt_val" onkeyup="CalculateLine20(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line20_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line20_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line21Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        47
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
                                        <asp:Label ID="lbl_Line21_CostUnit" runat="server" Text="8.34"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line21_Qty" runat="server" class="txt_val" onkeyup="CalculateLine21(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line21_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line21_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line22Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td rowspan="7" bgcolor="#CCCCCC" align="center">
                                        Use these items when the R value of the insulation used to complete the work is
                                        R-27.
                                    </td>
                                    <td align="center">
                                        48
                                    </td>
                                    <td>
                                        Attic - Blown Insulation to R-27 - Open Blow
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
                                        <asp:Label ID="lbl_Line22_CostUnit" runat="server" Text="1.14"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line22_Qty" runat="server" class="txt_val" onkeyup="CalculateLine22(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line22_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line22_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line23Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        48
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
                                        <asp:Label ID="lbl_Line23_CostUnit" runat="server" Text="0.08"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line23_Qty" runat="server" class="txt_val" onkeyup="CalculateLine23(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line23_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line23_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line24Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        48
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
                                        <asp:Label ID="lbl_Line24_CostUnit" runat="server" Text="7.75"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line24_Qty" runat="server" class="txt_val" onkeyup="CalculateLine24(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line24_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line24_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line25Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        48
                                    </td>
                                    <td>
                                        Strip Cut Floor To Blow Insulation(Hrs per Unit=0.112, Mtl per Unit=0.00)
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
                                        <asp:Label ID="lbl_Line25_CostUnit" runat="server" Text="4.82"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line25_Qty" runat="server" class="txt_val" onkeyup="CalculateLine25(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line25_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line25_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line26Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        48
                                    </td>
                                    <td>
                                        Make/Cut access cut in dry wall (Hrs per Unit=0.96, Mtl per Unit=5)
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
                                        <asp:Label ID="lbl_Line26_CostUnit" runat="server" Text="46.28"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line26_Qty" runat="server" class="txt_val" onkeyup="CalculateLine26(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line26_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line26_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line27Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        48
                                    </td>
                                    <td>
                                        Drill 6" hole in wall: cap (Hrs per Unit=0.04, Mtl per Unit=2.9)
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
                                        <asp:Label ID="lbl_Line27_CostUnit" runat="server" Text="4.62"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line27_Qty" runat="server" class="txt_val" onkeyup="CalculateLine27(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line27_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line27_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line28Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        48
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
                                        <asp:Label ID="lbl_Line28_CostUnit" runat="server" Text="8.34"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line28_Qty" runat="server" class="txt_val" onkeyup="CalculateLine28(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line28_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line28_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line29Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td rowspan="8" bgcolor="#CCCCCC" align="center">
                                        Use these items when the R value of the insulation used to complete the work is
                                        R-30.
                                    </td>
                                    <td align="center">
                                        49
                                    </td>
                                    <td>
                                        Attic - Blown Insulation R-30 - Open Blow
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
                                        <asp:Label ID="lbl_Line29_CostUnit" runat="server" Text="1.37"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line29_Qty" runat="server" class="txt_val" onkeyup="CalculateLine29(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line29_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line29_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line30Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        49
                                    </td>
                                    <td>
                                        Attic - Flat Roof/Ceiling/Closed Blow: Blow to R-30
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
                                        <asp:Label ID="lbl_Line30_CostUnit" runat="server" Text="1.66"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line30_Qty" runat="server" class="txt_val" onkeyup="CalculateLine30(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line30_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line30_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line31Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        49
                                    </td>
                                    <td>
                                        Other:Wet Spray Cellulose Adder
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
                                        <asp:Label ID="lbl_Line31_CostUnit" runat="server" Text="0.08"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line31_Qty" runat="server" class="txt_val" onkeyup="CalculateLine31(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line31_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line31_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line32Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        49
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
                                        <asp:Label ID="lbl_Line32_CostUnit" runat="server" Text="7.75"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line32_Qty" runat="server" class="txt_val" onkeyup="CalculateLine32(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line32_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line32_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line33Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        49
                                    </td>
                                    <td>
                                        Strip Cut Floor To Blow Insulation(Hrs per Unit=0.112, Mtl per Unit=0.00)
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
                                        <asp:Label ID="lbl_Line33_CostUnit" runat="server" Text="4.82"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line33_Qty" runat="server" class="txt_val" onkeyup="CalculateLine33(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line33_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line33_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line34Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        49
                                    </td>
                                    <td>
                                        Make/Repair access cut in dry wall (Hrs per Unit=0.96, Mtl per Unit=5)
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
                                        <asp:Label ID="lbl_Line34_CostUnit" runat="server" Text="46.28"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line34_Qty" runat="server" class="txt_val" onkeyup="CalculateLine34(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line34_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line34_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line35Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        49
                                    </td>
                                    <td>
                                        Drill 6" hole in wall: cap (Hrs per Unit=0.04, Mtl per Unit=2.9)
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
                                        <asp:Label ID="lbl_Line35_CostUnit" runat="server" Text="4.62"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line35_Qty" runat="server" class="txt_val" onkeyup="CalculateLine35(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line35_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line35_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line36Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        49
                                    </td>
                                    <td>
                                        Drill 6" hole in wall: plaug & 1st coat spackle (Hrs per Unit=0.112, Mtl per Unit=3.52)
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
                                        <asp:Label ID="lbl_Line36_CostUnit" runat="server" Text="8.34"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line36_Qty" runat="server" class="txt_val" onkeyup="CalculateLine36(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line36_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line36_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line37Location" runat="server" class="txt_hour"></asp:TextBox>
                                    </td>
                                    <td>
                                        Attic
                                    </td>
                                    <td align="center">
                                        50
                                    </td>
                                    <td>
                                        Attic - Open Blow Insulation R-38
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
                                        <asp:Label ID="lbl_Line37_CostUnit" runat="server" Text="1.67"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line37_Qty" runat="server" class="txt_val" onkeyup="CalculateLine37(this.id)"></asp:TextBox>
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
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = document.getElementById('<%=lbl_Line1_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line1_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line2_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line2_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line3_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line3_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%= lbl_line4_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%= lbl_line4_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line5_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line5_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_line6_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_line6_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_line7_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_line7_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line8_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line8_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line9_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line9_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line10_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line10_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line11_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line11_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line12_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line12_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line13_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line13_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line14_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line14_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line15_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line15_CostUnit.ClientID %>').innerHTML;
                }

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

            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {//For Multiply the Values and assign it to Total Coulmn
                var Qty = document.getElementById(ID).value;
                var CostUnit = document.getElementById('<%=lbl_Line16_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line16_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line17_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line17_CostUnit.ClientID %>').innerHTML;
                }

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
                if (val.indexOf("firefox") > -1) {
                    Line17_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line17_Total.innerHTML);
                    num = num.toFixed(2);
                    Line17_Total.innerHTML = num;
                    Line17_Total.innerHTML = "$" + Line17_Total.innerHTML;
                    document.getElementById('<%=hdn_Line17_Total.ClientID %>').value = Line17_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line17_Total.ClientID %>').value = Line17_Total.innerHTML;
            }
        }
        //------------------------------------------------
        function CalculateLine18(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';
            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = document.getElementById('<%=lbl_Line18_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line18_CostUnit.ClientID %>').innerHTML;
                }

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line18_Total = document.getElementById('<%=txt_Line18_Total.ClientID %>');
                Line18_Total.innerHTML = Qty * CostUnit;

                var num = parseFloat(Line18_Total.innerHTML);
                num = num.toFixed(2);
                Line18_Total.innerHTML = num;
                Line18_Total.innerHTML = "$" + Line18_Total.innerHTML;
                if (val.indexOf("firefox") > -1) {
                    Line18_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line18_Total.innerHTML);
                    num = num.toFixed(2);
                    Line18_Total.innerHTML = num;

                    Line18_Total.innerHTML = "$" + Line18_Total.innerHTML;
                    document.getElementById('<%=hdn_Line18_Total.ClientID %>').value = Line18_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line18_Total.ClientID %>').value = Line18_Total.innerHTML;
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
                var CostUnit = document.getElementById('<%=lbl_Line19_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line19_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line20_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line20_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line21_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line21_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line22_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line22_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line23_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line23_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line24_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line24_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line25_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line25_CostUnit.ClientID %>').innerHTML;
                }

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
                if (val.indexOf("firefox") > -1) {
                    Line25_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line25_Total.innerHTML);
                    num = num.toFixed(2);
                    Line25_Total.innerHTML = num;
                    Line25_Total.innerHTML = "$" + Line25_Total.innerHTML;
                    document.getElementById('<%=hdn_Line25_Total.ClientID %>').value = Line25_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line25_Total.ClientID %>').value = Line25_Total.innerHTML;
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
                var CostUnit = document.getElementById('<%=lbl_Line26_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line26_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line27_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line27_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line28_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line28_CostUnit.ClientID %>').innerHTML;
                }

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
                if (val.indexOf("firefox") > -1) {
                    Line28_Total.innerHTML = Qty * CostUnit;
                    var num = parseFloat(Line28_Total.innerHTML);
                    num = num.toFixed(2);
                    Line28_Total.innerHTML = num;
                    Line28_Total.innerHTML = "$" + Line28_Total.innerHTML;
                    document.getElementById('<%=hdn_Line28_Total.ClientID %>').value = Line28_Total.innerHTML;
                }
                document.getElementById('<%=hdn_Line28_Total.ClientID %>').value = Line28_Total.innerHTML;
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
                var CostUnit = document.getElementById('<%=lbl_Line29_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line29_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line30_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line30_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line31_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line31_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line32_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line32_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line33_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line33_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line34_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line34_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line35_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line35_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line36_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line36_CostUnit.ClientID %>').innerHTML;
                }

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
                var CostUnit = document.getElementById('<%=lbl_Line37_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line37_CostUnit.ClientID %>').innerHTML;
                }

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
