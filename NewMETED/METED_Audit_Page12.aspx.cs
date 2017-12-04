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

public partial class METED_METED_Audit_Page11 : System.Web.UI.Page
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_11(JobNum);
            if (dt.Rows.Count > 0)
            {

                txt_customerHeatPumpThermostatUse.Text = Convert.ToString(dt.Rows[0]["ThermostatUsehabit"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                string ThermostatAccurate = Convert.ToString(dt.Rows[0]["ThermostatAccurate"]);
                if (ThermostatAccurate == "Y")
                {
                    rdo_ThermostatAccurate_Yes.Checked = true;
                }
                else if (ThermostatAccurate == "N")
                {
                    rdo_ThermostatAccurate_No.Checked = true;
                }
                else if (ThermostatAccurate == "Not")
                {
                    rdo_ThermostatAccurate_IfNot.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                string CusHeatPump = Convert.ToString(dt.Rows[0]["CustomerheatPump"]);
                if (CusHeatPump == "H")
                {
                    rdoCusHeat.Checked = true;
                }
                else if (CusHeatPump == "A")
                {
                    rdoCusAc.Checked = true;
                }
                else if (CusHeatPump == "N")
                {
                    rdoCusNa.Checked = true;
                }
                else if (CusHeatPump == "O")
                {
                    rdoCusOther.Checked = true;
                    txtCusOther.Text = Convert.ToString(dt.Rows[0]["CustomerheatPumpOther"]);
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ThermostatAccurate_IfNot.Text = Convert.ToString(dt.Rows[0]["ThermostatAccurateComment"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                string SlotCovered = Convert.ToString(dt.Rows[0]["SlotCovered"]);
                if (SlotCovered == "Y")
                {
                    rdo_FilterSlotCovered_Yes.Checked = true;
                }
                else if (SlotCovered == "N")
                {
                    rdo_FilterSlotCovered_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                string InspectA_Coil = Convert.ToString(dt.Rows[0]["InspectA_Coil"]);
                if (InspectA_Coil == "Y")
                {
                    rdo_InspectAcoil_Yes.Checked = true;
                }
                else if (InspectA_Coil == "N")
                {
                    rdo_InspectAcoil_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string CleaningRecommended = Convert.ToString(dt.Rows[0]["CleaningRecommended"]);
                if (CleaningRecommended == "Y")
                {
                    rdo_CleaningRecommended_Yes.Checked = true;
                }
                else if (CleaningRecommended == "N")
                {
                    rdo_CleaningRecommended_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string CleanerformeBy = Convert.ToString(dt.Rows[0]["CleanerformeBy"]);
                if (CleanerformeBy == "A")
                {
                    rdo_CleaningPerformedBy_Auditor.Checked = true;
                }
                else if (CleanerformeBy == "3P")
                {
                    rdo_CleaningPerformedBy_3rd_Party.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string WarrantPartyCleanTune = Convert.ToString(dt.Rows[0]["WarrantPartyCleanTune"]);
                if (WarrantPartyCleanTune == "Y")
                {
                    rdo_Acoil_3rd_PartyClean_Yes.Checked = true;
                }
                else if (WarrantPartyCleanTune == "N")
                {
                    rdo_Acoil_3rd_PartyClean_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string PartyContacted = Convert.ToString(dt.Rows[0]["PartyContacted"]);
                if (PartyContacted == "Y")
                {
                    rdo_3rdPartyContacted_Yes.Checked = true;
                }
                else if (PartyContacted == "N")
                {
                    rdo_3rdPartyContacted_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string CleanTune = Convert.ToString(dt.Rows[0]["CleanTune"]);
                if (CleanTune == "Y")
                {
                    rdo_CleanTune_Yes.Checked = true;
                }
                else if (CleanTune == "N")
                {
                    rdo_CleanTune_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_CleanTuneRecommended.Text = Convert.ToString(dt.Rows[0]["CleanTuneRecommendedComment"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpInstallSystem = Convert.ToString(dt.Rows[0]["HeatPumpInstallSystem"]);
                if (HeatPumpInstallSystem == "Y")
                {
                    rdo_NewfilterInstall_Yes.Checked = true;
                }
                else if (HeatPumpInstallSystem == "N")
                {
                    rdo_NewfilterInstall_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_NumberInstall.Text = Convert.ToString(dt.Rows[0]["HeatPumpNumberInstall"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpCleanSystem = Convert.ToString(dt.Rows[0]["HeatPumpCleanSystem"]);
                if (HeatPumpCleanSystem == "Y")
                {
                    rdo_FilterCleaned_Yes.Checked = true;
                }
                else if (HeatPumpCleanSystem == "N")
                {
                    rdo_FilterCleaned_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_NumberCleaned.Text = Convert.ToString(dt.Rows[0]["HeatPumpNumberClean"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpCoilsClean = Convert.ToString(dt.Rows[0]["HeatPumpCoilsClean"]);
                if (HeatPumpCoilsClean == "Y")
                {
                    rdo_CoilsCleaned_Yes.Checked = true;
                }
                else if (HeatPumpCoilsClean == "N")
                {
                    rdo_CoilsCleaned_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpReplace = Convert.ToString(dt.Rows[0]["HeatPumpReplace"]);
                if (HeatPumpReplace == "Y")
                {
                    rdo_HeatPumpReplaced_Yes.Checked = true;
                }
                else if (HeatPumpReplace == "N")
                {
                    rdo_HeatPumpReplaced_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_SizeUnit.Text = Convert.ToString(dt.Rows[0]["HeatPumpSizeUnit"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpThermalBoundary = Convert.ToString(dt.Rows[0]["HeatPumpThermalBoundary"]);
                if (HeatPumpThermalBoundary == "Y")
                {
                    rdo_DuctWork_Yes.Checked = true;
                }
                else if (HeatPumpThermalBoundary == "N")
                {
                    rdo_DuctWork_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_DuctWorkLocation.Text = Convert.ToString(dt.Rows[0]["HeatPumpThermalBoundaryLocation"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpInsulationInstall = Convert.ToString(dt.Rows[0]["HeatPumpInsulationInstall"]);
                if (HeatPumpInsulationInstall == "Y")
                {
                    rdo_InsulationInstall_Yes.Checked = true;
                }
                else if (HeatPumpInsulationInstall == "N")
                {
                    rdo_InsulationInstall_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpSealingComplete = Convert.ToString(dt.Rows[0]["HeatPumpSealingComplete"]);
                if (HeatPumpSealingComplete == "Y")
                {
                    rdo_SealingComplete_Yes.Checked = true;
                }
                else if (HeatPumpSealingComplete == "N")
                {
                    rdo_SealingComplete_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpEnergy = Convert.ToString(dt.Rows[0]["HeatPumpEnergy"]);
                if (HeatPumpEnergy == "Y")
                {
                    rdo_PumpPamphletProvide_Yes.Checked = true;
                }
                else if (HeatPumpEnergy == "N")
                {
                    rdo_PumpPamphletProvide_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Comment.Text = Convert.ToString(dt.Rows[0]["Comment1"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatType = Convert.ToString(dt.Rows[0]["ElectricHeatType"]);
                switch (ElectricHeatType)
                {
                    case "1":
                        rdo_TypeHeating_ElectricBaseboard.Checked = true;
                        break;

                    case "2":
                        rdo_TypeHeating_ElectricHeatPump.Checked = true;
                        break;

                    case "3":
                        rdo_TypeHeating_ElectricBoiler.Checked = true;
                        break;

                    case "4":
                        rdo_TypeHeating_ElectricFurnace.Checked = true;
                        break;

                    case "5":
                        rdo_TypeHeating_ElectricRadiant.Checked = true;
                        break;

                    case "6":
                        rdo_TypeHeating_ElectricWallBlowers.Checked = true;
                        break;

                    case "99":
                        rdo_TypeHeating_Other.Checked = true;
                        txt_TypeHeating_Other.Text = Convert.ToString(dt.Rows[0]["ElectricHeatTypeOther"]);
                        break;

                    default:
                        break;
                }
                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ElectricHeatThermostatUse.Text = Convert.ToString(dt.Rows[0]["ElectricHeatThermostatUseHabit"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatThermostatAccurate = Convert.ToString(dt.Rows[0]["ElectricHeatThermostatAccurate"]);
                if (ElectricHeatThermostatAccurate == "Y")
                {
                    rdo_ThermostatAccurate2_Yes.Checked = true;
                }
                else if (ElectricHeatThermostatAccurate == "N")
                {
                    rdo_ThermostatAccurate2_Yes.Checked = true;
                }
                else if (ElectricHeatThermostatAccurate == "Not")
                {
                    rdo_ThermostatAccurate2_IfNot.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ThermostatAccurate.Text = Convert.ToString(dt.Rows[0]["ElectricHeatThermostatAccurateComment"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatReplacementThermostat = Convert.ToString(dt.Rows[0]["ElectricHeatReplacementThermostat"]);
                if (ElectricHeatReplacementThermostat == "Y")
                {
                    rdo_ReplacementThermostat_Yes.Checked = true;
                }
                else if (ElectricHeatReplacementThermostat == "N")
                {
                    rdo_ReplacementThermostat_Yes.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ReplacementThermostats_Details.Text = Convert.ToString(dt.Rows[0]["ElectricHeatReplacementThermostatDetail"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatSlotCover = Convert.ToString(dt.Rows[0]["ElectricHeatSlotCover"]);
                if (ElectricHeatSlotCover == "Y")
                {
                    rdo_FilterSlotCovere_Yes.Checked = true;
                }
                else if (ElectricHeatSlotCover == "N")
                {
                    rdo_FilterSlotCovere_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_LocationsThermostat.Text = Convert.ToString(dt.Rows[0]["ElectricHeatLocationThermostat"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatCleanTune = Convert.ToString(dt.Rows[0]["ElectricHeatCleanTune"]);
                if (ElectricHeatCleanTune == "Y")
                {
                    rdo_CleanTune2_Yes.Checked = true;
                }
                else if (ElectricHeatCleanTune == "N")
                {
                    rdo_CleanTune2_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_CleanTuneRecommended2.Text = Convert.ToString(dt.Rows[0]["ElectricHeatCleanTuneRecommendedComment"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatInstallSystem = Convert.ToString(dt.Rows[0]["ElectricHeatInstallSystem"]);
                if (ElectricHeatInstallSystem == "Y")
                {
                    rdo_FilterInstalled_Yes.Checked = true;
                }
                else if (ElectricHeatInstallSystem == "N")
                {
                    rdo_FilterInstalled_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_NumberInstall2.Text = Convert.ToString(dt.Rows[0]["ElectricHeatNumberInstall"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatCleanSystem = Convert.ToString(dt.Rows[0]["ElectricHeatCleanSystem"]);
                if (ElectricHeatCleanSystem == "Y")
                {
                    rdo_FilterClean_Yes.Checked = true;
                }
                else if (ElectricHeatCleanSystem == "N")
                {
                    rdo_FilterClean_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_NumberClean.Text = Convert.ToString(dt.Rows[0]["ElectricHeatNumberClean"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeaterReplace = Convert.ToString(dt.Rows[0]["ElectricHeaterReplace"]);
                if (ElectricHeaterReplace == "Y")
                {
                    rdo_ElectricHeaterReplaced_Yes.Checked = true;
                }
                else if (ElectricHeaterReplace == "N")
                {
                    rdo_ElectricHeaterReplaced_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ElectricHeaterReplaced_SizeUnit.Text = Convert.ToString(dt.Rows[0]["ElectricHeatSizeUnit"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatSystemRepair = Convert.ToString(dt.Rows[0]["ElectricHeatSystemRepair"]);
                if (ElectricHeatSystemRepair == "Y")
                {
                    rdo_ElectricHeatRepair_Yes.Checked = true;
                }
                else if (ElectricHeatSystemRepair == "N")
                {
                    rdo_ElectricHeatRepair_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ElectricHeatRepair_Detail.Text = Convert.ToString(dt.Rows[0]["ElectricHeatSystemRepairDetail"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string PrimaryHeatSource = Convert.ToString(dt.Rows[0]["PrimaryHeatSource"]);
                if (PrimaryHeatSource == "Y")
                {
                    rdo_PriHeatSource_Yes.Checked = true;
                }
                else if (PrimaryHeatSource == "N")
                {
                    rdo_PriHeatSource_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_PriHeatSourceLocation.Text = Convert.ToString(dt.Rows[0]["PrimaryHeatSourceLocation"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatThermalBoundary = Convert.ToString(dt.Rows[0]["ElectricHeatThermalBoundary"]);
                if (ElectricHeatThermalBoundary == "Y")
                {
                    rdo_DuctWork2_Yes.Checked = true;
                }
                else if (ElectricHeatThermalBoundary == "N")
                {
                    rdo_DuctWork2_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_DuctWork2Location.Text = Convert.ToString(dt.Rows[0]["ElectricHeatThermalBoundaryLocation"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatInsulationInstall = Convert.ToString(dt.Rows[0]["ElectricHeatInsulationInstall"]);
                if (ElectricHeatInsulationInstall == "Y")
                {
                    rdo_InsulationInstal2_Yes.Checked = true;
                }
                else if (ElectricHeatInsulationInstall == "N")
                {
                    rdo_InsulationInstal2_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatSealingComplete = Convert.ToString(dt.Rows[0]["ElectricHeatSealingComplete"]);
                if (ElectricHeatSealingComplete == "Y")
                {
                    rdo_SealingComplete2_Yes.Checked = true;
                }
                else if (ElectricHeatSealingComplete == "N")
                {
                    rdo_SealingComplete2_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////
                txt_Comment2.Text = Convert.ToString(dt.Rows[0]["Comment2"]);
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

            string ThermostatAccurate = "";
            if (rdo_ThermostatAccurate_Yes.Checked == true)
            {
                ThermostatAccurate = "Y";
            }
            else if (rdo_ThermostatAccurate_No.Checked == true)
            {
                ThermostatAccurate = "N";
            }
            else if (rdo_ThermostatAccurate_IfNot.Checked == true)
            {
                ThermostatAccurate = "Not";
            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////


            string CusHeatPump = "";
            if (rdoCusHeat.Checked == true)
            {
                CusHeatPump = "H";
            }
            else if (rdoCusAc.Checked == true)
            {
                CusHeatPump = "A";
            }
            else if (rdoCusNa.Checked == true)
            {
                CusHeatPump = "N";
            }
            else if (rdoCusOther.Checked == true)
            {
                CusHeatPump = "O";
            }
            
            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string SlotCovered = "";
            if (rdo_FilterSlotCovered_Yes.Checked == true)
            {
                SlotCovered = "Y";
            }
            else if (rdo_FilterSlotCovered_No.Checked == true)
            {
                SlotCovered = "N";
            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////

            string InspectA_Coil = "";
            if (rdo_InspectAcoil_Yes.Checked == true)
            {
                InspectA_Coil = "Y";
            }
            else if (rdo_InspectAcoil_No.Checked == true)
            {
                InspectA_Coil = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string CleaningRecommended = "";
            if (rdo_CleaningRecommended_Yes.Checked == true)
            {
                CleaningRecommended = "Y";
            }
            else if (rdo_CleaningRecommended_No.Checked == true)
            {
                CleaningRecommended = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string CleanerformeBy = "";
            if (rdo_CleaningPerformedBy_Auditor.Checked == true)
            {
                CleanerformeBy = "A";
            }
            else if (rdo_CleaningPerformedBy_3rd_Party.Checked == true)
            {
                CleanerformeBy = "3P";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string WarrantPartyCleanTune = "";
            if (rdo_Acoil_3rd_PartyClean_Yes.Checked == true)
            {
                WarrantPartyCleanTune = "Y";
            }
            else if (rdo_Acoil_3rd_PartyClean_No.Checked == true)
            {
                WarrantPartyCleanTune = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string PartyContacted = "";
            if (rdo_3rdPartyContacted_Yes.Checked == true)
            {
                PartyContacted = "Y";
            }
            else if (rdo_3rdPartyContacted_No.Checked == true)
            {
                PartyContacted = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string CleanTune = "";
            if (rdo_CleanTune_Yes.Checked == true)
            {
                CleanTune = "Y";
            }
            else if (rdo_CleanTune_No.Checked == true)
            {
                CleanTune = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string HeatPumpInstallSystem = "";
            if (rdo_NewfilterInstall_Yes.Checked == true)
            {
                HeatPumpInstallSystem = "Y";
            }
            else if (rdo_NewfilterInstall_No.Checked == true)
            {
                HeatPumpInstallSystem = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string HeatPumpCleanSystem = "";
            if (rdo_FilterCleaned_Yes.Checked == true)
            {
                HeatPumpCleanSystem = "Y";
            }
            else if (rdo_FilterCleaned_No.Checked == true)
            {
                HeatPumpCleanSystem = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string HeatPumpCoilsClean = "";
            if (rdo_CoilsCleaned_Yes.Checked == true)
            {
                HeatPumpCoilsClean = "Y";
            }
            else if (rdo_CoilsCleaned_No.Checked == true)
            {
                HeatPumpCoilsClean = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string HeatPumpReplace = "";
            if (rdo_HeatPumpReplaced_Yes.Checked == true)
            {
                HeatPumpReplace = "Y";
            }
            else if (rdo_HeatPumpReplaced_No.Checked == true)
            {
                HeatPumpReplace = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string HeatPumpThermalBoundary = "";
            if (rdo_DuctWork_Yes.Checked == true)
            {
                HeatPumpThermalBoundary = "Y";
            }
            else if (rdo_DuctWork_No.Checked == true)
            {
                HeatPumpThermalBoundary = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string HeatPumpInsulationInstall = "";
            if (rdo_InsulationInstall_Yes.Checked == true)
            {
                HeatPumpInsulationInstall = "Y";
            }
            else if (rdo_InsulationInstall_No.Checked == true)
            {
                HeatPumpInsulationInstall = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string HeatPumpSealingComplete = "";
            if (rdo_SealingComplete_Yes.Checked == true)
            {
                HeatPumpSealingComplete = "Y";
            }
            else if (rdo_SealingComplete_No.Checked == true)
            {
                HeatPumpSealingComplete = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string HeatPumpEnergy = "";
            if (rdo_PumpPamphletProvide_Yes.Checked == true)
            {
                HeatPumpEnergy = "Y";
            }
            else if (rdo_PumpPamphletProvide_No.Checked == true)
            {
                HeatPumpEnergy = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeatType = ""; string ElectricHeatTypeOther = "";
            if (rdo_TypeHeating_ElectricBaseboard.Checked == true)
            {
                ElectricHeatType = "1";
            }
            else if (rdo_TypeHeating_ElectricHeatPump.Checked == true)
            {
                ElectricHeatType = "2";
            }
            else if (rdo_TypeHeating_ElectricBoiler.Checked == true)
            {
                ElectricHeatType = "3";
            }
            else if (rdo_TypeHeating_ElectricFurnace.Checked == true)
            {
                ElectricHeatType = "4";
            }
            else if (rdo_TypeHeating_ElectricRadiant.Checked == true)
            {
                ElectricHeatType = "5";
            }
            else if (rdo_TypeHeating_ElectricWallBlowers.Checked == true)
            {
                ElectricHeatType = "6";
            }
            else if (rdo_TypeHeating_Other.Checked == true)
            {
                ElectricHeatType = "99";
                ElectricHeatTypeOther = txt_TypeHeating_Other.Text;
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeatThermostatAccurate = "";
            if (rdo_ThermostatAccurate2_Yes.Checked == true)
            {
                ElectricHeatThermostatAccurate = "Y";
            }
            else if (rdo_ThermostatAccurate2_Yes.Checked == true)
            {
                ElectricHeatThermostatAccurate = "N";
            }
            else if (rdo_ThermostatAccurate2_IfNot.Checked == true)
            {
                ElectricHeatThermostatAccurate = "Not";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeatReplacementThermostat = "";
            if (rdo_ReplacementThermostat_Yes.Checked == true)
            {
                ElectricHeatReplacementThermostat = "Y";
            }
            else if (rdo_ReplacementThermostat_Yes.Checked == true)
            {
                ElectricHeatReplacementThermostat = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeatSlotCover = "";
            if (rdo_FilterSlotCovere_Yes.Checked == true)
            {
                ElectricHeatSlotCover = "Y";
            }
            else if (rdo_FilterSlotCovere_No.Checked == true)
            {
                ElectricHeatSlotCover = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeatCleanTune = "";
            if (rdo_CleanTune2_Yes.Checked == true)
            {
                ElectricHeatCleanTune = "Y";
            }
            else if (rdo_CleanTune2_No.Checked == true)
            {
                ElectricHeatCleanTune = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeatInstallSystem = "";
            if (rdo_FilterInstalled_Yes.Checked == true)
            {
                ElectricHeatInstallSystem = "Y";
            }
            else if (rdo_FilterInstalled_No.Checked == true)
            {
                ElectricHeatInstallSystem = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeatCleanSystem = "";
            if (rdo_FilterClean_Yes.Checked == true)
            {
                ElectricHeatCleanSystem = "Y";
            }
            else if (rdo_FilterClean_No.Checked == true)
            {
                ElectricHeatCleanSystem = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeaterReplace = "";
            if (rdo_ElectricHeaterReplaced_Yes.Checked == true)
            {
                ElectricHeaterReplace = "Y";
            }
            else if (rdo_ElectricHeaterReplaced_No.Checked == true)
            {
                ElectricHeaterReplace = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeatSystemRepair = "";
            if (rdo_ElectricHeatRepair_Yes.Checked == true)
            {
                ElectricHeatSystemRepair = "Y";
            }
            else if (rdo_ElectricHeatRepair_No.Checked == true)
            {
                ElectricHeatSystemRepair = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string PrimaryHeatSource = "";
            if (rdo_PriHeatSource_Yes.Checked == true)
            {
                PrimaryHeatSource = "Y";
            }
            else if (rdo_PriHeatSource_No.Checked == true)
            {
                PrimaryHeatSource = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeatThermalBoundary = "";
            if (rdo_DuctWork2_Yes.Checked == true)
            {
                ElectricHeatThermalBoundary = "Y";
            }
            else if (rdo_DuctWork2_No.Checked == true)
            {
                ElectricHeatThermalBoundary = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeatInsulationInstall = "";
            if (rdo_InsulationInstal2_Yes.Checked == true)
            {
                ElectricHeatInsulationInstall = "Y";
            }
            else if (rdo_InsulationInstal2_No.Checked == true)
            {
                ElectricHeatInsulationInstall = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string ElectricHeatSealingComplete = "";
            if (rdo_SealingComplete2_Yes.Checked == true)
            {
                ElectricHeatSealingComplete = "Y";
            }
            else if (rdo_SealingComplete2_No.Checked == true)
            {
                ElectricHeatSealingComplete = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////

            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_11(JobNum, txt_customerHeatPumpThermostatUse.Text, ThermostatAccurate, txt_ThermostatAccurate_IfNot.Text, SlotCovered, InspectA_Coil, CleaningRecommended, CleanerformeBy, WarrantPartyCleanTune, PartyContacted, CleanTune, txt_CleanTuneRecommended.Text, HeatPumpInstallSystem, txt_NumberInstall.Text, HeatPumpCleanSystem, txt_NumberCleaned.Text, HeatPumpCoilsClean, HeatPumpReplace, txt_SizeUnit.Text, HeatPumpThermalBoundary, txt_DuctWorkLocation.Text, HeatPumpInsulationInstall, HeatPumpSealingComplete, HeatPumpEnergy, txt_Comment.Text, ElectricHeatType, ElectricHeatTypeOther, txt_ElectricHeatThermostatUse.Text, ElectricHeatThermostatAccurate, txt_ThermostatAccurate.Text, ElectricHeatReplacementThermostat, txt_ReplacementThermostats_Details.Text, ElectricHeatSlotCover, txt_LocationsThermostat.Text, ElectricHeatCleanTune, txt_CleanTuneRecommended2.Text, ElectricHeatInstallSystem, txt_NumberInstall2.Text, ElectricHeatCleanSystem, txt_NumberClean.Text, ElectricHeaterReplace, txt_ElectricHeaterReplaced_SizeUnit.Text, ElectricHeatSystemRepair, txt_ElectricHeatRepair_Detail.Text, PrimaryHeatSource, txt_PriHeatSourceLocation.Text, ElectricHeatThermalBoundary, txt_DuctWork2Location.Text, ElectricHeatInsulationInstall, ElectricHeatSealingComplete, txt_Comment2.Text, CusHeatPump, txtCusOther.Text);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }

}
