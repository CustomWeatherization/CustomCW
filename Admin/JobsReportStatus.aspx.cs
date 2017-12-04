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

public partial class Admin_JobsReportStatus : System.Web.UI.Page
{
    dc_Admin ObjAdmin = new dc_Admin();
    public Decimal Total, TotalRemain, TotalPaid;
    public DataTable dtRed = new DataTable();
    public DataTable dtGreen = new DataTable();
    public DataTable dtBlue = new DataTable();
    dc_JobStatus objDcJobsStatus = new dc_JobStatus();
    public DataTable dt_jobMenu = new DataTable();
    public DataTable dt_jobPPLZ1 = new DataTable();
    public DataTable dt_jobPPLZ2 = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["UC"] != null)
                {
                    string UCompanyName = Request.QueryString["UC"].ToString();
                    if (UCompanyName == "All")
                    {
                        FunShowUtilityCompany();
                    }
                    else
                    {
                        showDataByJobCompany(UCompanyName);
                    }
                }
            }
        }
        catch
        {
        }
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

            for (int i = 0; i < dt_jobMenu.Rows.Count; i++)
            {
                dtall = (DataTable)Session["dtAll"];
                string utlity = dt_jobMenu.Rows[i]["UtilityCompany"].ToString();
                DataTable dt = ObjAdmin.ShowJob_byCompnayUtility(utlity);
                dtall.Merge(dt);
                Session["dtAll"] = dtall;
            }
            for (int i = 0; i < dt_jobPPLZ1.Rows.Count; i++)
            {
                dtall = (DataTable)Session["dtAll"];
                string utlity = dt_jobPPLZ1.Rows[i]["UtilityCompany"].ToString();
                DataTable dt = ObjAdmin.ShowJob_byCompnayUtility(utlity);
                dtall.Merge(dt);
                Session["dtAll"] = dtall;
            }
            for (int i = 0; i < dt_jobPPLZ2.Rows.Count; i++)
            {
                dtall = (DataTable)Session["dtAll"];
                string utlity = dt_jobPPLZ2.Rows[i]["UtilityCompany"].ToString();
                DataTable dt = ObjAdmin.ShowJob_byCompnayUtility(utlity);
                dtall.Merge(dt);
                Session["dtAll"] = dtall;
            }
            ShowBlue();
            ShowRed();
            ShowGreen();
        }
        catch (Exception ex)
        {
        }
    }
    public void showDataByJobCompany(string StrCompany)
    {
        try
        {
            Total = TotalRemain = TotalPaid = 0;
            DataTable dt = ObjAdmin.ShowJob_byCompnayUtility(StrCompany);
            Session["dt"] = dt;
            ShowBlue();
            ShowRed();
            ShowGreen();

        }
        catch
        {

        }

    }


    public void ShowRed()
    {
        //Total = TotalRemain = TotalPaid = 0;
        if (Total <= 0)
        {
            Total = 0;
        }
        if (TotalRemain <= 0)
        {
            TotalRemain = 0;
        }
        if (TotalPaid <= 0)
        {
            TotalPaid = 0;
        }
        DataTable dt = new DataTable();

        if (Request.QueryString["UC"].ToString() == "All")
        {
            dt = (DataTable)Session["dtAll"];
        }
        else
        {
            dt = (DataTable)Session["dt"];
        }


        if (dt.Rows.Count > 0)
        {
            DateTime now = DateTime.Now;
            DataView dv = new DataView(dt);
            DateTime expiryDate = now.AddDays(-30);
            string strDate = expiryDate.ToString();
            strDate = "'" + strDate + "'";
            dv.RowFilter = "DateAssigned <" + strDate + "";
            dtRed = dv.ToTable();
            for (int i = 0; i <= dtRed.Rows.Count - 1; i++)
            {
                if (Convert.ToString(dtRed.Rows[i]["PaidTotalAmount"]) != "" && Convert.ToString(dtRed.Rows[i]["PaidTotalAmount"]) != "" && Convert.ToString(dtRed.Rows[i]["PaidTotalAmount"]) != "")
                {
                    Total = Total + Convert.ToDecimal(dtRed.Rows[i]["PaidTotalAmount"]);
                    TotalRemain = TotalRemain + Convert.ToDecimal(dtRed.Rows[i]["PaidRemainingAmount"]);
                    TotalPaid = TotalPaid + Convert.ToDecimal(dtRed.Rows[i]["PaidAmount"]);
                }
            }
        }
    }


    public void ShowGreen()
    {
        //Total = TotalRemain = TotalPaid = 0;
        if (Total <= 0)
        {
            Total = 0;
        }
        if (TotalRemain <= 0)
        {
            TotalRemain = 0;
        }
        if (TotalPaid <= 0)
        {
            TotalPaid = 0;
        }
        DataTable dt = new DataTable();

        if (Request.QueryString["UC"].ToString() == "All")
        {
            dt = (DataTable)Session["dtAll"];
        }
        else
        {
            dt = (DataTable)Session["dt"];
        }
        if (dt.Rows.Count > 0)
        {
            DateTime now = DateTime.Now;
            DataView dv = new DataView(dt);
            DateTime SeconDate = now.AddDays(-15);

            string StrFirst = "";
            string strLast = "";
            StrFirst = now.AddDays(-15).ToString();
            StrFirst = SeconDate.ToString();
            StrFirst = "'" + StrFirst + "'";
            strLast = now.ToString();
            strLast = "'" + strLast + "'";
            dv.RowFilter = "DateAssigned >" + StrFirst + " and DateAssigned <=" + strLast + "";
            dtGreen = dv.ToTable();
            for (int i = 0; i <= dtGreen.Rows.Count - 1; i++)
            {
                if (Convert.ToString(dtGreen.Rows[i]["PaidTotalAmount"]) != "" && Convert.ToString(dtGreen.Rows[i]["PaidTotalAmount"]) != "" && Convert.ToString(dtGreen.Rows[i]["PaidTotalAmount"]) != "")
                {
                    Total = Total + Convert.ToDecimal(dtGreen.Rows[i]["PaidTotalAmount"]);
                    TotalRemain = TotalRemain + Convert.ToDecimal(dtGreen.Rows[i]["PaidRemainingAmount"]);
                    TotalPaid = TotalPaid + Convert.ToDecimal(dtGreen.Rows[i]["PaidAmount"]);
                }
            }
        }
    }


    public void ShowBlue()
    {
        //Total = TotalRemain = TotalPaid = 0;
        if (Total <= 0)
        {
            Total = 0;
        }
        if (TotalRemain <= 0)
        {
            TotalRemain = 0;
        }
        if (TotalPaid <= 0)
        {
            TotalPaid = 0;
        }
        DataTable dt = new DataTable();

        if (Request.QueryString["UC"].ToString() == "All")
        {
            dt = (DataTable)Session["dtAll"];
        }
        else
        {
            dt = (DataTable)Session["dt"];
        }
        if (dt.Rows.Count > 0)
        {
            DateTime now = DateTime.Now;
            DataView dv = new DataView(dt);
            DateTime SecondDate = now.AddDays(-15);
            DateTime FirstDate = now.AddDays(-30);

            string StrFirst = "";
            StrFirst = SecondDate.ToString();
            StrFirst = "'" + StrFirst + "'";

            string strLast = FirstDate.ToString();
            strLast = "'" + strLast + "'";


            dv.RowFilter = "DateAssigned <" + StrFirst + " and DateAssigned >=" + strLast + "";
            dtBlue = dv.ToTable();
            for (int i = 0; i <= dtBlue.Rows.Count - 1; i++)
            {
                if (Convert.ToString(dtBlue.Rows[i]["PaidTotalAmount"]) != "" && Convert.ToString(dtBlue.Rows[i]["PaidTotalAmount"]) != "" && Convert.ToString(dtBlue.Rows[i]["PaidTotalAmount"]) != "")
                {
                    Total = Total + Convert.ToDecimal(dtBlue.Rows[i]["PaidTotalAmount"]);
                    TotalRemain = TotalRemain + Convert.ToDecimal(dtBlue.Rows[i]["PaidRemainingAmount"]);
                    TotalPaid = TotalPaid + Convert.ToDecimal(dtBlue.Rows[i]["PaidAmount"]);
                }
            }
        }
    }


    protected void lnkRed_Click(object sender, EventArgs e)
    {
        ShowRed();
        dtGreen = null;
        dtBlue = null;
    }


    protected void lnkBlue_Click(object sender, EventArgs e)
    {
        ShowBlue();
        dtGreen = null;
        dtRed = null;
    }


    protected void lnkGreen_Click(object sender, EventArgs e)
    {
        ShowGreen();
        dtBlue = null;
        dtRed = null;
    }


}
