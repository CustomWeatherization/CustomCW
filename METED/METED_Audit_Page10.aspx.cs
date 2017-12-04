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

public partial class METED_METED_Audit_Page10 : System.Web.UI.Page
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_10(JobNum);
            DateTime dateRec = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]);
            DateTime dateComr = Convert.ToDateTime("1/12/2015");
            if (dateRec < dateComr)
            {
                tr_NewestACUnit.Visible = false;
                td_CentralACUnit.Visible = false;
            }
            else
            {
                tr_NewestACUnit.Visible = true;
                td_CentralACUnit.Visible = true;
            }
            if (dt.Rows.Count > 0)
            {

                txt_SummerSeasonalUse.Text = Convert.ToString(dt.Rows[0]["SummerSeasonalUse"]);

                txt_CentralACUnit.Text = Convert.ToString(dt.Rows[0]["CentralACUnit"]);
                txt_NewestACUnit.Text = Convert.ToString(dt.Rows[0]["NewestACUnit"]);

                //////////////////////////////////////////////////////////////////////////////////////////

                string WindowsNotShaded = Convert.ToString(dt.Rows[0]["WindowsNotShaded"]);
                if (WindowsNotShaded == "Y")
                {
                    rdo_WindowFilm_Yes.Checked = true;
                }
                else if (WindowsNotShaded == "N")
                {
                    rdo_WindowFilm_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////

                txt_WindowFilmNeeded.Text = Convert.ToString(dt.Rows[0]["ApproxSquareFootage"]);
                txt_West_ReceiveFilm.Text = Convert.ToString(dt.Rows[0]["NumberWestFacingWindows"]);
                txt_South_ReceiveFilm.Text = Convert.ToString(dt.Rows[0]["NumberSouthFacingWindows"]);
                txt_East_ReceiveFilm.Text = Convert.ToString(dt.Rows[0]["NumberEastFacingWindows"]);

                /////////////////////////////////////////////////////////////////////////////////////////

                string RollRoofMaterial = Convert.ToString(dt.Rows[0]["RollRoofMaterial"]);
                if (RollRoofMaterial == "Y")
                {
                    rdo_RoofCoating_Roofmaterial_Yes.Checked = true;
                }
                else if (RollRoofMaterial == "N")
                {
                    rdo_RoofCoating_Roofmaterial_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////


                string InstallRoofCoat = Convert.ToString(dt.Rows[0]["InstallRoofCoat"]);
                if (InstallRoofCoat == "Y")
                {
                    rdo_InstallRoofCoat_Yes.Checked = true;
                }
                else if (InstallRoofCoat == "N")
                {
                    rdo_InstallRoofCoat_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////

                txt_FootageOfRoof.Text = Convert.ToString(dt.Rows[0]["ApproxSquareFootageOfRoofTimes2"]);

                /////////////////////////////////////////////////////////////////////////////////////////

                string ReduceAirConditioning = Convert.ToString(dt.Rows[0]["ReduceAirConditioning"]);
                if (ReduceAirConditioning == "Y")
                {
                    rdo_ReduceACUse_Yes.Checked = true;
                }
                else if (ReduceAirConditioning == "N")
                {
                    rdo_ReduceACUse_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////

                txt_Will_Install.Text = Convert.ToString(dt.Rows[0]["WillInstall"]);
                txt_comment.Text = Convert.ToString(dt.Rows[0]["Comment"]);

                /////////////////////////////////////////////////////////////////////////////////////////

                txt_Line1_UnitWatts.Text = Convert.ToString(dt.Rows[0]["UnitWatts1"]);
                txt_Line1_EER.Text = Convert.ToString(dt.Rows[0]["EER1"]);

                string ReplaceAC1 = Convert.ToString(dt.Rows[0]["ReplaceAC1"]);
                if (ReplaceAC1 == "Y")
                {
                    chk_Line1_ReplaceAC.Checked = true;
                }
                txt_Line1_CurrentSize_BTU.Text = Convert.ToString(dt.Rows[0]["CurrentSize1"]);
                txt_Line1_CurrentLocation.Text = Convert.ToString(dt.Rows[0]["CurrentLocation1"]);
                txt_Line1_NewSize_BTU.Text = Convert.ToString(dt.Rows[0]["NewSize1"]);
                txt_Line1_Install_Location.Text = Convert.ToString(dt.Rows[0]["InstalledLocation1"]);

                string ReplaceFilter1 = Convert.ToString(dt.Rows[0]["ReplaceFilter1"]);
                if (ReplaceFilter1 == "Y")
                {
                    chk_Line1_ReplaceFilter.Checked = true;
                }
                string CleanFilter1 = Convert.ToString(dt.Rows[0]["CleanFilter1"]);
                if (CleanFilter1 == "Y")
                {
                    chk_Line1_CleanFilter.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////

                txt_Line2_UnitWatts.Text = Convert.ToString(dt.Rows[0]["UnitWatts2"]);
                txt_Line2_EER.Text = Convert.ToString(dt.Rows[0]["EER2"]);

                string ReplaceAC2 = Convert.ToString(dt.Rows[0]["ReplaceAC2"]);
                if (ReplaceAC2 == "Y")
                {
                    chk_Line2_ReplaceAC.Checked = true;
                }
                txt_Line2_CurrentSize_BTU.Text = Convert.ToString(dt.Rows[0]["CurrentSize2"]);
                txt_Line2_CurrentLocation.Text = Convert.ToString(dt.Rows[0]["CurrentLocation2"]);
                txt_Line2_NewSize_BTU.Text = Convert.ToString(dt.Rows[0]["NewSize2"]);
                txt_Line2_Install_Location.Text = Convert.ToString(dt.Rows[0]["InstalledLocation2"]);

                string ReplaceFilter2 = Convert.ToString(dt.Rows[0]["ReplaceFilter2"]);
                if (ReplaceFilter2 == "Y")
                {
                    chk_Line2_ReplaceFilter.Checked = true;
                }
                string CleanFilter2 = Convert.ToString(dt.Rows[0]["CleanFilter2"]);
                if (CleanFilter2 == "Y")
                {
                    chk_Line2_CleanFilter.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////

                txt_Line3_UnitWatts.Text = Convert.ToString(dt.Rows[0]["UnitWatts3"]);
                txt_Line3_EER.Text = Convert.ToString(dt.Rows[0]["EER3"]);

                string ReplaceAC3 = Convert.ToString(dt.Rows[0]["ReplaceAC3"]);
                if (ReplaceAC3 == "Y")
                {
                    chk_Line3_ReplaceAC.Checked = true;
                }
                txt_Line3_CurrentSize_BTU.Text = Convert.ToString(dt.Rows[0]["CurrentSize3"]);
                txt_Line3_CurrentLocation.Text = Convert.ToString(dt.Rows[0]["CurrentLocation3"]);
                txt_Line3_NewSize_BTU.Text = Convert.ToString(dt.Rows[0]["NewSize3"]);
                txt_Line3_Install_Location.Text = Convert.ToString(dt.Rows[0]["InstalledLocation3"]);

                string ReplaceFilter3 = Convert.ToString(dt.Rows[0]["ReplaceFilter3"]);
                if (ReplaceFilter3 == "Y")
                {
                    chk_Line3_ReplaceFilter.Checked = true;
                }
                string CleanFilter3 = Convert.ToString(dt.Rows[0]["CleanFilter3"]);
                if (CleanFilter3 == "Y")
                {
                    chk_Line3_CleanFilter.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////

                txt_Line4_UnitWatts.Text = Convert.ToString(dt.Rows[0]["UnitWatts4"]);
                txt_Line4_EER.Text = Convert.ToString(dt.Rows[0]["EER4"]);

                string ReplaceAC4 = Convert.ToString(dt.Rows[0]["ReplaceAC4"]);
                if (ReplaceAC4 == "Y")
                {
                    chk_Line4_ReplaceAC.Checked = true;
                }
                txt_Line4_CurrentSize_BTU.Text = Convert.ToString(dt.Rows[0]["CurrentSize4"]);
                txt_Line4_CurrentLocation.Text = Convert.ToString(dt.Rows[0]["CurrentLocation4"]);
                txt_Line4_NewSize_BTU.Text = Convert.ToString(dt.Rows[0]["NewSize4"]);
                txt_Line4_Install_Location.Text = Convert.ToString(dt.Rows[0]["InstalledLocation4"]);

                string ReplaceFilter4 = Convert.ToString(dt.Rows[0]["ReplaceFilter4"]);
                if (ReplaceFilter4 == "Y")
                {
                    chk_Line4_ReplaceFilter.Checked = true;
                }
                string CleanFilter4 = Convert.ToString(dt.Rows[0]["CleanFilter4"]);
                if (CleanFilter4 == "Y")
                {
                    chk_Line4_CleanFilter.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////

                txt_Line5_UnitWatts.Text = Convert.ToString(dt.Rows[0]["UnitWatts5"]);
                txt_Line5_EER.Text = Convert.ToString(dt.Rows[0]["EER5"]);

                string ReplaceAC5 = Convert.ToString(dt.Rows[0]["ReplaceAC5"]);
                if (ReplaceAC5 == "Y")
                {
                    chk_Line5_ReplaceAC.Checked = true;
                }
                txt_Line5_CurrentSize_BTU.Text = Convert.ToString(dt.Rows[0]["CurrentSize5"]);
                txt_Line5_CurrentLocation.Text = Convert.ToString(dt.Rows[0]["CurrentLocation5"]);
                txt_Line5_NewSize_BTU.Text = Convert.ToString(dt.Rows[0]["NewSize5"]);
                txt_Line5_Install_Location.Text = Convert.ToString(dt.Rows[0]["InstalledLocation5"]);

                string ReplaceFilter5 = Convert.ToString(dt.Rows[0]["ReplaceFilter5"]);
                if (ReplaceFilter5 == "Y")
                {
                    chk_Line5_ReplaceFilter.Checked = true;
                }
                string CleanFilter5 = Convert.ToString(dt.Rows[0]["CleanFilter5"]);
                if (CleanFilter5 == "Y")
                {
                    chk_Line5_CleanFilter.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////

                txt_CustomerWindowACThermostat_Comment.Text = Convert.ToString(dt.Rows[0]["ThermostatUseHabitsComment"]);
                txt_AC_ReplaceUnit.Text = Convert.ToString(dt.Rows[0]["TotalNumberUnitsReplace"]);
                txt_CustomerACThermostatUse.Text = Convert.ToString(dt.Rows[0]["CentralACThermostatUseHabits"]);

                ////////////////////////////////////////////////////////////////////////////////////

                string CentralACThermostatAccurate = Convert.ToString(dt.Rows[0]["CentralACThermostatAccurate"]);
                if (CentralACThermostatAccurate == "Y")
                {
                    rdo_ThermostatAccurate_Yes.Checked = true;
                }
                else if (CentralACThermostatAccurate == "N")
                {
                    rdo_ThermostatAccurate_No.Checked = true;
                }
                else if (CentralACThermostatAccurate == "Not")
                {
                    rdo_ThermostatAccurate_IfNot.Checked = true;
                }

                txt_ThermostatAccurate_IfNot.Text = Convert.ToString(dt.Rows[0]["CentralACThermostatAccurateNotComment"]);
                string ReplacementOfThermostat = Convert.ToString(dt.Rows[0]["ReplacementOfThermostat"]);
                if (ReplacementOfThermostat == "Y")
                {
                    rdo_ReplacementThermostat_Yes.Checked = true;
                }
                else if (ReplacementOfThermostat == "N")
                {
                    rdo_ReplacementThermostat_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////

                string FilterSlotCovered = Convert.ToString(dt.Rows[0]["FilterSlotCovered"]);
                if (FilterSlotCovered == "Y")
                {
                    rdo_filterSlotCovered_Yes.Checked = true;
                }
                else if (FilterSlotCovered == "N")
                {
                    rdo_filterSlotCovered_No.Checked = true;
                }
                else if (FilterSlotCovered == "NA")
                {
                    rdo_filterSlotCovered_NA.Checked = true;
                }
                //////////////////////////////////////////////////////////////////////////////////////////

                string LocationOfA_Coil = Convert.ToString(dt.Rows[0]["LocationOfA_Coil"]);
                if (LocationOfA_Coil == "I")
                {
                    rdo_LocationAcoil_Inside.Checked = true;
                }
                else if (LocationOfA_Coil == "O")
                {
                    rdo_LocationAcoil_Outside.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string InspectTheA_Coil = Convert.ToString(dt.Rows[0]["InspectTheA_Coil"]);
                if (InspectTheA_Coil == "Y")
                {
                    rdo_InspectAcoil_Yes.Checked = true;
                }
                else if (InspectTheA_Coil == "N")
                {
                    rdo_InspectAcoil_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string CleaningRecommended = Convert.ToString(dt.Rows[0]["CleaningRecommended"]);
                if (CleaningRecommended == "Y")
                {
                    rdo_CleaningRecommended_Yes.Checked = true;
                }
                else if (CleaningRecommended == "N")
                {
                    rdo_CleaningRecommended_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string CleaningPerformedBy = Convert.ToString(dt.Rows[0]["CleaningPerformedBy"]);
                if (CleaningPerformedBy == "A")
                {
                    rdo_CleaningPerformedBy_Auditor.Checked = true;
                }
                else if (CleaningPerformedBy == "3P")
                {
                    rdo_CleaningPerformedBy_3rd_Party.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string WarrantPartyCleanAndTune = Convert.ToString(dt.Rows[0]["WarrantPartyCleanAndTune"]);
                if (WarrantPartyCleanAndTune == "Y")
                {
                    rdo_Acoil_3rd_PartyClean_Yes.Checked = true;
                }
                else if (WarrantPartyCleanAndTune == "N")
                {
                    rdo_Acoil_3rd_PartyClean_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string PartyContractorContacted = Convert.ToString(dt.Rows[0]["PartyContractorContacted"]);
                if (PartyContractorContacted == "Y")
                {
                    rdo_3rd_PartyContractor_Yes.Checked = true;
                }
                else if (PartyContractorContacted == "N")
                {
                    rdo_3rd_PartyContractor_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string CleanORTune = Convert.ToString(dt.Rows[0]["CleanORTune"]);
                if (CleanORTune == "Y")
                {
                    rdo_CleanTune_Yes.Checked = true;
                }
                else if (CleanORTune == "N")
                {
                    rdo_CleanTune_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                txt_CleanTuneRecommended.Text = Convert.ToString(dt.Rows[0]["TuneRecommendedComment"]);

                ////////////////////////////////////////////////////////////////////////////////////////////

                string InstalledTheSystem = Convert.ToString(dt.Rows[0]["InstalledTheSystem"]);
                if (InstalledTheSystem == "Y")
                {
                    rdo_NewFilterInstall_Yes.Checked = true;
                }
                else if (InstalledTheSystem == "N")
                {
                    rdo_NewFilterInstall_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////
                txt_NumberInstall.Text = Convert.ToString(dt.Rows[0]["NumberInstalled"]);
                /////////////////////////////////////////////////////////////////////////////////////////

                string CleanTheSystem = Convert.ToString(dt.Rows[0]["CleanTheSystem"]);
                if (CleanTheSystem == "Y")
                {
                    rdo_FilterClean_Yes.Checked = true;
                }
                else if (CleanTheSystem == "N")
                {
                    rdo_FilterClean_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////
                txt_NumberClean.Text = Convert.ToString(dt.Rows[0]["NumberClean"]);
                ////////////////////////////////////////////////////////////////////////////////////////////

                string CoiltobeClean = Convert.ToString(dt.Rows[0]["CoiltobeClean"]);
                if (CoiltobeClean == "Y")
                {
                    rdo_CoilClean_Yes.Checked = true;
                }
                else if (CoiltobeClean == "N")
                {
                    rdo_CoilClean_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////
                string UnittobeReplaced = Convert.ToString(dt.Rows[0]["UnittobeReplaced"]);
                if (UnittobeReplaced == "Y")
                {
                    rdo_CA_UnitReplace_Yes.Checked = true;
                }
                else if (UnittobeReplaced == "N")
                {
                    rdo_CA_UnitReplace_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                txt_SizeUnit.Text = Convert.ToString(dt.Rows[0]["SizeOfUnit"]);
                txt_FilterDimension.Text = Convert.ToString(dt.Rows[0]["FilterDimension"]);

                //////////////////////////////////////////////////////////////////////////////////////////

                string DuctWorkThermalBoundary = Convert.ToString(dt.Rows[0]["DuctWorkThermalBoundary"]);
                if (DuctWorkThermalBoundary == "Y")
                {
                    rdo_DuctWork_Yes.Checked = true;
                }
                else if (DuctWorkThermalBoundary == "N")
                {
                    rdo_DuctWork_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                txt_DuctWork_Location.Text = Convert.ToString(dt.Rows[0]["DuctWorkThermalBoundaryLocation"]);

                //////////////////////////////////////////////////////////////////////////////////////////

                string InsulationtobeInstalled = Convert.ToString(dt.Rows[0]["InsulationtobeInstalled"]);
                if (InsulationtobeInstalled == "Y")
                {
                    rdo_InsulationInstall_Yes.Checked = true;
                }
                else if (InsulationtobeInstalled == "N")
                {
                    rdo_InsulationInstall_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string SealingtobeCompleted = Convert.ToString(dt.Rows[0]["SealingtobeCompleted"]);
                if (SealingtobeCompleted == "Y")
                {
                    rdo_SealingCompleted_Yes.Checked = true;
                }
                else if (SealingtobeCompleted == "N")
                {
                    rdo_SealingCompleted_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////
                txt_comment2.Text = Convert.ToString(dt.Rows[0]["Comment2"]);
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
            string WindowsNotShaded = "";
            if (rdo_WindowFilm_Yes.Checked == true)
            {
                WindowsNotShaded = "Y";
            }
            else if (rdo_WindowFilm_No.Checked == true)
            {
                WindowsNotShaded = "N";
            }

            /////////////////////////////////////////////////////////////////////////////////////////

            string RollRoofMaterial = "";
            if (rdo_RoofCoating_Roofmaterial_Yes.Checked == true)
            {
                RollRoofMaterial = "Y";
            }
            else if (rdo_RoofCoating_Roofmaterial_No.Checked == true)
            {
                RollRoofMaterial = "N";
            }

            /////////////////////////////////////////////////////////////////////////////////////////

            string InstallRoofCoat = "";
            if (rdo_InstallRoofCoat_Yes.Checked == true)
            {
                InstallRoofCoat = "Y";
            }
            else if (rdo_InstallRoofCoat_No.Checked == true)
            {
                InstallRoofCoat = "N";
            }

            /////////////////////////////////////////////////////////////////////////////////////////

            string ReduceAirConditioning = "";
            if (rdo_ReduceACUse_Yes.Checked == true)
            {
                ReduceAirConditioning = "Y";
            }
            else if (rdo_ReduceACUse_No.Checked == true)
            {
                ReduceAirConditioning = "N";
            }


            /////////////////////////////////////////////////////////////////////////////////////////

            string ReplaceAC1 = "";
            if (chk_Line1_ReplaceAC.Checked == true)
            {
                ReplaceAC1 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////

            string ReplaceFilter1 = "";
            if (chk_Line1_ReplaceFilter.Checked == true)
            {
                ReplaceFilter1 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////

            string CleanFilter1 = "";
            if (chk_Line1_CleanFilter.Checked == true)
            {
                CleanFilter1 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////

            string ReplaceAC2 = "";
            if (chk_Line2_ReplaceAC.Checked == true)
            {
                ReplaceAC2 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////

            string ReplaceFilter2 = "";
            if (chk_Line2_ReplaceFilter.Checked == true)
            {
                ReplaceFilter2 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////

            string CleanFilter2 = "";
            if (chk_Line2_CleanFilter.Checked == true)
            {
                CleanFilter2 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////

            string ReplaceAC3 = "";
            if (chk_Line3_ReplaceAC.Checked == true)
            {
                ReplaceAC3 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////

            string ReplaceFilter3 = "";
            if (chk_Line3_ReplaceFilter.Checked == true)
            {
                ReplaceFilter3 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////

            string CleanFilter3 = "";
            if (chk_Line3_CleanFilter.Checked == true)
            {
                CleanFilter3 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////

            string ReplaceAC4 = "";
            if (chk_Line4_ReplaceAC.Checked == true)
            {
                ReplaceAC4 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////

            string ReplaceFilter4 = "";
            if (chk_Line4_ReplaceFilter.Checked == true)
            {
                ReplaceFilter4 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////

            string CleanFilter4 = "";
            if (chk_Line4_CleanFilter.Checked == true)
            {
                CleanFilter4 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////

            string ReplaceAC5 = "";
            if (chk_Line5_ReplaceAC.Checked == true)
            {
                ReplaceAC5 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////

            string ReplaceFilter5 = "";
            if (chk_Line5_ReplaceFilter.Checked == true)
            {
                ReplaceFilter5 = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////

            string CleanFilter5 = "";
            if (chk_Line5_CleanFilter.Checked == true)
            {
                CleanFilter5 = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////

            string CentralACThermostatAccurate = "";
            if (rdo_ThermostatAccurate_Yes.Checked == true)
            {
                CentralACThermostatAccurate = "Y";
            }
            else if (rdo_ThermostatAccurate_No.Checked == true)
            {
                CentralACThermostatAccurate = "N";
            }
            else if (rdo_ThermostatAccurate_IfNot.Checked == true)
            {
                CentralACThermostatAccurate = "Not";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////

            string ReplacementOfThermostat = "";
            if (rdo_ReplacementThermostat_Yes.Checked == true)
            {
                ReplacementOfThermostat = "Y";
            }
            else if (rdo_ReplacementThermostat_No.Checked == true)
            {
                ReplacementOfThermostat = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////

            string FilterSlotCovered = "";
            if (rdo_filterSlotCovered_Yes.Checked == true)
            {
                FilterSlotCovered = "Y";
            }
            else if (rdo_filterSlotCovered_No.Checked == true)
            {
                FilterSlotCovered = "N";
            }
            else if (rdo_filterSlotCovered_NA.Checked == true)
            {
                FilterSlotCovered = "NA";
            }
            //////////////////////////////////////////////////////////////////////////////////////////

            string LocationOfA_Coil = "";
            if (rdo_LocationAcoil_Inside.Checked == true)
            {
                LocationOfA_Coil = "I";
            }
            else if (rdo_LocationAcoil_Outside.Checked == true)
            {
                LocationOfA_Coil = "O";
            }

            //////////////////////////////////////////////////////////////////////////////////////////

            string InspectTheA_Coil = "";
            if (rdo_InspectAcoil_Yes.Checked == true)
            {
                InspectTheA_Coil = "Y";
            }
            else if (rdo_InspectAcoil_No.Checked == true)
            {
                InspectTheA_Coil = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////

            string CleaningRecommended = "";
            if (rdo_CleaningRecommended_Yes.Checked == true)
            {
                CleaningRecommended = "Y";
            }
            else if (rdo_CleaningRecommended_No.Checked == true)
            {
                CleaningRecommended = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////

            string CleaningPerformedBy = "";
            if (rdo_CleaningPerformedBy_Auditor.Checked == true)
            {
                CleaningPerformedBy = "A";
            }
            else if (rdo_CleaningPerformedBy_3rd_Party.Checked == true)
            {
                CleaningPerformedBy = "3P";
            }

            //////////////////////////////////////////////////////////////////////////////////////////

            string WarrantPartyCleanAndTune = "";
            if (rdo_Acoil_3rd_PartyClean_Yes.Checked == true)
            {
                WarrantPartyCleanAndTune = "Y";
            }
            else if (rdo_Acoil_3rd_PartyClean_No.Checked == true)
            {
                WarrantPartyCleanAndTune = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////

            string PartyContractorContacted = "";
            if (rdo_3rd_PartyContractor_Yes.Checked == true)
            {
                PartyContractorContacted = "Y";
            }
            else if (rdo_3rd_PartyContractor_No.Checked == true)
            {
                PartyContractorContacted = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////

            string CleanORTune = "";
            if (rdo_CleanTune_Yes.Checked == true)
            {
                CleanORTune = "Y";
            }
            else if (rdo_CleanTune_No.Checked == true)
            {
                CleanORTune = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////


            string InstalledTheSystem = "";
            if (rdo_NewFilterInstall_Yes.Checked == true)
            {
                InstalledTheSystem = "Y";
            }
            else if (rdo_NewFilterInstall_No.Checked == true)
            {
                InstalledTheSystem = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////

            string CleanTheSystem = "";
            if (rdo_FilterClean_Yes.Checked == true)
            {
                CleanTheSystem = "Y";
            }
            else if (rdo_FilterClean_No.Checked == true)
            {
                CleanTheSystem = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////

            string CoiltobeClean = "";
            if (rdo_CoilClean_Yes.Checked == true)
            {
                CoiltobeClean = "Y";
            }
            else if (rdo_CoilClean_No.Checked == true)
            {
                CoiltobeClean = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////
            string UnittobeReplaced = "";
            if (rdo_CA_UnitReplace_Yes.Checked == true)
            {
                UnittobeReplaced = "Y";
            }
            else if (rdo_CA_UnitReplace_No.Checked == true)
            {
                UnittobeReplaced = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////

            string DuctWorkThermalBoundary = "";
            if (rdo_DuctWork_Yes.Checked == true)
            {
                DuctWorkThermalBoundary = "Y";
            }
            else if (rdo_DuctWork_No.Checked == true)
            {
                DuctWorkThermalBoundary = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////


            string InsulationtobeInstalled = "";
            if (rdo_InsulationInstall_Yes.Checked == true)
            {
                InsulationtobeInstalled = "Y";
            }
            else if (rdo_InsulationInstall_No.Checked == true)
            {
                InsulationtobeInstalled = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////

            string SealingtobeCompleted = "";
            if (rdo_SealingCompleted_Yes.Checked == true)
            {
                SealingtobeCompleted = "Y";
            }
            else if (rdo_SealingCompleted_No.Checked == true)
            {
                SealingtobeCompleted = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////

            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_10(JobNum, txt_SummerSeasonalUse.Text, WindowsNotShaded, txt_WindowFilmNeeded.Text, txt_West_ReceiveFilm.Text, txt_South_ReceiveFilm.Text, txt_East_ReceiveFilm.Text, RollRoofMaterial, InstallRoofCoat, txt_FootageOfRoof.Text, ReduceAirConditioning, txt_Will_Install.Text, txt_comment.Text, txt_Line1_UnitWatts.Text, txt_Line1_EER.Text, ReplaceAC1, txt_Line1_CurrentSize_BTU.Text, txt_Line1_CurrentLocation.Text, txt_Line1_NewSize_BTU.Text, txt_Line1_Install_Location.Text, ReplaceFilter1, CleanFilter1, txt_Line2_UnitWatts.Text, txt_Line2_EER.Text, ReplaceAC2, txt_Line2_CurrentSize_BTU.Text, txt_Line2_CurrentLocation.Text, txt_Line2_NewSize_BTU.Text, txt_Line2_Install_Location.Text, ReplaceFilter2, CleanFilter2, txt_Line3_UnitWatts.Text, txt_Line3_EER.Text, ReplaceAC3, txt_Line3_CurrentSize_BTU.Text, txt_Line3_CurrentLocation.Text, txt_Line3_NewSize_BTU.Text, txt_Line3_Install_Location.Text, ReplaceFilter3, CleanFilter3, txt_Line4_UnitWatts.Text, txt_Line4_EER.Text, ReplaceAC4, txt_Line4_CurrentSize_BTU.Text, txt_Line4_CurrentLocation.Text, txt_Line4_NewSize_BTU.Text, txt_Line4_Install_Location.Text, ReplaceFilter4, CleanFilter4, txt_Line5_UnitWatts.Text, txt_Line5_EER.Text, ReplaceAC5, txt_Line5_CurrentSize_BTU.Text, txt_Line5_CurrentLocation.Text, txt_Line5_NewSize_BTU.Text, txt_Line5_Install_Location.Text, ReplaceFilter5, CleanFilter5, txt_CustomerWindowACThermostat_Comment.Text, txt_AC_ReplaceUnit.Text, txt_CustomerACThermostatUse.Text, CentralACThermostatAccurate, txt_ThermostatAccurate_IfNot.Text, ReplacementOfThermostat, FilterSlotCovered, LocationOfA_Coil, InspectTheA_Coil, CleaningRecommended, CleaningPerformedBy, WarrantPartyCleanAndTune, PartyContractorContacted, CleanORTune, txt_CleanTuneRecommended.Text, InstalledTheSystem, txt_NumberInstall.Text, CleanTheSystem, txt_NumberClean.Text, CoiltobeClean, UnittobeReplaced, txt_SizeUnit.Text, DuctWorkThermalBoundary, txt_DuctWork_Location.Text, InsulationtobeInstalled, SealingtobeCompleted, txt_comment2.Text, txt_NewestACUnit.Text, txt_CentralACUnit.Text, txt_FilterDimension.Text);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }

}
