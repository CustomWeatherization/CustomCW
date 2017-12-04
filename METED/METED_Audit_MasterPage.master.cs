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

public partial class METED_METED_Audit_MasterPage : System.Web.UI.MasterPage
{
    public string StrUserName = "";
    smUtil objSm = new smUtil();
    Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
    protected void Page_Load(object sender, EventArgs e)
    {
        //tanveer
        lnk_admin.Visible = true;
        smUtil objSm = new smUtil();
        string role = "";
        role = objSm.GetCookie("Rol_Id");
        if (role == "User")
        {
            lnk_admin.Visible = false;
        }
        //end
        StrUserName = objSm.GetCookie("UserName");
        try
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Jobs"] == null)
                {

                    Response.Redirect("../Home.aspx");
                }
                else if (Request.QueryString["Utility"] == null)
                {
                    Response.Redirect("../Home.aspx");
                }

            }
        }
        catch
        {
        }
        Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
        smUtil objsmutil = new smUtil();
        int AId = Convert.ToInt32(objsmutil.GetCookie("AId"));
        DataTable dtF = objInvoice.ChkInvoiceAuditFinalize(Convert.ToString(Request.QueryString["Jobs"]), Convert.ToInt32(Request.QueryString["Utility"]), AId, Convert.ToInt32(Request.QueryString["InvoiceNo"]));
        if (dtF.Rows.Count > 0)
        {
            //DataTable dt_Invoice = objInvoice.SearchTotalInvoice(txtJobNumber.Text);
            //string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());

            if (Convert.ToString(dtF.Rows[0]["finalize"]) == "F" && Convert.ToString(objsmutil.GetCookie("Rol_Id")) != "Admin")
            {
                Session["finalize"] = "F";
                DisableControls(Page, false);
            }
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


    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        objSm.DeleteCookie("UId");
        objSm.DeleteCookie("UserId");
        objSm.DeleteCookie("UserName");
        Response.Redirect("../Login.aspx");
    }

    protected void LnkInvoice_Click(object sender, EventArgs e)
    {
        DataTable dt_Invoice = objInvoice.SearchTotalInvoice(Request.QueryString["jobs"].ToString());
        //int invoice = Convert.ToInt32(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
        string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
        if (IncoiceNo == "")
        {
            IncoiceNo = "1";
        }
        Response.Redirect("../DisplayJobSearchRecords.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
    }

}
