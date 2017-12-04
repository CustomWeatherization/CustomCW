using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class PPLAudit_PPLMasterPage : System.Web.UI.MasterPage
{
    public string StrUserName = "";
    smUtil objSm = new smUtil();
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
    Dc_AddORManageInvoice objInvoice1 = new Dc_AddORManageInvoice();
    public DataTable dtInvoice = new DataTable();


    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dtU = objNewJob.ShowJobByJobNumber_ByJobNumber(Convert.ToString(Request.QueryString["Jobs"]));
        dtInvoice = objInvoice1.SearchTotalInvoice(Convert.ToString(Request.QueryString["Jobs"]));

       if (dtU.Rows.Count > 0 && !DBNull.Value.Equals(dtU.Rows[0]["Inspection"]))
       {
           if (dtU.Rows[0]["Inspection"].ToString() != null && Convert.ToBoolean(dtU.Rows[0]["Inspection"]) == true)
           {
               Audit.Visible = false;
               Inspection.Visible = true;
               Quick_Link.Visible = false;
               Main_right.Style.Add("Width", "99%");

               //btnCamera.Visible = false;
           }
           else
           {
               Audit.Visible = true;
               Inspection.Visible = false;
               

           }
           
       }
       else
       {
           Audit.Visible = true;
           Inspection.Visible = false;
           
       }
        //tanveer
        hid_link.Visible = true;
        smUtil objSm = new smUtil();
        string role = "";
        role = objSm.GetCookie("Rol_Id");
        if (role == "User")
        {

            hid_link.Visible = false;
        }
        //end
        StrUserName = objSm.GetCookie("UserName");
        try
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Jobs"] != null)
                {
                    if (Request.QueryString["Utility"] != null)
                    {
                        if (Request.QueryString["Jobs"].ToString() != "")
                        {
                            string JobNum = Request.QueryString["Jobs"].ToString();
                            JobNumber.InnerText = JobNum;
                            JobNumber1.InnerText = JobNum;
                        }
                    }
                    else
                    {
                        Response.Redirect("../Home.aspx");
                    }
                }
                else
                {
                    Response.Redirect("../Home.aspx");
                }

            }
            //if (Request.UserAgent.Contains("Chrome"))
            //{
            //    Quick_Link.Attributes.Add("style", "position: fixed;top: 65px;z-index: 100;text-align: center;margin-left: 27%;");
            //}
        }
        catch
        {
        }
        Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
        smUtil objsmutil = new smUtil();
        int AId = Convert.ToInt32(objsmutil.GetCookie("AId"));
        DataTable dtF = objInvoice.ChkInvoiceAuditFinalize(Convert.ToString(Request.QueryString["Jobs"]), Convert.ToInt32(Request.QueryString["Utility"]), AId, Convert.ToInt32(0));
        if (dtF.Rows.Count > 0)
        {
            if (Convert.ToString(dtF.Rows[0]["finalize"]) == "F" && Convert.ToString(objsmutil.GetCookie("Rol_Id")) != "Admin")
            {
                Session["finalize"] = "F";
                DisableControls(Page, false);
            }
        }
        else
        {
            Session["finalize"] = null;
        }
    }


    protected void DisableControls(Control parent, bool State)
    {
        foreach (Control c in parent.Controls)
        {
            if (c is TextBox)
            {
                ((TextBox)(c)).ReadOnly = true;
            }
            else if (c is CheckBox)
            {
                ((CheckBox)(c)).Enabled = false;
            }
            else if (c is DropDownList)
            {
                ((DropDownList)(c)).Enabled = false;
            }

            DisableControls(c, State);
        }
    }

    protected void LnkAudit_Click(object sender, EventArgs e)
    { 

       if(Inspection.Visible == true|| Audit.Visible == false)
       {
           Response.Redirect("../PPLAudit/PPL_Inspection.aspx?InvoiceNo=" + Convert.ToString(Request.QueryString["InvoiceNo"]) + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Request.QueryString["Utility"].ToString());
       }
       else if (Inspection.Visible == false || Audit.Visible == true)
       {
           Response.Redirect("../PPLAudit/PPL_Audit_1.aspx?InvoiceNo=" + Convert.ToString(Request.QueryString["InvoiceNo"]) + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Request.QueryString["Utility"].ToString());
       }
       else
       {

       }
    }
    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        objSm.DeleteCookie("UId");
        objSm.DeleteCookie("UserId");
        objSm.DeleteCookie("UserName");
        Response.Redirect("../Login.aspx");
    }
    protected void LnkInvoice_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToString(Request.QueryString["Jobs"]) != "" && Convert.ToString(Request.QueryString["Utility"]) != "")
            {
                DataTable dt = new DataTable();
                dt = objNewJob.GetJobTypeForInvoice(Convert.ToString(Request.QueryString["Jobs"]));
                if (dt.Rows.Count > 0)
                {
                    DataTable dt_Invoice = objInvoice.SearchTotalInvoice(Request.QueryString["jobs"].ToString());
                    //int invoice = Convert.ToInt32(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
                    string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
                    if (IncoiceNo == "")
                    {
                        IncoiceNo = "1";
                    }
                    if (Convert.ToBoolean(dt.Rows[0]["Act129"]) == true || Convert.ToBoolean(dt.Rows[0]["BaseLoadOnly"]) == true || Convert.ToBoolean(dt.Rows[0]["HighPriority"]) == true || Convert.ToBoolean(dt.Rows[0]["FullCost"]) == true || Convert.ToBoolean(dt.Rows[0]["LowCost"]) == true)
                    {
                        //Response.Redirect("~/PPLAudit/PPL_Invoice_Page1.aspx?Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Convert.ToString(Request.QueryString["Utility"]));
                        Response.Redirect("../DisplayJobSearchRecords.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Request.QueryString["Utility"].ToString());
                    }
                    else if (Convert.ToBoolean(dt.Rows[0]["Act129II"]) == true)
                    {
                        //Response.Redirect("~/PPLAudit/Act129_II_PPL_InvoicePage1.aspx?Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Convert.ToString(Request.QueryString["Utility"]));
                        Response.Redirect("../DisplayJobSearchRecords.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Request.QueryString["Utility"].ToString());
                    }
                    else
                    {
                        Response.Redirect("../DisplayJobSearchRecords.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Request.QueryString["Utility"].ToString());
 
                    }
                }
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
        catch
        {
        }
    }
}
