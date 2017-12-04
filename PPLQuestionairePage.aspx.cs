using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class PPLQuestionairePage : System.Web.UI.Page
{
    dcPPLAudit obj_dcPPLAudit = new dcPPLAudit();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (Request.UserAgent.Contains("Chrome"))
            {
                // TopBtnDiv.Attributes.Add("style", "position: fixed;top: 65px;z-index: 100;text-align: center;margin: 0 218px; width:510px;");
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["Jobs"] != null)
                {
                    if (Request.QueryString["Jobs"].ToString() != "")
                    {
                        string JobNum = Request.QueryString["Jobs"].ToString();
                        JobNumber.InnerText = JobNum;
                        FillUpdateAudit();
                    }
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }
        catch
        {
        }

    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            string IsThereAnAttic, IsTheAtticInsulated, FlatOrSlopedCelling, AnyExhaustFansInBathroom, IsHomeBuiltOnConcreteSlab, DoYouHaveABaseMent, IsBaseMentHeated, CrawlSpace, AnyHeaterInCrawlSpace, IsCrawlSpaceHeated, DoPipesFreezerInWinter, PipesOrFaucetsLeak, DoYouHaveAGarage, RoomsOverGarage, ColdRoomsOverGarage, IsGarageConnectedToHome, MainTypeOfHeating, TypeOfHeatingUnit, ThermostaLocation, DoYouUseElectricSpaceHeater, DoAllHeaterWorkProperly, DoYouUseAirConditioningUnit, WindowOrWallUnit, DoesWaterHeaterLeak, IsHotWaterHeaterRusty, DoYouUseChestFrezer, DoYouUseAWasher, DoYouUseADrayer, ApartmentFloorAbove, ApartmentFloorBelow, StairwayAccess, HatchNoPDS, HatchWithPDS, IsBaseMentInsulated, DoYouUseCombustibleAppliances, DoYouUseCombustible2Appliances, DoYouUseCombustible3Appliances;
            IsThereAnAttic = IsTheAtticInsulated = AnyExhaustFansInBathroom = FlatOrSlopedCelling = IsHomeBuiltOnConcreteSlab = DoYouHaveABaseMent = IsBaseMentHeated = CrawlSpace = AnyHeaterInCrawlSpace = IsCrawlSpaceHeated = DoPipesFreezerInWinter = PipesOrFaucetsLeak = DoYouHaveAGarage = RoomsOverGarage = ColdRoomsOverGarage = IsGarageConnectedToHome = MainTypeOfHeating = TypeOfHeatingUnit = ThermostaLocation = DoYouUseElectricSpaceHeater = DoAllHeaterWorkProperly = DoYouUseAirConditioningUnit = WindowOrWallUnit = DoesWaterHeaterLeak = IsHotWaterHeaterRusty = DoYouUseChestFrezer = DoYouUseAWasher = DoYouUseADrayer = ApartmentFloorAbove = ApartmentFloorBelow = StairwayAccess = HatchNoPDS = HatchWithPDS = IsBaseMentInsulated = DoYouUseCombustibleAppliances = DoYouUseCombustible2Appliances = DoYouUseCombustible3Appliances = "";

            ////////////////////////////////////////

            if (ChkAtticYes.Checked == true)
            {
                IsThereAnAttic = "Y";
            }
            else if (ChkAtticNo.Checked == true)
            {
                IsThereAnAttic = "N";
            }

            //////////////////////////////////////

            if (ChkGarageConnectHomeYes.Checked == true)
            {
                IsGarageConnectedToHome = "Y";
            }
            else if (ChkGarageConnectHomeNo.Checked == true)
            {
                IsGarageConnectedToHome = "N";
            }

            //////////////////////////////////////


            if (ChkAtticInsulatYes.Checked == true)
            {
                IsTheAtticInsulated = "Y";
            }
            else if (ChkAtticInsulatNo.Checked == true)
            {
                IsTheAtticInsulated = "N";
            }
            else if (ChkAtticInsulatPartially.Checked == true)
            {
                IsTheAtticInsulated = "P";
            }

            //////////////////////////////////////

            if (ChkSlopeCellingFlat.Checked == true)
            {
                FlatOrSlopedCelling = "F";
            }
            else if (ChkSlopeCellingSloped.Checked == true)
            {
                FlatOrSlopedCelling = "S";
            }

            /////////////////////////////////////

            if (ChkExhausFanYes.Checked == true)
            {
                AnyExhaustFansInBathroom = "Y";
            }
            else if (ChkExhausFanNo.Checked == true)
            {
                AnyExhaustFansInBathroom = "N";
            }

            //////////////////////////////////////

            if (ChkConcreteSlabYes.Checked == true)
            {
                IsHomeBuiltOnConcreteSlab = "Y";
            }
            else if (ChkConcreteSlabNo.Checked == true)
            {
                IsHomeBuiltOnConcreteSlab = "N";
            }

            //////////////////////////////////////

            if (ChkBasementYes.Checked == true)
            {
                DoYouHaveABaseMent = "Y";
            }
            else if (ChkBasementNo.Checked == true)
            {
                DoYouHaveABaseMent = "N";
            }

            //////////////////////////////////////


            if (ChkBasmentHeatYes.Checked == true)
            {
                IsBaseMentHeated = "Y";
            }
            else if (ChkBasmentHeatNo.Checked == true)
            {
                IsBaseMentHeated = "N";
            }

            //////////////////////////////////////

            if (ChkCrawlSpaceYes.Checked == true)
            {
                CrawlSpace = "Y";
            }
            else if (ChkCrawlSpaceNo.Checked == true)
            {
                CrawlSpace = "N";
            }

            //////////////////////////////////////

            if (ChkCrawlSpaceHeaterYes.Checked == true)
            {
                AnyHeaterInCrawlSpace = "Y";
            }
            else if (ChkCrawlSpaceHeaterNo.Checked == true)
            {
                AnyHeaterInCrawlSpace = "N";
            }

            //////////////////////////////////////

            if (ChkPipeFrezeWinterYes.Checked == true)
            {
                DoPipesFreezerInWinter = "Y";
            }
            else if (ChkPipeFrezeWinterNo.Checked == true)
            {
                DoPipesFreezerInWinter = "N";
            }

            //////////////////////////////////////

            if (ChkPipeFaucetLeakYes.Checked == true)
            {
                PipesOrFaucetsLeak = "Y";
            }
            else if (ChkPipeFaucetLeakNo.Checked == true)
            {
                PipesOrFaucetsLeak = "N";
            }

            //////////////////////////////////////

            if (ChkHaveGarageYes.Checked == true)
            {
                DoYouHaveAGarage = "Y";
            }
            else if (ChkHaveGarageNo.Checked == true)
            {
                DoYouHaveAGarage = "N";
            }

            //////////////////////////////////////

            if (ChkBerdRoomGarageYes.Checked == true)
            {
                RoomsOverGarage = "Y";
            }
            else if (ChkBerdRoomGarageNo.Checked == true)
            {
                RoomsOverGarage = "N";
            }

            //////////////////////////////////////

            if (ChkRoomColdYes.Checked == true)
            {
                ColdRoomsOverGarage = "Y";
            }
            else if (ChkRoomColdNo.Checked == true)
            {
                ColdRoomsOverGarage = "N";
            }

            //////////////////////////////////////

            if (ChkHeatTypeElectric.Checked == true)
            {
                MainTypeOfHeating = "E";
            }
            else if (ChkHeatTypeOil.Checked == true)
            {
                MainTypeOfHeating = "O";
            }
            else if (ChkHeatTypeGas.Checked == true)
            {
                MainTypeOfHeating = "G";
            }

            //////////////////////////////////////

            if (ChkHeatingUnitFurnace.Checked == true)
            {
                TypeOfHeatingUnit = "F";
            }
            else if (ChkHeatingUnitBoiler.Checked == true)
            {
                TypeOfHeatingUnit = "B";
            }
            else if (ChkHeatingUnitHeatpump.Checked == true)
            {
                TypeOfHeatingUnit = "H";
            }
            else if (ChkHeatingUnitBasebord.Checked == true)
            {
                TypeOfHeatingUnit = "A";
            }

            //////////////////////////////////////

            if (ChkThermostLocatBaseboard.Checked == true)
            {
                ThermostaLocation = "B";
            }
            else if (ChkThermostLocatWall.Checked == true)
            {
                ThermostaLocation = "W";
            }

            //////////////////////////////////////

            if (ChkUseElectricSpaceHeaterYes.Checked == true)
            {
                DoYouUseElectricSpaceHeater = "Y";
            }
            else if (ChkUseElectricSpaceHeaterNo.Checked == true)
            {
                DoYouUseElectricSpaceHeater = "N";
            }

            //////////////////////////////////////

            if (ChkAllHeaterWorkProperYes.Checked == true)
            {
                DoAllHeaterWorkProperly = "Y";
            }
            else if (ChkAllHeaterWorkProperNo.Checked == true)
            {
                DoAllHeaterWorkProperly = "N";
            }

            //////////////////////////////////////

            if (ChkUseAirConditioningYes.Checked == true)
            {
                DoYouUseAirConditioningUnit = "Y";
            }
            else if (ChkUseAirConditioningNo.Checked == true)
            {
                DoYouUseAirConditioningUnit = "N";
            }

            //////////////////////////////////////

            if (ChkWall.Checked == true)
            {
                WindowOrWallUnit = "A";
            }
            else if (ChkWindow.Checked == true)
            {
                WindowOrWallUnit = "W";
            }

            //////////////////////////////////////

            if (ChkWaterHeaterLeakYes.Checked == true)
            {
                DoesWaterHeaterLeak = "Y";
            }
            else if (ChkWaterHeaterLeakNo.Checked == true)
            {
                DoesWaterHeaterLeak = "N";
            }

            //////////////////////////////////////

            if (ChkWaterHeaterRustyYes.Checked == true)
            {
                IsHotWaterHeaterRusty = "Y";
            }
            else if (ChkWaterHeaterRustyNo.Checked == true)
            {
                IsHotWaterHeaterRusty = "N";
            }

            //////////////////////////////////////

            if (ChkUseChestFreezerYes.Checked == true)
            {
                DoYouUseChestFrezer = "Y";
            }
            else if (ChkUseChestFreezerNo.Checked == true)
            {
                DoYouUseChestFrezer = "N";
            }

            //////////////////////////////////////

            if (ChkUseWasherYes.Checked == true)
            {
                DoYouUseAWasher = "Y";
            }
            else if (ChkUseWasherNo.Checked == true)
            {
                DoYouUseAWasher = "N";
            }

            //////////////////////////////////////

            if (ChkUseDryerYes.Checked == true)
            {
                DoYouUseADrayer = "Y";
            }
            else if (ChkUseDryerNo.Checked == true)
            {
                DoYouUseADrayer = "N";
            }

            //////////////////////////////////////

            if (chkAparmntAbove.Checked == true)
            {
                ApartmentFloorAbove = "A";
            }
            if (chkAparmntBelow.Checked == true)
            {
                ApartmentFloorBelow = "A";
            }

            //////////////////////////////////////

            if (ChkAtticStairway.Checked == true)
            {
                StairwayAccess = "A";
            }
            if (ChkAtticHatchNoPds.Checked == true)
            {
                HatchNoPDS = "A";
            }
            if (ChkAtticHatchWithPds.Checked == true)
            {
                HatchWithPDS = "A";
            }

            //////////////////////////////////////

            if (ChkInsulationBasemntYes.Checked == true)
            {
                IsBaseMentInsulated = "Y";
            }
            else if (ChkInsulationBasemntNo.Checked == true)
            {
                IsBaseMentInsulated = "N";
            }

            //////////////////////////////////////

            if (ChkCombustibleAppliancesYes.Checked == true)
            {
                DoYouUseCombustibleAppliances = "Y";
            }
            else if (ChkCombustibleAppliancesNo.Checked == true)
            {
                DoYouUseCombustibleAppliances = "N";
            }

            //////////////////////////////////////

            if (ChkCombustibleAppliancesWorkYes.Checked == true)
            {
                DoYouUseCombustible2Appliances = "Y";
            }
            else if (ChkCombustibleAppliancesWorkNo.Checked == true)
            {
                DoYouUseCombustible2Appliances = "N";
            }

            //////////////////////////////////////

            if (ChkAppliancesHaveFuelYes.Checked == true)
            {
                DoYouUseCombustible3Appliances = "Y";
            }
            else if (ChkAppliancesHaveFuelNo.Checked == true)
            {
                DoYouUseCombustible3Appliances = "N";
            }

            //////////////////////////////////////

            if (ChkCrawlSpaceInsulatedYes.Checked == true)
            {
                IsCrawlSpaceHeated = "Y";
            }
            else if (ChkCrawlSpaceInsulatedNo.Checked == true)
            {
                IsCrawlSpaceHeated = "N";
            }
            else if (ChkCrawlSpaceInsulatedPartially.Checked == true)
            {
                IsCrawlSpaceHeated = "P";
            }


            obj_dcPPLAudit.insert_Questionaire(Convert.ToString(Request.QueryString["Jobs"]), txtTypeHome.Text, txtApartmntFloor.Text, IsThereAnAttic, TxtAccessAtticComment.Text, IsTheAtticInsulated, FlatOrSlopedCelling, AnyExhaustFansInBathroom, TxtExhausFanComment.Text, IsHomeBuiltOnConcreteSlab, DoYouHaveABaseMent, IsBaseMentHeated, CrawlSpace, AnyHeaterInCrawlSpace, IsCrawlSpaceHeated, DoPipesFreezerInWinter, PipesOrFaucetsLeak, TxtFaucets1.Text, TxtFaucetsHandel1.Text, TxtFaucets2.Text, TxtFaucetsHandel2.Text, TxtPiepesComment1.Text, TxtPiepesComment2.Text, DoYouHaveAGarage, RoomsOverGarage, TxtBerdRoomGarageComment.Text, ColdRoomsOverGarage, IsGarageConnectedToHome, MainTypeOfHeating, TypeOfHeatingUnit, ThermostaLocation, DoYouUseElectricSpaceHeater, TxtUseElectricSpaceHeaterAmount.Text, DoAllHeaterWorkProperly, TxtElectricHeatProblem.Text, DoYouUseAirConditioningUnit, TxtUseAirConditioningHowMany.Text, WindowOrWallUnit, TxtCoolingColorComment.Text, TxtWaterHeaterLocateComment.Text, TxtOldHotWaterHeaterComment.Text, DoesWaterHeaterLeak, TxtWaterHeaterLeakComment.Text, IsHotWaterHeaterRusty, TxtWaterHeaterRustyComment.Text, TxtGallons.Text, DoYouUseChestFrezer, TxtAgefridge.Text, TxtAgefridge1.Text, TxtAgeFreezer.Text, DoYouUseAWasher, TxtUseWasherAge.Text, TxtWasherAge1.Text, DoYouUseADrayer, TxtUseDryerAge.Text, TxtUseDryerAge1.Text, TxtWasherLoadsPerWeek.Text, TxtTimeToDryOneLoad.Text, txt_AdditionalProblemComment.Text, TxtHowManyRefrigeratorUse.Text, TxtAtticComment.Text, TxtAtticInsulatComment.Text, TxtSlopeCellingComment.Text, TxtConcreteSlabComment.Text, TxtBasementComment.Text, TxtBasmentHeatComment.Text, TxtCrawlSpaceComment.Text, TxtCrawlSpaceHeaterCommment.Text, TxtCrawlSpaceInsulatedComment.Text, TxtPipeFrezeWinterComment.Text, TxtPipeFaucetLeakComment.Text, TxtHaveGarageComment.Text, TxtRooms.Text, TxtGarageConnectHomeComment.Text, TxtHeatTypeComment.Text, Txtheatingtype.Text, TxtThermostLocatComment.Text, TxtAllHeaterWorkProperComment.Text, TxtWindowOrWallUnitComment.Text, TxtUseChestFreezerComment.Text, ApartmentFloorAbove, ApartmentFloorBelow, TxtApartmntAboveBelowComment.Text, StairwayAccess, HatchNoPDS, HatchWithPDS, IsBaseMentInsulated, TxtInsulationBasemntComment.Text, TxtHeatingComment.Text, DoYouUseCombustibleAppliances, TxtCombustibleAppliancesComment.Text, DoYouUseCombustible2Appliances, TxtCombustibleAppliancesWorkComment.Text, DoYouUseCombustibleAppliances, TxtAppliancesHaveFuelComment.Text);
            FillUpdateAudit();

        }
        catch
        {


        }

    }

    #region Fill Data For Update
    public void FillUpdateAudit()
    {
        try
        {
            DataTable dt = obj_dcPPLAudit.GetPPL_Questionaire(Request.QueryString["Jobs"].ToString());
            if (dt.Rows.Count > 0)
            {
                //string JobNumber, string TypeOfHome, string ApartmentFloor, string IsThereAnAttic, string AtticAccessComments, string IsTheAtticInsulated, string FlatOrSlopedCeilings, string AnyExhaustFansInBathroom, TxtExhausFanComment.Text AnyExhaustFansInBathroomComments, string IsHomeBuiltOnConcreteSlab, string DoYouHaveABaseMent, string IsbasementHeated, string CrawlSpace, string AnyHeatersInCrawlSpace, string IsCrawlSpaceHeated, string DoPipesFreezeInWinter, string PipesOrFaucetsLeak, string Faucets1Comments, string Faucets1handles, string Faucets2Comments, string Faucets2handles, string Pipes1Comments, string Pipes2Comments, string DoYouHaveAGarage, string RoomsOverGarage, string , string ColdRoomsOverGarage, string IsGarageConnectedToHome, string MainTypeOfHeating, string TypeOfHeatingUnit, string ThermostatLocation, string DoYouUseElectricSpaceHeaters, , string DoAllHeatersWorkProperly, string  , string DoYouUseAirConditioningUnits, string  , string WindowOrWallUnits, string , string  , string IsHotWaterHeaterRusty, string , string DoYouUseChestFreezer, string , string , string , string DoYouUseAWasher, string TxtUseWasherAge.Text AgeWasher, TxtWasherAge1.Text AgeWasherComments , string , string DoYouUseADryer, string TxtUseDryerAge AgeDryer, string AgeDryerComments, string WasherLoadsPerWeek, string TimeToDryOneLoad, string AllOtherComments, string NumRefrigeratorsInHome, string LineAComments, string LineBComments, string LineCComments, string LineDComments, string LineEComments, string LineFComments, string LineGComments, string LineHComments, string LineIComments, string LineJComments, string LineKComments, string LineLComments, string LineMComments, string LineNComments, string LineOComments, , string ApartmentFloorAbove, string ApartmentFloorBelow, string ApartmentFloorAboveOrBelowComments ApartmentFloorAboveOrBelowComments ApartmentFloorAboveOrBelowComments ApartmentFloorAboveOrBelowComments ApartmentFloorAboveOrBelowComments ApartmentFloorAboveOrBelowComments ApartmentFloorAboveOrBelowComments , string StairwayAccess, string HatchNoPDS, string HatchWithPDS, string IsbasementInsulated, string IsBasementInsulatedComments, string HeatingComments, string DoYouUseCombustibleAppliances, string CombustibleAppliancesComments, string DoYouUseCombustible2Appliances, string Combustible2AppliancesComments, string DoYouUseCombustible3Appliances, string Combustible3AppliancesComments
                txtTypeHome.Text = Convert.ToString(dt.Rows[0]["TypeOfHome"]);
                txtApartmntFloor.Text = Convert.ToString(dt.Rows[0]["ApartmentFloor"]);
                TxtAccessAtticComment.Text = Convert.ToString(dt.Rows[0]["AtticAccessComments"]);
                TxtExhausFanComment.Text = Convert.ToString(dt.Rows[0]["AnyExhaustFansInBathroomComments"]);
                TxtFaucets1.Text = Convert.ToString(dt.Rows[0]["Faucets1Comments"]);
                TxtFaucetsHandel1.Text = Convert.ToString(dt.Rows[0]["Faucets1handles"]);
                TxtFaucets2.Text = Convert.ToString(dt.Rows[0]["Faucets2Comments"]);
                TxtFaucetsHandel2.Text = Convert.ToString(dt.Rows[0]["Faucets2handles"]);
                TxtPiepesComment1.Text = Convert.ToString(dt.Rows[0]["Pipes1Comments"]);
                TxtPiepesComment2.Text = Convert.ToString(dt.Rows[0]["Pipes2Comments"]);
                TxtBerdRoomGarageComment.Text = Convert.ToString(dt.Rows[0]["RoomsOverGarageComments"]);
                TxtUseElectricSpaceHeaterAmount.Text = Convert.ToString(dt.Rows[0]["AmountOfElectricSpaceHeaters"]);
                TxtElectricHeatProblem.Text = Convert.ToString(dt.Rows[0]["HeatProblemsComments"]);
                TxtUseAirConditioningHowMany.Text = Convert.ToString(dt.Rows[0]["NumberOfAirConditioningUnits"]);
                TxtCoolingColorComment.Text = Convert.ToString(dt.Rows[0]["ColorOfAirConditioners"]);
                TxtWaterHeaterLocateComment.Text = Convert.ToString(dt.Rows[0]["HotWaterHeaterLocation"]);
                TxtOldHotWaterHeaterComment.Text = Convert.ToString(dt.Rows[0]["AgeOfHotWaterHeater"]);
                TxtWaterHeaterLeakComment.Text = Convert.ToString(dt.Rows[0]["DoesHotWaterHeaterLeakComments"]);
                TxtWaterHeaterRustyComment.Text = Convert.ToString(dt.Rows[0]["IsHotWaterHeaterRustyComments"]);
                TxtGallons.Text = Convert.ToString(dt.Rows[0]["NumGallonsHotWaterHeater"]);
                TxtAgefridge.Text = Convert.ToString(dt.Rows[0]["AgeFridge1"]);
                TxtAgefridge1.Text = Convert.ToString(dt.Rows[0]["AgeFridge2"]);
                TxtAgeFreezer.Text = Convert.ToString(dt.Rows[0]["AgeFreezer1"]);
                TxtUseWasherAge.Text = Convert.ToString(dt.Rows[0]["AgeWasher"]);
                TxtWasherAge1.Text = Convert.ToString(dt.Rows[0]["AgeWasherComments"]);
                TxtUseDryerAge.Text = Convert.ToString(dt.Rows[0]["AgeDryer"]);
                TxtUseDryerAge1.Text = Convert.ToString(dt.Rows[0]["AgeDryerComments"]);
                TxtWasherLoadsPerWeek.Text = Convert.ToString(dt.Rows[0]["WasherLoadsPerWeek"]);
                TxtTimeToDryOneLoad.Text = Convert.ToString(dt.Rows[0]["TimeToDryOneLoad"]);
                txt_AdditionalProblemComment.Text = Convert.ToString(dt.Rows[0]["AllOtherComments"]);
                TxtHowManyRefrigeratorUse.Text = Convert.ToString(dt.Rows[0]["NumRefrigeratorsInHome"]);
                TxtAtticComment.Text = Convert.ToString(dt.Rows[0]["LineAComments"]);
                TxtAtticInsulatComment.Text = Convert.ToString(dt.Rows[0]["LineBComments"]);
                TxtSlopeCellingComment.Text = Convert.ToString(dt.Rows[0]["LineCComments"]);
                TxtConcreteSlabComment.Text = Convert.ToString(dt.Rows[0]["LineDComments"]);
                TxtBasementComment.Text = Convert.ToString(dt.Rows[0]["LineEComments"]);
                TxtBasmentHeatComment.Text = Convert.ToString(dt.Rows[0]["LineFComments"]);
                TxtCrawlSpaceComment.Text = Convert.ToString(dt.Rows[0]["LineGComments"]);
                TxtCrawlSpaceHeaterCommment.Text = Convert.ToString(dt.Rows[0]["LineHComments"]);
                TxtCrawlSpaceInsulatedComment.Text = Convert.ToString(dt.Rows[0]["LineIComments"]);
                TxtPipeFrezeWinterComment.Text = Convert.ToString(dt.Rows[0]["LineJComments"]);
                TxtPipeFaucetLeakComment.Text = Convert.ToString(dt.Rows[0]["LineKComments"]);
                TxtHaveGarageComment.Text = Convert.ToString(dt.Rows[0]["LineLComments"]);
                TxtRooms.Text = Convert.ToString(dt.Rows[0]["LineMComments"]);
                TxtGarageConnectHomeComment.Text = Convert.ToString(dt.Rows[0]["LineNComments"]);
                TxtHeatTypeComment.Text = Convert.ToString(dt.Rows[0]["LineOComments"]);
                Txtheatingtype.Text = Convert.ToString(dt.Rows[0]["LinePComments"]);
                TxtThermostLocatComment.Text = Convert.ToString(dt.Rows[0]["LineQComments"]);
                TxtAllHeaterWorkProperComment.Text = Convert.ToString(dt.Rows[0]["LineRComments"]);
                TxtWindowOrWallUnitComment.Text = Convert.ToString(dt.Rows[0]["LineSComments"]);
                TxtUseChestFreezerComment.Text = Convert.ToString(dt.Rows[0]["LineTComments"]);
                TxtApartmntAboveBelowComment.Text = Convert.ToString(dt.Rows[0]["ApartmentFloorAboveOrBelowComments"]);
                TxtInsulationBasemntComment.Text = Convert.ToString(dt.Rows[0]["IsBasementInsulatedComments"]);
                TxtHeatingComment.Text = Convert.ToString(dt.Rows[0]["HeatingComments"]);
                TxtCombustibleAppliancesComment.Text = Convert.ToString(dt.Rows[0]["CombustibleAppliancesComments"]);
                TxtCombustibleAppliancesWorkComment.Text = Convert.ToString(dt.Rows[0]["Combustible2AppliancesComments"]);
                TxtAppliancesHaveFuelComment.Text = Convert.ToString(dt.Rows[0]["Combustible3AppliancesComments"]);

                txtCustomerName.Text = Convert.ToString(dt.Rows[0]["FullName"]);
                txtCustomerName.ReadOnly = true;
                txtAddress.Text = Convert.ToString(dt.Rows[0]["ServiceAddress1"]);
                txtAddress.ReadOnly = true;
                txtAddress2.Text = Convert.ToString(dt.Rows[0]["CityStateZipCode"]);
                txtAddress2.ReadOnly = true;
                txtPhoneHome.Text = Convert.ToString(dt.Rows[0]["HomePhone"]);
                txtPhoneHome.ReadOnly = true;
                txtPhoneOther.Text = Convert.ToString(dt.Rows[0]["CellPhone"]);
                txtPhoneOther.ReadOnly = true;
                txtNoOfOccupants.Text = Convert.ToString(dt.Rows[0]["NumberOfOccupants"]);
                txtNoOfOccupants.ReadOnly = true;
                //////////////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["ownertenant"]) == "T")
                {
                    chkOccupancyRenter.Checked = true;
                    chkOccupancyRenter.Enabled = false;
                    chkOccupancyHomeowner.Enabled = false;
                }
                else if (Convert.ToString(dt.Rows[0]["ownertenant"]) == "O")
                {
                    chkOccupancyHomeowner.Checked = true;
                    chkOccupancyRenter.Enabled = false;
                    chkOccupancyHomeowner.Enabled = false;
                }


                //////////////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["IsCrawlSpaceHeated"]) == "Y")
                {
                    ChkCrawlSpaceInsulatedYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsCrawlSpaceHeated"]) == "N")
                {
                    ChkCrawlSpaceInsulatedNo.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsCrawlSpaceHeated"]) == "P")
                {
                    ChkCrawlSpaceInsulatedPartially.Checked = true;
                }
                ////////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["IsGarageConnectedToHome"]) == "Y")
                {
                    ChkGarageConnectHomeYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsGarageConnectedToHome"]) == "N")
                {
                    ChkGarageConnectHomeNo.Checked = true;
                }


                ////////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["IsThereAnAttic"]) == "Y")
                {
                    ChkAtticYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsThereAnAttic"]) == "N")
                {
                    ChkAtticNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["IsTheAtticInsulated"]) == "Y")
                {
                    ChkAtticInsulatYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsTheAtticInsulated"]) == "N")
                {
                    ChkAtticInsulatNo.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsTheAtticInsulated"]) == "P")
                {
                    ChkAtticInsulatPartially.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["FlatOrSlopedCeilings"]) == "F")
                {
                    ChkSlopeCellingFlat.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["FlatOrSlopedCeilings"]) == "S")
                {
                    ChkSlopeCellingSloped.Checked = true;
                }

                /////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["AnyExhaustFansInBathroom"]) == "Y")
                {
                    ChkExhausFanYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["AnyExhaustFansInBathroom"]) == "N")
                {
                    ChkExhausFanNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["IsHomeBuiltOnConcreteSlab"]) == "Y")
                {
                    ChkConcreteSlabYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsHomeBuiltOnConcreteSlab"]) == "N")
                {
                    ChkConcreteSlabNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoYouHaveABaseMent"]) == "Y")
                {
                    ChkBasementYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoYouHaveABaseMent"]) == "N")
                {
                    ChkBasementNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["IsBaseMentHeated"]) == "Y")
                {
                    ChkBasmentHeatYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsBaseMentHeated"]) == "N")
                {
                    ChkBasmentHeatNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["CrawlSpace"]) == "Y")
                {
                    ChkCrawlSpaceYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["CrawlSpace"]) == "N")
                {
                    ChkCrawlSpaceNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["AnyHeatersInCrawlSpace"]) == "Y")
                {
                    ChkCrawlSpaceHeaterYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["AnyHeatersInCrawlSpace"]) == "N")
                {
                    ChkCrawlSpaceHeaterNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoPipesFreezeInWinter"]) == "Y")
                {
                    ChkPipeFrezeWinterYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoPipesFreezeInWinter"]) == "N")
                {
                    ChkPipeFrezeWinterNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["PipesOrFaucetsLeak"]) == "Y")
                {
                    ChkPipeFaucetLeakYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["PipesOrFaucetsLeak"]) == "N")
                {
                    ChkPipeFaucetLeakNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoYouHaveAGarage"]) == "Y")
                {
                    ChkHaveGarageYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoYouHaveAGarage"]) == "N")
                {
                    ChkHaveGarageNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["RoomsOverGarage"]) == "Y")
                {
                    ChkBerdRoomGarageYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["RoomsOverGarage"]) == "N")
                {
                    ChkBerdRoomGarageNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["ColdRoomsOverGarage"]) == "Y")
                {
                    ChkRoomColdYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["ColdRoomsOverGarage"]) == "N")
                {
                    ChkRoomColdNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["MainTypeOfHeating"]) == "E")
                {
                    ChkHeatTypeElectric.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["MainTypeOfHeating"]) == "O")
                {
                    ChkHeatTypeOil.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["MainTypeOfHeating"]) == "G")
                {
                    ChkHeatTypeGas.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["TypeOfHeatingUnit"]) == "F")
                {
                    ChkHeatingUnitFurnace.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["TypeOfHeatingUnit"]) == "B")
                {
                    ChkHeatingUnitBoiler.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["TypeOfHeatingUnit"]) == "H")
                {
                    ChkHeatingUnitHeatpump.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["TypeOfHeatingUnit"]) == "A")
                {
                    ChkHeatingUnitBasebord.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["ThermostatLocation"]) == "B")
                {
                    ChkThermostLocatBaseboard.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["ThermostatLocation"]) == "W")
                {
                    ChkThermostLocatWall.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoYouUseElectricSpaceHeaters"]) == "Y")
                {
                    ChkUseElectricSpaceHeaterYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoYouUseElectricSpaceHeaters"]) == "N")
                {
                    ChkUseElectricSpaceHeaterNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoAllHeatersWorkProperly"]) == "Y")
                {
                    ChkAllHeaterWorkProperYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoAllHeatersWorkProperly"]) == "N")
                {
                    ChkAllHeaterWorkProperNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoYouUseAirConditioningUnits"]) == "Y")
                {
                    ChkUseAirConditioningYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoYouUseAirConditioningUnits"]) == "N")
                {
                    ChkUseAirConditioningNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["WindowOrWallUnits"]) == "A")
                {
                    ChkWall.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["WindowOrWallUnits"]) == "W")
                {
                    ChkWindow.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoesHotWaterHeaterLeak"]) == "Y")
                {
                    ChkWaterHeaterLeakYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoesHotWaterHeaterLeak"]) == "N")
                {
                    ChkWaterHeaterLeakNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["IsHotWaterHeaterRusty"]) == "Y")
                {
                    ChkWaterHeaterRustyYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsHotWaterHeaterRusty"]) == "N")
                {
                    ChkWaterHeaterRustyNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoYouUseChestFreezer"]) == "Y")
                {
                    ChkUseChestFreezerYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoYouUseChestFreezer"]) == "N")
                {
                    ChkUseChestFreezerNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoYouUseAWasher"]) == "Y")
                {
                    ChkUseWasherYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoYouUseAWasher"]) == "N")
                {
                    ChkUseWasherNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoYouUseADryer"]) == "Y")
                {
                    ChkUseDryerYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoYouUseADryer"]) == "N")
                {
                    ChkUseDryerNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["ApartmentFloorAbove"]) == "A")
                {
                    chkAparmntAbove.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["ApartmentFloorBelow"]) == "A")
                {
                    chkAparmntBelow.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["StairwayAccess"]) == "A")
                {
                    ChkAtticStairway.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["HatchNoPDS"]) == "A")
                {
                    ChkAtticHatchNoPds.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["HatchWithPDS"]) == "A")
                {
                    ChkAtticHatchWithPds.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["IsBaseMentInsulated"]) == "Y")
                {
                    ChkInsulationBasemntYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsBaseMentInsulated"]) == "N")
                {
                    ChkInsulationBasemntNo.Checked = true;
                }


                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoYouUseCombustibleAppliances"]) == "Y")
                {
                    ChkCombustibleAppliancesYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoYouUseCombustibleAppliances"]) == "N")
                {
                    ChkCombustibleAppliancesNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoYouUseCombustible2Appliances"]) == "Y")
                {
                    ChkCombustibleAppliancesWorkYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoYouUseCombustible2Appliances"]) == "N")
                {
                    ChkCombustibleAppliancesWorkNo.Checked = true;
                }

                //////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["DoYouUseCombustible3Appliances"]) == "Y")
                {
                    ChkAppliancesHaveFuelYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoYouUseCombustible3Appliances"]) == "N")
                {
                    ChkAppliancesHaveFuelNo.Checked = true;
                }

            }

        }
        catch
        {
        }
    }

    #endregion
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["UC"] != null)
            {
                if (Convert.ToString(Request.QueryString["UC"]) == "PPL")
                {
                    Response.Redirect("DisplayJobSearchRecords.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"] + "&Utility=2");
                }
            }
        }
        catch
        {
        }
    }
}
