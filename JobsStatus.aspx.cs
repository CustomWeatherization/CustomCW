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

public partial class JobsStatus : System.Web.UI.Page
{
    dc_JobStatus objDcJobsStatus = new dc_JobStatus();
    public DataTable dtRed = new DataTable();
    public DataTable dtGreen = new DataTable();
    public DataTable dtBlue = new DataTable();
    dc_JobStatus objjobStatus = new dc_JobStatus();
    public DataTable dt_jobMenu = new DataTable();
    public DataTable dt_jobPPLZ1 = new DataTable();
    public DataTable dt_jobPPLZ2 = new DataTable();
    public DataTable dt_jobPPLZ3 = new DataTable();
    public string JobType = "";

    public static string Bubble = "";

    string UCompanyName = "";
    DataTable dt = new DataTable();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["UC"] != null)
        {


            if (!IsPostBack)
            {
                UCompanyName = Request.QueryString["UC"].ToString();
                if (UCompanyName == "All")
                {
                    FunShowUtilityCompany();
                }
                //Bubble = "All";
                else
                {
                    showDataByJobCompany(UCompanyName);
                }
            }
        }
    }


    private DataTable BindGridView(string StrCompany)
    {
        dt = objDcJobsStatus.ShowJob_byCompnayUtility(StrCompany);
        return dt;
    }

    public SortDirection dir
    {
        get
        {
            if (ViewState["dirState"] == null)
            {
                ViewState["dirState"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["dirState"];
        }
        set
        {
            ViewState["dirState"] = value;
        }
    }


    protected void gvrecords_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sortingDirection = string.Empty;
        if (dir == SortDirection.Ascending)
        {
            dir = SortDirection.Descending;
            sortingDirection = "Desc";
        }
        else
        {
            dir = SortDirection.Ascending;
            sortingDirection = "Asc";
        }

        DataView sortedView = new DataView();

        if (Convert.ToString(Request.QueryString["UC"]) == "All")
        {
            sortedView = new DataView((DataTable)Session["dtAll"]);
        }
        else
        {
            sortedView = new DataView((DataTable)Session["dt"]);
        }


        sortedView.Sort = e.SortExpression + " " + sortingDirection;
        gvrecords.DataSource = sortedView;
        gvrecords.DataBind();
    }

    public void FunShowUtilityCompany()
    {
        try
        {
            DataTable dtall = new DataTable();
            Session["dtAll"] = dtall;
            DataSet ds = objDcJobsStatus.ShowJobStatus();
            dt_jobMenu = (ds.Tables[1]);
            dt_jobPPLZ1 = (ds.Tables[2]);
            dt_jobPPLZ2 = (ds.Tables[3]);
            dt_jobPPLZ3 = (ds.Tables[4]);

            for (int i = 0; i < dt_jobMenu.Rows.Count; i++)
            {
                dtall = (DataTable)Session["dtAll"];
                string utlity = dt_jobMenu.Rows[i]["UtilityCompany"].ToString();
                DataTable dt = objjobStatus.ShowJob_byCompnayUtility(utlity);
                dtall.Merge(dt);
                Session["dtAll"] = dtall;
            }
            for (int i = 0; i < dt_jobPPLZ1.Rows.Count; i++)
            {
                dtall = (DataTable)Session["dtAll"];
                string utlity = dt_jobPPLZ1.Rows[i]["UtilityCompany"].ToString();
                DataTable dt = objjobStatus.ShowJob_byCompnayUtility(utlity);
                dtall.Merge(dt);
                Session["dtAll"] = dtall;
            }
            for (int i = 0; i < dt_jobPPLZ2.Rows.Count; i++)
            {
                dtall = (DataTable)Session["dtAll"];
                string utlity = dt_jobPPLZ2.Rows[i]["UtilityCompany"].ToString();
                DataTable dt = objjobStatus.ShowJob_byCompnayUtility(utlity);
                dtall.Merge(dt);
                Session["dtAll"] = dtall;
            }
            for (int i = 0; i < dt_jobPPLZ3.Rows.Count; i++)
            {
                dtall = (DataTable)Session["dtAll"];
                string utlity = dt_jobPPLZ3.Rows[i]["UtilityCompany"].ToString();
                DataTable dt = objjobStatus.ShowJob_byCompnayUtility(utlity);
                dtall.Merge(dt);
                Session["dtAll"] = dtall;
            }
            dtall.Columns.Add("Contact_DateTime", typeof(DateTime));
            for (int i = 0; i < dtall.Rows.Count; i++)
            {
                string da_te = Convert.ToString(dtall.Rows[i]["ContactDateTime"]);
                if (da_te == "")
                {
                    da_te = "1900-01-01 00:00:00.000";
                }
                dtall.Rows[i]["Contact_DateTime"] = Convert.ToDateTime(da_te);
            }
            Session["dtAll"] = dtall;

            gvrecords.DataSource = ArrengeRedBlueGreenDt(dtall);//DtAllFilter;
            gvrecords.DataBind();
        }
        catch (Exception ex)
        {
        }
    }

    public string RemoveComma(object JobType)
    {
        string JobType_ = Convert.ToString(JobType);
        JobType_ = JobType_.TrimStart(',');
        return JobType_;
    }

    public void showDataByJobCompany(string StrCompany)
    {
        try
        {
            DataTable dt_ = new DataTable();
            dt_ = objjobStatus.ShowJob_byCompnayUtility(StrCompany);

            dt_.Columns.Add("Contact_DateTime", typeof(DateTime));
            for (int i = 0; i < dt_.Rows.Count; i++)
            {
                string da_te = Convert.ToString(dt_.Rows[i]["ContactDateTime"]);
                if (da_te == "")
                {
                    da_te = "1900-01-01 00:00:00.000";
                }
                dt_.Rows[i]["Contact_DateTime"] = Convert.ToDateTime(da_te);
            }


            gvrecords.DataSource = ArrengeRedBlueGreenDt(dt_);
            gvrecords.DataBind();
        }
        catch (Exception ex)
        {
        }
    }



    public DataTable ArrengeRedBlueGreenDt(DataTable DT_RBG)
    {

        Session["dt"] = DT_RBG;


        DataTable dt = new DataTable();
        DataTable dtGoBack = new DataTable();
        DataTable dtWOGoBack = new DataTable();



        //red

        dtRed.Clear();
        dt = (DataTable)Session["dt"];
        dtGoBack = (DataTable)Session["dt"];
        dtWOGoBack = (DataTable)Session["dt"];

        DateTime now = DateTime.Now;
        DataView dv = new DataView(dt);
        DataView dvGoBack = new DataView(dtGoBack);
        DataView dvWOGoBack = new DataView(dtWOGoBack);
        DateTime expiryDate = now.AddDays(-30);
        string strDate = expiryDate.ToString();
        strDate = "'" + strDate + "'";
        dv.RowFilter = "Status <> 'Go Back' And (DateAssigned <" + strDate + ")";
        dvGoBack.RowFilter = "Status = 'Go Back' And (Contact_DateTime <" + strDate + ")";
        dvWOGoBack.RowFilter = "Status IS NULL And (DateAssigned <" + strDate + ")";
        dt = dv.ToTable(); dtGoBack = dvGoBack.ToTable(); dtWOGoBack = dvWOGoBack.ToTable();
        dtRed.Merge(dt);
        dtRed.Merge(dtGoBack);
        dtRed.Merge(dtWOGoBack);

        //blue

        dt = (DataTable)Session["dt"];
        dtGoBack = (DataTable)Session["dt"];
        dtWOGoBack = (DataTable)Session["dt"];

        dv = new DataView(dt);
        DataView dvGoback = new DataView(dtGoBack);
        DataView dvWOGoback = new DataView(dtWOGoBack);
        DateTime SecondDate = now.AddDays(-15);
        DateTime FirstDate = now.AddDays(-30);
        string StrFirst = "";
        StrFirst = SecondDate.ToString();
        StrFirst = "'" + StrFirst + "'";
        string strLast = FirstDate.ToString();
        strLast = "'" + strLast + "'";
        dv.RowFilter = "Status <> 'Go Back' And (DateAssigned <" + StrFirst + " and DateAssigned >=" + strLast + ")";
        dvGoback.RowFilter = "Status = 'Go Back' And (Contact_DateTime <" + StrFirst + " and Contact_DateTime >=" + strLast + ")";
        dvWOGoback.RowFilter = "Status IS NULL And (DateAssigned <" + StrFirst + " and DateAssigned >=" + strLast + ")";
        dt = dv.ToTable(); dtGoBack = dvGoback.ToTable(); dtWOGoBack = dvWOGoback.ToTable();
        dtBlue.Merge(dt);
        dtBlue.Merge(dtGoBack);
        dtBlue.Merge(dtWOGoBack);

        //green

        dt = (DataTable)Session["dt"];
        dtGoBack = (DataTable)Session["dt"];
        dtWOGoBack = (DataTable)Session["dt"];

        dv = new DataView(dt);
        dvGoBack = new DataView(dtGoBack);
        dvWOGoBack = new DataView(dtWOGoBack);
        DateTime SeconDate = now.AddDays(-15);
        StrFirst = "";
        strLast = "";
        StrFirst = now.AddDays(-15).ToString();
        StrFirst = SeconDate.ToString();
        StrFirst = "'" + StrFirst + "'";
        strLast = now.ToString();
        strLast = "'" + strLast + "'";
        dv.RowFilter = "Status <> 'Go Back' And (DateAssigned >" + StrFirst + " And DateAssigned <=" + strLast + ")";
        dvGoBack.RowFilter = "Status = 'Go Back' And (Contact_DateTime >" + StrFirst + " and Contact_DateTime <=" + strLast + ")";
        dvWOGoBack.RowFilter = "Status IS NULL And (DateAssigned >" + StrFirst + " and DateAssigned <=" + strLast + ")";
        dt = dv.ToTable(); dtGoBack = dvGoBack.ToTable(); dtWOGoBack = dvWOGoBack.ToTable();
        dtGreen.Merge(dt);
        dtGreen.Merge(dtGoBack);
        dtGreen.Merge(dtWOGoBack);

        DT_RBG.Clear();
        DT_RBG.Merge(dtRed);
        DT_RBG.Merge(dtBlue);
        DT_RBG.Merge(dtGreen);

        return DT_RBG;
    }

    public void ShowRed()
    {
        dtRed.Clear();
        DataTable dt = new DataTable();
        DataTable dtGoBack = new DataTable();
        DataTable dtWOGoBack = new DataTable();
        if (Request.QueryString["UC"].ToString() == "All")
        {
            FunShowUtilityCompany();
            dtRed.Clear();
            dt = (DataTable)Session["dtAll"];
            dtGoBack = (DataTable)Session["dtAll"];
            dtWOGoBack = (DataTable)Session["dtAll"];
        }
        else
        {
            dt = (DataTable)Session["dt"];
            dtGoBack = (DataTable)Session["dt"];
            dtWOGoBack = (DataTable)Session["dt"];
        }
        DateTime now = DateTime.Now;
        DataView dv = new DataView(dt);
        DataView dvGoBack = new DataView(dtGoBack);
        DataView dvWOGoBack = new DataView(dtWOGoBack);
        DateTime expiryDate = now.AddDays(-30);
        string strDate = expiryDate.ToString();
        strDate = "'" + strDate + "'";
        dv.RowFilter = "Status <> 'Go Back' And (DateAssigned <" + strDate + ")";
        dvGoBack.RowFilter = "Status = 'Go Back' And (Contact_DateTime <" + strDate + ")";
        dvWOGoBack.RowFilter = "Status IS NULL And (DateAssigned <" + strDate + ")";
        dt = dv.ToTable(); dtGoBack = dvGoBack.ToTable(); dtWOGoBack = dvWOGoBack.ToTable();
        dtRed.Merge(dt);
        Session["dt"] = dtRed;
        Session["dtAll"] = dtRed;
        dtRed.Merge(dtGoBack);
        dtRed.Merge(dtWOGoBack);
        gvrecords.DataSource = dtRed;
        gvrecords.DataBind();
    }

    public void ShowGreen()
    {
        dtGreen.Clear();
        DataTable dt = new DataTable();
        DataTable dtGoBack = new DataTable();
        DataTable dtWOGoBack = new DataTable();
        if (Request.QueryString["UC"].ToString() == "All")
        {
            FunShowUtilityCompany();
            dtGreen.Clear();
            dt = (DataTable)Session["dtAll"];
            dtGoBack = (DataTable)Session["dtAll"];
            dtWOGoBack = (DataTable)Session["dtAll"];
        }
        else
        {
            dt = (DataTable)Session["dt"];
            dtGoBack = (DataTable)Session["dt"];
            dtWOGoBack = (DataTable)Session["dt"];
        }
        DateTime now = DateTime.Now;
        DataView dv = new DataView(dt);
        DataView dvGoBack = new DataView(dtGoBack);
        DataView dvWOGoBack = new DataView(dtWOGoBack);
        DateTime SeconDate = now.AddDays(-15);
        string StrFirst = "";
        string strLast = "";
        StrFirst = now.AddDays(-15).ToString();
        StrFirst = SeconDate.ToString();
        StrFirst = "'" + StrFirst + "'";
        strLast = now.ToString();
        strLast = "'" + strLast + "'";
        dv.RowFilter = "Status <> 'Go Back' And (DateAssigned >" + StrFirst + " And DateAssigned <=" + strLast + ")";
        dvGoBack.RowFilter = "Status = 'Go Back' And (Contact_DateTime >" + StrFirst + " and Contact_DateTime <=" + strLast + ")";
        dvWOGoBack.RowFilter = "Status IS NULL And (DateAssigned >" + StrFirst + " and DateAssigned <=" + strLast + ")";
        dt = dv.ToTable(); dtGoBack = dvGoBack.ToTable(); dtWOGoBack = dvWOGoBack.ToTable();
        dtGreen.Merge(dt);
        dtGreen.Merge(dtGoBack);
        dtGreen.Merge(dtWOGoBack);
        Session["dt"] = dtGreen;
        Session["dtAll"] = dtGreen;
        gvrecords.DataSource = dtGreen;
        gvrecords.DataBind();
    }


    public void ShowBlue()
    {
        dtBlue.Clear();
        DataTable dt = new DataTable();
        DataTable dtGoBack = new DataTable();
        DataTable dtWOGoBack = new DataTable();
        if (Request.QueryString["UC"].ToString() == "All")
        {
            FunShowUtilityCompany();
            dtBlue.Clear();
            dt = (DataTable)Session["dtAll"];
            dtGoBack = (DataTable)Session["dtAll"];
            dtWOGoBack = (DataTable)Session["dtAll"];
        }
        else
        {
            dt = (DataTable)Session["dt"];
            dtGoBack = (DataTable)Session["dt"];
            dtWOGoBack = (DataTable)Session["dt"];
        }
        DateTime now = DateTime.Now;
        DataView dv = new DataView(dt);
        DataView dvGoback = new DataView(dtGoBack);
        DataView dvWOGoback = new DataView(dtWOGoBack);
        DateTime SecondDate = now.AddDays(-15);
        DateTime FirstDate = now.AddDays(-30);
        string StrFirst = "";
        StrFirst = SecondDate.ToString();
        StrFirst = "'" + StrFirst + "'";
        string strLast = FirstDate.ToString();
        strLast = "'" + strLast + "'";
        dv.RowFilter = "Status <> 'Go Back' And (DateAssigned <" + StrFirst + " and DateAssigned >=" + strLast + ")";
        dvGoback.RowFilter = "Status = 'Go Back' And (Contact_DateTime <" + StrFirst + " and Contact_DateTime >=" + strLast + ")";
        dvWOGoback.RowFilter = "Status IS NULL And (DateAssigned <" + StrFirst + " and DateAssigned >=" + strLast + ")";
        dt = dv.ToTable(); dtGoBack = dvGoback.ToTable(); dtWOGoBack = dvWOGoback.ToTable();
        dtBlue.Merge(dt);
        dtBlue.Merge(dtGoBack);
        dtBlue.Merge(dtWOGoBack);
        Session["dt"] = dtBlue;
        Session["dtAll"] = dtBlue;
        gvrecords.DataSource = dtBlue;
        gvrecords.DataBind();
    }

    protected void lnkRed_Click(object sender, EventArgs e)
    {
        showDataByJobCompany(Request.QueryString["UC"]);
        Bubble = "Red";
        ShowRed();
        dtGreen = null;
        dtBlue = null;
    }
    protected void lnkBlue_Click(object sender, EventArgs e)
    {
        showDataByJobCompany(Request.QueryString["UC"]);
        Bubble = "Blue";
        ShowBlue();
        dtGreen = null;
        dtRed = null;
    }
    protected void lnkGreen_Click(object sender, EventArgs e)
    {
        showDataByJobCompany(Request.QueryString["UC"]);
        Bubble = "Green";
        ShowGreen();
        dtBlue = null;
        dtRed = null;
    }
    protected void BtnAll_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobsStatus.aspx?UC=" + Convert.ToString(Request.QueryString["UC"]));
    }

    protected void gvrecords_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbl_G_Contact_DateTime = (Label)e.Row.FindControl("lbl_G_Contact_DateTime");
            Label lbl_G_Blank = (Label)e.Row.FindControl("lbl_G_Blank");
            Label lbl_G_Status = (Label)e.Row.FindControl("lbl_G_Status");

            if (lbl_G_Contact_DateTime.Text == "01/01/1900")
            {
                lbl_G_Blank.Visible = true;
                lbl_G_Contact_DateTime.Visible = false;
            }

            DateTime sysdat = DateTime.Today;
            DateTime dat = new DateTime();

            if (lbl_G_Status.Text == "Go Back")
            {
                dat = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "Contact_DateTime"));
            }
            else
            {
                dat = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "DateAssigned"));
            }

            TimeSpan difference = sysdat - dat;

            if (difference.Days <= 14)
            {
                e.Row.ForeColor = System.Drawing.Color.Green;
            }
            if (difference.Days >= 15 && difference.Days <= 30)
            {
                e.Row.ForeColor = System.Drawing.Color.Blue;
            }
            if (difference.Days > 30)
            {
                e.Row.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

}
