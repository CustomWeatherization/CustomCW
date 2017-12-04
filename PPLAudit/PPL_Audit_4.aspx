<%@ Page Language="C#" MasterPageFile="~/PPLAudit/PPLMasterPage.master" AutoEventWireup="true"
    CodeFile="PPL_Audit_4.aspx.cs" Inherits="PPLAudit_PPL_Audit_4" Title="PPL Audit-4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        h2
        {
            font-size: 20px;
            padding-left: 20px;
        }
        table
        {
            border: 0;
        }
        p span
        {
            font-size: 18px;
            color: #000000;
            text-decoration: underline;
        }
        table tr td span
        {
            font-size: 14px;
            font-weight: bold;
            color: #000000;
            text-decoration: underline;
        }
        .txt_name
        {
            border: none;
            border-bottom: solid 1px rgb(219, 219, 219);
            font-weight: normal;
            color: rgb(153, 153, 153);
            width: 100%;
        }
        .txt_name
        {
            border-bottom: none;
        }
        .my-table tr th
        {
            border: 1px solid #ADADAD;
            color: #000;
        }
        .my-table th
        {
            background: url(../images/calender_tab.png) repeat-x scroll left bottom #EFECE7;
            text-align: left;
            border: 1px solid #ADADAD;
        }
        .my-table tr td
        {
            border: 1px solid #ADADAD;
        }
        .style1
        {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="fontbold">
        <div id="DivPrint">
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        <h2>
                            <u>EXISTING REFRIGERATOR TESTING DATA</u></h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        Refrigerator Tested :
                        <asp:CheckBox ID="chk_RefrigeratorTest_Yes" runat="server" onclick="RefrigeratorTest(this.id)"
                            Visible="false" />
                        <%--Yes--%>
                        <asp:CheckBox ID="chk_RefrigeratorTest_No" runat="server" onclick="RefrigeratorTest(this.id)"
                            Visible="false" />
                        <%--No  If No, reason:--%>
                        <asp:DropDownList ID="DDL_REFRIGERATOR_reason" runat="server">
                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Yes-Monitored" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Yes-Database" Value="2"></asp:ListItem>
                            <asp:ListItem Text="No-Refrigerator less than 5 years old" Value="3"></asp:ListItem>
                            <asp:ListItem Text="No-Landlord refused" Value="4"></asp:ListItem>
                            <asp:ListItem Text="No-Customer refused" Value="5"></asp:ListItem>
                            <asp:ListItem Text="No-Refrigerator assessed through other weatherization program"
                                Value="6"></asp:ListItem>
                            <asp:ListItem Text="No-WRAP work deferred" Value="7"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txt_RefrigeratorTest_Reason" runat="server" Visible="false" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="55%"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <p>
                <b>KWH Guidelines for Replacement: </b>In order to meet the daily minumum guidelines
                for replacement, the KWH's must reach the KW/Hour Minimum listed below byt he end
                of one hour of monitoring. If at any time during the first hour of monitoring the
                Brultech reaches the KW/Hour Minimum, the tester will know that the refrigerator
                is likely to qualify for replacement.
            </p>
            <table width="100%" border="0" cellspacing="0" cellpadding="5" style="border-collapse: collapse;
                margin-bottom: 20px; border: 1px solid #ADADAD;">
                <tr>
                    <th style="border: 1px solid #ADADAD; color: #000; text-align: center;">
                        Size
                    </th>
                    <th style="border: 1px solid #ADADAD; color: #000; text-align: center;">
                        Daily Minimum
                    </th>
                    <th style="border: 1px solid #ADADAD; color: #000; text-align: left; width: 10px;">
                        &nbsp;
                    </th>
                    <th style="border: 1px solid #ADADAD; color: #000; text-align: center;">
                        KW/Hour Minimum
                    </th>
                    <th style="border: 1px solid #ADADAD; color: #000; text-align: center;">
                        Replacement Guideline
                    </th>
                </tr>
                <tr>
                    <td>
                        15 cu. ft. or less
                    </td>
                    <td>
                        2.78 K W H / day
                    </td>
                    <td>
                        =
                    </td>
                    <td>
                        .116 K W H
                    </td>
                    <td>
                        14 cu. ft.
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        16 - 19 cu. ft.
                    </td>
                    <td class="style1">
                        3.48 K W H / day
                    </td>
                    <td class="style1">
                        =
                    </td>
                    <td class="style1">
                        .145 K W H
                    </td>
                    <td class="style1">
                        18 cu. ft.
                    </td>
                </tr>
                <tr>
                    <td>
                        20 - 24 cu. ft.
                    </td>
                    <td>
                        3.65 K W H / day
                    </td>
                    <td>
                        =
                    </td>
                    <td>
                        152 K W H
                    </td>
                    <td>
                        20 cu. ft.
                    </td>
                </tr>
                <tr>
                    <td>
                        25 cu. ft. side-by-side or larger
                    </td>
                    <td>
                        3.65 K W H / day
                    </td>
                    <td>
                        =
                    </td>
                    <td>
                        221 K W H
                    </td>
                    <td>
                        20-25 cu. ft.
                    </td>
                </tr>
                <%-- <tr>
                    <td>
                        or larger
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>--%>
            </table>
            <p style="font-size: 18px; text-align: left;">
                <u><b>To get KW / Hour test result:</b></u>
            </p>
            <p>
                Divide total KWH's recorded by the monitor, by the number of minutes that the monitor
                has been on. Your answer will be the number of KWH's consumed per minute. Multiply
                this by 60 minutes to get the KWH's used for one hour.
            </p>
            <!-- inv_table end -->
            <p align="left">
                This is shown by the formula below:
            </p>
            <table width="100%" cellspacing="0" cellpadding="5">
                <tr>
                    <td align="left" valign="middle" style="border-bottom: 1px solid #666">
                        Total KWH's recorded by monitor
                    </td>
                    <td rowspan="2" align="left" valign="middle">
                        = KWH's per minute x 60 minutes = KWH's per one
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="middle">
                        Number of minutes monitored
                    </td>
                </tr>
            </table>
            <p style="font-size: 18px;">
                <u><b>Or, use the factors below To get KW / Hour test result:</b></u>
            </p>
            <table width="100%" border="0" cellspacing="0" cellpadding="5" style="border-collapse: collapse;
                margin-bottom: 20px; border: 1px solid #ADADAD;">
                <tr>
                    <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">
                        If monitoring time is:
                    </th>
                    <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">
                        Multiply KWH's from monitor by:
                    </th>
                    <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">
                        If monitoring time is:
                    </th>
                    <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">
                        Multiply KWH's from monitor by:
                    </th>
                    <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">
                        If monitoring time is:
                    </th>
                    <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">
                        Multiply KWH's from monitor by:
                    </th>
                </tr>
                <tr>
                    <td style="border: 1px solid #ADADAD;">
                        65 minutes
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        .9231
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        95 minutes
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        .6316
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        125 minutes
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        .48
                    </td>
                </tr>
                <tr>
                    <td style="border: 1px solid #ADADAD;">
                        75 minutes
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        .80
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        105 minutes
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        .5714
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        135 minutes
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        .4444
                    </td>
                </tr>
                <tr>
                    <td style="border: 1px solid #ADADAD;">
                        90 minutes
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        .6667
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        120 minutes
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        .50
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        150 minutes
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        .40
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        Primary Refrigerator: &nbsp; Height:
                        <asp:TextBox ID="txt_PrimaryRefrigerator_Height" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="70px"></asp:TextBox>
                        &nbsp; Width:
                        <asp:TextBox ID="txt_PrimaryRefrigerator_Width" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="70px"></asp:TextBox>
                        &nbsp; Depth:
                        <asp:TextBox ID="txt_PrimaryRefrigerator_Depth" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="70px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <p>
                &nbsp;
            </p>
            <table width="100%" cellpadding="2" cellspacing="0" style="border-collapse: collapse;
                margin-bottom: 20px; border-collapse: collapse; margin-bottom: 20px; border: 1px solid #ADADAD;">
                <tr>
                    <td style="border: 1px solid #ADADAD;">
                        Start Time: &nbsp;
                        <asp:TextBox ID="txt_StartTime" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="80px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        End Time: &nbsp;
                        <asp:TextBox ID="txt_EndTime" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="80px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        Total Time Monitored: &nbsp;
                        <asp:TextBox ID="txt_TotalMonitored" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="80px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="border: 1px solid #ADADAD;">
                        Refrigerator Temp: &nbsp;
                        <asp:TextBox ID="txt_RefrigeratorTemp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="40px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        Freezer Temp: &nbsp;
                        <asp:TextBox ID="txt_FreezerTemp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="40px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        Ambient Room Temp: &nbsp;
                        <asp:TextBox ID="txt_RoomTemp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="40px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table width="100%" cellpadding="5" cellspacing="0" style="border-collapse: collapse;
                margin-bottom: 20px; position: relative; border-collapse: collapse; margin-bottom: 20px;
                border: 1px solid #ADADAD; top: -21px">
                <tr>
                    <td colspan="2" style="border: 1px solid #ADADAD;">
                        Peak Wattage While Running: &nbsp;
                        <asp:TextBox ID="txt_PeakWattageRunning" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="100px"></asp:TextBox>
                    </td>
                    <td colspan="2" style="border: 1px solid #ADADAD;">
                        Total KWH Monitored: &nbsp;
                        <asp:TextBox ID="txt_TotalKWH" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="border: 1px solid #ADADAD;">
                        KWH/1 Hour: &nbsp;
                        <asp:TextBox ID="txt_KWH_1_Hour" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="50px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        KWH/24 Hours: &nbsp;
                        <asp:TextBox ID="txt_KWH_24_Hour" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="50px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        KWH/Month: &nbsp;
                        <asp:TextBox ID="txt_KWH_Month" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="50px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        $/Month: &nbsp;
                        <asp:TextBox ID="txt_Month" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="80px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4">
                        Is this refrigerator eligible for replacement?
                        <asp:CheckBox ID="chk_RefrigeratorReplace_Yes" runat="server" onclick="RefrigeratorReplace(this.id)" />
                        Yes &nbsp; &nbsp;
                        <asp:CheckBox ID="chk_RefrigeratorReplace_No" runat="server" onclick="RefrigeratorReplace(this.id)" />
                        No &nbsp; &nbsp;
                    </td>
                </tr>
            </table>
            <p>
            </p>
            <table width="100%" cellpadding="5" cellspacing="0">
                <tr>
                    <td align="left" colspan="4">
                        <b>Secondary refrigerator assessment</b> &nbsp; &nbsp;
                        <asp:DropDownList ID="DDL_RefrigeratorAssessment" runat="server">
                            <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Yes-Monitored"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Yes-Database"></asp:ListItem>
                            <asp:ListItem Value="3" Text="No-Refrigerator less than 5 years old"></asp:ListItem>
                            <asp:ListItem Value="4" Text="No-Landlord refused"></asp:ListItem>
                            <asp:ListItem Value="5" Text="No-Customer refused"></asp:ListItem>
                            <asp:ListItem Value="6" Text="No-Refrigerator assessed through other weatherization program"></asp:ListItem>
                            <asp:ListItem Value="7" Text="No-WRAP Work deferred"></asp:ListItem>
                            <asp:ListItem Value="8" Text="N/A"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDDL_RefrigeratorAssessment" runat="server" ErrorMessage="Field Secondary refrigerator Cannot be Empty" Text="*" ControlToValidate="DDL_RefrigeratorAssessment" ValidationGroup="RFV" InitialValue="0" ForeColor="Red" Font-Size="XX-Large" Font-Underline="False"></asp:RequiredFieldValidator>
                        <asp:ValidationSummary ID="ValidationSummaryRFV" ShowMessageBox ="true" ValidationGroup="RFV" runat="server"  />  
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4">
                        <asp:CheckBox ID="chk_SecondRefrigerator" runat="server" onclick="SecondRefrigerator_Or_Freezer(this.id)" />
                        Second Refrigerator
                        <asp:CheckBox ID="chk_SecondFreezer" runat="server" onclick="SecondRefrigerator_Or_Freezer(this.id)" />
                        &nbsp; Second Freezer &nbsp; Height:
                        <asp:TextBox ID="txt_SecondRefrigerator_Height" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="50px"></asp:TextBox>
                        &nbsp; Width:
                        <asp:TextBox ID="txt_SecondRefrigerator_Width" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="50px"></asp:TextBox>
                        &nbsp; Depth:
                        <asp:TextBox ID="txt_SecondRefrigerator_Depth" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="50px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <p>
            </p>
            <table width="100%" cellpadding="5" cellspacing="0" style="border-collapse: collapse;
                margin-bottom: 20px; border-collapse: collapse; margin-bottom: 20px; border: 1px solid #ADADAD;">
                <tr>
                    <td style="border: 1px solid #ADADAD;">
                        Start Time: &nbsp;
                        <asp:TextBox ID="txt_SecondRefrigerator_StartTime" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="80px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        End Time: &nbsp;
                        <asp:TextBox ID="txt_SecondRefrigerator_EndTime" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="80px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        Total Time Monitored: &nbsp;
                        <asp:TextBox ID="txt_SecondRefrigerator_TotalMoniter" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="80px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="border: 1px solid #ADADAD;">
                        Refrigerator Temp: &nbsp;
                        <asp:TextBox ID="txt_SecondRefrigerator_Temp" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="45px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        Freezer Temp: &nbsp;
                        <asp:TextBox ID="txt_SecondFreezer_Temp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="45px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        Ambient Room Temp: &nbsp;
                        <asp:TextBox ID="txt_SecondRoom_Temp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="45px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table width="100%" cellpadding="5" cellspacing="0" style="border-collapse: collapse;
                margin-bottom: 20px; position: relative; border-collapse: collapse; margin-bottom: 20px;
                border: 1px solid #ADADAD; top: -21px">
                <tr>
                    <td colspan="2">
                        Peak Wattage While Running: &nbsp;
                        <asp:TextBox ID="txt_Second_PeakWattageRunning" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;" Width="100px"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        Total KWH Monitored: &nbsp;
                        <asp:TextBox ID="txt_Second_KWH_Moniter" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="border: 1px solid #ADADAD;">
                        KWH/1 Hour: &nbsp;
                        <asp:TextBox ID="txt_Second_KWH_1_Hour" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="50px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        KWH/24 Hours: &nbsp;
                        <asp:TextBox ID="txt_Second_KWH_24_Hour" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="50px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        KWH/Month: &nbsp;
                        <asp:TextBox ID="txt_Second_KWH_Month" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="50px"></asp:TextBox>
                    </td>
                    <td style="border: 1px solid #ADADAD;">
                        $/Month: &nbsp;
                        <asp:TextBox ID="txt_Second_Month" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                            font-weight: normal;" Width="80px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4">
                        Is this refrigerator eligible for replacement?
                        <asp:CheckBox ID="chk_Second_RefrigeratorReplace_Yes" runat="server" onclick="Second_RefrigeratorReplace(this.id)" />
                        Yes &nbsp; &nbsp;
                        <asp:CheckBox ID="chk_Second_RefrigeratorReplace_No" runat="server" onclick="Second_RefrigeratorReplace(this.id)" />
                        No &nbsp; &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div class="top_links" runat="server" id="TopBtnDiv">
            <b><span id="spnFinal" runat="server" style="color: Red; font-size: medium;"></span>
            </b>
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Save" class="top_btn" OnClick="btnSave_Click"
                ValidationGroup="RFV" />
            &nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="top_btn" OnClick="btnCancel_Click" />&nbsp;&nbsp;
            <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
        </div>
    </div>

    <script type="text/javascript">

        $(function () {
            document.getElementById('Page4').classList.add("ui-selected");
        });

        function RefrigeratorTest(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_RefrigeratorTest_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_RefrigeratorTest_No.ClientID %>').checked = false;
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


        function RefrigeratorReplace(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_RefrigeratorReplace_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_RefrigeratorReplace_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function SecondRefrigerator_Or_Freezer(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_SecondRefrigerator.ClientID %>').checked = false;
                document.getElementById('<%= chk_SecondFreezer.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }



        function Second_RefrigeratorReplace(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_Second_RefrigeratorReplace_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_Second_RefrigeratorReplace_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
    </script>

    <script type="text/javascript">
        document.getElementById("Page4").setAttribute("class", "ui-selected");
    </script>

</asp:Content>
