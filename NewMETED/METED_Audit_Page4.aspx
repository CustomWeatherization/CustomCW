<%@ Page Language="C#" MasterPageFile="~/NewMETED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page4.aspx.cs" Inherits="METED_METED_Audit_Page4" Title="METED Audit Page4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        h2 {
            font-size: 20px;
            padding-left: 20px;
        }

        body {
            font-size: 13px;
        }

        input[type="radio"] {
            margin-left: 10px;
        }

        input[type="checkbox"] {
            margin: 0 0 10px 10px;
        }

        .newtable table {
            border: 0 none;
        }

            .newtable table tr td {
                border: 1px solid #999999;
            }

            .newtable table tr th {
                border: 1px solid #999999;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<div class="fix_div">--%>
    <!-- header -->
    <%--<div class="header">
<<div class="logo_div"><a href="#"><img src="images/logo.jpg" /></a></div>
<div class="header_middiv"></div>
<div class="head_link"><a href="#">Administer Database</a> | <a href="#">Logout</a></div>
</div>--%>
    <!-- end header -->
    <%-- <div class="clear">
    </div>--%>
    <div class="top_links" runat="server" id="TopBtnDiv">
        <b><span id="spnFinal" runat="server" style="color: Red; font-size: medium;"></span>
        </b>
        <br />
        <asp:Button ID="btnUpdate" runat="server" Text="Save" class="top_btn" OnClick="btnUpdate_Click" />&nbsp;&nbsp;
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" class="top_btn" OnClick="btn_cancel_Click" />&nbsp;&nbsp;
        <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
        <%--OnClientClick="ClickHereToPrintFull()"--%>
    </div>
    <div id="DivPrint">
        <div align="center">
            <h3>WARM Program Lighting</h3>
        </div>
        <p>
            Act 129 CFL and LED bulps are non-warranted. Install these bulbs in lights that are used
            an average of one (1) hour or more per day. Your goal is to install as many CFLs and LEDs
            as possible in each customer's home.
            <%--A maximum of 24 bulbs can be installed without seeking approval. If there is a need to install more than 24 CFLs per home, prior approval by the appropriate program administrator is required.--%>
            <p style="text-align: center;">
                <%--<h3> Note: All measures are required to be installed by the contractor.</h3>--%>
            </p>
            <!-- form section -->
            <div class="newtable">
                <!--newtable begin-->
                <div align="center">
                    <b>Note: All measures are required to be installed by the contractor.</b>
                </div>
                <h4 align="center" style="text-decoration: underline;">CFL
                    Standard Bulbs</h4>
                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr>
                        <td width="106">
                            <%--LIURP or --%>Act 129
                        </td>
                        <td width="80" style="border: 0 !important;"></td>
                        <td width="165">CFL Replacement Wattage
                        </td>
                        <td width="365">Location
                        </td>
                        <td width="335" style="border: 0 !important;"></td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr>
                        <%-- <th>
                            LIURP
                        </th>--%>
                        <th>Act 129
                        </th>
                        <th># Install
                        </th>
                        <th>9-13
                        </th>
                        <th>14-16
                        </th>
                        <th>17-20
                        </th>
                        <th>21-25
                        </th>
                        <th>LR
                        </th>
                        <th>DR
                        </th>
                        <th>Kitch
                        </th>
                        <th>BR
                        </th>
                        <th>Bath
                        </th>
                        <th>Hall
                        </th>
                        <th>Other
                        </th>
                        <th>Location Specifics
                            <br />
                            (ie 2nd fl, rear, table lamp)
                        </th>
                        <th>WARM Measure Code
                        </th>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line1_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line1_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_CFL_9_13" runat="server" onclick="ReplaceWatage1(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_CFL_14_16" runat="server" onclick="ReplaceWatage1(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_CFL_17_20" runat="server" onclick="ReplaceWatage1(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_CFL_21_25" runat="server" onclick="ReplaceWatage1(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_CFL_LR" runat="server" onclick="Location1(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_CFL_DR" runat="server" onclick="Location1(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_CFL_Kitch" runat="server" onclick="Location1(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_CFL_BR" runat="server" onclick="Location1(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_CFL_Bath" runat="server" onclick="Location1(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_CFL_Hall" runat="server" onclick="Location1(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line1_CFL_Other" runat="server" onclick="Location1(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line1_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line1_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line2_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line2_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_CFL_9_13" runat="server" onclick="ReplaceWatage2(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_CFL_14_16" runat="server" onclick="ReplaceWatage2(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_CFL_17_20" runat="server" onclick="ReplaceWatage2(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_CFL_21_25" runat="server" onclick="ReplaceWatage2(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_CFL_LR" runat="server" onclick="Location2(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_CFL_DR" runat="server" onclick="Location2(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_CFL_Kitch" runat="server" onclick="Location2(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_CFL_BR" runat="server" onclick="Location2(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_CFL_Bath" runat="server" onclick="Location2(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_CFL_Hall" runat="server" onclick="Location2(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line2_CFL_Other" runat="server" onclick="Location2(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line2_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line2_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line3_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line3_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_CFL_9_13" runat="server" onclick="ReplaceWatage3(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_CFL_14_16" runat="server" onclick="ReplaceWatage3(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_CFL_17_20" runat="server" onclick="ReplaceWatage3(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_CFL_21_25" runat="server" onclick="ReplaceWatage3(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_CFL_LR" runat="server" onclick="Location3(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_CFL_DR" runat="server" onclick="Location3(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_CFL_Kitch" runat="server" onclick="Location3(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_CFL_BR" runat="server" onclick="Location3(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_CFL_Bath" runat="server" onclick="Location3(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_CFL_Hall" runat="server" onclick="Location3(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line3_CFL_Other" runat="server" onclick="Location3(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line3_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line3_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line4_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line4_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_CFL_9_13" runat="server" onclick="ReplaceWatage4(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_CFL_14_16" runat="server" onclick="ReplaceWatage4(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_CFL_17_20" runat="server" onclick="ReplaceWatage4(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_CFL_21_25" runat="server" onclick="ReplaceWatage4(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_CFL_LR" runat="server" onclick="Location4(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_CFL_DR" runat="server" onclick="Location4(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_CFL_Kitch" runat="server" onclick="Location4(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_CFL_BR" runat="server" onclick="Location4(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_CFL_Bath" runat="server" onclick="Location4(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_CFL_Hall" runat="server" onclick="Location4(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line4_CFL_Other" runat="server" onclick="Location4(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line4_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line4_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line5_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line5_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_CFL_9_13" runat="server" onclick="ReplaceWatage5(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_CFL_14_16" runat="server" onclick="ReplaceWatage5(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_CFL_17_20" runat="server" onclick="ReplaceWatage5(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_CFL_21_25" runat="server" onclick="ReplaceWatage5(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_CFL_LR" runat="server" onclick="Location5(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_CFL_DR" runat="server" onclick="Location5(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_CFL_Kitch" runat="server" onclick="Location5(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_CFL_BR" runat="server" onclick="Location5(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_CFL_Bath" runat="server" onclick="Location5(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_CFL_Hall" runat="server" onclick="Location5(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line5_CFL_Other" runat="server" onclick="Location5(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line5_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line5_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line6_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line6_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_CFL_9_13" runat="server" onclick="ReplaceWatage6(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_CFL_14_16" runat="server" onclick="ReplaceWatage6(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_CFL_17_20" runat="server" onclick="ReplaceWatage6(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_CFL_21_25" runat="server" onclick="ReplaceWatage6(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_CFL_LR" runat="server" onclick="Location6(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_CFL_DR" runat="server" onclick="Location6(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_CFL_Kitch" runat="server" onclick="Location6(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_CFL_BR" runat="server" onclick="Location6(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_CFL_Bath" runat="server" onclick="Location6(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_CFL_Hall" runat="server" onclick="Location6(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line6_CFL_Other" runat="server" onclick="Location6(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line6_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line6_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line7_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line7_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_CFL_9_13" runat="server" onclick="ReplaceWatage7(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_CFL_14_16" runat="server" onclick="ReplaceWatage7(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_CFL_17_20" runat="server" onclick="ReplaceWatage7(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_CFL_21_25" runat="server" onclick="ReplaceWatage7(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_CFL_LR" runat="server" onclick="Location7(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_CFL_DR" runat="server" onclick="Location7(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_CFL_Kitch" runat="server" onclick="Location7(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_CFL_BR" runat="server" onclick="Location7(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_CFL_Bath" runat="server" onclick="Location7(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_CFL_Hall" runat="server" onclick="Location7(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line7_CFL_Other" runat="server" onclick="Location7(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line7_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line7_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line8_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line8_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_CFL_9_13" runat="server" onclick="ReplaceWatage8(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_CFL_14_16" runat="server" onclick="ReplaceWatage8(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_CFL_17_20" runat="server" onclick="ReplaceWatage8(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_CFL_21_25" runat="server" onclick="ReplaceWatage8(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_CFL_LR" runat="server" onclick="Location8(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_CFL_DR" runat="server" onclick="Location8(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_CFL_Kitch" runat="server" onclick="Location8(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_CFL_BR" runat="server" onclick="Location8(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_CFL_Bath" runat="server" onclick="Location8(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_CFL_Hall" runat="server" onclick="Location8(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line8_CFL_Other" runat="server" onclick="Location8(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line8_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line8_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line9_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line9_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_CFL_9_13" runat="server" onclick="ReplaceWatage9(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_CFL_14_16" runat="server" onclick="ReplaceWatage9(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_CFL_17_20" runat="server" onclick="ReplaceWatage9(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_CFL_21_25" runat="server" onclick="ReplaceWatage9(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_CFL_LR" runat="server" onclick="Location9(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_CFL_DR" runat="server" onclick="Location9(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_CFL_Kitch" runat="server" onclick="Location9(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_CFL_BR" runat="server" onclick="Location9(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_CFL_Bath" runat="server" onclick="Location9(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_CFL_Hall" runat="server" onclick="Location9(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line9_CFL_Other" runat="server" onclick="Location9(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line9_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line9_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line10_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line10_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_CFL_9_13" runat="server" onclick="ReplaceWatage10(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_CFL_14_16" runat="server" onclick="ReplaceWatage10(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_CFL_17_20" runat="server" onclick="ReplaceWatage10(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_CFL_21_25" runat="server" onclick="ReplaceWatage10(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_CFL_LR" runat="server" onclick="Location10(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_CFL_DR" runat="server" onclick="Location10(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_CFL_Kitch" runat="server" onclick="Location10(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_CFL_BR" runat="server" onclick="Location10(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_CFL_Bath" runat="server" onclick="Location10(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_CFL_Hall" runat="server" onclick="Location10(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line10_CFL_Other" runat="server" onclick="Location10(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line10_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line10_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line11_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line11_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_CFL_9_13" runat="server" onclick="ReplaceWatage11(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_CFL_14_16" runat="server" onclick="ReplaceWatage11(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_CFL_17_20" runat="server" onclick="ReplaceWatage11(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_CFL_21_25" runat="server" onclick="ReplaceWatage11(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_CFL_LR" runat="server" onclick="Location11(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_CFL_DR" runat="server" onclick="Location11(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_CFL_Kitch" runat="server" onclick="Location11(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_CFL_BR" runat="server" onclick="Location11(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_CFL_Bath" runat="server" onclick="Location11(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_CFL_Hall" runat="server" onclick="Location11(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line11_CFL_Other" runat="server" onclick="Location11(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line11_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line11_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line12_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line12_Install" runat="server" Style="width: 50px; border: none;"
                                onkeyup="AddStandardBulb()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_CFL_9_13" runat="server" onclick="ReplaceWatage12(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_CFL_14_16" runat="server" onclick="ReplaceWatage12(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_CFL_17_20" runat="server" onclick="ReplaceWatage12(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_CFL_21_25" runat="server" onclick="ReplaceWatage12(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_CFL_LR" runat="server" onclick="Location12(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_CFL_DR" runat="server" onclick="Location12(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_CFL_Kitch" runat="server" onclick="Location12(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_CFL_BR" runat="server" onclick="Location12(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_CFL_Bath" runat="server" onclick="Location12(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_CFL_Hall" runat="server" onclick="Location12(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line12_CFL_Other" runat="server" onclick="Location12(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line12_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line12_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />








                Number of Standard Bulbs Installed:
                <asp:TextBox ID="txt_Standard_Bullbs" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                <h4 align="center">CFL
                    Specialty Bulbs</h4>
                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr>
                        <td width="100" colspan="2">
                            <%-- LIURP or --%>Act 129
                        </td>
                        <td width="80" style="border: 0 !important"></td>
                        <td width="165" colspan="2">Bulb Type*
                        </td>
                        <td width="370" colspan="4">CFL Replacement Wattage
                        </td>
                        <td width="250" colspan="7">Location
                        </td>
                        <td width="235" style="border: 0 !important"></td>
                    </tr>
                    <!-- </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="5"> -->
                    <tr>
                        <%--<th>
                            LIURP
                        </th>--%>
                        <th>Act 129
                        </th>
                        <th># Install
                        </th>
                        <th>SB
                        </th>
                        <th>R/F
                        </th>
                        <th>2-9
                        </th>
                        <th>10-13
                        </th>
                        <th>14-16
                        </th>
                        <th>17-20
                        </th>
                        <th>21-25
                        </th>
                        <th>LR
                        </th>
                        <th>DR
                        </th>
                        <th>Kitch
                        </th>
                        <th>BR
                        </th>
                        <th>Bath
                        </th>
                        <th>Hall
                        </th>
                        <th>Other
                        </th>
                        <th>Location Specifics
                            <br />
                            (ie 2nd Fl, rear, table lamp)
                        </th>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line13_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line13_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_2_9" runat="server" onclick="ReplaceWatage13(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_10_13" runat="server" onclick="ReplaceWatage13(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_14_16" runat="server" onclick="ReplaceWatage13(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_17_20" runat="server" onclick="ReplaceWatage13(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_21_25" runat="server" onclick="ReplaceWatage13(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_LR" runat="server" onclick="Location13(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_DR" runat="server" onclick="Location13(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_Kitch" runat="server" onclick="Location13(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_BR" runat="server" onclick="Location13(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_Bath" runat="server" onclick="Location13(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_Hall" runat="server" onclick="Location13(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line13_CFL_Other" runat="server" onclick="Location13(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line13_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line14_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line14_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_2_9" runat="server" onclick="ReplaceWatage14(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_10_13" runat="server" onclick="ReplaceWatage14(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_14_16" runat="server" onclick="ReplaceWatage14(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_17_20" runat="server" onclick="ReplaceWatage14(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_21_25" runat="server" onclick="ReplaceWatage14(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_LR" runat="server" onclick="Location14(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_DR" runat="server" onclick="Location14(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_Kitch" runat="server" onclick="Location14(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_BR" runat="server" onclick="Location14(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_Bath" runat="server" onclick="Location14(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_Hall" runat="server" onclick="Location14(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line14_CFL_Other" runat="server" onclick="Location14(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line14_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line15_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line15_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_2_9" runat="server" onclick="ReplaceWatage15(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_10_13" runat="server" onclick="ReplaceWatage15(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_14_16" runat="server" onclick="ReplaceWatage15(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_17_20" runat="server" onclick="ReplaceWatage15(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_21_25" runat="server" onclick="ReplaceWatage15(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_LR" runat="server" onclick="Location15(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_DR" runat="server" onclick="Location15(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_Kitch" runat="server" onclick="Location15(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_BR" runat="server" onclick="Location15(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_Bath" runat="server" onclick="Location15(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_Hall" runat="server" onclick="Location15(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line15_CFL_Other" runat="server" onclick="Location15(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line15_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line16_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line16_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_2_9" runat="server" onclick="ReplaceWatage16(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_10_13" runat="server" onclick="ReplaceWatage16(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_14_16" runat="server" onclick="ReplaceWatage16(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_17_20" runat="server" onclick="ReplaceWatage16(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_21_25" runat="server" onclick="ReplaceWatage16(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_LR" runat="server" onclick="Location16(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_DR" runat="server" onclick="Location16(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_Kitch" runat="server" onclick="Location16(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_BR" runat="server" onclick="Location16(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_Bath" runat="server" onclick="Location16(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_Hall" runat="server" onclick="Location16(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line16_CFL_Other" runat="server" onclick="Location16(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line16_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line17_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line17_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_2_9" runat="server" onclick="ReplaceWatage17(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_10_13" runat="server" onclick="ReplaceWatage17(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_14_16" runat="server" onclick="ReplaceWatage17(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_17_20" runat="server" onclick="ReplaceWatage17(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_21_25" runat="server" onclick="ReplaceWatage17(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_LR" runat="server" onclick="Location17(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_DR" runat="server" onclick="Location17(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_Kitch" runat="server" onclick="Location17(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_BR" runat="server" onclick="Location17(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_Bath" runat="server" onclick="Location17(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_Hall" runat="server" onclick="Location17(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line17_CFL_Other" runat="server" onclick="Location17(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line17_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line18_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line18_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_2_9" runat="server" onclick="ReplaceWatage18(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_10_13" runat="server" onclick="ReplaceWatage18(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_14_16" runat="server" onclick="ReplaceWatage18(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_17_20" runat="server" onclick="ReplaceWatage18(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_21_25" runat="server" onclick="ReplaceWatage18(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_LR" runat="server" onclick="Location18(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_DR" runat="server" onclick="Location18(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_Kitch" runat="server" onclick="Location18(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_BR" runat="server" onclick="Location18(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_Bath" runat="server" onclick="Location18(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_Hall" runat="server" onclick="Location18(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line18_CFL_Other" runat="server" onclick="Location18(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line18_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line19_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line19_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_2_9" runat="server" onclick="ReplaceWatage19(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_10_13" runat="server" onclick="ReplaceWatage19(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_14_16" runat="server" onclick="ReplaceWatage19(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_17_20" runat="server" onclick="ReplaceWatage19(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_21_25" runat="server" onclick="ReplaceWatage19(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_LR" runat="server" onclick="Location19(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_DR" runat="server" onclick="Location19(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_Kitch" runat="server" onclick="Location19(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_BR" runat="server" onclick="Location19(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_Bath" runat="server" onclick="Location19(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_Hall" runat="server" onclick="Location19(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line19_CFL_Other" runat="server" onclick="Location19(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line19_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line20_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line20_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_2_9" runat="server" onclick="ReplaceWatage20(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_10_13" runat="server" onclick="ReplaceWatage20(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_14_16" runat="server" onclick="ReplaceWatage20(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_17_20" runat="server" onclick="ReplaceWatage20(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_21_25" runat="server" onclick="ReplaceWatage20(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_LR" runat="server" onclick="Location20(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_DR" runat="server" onclick="Location20(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_Kitch" runat="server" onclick="Location20(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_BR" runat="server" onclick="Location20(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_Bath" runat="server" onclick="Location20(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_Hall" runat="server" onclick="Location20(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line20_CFL_Other" runat="server" onclick="Location20(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line20_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line21_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line21_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_2_9" runat="server" onclick="ReplaceWatage21(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_10_13" runat="server" onclick="ReplaceWatage21(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_14_16" runat="server" onclick="ReplaceWatage21(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_17_20" runat="server" onclick="ReplaceWatage21(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_21_25" runat="server" onclick="ReplaceWatage21(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_LR" runat="server" onclick="Location21(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_DR" runat="server" onclick="Location21(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_Kitch" runat="server" onclick="Location21(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_BR" runat="server" onclick="Location21(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_Bath" runat="server" onclick="Location21(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_Hall" runat="server" onclick="Location21(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line21_CFL_Other" runat="server" onclick="Location21(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line21_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line22_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line22_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_2_9" runat="server" onclick="ReplaceWatage22(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_10_13" runat="server" onclick="ReplaceWatage22(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_14_16" runat="server" onclick="ReplaceWatage22(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_17_20" runat="server" onclick="ReplaceWatage22(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_21_25" runat="server" onclick="ReplaceWatage22(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_LR" runat="server" onclick="Location22(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_DR" runat="server" onclick="Location22(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_Kitch" runat="server" onclick="Location22(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_BR" runat="server" onclick="Location22(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_Bath" runat="server" onclick="Location22(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_Hall" runat="server" onclick="Location22(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line22_CFL_Other" runat="server" onclick="Location22(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line22_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line23_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line23_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_2_9" runat="server" onclick="ReplaceWatage23(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_10_13" runat="server" onclick="ReplaceWatage23(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_14_16" runat="server" onclick="ReplaceWatage23(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_17_20" runat="server" onclick="ReplaceWatage23(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_21_25" runat="server" onclick="ReplaceWatage23(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_LR" runat="server" onclick="Location23(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_DR" runat="server" onclick="Location23(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_Kitch" runat="server" onclick="Location23(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_BR" runat="server" onclick="Location23(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_Bath" runat="server" onclick="Location23(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_Hall" runat="server" onclick="Location23(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line23_CFL_Other" runat="server" onclick="Location23(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line23_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>



                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line24_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line24_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_2_9" runat="server" onclick="ReplaceWatage24(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_10_13" runat="server" onclick="ReplaceWatage24(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_14_16" runat="server" onclick="ReplaceWatage24(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_17_20" runat="server" onclick="ReplaceWatage24(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_21_25" runat="server" onclick="ReplaceWatage24(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_LR" runat="server" onclick="Location24(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_DR" runat="server" onclick="Location24(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_Kitch" runat="server" onclick="Location24(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_BR" runat="server" onclick="Location24(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_Bath" runat="server" onclick="Location24(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_Hall" runat="server" onclick="Location24(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line24_CFL_Other" runat="server" onclick="Location24(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line24_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line25_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line25_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_2_9" runat="server" onclick="ReplaceWatage25(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_10_13" runat="server" onclick="ReplaceWatage25(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_14_16" runat="server" onclick="ReplaceWatage25(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_17_20" runat="server" onclick="ReplaceWatage25(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_21_25" runat="server" onclick="ReplaceWatage25(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_LR" runat="server" onclick="Location25(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_DR" runat="server" onclick="Location25(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_Kitch" runat="server" onclick="Location25(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_BR" runat="server" onclick="Location25(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_Bath" runat="server" onclick="Location25(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_Hall" runat="server" onclick="Location25(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line25_CFL_Other" runat="server" onclick="Location25(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line25_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:CheckBox ID="chk_Line26_LIURP" runat="server" Visible="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_Act129" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line26_Install" runat="server" onkeyup="AddSpecialBulb();" Style="width: 50px; border: none;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_SB" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_RF" runat="server" onclick="AddSpecialBulb();" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_2_9" runat="server" onclick="ReplaceWatage26(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_10_13" runat="server" onclick="ReplaceWatage26(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_14_16" runat="server" onclick="ReplaceWatage26(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_17_20" runat="server" onclick="ReplaceWatage26(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_21_25" runat="server" onclick="ReplaceWatage26(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_LR" runat="server" onclick="Location26(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_DR" runat="server" onclick="Location26(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_Kitch" runat="server" onclick="Location26(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_BR" runat="server" onclick="Location26(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_Bath" runat="server" onclick="Location26(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_Hall" runat="server" onclick="Location26(this.id)" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chk_Line26_CFL_Other" runat="server" onclick="Location26(this.id)" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line26_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>







                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="100%" style="border: 0 !important;">&nbsp;</td>
                        <td style="border: 0 !important;" valign="top">&nbsp;</td>
                    </tr>
                    <tr>
                        <td width="100%" style="border: 0 !important;">*Bulp type: Note the following - SB for General Speciality, R/F for Recessed and/or Flood.</td>
                        <td style="border: 0 !important;" valign="top">&nbsp;</td>
                    </tr>
                    <tr>
                        <td width="100%" style="border: 0 !important;">
                            <br />
                            Number of Specialty Bulbs Installed:
                            <asp:TextBox ID="txt_SpecialtyBulbs" runat="server" Style="width: 30px; text-align: center; border: none; border-bottom: solid 1px rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;
                            Number of Recessed and/or Flood Bulbs installed:
                            <asp:TextBox ID="txt_RecessedFlood" runat="server" Style="width: 30px; text-align: center; border: none; border-bottom: solid 1px rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;
                            <%--<asp:RadioButton ID="rdo_FilterWhistle_Yes" runat="server" GroupName="FilterWhistle" />
                            Yes
                            <asp:RadioButton ID="rdo_FilterWhistle_No" runat="server" GroupName="FilterWhistle" />
                            No--%>
                            <%-- <br />
                            <br />--%>
                            <%--<strong>*Bulb type: Note the following - SB for General Specialty, R/F for Recessed
                                and/or Flood</strong><br />--%>
                            <%--<br />--%>
                            Number of Torchiers Installed:<asp:TextBox ID="txtTorchInstall" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 30px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><%--&nbsp;&nbsp;Number
                            of Other Speciality Bulbs Installed:--%><asp:TextBox ID="txtSpcltyBulbInstall" runat="server"
                                Visible="false" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 30px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><br />
                            <br />
                            <!--table 1-->
                        </td>
                        <td style="border: 0 !important;" valign="top">
                            <!--table 2-->
                        </td>
                    </tr>
                </table>

            </div>
    </div>
    <!--newtable end-->
    <%--</div>--%>

    <script type="text/javascript">
        $(function () {
            document.getElementById('Page4').classList.add("ui-selected");
        });

        function ReplaceWatage1(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line1_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line1_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line1_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line1_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage2(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line2_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line2_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line2_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line2_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage3(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line3_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line3_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line3_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line3_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage4(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line4_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line4_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line4_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line4_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage5(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line5_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line5_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line5_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line5_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage6(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line6_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line6_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line6_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line6_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage7(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line7_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line7_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line7_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line7_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage8(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line8_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line8_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line8_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line8_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage9(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line9_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line9_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line9_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line9_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage10(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line10_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line10_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line10_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line10_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage11(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line11_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line11_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line11_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line11_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage12(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line12_CFL_9_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line12_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line12_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line12_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function Location1(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line1_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line1_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line1_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line1_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line1_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line1_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line1_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location2(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line2_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line2_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line2_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line2_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line2_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line2_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line2_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location3(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line3_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line3_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line3_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line3_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line3_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line3_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line3_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location4(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line4_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line4_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line4_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line4_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line4_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line4_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line4_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location5(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line5_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line5_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line5_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line5_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line5_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line5_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line5_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location6(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line6_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line6_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line6_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line6_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line6_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line6_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line6_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location7(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line7_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line7_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line7_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line7_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line7_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line7_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line7_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location8(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line8_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line8_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line8_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line8_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line8_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line8_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line8_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location9(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line9_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line9_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line9_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line9_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line9_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line9_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line9_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location10(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line10_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line10_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line10_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line10_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line10_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line10_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line10_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location11(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line11_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line11_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line11_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line11_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line11_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line11_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line11_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location12(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line12_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line12_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line12_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line12_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line12_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line12_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line12_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        //        function BulbType13(ID) {
        //            var CheckBox = document.getElementById(ID);
        //            if (!CheckBox.checked) {
        //                CheckBox.checked = false;
        //            }
        //            else {
        //                document.getElementById('<%= chk_Line13_CFL_SB.ClientID %>').checked = false;
        //                document.getElementById('<%= chk_Line13_CFL_RF.ClientID %>').checked = false;
        //                CheckBox.checked = true;
        //            }
        //        }


        function ReplaceWatage13(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line13_CFL_2_9.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line13_CFL_10_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line13_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line13_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line13_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage14(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line14_CFL_2_9.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line14_CFL_10_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line14_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line14_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line14_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage15(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line15_CFL_2_9.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line15_CFL_10_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line15_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line15_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line15_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage16(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line16_CFL_2_9.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line16_CFL_10_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line16_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line16_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line16_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage17(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line17_CFL_2_9.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line17_CFL_10_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line17_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line17_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line17_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ReplaceWatage18(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line18_CFL_2_9.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line18_CFL_10_13.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line18_CFL_14_16.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line18_CFL_17_20.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line18_CFL_21_25.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location13(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line13_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line13_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line13_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line13_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line13_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line13_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line13_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location14(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line14_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line14_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line14_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line14_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line14_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line14_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line14_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location15(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line15_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line15_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line15_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line15_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line15_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line15_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line15_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location16(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line16_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line16_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line16_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line16_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line16_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line16_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line16_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location17(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line17_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line17_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line17_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line17_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line17_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line17_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line17_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function Location18(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Line18_CFL_LR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line18_CFL_DR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line18_CFL_Kitch.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line18_CFL_BR.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line18_CFL_Bath.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line18_CFL_Hall.ClientID %>').checked = false;
                document.getElementById('<%= chk_Line18_CFL_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }







    <%--    
        function AddLedBulbs() {

            var line1 = document.getElementById('<%= txt_Line1_Total.ClientID %>').value;
            if (line1 == '') {
                line1 = 0;
            }
            var line2 = document.getElementById('<%= txt_Line2_Total.ClientID %>').value;
            if (line2 == '') {
                line2 = 0;
            }
            var line3 = document.getElementById('<%= txt_Line3_Total.ClientID %>').value;
            if (line3 == '') {
                line3 = 0;
            }
            var line4 = document.getElementById('<%= txt_Line4_Total.ClientID %>').value;
            if (line4 == '') {
                line4 = 0;
            }
            document.getElementById('<%= txt_TotalLedInstallBulb.ClientID %>').value=parseInt(line1)+parseInt(line2)+parseInt(line3)+parseInt(line4)  
            }
        
        
        
        --%>





        function AddStandardBulb() {

            var line1 = document.getElementById('<%= txt_Line1_Install.ClientID %>').value;
            if (line1 == '') {
                line1 = 0;
            }
            var line2 = document.getElementById('<%= txt_Line2_Install.ClientID %>').value;
            if (line2 == '') {
                line2 = 0;
            }
            var line3 = document.getElementById('<%= txt_Line3_Install.ClientID %>').value;
            if (line3 == '') {
                line3 = 0;
            }
            var line4 = document.getElementById('<%= txt_Line4_Install.ClientID %>').value;
            if (line4 == '') {
                line4 = 0;
            }
            var line5 = document.getElementById('<%= txt_Line5_Install.ClientID %>').value;
            if (line5 == '') {
                line5 = 0;
            }
            var line6 = document.getElementById('<%= txt_Line6_Install.ClientID %>').value;
            if (line6 == '') {
                line6 = 0;
            }
            var line7 = document.getElementById('<%= txt_Line7_Install.ClientID %>').value;
            if (line7 == '') {
                line7 = 0;
            }
            var line8 = document.getElementById('<%= txt_Line8_Install.ClientID %>').value;
            if (line8 == '') {
                line8 = 0;
            }
            var line9 = document.getElementById('<%= txt_Line9_Install.ClientID %>').value;
            if (line9 == '') {
                line9 = 0;
            }
            var line10 = document.getElementById('<%= txt_Line10_Install.ClientID %>').value;
            if (line10 == '') {
                line10 = 0;
            }
            var line11 = document.getElementById('<%= txt_Line11_Install.ClientID %>').value;
            if (line11 == '') {
                line11 = 0;
            }
            var line12 = document.getElementById('<%= txt_Line12_Install.ClientID %>').value;
            if (line12 == '') {
                line12 = 0;
            }
            var TotalStandardBulb = parseInt(line1) + parseInt(line2) + parseInt(line3) + parseInt(line4) + parseInt(line5) + parseInt(line6) + parseInt(line7) + parseInt(line8) + parseInt(line9) + parseInt(line10) + parseInt(line11) + parseInt(line12);
            document.getElementById('<%= txt_Standard_Bullbs.ClientID %>').value = TotalStandardBulb;
        }

        

     function AddSpecialBulb() {        
         
            var chk_Line13_CFL_SB = document.getElementById('<%= chk_Line13_CFL_SB.ClientID %>');
            var chk_Line14_CFL_SB = document.getElementById('<%= chk_Line14_CFL_SB.ClientID %>');
            var chk_Line15_CFL_SB = document.getElementById('<%= chk_Line15_CFL_SB.ClientID %>');
            var chk_Line16_CFL_SB = document.getElementById('<%= chk_Line16_CFL_SB.ClientID %>');
            var chk_Line17_CFL_SB = document.getElementById('<%= chk_Line17_CFL_SB.ClientID %>');
            var chk_Line18_CFL_SB = document.getElementById('<%= chk_Line18_CFL_SB.ClientID %>');
			var chk_Line19_CFL_SB = document.getElementById('<%= chk_Line19_CFL_SB.ClientID %>');
            var chk_Line20_CFL_SB = document.getElementById('<%= chk_Line20_CFL_SB.ClientID %>');
            var chk_Line21_CFL_SB = document.getElementById('<%= chk_Line21_CFL_SB.ClientID %>');
            var chk_Line22_CFL_SB = document.getElementById('<%= chk_Line22_CFL_SB.ClientID %>');
            var chk_Line23_CFL_SB = document.getElementById('<%= chk_Line23_CFL_SB.ClientID %>');
            var chk_Line24_CFL_SB = document.getElementById('<%= chk_Line24_CFL_SB.ClientID %>');
			var chk_Line25_CFL_SB = document.getElementById('<%= chk_Line25_CFL_SB.ClientID %>');
            var chk_Line26_CFL_SB = document.getElementById('<%= chk_Line26_CFL_SB.ClientID %>');
            
            
            var chk_Line13_CFL_RF = document.getElementById('<%= chk_Line13_CFL_RF.ClientID %>');
            var chk_Line14_CFL_RF = document.getElementById('<%= chk_Line14_CFL_RF.ClientID %>');
            var chk_Line15_CFL_RF = document.getElementById('<%= chk_Line15_CFL_RF.ClientID %>');
            var chk_Line16_CFL_RF = document.getElementById('<%= chk_Line16_CFL_RF.ClientID %>');
            var chk_Line17_CFL_RF = document.getElementById('<%= chk_Line17_CFL_RF.ClientID %>');
            var chk_Line18_CFL_RF = document.getElementById('<%= chk_Line18_CFL_RF.ClientID %>');  
			var chk_Line19_CFL_RF = document.getElementById('<%= chk_Line19_CFL_RF.ClientID %>');
            var chk_Line20_CFL_RF = document.getElementById('<%= chk_Line20_CFL_RF.ClientID %>');
            var chk_Line21_CFL_RF = document.getElementById('<%= chk_Line21_CFL_RF.ClientID %>');
            var chk_Line22_CFL_RF = document.getElementById('<%= chk_Line22_CFL_RF.ClientID %>');
            var chk_Line23_CFL_RF = document.getElementById('<%= chk_Line23_CFL_RF.ClientID %>');
            var chk_Line24_CFL_RF = document.getElementById('<%= chk_Line24_CFL_RF.ClientID %>');
			var chk_Line25_CFL_RF = document.getElementById('<%= chk_Line25_CFL_RF.ClientID %>');
            var chk_Line26_CFL_RF = document.getElementById('<%= chk_Line26_CFL_RF.ClientID %>');
            
            var TotalSB = '0'; var TotalRF = '0';
            
			var line13 = document.getElementById('<%= txt_Line13_Install.ClientID %>').value;
            if (line13 == '') {
                line13 = 0;
            }
            var line14 = document.getElementById('<%= txt_Line14_Install.ClientID %>').value;
            if (line14 == '') {
                line14 = 0;
            }
            var line15 = document.getElementById('<%= txt_Line15_Install.ClientID %>').value;
            if (line15 == '') {
                line15 = 0;
            }
            var line16 = document.getElementById('<%= txt_Line16_Install.ClientID %>').value;
            if (line16 == '') {
                line16 = 0;
            }
            var line17 = document.getElementById('<%= txt_Line17_Install.ClientID %>').value;
            if (line17 == '') {
                line17 = 0;
            }
            var line18 = document.getElementById('<%= txt_Line18_Install.ClientID %>').value;
            if (line18 == '') {
                line18 = 0;
            }
			var line19 = document.getElementById('<%= txt_Line19_Install.ClientID %>').value;
            if (line19 == '') {
                line19 = 0;
            }
            var line20 = document.getElementById('<%= txt_Line20_Install.ClientID %>').value;
            if (line20 == '') {
                line20 = 0;
            }
            var line21 = document.getElementById('<%= txt_Line21_Install.ClientID %>').value;
            if (line21 == '') {
                line21 = 0;
            }
            var line22 = document.getElementById('<%= txt_Line22_Install.ClientID %>').value;
            if (line22 == '') {
                line22 = 0;
            }
            var line23 = document.getElementById('<%= txt_Line23_Install.ClientID %>').value;
            if (line23 == '') {
                line23 = 0;
            }
            var line24 = document.getElementById('<%= txt_Line24_Install.ClientID %>').value;
            if (line24 == '') {
                line24 = 0;
            }       
            var line25 = document.getElementById('<%= txt_Line25_Install.ClientID %>').value;
            if (line25 == '') {
                line25 = 0;
            }
            var line26 = document.getElementById('<%= txt_Line26_Install.ClientID %>').value;
            if (line26 == '') {
                line26 = 0;
            }
            
   
            
            if(chk_Line13_CFL_SB.checked == true)
            {               
                TotalSB = parseInt(line13) + parseInt(TotalSB);               
            }
            
            if(chk_Line14_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line14) + parseInt(TotalSB);
            }
            
            if(chk_Line15_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line15) + parseInt(TotalSB);
            }
            
            if(chk_Line16_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line16) + parseInt(TotalSB);
            }
            
            if(chk_Line17_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line17) + parseInt(TotalSB);
            }
            
            if(chk_Line18_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line18) + parseInt(TotalSB);
            }
			 if(chk_Line19_CFL_SB.checked == true)
            {               
                TotalSB = parseInt(line19) + parseInt(TotalSB);               
            }
            
            if(chk_Line20_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line20) + parseInt(TotalSB);
            }
            
            if(chk_Line21_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line21) + parseInt(TotalSB);
            }
            
            if(chk_Line22_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line22) + parseInt(TotalSB);
            }
            
            if(chk_Line23_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line23) + parseInt(TotalSB);
            }
            
            if(chk_Line24_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line24) + parseInt(TotalSB);
            }
            if(chk_Line25_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line25) + parseInt(TotalSB);
            }
            
            if(chk_Line26_CFL_SB.checked == true)
            {
                TotalSB = parseInt(line26) + parseInt(TotalSB);
            }
            
        
            
            if(chk_Line13_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line13) + parseInt(TotalRF);
            }
            
            if(chk_Line14_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line14) + parseInt(TotalRF);
            }
            
            if(chk_Line15_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line15) + parseInt(TotalRF);
            }
            
            if(chk_Line16_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line16) + parseInt(TotalRF);
            }
            
            if(chk_Line17_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line17) + parseInt(TotalRF);
            }
            
            if(chk_Line18_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line18) + parseInt(TotalRF);
            }
            if(chk_Line19_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line19) + parseInt(TotalRF);
            }
            
            if(chk_Line20_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line20) + parseInt(TotalRF);
            }
            
            if(chk_Line21_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line21) + parseInt(TotalRF);
            }
            
            if(chk_Line22_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line22) + parseInt(TotalRF);
            }
            
            if(chk_Line23_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line23) + parseInt(TotalRF);
            }
            
            if(chk_Line24_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line24) + parseInt(TotalRF);
            }
			if(chk_Line25_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line25) + parseInt(TotalRF);
            }
            
            if(chk_Line26_CFL_RF.checked == true)
            {
                TotalRF = parseInt(line26) + parseInt(TotalRF);
            }
			
			
			
            document.getElementById('<%= txt_SpecialtyBulbs.ClientID %>').value = TotalSB;
            document.getElementById('<%= txt_RecessedFlood.ClientID %>').value = TotalRF;
        }
 
 
 
 
 
 
 
 
        function ClickHereToPrintFull() {


            var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
            disp_setting += "scrollbars=yes,width=670px, height=600px, left=100, top=25";
            var content_vlue = document.getElementById('DivPrint').innerHTML;
            var docprint = window.open("", "", disp_setting);
            docprint.document.open();
            docprint.document.write('<html><head><title>Custom Weatherization</title> ');
            docprint.document.write('</head><body onLoad="self.print()"><center>');
            docprint.document.write(content_vlue);
            docprint.document.write('</center></body></html>');
            docprint.document.close();
            docprint.focus();
        }
    </script>

</asp:Content>
