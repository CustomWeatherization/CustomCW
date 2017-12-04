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

public partial class JobStatusMenu : System.Web.UI.Page
{
    dc_JobStatus objDcJobsStatus = new dc_JobStatus();
    public DataTable dt_jobMenu = new DataTable();
    public DataTable dt_jobPPLZ1 = new DataTable();
    public DataTable dt_jobPPLZ2 = new DataTable();
    public DataTable dt_jobPPLZ3 = new DataTable();
    public DataTable dt_jobvendor = new DataTable();
    dc_JobStatus objJobStatus = new dc_JobStatus();
    public DataTable dt_AllJob = new DataTable();
    public int AllJob = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["vendoreJob"] != null)
            {
                string Vendor = Convert.ToString(Request.QueryString["vendoreJob"]);
                if (Vendor == "Vendor")
                {
                    VendorJob.Visible = true;
                    DataSet ds1 = objDcJobsStatus.ShowJobVendor();
                    if (ds1.Tables.Count > 0)
                    {
                        dt_jobvendor = (ds1.Tables[0]);
                        JobStatus.Visible = false;
                    }
                }
            }
            else
            {
                JobStatus.Visible = true;
                VendorJob.Visible = false;
                FunShowUtilityCompany();
            }
           
        }
    }

    public void FunShowUtilityCompany()
    {
        try
        {
            DataSet ds = objDcJobsStatus.ShowJobStatus();
            dt_jobMenu = (ds.Tables[1]);
            dt_jobPPLZ1 = (ds.Tables[2]);
            dt_jobPPLZ2 = (ds.Tables[3]);
            dt_jobPPLZ3 = (ds.Tables[4]);
          
            ShowAllJob();
        }
        catch (Exception ex)
        {
        }
    }
    public void ShowAllJob()
    {
        try
        {
            DataSet ds = objJobStatus.ShowJobStatus();
            dt_AllJob = (ds.Tables[0]);
            if (dt_AllJob.Rows.Count > 0)
            {
                for (int i = 0; i < dt_AllJob.Rows.Count; i++)
                {
                    AllJob = Convert.ToInt32(AllJob + Convert.ToInt32(dt_AllJob.Rows[i]["NumberofJobs"]));
                }
            }
        }
        catch
        {
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}
