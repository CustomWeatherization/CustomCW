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

public partial class METED_METED_Audit_Page22 : System.Web.UI.Page
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_22(JobNum);
            if (dt.Rows.Count > 0)
            {
                txt_MeasureInstalledLine1.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine1"]);
                txt_MeasureFirstenergyLine1.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine1"]);
                txt_MeaasureSubcontractorLine1.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine1"]);
                txt_MeasureInstalledLine2.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine2"]);
                txt_MeasureFirstenergyLine2.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine2"]);
                txt_MeaasureSubcontractorLine2.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine2"]);
                txt_MeasureInstalledLine3.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine3"]);
                txt_MeasureFirstenergyLine3.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine3"]);
                txt_MeaasureSubcontractorLine3.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine3"]);
                txt_MeasureInstalledLine4.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine4"]);
                txt_MeasureFirstenergyLine4.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine4"]);
                txt_MeaasureSubcontractorLine4.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine4"]);
                txt_MeasureInstalledLine5.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine5"]);
                txt_MeasureFirstenergyLine5.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine5"]);
                txt_MeaasureSubcontractorLine5.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine5"]);
                txt_MeasureInstalledLine6.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine6"]);
                txt_MeasureFirstenergyLine6.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine6"]);
                txt_MeaasureSubcontractorLine6.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine6"]);
                txt_MeasureInstalledLine7.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine7"]);
                txt_MeasureFirstenergyLine7.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine7"]);
                txt_MeaasureSubcontractorLine7.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine7"]);
                txt_MeasureInstalledLine8.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine8"]);
                txt_MeasureFirstenergyLine8.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine8"]);
                txt_MeaasureSubcontractorLine8.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine8"]);
                txt_MeasureInstalledLine9.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine9"]);
                txt_MeasureFirstenergyLine9.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine9"]);
                txt_MeaasureSubcontractorLine9.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine9"]);
                txt_MeasureInstalledLine10.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine10"]);
                txt_MeasureFirstenergyLine10.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine10"]);
                txt_MeaasureSubcontractorLine10.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine10"]);
                txt_OtherInsandEvaluators.Text = Convert.ToString(dt.Rows[0]["OtherInsandEvaluators"]);
                txt_MeasuresRefusedLine1.Text = Convert.ToString(dt.Rows[0]["MeasuresRefusedLine1"]);
                txt_CustomerSignDateLine1.Text = Convert.ToString(dt.Rows[0]["CustomerSignDateLine1"]);
                txt_MeasuresRefusedLine2.Text = Convert.ToString(dt.Rows[0]["MeasuresRefusedLine2"]);
                txt_CustomerSignDateLine2.Text = Convert.ToString(dt.Rows[0]["CustomerSignDateLine2"]);
                txt_MeasuresRefusedLine3.Text = Convert.ToString(dt.Rows[0]["MeasuresRefusedLine3"]);
                txt_CustomerSignDateLine3.Text = Convert.ToString(dt.Rows[0]["CustomerSignDateLine3"]);
                txt_MeasuresRefusedLine4.Text = Convert.ToString(dt.Rows[0]["MeasuresRefusedLine4"]);
                txt_CustomerSignDateLine4.Text = Convert.ToString(dt.Rows[0]["CustomerSignDateLine4"]);

                string WarmInvoice = Convert.ToString(dt.Rows[0]["WarmInvoice"]);
                if (WarmInvoice == "Y")
                {
                    Chk_WarmInvoice.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ThisAuditForm = Convert.ToString(dt.Rows[0]["ThisAuditForm"]);
                if (ThisAuditForm == "Y")
                {
                    Chk_ThisAuditForm.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string SeasonalForm = Convert.ToString(dt.Rows[0]["SeasonalForm"]);
                if (SeasonalForm == "Y")
                {
                    Chk_SeasonalForm.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string OurAgreement = Convert.ToString(dt.Rows[0]["OurAgreement"]);
                if (OurAgreement == "Y")
                {
                    Chk_OurAgreement.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string OurStrategy = Convert.ToString(dt.Rows[0]["OurStrategy"]);
                if (OurStrategy == "Y")
                {
                    Chk_OurStrategy.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CustomerKwh = Convert.ToString(dt.Rows[0]["CustomerKwh"]);
                if (CustomerKwh == "Y")
                {
                    Chk_CustomerKwh.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string AccountKWHWebsite = Convert.ToString(dt.Rows[0]["AccountKWHWebsite"]);
                if (AccountKWHWebsite == "Y")
                {
                    Chk_AccountKWHWebsite.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string RT = Convert.ToString(dt.Rows[0]["RT"]);
                if (RT == "Y")
                {
                    Chk_RT.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string RTNA = Convert.ToString(dt.Rows[0]["RTNA"]);
                if (RTNA == "Y")
                {
                    Chk_RTNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ReceiptsInformation = Convert.ToString(dt.Rows[0]["ReceiptsInformation"]);
                if (ReceiptsInformation == "Y")
                {
                    Chk_ReceiptsInformation.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ReceiptsInfoNA = Convert.ToString(dt.Rows[0]["ReceiptsInfoNA"]);
                if (ReceiptsInfoNA == "Y")
                {
                    Chk_ReceiptsInfoNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string PhotoInaccesible = Convert.ToString(dt.Rows[0]["PhotoInaccesible"]);
                if (PhotoInaccesible == "Y")
                {
                    Chk_PhotoInaccesible.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string PhotoInaccesibleNA = Convert.ToString(dt.Rows[0]["PhotoInaccesibleNA"]);
                if (PhotoInaccesibleNA == "Y")
                {
                    Chk_PhotoInaccesibleNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string WeatherizationPresent = Convert.ToString(dt.Rows[0]["WeatherizationPresent"]);
                if (WeatherizationPresent == "Y")
                {
                    Chk_WeatherizationPresent.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string WeatherizationPresentNA = Convert.ToString(dt.Rows[0]["WeatherizationPresentNA"]);
                if (WeatherizationPresentNA == "Y")
                {
                    Chk_WeatherizationPresentNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyAirCustomer = Convert.ToString(dt.Rows[0]["CopyAirCustomer"]);
                if (CopyAirCustomer == "Y")
                {
                    Chk_CopyAirCustomer.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyAirCustomerNA = Convert.ToString(dt.Rows[0]["CopyAirCustomerNA"]);
                if (CopyAirCustomerNA == "Y")
                {
                    Chk_CopyAirCustomerNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyCustomerWorksheet = Convert.ToString(dt.Rows[0]["CopyCustomerWorksheet"]);
                if (CopyCustomerWorksheet == "Y")
                {
                    Chk_CopyCustomerWorksheet.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyCustomerWorksheetNA = Convert.ToString(dt.Rows[0]["CopyCustomerWorksheetNA"]);
                if (CopyCustomerWorksheetNA == "Y")
                {
                    Chk_CopyCustomerWorksheetNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyHSForm = Convert.ToString(dt.Rows[0]["CopyHSForm"]);
                if (CopyHSForm == "Y")
                {
                    Chk_CopyHSForm.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyHSFormNA = Convert.ToString(dt.Rows[0]["CopyHSFormNA"]);
                if (CopyHSFormNA == "Y")
                {
                    Chk_CopyHSFormNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ReferralProgram = Convert.ToString(dt.Rows[0]["ReferralProgram"]);
                if (ReferralProgram == "Y")
                {
                    Chk_ReferralProgram.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ReferralProgramNA = Convert.ToString(dt.Rows[0]["ReferralProgramNA"]);
                if (ReferralProgramNA == "Y")
                {
                    Chk_ReferralProgramNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string AccountsWebsite = Convert.ToString(dt.Rows[0]["AccountsWebsite"]);
                if (AccountsWebsite == "Y")
                {
                    Chk_AccountsWebsite.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatContractor = Convert.ToString(dt.Rows[0]["HeatContractor"]);
                if (HeatContractor == "Y")
                {
                    Chk_HeatContractor.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ACContrator = Convert.ToString(dt.Rows[0]["ACContrator"]);
                if (ACContrator == "Y")
                {
                    Chk_ACContrator.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////
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
            string WarmInvoice = "";
            if (Chk_WarmInvoice.Checked == true)
            {
                WarmInvoice = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string ThisAuditForm = "";
            if (Chk_ThisAuditForm.Checked == true)
            {
                ThisAuditForm = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string SeasonalForm = "";
            if (Chk_SeasonalForm.Checked == true)
            {
                SeasonalForm = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string OurAgreement = "";
            if (Chk_OurAgreement.Checked == true)
            {
                OurAgreement = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string OurStrategy = "";
            if (Chk_OurStrategy.Checked == true)
            {
                OurStrategy = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string CustomerKwh = "";
            if (Chk_CustomerKwh.Checked == true)
            {
                CustomerKwh = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string AccountKWHWebsite = "";
            if (Chk_AccountKWHWebsite.Checked == true)
            {
                AccountKWHWebsite = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string RT = "";
            if (Chk_RT.Checked == true)
            {
                RT = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string RTNA = "";
            if (Chk_RTNA.Checked == true)
            {
                RTNA = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string ReceiptsInformation = "";
            if (Chk_ReceiptsInformation.Checked == true)
            {
                ReceiptsInformation = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string ReceiptsInfoNA = "";
            if (Chk_ReceiptsInfoNA.Checked == true)
            {
                ReceiptsInfoNA = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string PhotoInaccesible = "";
            if (Chk_PhotoInaccesible.Checked == true)
            {
                PhotoInaccesible = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string PhotoInaccesibleNA = "";
            if (Chk_PhotoInaccesibleNA.Checked == true)
            {
                PhotoInaccesibleNA = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string WeatherizationPresent = "";
            if (Chk_WeatherizationPresent.Checked == true)
            {
                WeatherizationPresent = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string WeatherizationPresentNA = "";
            if (Chk_WeatherizationPresentNA.Checked == true)
            {
                WeatherizationPresentNA = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string CopyAirCustomer = "";
            if (Chk_CopyAirCustomer.Checked == true)
            {
                CopyAirCustomer = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string CopyAirCustomerNA = "";
            if (Chk_CopyAirCustomerNA.Checked == true)
            {
                CopyAirCustomerNA = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string CopyCustomerWorksheet = "";
            if (Chk_CopyCustomerWorksheet.Checked == true)
            {
                CopyCustomerWorksheet = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string CopyCustomerWorksheetNA = "";
            if (Chk_CopyCustomerWorksheetNA.Checked == true)
            {
                CopyCustomerWorksheetNA = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string CopyHSForm = "";
            if (Chk_CopyHSForm.Checked == true)
            {
                CopyHSForm = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string CopyHSFormNA = "";
            if (Chk_CopyHSFormNA.Checked == true)
            {
                CopyHSFormNA = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string ReferralProgram = "";
            if (Chk_ReferralProgram.Checked == true)
            {
                ReferralProgram = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string ReferralProgramNA = "";
            if (Chk_ReferralProgramNA.Checked == true)
            {
                ReferralProgramNA = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string AccountsWebsite = "";
            if (Chk_AccountsWebsite.Checked == true)
            {
                AccountsWebsite = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string HeatContractor = "";
            if (Chk_HeatContractor.Checked == true)
            {
                HeatContractor = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string ACContrator = "";
            if (Chk_ACContrator.Checked == true)
            {
                ACContrator = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////

            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_22(JobNum, txt_MeasureInstalledLine1.Text, txt_MeasureFirstenergyLine1.Text, txt_MeaasureSubcontractorLine1.Text, txt_MeasureInstalledLine2.Text, txt_MeasureFirstenergyLine2.Text, txt_MeaasureSubcontractorLine2.Text, txt_MeasureInstalledLine3.Text, txt_MeasureFirstenergyLine3.Text, txt_MeaasureSubcontractorLine3.Text, txt_MeasureInstalledLine4.Text, txt_MeasureFirstenergyLine4.Text, txt_MeaasureSubcontractorLine4.Text, txt_MeasureInstalledLine5.Text, txt_MeasureFirstenergyLine5.Text, txt_MeaasureSubcontractorLine5.Text, txt_MeasureInstalledLine6.Text, txt_MeasureFirstenergyLine6.Text, txt_MeaasureSubcontractorLine6.Text, txt_MeasureInstalledLine7.Text, txt_MeasureFirstenergyLine7.Text, txt_MeaasureSubcontractorLine7.Text, txt_MeasureInstalledLine8.Text, txt_MeasureFirstenergyLine8.Text, txt_MeaasureSubcontractorLine8.Text, txt_MeasureInstalledLine9.Text, txt_MeasureFirstenergyLine9.Text, txt_MeaasureSubcontractorLine9.Text, txt_MeasureInstalledLine10.Text, txt_MeasureFirstenergyLine10.Text, txt_MeaasureSubcontractorLine10.Text, txt_OtherInsandEvaluators.Text, txt_MeasuresRefusedLine1.Text, txt_CustomerSignDateLine1.Text, txt_MeasuresRefusedLine2.Text, txt_CustomerSignDateLine2.Text, txt_MeasuresRefusedLine3.Text, txt_CustomerSignDateLine3.Text, txt_MeasuresRefusedLine4.Text, txt_CustomerSignDateLine4.Text, WarmInvoice, ThisAuditForm, SeasonalForm, OurAgreement, OurStrategy, CustomerKwh, AccountKWHWebsite, RT, RTNA, ReceiptsInformation, ReceiptsInfoNA, PhotoInaccesible, PhotoInaccesibleNA, WeatherizationPresent, WeatherizationPresentNA, CopyAirCustomer, CopyAirCustomerNA, CopyCustomerWorksheet, CopyCustomerWorksheetNA, CopyHSForm, CopyHSFormNA, ReferralProgram, ReferralProgramNA, AccountsWebsite, HeatContractor, ACContrator);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }
}
