<%@ Page Language="C#" MasterPageFile="~/PPLAudit/PPLMasterPage.master" AutoEventWireup="true"
    CodeFile="PPL_Audit_5.aspx.cs" Inherits="PPLAudit_PPL_Audit_5" Title="PPL Audit-5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="fontbold">
        <div id="DivPrint">
            <h2 style="text-decoration: underline; text-align: left;">
                Low Cost Section</h2>
            <br />
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td align="center">
                        <h3 style="margin: 0; padding: 0;">
                            WRAP: Water Heating Assessment
                        </h3>
                    </td>
                </tr>
            </table>
            <br />
            <h3 align="left">
                I. Customer/Premise Information - Completed by PPL</h3>
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        Name:<asp:TextBox ID="txtCustomer_name" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 30%;" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        Case#:
                        <asp:TextBox ID="txtCustomer_case" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 30%;" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Address:
                        <asp:TextBox ID="txtCustomer_address" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 300px; font-weight: normal; color: rgb(0, 0, 0);" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        Phone#(home):
                        <asp:TextBox ID="txtCustomer_Homephone" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 30%;" ReadOnly="true"></asp:TextBox><br />
                        Phone#(other):<asp:TextBox ID="txtCustomer_Otherphone" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 30%;" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    Type of Water Heater:
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="CheckBoxList_typeofwater" runat="server" RepeatDirection="Horizontal"
                                        CellSpacing="0" CellPadding="0" Width="100%">
                                        <asp:ListItem Value="1"> Electric</asp:ListItem>
                                        <asp:ListItem Value="2"> Natural Gas</asp:ListItem>
                                        <asp:ListItem Value="3"> Propane</asp:ListItem>
                                        <asp:ListItem Value="4"> Oil</asp:ListItem>
                                        <asp:ListItem Value="5"> Solar</asp:ListItem>
                                        <%--onclick="typeofwater(this)"--%>
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    Occupancy:
                                </td>
                                <td>
                                    <%-- <asp:CheckBoxList ID="CheckBoxList_occupancy" runat="server" RepeatDirection="Horizontal"
                                        CellSpacing="0" CellPadding="0" Width="100%" Enabled="false">
                                        <asp:ListItem Value="O"> HomeOwner</asp:ListItem>
                                        <asp:ListItem Value="T"> Renter</asp:ListItem>
                                    </asp:CheckBoxList>--%>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="chkHomeOwner" runat="server" Enabled="false" />
                                                HomeOwner
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkRenter" runat="server" Enabled="false" />Renter
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    Number of Occupants:
                                    <asp:TextBox ID="txt_numberof_Occupants" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0);" ReadOnly="true" Width="15%"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    Landlord information, if applicable
                                </td>
                                <td>
                                    Name:
                                    <asp:TextBox ID="txtLandlordName" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 75%;" ReadOnly="true"></asp:TextBox>
                                </td>
                                <td>
                                    Phone:
                                    <asp:TextBox ID="txtLandLordPhone" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 65%;" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--  <tr><td colspan="2">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr><td>
  Existing Water Temperature <asp:TextBox ID="txtExistingWaterTemp" runat="server" CssClass="txt_Deg"></asp:TextBox> </td>	<td>	 Does the home have a dishwasher w/o a heater?	</td>	<td> <asp:CheckBox ID="chkDishWaterHeaterYes" runat="server" Text=" Yes" onclick="DishWaterHeater(this.id)" /> &nbsp;&nbsp; <asp:CheckBox ID="chkDishWaterHeaterNo" runat="server" Text=" No" onclick="DishWaterHeater(this.id)" />
   </td></tr>
  </table>
  </td></tr>--%>
                <tr>
                    <td colspan="2" align="center">
                        <h3>
                            If the home does not have an electric water heater, discontinue assessment.</h3>
                    </td>
                </tr>
            </table>
            <br />
            <h3 align="left">
                II. Existing Water Heater Information</h3>
            <table border="0" cellpadding="0" cellspacing="10">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td colspan="2">
                                    <table>
                                        <tr>
                                            <td style="width: 250px;">
                                                Is Permit required to perform work?
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="ChkPermitRequireYes" runat="server" Text="Yes" Width="70px" onclick="PermitRequire(this.id)" />
                                                <asp:CheckBox ID="ChkPermitRequireNo" runat="server" Text="No" onclick="PermitRequire(this.id)" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Number of Gallons
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="CheckBoxList_numberofgallons" runat="server" RepeatDirection="Horizontal"
                                        CellSpacing="0" CellPadding="5" Width="100%">
                                        <asp:ListItem Value="1" onclick="SelectOneChkList(this)"> <40 Gal. </asp:ListItem>
                                        <asp:ListItem Value="2" onclick="SelectOneChkList(this)"> 40 Gal. </asp:ListItem>
                                        <asp:ListItem Value="3" onclick="SelectOneChkList(this)"> 50-55 Gal.</asp:ListItem>
                                        <asp:ListItem Value="4" onclick="SelectOneChkList(this)"> 80 Gal. </asp:ListItem>
                                        <asp:ListItem Value="5" onclick="SelectOneChkList(this)"> 120 Gal.</asp:ListItem>
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Age of Water Heater
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkAgeOfWater0to6" runat="server" onclick="AgeOfWaterHeater(this.id)" />
                                    &nbsp;0 to 6 years
                                    <asp:CheckBox ID="chkAgeOfWater7Year" runat="server" onclick="AgeOfWaterHeater(this.id)" />
                                    &nbsp; 7 years or older (recommend replacement)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Manufacturer
                                    Date:&nbsp;<asp:TextBox ID="txt_ManufacturerDate" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 10%;"></asp:TextBox>(Year)
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    Condition of Water Heater
                                </td>
                                <td>
                                    <br />
                                    <asp:CheckBox ID="ConditionOfWaterHeaterGood" runat="server" onclick="ConditionOfWater(this.id)" />
                                    &nbsp; Good &nbsp;
                                    <asp:CheckBox ID="ConditionOfWaterHeaterLeakingOrCorroded" runat="server" onclick="ConditionOfWater(this.id)" />
                                    &nbsp; leaking or corroded &nbsp;
                                    <asp:CheckBox ID="ConditionOfWaterHeaterBadThermostate" runat="server" onclick="ConditionOfWater(this.id)" />
                                    &nbsp; Bad element &nbsp;
                                    <asp:CheckBox ID="ConditionOfWaterHeaterBadElement" runat="server" onclick="ConditionOfWater(this.id)" />Bad
                                    thermostate
                                </td>
                            </tr>
                        </table>
                    </td>
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td>
                                        Existing Water Temperature
                                        <asp:TextBox ID="txtExistingWaterTemp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 17%;" Width="100px"></asp:TextBox>
                                    </td>
                                    <td>
                                        Is there a dishwasher?
                                        <asp:CheckBox ID="chkDishWaterHeaterYes" runat="server" Text=" Yes" onclick="DishWaterHeater(this.id)" />
                                        &nbsp;&nbsp;
                                        <asp:CheckBox ID="chkDishWaterHeaterNo" runat="server" Text=" No" onclick="DishWaterHeater(this.id)" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tr>
                <%--<tr>
          <td>
             <table width="100%" border="0" cellspacing="5" cellpadding="5">
                  <tr>
                    <td>Age of Water Heater</td>
                    <td>
                    <asp:CheckBox ID="chkAgeOfWater0to6" runat="server" onclick="AgeOfWaterHeater(this.id)" />  &nbsp;0 to 6 years 
                     <asp:CheckBox ID="chkAgeOfWater7Year" runat="server" onclick="AgeOfWaterHeater(this.id)" />  &nbsp; 7 years or older (recommend replacement) 
                    </td>
                  </tr>
                  <tr>
                  <td>
                  Condition of Water Heater	  </td>
                    <td> <asp:CheckBox ID="ConditionOfWaterHeaterGood" runat="server" onclick="ConditionOfWater(this.id)" /> &nbsp; Good &nbsp; <asp:CheckBox ID="ConditionOfWaterHeaterLeakingOrCorroded" runat="server" onclick="ConditionOfWater(this.id)" /> &nbsp; leaking or corroded	&nbsp; <asp:CheckBox ID="ConditionOfWaterHeaterBadThermostate" runat="server" onclick="ConditionOfWater(this.id)" /> &nbsp; bad element/thermostate
                  </td>
                  </tr>
               </table>  
          </td>
      </tr>--%>
                <%--<tr>
          <td>If older then 10 years,reason for not replacing? <input type="text" class="txt_below" /></td>
      </tr>
      <tr>
          <td>
               <table width="100%" border="0" cellspacing="5" cellpadding="5">
                  <tr>
                    <td>Water supply : &nbsp; &nbsp;<asp:CheckBox ID="chkWaterSupplycity" runat="server" Text=" City" onclick="WaterSupply(this.id)" /> &nbsp; &nbsp; <asp:CheckBox ID="chkWaterSupplyWell" runat="server" Text=" Well"  onclick="WaterSupply(this.id)" /></td>
                    <td>Expansion tank : &nbsp; &nbsp; <asp:CheckBox ID="chkWaterSupplyExpansionYes" runat="server" Text=" Yes" onclick="SupplyExpansion(this.id)" />  &nbsp; &nbsp; <asp:CheckBox ID="chkWaterSupplyExpansionNo" runat="server" Text=" No" onclick="SupplyExpansion(this.id)" /> </td>
                  </tr>
               </table>
          </td>
      </tr>
      <tr>
           <td>If city water, does the water heater have a check value: 1 &nbsp; &nbsp; <asp:CheckBox ID="chk_citywater_checkValue1_yes" runat="server" Text=" Yes" onclick="WaterHeaterCheckValue(this.id)" />  &nbsp; &nbsp; <asp:CheckBox ID="chk_citywater_CheckValue1_Unknown" runat="server" Text=" Unknown"  onclick="WaterHeaterCheckValue(this.id)" /></td>
      </tr>
      <tr>
           <td>Is water heater leaking or corroded? &nbsp; &nbsp; <asp:CheckBox ID="chk_heaterwater_leakingCorroded_yes" runat="server" Text=" Yes" onclick="leakingCorroded(this.id)" />  &nbsp; &nbsp;<asp:CheckBox ID="chk_heaterwater_leakingCorroded_no" runat="server" Text=" No"  onclick="leakingCorroded(this.id)"  /> </td>
      </tr>
      <tr>
           <td>Did you change the water temperature? <asp:CheckBox ID="chk_Changewatertemp_yes" runat="server" Text=" Yes" onclick="ChangeWaterTemperature(this.id)" />&nbsp; &nbsp;<asp:CheckBox ID="chk_Changewatertemp_no" runat="server" Text=" No"  onclick="ChangeWaterTemperature(this.id)" />&nbsp;&nbsp;Original <asp:TextBox ID="txtWaterHeater_orignal" runat="server" CssClass="txt_Deg"></asp:TextBox> Deg.&nbsp;&nbsp;&nbsp;&nbsp; Current <asp:TextBox ID="txtWaterHeater_Currentdeg" runat="server" CssClass="txt_Deg"></asp:TextBox> Deg.</td>
      </tr>
      <tr>
           <td>Recommend Water Heater Replacement? &nbsp; &nbsp; <asp:CheckBox ID="chk_Waterheaterreplace_yes" runat="server" Text=" Yes" onclick="Waterheaterreplace(this.id)" />  &nbsp; &nbsp;<asp:CheckBox ID="chk_Waterheaterreplace_no" runat="server" Text=" No"  onclick="Waterheaterreplace(this.id)" /> &nbsp; &nbsp;  Replacement Size <asp:TextBox ID="txt_gal" runat="server" CssClass="txt_name"></asp:TextBox> Gal.</td>
      </tr>
      <tr>
           <td>Supply: &nbsp; &nbsp;  <asp:CheckBox ID="chk_cooper" runat="server" Text=" Cooper" />  &nbsp; &nbsp; <asp:CheckBox ID="chk_PVC" runat="server" Text=" PVC" />   
           &nbsp; &nbsp; 30Amp-Amp breaker? &nbsp; &nbsp;  <asp:CheckBox ID="chk_30amp_breaker_yes" runat="server" Text=" yes" onclick="ThirtyAmpBreaker(this.id)" />  &nbsp; &nbsp; <asp:CheckBox ID="chk_30amp_breaker_no" runat="server" Text=" No" onclick="ThirtyAmpBreaker(this.id)" /> &nbsp; &nbsp;  Brand <input type="text" class="txt_name" /> 10-2 wire? <asp:CheckBox ID="chk_10to2wire_yes" runat="server" Text=" yes" onclick="TenToTwowire(this.id)"/>&nbsp; &nbsp; <asp:CheckBox ID="chk_10to2wire_no" runat="server" Text=" No" onclick="TenToTwowire(this.id)" /></td>
      </tr>--%>
            </table>
            <%--<br /> <h3>III.  Other Recommended Water Heating Measures</h3>--%>
            <%--<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td>Water Heater Repair</td>
    <td><asp:CheckBox ID="chk_WaterheaterRepair_yes" runat="server" Text=" yes" onclick="WaterHeaterRepair(this.id)" /> </td>
    <td><asp:CheckBox ID="chk_WaterheaterRepair_No" runat="server" Text=" No"  onclick="WaterHeaterRepair(this.id)" /></td>
    <td>Explain:<asp:TextBox ID="txt_WaterheaterRepairExplain" runat="server" CssClass="txt_below"></asp:TextBox></td>
  </tr>
  <tr>
    <td>Repair Water Leaks</td>
    <td><asp:CheckBox ID="chk_RepairWaterleak_yes" runat="server" Text=" yes" onclick="RepairWaterLeaks(this.id)" /> </td>
    <td><asp:CheckBox ID="chk_RepairWaterleak_No" runat="server" Text=" No" onclick="RepairWaterLeaks(this.id)" /></td>
    <td>Location: <asp:TextBox ID="txt_RepairWaterleaklocation" runat="server" CssClass="txt_below"></asp:TextBox> </td>
  </tr>
  <tr>
    <td>Low Flow Showerheads</td>
    <td><asp:CheckBox ID="chk_LowFlowShowerheads_yes" runat="server" Text=" yes"  onclick="LowFlowShowerheads(this.id)" /> </td>
    <td><asp:CheckBox ID="chk_LowFlowShowerheads_no" runat="server" Text=" No"  onclick="LowFlowShowerheads(this.id)" /></td>
    <td>Location: <asp:TextBox ID="txt_LowFlowShowerheads_location" runat="server" CssClass="txt_below"></asp:TextBox> </td>
  </tr>
  <tr>
    <td>Aerator(s)</td>
    <td><asp:CheckBox ID="chk_Aerator_yes" runat="server" Text=" yes" onclick="Aerator(this.id)" /> </td>
    <td><asp:CheckBox ID="chk_Aerator_no" runat="server" Text=" No" onclick="Aerator(this.id)" /></td>
    <td>Location: <asp:TextBox ID="txt_AeratorLocation" runat="server" CssClass="txt_below"></asp:TextBox> </td>
  </tr>
  <tr>
    <td>Water Pipe Insulation</td>
    <td><asp:CheckBox ID="chk_WaterPipeInsulation_yes" runat="server" Text=" yes" onclick="WaterPipeInsulation(this.id)" /> </td>
    <td><asp:CheckBox ID="chk_WaterPipeInsulation_no" runat="server" Text=" No" onclick="WaterPipeInsulation(this.id)" /></td>
    <td>Size: <asp:TextBox ID="txtWaterPipeInsulation_size" runat="server" CssClass="txt_size"></asp:TextBox>Feet: <asp:TextBox ID="txtWaterPipeInsulation_feet" runat="server" CssClass="txt_size"></asp:TextBox></td>
  </tr>
