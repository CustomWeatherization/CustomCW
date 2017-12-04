<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PPL_Invoice_Page.aspx.cs"
    Inherits="PPLAudit_PPL_Invoice_Page" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Custom Weatherization/ PPL Invoice Page</title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

    <link rel="stylesheet" href="print.css" type="text/css" media="print" />
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Cache-Control" content="no-cache" />
         <style type="text/css">
             
             @media print{
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



				
#DivHeader{display:none;}
   
			
			@page{padding:0;margin:0;}
			

h3 {
margin: 5px 0px;
font-size: 10px;
}
p {
margin: 1px 0px;
}
input {
text-align: center !important;
font-size: 10.45px;
}
		 th, tr, td {
   padding:0; margin:0;
		 }
		 #DivPrint{
   font-size: 10px;
}
strong {
font-size: 10px !important;
font-variant:normal !important;
}
title { display: none; } 
date { display: none; } 
.divPage{padding:2px !important;width:100% !important;page-break-after:always;}
.divPage:last-child{page-break-after:;}
td{border-top:1px solid #ccc;border-left:1px solid #ccc;}
}
	/*	} */
</style>
</head>
<body class="landScape">
    <%--class="Landscape"--%>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hdn_Finalize" runat="server" />
    <div style="margin: 0 auto; width: 1000px; color: Black; font-size: 13px;" id="fix_div">
        <!--@media print {
	 @page{padding:1cm;margin:0cm;  }
	 body{padding:0cm;margin:0cm;}          -webkit-transform: rotate(90deg); /* Chrome, Safari, Opera */
transform: rotate(90deg);
margin:1cm !important;
margin-top:55px !important; header -->
        <div id="DivHeader" class="asd" runat="server" style="height: 68px; padding: 10px 0; border-bottom: 2px solid #ccc;
            margin: 0 0 10px 0;">
            <div style="float: left; width: 250px;">
                <a href="../Home.aspx">
                    <img src="../images/logo.jpg" alt="" /></a></div>
            <div style="float: left; width: 500px; text-align: center; font-size: 16px; font-weight: bold;
                color: #464545; margin: 28px 0 0 0;">
            </div>
            <div class="head_link">
                <a href="../Admin/Admin_Login.aspx">Administer Database</a>
                <br />
                <input type="button" value="Back" onclick="javascript:window.location='../DisplayJobSearchRecords.aspx?Jobs=<%= Convert.ToString(Request.QueryString["Jobs"])  %>&Utility=<%= Convert.ToString(Request.QueryString["Utility"]) %>'"
                    class="top_btn" /><a href="#" onclick="Hide();" style="text-decoration: none;"><%--javascript:Clickheretoprint();--%>
                        <input type="button" value="Print Invoice" class="top_btn" />
                    </a>
                <%--<asp:LinkButton ID="btnprint" runat="server" CssClass="top_btn" Text="Print Invoice"></asp:LinkButton>--%>
            </div>
        </div>
        <!-- end header -->
        <div style="clear: left;">
        </div>
        <!-- form section -->
        <%--<div id="DivPrint" runat="server">--%>
        <div style="padding: 10px; font-size: 12px; color: #000; text-align: center;">
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
                <div id="DivPrint" runat="server">
                    <div class="divPage" style="border: 1px solid #B3B3B3; padding: 15px; width: 940px;
                        margin: 0 auto;  page-break-after: always;">
                        <table width="100%">
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
                        <!-- Sudhanshu Invoice Page 1 start -->
                        <!-- inv_table end -->
                        <div style="font-size: 11px;">
                            <table width="100%" border="1" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td colspan="12" style="background: rgb(211, 211, 211); font-size: 14px;">
                                        <h3>
                                            INSTRUCTIONS:</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="12" bgcolor="#efefef">
                                        <div style="padding: 10px 0 0 0;">
                                            <p>
                                                If column <strong>S/C= S</strong> (Measures with the cost per unit provided),enter
                                                the numbers of units installed in the <strong>Qty</strong> column. <strong>SHADED ITEMS
                                                    ARE SHELL MEASURES</strong> Multiply <strong>Qty * Cost Per Unit</strong> and
                                                enter in the <strong>TOTAL</strong> column.</p>
                                            <p>
                                                If column <strong>S/C= C</strong> (Special Measures with no contract price), enter
                                                the measure description in the <strong>MEASURE DESCRIPTION</strong> column, the
                                                type of unit in the <strong>UNIT</strong> column and the number of units installed
                                                in the <strong>Qty</strong> column. DO NOT FORGET TO ENTER THE <strong>CATEGORY</strong>
                                                AND THE <strong>LIURP CODE</strong> IN THE APPROPRIATE COLUMNS. Enter the total
                                                hours to complete the measure in the <strong>THW</strong> column using the decimal
                                                equivalents for partial hours. Enter the cost of all materials used in the <strong>TMC</strong>
                                                column. For custom measures only, the Labor Rate for 1 worker is $43 per hour, for
                                                2 is $66 per hour. Circle or highlight the appropriate rate in the <strong>Labor Rate</strong>
                                                column. To calculate the <strong>TOTAL</strong> column, multiply <strong>THW *</strong>
                                                the circled <strong>Labor Rate</strong> then add the <strong>TMC</strong>. Enter
                                                the result in the <strong>TOTAL</strong> column.
                                            </p>
                                            <p>
                                                If column <strong>S/C= SC</strong> (Contract Measures whose LIURP Code is the same
                                                as that for the R-value of the insulation used), enter the number of units installed
                                                in the <strong>Qty</strong> column. Multiply <strong>Qty * Cost Per Unit</strong>
                                                and enter in the <strong>TOTAL</strong> column. (The number in Italics besides each
                                                of these measures are for CACLV use only.)</p>
                                        </div>
                                        `
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <th width="120">Location</th>--%>
                                    <th>
                                        Category
                                    </th>
                                    <th>
                                        LIURP
                                        <br />
                                        Code
                                    </th>
                                    <th style="width: 50%;">
                                        MEASURE DESCRIPTION
                                    </th>
                                    <th>
                                        S/C
                                    </th>
                                    <th>
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
                                    <%-- <td><asp:TextBox  ID="txt_Line1_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">ADMIN</strong>
                                    </td>
                                    <td align="center" style="width: 50px">
                                        None
                                    </td>
                                    <td>
                                        Cancellation Charge - Involving Site Visit
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center" style="width: 50px">
                                        Each
                                    </td>
                                    <td align="center" style="width: 30px">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="width: 30px">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="width: 30px">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 35px; text-align: right;" ID="lbl_Line1_CostUnit_1"
                                            runat="server" Text="52.70" />
                                    </td>
                                    <td align="right" style="width: 40px">
                                        <asp:TextBox ID="txt_Line1_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line1_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line2_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
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
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 35px; text-align: right;" ID="lbl_Line2_CostUnit_1"
                                            runat="server" Text="24.60" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line2_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" onkeyup="CalculateLine2(this.id)" onblur="CalculateLine2(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line2_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line3_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">AUDIT</strong>
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        Baseload Audit
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
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 35px; text-align: right;" ID="lbl_Line3_CostUnit_1"
                                            runat="server" Text="65.88" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line3_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" onkeyup="CalculateLine3(this.id)" onblur="CalculateLine3(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line3_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line4_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td style="width: 80px">
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        <em>With Baseload Audit only</em>: Water Heating Assessment done in conjunction
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
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 35px; text-align: right;" ID="lbl_Line4_CostUnit_1"
                                            runat="server" Text="8.44" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line4_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" onkeyup="CalculateLine4(this.id)" onblur="CalculateLine4(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line4_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td><asp:TextBox ID="txt_Line5_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                    </td>
                                    <td align="center">
                                        none
                                    </td>
                                    <td>
                                        Full Cost Audit (Includes Solar Water Heating Audit)
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
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 35px; text-align: right;" ID="lbl_Line5_CostUnit_1"
                                            runat="server" Text="89.86" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line5_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" onkeyup="CalculateLine5(this.id)" onblur="CalculateLine5(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line5_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--   <td><asp:TextBox ID="txt_Line6_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        Blower Door Only (When both Pre & Post tests are completed use quantity=2)
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
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 35px; text-align: right;" ID="lbl_Line6_CostUnit_1"
                                            runat="server" Text="29.19" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line6_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" onkeyup="CalculateLine6(this.id)" onblur="CalculateLine6(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line6_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td><asp:TextBox ID="txt_Line7_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        Brultech Monitoring
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
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 35px; text-align: right;" ID="lbl_Line7_CostUnit_1"
                                            runat="server" Text="10.47" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line7_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" onkeyup="CalculateLine7(this.id)" onblur="CalculateLine7(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line7_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line8_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                    </td>
                                    <td align="center">
                                        None
                                    </td>
                                    <td>
                                        Solar Water Heating Customer Education (enter Cost per Unit as per agreement with
                                        PPL)
                                    </td>
                                    <td align="center">
                                        C
                                    </td>
                                    <td align="center">
                                        Each
                                    </td>
                                    <td align="center">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 35px; text-align: right;" ID="lbl_Line8_CostUnit_1"
                                            runat="server" Text="8.00" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line8_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" onkeyup="CalculateLine8(this.id)" onblur="CalculateLine8(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line8_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line9_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line9_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line9_MeasureDesc_1" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_SC_1" runat="server" Style="width: 20px; border: none;
                                            text-align: center;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: center;" Text="43/68" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_THW_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_TMC_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line9_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line9_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line10_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_MeasureDesc_1" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_SC_1" runat="server" Style="width: 20px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_Line10_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_THW_1" runat="server" Style="width: 40px; border: none;
                                            text-align: left;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_TMC_1" runat="server" Style="width: 40px; border: none;
                                            text-align: left;" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line10_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line10_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td><asp:TextBox ID="txt_Line11_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">AIR SEALING</strong>
                                    </td>
                                    <td align="center">
                                        12
                                    </td>
                                    <td>
                                        Caulk Baseboards, Wall Trim or Cracks
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
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        0.94
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line11_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line11_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td><asp:TextBox ID="txt_Line12_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                    </td>
                                    <td align="center">
                                        12
                                    </td>
                                    <td>
                                        Foam Seams & Cracks
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
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        2.28
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line12_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" onkeyup="CalculateLine12(this.id)" onblur="CalculateLine12(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line12_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td><asp:TextBox ID="txt_Line13_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                    </td>
                                    <td align="center">
                                        12
                                    </td>
                                    <td>
                                        Repair / Block Holes with 1/2" R-Max (Thermax, Cellutex, Foam Board)
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Sq. Ft.
                                    </td>
                                    <td align="center">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        2.28
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line13_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line13_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td><asp:TextBox ID="txt_Line14_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                    </td>
                                    <td align="center">
                                        12
                                    </td>
                                    <td>
                                        Tyvek
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
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        0.78
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line14_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line14_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td><asp:TextBox ID="txt_Line15_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line15_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line15_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line15_MeasureDesc_1" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_SC_1" runat="server" Style="width: 20px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_THW_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_TMC_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line15_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line15_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--   <td><asp:TextBox ID="txt_Line16_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_MeasureDesc_1" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_SC_1" runat="server" Style="width: 20px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_THW_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_TMC_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line16_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line16_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td><asp:TextBox ID="txt_Line17_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_MeasureDesc_1" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_SC_1" runat="server" Style="width: 20px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_THW_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_TMC_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line17_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line17_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line18_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">APP/LIGHTING</strong>
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
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        10.00
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line18_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line18_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td></td>--%>
                                    <td>
                                    </td>
                                    <td align="center">
                                        78
                                    </td>
                                    <td>
                                        CFL - Specialoty
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
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        10.00
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line18_Qty_Speciality_1" runat="server" Style="width: 25px;
                                            border: none; text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line18_Total_Speciality_1"
                                            runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line19_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
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
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        6.88
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line19_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line19_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td><asp:TextBox ID="txt_Line20_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
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
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        13.76
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line20_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line20_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line21_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
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
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        22.66
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line21_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line21_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line22_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line22_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line22_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line22_MeasureDesc_1" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line22_SC_1" runat="server" Style="width: 20px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line22_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line22_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line22_THW_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line22_TMC_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line22_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line22_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line23_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_MeasureDesc_1" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_SC_1" runat="server" Style="width: 20px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_THW_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_TMC_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line23_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line23_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td><asp:TextBox ID="txt_Line24_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line24_Cat_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line24_LIURP_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line24_MeasureDesc_1" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_SC_1" runat="server" Style="width: 20px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_Unit_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_LaborRate_1" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_THW_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_TMC_1" runat="server" Style="width: 30px; border: none;" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line24_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line24_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td><asp:TextBox ID="txt_Line25_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">ATTIC</strong>
                                    </td>
                                    <td align="center">
                                        29
                                    </td>
                                    <td>
                                        Door - Insultate Door - Attic
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Lin Ft.
                                    </td>
                                    <td align="center">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        37.06
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line25_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line25_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td><asp:TextBox ID="txt_Line26_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                    </td>
                                    <td align="center">
                                        43
                                    </td>
                                    <td>
                                        Attic - Overblow R-30 Batts with Loose Fill Insulation (R-8)
                                    </td>
                                    <td align="center">
                                        S
                                    </td>
                                    <td align="center">
                                        Cu.ft.
                                    </td>
                                    <td align="center">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        0.57
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line26_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line26_Total_1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td><asp:TextBox ID="txt_Line27_Location_1" runat="server" style="border:none; width:100px;"  /></td>--%>
                                    <td>
                                    </td>
                                    <td align="center">
                                        43
                                    </td>
                                    <td>
                                        Attic - Blown Insulation (R-8)
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
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 30px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        0.57
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line27_Qty_1" runat="server" Style="width: 25px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line27_Total_1" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- inv_table end -->
                    <!-- Sudhanshu Invoice Page 1 end -->
                    <!-- Sudhanshu Invoice Page 2 start -->
                    <br />
                    <br />
                    <div class="divPage" style="border: 1px solid #B3B3B3; padding: 15px; width: 940px;
                        margin: 0 auto;  page-break-after: always;">
                        <div style="font-size: 11px;">
                            <table width="100%" border="1" cellspacing="0" cellpadding="0" style="border: solid 1px Black;">
                                <tr>
                                    <%--   <th width="120">
                                    Location
                                </th>--%>
                                    <th width="80" style="border: solid 1px Black;">
                                        Category
                                    </th>
                                    <th style="border: solid 1px Black;">
                                        LIURP
                                        <br />
                                        Code
                                    </th>
                                    <th width="610" style="border: solid 1px Black;">
                                        MEASURE DESCRIPTION
                                    </th>
                                    <th style="border: solid 1px Black;">
                                        S/C
                                    </th>
                                    <th width="50" style="border: solid 1px Black;">
                                        Unit
                                    </th>
                                    <th style="border: solid 1px Black;">
                                        Labor Rate
                                    </th>
                                    <th style="border: solid 1px Black;">
                                        THW
                                    </th>
                                    <th style="border: solid 1px Black;">
                                        TMC
                                    </th>
                                    <th style="width: 50px; border: 1px;">
                                        Cost Per Unit
                                    </th>
                                    <th style="border: solid 1px Black;">
                                        QTY<br />
                                        (all req)
                                    </th>
                                    <th style="width: 60px; border: 1px;">
                                        TOTAL
                                    </th>
                                </tr>
                                <tr>
                                    <%--  <td>
                                  <asp:TextBox  ID="txt_Line1Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td rowspan="6" bgcolor="#CCCCCC" align="center" style="border: solid 1px Black;">
                                        Use these items when the R value of the insulation used to complete the work is
                                        R-8.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Other: Wet Spray Cellulose Adder
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Cu. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line1_CostUnit_2" runat="server"
                                            Text="0.08" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line1_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line1_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--<td>
                                   <asp:TextBox  ID="txt_Line2Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Strip Cut Opening in Roof (Hrs per Unit=0.168, Mtl per Unit=0.528)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Lin. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line2_CostUnit_2" runat="server"
                                            Text="7.75" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line2_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line2_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--<td>
                                   <asp:TextBox  ID="txt_Line3Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Strip Cut floor to blow insulation (Hrs per Unit=0.112, Mtl per Unit=0.00)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Sq. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line3_CostUnit_2" runat="server"
                                            Text="4.82" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line3_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line3_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line4Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Make/repair access cut in dry wall (Hrs per Unit=0.96, Mtl per Unit=5.0)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Sq. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_line4_CostUnit_2" runat="server"
                                            Text="46.28" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line4_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onkeyup="CalculateLine4(this.id)" onblur="CalculateLine4(this.id)" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line4_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line5Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Drill 6" hole in wall:cap (Hrs per Unit=0.04, Mtl per Unit=2.9)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Each
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line5_CostUnit_2" runat="server"
                                            Text="4.62" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line5_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line5_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line6Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Drill 6" hole in wall:plug & 1st coat spackle (Hrs per Unit=0.112, Mtl per Unit=3.52)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Each
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_line6_CostUnit_2" runat="server"
                                            Text="8.34" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line6_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line6_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line7Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td rowspan="8" bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        Use these items when the R value of the insulation used to complete the work is
                                        R-19.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        45
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Attic - Blown Insulation R-19
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        S
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Cu. Ft
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_line7_CostUnit_2" runat="server"
                                            Text="0.89" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line7_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line7_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line8Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        45
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Attic - Flat Roof/Ceiling/Closed Blow:Blow to R-19
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        S
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Cu. Ft
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line8_CostUnit_2" runat="server"
                                            Text="0.73" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line8_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line8_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line9Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        45
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Other:Wet Spray Cellulose Adder
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Cu. Ft
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line9_CostUnit_2" runat="server"
                                            Text="0.08" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line9_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line9_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line10Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        45
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Strip Cut Opening in Roof (Hrs per Unit=0.168, Mtl per Unit=0.528)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Lin. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line10_CostUnit_2" runat="server"
                                            Text="7.75" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line10_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line10_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line11Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        45
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Strip Cut Floor To Blow Insulation(Hrs per Unit=0.112, Mtl per Unit=0.00)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Sq. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line11_CostUnit_2" runat="server"
                                            Text="4.82" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line11_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line11_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line12Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        45
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Make/Cut access cut in dry wall (Hrs per Unit=0.96, Mtl per Unit=5)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Sq. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line12_CostUnit_2" runat="server"
                                            Text="46.28" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line12_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line12_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line13Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        45
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Drill 6" hole in wall: cap (Hrs per Unit=0.04, Mtl per Unit=2.9)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Each
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line13_CostUnit_2" runat="server"
                                            Text="4.62" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line13_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line13_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line14Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        45
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Drill 6" hole in wall: plaug & 1st coat spackle (Hrs per Unit=0.112, Mtl per Unit=3.52)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Each
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line14_CostUnit_2" runat="server"
                                            Text="8.34" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line14_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line14_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line15Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td rowspan="7" bgcolor="#CCCCCC" align="center" style="border: solid 1px Black;">
                                        Use these items when the R value of the insulation used to complete the work is
                                        R-24.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        47
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Attic - Flat Roof / Ceiling / Closed Blow: Blow to R-24
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        S
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Cu. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line15_CostUnit_2" runat="server"
                                            Text="1.38" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line15_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line15_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line16Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        47
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Other: Wet Spray Cellulose Adder
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Cu. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line16_CostUnit_2" runat="server"
                                            Text="0.08" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line16_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line16_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line17Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        47
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Strip Cut Opening in Roof (Hrs per Unit=0.168, Mtl per Unit=0.528)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Lin. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line17_CostUnit_2" runat="server"
                                            Text="7.75" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line17_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line17_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line18Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        47
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Strip Cut Floor To Blow Insulation(Hrs per Unit=0.112, Mtl per Unit=0.00)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Sq. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line18_CostUnit_2" runat="server"
                                            Text="4.82" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line18_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line18_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line19Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        47
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Make/Cut access cut in dry wall (Hrs per Unit=0.96, Mtl per Unit=5)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Sq. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line19_CostUnit_2" runat="server"
                                            Text="46.28" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line19_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line19_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line20Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        47
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Drill 6" hole in wall: cap (Hrs per Unit=0.04, Mtl per Unit=2.9)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Each
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line20_CostUnit_2" runat="server"
                                            Text="4.62" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line20_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line20_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line21Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        47
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Drill 6" hole in wall:plug & 1st coat spackle (Hrs per Unit=0.112, Mtl per Unit=3.52)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Each
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line21_CostUnit_2" runat="server"
                                            Text="8.34" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line21_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line21_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line22Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td rowspan="7" bgcolor="#CCCCCC" align="center" style="border: solid 1px Black;">
                                        Use these items when the R value of the insulation used to complete the work is
                                        R-27.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        48
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Attic - Blown Insulation to R-27 - Open Blow
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        S
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Cu. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line22_CostUnit_2" runat="server"
                                            Text="1.14" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line22_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line22_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line23Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        48
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Other: Wet Spray Cellulose Adder
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Cu. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line23_CostUnit_2" runat="server"
                                            Text="0.08" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line23_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line23_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line24Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        48
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Strip Cut Opening in Roof (Hrs per Unit=0.168, Mtl per Unit=0.528)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Lin. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line24_CostUnit_2" runat="server"
                                            Text="7.75" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line24_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line24_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--<td>
                                   <asp:TextBox  ID="txt_Line25Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        48
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Strip Cut Floor To Blow Insulation(Hrs per Unit=0.112, Mtl per Unit=0.00)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Sq.Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line25_CostUnit_2" runat="server"
                                            Text="4.82" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line25_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line25_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line26Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        48
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Make/Cut access cut in dry wall (Hrs per Unit=0.96, Mtl per Unit=5)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Sq.Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line26_CostUnit_2" runat="server"
                                            Text="46.28" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line26_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line26_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line27Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        48
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Drill 6" hole in wall: cap (Hrs per Unit=0.04, Mtl per Unit=2.9)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Each
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line27_CostUnit_2" runat="server"
                                            Text="4.62" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line27_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line27_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line28Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        48
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Drill 6" hole in wall:plug & 1st coat spackle (Hrs per Unit=0.112, Mtl per Unit=3.52)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Each
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line28_CostUnit_2" runat="server"
                                            Text="8.34" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line28_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line28_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line29Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td rowspan="8" bgcolor="#CCCCCC" align="center" style="border: solid 1px Black;">
                                        Use these items when the R value of the insulation used to complete the work is
                                        R-30.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        49
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Attic - Blown Insulation R-30 - Open Blow
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        S
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Cu. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line29_CostUnit_2" runat="server"
                                            Text="1.37" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line29_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line29_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line30Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        49
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Attic - Flat Roof/Ceiling/Closed Blow: Blow to R-30
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        S
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Cu. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line30_CostUnit_2" runat="server"
                                            Text="1.66" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line30_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line30_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line31Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        49
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Other:Wet Spray Cellulose Adder
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Cu. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line31_CostUnit_2" runat="server"
                                            Text="0.08" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line31_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line31_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line32Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        49
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Strip Cut Opening in Roof (Hrs per Unit=0.168, Mtl per Unit=0.528)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Lin. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line32_CostUnit_2" runat="server"
                                            Text="7.75" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line32_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line32_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line33Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        49
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Strip Cut Floor To Blow Insulation(Hrs per Unit=0.112, Mtl per Unit=0.00)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Sq. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line33_CostUnit_2" runat="server"
                                            Text="4.82" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line33_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line33_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line34Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        49
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Make/Repair access cut in dry wall (Hrs per Unit=0.96, Mtl per Unit=5)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Sq. Ft.
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line34_CostUnit_2" runat="server"
                                            Text="46.28" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line34_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line34_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line35Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        49
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Drill 6" hole in wall: cap (Hrs per Unit=0.04, Mtl per Unit=2.9)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Each
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line35_CostUnit_2" runat="server"
                                            Text="4.62" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line35_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line35_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line36Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td align="center" style="border: solid 1px Black;">
                                        49
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Drill 6" hole in wall: plaug & 1st coat spackle (Hrs per Unit=0.112, Mtl per Unit=3.52)
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Each
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line36_CostUnit_2" runat="server"
                                            Text="8.34" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line36_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line36_Total_2" runat="server" />
                                    </td>
                                </tr>
                                <tr style="border: solid 1px Black;">
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line37Location_2" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td style="border: solid 1px Black;">
                                        Attic
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        50
                                    </td>
                                    <td style="border: solid 1px Black;">
                                        Attic - Open Blow Insulation R-38
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        SC
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        Each
                                    </td>
                                    <td align="center" style="border: solid 1px Black;">
                                        43
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC" style="border: solid 1px Black;">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 50px;" ID="lbl_Line37_CostUnit_2" runat="server"
                                            Text="1.67" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox ID="txt_Line37_Qty_2" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right" style="border: solid 1px Black;">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line37_Total_2" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- Sudhanshu Invoice Page 2 end -->
                    <!-- Sudhanshu Invoice Page 3 start -->
                    <br />
                    <br />
                    <div class="divPage" style="border: 1px solid #B3B3B3; padding: 15px; width: 940px;
                        margin: 0 auto;  page-break-after: always;">
                        <div style="font-size: 11px;">
                            <table width="100%" border="1" cellspacing="0" cellpadding="0">
                                <tr>
                                    <%-- <th width="120">
                                    Location
                                </th>--%>
                                    <th width="80">
                                        Category
                                    </th>
                                    <th>
                                        LIURP
                                        <br />
                                        Code
                                    </th>
                                    <th width="610">
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
                                    <th style="width: 50px;">
                                        Cost Per Unit
                                    </th>
                                    <th>
                                        QTY<br />
                                        (all req)
                                    </th>
                                    <th style="width: 60px;">
                                        TOTAL
                                    </th>
                                </tr>
                                <tr>
                                    <%--<td>
                               <asp:TextBox  ID="txt_Line1_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">ATTIC</strong>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        1.78
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line1_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line1_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line2_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        0.08
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line2_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line2_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line3_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        7.75
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line3_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line3_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td>
                                   <asp:TextBox  ID="txt_Line4_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        4.82
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line4_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line4_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line5_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        46.28
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line5_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line5_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--   <td>
                                   <asp:TextBox  ID="txt_Line6_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        4.62
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line6_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line6_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line7_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        8.34
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line7_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line7_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--   <td>
                                   <asp:TextBox  ID="txt_Line8_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        39.60
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line8_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine8(this.id)" onkeyup="CalculateLine8(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line8_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line9_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        41.23
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line9_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine9(this.id)" onkeyup="CalculateLine9(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line9_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line10_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        73.12
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line10_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine10(this.id)" onkeyup="CalculateLine10(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line10_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line11_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        52.94
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line11_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine11(this.id)" onkeyup="CalculateLine11(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line11_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line12_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        5.18
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line12_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine12(this.id)" onkeyup="CalculateLine12(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line12_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line13_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
                                    <td>
                                    </td>
                                    <td align="center">
                                        55
                                    </td>
                                    <td>
                                        Vent - Install Dome Vent
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        45.51
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line13_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine13(this.id)" onkeyup="CalculateLine13(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line13_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line14_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        47.46
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line14_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine14(this.id)" onkeyup="CalculateLine14(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line14_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line15_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        57.66
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line15_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine15(this.id)" onkeyup="CalculateLine15(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line15_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td>
                                   <asp:TextBox  ID="txt_Line16_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        25.74
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line16_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine16(this.id)" onkeyup="CalculateLine16(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line16_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line17_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine17Code()" onkeyup="CalculateLine17Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_MeasureDesc_3" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_SC_3" runat="server" Style="width: 20px; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_THW_3" runat="server" Style="width: 50px; border: none;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_TMC_3" runat="server" Style="width: 50px; border: none;" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line17_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line17_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line18_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_MeasureDesc_3" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_SC_3" runat="server" Style="width: 20px; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_THW_3" runat="server" Style="width: 50px; border: none;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_TMC_3" runat="server" Style="width: 50px; border: none;" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line18_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line18_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line19_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">DOORS</strong>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        54.82
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line19_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine19(this.id)" onkeyup="CalculateLine19(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line19_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line20_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        8.53
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line20_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine20(this.id)" onkeyup="CalculateLine20(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line20_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line21_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        8.53
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line21_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine21(this.id)" onkeyup="CalculateLine21(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line21_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line22_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        11.14
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line22_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine22(this.id)" onkeyup="CalculateLine22(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line22_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--   <td>
                                   <asp:TextBox  ID="txt_Line23_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        27.82
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line23_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine23(this.id)" onkeyup="CalculateLine23(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line23_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line24_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        257.74
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line24_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine24(this.id)" onkeyup="CalculateLine24(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line24_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line25_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        43.38
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line25_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine25(this.id)" onkeyup="CalculateLine25(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line25_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--   <td>
                                   <asp:TextBox  ID="txt_Line26_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        301.50
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line26_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine26(this.id)" onkeyup="CalculateLine26(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line26_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line27_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        387.50
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line27_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine27(this.id)" onkeyup="CalculateLine27(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line27_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line28_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        37.30
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line28_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine28(this.id)" onkeyup="CalculateLine28(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line28_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line29_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        15.85
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line29_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine29(this.id)" onkeyup="CalculateLine29(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line29_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line30_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        15.85
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line30_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine30(this.id)" onkeyup="CalculateLine30(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line30_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line31_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        15.85
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line31_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine31(this.id)" onkeyup="CalculateLine31(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line31_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td>
                                   <asp:TextBox  ID="txt_Line32_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        44.06
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line32_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine32(this.id)" onkeyup="CalculateLine32(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line32_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line33_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line33_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line33_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine33Code()" onkeyup="CalculateLine33Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line33_MeasureDesc_3" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line33_SC_3" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine33SC()" onkeyup="CalculateLine33SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line33_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line33_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" onblur="CalculateLine33LaborRate()" onkeyup="CalculateLine33LaborRate()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line33_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine33THW()" onkeyup="CalculateLine33THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line33_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine33TMC()" onkeyup="CalculateLine33TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line33_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine33(this.id)" onkeyup="CalculateLine33(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line33_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line34_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_Cat_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_LIURP_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine34Code()" onkeyup="CalculateLine34Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_MeasureDesc_3" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_SC_3" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine34SC()" onkeyup="CalculateLine34SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_Unit_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_LaborRate_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" onblur="CalculateLine34LaborRate()" onkeyup="CalculateLine34LaborRate()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_THW_3" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine34THW()" onkeyup="CalculateLine34THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_TMC_3" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine34TMC()" onkeyup="CalculateLine34TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line34_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine34(this.id)" onkeyup="CalculateLine34(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line34_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line35_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">FLOORS</strong>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        1.14
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line35_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine35(this.id)" onkeyup="CalculateLine35(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line35_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line36_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        0.92
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line36_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine36(this.id)" onkeyup="CalculateLine36(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line36_Total_3" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line37_Location_3" runat="server" style="border:none; width:100px;"  />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        1.39
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line37_Qty_3" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine37(this.id)" onkeyup="CalculateLine37(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line37_Total_3" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- Sudhanshu Invoice Page 3 end -->
                    <!-- Sudhanshu Invoice Page 4 start -->
                    <br />
                    <br />
                    <div class="divPage" style="border: 1px solid #B3B3B3; padding: 15px; width: 940px;
                        margin: 0 auto;">
                        <div style="font-size: 11px;">
                            <table width="100%" border="1" cellspacing="0" cellpadding="0">
                                <tr>
                                    <%-- <th width="120">
                                    Location
                                </th>--%>
                                    <th width="120">
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
                                    <th style="width: 50px;">
                                        Cost Per Unit
                                    </th>
                                    <th>
                                        QTY<br />
                                        (all req)
                                    </th>
                                    <th style="width: 60px;">
                                        TOTAL
                                    </th>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line1_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">GARAGE INSUL.</strong>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        0.94
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line1_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine1(this.id)" onkeyup="CalculateLine1(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line1_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td>
                                   <asp:TextBox  ID="txt_Line2_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_Cat_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_LIURP_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine2Code()" onkeyup="CalculateLine2Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_MeasureDesc_4" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_SC_4" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine2SC()" onkeyup="CalculateLine2SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_Unit_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line2_LaborRate_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_THW_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine2THW()" onkeyup="CalculateLine2THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_TMC_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine2TMC()" onkeyup="CalculateLine2TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line2_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine2(this.id)" onkeyup="CalculateLine2(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line2_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line3_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">HVAC/ELECT.</strong>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        55.73
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line3_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine3(this.id)" onkeyup="CalculateLine3(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line3_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line4_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        43.00
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line4_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine4(this.id)" onkeyup="CalculateLine4(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line4_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line5_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        4.29
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line5_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine5(this.id)" onkeyup="CalculateLine5(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line5_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line6_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        4.54
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line6_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine6(this.id)" onkeyup="CalculateLine6(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line6_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td>
                                   <asp:TextBox  ID="txt_Line7_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        6.54
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line7_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine7(this.id)" onkeyup="CalculateLine7(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line7_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line8_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        6.81
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line8_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine8(this.id)" onkeyup="CalculateLine8(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line8_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line9_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        6.67
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line9_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine9(this.id)" onkeyup="CalculateLine9(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line9_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line10_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        6.95
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line10_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine10(this.id)" onkeyup="CalculateLine10(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line10_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line11_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        6.98
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line11_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine11(this.id)" onkeyup="CalculateLine11(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line11_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line12_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        6.98
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line12_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine12(this.id)" onkeyup="CalculateLine12(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line12_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line13_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        7.10
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line13_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine13(this.id)" onkeyup="CalculateLine13(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line13_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line14_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        7.10
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line14_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine14(this.id)" onkeyup="CalculateLine14(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line14_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line15_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        9.29
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line15_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine15(this.id)" onkeyup="CalculateLine15(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line15_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line16_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        22.65
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line16_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine16(this.id)" onkeyup="CalculateLine16(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line16_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line17_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        36.49
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line17_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine17(this.id)" onkeyup="CalculateLine17(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line17_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line18_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_Cat_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_LIURP_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine18Code()" onkeyup="CalculateLine18Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_MeasureDesc_4" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_SC_4" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine18SC()" onkeyup="CalculateLine18SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_Unit_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_LaborRate_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_THW_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine18THW()" onkeyup="CalculateLine18THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_TMC_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine18TMC()" onkeyup="CalculateLine18TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line18_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine18(this.id)" onkeyup="CalculateLine18(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line18_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line19_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_Cat_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_LIURP_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine19Code()" onkeyup="CalculateLine19Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_MeasureDesc_4" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_SC_4" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine19SC()" onkeyup="CalculateLine19SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_Unit_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_LaborRate_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_THW_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine19THW()" onkeyup="CalculateLine19THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_TMC_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine19TMC()" onkeyup="CalculateLine19TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line19_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine19(this.id)" onkeyup="CalculateLine19(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line19_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line20_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">MISC.</strong>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        74.00
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line20_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine20(this.id)" onkeyup="CalculateLine20(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line20_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line21_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        80.40
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line21_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine21(this.id)" onkeyup="CalculateLine21(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line21_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line22_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        31.69
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line22_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine22(this.id)" onkeyup="CalculateLine22(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line22_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line23_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_Cat_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_LIURP_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine23Code()" onkeyup="CalculateLine23Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_MeasureDesc_4" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_SC_4" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine23SC()" onkeyup="CalculateLine23SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_Unit_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line23_LaborRate_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_THW_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine23THW()" onkeyup="CalculateLine23THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line23_TMC_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine23TMC()" onkeyup="CalculateLine23TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line23_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line23_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line24_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">MOBILE HOME</strong>
                                        <%--<asp:TextBox ID="txt_Line24_Cat_4" runat="server" Style="width: 70px; border: none;
                                        font-size: 11px;" value="MOBILE HOME" />--%>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line24_LIURP_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine24Code()" onkeyup="CalculateLine24Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line24_MeasureDesc_4" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_SC_4" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine24SC()" onkeyup="CalculateLine24SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_Unit_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line24_LaborRate_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line24_THW_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine24THW()" onkeyup="CalculateLine24THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line24_TMC_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine24TMC()" onkeyup="CalculateLine24TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line24_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine24(this.id)" onkeyup="CalculateLine24(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line24_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line25_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line25_Cat_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line25_LIURP_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine25Code()" onkeyup="CalculateLine25Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line25_MeasureDesc_4" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line25_SC_4" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine25SC()" onkeyup="CalculateLine25SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line25_Unit_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line25_LaborRate_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line25_THW_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine25THW()" onkeyup="CalculateLine25THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line25_TMC_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine25TMC()" onkeyup="CalculateLine25TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line25_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine25(this.id)" onkeyup="CalculateLine25(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line25_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--   <td>
                                   <asp:TextBox  ID="txt_Line26_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line26_Cat_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line26_LIURP_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine26Code()" onkeyup="CalculateLine26Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line26_MeasureDesc_4" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_SC_4" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine26SC()" onkeyup="CalculateLine26SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_Unit_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line26_LaborRate_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line26_THW_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine26THW()" onkeyup="CalculateLine26THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line26_TMC_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine26TMC()" onkeyup="CalculateLine26TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line26_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine26(this.id)" onkeyup="CalculateLine26(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line26_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line27_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">WALLS</strong>
                                        <%--<asp:TextBox ID="txt_Line27_Cat_4" runat="server" value="WALLS" Style="font-size: 14px;
                                        font-weight: bolder; width: 70px; border: none; font-size: 11px;" />--%>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line27_LIURP_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine27Code()" onkeyup="CalculateLine27Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line27_MeasureDesc_4" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line27_SC_4" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine27SC()" onkeyup="CalculateLine27SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line27_Unit_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line27_LaborRate_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line27_THW_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine27THW()" onkeyup="CalculateLine27THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line27_TMC_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine27TMC()" onkeyup="CalculateLine27TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line27_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine27(this.id)" onkeyup="CalculateLine27(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line27_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line28_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line28_Cat_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line28_LIURP_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine28Code()" onkeyup="CalculateLine28Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line28_MeasureDesc_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line28_SC_4" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine28SC()" onkeyup="CalculateLine28SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line28_Unit_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line28_LaborRate_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line28_THW_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine28THW()" onkeyup="CalculateLine28THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line28_TMC_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine28TMC()" onkeyup="CalculateLine28TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line28_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine28(this.id)" onkeyup="CalculateLine28(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line28_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line29_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_cat_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_LIURP_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine29Code()" onkeyup="CalculateLine29Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_MeasureDesc_4" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_SC_4" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine29SC()" onkeyup="CalculateLine29SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_Unit_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_LaborRate_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_THW_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine29THW()" onkeyup="CalculateLine29THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_TMC_4" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine29TMC()" onkeyup="CalculateLine29TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line29_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine29(this.id)" onkeyup="CalculateLine29(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line29_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line30_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">WATER HEATING</strong>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        15.85
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line30_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine30(this.id)" onkeyup="CalculateLine30(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line30_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--   <td>
                                   <asp:TextBox  ID="txt_Line31_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        15.85
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line31_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine31(this.id)" onkeyup="CalculateLine31(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line31_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line32_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        130.58
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line32_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine32(this.id)" onkeyup="CalculateLine32(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line32_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line33_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        130.58
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line33_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine33(this.id)" onkeyup="CalculateLine33(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line33_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line34_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        130.58
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line34_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine34(this.id)" onkeyup="CalculateLine34(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line34_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line35_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        3.68
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line35_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine35(this.id)" onkeyup="CalculateLine35(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line35_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                   <asp:TextBox  ID="txt_Line36_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        22.77
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line36_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine36(this.id)" onkeyup="CalculateLine36(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line36_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line37_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        1.95
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line37_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine37(this.id)" onkeyup="CalculateLine37(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line37_Total_4" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                                   <asp:TextBox  ID="txt_Line38_Location_4" runat="server" style="border:none; width:100px;" />
                                </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        2.62
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line38_Qty_4" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine38(this.id)" onkeyup="CalculateLine38(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 60px;" ID="txt_Line38_Total_4" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- Sudhanshu Invoice Page 4 end -->
                    <!-- Sudhanshu Invoice Page 5 start -->
                    <br />
                    <br />
                    <div class="divPage" style="border: 1px solid #B3B3B3; padding: 15px; width: 940px;
                        margin: 0 auto;">
                        <div style="font-size: 11px;">
                            <table width="100%" border="1" cellspacing="0" cellpadding="0">
                                <tr>
                                    <%--  <th width="120">
                        Location
                    </th>--%>
                                    <th width="160">
                                        Category
                                    </th>
                                    <th>
                                        LIURP
                                        <br />
                                        Code
                                    </th>
                                    <th width="610">
                                        MEASURE DESCRIPTION
                                    </th>
                                    <th>
                                        S/C
                                    </th>
                                    <th width="50" align="center">
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
                                    <%--<td>
                       <asp:TextBox  ID="txt_Line1_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">WATER HEATING</strong>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        2.36
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line1_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine1(this.id)" onkeyup="CalculateLine1(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line1_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line2_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        1.50
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line2_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine2(this.id)" onkeyup="CalculateLine2(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line2_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line3_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        2.83
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line3_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine3(this.id)" onkeyup="CalculateLine3(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line3_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line4_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        1.61
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line4_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine4(this.id)" onkeyup="CalculateLine4(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line4_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line5_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        5.50
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line5_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine5(this.id)" onkeyup="CalculateLine5(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line5_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line6_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        58.57
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line6_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine6(this.id)" onkeyup="CalculateLine6(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line6_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--   <td>
                       <asp:TextBox  ID="txt_Line7_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        591.60
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line7_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine7(this.id)" onkeyup="CalculateLine7(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line7_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line8_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        592.40
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line8_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine8(this.id)" onkeyup="CalculateLine8(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line8_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line9_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        581.60
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line9_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine9(this.id)" onkeyup="CalculateLine9(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line9_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line10_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        5.29
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line10_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine10(this.id)" onkeyup="CalculateLine10(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line10_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td>
                       <asp:TextBox  ID="txt_Line11_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        2592.04
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line11_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine11(this.id)" onkeyup="CalculateLine11(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line11_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                       <asp:TextBox  ID="txt_Line12_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line12_Cat" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line12_LIURP" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine12Code()" onkeyup="CalculateLine12Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line12_MeasureDesc" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_SC" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine12SC()" onkeyup="CalculateLine12SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_Unit" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_LaborRate" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line12_THW" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine12THW()" onkeyup="CalculateLine12THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line12_TMC" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine12TMC()" onkeyup="CalculateLine12TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line12_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine12(this.id)" onkeyup="CalculateLine12(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line12_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line13_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line13_Cat" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line13_LIURP" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine13Code()" onkeyup="CalculateLine13Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line13_MeasureDesc" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line13_SC" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine13SC()" onkeyup="CalculateLine13SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line13_Unit" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line13_LaborRate" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line13_THW" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine13THW()" onkeyup="CalculateLine13THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line13_TMC" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine13TMC()" onkeyup="CalculateLine13TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line13_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine13(this.id)" onkeyup="CalculateLine13(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line13_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line14_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
                                    <td>
                                        <strong style="font-size: 14px; font-weight: bolder;">WINDOWS</strong>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        27.86
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line14_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine14(this.id)" onkeyup="CalculateLine14(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line14_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td>
                       <asp:TextBox  ID="txt_Line15_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
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
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" style="width: 50px; border: none;" readonly="readonly" />
                                    </td>
                                    <td align="right">
                                        3.17
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line15_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine15(this.id)" onkeyup="CalculateLine15(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line15_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line16_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_Cat" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_LIURP" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine16Code()" onkeyup="CalculateLine16Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_MeasureDesc" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_SC" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine16SC()" onkeyup="CalculateLine16SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_Unit" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_LaborRate" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_THW" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine16THW()" onkeyup="CalculateLine16THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_TMC" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine16TMC()" onkeyup="CalculateLine16TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line16_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine16(this.id)" onkeyup="CalculateLine16(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line16_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="11" align="center">
                                        <strong>Use the space below for custom items with other categories, see listing. You
                                            may use this space also if there is not enough room under the categories above.</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line17_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_Cat" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_LIURP" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine17Code()" onkeyup="CalculateLine17Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_MeasureDesc" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_SC" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine17SC()" onkeyup="CalculateLine17SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_Unit" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line17_LaborRate" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_THW" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine17THW()" onkeyup="CalculateLine17THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_TMC" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine17TMC()" onkeyup="CalculateLine17TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line17_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine17(this.id)" onkeyup="CalculateLine17(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line17_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line18_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_Cat" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_LIURP" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine18Code()" onkeyup="CalculateLine18Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_MeasureDesc" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_SC" runat="server" Style="width: 100%; border: none;"
                                            onblur="CalculateLine18SC()" onkeyup="CalculateLine18SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_Unit" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line18_LaborRate" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_THW" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine18THW()" onkeyup="CalculateLine18THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_TMC" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine18TMC()" onkeyup="CalculateLine18TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line18_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine18(this.id)" onkeyup="CalculateLine18(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line18_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line19_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_Cat" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_LIURP" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine19Code()" onkeyup="CalculateLine19Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_MeasureDesc" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_SC" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine19SC()" onkeyup="CalculateLine19SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_Unit" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_LaborRate" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_THW" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine19THW()" onkeyup="CalculateLine19THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_TMC" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine19TMC()" onkeyup="CalculateLine19TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line19_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine19(this.id)" onkeyup="CalculateLine19(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line19_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                       <asp:TextBox  ID="txt_Line20_Location" runat="server" style="border:none; width:100px;" />
                    </td>--%>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_Cat" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_LIURP" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine20Code()" onkeyup="CalculateLine20Code()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_MeasureDesc" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_SC" runat="server" Style="width: 20px; border: none;"
                                            onblur="CalculateLine20SC()" onkeyup="CalculateLine20SC()" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_Unit" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" />
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_LaborRate" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" Text="43/68" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_THW" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine20THW()" onkeyup="CalculateLine20THW()" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_TMC" runat="server" Style="width: 50px; border: none;"
                                            onblur="CalculateLine20TMC()" onkeyup="CalculateLine20TMC()" />
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line20_Qty" runat="server" Style="width: 40px; border: none;
                                            text-align: right;" onblur="CalculateLine20(this.id)" onkeyup="CalculateLine20(this.id)" />
                                    </td>
                                    <td align="right">
                                        <asp:TextBox Style="border: none; width: 80px;" ID="txt_Line20_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8">
                                        Page1=<asp:TextBox ID="txt_TotalPage1" runat="server" Style="width: 70px; border: none;
                                            font-size: 11px;" Text="$0.00" />Page2=<asp:TextBox ID="txt_TotalPage2" runat="server"
                                                Style="width: 70px; border: none; font-size: 11px;" Text="$0.00" />Page3=<asp:TextBox
                                                    ID="txt_TotalPage3" runat="server" Style="width: 70px; border: none; font-size: 11px;"
                                                    Text="$0.00" />Page4=<asp:TextBox ID="txt_TotalPage4" runat="server" Style="width: 70px;
                                                        border: none; font-size: 11px;" Text="$0.00" />Page5=<asp:TextBox ID="txt_TotalPage5"
                                                            runat="server" Style="width: 70px; border: none; font-size: 11px;" Text="$0.00" />(Page
                                        5 and Invoice total not current until SAVE)
                                    </td>
                                    <td colspan="2">
                                        <strong>INVOICE TOTAL:</strong>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_GrandTotal" runat="server" Style="width: 75%; border: none;"
                                            Text="$0.00" Font-Bold="true" />
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
                                            width: 100%;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine1Name" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine1CallDate" runat="server" Style="width: 70px;
                                            border: none; font-size: 11px;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine1Comments" runat="server" Style="width: 100%;
                                            border: none;" TextMode="MultiLine" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine2Type" runat="server" value="Plumbing" Style="border: none;
                                            width: 100%;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine2Name" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine2CallDate" runat="server" Style="width: 70px;
                                            border: none; font-size: 11px;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine2Comments" runat="server" Style="width: 100%;
                                            border: none;" TextMode="MultiLine" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine3Type" runat="server" value="Furnace/Heat Pump"
                                            Style="border: none; width: 100%;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine3Name" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine3CallDate" runat="server" Style="width: 70px;
                                            border: none; font-size: 11px;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine3Comments" runat="server" Style="width: 100%;
                                            border: none;" TextMode="MultiLine" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine4Type" runat="server" value="" Style="border: none;
                                            width: 100%;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine4Name" runat="server" Style="width: 100%; border: none;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine4CallDate" runat="server" Style="width: 70px;
                                            border: none; font-size: 11px;" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ContractorLine4Comments" runat="server" Style="width: 100%;
                                            border: none;" TextMode="MultiLine" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        Date Invoice Submitted
                                        <asp:TextBox ID="txt_DateInvoiceSubmitted" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 17%;" />
                                        I hearby attest that all of the work invoiced was completed on the date stated on
                                        the invoice.
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        Date Work Completed
                                        <asp:TextBox ID="txt_DateWorkCompleted" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 17%;" />
                                        Signature of Contractor:
                                        <asp:TextBox ID="txt_SignatureofContractor" runat="server" Style="width: 250px; text-align: center;
                                            border: none; border-bottom: solid 1px rgb(219, 219, 219); padding-bottom: 5px;
                                            font-weight: bold; font-size: 12px; color: #666666;" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- Sudhanshu Invoice Page 5 end -->
                    <%--</div>--%>
                    <!--main_right end-->
                    <div style="clear: left;">
                    </div>
                </div>
                <!--main div end-->
            </div>
            <!-- end form section -->
            <div style="clear: left;">
            </div>
            <!-- footer -->
            <div style="border-top: 1px solid #cfcfcf; font-size: 14px; color: #717171; padding: 20px 0;
                text-align: center;">
                Custom Weatherization, LLC © 2013</div>
            <%--http://stackoverflow.com/questions/468881/print-div-id-printarea-div-only--%>
            <!-- end footer -->
        </div>
    </div>
    </form>
    <%-- <script language="javascript" type="text/javascript">

        function Clicktoprint() {
        #DivHeader{display:none;}
.divPage{page-break-after:always;-ms-transform: rotate(90deg); /* IE 9 */

}
            window.print();
        }
        
    </script>--%>

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
            docprint.document.write('<style>   body {margin: 0; padding: 0; background-color: #FAFAFA; font: 12pt "Tahoma";}* {box-sizing: border-box;-moz-box-sizing: border-box;}#DivPrint {-ms-transform:rotate(90deg);-webkit-transform:rotate(90deg);transform:rotate(90deg); width:100%; min-height: 29.7cm; padding: 2cm; margin: 1cm auto; border: 1px #D3D3D3 solid; border-radius: 5px; background: white; box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);}@page {size: A4;margin: 0;}@media print {#DivPrint {width:100%;margin: 0;border: initial;border-radius: initial;width: initial;min-height: initial;box-shadow: initial;background: initial;page-break-after: always;}}</style> ');

            docprint.document.write('</head><body onLoad="self.print()"><center>');
            docprint.document.write(content_vlue);
            docprint.document.write('</center></body></html>');
            docprint.document.close();
            docprint.focus();
        }    
    </script>


    <%--<script language="javascript" type="text/javascript">
    
        function Clickheretoprint() {
            var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
            disp_setting += "scrollbars=yes,width=650, height=600, left=100, top=25";
            var content_vlue = document.getElementById('DivPrint').innerHTML;

            var docprint = window.open("", "", disp_setting);
            docprint.document.open();
            docprint.document.write('<html><head><title>Custom Weatherization/ PPL Invoice Page</title>');
            docprint.document.write('<style type="text/css" media="print"> .Landscape  {  width: 100%; height: 100%;  margin: 0% 0% 0% 0%; filter: progid:DXImageTransform.Microsoft.BasicImage(Rotation=3); size:landscape;}  </style> ');
            docprint.document.write('</head><body class="Landscape"   onLoad="window.print();"><center>');
            docprint.document.write(content_vlue);
            docprint.document.write('</center></body></html>');
            docprint.document.close();
            docprint.focus();
        }
        
    </script>--%>

    <script type="text/javascript">
        // This jQuery code makes all check boxes read-only
        $(':checkbox').click(function() {
            return false;
        });
    </script>

    <script type="text/javascript">
        // This jQuery code makes all radio button read-only
        $(':radio').click(function() {
            return false;
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#fix_div input[type=text]').attr("readonly", "readonly");
            $('#fix_div input[type="text"], textarea').attr('readonly', 'readonly');
        });
    </script>

</body>
</html>
