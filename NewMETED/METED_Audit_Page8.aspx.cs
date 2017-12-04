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

public partial class METED_METED_Audit_Page7 : System.Web.UI.Page
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_7(JobNum);
            DateTime dateRec = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]);
            DateTime dateComr = Convert.ToDateTime("1/12/2015");
            if (dateRec < dateComr)
            {
                tr_InstallCentralAC.Visible = true;
                tr_CentralWindowAC.Visible = true;
            }
            else
            {
                tr_InstallCentralAC.Visible = false;
                tr_CentralWindowAC.Visible = false;
            }
            if (dt.Rows.Count > 0)
            {
                txt_WasherLoadWeek.Text = Convert.ToString(dt.Rows[0]["NumberOfWasherLoadsPerWeek"]);

                ////////////////////////////////////////////////////////////////////////


                string FilterSlotCovered = Convert.ToString(dt.Rows[0]["FilterSlotCovered"]);
                if (FilterSlotCovered == "Y")
                {
                    rdo_slotCovered_yes.Checked = true;
                }
                else if (FilterSlotCovered == "N")
                {
                    rdo_slotCovered_no.Checked = true;
                }
                else if (FilterSlotCovered == "NA")
                {
                    rdo_slotCovered_na.Checked = true;
                }


                string WaterHeaterType = Convert.ToString(dt.Rows[0]["WaterHeaterType"]);
                if (WaterHeaterType == "E")
                {
                    rdo_WaterHeater_Electric.Checked = true;
                }
                else if (WaterHeaterType == "G")
                {
                    rdo_WaterHeater_Gas.Checked = true;
                }
                ////////////////////////////////////////////////////////////////////////


                string VentingDoneOrNot = Convert.ToString(dt.Rows[0]["VentingDoneOrNot"]);
                if (VentingDoneOrNot == "Y")
                {
                    rdo_VentinYes.Checked = true;
                }
                else if (VentingDoneOrNot == "N")
                {
                    rdo_VentinNo.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////

                string TemperatureCurrentlyUse = Convert.ToString(dt.Rows[0]["TemperatureCurrentlyUse"]);
                if (TemperatureCurrentlyUse == "HW")
                {
                    chk_HotWash.Checked = true;
                }
                else if (TemperatureCurrentlyUse == "WW")
                {
                    chk_WarmWash.Checked = true;
                }
                else if (TemperatureCurrentlyUse == "CW")
                {
                    chk_ColdWash.Checked = true;
                }
                else if (TemperatureCurrentlyUse == "O")
                {
                    chk_OtherWash.Checked = true;
                    txt_Temperature_Other.Text = Convert.ToString(dt.Rows[0]["TemperatureCurrentlyUseOther"]);
                }

                ////////////////////////////////////////////////////////////////////////

                txt_WasherComment.Text = Convert.ToString(dt.Rows[0]["WasherComments"]);
                txt_ElectricDrayerLoadWeek.Text = Convert.ToString(dt.Rows[0]["ElectricDryerLoadPerWeek"]);
                txt_DryALoad.Text = Convert.ToString(dt.Rows[0]["TakeToDryALoad"]);

                ////////////////////////////////////////////////////////////////////////

                string DryerType = Convert.ToString(dt.Rows[0]["DryerType"]);
                if (DryerType == "E")
                {
                    rdo_DryerType_Electic.Checked = true;
                }
                else if (DryerType == "G")
                {
                    rdo_DryerType_Gas.Checked = true;
                }


                ////////////////////////////////////////////////////////////////////////

                string IsDryerVentedProperly = Convert.ToString(dt.Rows[0]["IsDryerVentedProperly"]);
                if (IsDryerVentedProperly == "Y")
                {
                    rdo_DryerVented_Yes.Checked = true;
                }
                else if (IsDryerVentedProperly == "N")
                {
                    rdo_DryerVented_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////

                txt_DryerVenting_Location.Text = Convert.ToString(dt.Rows[0]["VentingLocation"]);

                //////////////////////////////////////////////////////////////////////// 

                string MakeANewHole = Convert.ToString(dt.Rows[0]["MakeANewHole"]);
                if (MakeANewHole == "MNH")
                {
                    rdo_MakeNewHole.Checked = true;
                }
                else if (MakeANewHole == "V")
                {
                    rdo_DryerUseExistingHole.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////

                txt_ExistingHole_Feet.Text = Convert.ToString(dt.Rows[0]["ApproxNumberOfFeet"]);
                txt_ExistingHole_Elbows.Text = Convert.ToString(dt.Rows[0]["NumberOfElbows"]);

                ////////////////////////////////////////////////////////////////////////

                string AddNewVentCapHood = Convert.ToString(dt.Rows[0]["AddNewVentCapHood"]);
                if (AddNewVentCapHood == "Y")
                {
                    chk_NewVentCap.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////

                txt_AluminumFlexUsed.Text = Convert.ToString(dt.Rows[0]["AluminumFlexUsed"]);

                ////////////////////////////////////////////////////////////////////////
                string WouldAClothesLineBeEffective = Convert.ToString(dt.Rows[0]["WouldAClothesLineBeEffective"]);
                if (WouldAClothesLineBeEffective == "Y")
                {
                    rdo_ClothesCostEffect_Yes.Checked = true;
                }
                else if (WouldAClothesLineBeEffective == "N")
                {
                    rdo_ClothesCostEffect_No.Checked = true;
                }
                string IsOneBeingInstalled = Convert.ToString(dt.Rows[0]["IsOneBeingInstalled"]);
                if (IsOneBeingInstalled == "Y")
                {
                    rdo_BeingInstall_Yes.Checked = true;
                }
                else if (IsOneBeingInstalled == "N")
                {
                    rdo_BeingInstall_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////


                txt_OtherDryIssue.Text = Convert.ToString(dt.Rows[0]["OtherDryingIssuesComments"]);
                ///////////////////////////////////////////////////////////////////////////////

                string HeatingSystemLine1 = Convert.ToString(dt.Rows[0]["HeatingSystemLine1"]);
                if (HeatingSystemLine1 == "Y")
                {
                    rdo_NewFilterInstal1_Yes.Checked = true;
                }
                else if (HeatingSystemLine1 == "N")
                {
                    rdo_NewFilterInstal1_No.Checked = true;
                }
                /////////////////////////////////////////////////////////////////////////

                txt_NumberNewFilterInstal1.Text = Convert.ToString(dt.Rows[0]["NumberInstalledLine1"]);
                txt_FilterDimensions1.Text = Convert.ToString(dt.Rows[0]["FilterDimensionsLine1"]);

                ////////////////////////////////////////////////////////////////////////////


                string HeatingSystemLine2 = Convert.ToString(dt.Rows[0]["HeatingSystemLine2"]);
                if (HeatingSystemLine2 == "Y")
                {
                    rdo_NewFilterInstal2_Yes.Checked = true;
                }
                else if (HeatingSystemLine2 == "N")
                {
                    rdo_NewFilterInstal2_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////

                txt_NumberNewFilterInstal2.Text = Convert.ToString(dt.Rows[0]["NumberInstalledLine2"]);

                ////////////////////////////////////////////////////////////////////////////

                string WindowACLine3 = Convert.ToString(dt.Rows[0]["WindowACLine3"]);
                if (WindowACLine3 == "Y")
                {
                    rdo_NewFilterACInstal_Yes.Checked = true;
                }
                else if (WindowACLine3 == "N")
                {
                    rdo_NewFilterACInstal_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////


                txt_NumberNewFilterACInstal.Text = Convert.ToString(dt.Rows[0]["WindowACNumberInstalledLine3"]);
                txt_FilterDimensions2.Text = Convert.ToString(dt.Rows[0]["FilterDimensionsLine3"]);

                ////////////////////////////////////////////////////////////////////////////////

                string HeatingSystemLine4 = Convert.ToString(dt.Rows[0]["HeatingSystemLine4"]);
                if (HeatingSystemLine4 == "Y")
                {
                    rdo_NewFilterInstal3_Yes.Checked = true;
                }
                else if (HeatingSystemLine4 == "N")
                {
                    rdo_NewFilterInstal3_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////

                txt_NumberNewFilterInstal3.Text = Convert.ToString(dt.Rows[0]["NumberInstalledLine4"]);

                //////////////////////////////////////////////////////////////////////////////

                string WellPumpUsed = Convert.ToString(dt.Rows[0]["WellPumpUsed"]);
                if (WellPumpUsed == "Y")
                {
                    rdo_WellPumpUsed_Yes.Checked = true;
                }
                else if (WellPumpUsed == "N")
                {
                    rdo_WellPumpUsed_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////

                string WaterLeaks = Convert.ToString(dt.Rows[0]["WaterLeaks"]);
                if (WaterLeaks == "Y")
                {
                    rdo_WaterLeaks_Yes.Checked = true;
                }
                else if (WaterLeaks == "N")
                {
                    rdo_WaterLeaks_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////

                string DehumidifierUsed = Convert.ToString(dt.Rows[0]["DehumidifierUsed"]);
                if (DehumidifierUsed == "Y")
                {
                    rdo_DehumidifierUsed_Yes.Checked = true;
                }
                else if (DehumidifierUsed == "N")
                {
                    rdo_DehumidifierUsed_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////

                string PoolPumpUsed = Convert.ToString(dt.Rows[0]["PoolPumpUsed"]);
                if (PoolPumpUsed == "Y")
                {
                    rdo_PoolPumpUsed_Yes.Checked = true;
                }
                else if (PoolPumpUsed == "N")
                {
                    rdo_PoolPumpUsed_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////

                string SepticSystemGrinders = Convert.ToString(dt.Rows[0]["SepticSystemGrinders"]);
                if (SepticSystemGrinders == "Y")
                {
                    rdo_SepticSystemGrinders_Yes.Checked = true;
                }
                else if (SepticSystemGrinders == "N")
                {
                    rdo_SepticSystemGrinders_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////

                string WillingToRreplaceWaterbed = Convert.ToString(dt.Rows[0]["WillingToRreplaceWaterbed"]);
                if (WillingToRreplaceWaterbed == "Y")
                {
                    rdo_ReplaceWaterbed_Yes.Checked = true;
                }
                else if (WillingToRreplaceWaterbed == "N")
                {
                    rdo_ReplaceWaterbed_No.Checked = true;
                }
                else if (WillingToRreplaceWaterbed == "NA")
                {
                    rdo_ReplaceWaterbed_NA.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////


                string ReplacementSize = Convert.ToString(dt.Rows[0]["ReplacementSize"]);
                if (ReplacementSize == "SS")
                {
                    rdo_Replacement_SuperSingle.Checked = true;
                }
                else if (ReplacementSize == "Q")
                {
                    rdo_Replacement_Queen.Checked = true;
                }
                else if (ReplacementSize == "K")
                {
                    rdo_Replacement_King.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////

                txt_MoistureVentilationElectricComment.Text = Convert.ToString(dt.Rows[0]["CommentSuchASMoistureVentilation"]);
                txt_Comment.Text = Convert.ToString(dt.Rows[0]["CommentPage7"]);
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
            string TemperatureCurrentlyUseOther;
            TemperatureCurrentlyUseOther = "";



            string WaterHeaterType = "";
            if (rdo_WaterHeater_Electric.Checked == true)
            {
                WaterHeaterType = "E";
            }
            else if (rdo_WaterHeater_Gas.Checked == true)
            {
                WaterHeaterType = "G";
            }

            //////////////////////////////////////////////////////////////////////

            string TemperatureCurrentlyUse = "";
            if (chk_HotWash.Checked == true)
            {
                TemperatureCurrentlyUse = "HW";
            }
            else if (chk_WarmWash.Checked == true)
            {
                TemperatureCurrentlyUse = "WW";
            }
            else if (chk_ColdWash.Checked == true)
            {
                TemperatureCurrentlyUse = "CW";
            }
            else if (chk_OtherWash.Checked == true)
            {
                TemperatureCurrentlyUse = "O";
                TemperatureCurrentlyUseOther = txt_Temperature_Other.Text;
            }

            ///////////////////////////////////////////////////////////////////////////////

            string DryerType = "";
            if (rdo_DryerType_Electic.Checked == true)
            {
                DryerType = "E";
            }
            else if (rdo_DryerType_Gas.Checked == true)
            {
                DryerType = "G";
            }


            ///////////////////////////////////////////////////////////////////////////////

            string IsDryerVentedProperly = "";
            if (rdo_DryerVented_Yes.Checked == true)
            {
                IsDryerVentedProperly = "Y";
            }
            else if (rdo_DryerVented_No.Checked == true)
            {
                IsDryerVentedProperly = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////

            string MakeANewHole = "";
            if (rdo_MakeNewHole.Checked == true)
            {
                MakeANewHole = "MNH";
            }
            else if (rdo_DryerUseExistingHole.Checked == true)
            {
                MakeANewHole = "V";
            }

            ///////////////////////////////////////////////////////////////////////////////

            string AddNewVentCapHood = "";
            if (chk_NewVentCap.Checked == true)
            {
                AddNewVentCapHood = "Y";
            }


            ///////////////////////////////////////////////////////////////////////////////

            string WouldAClothesLineBeEffective = "";
            if (rdo_ClothesCostEffect_Yes.Checked == true)
            {
                WouldAClothesLineBeEffective = "Y";
            }
            else if (rdo_ClothesCostEffect_No.Checked == true)
            {
                WouldAClothesLineBeEffective = "N";
            }
            string IsOneBeingInstalled = "";
            if (rdo_BeingInstall_Yes.Checked == true)
            {
                IsOneBeingInstalled = "Y";
            }
            else if (rdo_BeingInstall_No.Checked == true)
            {
                IsOneBeingInstalled = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////

            string HeatingSystemLine1 = "";
            if (rdo_NewFilterInstal1_Yes.Checked == true)
            {
                HeatingSystemLine1 = "Y";
            }
            else if (rdo_NewFilterInstal1_No.Checked == true)
            {
                HeatingSystemLine1 = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////

            string HeatingSystemLine2 = "";
            if (rdo_NewFilterInstal2_Yes.Checked == true)
            {
                HeatingSystemLine2 = "Y";
            }
            else if (rdo_NewFilterInstal2_No.Checked == true)
            {
                HeatingSystemLine2 = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////

            string WindowACLine3 = "";
            if (rdo_NewFilterACInstal_Yes.Checked == true)
            {
                WindowACLine3 = "Y";
            }
            else if (rdo_NewFilterACInstal_No.Checked == true)
            {
                WindowACLine3 = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////


            string HeatingSystemLine4 = "";
            if (rdo_NewFilterInstal3_Yes.Checked == true)
            {
                HeatingSystemLine4 = "Y";
            }
            else if (rdo_NewFilterInstal3_No.Checked == true)
            {
                HeatingSystemLine4 = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////

            string WellPumpUsed = "";
            if (rdo_WellPumpUsed_Yes.Checked == true)
            {
                WellPumpUsed = "Y";
            }
            else if (rdo_WellPumpUsed_No.Checked == true)
            {
                WellPumpUsed = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////

            string WaterLeaks = "";
            if (rdo_WaterLeaks_Yes.Checked == true)
            {
                WaterLeaks = "Y";
            }
            else if (rdo_WaterLeaks_No.Checked == true)
            {
                WaterLeaks = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////

            string DehumidifierUsed = "";
            if (rdo_DehumidifierUsed_Yes.Checked == true)
            {
                DehumidifierUsed = "Y";
            }
            else if (rdo_DehumidifierUsed_No.Checked == true)
            {
                DehumidifierUsed = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////

            string PoolPumpUsed = "";
            if (rdo_PoolPumpUsed_Yes.Checked == true)
            {
                PoolPumpUsed = "Y";
            }
            else if (rdo_PoolPumpUsed_No.Checked == true)
            {
                PoolPumpUsed = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////

            string SepticSystemGrinders = "";
            if (rdo_SepticSystemGrinders_Yes.Checked == true)
            {
                SepticSystemGrinders = "Y";
            }
            else if (rdo_SepticSystemGrinders_No.Checked == true)
            {
                SepticSystemGrinders = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////

            string WillingToRreplaceWaterbed = "";
            if (rdo_ReplaceWaterbed_Yes.Checked == true)
            {
                WillingToRreplaceWaterbed = "Y";
            }
            else if (rdo_ReplaceWaterbed_No.Checked == true)
            {
                WillingToRreplaceWaterbed = "N";
            }
            else if (rdo_ReplaceWaterbed_NA.Checked == true)
            {
                WillingToRreplaceWaterbed = "NA";
            }

            ////////////////////////////////////////////////////////////////////////////////////


            string ReplacementSize = "";
            if (rdo_Replacement_SuperSingle.Checked == true)
            {
                ReplacementSize = "SS";
            }
            else if (rdo_Replacement_Queen.Checked == true)
            {
                ReplacementSize = "Q";
            }
            else if (rdo_Replacement_King.Checked == true)
            {
                ReplacementSize = "K";
            }

            //////////////////////////////////////////////////////////////////////////////////////

            string VentingDoneOrNot = "";
            if (rdo_VentinYes.Checked == true)
            {
                VentingDoneOrNot = "Y";
            }
            else if (rdo_VentinNo.Checked == true)
            {
                VentingDoneOrNot = "N";
            }

            //////////////////////////////////////////////////////////////////////////////////////

            string FilterSlotCovered = "";
            if (rdo_slotCovered_yes.Checked == true)
            {
                FilterSlotCovered = "Y";
            }
            else if (rdo_slotCovered_no.Checked == true)
            {
                FilterSlotCovered = "N";
            }
            else if (rdo_slotCovered_na.Checked == true)
            {
                FilterSlotCovered = "NA";
            }


            //////////////////////////////////////////////////////////////////////////////////////



            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_7(JobNum, txt_WasherLoadWeek.Text, WaterHeaterType, TemperatureCurrentlyUse, TemperatureCurrentlyUseOther, txt_WasherComment.Text, txt_ElectricDrayerLoadWeek.Text, txt_DryALoad.Text, DryerType, IsDryerVentedProperly, txt_DryerVenting_Location.Text, MakeANewHole, txt_ExistingHole_Feet.Text, txt_ExistingHole_Elbows.Text, AddNewVentCapHood, txt_AluminumFlexUsed.Text, WouldAClothesLineBeEffective, IsOneBeingInstalled, txt_OtherDryIssue.Text, HeatingSystemLine1, txt_NumberNewFilterInstal1.Text, txt_FilterDimensions1.Text, HeatingSystemLine2, txt_NumberNewFilterInstal2.Text, WindowACLine3, txt_NumberNewFilterACInstal.Text, txt_FilterDimensions2.Text, HeatingSystemLine4, txt_NumberNewFilterInstal3.Text, WellPumpUsed, WaterLeaks, DehumidifierUsed, PoolPumpUsed, SepticSystemGrinders, WillingToRreplaceWaterbed, ReplacementSize, txt_MoistureVentilationElectricComment.Text, txt_Comment.Text, FilterSlotCovered, VentingDoneOrNot);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }

}
