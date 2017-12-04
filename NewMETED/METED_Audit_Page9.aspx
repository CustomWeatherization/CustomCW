<%@ Page Language="C#" MasterPageFile="~/NewMETED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page9.aspx.cs" Inherits="METED_METED_Audit_Page8" Title="METED_Audit_Page8" %>

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
            font-size: 13px;
        }
        input[type="radio"]
        {
            margin-left: 1px;
        }
        input[type="checkbox"]
        {
            margin: 0 0 10px 5px;
        }
        p
        {
            float: left;
            width: 100%;
        }
        td
        {
            margin: 2px 0px;
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
        <p class="text_styleA" style="width: 100%;">
            <b class="text_styleA">Electric Water Heating Assessment</b></p>
        <p class="text_styleA" style="width: 100%; display: none;">
            <b class="text_styleA">Electric Water Heating Assessment</b> Water Heater FuelType:
            <asp:RadioButton ID="rdo_WaterHeaterFuel_Electric" runat="server" GroupName="WaterHeaterFuel" />
            1. Electric
            <asp:RadioButton ID="rdo_WaterHeaterFuel_FuelOil" runat="server" GroupName="WaterHeaterFuel" />
            2. Fuel Oil
            <asp:RadioButton ID="rdo_WaterHeaterFuel_UtilityGas" runat="server" GroupName="WaterHeaterFuel" />
            3. Utility Gas
            <asp:RadioButton ID="rdo_WaterHeaterFuel_BottledGas" runat="server" GroupName="WaterHeaterFuel" />
            4. Bottled Gas/Propane
            <asp:RadioButton ID="rdo_WaterHeaterFuel_Other" runat="server" GroupName="WaterHeaterFuel" />
            99. Other
            <asp:TextBox ID="txt_WaterHeaterFuel_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                font-weight: normal; color: rgb(0, 0, 0); font-size: 14px; text-align: left;
                -webkit-width: 5%; !important; -moz-width: 25%; !important; width: 5%; !important;
                /* target ie8 & ie9 only */
width: 5%; !important; /* ie 6 */
width: 5%; !important; /* ie 8-9 */"></asp:TextBox>
        </p>
        <div class="tab" style="border: 1px solid #000; float: left; width: 99%; margin-bottom: 20px;">
            <div style="width: 100%; float: left;">
                <p style="float: left; width: 20% !important;">
                    Document water heating issues here, such as family runs out of hot water, tank rusted:
                </p>
                <p style="float: right; width: 80% !important;">
                    <asp:TextBox ID="txt_WaterHeatingIssues_Comment" runat="server" Height="100px" Width="97%"
                        TextMode="MultiLine"></asp:TextBox>
                </p>
            </div>
            <table width="55%" border="0" cellspacing="5" cellpadding="5" align="left">
                <tr>
                    <td colspan="2">
                        Is the water heater leaking?
                        <asp:RadioButton ID="rdo_WaterHeaterLeak_Yes" runat="server" GroupName="WaterHeaterLeak" />
                        Yes
                        <asp:RadioButton ID="rdo_WaterHeaterLeak_No" runat="server" GroupName="WaterHeaterLeak" />
                        No
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Is the water heater rusted/corroded?
                        <asp:RadioButton ID="rdo_WaterHeaterRusted_Yes" runat="server" GroupName="WaterHeaterRusted" />
                        Yes
                        <asp:RadioButton ID="rdo_WaterHeaterRusted_No" runat="server" GroupName="WaterHeaterRusted" />
                        No
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Are the element(s) bad?
                        <asp:RadioButton ID="rdo_ElementBad_Yes" runat="server" GroupName="ElementBad" />
                        Yes
                        <asp:RadioButton ID="rdo_ElementBad_No" runat="server" GroupName="ElementBad" />
                        No
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Is the unit rated R8 or less?
                        <asp:RadioButton ID="rdo_UnitRated_Yes" runat="server" GroupName="UnitRated" />
                        Yes
                        <asp:RadioButton ID="rdo_UnitRated_No" runat="server" GroupName="UnitRated" />
                        No
                    </td>
                </tr>
                <tr>
                    <td style="width: 61%;">
                        Will water heater be replaced?<asp:RadioButton ID="rdo_WaterHeaterReplace_Yes" runat="server"
                            GroupName="WaterHeaterReplace" />
                        Yes
                        <asp:RadioButton ID="rdo_WaterHeaterReplace_No" runat="server" GroupName="WaterHeaterReplace" />
                        No
                    </td>
                    <td>
                        Energy Factor:<asp:TextBox ID="txtEnergyFctr" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            font-size: 11px; text-align: left; -webkit-width: 43%; !important; -moz-width: 43%;
                            !important; width: 43%; !important; /* target ie8 & ie9 only */width: 43%; !important;
                            /* ie 6 */width: 43%; !important; /* ie 8-9 */"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;">
                        Existing Water Heater size:&nbsp;
                        <asp:TextBox ID="txt_ExistingWaterHeaterSize" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            font-size: 11px; text-align: left; -webkit-width: 80px; !important; -moz-width: 80px;
                            !important; width: 80px; !important; /* target ie8 & ie9 only */width: 80px;
                            !important; /* ie 6 */width: 80px; !important; /* ie 8-9 */"></asp:TextBox>
                    </td>
                    <td style="text-align: left;">
                        Replacement size:
                        <asp:TextBox ID="txt_WaterHeaterReplaceSize" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            font-size: 11px; text-align: left; -webkit-width: 30%; !important; -moz-width: 30%;
                            !important; width: 30%; !important; /* target ie8 & ie9 only */width: 30%; !important;
                            /* ie 6 */width: 30%; !important; /* ie 8-9 */"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table width="40%" border="1" cellspacing="0" cellpadding="0" align="right" style="margin-right: 11px;">
                <tr>
                    <td style="width: 60%;">
                        Are you going to:
                        <br />
                        <br />
                    </td>
                    <td style="width: 15%;">
                        Yes
                        <br />
                        <br />
                    </td>
                    <td style="width: 15%;">
                        No
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Replace or add expansion tank:
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_AddExpansionTank_Yes" runat="server" onclick="ChkBox_ExpansionTank(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_AddExpansionTank_No" runat="server" onclick="ChkBox_ExpansionTank(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Replace Element(s):
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_ReplaceElemnt_Yes" runat="server" onclick="ChkBox_ReplaceElemnt(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_ReplaceElemnt_No" runat="server" onclick="ChkBox_ReplaceElemnt(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Replace Thermostats:
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_ReplaceThermostats_Yes" runat="server" onclick="ChkBox_ReplaceThermostats(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_ReplaceThermostats_No" runat="server" onclick="ChkBox_ReplaceThermostats(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Flush Tank?
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_FlushTank_Yes" runat="server" onclick="ChkBox_FlushTank(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_FlushTank_No" runat="server" onclick="ChkBox_FlushTank(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Add/replace pressure relief valve
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_PressureReliefValve_Yes" runat="server" onclick="CheckBox_PressureReliefValve(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_PressureReliefValve_No" runat="server" onclick="CheckBox_PressureReliefValve(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Add/replace pressure relief pipe
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_PressureReliefPipe_Yes" runat="server" onclick="ChkBox_PressureReliefPipe(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_PressureReliefPipe_No" runat="server" onclick="ChkBox_PressureReliefPipe(this.id)" />
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="5" align="right" style="margin-top: 10px;">
                <tr>
                    <td>
                        Did you change the temperature?
                        <asp:RadioButton ID="rdo_ChangeTemperature_Yes" runat="server" GroupName="ChangeTemperature" />
                        Yes
                        <asp:RadioButton ID="rdo_ChangeTemperature_No" runat="server" GroupName="ChangeTemperature" />
                        No &nbsp; &nbsp; If yes, set both elements to the same temperature.
                    </td>
                </tr>
                <tr>
                    <td>
                        Test location:
                        <asp:TextBox ID="txt_TstLocation" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 200px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        Existing Temp:
                        <asp:TextBox ID="txt_ExistingTemp" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        Adjusted Temp:
                        <asp:TextBox ID="txt_AdjustTemp" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;(No
                        lower than 125 degrees F)
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    Are you wrapping water pipes?
                                    <asp:RadioButton ID="rdo_WrappingWaterPipe_Yes" runat="server" GroupName="WrappingWaterPipe" />
                                    Yes
                                    <asp:RadioButton ID="rdo_WrappingWaterPipe_No" runat="server" GroupName="WrappingWaterPipe" />
                                    No
                                </td>
                                <td>
                                    If so, # of linear ft for hot water:
                                    <asp:TextBox ID="txt_Linear_FT" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <asp:RadioButton ID="rdoHot1_2" runat="server" GroupName="HotWater" />1/2"<asp:RadioButton
                                        ID="rdoHot3_4" runat="server" GroupName="HotWater" />3/4" Location
                                    <asp:TextBox ID="txt_Location" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    If so, # of linear ft for cold water:
                                    <asp:TextBox ID="txt_Linear_ColdFt" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <asp:RadioButton ID="rdoCold1_2" runat="server" GroupName="ColdWater" />1/2"<asp:RadioButton
                                        ID="rdoCold3_4" runat="server" GroupName="ColdWater" />3/4" Location
                                    <asp:TextBox ID="txtLocationColdFT" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        Comments:
                        <asp:TextBox ID="txt_Comments" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 90px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Are there any other hot water leaks?
                        <asp:RadioButton ID="rdo_HotWaterLeaks_Yes" runat="server" GroupName="HotWaterLeaks" />
                        Yes
                        <asp:RadioButton ID="rdo_HotWaterLeaks_No" runat="server" GroupName="HotWaterLeaks" />
                        No If yes, where?
                        <asp:TextBox ID="txt_HotWaterLeaksYes_Comment" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Are you going to repair leaks?
                        <asp:RadioButton ID="rdo_RepairLeaks_Yes" runat="server" GroupName="RepairLeaks" />
                        Yes
                        <asp:RadioButton ID="rdo_RepairLeaks_No" runat="server" GroupName="RepairLeaks" />
                        No If yes, where?
                        <asp:TextBox ID="txt_RepairLeaks_Yes_Comment" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <!--newtable end-->
        <div class="clear">
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="5" align="left" style="margin-top: 7px;">
            <tr>
                <td align="left">
                    <strong>Faucet Aerators & Shower heads</strong>
                </td>
            </tr>
            <tr>
                <td align="left">
                    Are you installing faucet aerators?<asp:RadioButton ID="rdoInstalFaucetYes" runat="server"
                        GroupName="Faucet" />Yes<asp:RadioButton ID="rdoInstalFaucetNo" runat="server" GroupName="Faucet" />No
                </td>
                <td align="left">
                    If so, which?
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    Bath Aerator
                </td>
                <td width="20%">
                    # installed?<asp:TextBox ID="txtBathAerator" runat="server" Style="border: none;
                        border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
                <td width="30%">
                    Location:<asp:TextBox ID="txtBathLocation" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    Kitchen Aerator
                </td>
                <td>
                    # installed?<asp:TextBox ID="txtKitchenAerator" runat="server" Style="border: none;
                        border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
                <td width="30%">
                    Location:<asp:TextBox ID="txtKitchenLocation" runat="server" Style="border: none;
                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr align="left">
                <td width="40%">
                    Are you installing a shower head?
                    <asp:RadioButton ID="rdoInstalShowerYes" runat="server" GroupName="Shower" />Yes<asp:RadioButton
                        ID="rdoInstalShowerNo" runat="server" GroupName="Shower" />No
                </td>
                <td>
                    If so, which?
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    with swivel head
                </td>
                <td>
                    # installed?<asp:TextBox ID="txtSwivel" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
                <td width="30%">
                    Location:<asp:TextBox ID="txtSwivelLocation" runat="server" Style="border: none;
                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    with shutoff
                </td>
                <td>
                    # installed?<asp:TextBox ID="txtShutoff" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
                <td width="30%">
                    Location:<asp:TextBox ID="txtShutoffLocation" runat="server" Style="border: none;
                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    with out shutoff
                </td>
                <td>
                    # installed?<asp:TextBox ID="txtWOshutoff" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
                <td width="30%">
                    Location:<asp:TextBox ID="txtWOshutoffLocation" runat="server" Style="border: none;
                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    handheld
                </td>
                <td>
                    # installed?<asp:TextBox ID="txtHandheld" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
                <td width="30%">
                    Location:<asp:TextBox ID="txtHandheldLocation" runat="server" Style="border: none;
                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <br />
            <tr>
                <td colspan="4">
                    Would a GFX System work? Shower is used at least 15 minutes per day;basement drain
                    stack servicing the most used shower is exposed;at least 34" of vertical height
                    available on the drain stack;drain pipe is at least 3" in diameter:<asp:RadioButton
                        ID="rdoGFXsystemYes" runat="server" GroupName="GFXsystem" />Yes<asp:RadioButton ID="rdoGFXsystemNo"
                            runat="server" GroupName="GFXsystem" />No<br />
                    <br />
                    <div align="left">
                        <div align="left" style="font-size: 0.9em;">
                            If yes,how far is the drain pipe from the cold water supply?<asp:TextBox ID="txtColdWatrSupply"
                                runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                color: rgb(0, 0, 0); font-size: 11px; text-align: left; width: 6%; !important;
                                /* target ie8 & ie9 only */width: 10%; !important; /* ie 6 */width: 6%; !important;
                                /* ie 8-9 */"></asp:TextBox>
                            How far is the drain pipe from the water heater?&nbsp;<asp:TextBox ID="txtWaterHeater"
                                runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 60px;
                                font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>&nbsp;Installing GFX?<asp:RadioButton
                                    ID="rdoInstallGFXyes" runat="server" GroupName="InstallGFX" />Yes<asp:RadioButton
                                        ID="rdoInstallGFXno" runat="server" GroupName="InstallGFX" />No
                        </div>
                </td>
            </tr>
        </table>
        <div class="clear">
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="5" align="right" style="margin-top: 10px;">
            <tr>
                <td style="display: none;">
                    Is customer on the time-of-day (TOD) rate?
                    <asp:RadioButton ID="rdo_Customer_TOD_Yes" runat="server" GroupName="Customer_TOD" />
                    Yes
                    <asp:RadioButton ID="rdo_Customer_TOD_No" runat="server" GroupName="Customer_TOD" />
                    No
                </td>
            </tr>
            <tr>
                <td style="display: none;">
                    If yes, is customer saving on this rate?
                    <asp:RadioButton ID="rdo_CustomerSavingRate_Yes" runat="server" GroupName="CustomerSavingRate" />
                    Yes
                    <asp:RadioButton ID="rdo_CustomerSavingRate_No" runat="server" GroupName="CustomerSavingRate" />
                    No
                </td>
            </tr>
            <tr>
                <td style="display: none;">
                    Does customer's lifestyle suit the rate change?
                    <br />
                    (Use Human Services Web Site rate comparison tool.)
                    <asp:RadioButton ID="rdo_CustomerSuitRateChange_Yes" runat="server" GroupName="CustomerSuitRateChange" />
                    Yes
                    <asp:RadioButton ID="rdo_CustomerSuitRateChange_No" runat="server" GroupName="CustomerSuitRateChange" />
                    No
                </td>
            </tr>
            <tr style="display: none;">
                <td>
                    Is customer going to switch to the TOD rate?
                    <asp:RadioButton ID="rdo_CustomerSwitchTOD_Yes" runat="server" GroupName="CustomerSwitchTOD" />
                    Yes
                    <asp:RadioButton ID="rdo_CustomerSwitchTOD_No" runat="server" GroupName="CustomerSwitchTOD" />
                    No
                </td>
            </tr>
            <tr>
                <td>
                    Does the customer have a water heater timer?
                    <asp:RadioButton ID="rdo_Customer_WaterHeaterTimer_Yes" runat="server" GroupName="Customer_WaterHeaterTimer" />
                    Yes
                    <asp:RadioButton ID="rdo_Customer_WaterHeaterTimer_No" runat="server" GroupName="Customer_WaterHeaterTimer" />
                    No
                </td>
            </tr>
            <tr>
                <td>
                    <%--Timer installed?--%>
                    if yes, are you recommending removal
                    <asp:CheckBox ID="rdo_TimerInstalled_Yes" runat="server" onclick="ChkBox_TimerInstalled(this.id)" />
                    Yes
                    <asp:CheckBox ID="rdo_TimerInstalled_No" runat="server" onclick="ChkBox_TimerInstalled(this.id)" />
                    No
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                        <tr>
                            <td valign="top" style="width: 15%;">
                                Comments: &nbsp; &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txt_comment1" runat="server" Width="97%" Height="150px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
        $(function() {
            document.getElementById('Page9').classList.add("ui-selected");
        });

        function ChkBox_ExpansionTank(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_AddExpansionTank_Yes.ClientID %>').checked = false;
                document.getElementById('<%=chk_AddExpansionTank_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }

        }
        function ChkBox_ReplaceElemnt(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_ReplaceElemnt_Yes.ClientID %>').checked = false;
                document.getElementById('<%=chk_ReplaceElemnt_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }

        }
        function ChkBox_ReplaceThermostats(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_ReplaceThermostats_Yes.ClientID %>').checked = false;
                document.getElementById('<%=chk_ReplaceThermostats_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }

        }
        function ChkBox_FlushTank(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_FlushTank_Yes.ClientID %>').checked = false;
                document.getElementById('<%=chk_FlushTank_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }

        }
        function CheckBox_PressureReliefValve(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_PressureReliefValve_Yes.ClientID %>').checked = false;
                document.getElementById('<%=chk_PressureReliefValve_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }

        }
        
        
        
        function ChkBox_TimerInstalled(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=rdo_TimerInstalled_Yes.ClientID %>').checked = false;
                document.getElementById('<%=rdo_TimerInstalled_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }

        }
        
        
        
        
        function ChkBox_PressureReliefPipe(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_PressureReliefPipe_Yes.ClientID %>').checked = false;
                document.getElementById('<%=chk_PressureReliefPipe_No.ClientID %>').checked = false;
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
