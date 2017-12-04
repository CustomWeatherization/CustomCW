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

public partial class PPLAudit_PPL_Audit_4 : System.Web.UI.Page
{
    dcPPLAudit objPPl = new dcPPLAudit();
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
        catch
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
        string RefrigeratorTest, RefrigeratorReplace, SecondRefrigerator_OR_Freezer, Second_RefrigeratorReplace;
        RefrigeratorTest = RefrigeratorReplace = SecondRefrigerator_OR_Freezer = Second_RefrigeratorReplace = "";
        if (chk_RefrigeratorTest_Yes.Checked == true)
        {
            RefrigeratorTest = "Y";
        }
        else if (chk_RefrigeratorTest_No.Checked == true)
        {
            RefrigeratorTest = "N";
        }

        if (chk_RefrigeratorReplace_Yes.Checked == true)
        {
            RefrigeratorReplace = "Y";
        }
        else if (chk_RefrigeratorReplace_No.Checked == true)
        {
            RefrigeratorReplace = "N";
        }

        if (chk_SecondRefrigerator.Checked == true)
        {
            SecondRefrigerator_OR_Freezer = "R";
        }
        else if (chk_SecondFreezer.Checked == true)
        {
            SecondRefrigerator_OR_Freezer = "F";
        }

        if (chk_Second_RefrigeratorReplace_Yes.Checked == true)
        {
            Second_RefrigeratorReplace = "Y";
        }
        else if (chk_Second_RefrigeratorReplace_No.Checked == true)
        {
            Second_RefrigeratorReplace = "N";
        }

        objPPl.UpdatePPLAudit_4(Request.QueryString["Jobs"].ToString(), RefrigeratorTest, txt_RefrigeratorTest_Reason.Text, txt_PrimaryRefrigerator_Height.Text, txt_PrimaryRefrigerator_Width.Text, txt_PrimaryRefrigerator_Depth.Text, txt_StartTime.Text, txt_EndTime.Text, txt_TotalMonitored.Text, txt_RefrigeratorTemp.Text, txt_FreezerTemp.Text, txt_RoomTemp.Text, txt_PeakWattageRunning.Text, txt_TotalKWH.Text, txt_KWH_1_Hour.Text, txt_KWH_24_Hour.Text, txt_KWH_Month.Text, txt_Month.Text, RefrigeratorReplace, SecondRefrigerator_OR_Freezer, txt_SecondRefrigerator_Height.Text, txt_SecondRefrigerator_Width.Text, txt_SecondRefrigerator_Depth.Text, txt_SecondRefrigerator_StartTime.Text, txt_SecondRefrigerator_EndTime.Text, txt_SecondRefrigerator_TotalMoniter.Text, txt_SecondRefrigerator_Temp.Text, txt_SecondFreezer_Temp.Text, txt_SecondRoom_Temp.Text, txt_Second_PeakWattageRunning.Text, txt_Second_KWH_Moniter.Text, txt_Second_KWH_1_Hour.Text, txt_Second_KWH_24_Hour.Text, txt_Second_KWH_Month.Text, txt_Second_Month.Text, Second_RefrigeratorReplace, Convert.ToString(DDL_RefrigeratorAssessment.SelectedValue), Convert.ToString(DDL_REFRIGERATOR_reason.SelectedValue));
        FillUpdateAudit();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Save Successfully');", true);


    }
    #endregion


    #region Fill Data For Update
    public void FillUpdateAudit()
    {
        try
        {
            DataTable dt = objPPl.GetPPLAudit_4(Request.QueryString["Jobs"].ToString());
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToString(dt.Rows[0]["RefrigeratorTested"]) == "Y")
                {
                    chk_RefrigeratorTest_Yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["RefrigeratorTested"]) == "N")
                {
                    chk_RefrigeratorTest_No.Checked = true;
                }

                txt_RefrigeratorTest_Reason.Text = Convert.ToString(dt.Rows[0]["NoReason"]);
                txt_PrimaryRefrigerator_Height.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorHeight"]);
                txt_PrimaryRefrigerator_Width.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorWidth"]);
                txt_PrimaryRefrigerator_Depth.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorDepth"]);
                txt_StartTime.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorStartTime"]);
                txt_EndTime.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorEndTime"]);
                txt_TotalMonitored.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorTotalTimeMonitored"]);
                txt_RefrigeratorTemp.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorTemperature"]);
                txt_FreezerTemp.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorFreezerTemperature"]);
                txt_RoomTemp.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorAmbientRoomTemperature"]);
                txt_PeakWattageRunning.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorPeakWattageWhileRunning"]);
                txt_TotalKWH.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorTotalKWHMonitored"]);
                txt_KWH_1_Hour.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorKWH1Hour"]);
                txt_KWH_24_Hour.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorKWH24Hours"]);
                txt_KWH_Month.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorKWHPerMonth"]);
                txt_Month.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorDollarsPerMonth"]);

                DDL_RefrigeratorAssessment.SelectedValue = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorAssesment"]);
                DDL_REFRIGERATOR_reason.SelectedValue = Convert.ToString(dt.Rows[0]["RefrigeratorReason"]);


                if (Convert.ToString(dt.Rows[0]["IsPrimaryRefrigeratorEligibleForReplacement"]) == "Y")
                {
                    chk_RefrigeratorReplace_Yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsPrimaryRefrigeratorEligibleForReplacement"]) == "N")
                {
                    chk_RefrigeratorReplace_No.Checked = true;
                }


                if (Convert.ToString(dt.Rows[0]["SecondRefrigeratorOrFreezer"]) == "R")
                {
                    chk_SecondRefrigerator.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["SecondRefrigeratorOrFreezer"]) == "F")
                {
                    chk_SecondFreezer.Checked = true;
                }


                txt_SecondRefrigerator_Height.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerHeight"]);
                txt_SecondRefrigerator_Width.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerWidth"]);
                txt_SecondRefrigerator_Depth.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerDepth"]);

                txt_SecondRefrigerator_StartTime.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerStartTime"]);
                txt_SecondRefrigerator_EndTime.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerEndTime"]);
                txt_SecondRefrigerator_TotalMoniter.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerTotalTimeMonitored"]);
                txt_SecondRefrigerator_Temp.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerTemperature"]);
                txt_SecondFreezer_Temp.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerFreezerTemperature"]);
                txt_SecondRoom_Temp.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerAmbientRoomTemperature"]);

                txt_Second_PeakWattageRunning.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerPeakWattageWhileRunning"]);
                txt_Second_KWH_Moniter.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerTotalKWHMonitored"]);
                txt_Second_KWH_1_Hour.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerKWH1Hour"]);
                txt_Second_KWH_24_Hour.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerKWH24Hours"]);
                txt_Second_KWH_Month.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerKWHPerMonth"]);
                txt_Second_Month.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerDollarsPerMonth"]);

                if (Convert.ToString(dt.Rows[0]["IsSecondaryRefrigeratorEligibleForReplacement"]) == "Y")
                {
                    chk_Second_RefrigeratorReplace_Yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsSecondaryRefrigeratorEligibleForReplacement"]) == "N")
                {
                    chk_Second_RefrigeratorReplace_No.Checked = true;
                }

            }
        }
        catch
        {


        }


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
}
