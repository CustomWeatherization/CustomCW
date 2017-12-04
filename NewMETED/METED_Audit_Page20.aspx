<%@ Page Language="C#" MasterPageFile="~/NewMETED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page20.aspx.cs" Inherits="METED_METED_Audit_Page18" Title="METED Audit Page18" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body
        {
            font-size: 13px;
        }
        input[type="radio"]
        {
            margin-left: 6px;
        }
        input[type="checkbox"]
        {
            margin: 0 0 5px 5px;
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
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td colspan="3">
                        Copy this page for as many tests that are needed. Typically, there should be two
                        of this form, one for pre-work testing and one for post-work testing.
                    </td>
                </tr>
                <tr>
                    <td width="27%" style="text-align: left">
                        <%--<asp:RadioButton ID="rdo_PreTest" runat="server" GroupName="tes_ting" />--%>
                        <asp:CheckBox ID="rdo_PreTest" runat="server" onclick="PrePost(this.id);" />
                        Pre-test
                    </td>
                    <td width="27%">
                        <%--<asp:RadioButton ID="rdo_PostTest" runat="server" GroupName="tes_ting" />--%>
                        <asp:CheckBox ID="rdo_PostTest" runat="server" onclick="PrePost(this.id);" />
                        Post-Test
                    </td>
                    <td width="90%">
                        Tech Name
                        <asp:TextBox ID="txt_TechName" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 250px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%--<asp:RadioButton ID="rdo_Auditor" runat="server" GroupName="testing" />--%>
                        <asp:CheckBox ID="rdo_Auditor" runat="server" onclick="AuditorCrew(this.id);" />
                        Auditor
                    </td>
                    <td>
                        <%--<asp:RadioButton ID="rdo_Crew" runat="server" GroupName="testing" />--%>
                        <asp:CheckBox ID="rdo_Crew" runat="server" onclick="AuditorCrew(this.id);" />
                        Crew
                        <asp:TextBox ID="txt_Crew" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 150px; font-weight: normal; color: rgb(0, 0, 0); width: 120px; !important;
                            /* target ie8 & ie9 only */width: 120px; !important; /* ie 6 */width: 120px;
                            !important; /* ie 8-9 */"></asp:TextBox>
                    </td>
                    <td>
                        Test Date:
                        <asp:TextBox ID="txt_TestDate" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 250px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_TestDate"
                            OnClientDateSelectionChanged="checkDate">
                        </ajaxToolkit:CalendarExtender>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                            TargetControlID="txt_TestDate" FilterType="Custom,Numbers" ValidChars="/">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <strong>Combustion Safety Testing</strong> Are there Combustion Appliances?
                        <asp:RadioButton ID="rdo_CombustionAppliances_Yes" runat="server" GroupName="test" />
                        Yes
                        <asp:RadioButton ID="rdo_CombustionAppliances_No" runat="server" GroupName="test" />
                        No
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        Combustion Equipment Safety Tests must be performed if any air sealing will be done
                        or is done. If post-treatment blower door test is lower than the pre-treatment test,
                        the chart below MUST be completed. Refer to the Procedure Manual for complete testing
                        procedure.
                    </td>
                </tr>
            </table>
            <div class="newtable" style="border: 1px solid #000; padding: 2px; height: auto;">
                Are there any <u>unvented</u> combustion heating appliances?
                <asp:RadioButton ID="rdo_UnventedCombustionHeatingApp_Y" runat="server" GroupName="tester" />
                Yes
                <asp:RadioButton ID="rdo_UnventedCombustionHeatingApp_N" runat="server" GroupName="tester" />
                No
                <table width="100%" border="1" cellspacing="0" cellpadding="1">
                    <tr>
                        <td align="center">
                        </td>
                        <td align="center" colspan="2">
                            CO Initial Reading
                        </td>
                        <td align="center" colspan="2">
                            CO After<br />
                            5-10
                            <br />
                            Min
                        </td>
                        <td align="center">
                            Gas<br />
                            Leak<br />
                            Det Y/N
                        </td>
                        <td align="center">
                            Flame<br />
                            Rollout<br />
                            Y/N
                        </td>
                        <td align="center" colspan="2">
                            Spillage Y/N
                        </td>
                        <td align="center" colspan="2">
                            Spillage after<br />
                            1 min Y/N
                        </td>
                        <td align="center" colspan="2">
                            Draft Pressure PA
                        </td>
                        <td align="center" colspan="2">
                            Draft Pass Y/N
                        </td>
                        <td align="center" colspan="2">
                            CO Flue
                        </td>
                        <td align="center" colspan="2">
                            CO Pass Y/N
                        </td>
                        <td colspan="3" align="center">
                            Optional
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            Appliance
                        </td>
                        <td align="center">
                            AMB
                        </td>
                        <td align="center">
                            CAZ
                        </td>
                        <td align="center">
                            AMB
                        </td>
                        <td align="center">
                            CAZ
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                            W/C
                        </td>
                        <td align="center">
                            NAT
                        </td>
                        <td align="center">
                            W/C
                        </td>
                        <td align="center">
                            NAT
                        </td>
                        <td align="center">
                            W/C
                        </td>
                        <td>
                            NAT
                        </td>
                        <td align="center">
                            W/C
                        </td>
                        <td>
                            NAT
                        </td>
                        <td align="center">
                            W/C
                        </td>
                        <td>
                            NAT
                        </td>
                        <td align="center">
                            W/C
                        </td>
                        <td>
                            NAT
                        </td>
                        <td>
                            Stack Temp
                        </td>
                        <td>
                            O2
                        </td>
                        <td>
                            Eff.
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            Water Heater
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_WaterHeater_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_WaterHeater_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_After_WaterHeater_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_After_WaterHeater_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_GasLeak_WaterHeater" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Flame_WaterHeater" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_WaterHeater_WC" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_WaterHeater_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_WaterHeater_WC" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_WaterHeater_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_WaterHeater_WC" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_WaterHeater_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_WaterHeater_WC" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_WaterHeater_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_WaterHeater_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_WaterHeater_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_WaterHeater_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_WaterHeater_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_WaterHeater_StackTemp" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_WaterHeater_O2" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_WaterHeater_Eff" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            Furnace/Boiler
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_FurnaceBoil_AMB" runat="server" Style="width: 20px; border: none;"
                                Height="18px"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_FurnaceBoil_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoAfter_FurnaceBoil_AMB" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoAfter_FurnaceBoil_CAZ" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_GasLeak_FurnaceBoil" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Flame_FurnaceBoil" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_FurnaceBoil_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_FurnaceBoil_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_FurnaceBoil_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_FurnaceBoil_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_FurnaceBoil_Stack" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_FurnaceBoil_O2" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_FurnaceBoil_Eff" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <%-- <td align="center">
                            <asp:TextBox ID="txt_Optional_Other_Stack" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_Other_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_Other_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>--%>
                    </tr>
                    <tr>
                        <td align="center">
                            Gas Range
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_GasRange_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_GasRange_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoAfter_GasRange_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoAfter_GasRange_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_GasLeak_GasRange" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Flame_GasRange" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_GasRange_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_GasRange_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_GasRange_WC" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_GasRange_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_GasRange_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_GasRange_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_GasRange_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_GasRange_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_GasRange_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_GasRange_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_GasRange_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_GasRange_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_GasRange_Stack" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_GasRange_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_GasRange_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            Other
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_Other_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_Other_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoAfter_Other_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoAfter_Other_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_GasLeak_Other" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Flame_Other" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_Other_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_Other_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_Other_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_Other_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_Other_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_Other_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_Other_Stack" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_Other_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_Other_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:TextBox ID="txt_Col1Cat" runat="server" Style="width: 70px; border: none; font-size: 11px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_Col1Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_Col1Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoAfter_Col1Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoAfter_Col1Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_GasLeak_Col1Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Flame_Col1Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_Col1Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_Col1Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_Col1Cat_WC" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_Col1Cat_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_Col1Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_Col1Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_Col1Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_Col1Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_Col1Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_Col1Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_Col1Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_Col1Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_Col1Cat_Stack" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_Col1Cat_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_Col1Cat_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:TextBox ID="txt_Col2Cat" runat="server" Style="width: 70px; border: none; font-size: 11px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_Col2Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Co_Col2Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoAfter_Col2Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoAfter_Col2Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_GasLeak_Col2Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Flame_Col2Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_Col2Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Spillage_Col2Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_Col2Cat_WC" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_SpillageAfter_Col2Cat_NAT" runat="server" Style="width: 20px;
                                border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_Col2Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPress_Col2Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_Col2Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_DraftPass_Col2Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_Col2Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoFuel_Col2Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_Col2Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_CoPass_Col2Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_Col2Cat_Stack" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_Col2Cat_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Optional_Col2Cat_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                 <table width="100%" cellspacing="0" cellpadding="1" style="color:red; border: solid 1px Red;">
                      <tr>
                       <td>
                            *Calculate combustion air requirment in the case where there is spillage at one minute(Y) or where the draft pressure test fails(N). The standard method for calculate the required CAZ volume to provide sufficient air is 50 cubic ft for 1,000 BTUH of combined appliance input.
                       </td>
                   </tr>
                     <tr>
                         <td>
                             Total BTUH <asp:TextBox ID="txt_Total_BTUH" runat="server" Style="width: 60px; border:none; border-bottom: solid 1px rgb(0, 0, 0);"></asp:TextBox> Input/1000*50= <asp:TextBox ID="txt_VolumeCombustionAir" runat="server" Style="width: 60px; border: none; border-bottom: solid 1px rgb(0, 0, 0);"></asp:TextBox>the cu.ft.volume of combustion air required.
                         </td>
                     </tr>  
               </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr>
                        <td width="33%" style="vertical-align: 0;">
                            <div class="newtable" style="border: 1px solid #000; padding: 5px; height: auto;">
                                <strong>Burners:</strong>
                                <br />
                                Write in CO ppm for
                                <br />
                                each burner:<br />
                                <strong>Oven</strong>
                                <br />
                                If CO at oven vent is 100 ppm or more, install CO alarm and recommend service. No
                                air sealing is allowed until CO level drops below 100 ppm.
                                <p>
                                    <strong>Oven:</strong>
                                </p>
                                CO Ambient:
                                <asp:TextBox ID="txt_COAmbient" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 60px;"></asp:TextBox>
                                <br />
                                <br />
                                CO at oven vent:
                                <asp:TextBox ID="txt_CO_Oven_Vent" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 60px;"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            <table border="0" width="100%">
                                <tr>
                                    <td width="33%" align="top" style="vertical-align: 0; width: 262px; margin: 0px 0px 0px 50px;
                                        float: left;">
                                        <div class="newtable" style="border: 1px solid #000; padding: 5px; height: auto;
                                            width: 70%">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="10">
                                                <tr>
                                                    <td>
                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                            <asp:TextBox ID="txt_CoNotes1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                    </td>
                                                    <td>
                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                            <asp:TextBox ID="txt_CoNotes2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                            <asp:TextBox ID="txt_CoNotes3" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                    </td>
                                                    <td>
                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                            <asp:TextBox ID="txt_CoNotes4" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="float: right; margin-top: -82px;" class="">
                                            Notes:
                                        </div>
                                    </td>
                                    <td align="right" valign="top" style="float: left; width: 160px; text-align: center;">
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <%--<tr>
                                                <td align="center" colspan="3">Optional
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Note1_18" runat="server" TextMode="MultiLine" Style="background: #eaeaea;
                                                        padding: 4px; height: 120px;"></asp:TextBox>
                                                </td>
                                                <%--<td>O2
                                                </td>
                                                <td>Eff.
                                                </td>--%>
                                            </tr>
                                            <tr>
                                                <%--<td align="center">
                                                    <asp:TextBox ID="txt_Optional_WaterHeater_StackTemp" runat="server" Style="width: 20px;
                                                        border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_WaterHeater_O2" runat="server" Style="width: 20px;
                                                        border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_WaterHeater_Eff" runat="server" Style="width: 20px;
                                                        border: none;"></asp:TextBox>
                                                </td>--%>
                                            </tr>
                                            <tr>
                                                <%--<td align="center">
                                                    <asp:TextBox ID="txt_Optional_FurnaceBoil_Stack" runat="server" Style="width: 20px;
                                                        border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_FurnaceBoil_O2" runat="server" Style="width: 20px;
                                                        border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_FurnaceBoil_Eff" runat="server" Style="width: 20px;
                                                        border: none;"></asp:TextBox>
                                                </td>--%>
                                            </tr>
                                            <tr>
                                                <%-- <td align="center">
                                                    <asp:TextBox ID="txt_Optional_GasRange_Stack" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_GasRange_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_GasRange_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>--%>
                                            </tr>
                                            <tr>
                                                <%--<td align="center">
                                                    <asp:TextBox ID="txt_Optional_Other_Stack" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_Other_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_Other_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>--%>
                                            </tr>
                                            <tr>
                                                <%--<td align="center">
                                                    <asp:TextBox ID="txt_Optional_Col1Cat_Stack" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_Col1Cat_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_Col1Cat_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>--%>
                                            </tr>
                                            <tr>
                                                <%--<td align="center">
                                                    <asp:TextBox ID="txt_Optional_Col2Cat_Stack" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_Col2Cat_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Optional_Col2Cat_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                                </td>--%>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="100%">
                                        <div style="float: left; margin-top: 15px;">
                                            Notes:
                                        </div>
                                        <asp:TextBox ID="txt_CoNotes" runat="server" Style="border: solid 1px #000; padding: 5px;
                                            width: 88%; height: 46px;" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center" style="font-size: 11px;">
                            <u>AMB = Ambient, CAZ = Combustion Appliance Zone, Det = Detected, W/C = Worst Case
                                Conditions, NAT = Natural, Temp = Temperature, Eff = Efficiency</u>
                            <br />
                            Pa = Pascal, IWC = Inches of Water Column: 50 Pa. = .2 IWC, 25 Pa. = .1 IWC, 1 Pa.
                            = 0.00401 IWC
                        </td>
                    </tr>
                </table>
            </div>
            <h4 align="center">
                BPI Minimum Acceptable Draft Test Reading at Outdoor Air Temperature Ranges</h4>
            <table width="80%" border="1" cellspacing="0" cellpadding="10" align="center">
                <tr>
                    <td align="center">
                        Degrees F
                    </td>
                    <td align="center">
                        <19
                    </td>
                    <td align="center">
                        20s
                    </td>
                    <td align="center">
                        30s
                    </td>
                    <td align="center">
                        40s
                    </td>
                    <td align="center">
                        50s
                    </td>
                    <td align="center">
                        60s
                    </td>
                    <td align="center">
                        70s
                    </td>
                    <td align="center">
                        80s
                    </td>
                    <td align="center">
                        >90
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Pascals (Pa)
                    </td>
                    <td align="center">
                        -2.5*
                    </td>
                    <td align="center">
                        -2.25*
                    </td>
                    <td align="center">
                        -2*
                    </td>
                    <td align="center">
                        -1.75*
                    </td>
                    <td align="center">
                        -1.5*
                    </td>
                    <td align="center">
                        -1.25*
                    </td>
                    <td align="center">
                        -1*
                    </td>
                    <td align="center">
                        -.75*
                    </td>
                    <td align="center">
                        -0.5*
                    </td>
                </tr>
            </table>
            <table width="80%" border="0" cellspacing="0" cellpadding="10" align="center">
                <tr>
                    <td>
                        * Actual equation is (T_out/40)-2.75
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        Outdoor Temperature:
                        <asp:TextBox ID="txt_OutdoorTemperature" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        <br />
                        <br />
                        CAZ Worse Case Depressurization: Natural:
                        <asp:TextBox ID="txt_CAZDepressurization_Natural" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;"></asp:TextBox>
                        WC:
                        <asp:TextBox ID="txt_CAZDepressurization_WC" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 65px;"></asp:TextBox>
                        Diff:
                        <asp:TextBox ID="txt_CAZDepressurization_Diff" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 45px;"></asp:TextBox>
                        <br />
                        <br />
                        Pass?
                        <asp:RadioButton ID="rdo_CAZPass_Yes" runat="server" GroupName="YesorNO" />Yes
                        <asp:RadioButton ID="rdo_CAZPass_No" runat="server" GroupName="YesorNO" />No
                        <br />
                        <br />
                        <asp:CheckBox ID="chk_Emergency_GasCompanyCalled" runat="server" />
                        Emergency situation. Gas company called to fix gas leak or other.<br />
                        <br />
                        <asp:CheckBox ID="chk_WorkCannot_MoreFailedTests" runat="server" />
                        Work cannot continue due to one or more failed tests over Action Level.
                    </td>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td colspan="2">
                                    Select Appliances on At Worst Case Test:
                                </td>
                            </tr>
                            <tr>
                                <td width="45%">
                                    <asp:CheckBox ID="chk_Appliances_WorstCase_Dryer" runat="server" />
                                    Dryer
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_Appliances_WorstCase_WholeHouseFan" runat="server" />
                                    Whole House Fan
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_Appliances_WorstCase_BathFan" runat="server" />
                                    Bath Fan
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_Appliances_WorstCase_HVACAirHandler" runat="server" />
                                    HVAC Air Handler
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_Appliances_WorstCase_KitchenFan" runat="server" />
                                    Kitchen Fan
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_Appliances_WorstCase_Other" runat="server" />
                                    <asp:TextBox ID="txt_Appliances_WorstCase_Other" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_Appliances_WorstCase_AtticFan" runat="server" />
                                    Attic Fan
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" valign="top">
                        Notes:
                        <asp:TextBox ID="txt_FinalNotes" runat="server" Style="width: 90%; height: 50px;"
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script type="text/javascript">

        $(function () {
            document.getElementById('Page20').classList.add("ui-selected");
        });

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


        function PrePost(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= rdo_PreTest.ClientID %>').checked = false;
                document.getElementById('<%= rdo_PostTest.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function AuditorCrew(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= rdo_Auditor.ClientID %>').checked = false;
                document.getElementById('<%= rdo_Crew.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function checkDate(sender, args) {
            if (sender._selectedDate < new Date()) {
                alert("You cannot select a day earlier than today !");
                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))
            }
        }
    </script>

</asp:Content>
