using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class NewMETED_METED_Audit_NewPage14 : System.Web.UI.Page
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
            // btnUpdate.Visible = false;
            spnFinal.InnerHtml = "Audit Finalize";
        }
    }

    public void fill_form()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_14Ver2(JobNum);
            if (dt.Rows.Count > 0)
            {
                RBL_HomeownerNotforsale.SelectedValue = Convert.ToString(dt.Rows[0]["HomeownerNotforsale"]);
                RBL_ElectricUnits.SelectedValue = Convert.ToString(dt.Rows[0]["ElectricUnits"]);
                RBL_AdequateSpace.SelectedValue = Convert.ToString(dt.Rows[0]["AdequateSpace"]);
                RBL_AuditorBelieve.SelectedValue = Convert.ToString(dt.Rows[0]["AuditorBelieve"]);
                RBL_CleaningInterior.SelectedValue = Convert.ToString(dt.Rows[0]["CleaningInterior"]);
                RBL_ElectricWiring.SelectedValue = Convert.ToString(dt.Rows[0]["ElectricWiring"]);
                RBL_ExistingHeat.SelectedValue = Convert.ToString(dt.Rows[0]["ExistingHeat"]);
                RBL_HeatComing.SelectedValue = Convert.ToString(dt.Rows[0]["HeatComing"]);
                RBL_HeatingAreas.SelectedValue = Convert.ToString(dt.Rows[0]["HeatingAreas"]);
                RBL_RemoteControl.SelectedValue = Convert.ToString(dt.Rows[0]["RemoteControl"]);
                RBL_SufficientSpace.SelectedValue = Convert.ToString(dt.Rows[0]["SufficientSpace"]);
                RBL_WeatherConditions.SelectedValue = Convert.ToString(dt.Rows[0]["WeatherConditions"]);
                txt_AuditDate.Text = Convert.ToDateTime(dt.Rows[0]["AuditDate"]).ToShortDateString();

            }
        }
        catch (Exception e)
        {
        }
        finally
        {
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int i = 0;
            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_14Ver2(JobNum,RBL_HomeownerNotforsale.SelectedValue,RBL_ElectricUnits.SelectedValue,RBL_HeatComing.SelectedValue,RBL_WeatherConditions.SelectedValue,RBL_ExistingHeat.SelectedValue,RBL_ElectricWiring.SelectedValue,RBL_HeatingAreas.SelectedValue,RBL_SufficientSpace.SelectedValue,RBL_AdequateSpace.SelectedValue,RBL_RemoteControl.SelectedValue,RBL_CleaningInterior.SelectedValue,RBL_AuditorBelieve.SelectedValue, txt_AuditDate.Text);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");

        }
        catch
        {
        }
    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {

    }
}