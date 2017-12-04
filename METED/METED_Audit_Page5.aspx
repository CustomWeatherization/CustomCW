<%@ Page Language="C#" MasterPageFile="~/METED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page5.aspx.cs" Inherits="METED_METED_Audit_Page5" Title="METED Audit Page5" %>

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
            margin: 0 0 10px 1px;
        }
        p
        {
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
            <!--newtable begin-->
            <h4 align="center">
                Refrigerators</h4>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <span id="spn_freezersUsed" runat="server">Number of freezers used:</span><asp:TextBox
                            ID="txt_FreezersUsed" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 55px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr align="right">
                    <td>
                        Number of refrigerators used:<asp:TextBox ID="txt_RefrigeratorsUsed" runat="server"
                            Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 55px; font-weight: normal;
                            color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <p>
                Test all units five years or older. If any unit was not tested, please use a web-based
                database to determine annual usage.</p>
            <br />
            <p>
                <b>Existing Refrigerator and Freezer Testing Data</b></p>
            <p>
                kWh Guidelines for Replacement: Test units for as long as possible but factor the
                test results back to a one hour reading. In order to meet the daily minimum guidelines
                for replacement the kWh must reach the kWh/Hour Minimum listed below by the end
                of one hour of monitoring. If at any time during the first hour of monitoring the
                Brultech reaches the kWh/Hour Minimum, the tester will indicate that the refrigerator
                is likely to qualify for replacement.</p>
            <p>
                <b>To get KW/Hour test results:</b>
                <p>
                    Divide total kWh recorded by the monitor, by the number of minutes that the monitor
                    has been on. Your answer will be the number of kWhs consumed per minute. Multiply
                    this by 60 minutes to get the kWh usage for one hour. This is shown by the formula
                    below. (Refer to chart on page 4-54 of the Policy and Procedures Manual)</p>
                <p>
                    <span style="padding-left: 178px;"><u>Total kWhs recorded by monitor</u> = kWhs per
                        minute x 60 minutes = kWh per one hour</span>
                    <br />
                    <span style="padding-left: 182px;">Number of minutes monitored</span>
                </p>
                <p align="center">
                    <table width="50%" border="1" cellspacing="0" cellpadding="5" style="margin: 0 auto;">
                        <tr>
                            <td align="center">
                                <b>Refrigerator Size</b>
                            </td>
                            <td align="center">
                                <b>kWh/Hour Minimum</b>
                            </td>
                            <td align="center">
                                <b>Replacement Guideline</b>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                15 cu ft or less
                            </td>
                            <td align="center">
                                .<%--104--%>08 kWh
                            </td>
                            <td align="center">
                                15 cu ft
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                16 - 19 cu ft
                            </td>
                            <td align="center">
                                .<%--130--%>10 kWh
                            </td>
                            <td align="center">
                                17 or 18 cu ft
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                20 - 21 cu ft
                            </td>
                            <td align="center">
                                .<%--140--%>11 kWh
                            </td>
                            <td align="center">
                                22 cu ft
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                22 cu ft or larger
                            </td>
                            <td align="center">
                                .<%--200--%>12 kWh
                            </td>
                            <td align="center">
                                20 - 25 cu ft
                            </td>
                        </tr>
                    </table>
                    <p align="center">
                        <b>
                            <br />
                            Ambient Air Temperature Immediately Surrounding the Refrigerator during Testing<br />
                        </b>
                    </p>
                    <table width="60%" border="1" cellspacing="0" cellpadding="5" style="margin: 0 auto;">
                        <tr>
                            <td align="center">
                                5 degrees (or more) hotter than average
                            </td>
                            <td align="center">
                                0.88 factor
                            </td>
                            <td rowspan="3">
                                *If not known by customer,<br />
                                use 70 degrees F
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                Average annual temperature for room*
                            </td>
                            <td align="center">
                                1.00 Factor
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                5 degrees (or more) cooler than average
                            </td>
                            <td align="center">
                                1.13 factor
                            </td>
                        </tr>
                    </table>
                    <div class="tab" style="border: 1px solid #000; padding: 10px; margin-top: 20px;">
                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <b>Primary refrigerator:</b>
                                </td>
                                <td>
                                    Location:<asp:TextBox ID="txt_PriRefrigerator_Location" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td align="left">
                                    Calculated Estimated Operating
                                    <br />
                                    Cost/Month. (Optional Info): $:
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_PriRefrigerator_OperatingCost" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 55px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Make:<asp:TextBox ID="txt_PriRefrigerator_Make" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td>--%>&nbsp;&nbsp; Model:<asp:TextBox ID="txt_PriRefrigerator_Model" runat="server"
                                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 90px; font-weight: normal;
                                    color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td>--%>&nbsp;&nbsp; Year:<asp:TextBox ID="txt_PriRefrigerator_Year" runat="server"
                                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 90px; font-weight: normal;
                                    color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td>--%>&nbsp;&nbsp; Size:<asp:TextBox ID="txt_PriRefrigerator_Size" runat="server"
                                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 40px; font-weight: normal;
                                    color: rgb(0, 0, 0);"></asp:TextBox>
                                    &nbsp;&nbsp;Type:
                                    <asp:CheckBox ID="Chk_PriRefrigerator_TopMount" runat="server" Text="Top Mount" onclick="PriRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_PriRefrigerator_BottomMount" runat="server" Text="Bottom Mount"
                                        onclick="PriRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_PriRefrigerator_SxS" runat="server" Text="SxS" onclick="PriRefrigeratorType(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Start Time:<asp:TextBox ID="txt_PriRefrigerator_StartTime" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td>--%>&nbsp;&nbsp; End Time:<asp:TextBox ID="txt_PriRefrigerator_EndTime" runat="server"
                                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                    color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td colspan="2">--%>&nbsp;&nbsp; Total Time Monitored:<asp:TextBox ID="txt_PriRefrigerator_TotalTime"
                                    runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px;
                                    font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    &nbsp;&nbsp; Ice Maker?
                                    <asp:CheckBox ID="Chk_PriRefrigerator_IceMaker_Yes" runat="server" Text="Yes" onclick="PriRefrigerator_IceMaker(this.id)" />
                                    <asp:CheckBox ID="Chk_PriRefrigerator_IceMaker_No" runat="server" Text="No" onclick="PriRefrigerator_IceMaker(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    kWh Monitor Reading:<asp:TextBox ID="txt_PriRefrigerator_Monitor" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td>
                                    kWh conversion at one hour:<asp:TextBox ID="txt_PriRefrigerator_Conversion" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    Is this unit eligible for
                                    <br />
                                    replacement?<asp:RadioButton ID="rdo_PriRefrigerator_Replacement_Yes" runat="server"
                                        GroupName="PriRefrigerator_Replacement" />YES<asp:RadioButton ID="rdo_PriRefrigerator_Replacement_No"
                                            runat="server" GroupName="PriRefrigerator_Replacement" />NO
                                </td>
                                <td>
                                    Temperature inside fresh food:<asp:TextBox ID="txt_PriRefrigerator_TemperatureFood"
                                        runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px;
                                        font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Room Temperature:<asp:TextBox
                                            ID="txt_PriRefrigerator_TemperatureRoom" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Temperature
                                    inside freezer:<asp:TextBox ID="txt_PriRefrigerator_TemperatureFrezer" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_PriRefrigerator_DatabaseUsed" runat="server" />
                                    Database Used? Replacement Size:
                                    <asp:TextBox ID="txt_PriRefrigerator_ReplaceSize" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 34px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <asp:CheckBox ID="chk_PriRefrigerator_NotTest" runat="server" />
                                    Did not test because
                                    <asp:RadioButton ID="rdo_PriRefrigerator_NotTst_NotMove" runat="server" GroupName="PriRefrigerator_NotTst" />
                                    Could not move
                                    <asp:RadioButton ID="rdo_PriRefrigerator_NotTst_5Yr_Old" runat="server" GroupName="PriRefrigerator_NotTst" /><
                                    5 years old
                                    <asp:RadioButton ID="rdo_PriRefrigerator_NotTst_CustomerRefuse" runat="server" GroupName="PriRefrigerator_NotTst" />
                                    Customer Refused new unit
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="tab" style="border: 1px solid #000; padding: 10px; margin-top: 20px;">
                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <b>Secondary Refrigerator:</b>
                                </td>
                                <td>
                                    Location:<asp:TextBox ID="txt_SecoRefrigerator_Location" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td align="left">
                                    Calculated Estimated Operating
                                    <br />
                                    Cost/Month. (Optional Info): $:<asp:TextBox ID="txt_SecoRefrigerator_OperatingCost"
                                        runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 52px;
                                        font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Make:<asp:TextBox ID="txt_SecoRefrigerator_Make" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td>--%>&nbsp;&nbsp; Model:<asp:TextBox ID="txt_SecoRefrigerator_Model" runat="server"
                                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 90px; font-weight: normal;
                                    color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td>--%>&nbsp;&nbsp; Year:<asp:TextBox ID="txt_SecoRefrigerator_Year" runat="server"
                                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 90px; font-weight: normal;
                                    color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td>--%>&nbsp;&nbsp; Size:<asp:TextBox ID="txt_SecoRefrigerator_Size" runat="server"
                                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 40px; font-weight: normal;
                                    color: rgb(0, 0, 0);"></asp:TextBox>
                                    &nbsp;&nbsp;Type:
                                    <asp:CheckBox ID="Chk_SecoRefrigerator_TopMount" runat="server" Text="Top Mount"
                                        onclick="SecRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_SecoRefrigerator_BottomMount" runat="server" Text="Bottom Mount"
                                        onclick="SecRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_SecoRefrigerator_SxS" runat="server" Text="SxS" onclick="SecRefrigeratorType(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Start Time:<asp:TextBox ID="txt_SecoRefrigerator_StartTime" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td>--%>&nbsp;&nbsp; End Time:<asp:TextBox ID="txt_SecoRefrigerator_EndTime" runat="server"
                                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                    color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td colspan="2">--%>&nbsp;&nbsp; Total Time Monitored:<asp:TextBox ID="txt_SecoRefrigerator_TotalTime"
                                    runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px;
                                    font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    &nbsp;&nbsp; Ice Maker?
                                    <asp:CheckBox ID="Chk_SecoRefrigerator_IceMaker_Yes" runat="server" Text="Yes" onclick="SecRefrigerator_IceMaker(this.id)" />
                                    <asp:CheckBox ID="Chk_SecoRefrigerator_IceMaker_No" runat="server" Text="No" onclick="SecRefrigerator_IceMaker(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    kWh Monitor Reading:<asp:TextBox ID="txt_SecoRefrigerator_Monitor" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td>
                                    kWh conversion at one hour:<asp:TextBox ID="txt_SecoRefrigerator_Conversion" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 95px; font-weight: normal;
                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    Is this unit eligible </br> for replacement?<asp:RadioButton ID="rdo_SecoRefrigerator_Replacement_Yes"
                                        runat="server" GroupName="SecoRefrigerator_Replacement" />YES<asp:RadioButton ID="rdo_SecoRefrigerator_Replacement_No"
                                            runat="server" GroupName="SecoRefrigerator_Replacement" />NO
                                </td>
                                <td>
                                    Temperature inside fresh food:<asp:TextBox ID="txt_SecoRefrigerator_TemperatureFood"
                                        runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px;
                                        font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Room Temperature:<asp:TextBox
                                            ID="txt_SecoRefrigerator_TemperatureRoom" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Temperature
                                    inside freezer:<asp:TextBox ID="txt_SecoRefrigerator_TemperatureFrezer" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_SecoRefrigerator_DatabaseUsed" runat="server" />
                                    Database Used? Replacement Size
                                    <asp:TextBox ID="txt_SecoRefrigerator_ReplacementSize" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 34px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <asp:CheckBox ID="chk_SecoRefrigerator_NotTest" runat="server" />
                                    Did not test because
                                    <asp:RadioButton ID="rdo_SecoRefrigerator_NotTest_NotMove" runat="server" GroupName="SecoRefrigerator_NotTest_Replacement" />
                                    Could not move
                                    <asp:RadioButton ID="rdo_SecoRefrigerator_NotTest_5Yr_Old" runat="server" GroupName="SecoRefrigerator_NotTest_Replacement" /><
                                    5 years old
                                    <asp:RadioButton ID="rdo_SecoRefrigerator_NotTest_CustomerRefuse" runat="server"
                                        GroupName="SecoRefrigerator_NotTest_Replacement" />
                                    Customer Refused new unit
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="tab" style="border: 1px solid #000; padding: 10px; margin-top: 20px;">
                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <b>Additional Refrigerator:</b>
                                </td>
                                <td>
                                    Location:<asp:TextBox ID="txt_AddRefrigerator_Location" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td align="left">
                                    Calculated Estimated Operating </br>Cost/Month. (Optional Info): $:<asp:TextBox ID="txt_AddRefrigerator_OperatingCost"
                                        runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 52px;
                                        font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Make:<asp:TextBox ID="txt_AddRefrigerator_Make" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td>--%>&nbsp;&nbsp; Model:<asp:TextBox ID="txt_AddRefrigerator_Model" runat="server"
                                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 90px; font-weight: normal;
                                    color: rgb(0, 0, 0);" Width="100px"></asp:TextBox>
                                    <%--</td>
                                <td>--%>&nbsp;&nbsp; Year:<asp:TextBox ID="txt_AddRefrigerator_Year" runat="server"
                                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 90px; font-weight: normal;
                                    color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td>--%>&nbsp;&nbsp; Size:<asp:TextBox ID="txt_AddRefrigerator_Size" runat="server"
                                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 40px; font-weight: normal;
                                    color: rgb(0, 0, 0);"></asp:TextBox>
                                    &nbsp;&nbsp;Type:
                                    <asp:CheckBox ID="Chk_AddRefrigerator_TopMount" runat="server" Text="Top Mount" onclick="AddRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_AddRefrigerator_BottomMount" runat="server" Text="Bottom Mount"
                                        onclick="AddRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_AddRefrigerator_SxS" runat="server" Text="SxS" onclick="AddRefrigeratorType(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Start Time:<asp:TextBox ID="txt_AddRefrigerator_StartTime" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td>--%>
                                    End Time:<asp:TextBox ID="txt_AddRefrigerator_EndTime" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <%--</td>
                                <td colspan="2">--%>
                                    Total Time Monitored:<asp:TextBox ID="txt_AddRefrigerator_TotalTime" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                    &nbsp;&nbsp; Ice Maker?
                                    <asp:CheckBox ID="Chk_AddRefrigerator_IceMaker_Yes" runat="server" Text="Yes" onclick="AddRefrigerator_IceMaker(this.id)" />
                                    <asp:CheckBox ID="Chk_AddRefrigerator_IceMaker_No" runat="server" Text="No" onclick="AddRefrigerator_IceMaker(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    kWh Monitor Reading:<asp:TextBox ID="txt_AddRefrigerator_Monitor" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td>
                                    kWh conversion at one hour:<asp:TextBox ID="txt_AddRefrigerator_Conversion" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 95px; font-weight: normal;
                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    Is this unit eligible</br> for replacement?<asp:RadioButton ID="rdo_AddRefrigerator_Replacement_Yes"
                                        runat="server" GroupName="AddRefrigerator_Replacement" />YES<asp:RadioButton ID="rdo_AddRefrigerator_Replacement_No"
                                            runat="server" GroupName="AddRefrigerator_Replacement" />NO
                                </td>
                                <td>
                                    Temperature inside fresh food:<asp:TextBox ID="txt_AddRefrigerator_TemperatureFood"
                                        runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px;
                                        font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Room Temperature:<asp:TextBox
                                            ID="txt_AddRefrigerator_TemperatureRoom" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Temperature
                                    inside freezer:<asp:TextBox ID="txt_AddRefrigerator_TemperatureFrezer" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AddRefrigerator_DatabaseUsed" runat="server" />Database used?
                                    Replacement size
                                    <asp:TextBox ID="txt_AddRefrigerator_ReplacementSize" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 34px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <asp:CheckBox ID="chk_AddRefrigerator_NotTest" runat="server" />
                                    Did not test because
                                    <asp:RadioButton ID="rdo_AddRefrigerator_NotTest_NotMove" runat="server" GroupName="AddRefrigerator_NotTest" />
                                    Could not move
                                    <asp:RadioButton ID="rdo_AddRefrigerator_NotTest_5Yr_Old" runat="server" GroupName="AddRefrigerator_NotTest" />
                                    < 5years old
                                    <asp:RadioButton ID="rdo_AddRefrigerator_NotTest_CustomerRefuse" runat="server" GroupName="AddRefrigerator_NotTest" />
                                    Customer Refused new unit
                                </td>
                            </tr>
                        </table>
                    </div>
        </div>
        <p>
            <b>If space is needed for additional refrigerators, please use comment section on next
                page.</b></p>
    </div>

    <script type="text/javascript">

        $(function() {
            document.getElementById('Page5').classList.add("ui-selected");
        });




        function AddRefrigerator_IceMaker(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= Chk_AddRefrigerator_IceMaker_Yes.ClientID %>').checked = false;
                document.getElementById('<%= Chk_AddRefrigerator_IceMaker_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function SecRefrigerator_IceMaker(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= Chk_SecoRefrigerator_IceMaker_Yes.ClientID %>').checked = false;
                document.getElementById('<%= Chk_SecoRefrigerator_IceMaker_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function PriRefrigerator_IceMaker(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= Chk_PriRefrigerator_IceMaker_Yes.ClientID %>').checked = false;
                document.getElementById('<%= Chk_PriRefrigerator_IceMaker_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function AddRefrigeratorType(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= Chk_AddRefrigerator_TopMount.ClientID %>').checked = false;
                document.getElementById('<%= Chk_AddRefrigerator_BottomMount.ClientID %>').checked = false;
                document.getElementById('<%= Chk_AddRefrigerator_SxS.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }



        function SecRefrigeratorType(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= Chk_SecoRefrigerator_TopMount.ClientID %>').checked = false;
                document.getElementById('<%= Chk_SecoRefrigerator_BottomMount.ClientID %>').checked = false;
                document.getElementById('<%= Chk_SecoRefrigerator_SxS.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }



        function PriRefrigeratorType(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= Chk_PriRefrigerator_TopMount.ClientID %>').checked = false;
                document.getElementById('<%= Chk_PriRefrigerator_BottomMount.ClientID %>').checked = false;
                document.getElementById('<%= Chk_PriRefrigerator_SxS.ClientID %>').checked = false;
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
