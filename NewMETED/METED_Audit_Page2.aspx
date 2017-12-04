<%@ Page Language="C#" MasterPageFile="~/NewMETED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page2.aspx.cs" Inherits="METED_METED_Audit_Page2" Title="METED Audit Page2" %>

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
            margin-left: 10px;
        }
        input[type="checkbox"]
        {
            margin: 0 0 10px 10px;
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
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        6. Age of Occupants: Under Age 19:
                        <asp:TextBox ID="txt_Occupants_under19" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 80px;"></asp:TextBox>
                        Ages 19 to 62:
                        <asp:TextBox ID="txt_Occupants_19_to_62" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 80px;"></asp:TextBox>
                        Over 62:
                        <asp:TextBox ID="txt_Occupants_Over62" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 80px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        7. Occupancy Type:
                        <asp:RadioButton ID="rdo_Occupancy_Own" runat="server" GroupName="OccupancyType" />
                        1. Own
                        <asp:RadioButton ID="rdo_Occupancy_Rent" runat="server" GroupName="OccupancyType" />
                        2. Rent
                        <asp:RadioButton ID="rdo_Occupancy_Other" runat="server" GroupName="OccupancyType" />
                        99. Other
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td valign="top">
                                    8. Structure Type:
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_Structure_Story" runat="server" onclick="ChkBox_Structure(this.id)" />
                                    1. 1-1/2 Story or 2 Story
                                    <asp:CheckBox ID="chk_Structure_Ranch" runat="server" onclick="ChkBox_Structure(this.id)" />
                                    2. Ranch
                                    <asp:CheckBox ID="chk_Structure_Blevel" runat="server" onclick="ChkBox_Structure(this.id)" />
                                    3. Bi-level
                                    <asp:CheckBox ID="chk_Structure_Mobile" runat="server" onclick="ChkBox_Structure(this.id)" />
                                    4. Mobile Home
                                    <asp:CheckBox ID="chk_Structure_RowInside" runat="server" onclick="ChkBox_Structure(this.id)" />
                                    5. Row House (inside)
                                    <br />
                                    <asp:CheckBox ID="chk_Structure_RowOutside" runat="server" onclick="ChkBox_Structure(this.id)" />
                                    6. Row House (outside)
                                    <asp:CheckBox ID="chk_Structure_Duplex" runat="server" onclick="ChkBox_Structure(this.id)" />
                                    7. Duplex
                                    <asp:CheckBox ID="chk_Structure_Multi" runat="server" onclick="ChkBox_Structure(this.id)" />
                                    8. Multi Family
                                    <asp:CheckBox ID="chk_Structure_Other" runat="server" onclick="ChkBox_Structure(this.id)" />
                                    99. Other
                                    <asp:TextBox ID="txt_Structure_Other" runat="server" value="" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 80px;"></asp:TextBox><br />
                                    <asp:CheckBox ID="chk_Structure_Modular" runat="server" onclick="ChkBox_Structure(this.id)" />
                                    10. Manufactured, Modular Housing
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!--New task-->
                <tr id="tr_CunstructionType" runat="server">
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 17%" valign="top">
                                    9. Construction Type:
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdo_Cunstruction_Block" runat="server" GroupName="CunstructionType" />
                                    1.Block,concrete or log home with slab foundation and open joist attic
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodKnee" runat="server" GroupName="CunstructionType" />
                                    2.Wood frame home with full basement and knee wall attic
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodFull" runat="server" GroupName="CunstructionType" />
                                    3.Wood frame home with full basement and open joist attic
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodSpace" runat="server" GroupName="CunstructionType" />
                                    4.Wood frame home with combination crawl space/basement,open joist attic
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodCrawl" runat="server" GroupName="CunstructionType" />
                                    5.Wood frame home with crawl space and open joist attic<br />
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodPost" runat="server" GroupName="CunstructionType" />
                                    6.Wood frame home with post foundation and open joist attic
                                    <asp:RadioButton ID="rdo_Cunstruction_Mobile" runat="server" GroupName="CunstructionType" />
                                    7.Mobile home with post foundation
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodSlab" runat="server" GroupName="CunstructionType" />
                                    8.Wood frame home with slab foundation and open joist attic
                                    <asp:RadioButton ID="rdo_Cunstruction_Other" runat="server" GroupName="CunstructionType" />
                                    99.Other
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!--End Task-->
                <tr>
                    <td>
                        9 A. Year Constructed:
                        <asp:TextBox ID="txt_YearConstructed" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        10. Size of Electrically Heated Area:
                        <asp:TextBox ID="txt_ElectricallyHeatedArea" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;"></asp:TextBox>
                        sq. ft.
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="vertical-align: top;">
                                    11. Type of Air Conditioning:
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_AirConditioning_Central" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                    1. Central System
                                    <asp:CheckBox ID="chk_AirConditioning_HeatPump" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                    2. Heat Pump
                                    <asp:CheckBox ID="chk_AirConditioning_WindowUnits" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                    3. Window Units
                                    <asp:CheckBox ID="chk_AirConditioning_WallUnits" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                    4. Wall Units
                                    <asp:CheckBox ID="chk_AirConditioning_None" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                    5. None
                                    <br />
                                    <asp:CheckBox ID="chk_AirConditioning_Other" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                    99. Other
                                    <asp:TextBox ID="txt_AirConditioning_Other" runat="server" value="" Style="border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        border-left-style: none; border-left-color: inherit; border-left-width: medium; border-right-style: none; border-right-color: inherit; border-right-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        12. Number of Window or Wall AC Units:
                        <asp:TextBox ID="txt_WindoworWall" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        13. Number of Rooms Routinely Air Conditioned:
                        <asp:TextBox ID="txt_Rooms" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        14. Size of Area Cooled:
                        <asp:TextBox ID="txt_AreaCooled" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        sq. ft.
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 20%;" valign="top">
                                    15. Primary Heating Source:
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Electric" runat="server" GroupName="PrimaryHeatingSource" />
                                    1. Electric
                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_UtilityGas" runat="server" GroupName="PrimaryHeatingSource" />
                                    2. Utility Gas
                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_FuelOil" runat="server" GroupName="PrimaryHeatingSource" />
                                    3. Fuel Oil
                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Wood" runat="server" GroupName="PrimaryHeatingSource" />
                                    4. Wood
                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Coal" runat="server" GroupName="PrimaryHeatingSource" />
                                    5. Coal
                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Solar" runat="server" GroupName="PrimaryHeatingSource" />
                                    6. Solar
                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_CitySteam" runat="server" GroupName="PrimaryHeatingSource" />
                                    7. City Steam
                                    <br />
                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_BottelGas" runat="server" GroupName="PrimaryHeatingSource" />
                                    8. Bottled Gas/ Propane
                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Kerosene" runat="server" GroupName="PrimaryHeatingSource" />
                                    9. Kerosene
                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Other" runat="server" GroupName="PrimaryHeatingSource" />
                                    99. Other (please describe)
                                    <asp:TextBox ID="txt_PrimaryHeatingSource_Other" runat="server" value="" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 20%;" valign="top">
                                    16. Type of Heating System:
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricBaseboard" runat="server" GroupName="HeatingSystem" />
                                    1 Electric Baseboard
                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricHeatPump" runat="server" GroupName="HeatingSystem" />
                                    2. Electric Heat Pump
                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricBoiler" runat="server" GroupName="HeatingSystem" />
                                    3. Electric Boiler
                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricFurnace" runat="server" GroupName="HeatingSystem" />
                                    4. Electric Furnace
                                    <br />
                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricRadiant" runat="server" GroupName="HeatingSystem" />
                                    5. Electric Radiant
                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricWallBlowers" runat="server" GroupName="HeatingSystem" />
                                    6. Electric Wall Blowers
                                    <asp:RadioButton ID="rdo_HeatingSystem_GasFurnace" runat="server" GroupName="HeatingSystem" />
                                    7. Gas Furnace
                                    <asp:RadioButton ID="rdo_HeatingSystem_Gas_Boiler" runat="server" GroupName="HeatingSystem" />
                                    8. Gas Boiler
                                    <asp:RadioButton ID="rdo_HeatingSystem_OilFurnace" runat="server" GroupName="HeatingSystem" />
                                    9. Oil Furnace
                                    <br />
                                    <asp:RadioButton ID="rdo_HeatingSystem_OilBoiler" runat="server" GroupName="HeatingSystem" />
                                    10. Oil Boiler
                                    <asp:RadioButton ID="rdo_HeatingSystem_Other" runat="server" GroupName="HeatingSystem" />
                                    99. Other (please describe)
                                    <asp:TextBox ID="txt_HeatingSystem_Other" runat="server" value="" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 35%;" valign="top">
                                    17. What is the <u>Main</u> Source of Supplemental Heat?
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdo_SupplementalHeat_None" runat="server" GroupName="SupplementalHeat" />
                                    00. None
                                    <asp:RadioButton ID="rdo_SupplementalHeat_FuelOil" runat="server" GroupName="SupplementalHeat" />
                                    1. Fuel Oil/Kerosene
                                    <asp:RadioButton ID="rdo_SupplementalHeat_UtilityGas" runat="server" GroupName="SupplementalHeat" />
                                    2. Utility Gas
                                    <asp:RadioButton ID="rdo_SupplementalHeat_BottleGas" runat="server" GroupName="SupplementalHeat" />
                                    3. Bottled Gas/Propane
                                    <br />
                                    <asp:RadioButton ID="rdo_SupplementalHeat_Electricity" runat="server" GroupName="SupplementalHeat" />
                                    4. Electricity
                                    <asp:RadioButton ID="rdo_SupplementalHeat_Coal" runat="server" GroupName="SupplementalHeat" />
                                    5. Coal
                                    <asp:RadioButton ID="rdo_SupplementalHeat_CitySteam" runat="server" GroupName="SupplementalHeat" />
                                    6. City Steam
                                    <asp:RadioButton ID="rdo_SupplementalHeat_Wood" runat="server" GroupName="SupplementalHeat" />
                                    7. Wood
                                    <asp:RadioButton ID="rdo_SupplementalHeat_Solar" runat="server" GroupName="SupplementalHeat" />
                                    8. Solar
                                    <br />
                                    <asp:RadioButton ID="rdo_SupplementalHeat_PelletStove" runat="server" GroupName="SupplementalHeat" />
                                    <span id="spn_PelletStove" runat="server">9. Pellet Stove</span>
                                    <asp:RadioButton ID="rdo_SupplementalHeat_SpaceHeater" runat="server" GroupName="SupplementalHeat" />
                                    <span id="spn_SpaceHeater" runat="server">10. Electric Space Heater
                                        <br />
                                    </span>
                                    <asp:RadioButton ID="rdo_SupplementalHeat_Other" runat="server" GroupName="SupplementalHeat" />
                                    99. Other (please describe)
                                    <asp:TextBox ID="txt_SupplementalHeat_Other" runat="server" value="" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        18. What is the Contribution of the <u>Main</u> Supplemental Heat Source to the
                        Total Household Heating?
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rdo_HouseholdHeating_TotallyHeated" runat="server" GroupName="ContributionSupplementalHeat" />
                        1. Totally heated by suppl source
                        <asp:RadioButton ID="rdo_HouseholdHeating_MostHtg" runat="server" GroupName="ContributionSupplementalHeat" />
                        2. Most htg (at least half) from suppl source
                        <asp:RadioButton ID="rdo_HouseholdHeating_LessThanHalf" runat="server" GroupName="ContributionSupplementalHeat" />
                        3. Less than half of htg from suppl source
                        <br />
                        <asp:RadioButton ID="rdo_HouseholdHeating_SupplementalHeatSeldom" runat="server"
                            GroupName="ContributionSupplementalHeat" />
                        4. Supplemental heat seldom used
                        <asp:RadioButton ID="rdo_HouseholdHeating_SupplHeat" runat="server" GroupName="ContributionSupplementalHeat" />
                        5. Suppl heat is present but never used
                        <asp:RadioButton ID="rdo_HouseholdHeating_NotSupplementalHeat" runat="server" GroupName="ContributionSupplementalHeat" />
                        6. Supplemental heat is not present
                        <br />
                        <asp:RadioButton ID="rdo_HouseholdHeating_other" runat="server" GroupName="ContributionSupplementalHeat" />
                        99. Other
                        <%--(please describe)--%>
                        <asp:TextBox ID="txt_HouseholdHeating_Other" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 300px;"></asp:TextBox>
                        Location:
                        <asp:TextBox ID="txt_Location" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 25%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <!--New Task-->
                <tr id="tr_electricSpaceHeater" runat="server">
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 40%;" valign="top">
                                    18 A. Why are they using the electric space heater?
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_SpaceHeater_NoHeat" runat="server" onclick="ChkBox_electricSpaceHeater(this.id)" />
                                    &nbsp;No Heat
                                    <asp:CheckBox ID="chk_SpaceHeater_notWork" runat="server" onclick="ChkBox_electricSpaceHeater(this.id)" />
                                    &nbsp;Heating System does not work
                                    <asp:CheckBox ID="chk_SpaceHeater_AdditionalHeat" runat="server" onclick="ChkBox_electricSpaceHeater(this.id)" />
                                    &nbsp;Using as Additional Heat
                                    <asp:CheckBox ID="chk_SpaceHeater_Other" runat="server" onclick="ChkBox_electricSpaceHeater(this.id)" />
                                    &nbsp;Other
                                    <asp:TextBox ID="txt_SpaceHeater_Other" runat="server" value="" Style="border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        border-left-style: none; border-left-color: inherit; border-left-width: medium; border-right-style: none; border-right-color: inherit; border-right-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!--End Task-->
                <tr>
                    <td>
                        19. How many unblocked fireplaces are present in the customer's dwelling?<asp:TextBox
                            ID="txt_unblockedFireplaces" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>(Enter
                        actual number; enter "0" if none.)
                    </td>
                </tr>
                <tr>
                    <td>
                        20. Water Heater Fuel Type:
                        <asp:RadioButton ID="rdo_FuelType_Electric" runat="server" GroupName="FuelType" />
                        1. Electric
                        <asp:RadioButton ID="rdo_FuelType_FuelOil" runat="server" GroupName="FuelType" />
                        2. Fuel Oil
                        <asp:RadioButton ID="rdo_FuelType_UtilityGas" runat="server" GroupName="FuelType" />
                        3. Utility Gas
                        <asp:RadioButton ID="rdo_FuelType_BottelGas" runat="server" GroupName="FuelType" />
                        4. Bottled Gas/Propane
                        <asp:RadioButton ID="rdo_FuelType_Other" runat="server" GroupName="FuelType" />
                        99. Other
                        <asp:TextBox ID="txt_FuelType_Other" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        21. Dryer Type:
                        <asp:CheckBox ID="chk_Electric" runat="server" onclick="ChkBox_DrayerType(this.id)" />
                        Electric
                        <asp:CheckBox ID="chk_Gas" runat="server" onclick="ChkBox_DrayerType(this.id)" />
                        Gas
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 10px 0;">
                            <td valign="top" style="width: 10%;">
                                <p style="vertical-align: middle; float: left; padding-left: 4px;">
                                    Comment:</p>
                                <asp:TextBox ID="txt_Comments" runat="server" Rows="5" Columns="90" TextMode="MultiLine"></asp:TextBox>
                </tr>
            </table>
        </div>
    </div>
    <!--newtable end-->

    <script type="text/javascript">

        $(function() {
            document.getElementById('Page2').classList.add("ui-selected");
        });
    </script>

    <script type="text/javascript">
        function ChkBox_Structure(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_Structure_Modular.ClientID %>').checked = false;
                document.getElementById('<%=chk_Structure_Story.ClientID %>').checked = false;
                document.getElementById('<%=chk_Structure_Ranch.ClientID %>').checked = false;
                document.getElementById('<%=chk_Structure_Blevel.ClientID %>').checked = false;
                document.getElementById('<%=chk_Structure_Mobile.ClientID %>').checked = false;
                document.getElementById('<%=chk_Structure_RowInside.ClientID %>').checked = false;
                document.getElementById('<%=chk_Structure_RowOutside.ClientID %>').checked = false;
                document.getElementById('<%=chk_Structure_Duplex.ClientID %>').checked = false;
                document.getElementById('<%=chk_Structure_Multi.ClientID %>').checked = false;
                document.getElementById('<%=chk_Structure_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function ChkBox_AirConditioning(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_AirConditioning_Central.ClientID %>').checked = false;
                document.getElementById('<%=chk_AirConditioning_HeatPump.ClientID %>').checked = false;
                document.getElementById('<%=chk_AirConditioning_WindowUnits.ClientID %>').checked = false;
                document.getElementById('<%=chk_AirConditioning_WallUnits.ClientID %>').checked = false;
                document.getElementById('<%=chk_AirConditioning_None.ClientID %>').checked = false;
                document.getElementById('<%=chk_AirConditioning_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }

        }
        function ChkBox_DrayerType(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_Electric.ClientID %>').checked = false;
                document.getElementById('<%=chk_Gas.ClientID %>').checked = false;
                CheckBox.checked = true;
            }

        }

        function ChkBox_electricSpaceHeater(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_SpaceHeater_NoHeat.ClientID %>').checked = false;
                document.getElementById('<%=chk_SpaceHeater_notWork.ClientID %>').checked = false;
                document.getElementById('<%=chk_SpaceHeater_AdditionalHeat.ClientID %>').checked = false;
                document.getElementById('<%=chk_SpaceHeater_Other.ClientID %>').checked = false;
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
