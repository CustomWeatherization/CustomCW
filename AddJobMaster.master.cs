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

public partial class AddJobMaster : System.Web.UI.MasterPage
{
    public string StrUserName = "";
    smUtil objSm = new smUtil();

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
        try
        {
            StrUserName = objSm.GetCookie("UserName");
            if (!IsPostBack)
            {

                string obj = objSm.GetCookie("UserId");



                if (obj == "")
                {
                    Response.Redirect("Login.aspx");
                }
                //objSm.GetCookie("UserFirstName");

            }
        }
        catch
        {
        }
    }


    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        try
        {
            objSm.DeleteCookie("UId");
            objSm.DeleteCookie("UserId");
            objSm.DeleteCookie("UserName");
            Response.Redirect("Login.aspx");
        }
        catch
        {
        }
    }

    protected void LnkAudit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToString(Request.QueryString["Jobs"]) != "" && Convert.ToString(Request.QueryString["UC"]) != "")
            {
                string Utility = "";
                if (Convert.ToString(Request.QueryString["UC"]) == "PPL")
                {
                    Utility = "2";
                    Response.Redirect("~/PPLAudit/PPL_Audit_1.aspx?InvoiceNo=" + Convert.ToString(Request.QueryString["InvoiceNo"]) + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
                }
                else if (Convert.ToString(Request.QueryString["UC"]) == "MET ED")
                {
                    Utility = "1";
                    Response.Redirect("~/METED/METED_Audit_Page1.aspx?InvoiceNo=" + Convert.ToString(Request.QueryString["InvoiceNo"]) + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
                }
                else
                {
                    Response.Redirect("Home.aspx");
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

    protected void LnkInvoice_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToString(Request.QueryString["Jobs"]) != "" && Convert.ToString(Request.QueryString["UC"]) != "")
            {
                string Utility = "";
                if (Convert.ToString(Request.QueryString["UC"]) == "PPL")
                {
                    Utility = "2";
                }
                else if (Convert.ToString(Request.QueryString["UC"]) == "MET ED")
                {
                    Utility = "1";
                }
                else if (Convert.ToString(Request.QueryString["UC"]) == "DCED")
                {
                    Utility = "3";
                }
                else if (Convert.ToString(Request.QueryString["UC"]) == "BCOC")
                {
                    Utility = "9";
                }
                else if (Convert.ToString(Request.QueryString["UC"]) == "PRIVATE CUSTOMER")
                {
                    Utility = "7";
                }

                else
                {
                    Response.Redirect("Home.aspx");
                }
                Response.Redirect("DisplayJobSearchRecords.aspx?InvoiceNo=" + Convert.ToString(Request.QueryString["InvoiceNo"]) + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);

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