</table>--%>
            <br />
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td align="center">
                        <h3>
                            IF WATER HEATER IS LESS THAN 7 YEARS OLD, AND IS NOT LEAKING/CORREDED, GO TO SECTION
                            V.</h3>
                    </td>
                </tr>
            </table>
            <h3 align="left">
                <b style="font-size: 16px;">III. HEAT PUMP WATER HEATER (HPWH) </b>(If the response
                is No for question 1 through 5,do not recommend a HPWH.)
            </h3>
            <%--- Homeowners
        or Renters (with Landlord Participation)
        <br />
        <i style="font-size: 14px;">soon as you repond "No" to any of the questions below, go
            to Section IV.</i>--%>
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <%-- <tr>
                <td colspan="3">
                    Can you locate the HPWH near an existing floor drain or line/pump that is no higher
                    than 3" above the floor, or can you run the
                </td>
            </tr>--%>
                <tr>
                    <td>
                        <%--At least two occupants or usage justifies 12-year payback?--%>
                        1.&nbsp;&nbsp; Will HPWH be placed in an area where air temperature is above 45
                        degrees?
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAtLeast2OccupantY" runat="server" Text=" yes" onclick="chkAtLeastTwoOccupant(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAtLeast2OccupantN" runat="server" Text=" No" onclick="chkAtLeastTwoOccupant(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <%--Does home have a basement area that is at least 45 degrees with no dirt floor?--%>
                        2.&nbsp;&nbsp; Is there adequate space for the HPWH?
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_IsBasement_yes" runat="server" Text=" yes" onclick="basement(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_IsBasement_no" runat="server" Text=" No" onclick="basement(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <%--condensate line from the HPWH to the existing drain?--%>
                        3.&nbsp;&nbsp; Are plumbing and electrical systems in good condition?
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_CondensateLineHPWHY" runat="server" Text=" yes" onclick="CondensateLineHPWH(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_CondensateLineHPWHN" runat="server" Text=" No" onclick="CondensateLineHPWH(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 75%">
                        <%--Can you locate the HPWH in an unconfined space that is at least:--%>
                        4.&nbsp;&nbsp; Is customer willing and able to adjust HPWH settings and replace
                        filter?
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_HPWH10by10by84Y" runat="server" Text=" yes" onclick="HPWHTenbyEighty(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_HPWH10by10by84N" runat="server" Text=" No" onclick="HPWHTenbyEighty(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        5.&nbsp;&nbsp; Does customer agree to the installation and required maintenance
                        and replacement of filter?
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_HomePlumbingUse_yes" runat="server" Text=" yes" onclick="HomePlumbingUse(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_HomePlumbingUse_no" runat="server" Text=" No" onclick="HomePlumbingUse(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        6.&nbsp;&nbsp; Can HPWH be placed near existing floor drain,no higher than 3" above
                        floor
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_ConsistentUsageHabits_yes" runat="server" Text=" yes" onclick="ConsistentUsageHabits(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_ConsistentUsageHabits_no" runat="server" Text=" No" onclick="ConsistentUsageHabits(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        7.&nbsp;&nbsp; Is there room for a condensate pump?
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_CleanHPWHFilter_yes" runat="server" Text=" yes" onclick="CleanHPWHFilter(this.id)" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_CleanHPWHFilter_no" runat="server" Text=" No" onclick="CleanHPWHFilter(this.id)" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        &nbsp;<asp:CheckBox ID="chk_CondensatePump" runat="server" onclick="AmpBreaker_(this.id)" />
                        Condensate pump&nbsp;&nbsp;
                        <asp:CheckBox ID="chk_10_2wire_yes" runat="server" onclick="AmpBreaker_(this.id)" />&nbsp;&nbsp;
                        Expansion tank
                        <asp:CheckBox ID="chk_AmpBreaker_yes" runat="server" onclick="AmpBreaker_(this.id)" />
                        30 amp breaker? &nbsp;&nbsp;
                        <asp:CheckBox ID="chk_AmpBreaker_no" runat="server" onclick="AmpBreaker_(this.id)" />
                        10/2 wire&nbsp;&nbsp;
                        <asp:CheckBox ID="chk_10_2wire_no" runat="server" onclick="AmpBreaker_(this.id)" />&nbsp;&nbsp;
                        Other &nbsp;
                        <asp:TextBox ID="txtHeatPumpWaterHeaterComment" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal; color: rgb(0, 0, 0);"
                            Width="90%"></asp:TextBox>
                    </td>
                </tr>
                <%--<tr>
                    <td colspan="3">--%>
                <%--Is the diameter of the drain pipe at least 3"?--%>Other:
                <%-- </td>--%>
                <%--<td>
                    <asp:CheckBox ID="chk_diameterDrainPipe_yes" runat="server" Text=" yes" onclick="diameterDrainPipe(this.id)" />
                </td>
                <td>
                    <asp:CheckBox ID="chk_diameterDrainPipe_no" runat="server" Text=" No" onclick="diameterDrainPipe(this.id)" />
                    
                     function diameterDrainPipe(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_diameterDrainPipe_yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_diameterDrainPipe_no.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
                </td>--%>
                <%-- </tr>--%>
                <%--<tr>
    <td colspan="3">
         <table width="100%" border="none" cellpadding="5" cellspacing="0">
               <tr>
                    <td><span>Recommend GFX?</span>	</td>
                    <td><asp:CheckBox ID="chk_RecommendSgfx_yes" runat="server" Text=" yes" onclick="RecommendGFX(this.id)" /> , S GFX (drain pipe close to cold water supply or water heater)</td>
               </tr>
               <tr>
                    <td></td>
                    <td><asp:CheckBox ID="chk_RecommendGgfx_yes" runat="server" Text=" yes" onclick="RecommendGFX(this.id)" /> , G GFX(drain pipe close to shower) &nbsp; &nbsp; <asp:CheckBox ID="chk_Recommendgfx_no" runat="server" Text=" No"  onclick="RecommendGFX(this.id)" /></td>
               </tr>
         </table>
    </td>
  </tr>--%>
                <tr>
                    <td colspan="3">
                        <br />
                        <br />
                        <table width="100%" border="0" cellpadding="5" cellspacing="0">
                            <tr>
                                <td style="width: 160px;">
                                    <%-- <h3>
                                    Recommend HPWH?</h3>--%>
                                    <strong><b>Recommend HPWH?</b></strong>
                                </td>
                                <td style="width: 100px">
                                    <asp:CheckBox ID="chk_RecommendHPWHY" runat="server" Text=" Yes" onclick="RecommendHPWH(this.id)" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_RecommendHPWHN" runat="server" Text=" No" onclick="RecommendHPWH(this.id)" />&nbsp;&nbsp;&nbsp;&nbsp;Reason:&nbsp;&nbsp;
                                    <asp:DropDownList ID="DDL_RecommendHPWH_reason" runat="server" Width="35%">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Area does not maintain 44 degree temp." Value="1"></asp:ListItem>
                                        <asp:ListItem Text="There is no adequate space." Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Plumbing and electrical system is not in good condition" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Customer is not willing or cannot adjust to HPWH responsibilities"
                                            Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Customer does not agree to required Installation and/or Maintenance"
                                            Value="5"></asp:ListItem>
                                        <asp:ListItem Text="HPWH cannot be placed near existing drain" Value="6"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" style="font-size: 13px;">
                                    <b>If "no",Remember to select majaor reason from list on Web Based Job Ticket and complete
                                        section IV.</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- <h3>
                                    If yes, size?</h3>--%>
                                    <strong style="font-size: larger;"><b>If yes, size?</b></strong>
                                </td>
                                <td>
                                    <%--<asp:CheckBox ID="RecommendHPWHSize40to50Gallon" runat="server" Text=" 40-50 gallon"
                                        onclick="RecommendHPWHSize(this.id)" />--%>
                                    <asp:TextBox ID="txt_Gallon" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 50%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>gallons
                                </td>
                                <td>
                                    <%--<asp:CheckBox ID="RecommendHPWHSize60to80Gallon" runat="server" Text=" 60-80 gallon"
                                        onclick="RecommendHPWHSize(this.id)" />--%>Brand,(if known)
                                    <asp:TextBox ID="txt_BrandIfKnown" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 12%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    EF,(if known)
                                    <asp:TextBox ID="txt_EFIfKnown" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 12%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <%--<h3>
                                    Go to section VI.</h3>--%>
                                    <strong style="font-size: larger;"><b>Go to section VI.</b></strong>
                                    <br />
                                    <br />
                                    Comment:
                                    <asp:TextBox ID="txtCommentSection" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 90%; font-weight: normal; color: rgb(0, 0, 0);" Width="85%"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div class="top_links" runat="server" id="TopBtnDiv">
            <b><span id="spnFinal" runat="server" style="color: Red; font-size: medium;"></span>
            </b>
            <br />
            <asp:Button ID="btnUpdate" runat="server" Text="Save" OnClick="btnUpdate_Click" class="top_btn" />
            &nbsp;&nbsp;
            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click"
                class="top_btn" />&nbsp;&nbsp;
            <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
        </div>
        <%--<br /> <h3>V. Solar Site Qualification Information-Preliminary</h3>
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td >As soon as you respond "No" to any of the question below, please go to Section VII.</td>
  </tr>
  <tr>
  <td align="center">
  <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" onclick="btnUpdate_Click" />
  </td>
  </tr>
</table>--%>
    </div>

    <script type="text/javascript">

        $(function () {
            document.getElementById('Page5').classList.add("ui-selected");
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

        function AgeOfWaterHeater(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkAgeOfWater0to6.ClientID %>').checked = false;
                document.getElementById('<%= chkAgeOfWater7Year.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function HomePlumbingUse(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_HomePlumbingUse_yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_HomePlumbingUse_no.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function basement(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_IsBasement_yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_IsBasement_no.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function CleanHPWHFilter(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_CleanHPWHFilter_yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_CleanHPWHFilter_no.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }



        function AmpBreaker_(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_CondensatePump.ClientID %>').checked = false;
                document.getElementById('<%= chk_10_2wire_yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_AmpBreaker_yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_AmpBreaker_no.ClientID %>').checked = false;
                document.getElementById('<%= chk_10_2wire_no.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function ConsistentUsageHabits(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_ConsistentUsageHabits_yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_ConsistentUsageHabits_no.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }




        function DishWaterHeater(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkDishWaterHeaterNo.ClientID %>').checked = false;
                document.getElementById('<%= chkDishWaterHeaterYes.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function CondensateLineHPWH(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_CondensateLineHPWHY.ClientID %>').checked = false;
                document.getElementById('<%= chk_CondensateLineHPWHN.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function HPWHTenbyEighty(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_HPWH10by10by84N.ClientID %>').checked = false;
                document.getElementById('<%= chk_HPWH10by10by84Y.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function RecommendHPWH(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_RecommendHPWHN.ClientID %>').checked = false;
                document.getElementById('<%= chk_RecommendHPWHY.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function ConditionOfWater(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ConditionOfWaterHeaterGood.ClientID %>').checked = false;
                document.getElementById('<%= ConditionOfWaterHeaterLeakingOrCorroded.ClientID %>').checked = false;
                document.getElementById('<%= ConditionOfWaterHeaterBadThermostate.ClientID %>').checked = false;
                document.getElementById('<%= ConditionOfWaterHeaterBadElement.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function chkAtLeastTwoOccupant(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkAtLeast2OccupantY.ClientID %>').checked = false;
                document.getElementById('<%= chkAtLeast2OccupantN.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function PermitRequire(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkPermitRequireYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkPermitRequireNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }




        function SelectOneChkList(chk) {
            var chkList = chk.parentNode.parentNode.parentNode;
            var chks = chkList.getElementsByTagName("input");
            if (!chk.checked) {
                chk.checked = false;
            }
            else {
                for (var i = 0; i < chks.length; i++) {
                    if (chks[i] != chk && chk.checked) {
                        chks[i].checked = false;
                    }
                }
            }
        }


        function typeofwater(chk) {
            var chkList = chk.parentNode.parentNode.parentNode;
            var chks = chkList.getElementsByTagName("input");
            if (!chk.checked) {
                chk.checked = false;
            }
            else {
                for (var i = 0; i < chks.length; i++) {
                    if (chks[i] != chk && chk.checked) {
                        chks[i].checked = false;
                    }
                }
            }
        }

        function AmpBreaker(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_AmpBreaker_yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_AmpBreaker_no.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function wire10_2(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_10_2wire_yes.ClientID %>').checked = false;
                document.getElementById('<%= chk_10_2wire_no.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

    </script>

    <!-- footer -->

    <script type="text/javascript">
        document.getElementById("Page5").setAttribute("class", "ui-selected");
    </script>

</asp:Content>
