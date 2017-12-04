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

public partial class SearchResultLname : System.Web.UI.Page
{
    dc_AddNewJob objAddJob = new dc_AddNewJob();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToString(Request.QueryString["lname"]) != null)
            {
                ShowAllRecord();
            }
            else if (Convert.ToString(Request.QueryString["Jname"]) != null)
            {
                ShowAllRecord_();
            }
        }
    }
    protected void grdLnameResult_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string JobNum = Convert.ToString(grdLnameResult.DataKeys[e.RowIndex].Values[0]);
        string UtilityCompany = Convert.ToString(grdLnameResult.DataKeys[e.RowIndex].Values[1]);
        if (JobNum != null && JobNum != "")
        {
            if (UtilityCompany == "Vendor")
            {
                Response.Redirect("home.aspx?GT=Vendor&JobNum=" + JobNum + "");
            }
            else
            {
                Response.Redirect("home.aspx?JobNum=" + JobNum + "");
            }
        }
    }
    protected void grdLnameResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdLnameResult.PageIndex = e.NewPageIndex;
        ShowAllRecord();
    }
    public void ShowAllRecord()
    {
        DataTable dt = new DataTable();
        if (Convert.ToString(Request.QueryString["flag"]) == "Vendor")
        {
            dt = objAddJob.ShowJobByLastName(Convert.ToString(Request.QueryString["lname"]), "Vendor");
        }
        else
        {
            dt = objAddJob.ShowJobByLastName(Convert.ToString(Request.QueryString["lname"]), "");
        }
        if (dt.Rows.Count > 0)
        {
            lblno.Text = Convert.ToString(dt.Rows.Count);
            grdLnameResult.DataSource = dt;
            grdLnameResult.DataBind();
        }
        else
        {
            lblno.Text = "0";
        }
    }

    public void ShowAllRecord_()
    {
        DataTable dt = new DataTable();
        if (Convert.ToString(Request.QueryString["flag"]) == "Vendor")
        {
            dt = objAddJob.ShowJobByName_(Convert.ToString(Request.QueryString["Jname"]));
        }
        if (dt.Rows.Count > 0)
        {
            lblno.Text = Convert.ToString(dt.Rows.Count);
            grdLnameResult.DataSource = dt;
            grdLnameResult.DataBind();
        }
        else
        {
            lblno.Text = "0";
        }
    }
}
