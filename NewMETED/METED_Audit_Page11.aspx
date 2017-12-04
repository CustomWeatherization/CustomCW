<%@ Page Language="C#" MasterPageFile="~/NewMETED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page11.aspx.cs" Inherits="METED_METED_Audit_Page10" Title="METED_Audit_Page10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            font-size: 13px;
        }
        input[type="radio"]
        {
            margin-left: 5px;
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
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <strong>Cooling Assessment</strong>
                    <br />
                </td>
                <td>
                    <br />
                    <span class="span1">Summer Seasonal Use:</span>
                    <asp:TextBox ID="txt_SummerSeasonalUse" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                    <strong>kWh</strong>
                </td>
            </tr>
        </table>
        <div style="border: 1px solid #000; width: 100%;">
            <strong style="padding-left: 1px; padding-top: 1px;">Cooling Load Reduction Measures</strong>
            Summer Seasonal use of 2,000 kWh or more qualifies for roof coat/window film, ACs
            and/or shell measures <strong style="padding-left: 1px;">if related to cooling.</strong>
            <br />
            <br />
            <div class="text_only" style="font-size: 11.6px;">
                <strong>Window Film:</strong>Are there any windows on the west,south and east that
                are not shaded in the summer during the hours of 9AM and 4PM?
                <asp:RadioButton ID="rdo_WindowFilm_Yes" runat="server" GroupName="WindowFilm" />
                Yes
                <asp:RadioButton ID="rdo_WindowFilm_No" runat="server" GroupName="WindowFilm" />
                No</div>
            <br />
            <br />
            Approximate total sq. footage of window film needed:
            <asp:TextBox ID="txt_WindowFilmNeeded" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                font-weight: normal; color: rgb(0, 0, 0); width: 100px;"></asp:TextBox>
            # and location of west facing windows to receive film:
            <asp:TextBox ID="txt_West_ReceiveFilm" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                font-weight: normal; color: rgb(0, 0, 0); width: 80px;"></asp:TextBox>
            <br />
            <br />
            # and location of south facing windows to receive film:
            <asp:TextBox ID="txt_South_ReceiveFilm" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                font-weight: normal; color: rgb(0, 0, 0); width: 100px;"></asp:TextBox>
            # and location of east facing windows to receive film:
            <asp:TextBox ID="txt_East_ReceiveFilm" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                font-weight: normal; color: rgb(0, 0, 0); width: 80px;"></asp:TextBox>
            <br />
            <br />
            <div class="text_only" style="font-size: 11.6px;">
                <strong>Reflective Roof Coating:</strong> Is there any roof area that faces south
                and receives sun all day in the summer and is metal or roll roof material?
                <asp:RadioButton ID="rdo_RoofCoating_Roofmaterial_Yes" runat="server" GroupName="RoofCoating" />
                Yes
                <asp:RadioButton ID="rdo_RoofCoating_Roofmaterial_No" runat="server" GroupName="RoofCoating" />
                No</div>
            <br />
            <br />
            Install roof coat?
            <asp:RadioButton ID="rdo_InstallRoofCoat_Yes" runat="server" GroupName="InstallRoofCoat" />
            Yes
            <asp:RadioButton ID="rdo_InstallRoofCoat_No" runat="server" GroupName="InstallRoofCoat" />
            No &nbsp; &nbsp; Approx sq. footage of roof, times 2 for 2 coats:
            <asp:TextBox ID="txt_FootageOfRoof" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
            <br />
            <br />
            Are there other steps to reduce A/C use i.e., AC timers, Fans, Screens?
            <asp:RadioButton ID="rdo_ReduceACUse_Yes" runat="server" GroupName="ReduceACUse" />
            Yes
            <asp:RadioButton ID="rdo_ReduceACUse_No" runat="server" GroupName="ReduceACUse" />
            No &nbsp; &nbsp; Will install:
            <asp:TextBox ID="txt_Will_Install" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                font-weight: normal; color: rgb(0, 0, 0); width: 220px;"></asp:TextBox>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                <tr>
                    <td valign="top" style="width: 15%;">
                        Comments: &nbsp; &nbsp;
                    </td>
                    <td>
                        <asp:TextBox ID="txt_comment" runat="server" Width="97%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <!--newtable end-->
        <div style="border: 1px solid #000; width: 100%;">
            <strong>Room AC units:</strong> Is the EER on the existing room AC 6 or lower as
            labeled, calculated or metered? If so, it can be replaced with an Energy Star rated
            unit, but the Summer Seasonal Use (kWh) must be 2,000 or more to replace 1 unit
            and 2,500 to replace 2 units and 3,000 to replace 3 units.
        </div>
        <div style="border: 1px solid #000; width: 100%;">
            <table width="100%" border="1" cellspacing="0" cellpadding="5" align="center">
                <tr>
                    <th>
                        Unit Watts
                    </th>
                    <th>
                        EER =<u>BTU/hr</u> Watts
                    </th>
                    <th>
                        Replace AC?
                    </th>
                    <th>
                        Current Size BTU/hr
                    </th>
                    <th>
                        Current Location
                    </th>
                    <th>
                        New Size BTU/hr
                    </th>
                    <th>
                        Installed Location
                    </th>
                    <th>
                        Replace Filter?
                    </th>
                    <th>
                        Clean Filter?
                    </th>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line1_UnitWatts" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_EER" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line1_ReplaceAC" runat="server" />
                        Yes
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_CurrentSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_CurrentLocation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_NewSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_Install_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line1_ReplaceFilter" runat="server" />
                        Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line1_CleanFilter" runat="server" />
                        Yes
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line2_UnitWatts" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_EER" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line2_ReplaceAC" runat="server" />
                        Yes
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_CurrentSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_CurrentLocation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_NewSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_Install_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line2_ReplaceFilter" runat="server" />
                        Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line2_CleanFilter" runat="server" />
                        Yes
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line3_UnitWatts" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_EER" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line3_ReplaceAC" runat="server" />
                        Yes
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_CurrentSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_CurrentLocation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_NewSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_Install_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line3_ReplaceFilter" runat="server" />
                        Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line3_CleanFilter" runat="server" />
                        Yes
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line4_UnitWatts" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_EER" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line4_ReplaceAC" runat="server" />
                        Yes
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_CurrentSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_CurrentLocation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_NewSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_Install_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line4_ReplaceFilter" runat="server" />
                        Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line4_CleanFilter" runat="server" />
                        Yes
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line5_UnitWatts" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line5_EER" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line5_ReplaceAC" runat="server" />
                        Yes
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line5_CurrentSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line5_CurrentLocation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line5_NewSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line5_Install_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line5_ReplaceFilter" runat="server" />
                        Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_Line5_CleanFilter" runat="server" />
                        Yes
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td width="20%">
                        What are the customer's window AC thermostat use habits?
                    </td>
                    <td>
                        <asp:TextBox ID="txt_CustomerWindowACThermostat_Comment" runat="server" TextMode="MultiLine"
                            Width="100%" Height="50px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            Total number of AC units to be replaced?
            <asp:TextBox ID="txt_AC_ReplaceUnit" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                font-weight: normal; color: rgb(0, 0, 0); width: 42px;"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <!--New Task-->
            <span id="tr_NewestACUnit" runat="server">Manufactured year for newest room AC unit
                present(only if insulation is installed):
                <asp:TextBox ID="txt_NewestACUnit" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                    font-weight: normal; color: rgb(0, 0, 0); width: 46px;"></asp:TextBox>
            </span>
            <!--End Task-->
        </div>
        <div style="border: 1px solid #000; width: 100%; margin: 10px 0;">
            <strong>Central AC:</strong> Replacement determined by kWh use and the SEER (age
            and efficiency) of the existing unit. Replace SEER 8 or less with SEER 13 or higher.
            Replacement requires FirstEnergy approval. <strong>Please note:</strong> Customer
            must have at least 3,000 kWh of summer use in order to qualify for replacement.
            <br />
            <br />
            What are customer's AC thermostat use habits?
            <asp:TextBox ID="txt_CustomerACThermostatUse" runat="server" Style="border: none;
                border-bottom: solid 1px rgb(0, 0, 0); width: 65%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
            <br />
            <br />
            Is the thermostat accurate?
            <asp:RadioButton ID="rdo_ThermostatAccurate_Yes" runat="server" GroupName="ThermostatAccurate" />
            Yes
            <asp:RadioButton ID="rdo_ThermostatAccurate_No" runat="server" GroupName="ThermostatAccurate" />
            No
            <asp:RadioButton ID="rdo_ThermostatAccurate_IfNot" runat="server" GroupName="ThermostatAccurate" />
            If not, why?
            <asp:TextBox ID="txt_ThermostatAccurate_IfNot" runat="server" Style="border: none;
                border-bottom: solid 1px rgb(0, 0, 0); width: 54%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
            <br />
            <br />
            Do you recommend replacement of thermostat?
            <asp:RadioButton ID="rdo_ReplacementThermostat_Yes" runat="server" GroupName="ReplacementThermostat" />
            Yes
            <asp:RadioButton ID="rdo_ReplacementThermostat_No" runat="server" GroupName="ReplacementThermostat" />
            No
            <br />
            <br />
            Is filter slot covered?
            <asp:RadioButton ID="rdo_filterSlotCovered_Yes" runat="server" GroupName="filterSlotCovered" />
            Yes
            <asp:RadioButton ID="rdo_filterSlotCovered_No" runat="server" GroupName="filterSlotCovered" />
            No
            <asp:RadioButton ID="rdo_filterSlotCovered_NA" runat="server" GroupName="filterSlotCovered" />
            N/A &nbsp; &nbsp; If no, install cover. &nbsp; &nbsp; Location of A-coil?
            <asp:RadioButton ID="rdo_LocationAcoil_Inside" runat="server" GroupName="LocationAcoil" />
            Inside
            <asp:RadioButton ID="rdo_LocationAcoil_Outside" runat="server" GroupName="LocationAcoil" />
            Outside
            <br />
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="width: 25%;">
                        Can you visually inspect the A-coil?
                    </td>
                    <td style="width: 11%;">
                        <asp:RadioButton ID="rdo_InspectAcoil_Yes" runat="server" GroupName="InspectAcoil"
                            Style="margin: -5px;" />
                        Yes
                        <asp:RadioButton ID="rdo_InspectAcoil_No" runat="server" GroupName="InspectAcoil"
                            Style="margin: -5px;" />
                        No
                    </td>
                    <td style="width: 15%;">
                        If yes, is cleaning<br />
                        recommended?
                    </td>
                    <td style="width: 11%;">
                        <asp:RadioButton ID="rdo_CleaningRecommended_Yes" runat="server" GroupName="CleaningRecommended"
                            Style="margin: -5px;" />
                        Yes
                        <asp:RadioButton ID="rdo_CleaningRecommended_No" runat="server" GroupName="CleaningRecommended"
                            Style="margin: -5px;" />
                        No
                    </td>
                    <td style="width: 13%;">
                        If yes, cleaning<br />
                        performed by:
                    </td>
                    <td style="width: 25%;">
                        <asp:RadioButton ID="rdo_CleaningPerformedBy_Auditor" runat="server" GroupName="CleaningPerformedBy"
                            Style="margin: -5px;" />
                        Auditor
                        <asp:RadioButton ID="rdo_CleaningPerformedBy_3rd_Party" runat="server" GroupName="CleaningPerformedBy"
                            Style="margin: -5px;" />
                        3rd Party Contractor
                    </td>
                </tr>
                <tr>
                    <td colspan="6" height="20">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        If visually unable to inspect A-coil, does usage
                        <br />
                        warrant 3rd party clean and tune?
                    </td>
                    <td>
                        <asp:RadioButton ID="rdo_Acoil_3rd_PartyClean_Yes" runat="server" GroupName="Acoil_3rd_PartyClean" />
                        Yes
                        <asp:RadioButton ID="rdo_Acoil_3rd_PartyClean_No" runat="server" GroupName="Acoil_3rd_PartyClean" />
                        No
                    </td>
                    <td>
                        If yes, was 3rd party contractor contacted?
                    </td>
                    <td>
                        <asp:RadioButton ID="rdo_3rd_PartyContractor_Yes" runat="server" GroupName="3rd_PartyContractor" />
                        Yes
                        <asp:RadioButton ID="rdo_3rd_PartyContractor_No" runat="server" GroupName="3rd_PartyContractor" />
                        No
                    </td>
                    <td>
                        Clean/Tune?
                        <asp:RadioButton ID="rdo_CleanTune_Yes" runat="server" GroupName="CleanTune" />
                        Yes
                        <asp:RadioButton ID="rdo_CleanTune_No" runat="server" GroupName="CleanTune" />
                        No
                    </td>
                </tr>
                <tr>
                    <td colspan="6" height="20">
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        If clean and tune recommended, why?
                        <asp:TextBox ID="txt_CleanTuneRecommended" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 71%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" height="20">
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 40%;">
                                    New filter(s) installed in the system?<asp:RadioButton ID="rdo_NewFilterInstall_Yes"
                                        runat="server" GroupName="NewFilterInstall" />
                                    Yes
                                    <asp:RadioButton ID="rdo_NewFilterInstall_No" runat="server" GroupName="NewFilterInstall" />
                                    No
                                </td>
                                <td style="width: 15%;">
                                    Number Installed:
                                </td>
                                <td style="width: 6%;">
                                    <asp:TextBox ID="txt_NumberInstall" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 80%;"></asp:TextBox>
                                </td>
                                <td style="width: 15%;">
                                    Filter Dimensions:
                                </td>
                                <td style="width: 13%;">
                                    <asp:TextBox ID="txt_FilterDimension" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                </td>
                                <td style="width: 13%;">
                                </td>
                                <td style="width: 15%;">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" height="40" align="center">
                        Filter(s) to be cleaned in the system?&nbsp;
                        <asp:RadioButton ID="rdo_FilterClean_Yes" runat="server" GroupName="FilterClean" />
                        Yes
                        <asp:RadioButton ID="rdo_FilterClean_No" runat="server" GroupName="FilterClean" />
                        No&nbsp;&nbsp;&nbsp; Number Cleaned:
                        <asp:TextBox ID="txt_NumberClean" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 20%;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" height="40">
                        Coils to be cleaned?
                        <asp:RadioButton ID="rdo_CoilClean_Yes" runat="server" GroupName="CoilClean" />
                        Yes
                        <asp:RadioButton ID="rdo_CoilClean_No" runat="server" GroupName="CoilClean" />
                        No &nbsp; &nbsp; C/A unit to be replaced?
                        <asp:RadioButton ID="rdo_CA_UnitReplace_Yes" runat="server" GroupName="CA_UnitReplace" />
                        Yes
                        <asp:RadioButton ID="rdo_CA_UnitReplace_No" runat="server" GroupName="CA_UnitReplace" />
                        No &nbsp; &nbsp; Size of Unit:
                        <asp:TextBox ID="txt_SizeUnit" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <strong>Duct work Sealing and/or Duct Installation: Are there obvious duct leaks in
                            any duct work that is outside the thermal boundary?</strong>
                    </td>
                    <td colspan="2">
                        <asp:RadioButton ID="rdo_DuctWork_Yes" runat="server" GroupName="DuctWork" />
                        Yes
                        <asp:RadioButton ID="rdo_DuctWork_No" runat="server" GroupName="DuctWork" />
                        No &nbsp; &nbsp; Location:<asp:TextBox ID="txt_DuctWork_Location" runat="server"
                            Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                            color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" height="40">
                        <table>
                            <tr>
                                <td>
                                    Insulation to be installed?
                                    <asp:RadioButton ID="rdo_InsulationInstall_Yes" runat="server" GroupName="InsulationInstall" />
                                    Yes
                                    <asp:RadioButton ID="rdo_InsulationInstall_No" runat="server" GroupName="InsulationInstall" />
                                    No &nbsp; &nbsp; Sealing to be completed?
                                    <asp:RadioButton ID="rdo_SealingCompleted_Yes" runat="server" GroupName="SealingCompleted" />
                                    Yes
                                    <asp:RadioButton ID="rdo_SealingCompleted_No" runat="server" GroupName="SealingCompleted" />
                                    No &nbsp;&nbsp;&nbsp;
                                </td>
                                <td id="td_CentralACUnit" runat="server">
                                    Manufactured year for central AC unit present
                                    <br />
                                    (only if insulation is installed):
                                    <asp:TextBox ID="txt_CentralACUnit" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 50px;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 10px 0;">
                            <tr>
                                <td valign="top" style="width: 10%;">
                                    <p style="vertical-align: middle; float: left; padding-left: 4px;">
                                        Comments:</p>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_comment2" runat="server" Width="97%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script type="text/javascript">

        $(function() {
            document.getElementById('Page11').classList.add("ui-selected");
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
    </script>

</asp:Content>
