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

public partial class Admin_ManagePaidReport : System.Web.UI.Page
{
    dc_Admin ObjAdmin = new dc_Admin();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToString(Request.QueryString["JobID"]) != "" && Convert.ToString(Request.QueryString["UC"]) != "" && Convert.ToString(Request.QueryString["JobID"]) != null && Convert.ToString(Request.QueryString["UC"]) != null)
            {
                // Convert.ToString(Request.QueryString["RF"]) != null && Convert.ToString(Request.QueryString["D"]) != null && Convert.ToString(Request.QueryString["A"]) != null && Convert.ToString(Request.QueryString["PT"]) != null && Convert.ToString(Request.QueryString["AllId"]) != null && Convert.ToString(Request.QueryString["RF"]) != "" && Convert.ToString(Request.QueryString["D"]) != "" && Convert.ToString(Request.QueryString["A"]) != "" && Convert.ToString(Request.QueryString["PT"]) != "" && Convert.ToString(Request.QueryString["AllId"]) != "" && 
                if (!IsPostBack)
                {
                    BindData();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        catch
        {
        }
    }


    public void BindData()
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjAdmin.GetJobWithPaidReport(Convert.ToInt32(Request.QueryString["JobID"]), Convert.ToString(Request.QueryString["UC"]), Convert.ToInt32(Request.QueryString["NoOfInvoice"]));
            if (dt.Rows.Count > 0)
            {
                txt_JobNumber.Text = Convert.ToString(dt.Rows[0]["JobNumber"]);
                //txt_Paid.Text = Convert.ToString(dt.Rows[0]["PaidAmount"]);
                //txt_Remaining.Text = Convert.ToString(dt.Rows[0]["PaidRemainingAmount"]);
                if (Convert.ToString(dt.Rows[0]["KeepRemain"]) == "New")
                {
                    txt_Total.Text = Convert.ToString(dt.Rows[0]["PaidRemainingAmount"]);
                }
                else
                {
                    txt_Total.Text = Convert.ToString(dt.Rows[0]["PaidTotalAmount"]);
                }

                //txt_PaymentType.Text = Convert.ToString(dt.Rows[0]["Payment_Type"]);
                //hdn_txt_PaymentType.Value = Convert.ToString(dt.Rows[0]["Payment_Type"]);
                //txt_Payment_no.Text = Convert.ToString(dt.Rows[0]["PaymentType_No"]);
                //hdn_txt_Payment_no.Value = Convert.ToString(dt.Rows[0]["PaymentType_No"]);
                ddlPaidStaus.SelectedValue = Convert.ToString(dt.Rows[0]["PaidStatus"]);
            }
        }
        catch
        {
        }
    }
    public void insert_update_PaidRecord()
    {
    }

    protected void btn_SaveChange_Click(object sender, EventArgs e)
    {
        try
        {
            ObjAdmin.UpdateCheckbox(0);
            string Vurl = Convert.ToString(Request.QueryString["VUrl"]);
            string[] URL = Vurl.Split('*');
            for (int i = 0; i < URL.Length; i++)
            {
                if (i == 4 && Convert.ToString(URL[3]) == "PT=Credit Card")
                {
                    string id = URL[i].Substring(3);
                    string[] chkIds = id.Split('-');
                    for (int j = 1; j < chkIds.Length; j++)
                    {
                        string[] UID = chkIds[j].Split('_');
                        string OID = UID[2];
                        ObjAdmin.UpdateCheckbox(Convert.ToInt32(OID));
                    }
                }
                else if (i == 5 && Convert.ToString(URL[3]) == "PT=Check")
                {
                    string id = URL[i].Substring(3);
                    string[] chkIds = id.Split('-');
                    for (int j = 1; j < chkIds.Length; j++)
                    {
                        string[] UID = chkIds[j].Split('_');
                        string OID = UID[2];
                        ObjAdmin.UpdateCheckbox(Convert.ToInt32(OID));
                    }
                }
            }


            if (ChkYes.Checked == true)
            {
                hdn_Keeping.Value = "Y";
            }
            else if (ChkNo.Checked == true)
            {
                hdn_Keeping.Value = "N";
            }
            ObjAdmin.updatePaidTblChanges(txt_JobNumber.Text, txt_Total.Text, txt_Paid.Text, hdn_txt_Remaining.Value, Convert.ToString(Request.QueryString["NoOfInvoice"]), hdn_txt_PaymentType.Value, hdn_txt_Payment_no.Value, DDL_Quetion.SelectedValue, txtComment.Text, hdn_Keeping.Value, txt_NewInvoiceAmount.Text);
            Response.Redirect("RecivePayment.aspx?VUrl=" + Vurl);
        }
        catch
        {
        }
    }
    protected void lnkBtnClose_Click(object sender, EventArgs e)
    {
        try
        {
            string Vurl = Convert.ToString(Request.QueryString["VUrl"]);
            string[] URL = Vurl.Split('*');
            for (int i = 0; i < URL.Length; i++)
            {
                if (i == 5 && Convert.ToString(URL[3]) == "PT=Check")
                {
                    string id = URL[i].Substring(3);
                    string[] chkIds = id.Split('-');
                    for (int j = 1; j < chkIds.Length; j++)
                    {
                        string[] UID = chkIds[j].Split('_');
                        string OID = UID[2];
                        ObjAdmin.UpdateCheckbox(Convert.ToInt32(OID));
                    }
                }
            }
            Response.Redirect("RecivePayment.aspx?VUrl=" + Vurl);
        }
        catch (Exception ex)
        {
        }
    }
    //    function Check_Cash() {
    //        var PaymentType = document.getElementById('<%=txt_PaymentType.ClientID%>');
    //        if (PaymentType.value.toLowerCase() == 'cash') {
    //            document.getElementById('<%=txt_Payment_no.ClientID%>').disabled = true;
    //        }
    //    }
}
