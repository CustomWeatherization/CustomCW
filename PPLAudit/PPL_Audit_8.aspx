<%@ Page Language="C#" MasterPageFile="~/PPLAudit/PPLMasterPage.master" AutoEventWireup="true"
    CodeFile="PPL_Audit_8.aspx.cs" Inherits="PPLAudit_PPL_Audit_8" Title="PPL Audit 8" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <!-- form section -->
    <div class="fontbold">
        <div id="DivPrint">
            <h2 align="left">
                Blower Door Testing Information Form</h2>
            <br />
            <table width="100%" cellspacing="0" cellpadding="10" border="1">
                <tr>
                    <td>
                        Target MVG:
                        <asp:TextBox ID="txtTargetMVG" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 30%;" MaxLength="50"></asp:TextBox>
                    </td>
                    <td>
                        CFM 50
                    </td>
                    <td>
                        Temperature
                    </td>
                </tr>
                <tr>
                    <td>
                        Pre-weatherization reading:
                        <asp:TextBox ID="txtPreweatherizationreadingBDO" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 30%;" onkeyup="TotalReduction()" onkeydown="TotalReduction()" MaxLength="50"
                            Width="80px"></asp:TextBox>
                    </td>
                    <td>
                        CFM 50, basement door open
                    </td>
                    <td>
                        Indoor
                        <asp:TextBox ID="txtIndoorTemperature" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 30%;" MaxLength="50" Width="80px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Pre-weatherization reading:
                        <asp:TextBox ID="txtPreweatherizationreadingBDClosed" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 30%;" onkeyup="TotalReduction()" onkeydown="TotalReduction()" MaxLength="50"
                            Width="80px"></asp:TextBox>
                    </td>
                    <td>
                        CFM 50, basement door Close
                    </td>
                    <td>
                        Outdoor<asp:TextBox ID="txtOutdoorTemperature" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 30%;" MaxLength="50" Width="80px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Post-weatherization reading:
                        <asp:TextBox ID="txtPostweatherizationreading" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 30%;" onkeyup="TotalReduction()" onkeydown="TotalReduction()" MaxLength="50"
                            Width="80px"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        CFM 50 basement
                        <asp:CheckBox ID="chkPostweatherizationreadingOpenOrClosedCheckbox_Open" runat="server"
                            onclick="AuditNotCompleted(this.id)" />
                        Open &nbsp; &nbsp;
                        <asp:CheckBox ID="chkPostweatherizationreadingOpenOrClosedCheckbox_Close" runat="server"
                            onclick="AuditNotCompleted(this.id)" />
                        Close
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        Total Reduction:
                        <asp:TextBox ID="txtTotalReduction" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 30%;" MaxLength="50"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <h4 align="left">
                *5 Point Test Optional Method</h4>
            <br />
            <p align="left">
                <span>Notes: </span>Consider areas that are heated and used daily as intentionally
                heated and should be inside the thermal (insulation) and pressure (air sealed) area.
                The thermal and pressure boundaries must be at the same place. When testing, use
                house to outside (H/OO pressures near 50 Pa if possible. Use same gauge for all
                tests. The ceiling leakage Ratio is the (House/Zone divided by the House/Outside)
                times 100%. 90% or better passes. If the ratio is less than 90% (.9), the home must
                receive air sealing treatment for both bypasses and convective loops. A zone is
                any area that might be connected to the house and you want to determine if there
                are leaks to the outside or leaks to the house. Ducts that are considered zones
                should be tested using the Duct Testing, Repair and Sealing Sheet. If the ceilings
                and rood deck are on a common rafter, such as flat roofs or cathedral ceilings,
                there is no attic and therefore no attic pressure tests need to be taken. "Outside"
                means out of the entire structure.</p>
            <br />
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td colspan="7" align="center">
                        <h3>
                            PRESSURES</h3>
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        &nbsp;
                    </td>
                    <td colspan="2" align="center">
                        What was blower door test set at? House/Outside
                    </td>
                    <td align="center">
                        House/Zone
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td align="center">
                        Zone/Outside
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>ZONES</span>
                    </td>
                    <td align="center">
                        <span>Pre-Treat</span>
                    </td>
                    <td align="center">
                        <span>Final</span>
                    </td>
                    <td align="center">
                        <span>Pre-Treat</span>
                    </td>
                    <td align="center">
                        <span>Final</span>
                    </td>
                    <td align="center">
                        <span>Pre-Treat</span>
                    </td>
                    <td align="center">
                        <span>Final</span>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <span>Example: Attic</span>
                    </td>
                    <td align="center">
                        -50
                    </td>
                    <td align="center">
                        -50
                    </td>
                    <td align="center">
                        -40
                    </td>
                    <td align="center">
                        -50
                    </td>
                    <td align="center" width="100px;">
                        -10 (attic is connected to the house and needs to be separated by air sealing the
                        attic floor)
                    </td>
                    <td align="center">
                        0
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Basement</span>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBasement_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                            TargetControlID="txtBasement_BlowerDoorPretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBasement_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                            TargetControlID="txtBasement_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBasementHouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                            TargetControlID="txtBasementHouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBasementHouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                            TargetControlID="txtBasementHouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBasementZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                            TargetControlID="txtBasementZoneOutsidePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBasementZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                            TargetControlID="txtBasementZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Vented Crawlspace</span>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtVentedCrawlSpace_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server"
                            TargetControlID="txtVentedCrawlSpace_BlowerDoorPretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtVentedCrawlSpace_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                            TargetControlID="txtVentedCrawlSpace_BlowerDoorFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVentedCrawlSpaceHouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                            TargetControlID="txtVentedCrawlSpaceHouseZonePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVentedCrawlSpaceHouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server"
                            TargetControlID="txtVentedCrawlSpaceHouseZoneFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVentedCrawlSpaceZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server"
                            TargetControlID="txtVentedCrawlSpaceZoneOutsidePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVentedCrawlSpaceZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server"
                            TargetControlID="txtVentedCrawlSpaceZoneOutsideFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Attic A</span>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtAttic_A_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server"
                            TargetControlID="txtAttic_A_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtAttic_A_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server"
                            TargetControlID="txtAttic_A_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAttic_A_HouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server"
                            TargetControlID="txtAttic_A_HouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAttic_A_HouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server"
                            TargetControlID="txtAttic_A_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAttic_A_ZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server"
                            TargetControlID="txtAttic_A_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAttic_A_ZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" runat="server"
                            TargetControlID="txtAttic_A_ZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Attic B</span>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtAttic_B_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" runat="server"
                            TargetControlID="txtAttic_B_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtAttic_B_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender20" runat="server"
                            TargetControlID="txtAttic_B_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAttic_B_HouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender21" runat="server"
                            TargetControlID="txtAttic_B_HouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAttic_B_HouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" runat="server"
                            TargetControlID="txtAttic_B_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAttic_B_ZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender23" runat="server"
                            TargetControlID="txtAttic_B_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAttic_B_ZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender24" runat="server"
                            TargetControlID="txtAttic_B_ZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Kneewall A</span>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtKneewall_A_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender25" runat="server"
                            TargetControlID="txtKneewall_A_BlowerDoorPretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtKneewall_A_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender26" runat="server"
                            TargetControlID="txtKneewall_A_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKneewall_A_HouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender27" runat="server"
                            TargetControlID="txtKneewall_A_HouseZonePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKneewall_A_HouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender28" runat="server"
                            TargetControlID="txtKneewall_A_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKneewall_A_ZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender29" runat="server"
                            TargetControlID="txtKneewall_A_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKneewall_A_ZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender30" runat="server"
                            TargetControlID="txtKneewall_A_ZoneOutsideFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Kneewall B</span>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtKneewall_B_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender31" runat="server"
                            TargetControlID="txtKneewall_B_BlowerDoorPretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtKneewall_B_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender32" runat="server"
                            TargetControlID="txtKneewall_B_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKneewall_B_HouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender33" runat="server"
                            TargetControlID="txtKneewall_B_HouseZonePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKneewall_B_HouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender34" runat="server"
                            TargetControlID="txtKneewall_B_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKneewall_B_ZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender35" runat="server"
                            TargetControlID="txtKneewall_B_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKneewall_B_ZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender36" runat="server"
                            TargetControlID="txtKneewall_B_ZoneOutsideFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Garage</span>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtGarage_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender37" runat="server"
                            TargetControlID="txtGarage_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtGarage_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender38" runat="server"
                            TargetControlID="txtGarage_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGarageHouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender39" runat="server"
                            TargetControlID="txtGarageHouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGarageHouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender40" runat="server"
                            TargetControlID="txtGarageHouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGarageZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender41" runat="server"
                            TargetControlID="txtGarageZoneOutsidePretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGarageZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server"
                            TargetControlID="txtGarageZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Garage Attic</span>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtGarage_Attic_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender43" runat="server"
                            TargetControlID="txtGarage_Attic_BlowerDoorPretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtGarage_AtticBlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender44" runat="server"
                            TargetControlID="txtGarage_AtticBlowerDoorFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGarage_AtticHouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender45" runat="server"
                            TargetControlID="txtGarage_AtticHouseZonePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGarage_AtticHouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender46" runat="server"
                            TargetControlID="txtGarage_AtticHouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGarage_AtticZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender47" runat="server"
                            TargetControlID="txtGarage_AtticZoneOutsidePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGarage_AtticZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender48" runat="server"
                            TargetControlID="txtGarage_AtticZoneOutsideFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Cantilever Overhang</span>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtCantilever_Overhang_1_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender49" runat="server"
                            TargetControlID="txtCantilever_Overhang_1_BlowerDoorPretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtCantilever_Overhang_1_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender50" runat="server"
                            TargetControlID="txtCantilever_Overhang_1_BlowerDoorFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCantilever_Overhang_1_HouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender51" runat="server"
                            TargetControlID="txtCantilever_Overhang_1_HouseZonePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCantilever_Overhang_1_HouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender52" runat="server"
                            TargetControlID="txtCantilever_Overhang_1_HouseZoneFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCantilever_Overhang_1_ZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender53" runat="server"
                            TargetControlID="txtCantilever_Overhang_1_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCantilever_Overhang_1_ZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender54" runat="server"
                            TargetControlID="txtCantilever_Overhang_1_ZoneOutsideFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Cantilever Overhang</span>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtCantilever_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender55" runat="server"
                            TargetControlID="txtCantilever_BlowerDoorPretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtCantilever_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender56" runat="server"
                            TargetControlID="txtCantilever_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCantilever_Overhang_2_HouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender57" runat="server"
                            TargetControlID="txtCantilever_Overhang_2_HouseZonePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCantilever_Overhang_2_HouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender58" runat="server"
                            TargetControlID="txtCantilever_Overhang_2_HouseZoneFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCantilever_Overhang_2_ZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender59" runat="server"
                            TargetControlID="txtCantilever_Overhang_2_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCantilever_Overhang_2_ZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender60" runat="server"
                            TargetControlID="txtCantilever_Overhang_2_ZoneOutsideFinal" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>
                            <asp:TextBox ID="txtOther1" runat="server" Text="Other" Style="border-bottom: white;
                                text-align: center; border-left: white; font-family: arial; font-size: 14px;
                                text-align: left; font-size: 17px; vertical-align: top; border-top: white; border-right: white;"></asp:TextBox>
                        </b>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOther1_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender61" runat="server"
                            TargetControlID="txtOther1_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOther1_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender62" runat="server"
                            TargetControlID="txtOther1_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther1HouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender63" runat="server"
                            TargetControlID="txtOther1HouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther1HouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender64" runat="server"
                            TargetControlID="txtOther1HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther1ZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender65" runat="server"
                            TargetControlID="txtOther1ZoneOutsidePretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther1ZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender66" runat="server"
                            TargetControlID="txtOther1ZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>
                            <asp:TextBox ID="txtOther2" runat="server" Text="Other" Style="border-bottom: white;
                                text-align: center; border-left: white; font-family: arial; font-size: 14px;
                                text-align: left; font-size: 17px; vertical-align: top; border-top: white; border-right: white;"></asp:TextBox>
                        </b>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOther_2_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender67" runat="server"
                            TargetControlID="txtOther_2_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOther_2_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender68" runat="server"
                            TargetControlID="txtOther_2_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther_2_HouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender69" runat="server"
                            TargetControlID="txtOther_2_HouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther_2_HouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender70" runat="server"
                            TargetControlID="txtOther_2_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther_2_ZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender71" runat="server"
                            TargetControlID="txtOther_2_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther_2_ZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender72" runat="server"
                            TargetControlID="txtOther_2_ZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>
                            <asp:TextBox ID="txtOther3" runat="server" Text="Other" Style="border-bottom: white;
                                text-align: center; border-left: white; font-family: arial; font-size: 14px;
                                text-align: left; font-size: 17px; vertical-align: top; border-top: white; border-right: white;"></asp:TextBox>
                        </strong>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOther_3_BlowerDoorPretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender73" runat="server"
                            TargetControlID="txtOther_3_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOther_3_BlowerDoorFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender74" runat="server"
                            TargetControlID="txtOther_3_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther_3_HouseZonePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender75" runat="server"
                            TargetControlID="txtOther_3_HouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther_3_HouseZoneFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender76" runat="server"
                            TargetControlID="txtOther_3_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther_3_ZoneOutsidePretreat" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender77" runat="server"
                            TargetControlID="txtOther_3_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                            ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther_3_ZoneOutsideFinal" runat="server" Style="border-bottom: white;
                            text-align: center; border-left: white; font-family: arial; font-size: 14px;
                            vertical-align: top; border-top: white; border-right: white;" size="7" MaxLength="7"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender78" runat="server"
                            TargetControlID="txtOther_3_ZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                        </ajaxToolkit:FilteredTextBoxExtender>
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
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click1"
                class="top_btn" />&nbsp;&nbsp;
            <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
        </div>
    </div>

    <script type="text/javascript">

        $(function() {
            document.getElementById('Page8').classList.add("ui-selected");

            if (document.getElementById('<%= txtBasement_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtBasement_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtBasement_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtBasement_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtVentedCrawlSpace_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtVentedCrawlSpace_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtVentedCrawlSpace_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtVentedCrawlSpace_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtAttic_A_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtAttic_A_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtAttic_A_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtAttic_A_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtAttic_B_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtAttic_B_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtAttic_B_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtAttic_B_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtKneewall_A_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtKneewall_A_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtKneewall_A_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtKneewall_A_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtKneewall_B_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtKneewall_B_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtKneewall_B_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtKneewall_B_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtGarage_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtGarage_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtGarage_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtGarage_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtGarage_Attic_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtGarage_Attic_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtGarage_AtticBlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtGarage_AtticBlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtCantilever_Overhang_1_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtCantilever_Overhang_1_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtCantilever_Overhang_1_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtCantilever_Overhang_1_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtCantilever_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtCantilever_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtCantilever_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtCantilever_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtOther1_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtOther1_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtOther1_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtOther1_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtOther_2_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtOther_2_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtOther_2_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtOther_2_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtOther_3_BlowerDoorPretreat.ClientID %>').value == "") {
                document.getElementById('<%= txtOther_3_BlowerDoorPretreat.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtOther_3_BlowerDoorFinal.ClientID %>').value == "") {
                document.getElementById('<%= txtOther_3_BlowerDoorFinal.ClientID %>').value = "-50";
            }

            if (document.getElementById('<%= txtOther1.ClientID %>').value == "") {
                document.getElementById('<%= txtOther1.ClientID %>').value = "Other";
            }

            if (document.getElementById('<%= txtOther2.ClientID %>').value == "") {
                document.getElementById('<%= txtOther2.ClientID %>').value = "Other";
            }

            if (document.getElementById('<%= txtOther3.ClientID %>').value == "") {
                document.getElementById('<%= txtOther3.ClientID %>').value = "Other";
            }

        });
        
    </script>

    <script type="text/javascript">
        document.getElementById("Page8").setAttribute("class", "ui-selected");

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

        function TotalReduction() {
            if (document.getElementById('<%= chkPostweatherizationreadingOpenOrClosedCheckbox_Open.ClientID %>').checked == true) {
                var first = document.getElementById('<%= txtPreweatherizationreadingBDO.ClientID %>').value;
                var Second = document.getElementById('<%= txtPostweatherizationreading.ClientID %>').value;
                var Third = first - Second;
                document.getElementById('<%= txtTotalReduction.ClientID %>').value = Third;
            }
            else if (document.getElementById('<%= chkPostweatherizationreadingOpenOrClosedCheckbox_Close.ClientID %>').checked == true) {
                var first = document.getElementById('<%= txtPreweatherizationreadingBDClosed.ClientID %>').value;
                var Second = document.getElementById('<%= txtPostweatherizationreading.ClientID %>').value;
                var Third = first - Second;
                document.getElementById('<%= txtTotalReduction.ClientID %>').value = Third;
            }

        }

        function AuditNotCompleted(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkPostweatherizationreadingOpenOrClosedCheckbox_Open.ClientID %>').checked = false;
                document.getElementById('<%= chkPostweatherizationreadingOpenOrClosedCheckbox_Close.ClientID %>').checked = false;
                CheckBox.checked = true;
                TotalReduction();
            }
        }
        
             
    </script>

</asp:Content>
