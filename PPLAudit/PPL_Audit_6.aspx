<%@ Page Language="C#" MasterPageFile="~/PPLAudit/PPLMasterPage.master" AutoEventWireup="true"
    CodeFile="PPL_Audit_6.aspx.cs" Inherits="PPLAudit_PPL_Audit_6" Title="PPL Audit 6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="fontbold">
        <div id="DivPrint">
            <table width="100%" cellspacing="0" cellpadding="10" border="0" style="font-size: 12px;">
                <h2 style="margin-bottom: 10px; text-align: left;">
                    IV. Domestic Water Heater Replacement</h2>
                <tr>
                    <td style="padding-left: 0;">
                        Water Supply: &nbsp;
                        <asp:CheckBox ID="chkCityWellWaterSupply_City" runat="server" onclick="CityWellWaterSupply(this.id)" />
                        &nbsp;City&nbsp;
                        <asp:CheckBox ID="chkCityWellWaterSupply_Well" runat="server" onclick="CityWellWaterSupply(this.id);" />
                        &nbsp;Well&nbsp; &nbsp;&nbsp;&nbsp; Expansion Tank: &nbsp;
                        <asp:CheckBox ID="chkExpansionTank_Yes" runat="server" onclick="ExpansionTank(this.id);" />&nbsp;Yes&nbsp;
                        <asp:CheckBox ID="chkExpansionTank_No" runat="server" onclick="ExpansionTank(this.id);" />&nbsp;No&nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        If city water, does the water heater have a check valve? &nbsp;&nbsp;
                        <asp:CheckBox ID="chkDoesHeaterHaveCheckValve_Yes" runat="server" onclick="DoesHeaterHaveCheckValve(this.id);" />
                        &nbsp;Yes&nbsp;
                        <asp:CheckBox ID="chkDoesHeaterHaveCheckValve_No" runat="server" onclick="DoesHeaterHaveCheckValve(this.id);" />
                        &nbsp;No&nbsp;
                        <asp:CheckBox ID="chkDoesHeaterHaveCheckValve_NotSure" runat="server" onclick="DoesHeaterHaveCheckValve(this.id);" />
                        &nbsp;Unknown
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0; font-size: 12px;">
                        Supply:
                        <asp:CheckBox ID="chkSupplyCopperPVC_Copper" runat="server" onclick="SupplyCopperPVC(this.id);" />
                        Copper
                        <asp:CheckBox ID="chkSupplyCopperPVC_PVC" runat="server" onclick="SupplyCopperPVC(this.id);" />
                        PVC &nbsp;&nbsp; 30-Amp breaker?&nbsp;&nbsp;
                        <asp:CheckBox ID="chkThirtyAmpBreaker_Yes" runat="server" onclick="ThirtyAmpBreaker(this.id);" />&nbsp;Yes&nbsp;&nbsp;
                        <asp:CheckBox ID="chkThirtyAmpBreaker_No" runat="server" onclick="ThirtyAmpBreaker(this.id);" />&nbsp;No&nbsp;&nbsp;
                        Brand:
                        <asp:TextBox ID="txtBrand" runat="server" MaxLength="128" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 20%;"></asp:TextBox>&nbsp;
                        10-2 wire?&nbsp;&nbsp;<asp:CheckBox ID="chkTenTwoWire_Yes" runat="server" onclick="TenTwoWire(this.id);" />&nbsp;Yes&nbsp;
                        <asp:CheckBox ID="chkTenTwoWire_No" runat="server" onclick="TenTwoWire(this.id);" />&nbsp;No
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0; font-size: 12px;">
                        Recommend Water Heater Replacement? &nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="chkRecommendWaterHeaterReplacement_Yes" runat="server" onclick="RecommendWaterHeaterReplacement(this.id);" />&nbsp;Yes&nbsp;
                        <asp:CheckBox ID="chkRecommendWaterHeaterReplacement_No" runat="server" onclick="RecommendWaterHeaterReplacement(this.id);" />&nbsp;No&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;Replacement Size:&nbsp;&nbsp;
                        <asp:TextBox ID="txtReplacementSize" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0);" Width="50px"></asp:TextBox>
                        &nbsp;&nbsp;Tempereture:&nbsp;&nbsp;
                        <asp:TextBox ID="txtTemperature" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0);" Width="50px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        Reason(s) for not recommending: &nbsp;&nbsp;<asp:CheckBox ID="ChkReasonForNotRecommending"
                            runat="server" onclick="NotRecommending(this.id);" />&nbsp;&nbsp;Not Assessable&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox
                                ID="ChkReasonForNotRecommending7Year" runat="server" onclick="NotRecommending(this.id);" />&nbsp;Less
                        then 7 years old
                        <asp:TextBox ID="txtReasonForNotRecommending" runat="server" Visible="false" Style="width: 50%!important;
                            border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 30%;"></asp:TextBox><%--value="No access to HWH at time of audit."--%>
                    </td>
                </tr>
            </table>
            <br />
            <h2 style="margin-bottom: 10px; text-align: left;">
                V. <u>Gravity Film Exchange (GFX) Information</u>
                <br />
                <h3 align="left">
                    <i>Do not complete if recommending HPWH</i></h3>
            </h2>
            <table width="100%" cellspacing="0" cellpadding="10" border="0">
                <tr>
                    <td style="padding-left: 0;">
                        Is the household shower use at least 15 minutes per day?
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowerUse_Yes" runat="server" onclick="ShowerUse(this.id);" />
                        &nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowerUse_No" runat="server" onclick="ShowerUse(this.id);" />
                        &nbsp;No
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        Is there a basement?
                    </td>
                    <td>
                        <asp:CheckBox ID="chkIsThereABasement_Yes" runat="server" onclick="IsThereABasement(this.id);" />
                        &nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkIsThereABasement_No" runat="server" onclick="IsThereABasement(this.id);" />
                        &nbsp;No
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        Is the drain stack servicing the most used shower(s) exposed?
                    </td>
                    <td>
                        <asp:CheckBox ID="chkDrainStackServicing_Yes" runat="server" onclick="DrainStackServicing(this.id);" />
                        &nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkDrainStackServicing_No" runat="server" onclick="DrainStackServicing(this.id);" />
                        &nbsp;No
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        Is there at least 34" of vertical height available on the drain stack?
                    </td>
                    <td>
                        <asp:CheckBox ID="chkVerticalHeight_Yes" runat="server" onclick="VerticalHeight(this.id);" />
                        &nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkVerticalHeight_No" runat="server" onclick="VerticalHeight(this.id);" />
                        &nbsp;No
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        Is the diameter of the drain pipe at least 3"?
                    </td>
                    <td>
                        <asp:CheckBox ID="chkDrainPipeDiameter_Yes" runat="server" onclick="DrainPipeDiameter(this.id);" />
                        &nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkDrainPipeDiameter_No" runat="server" onclick="DrainPipeDiameter(this.id);" />
                        &nbsp;No
                    </td>
                </tr>
            </table>
            <table width="100%" cellspacing="0" cellpadding="10" border="0">
                <tr>
                    <td style="padding-left: 0;">
                        <strong style="color: Black">Recommend GFX?</strong>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRecommendGFX_S_GFX" runat="server" onclick="RecommendGFX_S_GFX(this.id);" />&nbsp;&nbsp;
                        <strong style="color: Black">Yes, S GFX (drain pipe close to cold water supply or water
                            heater)</strong>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRecommendGFX_G_GFX_Yes" runat="server" onclick="RecommendGFX_S_GFX(this.id);" />&nbsp;&nbsp;
                        <strong style="color: Black">Yes, G GFX(drain pipe close to shower)&nbsp;&nbsp;
                            <asp:CheckBox ID="chkRecommendGFX_G_GFX_No" runat="server" onclick="RecommendGFX_S_GFX(this.id);" />&nbsp;&nbsp;No</strong>
                    </td>
                </tr>
            </table>
            <h2 style="margin-top: 10px; margin-bottom: 10px;" align="left">
                VI. <u>Other Recommended Water Heating Measures</u>
                <br />
                <br />
                <div style="text-align: left;">
                    <u style="font-size: 18px;">ACT 129 PHASE II</u>: <span style="font-size: 15px">No additional
                        water heating measures are allowed under ACT 129 PHASE II. Provide customer with
                        E Power postcard.</span>
                </div>
                <br />
                <br />
                <div align="left">
                    Complete this section for USP WRAP only
                </div>
                <br />
                <br />
                <u align="left">USP WRAP</u>:
            </h2>
            <table width="100%" cellspacing="0" cellpadding="7" border="0">
                <tr>
                    <td style="padding-left: 0;">
                        <%--Water Heater Repair--%>Plumbing repair
                    </td>
                    <td>
                        <asp:CheckBox ID="chkWaterHeaterRepair_Yes" runat="server" onclick="WaterHeaterRepair(this.id);" />&nbsp;&nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkWaterHeaterRepair_No" runat="server" onclick="WaterHeaterRepair(this.id);" />&nbsp;&nbsp;No
                    </td>
                    <td>
                        Explain:
                    </td>
                    <td style="width: 32%" colspan="3">
                        <asp:TextBox ID="txtWaterHeaterRepairComments" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 100%;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        <%--Repair Water Leaks--%>Test/replace element
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRepairWaterLeaks_Yes" runat="server" onclick="RepairWaterLeaks(this.id);" />&nbsp;&nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRepairWaterLeaks_No" runat="server" onclick="RepairWaterLeaks(this.id);" />&nbsp;&nbsp;No
                    </td>
                    <td>
                        <%--Location--%>Explain:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRepairWaterLeaksComments" runat="server" Style="width: 100%;
                            border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 258%;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        Faucet Repair / Replacement
                    </td>
                    <td>
                        <asp:CheckBox ID="ChkFaucetRepair_Yes" runat="server" onclick="FaucetRepair(this.id);" />&nbsp;&nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="ChkFaucetRepair_No" runat="server" onclick="FaucetRepair(this.id);" />&nbsp;&nbsp;No
                    </td>
                    <td>
                        Location:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFaucetRepairLocation" runat="server" Style="width: 100%; border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 258%;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        Low Flow Showerheads
                    </td>
                    <td>
                        <asp:CheckBox ID="chkLowFlowShowerHeads_Yes" runat="server" onclick="LowFlowShowerHeads(this.id);" />&nbsp;&nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkLowFlowShowerHeads_No" runat="server" onclick="LowFlowShowerHeads(this.id);" />&nbsp;&nbsp;No
                    </td>
                    <td>
                        Location:
                    </td>
                    <td>
                        <asp:TextBox ID="txtLowFlowShowerHeadsComments" runat="server" Style="width: 100%;
                            border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 258%;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        Aerator(s)
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAerators_Yes" runat="server" onclick="Aerators(this.id);" />&nbsp;&nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAerators_No" runat="server" onclick="Aerators(this.id);" />&nbsp;&nbsp;No
                    </td>
                    <td>
                        Location:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAeratorsComments" runat="server" Style="width: 100%; border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 258%;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        Water Pipe Insulation)
                    </td>
                    <td>
                        <asp:CheckBox ID="chkWaterPipeInsulation_Yes" runat="server" onclick="WaterPipeInsulation(this.id);" />&nbsp;&nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkWaterPipeInsulation_No" runat="server" onclick="WaterPipeInsulation(this.id);" />&nbsp;&nbsp;No
                    </td>
                    <td>
                        Size:
                    </td>
                    <td>
                        <asp:TextBox ID="txtWaterPipeInsulationSizeComments" runat="server" Style="width: 100%;
                            border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 100%;" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        Feet:
                    </td>
                    <td>
                        <asp:TextBox ID="txtWaterPipeInsulationFeetComments" runat="server" Style="width: 30%;
                            border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 100%;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        <%--Solar Water Maintenance (existing PPL installs)--%>Water heater jacket
                    </td>
                    <td>
                        <asp:CheckBox ID="chkSolarWater_Yes" runat="server" onclick="SolarWater(this.id);" />&nbsp;&nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkSolarWater_No" runat="server" onclick="SolarWater(this.id);" />&nbsp;&nbsp;No
                    </td>
                    <td>
                        <%--Describe:--%>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSolarWaterComments" runat="server" Visible="false" Style="width: 258%;"
                            CssClass="txt_name" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <h2 style="margin-top: 10px; margin-bottom: 10px;">
                VII. Additional Paperwork</h2>
            <table width="100%" cellspacing="0" cellpadding="10" border="0">
                <tr>
                    <td style="padding-left: 0;">
                        Full Cost Measures
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFull_Cost_Measures_Yes" runat="server" onclick="Full_Cost_Measures(this.id);" />&nbsp;&nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFull_Cost_Measures_No" runat="server" onclick="Full_Cost_Measures(this.id);" />&nbsp;&nbsp;No
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 0;">
                        Baseload Measures
                    </td>
                    <td>
                        <asp:CheckBox ID="chkBaseloadMeasures_Yes" runat="server" onclick="BaseloadMeasures(this.id);" />&nbsp;&nbsp;Yes
                    </td>
                    <td>
                        <asp:CheckBox ID="chkBaseloadMeasures_No" runat="server" onclick="BaseloadMeasures(this.id);" />&nbsp;&nbsp;No
                    </td>
                </tr>
            </table>
        </div>
        <div class="top_links" runat="server" id="TopBtnDiv">
            <b><span id="spnFinal" runat="server" style="color: Red; font-size: medium;"></span>
            </b>
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="top_btn" />
            &nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                class="top_btn" />&nbsp;&nbsp;
            <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
        </div>
    </div>

    <script type="text/javascript">

        $(function () {
            document.getElementById('Page6').classList.add("ui-selected");
        });

    </script>

    <script type="text/javascript">



        function SolarWater(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkSolarWater_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkSolarWater_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function Full_Cost_Measures(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkFull_Cost_Measures_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkFull_Cost_Measures_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function BaseloadMeasures(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkBaseloadMeasures_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkBaseloadMeasures_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }




        function CityWellWaterSupply(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkCityWellWaterSupply_City.ClientID %>').checked = false;
                document.getElementById('<%= chkCityWellWaterSupply_Well.ClientID %>').checked = false;
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

        function ExpansionTank(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkExpansionTank_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkExpansionTank_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function DoesHeaterHaveCheckValve(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkDoesHeaterHaveCheckValve_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkDoesHeaterHaveCheckValve_No.ClientID %>').checked = false;
                document.getElementById('<%= chkDoesHeaterHaveCheckValve_NotSure.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function SupplyCopperPVC(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkSupplyCopperPVC_Copper.ClientID %>').checked = false;
                document.getElementById('<%= chkSupplyCopperPVC_PVC.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function ThirtyAmpBreaker(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkThirtyAmpBreaker_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkThirtyAmpBreaker_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function TenTwoWire(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkTenTwoWire_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkTenTwoWire_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function RecommendWaterHeaterReplacement(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkRecommendWaterHeaterReplacement_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkRecommendWaterHeaterReplacement_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function ShowerUse(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkShowerUse_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkShowerUse_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function IsThereABasement(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkIsThereABasement_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkIsThereABasement_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function DrainStackServicing(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkDrainStackServicing_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkDrainStackServicing_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function VerticalHeight(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkVerticalHeight_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkVerticalHeight_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function DrainPipeDiameter(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkDrainPipeDiameter_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkDrainPipeDiameter_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function RecommendGFX_S_GFX(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkRecommendGFX_S_GFX.ClientID %>').checked = false;
                document.getElementById('<%= chkRecommendGFX_G_GFX_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkRecommendGFX_G_GFX_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function WaterHeaterRepair(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkWaterHeaterRepair_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkWaterHeaterRepair_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function RepairWaterLeaks(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkRepairWaterLeaks_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkRepairWaterLeaks_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function NotRecommending(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkReasonForNotRecommending7Year.ClientID %>').checked = false;
                document.getElementById('<%= ChkReasonForNotRecommending.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function LowFlowShowerHeads(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkLowFlowShowerHeads_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkLowFlowShowerHeads_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function Aerators(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkAerators_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkAerators_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function FaucetRepair(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkFaucetRepair_Yes.ClientID %>').checked = false;
                document.getElementById('<%= ChkFaucetRepair_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function WaterPipeInsulation(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkWaterPipeInsulation_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkWaterPipeInsulation_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
    </script>

    <script type="text/javascript">
        document.getElementById("Page6").setAttribute("class", "ui-selected");
    </script>

</asp:Content>
