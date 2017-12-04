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

public partial class PPLAudit_PPL_Audit_2 : System.Web.UI.Page
{
    dcPPLAudit objPPl = new dcPPLAudit();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.UserAgent.Contains("Chrome"))
            {
                // TopBtnDiv.Attributes.Add("style", "position: fixed; top: 65px; z-index: 100; text-align: center; margin: 0 45px;width:510px;");
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

    #region Update Audti Page 2

    protected void btnSave_Click(object sender, EventArgs e)
    {
        // After Weatherization is complete, do you expect the customer's usage to decrease

        string strUsersIncreaseYes = "";
        string strUsersIncreaseNo = "";
        string BaseLoadFullCostDDl = "";
        if (rdoUsersIncreaseYES.Checked)
        {
            strUsersIncreaseYes = "Y";
        }
        else if (rdoUsersIncreaseNo.Checked)
        {
            strUsersIncreaseNo = "N";
        }

        //IF NO Select 



        string strWrapMessare = "";
        if (chkWrapMessare.Checked)
        {
            strWrapMessare = "Y";
        }
        else
        {
            strWrapMessare = "N";
        }


        string strCustomerUsage = "";
        if (chkCustomerUsage.Checked)
        {
            strCustomerUsage = "Y";
        }
        else
        {
            strCustomerUsage = "N";
        }
        string strLivingSpace = "";

        if (chkLivingSpace.Checked)
        {
            strLivingSpace = "Y";
        }
        else
        {
            strLivingSpace = "N";
        }


        string strHouseholdOccupants = "";

        if (chkHouseholdOccupants.Checked)
        {
            strHouseholdOccupants = "Y";
        }
        else
        {
            strHouseholdOccupants = "N";
        }
        string strElectricAppliances = "";

        if (chkElectricAppliances.Checked)
        {
            strElectricAppliances = "Y";
        }
        else
        {
            strElectricAppliances = "N";
        }
        string strOtherIncrease = "";


        if (chkOtherIncrease.Checked)
        {
            strOtherIncrease = "Y";
        }
        else
        {
            strOtherIncrease = "N";
        }




        //Recommended Job Type:
        string strBaseLoad = "";
        if (chkBaseLoad.Checked)
        {
            strBaseLoad = "Y";
            BaseLoadFullCostDDl = DDl_FullCotBaseLoad.SelectedValue;
        }
        else
        {
            strBaseLoad = "N";
        }

        string strLowCost = "";
        if (chkLowCost.Checked)
        {
            strLowCost = "Y";
        }
        else
        {
            strLowCost = "N";
        }

        string strFullCost = "";
        if (chkFullCost.Checked)
        {
            strFullCost = "Y";
            BaseLoadFullCostDDl = DDl_BaseloadFullcost.SelectedValue;
        }
        else
        {
            strFullCost = "N";
        }


        //Job Status
        string strJobCompleted = "";

        if (chkJobCompleted.Checked)
        {
            strJobCompleted = "Y";
        }
        else
        {
            strJobCompleted = "N";
        }

        string strAdditionalMeasures = "";
        if (chkAdditionalMeasures.Checked)
        {
            strAdditionalMeasures = "Y";
        }
        else
        {
            strAdditionalMeasures = "N";
        }


        objPPl.UpdatePPLAudit_2(Request.QueryString["Jobs"].ToString(), txtHeatingSystemsLine1.Text, txtHeatingSystemsLine2.Text, txtACSystemsLine1.Text, txtACSystemsLine2.Text, txtDraftsLine1.Text, txtDraftsLine2.Text, txtColdRoomsLine1.Text, txtColdRoomsLine2.Text, txtMoistureProblemsLine1.Text, txtMoistureProblemsLine2.Text, txtSpecialNeedsLine1.Text, txtOtherNotesLine1.Text, txtOtherNotesLine2.Text, txtOtherIncreaseComments.Text, BaseLoadFullCostDDl, txtAdditionalMeasuresReason.Text, strUsersIncreaseYes, strUsersIncreaseNo, strWrapMessare, strCustomerUsage, strLivingSpace, strElectricAppliances, strOtherIncrease, strBaseLoad, strLowCost, strFullCost, strJobCompleted, strAdditionalMeasures, strHouseholdOccupants, txtAdditionalComment1.Text, txtAdditionalComment2.Text, txtAdditionalComment3.Text, txtAdditionalComment4.Text);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Save Successfully');", true);
    }
    #endregion

    #region Fill Data For Update
    public void FillUpdateAudit()
    {
        DataTable dt = objPPl.GetPPLAudit_2(Request.QueryString["Jobs"].ToString());

        txtHeatingSystemsLine1.Text = dt.Rows[0]["HeatingSystemsLine1"].ToString();

        txtHeatingSystemsLine2.Text = dt.Rows[0]["HeatingSystemsLine2"].ToString();

        txtACSystemsLine1.Text = dt.Rows[0]["ACSystemsLine1"].ToString();
        txtACSystemsLine2.Text = dt.Rows[0]["ACSystemsLine2"].ToString();

        ///////////////////////////////////////////////////////////////////////////////////

        txtAdditionalComment1.Text = dt.Rows[0]["AdditionalComment1"].ToString();
        txtAdditionalComment2.Text = dt.Rows[0]["AdditionalComment2"].ToString();
        txtAdditionalComment3.Text = dt.Rows[0]["AdditionalComment3"].ToString();
        txtAdditionalComment4.Text = dt.Rows[0]["AdditionalComment4"].ToString();

        //////////////////////////////////////////////////////////////////////////////////

        txtDraftsLine1.Text = dt.Rows[0]["DraftsLine1"].ToString();
        txtDraftsLine2.Text = dt.Rows[0]["DraftsLine2"].ToString();

        txtColdRoomsLine1.Text = dt.Rows[0]["ColdRoomsLine1"].ToString();
        txtColdRoomsLine2.Text = dt.Rows[0]["ColdRoomsLine2"].ToString();

        txtMoistureProblemsLine1.Text = dt.Rows[0]["MoistureProblemsLine1"].ToString();
        txtMoistureProblemsLine2.Text = dt.Rows[0]["MoistureProblemsLine2"].ToString();


        txtSpecialNeedsLine1.Text = dt.Rows[0]["SpecialNeedsLine1"].ToString();

        txtOtherNotesLine1.Text = dt.Rows[0]["OtherNotesLine1"].ToString();
        txtOtherNotesLine2.Text = dt.Rows[0]["OtherNotesLine2"].ToString();

        txtOtherIncreaseComments.Text = dt.Rows[0]["OtherIncreaseComments"].ToString();

        //txtDifferentReason.Text = dt.Rows[0]["DifferentReason"].ToString();

        txtAdditionalMeasuresReason.Text = dt.Rows[0]["AdditionalMeasuresReason"].ToString();



        if (dt.Rows[0]["UsageIncreaseYes"].ToString() == "Y")
        {
            rdoUsersIncreaseYES.Checked = true;
        }

        if (dt.Rows[0]["UsageIncreaseNo"].ToString() == "N")
        {
            rdoUsersIncreaseNo.Checked = true;
            courier.Attributes.Add("style", "display:block;");
        }
        //Chekbox fill
        if (dt.Rows[0]["WrapMeasures"].ToString() == "Y")
        {
            chkWrapMessare.Checked = true;
        }
        if (dt.Rows[0]["CustomerUsage"].ToString() == "Y")
        {
            chkCustomerUsage.Checked = true;
        }
        //

        if (dt.Rows[0]["LivingSpace"].ToString() == "Y")
        {
            chkLivingSpace.Checked = true;
        }
        if (dt.Rows[0]["ElectricAppliances"].ToString() == "Y")
        {
            chkElectricAppliances.Checked = true;
        }


        //
        if (dt.Rows[0]["OtherIncrease"].ToString() == "Y")
        {
            chkOtherIncrease.Checked = true;

        }
        if (Convert.ToBoolean(dt.Rows[0]["BaseLoadOnly"]) == true)
        {
            //chkBaseLoad.Checked = true;
            DDl_FullCotBaseLoad.SelectedValue = Convert.ToString(dt.Rows[0]["DifferentReason"]);
            DDl_FullCotBaseLoad.Style["display"] = "block";
            DDl_BaseloadFullcost.Style["display"] = "none";
            JobType.InnerText = "Base Load";
        }

        if (Convert.ToBoolean(dt.Rows[0]["FullCost"]) == true)
        {
            //chkFullCost.Checked = true;
            DDl_BaseloadFullcost.SelectedValue = Convert.ToString(dt.Rows[0]["DifferentReason"]);
            DDl_BaseloadFullcost.Style["display"] = "block";
            DDl_FullCotBaseLoad.Style["display"] = "none";
            JobType.InnerText = "Full Cost";
        }


        if (Convert.ToString(dt.Rows[0]["BaseLoad_"]) == "Y")
        {
            chkBaseLoad.Checked = true;
            chkFullCost.Checked = false;
            DDl_FullCotBaseLoad.SelectedValue = Convert.ToString(dt.Rows[0]["DifferentReason"]);
            DDl_FullCotBaseLoad.Style["display"] = "block";
            DDl_BaseloadFullcost.Style["display"] = "none";
        }
        if (Convert.ToString(dt.Rows[0]["FullCost_"]) == "Y")
        {
            chkFullCost.Checked = true;
            chkBaseLoad.Checked = false;
            DDl_BaseloadFullcost.SelectedValue = Convert.ToString(dt.Rows[0]["DifferentReason"]);
            DDl_BaseloadFullcost.Style["display"] = "block";
            DDl_FullCotBaseLoad.Style["display"] = "none";
        }

        //
        if (dt.Rows[0]["JobCompleted"].ToString() == "Y")
        {
            chkJobCompleted.Checked = true;
        }
        if (dt.Rows[0]["AdditionalMeasures"].ToString() == "Y")
        {
            chkAdditionalMeasures.Checked = true;
        }
        if (dt.Rows[0]["HouseholdOccupants"].ToString() == "Y")
        {
            chkHouseholdOccupants.Checked = true;
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
