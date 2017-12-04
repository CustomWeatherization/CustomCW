<%@ Page Language="C#" MasterPageFile="~/NewMETED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page8.aspx.cs" Inherits="METED_METED_Audit_Page7" Title="METED Audit Page7" %>

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
            margin-left: 3px;
        }
        input[type="checkbox"]
        {
            margin: 0 0 8px 2px;
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
        .Style_11
        {
            border: none;
            border-bottom: solid 1px rgb(219, 219, 219);
            width: 10%;
            font-weight: normal;
            color: rgb(153, 153, 153);
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
        <p align="left">
            <b>Washer and Dryer Assessment</b>
        </p>
        <div class="tab" style="border: 1px solid #000; float: left; width: 100%; margin-bottom: 20px;">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        Number of washer loads per week: &nbsp;
                        <asp:TextBox ID="txt_WasherLoadWeek" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    </td>
                    <td>
                        Water Heater Type: &nbsp;
                        <asp:RadioButton ID="rdo_WaterHeater_Electric" runat="server" GroupName="WaterHeater" />
                        Electric &nbsp;
                        <asp:RadioButton ID="rdo_WaterHeater_Gas" runat="server" GroupName="WaterHeater" />
                        Gas
                    </td>
                </tr>
            </table>
            <table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
                <tr style="margin-top: 5px; float: left;">
                    <td>
                        What temperature settings do you currently use?
                        <asp:CheckBox ID="chk_HotWash" runat="server" onclick="ChkBox_TempratureSetting(this.id)" />
                        Hot Wash/Cold Rinse
                        <asp:CheckBox ID="chk_WarmWash" runat="server" onclick="ChkBox_TempratureSetting(this.id)" />
                        Warm Wash/Cold Rinse
                        <asp:CheckBox ID="chk_ColdWash" runat="server" onclick="ChkBox_TempratureSetting(this.id)" />
                        Cold Wash/Cold Rinse
                        <asp:CheckBox ID="chk_OtherWash" runat="server" onclick="ChkBox_TempratureSetting(this.id)" />
                        Other
                        <asp:TextBox ID="txt_Temperature_Other" runat="server" Visible="false" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            font-size: 11px; text-align: left; -webkit-width: 20%; !important; -moz-width: 35%;
                            !important; width: 10%; !important; /* target ie8 & ie9 only */
width: 10%; !important; /* ie 6 */
width: 10%; !important; /* ie 8-9 */"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div style="width: 100%;">
                <p style="float: left; width: 15% !important;">
                    &nbsp; Washer comments (if water heater is electric) &nbsp; &nbsp;
                    <p style="float: right; width: 85% !important;">
                        &nbsp; &nbsp;
                        <asp:TextBox ID="txt_WasherComment" runat="server" TextMode="MultiLine" Width="93%"
                            Height="50px"></asp:TextBox>
                    </p>
                </p>
            </div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        Number of electric dryer loads per week: &nbsp;
                        <asp:TextBox ID="txt_ElectricDrayerLoadWeek" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 60px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        How long does it take to dry a load?
                        <asp:TextBox ID="txt_DryALoad" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        Dryer Type:
                        <asp:RadioButton ID="rdo_DryerType_Electic" runat="server" GroupName="DryerType" />
                        Electic
                        <asp:RadioButton ID="rdo_DryerType_Gas" runat="server" GroupName="DryerType" />
                        Gas - H&S Only
                    </td>
                </tr>
                <tr>
                    </br>
                    <td>
                        &nbsp; Is dryer vented properly? &nbsp;
                        <asp:RadioButton ID="rdo_DryerVented_Yes" runat="server" GroupName="DryerVented" />
                        &nbsp; Yes &nbsp;
                        <asp:RadioButton ID="rdo_DryerVented_No" runat="server" GroupName="DryerVented" />
                        &nbsp; No
                    </td>
                    &nbsp; &nbsp;&nbsp;
                </tr>
            </table>
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="float: left">
                        &nbsp;<strong>Dryer venting details:</strong> Venting location &nbsp;
                        <asp:TextBox ID="txt_DryerVenting_Location" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;&nbsp;Venting
                        done for H&S?&nbsp;&nbsp;<asp:RadioButton ID="rdo_VentinYes" GroupName="Venting"
                            runat="server" />Yes&nbsp;<asp:RadioButton ID="rdo_VentinNo" runat="server" GroupName="Venting" />No
                    </td>
                    <td style="float: left">
                        <%--Venting done for H&S? &nbsp;--%>
                    </td>
                    <td style="float: left">
                        <%--<input type="radio" name="H&S" />Yes--%>
                    </td>
                    &nbsp;<td style="float: left">
                        <%--&nbsp;<input type="radio" name="H&S" />No--%>
                    </td>
                </tr>
            </table>
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        &nbsp;
                        <asp:RadioButton ID="rdo_MakeNewHole" runat="server" GroupName="make" />
                        Make a new hole &nbsp;
                        <asp:RadioButton ID="rdo_DryerUseExistingHole" runat="server" GroupName="make" />
                        Vent the dryer out using an existing hole &nbsp; &nbsp; &nbsp; Approx # of feet
                        <asp:TextBox ID="txt_ExistingHole_Feet" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        # of elbows:
                        <asp:TextBox ID="txt_ExistingHole_Elbows" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        &nbsp;
                        <asp:CheckBox ID="chk_NewVentCap" runat="server" />
                        &nbsp; Add new vent cap/hood
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <br />
                        &nbsp;<strong>Semi-Rigid Aluminum Flex used. Why?</strong> &nbsp;
                        <asp:TextBox ID="txt_AluminumFlexUsed" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 500px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                <tr>
                    <td>
                        &nbsp; Would a clothesline be cost effective?&nbsp;
                        <asp:RadioButton ID="rdo_ClothesCostEffect_Yes" runat="server" GroupName="ClothesCostEffect" />
                        Yes &nbsp;
                        <asp:RadioButton ID="rdo_ClothesCostEffect_No" runat="server" GroupName="ClothesCostEffect" />
                        No &nbsp; Is one being installed? &nbsp;
                        <asp:RadioButton ID="rdo_BeingInstall_Yes" runat="server" GroupName="BeingInstall" />
                        Yes &nbsp;
                        <asp:RadioButton ID="rdo_BeingInstall_No" runat="server" GroupName="BeingInstall" />
                        No
                    </td>
                </tr>
            </table>
            <div style="width: 100%;">
                <p style="float: left; width: 15% !important;">
                    &nbsp; Other drying issues: &nbsp; &nbsp;
                </p>
                <p style="float: left; width: 85% !important;">
                    &nbsp; &nbsp;
                    <asp:TextBox ID="txt_OtherDryIssue" runat="server" TextMode="MultiLine" Width="93%"
                        Height="50px"></asp:TextBox>
                </p>
            </div>
        </div>
        <br />
        <p align="left">
            <b>Fossil Fuel Heating Systems
                <%--and General AC Maintenance--%></b>
        </p>
        <div class="tab" style="border: 1px solid #000; float: left; width: 100%;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                <tr>
                    <td style="width: 70%;">
                        New filter(s) installed in the heating system? &nbsp;
                        <asp:RadioButton ID="rdo_NewFilterInstal1_Yes" runat="server" GroupName="NewFilterInstal1"
                            Style="margin: -5px;" />
                        &nbsp; Yes &nbsp;
                        <asp:RadioButton ID="rdo_NewFilterInstal1_No" runat="server" GroupName="NewFilterInstal1"
                            Style="margin: -5px;" />
                        &nbsp; No &nbsp; Number installed:
                        <asp:TextBox ID="txt_NumberNewFilterInstal1" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 10%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                    <td rowspan="2" valign="top">
                        Filter Dimensions: &nbsp;
                        <asp:TextBox ID="txt_FilterDimensions1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;Filter(s) to be cleaned in the heating system? &nbsp;
                        <asp:RadioButton ID="rdo_NewFilterInstal2_Yes" runat="server" GroupName="NewFilterInstal2"
                            Style="margin: -5px;" />
                        &nbsp; Yes &nbsp;
                        <asp:RadioButton ID="rdo_NewFilterInstal2_No" runat="server" GroupName="NewFilterInstal2"
                            Style="margin: -5px;" />
                        &nbsp; No &nbsp; Number cleaned:
                        <asp:TextBox ID="txt_NumberNewFilterInstal2" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 10%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr id="tr_InstallCentralAC" runat="server">
                    <td>
                        &nbsp;New filter(s) installed in the central/window AC(s)? &nbsp;
                        <asp:RadioButton ID="rdo_NewFilterACInstal_Yes" runat="server" GroupName="NewFilterACInstal"
                            Style="margin: -5px;" />
                        &nbsp; Yes &nbsp;
                        <asp:RadioButton ID="rdo_NewFilterACInstal_No" runat="server" GroupName="NewFilterACInstal"
                            Style="margin: -5px;" />
                        &nbsp; No &nbsp; Number installed:
                        <asp:TextBox ID="txt_NumberNewFilterACInstal" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 10%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                    <td rowspan="2" valign="top">
                        Filter Dimensions: &nbsp;
                        <asp:TextBox ID="txt_FilterDimensions2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr id="tr_CentralWindowAC" runat="server">
                    <td>
                        &nbsp;Filter(s) to be cleaned in the central/window AC(s)? &nbsp;
                        <asp:RadioButton ID="rdo_NewFilterInstal3_Yes" runat="server" GroupName="NewFilterInstal3"
                            Style="margin: -5px;" />
                        &nbsp; Yes &nbsp;
                        <asp:RadioButton ID="rdo_NewFilterInstal3_No" runat="server" GroupName="NewFilterInstal3"
                            Style="margin: -5px;" />
                        &nbsp; No &nbsp; Number cleaned:
                        <asp:TextBox ID="txt_NumberNewFilterInstal3" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 10%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;Is filter slot covered? &nbsp;
                        <asp:RadioButton ID="rdo_slotCovered_yes" runat="server" GroupName="slotCovered"
                            Style="margin: -5px;" />
                        &nbsp; Yes &nbsp;
                        <asp:RadioButton ID="rdo_slotCovered_no" runat="server" GroupName="slotCovered" Style="margin: -5px;" />
                        &nbsp; No &nbsp;
                        <asp:RadioButton ID="rdo_slotCovered_na" runat="server" GroupName="slotCovered" Style="margin: -5px;" />
                        &nbsp; N/A &nbsp; if no, install cover.
                    </td>
                </tr>
            </table>
        </div>
        <p align="left">
            <b>Other</b>
        </p>
        <div class="tab" style="border: 1px solid #000; float: left; width: 100%;">
            <table width="100%" border="0" cellspacing="0" cellpadding="7" style="margin-top: 10px;">
                <tr>
                <td width="25%">
                Well Pump used?
                        <asp:RadioButton ID="rdo_WellPumpUsed_Yes" runat="server" GroupName="WellPumpUsed" />
                        Yes
                        <asp:RadioButton ID="rdo_WellPumpUsed_No" runat="server" GroupName="WellPumpUsed" />
                        No  
                </td>
                <td width="24%">
                 Water leaks?
                        <asp:RadioButton ID="rdo_WaterLeaks_Yes" runat="server" GroupName="WaterLeaks" />
                        Yes
                        <asp:RadioButton ID="rdo_WaterLeaks_No" runat="server" GroupName="WaterLeaks" />
                        No 
                        </td>
                <td width="25%">
                Dehumidifier used?
                        <asp:RadioButton ID="rdo_DehumidifierUsed_Yes" runat="server" GroupName="DehumidifierUsed" />
                        Yes
                        <asp:RadioButton ID="rdo_DehumidifierUsed_No" runat="server" GroupName="DehumidifierUsed" />
                        No 
                </td>
                <td width="25%">
                Pool pump used? &nbsp;
                        <asp:RadioButton ID="rdo_PoolPumpUsed_Yes" runat="server" GroupName="PoolPumpUsed" />
                        Yes
                        <asp:RadioButton ID="rdo_PoolPumpUsed_No" runat="server" GroupName="PoolPumpUsed" />
                        No  
                </td>
                

                </tr>
              
                <tr>
                <td colspan="4">
                  Septic system grinders? &nbsp;
                        <asp:RadioButton ID="rdo_SepticSystemGrinders_Yes" runat="server" GroupName="SepticSystemGrinders" />
                        &nbsp; Yes &nbsp;
                        <asp:RadioButton ID="rdo_SepticSystemGrinders_No" runat="server" GroupName="SepticSystemGrinders" />
                        &nbsp; No
                <span style="margin-left:20px; display:inline;">
                 Are you willing to replace waterbed(s)? &nbsp;
                        <asp:RadioButton ID="rdo_ReplaceWaterbed_Yes" runat="server" GroupName="ReplaceWaterbed" />
                        &nbsp; Yes &nbsp;
                        <asp:RadioButton ID="rdo_ReplaceWaterbed_No" runat="server" GroupName="ReplaceWaterbed" />
                        &nbsp; No &nbsp;
                        <asp:RadioButton ID="rdo_ReplaceWaterbed_NA" runat="server" GroupName="ReplaceWaterbed" />
                        &nbsp; N/A &nbsp;
                        </span>
                </td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                <td></td>
                    <td colspan="3">
                        &nbsp; Replacement Size: &nbsp;
                        <asp:RadioButton ID="rdo_Replacement_SuperSingle" runat="server" GroupName="Replacement" />
                        &nbsp; Super Single (46" x 82") &nbsp;
                        <asp:RadioButton ID="rdo_Replacement_Queen" runat="server" GroupName="Replacement" />
                        &nbsp; Queen (58" x 82") &nbsp;
                        <asp:RadioButton ID="rdo_Replacement_King" runat="server" GroupName="Replacement" />
                        King (70" x 82")
                    </td>
                </tr>
            </table>
            <div style="width: 100%;">
                <p style="float: left; width: 23% !important; padding-top:25px; padding-left:5px;">
                    Other issues or comments such as moisture, ventilation, electric space heater, or
                    unvented combustion issues: &nbsp; &nbsp;
                </p>
                <p style="float: left; width: 75% !important;">
                    <asp:TextBox ID="txt_MoistureVentilationElectricComment" runat="server" TextMode="MultiLine"
                        Width="93%" Height="100px"></asp:TextBox>
                </p>
            </div>
        </div>
        <div style="width: 100%;">
            <p style="float: left; width: 20% !important;">
                Comments:&nbsp; &nbsp;
            </p>
            <p style="float: left; width: 80% !important;">
                <asp:TextBox ID="txt_Comment" runat="server" TextMode="MultiLine" Width="95%" Height="100px"></asp:TextBox>
            </p>
        </div>
    </div>

    <script type="text/javascript">

        $(function() {
            document.getElementById('Page8').classList.add("ui-selected");
        });

        function ChkBox_TempratureSetting(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_HotWash.ClientID %>').checked = false;
                document.getElementById('<%=chk_WarmWash.ClientID %>').checked = false;
                document.getElementById('<%=chk_ColdWash.ClientID %>').checked = false;
                document.getElementById('<%=chk_OtherWash.ClientID %>').checked = false;
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
