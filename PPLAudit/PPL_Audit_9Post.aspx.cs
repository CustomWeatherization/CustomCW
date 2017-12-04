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

public partial class PPLAudit_PPL_Audit_9Post : System.Web.UI.Page
{

    dcPPLAudit ObjPPL = new dcPPLAudit();

    protected void Page_Load(object sender, EventArgs e)
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
                    string JobNum = Request.QueryString["Jobs"].ToString();
                    BindData(JobNum);
                }
            }
            else
            {
                Response.Redirect("../Home.aspx");
            }
        }
        if (Convert.ToString(Session["finalize"]) == "F")
        {
            btnUpdate.Visible = false;
            spnFinal.InnerHtml = "Audit Finalize";
        }
    }

    public void BindData(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_9Post(JobNum);
            if (dt.Rows.Count > 0)
            {
               
                    ViewIMG.Visible = false;
                    if (Convert.ToString(dt.Rows[0]["AnyCombustionAppliancesInHomeCheckbox"]) == "Y")
                    {
                        CombustionAppliancesHomeY.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["AnyCombustionAppliancesInHomeCheckbox"]) == "N")
                    {
                        CombustionAppliancesHomeN.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["CombustibleEquipmentSafetyTestingDoneCheckbox"]) == "Y")
                    {
                        CombustibleEquipmentSafetyTestingY.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["CombustibleEquipmentSafetyTestingDoneCheckbox"]) == "N")
                    {
                        CombustibleEquipmentSafetyTestingN.Checked = true;
                    }

                    txt_OutdoorTemperature.Text = Convert.ToString(dt.Rows[0]["OutDoorTemperature"]);
                    txt_WaterHeater_CO_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterAMB"]);
                    txt_WaterHeater_CO_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCAZ"]);
                    txt_WaterHeater_BackDraft_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterBackDraftNAT"]);
                    txt_WaterHeater_BackDraft_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterBackDraftWC"]);
                    txt_WaterHeater_DarftEstablished_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftEstablishedNAT"]);
                    txt_WaterHeater_DarftEstablished_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftEstablishedWC"]);
                    txt_WaterHeater_DarftPressure_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterPressureNAT"]);
                    txt_WaterHeater_DarftPressure_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterPressureWC"]);
                    txt_WaterHeater_DarftPass_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassedNAT"]);
                    txt_WaterHeater_DarftPass_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassedWC"]);
                    txt_WaterHeater_UndilCOFlue.Text = Convert.ToString(dt.Rows[0]["WaterHeaterUndilCOFlue"]);
                    txt_WaterHeater_GasLeackDet.Text = Convert.ToString(dt.Rows[0]["WaterHeaterGasLeakDetected"]);
                    txt_WaterHeater_PrecentEff.Text = Convert.ToString(dt.Rows[0]["WaterHeaterPercentEfficiency"]);


                    txt_FurnaceBoiler_CO_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerAMB"]);
                    txt_FurnaceBoiler_CO_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCAZ"]);
                    txt_FurnaceBoiler_BackDraft_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerBackDraftNAT"]);
                    txt_FurnaceBoiler_BackDraft_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerBackDraftWC"]);
                    txt_FurnaceBoiler_DraftEstablished_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftEstablishedNAT"]);
                    txt_FurnaceBoiler_DraftEstablished_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftEstablishedWC"]);
                    txt_FurnaceBoiler_DarftPressure_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerPressureNAT"]);
                    txt_FurnaceBoiler_DarftPressure_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerPressureWC"]);
                    txt_FurnaceBoiler_DarftPass_NA.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassedNAT"]);
                    txt_FurnaceBoiler_DarftPass_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassedWC"]);
                    txt_FurnaceBoiler_UndilCOFlue.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerUndilCOFlue"]);
                    txt_FurnaceBoiler_GasLeackDet.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerGasLeakDetected"]);
                    txt_FurnaceBoiler_PrecentEff.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerPercentEfficiency"]);

                    txt_Outher1_CO_AMB.Text = Convert.ToString(dt.Rows[0]["Other1AMB"]);
                    txt_Outher1_CO_CAZ.Text = Convert.ToString(dt.Rows[0]["Other1CAZ"]);
                    txt_Outher1_BackDraft_NAT.Text = Convert.ToString(dt.Rows[0]["Other1BackDraftNAT"]);
                    txt_Outher1_BackDraft_WC.Text = Convert.ToString(dt.Rows[0]["Other1BackDraftWC"]);
                    txt_Outher1_DarftEstablished_NAT.Text = Convert.ToString(dt.Rows[0]["Other1DraftEstablishedNAT"]);
                    txt_Outher1_DarftEstablished_WC.Text = Convert.ToString(dt.Rows[0]["Other1DraftEstablishedWC"]);
                    txt_Outher1_DarftPressure_NAT.Text = Convert.ToString(dt.Rows[0]["Other1PressureNAT"]);
                    txt_Outher1_DarftPressure_WC.Text = Convert.ToString(dt.Rows[0]["Other1PressureWC"]);
                    txt_Outher1_DarftPass_NA.Text = Convert.ToString(dt.Rows[0]["Other1DraftPassedNAT"]);
                    txt_Outher1_DarftPass_WC.Text = Convert.ToString(dt.Rows[0]["Other1DraftPassedWC"]);
                    txt_Outher1_UndilCOFlue.Text = Convert.ToString(dt.Rows[0]["Other1UndilCOFlue"]);
                    txt_Outher1_GasLeackDet.Text = Convert.ToString(dt.Rows[0]["Other1GasLeakDetected"]);
                    txt_Outher1_PrecentEff.Text = Convert.ToString(dt.Rows[0]["Other1PercentEfficiency"]);

                    txt_Outher2_CO_AMB.Text = Convert.ToString(dt.Rows[0]["Other2AMB"]);
                    txt_Outher2_CO_CAZ.Text = Convert.ToString(dt.Rows[0]["Other2CAZ"]);
                    txt_Outher2_BackDraft_NAT.Text = Convert.ToString(dt.Rows[0]["Other2BackDraftNAT"]);
                    txt_Outher2_BackDraft_WC.Text = Convert.ToString(dt.Rows[0]["Other2BackDraftWC"]);
                    txt_Outher2_DarftEstablished_NAT.Text = Convert.ToString(dt.Rows[0]["Other2DraftEstablishedNAT"]);
                    txt_Outher2_DarftEstablished_WC.Text = Convert.ToString(dt.Rows[0]["Other2DraftEstablishedWC"]);
                    txt_Outher2_DarftPressure_NAT.Text = Convert.ToString(dt.Rows[0]["Other2PressureNAT"]);
                    txt_Outher2_DarftPressure_WC.Text = Convert.ToString(dt.Rows[0]["Other2PressureWC"]);
                    txt_Outher2_DarftPass_NA.Text = Convert.ToString(dt.Rows[0]["Other2DraftPassedNAT"]);
                    txt_Outher2_DarftPass_WC.Text = Convert.ToString(dt.Rows[0]["Other2DraftPassedWC"]);
                    txt_Outher2_UndilCOFlue.Text = Convert.ToString(dt.Rows[0]["Other2UndilCOFlue"]);
                    txt_Outher2_GasLeackDet.Text = Convert.ToString(dt.Rows[0]["Other2GasLeakDetected"]);
                    txt_Outher2_PrecentEff.Text = Convert.ToString(dt.Rows[0]["Other2PercentEfficiency"]);

                    txt_RearLeftBurner.Text = Convert.ToString(dt.Rows[0]["BackBurnerLeftCO"]);
                    if (Convert.ToString(dt.Rows[0]["BackBurnerLeftRadio"]) == "Y")
                    {
                        rdo_RearLeftBurner1.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["BackBurnerLeftRadio"]) == "N")
                    {
                        rdo_RearLeftBurner1.Checked = false;
                    }




                    if (Convert.ToString(dt.Rows[0]["BackBurnerRightRadio"]) == "Y")
                    {
                        rdo_RearLeftBurner2.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["BackBurnerRightRadio"]) == "N")
                    {
                        rdo_RearLeftBurner2.Checked = false;
                    }
                    txt_RearRightBurner.Text = Convert.ToString(dt.Rows[0]["BackBurnerRightCO"]);






                    txt_FrontLeftBurner.Text = Convert.ToString(dt.Rows[0]["FrontBurnerLeftCO"]);
                    if (Convert.ToString(dt.Rows[0]["FrontBurnerLeftRadio"]) == "Y")
                    {
                        rdo_FrontLeftBurner1.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["FrontBurnerLeftRadio"]) == "N")
                    {
                        rdo_FrontLeftBurner1.Checked = false;
                    }







                    if (Convert.ToString(dt.Rows[0]["FrontBurnerRightRadio"]) == "Y")
                    {
                        rdo_FrontLeftBurner2.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["FrontBurnerRightRadio"]) == "N")
                    {
                        rdo_FrontLeftBurner2.Checked = false;
                    }
                    txt_FrontRightBurner.Text = Convert.ToString(dt.Rows[0]["FrontBurnerRightCO"]);







                    if (Convert.ToString(dt.Rows[0]["DryerWorstCaseCheckBox"]) == "Y")
                    {
                        chk_CheckAppliancesWorstCaseTestDryerY.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["DryerWorstCaseCheckBox"]) == "N")
                    {
                        chk_CheckAppliancesWorstCaseTestDryerN.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["WholeHouseFanWorstCaseCheckBox"]) == "Y")
                    {
                        chk_CheckAppliancesWorstCaseTestWholeHouseFanY.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["WholeHouseFanWorstCaseCheckBox"]) == "N")
                    {
                        chk_CheckAppliancesWorstCaseTestWholeHouseFanN.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["BathFanWorstCaseCheckBox"]) == "Y")
                    {
                        chk_CheckAppliancesWorstCaseTestBathFanY.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["BathFanWorstCaseCheckBox"]) == "N")
                    {
                        chk_CheckAppliancesWorstCaseTestBathFanN.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["KitchenFanWorstCaseCheckBox"]) == "Y")
                    {
                        chk_CheckAppliancesWorstCaseTestKitchenFanY.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["KitchenFanWorstCaseCheckBox"]) == "N")
                    {
                        chk_CheckAppliancesWorstCaseTestKitchenFanN.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["HVACAirHandlerWorstCaseCheckBox"]) == "Y")
                    {
                        chk_HVACAirHandlerY.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["HVACAirHandlerWorstCaseCheckBox"]) == "N")
                    {
                        chk_HVACAirHandlerN.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["EmergencySituationCheckBox"]) == "Y")
                    {
                        chk_EmergencySituationGasCompanyCalledY.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["EmergencySituationCheckBox"]) == "N")
                    {
                        chk_EmergencySituationGasCompanyCalledN.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["WorkCannotContinueCheckBox"]) == "Y")
                    {
                        chk_WorkCannotContinueToActionLevelY.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["WorkCannotContinueCheckBox"]) == "N")
                    {
                        chk_WorkCannotContinueToActionLevelN.Checked = true;
                    }

                    txt_OvenCODataCOAmbient.Text = Convert.ToString(dt.Rows[0]["COAmbient"]);
                    txt_OvenCODataCOAtOvenVent.Text = Convert.ToString(dt.Rows[0]["COAtOvenVent"]);
                    txt_CAZNat.Text = Convert.ToString(dt.Rows[0]["NATVAL"]);
                    txt_CAZPass.Text = Convert.ToString(dt.Rows[0]["PASSVAL"]);
                    txt_CAZWC.Text = Convert.ToString(dt.Rows[0]["WCVAL"]);
                    txt_CAZDiff.Text = Convert.ToString(dt.Rows[0]["DIFFVAL"]);
                    txt_COAlarmsInstalledLocations.Text = Convert.ToString(dt.Rows[0]["COAlarmsInTheseLocations"]);

                    btnUpdate.Enabled = true;
                }
                else
                {
                    ViewIMG.Visible = true;
                    //btnUpdate.Enabled = false;
                }
          
        }
        catch
        {
        }
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string AnyCombustionAppliancesInHomeCheckbox, CombustibleEquipmentSafetyTestingDoneCheckbox, BackBurnerLeftRadio, BackBurnerRightRadio, FrontBurnerLeftRadio, FrontBurnerRightRadio, DryerWorstCaseCheckBox, WholeHouseFanWorstCaseCheckBox, BathFanWorstCaseCheckBox, KitchenFanWorstCaseCheckBox, HVACAirHandlerWorstCaseCheckBox, EmergencySituationCheckBox, WorkCannotContinueCheckBox;

            if (CombustionAppliancesHomeY.Checked)
            {
                AnyCombustionAppliancesInHomeCheckbox = "Y";
            }
            else if (CombustionAppliancesHomeN.Checked)
            {
                AnyCombustionAppliancesInHomeCheckbox = "N";
            }
            else
            {
                AnyCombustionAppliancesInHomeCheckbox = "";
            }

            if (CombustibleEquipmentSafetyTestingY.Checked)
            {
                CombustibleEquipmentSafetyTestingDoneCheckbox = "Y";
            }
            else if (CombustibleEquipmentSafetyTestingN.Checked)
            {
                CombustibleEquipmentSafetyTestingDoneCheckbox = "N";
            }
            else
            {
                CombustibleEquipmentSafetyTestingDoneCheckbox = "";
            }




            if (txt_RearLeftBurner.Text == "")
            {
                BackBurnerLeftRadio = "N";
            }
            else
            {
                BackBurnerLeftRadio = "Y";
            }





            if (txt_RearRightBurner.Text == "")
            {
                BackBurnerRightRadio = "N";
            }
            else
            {
                BackBurnerRightRadio = "Y";
            }






            if (txt_FrontLeftBurner.Text == "")
            {
                FrontBurnerLeftRadio = "N";
            }
            else
            {
                FrontBurnerLeftRadio = "Y";
            }






            if (txt_FrontRightBurner.Text == "")
            {
                FrontBurnerRightRadio = "N";
            }
            else
            {
                FrontBurnerRightRadio = "Y";
            }







            if (chk_CheckAppliancesWorstCaseTestDryerY.Checked)
            {
                DryerWorstCaseCheckBox = "Y";
            }
            else if (chk_CheckAppliancesWorstCaseTestDryerN.Checked)
            {
                DryerWorstCaseCheckBox = "N";
            }
            else
            {
                DryerWorstCaseCheckBox = "";
            }

            if (chk_CheckAppliancesWorstCaseTestWholeHouseFanY.Checked)
            {
                WholeHouseFanWorstCaseCheckBox = "Y";
            }
            else if (chk_CheckAppliancesWorstCaseTestWholeHouseFanN.Checked)
            {
                WholeHouseFanWorstCaseCheckBox = "N";
            }
            else
            {
                WholeHouseFanWorstCaseCheckBox = "";
            }

            if (chk_CheckAppliancesWorstCaseTestBathFanY.Checked)
            {
                BathFanWorstCaseCheckBox = "Y";
            }
            else if (chk_CheckAppliancesWorstCaseTestBathFanN.Checked)
            {
                BathFanWorstCaseCheckBox = "N";
            }
            else
            {
                BathFanWorstCaseCheckBox = "";
            }

            if (chk_CheckAppliancesWorstCaseTestKitchenFanY.Checked)
            {
                KitchenFanWorstCaseCheckBox = "Y";
            }
            else if (chk_CheckAppliancesWorstCaseTestKitchenFanN.Checked)
            {
                KitchenFanWorstCaseCheckBox = "N";
            }
            else
            {
                KitchenFanWorstCaseCheckBox = "";
            }

            if (chk_HVACAirHandlerY.Checked)
            {
                HVACAirHandlerWorstCaseCheckBox = "Y";
            }
            else if (chk_HVACAirHandlerN.Checked)
            {
                HVACAirHandlerWorstCaseCheckBox = "N";
            }
            else
            {
                HVACAirHandlerWorstCaseCheckBox = "";
            }

            if (chk_EmergencySituationGasCompanyCalledY.Checked)
            {
                EmergencySituationCheckBox = "Y";
            }
            else if (chk_EmergencySituationGasCompanyCalledN.Checked)
            {
                EmergencySituationCheckBox = "N";
            }
            else
            {
                EmergencySituationCheckBox = "";
            }

            if (chk_WorkCannotContinueToActionLevelY.Checked)
            {
                WorkCannotContinueCheckBox = "Y";
            }
            else if (chk_WorkCannotContinueToActionLevelN.Checked)
            {
                WorkCannotContinueCheckBox = "N";
            }
            else
            {
                WorkCannotContinueCheckBox = "";
            }

            string JobNum = Request.QueryString["Jobs"].ToString();
            int i = 0;
            i = ObjPPL.UpdatePPLAudit_9Post(JobNum, AnyCombustionAppliancesInHomeCheckbox, CombustibleEquipmentSafetyTestingDoneCheckbox, txt_OutdoorTemperature.Text, txt_WaterHeater_CO_AMB.Text, txt_WaterHeater_CO_CAZ.Text, txt_WaterHeater_BackDraft_WC.Text, txt_WaterHeater_BackDraft_NAT.Text, txt_WaterHeater_DarftEstablished_WC.Text, txt_WaterHeater_DarftEstablished_NAT.Text, txt_WaterHeater_DarftPressure_WC.Text, txt_WaterHeater_DarftPressure_NAT.Text, txt_WaterHeater_DarftPass_WC.Text, txt_WaterHeater_DarftPass_NAT.Text, txt_WaterHeater_UndilCOFlue.Text, txt_WaterHeater_GasLeackDet.Text, txt_WaterHeater_PrecentEff.Text, txt_FurnaceBoiler_CO_AMB.Text, txt_FurnaceBoiler_CO_CAZ.Text, txt_FurnaceBoiler_BackDraft_WC.Text, txt_FurnaceBoiler_BackDraft_NAT.Text, txt_FurnaceBoiler_DraftEstablished_WC.Text, txt_FurnaceBoiler_DraftEstablished_NAT.Text, txt_FurnaceBoiler_DarftPressure_WC.Text, txt_FurnaceBoiler_DarftPressure_NAT.Text, txt_FurnaceBoiler_DarftPass_WC.Text, txt_FurnaceBoiler_DarftPass_NA.Text, txt_FurnaceBoiler_UndilCOFlue.Text, txt_FurnaceBoiler_GasLeackDet.Text, txt_FurnaceBoiler_PrecentEff.Text, txt_Outher1_CO_AMB.Text, txt_Outher1_CO_CAZ.Text, txt_Outher1_BackDraft_WC.Text, txt_Outher1_BackDraft_NAT.Text, txt_Outher1_DarftEstablished_WC.Text, txt_Outher1_DarftEstablished_NAT.Text, txt_Outher1_DarftPressure_WC.Text, txt_Outher1_DarftPressure_NAT.Text, txt_Outher1_DarftPass_WC.Text, txt_Outher1_DarftPass_NA.Text, txt_Outher1_UndilCOFlue.Text, txt_Outher1_GasLeackDet.Text, txt_Outher1_PrecentEff.Text, txt_Outher2_CO_AMB.Text, txt_Outher2_CO_CAZ.Text, txt_Outher2_BackDraft_WC.Text, txt_Outher2_BackDraft_NAT.Text, txt_Outher2_DarftEstablished_WC.Text, txt_Outher2_DarftEstablished_NAT.Text, txt_Outher2_DarftPressure_WC.Text, txt_Outher2_DarftPressure_NAT.Text, txt_Outher2_DarftPass_WC.Text, txt_Outher2_DarftPass_NA.Text, txt_Outher2_UndilCOFlue.Text, txt_Outher2_GasLeackDet.Text, txt_Outher2_PrecentEff.Text, txt_RearLeftBurner.Text, BackBurnerLeftRadio, BackBurnerRightRadio, txt_RearRightBurner.Text, txt_FrontLeftBurner.Text, FrontBurnerLeftRadio, FrontBurnerRightRadio, txt_FrontRightBurner.Text, DryerWorstCaseCheckBox, WholeHouseFanWorstCaseCheckBox, BathFanWorstCaseCheckBox, KitchenFanWorstCaseCheckBox, txt_OvenCODataCOAmbient.Text, txt_OvenCODataCOAtOvenVent.Text, HVACAirHandlerWorstCaseCheckBox, txt_COAlarmsInstalledLocations.Text, EmergencySituationCheckBox, WorkCannotContinueCheckBox, txt_CAZNat.Text, txt_CAZWC.Text, txt_CAZDiff.Text, txt_CAZPass.Text);
            Response.Write("<script>alert('Save Successfully');</script>");
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
}
