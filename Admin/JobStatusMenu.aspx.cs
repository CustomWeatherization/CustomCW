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

public partial class Admin_JobStatusMenu : System.Web.UI.Page
{
    //dc_JobStatus objDcJobsStatus = new dc_JobStatus();
    //public DataTable dt_jobMenu = new DataTable();
    dc_JobStatus objDcJobsStatus = new dc_JobStatus();
    public DataTable dt_jobMenu = new DataTable();
    public DataTable dt_jobPPLZ1 = new DataTable();
    public DataTable dt_jobPPLZ2 = new DataTable();
    dc_JobStatus objJobStatus = new dc_JobStatus();
    public DataTable dt_AllJob = new DataTable();
    public int AllJob = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FunShowUtilityCompany();
        }
    }


    public void FunShowUtilityCompany()
    {
        try
        {
            //DataSet ds=objDcJobsStatus.ShowJobStatus();
            //dt_jobMenu = ds.Tables[0];

            DataSet ds = objDcJobsStatus.Show_JobStatus();
            dt_jobMenu = (ds.Tables[1]);
            dt_jobPPLZ1 = (ds.Tables[2]);
            dt_jobPPLZ2 = (ds.Tables[3]);
            ShowAllJob();
        }
        catch
        {

        }

    }

    public void ShowAllJob()
    {
        try
        {
            DataSet ds = objJobStatus.Show_JobStatus();
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
    protected void btn_ReceivePayment_Click(object sender, EventArgs e)
    {
        Response.Redirect("RecivePayment.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

}
