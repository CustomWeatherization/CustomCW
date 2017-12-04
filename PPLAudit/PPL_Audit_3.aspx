<%@ Page Language="C#" MasterPageFile="~/PPLAudit/PPLMasterPage.master" AutoEventWireup="true"
    CodeFile="PPL_Audit_3.aspx.cs" Inherits="PPLAudit_PPL_Audit_3" Title="PPL Audit 3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .num_W_txt
        {
            border: none;
            width: 60px;
            font-weight: normal;
            color: rgb(0, 0, 0);
        }
        .num_Brand_txt
        {
            border: none;
            width: 100px;
            font-weight: normal;
            color: rgb(0, 0, 0);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <asp:ScriptManager ID="scrptMngr" runat="server">
    </asp:ScriptManager>--%>
    <ajx:ToolkitScriptManager ID="tool1" runat="server">
    </ajx:ToolkitScriptManager>
    <div class="fontbold">
        <div id="DivPrint">
            <h2 align="left">
                BASELOAD. SECTION:</h2>
            Summary of Baseload Audit Work: C=Completed R=Referred N/A= Not Applicable NR=Not
            Recommended
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td width="50%">
                        <table width="100%" border="0" cellspacing="2" cellpadding="5">
                            <tr>
                                <td>
                                    Refrigerator Tested
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorTested_C" runat="server" Text="C" onclick="RefrigeratorTested(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorTested_R" runat="server" Text="R" onclick="RefrigeratorTested(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorTested_NA" runat="server" Text="N/A" onclick="RefrigeratorTested(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorTested_NR" runat="server" Text="N/R" onclick="RefrigeratorTested(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Refrigerator Tested (Sec.)
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorTestedSec_C" runat="server" Text="C" onclick="RefrigeratorTestedSec(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorTestedSec_R" runat="server" Text="R" onclick="RefrigeratorTestedSec(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorTestedSec_NA" runat="server" Text="N/A" onclick="RefrigeratorTestedSec(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorTestedSec_NR" runat="server" Text="N/R" onclick="RefrigeratorTestedSec(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Freezer Tested
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkFreezerTested_C" runat="server" Text="C" onclick="FreezerTested(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkFreezerTested_R" runat="server" Text="R" onclick="FreezerTested(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkFreezerTested_NA" runat="server" Text="N/A" onclick="FreezerTested(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkFreezerTested_NR" runat="server" Text="N/R" onclick="FreezerTested(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Refrigerator Coils Cleaned
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorCoilsCleaned_C" runat="server" Text="C" onclick="RefrigeratorCoilsCleaned(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorCoilsCleaned_R" runat="server" Text="R" onclick="RefrigeratorCoilsCleaned(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorCoilsCleaned_NA" runat="server" Text="N/A" onclick="RefrigeratorCoilsCleaned(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRefrigeratorCoilsCleaned_NR" runat="server" Text="N/R" onclick="RefrigeratorCoilsCleaned(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    AC Filter Changed
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACFilterChanged_C" runat="server" Text="C" onclick="ACFilterChanged(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACFilterChanged_R" runat="server" Text="R" onclick="ACFilterChanged(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACFilterChanged_NA" runat="server" Text="N/A" onclick="ACFilterChanged(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACFilterChanged_NR" runat="server" Text="N/R" onclick="ACFilterChanged(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    AC Filter Cleaned
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACFilterCleaned_C" runat="server" Text="C" onclick="ACFilterCleaned(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACFilterCleaned_R" runat="server" Text="R" onclick="ACFilterCleaned(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACFilterCleaned_NA" runat="server" Text="N/A" onclick="ACFilterCleaned(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACFilterCleaned_NR" runat="server" Text="N/R" onclick="ACFilterCleaned(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    AC(s) Replaced
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACReplaced_C" runat="server" Text="C" onclick="ACReplaced(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACReplaced_R" runat="server" Text="R" onclick="ACReplaced(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACReplaced_NA" runat="server" Text="N/A" onclick="ACReplaced(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkACReplaced_NR" runat="server" Text="N/R" onclick="ACReplaced(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    AC Location(s)
                                    <asp:TextBox ID="txtAcLoaction" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 72%; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="50%">
                        <table width="100%" border="0" cellspacing="5" cellpadding="3">
                            <tr>
                                <td>
                                    Dryer Vent Measures
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkDryerVentMeasures_C" runat="server" Text="C" onclick="DryerVentMeasures(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkDryerVentMeasures_R" runat="server" Text="R" onclick="DryerVentMeasures(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkDryerVentMeasures_NA" runat="server" Text="N/A" onclick="DryerVentMeasures(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Describe:
                                    <asp:TextBox ID="txtDryerVentMeauresDescribe" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 80%; font-weight: normal; color: rgb(0, 0, 0);"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Heating Filter Changed
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkHeatingFilterChanged_C" runat="server" Text="C" onclick="HeatingFilterChanged(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkHeatingFilterChanged_R" runat="server" Text="R" onclick="HeatingFilterChanged(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkHeatingFilterChanged_NA" runat="server" Text="N/A" onclick="HeatingFilterChanged(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Heating Filter Cleaned
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkHeatingFilterCleaned_C" runat="server" Text="C" onclick="HeatingFilterCleaned(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkHeatingFilterCleaned_R" runat="server" Text="R" onclick="HeatingFilterCleaned(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkHeatingFilterCleaned_NA" runat="server" Text="N/A" onclick="HeatingFilterCleaned(this.id)" />
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td>
                                    Heating Filter Cleaned
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkHeatingFilterCleaned2_C" runat="server" Text="C" onclick="HeatingFilterCleaned2(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkHeatingFilterCleaned2_R" runat="server" Text="R" onclick="HeatingFilterCleaned2(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkHeatingFilterCleaned2_NA" runat="server" Text="N/A" onclick="HeatingFilterCleaned2(this.id)" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Power Strip #&nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txtComfortMeasuresInstalledCommentsLine1" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 72%; font-weight: normal; color: rgb(0, 0, 0);"
                                        MaxLength="128"></asp:TextBox><br />
                                    CO Detector #&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtComfortMeasuresInstalledCommentsLine2"
                                        runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 72%;
                                        margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    Other:
                                    <asp:TextBox ID="txtOtherComments" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 85%; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <h2 align="left">
                LIGHTING ASSESSMENT (Replace incandescent bulbs used an average of 1 hours per day.)
            </h2>
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td width="25%" align="center">
                        Location
                    </td>
                    <td width="4%">
                        <%--Speciality--%>
                        Supplier
                    </td>
                    <td align="center" width="4%">
                        # LED Installed
                    </td>
                    <td width="6%" align="center">
                        LED Wattage
                    </td>
                    <td width="15%" align="center">
                        LED LightBulb Brand
                    </td>
                    <td align="center" width="56%">
                        Comments
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>1. Living Room</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkLiving" runat="server" Visible="false" />
                        <asp:TextBox ID="txtLiving" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtLivingRoom_CFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtLivingRoom_CFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtLivingRoom_CFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtLivingRoom_CFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtLivingRoom_LightBulbsBrand" runat="server" Style="text-align: center;
                            border: none; width: 100px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLiving_Room_Comments" runat="server" Style="border: none; width: 100%;
                            font-weight: normal; text-align: center;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>2. Family Room</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkFamilyroom" runat="server" Visible="false" />
                        <asp:TextBox ID="txtFamilyroom" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtFamilyRoomCFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtFamilyRoomCFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtFamilyRoomCFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtFamilyRoomCFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtFamilyRoomLightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFamilyRoomComments" runat="server" Style="border: none; width: 100%;
                            font-weight: normal; text-align: center;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>3. Kitchen</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="ChkKitchen" runat="server" Visible="false" />
                        <asp:TextBox ID="txtKitchen" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtKitchenCFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtKitchenCFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtKitchenCFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtKitchenCFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtKitchenLightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKitchen_Comments" runat="server" Style="border: none; text-align: center;
                            width: 100%; font-weight: normal;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>4. Dining Room</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkDining" runat="server" Visible="false" />
                        <asp:TextBox ID="txtDining" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtDiningRoomCFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtDiningRoomCFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtDiningRoomCFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtDiningRoomCFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtDiningRoomLightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDiningRoom_Comments" runat="server" Style="border: none; width: 100%;
                            font-weight: normal; text-align: center;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>5. Bedroom 1</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="Chkbedroom" runat="server" Visible="false" />
                        <asp:TextBox ID="txtbedroom" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBedroom_1_CFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtBedroom_1_CFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtBedroom_1_CFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBedroom_1_CFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBedroom_1_LightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBedroom_1_Comments" runat="server" Style="border: none; width: 100%;
                            font-weight: normal; text-align: center;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>6. Bedroom 2</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkbedRoom2" runat="server" Visible="false" />
                        <asp:TextBox ID="txtbedRoom2" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBedroom_2_CFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtBedroom_2_CFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtBedroom_2_CFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBedroom_2_CFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBedroom_2_LightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBedroom_2_Comments" Style="text-align: center; border: none;
                            width: 100%; font-weight: normal;" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>7. Bedroom 3</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkbedroom3" runat="server" Visible="false" />
                        <asp:TextBox ID="txtbedroom3" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBedRoom_3_CFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtBedRoom_3_CFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtBedRoom_3_CFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBedRoom_3_CFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBedRoom_3_LightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBedRoom_3_Comments" runat="server" Style="border: none; width: 100%;
                            font-weight: normal; text-align: center;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>8. Bath 1</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkbath1" runat="server" Visible="false" />
                        <asp:TextBox ID="txtbath1" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBath_1_CFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtBath_1_CFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtBath_1_CFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBath_1_CFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBath_1_LightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBath_1_Comments" runat="server" Style="border: none; text-align: center;
                            width: 100%; font-weight: normal;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>9. Bath 2</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkBath2" runat="server" Visible="false" />
                        <asp:TextBox ID="txtBath2" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBath_2_CFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtBath_2_CFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtBath_2_CFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBath_2_CFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtBath_2_LightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBath_2_Comments" runat="server" Style="border: none; text-align: center;
                            width: 100%; font-weight: normal;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>10. Hallway</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkHallway" runat="server" Visible="false" />
                        <asp:TextBox ID="txtHallway" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtHallwayCFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtHallwayCFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtHallwayCFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtHallwayCFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtHallwayLightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtHallway_Comments" runat="server" Style="border: none; text-align: center;
                            width: 100%; font-weight: normal;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>11. Outdoors</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkOutdoors" runat="server" Visible="false" />
                        <asp:TextBox ID="txtOutdoors" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOutDoorCFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtOutDoorCFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtOutDoorCFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOutDoorCFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOutDoorLightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOutDoor_Comments" runat="server" Style="border: none; text-align: center;
                            width: 100%; font-weight: normal;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>12. Other</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkother" runat="server" Visible="false" />
                        <asp:TextBox ID="txtother" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOtherCFLS" runat="server" Style="text-align: center; border: none;
                            width: 50px; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtOtherCFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtOtherCFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOtherCFLSWattage" Style="text-align: center; border: none; width: 60px;
                            font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtOtherLightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOther_Comments" runat="server" Style="text-align: center; border: none;
                            width: 100%; font-weight: normal;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>13.Spare(Max2)</span>
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkspare" runat="server" Visible="false" />
                        <asp:TextBox ID="txtspare" runat="server" Style="border: none; width: 50px; text-align: center;
                            font-weight: normal; color: Black;"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtSpareMax2CFLS" runat="server" Style="border: none; width: 50px;
                            text-align: center; font-weight: normal; color: Black;" MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                        <ajx:FilteredTextBoxExtender ID="Fltr_txtSpareMax2CFLS" runat="server" FilterType="Numbers"
                            TargetControlID="txtSpareMax2CFLS">
                        </ajx:FilteredTextBoxExtender>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtSpareMax2CFLSWattage" Style="text-align: center; border: none;
                            width: 60px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtSpareMax2LightBulbBrand" Style="text-align: center; border: none;
                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSapreMax2_Comments" runat="server" Style="border: none; width: 100%;
                            font-weight: normal; text-align: center;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Total Bulbs
                    </td>
                    <td>
                    </td>
                    <td align="center">
                        <asp:Label ID="txtTotalCFLS" runat="server"></asp:Label>
                        <asp:HiddenField ID="hdntotal" runat="server" />
                        <%--<asp:TextBox ID="txtTotalCFLS" runat="server" Style="border:none; width:50px; font-weight:normal; color: Black;" MaxLength="5" Enabled="false"></asp:TextBox>--%>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTotalBulbs_Comments" runat="server" Style="border: none; width: 100%;
                            font-weight: normal;" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <strong>If no, select a reason</strong>
            <asp:DropDownList ID="DDL_Reason" runat="server">
                <asp:ListItem Text="Select Reason" Value="0"></asp:ListItem>
                <asp:ListItem Text="CFLs installed by customer" Value="1"></asp:ListItem>
                <asp:ListItem Text="CFLs installed by other weatherization program" Value="2"></asp:ListItem>
                <asp:ListItem Text="Customer refused" Value="3"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <h2 align="left">
                Waterbed mattress Replacement (Sizes are inside frame dimensions)</h2>
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        <asp:CheckBox ID="chkKing" runat="server" Text="King" />
                        (70" X 82")
                        <br />
                        <br />
                        <asp:CheckBox ID="chkQueen" runat="server" Text="Queen" />
                        (58" X 82")
                        <br />
                        <br />
                        <asp:CheckBox ID="chkSuperSingle" runat="server" Text="Super Single" />
                        (46" X 82")
                        <br />
                        <br />
                        Describe insulated mattress pads requested on line below:
                        <asp:TextBox ID="txtPads_RequestedReason" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 62%; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <h2 align="left">
                List main Reasons for Electric Usage:</h2>
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        1)<asp:TextBox ID="txtElectric_Usage_CommentsLine1" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal;
                            color: rgb(0, 0, 0);" MaxLength="100" Width="800px"></asp:TextBox>
                        2)<asp:TextBox ID="txtElectric_Usage_CommentsLine2" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal;
                            color: rgb(0, 0, 0);" MaxLength="100" Width="800px"></asp:TextBox>
                        3)<asp:TextBox ID="txtElectric_Usage_CommentsLine3" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal;
                            color: rgb(0, 0, 0);" MaxLength="100" Width="800px"></asp:TextBox>
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
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="top_btn" OnClick="btnCancel_Click" />&nbsp;&nbsp;
            <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
        </div>
    </div>

    <script type="text/javascript">

        $(function () {
            document.getElementById('Page3').classList.add("ui-selected");
        });

        //Refrigerator Tested
        function RefrigeratorTested(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkRefrigeratorTested_C.ClientID %>').checked = false;
                document.getElementById('<%= chkRefrigeratorTested_R.ClientID %>').checked = false;
                document.getElementById('<%= chkRefrigeratorTested_NA.ClientID %>').checked = false;
                document.getElementById('<%= chkRefrigeratorTested_NR.ClientID %>').checked = false;
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


        //  Refrigerator Tested (Sec.)

        function RefrigeratorTestedSec(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkRefrigeratorTestedSec_C.ClientID %>').checked = false;
                document.getElementById('<%= chkRefrigeratorTestedSec_R.ClientID %>').checked = false;
                document.getElementById('<%= chkRefrigeratorTestedSec_NA.ClientID %>').checked = false;
                document.getElementById('<%= chkRefrigeratorTestedSec_NR.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function FreezerTested(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkFreezerTested_C.ClientID %>').checked = false;
                document.getElementById('<%= chkFreezerTested_R.ClientID %>').checked = false;
                document.getElementById('<%= chkFreezerTested_NA.ClientID %>').checked = false;
                document.getElementById('<%= chkFreezerTested_NR.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function RefrigeratorCoilsCleaned(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkRefrigeratorCoilsCleaned_C.ClientID %>').checked = false;
                document.getElementById('<%= chkRefrigeratorCoilsCleaned_R.ClientID %>').checked = false;
                document.getElementById('<%= chkRefrigeratorCoilsCleaned_NA.ClientID %>').checked = false;
                document.getElementById('<%= chkRefrigeratorCoilsCleaned_NR.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }



        function ACFilterChanged(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkACFilterChanged_C.ClientID %>').checked = false;
                document.getElementById('<%= chkACFilterChanged_R.ClientID %>').checked = false;
                document.getElementById('<%= chkACFilterChanged_NA.ClientID %>').checked = false;
                document.getElementById('<%= chkACFilterChanged_NR.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function ACFilterCleaned(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkACFilterCleaned_C.ClientID %>').checked = false;
                document.getElementById('<%= chkACFilterCleaned_R.ClientID %>').checked = false;
                document.getElementById('<%= chkACFilterCleaned_NA.ClientID %>').checked = false;
                document.getElementById('<%= chkACFilterCleaned_NR.ClientID %>').checked = false;
                CheckBox.checked = true;
            }

        }

        function ACReplaced(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkACReplaced_C.ClientID %>').checked = false;
                document.getElementById('<%= chkACReplaced_R.ClientID %>').checked = false;
                document.getElementById('<%= chkACReplaced_NA.ClientID %>').checked = false;
                document.getElementById('<%= chkACReplaced_NR.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        //Dryer Vent Measures
        function DryerVentMeasures(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkDryerVentMeasures_C.ClientID %>').checked = false;
                document.getElementById('<%= chkDryerVentMeasures_R.ClientID %>').checked = false;
                document.getElementById('<%= chkDryerVentMeasures_NA.ClientID %>').checked = false;

                CheckBox.checked = true;
            }
        }

        //Heating Filter Changed
        function HeatingFilterChanged(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkHeatingFilterChanged_C.ClientID %>').checked = false;
                document.getElementById('<%= chkHeatingFilterChanged_R.ClientID %>').checked = false;
                document.getElementById('<%= chkHeatingFilterChanged_NA.ClientID %>').checked = false;

                CheckBox.checked = true;
            }
        }
        //Heating Filter Cleaned

        function HeatingFilterCleaned(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkHeatingFilterCleaned_C.ClientID %>').checked = false;
                document.getElementById('<%= chkHeatingFilterCleaned_R.ClientID %>').checked = false;
                document.getElementById('<%= chkHeatingFilterCleaned_NA.ClientID %>').checked = false;

                CheckBox.checked = true;
            }
        }

        //Heating Filter Cleaned
        function HeatingFilterCleaned2(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkHeatingFilterCleaned2_C.ClientID %>').checked = false;
                document.getElementById('<%= chkHeatingFilterCleaned2_R.ClientID %>').checked = false;
                document.getElementById('<%= chkHeatingFilterCleaned2_NA.ClientID %>').checked = false;

                CheckBox.checked = true;
            }
        }


        function ACReplaced(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkACReplaced_C.ClientID %>').checked = false;
                document.getElementById('<%= chkACReplaced_R.ClientID %>').checked = false;
                document.getElementById('<%= chkACReplaced_NA.ClientID %>').checked = false;
                document.getElementById('<%= chkACReplaced_NR.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

    </script>

    <script type="text/javascript">
        function CalculateBaseLoad() {

            //For multiply and add Base Load by Type On Low1 KWH Hours
            var LivingRoom_CFLS = document.getElementById('<%=txtLivingRoom_CFLS.ClientID %>').value;
            LivingRoom_CFLS = parseInt(LivingRoom_CFLS);
            if (LivingRoom_CFLS != null && isNaN(LivingRoom_CFLS)) {
                LivingRoom_CFLS = 0;
                LivingRoom_CFLS = parseInt(LivingRoom_CFLS);
            }

            var FamilyRoomCFLS = document.getElementById('<%=txtFamilyRoomCFLS.ClientID %>').value;
            FamilyRoomCFLS = parseInt(FamilyRoomCFLS);
            if (FamilyRoomCFLS != null && isNaN(FamilyRoomCFLS)) {
                FamilyRoomCFLS = 0;
                FamilyRoomCFLS = parseInt(FamilyRoomCFLS);
            }



            //Kitchen CFLS
            var KitchenCFLS = document.getElementById('<%=txtKitchenCFLS.ClientID %>').value;
            KitchenCFLS = parseInt(KitchenCFLS);
            if (KitchenCFLS != null && isNaN(KitchenCFLS)) {
                KitchenCFLS = 0;
                KitchenCFLS = parseInt(KitchenCFLS);
            }


            // 4. Dining Room
            var DiningRoomCFLS = document.getElementById('<%=txtDiningRoomCFLS.ClientID %>').value;
            DiningRoomCFLS = parseInt(DiningRoomCFLS);
            if (DiningRoomCFLS != null && isNaN(DiningRoomCFLS)) {
                DiningRoomCFLS = 0;
                DiningRoomCFLS = parseInt(DiningRoomCFLS);
            }
            //Bedroom 1
            var BedRoom_1_CFLS = document.getElementById('<%=txtBedroom_1_CFLS.ClientID %>').value;
            BedRoom_1_CFLS = parseInt(BedRoom_1_CFLS);
            if (BedRoom_1_CFLS != null && isNaN(BedRoom_1_CFLS)) {
                BedRoom_1_CFLS = 0;
                BedRoom_1_CFLS = parseInt(BedRoom_1_CFLS);
            }

            //Bedroom 2
            var BedRoom_2_CFLS = document.getElementById('<%=txtBedroom_2_CFLS.ClientID %>').value;
            BedRoom_2_CFLS = parseInt(BedRoom_2_CFLS);
            if (BedRoom_2_CFLS != null && isNaN(BedRoom_2_CFLS)) {
                BedRoom_2_CFLS = 0;
                BedRoom_2_CFLS = parseInt(BedRoom_2_CFLS);
            }

            //Bedroom 3
            var BedRoom_3_CFLS = document.getElementById('<%=txtBedRoom_3_CFLS.ClientID %>').value;
            BedRoom_3_CFLS = parseInt(BedRoom_3_CFLS);
            if (BedRoom_3_CFLS != null && isNaN(BedRoom_3_CFLS)) {
                BedRoom_3_CFLS = 0;
                BedRoom_3_CFLS = parseInt(BedRoom_3_CFLS);
            }


            //Bath 1
            var Bath_1_CFLS = document.getElementById('<%=txtBath_1_CFLS.ClientID %>').value;
            Bath_1_CFLS = parseInt(Bath_1_CFLS);
            if (Bath_1_CFLS != null && isNaN(Bath_1_CFLS)) {
                Bath_1_CFLS = 0;
                Bath_1_CFLS = parseInt(Bath_1_CFLS);
            }
            //Bath 2
            var Bath_2_CFLS = document.getElementById('<%=txtBath_2_CFLS.ClientID %>').value;
            Bath_2_CFLS = parseInt(Bath_2_CFLS);
            if (Bath_2_CFLS != null && isNaN(Bath_2_CFLS)) {
                Bath_2_CFLS = 0;
                Bath_2_CFLS = parseInt(Bath_2_CFLS);
            }


            //Hallway CFLS
            var HallwayCFLS = document.getElementById('<%=txtHallwayCFLS.ClientID %>').value;
            HallwayCFLS = parseInt(HallwayCFLS);
            if (HallwayCFLS != null && isNaN(HallwayCFLS)) {
                HallwayCFLS = 0;
                HallwayCFLS = parseInt(HallwayCFLS);
            }


            //OutDoor CFLS
            var OutDoorCFLS = document.getElementById('<%=txtOutDoorCFLS.ClientID %>').value;
            OutDoorCFLS = parseInt(OutDoorCFLS);
            if (OutDoorCFLS != null && isNaN(OutDoorCFLS)) {
                OutDoorCFLS = 0;
                OutDoorCFLS = parseInt(OutDoorCFLS);
            }

            //Other CFLS
            var OtherCFLS = document.getElementById('<%=txtOtherCFLS.ClientID %>').value;
            OtherCFLS = parseInt(OtherCFLS);
            if (OtherCFLS != null && isNaN(OtherCFLS)) {
                OtherCFLS = 0;
                OtherCFLS = parseInt(OtherCFLS);
            }

            //Spare Max
            var SpareMax2CFLS = document.getElementById('<%=txtSpareMax2CFLS.ClientID %>').value;
            SpareMax2CFLS = parseInt(SpareMax2CFLS);
            if (SpareMax2CFLS != null && isNaN(SpareMax2CFLS)) {
                SpareMax2CFLS = 0;
                SpareMax2CFLS = parseInt(SpareMax2CFLS);
            }


            //Spare            
            var value = OtherCFLS + OutDoorCFLS + HallwayCFLS + Bath_1_CFLS + Bath_2_CFLS + BedRoom_1_CFLS + BedRoom_2_CFLS + BedRoom_3_CFLS + DiningRoomCFLS + KitchenCFLS + FamilyRoomCFLS + LivingRoom_CFLS + SpareMax2CFLS;
            value = parseInt(value);
            document.getElementById('<%=txtTotalCFLS.ClientID %>').innerHTML = OtherCFLS + OutDoorCFLS + HallwayCFLS + Bath_1_CFLS + Bath_2_CFLS + BedRoom_1_CFLS + BedRoom_2_CFLS + BedRoom_3_CFLS + DiningRoomCFLS + KitchenCFLS + FamilyRoomCFLS + LivingRoom_CFLS + SpareMax2CFLS;

            var val = navigator.userAgent.toLowerCase();
            if (val.indexOf("firefox") > -1) {
                var id = document.getElementById('<%=txtTotalCFLS.ClientID %>');
                id.innerHTML = value;
            }
            document.getElementById('<%=hdntotal.ClientID %>').value = value;
            document.getElementById('<%=txtTotalCFLS.ClientID %>').value = value;
        }
    </script>

    <script type="text/javascript">
        document.getElementById("Page3").setAttribute("class", "ui-selected");
    </script>

</asp:Content>
