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

public partial class PPLAudit_PPL_Audit_6 : System.Web.UI.Page
{

    dcPPLAudit objppl = new dcPPLAudit();

    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (Request.UserAgent.Contains("Chrome"))
            {
                //TopBtnDiv.Attributes.Add("style", "position: fixed; top: 65px; z-index: 100; text-align: center; margin: 0 45px;width:510px;");
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["Jobs"] != null)
                {
                    if (Request.QueryString["Jobs"].ToString() != "")
                    {
                        FillUpdateAudit();
                    }
                }
                else
                {
                    Response.Redirect("../Home.aspx");

                }
            }
        }
        catch (Exception ex)
        {
        }
        if (Convert.ToString(Session["finalize"]) == "F")
        {
            btnSave.Visible = false;
            spnFinal.InnerHtml = "Audit Finalize";
        }
    }
    #region Save
    protected void btnSave_Click(object sender, EventArgs e)
    {
        // Water Supply
        string strWaterSupply = "";
        if (chkCityWellWaterSupply_City.Checked == true)
        {
            strWaterSupply = "C";
        }
        else if (chkCityWellWaterSupply_Well.Checked == true)
        {
            strWaterSupply = "W";
        }

        // Expansion Tank
        string strExpansionTank = "";
        if (chkExpansionTank_No.Checked == true)
        {
            strExpansionTank = "N";
        }
        else if (chkExpansionTank_Yes.Checked == true)
        {
            strExpansionTank = "Y";
        }

        // If city water, does the water heater have a check valve?
        string strDoesHeaterHaveCheckValve = "";
        if (chkDoesHeaterHaveCheckValve_Yes.Checked == true)
        {
            strDoesHeaterHaveCheckValve = "Y";
        }
        else if (chkDoesHeaterHaveCheckValve_No.Checked == true)
        {
            strDoesHeaterHaveCheckValve = "N";
        }
        else if (chkDoesHeaterHaveCheckValve_NotSure.Checked == true)
        {
            strDoesHeaterHaveCheckValve = "U";
        }

        //Supply:
        string strSupplyCopperPVC = "";
        if (chkSupplyCopperPVC_Copper.Checked == true)
        {
            strSupplyCopperPVC = "C";
        }
        else if (chkSupplyCopperPVC_PVC.Checked == true)
        {
            strSupplyCopperPVC = "P";
        }

        //PVC 30-Amp breaker
        string strThirtyAmpBreaker = "";
        if (chkThirtyAmpBreaker_Yes.Checked == true)
        {
            strThirtyAmpBreaker = "Y";
        }
        else if (chkThirtyAmpBreaker_No.Checked == true)
        {
            strThirtyAmpBreaker = "N";
        }

        //10-2 wire
        string strTenTwoWire = "";
        if (chkTenTwoWire_Yes.Checked == true)
        {
            strTenTwoWire = "Y";
        }
        else if (chkTenTwoWire_No.Checked == true)
        {
            strTenTwoWire = "N";
        }
        //Recommend Water Heater Replacement
        string strRecommendWaterHeaterReplacement = "";
        if (chkRecommendWaterHeaterReplacement_Yes.Checked == true)
        {
            strRecommendWaterHeaterReplacement = "Y";
        }
        else if (chkRecommendWaterHeaterReplacement_No.Checked == true)
        {
            strRecommendWaterHeaterReplacement = "N";
        }
        // Is the household shower use at least 15 minutes per day?
        string strShowerUse = "";
        if (chkShowerUse_Yes.Checked == true)
        {
            strShowerUse = "Y";
        }
        else if (chkShowerUse_No.Checked == true)
        {
            strShowerUse = "N";
        }

        // Is there a basement?
        string strIsThereABasement = "";
        if (chkIsThereABasement_Yes.Checked == true)
        {
            strIsThereABasement = "Y";
        }
        else if (chkIsThereABasement_No.Checked == true)
        {
            strIsThereABasement = "N";
        }
        //Is the drain stack servicing the most used shower(s) exposed?
        string strDrainStackServicing = "";
        if (chkDrainStackServicing_Yes.Checked == true)
        {
            strDrainStackServicing = "Y";
        }
        else if (chkDrainStackServicing_No.Checked == true)
        {
            strDrainStackServicing = "N";
        }
        //Is the diameter of the drain pipe at least 3"?
        string strDrainPipeDiameter = "";
        if (chkDrainPipeDiameter_Yes.Checked == true)
        {
            strDrainPipeDiameter = "Y";
        }
        else if (chkDrainPipeDiameter_No.Checked == true)
        {
            strDrainPipeDiameter = "N";
        }

        //Recommend GFX?
        string strRecommendGFX = "";
        if (chkRecommendGFX_S_GFX.Checked == true)
        {
            strRecommendGFX = "S";
        }
        else if (chkRecommendGFX_G_GFX_Yes.Checked == true)
        {
            strRecommendGFX = "Y";
        }
        else if (chkRecommendGFX_G_GFX_No.Checked == true)
        {
            strRecommendGFX = "N";
        }

        //Water Heater Repair

        string strWaterHeaterRepair = "";
        if (chkWaterHeaterRepair_Yes.Checked == true)
        {
            strWaterHeaterRepair = "Y";
        }
        else if (chkWaterHeaterRepair_No.Checked == true)
        {
            strWaterHeaterRepair = "N";
        }
        // Repair Water Leaks
        string strRepairWaterLeaks = "";
        if (chkRepairWaterLeaks_Yes.Checked == true)
        {
            strRepairWaterLeaks = "Y";
        }
        else if (chkRepairWaterLeaks_No.Checked == true)
        {
            strRepairWaterLeaks = "N";
        }

        // Low Flow Showerheads
        string strLowFlowShowerHeads = "";
        if (chkLowFlowShowerHeads_Yes.Checked == true)
        {
            strLowFlowShowerHeads = "Y";
        }
        else if (chkLowFlowShowerHeads_No.Checked == true)
        {
            strLowFlowShowerHeads = "N";
        }
        // Vertical Height
        string strVerticalHeight = "";
        if (chkVerticalHeight_Yes.Checked == true)
        {
            strVerticalHeight = "Y";
        }
        else if (chkVerticalHeight_No.Checked == true)
        {
            strVerticalHeight = "N";
        }

        //   Aerator(s)
        string strAerators = "";
        if (chkAerators_Yes.Checked == true)
        {
            strAerators = "Y";
        }
        else if (chkAerators_No.Checked == true)
        {
            strAerators = "N";
        }
        // Water Pipe Insulation)
        string strWaterPipeInsulation = "";
        if (chkWaterPipeInsulation_Yes.Checked == true)
        {
            strWaterPipeInsulation = "Y";
        }
        else if (chkWaterPipeInsulation_No.Checked == true)
        {
            strWaterPipeInsulation = "N";
        }
        // Solar Water Maintenance (existing PPL installs)
        string strSolarWater = "";
        if (chkSolarWater_Yes.Checked == true)
        {
            strSolarWater = "Y";
        }
        else if (chkSolarWater_No.Checked == true)
        {
            strSolarWater = "N";
        }

        //  Full Cost Measures
        string strFullCostMeasures = "";
        if (chkFull_Cost_Measures_Yes.Checked == true)
        {
            strFullCostMeasures = "Y";
        }
        else if (chkFull_Cost_Measures_No.Checked == true)
        {
            strFullCostMeasures = "N";
        }
        //Baseload Measures
        string strBaseloadMeasures = "";
        if (chkBaseloadMeasures_Yes.Checked == true)
        {
            strBaseloadMeasures = "Y";
        }
        else if (chkBaseloadMeasures_No.Checked == true)
        {
            strBaseloadMeasures = "N";
        }

        ////////////////////////////////////////////////////////////////////////////////////////////

        string ReasonForNotRecommending = "";
        if (ChkReasonForNotRecommending.Checked == true)
        {
            ReasonForNotRecommending = "Y";
        }
        else if (ChkReasonForNotRecommending7Year.Checked == true)
        {
            ReasonForNotRecommending = "N";
        }


        string FaucetRepair = "";
        if (ChkFaucetRepair_Yes.Checked == true)
        {
            FaucetRepair = "Y";
        }
        else if (ChkFaucetRepair_No.Checked == true)
        {
            FaucetRepair = "N";
        }

        //////////////////////////////////////////////////////////////////////////////////////////////  



        objppl.UpdatePPLAudit_6(Request.QueryString["Jobs"].ToString(), strWaterSupply, strExpansionTank, strDoesHeaterHaveCheckValve, strSupplyCopperPVC, strThirtyAmpBreaker, txtBrand.Text, strTenTwoWire, strRecommendWaterHeaterReplacement, txtReplacementSize.Text, txtTemperature.Text, txtReasonForNotRecommending.Text, strShowerUse, strIsThereABasement, strDrainStackServicing, strVerticalHeight, strDrainPipeDiameter, strRecommendGFX, strWaterHeaterRepair, txtWaterHeaterRepairComments.Text, strRepairWaterLeaks, txtRepairWaterLeaksComments.Text, strLowFlowShowerHeads, txtLowFlowShowerHeadsComments.Text, strAerators, txtAeratorsComments.Text, strWaterPipeInsulation, txtWaterPipeInsulationSizeComments.Text, txtWaterPipeInsulationFeetComments.Text, strSolarWater, txtSolarWaterComments.Text, strFullCostMeasures, strBaseloadMeasures, ReasonForNotRecommending, FaucetRepair, txtFaucetRepairLocation.Text);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Save Successfully');", true);
    }
    #endregion
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../DisplayJobSearchRecords.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
        }
        catch
        {
        }
    }



    #region Fill Data For Update
    public void FillUpdateAudit()
    {

        DataTable dt = objppl.GetPPLAudit_6(Request.QueryString["Jobs"].ToString());

        // Water Supply

        if (dt.Rows[0]["CityWellWaterSupply"].ToString() == "C")
        {
            chkCityWellWaterSupply_City.Checked = true;
        }

        if (dt.Rows[0]["CityWellWaterSupply"].ToString() == "W")
        {
            chkCityWellWaterSupply_Well.Checked = true;

        }


        // Expansion Tank

        if (dt.Rows[0]["ExpansionTank"].ToString() == "N")
        {
            chkExpansionTank_No.Checked = true;
        }

        if (dt.Rows[0]["ExpansionTank"].ToString() == "Y")
        {
            chkExpansionTank_Yes.Checked = true;

        }





        // If city water, does the water heater have a check valve?

        if (dt.Rows[0]["DoesHeaterHaveCheckValve"].ToString() == "Y")
        {
            chkDoesHeaterHaveCheckValve_Yes.Checked = true;
        }

        if (dt.Rows[0]["DoesHeaterHaveCheckValve"].ToString() == "N")
        {
            chkDoesHeaterHaveCheckValve_No.Checked = true;

        }

        if (dt.Rows[0]["DoesHeaterHaveCheckValve"].ToString() == "U")
        {
            chkDoesHeaterHaveCheckValve_NotSure.Checked = true;
        }




        //Supply:

        if (dt.Rows[0]["SupplyCopperPVC"].ToString() == "C")
        {
            chkSupplyCopperPVC_Copper.Checked = true;
        }

        if (dt.Rows[0]["SupplyCopperPVC"].ToString() == "P")
        {
            chkSupplyCopperPVC_PVC.Checked = true;

        }





        //PVC 30-Amp breaker
        if (dt.Rows[0]["ThirtyAmpBreaker"].ToString() == "Y")
        {
            chkThirtyAmpBreaker_Yes.Checked = true;
        }

        if (dt.Rows[0]["ThirtyAmpBreaker"].ToString() == "N")
        {
            chkThirtyAmpBreaker_No.Checked = true;

        }



        //10-2 wire
        if (dt.Rows[0]["TenTwoWire"].ToString() == "Y")
        {
            chkTenTwoWire_Yes.Checked = true;
        }

        if (dt.Rows[0]["TenTwoWire"].ToString() == "N")
        {
            chkTenTwoWire_No.Checked = true;

        }



        //Recommend Water Heater Replacement
        if (dt.Rows[0]["RecommendWaterHeaterReplacement"].ToString() == "Y")
        {
            chkRecommendWaterHeaterReplacement_Yes.Checked = true;
        }

        if (dt.Rows[0]["RecommendWaterHeaterReplacement"].ToString() == "N")
        {
            chkRecommendWaterHeaterReplacement_No.Checked = true;

        }


        // Is the household shower use at least 15 minutes per day?
        if (dt.Rows[0]["ShowerUse"].ToString() == "Y")
        {
            chkShowerUse_Yes.Checked = true;
        }

        if (dt.Rows[0]["ShowerUse"].ToString() == "N")
        {
            chkShowerUse_No.Checked = true;

        }


        // Is there a basement?
        if (dt.Rows[0]["IsThereABasement"].ToString() == "Y")
        {
            chkIsThereABasement_Yes.Checked = true;
        }

        if (dt.Rows[0]["IsThereABasement"].ToString() == "N")
        {
            chkIsThereABasement_No.Checked = true;

        }



        //Is the drain stack servicing the most used shower(s) exposed?
        if (dt.Rows[0]["DrainStackServicing"].ToString() == "Y")
        {
            chkDrainStackServicing_Yes.Checked = true;
        }

        if (dt.Rows[0]["DrainStackServicing"].ToString() == "N")
        {
            chkDrainStackServicing_No.Checked = true;

        }

        //Is the diameter of the drain pipe at least 3"?
        if (dt.Rows[0]["DrainPipeDiameter"].ToString() == "Y")
        {
            chkDrainPipeDiameter_Yes.Checked = true;
        }

        if (dt.Rows[0]["DrainPipeDiameter"].ToString() == "N")
        {
            chkDrainPipeDiameter_No.Checked = true;

        }
        //Recommend GFX?
        if (dt.Rows[0]["RecommendGFX"].ToString() == "S")
        {
            chkRecommendGFX_S_GFX.Checked = true;
        }

        if (dt.Rows[0]["RecommendGFX"].ToString() == "Y")
        {
            chkRecommendGFX_G_GFX_Yes.Checked = true;

        }
        if (dt.Rows[0]["RecommendGFX"].ToString() == "N")
        {
            chkRecommendGFX_G_GFX_No.Checked = true;

        }
        //Water Heater Repair
        if (dt.Rows[0]["WaterHeaterRepair"].ToString() == "Y")
        {
            chkWaterHeaterRepair_Yes.Checked = true;

        }
        if (dt.Rows[0]["WaterHeaterRepair"].ToString() == "N")
        {
            chkWaterHeaterRepair_No.Checked = true;

        }
        // Repair Water Leaks
        if (dt.Rows[0]["RepairWaterLeaks"].ToString() == "Y")
        {
            chkRepairWaterLeaks_Yes.Checked = true;

        }
        if (dt.Rows[0]["RepairWaterLeaks"].ToString() == "N")
        {
            chkRepairWaterLeaks_No.Checked = true;

        }
        // Low Flow Showerheads
        if (dt.Rows[0]["LowFlowShowerHeads"].ToString() == "Y")
        {
            chkLowFlowShowerHeads_Yes.Checked = true;

        }
        if (dt.Rows[0]["LowFlowShowerHeads"].ToString() == "N")
        {
            chkLowFlowShowerHeads_No.Checked = true;

        }
        // Vertical Height
        if (dt.Rows[0]["VerticalHeight"].ToString() == "Y")
        {
            chkVerticalHeight_Yes.Checked = true;

        }
        if (dt.Rows[0]["VerticalHeight"].ToString() == "N")
        {
            chkVerticalHeight_No.Checked = true;

        }
        //   Aerator(s)
        if (dt.Rows[0]["Aerators"].ToString() == "Y")
        {
            chkAerators_Yes.Checked = true;

        }
        if (dt.Rows[0]["Aerators"].ToString() == "N")
        {
            chkAerators_No.Checked = true;

        }
        // Water Pipe Insulation)
        if (dt.Rows[0]["WaterPipeInsulation"].ToString() == "Y")
        {
            chkWaterPipeInsulation_Yes.Checked = true;

        }
        if (dt.Rows[0]["WaterPipeInsulation"].ToString() == "N")
        {
            chkWaterPipeInsulation_No.Checked = true;

        }
        //Solar Water Maintenance (existing PPL installs)
        if (dt.Rows[0]["SolarWater"].ToString() == "Y")
        {
            chkSolarWater_Yes.Checked = true;

        }
        if (dt.Rows[0]["SolarWater"].ToString() == "N")
        {
            chkSolarWater_No.Checked = true;

        }
        //  Full Cost Measures
        if (dt.Rows[0]["FullCostMeasures"].ToString() == "Y")
        {
            chkFull_Cost_Measures_Yes.Checked = true;

        }
        if (dt.Rows[0]["FullCostMeasures"].ToString() == "N")
        {
            chkFull_Cost_Measures_No.Checked = true;

        }
        //Baseload Measures
        if (dt.Rows[0]["BaseloadMeasures"].ToString() == "Y")
        {
            chkBaseloadMeasures_Yes.Checked = true;

        }
        if (dt.Rows[0]["BaseloadMeasures"].ToString() == "N")
        {
            chkBaseloadMeasures_No.Checked = true;

        }


        ////////////////////////////////////////////////////////////////////////////////////////////

        if (dt.Rows[0]["ChkReasonForNotRecommending"].ToString() == "Y")
        {
            ChkReasonForNotRecommending.Checked = true;
        }
        else if (dt.Rows[0]["ChkReasonForNotRecommending"].ToString() == "N")
        {
            ChkReasonForNotRecommending7Year.Checked = true;
        }


        if (dt.Rows[0]["FaucetRepair"].ToString() == "Y")
        {
            ChkFaucetRepair_Yes.Checked = true;
        }
        else if (dt.Rows[0]["FaucetRepair"].ToString() == "N")
        {
            ChkFaucetRepair_No.Checked = true;
        }


        txtFaucetRepairLocation.Text = dt.Rows[0]["FaucetRepairLocation"].ToString();

        //////////////////////////////////////////////////////////////////////////////////////////////  



        txtBrand.Text = dt.Rows[0]["Brand"].ToString();
        txtReplacementSize.Text = dt.Rows[0]["ReplacementSize"].ToString();
        txtTemperature.Text = dt.Rows[0]["Temperature"].ToString();
        txtReasonForNotRecommending.Text = dt.Rows[0]["ReasonForNotRecommending"].ToString();
        txtWaterHeaterRepairComments.Text = dt.Rows[0]["WaterHeaterRepairComments"].ToString();
        txtRepairWaterLeaksComments.Text = dt.Rows[0]["RepairWaterLeaksComments"].ToString();
        txtLowFlowShowerHeadsComments.Text = dt.Rows[0]["LowFlowShowerHeadsComments"].ToString();
        txtAeratorsComments.Text = dt.Rows[0]["AeratorsComments"].ToString();
        txtWaterPipeInsulationSizeComments.Text = dt.Rows[0]["WaterPipeInsulationSizeComments"].ToString();
        txtWaterPipeInsulationFeetComments.Text = dt.Rows[0]["WaterPipeInsulationFeetComments"].ToString();
        txtSolarWaterComments.Text = dt.Rows[0]["SolarWaterComments"].ToString();

    }
    #endregion


}
