<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Act129_II_PPL_InvoicePage1.aspx.cs"
    Inherits="PPLAudit_Act129_II_PPL_InvoicePage1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PPL Invoice Page1</title>
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
                <div class="head_right">
                    <div class="top_icons">
                        <ul>
                            <li><a href="../Home.aspx" class="home" title="Home"></a></li>
                            <li>
                                <asp:LinkButton ID="LnkAudit" runat="server" CssClass="audit" title="Audit" OnClick="LnkAudit_Click"></asp:LinkButton></li>
                        </ul>
                    </div>
                </div>
                <div class="head_link">
                    <a href="../Admin/Admin_Login.aspx">Administer Database</a> |
                    <asp:LinkButton ID="lnkLogin" runat="server" Text="Logout" OnClick="lnkLogin_Click"></asp:LinkButton><%--OnClick="lnkLogin_Click"--%>
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
                    <div id="Div1" class="right_text" runat="server">
                        Go to page: <a class="active" href="Act129_II_PPL_InvoicePage1.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                            1</a> <a href="Act129_II_PPL_InvoicePage2.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                2</a> <a href="Act129_II_PPL_InvoicePage3.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                                    3</a>
                    </div>
                    <div id="Div2" class="top_text" runat="server">
                        <span class="txt_orng" id="spann_final" runat="server">**** FINALIZED PPL Invoice *****</span>
                        <span class="txt_orng" style="display: none;">Job Number: <span id="JobNumber2" runat="server">
                        </span>Page # 1</span>
                    </div>
                    <div id="Div3" class="top_invoicelinks" runat="server">
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
                                    <td colspan="12" style="background: rgb(211, 211, 211)">
                                        <h3>
                                            INSTRUCTIONS:</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12" bgcolor="#efefef">
                                        <div class="equle_tab">
                                            <p>
                                                If column <strong>S/C= S</strong> (Measures with the cost per unit provided),enter
                                                the numbers of units installed in the <strong>Qty</strong> column. <strong><i>NO LAND
                                                    LORD CONSENT-Provide Energy Education CFL,S and test the Refrigerator if owned by
                                                    customer</i></strong> Multiply <strong>Qty * Cost Per Unit</strong> and enter
                                                in the <strong>TOTAL</strong> column.</p>
                                            <p>
                                                If column <strong>S/C= C</strong> (Special Measures with no contract price), enter
                                                the measure description in the <strong>MEASURE DESCRIPTION</strong> column, the
                                                type of unit in the <strong>UNIT</strong> column and the number of units installed
                                                in the <strong>Qty</strong> column. DO NOT FORGET TO ENTER THE <strong>CATEGORY</strong>
                                                AND THE <strong>LIURP CODE</strong> IN THE APPROPRIATE COLUMNS. Enter the total
                                                hours to complete the measure in the <strong>THW</strong> column using the decimal
                                                equivalents for partial hours. Enter the cost of all materials used in the <strong>TMC</strong>
                                                column. For custom measures only, the Labor Rate for 1 worker is $45 per hour, for
                                                2 worker is $70.00 per hour. Circle or highlight the appropriate rate in the <strong>
                                                    Labor Rate</strong> column. To calculate the <strong>TOTAL</strong> column,
                                                multiply <strong>THW *</strong> the circled <strong>Labor Rate</strong> then add
                                                the <strong>TMC</strong>. Enter the result in the <strong>TOTAL</strong> column.
                                            </p>
                                            <p>
                                                If column <strong>S/C= SC</strong> (Contract Measures whose LIURP Code is the same
                                                as that for the R-value of the insulation used), enter the number of units installed
                                                in the <strong>Qty</strong> column. Multiply <strong>Qty * Cost Per Unit</strong>
                                                and enter in the <strong>TOTAL</strong> column. <i>(The number in Italics besides each
                                                    of these measures are for CACLV use only.)</i></p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
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
                                        <strong>ADMIN</strong>
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        Cancellation Charge - Involving Site Visit
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line1_CostUnit" runat="server" Text="70.00"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        Cancellation Charge - No Site Visit
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line2_CostUnit" runat="server" Text="40.00"></asp:Label>
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
                                        <asp:TextBox ID="txt_Line3_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        Travel Mile
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        0.555
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line3_CostUnit" runat="server" Text="0.555"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        TravelMileage charge above 30 miles
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line4_CostUnit" runat="server" Text="30.00"></asp:Label>
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
                                        <asp:TextBox ID="txt_Line5_Old_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_Old_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine5OldCode()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_Old_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_Old_SC" runat="server" class="txt_val" onkeyup="CalculateLine5OldSC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_Old_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_Old_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine5OldLaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_Old_THW" runat="server" class="txt_thw" onkeyup="CalculateLine5OldTHW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_Old_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine5OldTMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line5_Old_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line5_Old_Qty" runat="server" class="txt_val" onkeyup="CalculateLine5Old(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line5_Old_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line5_Old_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>AUDIT</strong>
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        Baseload Audit(and verify HWH Type)
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line5_CostUnit" runat="server" Text="50.00"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        Baseload Energy Education
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line6_CostUnit" runat="server" Text="25.00"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        Electric HWH assesment in conjunction wiyh Baseload only
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line7_CostUnit" runat="server" Text="15.00"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        Appliance Monitoring
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line8_CostUnit" runat="server" Text="10.00"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        CAZ
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line9_CostUnit" runat="server" Text="45.00"></asp:Label>
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
                                        <asp:TextBox ID="txt_Line10_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine10Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_SC" runat="server" class="txt_val" onkeyup="CalculateLine10SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine10LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_THW" runat="server" class="txt_thw" onkeyup="CalculateLine10THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine10TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line10_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line10_Qty" runat="server" class="txt_val" onkeyup="CalculateLine10(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line10_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line10_Total" runat="server" />
                                    </td>
                                </tr>
                                <%-- <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine11Code()"
                                            Style="text-align: center;" onblur="CalculateLine11Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_SC" runat="server" class="txt_val" onkeyup="CalculateLine11SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine11LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_THW" runat="server" class="txt_thw" onkeyup="CalculateLine11THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine11TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line11_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line11_Qty" runat="server" class="txt_val" onkeyup="CalculateLine11(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line11_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line11_Total" runat="server" />
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td>
                                        <strong>APP/LIGHTING</strong>
                                    </td>
                                    <td align="center">
                                        76
                                    </td>
                                    <td>
                                        Air Conditioner - 5000/6000 BTU
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line12_CostUnit" runat="server" Text="445.00"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        76
                                    </td>
                                    <td>
                                        Air Conditioner - 8000 BTU
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line13_CostUnit" runat="server" Text="545.00"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        76
                                    </td>
                                    <td>
                                        Air Conditioner - 10000 BTU
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line14_CostUnit" runat="server" Text="595.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line14_Qty" runat="server" class="txt_val" onkeyup="CalculateLine14(this.id)"
                                            onblur="CalculateLine14(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line14_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line14_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        76
                                    </td>
                                    <td>
                                        Air Conditioner - 12000 BTU
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line15_CostUnit" runat="server" Text="645.00"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        76
                                    </td>
                                    <td>
                                        Wall A/C
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        70
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line16_CostUnit" runat="server" Text="670.00"></asp:Label>
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
                                        <asp:TextBox ID="txt_Line17_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_LIURP" runat="server" class="txt_val" Text="77" onkeyup="CalculateLine17Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        Change other Appliance
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_SC" runat="server" class="txt_val" onkeyup="CalculateLine17SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine17LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_THW" runat="server" class="txt_thw" onkeyup="CalculateLine17THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine17TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line17_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - Candle Base
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line18_CostUnit" runat="server" Text="9.79"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line18_Qty" runat="server" class="txt_val" onkeyup="CalculateLine18(this.id)"
                                            onblur="CalculateLine18(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line18_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line18_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - Mini
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line19_CostUnit" runat="server" Text="7.79"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line19_Qty_Speciality" runat="server" class="txt_val" onkeyup="CalculateLine19(this.id)"
                                            onblur="CalculateLine19(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line19_Total_Speciality" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line19_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - Outdoor
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line20_CostUnit" runat="server" Text="19.79"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL Three way
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line21_CostUnit" runat="server" Text="10.99"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - Torceire Lamp
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line22_CostUnit" runat="server" Text="75.99"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - Sperial
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line23_CostUnit" runat="server" Text="8.59"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - Dimmable
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line24_CostUnit" runat="server" Text="12.59"></asp:Label>
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
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - Dimkmable - R - 30
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line25_CostUnit" runat="server" Text="8.59"></asp:Label>
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
                                        <asp:TextBox ID="txt_Line26_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_LIURP" runat="server" class="txt_val" Text="78" onkeyup="CalculateLine26Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        CFL - Cold Cathode
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_SC" runat="server" class="txt_val" onkeyup="CalculateLine26SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine26LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_THW" runat="server" class="txt_thw" onkeyup="CalculateLine26THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine26TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line26_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - R-20
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line27_CostUnit" runat="server" Text="9.39"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line27_Qty" runat="server" class="txt_val" onkeyup="CalculateLine27(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line27_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line27_Total" runat="server" />
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
        //----------------------------------------


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
        //----------------------------------------


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
        //----------------------------------------


        function CalculateLine4(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';

            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = document.getElementById('<%=lbl_Line4_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line4_CostUnit.ClientID %>').innerHTML;
                }

                if (isNaN(Qty)) {
                    Qty = 0;
                    alert('Please enter valid quantity');
                }

                if (isNaN(CostUnit)) {
                    CostUnit = 0;
                    alert('Please enter valid Cost Per Unit.');
                }
                var Line4_Total = document.getElementById('<%=txt_Line4_Total.ClientID %>');
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
        //----------------------------------------


        function CalculateLine5OldLaborRate() {
            var len = document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine5OldTHW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line5_Old_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line5_Old_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line5_Old_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line5_Old_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine5Old();
            }
        }


        function CalculateLine5OldTMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line5_Old_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line5_Old_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line5_Old_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line5_Old_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine5Old();
            }
        }



        function CalculateLine5OldSC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line5_Old_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line5_Old_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line5_Old_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line5_Old_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line5_Old_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine5OldCode() {
            if (document.getElementById('<%=txt_Line5_Old_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line5_Old_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line5_Old_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line5_Old_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line5_Old_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line5_Old_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line5_Old_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line5_Old_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line5_Old_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line5_Old_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line5_Old_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line5_Old_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line5_Old_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line5_Old_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line5_Old_Qty.ClientID %>').value = Qty;

                    var Line5_Old_Total = document.getElementById('<%=txt_Line5_Old_Total.ClientID %>');
                    Line5_Old_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line5_Old_Total.innerHTML = "$" + Line5_Old_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line5_Old_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line5_Old_Total.innerHTML = "$" + Line5_Old_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine5Old() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line5_Old_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line5_Old_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line5_Old_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line5_Old_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line5_Old_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line5_Old_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line5_Old_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line5_Old_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line5_Old_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line5_Old_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line5_Old_Qty.ClientID %>').value = '';
                        }
                        var Line5_Old_Total = document.getElementById('<%=txt_Line5_Old_Total.ClientID %>');
                        Line5_Old_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line5_Old_Total.innerHTML);
                        num = num.toFixed(2);
                        Line5_Old_Total.innerHTML = num;
                        Line5_Old_Total.innerHTML = "$" + Line5_Old_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line5_Old_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line5_Old_Total.innerHTML);
                            num = num.toFixed(2);
                            Line5_Old_Total.innerHTML = num;
                            Line5_Old_Total.innerHTML = "$" + Line5_Old_Total.innerHTML;
                            document.getElementById('<%=hdn_Line5_Old_Total.ClientID %>').value = Line5_Old_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line5_Old_Total.ClientID %>').value = Line5_Old_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------




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
        //----------------------------------------



        function CalculateLine6(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';

            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = document.getElementById('<%=lbl_Line6_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line6_CostUnit.ClientID %>').innerHTML;
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
        //----------------------------------------



        function CalculateLine7(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';

            }
            else {
                var Qty = document.getElementById(ID).value;
                var CostUnit = document.getElementById('<%=lbl_Line7_CostUnit.ClientID %>').outerText;

                // Checking for Fire Fox
                var val = navigator.userAgent.toLowerCase();
                if (val.indexOf("firefox") > -1) {
                    CostUnit = document.getElementById('<%=lbl_Line7_CostUnit.ClientID %>').innerHTML;
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
        //----------------------------------------



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
        //----------------------------------------




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
        //----------------------------------------




        function CalculateLine10LaborRate() {
            var len = document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine10THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line10_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line10_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line10_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line10_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine10();
            }
        }


        function CalculateLine10TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line10_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line10_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line10_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line10_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine10();
            }
        }



        function CalculateLine10SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line10_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line10_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line10_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line10_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line10_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine10Code() {
            if (document.getElementById('<%=txt_Line10_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line10_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line10_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line10_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line10_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line10_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line10_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line10_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line10_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line10_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line10_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line10_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line10_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line10_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line10_Qty.ClientID %>').value = Qty;

                    var Line10_Total = document.getElementById('<%=txt_Line10_Total.ClientID %>');
                    Line10_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line10_Total.innerHTML = "$" + Line10_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line10_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line10_Total.innerHTML = "$" + Line10_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine10() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line10_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line10_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line10_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line10_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line10_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line10_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line10_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line10_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line10_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line10_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line10_Qty.ClientID %>').value = '';
                        }
                        var Line10_Total = document.getElementById('<%=txt_Line10_Total.ClientID %>');
                        Line10_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line10_Total.innerHTML);
                        num = num.toFixed(2);
                        Line10_Total.innerHTML = num;
                        Line10_Total.innerHTML = "$" + Line10_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line10_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line10_Total.innerHTML);
                            num = num.toFixed(2);
                            Line10_Total.innerHTML = num;
                            Line10_Total.innerHTML = "$" + Line10_Total.innerHTML;
                            document.getElementById('<%=hdn_Line10_Total.ClientID %>').value = Line10_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line10_Total.ClientID %>').value = Line10_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------







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
        //----------------------------------------



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
        //----------------------------------------






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
        //----------------------------------------




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
        //----------------------------------------




        function CalculateLine16(ID) {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById(ID).value = '';

            }
            else {
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
        //----------------------------------------





        function CalculateLine17LaborRate() {
            var len = document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
            if (document.getElementById('<%=txt_Line17_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line17_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line17_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line17_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line17_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line17_LIURP.ClientID %>').readonly = true;
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
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line17_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line17_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line17_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line17_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line17_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line17_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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


        //----------------------------------------




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
        //----------------------------------------



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
                var Line19_Total = document.getElementById('<%=txt_Line19_Total_Speciality.ClientID %>');
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
        //----------------------------------------





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
        //----------------------------------------




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
        //----------------------------------------



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
        //----------------------------------------


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
        //----------------------------------------




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
        //----------------------------------------



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
        //----------------------------------------





        function CalculateLine26LaborRate() {
            var len = document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
            if (document.getElementById('<%=txt_Line26_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line26_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line26_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line26_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line26_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line26_LIURP.ClientID %>').readonly = true;
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
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line26_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line26_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line26_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line26_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line26_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line26_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
                        document.getElementById('<%=hdn_Line26_Total.ClientID %>').value = Line26_Total.innerHTML;
                    }
                }
            }
        }


        //----------------------------------------




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
        //----------------------------------------

        
    </script>

</body>
</html>
