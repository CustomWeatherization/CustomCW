<%@ Page Language="C#" MasterPageFile="~/METED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page6.aspx.cs" Inherits="METED_METED_Audit_Page6" Title="METED Audit Page6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        h2
        {
            font-size: 20px;
            padding-left: 20px;
        }
        body
        {
            font-size: 12px;
        }
        input[type="radio"]
        {
            margin-left: 1px;
        }
        input[type="checkbox"]
        {
            margin: 0 0 1px 1px;
        }
        p
        {
            padding: 5px 0px !important;
            float: left;
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
        <div class="newtable">
            <h4 align="center">
                Freezers</h4>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                    </td>
                </tr>
                <tr align="right" id="tr_freezersUsed" runat="server">
                    <td>
                        Number of freezers used:<asp:TextBox ID="txt_FreezersUsed" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 55px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <table width="80%" border="1" cellspacing="0" cellpadding="5" style="margin: 0 auto;">
                <tr>
                    <td align="center">
                        <b>Existing Freezer Type</b>
                    </td>
                    <td align="center">
                        <b>Existing Freezer Size</b>
                    </td>
                    <td align="center">
                        <b>If existing one hour of use is:</b>
                    </td>
                    <td align="center">
                        <b>Then</b>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Chest
                    </td>
                    <td align="center">
                        Less than 8 cf
                    </td>
                    <td align="center">
                        Greater than .064 kWh
                    </td>
                    <td align="center">
                        Replace existing unit
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Chest
                    </td>
                    <td align="center">
                        8.1 to 12.9 cf
                    </td>
                    <td align="center">
                        Greater than .084 kWh
                    </td>
                    <td align="center">
                        Replace existing unit
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Chest
                    </td>
                    <td align="center">
                        13 to 15.5 cf
                    </td>
                    <td align="center">
                        Greater than .103 kWh
                    </td>
                    <td align="center">
                        Replace existing unit
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Chest
                    </td>
                    <td align="center">
                        15.6 cf or larger
                    </td>
                    <td align="center">
                        Greater than .154 kWh
                    </td>
                    <td align="center">
                        Replace existing unit
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Upright
                    </td>
                    <td align="center">
                        Less than 10 cf
                    </td>
                    <td align="center">
                        Greater than .074 kWh
                    </td>
                    <td align="center">
                        Replace existing unit
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Upright
                    </td>
                    <td align="center">
                        10.1 to 12.9 cf
                    </td>
                    <td align="center">
                        Greater than .103 kWh
                    </td>
                    <td align="center">
                        Replace existing unit
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Upright
                    </td>
                    <td align="center">
                        13 to 15.5 cf
                    </td>
                    <td align="center">
                        Greater than .123 kWh
                    </td>
                    <td align="center">
                        Replace existing unit
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Upright
                    </td>
                    <td align="center">
                        15.6 or larger
                    </td>
                    <td align="center">
                        Greater than .154 kWh
                    </td>
                    <td align="center">
                        Replace existing unit
                    </td>
                </tr>
            </table>
            <div class="tab" style="border: 1px solid #000; padding: 10px; margin-top: 20px;">
                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <b>Primary Freezer:</b>
                        </td>
                        <td>
                            Location:<asp:TextBox ID="txt_PriFrezer_Location" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                        <td align="left">
                            Calculated Estimated Operating<br />
                            Cost/Month. (Optional Info): $:<asp:TextBox ID="txt_PriFrezer_OperatingCost" runat="server"
                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 55px; font-weight: normal;
                                color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Make:<asp:TextBox ID="txt_PriFrezer_Make" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%--</td>
                        <td>--%>
                            Model:<asp:TextBox ID="txt_PriFrezer_Model" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%--</td>
                        <td>--%>
                            Year:<asp:TextBox ID="txt_PriFrezer_Year" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%--</td>
                        <td>--%>
                            Size:<asp:TextBox ID="txt_PriFrezer_Size" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RadioButton ID="rdoPrimaryUpright" runat="server" Text="Upright" GroupName="PrimaryUpright" />&nbsp;&nbsp;&nbsp;
                            <asp:RadioButton ID="rdoPrimaryChest" runat="server" Text="Chest" GroupName="PrimaryUpright" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Start Time:<asp:TextBox ID="txt_PriFrezer_StartTime" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 120px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <%--</td>
                        <td>--%>
                            End Time:<asp:TextBox ID="txt_PriFrezer_EndTime" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 120px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <%--</td>
                        <td>--%>
                            Total Time Monitored:<asp:TextBox ID="txt_PriFrezer_TotalTime" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 120px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <%--</td>
                        <td>--%>
                            Frost Free?
                            <asp:CheckBox ID="chk_PriFrezer_FrostFree_Yes" runat="server" Text="Yes" onclick="PriFrezer_FrostFree(this.id)" />
                            <asp:CheckBox ID="chk_PriFrezer_FrostFree_No" runat="server" Text="No" onclick="PriFrezer_FrostFree(this.id)" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            kWh Monitor Reading:<asp:TextBox ID="txt_PriFrezer_Monitor" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                        <td>
                            kWh conversion at one hour:<asp:TextBox ID="txt_PriFrezer_Conversion" runat="server"
                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 85px; font-weight: normal;
                                color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="padding: 9px 0; width: 360px;">
                            Is this unit eligible for replacement?<asp:RadioButton ID="rdo_PriFrezer_Replacement_Yes"
                                runat="server" GroupName="PriFrezer_Replacement" />YES<asp:RadioButton ID="rdo_PriFrezer_Replacement_No"
                                    runat="server" GroupName="PriFrezer_Replacement" />NO
                        </td>
                        <td style="padding: 9px 0;">
                            <%--Temperature inside fresh food:--%><asp:TextBox ID="txt_PriFrezer_TemperatureFood"
                                runat="server" Visible="false" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            Room Temperature:<asp:TextBox ID="txt_PriFrezer_TemperatureRoom" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            Temperature inside freezer:<asp:TextBox ID="txt_PriFrezer_TemperatureFrezer" runat="server"
                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:CheckBox ID="chk_PriFrezer_DatabseUsed" runat="server" />
                            Database Used? Replacement Size:
                            <asp:TextBox ID="txt_PriFrezer_ReplacementSize" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <asp:CheckBox ID="chk_PriFrezer_NotTst" runat="server" />
                            Did not test because
                            <asp:RadioButton ID="rdo_PriFrezer_NotTst_NotMove" runat="server" GroupName="PriFrezer_NotTst" />
                            Could not move
                            <asp:RadioButton ID="rdo_PriFrezer_NotTst_5Yr_Old" runat="server" GroupName="PriFrezer_NotTst" /><
                            5 years old
                            <asp:RadioButton ID="rdo_PriFrezer_NotTst_CustomerRefuse" runat="server" GroupName="PriFrezer_NotTst" />
                            Customer Refused new unit
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab" style="border: 1px solid #000; padding: 10px; margin-top: 20px;">
                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <b>Secondary Freezer:</b>
                        </td>
                        <td>
                            Location:<asp:TextBox ID="txt_SecoFrezer_Location" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                        <td align="left">
                            Calculated Estimated Operating<br />
                            Cost/Month. (Optional Info): $:<asp:TextBox ID="txt_SecoFrezer_OperatingCost" runat="server"
                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 55px; font-weight: normal;
                                color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Make:<asp:TextBox ID="txt_SecoFrezer_Make" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%--</td>
                        <td>--%>
                            Model:<asp:TextBox ID="txt_SecoFrezer_Model" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%--</td>
                        <td>--%>
                            Year:<asp:TextBox ID="txt_SecoFrezer_year" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%--</td>
                        <td>--%>
                            Size:<asp:TextBox ID="txt_SecoFrezer_Size" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RadioButton ID="rdo_SecondryUpright" runat="server" Text="Upright" GroupName="SecondryUpright" />&nbsp;&nbsp;&nbsp;
                            <asp:RadioButton ID="rdoSecondryChest" runat="server" Text="Chest" GroupName="SecondryUpright" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Start Time:<asp:TextBox ID="txt_SecoFrezer_StartTime" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 120px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <%--</td>
                        <td>--%>
                            End Time:<asp:TextBox ID="txt_SecoFrezer_EndTime" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 120px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <%--</td>
                        <td colspan="2">--%>
                            Total Time Monitored:<asp:TextBox ID="txt_SecoFrezer_TotalTime" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 120px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            Frost Free?
                            <asp:CheckBox ID="Chk_SecoFrezer_FrostFree_Yes" runat="server" Text="Yes" onclick="SecoFrezer_FrostFree(this.id)" />
                            <asp:CheckBox ID="Chk_SecoFrezer_FrostFree_No" runat="server" Text="No" onclick="SecoFrezer_FrostFree(this.id)" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            kWh Monitor Reading:<asp:TextBox ID="txt_SecoFrezer_Monitor" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                        <td>
                            kWh conversion at one hour:<asp:TextBox ID="txt_SecoFrezer_Conversion" runat="server"
                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 85px; font-weight: normal;
                                color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="padding: 9px 0; width: 360px;">
                            Is this unit eligible for replacement?<asp:RadioButton ID="rdo_SecoFrezer_Replacement_Yes"
                                runat="server" GroupName="SecoFrezer_Replacement" />YES<asp:RadioButton ID="rdo_SecoFrezer_Replacement_No"
                                    runat="server" GroupName="SecoFrezer_Replacement" />NO
                        </td>
                        <td style="padding: 9px 0;">
                            <!-- Temperature inside</b> fresh food: -->
                            <asp:TextBox ID="txt_SecoFrezer_TemperactureFood" runat="server" Visible="false"
                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                color: rgb(0, 0, 0);"></asp:TextBox>
                            Room Temperature:<asp:TextBox ID="txt_SecoFrezer_TemperactureRoom" runat="server"
                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                color: rgb(0, 0, 0);"></asp:TextBox>
                            Temperature inside freezer:<asp:TextBox ID="txt_SecoFrezer_TemperactureFrezer" runat="server"
                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:CheckBox ID="chk_SecoFrezer_DatabseUsed" runat="server" />
                            Database Used? Replacement Size:
                            <asp:TextBox ID="txt_SecoFrezer_ReplacementSize" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <asp:CheckBox ID="chk_SecoFrezer_NotTst" runat="server" />
                            Did not test because:
                            <asp:RadioButton ID="rdo_SecoFrezer_NotTst_NotMove" runat="server" GroupName="SecoFrezer_NotTst" />
                            Could not move
                            <asp:RadioButton ID="rdo_SecoFrezer_NotTst_5Yr_Old" runat="server" GroupName="SecoFrezer_NotTst" /><
                            5 years old
                            <asp:RadioButton ID="rdo_SecoFrezer_NotTst_CustomerRefuse" runat="server" GroupName="SecoFrezer_NotTst" />
                            Customer Refused new unit
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab" style="border: 1px solid #000; padding: 10px; margin-top: 20px;">
                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <b>Additional Freezer:</b>
                        </td>
                        <td>
                            Location:<asp:TextBox ID="txt_AddFrezer_Location" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                        <td align="left">
                            Calculated Estimated Operating</br> Cost/Month. (Optional Info): $:<asp:TextBox ID="txt_AddFrezer_OperatingCost"
                                runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 55px;
                                font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Make:<asp:TextBox ID="txt_AddFrezer_Make" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%--</td>
                        <td>--%>
                            Model:<asp:TextBox ID="txt_AddFrezer_Model" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%--</td>
                        <td>--%>
                            Year:<asp:TextBox ID="txt_AddFrezer_Year" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%--</td>
                        <td>--%>
                            Size:<asp:TextBox ID="txt_AddFrezer_Size" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RadioButton ID="rdoAdditionalUpright" runat="server" Text="Upright" GroupName="AdditionalUpright" />&nbsp;&nbsp;&nbsp;
                            <asp:RadioButton ID="rdoAdditionalChest" runat="server" Text="Chest" GroupName="AdditionalUpright" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Start Time:<asp:TextBox ID="txt_AddFrezer_StartTime" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 120px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <%--</td>
                        <td>--%>
                            End Time:<asp:TextBox ID="txt_AddFrezer_EndTime" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 120px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <%--</td>
                        <td colspan="2">--%>
                            Total Time Monitored:<asp:TextBox ID="txt_AddFrezer_TotalTime" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 120px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            Frost Free?
                            <asp:CheckBox ID="Chk_AddFrezer_FrostFree_Yes" runat="server" Text="Yes" onclick="AddFrezer_FrostFree(this.id)" />
                            <asp:CheckBox ID="Chk_AddFrezer_FrostFree_No" runat="server" Text="No" onclick="AddFrezer_FrostFree(this.id)" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            kWh Monitor Reading:<asp:TextBox ID="txt_AddFrezer_Monitor" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                        <td>
                            kWh conversion at one hour:<asp:TextBox ID="txt_AddFrezer_Conversion" runat="server"
                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 85px; font-weight: normal;
                                color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="padding: 9px 0; width: 360px;">
                            Is this unit eligible for replacement?<asp:RadioButton ID="rdo_AddFrezer_Replacement_Yes"
                                runat="server" GroupName="AddFrezer_Replacement" />YES<asp:RadioButton ID="rdo_AddFrezer_Replacement_No"
                                    runat="server" GroupName="AddFrezer_Replacement" />NO
                        </td>
                        <td style="padding: 9px 0;">
                            <%--Temperature inside fresh food:--%><asp:TextBox ID="txt_AddFrezer_TemperatureFood"
                                runat="server" Visible="false" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            Room Temperature:<asp:TextBox ID="txt_AddFrezer_TemperatureRoom" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            Temperature inside freezer:<asp:TextBox ID="txt_AddFrezer_TemperatureFrezer" runat="server"
                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                color: rgb(0, 0, 0);"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:CheckBox ID="chk_AddFrezer_DatabseUsed" runat="server" />
                            Database Used? Replacement Size:
                            <asp:TextBox ID="txt_AddFrezer_ReplacementSize" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <asp:CheckBox ID="chk_AddFrezer_NotTst" runat="server" />
                            Did not test because
                            <asp:RadioButton ID="rdo_AddFrezer_NotTst_NotMove" runat="server" GroupName="AddFrezer_NotTst" />
                            Could not move
                            <asp:RadioButton ID="rdo_AddFrezer_NotTst_5Yr_Old" runat="server" GroupName="AddFrezer_NotTst" />
                            < 5 years old
                            <asp:RadioButton ID="rdo_AddFrezer_NotTst_CustomerRefuse" runat="server" GroupName="AddFrezer_NotTst" />
                            Customer Refused new unit
                        </td>
                    </tr>
                </table>
            </div>
            <p style="float: left; width: 15% !important;">
                Comments:<br />
                Utilize this space to<br />
                indicate readings for<br />
                additional<br />
                refrigerators/freezers<br />
                monitored in the<br />
                home.</p>
            <p style="float: right; width: 85% !important;">
                <asp:TextBox ID="txt_Refrigerators_Freezers" runat="server" TextMode="MultiLine"
                    Width="97%" Height="180px"></asp:TextBox>
            </p>
        </div>
    </div>

    <script type="text/javascript">

        $(function() {
            document.getElementById('Page6').classList.add("ui-selected");
        });



        function AddFrezer_FrostFree(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= Chk_AddFrezer_FrostFree_Yes.ClientID %>').checked = false;
                document.getElementById('<%= Chk_AddFrezer_FrostFree_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function SecoFrezer_FrostFree(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= Chk_SecoFrezer_FrostFree_Yes.ClientID %>').checked = false;
                document.getElementById('<%= Chk_SecoFrezer_FrostFree_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function PriFrezer_FrostFree(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_PriFrezer_FrostFree_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_PriFrezer_FrostFree_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function ClickHereToPrintFull() {


            var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
            disp_setting += "scrollbars=yes,width=650px, height=600px, left=100, top=25";
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
