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

public partial class PPLAudit_PPL_Audit_8 : System.Web.UI.Page
{
    dcPPLAudit objppl = new dcPPLAudit();
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (Request.UserAgent.Contains("Chrome"))
            {
                //  TopBtnDiv.Attributes.Add("style", "position: fixed; top: 65px; z-index: 100; text-align: center; margin: 0 45px;width:510px;");
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
            if (Convert.ToString(Session["finalize"]) == "F")
            {
                btnSave.Visible = false;
                spnFinal.InnerHtml = "Audit Finalize";
            }
        }
        catch (Exception ex)
        {
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {


        string strPostweatherizationreadingOpenOrClosed = "";
        if (chkPostweatherizationreadingOpenOrClosedCheckbox_Close.Checked == true)
        {
            strPostweatherizationreadingOpenOrClosed = "C";
        }
        else if (chkPostweatherizationreadingOpenOrClosedCheckbox_Open.Checked == true)
        {
            strPostweatherizationreadingOpenOrClosed = "O";
        }

        objppl.UpdatePPLAudit_8(Request.QueryString["Jobs"].ToString(), txtTargetMVG.Text, "", txtPreweatherizationreadingBDO.Text, txtIndoorTemperature.Text, txtPreweatherizationreadingBDClosed.Text, txtOutdoorTemperature.Text, txtPostweatherizationreading.Text, strPostweatherizationreadingOpenOrClosed, txtTotalReduction.Text, txtBasementHouseZonePretreat.Text, txtBasementHouseZoneFinal.Text, txtBasementZoneOutsidePretreat.Text, txtBasementZoneOutsideFinal.Text, txtVentedCrawlSpaceHouseZonePretreat.Text, txtVentedCrawlSpaceHouseZoneFinal.Text, txtVentedCrawlSpaceZoneOutsidePretreat.Text, txtVentedCrawlSpaceZoneOutsideFinal.Text, txtAttic_A_HouseZonePretreat.Text, txtAttic_A_HouseZoneFinal.Text, txtAttic_A_ZoneOutsidePretreat.Text, txtAttic_A_ZoneOutsideFinal.Text, txtAttic_B_HouseZonePretreat.Text, txtAttic_B_HouseZoneFinal.Text, txtAttic_B_ZoneOutsidePretreat.Text, txtAttic_B_ZoneOutsideFinal.Text, txtKneewall_A_HouseZonePretreat.Text, txtKneewall_A_HouseZoneFinal.Text, txtKneewall_A_ZoneOutsidePretreat.Text, txtKneewall_A_ZoneOutsideFinal.Text, txtKneewall_B_HouseZonePretreat.Text, txtKneewall_B_HouseZoneFinal.Text, txtKneewall_B_ZoneOutsidePretreat.Text, txtKneewall_B_ZoneOutsideFinal.Text, txtGarageHouseZonePretreat.Text, txtGarageHouseZoneFinal.Text, txtGarageZoneOutsidePretreat.Text, txtGarageZoneOutsideFinal.Text, txtGarage_AtticHouseZonePretreat.Text, txtGarage_AtticHouseZoneFinal.Text, txtGarage_AtticZoneOutsidePretreat.Text, txtGarage_AtticZoneOutsideFinal.Text, txtCantilever_Overhang_1_HouseZonePretreat.Text, txtCantilever_Overhang_1_HouseZonePretreat.Text, txtCantilever_Overhang_1_ZoneOutsidePretreat.Text, txtCantilever_Overhang_1_ZoneOutsideFinal.Text, txtCantilever_Overhang_2_HouseZonePretreat.Text, txtCantilever_Overhang_2_HouseZoneFinal.Text, txtCantilever_Overhang_2_ZoneOutsidePretreat.Text, txtCantilever_Overhang_2_ZoneOutsideFinal.Text, txtOther1HouseZonePretreat.Text, txtOther1HouseZoneFinal.Text, txtOther1ZoneOutsidePretreat.Text, txtOther1ZoneOutsideFinal.Text, txtOther_2_HouseZonePretreat.Text, txtOther_2_HouseZoneFinal.Text, txtOther_2_ZoneOutsidePretreat.Text, txtOther_2_ZoneOutsideFinal.Text, txtOther_3_HouseZonePretreat.Text, txtOther_3_HouseZoneFinal.Text, txtOther_3_ZoneOutsidePretreat.Text, txtOther_3_ZoneOutsideFinal.Text, txtOther1.Text, txtOther2.Text, txtOther3.Text, txtBasement_BlowerDoorPretreat.Text, txtBasement_BlowerDoorFinal.Text, txtVentedCrawlSpace_BlowerDoorPretreat.Text, txtVentedCrawlSpace_BlowerDoorFinal.Text, txtAttic_A_BlowerDoorPretreat.Text, txtAttic_A_BlowerDoorFinal.Text, txtAttic_B_BlowerDoorPretreat.Text, txtAttic_B_BlowerDoorFinal.Text, txtKneewall_A_BlowerDoorPretreat.Text, txtKneewall_A_BlowerDoorFinal.Text, txtKneewall_B_BlowerDoorPretreat.Text, txtKneewall_B_BlowerDoorFinal.Text, txtGarage_BlowerDoorPretreat.Text, txtGarage_BlowerDoorFinal.Text, txtGarage_Attic_BlowerDoorPretreat.Text, txtGarage_AtticBlowerDoorFinal.Text, txtCantilever_Overhang_1_BlowerDoorFinal.Text, txtCantilever_Overhang_1_BlowerDoorFinal.Text, txtCantilever_BlowerDoorPretreat.Text, txtCantilever_BlowerDoorFinal.Text, txtOther1_BlowerDoorPretreat.Text, txtOther1_BlowerDoorFinal.Text, txtOther_2_BlowerDoorPretreat.Text, txtOther_2_BlowerDoorFinal.Text, txtOther_3_BlowerDoorPretreat.Text, txtOther_3_BlowerDoorFinal.Text);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Save Successfully');", true);
    }

    protected void FillUpdateAudit()
    {
        DataTable dt = new DataTable();
        dt = objppl.GetPPLAudit_8(Request.QueryString["Jobs"].ToString());
        if (dt.Rows.Count > 0)
        {
            txtBasement_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["BasementBlowerDoorPretreat"]);
            txtBasement_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["BasementBlowerDoorFinal"]);
            txtBasementHouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["BasementHouseZonePretreat"]);
            txtBasementHouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["BasementHouseZoneFinal"]);
            txtBasementZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["BasementZoneOutsidePretreat"]);
            txtBasementZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["BasementZoneOutsideFinal"]);
            txtVentedCrawlSpace_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["CrawlspaceBlowerDoorPretreat"]);
            txtVentedCrawlSpace_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["CrawlspaceBlowerDoorFinal"]);
            txtVentedCrawlSpaceHouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["VentedCrawlSpaceHouseZonePretreat"]);
            txtVentedCrawlSpaceHouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["VentedCrawlSpaceHouseZoneFinal"]);
            txtVentedCrawlSpaceZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["VentedCrawlSpaceZoneOutsidePretreat"]);
            txtVentedCrawlSpaceZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["VentedCrawlSpaceZoneOutsideFinal"]);
            txtAttic_A_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["AtticABlowerDoorPretreat"]);
            txtAttic_A_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["AtticABlowerDoorFinal"]);
            txtAttic_A_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["AtticAHouseZonePretreat"]);
            txtAttic_A_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["AtticAHouseZoneFinal"]);
            txtAttic_A_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["AtticAZoneOutsidePretreat"]);
            txtAttic_A_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["AtticAZoneOutsideFinal"]);
            txtAttic_B_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["AtticBBlowerDoorPretreat"]);
            txtAttic_B_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["AtticBBlowerDoorFinal"]);
            txtAttic_B_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["AtticBHouseZonePretreat"]);
            txtAttic_B_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["AtticBHouseZoneFinal"]);
            txtAttic_B_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["AtticBZoneOutsidePretreat"]);
            txtAttic_B_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["AtticBZoneOutsideFinal"]);
            txtKneewall_A_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["KneeWallABlowerDoorPretreat"]);
            txtKneewall_A_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["KneeWallABlowerDoorFinal"]);
            txtKneewall_A_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["KneewallAHouseZonePretreat"]);
            txtKneewall_A_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["KneewallAHouseZoneFinal"]);
            txtKneewall_A_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["KneewallAZoneOutsidePretreat"]);
            txtKneewall_A_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["KneewallAZoneOutsideFinal"]);
            txtKneewall_B_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["KneeWallBBlowerDoorPretreat"]);
            txtKneewall_B_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["KneeWallBBlowerDoorFinal"]);
            txtKneewall_B_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["KneewallBHouseZonePretreat"]);
            txtKneewall_B_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["KneewallBHouseZoneFinal"]);
            txtKneewall_B_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["KneewallBZoneOutsidePretreat"]);
            txtKneewall_B_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["KneewallBZoneOutsideFinal"]);
            txtGarage_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["GarageBlowerDoorPretreat"]);
            txtGarage_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["GarageBlowerDoorFinal"]);
            txtGarageHouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["GarageHouseZonePretreat"]);
            txtGarageHouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["GarageHouseZoneFinal"]);
            txtGarageZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["GarageZoneOutsidePretreat"]);
            txtGarageZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["GarageZoneOutsideFinal"]);
            txtGarage_Attic_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["GarageAtticBlowerDoorPretreat"]);
            txtGarage_AtticBlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["GarageAtticBlowerDoorFinal"]);
            txtGarage_AtticHouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["GarageAtticHouseZonePretreat"]);
            txtGarage_AtticHouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["GarageAtticHouseZoneFinal"]);
            txtGarage_AtticZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["GarageAtticZoneOutsidePretreat"]);
            txtGarage_AtticZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["GarageAtticZoneOutsideFinal"]);
            txtCantilever_Overhang_1_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["Cantilever1BlowerDoorPretreat"]);
            txtCantilever_Overhang_1_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["Cantilever1BlowerDoorFinal"]);
            txtCantilever_Overhang_1_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang1HouseZonePretreat"]);
            txtCantilever_Overhang_1_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang1HouseZoneFinal"]);
            txtCantilever_Overhang_1_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang1ZoneOutsidePretreat"]);
            txtCantilever_Overhang_1_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang1ZoneOutsideFinal"]);
            txtCantilever_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["Cantilever2BlowerDoorPretreat"]);
            txtCantilever_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["Cantilever2BlowerDoorFinal"]);
            txtCantilever_Overhang_2_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang2HouseZonePretreat"]);
            txtCantilever_Overhang_2_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang2HouseZoneFinal"]);
            txtCantilever_Overhang_2_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang2ZoneOutsidePretreat"]);
            txtCantilever_Overhang_2_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang2ZoneOutsideFinal"]);
            txtOther1_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["Other1BlowerDoorPretreat"]);
            txtOther1_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["Other1BlowerDoorFinal"]);
            txtOther1HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["Other1HouseZonePretreat"]);
            txtOther1HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["Other1HouseZoneFinal"]);
            txtOther1ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["Other1ZoneOutsidePretreat"]);
            txtOther1ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["Other1ZoneOutsideFinal"]);
            txtOther_2_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["Other2BlowerDoorPretreat"]);
            txtOther_2_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["Other2BlowerDoorFinal"]);
            txtOther_2_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["Other2HouseZonePretreat"]);
            txtOther_2_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["Other2HouseZoneFinal"]);
            txtOther_2_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["Other2ZoneOutsidePretreat"]);
            txtOther_2_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["Other2ZoneOutsideFinal"]);
            txtOther_3_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["Other3BlowerDoorPretreat"]);
            txtOther_3_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["Other3BlowerDoorFinal"]);
            txtOther_3_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["Other3HouseZonePretreat"]);
            txtOther_3_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["Other3HouseZoneFinal"]);
            txtOther_3_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["Other3ZoneOutsidePretreat"]);
            txtOther_3_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["Other3ZoneOutsideFinal"]);


            txtTargetMVG.Text = Convert.ToString(dt.Rows[0]["TargetMVG"]);
            txtPreweatherizationreadingBDO.Text = Convert.ToString(dt.Rows[0]["PreweatherizationreadingBDO"]);
            txtIndoorTemperature.Text = Convert.ToString(dt.Rows[0]["IndoorTemperature"]);
            txtPreweatherizationreadingBDClosed.Text = Convert.ToString(dt.Rows[0]["PreweatherizationreadingBDClosed"]);
            txtOutdoorTemperature.Text = Convert.ToString(dt.Rows[0]["OutdoorTemperature"]);
            txtPostweatherizationreading.Text = Convert.ToString(dt.Rows[0]["Postweatherizationreading"]);
            txtTotalReduction.Text = Convert.ToString(dt.Rows[0]["TotalReduction"]);

            txtOther1.Text = Convert.ToString(dt.Rows[0]["Other1Name"]);
            txtOther2.Text = Convert.ToString(dt.Rows[0]["Other2Name"]);
            txtOther3.Text = Convert.ToString(dt.Rows[0]["Other3Name"]);





            if (Convert.ToString(dt.Rows[0]["PostweatherizationreadingOpenOrClosedCheckbox"]) == "O")
            {
                chkPostweatherizationreadingOpenOrClosedCheckbox_Open.Checked = true;
            }
            else if (Convert.ToString(dt.Rows[0]["PostweatherizationreadingOpenOrClosedCheckbox"]) == "C")
            {
                chkPostweatherizationreadingOpenOrClosedCheckbox_Close.Checked = true;
            }
        }

    }

    protected void btnCancel_Click1(object sender, EventArgs e)
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
