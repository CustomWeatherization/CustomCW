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

public partial class METED_METED_Audit_Page3 : System.Web.UI.Page
{
    METEDAudit obj_MetedAudit = new METEDAudit();
    protected void Page_Load(object sender, EventArgs e)
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
        if (Convert.ToString(Session["finalize"]) == "F")
        {
            btnUpdate.Visible = false;
            spnFinal.InnerHtml = "Audit Finalize";
        }
    }
    public void fill_form()
    {
        string JobNum = Request.QueryString["Jobs"].ToString();
        DataTable dt = obj_MetedAudit.GetMETEDAudit_3(JobNum);
        if (dt.Rows.Count > 0)
        {
            //--------------------------------------------------

            txt_AreaDifficult.Text = Convert.ToString(dt.Rows[0]["AreaDifficult"]);
            txt_ApplicationProb.Text = Convert.ToString(dt.Rows[0]["ApplicationProb"]);
            txt_HighestEnergy.Text = Convert.ToString(dt.Rows[0]["HighestEnergy"]);
            txt_Expalain_HealthIssues1.Text = Convert.ToString(dt.Rows[0]["Expalain_HealthIssues1"]);
            txt_HealthIssue2.Text = Convert.ToString(dt.Rows[0]["Expalain_HealthIssues2"]);

            //--------------------------------------------------


            string i = Convert.ToString(dt.Rows[0]["combustionAppliances"]);
            switch (i)
            {
                case "Y":
                    chk_combustionAppliances_Yes.Checked = true;
                    break;
                case "N":
                    chk_combustionAppliances_No.Checked = true;
                    break;

                case "N/A":
                    chk_combustionAppliances_Null.Checked = true;
                    break;
                default:
                    break;
            }

            string j = Convert.ToString(dt.Rows[0]["HealthIssues"]);
            switch (j)
            {
                case "Y":
                    chk_HealthIssues_Yes.Checked = true;
                    break;
                case "N":
                    chk_HealthIssues_No.Checked = true;
                    break;
                default:
                    break;
            }


            txt_LedNightLight.Text = Convert.ToString(dt.Rows[0]["LEDNightLights"]);
            txt_LedNightLight_Location1.Text = Convert.ToString(dt.Rows[0]["Line1LEDNightLightLocation"]);
            txt_LedNightLight_Location2.Text = Convert.ToString(dt.Rows[0]["Line2LEDNightLightLocation"]);
            txt_LedNightLight_Location3.Text = Convert.ToString(dt.Rows[0]["Line3LEDNightLightLocation"]);
            txt_LedNightLight_Location4.Text = Convert.ToString(dt.Rows[0]["Line4LEDNightLightLocation"]);
            txt_SmartPowerStrip.Text = Convert.ToString(dt.Rows[0]["SmartPowerStrip"]);
            txt_SmartPower_Location1.Text = Convert.ToString(dt.Rows[0]["Line1SmartPowerStripLocation"]);
            txt_SmartPower_Location2.Text = Convert.ToString(dt.Rows[0]["Line2SmartPowerStripLocation"]);
            txt_SmartPower_Location3.Text = Convert.ToString(dt.Rows[0]["Line3SmartPowerStripLocation"]);
            txt_SmartPower_Location4.Text = Convert.ToString(dt.Rows[0]["Line4SmartPowerStripLocation"]);


            string Line1SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line1SmartPowerStrip6Outlet"]);
            if (Line1SmartPowerStrip6Outlet == "Y")
            {
                rdo_Line1_6_9_Outlet.Checked = true;
            }
            else
            {
                rdo_Line1_6_9_Outlet.Checked = false;
            }



            string Line2SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line2SmartPowerStrip6Outlet"]);
            if (Line2SmartPowerStrip6Outlet == "Y")
            {
                rdo_Line2_6_9_Outlet.Checked = true;
            }
            else
            {
                rdo_Line2_6_9_Outlet.Checked = false;
            }



            string Line3SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line3SmartPowerStrip6Outlet"]);
            if (Line3SmartPowerStrip6Outlet == "Y")
            {
                rdo_Line3_6_9_Outlet.Checked = true;
            }
            else
            {
                rdo_Line3_6_9_Outlet.Checked = false;
            }

            string Line4SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line4SmartPowerStrip6Outlet"]);
            if (Line4SmartPowerStrip6Outlet == "Y")
            {
                rdo_Line4_6_9_Outlet.Checked = true;
            }
            else
            {
                rdo_Line4_6_9_Outlet.Checked = false;
            }


            string Line1SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line1SmartPowerStrip10Outlet"]);
            if (Line1SmartPowerStrip10Outlet == "Y")
            {
                rdo_Line1_10_Outlet.Checked = true;
            }
            else
            {
                rdo_Line1_10_Outlet.Checked = false;
            }


            string Line2SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line2SmartPowerStrip10Outlet"]);
            if (Line2SmartPowerStrip10Outlet == "Y")
            {
                rdo_Line2_10_Outlet.Checked = true;
            }
            else
            {
                rdo_Line2_10_Outlet.Checked = false;
            }


            string Line3SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line3SmartPowerStrip10Outlet"]);
            if (Line3SmartPowerStrip10Outlet == "Y")
            {
                rdo_Line3_10_Outlet.Checked = true;
            }
            else
            {
                rdo_Line3_10_Outlet.Checked = false;
            }



            string Line4SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line4SmartPowerStrip10Outlet"]);
            if (Line4SmartPowerStrip10Outlet == "Y")
            {
                rdo_Line4_10_Outlet.Checked = true;
            }
            else
            {
                rdo_Line4_10_Outlet.Checked = false;
            }


            string InstalledFurnaceFilter = Convert.ToString(dt.Rows[0]["InstalledFurnaceFilter"]);
            if (InstalledFurnaceFilter == "Y")
            {
                rdo_FilterWhistle_Yes.Checked = true;
            }
            else if (InstalledFurnaceFilter == "N")
            {
                rdo_FilterWhistle_No.Checked = true;
            }


            txt_ExistingAlarms.Text = Convert.ToString(dt.Rows[0]["COAlarms5YearOld"]);
            txt_NewAlarms.Text = Convert.ToString(dt.Rows[0]["TotalNEWAlarmsInstalled"]);
            txt_COAlarms_Location1.Text = Convert.ToString(dt.Rows[0]["Line1COAlarmLocation"]);
            txt_COAlarms_Location2.Text = Convert.ToString(dt.Rows[0]["Line2COAlarmLocation"]);
            txt_COAlarms_Location3.Text = Convert.ToString(dt.Rows[0]["Line3COAlarmLocation"]);
            txt_COAlarms_Location4.Text = Convert.ToString(dt.Rows[0]["Line4COAlarmLocation"]);
            txt_COAlarms_Location5.Text = Convert.ToString(dt.Rows[0]["Line5COAlarmLocation"]);
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
            string JobNum = Request.QueryString["Jobs"].ToString();
            string HealthIssueCheck, DoTheyUnvented;
            DoTheyUnvented = HealthIssueCheck = "";


            if (chk_HealthIssues_Yes.Checked)
            {
                HealthIssueCheck = "Y";
            }
            else if (chk_HealthIssues_No.Checked)
            {
                HealthIssueCheck = "N";
            }



            if (chk_combustionAppliances_Yes.Checked)
            {
                DoTheyUnvented = "Y";
            }
            else if (chk_combustionAppliances_No.Checked)
            {
                DoTheyUnvented = "N";
            }
            else if (chk_combustionAppliances_Null.Checked)
            {
                DoTheyUnvented = "N/A";
            }


            string Line1SmartPowerStrip6Outlet = "";
            if (rdo_Line1_6_9_Outlet.Checked == true)
            {
                Line1SmartPowerStrip6Outlet = "Y";
            }



            string Line2SmartPowerStrip6Outlet = "";
            if (rdo_Line2_6_9_Outlet.Checked == true)
            {
                Line2SmartPowerStrip6Outlet = "Y";
            }

            string Line3SmartPowerStrip6Outlet = "";
            if (rdo_Line3_6_9_Outlet.Checked == true)
            {
                Line3SmartPowerStrip6Outlet = "Y";
            }


            string Line4SmartPowerStrip6Outlet = "";
            if (rdo_Line4_6_9_Outlet.Checked == true)
            {
                Line4SmartPowerStrip6Outlet = "Y";
            }


            string Line1SmartPowerStrip10Outlet = "";
            if (rdo_Line1_10_Outlet.Checked == true)
            {
                Line1SmartPowerStrip10Outlet = "Y";
            }




            string Line2SmartPowerStrip10Outlet = "";
            if (rdo_Line2_10_Outlet.Checked == true)
            {
                Line2SmartPowerStrip10Outlet = "Y";
            }



            string Line3SmartPowerStrip10Outlet = "";
            if (rdo_Line3_10_Outlet.Checked == true)
            {
                Line3SmartPowerStrip10Outlet = "Y";
            }




            string Line4SmartPowerStrip10Outlet = "";
            if (rdo_Line4_10_Outlet.Checked == true)
            {
                Line4SmartPowerStrip10Outlet = "Y";
            }

            string InstalledFurnaceFilter = "";
            if (rdo_FilterWhistle_Yes.Checked == true)
            {
                InstalledFurnaceFilter = "Y";
            }
            else if (rdo_FilterWhistle_No.Checked == true)
            {
                InstalledFurnaceFilter = "N";
            }


            i = obj_MetedAudit.UpdateMETEDAudit_3(JobNum,string.Empty, txt_AreaDifficult.Text, txt_ApplicationProb.Text, DoTheyUnvented, txt_HighestEnergy.Text, HealthIssueCheck,txt_Expalain_HealthIssues1.Text, txt_HealthIssue2.Text,string.Empty, txt_LedNightLight.Text, txt_LedNightLight_Location1.Text, txt_LedNightLight_Location2.Text, txt_LedNightLight_Location3.Text, txt_LedNightLight_Location4.Text, txt_SmartPowerStrip.Text, txt_SmartPower_Location1.Text, txt_SmartPower_Location2.Text, txt_SmartPower_Location3.Text, txt_SmartPower_Location4.Text, Line1SmartPowerStrip6Outlet, Line2SmartPowerStrip6Outlet, Line3SmartPowerStrip6Outlet, Line4SmartPowerStrip6Outlet, Line1SmartPowerStrip10Outlet, Line2SmartPowerStrip10Outlet, Line3SmartPowerStrip10Outlet, Line4SmartPowerStrip10Outlet, txt_ExistingAlarms.Text, txt_NewAlarms.Text, txt_COAlarms_Location1.Text, txt_COAlarms_Location2.Text, txt_COAlarms_Location3.Text, txt_COAlarms_Location4.Text, txt_COAlarms_Location5.Text, InstalledFurnaceFilter);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }
}
