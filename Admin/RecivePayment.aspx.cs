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

public partial class Admin_RecivePayment : System.Web.UI.Page
{
    public DataTable DtManul = new DataTable();
    public DataTable dtRed = new DataTable();
    dc_Admin ObjAdmin = new dc_Admin();
    public decimal TotalAmt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txt_Date.Text = DateTime.Now.ToString("MM/dd/yyyy");
            if (Convert.ToString(Request.QueryString["VUrl"]) != "" && Request.QueryString["VUrl"] != null)
            {
                string VUrl = Convert.ToString(Request.QueryString["VUrl"]);

                //RF=PPL Z1*D=6/8/2015*A=$1,544*PT=Cheque*CH=51561*AllId= -chk_RecivePayment@105-chk_RecivePayment@106
                string[] URL = VUrl.Split('*');
                for (int i = 0; i < URL.Length; i++)
                {
                    if (i == 0)
                    {
                        DDL_ReceiveFrom.SelectedValue = URL[i].Substring(3);
                        if (DDL_ReceiveFrom.SelectedValue == "Select")
                        {
                            BindAllData();
                        }
                        else
                        {
                            CommonMetodForShow();
                        }
                    }
                    if (i == 1)
                    {
                        txt_Date.Text = URL[i].Substring(2);
                    }
                    if (i == 2)
                    {
                        txt_Amount.Text = URL[i].Substring(2);
                    }
                    if (i == 3)
                    {
                        DDL_PaymentMethod.SelectedValue = URL[i].Substring(3);
                    }
                    if (i == 4)
                    {
                        if (Convert.ToString(URL[i - 1].Substring(3)) == "Check")
                        {
                            stng_Check.Visible = true;
                            txt_CheckNo.Visible = true;
                            txt_CheckNo.Text = URL[i].Substring(3);
                        }
                    }
                }
            }
            else
            {
                BindAllData();
            }
        }
    }

    public void BindAllData()
    {
        Session["dtAll"] = "";
        BindAllCaclv();

        string utlity = "PPL Zone 1";
        DataTable dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
        DataTable dtall = (DataTable)Session["dtAll"];
        if (dt.Rows.Count > 0)
        {
            dtall.Merge(dt);
        }
        Session["dtAll"] = dtall;

        utlity = "PPL Zone 2";
        dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
        dtall = (DataTable)Session["dtAll"];
        if (dt.Rows.Count > 0)
        {
            dtall.Merge(dt);
        }
        Session["dtAll"] = dtall;

        utlity = "PPL Zone 3";
        dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
        dtall = (DataTable)Session["dtAll"];
        if (dt.Rows.Count > 0)
        {
            dtall.Merge(dt);
        }
        Session["dtAll"] = dtall;


        utlity = "PRIVATE CUSTOMER";
        dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
        dtall = (DataTable)Session["dtAll"];
        if (dt.Rows.Count > 0)
        {
            dtall.Merge(dt);
        }
        Session["dtAll"] = dtall;

        utlity = "BCOC";
        dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
        dtall = (DataTable)Session["dtAll"];
        if (dt.Rows.Count > 0)
        {
            dtall.Merge(dt);
        }
        Session["dtAll"] = dtall;
        dtRed = (DataTable)Session["dtAll"];
    }

    public void BindAllCaclv()
    {
        DataTable dtall = new DataTable();
        Session["dtAll"] = "";
        string utlity = "PPL";
        DataTable dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
        dtall.Merge(dt);
        Session["dtAll"] = dtall;


        utlity = "MET ED";
        dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
        dtall = (DataTable)Session["dtAll"];
        if (dt.Rows.Count > 0)
        {
            dtall.Merge(dt);
        }
        Session["dtAll"] = dtall;

        utlity = "DCED";
        dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
        dtall = (DataTable)Session["dtAll"];
        if (dt.Rows.Count > 0)
        {
            dtall.Merge(dt);
        }
        Session["dtAll"] = dtall;

        utlity = "UGI";
        dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
        dtall = (DataTable)Session["dtAll"];
        if (dt.Rows.Count > 0)
        {
            dtall.Merge(dt);
        }
        Session["dtAll"] = dtall;

        utlity = "WAP";
        dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
        dtall = (DataTable)Session["dtAll"];
        if (dt.Rows.Count > 0)
        {
            dtall.Merge(dt);
        }
        Session["dtAll"] = dtall;
    }
    protected void DDL_PaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Convert.ToString(DDL_PaymentMethod.SelectedValue) == "Check")
        {
            stng_Check.Visible = true;
            txt_CheckNo.Visible = true;
        }
        else
        {
            stng_Check.Visible = false;
            txt_CheckNo.Visible = false;
        }
        CommonMetodForShow();
    }
    protected void DDL_ReceiveFrom_SelectedIndexChanged(object sender, EventArgs e)
    {
        CommonMetodForShow();

        if (Convert.ToString(DDL_ReceiveFrom.SelectedValue) == "Select")
        {
            BindAllData();
        }

    }

    public void CommonMetodForShow()
    {
        DataTable dtall = new DataTable();
        if (Convert.ToString(DDL_ReceiveFrom.SelectedValue) == "CACLV")
        {
            BindAllCaclv();
        }
        else if (Convert.ToString(DDL_ReceiveFrom.SelectedValue) == "PPL Z1")
        {
            Session["dtAll"] = "";
            string utlity = "PPL Zone 1";
            DataTable dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
            Session["dtAll"] = dt;
        }
        else if (Convert.ToString(DDL_ReceiveFrom.SelectedValue) == "PPL Z2")
        {
            Session["dtAll"] = "";
            string utlity = "PPL Zone 2";
            DataTable dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
            Session["dtAll"] = dt;
        }
        else if (Convert.ToString(DDL_ReceiveFrom.SelectedValue) == "PPL Z1Z2")
        {
            Session["dtAll"] = "";
            string utlity = "PPL Zone 1";
            DataTable dt1 = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
            utlity = "PPL Zone 2";
            DataTable dt2 = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
            DtManul.Merge(dt1);
            DtManul.AcceptChanges();

            DtManul.Merge(dt2);
            DtManul.AcceptChanges();
            Session["dtAll"] = DtManul;
        }
        else if (Convert.ToString(DDL_ReceiveFrom.SelectedValue) == "BCOC")
        {
            Session["dtAll"] = "";
            string utlity = "BCOC";
            DataTable dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
            Session["dtAll"] = dt;
        }
        else if (Convert.ToString(DDL_ReceiveFrom.SelectedValue) == "Private")
        {
            Session["dtAll"] = "";
            string utlity = "PRIVATE CUSTOMER";
            DataTable dt = ObjAdmin.SelectJobs_WithPaidReport_WithStatus(utlity);
            Session["dtAll"] = dt;
        }
        dtRed = (DataTable)Session["dtAll"];
    }
    protected void btn_PaySelect_Click(object sender, EventArgs e)
    {
        string ids = Convert.ToString(hdnID.Value);
        ids = ids.Replace("chk_RecivePayment_", "");
        string[] k = ids.Split(',');
        string ChkNo = "";
        if (Convert.ToString(DDL_PaymentMethod.SelectedValue) == "Check")
        {
            ChkNo = txt_CheckNo.Text;
        }
        for (int i = 0; i < k.Length; i++)
        {
            ObjAdmin.UpdatePaidReport(Convert.ToInt32(k[i]), Convert.ToDateTime(txt_Date.Text), Convert.ToString(DDL_PaymentMethod.SelectedValue), ChkNo);
        }

        CommonMetodForShow();
        DDL_ReceiveFrom.SelectedValue = "Select"; txt_Date.Text = ""; txt_Amount.Text = ""; DDL_PaymentMethod.SelectedValue = "Select"; txt_CheckNo.Text = "";
        txt_CheckNo.Visible = stng_Check.Visible = false;
        Response.Redirect("RecivePayment.aspx");
    }
    protected void btnTempSave_Click(object sender, EventArgs e)
    {
        int i = ObjAdmin.ImportJob(txtJN.Text);
        txtJN.Text = "";
        BindAllData();
        Response.Write("<script>alert('Job Import Successfull !');</script>");
    }
}
