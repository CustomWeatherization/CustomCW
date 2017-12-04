<%@ Page Language="C#" MasterPageFile="~/AddJobMaster.master" AutoEventWireup="true"
    CodeFile="PPLQuestionairePage.aspx.cs" Inherits="PPLQuestionairePage" Title="Questionaire Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .formDiv input[type="text"]
        {
            color: Black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="script" runat="server">
    </asp:ScriptManager>
    <div class="formDiv" id="DivPrint">
        <h2 style="font: bold 20px Arial,Helvetica,sans-serif; text-align: center; color: #000;
            margin-top: 0px; width: 85%;">
            PPL Customer Questionaire
            <br />
            Job Number: <span id="JobNumber" style="text-decoration: none; font-size: 20px;"
                runat="server">Number</span></h2>
        <table width="100%" border="0" cellspacing="5" cellpadding="0" style="margin-top: -25px;">
            <tr>
                <td>
                    <h4>
                        I. Customer/Premise Information :</h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td>
                                Name :
                                <asp:TextBox runat="server" ID="txtCustomerName" class="txt_name"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Address :
                                <asp:TextBox runat="server" ID="txtAddress" class="txt_address"></asp:TextBox><br />
                                <asp:TextBox runat="server" ID="txtAddress2" class="txt_address"></asp:TextBox>
                                <br />
                            </td>
                            <td>
                                Phone#(home):
                                <asp:TextBox runat="server" ID="txtPhoneHome" class="txt_name"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                    TargetControlID="txtPhoneHome" FilterType="Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                                <br />
                                Phone#(other):
                                <asp:TextBox runat="server" ID="txtPhoneOther" class="txt_name"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                    TargetControlID="txtPhoneOther" FilterType="Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Occupancy :
                                <asp:CheckBox runat="server" ID="chkOccupancyHomeowner" onclick="Occupancy(this.id)" />
                                Homeowner &nbsp; &nbsp;
                                <asp:CheckBox runat="server" ID="chkOccupancyRenter" onclick="Occupancy(this.id)" />
                                Renter
                            </td>
                            <td>
                                Number of Occupants:
                                <asp:TextBox ID="txtNoOfOccupants" runat="server" CssClass="txt_name"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                What Type of Home do you live in?
                                <asp:TextBox ID="txtTypeHome" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                If an apartment what floor?
                                <asp:TextBox ID="txtApartmntFloor" runat="server" CssClass="txt_name"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Are there any apts. above or below you?
                                <asp:CheckBox runat="server" ID="chkAparmntAbove" />
                                Above &nbsp; &nbsp;
                                <asp:CheckBox runat="server" ID="chkAparmntBelow" />
                                Below
                                <asp:TextBox ID="TxtApartmntAboveBelowComment" runat="server" CssClass="txt_name"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>
                        II. ATTIC
                    </h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td style="width: 200px;">
                                Does your home have an attic?
                            </td>
                            <td style="width: 80px;">
                                <asp:CheckBox runat="server" ID="ChkAtticYes" onclick="ChkAttic(this.id)" />
                                Yes
                            </td>
                            <td style="width: 600px">
                                <asp:CheckBox runat="server" ID="ChkAtticNo" onclick="ChkAttic(this.id)" />
                                No
                                <asp:TextBox ID="TxtAtticComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                How do you access your attic?
                                <asp:CheckBox runat="server" ID="ChkAtticStairway" />Stairway
                                <asp:CheckBox runat="server" ID="ChkAtticHatchNoPds" />Hatch No PDS
                                <asp:CheckBox runat="server" ID="ChkAtticHatchWithPds" />Hatch With PDS
                                <br />
                                <asp:TextBox ID="TxtAccessAtticComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="border: 0;">
                            <td colspan="3" style="border: 0;">
                                <table border="0" width="100%" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td width="250px">
                                            Is the Attic Insulated
                                        </td>
                                        <td width="80px">
                                            <asp:CheckBox runat="server" ID="ChkAtticInsulatYes" Text=" Yes" onclick="AtticInsulat(this.id)" />
                                        </td>
                                        <td width="80px">
                                            <asp:CheckBox runat="server" ID="ChkAtticInsulatNo" Text=" No" onclick="AtticInsulat(this.id)" />
                                        </td>
                                        <td>
                                            <asp:CheckBox runat="server" ID="ChkAtticInsulatPartially" Text=" Partially" onclick="AtticInsulat(this.id)" />
                                            <asp:TextBox ID="TxtAtticInsulatComment" runat="server" CssClass="txt_below"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 250px">
                                            Do you have flat or sloped ceilings?
                                        </td>
                                        <td style="width: 80px">
                                            <asp:CheckBox runat="server" ID="ChkSlopeCellingFlat" onclick="FlatorSlopedCeiling(this.id)" />
                                            Flat
                                        </td>
                                        <td style="width: 80px">
                                            <asp:CheckBox runat="server" ID="ChkSlopeCellingSloped" Text=" Sloped" onclick="FlatorSlopedCeiling(this.id)" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TxtSlopeCellingComment" runat="server" CssClass="txt_below"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>
                        III. BATHROOM
                    </h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td style="width: 190px">
                                Do you have any exhaust fans in your bathroom?
                            </td>
                            <td style="width: 50px;">
                                <asp:CheckBox runat="server" ID="ChkExhausFanYes" onclick="ExhaustFansInBathroom(this.id)" />
                                Yes
                            </td>
                            <td style="width: 300px">
                                <asp:CheckBox runat="server" ID="ChkExhausFanNo" onclick="ExhaustFansInBathroom(this.id)" />
                                No
                                <asp:TextBox ID="TxtExhausFanComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>
                        IV. BASEMENT
                    </h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td style="width: 255px;">
                                Is your home built on a concrete slab?
                            </td>
                            <td style="width: 50px">
                                <asp:CheckBox runat="server" ID="ChkConcreteSlabYes" onclick="BuiltConcreteSlab(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px">
                                <asp:CheckBox runat="server" ID="ChkConcreteSlabNo" onclick="BuiltConcreteSlab(this.id)" />
                                No
                                <asp:TextBox ID="TxtConcreteSlabComment" runat="server" CssClass="txt_below" Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 255px;">
                                Do you have a basement?
                            </td>
                            <td style="width: 50px">
                                <asp:CheckBox runat="server" ID="ChkBasementYes" onclick="DoHaveBasement(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px">
                                <asp:CheckBox runat="server" ID="ChkBasementNo" onclick="DoHaveBasement(this.id)" />
                                No
                                <asp:TextBox ID="TxtBasementComment" runat="server" CssClass="txt_below" Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 255px;">
                                Is your basement heated?
                            </td>
                            <td style="width: 50px;">
                                <asp:CheckBox runat="server" ID="ChkBasmentHeatYes" onclick="IsBasementHeated(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px">
                                <asp:CheckBox runat="server" ID="ChkBasmentHeatNo" onclick="IsBasementHeated(this.id)" />
                                No
                                <asp:TextBox ID="TxtBasmentHeatComment" runat="server" CssClass="txt_below" Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 255px;">
                                Is there insulation in your basement?
                            </td>
                            <td style="width: 50px">
                                <asp:CheckBox runat="server" ID="ChkInsulationBasemntYes" onclick="InsulationInBasemnt(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px">
                                <asp:CheckBox runat="server" ID="ChkInsulationBasemntNo" onclick="InsulationInBasemnt(this.id)" />
                                No
                                <asp:TextBox ID="TxtInsulationBasemntComment" runat="server" CssClass="txt_below"
                                    Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 255px;">
                                Do you have a crawlspace underneath your home?
                            </td>
                            <td style="width: 50px">
                                <asp:CheckBox runat="server" ID="ChkCrawlSpaceYes" onclick="CrawlspaceUnderneath(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px">
                                <asp:CheckBox runat="server" ID="ChkCrawlSpaceNo" onclick="CrawlspaceUnderneath(this.id)" />
                                No
                                <asp:TextBox ID="TxtCrawlSpaceComment" runat="server" CssClass="txt_below" Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 255px;">
                                Are there any heaters in your crawlspace?
                            </td>
                            <td style="width: 50px">
                                <asp:CheckBox runat="server" ID="ChkCrawlSpaceHeaterYes" onclick="HeatersInCrawlspace(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px">
                                <asp:CheckBox runat="server" ID="ChkCrawlSpaceHeaterNo" onclick="HeatersInCrawlspace(this.id)" />
                                No
                                <asp:TextBox ID="TxtCrawlSpaceHeaterCommment" runat="server" CssClass="txt_below"
                                    Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="border: 0;">
                            <td colspan="3" style="border: 0;">
                                <table width="100%" border="0" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td style="width: 345px;">
                                            Is the crawlspace Insulated?
                                        </td>
                                        <td style="width: 70px;">
                                            <asp:CheckBox runat="server" ID="ChkCrawlSpaceInsulatedYes" onclick="CrawlspaceInsulated(this.id)" />
                                            Yes
                                        </td>
                                        <td>
                                            <asp:CheckBox runat="server" ID="ChkCrawlSpaceInsulatedNo" onclick="CrawlspaceInsulated(this.id)" />
                                            No
                                        </td>
                                        <td>
                                            <asp:CheckBox runat="server" ID="ChkCrawlSpaceInsulatedPartially" onclick="CrawlspaceInsulated(this.id)" />
                                            Partially
                                            <asp:TextBox ID="TxtCrawlSpaceInsulatedComment" runat="server" CssClass="txt_below"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>
                        V. PIPES
                    </h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td style="width: 205px">
                                Do your pipes ever freeze in the Winter?
                            </td>
                            <td style="width: 45px">
                                <asp:CheckBox runat="server" ID="ChkPipeFrezeWinterYes" onclick="PipeFrezeInWinter(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px">
                                <asp:CheckBox runat="server" ID="ChkPipeFrezeWinterNo" onclick="PipeFrezeInWinter(this.id)" />
                                No
                                <asp:TextBox ID="TxtPipeFrezeWinterComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 205px">
                                Do you have any pipes or faucets that leak?
                            </td>
                            <td style="width: 45px">
                                <asp:CheckBox runat="server" ID="ChkPipeFaucetLeakYes" onclick="PipeOrFaucetLeak(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px">
                                <asp:CheckBox runat="server" ID="ChkPipeFaucetLeakNo" onclick="PipeOrFaucetLeak(this.id)" />
                                No
                                <asp:TextBox ID="TxtPipeFaucetLeakComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Faucets:
                                <asp:TextBox ID="TxtFaucets1" runat="server" CssClass="txt_below"></asp:TextBox>
                                Handles (1 or 2)
                                <asp:TextBox ID="TxtFaucetsHandel1" runat="server" CssClass="txt_name" Width="50px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Faucets:
                                <asp:TextBox ID="TxtFaucets2" runat="server" CssClass="txt_below"></asp:TextBox>
                                Handles (1 or 2)
                                <asp:TextBox ID="TxtFaucetsHandel2" runat="server" CssClass="txt_name" Width="50px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Pipes:
                                <asp:TextBox ID="TxtPiepesComment1" runat="server" CssClass="txt_below" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Pipes:
                                <asp:TextBox ID="TxtPiepesComment2" runat="server" CssClass="txt_below" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>
                        VI. GARAGE
                    </h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td colspan="3">
                                <table>
                                    <tr>
                                        <td width="210px">
                                            Do you have a garage?
                                        </td>
                                        <td style="width: 80px;">
                                            <asp:CheckBox runat="server" ID="ChkHaveGarageYes" onclick="HaveGarage(this.id)" />
                                            Yes
                                        </td>
                                        <td style="width: 400px;" colspan="2">
                                            <asp:CheckBox runat="server" ID="ChkHaveGarageNo" onclick="HaveGarage(this.id)" />
                                            No
                                            <asp:TextBox ID="TxtHaveGarageComment" runat="server" CssClass="txt_below"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 350px">
                                Are there bedrooms/rooms over your garage?
                            </td>
                            <td style="width: 80px">
                                <asp:CheckBox runat="server" ID="ChkBerdRoomGarageYes" onclick="RoomsOverGarage(this.id)" />
                                Yes
                            </td>
                            <td style="width: 1000px" colspan="2">
                                <asp:CheckBox runat="server" ID="ChkBerdRoomGarageNo" onclick="RoomsOverGarage(this.id)" />
                                No
                                <asp:TextBox ID="TxtBerdRoomGarageComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 500px">
                                Rooms:
                                <asp:TextBox ID="TxtRooms" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                            <td style="width: 80px">
                                Cold?
                            </td>
                            <td style="width: 1000px">
                                <asp:CheckBox runat="server" ID="ChkRoomColdYes" onclick="RoomsCold(this.id)" />
                                Yes <span style="padding-right: 40px;"></span>
                                <asp:CheckBox runat="server" ID="ChkRoomColdNo" onclick="RoomsCold(this.id)" />
                                No
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 350px">
                                Is your garage connected to your home?
                            </td>
                            <td style="width: 80px">
                                <asp:CheckBox runat="server" ID="ChkGarageConnectHomeYes" onclick="GarageConnectToHome(this.id)" />
                                Yes
                            </td>
                            <td style="width: 1000px" colspan="2">
                                <asp:CheckBox runat="server" ID="ChkGarageConnectHomeNo" onclick="GarageConnectToHome(this.id)" />
                                No
                                <asp:TextBox ID="TxtGarageConnectHomeComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>
                        VII. HEATING
                    </h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td>
                                What is your main type of heating?
                            </td>
                            <td>
                                <asp:CheckBox runat="server" ID="ChkHeatTypeElectric" onclick="TypeOfHeating(this.id)" />
                                Electric
                            </td>
                            <td>
                                <asp:CheckBox runat="server" ID="ChkHeatTypeOil" onclick="TypeOfHeating(this.id)" />
                                Oil
                            </td>
                            <td style="width: 400px;" colspan="2">
                                <asp:CheckBox runat="server" ID="ChkHeatTypeGas" onclick="TypeOfHeating(this.id)" />
                                Gas
                                <asp:TextBox ID="TxtHeatTypeComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 335px;">
                                What type of heating unit do you have?
                            </td>
                            <td>
                                <asp:CheckBox runat="server" ID="ChkHeatingUnitFurnace" onclick="TypeOfHeatingUnit(this.id)" />
                                Furnace
                            </td>
                            <td>
                                <asp:CheckBox runat="server" ID="ChkHeatingUnitBoiler" onclick="TypeOfHeatingUnit(this.id)" />
                                Boiler
                            </td>
                            <td>
                                <asp:CheckBox runat="server" ID="ChkHeatingUnitHeatpump" onclick="TypeOfHeatingUnit(this.id)" />
                                HeatPump
                            </td>
                            <td>
                                <asp:CheckBox runat="server" ID="ChkHeatingUnitBasebord" onclick="TypeOfHeatingUnit(this.id)" />
                                Baseboard
                                <asp:TextBox ID="Txtheatingtype" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 335px">
                                Do you use any combustible appliances?
                            </td>
                            <td style="width: 100px">
                                <asp:CheckBox runat="server" ID="ChkCombustibleAppliancesYes" onclick="AnyCombustibleAppliances(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px" colspan="3">
                                <asp:CheckBox runat="server" ID="ChkCombustibleAppliancesNo" onclick="AnyCombustibleAppliances(this.id)" />
                                No
                                <asp:TextBox ID="TxtCombustibleAppliancesComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 335px">
                                Do your Combustible appliances work properly?
                            </td>
                            <td style="width: 100px">
                                <asp:CheckBox runat="server" ID="ChkCombustibleAppliancesWorkYes" onclick="CombustibleAppliancesWorkProper(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px" colspan="3">
                                <asp:CheckBox runat="server" ID="ChkCombustibleAppliancesWorkNo" onclick="CombustibleAppliancesWorkProper(this.id)" />
                                No
                                <asp:TextBox ID="TxtCombustibleAppliancesWorkComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 335px">
                                Do all these appliances have fuel?
                            </td>
                            <td style="width: 100px">
                                <asp:CheckBox runat="server" ID="ChkAppliancesHaveFuelYes" onclick="AppliancesHaveFuel(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px" colspan="3">
                                <asp:CheckBox runat="server" ID="ChkAppliancesHaveFuelNo" onclick="AppliancesHaveFuel(this.id)" />
                                No
                                <asp:TextBox ID="TxtAppliancesHaveFuelComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:TextBox ID="TxtHeatingComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>
                        VIII. ELECTRIC HEAT
                    </h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td style="width: 260px">
                                Where are your thermostats located?
                            </td>
                            <td style="width: 60px">
                                <asp:CheckBox runat="server" ID="ChkThermostLocatWall" onclick="ThermostLocate(this.id)" />
                                Wall
                            </td>
                            <td style="width: 400px" colspan="2">
                                <asp:CheckBox runat="server" ID="ChkThermostLocatBaseboard" onclick="ThermostLocate(this.id)" />
                                Baseboard
                                <asp:TextBox ID="TxtThermostLocatComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 260px">
                                Do you use any electric space heaters?
                            </td>
                            <td style="width: 60px">
                                <asp:CheckBox runat="server" ID="ChkUseElectricSpaceHeaterYes" onclick="UseAnyElectricSpaceHeater(this.id)" />
                                Yes
                            </td>
                            <td style="width: 100px">
                                <asp:CheckBox runat="server" ID="ChkUseElectricSpaceHeaterNo" onclick="UseAnyElectricSpaceHeater(this.id)" />
                                No
                            </td>
                            <td style="width: 300px">
                                Amount:
                                <asp:TextBox ID="TxtUseElectricSpaceHeaterAmount" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 260px">
                                Do all of the heaters in your home work properly?
                            </td>
                            <td style="width: 60px">
                                <asp:CheckBox runat="server" ID="ChkAllHeaterWorkProperYes" onclick="AllHeaterWorkProper(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px" colspan="2">
                                <asp:CheckBox runat="server" ID="ChkAllHeaterWorkProperNo" onclick="AllHeaterWorkProper(this.id)" />
                                No
                                <asp:TextBox ID="TxtAllHeaterWorkProperComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                Problems:
                                <asp:TextBox ID="TxtElectricHeatProblem" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>
                        IX. COOLING
                    </h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td style="width: 300px">
                                Do you use any air conditioning units?
                            </td>
                            <td style="width: 100px">
                                <asp:CheckBox runat="server" ID="ChkUseAirConditioningYes" onclick="UseAirConditioningUnit(this.id)" />
                                Yes
                            </td>
                            <td style="width: 65px">
                                <asp:CheckBox runat="server" ID="ChkUseAirConditioningNo" onclick="UseAirConditioningUnit(this.id)" />
                                No
                            </td>
                            <td style="width: 600px;">
                                How many?
                                <asp:TextBox ID="TxtUseAirConditioningHowMany" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 300px">
                                Are they window or wall units?
                            </td>
                            <td style="width: 85px">
                                <asp:CheckBox runat="server" ID="ChkWindow" onclick="WindowOrWallUnit(this.id)" />
                                WIndow
                            </td>
                            <td style="width: 400px" colspan="2">
                                <asp:CheckBox runat="server" ID="ChkWall" onclick="WindowOrWallUnit(this.id)" />
                                Wall
                                <asp:TextBox ID="TxtWindowOrWallUnitComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                What color are they?
                                <asp:TextBox ID="TxtCoolingColorComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>
                        X. WATER HEATING
                    </h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td colspan="3">
                                Where is your hot water heater located?
                                <asp:TextBox ID="TxtWaterHeaterLocateComment" runat="server" CssClass="txt_below"
                                    Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                How old is your hot water heater?
                                <asp:TextBox ID="TxtOldHotWaterHeaterComment" runat="server" CssClass="txt_below"
                                    Width="75%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 130px;">
                                Does it leak?
                            </td>
                            <td style="width: 75px;">
                                <asp:CheckBox runat="server" ID="ChkWaterHeaterLeakYes" onclick="WaterHeaterLeak(this.id)" />
                                Yes
                            </td>
                            <td style="width: 880px;">
                                <asp:CheckBox runat="server" ID="ChkWaterHeaterLeakNo" onclick="WaterHeaterLeak(this.id)" />
                                No
                                <asp:TextBox ID="TxtWaterHeaterLeakComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 130px;">
                                Is it rusty?
                            </td>
                            <td style="width: 75px;">
                                <asp:CheckBox runat="server" ID="ChkWaterHeaterRustyYes" onclick="IsWaterHeaterRusty(this.id)" />
                                Yes
                            </td>
                            <td style="width: 880px;">
                                <asp:CheckBox runat="server" ID="ChkWaterHeaterRustyNo" onclick="IsWaterHeaterRusty(this.id)" />
                                No
                                <asp:TextBox ID="TxtWaterHeaterRustyComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                How many Gallons?
                                <asp:TextBox ID="TxtGallons" runat="server" CssClass="txt_below" Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>
                        XI. REFRIGERATOR
                    </h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td colspan="4">
                                How many refrigerators are used in your home?
                                <asp:TextBox ID="TxtHowManyRefrigeratorUse" runat="server" CssClass="txt_name" Width="65%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 210px">
                                Do you use a chest freezer?
                            </td>
                            <td style="width: 100px">
                                <asp:CheckBox runat="server" ID="ChkUseChestFreezerYes" onclick="UseChestFreezer(this.id)" />
                                Yes
                            </td>
                            <td style="width: 700px" colspan="2">
                                <asp:CheckBox runat="server" ID="ChkUseChestFreezerNo" onclick="UseChestFreezer(this.id)" />
                                No
                                <asp:TextBox ID="TxtUseChestFreezerComment" runat="server" CssClass="txt_below"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                How old are they?
                            </td>
                            <td>
                                Fridge:
                                <asp:TextBox ID="TxtAgefridge" runat="server" CssClass="txt_below" Width="30%"></asp:TextBox>
                            </td>
                            <td style="width: 150px;">
                                Fridge:
                                <asp:TextBox ID="TxtAgefridge1" runat="server" CssClass="txt_below" Width="55%"></asp:TextBox>
                            </td>
                            <td>
                                Freezer:
                                <asp:TextBox ID="TxtAgeFreezer" runat="server" CssClass="txt_below" Width="30%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>
                        XII. WASHER AND DRYER
                    </h4>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td style="width: 170px">
                                Do you use a washer?
                            </td>
                            <td style="width: 50px">
                                <asp:CheckBox runat="server" ID="ChkUseWasherYes" onclick="UseWasher(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px">
                                <asp:CheckBox runat="server" ID="ChkUseWasherNo" onclick="UseWasher(this.id)" />
                                No &nbsp; &nbsp; Age:<asp:TextBox ID="TxtUseWasherAge" runat="server" CssClass="txt_name"
                                    Width="20%"></asp:TextBox>&nbsp; &nbsp;&nbsp; &nbsp;
                                <asp:TextBox ID="TxtWasherAge1" runat="server" CssClass="txt_below" Width="40%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 170px">
                                Do you use a dryer?
                            </td>
                            <td style="width: 50px">
                                <asp:CheckBox runat="server" ID="ChkUseDryerYes" onclick="UseDryer(this.id)" />
                                Yes
                            </td>
                            <td style="width: 400px">
                                <asp:CheckBox runat="server" ID="ChkUseDryerNo" onclick="UseDryer(this.id)" />
                                No &nbsp; &nbsp; Age:<asp:TextBox ID="TxtUseDryerAge" runat="server" CssClass="txt_name"
                                    Width="20%"></asp:TextBox>&nbsp; &nbsp;&nbsp; &nbsp;
                                <asp:TextBox ID="TxtUseDryerAge1" runat="server" CssClass="txt_below" Width="40%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                How many loads a week do you do?
                                <asp:TextBox ID="TxtWasherLoadsPerWeek" runat="server" CssClass="txt_below" Width="70%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                How long does it take you to dry one load?
                                <asp:TextBox ID="TxtTimeToDryOneLoad" runat="server" CssClass="txt_below"></asp:TextBox>
                                Minutes
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td align="center">
                                <b style="font-size: 14px;">ARE THERE ANY ADDITIONAL PROBLEMS YOU WOULD LIKE LOOKED
                                    AT INCLUDING
                                    <br />
                                    <u>DRAFTS, MOISTURE, COLD AREAS,</u> ETC.?</b>
                            </td>
                        </tr>
                        <tr>
                            <td height="150px" valign="top">
                                <asp:TextBox ID="txt_AdditionalProblemComment" runat="server" TextMode="MultiLine"
                                    Style="background-color: rgb(211, 209, 209, 0.4);" Height="150px" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="top_Btn_div" id="TopBtnDiv" runat="server">
        <asp:Button ID="btn_save" runat="server" Text="Save" CssClass="top_btn" OnClick="btn_save_Click" />&nbsp;&nbsp;
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CssClass="top_btn" OnClick="btn_cancel_Click" />&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Print" CssClass="top_btn" OnClientClick="ClickHereToPrintFull()" />
    </div>

    <script language="JavaScript" type="text/javascript">
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

    <script type="text/javascript">
        function Occupancy(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkOccupancyHomeowner.ClientID %>').checked = false;
                document.getElementById('<%= chkOccupancyRenter.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ChkAttic(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkAtticYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkAtticNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function AtticInsulat(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkAtticInsulatYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkAtticInsulatNo.ClientID %>').checked = false;
                document.getElementById('<%= ChkAtticInsulatPartially.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function FlatorSlopedCeiling(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkSlopeCellingFlat.ClientID %>').checked = false;
                document.getElementById('<%= ChkSlopeCellingSloped.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function ExhaustFansInBathroom(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkExhausFanYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkExhausFanNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function BuiltConcreteSlab(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkConcreteSlabYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkConcreteSlabNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function DoHaveBasement(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkBasementYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkBasementNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function IsBasementHeated(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkBasmentHeatYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkBasmentHeatNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function InsulationInBasemnt(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkInsulationBasemntYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkInsulationBasemntNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function CrawlspaceUnderneath(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkCrawlSpaceYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkCrawlSpaceNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function HeatersInCrawlspace(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkCrawlSpaceHeaterYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkCrawlSpaceHeaterNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function CrawlspaceInsulated(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkCrawlSpaceInsulatedYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkCrawlSpaceInsulatedNo.ClientID %>').checked = false;
                document.getElementById('<%= ChkCrawlSpaceInsulatedPartially.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function PipeFrezeInWinter(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkPipeFrezeWinterYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkPipeFrezeWinterNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function PipeOrFaucetLeak(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkPipeFaucetLeakYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkPipeFaucetLeakNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function HaveGarage(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkHaveGarageYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkHaveGarageNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function RoomsOverGarage(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkBerdRoomGarageYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkBerdRoomGarageNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function RoomsCold(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkRoomColdYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkRoomColdNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function GarageConnectToHome(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkGarageConnectHomeYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkGarageConnectHomeNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function TypeOfHeating(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkHeatTypeElectric.ClientID %>').checked = false;
                document.getElementById('<%= ChkHeatTypeOil.ClientID %>').checked = false;
                document.getElementById('<%= ChkHeatTypeGas.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function TypeOfHeatingUnit(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkHeatingUnitFurnace.ClientID %>').checked = false;
                document.getElementById('<%= ChkHeatingUnitBoiler.ClientID %>').checked = false;
                document.getElementById('<%= ChkHeatingUnitHeatpump.ClientID %>').checked = false;
                document.getElementById('<%= ChkHeatingUnitBasebord.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function AnyCombustibleAppliances(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkCombustibleAppliancesYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkCombustibleAppliancesNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function CombustibleAppliancesWorkProper(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkCombustibleAppliancesWorkYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkCombustibleAppliancesWorkNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }



        function AppliancesHaveFuel(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkAppliancesHaveFuelYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkAppliancesHaveFuelNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function ThermostLocate(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkThermostLocatWall.ClientID %>').checked = false;
                document.getElementById('<%= ChkThermostLocatBaseboard.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function UseAnyElectricSpaceHeater(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkUseElectricSpaceHeaterYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkUseElectricSpaceHeaterNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function AllHeaterWorkProper(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkAllHeaterWorkProperYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkAllHeaterWorkProperNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function UseAirConditioningUnit(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkUseAirConditioningYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkUseAirConditioningNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function WindowOrWallUnit(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkWindow.ClientID %>').checked = false;
                document.getElementById('<%= ChkWall.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function WaterHeaterLeak(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkWaterHeaterLeakYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkWaterHeaterLeakNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function IsWaterHeaterRusty(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkWaterHeaterRustyYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkWaterHeaterRustyNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function UseChestFreezer(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkUseChestFreezerYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkUseChestFreezerNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function UseWasher(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkUseWasherYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkUseWasherNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function UseDryer(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkUseDryerYes.ClientID %>').checked = false;
                document.getElementById('<%= ChkUseDryerNo.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
    </script>

</asp:Content>
