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
using System.Collections.Generic;
using System.Data;
using Ionic.Zip;

public partial class PPLAudit_PPL_ImagesPopup : System.Web.UI.Page
{
    dcPPLAudit obj_dcPPLAudit = new dcPPLAudit();
    public DataTable dtimg = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dtimg = new DataTable();
            string jobnumber = Convert.ToString(Request.QueryString["Jobs"]);
            //string Utility=Convert.ToString(Request.QueryString[""]);
            if (jobnumber != null && jobnumber != "")
            {
                dtimg = obj_dcPPLAudit.GetPPL_PhotoPage(jobnumber, "PPL");
            }
            if (dtimg.Rows.Count > 0)
            {
                DTLimages.DataSource = dtimg;
                DTLimages.DataBind();
            }
        }
    }


    protected void btnDAll_Click(object sender, EventArgs e)
    {
        string jobnum = Convert.ToString(Request.QueryString["Jobs"]);
        DataTable dt = obj_dcPPLAudit.SelectPPLPhotoPageTop24_Change(jobnum);
        try
        {
            if (dt.Rows.Count > 0)
            {

                using (ZipFile zip = new ZipFile())
                {
                    zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                    zip.AddDirectoryByName("Files");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string filename = Convert.ToString(dt.Rows[i]["PhotoName"]);
                        string filepath = Server.MapPath(@"~\PPLAudit\Photo_Page_Images\" + filename);
                        zip.AddFile(filepath, "Files");
                    }

                    Response.Clear();
                    Response.BufferOutput = false;
                    string zipName = String.Format("Jobnumber-" + jobnum + "_Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                    Response.ContentType = "application/zip";
                    Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
                    zip.Save(Response.OutputStream);
                    Response.End();
                }


            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);

        }

    }

    protected void btnDSelected_Click(object sender, EventArgs e)
    {
        try
        {
            using (ZipFile zip = new ZipFile())
            {

                zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                zip.AddDirectoryByName("Files");
                foreach (DataListItem item in DTLimages.Items)
                {
                    CheckBox CBimg = (CheckBox)item.FindControl("CBimg");

                    if (CBimg.Checked == true)
                    {
                        string filename = CBimg.Text;
                        string filepath = Server.MapPath(@"~\PPLAudit\Photo_Page_Images\" + filename);
                        zip.AddFile(filepath, "Files");
                    }
                }

                Response.Clear();
                Response.BufferOutput = false;
                string zipName = String.Format("Jobnumber-" + Convert.ToString(Request.QueryString["Jobs"]) + "_Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                Response.ContentType = "application/zip";
                Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
                zip.Save(Response.OutputStream);
                Response.End();
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);

        }
    }
}
