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

public partial class METED_METED_Audit_Page17 : System.Web.UI.Page
{
    METEDAudit obj_MetedAudit = new METEDAudit();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Jobs"] != null)
                {
                    if (Request.QueryString["Jobs"].ToString() != "")
                    {
                        fill_form();
                    }
                }
            }
        }
        catch
        {
        }
        if (Convert.ToString(Session["finalize"]) == "F")
        {
            btnUpdate.Visible = false;
            spnFinal.InnerHtml = "Audit Finalize";
        }
    }
    public void fill_form()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_17(JobNum);
            if (dt.Rows.Count > 0)
            {
                string PrePostWorkTesting = Convert.ToString(dt.Rows[0]["PrePostWorkTesting"]);
                if (PrePostWorkTesting == "Pre")
                {
                    rdo_PreTest.Checked = true;
                }
                else if (PrePostWorkTesting == "Post")
                {
                    rdo_PostTest.Checked = true;
                }


                string AuditorCrewWorkTesting = Convert.ToString(dt.Rows[0]["AuditorCrewWorkTesting"]);
                if (AuditorCrewWorkTesting == "A")
                {
                    rdo_Auditor.Checked = true;
                }
                else if (AuditorCrewWorkTesting == "C")
                {
                    rdo_Crew.Checked = true;
                    txt_Crew.Text = Convert.ToString(dt.Rows[0]["PrePostWorkTestingComment"]);
                }


                //////////////////////////////////////////////////////////////////////////////////

                txt_TechName.Text = Convert.ToString(dt.Rows[0]["TechName"]);
                txt_TestDate.Text = Convert.ToString(dt.Rows[0]["TestDate"]);
                txt_Note1_17.Text = Convert.ToString(dt.Rows[0]["Note1_17"]);

                /////////////////////////////////////////////////////////////////////////////////

                string CombustionSafetyTestingCombustionAppliances = Convert.ToString(dt.Rows[0]["CombustionSafetyTestingCombustionAppliances"]);
                if (CombustionSafetyTestingCombustionAppliances == "Y")
                {
                    rdo_CombustionAppliances_Yes.Checked = true;
                }
                else if (CombustionSafetyTestingCombustionAppliances == "N")
                {
                    rdo_CombustionAppliances_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////

                string CombustionHeatAppliances = Convert.ToString(dt.Rows[0]["CombustionHeatAppliances"]);
                if (CombustionHeatAppliances == "Y")
                {
                    rdo_UnventedCombustionHeatingApp_Y.Checked = true;
                }
                else if (CombustionHeatAppliances == "N")
                {
                    rdo_UnventedCombustionHeatingApp_N.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////

                txt_Co_WaterHeater_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOInitialAMB"]);
                txt_Co_WaterHeater_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOInitialCAZ"]);
                txt_After_WaterHeater_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOAfterAMB"]);
                txt_After_WaterHeater_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOAfterCAZ"]);
                txt_GasLeak_WaterHeater.Text = Convert.ToString(dt.Rows[0]["WaterHeaterGasLeak"]);
                txt_Flame_WaterHeater.Text = Convert.ToString(dt.Rows[0]["WaterHeaterFlameRollout"]);
                txt_Spillage_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageWC"]);
                txt_Spillage_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageNAT"]);
                txt_SpillageAfter_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageAfterWC"]);
                txt_SpillageAfter_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageAfterNAT"]);
                txt_DraftPress_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPressureWC"]);
                txt_DraftPress_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPressureNAT"]);
                txt_DraftPass_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassWC"]);
                txt_DraftPass_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassNAT"]);
                txt_CoFuel_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOFlueWC"]);
                txt_CoFuel_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOFlueNAT"]);
                txt_CoPass_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOPassWC"]);
                txt_CoPass_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOPassNAT"]);
                txt_Optional_WaterHeater_StackTemp.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalStackTemp"]);
                txt_Optional_WaterHeater_O2.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalO2"]);
                txt_Optional_WaterHeater_Eff.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalEff"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Co_FurnaceBoil_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOInitialAMB"]);
                txt_Co_FurnaceBoil_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOInitialCAZ"]);
                txt_CoAfter_FurnaceBoil_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOAfterWC"]);
                txt_CoAfter_FurnaceBoil_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOAfterNAT"]);
                txt_GasLeak_FurnaceBoil.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerGasLeak"]);
                txt_Flame_FurnaceBoil.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerFlameRollout"]);
                txt_Spillage_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageWC"]);
                txt_Spillage_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageNAT"]);
                txt_SpillageAfter_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageAfterWC"]);
                txt_SpillageAfter_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageAfterNAT"]);
                txt_DraftPress_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPressureWC"]);
                txt_DraftPress_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPressureNAT"]);
                txt_DraftPass_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassWC"]);
                txt_DraftPass_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassNAT"]);
                txt_CoFuel_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOFlueWC"]);
                txt_CoFuel_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOFlueNAT"]);
                txt_CoPass_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOPassWC"]);
                txt_CoPass_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOPassNAT"]);
                txt_Optional_FurnaceBoil_Stack.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalStackTemp"]);
                txt_Optional_FurnaceBoil_O2.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalO2"]);
                txt_Optional_FurnaceBoil_Eff.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalEff"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_Co_GasRange_AMB.Text = Convert.ToString(dt.Rows[0]["GasRangeCOInitialAMB"]);
                txt_Co_GasRange_CAZ.Text = Convert.ToString(dt.Rows[0]["GasRangeCOInitialCAZ"]);
                txt_CoAfter_GasRange_AMB.Text = Convert.ToString(dt.Rows[0]["GasRangeCOAfterWC"]);
                txt_CoAfter_GasRange_CAZ.Text = Convert.ToString(dt.Rows[0]["GasRangeCOAfterCAZ"]);
                txt_GasLeak_GasRange.Text = Convert.ToString(dt.Rows[0]["GasRangeGasLeak"]);
                txt_Flame_GasRange.Text = Convert.ToString(dt.Rows[0]["GasRangeFlameRollout"]);
                txt_Spillage_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageWC"]);
                txt_Spillage_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageNAT"]);
                txt_SpillageAfter_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageAfterWC"]);
                txt_SpillageAfter_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageAfterNAT"]);
                txt_DraftPress_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPressureWC"]);
                txt_DraftPress_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPressureNAT"]);
                txt_DraftPass_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPassWC"]);
                txt_DraftPass_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPassNAT"]);
                txt_CoFuel_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeCOFlueWC"]);
                txt_CoFuel_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeCOFlueNAT"]);
                txt_CoPass_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeCOPassWC"]);
                txt_CoPass_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeCOPassNAT"]);
                txt_Optional_GasRange_Stack.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalStackTemp"]);
                txt_Optional_GasRange_O2.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalO2"]);
                txt_Optional_GasRange_Eff.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalEff"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_Co_Other_AMB.Text = Convert.ToString(dt.Rows[0]["OtherCOInitialAMB"]);
                txt_Co_Other_CAZ.Text = Convert.ToString(dt.Rows[0]["OtherCOInitialCAZ"]);
                txt_CoAfter_Other_AMB.Text = Convert.ToString(dt.Rows[0]["OtherCOAfterAMB"]);
                txt_CoAfter_Other_CAZ.Text = Convert.ToString(dt.Rows[0]["OtherCOAfterCAZ"]);
                txt_GasLeak_Other.Text = Convert.ToString(dt.Rows[0]["OtherGasLeak"]);
                txt_Flame_Other.Text = Convert.ToString(dt.Rows[0]["OtherFlameRollout"]);
                txt_Spillage_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherSpillageWC"]);
                txt_Spillage_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherSpillageNAT"]);
                txt_SpillageAfter_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherSpillageAfterWC"]);
                txt_SpillageAfter_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherSpillageAfterNAT"]);
                txt_DraftPress_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherDraftPressureWC"]);
                txt_DraftPress_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherDraftPressureNAT"]);
                txt_DraftPass_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherDraftPassWC"]);
                txt_DraftPass_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherDraftPassNAT"]);
                txt_CoFuel_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherCoFlueWC"]);
                txt_CoFuel_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherCoFlueNAT"]);
                txt_CoPass_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherCoPassWC"]);
                txt_CoPass_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherCoPassNAT"]);
                txt_Optional_Other_Stack.Text = Convert.ToString(dt.Rows[0]["OtherOptionalStackTemp"]);
                txt_Optional_Other_O2.Text = Convert.ToString(dt.Rows[0]["OtherOptionalO2"]);
                txt_Optional_Other_Eff.Text = Convert.ToString(dt.Rows[0]["OtherOptionalEff"]);


                /////////////////////////////////////////////////////////////////////////////////////


                txt_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1"]);
                txt_Co_Col1Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COInitialAMB"]);
                txt_Co_Col1Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COInitialCAZ"]);
                txt_CoAfter_Col1Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COAfterlAMB"]);
                txt_CoAfter_Col1Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COAfterCAZ"]);
                txt_GasLeak_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1_GasLeak"]);
                txt_Flame_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1_FlameRollout"]);
                txt_Spillage_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageWC"]);
                txt_Spillage_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageNAT"]);
                txt_SpillageAfter_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageAfterWC"]);
                txt_SpillageAfter_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageAfterNAT"]);
                txt_DraftPress_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPressureWC"]);
                txt_DraftPress_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPressureNAT"]);
                txt_DraftPass_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPassWC"]);
                txt_DraftPass_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPassNAT"]);
                txt_CoFuel_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoFlueWC"]);
                txt_CoFuel_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoFlueNAT"]);
                txt_CoPass_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoPassWC"]);
                txt_CoPass_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoPassNAT"]);
                txt_Optional_Col1Cat_Stack.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalStackTemp"]);
                txt_Optional_Col1Cat_O2.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalO2"]);
                txt_Optional_Col1Cat_Eff.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalEff"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Total_BTUH.Text= Convert.ToString(dt.Rows[0]["TotalBTUH"]);
                txt_VolumeCombustionAir.Text = Convert.ToString(dt.Rows[0]["VolumeCombustionAir"]);
                txt_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2"]);
                txt_Co_Col2Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COInitialAMB"]);
                txt_Co_Col2Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COInitialCAZ"]);
                txt_CoAfter_Col2Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COAfterAMB"]);
                txt_CoAfter_Col2Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COAfterCAZ"]);
                txt_GasLeak_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2_GasLeak"]);
                txt_Flame_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2_FlameRollout"]);
                txt_Spillage_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageWC"]);
                txt_Spillage_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageNAT"]);
                txt_SpillageAfter_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageAfterWC"]);
                txt_SpillageAfter_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageAfterNAT"]);
                txt_DraftPress_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPressureWC"]);
                txt_DraftPress_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPressureNAT"]);
                txt_DraftPass_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPassWC"]);
                txt_DraftPass_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPassNAT"]);
                txt_CoFuel_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoFlueWC"]);
                txt_CoFuel_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoFlueNAT"]);
                txt_CoPass_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoPassWC"]);
                txt_CoPass_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoPassNAT"]);
                txt_Optional_Col2Cat_Stack.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalStackTemp"]);
                txt_Optional_Col2Cat_O2.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalO2"]);
                txt_Optional_Col2Cat_Eff.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalEff"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_COAmbient.Text = Convert.ToString(dt.Rows[0]["OvenCOAmbient"]);
                txt_CO_Oven_Vent.Text = Convert.ToString(dt.Rows[0]["OvenCOAt"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_CoNotes1.Text = Convert.ToString(dt.Rows[0]["BlankCenter_1"]);
                txt_CoNotes2.Text = Convert.ToString(dt.Rows[0]["BlankCenter_2"]);
                txt_CoNotes3.Text = Convert.ToString(dt.Rows[0]["BlankCenter_3"]);
                txt_CoNotes4.Text = Convert.ToString(dt.Rows[0]["BlankCenter_4"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_CoNotes.Text = Convert.ToString(dt.Rows[0]["Notes"]);

                /////////////////////////////////////////////////////////////////////////////////////////////


                txt_OutdoorTemperature.Text = Convert.ToString(dt.Rows[0]["OutdoorTemperature"]);

                //////////////////////////////////////////////////////////////////////////////////////////////


                txt_CAZDepressurization_Natural.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseNatural"]);
                txt_CAZDepressurization_WC.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseWC"]);
                txt_CAZDepressurization_Diff.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseDiff"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string SelectAppliancesCheckbox_Dryer = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Dryer"]);
                if (SelectAppliancesCheckbox_Dryer == "Y")
                {
                    chk_Appliances_WorstCase_Dryer.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_WHF = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_WHF"]);
                if (SelectAppliancesCheckbox_WHF == "Y")
                {
                    chk_Appliances_WorstCase_WholeHouseFan.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_Bath = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Bath"]);
                if (SelectAppliancesCheckbox_Bath == "Y")
                {
                    chk_Appliances_WorstCase_BathFan.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_HVAC = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_HVAC"]);
                if (SelectAppliancesCheckbox_HVAC == "Y")
                {
                    chk_Appliances_WorstCase_HVACAirHandler.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_KF = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_KF"]);
                if (SelectAppliancesCheckbox_KF == "Y")
                {
                    chk_Appliances_WorstCase_KitchenFan.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_AtticFan = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_AtticFan"]);
                if (SelectAppliancesCheckbox_AtticFan == "Y")
                {
                    chk_Appliances_WorstCase_AtticFan.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_Other = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Other"]);
                if (SelectAppliancesCheckbox_Other == "Y")
                {
                    chk_Appliances_WorstCase_Other.Checked = true;
                    txt_Appliances_WorstCase_Other.Text = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Othertext"]);
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string PassRadiobtn = Convert.ToString(dt.Rows[0]["PassRadiobtn"]);
                if (PassRadiobtn == "Y")
                {
                    rdo_CAZPass_Yes.Checked = true;
                }
                else if (PassRadiobtn == "N")
                {
                    rdo_CAZPass_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string EmergencySituationCheckBox = Convert.ToString(dt.Rows[0]["EmergencySituationCheckBox"]);
                if (EmergencySituationCheckBox == "Y")
                {
                    chk_Emergency_GasCompanyCalled.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string WorkCheckbox = Convert.ToString(dt.Rows[0]["WorkCheckbox"]);
                if (WorkCheckbox == "Y")
                {
                    chk_WorkCannot_MoreFailedTests.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_FinalNotes.Text = Convert.ToString(dt.Rows[0]["BottomNotes"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            }

        }
        catch
        {

        }

    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../DisplayJobSearchRecords.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
        }
        catch
        {
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int i = 0;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////


            string PrePostWorkTesting = "";
            string PrePostWorkTestingComment = "";
            if (rdo_PreTest.Checked == true)
            {
                PrePostWorkTesting = "Pre";
            }
            else if (rdo_PostTest.Checked == true)
            {
                PrePostWorkTesting = "Post";
            }


            string AuditorCrewWorkTesting = "";
            if (rdo_Auditor.Checked == true)
            {
                AuditorCrewWorkTesting = "A";
            }
            else if (rdo_Crew.Checked == true)
            {
                AuditorCrewWorkTesting = "C";
                PrePostWorkTestingComment = txt_Crew.Text;
            }


            //////////////////////////////////////////////////////////////////////////////////



            string CombustionSafetyTestingCombustionAppliances = "";
            if (rdo_CombustionAppliances_Yes.Checked == true)
            {
                CombustionSafetyTestingCombustionAppliances = "Y";
            }
            else if (rdo_CombustionAppliances_No.Checked == true)
            {
                CombustionSafetyTestingCombustionAppliances = "N";
            }


            ////////////////////////////////////////////////////////////////////////////////////////////

            string CombustionHeatAppliances = "";
            if (rdo_UnventedCombustionHeatingApp_Y.Checked == true)
            {
                CombustionHeatAppliances = "Y";

            }
            else if (rdo_UnventedCombustionHeatingApp_N.Checked == true)
            {
                CombustionHeatAppliances = "N";

            }

            /////////////////////////////////////////////////////////////////////////////////////



            string SelectAppliancesCheckbox_Dryer = "";
            if (chk_Appliances_WorstCase_Dryer.Checked == true)
            {
                SelectAppliancesCheckbox_Dryer = "Y";
            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////


            string SelectAppliancesCheckbox_WHF = "";
            if (chk_Appliances_WorstCase_WholeHouseFan.Checked == true)
            {
                SelectAppliancesCheckbox_WHF = "Y";
            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string SelectAppliancesCheckbox_Bath = "";
            if (chk_Appliances_WorstCase_BathFan.Checked == true)
            {
                SelectAppliancesCheckbox_Bath = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string SelectAppliancesCheckbox_HVAC = "";
            if (chk_Appliances_WorstCase_HVACAirHandler.Checked == true)
            {
                SelectAppliancesCheckbox_HVAC = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string SelectAppliancesCheckbox_KF = "";
            if (chk_Appliances_WorstCase_KitchenFan.Checked == true)
            {
                SelectAppliancesCheckbox_KF = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string SelectAppliancesCheckbox_AtticFan = "";
            if (chk_Appliances_WorstCase_AtticFan.Checked == true)
            {
                SelectAppliancesCheckbox_AtticFan = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string SelectAppliancesCheckbox_Other = "";
            string SelectAppliancesCheckbox_Othertext1 = "";
            if (chk_Appliances_WorstCase_Other.Checked == true)
            {
                SelectAppliancesCheckbox_Other = "Y";
                SelectAppliancesCheckbox_Othertext1 = txt_Appliances_WorstCase_Other.Text;
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string PassRadiobtn = "";
            if (rdo_CAZPass_Yes.Checked == true)
            {
                PassRadiobtn = "Y";
            }
            else if (rdo_CAZPass_No.Checked == true)
            {
                PassRadiobtn = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string EmergencySituationCheckBox = "";
            if (chk_Emergency_GasCompanyCalled.Checked == true)
            {
                EmergencySituationCheckBox = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string WorkCheckbox = "";
            if (chk_WorkCannot_MoreFailedTests.Checked == true)
            {
                WorkCheckbox = "Y";
            }


            /////////////////////////////////////////////////////////////////////////////////////////////////////
            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_17(JobNum, AuditorCrewWorkTesting, PrePostWorkTesting, PrePostWorkTestingComment, txt_TechName.Text, txt_TestDate.Text, CombustionSafetyTestingCombustionAppliances, CombustionHeatAppliances, txt_Co_WaterHeater_AMB.Text, txt_Co_WaterHeater_CAZ.Text, txt_After_WaterHeater_AMB.Text, txt_After_WaterHeater_CAZ.Text, txt_GasLeak_WaterHeater.Text, txt_Flame_WaterHeater.Text, txt_Spillage_WaterHeater_WC.Text, txt_Spillage_WaterHeater_NAT.Text, txt_SpillageAfter_WaterHeater_WC.Text, txt_SpillageAfter_WaterHeater_NAT.Text, txt_DraftPress_WaterHeater_WC.Text, txt_DraftPress_WaterHeater_NAT.Text, txt_DraftPass_WaterHeater_WC.Text, txt_DraftPass_WaterHeater_NAT.Text, txt_CoFuel_WaterHeater_WC.Text, txt_CoFuel_WaterHeater_NAT.Text, txt_CoPass_WaterHeater_WC.Text, txt_CoPass_WaterHeater_NAT.Text, txt_Optional_WaterHeater_StackTemp.Text, txt_Optional_WaterHeater_O2.Text, txt_Optional_WaterHeater_Eff.Text, txt_Co_FurnaceBoil_AMB.Text, txt_Co_FurnaceBoil_CAZ.Text, txt_CoAfter_FurnaceBoil_AMB.Text, txt_CoAfter_FurnaceBoil_CAZ.Text, txt_GasLeak_FurnaceBoil.Text, txt_Flame_FurnaceBoil.Text, txt_Spillage_FurnaceBoil_WC.Text, txt_Spillage_FurnaceBoil_NAT.Text, txt_SpillageAfter_FurnaceBoil_WC.Text, txt_SpillageAfter_FurnaceBoil_NAT.Text, txt_DraftPress_FurnaceBoil_WC.Text, txt_DraftPress_FurnaceBoil_NAT.Text, txt_DraftPass_FurnaceBoil_WC.Text, txt_DraftPass_FurnaceBoil_NAT.Text, txt_CoFuel_FurnaceBoil_WC.Text, txt_CoFuel_FurnaceBoil_NAT.Text, txt_CoPass_FurnaceBoil_WC.Text, txt_CoPass_FurnaceBoil_NAT.Text, txt_Optional_FurnaceBoil_Stack.Text, txt_Optional_FurnaceBoil_O2.Text, txt_Optional_FurnaceBoil_Eff.Text, txt_Co_GasRange_AMB.Text, txt_Co_GasRange_CAZ.Text, txt_CoAfter_GasRange_AMB.Text, txt_CoAfter_GasRange_CAZ.Text, txt_GasLeak_GasRange.Text, txt_Flame_GasRange.Text, txt_Spillage_GasRange_WC.Text, txt_Spillage_GasRange_NAT.Text, txt_SpillageAfter_GasRange_WC.Text, txt_SpillageAfter_GasRange_NAT.Text, txt_DraftPress_GasRange_WC.Text, txt_DraftPress_GasRange_NAT.Text, txt_DraftPass_GasRange_WC.Text, txt_DraftPass_GasRange_NAT.Text, txt_CoFuel_GasRange_WC.Text, txt_CoFuel_GasRange_NAT.Text, txt_CoPass_GasRange_WC.Text, txt_CoPass_GasRange_NAT.Text, txt_Optional_GasRange_Stack.Text, txt_Optional_GasRange_O2.Text, txt_Optional_GasRange_Eff.Text, txt_Co_Other_AMB.Text, txt_Co_Other_CAZ.Text, txt_CoAfter_Other_AMB.Text, txt_CoAfter_Other_CAZ.Text, txt_GasLeak_Other.Text, txt_Flame_Other.Text, txt_Spillage_Other_WC.Text, txt_Spillage_Other_NAT.Text, txt_SpillageAfter_Other_WC.Text, txt_SpillageAfter_Other_NAT.Text, txt_DraftPress_Other_WC.Text, txt_DraftPress_Other_NAT.Text, txt_DraftPass_Other_WC.Text, txt_DraftPass_Other_NAT.Text, txt_CoFuel_Other_WC.Text, txt_CoFuel_Other_NAT.Text, txt_CoPass_Other_WC.Text, txt_CoPass_Other_NAT.Text, txt_Optional_Other_Stack.Text, txt_Optional_Other_O2.Text, txt_Optional_Other_Eff.Text, txt_Col1Cat.Text, txt_Co_Col1Cat_AMB.Text, txt_Co_Col1Cat_CAZ.Text, txt_CoAfter_Col1Cat_AMB.Text, txt_CoAfter_Col1Cat_CAZ.Text, txt_GasLeak_Col1Cat.Text, txt_Flame_Col1Cat.Text, txt_Spillage_Col1Cat_WC.Text, txt_Spillage_Col1Cat_NAT.Text, txt_SpillageAfter_Col1Cat_WC.Text, txt_SpillageAfter_Col1Cat_NAT.Text, txt_DraftPress_Col1Cat_WC.Text, txt_DraftPress_Col1Cat_NAT.Text, txt_DraftPass_Col1Cat_WC.Text, txt_DraftPass_Col1Cat_NAT.Text, txt_CoFuel_Col1Cat_WC.Text, txt_CoFuel_Col1Cat_NAT.Text, txt_CoPass_Col1Cat_WC.Text, txt_CoPass_Col1Cat_NAT.Text, txt_Optional_Col1Cat_Stack.Text, txt_Optional_Col1Cat_O2.Text, txt_Optional_Col1Cat_Eff.Text, txt_Col2Cat.Text, txt_Co_Col2Cat_AMB.Text, txt_Co_Col2Cat_CAZ.Text, txt_CoAfter_Col2Cat_AMB.Text, txt_CoAfter_Col2Cat_CAZ.Text, txt_GasLeak_Col2Cat.Text, txt_Flame_Col2Cat.Text, txt_Spillage_Col2Cat_WC.Text, txt_Spillage_Col2Cat_NAT.Text, txt_SpillageAfter_Col2Cat_WC.Text, txt_SpillageAfter_Col2Cat_NAT.Text, txt_DraftPress_Col2Cat_WC.Text, txt_DraftPress_Col2Cat_NAT.Text, txt_DraftPass_Col2Cat_WC.Text, txt_DraftPass_Col2Cat_NAT.Text, txt_CoFuel_Col2Cat_WC.Text, txt_CoFuel_Col2Cat_NAT.Text, txt_CoPass_Col2Cat_WC.Text, txt_CoPass_Col2Cat_NAT.Text, txt_Optional_Col2Cat_Stack.Text, txt_Optional_Col2Cat_O2.Text, txt_Optional_Col2Cat_Eff.Text, txt_COAmbient.Text, txt_CO_Oven_Vent.Text, txt_CoNotes1.Text, txt_CoNotes2.Text, txt_CoNotes3.Text, txt_CoNotes4.Text, txt_CoNotes.Text, txt_OutdoorTemperature.Text, txt_CAZDepressurization_Natural.Text, txt_CAZDepressurization_WC.Text, txt_CAZDepressurization_Diff.Text, SelectAppliancesCheckbox_Dryer, SelectAppliancesCheckbox_WHF, SelectAppliancesCheckbox_Bath, SelectAppliancesCheckbox_HVAC, SelectAppliancesCheckbox_KF, SelectAppliancesCheckbox_AtticFan, SelectAppliancesCheckbox_Other, SelectAppliancesCheckbox_Othertext1, PassRadiobtn, EmergencySituationCheckBox, WorkCheckbox, txt_FinalNotes.Text, txt_Note1_17.Text, txt_Total_BTUH.Text, txt_VolumeCombustionAir.Text);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {

        }
    }
}
