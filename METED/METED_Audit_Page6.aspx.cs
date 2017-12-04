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

public partial class METED_METED_Audit_Page6 : System.Web.UI.Page
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_6(JobNum);
            DateTime dateRec = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]);
            DateTime dateComr = Convert.ToDateTime("1/12/2015");
            if (dateRec < dateComr)
            {
                tr_freezersUsed.Visible = false;
            }
            else
            {
                tr_freezersUsed.Visible = true;
            }
            if (dt.Rows.Count > 0)
            {

                string PrimaryFreezerFrostFree = Convert.ToString(dt.Rows[0]["PrimaryFreezerFrostFree"]);
                if (PrimaryFreezerFrostFree == "Y")
                {
                    chk_PriFrezer_FrostFree_Yes.Checked = true;
                }
                else if (PrimaryFreezerFrostFree == "N")
                {
                    chk_PriFrezer_FrostFree_No.Checked = true;
                }


                string SecondryFreezerFrostFree = Convert.ToString(dt.Rows[0]["SecondryFreezerFrostFree"]);
                if (SecondryFreezerFrostFree == "Y")
                {
                    Chk_SecoFrezer_FrostFree_Yes.Checked = true;
                }
                else if (SecondryFreezerFrostFree == "N")
                {
                    Chk_SecoFrezer_FrostFree_No.Checked = true;
                }


                string AdditionalFreezerFrostFree = Convert.ToString(dt.Rows[0]["AdditionalFreezerFrostFree"]);
                if (AdditionalFreezerFrostFree == "Y")
                {
                    Chk_AddFrezer_FrostFree_Yes.Checked = true;
                }
                else if (AdditionalFreezerFrostFree == "N")
                {
                    Chk_AddFrezer_FrostFree_No.Checked = true;
                }




                txt_FreezersUsed.Text = Convert.ToString(dt.Rows[0]["freezersUsed"]);
                txt_PriFrezer_Location.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerLocation"]);
                txt_PriFrezer_OperatingCost.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerCalculatedCostMonth"]);
                txt_PriFrezer_Make.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerMake"]);
                txt_PriFrezer_Model.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerModel"]);
                txt_PriFrezer_Year.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerYear"]);
                txt_PriFrezer_Size.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerSize"]);
                txt_PriFrezer_StartTime.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerStartTime"]);
                txt_PriFrezer_EndTime.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerEndTime"]);
                txt_PriFrezer_TotalTime.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerTotalTimeMonitored"]);
                txt_PriFrezer_Monitor.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerReading"]);
                txt_PriFrezer_Conversion.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerkWhconversionatonehour"]);

                string IsPrimaryFreezerElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsPrimaryFreezerElligibleForReplacement"]);
                if (IsPrimaryFreezerElligibleForReplacement == "Y")
                {
                    rdo_PriFrezer_Replacement_Yes.Checked = true;
                }
                else if (IsPrimaryFreezerElligibleForReplacement == "N")
                {
                    rdo_PriFrezer_Replacement_No.Checked = true;
                }


                txt_PriFrezer_TemperatureFood.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerTemperatureInsideFreshFood"]);
                txt_PriFrezer_TemperatureRoom.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerRoomTemperature"]);

                string PrimaryFreezerDataBaseUsed = Convert.ToString(dt.Rows[0]["PrimaryFreezerDataBaseUsed"]);
                if (PrimaryFreezerDataBaseUsed == "Y")
                {
                    chk_PriFrezer_DatabseUsed.Checked = true;
                }


                txt_PriFrezer_ReplacementSize.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerReplacementSize"]);
                txt_PriFrezer_TemperatureFrezer.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerTemperatureinsidefreezer"]);

                string PrimaryFreezerDidNotTestBecause = Convert.ToString(dt.Rows[0]["PrimaryFreezerDidNotTestBecause"]);
                if (PrimaryFreezerDidNotTestBecause == "Y")
                {
                    chk_PriFrezer_NotTst.Checked = true;
                }


                string PrimaryFreezerCouldNotMove = Convert.ToString(dt.Rows[0]["PrimaryFreezerCouldNotMove"]);
                if (PrimaryFreezerCouldNotMove == "CM")
                {
                    rdo_PriFrezer_NotTst_NotMove.Checked = true;
                }
                else if (PrimaryFreezerCouldNotMove == "5Y")
                {
                    rdo_PriFrezer_NotTst_5Yr_Old.Checked = true;
                }
                else if (PrimaryFreezerCouldNotMove == "CR")
                {
                    rdo_PriFrezer_NotTst_CustomerRefuse.Checked = true;
                }

                string PrimaryUprightChest = Convert.ToString(dt.Rows[0]["PrimaryUprightChest"]);
                if (PrimaryUprightChest == "U")
                {
                    rdoPrimaryUpright.Checked = true;
                }
                else if (PrimaryUprightChest == "C")
                {
                    rdoAdditionalChest.Checked = true;
                }



                txt_SecoFrezer_Location.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerLocation"]);
                txt_SecoFrezer_OperatingCost.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerCalculatedCostMonth"]);
                txt_SecoFrezer_Make.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerMake"]);
                txt_SecoFrezer_Model.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerModel"]);
                txt_SecoFrezer_year.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerYear"]);
                txt_SecoFrezer_Size.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerSize"]);
                txt_SecoFrezer_StartTime.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerStartTime"]);
                txt_SecoFrezer_EndTime.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerEndTime"]);
                txt_SecoFrezer_TotalTime.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerTotalTimeMonitored"]);
                txt_SecoFrezer_Monitor.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerReading"]);
                txt_SecoFrezer_Conversion.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerkWhconversionatonehour"]);
                txt_SecoFrezer_TemperactureFood.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezeTemperatureInsideFreshFood"]);
                txt_SecoFrezer_TemperactureRoom.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerRoomTemperature"]);

                string IsSecondaryFreezerElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsSecondaryFreezerElligibleForReplacement"]);
                if (IsSecondaryFreezerElligibleForReplacement == "Y")
                {
                    rdo_SecoFrezer_Replacement_Yes.Checked = true;
                }
                else if (IsSecondaryFreezerElligibleForReplacement == "N")
                {
                    rdo_SecoFrezer_Replacement_No.Checked = true;
                }


                string SecondaryFreezerDataBaseUsed = Convert.ToString(dt.Rows[0]["SecondaryFreezerDataBaseUsed"]);
                if (SecondaryFreezerDataBaseUsed == "Y")
                {
                    chk_SecoFrezer_DatabseUsed.Checked = true;
                }

                txt_SecoFrezer_ReplacementSize.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerReplacementSize"]);
                txt_SecoFrezer_TemperactureFrezer.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerTemperatureinsidefreezer"]);

                string SecondaryFreezerDidNotTestBecause = Convert.ToString(dt.Rows[0]["SecondaryFreezerDidNotTestBecause"]);
                if (SecondaryFreezerDidNotTestBecause == "Y")
                {
                    chk_SecoFrezer_NotTst.Checked = true;
                }


                string SecondaryFreezerCouldNotMove = Convert.ToString(dt.Rows[0]["SecondaryFreezerCouldNotMove"]);
                if (SecondaryFreezerCouldNotMove == "CM")
                {
                    rdo_SecoFrezer_NotTst_NotMove.Checked = true;
                }
                else if (SecondaryFreezerCouldNotMove == "5Y")
                {
                    rdo_SecoFrezer_NotTst_5Yr_Old.Checked = true;
                }
                else if (SecondaryFreezerCouldNotMove == "CR")
                {
                    rdo_SecoFrezer_NotTst_CustomerRefuse.Checked = true;
                }



                string SecondaryUprightChest = Convert.ToString(dt.Rows[0]["SecondryUprightChest"]);
                if (SecondaryUprightChest == "U")
                {
                    rdo_SecondryUpright.Checked = true;
                }
                else if (SecondaryUprightChest == "C")
                {
                    rdoSecondryChest.Checked = true;
                }

                txt_AddFrezer_Location.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerLocation"]);
                txt_AddFrezer_OperatingCost.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerCalculatedCostMonth"]);
                txt_AddFrezer_Make.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerMake"]);
                txt_AddFrezer_Model.Text = Convert.ToString(dt.Rows[0]["AdditionalPrimaryFreezerModel"]);
                txt_AddFrezer_Year.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerYear"]);
                txt_AddFrezer_Size.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerSize"]);
                txt_AddFrezer_StartTime.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerStartTime"]);
                txt_AddFrezer_EndTime.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerEndTime"]);
                txt_AddFrezer_TotalTime.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerTotalTimeMonitored"]);
                txt_AddFrezer_Monitor.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerReading"]);
                txt_AddFrezer_Conversion.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerkWhconversionatonehour"]);
                txt_AddFrezer_TemperatureFood.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezeTemperatureInsideFreshFood"]);
                txt_AddFrezer_TemperatureRoom.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerRoomTemperature"]);
                string IsAdditionalFreezerElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsAdditionalFreezerElligibleForReplacement"]);
                if (IsAdditionalFreezerElligibleForReplacement == "Y")
                {
                    rdo_AddFrezer_Replacement_Yes.Checked = true;
                }
                else if (IsAdditionalFreezerElligibleForReplacement == "N")
                {
                    rdo_AddFrezer_Replacement_No.Checked = true;
                }

                string AdditionalFreezerDataBaseUsed = Convert.ToString(dt.Rows[0]["AdditionalFreezerDataBaseUsed"]);
                if (AdditionalFreezerDataBaseUsed == "Y")
                {
                    chk_AddFrezer_DatabseUsed.Checked = true;
                }

                txt_AddFrezer_ReplacementSize.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerReplacementSize"]);
                txt_AddFrezer_TemperatureFrezer.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerTemperatureinsidefreezer"]);
                string AdditionalFreezerDidNotTestBecause = Convert.ToString(dt.Rows[0]["AdditionalFreezerDidNotTestBecause"]);
                if (AdditionalFreezerDidNotTestBecause == "Y")
                {
                    chk_AddFrezer_NotTst.Checked = true;
                }
                string AdditionalFreezerCouldNotMove = Convert.ToString(dt.Rows[0]["AdditionalFreezerCouldNotMove"]);
                if (AdditionalFreezerCouldNotMove == "CM")
                {
                    rdo_AddFrezer_NotTst_NotMove.Checked = true;
                }
                else if (AdditionalFreezerCouldNotMove == "5Y")
                {
                    rdo_AddFrezer_NotTst_5Yr_Old.Checked = true;
                }
                else if (AdditionalFreezerCouldNotMove == "CR")
                {
                    rdo_AddFrezer_NotTst_CustomerRefuse.Checked = true;
                }

                string AdditionalUprightChest = Convert.ToString(dt.Rows[0]["AdditionalUprightChest"]);
                if (AdditionalUprightChest == "U")
                {
                    rdoAdditionalUpright.Checked = true;
                }
                else if (AdditionalUprightChest == "C")
                {
                    rdoAdditionalChest.Checked = true;
                }

                txt_Refrigerators_Freezers.Text = Convert.ToString(dt.Rows[0]["Page6Comments"]);
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

            ///////////////////////// Primary //////////////////////////////////////////

            string IsPrimaryFreezerElligibleForReplacement = "";
            if (rdo_PriFrezer_Replacement_Yes.Checked == true)
            {
                IsPrimaryFreezerElligibleForReplacement = "Y";
            }
            else if (rdo_PriFrezer_Replacement_No.Checked == true)
            {
                IsPrimaryFreezerElligibleForReplacement = "N";
            }


            string PrimaryFreezerDataBaseUsed = "";
            if (chk_PriFrezer_DatabseUsed.Checked == true)
            {
                PrimaryFreezerDataBaseUsed = "Y";
            }



            string PrimaryFreezerDidNotTestBecause = "";
            if (chk_PriFrezer_NotTst.Checked == true)
            {
                PrimaryFreezerDidNotTestBecause = "Y";
            }


            string PrimaryFreezerCouldNotMove = "";
            if (rdo_PriFrezer_NotTst_NotMove.Checked == true)
            {
                PrimaryFreezerCouldNotMove = "CM";
            }
            else if (rdo_PriFrezer_NotTst_5Yr_Old.Checked == true)
            {
                PrimaryFreezerCouldNotMove = "5Y";
            }
            else if (rdo_PriFrezer_NotTst_CustomerRefuse.Checked == true)
            {
                PrimaryFreezerCouldNotMove = "CR";
            }


            string PrimaryUprightChest = "";
            if (rdoPrimaryUpright.Checked == true)
            {
                PrimaryUprightChest = "U";
            }
            else if (rdoPrimaryChest.Checked == true)
            {
                PrimaryUprightChest = "C";
            }

            ///////////////////////// Secondary //////////////////////////////////////////

            string IsSecondaryFreezerElligibleForReplacement = "";
            if (rdo_SecoFrezer_Replacement_Yes.Checked == true)
            {
                IsSecondaryFreezerElligibleForReplacement = "Y";
            }
            else if (rdo_SecoFrezer_Replacement_No.Checked == true)
            {
                IsSecondaryFreezerElligibleForReplacement = "N";
            }


            string SecondaryFreezerDataBaseUsed = "";
            if (chk_SecoFrezer_DatabseUsed.Checked == true)
            {
                SecondaryFreezerDataBaseUsed = "Y";
            }

            string SecondaryFreezerDidNotTestBecause = "";
            if (chk_SecoFrezer_NotTst.Checked == true)
            {
                SecondaryFreezerDidNotTestBecause = "Y";
            }


            string SecondaryFreezerCouldNotMove = "";
            if (rdo_SecoFrezer_NotTst_NotMove.Checked == true)
            {
                SecondaryFreezerCouldNotMove = "CM";
            }
            else if (rdo_SecoFrezer_NotTst_5Yr_Old.Checked == true)
            {
                SecondaryFreezerCouldNotMove = "5Y";
            }
            else if (rdo_SecoFrezer_NotTst_CustomerRefuse.Checked == true)
            {
                SecondaryFreezerCouldNotMove = "CR";
            }

            string SecondryUprightChest = "";
            if (rdo_SecondryUpright.Checked == true)
            {
                SecondryUprightChest = "U";
            }
            else if (rdoSecondryChest.Checked == true)
            {
                SecondryUprightChest = "C";
            }

            ///////////////////////// Additional //////////////////////////////////////////


            string IsAdditionalFreezerElligibleForReplacement = "";
            if (rdo_AddFrezer_Replacement_Yes.Checked == true)
            {
                IsAdditionalFreezerElligibleForReplacement = "Y";
            }
            else if (rdo_AddFrezer_Replacement_No.Checked == true)
            {
                IsAdditionalFreezerElligibleForReplacement = "N";
            }

            string AdditionalFreezerDataBaseUsed = "";
            if (chk_AddFrezer_DatabseUsed.Checked == true)
            {
                AdditionalFreezerDataBaseUsed = "Y";
            }

            string AdditionalFreezerDidNotTestBecause = "";
            if (chk_AddFrezer_NotTst.Checked == true)
            {
                AdditionalFreezerDidNotTestBecause = "Y";
            }
            string AdditionalFreezerCouldNotMove = "";
            if (rdo_AddFrezer_NotTst_NotMove.Checked == true)
            {
                AdditionalFreezerCouldNotMove = "CM";
            }
            else if (rdo_AddFrezer_NotTst_5Yr_Old.Checked == true)
            {
                AdditionalFreezerCouldNotMove = "5Y";
            }
            else if (rdo_AddFrezer_NotTst_CustomerRefuse.Checked == true)
            {
                AdditionalFreezerCouldNotMove = "CR";
            }

            string AdditionalUprightChest = "";
            if (rdoAdditionalUpright.Checked == true)
            {
                AdditionalUprightChest = "U";
            }
            else if (rdoAdditionalChest.Checked == true)
            {
                AdditionalUprightChest = "C";
            }

            ///////////////////////// Additional //////////////////////////////////////////



            string PrimaryFreezerFrostFree = "";
            if (chk_PriFrezer_FrostFree_Yes.Checked == true)
            {
                PrimaryFreezerFrostFree = "Y";
            }
            else if (chk_PriFrezer_FrostFree_No.Checked == true)
            {
                PrimaryFreezerFrostFree = "N";
            }


            string SecondryFreezerFrostFree = "";
            if (Chk_SecoFrezer_FrostFree_Yes.Checked == true)
            {
                SecondryFreezerFrostFree = "Y";
            }
            else if (Chk_SecoFrezer_FrostFree_No.Checked == true)
            {
                SecondryFreezerFrostFree = "N";
            }


            string AdditionalFreezerFrostFree = "";
            if (Chk_AddFrezer_FrostFree_Yes.Checked == true)
            {
                AdditionalFreezerFrostFree = "Y";
            }
            else if (Chk_AddFrezer_FrostFree_No.Checked == true)
            {
                AdditionalFreezerFrostFree = "N";
            }



            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_6(JobNum, txt_PriFrezer_Location.Text, txt_PriFrezer_OperatingCost.Text, txt_PriFrezer_Make.Text, txt_PriFrezer_Model.Text, txt_PriFrezer_Year.Text, txt_PriFrezer_Size.Text, txt_PriFrezer_StartTime.Text, txt_PriFrezer_EndTime.Text, txt_PriFrezer_TotalTime.Text, txt_PriFrezer_Monitor.Text, txt_PriFrezer_Conversion.Text, IsPrimaryFreezerElligibleForReplacement, txt_PriFrezer_TemperatureFood.Text, txt_PriFrezer_TemperatureRoom.Text, PrimaryFreezerDataBaseUsed, txt_PriFrezer_ReplacementSize.Text, txt_PriFrezer_TemperatureFrezer.Text, PrimaryFreezerDidNotTestBecause, PrimaryFreezerCouldNotMove, txt_SecoFrezer_Location.Text, txt_SecoFrezer_OperatingCost.Text, txt_SecoFrezer_Make.Text, txt_SecoFrezer_Model.Text, txt_SecoFrezer_year.Text, txt_SecoFrezer_Size.Text, txt_SecoFrezer_StartTime.Text, txt_SecoFrezer_EndTime.Text, txt_SecoFrezer_TotalTime.Text, txt_SecoFrezer_Monitor.Text, txt_SecoFrezer_Conversion.Text, txt_SecoFrezer_TemperactureFood.Text, txt_SecoFrezer_TemperactureRoom.Text, IsSecondaryFreezerElligibleForReplacement, SecondaryFreezerDataBaseUsed, txt_SecoFrezer_ReplacementSize.Text, txt_SecoFrezer_TemperactureFrezer.Text, SecondaryFreezerDidNotTestBecause, SecondaryFreezerCouldNotMove, txt_AddFrezer_Location.Text, txt_AddFrezer_OperatingCost.Text, txt_AddFrezer_Make.Text, txt_AddFrezer_Model.Text, txt_AddFrezer_Year.Text, txt_AddFrezer_Size.Text, txt_AddFrezer_StartTime.Text, txt_AddFrezer_EndTime.Text, txt_AddFrezer_TotalTime.Text, txt_AddFrezer_Monitor.Text, txt_AddFrezer_Conversion.Text, txt_AddFrezer_TemperatureFood.Text, txt_AddFrezer_TemperatureRoom.Text, IsAdditionalFreezerElligibleForReplacement, AdditionalFreezerDataBaseUsed, txt_AddFrezer_ReplacementSize.Text, txt_AddFrezer_TemperatureFrezer.Text, AdditionalFreezerDidNotTestBecause, AdditionalFreezerCouldNotMove, txt_Refrigerators_Freezers.Text, txt_FreezersUsed.Text, PrimaryUprightChest, SecondryUprightChest, AdditionalUprightChest, PrimaryFreezerFrostFree, SecondryFreezerFrostFree, AdditionalFreezerFrostFree);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }
}
