using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class METED_METED_Audit_Page13 : System.Web.UI.Page
{
    dcPPLAudit obj_dcPPLAudit = new dcPPLAudit();
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_13(JobNum);
            if (dt.Rows.Count > 0)
            {
                txt_Line1_Other.Text = Convert.ToString(dt.Rows[0]["Line1Other"]);
                txt_Line2_Other.Text = Convert.ToString(dt.Rows[0]["Line2Other"]);
                txt_Line3_Other.Text = Convert.ToString(dt.Rows[0]["Line3Other"]);
                txt_Line4_Other.Text = Convert.ToString(dt.Rows[0]["Line4Other"]);
                txt_Line15_Other.Text = Convert.ToString(dt.Rows[0]["Line5Other"]);
            }

            DataTable dtpic = obj_dcPPLAudit.GetPPL_PhotoPage(JobNum, "METED");
            if (dtpic.Rows.Count > 0)
            {
                for(int i=0;i<=dtpic.Rows.Count;i++)
                {
                    if (Convert.ToString(dtpic.Rows[i]["ImageFor"]) == "Attic")
                    {
                        // attic.Style["background-image"] = "../NewMETED/Photo_Page_Images1/'" + dtpic.Rows[i]["PhotoName"] + "'";
                        //attic.Attributes.Add("display", "none");
                        //attic. = "../NewMETED/Photo_Page_Images1/'" + dtpic.Rows[i]["PhotoName"] + "'";
                        attic.Style.Add("background-image", "/NewMETED/Photo_Page_Images1/"+dtpic.Rows[i]["PhotoName"]+"");
                        attic.Style.Add(" background-size", "contain");
                        // attic.Style["background-image"] = Page.ResolveUrl("../NewMETED/Photo_Page_Images1/'"+dtpic.Rows[i]["PhotoName"] +"'");
                    }
                    else if (Convert.ToString(dtpic.Rows[i]["ImageFor"]) == "1Floor")
                    {
                        Floor1.Style.Add("background-image", "/NewMETED/Photo_Page_Images1/"+dtpic.Rows[i]["PhotoName"]+"");
                       // Floor1.Attributes.Add("class", "groupbox");
                        // Floor1.ImageUrl = "~/NewMETED/Photo_Page_Images1/'" + dtpic.Rows[i]["PhotoName"] + "'";
                       // Floor1.Style["background-image"] = Page.ResolveUrl("../NewMETED/Photo_Page_Images1/'" + dtpic.Rows[i]["PhotoName"] + "'");
                    }
                    else if (Convert.ToString(dtpic.Rows[i]["ImageFor"]) == "2Floor")
                    {
                        Floor2.Style.Add("background-image", "/NewMETED/Photo_Page_Images1/" + dtpic.Rows[i]["PhotoName"]+"");
                        // Floor2.Style["background-image"] = "../NewMETED/Photo_Page_Images1/'" + dtpic.Rows[i]["PhotoName"] + "'";
                        // Floor2.Attributes.Add("class", "groupbox");
                        //Floor2.ImageUrl = "~/NewMETED/Photo_Page_Images1/'" + dtpic.Rows[i]["PhotoName"] + "'";
                        //Floor2.Style["background-image"] = Page.ResolveUrl("../NewMETED/Photo_Page_Images1/'" + dtpic.Rows[i]["PhotoName"] + "'");
                    }
                    else if (Convert.ToString(dtpic.Rows[i]["ImageFor"]) == "Bathroom")
                    {
                        Basement.Style.Add("background-image", "/NewMETED/Photo_Page_Images1/" + dtpic.Rows[i]["PhotoName"] + "");
                        //Basement.Style["background-image"] = "../NewMETED/Photo_Page_Images1/'" + dtpic.Rows[i]["PhotoName"] + "'";
                        //Basement.Attributes.Add("class", "groupbox");
                        //Basement.ImageUrl = "~/NewMETED/Photo_Page_Images1/'" + dtpic.Rows[i]["PhotoName"] + "'";
                        //  Basement.Style["background-image"] = Page.ResolveUrl("../NewMETED/Photo_Page_Images1/'" + dtpic.Rows[i]["PhotoName"] + "'");
                    }
                }
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
            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_13(JobNum, txt_Line1_Other.Text, txt_Line2_Other.Text, txt_Line3_Other.Text, txt_Line4_Other.Text, txt_Line15_Other.Text);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }
   

}
