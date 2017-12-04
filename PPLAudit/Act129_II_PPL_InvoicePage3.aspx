<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Act129_II_PPL_InvoicePage3.aspx.cs"
    Inherits="PPLAudit_Act129_II_PPL_InvoicePage3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
            font-size: 12px;
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
        .inv_table th, td
        {
            font-size: 12px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                <asp:LinkButton ID="lnkLogin" runat="server" Text="Logout" OnClick="lnkLogin_Click"></asp:LinkButton>
                <%--OnClick="lnkLogin_Click"--%>
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
                    Go to page: <a href="Act129_II_PPL_InvoicePage1.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                        1</a> <a href="Act129_II_PPL_InvoicePage2.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
                            2</a> <a class="active" href="Act129_II_PPL_InvoicePage3.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
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
                <!--  HEADER Section End   -->
                <asp:Panel ID="panelReadOnly" runat="server">
                    <div class="inv_table">
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
                                    <asp:TextBox ID="txt_Line1_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line1_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine1Code()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line1_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line1_SC" runat="server" class="txt_val" onkeyup="CalculateLine1SC()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line1_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line1_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        Style="text-align: center;" onkeyup="CalculateLine1LaborRate()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line1_THW" runat="server" class="txt_thw" onkeyup="CalculateLine1THW()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line1_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine1TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC" align="center">
                                    <asp:TextBox ID="txt_Line1_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                    <asp:TextBox ID="txt_Line2_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line2_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine2Code()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line2_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line2_SC" runat="server" class="txt_val" onkeyup="CalculateLine2SC()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line2_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line2_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        Style="text-align: center;" onkeyup="CalculateLine2LaborRate()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line2_THW" runat="server" class="txt_thw" onkeyup="CalculateLine2THW()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line2_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine2TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC" align="center">
                                    <asp:TextBox ID="txt_Line2_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                <td>
                                    <asp:TextBox ID="txt_Line3_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine3Code()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line3_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line3_SC" runat="server" class="txt_val" onkeyup="CalculateLine3SC()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line3_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line3_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        Style="text-align: center;" onkeyup="CalculateLine3LaborRate()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line3_THW" runat="server" class="txt_thw" onkeyup="CalculateLine3THW()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line3_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine3TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC" align="center">
                                    <asp:TextBox ID="txt_Line3_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                    <asp:TextBox ID="txt_Line4_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line4_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine4Code()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line4_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line4_SC" runat="server" class="txt_val" onkeyup="CalculateLine4SC()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line4_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line4_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        Style="text-align: center;" onkeyup="CalculateLine4LaborRate()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line4_THW" runat="server" class="txt_thw" onkeyup="CalculateLine4THW()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line4_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine4TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC" align="center">
                                    <asp:TextBox ID="txt_Line4_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                    <asp:TextBox ID="txt_Line5_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line5_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine5Code()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line5_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line5_SC" runat="server" class="txt_val" onkeyup="CalculateLine5SC()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line5_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line5_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        Style="text-align: center;" onkeyup="CalculateLine5LaborRate()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line5_THW" runat="server" class="txt_thw" onkeyup="CalculateLine5THW()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line5_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine5TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC" align="center">
                                    <asp:TextBox ID="txt_Line5_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                    <asp:TextBox ID="txt_Line6_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line6_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine6Code()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line6_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line6_SC" runat="server" class="txt_val" onkeyup="CalculateLine6SC()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line6_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line6_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        Style="text-align: center;" onkeyup="CalculateLine6LaborRate()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line6_THW" runat="server" class="txt_thw" onkeyup="CalculateLine6THW()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line6_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine6TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC" align="center">
                                    <asp:TextBox ID="txt_Line6_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                    <asp:TextBox ID="txt_Line7_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line7_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine7Code()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line7_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line7_SC" runat="server" class="txt_val" onkeyup="CalculateLine7SC()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line7_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line7_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        Style="text-align: center;" onkeyup="CalculateLine7LaborRate()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line7_THW" runat="server" class="txt_thw" onkeyup="CalculateLine7THW()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line7_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine7TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC" align="center">
                                    <asp:TextBox ID="txt_Line7_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                    <asp:TextBox ID="txt_Line8_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line8_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine8Code()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line8_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line8_SC" runat="server" class="txt_val" onkeyup="CalculateLine8SC()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line8_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line8_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        Style="text-align: center;" onkeyup="CalculateLine8LaborRate()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line8_THW" runat="server" class="txt_thw" onkeyup="CalculateLine8THW()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line8_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine8TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC" align="center">
                                    <asp:TextBox ID="txt_Line8_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                    <asp:TextBox ID="txt_Line9_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line9_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine9Code()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line9_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line9_SC" runat="server" class="txt_val" onkeyup="CalculateLine9SC()"
                                        Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line9_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line9_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        Style="text-align: center;" onkeyup="CalculateLine9LaborRate()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line9_THW" runat="server" class="txt_thw" onkeyup="CalculateLine9THW()"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line9_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine9TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC" align="center">
                                    <asp:TextBox ID="txt_Line9_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line11_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line11_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine11Code()"
                                        Style="text-align: center;"></asp:TextBox>
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
                            </tr>
                            <tr>
                                <td colspan="12" align="center">
                                    <strong>Use this space for custom items with other categories, see listing. You may
                                        use this space also if there is not enough room under the categories above.</strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_Line18_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line18_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine18Code()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line18_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:Label ID="txt_Line18_SC" runat="server" Text="C" Style="text-decoration: none;"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line18_Unit" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line18_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        onkeyup="CalculateLine18LaborRate()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line18_THW" runat="server" class="txt_thw" onkeyup="CalculateLine18THW()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line18_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine18TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
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
                                    <asp:TextBox ID="txt_Line19_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line19_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine19Code()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line19_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:Label ID="txt_Line19_SC" runat="server" Text="C" Style="text-decoration: none;"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line19_Unit" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line19_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        onkeyup="CalculateLine19LaborRate()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line19_THW" runat="server" class="txt_thw" onkeyup="CalculateLine19THW()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line19_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine19TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
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
                                    <asp:TextBox ID="txt_Line20_Cat" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line20_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine20Code()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line20_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:Label ID="txt_Line20_SC" runat="server" Text="C" Style="text-decoration: none;"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line20_Unit" runat="server" class="txt_val"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Line20_LaborRate" runat="server" class="txt_val" Text="45/70"
                                        onkeyup="CalculateLine20LaborRate()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line20_THW" runat="server" class="txt_thw" onkeyup="CalculateLine20THW()"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Line20_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine20TMC()"></asp:TextBox>
                                </td>
                                <td bgcolor="#CCCCCC">
                                    <input type="text" class="txt_thw" disabled="disabled" />
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
                                <td colspan="8">
                                    Page1=<asp:TextBox ID="txt_TotalPage1" runat="server" class="txt_mob" value="$151.95"
                                        onblur="CalculateGrandTotal()" onkeyup="CalculateGrandTotal()"></asp:TextBox>Page2=<asp:TextBox
                                            ID="txt_TotalPage2" runat="server" class="txt_mob" value="$1,214.95" onblur="CalculateGrandTotal()"
                                            onkeyup="CalculateGrandTotal()"></asp:TextBox>Page3=<asp:TextBox ID="txt_TotalPage3"
                                                runat="server" class="txt_mob" value="$59.91" onblur="CalculateGrandTotal()"
                                                onkeyup="CalculateGrandTotal()"></asp:TextBox><%--Page4=<asp:TextBox ID="txt_TotalPage4"
                                                    runat="server" class="txt_mob" value="$38.62" onblur="CalculateGrandTotal()"
                                                    onkeyup="CalculateGrandTotal()"></asp:TextBox>Page5=<asp:TextBox ID="txt_TotalPage5"
                                                        runat="server" class="txt_mob" value="$136.00" onblur="CalculateGrandTotal()"
                                                        onkeyup="CalculateGrandTotal()"></asp:TextBox>--%>(Page 3 and
                                    Invoice total not current until SAVE)
                                </td>
                                <td colspan="2">
                                    <strong>INVOICE TOTAL:</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_GrandTotal" runat="server" class="new_field" Text="$1,601.43"
                                        Font-Bold="true"></asp:TextBox>
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
                                    <asp:TextBox ID="TextBox1" runat="server" class="txt_Deg"></asp:TextBox>
                                    <%-- <ajaxToolkit:CalendarExtender ID="Calander" runat="server" TargetControlID="txt_DateInvoiceSubmitted"
                                        OnClientDateSelectionChanged="checkDate">
                                    </ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server"
                                        TargetControlID="txt_DateInvoiceSubmitted" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxToolkit:FilteredTextBoxExtender>--%>
                                    I hearby attest that all of the work invoiced was completed on the date stated on
                                    the invoice.
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Date Work Completed
                                    <asp:TextBox ID="txt_DateWorkCompleted" runat="server" class="txt_Deg" ReadOnly="true"></asp:TextBox>
                                    <%--  <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_DateWorkCompleted"
                                        OnClientDateSelectionChanged="checkDate">
                                    </ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                        TargetControlID="txt_DateWorkCompleted" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxToolkit:FilteredTextBoxExtender>--%>
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

            TotalPage1 = TotalPage1.replace('$', '');
            TotalPage2 = TotalPage2.replace('$', '');
            TotalPage3 = TotalPage3.replace('$', '');


            if (isNaN(TotalPage1) || TotalPage1 == '') {
                TotalPage1 = 0;
            }
            if (isNaN(TotalPage2) || TotalPage2 == '') {
                TotalPage2 = 0;
            }
            if (isNaN(TotalPage3) || TotalPage3 == '') {
                TotalPage3 = 0;
            }


            var GrandTotal = parseInt(TotalPage1) + parseInt(TotalPage2) + parseInt(TotalPage3);
            document.getElementById('<%=txt_GrandTotal.ClientID %>').value = '$' + GrandTotal;
        }

        //------------------------------------------------



        function CalculateLine1LaborRate() {
            var len = document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine1THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line1_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line1_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line1_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line1_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine1();
            }
        }


        function CalculateLine1TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line1_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line1_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line1_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line1_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine1();
            }
        }



        function CalculateLine1SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line1_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line1_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line1_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line1_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line1_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine1Code() {
            if (document.getElementById('<%=txt_Line1_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line1_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line1_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line1_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line1_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line1_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line1_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line1_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line1_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line1_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line1_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line1_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line1_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line1_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line1_Qty.ClientID %>').value = Qty;

                    var Line1_Total = document.getElementById('<%=txt_Line1_Total.ClientID %>');
                    Line1_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line1_Total.innerHTML = "$" + Line1_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line1_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line1_Total.innerHTML = "$" + Line1_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine1() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line1_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line1_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line1_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line1_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line1_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line1_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line1_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line1_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line1_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line1_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line1_Qty.ClientID %>').value = '';
                        }
                        var Line1_Total = document.getElementById('<%=txt_Line1_Total.ClientID %>');
                        Line1_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line1_Total.innerHTML);
                        num = num.toFixed(2);
                        Line1_Total.innerHTML = num;
                        Line1_Total.innerHTML = "$" + Line1_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line1_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line1_Total.innerHTML);
                            num = num.toFixed(2);
                            Line1_Total.innerHTML = num;
                            Line1_Total.innerHTML = "$" + Line1_Total.innerHTML;
                            document.getElementById('<%=hdn_Line1_Total.ClientID %>').value = Line1_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line1_Total.ClientID %>').value = Line1_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------


        function CalculateLine2LaborRate() {
            var len = document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
            if (document.getElementById('<%=txt_Line2_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line2_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line2_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line2_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line2_LIURP.ClientID %>').readonly = true;
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
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line2_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line2_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line2_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line2_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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

        //----------------------------------------


        function CalculateLine3LaborRate() {
            var len = document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine3THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line3_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line3_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line3_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line3_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine3();
            }
        }


        function CalculateLine3TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line3_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line3_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line3_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line3_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine3();
            }
        }



        function CalculateLine3SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line3_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line3_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line3_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line3_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line3_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine3Code() {
            if (document.getElementById('<%=txt_Line3_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line3_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line3_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line3_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line3_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line3_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line3_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line3_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line3_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line3_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line3_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line3_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line3_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line3_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line3_Qty.ClientID %>').value = Qty;

                    var Line3_Total = document.getElementById('<%=txt_Line3_Total.ClientID %>');
                    Line3_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line3_Total.innerHTML = "$" + Line3_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line3_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line3_Total.innerHTML = "$" + Line3_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine3() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line3_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line3_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line3_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line3_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line3_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line3_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line3_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line3_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line3_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line3_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line3_Qty.ClientID %>').value = '';
                        }
                        var Line3_Total = document.getElementById('<%=txt_Line3_Total.ClientID %>');
                        Line3_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line3_Total.innerHTML);
                        num = num.toFixed(2);
                        Line3_Total.innerHTML = num;
                        Line3_Total.innerHTML = "$" + Line3_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line3_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line3_Total.innerHTML);
                            num = num.toFixed(2);
                            Line3_Total.innerHTML = num;
                            Line3_Total.innerHTML = "$" + Line3_Total.innerHTML;
                            document.getElementById('<%=hdn_Line3_Total.ClientID %>').value = Line3_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line3_Total.ClientID %>').value = Line3_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------

        function CalculateLine4LaborRate() {
            var len = document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine4THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line4_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line4_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line4_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line4_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine4();
            }
        }


        function CalculateLine4TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line4_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line4_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line4_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line4_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine4();
            }
        }



        function CalculateLine4SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line4_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line4_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line4_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line4_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line4_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine4Code() {
            if (document.getElementById('<%=txt_Line4_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line4_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line4_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line4_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line4_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line4_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line4_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line4_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line4_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line4_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line4_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line4_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line4_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line4_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line4_Qty.ClientID %>').value = Qty;

                    var Line4_Total = document.getElementById('<%=txt_Line4_Total.ClientID %>');
                    Line4_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line4_Total.innerHTML = "$" + Line4_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line4_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line4_Total.innerHTML = "$" + Line4_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine4() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line4_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line4_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line4_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line4_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line4_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line4_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line4_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line4_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line4_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line4_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line4_Qty.ClientID %>').value = '';
                        }
                        var Line4_Total = document.getElementById('<%=txt_Line4_Total.ClientID %>');
                        Line4_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line4_Total.innerHTML);
                        num = num.toFixed(2);
                        Line4_Total.innerHTML = num;
                        Line4_Total.innerHTML = "$" + Line4_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line4_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line4_Total.innerHTML);
                            num = num.toFixed(2);
                            Line4_Total.innerHTML = num;
                            Line4_Total.innerHTML = "$" + Line4_Total.innerHTML;
                            document.getElementById('<%=hdn_Line4_Total.ClientID %>').value = Line4_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line4_Total.ClientID %>').value = Line4_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------


        function CalculateLine5LaborRate() {
            var len = document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine5THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line5_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line5_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line5_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line5_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine5();
            }
        }


        function CalculateLine5TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line5_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line5_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line5_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line5_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine5();
            }
        }



        function CalculateLine5SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line5_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line5_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line5_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line5_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line5_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine5Code() {
            if (document.getElementById('<%=txt_Line5_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line5_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line5_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line5_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line5_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line5_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line5_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line5_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line5_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line5_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line5_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line5_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line5_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line5_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line5_Qty.ClientID %>').value = Qty;

                    var Line5_Total = document.getElementById('<%=txt_Line5_Total.ClientID %>');
                    Line5_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line5_Total.innerHTML = "$" + Line5_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line5_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line5_Total.innerHTML = "$" + Line5_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine5() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line5_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line5_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line5_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line5_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line5_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line5_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line5_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line5_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line5_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line5_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line5_Qty.ClientID %>').value = '';
                        }
                        var Line5_Total = document.getElementById('<%=txt_Line5_Total.ClientID %>');
                        Line5_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line5_Total.innerHTML);
                        num = num.toFixed(2);
                        Line5_Total.innerHTML = num;
                        Line5_Total.innerHTML = "$" + Line5_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line5_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line5_Total.innerHTML);
                            num = num.toFixed(2);
                            Line5_Total.innerHTML = num;
                            Line5_Total.innerHTML = "$" + Line5_Total.innerHTML;
                            document.getElementById('<%=hdn_Line5_Total.ClientID %>').value = Line5_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line5_Total.ClientID %>').value = Line5_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------


        function CalculateLine6LaborRate() {
            var len = document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine6THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line6_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line6_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line6_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line6_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine6();
            }
        }


        function CalculateLine6TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line6_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line6_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line6_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line6_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine6();
            }
        }



        function CalculateLine6SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line6_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line6_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line6_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line6_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line6_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine6Code() {
            if (document.getElementById('<%=txt_Line6_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line6_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line6_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line6_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line6_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line6_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line6_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line6_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line6_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line6_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line6_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line6_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line6_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line6_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line6_Qty.ClientID %>').value = Qty;

                    var Line6_Total = document.getElementById('<%=txt_Line6_Total.ClientID %>');
                    Line6_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line6_Total.innerHTML = "$" + Line6_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line6_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line6_Total.innerHTML = "$" + Line6_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine6() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line6_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line6_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line6_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line6_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line6_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line6_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line6_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line6_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line6_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line6_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line6_Qty.ClientID %>').value = '';
                        }
                        var Line6_Total = document.getElementById('<%=txt_Line6_Total.ClientID %>');
                        Line6_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line6_Total.innerHTML);
                        num = num.toFixed(2);
                        Line6_Total.innerHTML = num;
                        Line6_Total.innerHTML = "$" + Line6_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line6_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line6_Total.innerHTML);
                            num = num.toFixed(2);
                            Line6_Total.innerHTML = num;
                            Line6_Total.innerHTML = "$" + Line6_Total.innerHTML;
                            document.getElementById('<%=hdn_Line6_Total.ClientID %>').value = Line6_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line6_Total.ClientID %>').value = Line6_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------


        function CalculateLine7LaborRate() {
            var len = document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine7THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line7_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line7_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line7_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line7_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine7();
            }
        }


        function CalculateLine7TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line7_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line7_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line7_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line7_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine7();
            }
        }



        function CalculateLine7SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line7_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line7_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line7_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line7_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line7_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine7Code() {
            if (document.getElementById('<%=txt_Line7_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line7_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line7_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line7_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line7_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line7_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line7_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line7_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line7_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line7_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line7_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line7_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line7_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line7_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line7_Qty.ClientID %>').value = Qty;

                    var Line7_Total = document.getElementById('<%=txt_Line7_Total.ClientID %>');
                    Line7_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line7_Total.innerHTML = "$" + Line7_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line7_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line7_Total.innerHTML = "$" + Line7_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine7() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line7_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line7_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line7_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line7_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line7_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line7_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line7_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line7_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line7_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line7_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line7_Qty.ClientID %>').value = '';
                        }
                        var Line7_Total = document.getElementById('<%=txt_Line7_Total.ClientID %>');
                        Line7_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line7_Total.innerHTML);
                        num = num.toFixed(2);
                        Line7_Total.innerHTML = num;
                        Line7_Total.innerHTML = "$" + Line7_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line7_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line7_Total.innerHTML);
                            num = num.toFixed(2);
                            Line7_Total.innerHTML = num;
                            Line7_Total.innerHTML = "$" + Line7_Total.innerHTML;
                            document.getElementById('<%=hdn_Line7_Total.ClientID %>').value = Line7_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line7_Total.ClientID %>').value = Line7_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------

        function CalculateLine8LaborRate() {
            var len = document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine8THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line8_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line8_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line8_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line8_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine8();
            }
        }


        function CalculateLine8TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line8_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line8_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line8_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line8_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine8();
            }
        }



        function CalculateLine8SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line8_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line8_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line8_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line8_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line8_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine8Code() {
            if (document.getElementById('<%=txt_Line8_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line8_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line8_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line8_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line8_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line8_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line8_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line8_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line8_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line8_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line8_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line8_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line8_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line8_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line8_Qty.ClientID %>').value = Qty;

                    var Line8_Total = document.getElementById('<%=txt_Line8_Total.ClientID %>');
                    Line8_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line8_Total.innerHTML = "$" + Line8_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line8_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line8_Total.innerHTML = "$" + Line8_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine8() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line8_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line8_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line8_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line8_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line8_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line8_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line8_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line8_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line8_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line8_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line8_Qty.ClientID %>').value = '';
                        }
                        var Line8_Total = document.getElementById('<%=txt_Line8_Total.ClientID %>');
                        Line8_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line8_Total.innerHTML);
                        num = num.toFixed(2);
                        Line8_Total.innerHTML = num;
                        Line8_Total.innerHTML = "$" + Line8_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line8_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line8_Total.innerHTML);
                            num = num.toFixed(2);
                            Line8_Total.innerHTML = num;
                            Line8_Total.innerHTML = "$" + Line8_Total.innerHTML;
                            document.getElementById('<%=hdn_Line8_Total.ClientID %>').value = Line8_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line8_Total.ClientID %>').value = Line8_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------

        function CalculateLine9LaborRate() {
            var len = document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine9THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line9_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line9_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line9_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line9_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine9();
            }
        }


        function CalculateLine9TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line9_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line9_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line9_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line9_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine9();
            }
        }



        function CalculateLine9SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line9_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line9_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line9_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line9_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line9_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine9Code() {
            if (document.getElementById('<%=txt_Line9_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line9_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line9_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line9_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line9_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line9_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line9_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line9_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line9_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line9_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line9_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line9_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line9_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line9_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line9_Qty.ClientID %>').value = Qty;

                    var Line9_Total = document.getElementById('<%=txt_Line9_Total.ClientID %>');
                    Line9_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line9_Total.innerHTML = "$" + Line9_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line9_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line9_Total.innerHTML = "$" + Line9_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine9() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line9_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line9_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line9_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line9_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line9_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line9_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line9_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line9_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line9_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line9_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line9_Qty.ClientID %>').value = '';
                        }
                        var Line9_Total = document.getElementById('<%=txt_Line9_Total.ClientID %>');
                        Line9_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line9_Total.innerHTML);
                        num = num.toFixed(2);
                        Line9_Total.innerHTML = num;
                        Line9_Total.innerHTML = "$" + Line9_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line9_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line9_Total.innerHTML);
                            num = num.toFixed(2);
                            Line9_Total.innerHTML = num;
                            Line9_Total.innerHTML = "$" + Line9_Total.innerHTML;
                            document.getElementById('<%=hdn_Line9_Total.ClientID %>').value = Line9_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line9_Total.ClientID %>').value = Line9_Total.innerHTML;
                    }
                }
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


        function CalculateLine11LaborRate() {
            var len = document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine11THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line11_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line11_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line11_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line11_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine11();
            }
        }


        function CalculateLine11TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line11_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line11_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line11_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line11_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine11();
            }
        }



        function CalculateLine11SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line11_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line11_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line11_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line11_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line11_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine11Code() {
            if (document.getElementById('<%=txt_Line11_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line11_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line11_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line11_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line11_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line11_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line11_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line11_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line11_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line11_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line11_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line11_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line11_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line11_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line11_Qty.ClientID %>').value = Qty;

                    var Line11_Total = document.getElementById('<%=txt_Line11_Total.ClientID %>');
                    Line11_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line11_Total.innerHTML = "$" + Line11_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line11_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line11_Total.innerHTML = "$" + Line11_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine11() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line11_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line11_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line11_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line11_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line11_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line11_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line11_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line11_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line11_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line11_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line11_Qty.ClientID %>').value = '';
                        }
                        var Line11_Total = document.getElementById('<%=txt_Line11_Total.ClientID %>');
                        Line11_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line11_Total.innerHTML);
                        num = num.toFixed(2);
                        Line11_Total.innerHTML = num;
                        Line11_Total.innerHTML = "$" + Line11_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line11_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line11_Total.innerHTML);
                            num = num.toFixed(2);
                            Line11_Total.innerHTML = num;
                            Line11_Total.innerHTML = "$" + Line11_Total.innerHTML;
                            document.getElementById('<%=hdn_Line11_Total.ClientID %>').value = Line11_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line11_Total.ClientID %>').value = Line11_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------


        function CalculateLine18LaborRate() {
            var len = document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
            if (document.getElementById('<%=txt_Line18_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line18_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line18_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line18_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line18_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line18_LIURP.ClientID %>').readonly = true;
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
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line18_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line18_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line18_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line18_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line18_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line18_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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

        //----------------------------------------


        function CalculateLine19LaborRate() {
            var len = document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
            if (document.getElementById('<%=txt_Line19_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line19_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line19_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line19_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line19_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line19_LIURP.ClientID %>').readonly = true;
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
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line19_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line19_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line19_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line19_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line19_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line19_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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

        //----------------------------------------


        function CalculateLine20LaborRate() {
            var len = document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
            if (document.getElementById('<%=txt_Line20_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line20_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line20_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line20_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line20_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line20_LIURP.ClientID %>').readonly = true;
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
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line20_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line20_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line20_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line20_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line20_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line20_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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

        //----------------------------------------

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
