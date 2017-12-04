<%@ Page Language="C#" MasterPageFile="~/PPLAudit/PPLMasterPage.master" AutoEventWireup="true"
    CodeFile="PPL_Audit_9.aspx.cs" Inherits="PPLAudit_PPL_Audit_9" Title="PPL Audit-9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .txt_namePage9
        {
            border: none;
            font-weight: normal;
            color: rgb(0, 0, 0);
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- form section -->
    <div class="fontbold">
        <div id="DivPrint">
            <h2 align="left">
                Combustion Appliances Pre-Test</h2>
            <br />
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td colspan="2">
                        <h3>
                            Are there any combustion appliances in the home?
                            <asp:CheckBox ID="CombustionAppliancesHomeY" runat="server" Text=" Y" onclick="CombustionAppliancesHome(this.id)" />
                            <asp:CheckBox ID="CombustionAppliancesHomeN" runat="server" Text=" N" onclick="CombustionAppliancesHome(this.id)" /></h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        If yes, Combustible Equipment Safety Testing must have been done by the contractor
                        if any air sealing was done. Are there any <span>UNVENTED</span> combustion heating
                        applicances?
                        <asp:CheckBox ID="CombustibleEquipmentSafetyTestingY" runat="server" Text=" Y" onclick="CombustibleEquipmentSafetyTesting(this.id)" />
                        <asp:CheckBox ID="CombustibleEquipmentSafetyTestingN" runat="server" Text=" N" onclick="CombustibleEquipmentSafetyTesting(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <strong>If yes, no air sealing may be performed that tightens structure below 3000 CFM-50Pa,
                            & Wx release form signed.</strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Step 1:</span> Record the outside temperature and zero the analyzer.
                    </td>
                    <td>
                        <span>Step 7:</span> Turn on the water heater first.
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Step 2:</span> Record house ambient CO & CO in CAZ-nothing is on
                    </td>
                    <td>
                        <span>Step 8:</span> Check for spillage.
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Step 3:</span> Look for signs of roll out of back drafting-nothing is on.
                    </td>
                    <td>
                        <span>Step 9:</span> Measure undiluted Co.
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Step 4:</span> Perform a gas leak test.
                    </td>
                    <td>
                        <span>Step 10:</span> Record if the draft was established at one minute.
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Step 5:</span> Drill hole for the draft measurement.
                    </td>
                    <td>
                        <span>Step 11:</span> Repeat spillage, CO & draft test for boiler or furnace.
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span>Step 6:</span> Start the worst case depressurization test procedure - appliances
                        off; measure base pressure; pressure in the CAZ under worst case condition; <strong>
                            THEN</strong>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Outdoor Temperature
                        <asp:TextBox ID="txt_OutdoorTemperature" runat="server" Style="width: 10%; border-bottom: 1px #ccc solid;
                            border: none; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tbody>
                    <tr>
                        <td width="1%" align="center">
                            &nbsp;
                        </td>
                    </tr>
                </tbody>
            </table>
            <table width="100%" cellspacing="0" cellpadding="2" border="1px">
                <tbody>
                    <tr>
                        <td align="center" valign="bottom">
                            <b>Appliances</b>
                        </td>
                        <td colspan="2" align="center" style="font-size: 9">
                            <b>CO</b>
                            <br />
                            &nbsp;
                        </td>
                        <td colspan="2" align="center" style="font-size: 9">
                            <b>Backdraft
                                <br />
                                Y/N</b>
                        </td>
                        <td colspan="2" align="center" style="font-size: 9">
                            <b>Draft<br />
                                (1 min.) Established
                                <br />
                                Y/N</b>
                        </td>
                        <td colspan="2" align="center" style="font-size: 9">
                            <b>Draft Pressure<br />
                                <br />
                                Pa. </b>
                        </td>
                        <td colspan="2" align="center" style="font-size: 9">
                            <b>Draft Pass<br />
                                <br />
                                Y/N</b>
                        </td>
                        <td align="center" style="font-size: 9">
                            <b>Undil.<br />
                                CO<br />
                                Flue </b>
                        </td>
                        <td align="center" style="font-size: 9">
                            <b>Gas<br />
                                Leak Det.
                                <br />
                                Y/N/NA</b>
                        </td>
                        <td align="center" style="font-size: 9">
                            <b>Percent<br />
                                <br />
                                Eff.</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span></span>
                        </td>
                        <td align="center">
                            AMB
                        </td>
                        <td align="center">
                            CAZ
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
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            Water<br />
                            Heater
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_CO_AMB" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;" OnTextChanged="txt_WaterHeater_CO_AMB_TextChanged"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_CO_CAZ" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_BackDraft_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_BackDraft_NAT" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_DarftEstablished_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_DarftEstablished_NAT" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_DarftPressure_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_DarftPressure_NAT" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_DarftPass_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_DarftPass_NAT" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_UndilCOFlue" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_GasLeackDet" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_WaterHeater_PrecentEff" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            Furnace
                            <br />
                            Boiler
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_CO_AMB" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_CO_CAZ" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_BackDraft_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_BackDraft_NAT" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_DraftEstablished_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_DraftEstablished_NAT" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_DarftPressure_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_DarftPressure_NAT" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_DarftPass_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_DarftPass_NA" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_UndilCOFlue" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_GasLeackDet" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_FurnaceBoiler_PrecentEff" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            Other
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_CO_AMB" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_CO_CAZ" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_BackDraft_WC" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_BackDraft_NAT" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_DarftEstablished_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_DarftEstablished_NAT" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_DarftPressure_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_DarftPressure_NAT" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_DarftPass_WC" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_DarftPass_NA" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_UndilCOFlue" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_GasLeackDet" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher1_PrecentEff" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            Other
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_CO_AMB" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_CO_CAZ" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_BackDraft_WC" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_BackDraft_NAT" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_DarftEstablished_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_DarftEstablished_NAT" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_DarftPressure_WC" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_DarftPressure_NAT" runat="server" Style="border: none;
                                font-weight: normal; color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_DarftPass_WC" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_DarftPass_NA" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_UndilCOFlue" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_GasLeackDet" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txt_Outher2_PrecentEff" runat="server" Style="border: none; font-weight: normal;
                                color: rgb(0, 0, 0); width: 39px;"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table width="100%" cellspacing="0" cellpadding="5" border="1px">
                <tbody>
                    <tr>
                        <td align="center" width="50%">
                            Stove and Oven CO
                        </td>
                        <td align="center">
                            Check Appliances at Worst Case Test
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="font-size: 12px;">
                            Rear Left Burner&nbsp;
                            <asp:TextBox ID="txt_RearLeftBurner" runat="server" Style="border-bottom: solid 1px rgb(219, 219, 219);
                                font-weight: normal; color: rgb(0, 0, 0); width: 40px; height: 19px; border-left-style: none;
                                border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                border-top-color: inherit; border-top-width: medium;"></asp:TextBox><asp:RadioButton
                                    ID="rdo_RearLeftBurner1" runat="server" />&nbsp;&nbsp;<asp:RadioButton ID="rdo_RearLeftBurner2"
                                        runat="server" />Rear Right Burner
                            <asp:TextBox ID="txt_RearRightBurner" runat="server" Style="border-bottom: solid 1px rgb(219, 219, 219);
                                font-weight: normal; color: rgb(0, 0, 0); width: 40px; height: 19px; border-left-style: none;
                                border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                border-top-color: inherit; border-top-width: medium;"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;&nbsp; Dryer
                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestDryerY" runat="server" Text=" Y"
                                onclick="WorstCaseTestDryer(this.id)" />
                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestDryerN" runat="server" Text=" N"
                                onclick="WorstCaseTestDryer(this.id)" />&nbsp;&nbsp;Whole House Fan
                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestWholeHouseFanY" runat="server"
                                Text=" Y" onclick="WorstCaseTestWholeHouseFan(this.id)" />
                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestWholeHouseFanN" runat="server"
                                Text=" N" onclick="WorstCaseTestWholeHouseFan(this.id)" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="font-size: 12px;">
                            Front Left Burner
                            <asp:TextBox ID="txt_FrontLeftBurner" runat="server" Style="border-bottom: solid 1px rgb(219, 219, 219);
                                font-weight: normal; color: rgb(0, 0, 0); width: 40px; height: 19px; border-left-style: none;
                                border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                border-top-color: inherit; border-top-width: medium;"></asp:TextBox>
                            <asp:RadioButton ID="rdo_FrontLeftBurner1" runat="server" />
                            <asp:RadioButton ID="rdo_FrontLeftBurner2" runat="server" />Front Right Burner<asp:TextBox
                                ID="txt_FrontRightBurner" runat="server" Style="border-bottom: solid 1px rgb(219, 219, 219);
                                font-weight: normal; color: rgb(0, 0, 0); width: 40px; height: 19px; border-left-style: none;
                                border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                border-top-color: inherit; border-top-width: medium;"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;&nbsp; BathFan
                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestBathFanY" runat="server" Text=" Y"
                                onclick="WorstCaseTestBathFan(this.id)" />
                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestBathFanN" runat="server" Text=" N"
                                onclick="WorstCaseTestBathFan(this.id)" />&nbsp;&nbsp; Kitchen Fan
                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestKitchenFanY" runat="server" Text=" Y"
                                onclick="WorstCaseTestKitchenFan(this.id)" />
                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestKitchenFanN" runat="server" Text=" N"
                                onclick="WorstCaseTestKitchenFan(this.id)" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <center>
                                <b>Oven CO Data</b></center>
                            <br />
                            CO Ambient
                            <asp:TextBox ID="txt_OvenCODataCOAmbient" runat="server" Style="border-bottom: solid 1px rgb(219, 219, 219);
                                font-weight: normal; color: rgb(0, 0, 0); width: 60px; height: 19px; border-left-style: none;
                                border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                border-top-color: inherit; border-top-width: medium;"></asp:TextBox>
                            CO At oven vent
                            <asp:TextBox ID="txt_OvenCODataCOAtOvenVent" runat="server" Style="border-bottom: solid 1px rgb(219, 219, 219);
                                font-weight: normal; color: rgb(0, 0, 0); width: 60px; height: 19px; border-left-style: none;
                                border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                border-top-color: inherit; border-top-width: medium;"></asp:TextBox>
                        </td>
                        <td>
                            <h3>
                                HVAC Air Handler
                                <asp:CheckBox ID="chk_HVACAirHandlerY" runat="server" Text=" Y" onclick="HVACAirHandler(this.id)" />
                                <asp:CheckBox ID="chk_HVACAirHandlerN" runat="server" Text=" N" onclick="HVACAirHandler(this.id)" />
                            </h3>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table width="100%" cellspacing="0" cellpadding="5" border="1px">
                <tbody>
                    <tr align="left">
                        <td>
                            <h2 style="padding: 0;">
                                CAZ WC/D <span style="padding-left: 40px; font-size: 12px;">Nat:</span>
                                <asp:TextBox ID="txt_CAZNat" runat="server" Style="border-bottom: solid 1px rgb(219, 219, 219);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 80px; height: 19px; border-left-style: none;
                                    border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                    border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                    border-top-color: inherit; border-top-width: medium;"></asp:TextBox>
                                <span style="font-size: 12px;">W/C:</span>
                                <asp:TextBox ID="txt_CAZWC" runat="server" Style="border-bottom: solid 1px rgb(219, 219, 219);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 80px; height: 19px; border-left-style: none;
                                    border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                    border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                    border-top-color: inherit; border-top-width: medium;"></asp:TextBox>
                                <span style="font-size: 12px;">Diff:</span>
                                <asp:TextBox ID="txt_CAZDiff" runat="server" Style="border-bottom: solid 1px rgb(219, 219, 219);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 80px; height: 19px; border-left-style: none;
                                    border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                    border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                    border-top-color: inherit; border-top-width: medium;"></asp:TextBox>
                                <span style="font-size: 12px;">Pass:</span>
                                <asp:TextBox ID="txt_CAZPass" runat="server" Style="border-bottom: solid 1px rgb(219, 219, 219);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 80px; height: 19px; border-left-style: none;
                                    border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                    border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                    border-top-color: inherit; border-top-width: medium;"></asp:TextBox>
                            </h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            CO alarms installed in these locations:
                            <asp:TextBox ID="txt_COAlarmsInstalledLocations" runat="server" Style="border-bottom: solid 1px rgb(219, 219, 219);
                                font-weight: normal; color: rgb(0, 0, 0); width: 25%; height: 19px; border-left-style: none;
                                border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                border-top-color: inherit; border-top-width: medium;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3 style="padding: 0;">
                                Emergency Situation: Gas company called to fix gas leak or other.
                                <asp:CheckBox ID="chk_EmergencySituationGasCompanyCalledY" runat="server" Text=" Y"
                                    onclick="EmergencySituation(this.id)" />
                                <asp:CheckBox ID="chk_EmergencySituationGasCompanyCalledN" runat="server" Text=" N"
                                    onclick="EmergencySituation(this.id)" />
                            </h3>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3 style="padding: 0;">
                                Work cannot continue due to one or more failed test over Action Level
                                <asp:CheckBox ID="chk_WorkCannotContinueToActionLevelY" runat="server" Text=" Y"
                                    onclick="ContinueToActionLevel(this.id)" />
                                <asp:CheckBox ID="chk_WorkCannotContinueToActionLevelN" runat="server" Text=" N"
                                    onclick="ContinueToActionLevel(this.id)" />
                            </h3>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table width="100%" cellspacing="0" cellpadding="5" border="0">
                <tr>
                    <td colspan="2">
                        <strong>AMB=Ambient</strong>
                    </td>
                    <td colspan="2">
                        <strong>CAZ=Cumbustible Appliance </strong>
                        <br />
                        <strong>Zone</strong>
                    </td>
                    <td>
                        <strong>W/C=Worst</strong><br />
                        <strong>Case</strong>
                    </td>
                    <td colspan="2">
                        <strong>NAT=Natural Pa.=Pascals EFF=Efficiency Diff=Difference</strong>
                    </td>
                </tr>
            </table>
            <table width="100%" cellspacing="0" cellpadding="5" border="1" style="text-align: center;">
                <tr>
                    <td>
                        <strong>CO Test Results</strong>
                    </td>
                    <td>
                        <strong>And / Or</strong>
                    </td>
                    <td>
                        <strong>Spillage & Draft Test Results</strong>
                    </td>
                    <td>
                        <strong>Retrofit Action</strong>
                    </td>
                    <td style="width: 1px; padding: 0; background: black;" rowspan="8">
                    </td>
                    <td>
                        <strong>CAZ Depressurization Limits: Venting Conditions</strong>
                    </td>
                    <td>
                        <strong>Limit (Pa.)</strong>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        0-25 PPM
                    </td>
                    <td align="center">
                        And
                    </td>
                    <td align="center">
                        Passes
                    </td>
                    <td align="center">
                        Proceed with work
                    </td>
                    <td align="center">
                        Orphan natural draft water heater (including outside chimney)
                    </td>
                    <td align="center">
                        -2
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        26-100 PPM
                    </td>
                    <td align="center">
                        And
                    </td>
                    <td align="center">
                        Passes
                    </td>
                    <td align="center">
                        Recommend that CO problem be fixed
                    </td>
                    <td align="center">
                        Natural draft boiler or furnace commonly vented with water heater
                    </td>
                    <td align="center">
                        -3
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        26-100 PPM
                    </td>
                    <td align="center">
                        And
                    </td>
                    <td align="center">
                        Fails at worst case only
                    </td>
                    <td align="center">
                        Recommend a service call for the appliance and/or repairs to the home to correct
                        the problem
                    </td>
                    <td align="center">
                        Natural draft boiler or furnace with damper commonly vented with water heater
                    </td>
                    <td align="center">
                        -5
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        100-400 PPM
                    </td>
                    <td align="center">
                        Or
                    </td>
                    <td align="center">
                        Fails under natural conditions
                    </td>
                    <td align="center">
                        Stop work; work may not proceed until the system is serviced and the problem is
                        corrected
                    </td>
                    <td align="center">
                        Individual natural draft boiler or furnace
                    </td>
                    <td align="center">
                        -5
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        >400 PPM
                    </td>
                    <td align="center">
                        And
                    </td>
                    <td align="center">
                        Passes
                    </td>
                    <td align="center">
                        Stop work; work may not proceed until the system is serviced and the problem is
                        corrected
                    </td>
                    <td align="center">
                        Individual natural draft boiler or furnace commonly vented with water heater
                    </td>
                    <td align="center">
                        -5
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        >400 PPM
                    </td>
                    <td align="center">
                        And
                    </td>
                    <td align="center">
                        Fails under any condition
                    </td>
                    <td align="center">
                        Emergency: Shut off fuel to the appliances and have the homeowner call for service
                        immediately
                    </td>
                    <td align="center">
                        Power vented or induce draft boiler or furnace alone , or fan assisted DWH alone
                    </td>
                    <td align="center">
                        -15
                    </td>
                </tr>
                <tr>
                    <td align="center">
                    </td>
                    <td align="center">
                    </td>
                    <td align="center">
                    </td>
                    <td align="center">
                    </td>
                    <td align="center">
                        Chimney-top draft induce; exhaust type or equivalent; high static pressure flame
                        renention head oil burner; Direct vented appliances; Sealed combustion appliances
                    </td>
                    <td align="center">
                        -50
                    </td>
                </tr>
            </table>
            <br />
            <h2 align="center">
                Minimum Worst Case Draft, Acceptable Ranges</h2>
            <h2 align="center">
                Outdoor Temperature(F)</h2>
            <br />
            <table width="100%" cellspacing="2" cellpadding="5" border="1">
                <tr>
                    <td align="center">
                        <strong>Appliances</strong>
                    </td>
                    <td align="center">
                        <strong><10</strong>
                    </td>
                    <td align="center">
                        <strong>20</strong>
                    </td>
                    <td align="center">
                        <strong>30</strong>
                    </td>
                    <td align="center">
                        <strong>40</strong>
                    </td>
                    <td align="center">
                        <strong>50</strong>
                    </td>
                    <td align="center">
                        <strong>60</strong>
                    </td>
                    <td align="center">
                        <strong>70</strong>
                    </td>
                    <td align="center">
                        <strong>80</strong>
                    </td>
                    <td align="center">
                        <strong>>90</strong>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <strong>Gas-Fired furnace boiler or water heater w/ atmospheric chimney</strong>
                    </td>
                    <td align="center">
                        -2.5 Pa.
                        <br />
                        -0.01 IWC
                    </td>
                    <td align="center">
                        -2.00 Pa. -0.009 IWC
                    </td>
                    <td align="center">
                        -2.00 Pa. -0.008 IWC
                    </td>
                    <td align="center">
                        -1.75 Pa. -0.007 IWC
                    </td>
                    <td align="center">
                        -1.50 Pa. -0.006 IWC
                    </td>
                    <td align="center">
                        -1.25 Pa. -0.005 IWC
                    </td>
                    <td align="center">
                        -1.00 Pa. -0.004 IWC
                    </td>
                    <td align="center">
                        -0.75 Pa. -0.003 IWC
                    </td>
                    <td align="center">
                        -0.50 Pa. -0.002 IWC
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <strong>Oil-Fired furnace boiler or water heater w/ atmospheric chimney</strong>
                    </td>
                    <td align="center">
                        -15 Pa. -0.06 IWC
                    </td>
                    <td align="center">
                        -13 Pa.
                        <br />
                        -0.053 IWC
                    </td>
                    <td align="center">
                    </td>
                    <td align="center">
                        -11 Pa.
                        <br />
                        -0.045 IWC
                    </td>
                    <td align="center">
                    </td>
                    <td align="center">
                    </td>
                    <td align="center">
                        -9 Pa.
                        <br />
                        -0.039 IWC
                    </td>
                    <td align="center">
                    </td>
                    <td align="center">
                        -7 Pa.
                        <br />
                        -0.03
                        <br />
                        IWC
                    </td>
                </tr>
            </table>
        </div>
        <div class="top_links" runat="server" id="TopBtnDiv">
            <b><span id="spnFinal" runat="server" style="color: Red; font-size: medium;"></span>
            </b>
            <br />
            <asp:Button ID="btnUpdate" runat="server" Text="Save" OnClick="btnUpdate_Click" class="top_btn" />&nbsp;&nbsp;
            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click"
                class="top_btn" />&nbsp;&nbsp;
            <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
        </div>
    </div>

    <script type="text/javascript">

        $(function() {
            document.getElementById('Page9').classList.add("ui-selected");
        });
        
    </script>

    <script type="text/javascript">

        function CombustionAppliancesHome(ID) {
            var CheckBox = document.getElementById(ID);
            document.getElementById('<%= CombustionAppliancesHomeY.ClientID %>').checked = false;
            document.getElementById('<%= CombustionAppliancesHomeN.ClientID %>').checked = false;
            CheckBox.checked = true;
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

        function CombustibleEquipmentSafetyTesting(ID) {
            var CheckBox = document.getElementById(ID);
            document.getElementById('<%= CombustibleEquipmentSafetyTestingY.ClientID %>').checked = false;
            document.getElementById('<%= CombustibleEquipmentSafetyTestingN.ClientID %>').checked = false;
            CheckBox.checked = true;
        }

        function WorstCaseTestDryer(ID) {
            var CheckBox = document.getElementById(ID);
            document.getElementById('<%= chk_CheckAppliancesWorstCaseTestDryerY.ClientID %>').checked = false;
            document.getElementById('<%= chk_CheckAppliancesWorstCaseTestDryerN.ClientID %>').checked = false;
            CheckBox.checked = true;
        }

        function WorstCaseTestWholeHouseFan(ID) {
            var CheckBox = document.getElementById(ID);
            document.getElementById('<%= chk_CheckAppliancesWorstCaseTestWholeHouseFanY.ClientID %>').checked = false;
            document.getElementById('<%= chk_CheckAppliancesWorstCaseTestWholeHouseFanN.ClientID %>').checked = false;
            CheckBox.checked = true;
        }

        function WorstCaseTestBathFan(ID) {
            var CheckBox = document.getElementById(ID);
            document.getElementById('<%= chk_CheckAppliancesWorstCaseTestBathFanY.ClientID %>').checked = false;
            document.getElementById('<%= chk_CheckAppliancesWorstCaseTestBathFanN.ClientID %>').checked = false;
            CheckBox.checked = true;
        }

        function WorstCaseTestKitchenFan(ID) {
            var CheckBox = document.getElementById(ID);
            document.getElementById('<%= chk_CheckAppliancesWorstCaseTestKitchenFanY.ClientID %>').checked = false;
            document.getElementById('<%= chk_CheckAppliancesWorstCaseTestKitchenFanN.ClientID %>').checked = false;
            CheckBox.checked = true;
        }

        function HVACAirHandler(ID) {
            var CheckBox = document.getElementById(ID);
            document.getElementById('<%= chk_HVACAirHandlerY.ClientID %>').checked = false;
            document.getElementById('<%= chk_HVACAirHandlerN.ClientID %>').checked = false;
            CheckBox.checked = true;
        }

        function EmergencySituation(ID) {
            var CheckBox = document.getElementById(ID);
            document.getElementById('<%= chk_EmergencySituationGasCompanyCalledY.ClientID %>').checked = false;
            document.getElementById('<%= chk_EmergencySituationGasCompanyCalledN.ClientID %>').checked = false;
            CheckBox.checked = true;
        }

        function ContinueToActionLevel(ID) {
            var CheckBox = document.getElementById(ID);
            document.getElementById('<%= chk_WorkCannotContinueToActionLevelY.ClientID %>').checked = false;
            document.getElementById('<%= chk_WorkCannotContinueToActionLevelN.ClientID %>').checked = false;
            CheckBox.checked = true;
        }

    </script>

    <script type="text/javascript">
        document.getElementById("Page9").setAttribute("class", "ui-selected");   
    </script>

</asp:Content>
