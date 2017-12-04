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

public partial class METED_METED_Audit_Page8 : System.Web.UI.Page
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_8(JobNum);
            if (dt.Rows.Count > 0)
            {

                ///////////////////////////////////////////////////////////////////////////////////////////

                string WaterHeaterFuelType = Convert.ToString(dt.Rows[0]["WaterHeaterFuelType"]);
                if (WaterHeaterFuelType == "E")
                {
                    rdo_WaterHeaterFuel_Electric.Checked = true;
                }
                else if (WaterHeaterFuelType == "F")
                {
                    rdo_WaterHeaterFuel_FuelOil.Checked = true;
                }
                else if (WaterHeaterFuelType == "U")
                {
                    rdo_WaterHeaterFuel_UtilityGas.Checked = true;
                }
                else if (WaterHeaterFuelType == "B")
                {
                    rdo_WaterHeaterFuel_BottledGas.Checked = true;
                }
                else if (WaterHeaterFuelType == "O")
                {
                    rdo_WaterHeaterFuel_Other.Checked = true;
                    txt_WaterHeaterFuel_Other.Text = Convert.ToString(dt.Rows[0]["WaterHeaterFuelTypeOther"]);
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////

                txt_WaterHeatingIssues_Comment.Text = Convert.ToString(dt.Rows[0]["WaterHeatingIssuesComments"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////

                string IsWaterHeaterLeaking = Convert.ToString(dt.Rows[0]["IsWaterHeaterLeaking"]);
                if (IsWaterHeaterLeaking == "Y")
                {
                    rdo_WaterHeaterLeak_Yes.Checked = true;
                }
                else if (IsWaterHeaterLeaking == "N")
                {
                    rdo_WaterHeaterLeak_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string IsWaterHeaterRusted = Convert.ToString(dt.Rows[0]["IsWaterHeaterRusted"]);
                if (IsWaterHeaterRusted == "Y")
                {
                    rdo_WaterHeaterRusted_Yes.Checked = true;
                }
                else if (IsWaterHeaterRusted == "N")
                {
                    rdo_WaterHeaterRusted_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////



                string AreTheElementsBad = Convert.ToString(dt.Rows[0]["AreTheElementsBad"]);
                if (AreTheElementsBad == "Y")
                {
                    rdo_ElementBad_Yes.Checked = true;
                }
                else if (AreTheElementsBad == "N")
                {
                    rdo_ElementBad_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string IsUnitRatedR8OrLess = Convert.ToString(dt.Rows[0]["IsUnitRatedR8OrLess"]);
                if (IsUnitRatedR8OrLess == "Y")
                {
                    rdo_UnitRated_Yes.Checked = true;
                }
                else if (IsUnitRatedR8OrLess == "N")
                {
                    rdo_UnitRated_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string WillWaterHeaterBeReplaced = Convert.ToString(dt.Rows[0]["WillWaterHeaterBeReplaced"]);
                if (WillWaterHeaterBeReplaced == "Y")
                {
                    rdo_WaterHeaterReplace_Yes.Checked = true;
                }
                else if (WillWaterHeaterBeReplaced == "N")
                {
                    rdo_WaterHeaterReplace_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txtEnergyFctr.Text = Convert.ToString(dt.Rows[0]["EnergyFactor"]);
                txt_ExistingWaterHeaterSize.Text = Convert.ToString(dt.Rows[0]["ExistingWaterHeaterSize"]);
                txt_WaterHeaterReplaceSize.Text = Convert.ToString(dt.Rows[0]["ReplacementWaterHeaterSize"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ReplaceOrAddExpansionTank = Convert.ToString(dt.Rows[0]["ReplaceOrAddExpansionTank"]);
                if (ReplaceOrAddExpansionTank == "Y")
                {
                    chk_AddExpansionTank_Yes.Checked = true;
                }
                else if (ReplaceOrAddExpansionTank == "N")
                {
                    chk_AddExpansionTank_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string AreYouGoingToReplaceElements = Convert.ToString(dt.Rows[0]["AreYouGoingToReplaceElements"]);
                if (AreYouGoingToReplaceElements == "Y")
                {
                    chk_ReplaceElemnt_Yes.Checked = true;
                }
                else if (AreYouGoingToReplaceElements == "N")
                {
                    chk_ReplaceElemnt_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string AreYouGoingToReplaceThermostats = Convert.ToString(dt.Rows[0]["AreYouGoingToReplaceThermostats"]);
                if (AreYouGoingToReplaceThermostats == "Y")
                {
                    chk_ReplaceThermostats_Yes.Checked = true;
                }
                else if (AreYouGoingToReplaceThermostats == "N")
                {
                    chk_ReplaceThermostats_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////



                string AreYouGoingToFlushTank = Convert.ToString(dt.Rows[0]["AreYouGoingToFlushTank"]);
                if (AreYouGoingToFlushTank == "Y")
                {
                    chk_FlushTank_Yes.Checked = true;
                }
                else if (AreYouGoingToFlushTank == "N")
                {
                    chk_FlushTank_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string AreYouGoingToAddPressureReliefValve = Convert.ToString(dt.Rows[0]["AreYouGoingToAddPressureReliefValve"]);
                if (AreYouGoingToAddPressureReliefValve == "Y")
                {
                    chk_PressureReliefValve_Yes.Checked = true;
                }
                else if (AreYouGoingToAddPressureReliefValve == "N")
                {
                    chk_PressureReliefValve_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string AreYouGoingToAddPressureReliefPipe = Convert.ToString(dt.Rows[0]["AreYouGoingToAddPressureReliefPipe"]);
                if (AreYouGoingToAddPressureReliefPipe == "Y")
                {
                    chk_PressureReliefPipe_Yes.Checked = true;
                }
                else if (AreYouGoingToAddPressureReliefPipe == "N")
                {
                    chk_PressureReliefPipe_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string DidYouChangeTemperature = Convert.ToString(dt.Rows[0]["DidYouChangeTemperature"]);
                if (DidYouChangeTemperature == "Y")
                {
                    rdo_ChangeTemperature_Yes.Checked = true;
                }
                else if (DidYouChangeTemperature == "N")
                {
                    rdo_ChangeTemperature_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                txt_ExistingTemp.Text = Convert.ToString(dt.Rows[0]["ExistingTemp"]);
                txt_TstLocation.Text = Convert.ToString(dt.Rows[0]["TestLocation"]);
                txt_AdjustTemp.Text = Convert.ToString(dt.Rows[0]["AdjustedTemp"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////



                string AreYouWrappingWaterPipes = Convert.ToString(dt.Rows[0]["AreYouWrappingWaterPipes"]);
                if (AreYouWrappingWaterPipes == "Y")
                {
                    rdo_WrappingWaterPipe_Yes.Checked = true;
                }
                else if (AreYouWrappingWaterPipes == "N")
                {
                    rdo_WrappingWaterPipe_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Linear_FT.Text = Convert.ToString(dt.Rows[0]["LinearFeetHOtWater"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string LinearFeetHOtWater12_34 = Convert.ToString(dt.Rows[0]["LinearFeetHOtWater12_34"]);
                if (LinearFeetHOtWater12_34 == "12")
                {
                    rdoHot1_2.Checked = true;
                }
                else if (LinearFeetHOtWater12_34 == "34")
                {
                    rdoHot3_4.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Location.Text = Convert.ToString(dt.Rows[0]["LinearFeetHOtWaterLocation"]);
                txt_Linear_ColdFt.Text = Convert.ToString(dt.Rows[0]["LinearFeetColdWater"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string LinearFeetColdWater12_34 = Convert.ToString(dt.Rows[0]["LinearFeetColdWater12_34"]);
                if (LinearFeetColdWater12_34 == "12")
                {
                    rdoCold1_2.Checked = true;
                }
                else if (LinearFeetColdWater12_34 == "34")
                {
                    rdoCold3_4.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txtLocationColdFT.Text = Convert.ToString(dt.Rows[0]["LinearFeetColdWaterLocation"]);
                txt_Comments.Text = Convert.ToString(dt.Rows[0]["LinearFeetComments"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                string AreThereAnyOtherLeaks = Convert.ToString(dt.Rows[0]["AreThereAnyOtherLeaks"]);
                if (AreThereAnyOtherLeaks == "Y")
                {
                    rdo_HotWaterLeaks_Yes.Checked = true;
                }
                else if (AreThereAnyOtherLeaks == "N")
                {
                    rdo_HotWaterLeaks_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txt_HotWaterLeaksYes_Comment.Text = Convert.ToString(dt.Rows[0]["AreThereAnyOtherLeaksComments"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string AreYouGoingToRepairLeaks = Convert.ToString(dt.Rows[0]["AreYouGoingToRepairLeaks"]);
                if (AreYouGoingToRepairLeaks == "Y")
                {
                    rdo_RepairLeaks_Yes.Checked = true;
                }
                else if (AreYouGoingToRepairLeaks == "N")
                {
                    rdo_RepairLeaks_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txt_RepairLeaks_Yes_Comment.Text = Convert.ToString(dt.Rows[0]["AreYouGoingToRepairLeaksComments"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string FaucetAerators = Convert.ToString(dt.Rows[0]["FaucetAerators"]);
                if (FaucetAerators == "Y")
                {
                    rdoInstalFaucetYes.Checked = true;
                }
                else if (FaucetAerators == "N")
                {
                    rdoInstalFaucetNo.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txtBathAerator.Text = Convert.ToString(dt.Rows[0]["BathAeratorInstall"]);
                txtBathLocation.Text = Convert.ToString(dt.Rows[0]["BathAeratorLocation"]);
                txtKitchenAerator.Text = Convert.ToString(dt.Rows[0]["KitchenAeratorInstall"]);
                txtKitchenLocation.Text = Convert.ToString(dt.Rows[0]["KitchenAeratorLocation"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string showerHead = Convert.ToString(dt.Rows[0]["showerHead"]);
                if (showerHead == "Y")
                {
                    rdoInstalShowerYes.Checked = true;
                }
                else if (showerHead == "N")
                {
                    rdoInstalShowerNo.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txtSwivel.Text = Convert.ToString(dt.Rows[0]["swivelHeadInstall"]);
                txtSwivelLocation.Text = Convert.ToString(dt.Rows[0]["swivelHeadLocation"]);
                txtShutoff.Text = Convert.ToString(dt.Rows[0]["shutoffInstall"]);
                txtShutoffLocation.Text = Convert.ToString(dt.Rows[0]["shutoffLocation"]);
                txtWOshutoff.Text = Convert.ToString(dt.Rows[0]["WithOutShutoffInstall"]);
                txtWOshutoffLocation.Text = Convert.ToString(dt.Rows[0]["WithOutShutoffLocation"]);
                txtHandheld.Text = Convert.ToString(dt.Rows[0]["handheldInstall"]);
                txtHandheldLocation.Text = Convert.ToString(dt.Rows[0]["handheldLocation"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////

                string DrainPipeDiameter = Convert.ToString(dt.Rows[0]["DrainPipeDiameter"]);
                if (DrainPipeDiameter == "Y")
                {
                    rdoGFXsystemYes.Checked = true;
                }
                else if (DrainPipeDiameter == "N")
                {
                    rdoGFXsystemNo.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txtColdWatrSupply.Text = Convert.ToString(dt.Rows[0]["ColdWaterSupply"]);
                txtWaterHeater.Text = Convert.ToString(dt.Rows[0]["DrainPipeWaterHeater"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string InstallingGFX = Convert.ToString(dt.Rows[0]["InstallingGFX"]);
                if (InstallingGFX == "Y")
                {
                    rdoInstallGFXyes.Checked = true;
                }
                else if (InstallingGFX == "N")
                {
                    rdoInstallGFXno.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string IsCustomerTODRate = Convert.ToString(dt.Rows[0]["IsCustomerTODRate"]);
                if (IsCustomerTODRate == "Y")
                {
                    rdo_Customer_TOD_Yes.Checked = true;
                }
                else if (IsCustomerTODRate == "N")
                {
                    rdo_Customer_TOD_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string IsCustomerSavingOnRate = Convert.ToString(dt.Rows[0]["IsCustomerSavingOnRate"]);
                if (IsCustomerSavingOnRate == "Y")
                {
                    rdo_CustomerSavingRate_Yes.Checked = true;
                }
                else if (IsCustomerSavingOnRate == "N")
                {
                    rdo_CustomerSavingRate_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CustomerLifeStyle = Convert.ToString(dt.Rows[0]["CustomerLifeStyle"]);
                if (CustomerLifeStyle == "Y")
                {
                    rdo_CustomerSuitRateChange_Yes.Checked = true;
                }
                else if (CustomerLifeStyle == "N")
                {
                    rdo_CustomerSuitRateChange_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string IsCustomerSwitchToTODRate = Convert.ToString(dt.Rows[0]["IsCustomerSwitchToTODRate"]);
                if (IsCustomerSwitchToTODRate == "Y")
                {
                    rdo_CustomerSwitchTOD_Yes.Checked = true;
                }
                else if (IsCustomerSwitchToTODRate == "N")
                {
                    rdo_CustomerSwitchTOD_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string DoesCustomerHaveWaterHeaterTimer = Convert.ToString(dt.Rows[0]["DoesCustomerHaveWaterHeaterTimer"]);
                if (DoesCustomerHaveWaterHeaterTimer == "Y")
                {
                    rdo_Customer_WaterHeaterTimer_Yes.Checked = true;
                }
                else if (DoesCustomerHaveWaterHeaterTimer == "N")
                {
                    rdo_Customer_WaterHeaterTimer_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string TimerInstalled = Convert.ToString(dt.Rows[0]["TimerInstalled"]);
                if (TimerInstalled == "Y")
                {
                    rdo_TimerInstalled_Yes.Checked = true;
                }
                else if (TimerInstalled == "N")
                {
                    rdo_TimerInstalled_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////
                txt_comment1.Text = Convert.ToString(dt.Rows[0]["Page8Comments"]);
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
            string WaterHeaterFuel_Other;
            WaterHeaterFuel_Other = "";
            ///////////////////////////////////////////////////////////////////////////////////////////

            string WaterHeaterFuelType = "";
            if (rdo_WaterHeaterFuel_Electric.Checked == true)
            {
                WaterHeaterFuelType = "E";
            }
            else if (rdo_WaterHeaterFuel_FuelOil.Checked == true)
            {
                WaterHeaterFuelType = "F";
            }
            else if (rdo_WaterHeaterFuel_UtilityGas.Checked == true)
            {
                WaterHeaterFuelType = "U";
            }
            else if (rdo_WaterHeaterFuel_BottledGas.Checked == true)
            {
                WaterHeaterFuelType = "B";
            }
            else if (rdo_WaterHeaterFuel_Other.Checked == true)
            {
                WaterHeaterFuelType = "O";
                WaterHeaterFuel_Other = txt_WaterHeaterFuel_Other.Text;
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////


            string IsWaterHeaterLeaking = "";
            if (rdo_WaterHeaterLeak_Yes.Checked == true)
            {
                IsWaterHeaterLeaking = "Y";
            }
            else if (rdo_WaterHeaterLeak_No.Checked == true)
            {
                IsWaterHeaterLeaking = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string IsWaterHeaterRusted = "";
            if (rdo_WaterHeaterRusted_Yes.Checked == true)
            {
                IsWaterHeaterRusted = "Y";
            }
            else if (rdo_WaterHeaterRusted_No.Checked == true)
            {
                IsWaterHeaterRusted = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////



            string AreTheElementsBad = "";
            if (rdo_ElementBad_Yes.Checked == true)
            {
                AreTheElementsBad = "Y";
            }
            else if (rdo_ElementBad_No.Checked == true)
            {
                AreTheElementsBad = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string IsUnitRatedR8OrLess = "";
            if (rdo_UnitRated_Yes.Checked == true)
            {
                IsUnitRatedR8OrLess = "Y";
            }
            else if (rdo_UnitRated_No.Checked == true)
            {
                IsUnitRatedR8OrLess = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string WillWaterHeaterBeReplaced = "";
            if (rdo_WaterHeaterReplace_Yes.Checked == true)
            {
                WillWaterHeaterBeReplaced = "Y";
            }
            else if (rdo_WaterHeaterReplace_No.Checked == true)
            {
                WillWaterHeaterBeReplaced = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////



            string ReplaceOrAddExpansionTank = "";
            if (chk_AddExpansionTank_Yes.Checked == true)
            {
                ReplaceOrAddExpansionTank = "Y";
            }
            else if (chk_AddExpansionTank_No.Checked == true)
            {
                ReplaceOrAddExpansionTank = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string AreYouGoingToReplaceElements = "";
            if (chk_ReplaceElemnt_Yes.Checked == true)
            {
                AreYouGoingToReplaceElements = "Y";
            }
            else if (chk_ReplaceElemnt_No.Checked == true)
            {
                AreYouGoingToReplaceElements = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string AreYouGoingToReplaceThermostats = "";
            if (chk_ReplaceThermostats_Yes.Checked == true)
            {
                AreYouGoingToReplaceThermostats = "Y";
            }
            else if (chk_ReplaceThermostats_No.Checked == true)
            {
                AreYouGoingToReplaceThermostats = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////



            string AreYouGoingToFlushTank = "";
            if (chk_FlushTank_Yes.Checked == true)
            {
                AreYouGoingToFlushTank = "Y";
            }
            else if (chk_FlushTank_No.Checked == true)
            {
                AreYouGoingToFlushTank = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string AreYouGoingToAddPressureReliefValve = "";
            if (chk_PressureReliefValve_Yes.Checked == true)
            {
                AreYouGoingToAddPressureReliefValve = "Y";
            }
            else if (chk_PressureReliefValve_No.Checked == true)
            {
                AreYouGoingToAddPressureReliefValve = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string AreYouGoingToAddPressureReliefPipe = "";
            if (chk_PressureReliefPipe_Yes.Checked == true)
            {
                AreYouGoingToAddPressureReliefPipe = "Y";
            }
            else if (chk_PressureReliefPipe_No.Checked == true)
            {
                AreYouGoingToAddPressureReliefPipe = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string DidYouChangeTemperature = "";
            if (rdo_ChangeTemperature_Yes.Checked == true)
            {
                DidYouChangeTemperature = "Y";
            }
            else if (rdo_ChangeTemperature_No.Checked == true)
            {
                DidYouChangeTemperature = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////



            string AreYouWrappingWaterPipes = "";
            if (rdo_WrappingWaterPipe_Yes.Checked == true)
            {
                AreYouWrappingWaterPipes = "Y";
            }
            else if (rdo_WrappingWaterPipe_No.Checked == true)
            {
                AreYouWrappingWaterPipes = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string LinearFeetHOtWater12_34 = "";
            if (rdoHot1_2.Checked == true)
            {
                LinearFeetHOtWater12_34 = "12";
            }
            else if (rdoHot3_4.Checked == true)
            {
                LinearFeetHOtWater12_34 = "34";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////



            string LinearFeetColdWater12_34 = "";
            if (rdoCold1_2.Checked == true)
            {
                LinearFeetColdWater12_34 = "12";
            }
            else if (rdoCold3_4.Checked == true)
            {
                LinearFeetColdWater12_34 = "34";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////



            string AreThereAnyOtherLeaks = "";
            if (rdo_HotWaterLeaks_Yes.Checked == true)
            {
                AreThereAnyOtherLeaks = "Y";
            }
            else if (rdo_HotWaterLeaks_No.Checked == true)
            {
                AreThereAnyOtherLeaks = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string AreYouGoingToRepairLeaks = "";
            if (rdo_RepairLeaks_Yes.Checked == true)
            {
                AreYouGoingToRepairLeaks = "Y";
            }
            else if (rdo_RepairLeaks_No.Checked == true)
            {
                AreYouGoingToRepairLeaks = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////



            string FaucetAerators = "";
            if (rdoInstalFaucetYes.Checked == true)
            {
                FaucetAerators = "Y";
            }
            else if (rdoInstalFaucetNo.Checked == true)
            {
                FaucetAerators = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////



            string showerHead = "";
            if (rdoInstalShowerYes.Checked == true)
            {
                showerHead = "Y";
            }
            else if (rdoInstalShowerNo.Checked == true)
            {
                showerHead = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string DrainPipeDiameter = "";
            if (rdoGFXsystemYes.Checked == true)
            {
                DrainPipeDiameter = "Y";
            }
            else if (rdoGFXsystemNo.Checked == true)
            {
                DrainPipeDiameter = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string InstallingGFX = "";
            if (rdoInstallGFXyes.Checked == true)
            {
                InstallingGFX = "Y";
            }
            else if (rdoInstallGFXno.Checked == true)
            {
                InstallingGFX = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string IsCustomerTODRate = "";
            if (rdo_Customer_TOD_Yes.Checked == true)
            {
                IsCustomerTODRate = "Y";
            }
            else if (rdo_Customer_TOD_No.Checked == true)
            {
                IsCustomerTODRate = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string IsCustomerSavingOnRate = "";
            if (rdo_CustomerSavingRate_Yes.Checked == true)
            {
                IsCustomerSavingOnRate = "Y";
            }
            else if (rdo_CustomerSavingRate_No.Checked == true)
            {
                IsCustomerSavingOnRate = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string CustomerLifeStyle = "";
            if (rdo_CustomerSuitRateChange_Yes.Checked == true)
            {
                CustomerLifeStyle = "Y";
            }
            else if (rdo_CustomerSuitRateChange_No.Checked == true)
            {
                CustomerLifeStyle = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string IsCustomerSwitchToTODRate = "";
            if (rdo_CustomerSwitchTOD_Yes.Checked == true)
            {
                IsCustomerSwitchToTODRate = "Y";
            }
            else if (rdo_CustomerSwitchTOD_No.Checked == true)
            {
                IsCustomerSwitchToTODRate = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string DoesCustomerHaveWaterHeaterTimer = "";
            if (rdo_Customer_WaterHeaterTimer_Yes.Checked == true)
            {
                DoesCustomerHaveWaterHeaterTimer = "Y";
            }
            else if (rdo_Customer_WaterHeaterTimer_No.Checked == true)
            {
                DoesCustomerHaveWaterHeaterTimer = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string TimerInstalled = "";
            if (rdo_TimerInstalled_Yes.Checked == true)
            {
                TimerInstalled = "Y";
            }
            else if (rdo_TimerInstalled_No.Checked == true)
            {
                TimerInstalled = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////
            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_8(JobNum, WaterHeaterFuelType, WaterHeaterFuel_Other, txt_WaterHeatingIssues_Comment.Text, IsWaterHeaterLeaking, IsWaterHeaterRusted, AreTheElementsBad, IsUnitRatedR8OrLess, WillWaterHeaterBeReplaced, txtEnergyFctr.Text, txt_ExistingWaterHeaterSize.Text, txt_WaterHeaterReplaceSize.Text, ReplaceOrAddExpansionTank, AreYouGoingToReplaceElements, AreYouGoingToReplaceThermostats, AreYouGoingToFlushTank, AreYouGoingToAddPressureReliefValve, AreYouGoingToAddPressureReliefPipe, DidYouChangeTemperature, txt_ExistingTemp.Text, txt_TstLocation.Text, txt_AdjustTemp.Text, AreYouWrappingWaterPipes, txt_Linear_FT.Text, LinearFeetHOtWater12_34, txt_Location.Text, txt_Linear_ColdFt.Text, LinearFeetColdWater12_34, txtLocationColdFT.Text, txt_Comments.Text, AreThereAnyOtherLeaks, txt_HotWaterLeaksYes_Comment.Text, AreYouGoingToRepairLeaks, txt_RepairLeaks_Yes_Comment.Text, FaucetAerators, txtBathAerator.Text, txtBathLocation.Text, txtKitchenAerator.Text, txtKitchenLocation.Text, showerHead, txtSwivel.Text, txtSwivelLocation.Text, txtShutoff.Text, txtShutoffLocation.Text, txtWOshutoff.Text, txtWOshutoffLocation.Text, txtHandheld.Text, txtHandheldLocation.Text, DrainPipeDiameter, txtColdWatrSupply.Text, txtWaterHeater.Text, InstallingGFX, IsCustomerTODRate, IsCustomerSavingOnRate, CustomerLifeStyle, IsCustomerSwitchToTODRate, DoesCustomerHaveWaterHeaterTimer, TimerInstalled, txt_comment1.Text);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }
}
