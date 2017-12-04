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
using System.Collections.Specialized;
using System.Globalization;


public partial class Admin_TimeClockReport : System.Web.UI.Page
{
    DC_TimeClockReport objTimeClock = new DC_TimeClockReport();
    public string str = "";
    public static string EmpName = "";
    public static string TotalWorking = "";
    public static string TotalWorkingDuration = "";
    public static string OverTime = "";
    public static string FixDuration = "00 00";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Emp_Id"] != null)
        {
            DivGrd.Visible = false;
            DivViewReport.Visible = true;
        }
        if (!IsPostBack)
        {
            DivTotal.Visible = false;
            ShowAllTodayEmployee();
            fillDDLTimeTrackEmp();
        }
    }
    public void fillDDLTimeTrackEmp()
    {
        DataTable dt = objTimeClock.fillTimeTrakEmployee();
        if (dt.Rows.Count > 0)
        {
            DDL_Employee.DataSource = dt;
            DDL_Employee.DataTextField = "FullName";
            DDL_Employee.DataValueField = "Emp_Id";
            DDL_Employee.DataBind();
            DDL_Employee.Items.Insert(0, "All");
        }
        if (Request.QueryString["Emp_Id"] != null)
        {
            DDL_Employee.SelectedValue = Convert.ToString(Request.QueryString["Emp_Id"]);
        }
    }

    protected void DDL_Employee_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDL_Employee.SelectedItem.Text == "All")
        {
            Response.Redirect("TimeClockReport.aspx");
        }
        else
        {
            int id = Convert.ToInt32(DDL_Employee.SelectedValue);
            EmpName = Convert.ToString(DDL_Employee.SelectedItem.Text);
            Response.Redirect("TimeClockReport.aspx?Emp_Id=" + id);
        }

    }

    protected void grdEmployeTimeTracking_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
    }
    protected void grdEmployeTimeTracking_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
    }

    protected void grdEmployeTimeTracking_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdEmployeTimeTracking.PageIndex = e.NewPageIndex;
        //ShowAllTodayEmployee();
    }

    public void ShowAllTodayEmployee()
    {
        DataTable dt = objTimeClock.showTodayEmployeHour();
        if (Request.QueryString["Emp_Id"] != null)
        {
            DataRow[] foundRows = dt.Select("Emp_Id=" + Convert.ToString(Request.QueryString["Emp_Id"]));
            for (int i = 0; i < foundRows.Length; i++)
            {
                EmpName = Convert.ToString(foundRows[i]["FullName"]);
            }
        }
        grdEmployeTimeTracking.DataSource = dt;
        grdEmployeTimeTracking.DataBind();
    }

    public string getdate(object date)
    {
        string[] strArrTotalWorking;
        string reDate = Convert.ToString(date);
        if (reDate == "")
        {
            reDate = "1900-01-01 00:00:00";
        }
        string[] strArr = reDate.Split(' ');
        reDate = strArr[1];
        strArr = reDate.Split(':');
        //if (strArr[0] == "12")
        //{
        //    strArr[0] = "00";
        //}
        reDate = strArr[0] + " Hr. " + strArr[1] + " Min.";
        //strArr[0] + " Day " +
        if (TotalWorking == "")
        {
            TotalWorking = strArr[0] + " " + strArr[1];
            strArrTotalWorking = TotalWorking.Split(' ');
            TotalWorkingDuration = " " + strArrTotalWorking[0] + " Hr. " + strArrTotalWorking[1] + " Min.";
            OverTime = " 00 Hr. 00 Min.";
        }
        else
        {
            strArrTotalWorking = TotalWorking.Split(' ');
            int hour = Convert.ToInt32(strArrTotalWorking[0]);
            int min = Convert.ToInt32(strArrTotalWorking[1]);
            int min_ = min + Convert.ToInt32("0");
            min = min_ % 60;
            min = min + Convert.ToInt32(strArr[1]);


            if (min >= 60)
            {
                hour = hour + (min / 60);
                hour = hour + Convert.ToInt32(strArr[0]);
                min = min % 60;
            }
            else
            {
                hour = hour + Convert.ToInt32(strArr[0]);
            }
            //hour = (Convert.ToInt32(strArr[0])) + min_ / 60;
            TotalWorking = hour + " " + min;
            strArrTotalWorking = TotalWorking.Split(' ');
            hour = Convert.ToInt32(strArrTotalWorking[0]);
            min = Convert.ToInt32(strArrTotalWorking[1]);
            TotalWorkingDuration = " " + strArrTotalWorking[0] + " Hr. " + strArrTotalWorking[1] + " Min.";
            strArrTotalWorking = FixDuration.Split(' ');
            hour = hour - Convert.ToInt32(strArrTotalWorking[0]);
            min = min - Convert.ToInt32(strArrTotalWorking[1]);
            if (hour > 0)
            {
                OverTime = " " + hour + " Hr. " + min + " Min.";
            }
            else
            {
                OverTime = " 00 Hr. 00 Min.";
            }
        }
        return reDate;
    }



    protected void GrdEmployeeTracReport_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
    }
    protected void GrdEmployeeTracReport_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
    }

    protected void GrdEmployeeTracReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GrdEmployeeTracReport.PageIndex = e.NewPageIndex;
        comn();
    }

    public void BindDDL_Year()
    {
        DDL_Year.Items.Clear();
        int year = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
        for (int i = 2012; i <= year; i++)
        {
            DDL_Year.Items.Add(Convert.ToString(i));
        }
        DDL_Year.Items.Insert(0, "Select");
    }

    protected void DDL_Report_SelectedIndexChanged(object sender, EventArgs e)
    {
        string DDL_ReportValue = Convert.ToString(DDL_Report.SelectedValue);
        if (DDL_ReportValue != "0")
        {
            if (DDL_ReportValue == "4")
            {
                TblBetvnDate.Visible = false;
                TblMonthly.Visible = true;
                spnMonth.Visible = true;
                DDL_Month.Visible = true;
                BindDDL_Year();
            }
            else if (DDL_ReportValue == "5")
            {
                TblBetvnDate.Visible = false;
                spnMonth.Visible = false;
                DDL_Month.Visible = false;
                TblMonthly.Visible = true;
                BindDDL_Year();
            }
            else if (DDL_ReportValue == "3")
            {
                TblMonthly.Visible = false;
                TblBetvnDate.Visible = true;
            }

            else if (DDL_ReportValue == "1")
            {
                TblMonthly.Visible = false;
                TblBetvnDate.Visible = false;
            }
            else if (DDL_ReportValue == "2")
            {
                TblMonthly.Visible = false;
                TblBetvnDate.Visible = false;
            }
        }
        else
        {
            //Alert MSGss
        }
    }
    protected void BtnGo_Click(object sender, EventArgs e)
    {
        comn();
    }


    public void comn()
    {
        GrdAllSwipe.Visible = false;
        GrdEmployeeTracReport.Visible = true;
        TotalWorking = TotalWorkingDuration = "";
        DivTotal.Visible = true;
        DataTable dt = new DataTable();
        string DDL_ReportValue = Convert.ToString(DDL_Report.SelectedValue);
        if (DDL_ReportValue == "5")
        {
            string a_ = Convert.ToString(DDL_Year.SelectedItem);
            int a = Convert.ToInt32(a_);
            int noOfWeek = GetWeeksInYear(a);
            noOfWeek = noOfWeek * 40;
            FixDuration = noOfWeek + " 00";
            dt = objTimeClock.EmployeTrackTimeYearly(Convert.ToString(Request.QueryString["Emp_Id"]), Convert.ToString(DDL_Year.SelectedItem), "single");
        }
        if (DDL_ReportValue == "4")
        {
            string a_ = Convert.ToString(DDL_Year.SelectedItem);
            int a = Convert.ToInt32(a_);
            int b = Convert.ToInt32(DDL_Month.SelectedValue);
            int noOfWeek = Weeks(a, b);
            noOfWeek = noOfWeek * 40;
            FixDuration = noOfWeek + " 00";
            dt = objTimeClock.EmployeTrackTimeMonthly(Convert.ToString(Request.QueryString["Emp_Id"]), Convert.ToString(DDL_Year.SelectedItem), Convert.ToString(DDL_Month.SelectedValue), "single");
        }
        if (DDL_ReportValue == "3")
        {
            DateTime FrmDate = Convert.ToDateTime(txtFromDate.Text);
            DateTime ToDate = Convert.ToDateTime(txtToDate.Text);
            ToDate = ToDate.AddDays(1);
            dt = objTimeClock.EmployeTrackTimeByDate(Convert.ToString(Request.QueryString["Emp_Id"]), Convert.ToString(FrmDate), Convert.ToString(ToDate), "single");
        }
        if (DDL_ReportValue == "1")
        {
            FixDuration = "40 00";
            DateTime StartOfWeek = DateTime.Today.AddDays(-(int)DateTime.Today.DayOfWeek);
            DateTime EndOfLastWeek = StartOfWeek.AddDays(-1);
            StartOfWeek = EndOfLastWeek.AddDays(-6);
            dt = objTimeClock.EmployeTrackTimeByDate(Convert.ToString(Request.QueryString["Emp_Id"]), Convert.ToString(StartOfWeek), Convert.ToString(EndOfLastWeek), "single");
        }
        if (DDL_ReportValue == "2")
        {
            FixDuration = "80 00";
            DateTime StartOfWeek = DateTime.Today.AddDays(-(int)DateTime.Today.DayOfWeek);
            DateTime EndOfWeek = StartOfWeek.AddDays(-1);
            DateTime StartOfLastWeek = EndOfWeek.AddDays(-13);
            dt = objTimeClock.EmployeTrackTimeByDate(Convert.ToString(Request.QueryString["Emp_Id"]), Convert.ToString(StartOfLastWeek), Convert.ToString(EndOfWeek), "single");
        }
        GrdEmployeeTracReport.DataSource = dt;
        GrdEmployeeTracReport.DataBind();
    }


    protected void BtnShowSwipe_Click(object sender, EventArgs e)
    {
        GrdEmployeeTracReport.Visible = DivTotal.Visible = false;
        GrdAllSwipe.Visible = true;
        DataTable dt = new DataTable();
        string DDL_ReportValue = Convert.ToString(DDL_Report.SelectedValue);
        if (DDL_ReportValue == "5")
        {
            dt = objTimeClock.EmployeTrackTimeYearly(Convert.ToString(Request.QueryString["Emp_Id"]), Convert.ToString(DDL_Year.SelectedItem), "All");
        }
        if (DDL_ReportValue == "4")
        {
            dt = objTimeClock.EmployeTrackTimeMonthly(Convert.ToString(Request.QueryString["Emp_Id"]), Convert.ToString(DDL_Year.SelectedItem), Convert.ToString(DDL_Month.SelectedValue), "All");
        }
        if (DDL_ReportValue == "3")
        {
            DateTime FrmDate = Convert.ToDateTime(txtFromDate.Text);
            DateTime ToDate = Convert.ToDateTime(txtToDate.Text);
            ToDate = ToDate.AddDays(1);
            dt = objTimeClock.EmployeTrackTimeByDate(Convert.ToString(Request.QueryString["Emp_Id"]), Convert.ToString(FrmDate), Convert.ToString(ToDate), "All");
        }
        if (DDL_ReportValue == "1")
        {
            DateTime StartOfWeek = DateTime.Today.AddDays(-(int)DateTime.Today.DayOfWeek);
            DateTime EndOfLastWeek = StartOfWeek.AddDays(-1);
            StartOfWeek = EndOfLastWeek.AddDays(-6);
            dt = objTimeClock.EmployeTrackTimeByDate(Convert.ToString(Request.QueryString["Emp_Id"]), Convert.ToString(StartOfWeek), Convert.ToString(EndOfLastWeek), "All");
        }
        if (DDL_ReportValue == "2")
        {
            DateTime StartOfWeek = DateTime.Today.AddDays(-(int)DateTime.Today.DayOfWeek);
            DateTime EndOfWeek = StartOfWeek.AddDays(-1);
            DateTime StartOfLastWeek = EndOfWeek.AddDays(-13);
            dt = objTimeClock.EmployeTrackTimeByDate(Convert.ToString(Request.QueryString["Emp_Id"]), Convert.ToString(StartOfLastWeek), Convert.ToString(EndOfWeek), "All");
        }
        GrdAllSwipe.DataSource = dt;
        GrdAllSwipe.DataBind();
    }

    public static int Weeks(int year, int month)
    {
        DayOfWeek wkstart = DayOfWeek.Monday;
        DateTime first = new DateTime(year, month, 1);
        int firstwkday = (int)first.DayOfWeek;
        int otherwkday = (int)wkstart;
        int offset = ((otherwkday + 7) - firstwkday) % 7;
        double weeks = (double)(DateTime.DaysInMonth(year, month) - offset) / 7d;
        return (int)Math.Ceiling(weeks);
    }
    public int GetWeeksInYear(int year)
    {
        DateTimeFormatInfo dfi = DateTimeFormatInfo.CurrentInfo;
        DateTime date1 = new DateTime(year, 12, 31);
        System.Globalization.Calendar cal = dfi.Calendar;
        return cal.GetWeekOfYear(date1, dfi.CalendarWeekRule, dfi.FirstDayOfWeek);
    }

}
