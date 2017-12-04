<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Print_Act129II_Invoice.aspx.cs"
    Inherits="PPLAudit_Print_Act129II_Invoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Custom Weatherization/ Act129II PPL Invoice Page</title>
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        @media print
        {
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
                font-size: 14px;
                font-weight: bold;
                color: #000000;
                text-decoration: underline;
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
            #DivHeader
            {
                display: none;
            }
        
             @page
            {
                padding: 0;
                margin: 0;
            }
            h3
            {
                margin: 5px 0px;
                font-size: 10px;
            }
            p
            {
                margin: 1px 0px;
            }
            input
            {
                text-align: center !important;
                font-size: 10.45px;
            }
            th, tr, td
            {
                padding: 0;
                margin: 0;
            }
            #DivPrint
            {
                font-size: 10px;
            }
            strong
            {
                font-size: 10px !important;
                font-variant: normal !important;
            }
            title
            {
                display: none;
            }
            date
            {
                display: none;
            }
            .divPage
            {
                padding: 2px !important;
                width: 100% !important;
                page-break-after: always;
            }
            .divPage:last-child
            {
                page-break-after: ;;;;}
            td
            {
                border-top: 1px solid #ccc;
                border-left: 1px solid #ccc;
            }
        }
        /*	} */</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="margin: 0 auto; width: 1000px; color: Black; font-size: 13px;" id="fix_div">
            <!-- header -->
            <div id="DivHeader" runat="server" style="height: 68px; padding: 10px 0; border-bottom: 2px solid #ccc;
                margin: 0 0 10px 0;">
                <div style="float: left; width: 250px;">
                    <a href="../Home.aspx">
                        <img src="../images/logo.jpg" alt="" /></a></div>
                <div style="float: left; width: 500px; text-align: center; font-size: 16px; font-weight: bold;
                    color: #464545; margin: 28px 0 0 0;">
                </div>
                <div style="text-align: right; float: right;">
                    <a href="../Admin/Admin_Login.aspx">Administer Database</a>
                    <br />
                    <%-- <input type="button" value="Back" onclick="javascript:window.location='../DisplayJobSearchRecords.aspx?Jobs=<%= Convert.ToString(Request.QueryString["Jobs"])  %>&Utility=<%= Convert.ToString(Request.QueryString["Utility"]) %>'"
                        class="top_btn" /><a href="#" onclick="javascript:Clickheretoprint();" style="text-decoration: none;">
                            <input type="button" value="Print Invoice" class="top_btn" />
                        </a>--%>
                    <input type="button" value="Back" onclick="javascript:window.location='../DisplayJobSearchRecords.aspx?Jobs=<%= Convert.ToString(Request.QueryString["Jobs"])  %>&Utility=<%= Convert.ToString(Request.QueryString["Utility"]) %>'"
                        class="top_btn" /><a href="#" onclick="Hide();" style="text-decoration: none;"><%--javascript:Clickheretoprint();--%>
                            <input type="button" value="Print Invoice" class="top_btn" />
                        </a>
                </div>
            </div>
            <!-- end header -->
            <div style="clear: left;">
            </div>
            <!-- form section -->
            <%--<div id="DivPrint" runat="server">--%>
            <div style="padding: 10px; font-size: 12px; color: #000; text-align: center;" class="Landscape">
                <div style="width: 100%; height: auto; text-align: left;">
                    <%--<div class="main_right">--%>
                    <!--main_right begin-->
                    <!-- form section -->
                    <!-- inv_table begin -->
                    <%-- <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr>
                        <td colspan="3" align="right">
                            <span style="color: #000; text-decoration: none;">**** FINALIZED PPL Invoice *****</span>
                            <span style="color: #f00; text-decoration: none;">Job Number: <span id="JobNumber2"
                                runat="server"></span></span>
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>--%>
                    <div id="DivPrint" runat="server" class="Landscape">
                        <%-----Page 1 Start-----%>
                        <div style="border: 1px solid #B3B3B3; padding: 15px; width: 940px; margin: 0 auto;
                            page-break-after: always; position: relative;">
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
                                                column. For custom measures only, the Labor Rate for 1 worker is $43 per hour, for
                                                2 worker is $68.00 per hour. Circle or highlight the appropriate rate in the <strong>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line1_CostUnit_1" runat="server" Text="70.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line1_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine1(this.id)" onblur="CalculateLine1(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line1_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line2_CostUnit_1" runat="server" Text="40.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line2_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine2(this.id)" onblur="CalculateLine2(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line2_Total_1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line3_CostUnit_1" runat="server" Text="0.555"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line3_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine3(this.id)" onblur="CalculateLine3(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line3_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line4_CostUnit_1" runat="server" Text="30.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line4_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine4(this.id)" onblur="CalculateLine4(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line4_Total_1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_Old_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_Old_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine5OldCode()" onblur="CalculateLine5OldCode()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_Old_MeasureDesc_1" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_Old_SC_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine5OldSC()" onblur="CalculateLine5OldSC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_Old_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_Old_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine5OldLaborRate()"
                                            onblur="CalculateLine5OldLaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_Old_THW_1" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine5OldTHW()" onblur="CalculateLine5OldTHW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_Old_TMC_1" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine5OldTMC()" onblur="CalculateLine5OldTMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line5_Old_CostUnit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line5_Old_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine5Old(this.id)" onblur="CalculateLine5Old(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line5_Old_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line5_CostUnit_1" runat="server" Text="50.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line5_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine5(this.id)" onblur="CalculateLine5(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line5_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line6_CostUnit_1" runat="server" Text="25.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line6_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine6(this.id)" onblur="CalculateLine6(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line6_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line7_CostUnit_1" runat="server" Text="15.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line7_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine7(this.id)" onblur="CalculateLine7(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line7_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line8_CostUnit_1" runat="server" Text="10.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line8_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine8(this.id)" onblur="CalculateLine8(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line8_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line9_CostUnit_1" runat="server" Text="45.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line9_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine9(this.id)" onblur="CalculateLine9(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line9_Total_1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine10Code()" onblur="CalculateLine10Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_MeasureDesc_1" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_SC_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine10SC()" onblur="CalculateLine10SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine10LaborRate()"
                                            onblur="CalculateLine10LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_THW_1" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine10THW()" onblur="CalculateLine10THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_TMC_1" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine10TMC()" onblur="CalculateLine10TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line10_CostUnit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line10_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine10(this.id)" onblur="CalculateLine10(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line10_Total_1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <%--   <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine11Code()" onblur="CalculateLine11Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_MeasureDesc_1" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_SC_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine11SC()" onblur="CalculateLine11SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right; text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine11LaborRate()"
                                            onblur="CalculateLine11LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_THW_1" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine11THW()" onblur="CalculateLine11THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_TMC_1" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine11TMC()" onblur="CalculateLine11TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line11_CostUnit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line11_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine11(this.id)" onblur="CalculateLine11(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line11_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line12_CostUnit_1" runat="server" Text="445.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line12_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine12(this.id)" onblur="CalculateLine12(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line12_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line13_CostUnit_1" runat="server" Text="545.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line13_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine13(this.id)" onblur="CalculateLine13(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line13_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line14_CostUnit_1" runat="server" Text="595.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line14_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine14(this.id)" onblur="CalculateLine14(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line14_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line15_CostUnit_1" runat="server" Text="645.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line15_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine15(this.id)" onblur="CalculateLine15(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line15_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line16_CostUnit_1" runat="server" Text="670.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line16_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine16(this.id)" onblur="CalculateLine16(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line16_Total_1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="77" onkeyup="CalculateLine17Code()"
                                            onblur="CalculateLine17Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        Change other Appliance
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_SC_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine17SC()" onblur="CalculateLine17SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine17LaborRate()"
                                            onblur="CalculateLine17LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_THW_1" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine17THW()" onblur="CalculateLine17THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_TMC_1" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine17TMC()" onblur="CalculateLine17TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line17_CostUnit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line17_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine17(this.id)" onblur="CalculateLine17(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line17_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line18_CostUnit_1" runat="server" Text="9.79"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line18_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine18(this.id)" onblur="CalculateLine18(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line18_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line19_CostUnit_1" runat="server" Text="7.79"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line19_Qty_Speciality_1" runat="server" Style="width: 40px;
                                            border: none; text-align: right;" onkeyup="CalculateLine19(this.id)" onblur="CalculateLine19(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line19_Total_Speciality_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line20_CostUnit_1" runat="server" Text="19.79"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line20_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine20(this.id)" onblur="CalculateLine20(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line20_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line21_CostUnit_1" runat="server" Text="10.99"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line21_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine21(this.id)" onblur="CalculateLine21(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line21_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line22_CostUnit_1" runat="server" Text="75.99"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line22_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine22(this.id)" onblur="CalculateLine22(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line22_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line23_CostUnit_1" runat="server" Text="8.59"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line23_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine23(this.id)" onblur="CalculateLine23(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line23_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line24_CostUnit_1" runat="server" Text="12.59"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line24_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine24(this.id)" onblur="CalculateLine24(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line24_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line25_CostUnit_1" runat="server" Text="8.59"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line25_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine25(this.id)" onblur="CalculateLine25(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line25_Total_1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line26_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="78" onkeyup="CalculateLine26Code()"
                                            onblur="CalculateLine26Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        CFL - Cold Cathode
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_SC_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine26SC()" onblur="CalculateLine26SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine26LaborRate()"
                                            onblur="CalculateLine26LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_THW_1" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine26THW()" onblur="CalculateLine26THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_TMC_1" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine26TMC()" onblur="CalculateLine26TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line26_CostUnit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line26_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine26(this.id)" onblur="CalculateLine26(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line26_Total_1" runat="server"></asp:Label>
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line27_CostUnit_1" runat="server" Text="9.39"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line27_Qty_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine27(this.id)" onblur="CalculateLine27(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line27_Total_1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%-----Page 1 End-----%>
                        <%-----Page 2 Start-----%>
                        <div style="border: 1px solid #B3B3B3; padding: 15px; width: 940px; margin: 0 auto;
                            page-break-after: always; position: relative;">
                            <table width="100%" border="1" cellspacing="0" cellpadding="5">
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
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - R - 30
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line1_CostUnit_2" runat="server" Text="10.19"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line1_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine1(this.id)" onblur="CalculateLine1(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line1_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - R - 40
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line2_CostUnit_2" runat="server" Text="11.79"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line2_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine2(this.id)" onblur="CalculateLine2(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line2_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - Globe
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line3_CostUnit_2" runat="server" Text="10.99"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line3_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine3(this.id)" onblur="CalculateLine3(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line3_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        Medium Base Torpedo
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line4_CostUnit_2" runat="server" Text="10.99"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line4_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine4(this.id)" onblur="CalculateLine4(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line4_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        7C
                                    </td>
                                    <td>
                                        Clean Refrigerator Coils
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line5_CostUnit_2" runat="server" Text="17.98"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line5_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine5(this.id)" onblur="CalculateLine5(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line5_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        7C
                                    </td>
                                    <td>
                                        Air Conditioner Filter
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line6_CostUnit_2" runat="server" Text="29.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line6_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine6(this.id)" onblur="CalculateLine6(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line6_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        7C
                                    </td>
                                    <td>
                                        Clean A/C Coils
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line7_CostUnit_2" runat="server" Text="17.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line7_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine7(this.id)" onblur="CalculateLine7(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line7_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line8_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="7C" onkeyup="CalculateLine8Code()"
                                            onblur="CalculateLine8Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        Other Efficiency improvements
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine8SC()" onblur="CalculateLine8SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine8LaborRate()"
                                            onblur="CalculateLine8LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine8THW()" onblur="CalculateLine8THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine8TMC()" onblur="CalculateLine8TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line8_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line8_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine8(this.id)" onblur="CalculateLine8(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line8_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line9_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="7D" onkeyup="CalculateLine9Code()"
                                            onblur="CalculateLine9Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        Water bed Retofit- Double
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine9SC()" onblur="CalculateLine9SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right; text-align: center;" Text="45/70" onkeyup="CalculateLine9LaborRate()"
                                            onblur="CalculateLine9LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine9THW()" onblur="CalculateLine9THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine9TMC()" onblur="CalculateLine9TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line9_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line9_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine9(this.id)" onblur="CalculateLine9(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line9_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="7D" onkeyup="CalculateLine10Code()"
                                            onblur="CalculateLine10Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        Water bed Retofit- Queen
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine10SC()" onblur="CalculateLine10SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine10LaborRate()"
                                            onblur="CalculateLine10LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine10THW()" onblur="CalculateLine10THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine10TMC()" onblur="CalculateLine10TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line10_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line10_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine10(this.id)" onblur="CalculateLine10(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line10_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="7D" onkeyup="CalculateLine11Code()"
                                            onblur="CalculateLine11Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        Water bed Retofit- King
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine11SC()" onblur="CalculateLine11SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine11LaborRate()"
                                            onblur="CalculateLine11LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine11THW()" onblur="CalculateLine11THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine11TMC()" onblur="CalculateLine11TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line11_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line11_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine11(this.id)" onblur="CalculateLine11(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line11_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line12_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="7D" onkeyup="CalculateLine12Code()"
                                            onblur="CalculateLine12Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        Water bed Retofit- Matress Pad
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine12SC()" onblur="CalculateLine12SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine12LaborRate()"
                                            onblur="CalculateLine12LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine12THW()" onblur="CalculateLine12THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine12TMC()" onblur="CalculateLine12TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line12_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line12_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine12(this.id)" onblur="CalculateLine12(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line12_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        7K
                                    </td>
                                    <td>
                                        Energy Star Dehumidifier
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line13_CostUnit_2" runat="server" Text="185.60"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line13_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine13(this.id)" onblur="CalculateLine13(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line13_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        7M
                                    </td>
                                    <td>
                                        Smart Plug
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line14_CostUnit_2" runat="server" Text="41.98"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line14_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine14(this.id)" onblur="CalculateLine14(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line14_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line15_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line15_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine15Code()" onblur="CalculateLine15Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line15_MeasureDesc_2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine15SC()" onblur="CalculateLine15SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine15LaborRate()"
                                            onblur="CalculateLine15LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine15THW()" onblur="CalculateLine15THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine15TMC()" onblur="CalculateLine15TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line15_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line15_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine15(this.id)" onblur="CalculateLine15(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line15_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine16Code()" onblur="CalculateLine16Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_MeasureDesc_2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine16SC()" onblur="CalculateLine16SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine16LaborRate()"
                                            onblur="CalculateLine16LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine16THW()" onblur="CalculateLine16THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine16TMC()" onblur="CalculateLine16TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line16_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line16_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine16(this.id)" onblur="CalculateLine16(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line16_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>HVAC/ELECTRIC</strong>
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
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line17_CostUnit_2" runat="server" Text="49.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line17_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine17(this.id)" onblur="CalculateLine17(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line17_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        F2
                                    </td>
                                    <td>
                                        Furnace Filter -Clean
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line18_CostUnit_2" runat="server" Text="9.98"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line18_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine18(this.id)" onblur="CalculateLine18(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line18_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine19Code()" onblur="CalculateLine19Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_MeasureDesc_2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine19SC()" onblur="CalculateLine19SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine19LaborRate()"
                                            onblur="CalculateLine19LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine19THW()" onblur="CalculateLine19THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine19TMC()" onblur="CalculateLine19TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line19_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line19_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine19(this.id)" onblur="CalculateLine19(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line19_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine20Code()" onblur="CalculateLine20Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_MeasureDesc_2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine20SC()" onblur="CalculateLine20SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right; text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine20LaborRate()"
                                            onblur="CalculateLine20LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine20THW()" onblur="CalculateLine20THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine20TMC()" onblur="CalculateLine20TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line20_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line20_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine20(this.id)" onblur="CalculateLine20(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line20_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>MISC</strong>
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
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line21_CostUnit_2" runat="server" Text="83.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line21_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine21(this.id)" onblur="CalculateLine21(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line21_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        93
                                    </td>
                                    <td>
                                        Install Dryer Vent (PVC)
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line22_CostUnit_2" runat="server" Text="116.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line22_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine22(this.id)" onblur="CalculateLine22(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line22_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
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
                                        45
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line23_CostUnit_2" runat="server" Text="44.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line23_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine23(this.id)" onblur="CalculateLine23(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line23_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        93
                                    </td>
                                    <td>
                                        Basic Dryer Pipe
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line24_CostUnit_2" runat="server" Text="34.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line24_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine24(this.id)" onblur="CalculateLine24(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line24_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        93
                                    </td>
                                    <td>
                                        Drill Masonary for Dryer Vent
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line25_CostUnit_2" runat="server" Text="19.99"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line25_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine25(this.id)" onblur="CalculateLine25(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line25_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        93
                                    </td>
                                    <td>
                                        Drill Frame Wall For Dryer Vent
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line26_CostUnit_2" runat="server" Text="11.58"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line26_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine26(this.id)" onblur="CalculateLine26(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line26_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        93
                                    </td>
                                    <td>
                                        Dryer Vent Duct and Hood Install
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line27_CostUnit_2" runat="server" Text="107.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line27_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine27(this.id)" onblur="CalculateLine27(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line27_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        93
                                    </td>
                                    <td>
                                        Connect Duct to Hood
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line28_CostUnit_2" runat="server" Text="30.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line28_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine28(this.id)" onblur="CalculateLine28(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line28_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine29Code()" onblur="CalculateLine29Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_MeasureDesc_2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine29SC()" onblur="CalculateLine29SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right; text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine29LaborRate()"
                                            onblur="CalculateLine29LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine29THW()" onblur="CalculateLine29THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine29TMC()" onblur="CalculateLine29TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line29_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line29_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine29(this.id)" onblur="CalculateLine29(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line29_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line30_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line30_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine30Code()" onblur="CalculateLine30Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line30_MeasureDesc_2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line30_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine30SC()" onblur="CalculateLine30SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line30_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line30_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine30LaborRate()"
                                            onblur="CalculateLine30LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line30_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine30THW()" onblur="CalculateLine30THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line30_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine30TMC()" onblur="CalculateLine30TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line30_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line30_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine30(this.id)" onblur="CalculateLine30(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line30_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        C3
                                    </td>
                                    <td>
                                        Clothes Line
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line31_CostUnit_2" runat="server" Text="88.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line31_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine31(this.id)" onblur="CalculateLine31(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line31_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        C3
                                    </td>
                                    <td>
                                        T - Poles clothesline
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line32_CostUnit_2" runat="server" Text="156.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line32_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine32(this.id)" onblur="CalculateLine32(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line32_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="center">
                                        C3
                                    </td>
                                    <td>
                                        Umbrella Clothesline
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line33_CostUnit_2" runat="server" Text="156.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line33_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine33(this.id)" onblur="CalculateLine33(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line33_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine34Code()" onblur="CalculateLine34Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_MeasureDesc_2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine34SC()" onblur="CalculateLine34SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine34LaborRate()"
                                            onblur="CalculateLine34LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine34THW()" onblur="CalculateLine34THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine34TMC()" onblur="CalculateLine34TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line34_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line34_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine34(this.id)" onblur="CalculateLine34(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line34_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line35_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line35_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine35Code()" onblur="CalculateLine35Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line35_MeasureDesc_2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line35_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine35SC()" onblur="CalculateLine35SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line35_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line35_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine35LaborRate()"
                                            onblur="CalculateLine35LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line35_THW" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine35THW()" onblur="CalculateLine35THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line35_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine35TMC()" onblur="CalculateLine35TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line35_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line35_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine35(this.id)" onblur="CalculateLine35(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line35_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Water Heating</strong>
                                    </td>
                                    <td align="center">
                                        F5
                                    </td>
                                    <td>
                                        Heat Pump HWH-
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
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line36_CostUnit_2" runat="server" Text="2060.00"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line36_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine36(this.id)" onblur="CalculateLine36(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line36_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line37_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line37_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine37Code()" onblur="CalculateLine37Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line37_MeasureDesc_2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line37_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine37SC()" onblur="CalculateLine37SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line37_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line37_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine37LaborRate()"
                                            onblur="CalculateLine37LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line37_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine37THW()" onblur="CalculateLine37THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line37_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine37TMC()" onblur="CalculateLine37TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line37_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line37_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine37(this.id)" onblur="CalculateLine37(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line37_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line38_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line38_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine38Code()" onblur="CalculateLine38Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line38_MeasureDesc_2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line38_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine38SC()" onblur="CalculateLine38SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line38_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line38_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine38LaborRate()"
                                            onblur="CalculateLine38LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line38_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine38THW()" onblur="CalculateLine38THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line38_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine38TMC()" onblur="CalculateLine38TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line38_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line38_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine38(this.id)" onblur="CalculateLine38(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line38_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line39_Cat_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line39_LIURP_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine39Code()" onblur="CalculateLine39Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line39_MeasureDesc_2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line39_SC_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine39SC()" onblur="CalculateLine39SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line39_Unit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line39_LaborRate_2" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine39LaborRate()"
                                            onblur="CalculateLine39LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line39_THW_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine39THW()" onblur="CalculateLine39THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line39_TMC_2" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine39TMC()" onblur="CalculateLine39TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line39_CostUnit_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line39_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine39(this.id)" onblur="CalculateLine39(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line39_Total_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%-----Page 2 End-----%>
                        <%-----Page 3 Start-----%>
                        <div style="border: 1px solid #B3B3B3; padding: 15px; width: 940px; margin: 0 auto;
                            position: relative;">
                            <table width="100%" border="1" cellspacing="0" cellpadding="5">
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
                                        <asp:TextBox ID="txt_Line1_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine1Code()" onblur="CalculateLine1Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line1_SC_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine1SC()" onblur="CalculateLine1SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line1_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line1_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine1LaborRate()"
                                            onblur="CalculateLine1LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line1_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine1THW()" onblur="CalculateLine1THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line1_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine1TMC()" onblur="CalculateLine1TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line1_CostUnit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line1_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine1(this.id)" onblur="CalculateLine1(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line1_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine2Code()" onblur="CalculateLine2Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_SC_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine2SC()" onblur="CalculateLine2SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine2LaborRate()"
                                            onblur="CalculateLine2LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine2THW()" onblur="CalculateLine2THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine2TMC()" onblur="CalculateLine2TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line2_CostUnit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line2_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine2(this.id)" onblur="CalculateLine2(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line2_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine3Code()" onblur="CalculateLine3Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line3_SC_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine3SC()" onblur="CalculateLine3SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line3_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right; text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line3_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine3LaborRate()"
                                            onblur="CalculateLine3LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line3_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine3THW()" onblur="CalculateLine3THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line3_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine3TMC()" onblur="CalculateLine3TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line3_CostUnit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line3_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine3(this.id)" onblur="CalculateLine3(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line3_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine4Code()" onblur="CalculateLine4Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line4_SC_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine4SC()" onblur="CalculateLine4SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line4_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line4_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine4LaborRate()"
                                            onblur="CalculateLine4LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line4_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine4THW()" onblur="CalculateLine4THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line4_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine4TMC()" onblur="CalculateLine4TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line4_CostUnit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line4_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine4(this.id)" onblur="CalculateLine4(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line4_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine5Code()" onblur="CalculateLine5Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_SC_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine5SC()" onblur="CalculateLine5SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine5LaborRate()"
                                            onblur="CalculateLine5LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine5THW()" onblur="CalculateLine5THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line5_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine5TMC()" onblur="CalculateLine5TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line5_CostUnit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line5_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine5(this.id)" onblur="CalculateLine5(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line5_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line6_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line6_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine6Code()" onblur="CalculateLine6Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line6_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line6_SC_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine6SC()" onblur="CalculateLine6SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line6_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line6_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine6LaborRate()"
                                            onblur="CalculateLine6LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line6_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine6THW()" onblur="CalculateLine6THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line6_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine6TMC()" onblur="CalculateLine6TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line6_CostUnit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line6_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine6(this.id)" onblur="CalculateLine6(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line6_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line7_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line7_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine7Code()" onblur="CalculateLine7Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line7_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line7_SC_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine7SC()" onblur="CalculateLine7SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line7_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line7_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine7LaborRate()"
                                            onblur="CalculateLine7LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line7_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine7THW()" onblur="CalculateLine7THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line7_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine7TMC()" onblur="CalculateLine7TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line7_CostUnit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line7_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine7(this.id)" onblur="CalculateLine7(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line7_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line8_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line8_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine8Code()" onblur="CalculateLine8Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line8_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_SC_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine8SC()" onblur="CalculateLine8SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine8LaborRate()"
                                            onblur="CalculateLine8LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine8THW()" onblur="CalculateLine8THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine8TMC()" onblur="CalculateLine8TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line8_CostUnit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line8_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine8(this.id)" onblur="CalculateLine8(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line8_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line9_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line9_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine9Code()" onblur="CalculateLine9Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line9_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_SC_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine9SC()" onblur="CalculateLine9SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right; text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine9LaborRate()"
                                            onblur="CalculateLine9LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine9THW()" onblur="CalculateLine9THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine9TMC()" onblur="CalculateLine9TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line9_CostUnit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line9_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine9(this.id)" onblur="CalculateLine9(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line9_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine10Code()" onblur="CalculateLine10Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_SC_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine10SC()" onblur="CalculateLine10SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine10LaborRate()"
                                            onblur="CalculateLine10LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine10THW()" onblur="CalculateLine10THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine10TMC()" onblur="CalculateLine10TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line10_CostUnit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line10_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine10(this.id)" onblur="CalculateLine10(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line10_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine11Code()" onblur="CalculateLine11Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_SC_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" onkeyup="CalculateLine11SC()" onblur="CalculateLine11SC()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: center; text-align: right;" Text="45/70" onkeyup="CalculateLine11LaborRate()"
                                            onblur="CalculateLine11LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine11THW()" onblur="CalculateLine11THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="CalculateLine11TMC()" onblur="CalculateLine11TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line11_CostUnit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line11_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine11(this.id)" onblur="CalculateLine11(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line11_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12" align="center">
                                        <strong>Use this space for custom items with other categories, see listing. You may
                                            use this space also if there is not enough room under the categories above.</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine18Code()" onkeyup="CalculateLine18Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        C
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" onblur="CalculateLine18LaborRate()" onkeyup="CalculateLine18LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine18THW()" onkeyup="CalculateLine18THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine18TMC()" onkeyup="CalculateLine18TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right" bgcolor="#CCCCCC">
                                        <asp:TextBox ID="txt_Line18_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine18(this.id)" onkeyup="CalculateLine18(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line18_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine19Code()" onkeyup="CalculateLine19Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        C
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" onblur="CalculateLine19LaborRate()" onkeyup="CalculateLine19LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine19THW()" onkeyup="CalculateLine19THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine19TMC()" onkeyup="CalculateLine19TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right" bgcolor="#CCCCCC">
                                        <asp:TextBox ID="txt_Line19_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine19(this.id)" onkeyup="CalculateLine19(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line19_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine20Code()" onkeyup="CalculateLine20Code()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_MeasureDesc_3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        C
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" onblur="CalculateLine20LaborRate()" onkeyup="CalculateLine20LaborRate()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine20THW()" onkeyup="CalculateLine20THW()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine20TMC()" onkeyup="CalculateLine20TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" disabled="disabled" />
                                    </td>
                                    <td align="right" bgcolor="#CCCCCC">
                                        <asp:TextBox ID="txt_Line20_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine20(this.id)" onkeyup="CalculateLine20(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line20_Total_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8">
                                        Page1=<asp:TextBox ID="txt_TotalPage1" runat="server" Style="width: 70px; border: none;
                                            font-size: 11px;" value="$151.95" onblur="CalculateGrandTotal()" onkeyup="CalculateGrandTotal()"></asp:TextBox>Page2=<asp:TextBox
                                                ID="txt_TotalPage2" runat="server" Style="width: 70px; border: none; font-size: 11px;"
                                                value="$1,214.95" onblur="CalculateGrandTotal()" onkeyup="CalculateGrandTotal()"></asp:TextBox>Page3=<asp:TextBox
                                                    ID="txt_TotalPage3" runat="server" Style="width: 70px; border: none; font-size: 11px;"
                                                    value="$59.91" onblur="CalculateGrandTotal()" onkeyup="CalculateGrandTotal()"></asp:TextBox>(Page
                                        3 and Invoice total not current until SAVE)
                                    </td>
                                    <td colspan="2">
                                        <strong>INVOICE TOTAL:</strong>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_GrandTotal" runat="server" Style="width: 100%; border: none;"
                                            Text="$1,601.43" Font-Bold="true"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_ContractorLine1Type" runat="server" value="Electrical" Style="border: none;
                                            width: 100%;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine1Name" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine1CallDate" runat="server" Style="width: 70px;
                                            border: none; font-size: 11px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine1Comments" runat="server" Style="width: 100%;
                                            border: none;" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine2Type" runat="server" value="Plumbing" Style="border: none;
                                            width: 100%;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine2Name" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine2CallDate" runat="server" Style="width: 70px;
                                            border: none; font-size: 11px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine2Comments" runat="server" Style="width: 100%;
                                            border: none;" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine3Type" runat="server" value="Furnace/Heat Pump"
                                            Style="border: none; width: 100%;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine3Name" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine3CallDate" runat="server" Style="width: 70px;
                                            border: none; font-size: 11px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine3Comments" runat="server" Style="width: 100%;
                                            border: none;" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine4Type" runat="server" value="" Style="border: none;
                                            width: 100%;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine4Name" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine4CallDate" runat="server" Style="width: 70px;
                                            border: none; font-size: 11px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine4Comments" runat="server" Style="width: 100%;
                                            border: none;" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        Date Invoice Submitted
                                        <asp:TextBox ID="txt_DateInvoiceSubmitted" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 17%;"></asp:TextBox>
                                        I hearby attest that all of the work invoiced was completed on the date stated on
                                        the invoice.
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        Date Work Completed
                                        <asp:TextBox ID="txt_DateWorkCompleted" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 17%;"></asp:TextBox>
                                        Signature of Contractor:
                                        <asp:TextBox ID="txt_SignatureofContractor" runat="server" Style="width: 250px; text-align: center;
                                            border: none; border-bottom: solid 1px rgb(219, 219, 219); padding-bottom: 5px;
                                            font-weight: bold; font-size: 12px; color: #666666;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%-----Page 3 End-----%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>

    <script language="JavaScript" type="text/javascript">

        function Hide() {
            document.getElementById('<%=DivHeader.ClientID %>').style.display = "none";
        }


        function Clickheretoprint() {
            // document.getElementById("divClientInter").style.pageBreakAfter = "always";
            //document.getElementById("divToBeComplated").style.pageBreakAfter = "always";

            var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
            disp_setting += "scrollbars=yes,width=650px, height=600px, left=100, top=25";
            var content_vlue = document.getElementById('<%=DivPrint.ClientID %>').innerHTML;
            var docprint = window.open("", "", disp_setting);
            docprint.document.open();
            docprint.document.write('<html><head><title>Custom Weatherization/ PPL Audit Page</title> ');
            docprint.document.write('</head><body onLoad="self.print()"><center>');
            docprint.document.write(content_vlue);
            docprint.document.write('</center></body></html>');
            docprint.document.close();
            docprint.focus();
        }    
    </script>

</body>
</html>
