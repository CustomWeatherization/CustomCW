<%@ Page Language="C#" MasterPageFile="~/METED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page11.aspx.cs" Inherits="METED_METED_Audit_Page11" Title="METED_Audit_Page11" %>

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
            margin: 0 0 10px 5px;
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
        <strong>Heat Pump:</strong> Replacement determined by kWh use and the HSPF (age
        and efficiency) of the existing unit. Replace HSPF 9 or less with HSPF 13 or higher.
        Replacement requires FirstEnergy approval. <strong>Please note:</strong> Customer
        must have at least 4,500 kWh of seasonal use in order to qualify for replacement.
        <table width="100%" border="0" cellspacing="0" cellpadding="5">
            <tr>
                <td>
                    Customers' heat pump is used for?&nbsp;<asp:RadioButton ID="rdoCusHeat" runat="server"
                        GroupName="CusHeatPump" />Heat &nbsp;<asp:RadioButton ID="rdoCusAc" runat="server"
                            GroupName="CusHeatPump" />A/C &nbsp;<asp:RadioButton ID="rdoCusNa" runat="server"
                                GroupName="CusHeatPump" />N/A &nbsp;<asp:RadioButton ID="rdoCusOther" runat="server"
                                    GroupName="CusHeatPump" />Other &nbsp;<asp:TextBox ID="txtCusOther" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 40%; font-weight: normal;
                                        color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    What are customer's Heat Pump thermostat use habits?
                    <asp:TextBox ID="txt_customerHeatPumpThermostatUse" runat="server" Style="border: none;
                        border-bottom: solid 1px rgb(0, 0, 0); width: 57%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Is the thermostat accurate?
                    <asp:RadioButton ID="rdo_ThermostatAccurate_Yes" runat="server" GroupName="ThermostatAccurate" />
                    Yes
                    <asp:RadioButton ID="rdo_ThermostatAccurate_No" runat="server" GroupName="ThermostatAccurate" />
                    No
                    <asp:RadioButton ID="rdo_ThermostatAccurate_IfNot" runat="server" GroupName="ThermostatAccurate" />
                    If not,why?
                    <asp:TextBox ID="txt_ThermostatAccurate_IfNot" runat="server" Style="border: none;
                        border-bottom: solid 1px rgb(0, 0, 0); width: 53%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Is filter slot covered?
                    <asp:RadioButton ID="rdo_FilterSlotCovered_Yes" runat="server" GroupName="FilterSlotCovered" />
                    Yes
                    <asp:RadioButton ID="rdo_FilterSlotCovered_No" runat="server" GroupName="FilterSlotCovered" />
                    No &nbsp; &nbsp; If no, install cover. &nbsp; &nbsp; Can you visually inspect the
                    A-coil?
                    <asp:RadioButton ID="rdo_InspectAcoil_Yes" runat="server" GroupName="InspectAcoil" />
                    Yes
                    <asp:RadioButton ID="rdo_InspectAcoil_No" runat="server" GroupName="InspectAcoil" />
                    No
                </td>
            </tr>
            <tr>
                <td>
                    If yes, is cleaning recommended?
                    <asp:RadioButton ID="rdo_CleaningRecommended_Yes" runat="server" GroupName="CleaningRecommended" />
                    Yes
                    <asp:RadioButton ID="rdo_CleaningRecommended_No" runat="server" GroupName="CleaningRecommended" />
                    No &nbsp; &nbsp; If yes, cleaning performed by:
                    <asp:RadioButton ID="rdo_CleaningPerformedBy_Auditor" runat="server" GroupName="CleaningPerformedBy" />
                    Auditor
                    <asp:RadioButton ID="rdo_CleaningPerformedBy_3rd_Party" runat="server" GroupName="CleaningPerformedBy" />
                    3rd Party Contractor
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                If visually unable to inspect A-coil, does
                                <br />
                                usage warrant 3rd party clean and tune?
                            </td>
                            <td>
                                <asp:RadioButton ID="rdo_Acoil_3rd_PartyClean_Yes" runat="server" GroupName="Acoil_3rd_PartyClean_Yes" />
                                Yes
                                <asp:RadioButton ID="rdo_Acoil_3rd_PartyClean_No" runat="server" GroupName="Acoil_3rd_PartyClean_Yes" />
                                No &nbsp; &nbsp; If yes, was 3rd party contacted?
                                <asp:RadioButton ID="rdo_3rdPartyContacted_Yes" runat="server" GroupName="3rdPartyContacted" />
                                Yes
                                <asp:RadioButton ID="rdo_3rdPartyContacted_No" runat="server" GroupName="3rdPartyContacted" />
                                No &nbsp; &nbsp; Clean/Tune?
                                <asp:RadioButton ID="rdo_CleanTune_Yes" runat="server" GroupName="CleanTune" />
                                Yes
                                <asp:RadioButton ID="rdo_CleanTune_No" runat="server" GroupName="CleanTune" />
                                No
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    If clean and tune recommended, why?
                    <asp:TextBox ID="txt_CleanTuneRecommended" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        width: 70%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                New filter(s) installed in the system?
                                <asp:RadioButton ID="rdo_NewfilterInstall_Yes" runat="server" GroupName="NewfilterInstall"
                                    Style="margin: -5px;" />
                                Yes
                                <asp:RadioButton ID="rdo_NewfilterInstall_No" runat="server" GroupName="NewfilterInstall"
                                    Style="margin: -5px;" />
                                No
                            </td>
                            <td style="width: 13%">
                                Number Installed:
                            </td>
                            <td style="width: 6%">
                                <asp:TextBox ID="txt_NumberInstall" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 90%;"></asp:TextBox>
                            </td>
                            <td style="width: 12%">
                                Filter(s) to be cleaned in the system?
                            </td>
                            <td style="width: 11%">
                                <asp:RadioButton ID="rdo_FilterCleaned_Yes" runat="server" GroupName="FilterCleaned"
                                    Style="margin: -5px;" />
                                Yes
                                <asp:RadioButton ID="rdo_FilterCleaned_No" runat="server" GroupName="FilterCleaned"
                                    Style="margin: -5px;" />
                                No
                            </td>
                            <td style="width: 14%">
                                Number Cleaned:
                            </td>
                            <td style="width: 5%">
                                <asp:TextBox ID="txt_NumberCleaned" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 90%;"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    Coils to be cleaned?
                    <asp:RadioButton ID="rdo_CoilsCleaned_Yes" runat="server" GroupName="CoilsCleaned" />
                    Yes
                    <asp:RadioButton ID="rdo_CoilsCleaned_No" runat="server" GroupName="CoilsCleaned" />
                    No &nbsp; &nbsp; Heat Pump to be replaced?
                    <asp:RadioButton ID="rdo_HeatPumpReplaced_Yes" runat="server" GroupName="HeatPumpReplaced" />
                    Yes
                    <asp:RadioButton ID="rdo_HeatPumpReplaced_No" runat="server" GroupName="HeatPumpReplaced" />
                    No &nbsp; &nbsp; Size of Unit:<asp:TextBox ID="txt_SizeUnit" runat="server" Style="border: none;
                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                        width: 90px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="90%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td style="width: 45%;">
                                <strong>Duct work Sealing and/or Duct Installation: Are there obvious duct leaks in
                                    any duct work that is outside the thermal boundary? </strong>
                            </td>
                            <td style="width: 20%;">
                                <asp:RadioButton ID="rdo_DuctWork_Yes" runat="server" GroupName="DuctWork" />
                                Yes
                                <asp:RadioButton ID="rdo_DuctWork_No" runat="server" GroupName="DuctWork" />
                                No
                            </td>
                            <td style="width: 20%;">
                                Location:
                                <asp:TextBox ID="txt_DuctWorkLocation" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td style="width: 30%;">
                                Insulation to be installed?
                                <asp:RadioButton ID="rdo_InsulationInstall_Yes" runat="server" GroupName="InsulationInstalled" />
                                Yes
                                <asp:RadioButton ID="rdo_InsulationInstall_No" runat="server" GroupName="InsulationInstalled" />
                                No
                            </td>
                            <td style="width: 30%;">
                                Sealing to be completed?
                                <asp:RadioButton ID="rdo_SealingComplete_Yes" runat="server" GroupName="SealingComplete" />
                                Yes
                                <asp:RadioButton ID="rdo_SealingComplete_No" runat="server" GroupName="SealingComplete" />
                                No
                            </td>
                            <td style="width: 18%;">
                                <strong>Heat pump energy education pamphlet provided to customer?</strong>
                            </td>
                            <td style="width: 14%;">
                                <asp:RadioButton ID="rdo_PumpPamphletProvide_Yes" runat="server" GroupName="PumpPamphletProvide" />
                                Yes
                                <asp:RadioButton ID="rdo_PumpPamphletProvide_No" runat="server" GroupName="PumpPamphletProvide" />
                                No
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                        <tr>
                            <td valign="top" style="width: 10%;">
                                comments: &nbsp; &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txt_Comment" TextMode="MultiLine" runat="server" Height="50px" Width="97%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td style="width: 28%;">
                                <strong>Electric Heat:</strong> Type of Heating System:
                            </td>
                            <td style="width: 19%;">
                                <asp:RadioButton ID="rdo_TypeHeating_ElectricBaseboard" runat="server" GroupName="TypeHeating"
                                    Style="margin: -5px;" />
                                1 Electric Baseboard
                            </td>
                            <td style="width: 20%;">
                                <asp:RadioButton ID="rdo_TypeHeating_ElectricHeatPump" Visible="false" runat="server"
                                    GroupName="TypeHeating" Style="margin: -5px;" />
                                <%--2. Electric Heat Pump--%>
                                <asp:RadioButton ID="rdo_TypeHeating_ElectricBoiler" runat="server" GroupName="TypeHeating"
                                    Style="margin: -5px;" />
                                2. Electric Boiler
                            </td>
                            <td style="width: 16%;">
                                <asp:RadioButton ID="rdo_TypeHeating_ElectricFurnace" runat="server" GroupName="TypeHeating"
                                    Style="margin: -5px;" />
                                3. Electric Furnace
                            </td>
                            <td style="width: 20%;">
                                <asp:RadioButton ID="rdo_TypeHeating_ElectricRadiant" runat="server" GroupName="TypeHeating"
                                    Style="margin: -5px;" />
                                4. Electric Radiant
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <%--<td>
                            </td>--%>
                            <td>
                                <asp:RadioButton ID="rdo_TypeHeating_ElectricWallBlowers" runat="server" GroupName="TypeHeating"
                                    Style="margin: -5px;" />
                                5. Electric Wall Blowers
                            </td>
                            <td colspan="3">
                                <asp:RadioButton ID="rdo_TypeHeating_Other" runat="server" GroupName="TypeHeating"
                                    Style="margin: -5px;" />
                                99. Other(Please describe)
                                <asp:TextBox ID="txt_TypeHeating_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 220px;"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div style="border: 1px solid #000; width: 100%;">
            What are customer's Electric Heat thermostat use habits?
            <asp:TextBox ID="txt_ElectricHeatThermostatUse" runat="server" Style="border: none;
                border-bottom: solid 1px rgb(0, 0, 0); width: 57%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
            <br />
            <br />
            Is the thermostat(s) accurate?
            <asp:RadioButton ID="rdo_ThermostatAccurate2_Yes" runat="server" GroupName="ThermostatAccurate2" />
            Yes
            <asp:RadioButton ID="rdo_ThermostatAccurate2_No" runat="server" GroupName="ThermostatAccurate2" />
            No
            <asp:RadioButton ID="rdo_ThermostatAccurate2_IfNot" runat="server" GroupName="ThermostatAccurate2" />If
            not, why?
            <asp:TextBox ID="txt_ThermostatAccurate" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                width: 45%; font-weight: normal; color: rgb(0, 0, 0);" Width="52%"></asp:TextBox>
            <br />
            <br />
            Do you recommend replacement of thermostats?
            <asp:RadioButton ID="rdo_ReplacementThermostat_Yes" runat="server" GroupName="ReplacementThermostats" />
            Yes
            <asp:RadioButton ID="rdo_ReplacementThermostat_No" runat="server" GroupName="ReplacementThermostats" />
            No &nbsp; &nbsp; Explain Details:
            <asp:TextBox ID="txt_ReplacementThermostats_Details" runat="server" Style="border: none;
                border-bottom: solid 1px rgb(0, 0, 0); width: 37%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
            <br />
            <br />
            Is filter slot covered?
            <asp:RadioButton ID="rdo_FilterSlotCovere_Yes" runat="server" GroupName="FilterSlotCovere" />
            Yes
            <asp:RadioButton ID="rdo_FilterSlotCovere_No" runat="server" GroupName="FilterSlotCovere" />
            No &nbsp; &nbsp; If no, install cover. &nbsp; &nbsp; Provide Locations of Thermostats:<asp:TextBox
                ID="txt_LocationsThermostat" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                width: 30%; font-weight: normal; color: rgb(0, 0, 0);" runat="server"></asp:TextBox>
            <br />
            <br />
            Clean/Tune?
            <asp:RadioButton ID="rdo_CleanTune2_Yes" runat="server" GroupName="CleanTune2" />
            Yes
            <asp:RadioButton ID="rdo_CleanTune2_No" runat="server" GroupName="CleanTune2" />
            No
            <br />
            <br />
            If clean and tune recommended, why?
            <asp:TextBox ID="txt_CleanTuneRecommended2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                width: 71%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
            <br />
            <br />
            New filter(s) installed in the system?
            <asp:RadioButton ID="rdo_FilterInstalled_Yes" runat="server" GroupName="FilterInstalled" />
            Yes
            <asp:RadioButton ID="rdo_FilterInstalled_No" runat="server" GroupName="FilterInstalled" />
            No &nbsp; &nbsp; Number Installed:
            <asp:TextBox ID="txt_NumberInstall2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
            <br />
            <br />
            Filter(s) to be cleaned in the system?
            <asp:RadioButton ID="rdo_FilterClean_Yes" runat="server" GroupName="FilterClean" />
            Yes
            <asp:RadioButton ID="rdo_FilterClean_No" runat="server" GroupName="FilterClean" />
            No &nbsp; &nbsp; Number Cleaned:
            <asp:TextBox ID="txt_NumberClean" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
            <br />
            <br />
            Electric heater to be replaced?
            <asp:RadioButton ID="rdo_ElectricHeaterReplaced_Yes" runat="server" GroupName="ElectricHeaterReplaced" />
            Yes
            <asp:RadioButton ID="rdo_ElectricHeaterReplaced_No" runat="server" GroupName="ElectricHeaterReplaced" />
            No &nbsp; &nbsp; Size of Unit:
            <asp:TextBox ID="txt_ElectricHeaterReplaced_SizeUnit" runat="server" Style="border: none;
                border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                width: 90px;"></asp:TextBox>
            <br />
            <br />
            Any electric heating system repairs?
            <asp:RadioButton ID="rdo_ElectricHeatRepair_Yes" runat="server" GroupName="ElectricHeatRepair" />
            Yes
            <asp:RadioButton ID="rdo_ElectricHeatRepair_No" runat="server" GroupName="ElectricHeatRepair" />
            No &nbsp; &nbsp; Explain Details:
            <asp:TextBox ID="txt_ElectricHeatRepair_Detail" runat="server" Style="border: none;
                border-bottom: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
            <br />
            <br />
            Does family use electric space heaters INSTEAD of or in addition to their primary
            heat source?
            <asp:RadioButton ID="rdo_PriHeatSource_Yes" runat="server" GroupName="PriHeatSource" />
            Yes
            <asp:RadioButton ID="rdo_PriHeatSource_No" runat="server" GroupName="PriHeatSource" />
            No &nbsp; &nbsp; Location:
            <asp:TextBox ID="txt_PriHeatSourceLocation" runat="server" Style="width: 10%; text-align: center;
                border: none; border-bottom: solid 1px rgb(0, 0, 0); padding-bottom: 5px; font-weight: bold;
                font-size: 12px; color: #666666;"></asp:TextBox>
            <br />
            <br />
            If PCAP customer answers yes, good opportunity to explain his/her program responsibilities
            <br />
            <br />
            <strong>Duct work Sealing and/or Duct Installation: Are there obvious duct leaks in
                any duct work that is outside the thermal boundary?</strong><br />
            <asp:RadioButton ID="rdo_DuctWork2_Yes" runat="server" GroupName="DuctWork2" />
            Yes
            <asp:RadioButton ID="rdo_DuctWork2_No" runat="server" GroupName="DuctWork2" />
            No Location:
            <asp:TextBox ID="txt_DuctWork2Location" runat="server" Style="width: 13%; text-align: center;
                border: none; border-bottom: solid 1px rgb(0, 0, 0); padding-bottom: 5px; font-weight: bold;
                font-size: 12px; color: #666666;"></asp:TextBox>
            Insulation to be installed?
            <asp:RadioButton ID="rdo_InsulationInstal2_Yes" runat="server" GroupName="InsulationInstal2" />
            Yes
            <asp:RadioButton ID="rdo_InsulationInstal2_No" runat="server" GroupName="InsulationInstal2" />
            No &nbsp; &nbsp; Sealing to be completed?
            <asp:RadioButton ID="rdo_SealingComplete2_Yes" runat="server" GroupName="SealingComplete2" />
            Yes
            <asp:RadioButton ID="rdo_SealingComplete2_No" runat="server" GroupName="SealingComplete2" />
            No
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 10px 0;">
                <tr>
                    <td valign="top" style="width: 10%;">
                        Comments: &nbsp; &nbsp;
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Comment2" runat="server" Height="50px" Width="97%" TextMode="MultiLine"></asp:TextBox>
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
