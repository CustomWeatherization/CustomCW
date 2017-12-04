<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Act129_II_PPL_InvoicePage2.aspx.cs"
    Inherits="PPLAudit_Act129_II_PPL_InvoicePage2" %>

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
                            1</a> <a class="active" href="Act129_II_PPL_InvoicePage2.aspx?Jobs=<%= Request.QueryString["Jobs"].ToString() %>&Utility=<%= Request.QueryString["Utility"].ToString() %>">
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line1_CostUnit" runat="server" Text="10.19"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line2_CostUnit" runat="server" Text="11.79"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line3_CostUnit" runat="server" Text="10.99"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line4_CostUnit" runat="server" Text="10.99"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line5_CostUnit" runat="server" Text="17.98"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line6_CostUnit" runat="server" Text="29.00"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line7_CostUnit" runat="server" Text="17.00"></asp:Label>
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
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line8_LIURP" runat="server" class="txt_val" Text="7C" onkeyup="CalculateLine8Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        Other Efficiency improvements
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
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line9_LIURP" runat="server" class="txt_val" Text="7D" onkeyup="CalculateLine9Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        Water bed Retofit- Double
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
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line10_LIURP" runat="server" class="txt_val" Text="7D" onkeyup="CalculateLine10Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        Water bed Retofit- Queen
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
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line11_LIURP" runat="server" class="txt_val" Text="7D" onkeyup="CalculateLine11Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        Water bed Retofit- King
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
                                    <td>
                                        <asp:TextBox ID="txt_Line12_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_LIURP" runat="server" class="txt_val" Text="7D" onkeyup="CalculateLine12Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        Water bed Retofit- Matress Pad
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_SC" runat="server" class="txt_val" onkeyup="CalculateLine12SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine12LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_THW" runat="server" class="txt_thw" onkeyup="CalculateLine12THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line12_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine12TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line12_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line13_CostUnit" runat="server" Text="185.60"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line14_CostUnit" runat="server" Text="41.98"></asp:Label>
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
                                        <asp:TextBox ID="txt_Line15_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line15_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine15Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line15_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_SC" runat="server" class="txt_val" onkeyup="CalculateLine15SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine15LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_THW" runat="server" class="txt_thw" onkeyup="CalculateLine15THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line15_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine15TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line15_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_Line16_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine16Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_SC" runat="server" class="txt_val" onkeyup="CalculateLine16SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine16LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_THW" runat="server" class="txt_thw" onkeyup="CalculateLine16THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line16_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine16TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line16_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line17_CostUnit" runat="server" Text="49.00"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line18_CostUnit" runat="server" Text="9.98"></asp:Label>
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
                                        <asp:TextBox ID="txt_Line19_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine19Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line19_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_SC" runat="server" class="txt_val" onkeyup="CalculateLine19SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine19LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_THW" runat="server" class="txt_thw" onkeyup="CalculateLine19THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line19_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine19TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line19_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_Line20_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine20Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line20_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_SC" runat="server" class="txt_val" onkeyup="CalculateLine20SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine20LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_THW" runat="server" class="txt_thw" onkeyup="CalculateLine20THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line20_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine20TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line20_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line21_CostUnit" runat="server" Text="83.00"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line22_CostUnit" runat="server" Text="116.00"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line23_CostUnit" runat="server" Text="44.00"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line24_CostUnit" runat="server" Text="34.00"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line25_CostUnit" runat="server" Text="19.99"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line26_CostUnit" runat="server" Text="11.58"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line27_CostUnit" runat="server" Text="107.00"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line28_CostUnit" runat="server" Text="30.00"></asp:Label>
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
                                        <asp:TextBox ID="txt_Line29_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine29Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line29_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_SC" runat="server" class="txt_val" onkeyup="CalculateLine29SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine29LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_THW" runat="server" class="txt_thw" onkeyup="CalculateLine29THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line29_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine29TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line29_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_Line30_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line30_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine30Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line30_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line30_SC" runat="server" class="txt_val" onkeyup="CalculateLine30SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line30_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line30_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine30LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line30_THW" runat="server" class="txt_thw" onkeyup="CalculateLine30THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line30_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine30TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line30_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line31_CostUnit" runat="server" Text="88.00"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line32_CostUnit" runat="server" Text="156.00"></asp:Label>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line33_CostUnit" runat="server" Text="156.00"></asp:Label>
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
                                        <asp:TextBox ID="txt_Line34_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine34Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line34_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_SC" runat="server" class="txt_val" onkeyup="CalculateLine34SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine34LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_THW" runat="server" class="txt_thw" onkeyup="CalculateLine34THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line34_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine34TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line34_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_Line35_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line35_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine35Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line35_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line35_SC" runat="server" class="txt_val" onkeyup="CalculateLine35SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line35_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line35_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine35LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line35_THW" runat="server" class="txt_thw" onkeyup="CalculateLine35THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line35_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine35TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line35_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
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
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td bgcolor="#CCCCCC">
                                        <input type="text" class="txt_thw" disabled="disabled" />
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="lbl_Line36_CostUnit" runat="server" Text="2060.00"></asp:Label>
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
                                        <asp:TextBox ID="txt_Line37_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line37_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine37Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line37_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line37_SC" runat="server" class="txt_val" onkeyup="CalculateLine37SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line37_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line37_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine37LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line37_THW" runat="server" class="txt_thw" onkeyup="CalculateLine37THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line37_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine37TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line37_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line37_Qty" runat="server" class="txt_val" onkeyup="CalculateLine37(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line37_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line37_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line38_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line38_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine38Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line38_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line38_SC" runat="server" class="txt_val" onkeyup="CalculateLine38SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line38_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line38_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine38LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line38_THW" runat="server" class="txt_thw" onkeyup="CalculateLine38THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line38_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine38TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line38_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line38_Qty" runat="server" class="txt_val" onkeyup="CalculateLine38(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line38_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line38_Total" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line39_Cat" runat="server" class="txt_val"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line39_LIURP" runat="server" class="txt_val" onkeyup="CalculateLine39Code()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line39_MeasureDesc" runat="server" class="new_field"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line39_SC" runat="server" class="txt_val" onkeyup="CalculateLine39SC()"
                                            Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line39_Unit" runat="server" class="txt_val" Style="text-align: center;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line39_LaborRate" runat="server" class="txt_val" Text="45/70"
                                            Style="text-align: center;" onkeyup="CalculateLine39LaborRate()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line39_THW" runat="server" class="txt_thw" onkeyup="CalculateLine39THW()"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txt_Line39_TMC" runat="server" class="txt_thw" onkeyup="CalculateLine39TMC()"></asp:TextBox>
                                    </td>
                                    <td bgcolor="#CCCCCC" align="center">
                                        <asp:TextBox ID="txt_Line39_CostUnit" runat="server" class="txt_val" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txt_Line39_Qty" runat="server" class="txt_val" onkeyup="CalculateLine39(this.id)"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="txt_Line39_Total" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdn_Line39_Total" runat="server" />
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


        function CalculateLine12LaborRate() {
            var len = document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
            if (document.getElementById('<%=txt_Line12_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line12_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line12_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line12_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line12_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line12_LIURP.ClientID %>').readonly = true;
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
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line12_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line12_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line12_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line12_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line12_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line12_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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




        function CalculateLine15LaborRate() {
            var len = document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine15THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line15_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line15_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line15_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line15_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine15();
            }
        }


        function CalculateLine15TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line15_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line15_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line15_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line15_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine15();
            }
        }



        function CalculateLine15SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line15_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line15_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line15_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line15_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line15_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine15Code() {
            if (document.getElementById('<%=txt_Line15_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line15_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line15_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line15_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line15_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line15_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line15_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line15_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line15_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line15_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line15_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line15_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line15_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line15_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line15_Qty.ClientID %>').value = Qty;

                    var Line15_Total = document.getElementById('<%=txt_Line15_Total.ClientID %>');
                    Line15_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line15_Total.innerHTML = "$" + Line15_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line15_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line15_Total.innerHTML = "$" + Line15_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine15() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line15_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line15_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line15_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line15_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line15_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line15_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line15_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line15_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line15_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line15_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line15_Qty.ClientID %>').value = '';
                        }
                        var Line15_Total = document.getElementById('<%=txt_Line15_Total.ClientID %>');
                        Line15_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line15_Total.innerHTML);
                        num = num.toFixed(2);
                        Line15_Total.innerHTML = num;
                        Line15_Total.innerHTML = "$" + Line15_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line15_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line15_Total.innerHTML);
                            num = num.toFixed(2);
                            Line15_Total.innerHTML = num;
                            Line15_Total.innerHTML = "$" + Line15_Total.innerHTML;
                            document.getElementById('<%=hdn_Line15_Total.ClientID %>').value = Line15_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line15_Total.ClientID %>').value = Line15_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------


        function CalculateLine16LaborRate() {
            var len = document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
            if (document.getElementById('<%=txt_Line16_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line16_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line16_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line16_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line16_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line16_LIURP.ClientID %>').readonly = true;
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
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line16_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line16_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line16_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line16_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line16_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line16_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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

        //----------------------------------------


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
        //----------------------------------------




        function CalculateLine29LaborRate() {
            var len = document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
            if (document.getElementById('<%=txt_Line29_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line29_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line29_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line29_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line29_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line29_LIURP.ClientID %>').readonly = true;
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
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line29_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line29_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line29_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line29_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line29_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line29_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
                        document.getElementById('<%=hdn_Line29_Total.ClientID %>').value = Line29_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------




        function CalculateLine30LaborRate() {
            var len = document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine30THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line30_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line30_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line30_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line30_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine30();
            }
        }


        function CalculateLine30TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line30_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line30_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line30_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line30_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine30();
            }
        }



        function CalculateLine30SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line30_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line30_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line30_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line30_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line30_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine30Code() {
            if (document.getElementById('<%=txt_Line30_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line30_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line30_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line30_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line30_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line30_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line30_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line30_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line30_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line30_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line30_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line30_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line30_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line30_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line30_Qty.ClientID %>').value = Qty;

                    var Line30_Total = document.getElementById('<%=txt_Line30_Total.ClientID %>');
                    Line30_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line30_Total.innerHTML = "$" + Line30_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line30_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line30_Total.innerHTML = "$" + Line30_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine30() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line30_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line30_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line30_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line30_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line30_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line30_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line30_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line30_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line30_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line30_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line30_Qty.ClientID %>').value = '';
                        }
                        var Line30_Total = document.getElementById('<%=txt_Line30_Total.ClientID %>');
                        Line30_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line30_Total.innerHTML);
                        num = num.toFixed(2);
                        Line30_Total.innerHTML = num;
                        Line30_Total.innerHTML = "$" + Line30_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line30_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line30_Total.innerHTML);
                            num = num.toFixed(2);
                            Line30_Total.innerHTML = num;
                            Line30_Total.innerHTML = "$" + Line30_Total.innerHTML;
                            document.getElementById('<%=hdn_Line30_Total.ClientID %>').value = Line30_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line30_Total.ClientID %>').value = Line30_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------


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
        //----------------------------------------


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
        //----------------------------------------



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
        //----------------------------------------



        function CalculateLine34LaborRate() {
            var len = document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
            if (document.getElementById('<%=txt_Line34_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line34_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line34_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line34_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line34_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line34_LIURP.ClientID %>').readonly = true;
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
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line34_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line34_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line34_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line34_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line34_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line34_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
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
                        document.getElementById('<%=hdn_Line34_Total.ClientID %>').value = Line34_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------


        function CalculateLine35LaborRate() {
            var len = document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine35THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line35_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line35_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line35_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line35_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine35();
            }
        }


        function CalculateLine35TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line35_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line35_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line35_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line35_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine35();
            }
        }



        function CalculateLine35SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line35_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line35_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line35_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line35_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line35_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine35Code() {
            if (document.getElementById('<%=txt_Line35_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line35_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line35_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line35_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line35_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line35_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line35_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line35_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line35_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line35_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line35_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line35_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line35_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line35_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line35_Qty.ClientID %>').value = Qty;

                    var Line35_Total = document.getElementById('<%=txt_Line35_Total.ClientID %>');
                    Line35_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line35_Total.innerHTML = "$" + Line35_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line35_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line35_Total.innerHTML = "$" + Line35_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine35() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line35_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line35_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line35_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line35_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line35_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line35_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line35_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line35_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line35_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line35_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line35_Qty.ClientID %>').value = '';
                        }
                        var Line35_Total = document.getElementById('<%=txt_Line35_Total.ClientID %>');
                        Line35_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line35_Total.innerHTML);
                        num = num.toFixed(2);
                        Line35_Total.innerHTML = num;
                        Line35_Total.innerHTML = "$" + Line35_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line35_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line35_Total.innerHTML);
                            num = num.toFixed(2);
                            Line35_Total.innerHTML = num;
                            Line35_Total.innerHTML = "$" + Line35_Total.innerHTML;
                            document.getElementById('<%=hdn_Line35_Total.ClientID %>').value = Line35_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line35_Total.ClientID %>').value = Line35_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------


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
        //----------------------------------------


        function CalculateLine37LaborRate() {
            var len = document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine37THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line37_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line37_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line37_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line37_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine37();
            }
        }


        function CalculateLine37TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line37_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line37_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line37_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line37_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine37();
            }
        }



        function CalculateLine37SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line37_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line37_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line37_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line37_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line37_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine37Code() {
            if (document.getElementById('<%=txt_Line37_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line37_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line37_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line37_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line37_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line37_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line37_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line37_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line37_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line37_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line37_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line37_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line37_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line37_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line37_Qty.ClientID %>').value = Qty;

                    var Line37_Total = document.getElementById('<%=txt_Line37_Total.ClientID %>');
                    Line37_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line37_Total.innerHTML = "$" + Line37_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line37_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line37_Total.innerHTML = "$" + Line37_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine37() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line37_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line37_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line37_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line37_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line37_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line37_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line37_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line37_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line37_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line37_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line37_Qty.ClientID %>').value = '';
                        }
                        var Line37_Total = document.getElementById('<%=txt_Line37_Total.ClientID %>');
                        Line37_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line37_Total.innerHTML);
                        num = num.toFixed(2);
                        Line37_Total.innerHTML = num;
                        Line37_Total.innerHTML = "$" + Line37_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line37_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line37_Total.innerHTML);
                            num = num.toFixed(2);
                            Line37_Total.innerHTML = num;
                            Line37_Total.innerHTML = "$" + Line37_Total.innerHTML;
                            document.getElementById('<%=hdn_Line37_Total.ClientID %>').value = Line37_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line37_Total.ClientID %>').value = Line37_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------

        function CalculateLine38LaborRate() {
            var len = document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine38THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line38_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line38_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line38_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line38_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine38();
            }
        }


        function CalculateLine38TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line38_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line38_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line38_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line38_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine38();
            }
        }



        function CalculateLine38SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line38_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line38_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line38_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line38_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line38_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine38Code() {
            if (document.getElementById('<%=txt_Line38_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line38_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line38_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line38_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line38_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line38_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line38_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line38_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line38_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line38_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line38_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line38_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line38_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line38_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line38_Qty.ClientID %>').value = Qty;

                    var Line38_Total = document.getElementById('<%=txt_Line38_Total.ClientID %>');
                    Line38_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line38_Total.innerHTML = "$" + Line38_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line38_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line38_Total.innerHTML = "$" + Line38_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine38() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line38_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line38_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line38_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line38_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line38_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line38_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line38_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line38_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line38_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line38_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line38_Qty.ClientID %>').value = '';
                        }
                        var Line38_Total = document.getElementById('<%=txt_Line38_Total.ClientID %>');
                        Line38_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line38_Total.innerHTML);
                        num = num.toFixed(2);
                        Line38_Total.innerHTML = num;
                        Line38_Total.innerHTML = "$" + Line38_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line38_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line38_Total.innerHTML);
                            num = num.toFixed(2);
                            Line38_Total.innerHTML = num;
                            Line38_Total.innerHTML = "$" + Line38_Total.innerHTML;
                            document.getElementById('<%=hdn_Line38_Total.ClientID %>').value = Line38_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line38_Total.ClientID %>').value = Line38_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------

        function CalculateLine39LaborRate() {
            var len = document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value;
            len = len.length;
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value == '') {
                    alert('Labor Rate can only be 45 or 70. ');
                }
                else if (document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value == '45/70') {
                    alert('Labor Rate can only be 45 or 70. ');
                }

                else if (len == 2) {
                    if (document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value = '';
                    }
                }
                else {
                }
            }

        }

        function CalculateLine39THW() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line39_THW.ClientID %>').readonly = true;
            }
            else {
                var THW = document.getElementById('<%=txt_Line39_THW.ClientID %>').value;
                if (THW == '.')
                { } else {
                    if (isNaN(THW)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line39_THW.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line39_THW.ClientID %>').value = THW;
                    }
                }
                CalculateLine39();
            }
        }


        function CalculateLine39TMC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line39_TMC.ClientID %>').readonly = true;
            }
            else {
                var TMC = document.getElementById('<%=txt_Line39_TMC.ClientID %>').value;
                if (TMC == '.')
                { } else {
                    if (isNaN(TMC)) {
                        alert('Only numbers in this column. ');
                        document.getElementById('<%=txt_Line39_TMC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line39_TMC.ClientID %>').value = TMC;
                    }
                }
                CalculateLine39();
            }
        }



        function CalculateLine39SC() {
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line39_SC.ClientID %>').readonly = true;
            }
            else {
                var SC = document.getElementById('<%=txt_Line39_SC.ClientID %>').value;
                if (SC != '') {
                    if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
                        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                        document.getElementById('<%=txt_Line39_SC.ClientID %>').value = '';
                    }
                    else {
                        document.getElementById('<%=txt_Line39_SC.ClientID %>').value = SC;
                    }
                }
                else {
                    alert('SC must be set to either  S  or  C  or  R  or  SC . ');
                    document.getElementById('<%=txt_Line39_SC.ClientID %>').value = '';
                }
            }
        }

        function CalculateLine39Code() {
            if (document.getElementById('<%=txt_Line39_LIURP.ClientID %>').value == '') {
                document.getElementById('<%=txt_Line39_THW.ClientID %>').value = '';
                document.getElementById('<%=txt_Line39_TMC.ClientID %>').value = '';
                document.getElementById('<%=txt_Line39_Qty.ClientID %>').value = '';
                document.getElementById('<%=txt_Line39_Total.ClientID %>').value = '';
            }
            else {
                if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                    document.getElementById('<%=txt_Line39_LIURP.ClientID %>').readonly = true;
                }
                else {
                    var THW = document.getElementById('<%=txt_Line39_THW.ClientID %>').value;
                    if (isNaN(THW) || document.getElementById('<%=txt_Line39_THW.ClientID %>').value == '') {
                        THW = 0;
                    }
                    var TMC = document.getElementById('<%=txt_Line39_TMC.ClientID %>').value;
                    if (isNaN(TMC) || document.getElementById('<%=txt_Line39_THW.ClientID %>').value == '') {
                        TMC = 0;
                    }
                    var Qty = document.getElementById('<%=txt_Line39_Qty.ClientID %>').value;
                    if (isNaN(Qty) || document.getElementById('<%=txt_Line39_THW.ClientID %>').value == '') {
                        Qty = 0;
                    }
                    var Rate = document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value;
                    if (isNaN(Rate) || document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value == '') {
                        Total = 0;
                    }

                    var Cal1 = parseFloat(THW) * parseFloat(Rate);
                    var CostUnit = parseFloat(Cal1) + parseFloat(TMC);

                    document.getElementById('<%=txt_Line39_THW.ClientID %>').value = THW;
                    document.getElementById('<%=txt_Line39_TMC.ClientID %>').value = TMC;
                    document.getElementById('<%=txt_Line39_Qty.ClientID %>').value = Qty;

                    var Line39_Total = document.getElementById('<%=txt_Line39_Total.ClientID %>');
                    Line39_Total.innerHTML = parseFloat(Qty * CostUnit);
                    Line39_Total.innerHTML = "$" + Line39_Total.innerHTML;

                    // Checking for Fire Fox
                    var val = navigator.userAgent.toLowerCase();
                    if (val.indexOf("firefox") > -1) {
                        Line39_Total.innerHTML = parseFloat(Qty * CostUnit);
                        Line39_Total.innerHTML = "$" + Line39_Total.innerHTML;
                    }
                }
            }
        }

        function CalculateLine39() {
            //For Multiply the Values and assign it to Total Coulmn
            if (document.getElementById('<%=hdn_Finalize.ClientID %>').value == 'F') {
                document.getElementById('<%=txt_Line39_Qty.ClientID %>').readonly = true;
            }
            else {
                if (document.getElementById('<%=txt_Line39_LIURP.ClientID %>').value == '') {
                    alert('Please select LIURP Code first.');
                    document.getElementById('<%=txt_Line39_Qty.ClientID %>').value = '';
                }
                else {
                    if (document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value == '') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line39_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value == '45/70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line39_Qty.ClientID %>').value = '';
                    }
                    else if (document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value != '45' && document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value != '70') {
                        alert('Labor Rate can only be 45 or 70. ');
                        document.getElementById('<%=txt_Line39_Qty.ClientID %>').value = '';
                    }
                    else {

                        var Qty = document.getElementById('<%=txt_Line39_Qty.ClientID %>').value;
                        var THW = document.getElementById('<%=txt_Line39_THW.ClientID %>').value;
                        var TMC = document.getElementById('<%=txt_Line39_TMC.ClientID %>').value;
                        var Rate = document.getElementById('<%=txt_Line39_LaborRate.ClientID %>').value;

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
                            document.getElementById('<%=txt_Line39_Qty.ClientID %>').value = '';
                        }
                        var Line39_Total = document.getElementById('<%=txt_Line39_Total.ClientID %>');
                        Line39_Total.innerHTML = parseFloat(Qty * CostUnit);
                        var num = parseFloat(Line39_Total.innerHTML);
                        num = num.toFixed(2);
                        Line39_Total.innerHTML = num;
                        Line39_Total.innerHTML = "$" + Line39_Total.innerHTML;

                        // Checking for Fire Fox
                        var val = navigator.userAgent.toLowerCase();
                        if (val.indexOf("firefox") > -1) {
                            Line39_Total.innerHTML = parseFloat(Qty * CostUnit);
                            var num = parseFloat(Line39_Total.innerHTML);
                            num = num.toFixed(2);
                            Line39_Total.innerHTML = num;
                            Line39_Total.innerHTML = "$" + Line39_Total.innerHTML;
                            document.getElementById('<%=hdn_Line39_Total.ClientID %>').value = Line39_Total.innerHTML;
                        }
                        document.getElementById('<%=hdn_Line39_Total.ClientID %>').value = Line39_Total.innerHTML;
                    }
                }
            }
        }

        //----------------------------------------
        
    </script>

</body>
</html>
