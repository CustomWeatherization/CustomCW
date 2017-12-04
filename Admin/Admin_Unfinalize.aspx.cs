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

public partial class Admin_Admin_Unfinalize : System.Web.UI.Page
{
    dc_Admin ObjAdmin = new dc_Admin();
    Dc_SearchJobbyAdmin objSearchJobAdmin = new Dc_SearchJobbyAdmin();
    public string Vndr = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getSubmitDate();
        }
    }

    public void getSubmitDate()
    {
        DataTable dt = objSearchJobAdmin.getSubmitDate();
        if (dt.Rows.Count > 0 && dt.Rows[0]["SubmitDate"].ToString() != "")
        {

            DateTime sbDt = Convert.ToDateTime((dt.Rows[0]["SubmitDate"]));
            string str_ = String.Format("{0:MM/dd/yyyy}", sbDt);
            txt_SubmitDate.Text = str_;
        }
        else
        {
            txt_SubmitDate.Text = "";
 
        }
    }

    protected void btn_unfinalize_Click(object sender, EventArgs e)
    {
        try
        {
            int i = ObjAdmin.UpdateSetUnfinalizeJob(JobNumber.Text);
            if (i > 0)
            {
                JobNumber.Text = "";
                Response.Write("<script>alert('Job Number is unfinalize. ');</script>");
            }
            else
            {
                Response.Write("<script>alert('Error! Job Number is not unfinalize. ');</script>");
            }
        }
        catch
        {

        }
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        if (chkAct129.Checked == false && chkAct129II.Checked == false && chkBaseLoad.Checked == false && chkFullCost.Checked == false && chkHighPriority.Checked == false && chkLowCost.Checked == false)
        {
            Response.Write("<script>alert('Please Select any Job Type for change');</script>");
        }
        else
        {
            int i = ObjAdmin.ChangeJobType(txtChangeJobType.Text, chkAct129.Checked, chkBaseLoad.Checked, chkHighPriority.Checked, chkFullCost.Checked, chkLowCost.Checked, chkAct129II.Checked);
            if (i == 1)
            {
                chkAct129.Checked = chkAct129II.Checked = chkBaseLoad.Checked = chkFullCost.Checked = chkHighPriority.Checked = chkLowCost.Checked = false;
                txtChangeJobType.Text = "";
                Response.Write("<script>alert('Your Job Type is change successfully. ');</script>");
            }
            else if (i == -1)
            {
                chkAct129.Checked = chkAct129II.Checked = chkBaseLoad.Checked = chkFullCost.Checked = chkHighPriority.Checked = chkLowCost.Checked = false;
                Response.Write("<script>alert('Error! Job Number is not Exist.');</script>");
            }
        }
    }
    protected void btnfind_Click(object sender, EventArgs e)
    {
        ShowDetail("find");
        //for vendor----  InvoiceNo=1&Jobs=Blevins&GT=Vendor&Back=DisplayJobSearchRecords
        //for other----  Back=Admin/Admin_Unfinalize&Jobs=bugbug&UC=PPL
    }

    protected void btnDeleteJob_Click(object sender, EventArgs e)
    {
        //objSearchJobAdmin.DeleteJobOrInvoice(txtJobNumber.Text, 0, "Job");
        ShowDetail("Inv");
    }
    protected void BtnAudit_Click(object sender, EventArgs e)
    {
        ShowDetail("Audit");
    }
    public void ShowDetail(string flag)
    {
        int Uid = 0;
        string role = "";
        smUtil objSm = new smUtil();
        Uid = Convert.ToInt32(objSm.GetCookie("UId"));
        role = objSm.GetCookie("Rol_Id");

        if (txtJobNumber.Text == "Job Number")
        {
            txtJobNumber.Text = "";
        }
        DataTable dt = objSearchJobAdmin.SearchJobByAdmin(txtJobNumber.Text, "");
        if (dt.Rows.Count > 0 && Convert.ToString(dt.Rows[0]["JobVendor"]) != "")
        {
            if (Convert.ToString(dt.Rows[0]["JobVendor"]) == "Vendor")
            {
                if (flag == "Inv")
                {
                    Vndr = "Inv";
                }
                flag = Convert.ToString(dt.Rows[0]["JobVendor"]);
            }
            else
            {
                Vndr = "";
            }
        }
        dt = objSearchJobAdmin.SearchJobByAdmin(txtJobNumber.Text, flag);
        if (dt.Rows.Count > 0)
        {
            if (flag == "find" || flag == "Vendor")
            {
                grdJobAudit.Visible = false;
                grdshowJob.Visible = false;
                GrdShowJobNumber.Visible = true;
                GrdShowJobNumber.DataSource = dt;
                GrdShowJobNumber.DataBind();
            }
            else if (flag == "Inv")
            {
                grdJobAudit.Visible = false;
                GrdShowJobNumber.Visible = false;
                grdshowJob.Visible = true;
                grdshowJob.DataSource = dt;
                grdshowJob.DataBind();
            }
            else if (flag == "Audit")
            {
                GrdShowJobNumber.Visible = false;
                grdshowJob.Visible = false;
                grdJobAudit.Visible = true;
                grdJobAudit.DataSource = dt;
                grdJobAudit.DataBind();
            }
        }
        // Use This Store "SearchJobs"
        else
        {
            if (role == "Admin" || role == "Usr_Adm")
            {
                GrdShowJobNumber.Visible = false;
                grdshowJob.Visible = false;
                txtJobNumber.Text = "";
                Response.Write("<script>alert('This Kind of Job does not exist.');</script>");
            }
        }
    }
    protected void grdshowJob_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string JobNumber = Convert.ToString(grdshowJob.DataKeys[e.RowIndex].Values[0].ToString());
        int InvoiceNo = Convert.ToInt32(grdshowJob.DataKeys[e.RowIndex].Values[1].ToString());
        objSearchJobAdmin.DeleteJobOrInvoice(JobNumber, InvoiceNo, "Inv");
        DataTable dt = objSearchJobAdmin.SearchJobByAdmin(JobNumber, "Inv");
        if (dt.Rows.Count > 0)
        {
            grdshowJob.DataSource = dt;
            grdshowJob.DataBind();
        }
    }
    protected void GrdShowJobNumber_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string JobNumber = Convert.ToString(GrdShowJobNumber.DataKeys[e.RowIndex].Values[0].ToString());
        objSearchJobAdmin.DeleteJobOrInvoice(JobNumber, 0, "Job");
        ShowDetail("find");
        txtJobNumber.Text = "";

    }
    protected void grdJobAudit_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string JobNumber = Convert.ToString(grdJobAudit.DataKeys[e.RowIndex].Values[0].ToString());
        objSearchJobAdmin.DeleteJobOrInvoice(JobNumber, 0, "Audit");
        DataTable dt_ = new DataTable();
        grdJobAudit.DataSource = dt_;
        grdJobAudit.DataBind();
    }
    protected void grdshowJob_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdshowJob.EditIndex = e.NewEditIndex;
        ShowDetail("Inv");
    }
    protected void grdshowJob_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //string JobNumber = Convert.ToString(grdshowJob.DataKeys[e.RowIndex].Values[0].ToString());
        //int InvoiceNo = Convert.ToInt32(grdshowJob.DataKeys[e.RowIndex].Values[1].ToString());
        //TextBox txt_G_SubmitDate = (TextBox)grdshowJob.Rows[e.RowIndex].FindControl("txt_G_SubmitDate");
        //objSearchJobAdmin.UpdateSubmitDate(JobNumber, InvoiceNo, txt_G_SubmitDate.Text);
        //grdshowJob.EditIndex = -1;
        //ShowDetail("Inv");
    }
    protected void grdshowJob_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdshowJob.EditIndex = -1;
        ShowDetail("Inv");
    }
    public string SetWedDate(object wedDate)
    {
        DateTime today = DateTime.Today;
        int day = Convert.ToInt32(today.DayOfWeek);
        if (day == 3 || day > 3)
        {
            today = today.AddDays(-(day - 3));
        }
        else
        {
            today = today.AddDays(-(day + 4));
        }
        return String.Format("{0:MM/dd/yyyy}", today);
    }
    protected void btnSubmitDate_Click(object sender, EventArgs e)
    {
        objSearchJobAdmin.UpdateSubmitDate(txt_SubmitDate.Text);
    }
    protected void GrdShowJobNumber_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            HiddenField HdnJobTypeVendor = (HiddenField)e.Row.FindControl("HdnJobTypeVendor");
            HyperLink hyprLnkUrlOther = (HyperLink)e.Row.FindControl("hyprLnkUrlOther");
            HyperLink HdnJobType = (HyperLink)e.Row.FindControl("hyprLnkUrlVendor");
            HyperLink hyprLnkUrlVendorInv = (HyperLink)e.Row.FindControl("hyprLnkUrlVendorInv");
            LinkButton lnk_Delete = (LinkButton)e.Row.FindControl("lnk_Delete");

            if (Vndr == "Inv")
            {
                HdnJobTypeVendor.Value = HdnJobTypeVendor.Value + Vndr;
            }

            if (HdnJobTypeVendor.Value == "")
            {
                hyprLnkUrlOther.Visible = true;
                HdnJobType.Visible = false;
                hyprLnkUrlVendorInv.Visible = false;
            }
            else if (HdnJobTypeVendor.Value == "Vendor")
            {
                hyprLnkUrlOther.Visible = false;
                HdnJobType.Visible = true;
                hyprLnkUrlVendorInv.Visible = false;
            }
            else if (HdnJobTypeVendor.Value == "VendorInv")
            {
                hyprLnkUrlOther.Visible = false;
                HdnJobType.Visible = false;
                hyprLnkUrlVendorInv.Visible = true;
                lnk_Delete.Visible = false;
            }
        }
    }
}
