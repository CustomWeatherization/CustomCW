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

public partial class Admin_EmployeeInformation : System.Web.UI.Page
{
    Dc_Category objCat = new Dc_Category();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillEmployeeInformation(Convert.ToInt32(Request.QueryString["Uid"]));
           // ColorPicker1.SelectedHexValue = "#9a0000";
        }
    }

    public void FillEmployeeInformation(int uid)
    {
        DataTable dt = objCat.ShowEmployeeInformation(uid);
        if (dt.Rows.Count > 0)
        {
            txt_Firstname.Text = Convert.ToString(dt.Rows[0]["FName"]);
            txt_lastname.Text = Convert.ToString(dt.Rows[0]["LName"]);
            txt_phone.Text = Convert.ToString(dt.Rows[0]["phone"]);
            txtAddress_Mailing.Text = Convert.ToString(dt.Rows[0]["Address"]);
            txtCity_Mailing.Text = Convert.ToString(dt.Rows[0]["City"]);
            txtState.Text = Convert.ToString(dt.Rows[0]["State"]);
            txtZipCode_Mailing.Text = Convert.ToString(dt.Rows[0]["Zipcode"]);
            txt_email.Text = Convert.ToString(dt.Rows[0]["Email"]);
            txt_loginId.Text = Convert.ToString(dt.Rows[0]["Login"]);
            txt_PersentRate.Text = Convert.ToString(dt.Rows[0]["PersentageRate"]);
            txt_AuditRate.Text = "$ " + Convert.ToString(dt.Rows[0]["AuditRate"]);
            txtHourlyRate.Text = "$" + Convert.ToString(dt.Rows[0]["HourlyRate"]);
            txtPasscode.Text = Convert.ToString(dt.Rows[0]["passcode"]);
            txtMetedAudit.Text = "$ " + Convert.ToString(dt.Rows[0]["MetedAudit"]);
            txtQuestion.Text = Convert.ToString(dt.Rows[0]["QuestionMesr"]);
            txtExtraMesr.Text = "$" + Convert.ToString(dt.Rows[0]["ExtraMesr"]);
            txtZ1Z2Rate.Text = Convert.ToString(dt.Rows[0]["PplZ1Z2"]);
            txtInspectionRate.Text = Convert.ToString(dt.Rows[0]["InspectionRate"]);
            ColorPickerId.Value = Convert.ToString(dt.Rows[0]["Eventcolor"]);
            txtBCOCInvoiceRate.Text = Convert.ToString(dt.Rows[0]["BCOC_Invoice"]);
            txtDCEDInvoiceRate.Text = Convert.ToString(dt.Rows[0]["DCED_Invoice"]);
            txtUGIInvoiceRate.Text = Convert.ToString(dt.Rows[0]["UGI_Invoice"]);
            txtPCInvoiceRate.Text = Convert.ToString(dt.Rows[0]["Private_Customer_Invoice"]);

        }
        string str = objCat.CheckAuditorCheckBox(uid);
        if (str == "True")
        {
            Chk_SetAuditor.Checked = true;
        }
        else if (str == "False")
        {
            Chk_SetAuditor.Checked = false;
        }
    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReportPage.aspx");
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string PPLAudit = txt_AuditRate.Text;
        PPLAudit = PPLAudit.TrimStart('$');
        PPLAudit = PPLAudit.TrimStart(' ');
       // string color = ColorPicker1.SelectedHexValue;
        string color = ColorPickerId.Value;
        //if (color=="")
        //{
        //    color = "#3a87ad";
        //}
        string MetedAudit = txtMetedAudit.Text;
        MetedAudit = MetedAudit.TrimStart('$');
        MetedAudit = MetedAudit.TrimStart(' ');

        string ExtraMesr = txtExtraMesr.Text;
        ExtraMesr = ExtraMesr.TrimStart('$');

        string Z1Z2Rate = txtZ1Z2Rate.Text;
        Z1Z2Rate = Z1Z2Rate.TrimStart('$');

        string InspectionRate = txtInspectionRate.Text;
        InspectionRate = InspectionRate.TrimStart('$');

        string InvoiceRate = txt_PersentRate.Text;
        InvoiceRate = InvoiceRate.TrimStart('$');

        string HourlyRate = txtHourlyRate.Text;
        HourlyRate = HourlyRate.TrimStart('$');



        int i = objCat.UpdateEmployeeInformation(txtPasscode.Text, PPLAudit, InvoiceRate, HourlyRate, Convert.ToInt32(Request.QueryString["Uid"]), MetedAudit, ExtraMesr, txtQuestion.Text, Z1Z2Rate,InspectionRate, txtBCOCInvoiceRate.Text, txtDCEDInvoiceRate.Text, txtPCInvoiceRate.Text, txtUGIInvoiceRate.Text, color);
        if (i == 1)
        {
            FillEmployeeInformation(Convert.ToInt32(Request.QueryString["Uid"]));
            Response.Write("<script type = 'text/javascript'>alert('Record is updated');</script>");
        }
        else
        {
            Response.Write("<script type = 'text/javascript'>alert('Try Again !!');</script>");
        }
    }
    protected void Chk_SetAuditor_CheckedChanged(object sender, EventArgs e)
    {
        if (Chk_SetAuditor.Checked == true)
        {
            objCat.setAuditor(Convert.ToString(Request.QueryString["Uid"]), "check");
        }
        else if (Chk_SetAuditor.Checked == false)
        {
            objCat.setAuditor(Convert.ToString(Request.QueryString["Uid"]), "Notcheck");
        }
    }
  

}
                     