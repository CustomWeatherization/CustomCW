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

public partial class METED_METED_Audit_Page5 : System.Web.UI.Page
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_5(JobNum);
            DateTime dateRec = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]);
            DateTime dateComr = Convert.ToDateTime("1/12/2015");
            if (dateRec < dateComr)
            {
                spn_freezersUsed.Visible = true;
                txt_FreezersUsed.Visible = true;
            }
            else
            {
                spn_freezersUsed.Visible = false;
                txt_FreezersUsed.Visible = false;
            }
            if (dt.Rows.Count > 0)
            {
                string AdditionalrefrigeratorType = Convert.ToString(dt.Rows[0]["AdditionalrefrigeratorType"]);
                if (AdditionalrefrigeratorType == "T")
                {
                    Chk_AddRefrigerator_TopMount.Checked = true;
                }
                else if (AdditionalrefrigeratorType == "B")
                {
                    Chk_AddRefrigerator_BottomMount.Checked = true;
                }
                else if (AdditionalrefrigeratorType == "S")
                {
                    Chk_AddRefrigerator_SxS.Checked = true;
                }

                string SecondryrefrigeratorType = Convert.ToString(dt.Rows[0]["SecondryrefrigeratorType"]);
                if (SecondryrefrigeratorType == "T")
                {
                    Chk_SecoRefrigerator_TopMount.Checked = true;
                }
                else if (SecondryrefrigeratorType == "B")
                {
                    Chk_SecoRefrigerator_BottomMount.Checked = true;
                }
                else if (SecondryrefrigeratorType == "S")
                {
                    Chk_SecoRefrigerator_SxS.Checked = true;
                }

                string PrimaryrefrigeratorType = Convert.ToString(dt.Rows[0]["PrimaryrefrigeratorType"]);
                if (PrimaryrefrigeratorType == "T")
                {
                    Chk_PriRefrigerator_TopMount.Checked = true;
                }
                else if (PrimaryrefrigeratorType == "B")
                {
                    Chk_PriRefrigerator_BottomMount.Checked = true;
                }
                else if (PrimaryrefrigeratorType == "S")
                {
                    Chk_PriRefrigerator_SxS.Checked = true;
                }







                string PrimaryrefrigeratorIcemaker = Convert.ToString(dt.Rows[0]["PrimaryrefrigeratorIcemaker"]);
                if (PrimaryrefrigeratorIcemaker == "Y")
                {
                    Chk_PriRefrigerator_IceMaker_Yes.Checked = true;
                }
                else if (PrimaryrefrigeratorIcemaker == "N")
                {
                    Chk_PriRefrigerator_IceMaker_No.Checked = true;
                }


                string SecondryrefrigeratorIcemaker = Convert.ToString(dt.Rows[0]["SecondryrefrigeratorIcemaker"]);
                if (SecondryrefrigeratorIcemaker == "Y")
                {
                    Chk_SecoRefrigerator_IceMaker_Yes.Checked = true;
                }
                else if (SecondryrefrigeratorIcemaker == "N")
                {
                    Chk_SecoRefrigerator_IceMaker_No.Checked = true;
                }


                string AdditionalrefrigeratorIcemaker = Convert.ToString(dt.Rows[0]["AdditionalrefrigeratorIcemaker"]);
                if (AdditionalrefrigeratorIcemaker == "Y")
                {
                    Chk_AddRefrigerator_IceMaker_Yes.Checked = true;
                }
                else if (AdditionalrefrigeratorIcemaker == "N")
                {
                    Chk_AddRefrigerator_IceMaker_No.Checked = true;
                }


                txt_RefrigeratorsUsed.Text = Convert.ToString(dt.Rows[0]["NumberOfRefrigeratorsUsed"]);
                txt_FreezersUsed.Text = Convert.ToString(dt.Rows[0]["NumberOfFreezersUsed"]);
                txt_PriRefrigerator_Location.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigLocation"]);
                txt_PriRefrigerator_OperatingCost.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigCalculatedCostMonth"]);
                txt_PriRefrigerator_Make.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigMake"]);
                txt_PriRefrigerator_Model.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigModel"]);
                txt_PriRefrigerator_Year.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigYear"]);
                txt_PriRefrigerator_Size.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigSize"]);
                txt_PriRefrigerator_StartTime.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigStartTime"]);
                txt_PriRefrigerator_EndTime.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigEndTime"]);
                txt_PriRefrigerator_TotalTime.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigTotalTimeMonitored"]);
                txt_PriRefrigerator_Monitor.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigReading"]);
                txt_PriRefrigerator_Conversion.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigkWhconversionatonehour"]);

                string IsPrimaryRefrigElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsPrimaryRefrigElligibleForReplacement"]);
                if (IsPrimaryRefrigElligibleForReplacement == "Y")
                {
                    rdo_PriRefrigerator_Replacement_Yes.Checked = true;
                }
                else if (IsPrimaryRefrigElligibleForReplacement == "N")
                {
                    rdo_PriRefrigerator_Replacement_No.Checked = true;
                }



                txt_PriRefrigerator_ReplaceSize.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigReplacementSize"]);
                txt_PriRefrigerator_TemperatureFood.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigTemperatureinsidefreshfood"]);
                txt_PriRefrigerator_TemperatureRoom.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigRoomTemp"]);
                txt_PriRefrigerator_TemperatureFrezer.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigTemperatureinsidefreezer"]);

                string PrimaryRefrigDataUsed = Convert.ToString(dt.Rows[0]["PrimaryRefrigDataUsed"]);
                if (PrimaryRefrigDataUsed == "Y")
                {
                    chk_PriRefrigerator_DatabaseUsed.Checked = true;
                }
                else
                {
                    chk_PriRefrigerator_DatabaseUsed.Checked = false;
                }
                string PrimaryRefrigDidNotTestBecause = Convert.ToString(dt.Rows[0]["PrimaryRefrigDidNotTestBecause"]);
                if (PrimaryRefrigDidNotTestBecause == "Y")
                {
                    chk_PriRefrigerator_NotTest.Checked = true;
                }
                else
                {
                    chk_PriRefrigerator_NotTest.Checked = false;
                }
                string PrimaryRefrigCouldNotMove = Convert.ToString(dt.Rows[0]["PrimaryRefrigCouldNotMove"]);
                if (PrimaryRefrigCouldNotMove == "CM")
                {
                    rdo_PriRefrigerator_NotTst_NotMove.Checked = true;
                }
                else if (PrimaryRefrigCouldNotMove == "5Y")
                {
                    rdo_PriRefrigerator_NotTst_5Yr_Old.Checked = true;
                }
                else if (PrimaryRefrigCouldNotMove == "CR")
                {
                    rdo_PriRefrigerator_NotTst_CustomerRefuse.Checked = true;
                }



                txt_SecoRefrigerator_Location.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigLocation"]);
                txt_SecoRefrigerator_OperatingCost.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigCalculatedCostMonth"]);
                txt_SecoRefrigerator_Make.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigMake"]);
                txt_SecoRefrigerator_Model.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigModel"]);
                txt_SecoRefrigerator_Year.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigYear"]);
                txt_SecoRefrigerator_Size.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigSize"]);
                txt_SecoRefrigerator_StartTime.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigStartTime"]);
                txt_SecoRefrigerator_EndTime.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigEndTime"]);
                txt_SecoRefrigerator_TotalTime.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigTotalTimeMonitored"]);
                txt_SecoRefrigerator_Monitor.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigReading"]);
                txt_SecoRefrigerator_Conversion.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigkWhconversionatonehour"]);
                string IsSecondaryRefrigElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsSecondaryRefrigElligibleForReplacement"]);
                if (IsSecondaryRefrigElligibleForReplacement == "Y")
                {
                    rdo_SecoRefrigerator_Replacement_Yes.Checked = true;
                }
                else if (IsSecondaryRefrigElligibleForReplacement == "N")
                {
                    rdo_SecoRefrigerator_Replacement_No.Checked = true;
                }


                txt_SecoRefrigerator_ReplacementSize.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigReplacementSize"]);
                txt_SecoRefrigerator_TemperatureFood.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigTemperatureinsidefreshfood"]);
                txt_SecoRefrigerator_TemperatureRoom.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigRoomTemp"]);
                txt_SecoRefrigerator_TemperatureFrezer.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigTemperatureinsidefreezer"]);
                string SecondaryRefirgDatabaseUsed = Convert.ToString(dt.Rows[0]["SecondaryRefirgDatabaseUsed"]);
                if (SecondaryRefirgDatabaseUsed == "Y")
                {
                    chk_SecoRefrigerator_DatabaseUsed.Checked = true;
                }
                else
                {
                    chk_SecoRefrigerator_DatabaseUsed.Checked = false;
                }
                string SecondaryRefrigDidNotTestBecause = Convert.ToString(dt.Rows[0]["SecondaryRefrigDidNotTestBecause"]);
                if (SecondaryRefrigDidNotTestBecause == "Y")
                {
                    chk_SecoRefrigerator_NotTest.Checked = true;
                }
                else
                {
                    chk_SecoRefrigerator_NotTest.Checked = false;
                }

                string SecondaryRefrigCouldNotMove = Convert.ToString(dt.Rows[0]["SecondaryRefrigCouldNotMove"]);

                if (SecondaryRefrigCouldNotMove == "CM")
                {
                    rdo_SecoRefrigerator_NotTest_NotMove.Checked = true;
                }
                else if (SecondaryRefrigCouldNotMove == "5Y")
                {
                    rdo_SecoRefrigerator_NotTest_5Yr_Old.Checked = true;
                }
                else if (SecondaryRefrigCouldNotMove == "CR")
                {
                    rdo_SecoRefrigerator_NotTest_CustomerRefuse.Checked = true;
                }



                txt_AddRefrigerator_Location.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigLocation"]);
                txt_AddRefrigerator_OperatingCost.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigCalculatedCostMonth"]);
                txt_AddRefrigerator_Make.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigMake"]);
                txt_AddRefrigerator_Model.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigModel"]);
                txt_AddRefrigerator_Year.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigYear"]);
                txt_AddRefrigerator_Size.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigSize"]);
                txt_AddRefrigerator_StartTime.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigStartTime"]);
                txt_AddRefrigerator_EndTime.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigEndTime"]);
                txt_AddRefrigerator_TotalTime.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigMonitored"]);
                txt_AddRefrigerator_Monitor.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigReading"]);
                txt_AddRefrigerator_Conversion.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigkWhConversionOneHour"]);
                txt_AddRefrigerator_TemperatureFood.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigTemperatureInsideFreshFood"]);
                txt_AddRefrigerator_TemperatureRoom.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigRoomTemperature"]);
                txt_AddRefrigerator_TemperatureFrezer.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigTemperatureInsideFreezer"]);
                string AdditionalRefrigDatabaseUsed = Convert.ToString(dt.Rows[0]["AdditionalRefrigDatabaseUsed"]);
                if (AdditionalRefrigDatabaseUsed == "Y")
                {
                    chk_AddRefrigerator_DatabaseUsed.Checked = true;
                }
                else
                {
                    chk_AddRefrigerator_DatabaseUsed.Checked = false;
                }

                txt_AddRefrigerator_ReplacementSize.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigReplacementSize"]);
                string AdditionalRefrigDidNotTestBecause = Convert.ToString(dt.Rows[0]["AdditionalRefrigDidNotTestBecause"]);
                if (AdditionalRefrigDidNotTestBecause == "Y")
                {
                    chk_AddRefrigerator_NotTest.Checked = true;
                }
                string AdditionalRefrigCouldNotMove = Convert.ToString(dt.Rows[0]["AdditionalRefrigCouldNotMove"]);
                if (AdditionalRefrigCouldNotMove == "CM")
                {
                    rdo_AddRefrigerator_NotTest_NotMove.Checked = true;
                }
                else if (AdditionalRefrigCouldNotMove == "5Y")
                {
                    rdo_AddRefrigerator_NotTest_5Yr_Old.Checked = true;
                }
                else if (AdditionalRefrigCouldNotMove == "CR")
                {
                    rdo_AddRefrigerator_NotTest_CustomerRefuse.Checked = true;
                }


                string IsAdditionalRefrigElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsAdditionalRefrigElligibleForReplacement"]);
                if (IsAdditionalRefrigElligibleForReplacement == "Y")
                {
                    rdo_AddRefrigerator_Replacement_Yes.Checked = true;
                }
                else if (IsAdditionalRefrigElligibleForReplacement == "N")
                {
                    rdo_AddRefrigerator_Replacement_No.Checked = true;
                }
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


            string IsPrimaryRefrigElligibleForReplacement = "";
            if (rdo_PriRefrigerator_Replacement_Yes.Checked == true)
            {
                IsPrimaryRefrigElligibleForReplacement = "Y";
            }
            else if (rdo_PriRefrigerator_Replacement_No.Checked == true)
            {
                IsPrimaryRefrigElligibleForReplacement = "N";
            }





            string PrimaryRefrigDataUsed = "";
            if (chk_PriRefrigerator_DatabaseUsed.Checked == true)
            {
                PrimaryRefrigDataUsed = "Y";
            }

            string PrimaryRefrigDidNotTestBecause = "";
            if (chk_PriRefrigerator_NotTest.Checked == true)
            {
                PrimaryRefrigDidNotTestBecause = "Y";
            }

            string PrimaryRefrigCouldNotMove = "";
            if (rdo_PriRefrigerator_NotTst_NotMove.Checked == true)
            {
                PrimaryRefrigCouldNotMove = "CM";
            }
            else if (rdo_PriRefrigerator_NotTst_5Yr_Old.Checked == true)
            {
                PrimaryRefrigCouldNotMove = "5Y";
            }
            else if (rdo_PriRefrigerator_NotTst_CustomerRefuse.Checked == true)
            {
                PrimaryRefrigCouldNotMove = "CR";
            }








            /////////////////////////// secondary ////////////////////////////////////////



            string IsSecondaryRefrigElligibleForReplacement = "";
            if (rdo_SecoRefrigerator_Replacement_Yes.Checked == true)
            {
                IsSecondaryRefrigElligibleForReplacement = "Y";
            }
            else if (rdo_SecoRefrigerator_Replacement_No.Checked == true)
            {
                IsSecondaryRefrigElligibleForReplacement = "N";
            }

            string SecondaryRefirgDatabaseUsed = "";
            if (chk_SecoRefrigerator_DatabaseUsed.Checked == true)
            {
                SecondaryRefirgDatabaseUsed = "Y";
            }

            string SecondaryRefrigDidNotTestBecause = "";
            if (chk_SecoRefrigerator_NotTest.Checked == true)
            {
                SecondaryRefrigDidNotTestBecause = "Y";
            }


            string SecondaryRefrigCouldNotMove = "";

            if (rdo_SecoRefrigerator_NotTest_NotMove.Checked == true)
            {
                SecondaryRefrigCouldNotMove = "CM";
            }
            else if (rdo_SecoRefrigerator_NotTest_5Yr_Old.Checked == true)
            {
                SecondaryRefrigCouldNotMove = "5Y";
            }
            else if (rdo_SecoRefrigerator_NotTest_CustomerRefuse.Checked == true)
            {
                SecondaryRefrigCouldNotMove = "CR";
            }


            /////////////////////////// Additional ////////////////////////////////////////

            string AdditionalRefrigDatabaseUsed = "";
            if (chk_AddRefrigerator_DatabaseUsed.Checked == true)
            {
                AdditionalRefrigDatabaseUsed = "Y";
            }

            string AdditionalRefrigDidNotTestBecause = "";
            if (chk_AddRefrigerator_NotTest.Checked == true)
            {
                AdditionalRefrigDidNotTestBecause = "Y";
            }

            string AdditionalRefrigCouldNotMove = "";
            if (rdo_AddRefrigerator_NotTest_NotMove.Checked == true)
            {
                AdditionalRefrigCouldNotMove = "CM";
            }
            else if (rdo_AddRefrigerator_NotTest_5Yr_Old.Checked == true)
            {
                AdditionalRefrigCouldNotMove = "5Y";
            }
            else if (rdo_AddRefrigerator_NotTest_CustomerRefuse.Checked == true)
            {
                AdditionalRefrigCouldNotMove = "CR";
            }


            string IsAdditionalRefrigElligibleForReplacement = "";
            if (rdo_AddRefrigerator_Replacement_Yes.Checked == true)
            {
                IsAdditionalRefrigElligibleForReplacement = "Y";
            }
            else if (rdo_AddRefrigerator_Replacement_No.Checked == true)
            {
                IsAdditionalRefrigElligibleForReplacement = "N";
            }










            string PrimaryrefrigeratorType = "";
            if (Chk_PriRefrigerator_TopMount.Checked == true)
            {
                PrimaryrefrigeratorType = "T";
            }
            else if (Chk_PriRefrigerator_BottomMount.Checked == true)
            {
                PrimaryrefrigeratorType = "B";
            }
            else if (Chk_PriRefrigerator_SxS.Checked == true)
            {
                PrimaryrefrigeratorType = "S";
            }



            string SecondryrefrigeratorType = "";
            if (Chk_SecoRefrigerator_TopMount.Checked == true)
            {
                SecondryrefrigeratorType = "T";
            }
            else if (Chk_SecoRefrigerator_BottomMount.Checked == true)
            {
                SecondryrefrigeratorType = "B";
            }
            else if (Chk_SecoRefrigerator_SxS.Checked == true)
            {
                SecondryrefrigeratorType = "S";
            }


            string AdditionalrefrigeratorType = "";
            if (Chk_AddRefrigerator_TopMount.Checked == true)
            {
                AdditionalrefrigeratorType = "T";
            }
            else if (Chk_AddRefrigerator_BottomMount.Checked == true)
            {
                AdditionalrefrigeratorType = "B";
            }
            else if (Chk_AddRefrigerator_SxS.Checked == true)
            {
                AdditionalrefrigeratorType = "S";
            }


            /////////////////////////////////////////////////////////////////////////////////////////////////////

            string PrimaryrefrigeratorIcemaker = "";
            if (Chk_PriRefrigerator_IceMaker_Yes.Checked == true)
            {
                PrimaryrefrigeratorIcemaker = "Y";
            }
            else if (Chk_PriRefrigerator_IceMaker_No.Checked == true)
            {
                PrimaryrefrigeratorIcemaker = "N";
            }
            


            /////////////////////////////////////////////////////////////////////////////////////////////////////

            string SecondryrefrigeratorIcemaker = "";
            if (Chk_SecoRefrigerator_IceMaker_Yes.Checked == true)
            {
                SecondryrefrigeratorIcemaker = "Y";
            }
            else if (Chk_SecoRefrigerator_IceMaker_No.Checked == true)
            {
                SecondryrefrigeratorIcemaker = "N";
            }



            /////////////////////////////////////////////////////////////////////////////////////////////////////

            string AdditionalrefrigeratorIcemaker = "";
            if (Chk_AddRefrigerator_IceMaker_Yes.Checked == true)
            {
                AdditionalrefrigeratorIcemaker = "Y";
            }
            else if (Chk_AddRefrigerator_IceMaker_No.Checked == true)
            {
                AdditionalrefrigeratorIcemaker = "N";
            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////

            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_5(JobNum, txt_RefrigeratorsUsed.Text, txt_FreezersUsed.Text, txt_PriRefrigerator_Location.Text, txt_PriRefrigerator_OperatingCost.Text, txt_PriRefrigerator_Make.Text, txt_PriRefrigerator_Model.Text, txt_PriRefrigerator_Year.Text, txt_PriRefrigerator_Size.Text, txt_PriRefrigerator_StartTime.Text, txt_PriRefrigerator_EndTime.Text, txt_PriRefrigerator_TotalTime.Text, txt_PriRefrigerator_Monitor.Text, txt_PriRefrigerator_Conversion.Text, IsPrimaryRefrigElligibleForReplacement, txt_PriRefrigerator_ReplaceSize.Text, txt_PriRefrigerator_TemperatureFood.Text, txt_PriRefrigerator_TemperatureRoom.Text, txt_PriRefrigerator_TemperatureFrezer.Text, PrimaryRefrigDataUsed, PrimaryRefrigDidNotTestBecause, PrimaryRefrigCouldNotMove, txt_SecoRefrigerator_Location.Text, txt_SecoRefrigerator_OperatingCost.Text, txt_SecoRefrigerator_Make.Text, txt_SecoRefrigerator_Model.Text, txt_SecoRefrigerator_Year.Text, txt_SecoRefrigerator_Size.Text, txt_SecoRefrigerator_StartTime.Text, txt_SecoRefrigerator_EndTime.Text, txt_SecoRefrigerator_TotalTime.Text, txt_SecoRefrigerator_Monitor.Text, txt_SecoRefrigerator_Conversion.Text, IsSecondaryRefrigElligibleForReplacement, txt_SecoRefrigerator_ReplacementSize.Text, txt_SecoRefrigerator_TemperatureFood.Text, txt_SecoRefrigerator_TemperatureRoom.Text, txt_SecoRefrigerator_TemperatureFrezer.Text, SecondaryRefirgDatabaseUsed, SecondaryRefrigDidNotTestBecause, SecondaryRefrigCouldNotMove, txt_AddRefrigerator_Location.Text, txt_AddRefrigerator_OperatingCost.Text, txt_AddRefrigerator_Make.Text, txt_AddRefrigerator_Model.Text, txt_AddRefrigerator_Year.Text, txt_AddRefrigerator_Size.Text, txt_AddRefrigerator_StartTime.Text, txt_AddRefrigerator_EndTime.Text, txt_AddRefrigerator_TotalTime.Text, txt_AddRefrigerator_Monitor.Text, txt_AddRefrigerator_Conversion.Text, txt_AddRefrigerator_TemperatureFood.Text, txt_AddRefrigerator_TemperatureRoom.Text, txt_AddRefrigerator_TemperatureFrezer.Text, AdditionalRefrigDatabaseUsed, txt_AddRefrigerator_ReplacementSize.Text, AdditionalRefrigDidNotTestBecause, AdditionalRefrigCouldNotMove, IsAdditionalRefrigElligibleForReplacement, PrimaryrefrigeratorType, PrimaryrefrigeratorIcemaker, SecondryrefrigeratorType, SecondryrefrigeratorIcemaker, AdditionalrefrigeratorType, AdditionalrefrigeratorIcemaker);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");

        }
        catch
        {
        }
    }

}
