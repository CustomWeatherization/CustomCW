﻿using System;
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
using System.Data.SqlClient;


public partial class Admin_TimeClockCount : System.Web.UI.Page
{
    int TotalDuration = 0;
    string DurationTotal = "";
    int count = 0;
    double hours = 0;
    double minutes = 0.0;
    DC_TimeClockReport objTimeClock = new DC_TimeClockReport();
    public string str = "";
    public static string EmpName = "";
    public static string TotalWorking = "";
    public static string TotalWorkingDuration = "";
    public static string OverTime = "";
    public static string FixDuration = "00 00";
    double ExtraHours = 0.0;
    double minutes2 = 0.0;
    static string Active = "A";
    //  public static DateTime dt = DateTime.Now.AddDays(-14);
    // string beforedate = dt.ToShortDateString();
    public static int days = DateTime.Now.DayOfWeek - DayOfWeek.Sunday;

    public static DateTime pastDate = DateTime.Now.AddDays(-(days + 6));
    DateTime futureDate = pastDate.AddDays(days + 6);
    string beforedate = pastDate.ToShortDateString();
    //string beforedate = "01/01/2017";
    double hourstime = new double();
    string currentdate = DateTime.Now.ToShortDateString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Active = "A";
            fillDDLTimeTrackEmp();
            ShowAllTodayEmployee();
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

            ddlEmployeeEdit.DataSource = dt;
            ddlEmployeeEdit.DataTextField = "FullName";
            ddlEmployeeEdit.DataValueField = "Emp_Id";
            ddlEmployeeEdit.DataBind();
            ddlEmployeeEdit.Items.Insert(0, "All");

            ddlEmployeeAdd.DataSource = dt;
            ddlEmployeeAdd.DataTextField = "FullName";
            ddlEmployeeAdd.DataValueField = "Emp_Id";
            ddlEmployeeAdd.DataBind();
            ddlEmployeeAdd.Items.Insert(0, "Select Employee");

           
        }
    }

    protected void DDL_Employee_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowAllTodayEmployee();
    }
    protected void gvUserInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //  con.Open();
            GridView gvChild = (GridView)e.Row.FindControl("gvChildGrid");
            Label lblHoursFromTo = (e.Row.FindControl("lblHoursFromTo") as Label);
            string EmployeeId = grdEmployeTimeTracking.DataKeys[e.Row.RowIndex].Values[0].ToString();
            lblHoursFromTo.Text = txtFromDate.Text + " To " + txtToDate.Text;
            if (EmployeeId != "")
            {

                DataTable dt = objTimeClock.showTodayEmployeHour1("ChildData", EmployeeId, txtFromDate.Text, txtToDate.Text,"");
                gvChild.DataSource = dt;
                gvChild.DataBind();
            }
        }
    }
    private static int GetNumberOfWorkingDaysJeroen(DateTime start, DateTime stop)
    {
        int days = 0;
        while (start <= stop)
        {
            if (start.DayOfWeek != DayOfWeek.Saturday && start.DayOfWeek != DayOfWeek.Sunday)
            {
                ++days;
            }
            start = start.AddDays(1);
        }
        return days;
    }
    protected void gvChildGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        Label lblsubid = ((Label)e.Row.Parent.Parent.Parent.FindControl("lnlTm") as Label);
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //  count = count + 8;

            Label lblTotalHours = (e.Row.FindControl("lblTotalHoursTime") as Label);
            Label In1 = (e.Row.FindControl("lblSwipeIn1") as Label);
            Label Out1 = (e.Row.FindControl("lblSwipeOut1") as Label);
            Label In2 = (e.Row.FindControl("lblSwipeIn2") as Label);
            Label Out2 = (e.Row.FindControl("lblSwipeOut2") as Label);
            Label In3 = (e.Row.FindControl("lblSwipeIn3") as Label);
            Label Out3 = (e.Row.FindControl("lblSwipeOut3") as Label);
            // Label lblsubid = (e.Row.Parent.FindControl("lnlTm") as Label);
            TimeSpan TotalHoursTime = new TimeSpan();
            if ((In1.Text != "" && In1.Text != "&nbsp;") && (Out1.Text != "" && Out1.Text != "&nbsp;"))
            {
                DateTime dtFrom1 = DateTime.Parse(In1.Text);
                DateTime dtTo1 = DateTime.Parse(Out1.Text);

                if (dtFrom1 >= dtTo1)
                {
                    TotalHoursTime = TotalHoursTime.Add(dtFrom1.Subtract(dtTo1));
                }
                else
                {
                    TotalHoursTime = TotalHoursTime.Add(dtTo1.Subtract(dtFrom1));
                }   
            }
            else {
                if (In1.Text == "" || In1.Text == "&nbsp;")
                {
                    In1.Text = "-";
                }
                if (Out1.Text == "" || Out1.Text == "&nbsp;")
                {
                    Out1.Text = "-";
                }
            }
            if ((In2.Text != "" && In2.Text != "&nbsp;") && (Out2.Text != "" && Out2.Text != "&nbsp;"))
            {
                DateTime dtFrom2 = DateTime.Parse(In2.Text);
                DateTime dtTo2 = DateTime.Parse(Out2.Text);
                if (dtFrom2 >= dtTo2)
                {
                    TotalHoursTime = TotalHoursTime.Add(dtFrom2.Subtract(dtTo2));                   
                }
                else 
                {
                    TotalHoursTime = TotalHoursTime.Add(dtTo2.Subtract(dtFrom2));                   
                }             
            }
            else
            {
                if (In2.Text == "" || In2.Text == "&nbsp;")
                {
                    In2.Text = "-";
                }
                if (Out2.Text == "" || Out2.Text == "&nbsp;")
                {
                    Out2.Text = "-";
                }
            }



            if ((In3.Text != "" && In3.Text != "&nbsp;") && (Out3.Text != "" && Out3.Text != "&nbsp;"))
            {
                DateTime dtFrom3 = DateTime.Parse(In3.Text);
                DateTime dtTo3 = DateTime.Parse(Out3.Text);
                if (dtFrom3 >= dtTo3)
                {
                    TotalHoursTime = TotalHoursTime.Add(dtFrom3.Subtract(dtTo3));
                }
                else
                {
                    TotalHoursTime = TotalHoursTime.Add(dtTo3.Subtract(dtFrom3));
                }   
            }
            else
            {
                if (In3.Text == "" || In3.Text == "&nbsp;")
                {
                    In3.Text = "-";
                }
                if (Out3.Text == "" || Out3.Text == "&nbsp;")
                {
                    Out3.Text = "-";
                }
            }
           

            string Hours = Convert.ToString(TotalHoursTime).Substring(0, 5);

            lblTotalHours.Text = Hours + " Hr.";

            double duration = TotalHoursTime.TotalSeconds;
            TotalDuration = TotalDuration + Convert.ToInt32(duration);

            hours = TotalDuration / 3600;
            minutes = TotalDuration % 3600 / 60;

            double minutes1 = TotalDuration / 60;
            double seconds = (TotalDuration % 60);
            minutes1 = Convert.ToDouble(minutes1);
            minutes2 = Math.Round((minutes1 / 60), 2);


            DurationTotal = Convert.ToString(String.Format("{0:00}", hours)) + ":" + Convert.ToString(String.Format("{0:00}", minutes)) + " Hrs.(" + minutes2 + ")";
            //  DurationTotal = displayTime + " Hrs.(" + minutes2 + ")";
            lblsubid.Text = Convert.ToString(String.Format("{0:00}", hours)) + "Hr. " + Convert.ToString(String.Format("{0:00}", minutes)) + " Min."; ;
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            count = GetNumberOfWorkingDaysJeroen(Convert.ToDateTime(txtFromDate.Text), Convert.ToDateTime(txtToDate.Text));
            count = count * 8;
            bool flag = false;
            Label lblGrandTotal = (Label)e.Row.FindControl("lbl_GrandTotal");
            Label lblRegularHours = (Label)e.Row.FindControl("lblRegularHours");
            Label lblOverTimeHours = (Label)e.Row.FindControl("lblOverTimeHours");
            lblGrandTotal.Text = DurationTotal;

            if (Convert.ToDouble(minutes2) <= Convert.ToDouble(count))
            {
                lblRegularHours.Text = DurationTotal;
            }
            else
            {
                lblRegularHours.Text = Convert.ToString(count) + ":00 Hrs.(" + Convert.ToString(count) + ".00)";
            }


            if (hours >= count)
            {
                ExtraHours = hours - count;
                // minutes2 = minutes2 - count;
                minutes2 = Math.Round((minutes2 - count), 2);
                // lblOverTimeHours.Text = Convert.ToString(ExtraHours) + ":" + Convert.ToString(minutes2) + " Hrs.";
                lblOverTimeHours.Text = Convert.ToString(String.Format("{0:00}", ExtraHours)) + ":" + Convert.ToString(String.Format("{0:00}", minutes)) + " Hrs.(" + Convert.ToString(minutes2) + ")";
                flag = true;
            }
            if (flag == false)
            {
                lblOverTimeHours.Text = "0:00 Hrs.";
            }
            TotalDuration = 0;
            count = 0;

        }
        if (lblsubid.Text == "")
        {
            lblsubid.Text = "00 Hr. 00 Min.";
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
        ShowAllTodayEmployee();
    }

    public void ShowAllTodayEmployee()
    {
        DataTable dt = new DataTable();
        if (DDL_Employee.SelectedItem.Text == "All" && txtFromDate.Text == "" && txtToDate.Text == "")
        {
            txtFromDate.Text = beforedate;
            txtToDate.Text = currentdate;
            if (Active == "A")
            {
                dt = objTimeClock.showTodayEmployeHour1("AllActive", "", beforedate, currentdate,"");
            }
            else
            {
                dt = objTimeClock.showTodayEmployeHour1("AllDeactive", "", beforedate, currentdate,"");
            }
        }
        else if (DDL_Employee.SelectedItem.Text != "All" && txtFromDate.Text == "" && txtToDate.Text == "")
        {
            int id = Convert.ToInt32(DDL_Employee.SelectedValue);
            EmpName = Convert.ToString(DDL_Employee.SelectedItem.Text);
            if (Active == "A")
            {
                dt = objTimeClock.showTodayEmployeHour1("SelectedActive", Convert.ToString(id), beforedate, currentdate,"");
            }
            else
            {
                dt = objTimeClock.showTodayEmployeHour1("SelectedDeactive", Convert.ToString(id), beforedate, currentdate,"");
            }
        }
        else if (DDL_Employee.SelectedItem.Text == "All" && txtFromDate.Text != "" && txtToDate.Text != "")
        {
            beforedate = Convert.ToDateTime(txtFromDate.Text).ToShortDateString();
            currentdate = Convert.ToDateTime(txtToDate.Text).ToShortDateString();
            if (Active == "A")
            {
                dt = objTimeClock.showTodayEmployeHour1("AllActive", "", beforedate, currentdate,"");
            }
            else
            {
                dt = objTimeClock.showTodayEmployeHour1("AllDeactive", "", beforedate, currentdate,"");
            }
        }
        else if (DDL_Employee.SelectedItem.Text != "All" && txtFromDate.Text != "" && txtToDate.Text != "")
        {
            beforedate = Convert.ToDateTime(txtFromDate.Text).ToShortDateString();
            currentdate = Convert.ToDateTime(txtToDate.Text).ToShortDateString();
            int id = Convert.ToInt32(DDL_Employee.SelectedValue);
            EmpName = Convert.ToString(DDL_Employee.SelectedItem.Text);
            if (Active == "A")
            {
                dt = objTimeClock.showTodayEmployeHour1("SelectedActive", Convert.ToString(id), beforedate, currentdate,"");
            }
            else
            {
                dt = objTimeClock.showTodayEmployeHour1("SelectedDeactive", Convert.ToString(id), beforedate, currentdate,"");
            }
        }
        else
        {
            if (Active == "A")
            {
                dt = objTimeClock.showTodayEmployeHour1("AllActive", "", beforedate, currentdate,"");
            }
            else
            {
                dt = objTimeClock.showTodayEmployeHour1("AllDeactive", "", beforedate, currentdate,"");
            }
        }
        grdEmployeTimeTracking.DataSource = dt;
        grdEmployeTimeTracking.DataBind();

    }



    protected void btn_Search_Click(object sender, EventArgs e)
    {
        ShowAllTodayEmployee();
    }
    protected void btnActive_Click(object sender, EventArgs e)
    {
        Active = "A";
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnNotPay.Attributes.Add("class", "paidBtn");

        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnPay.Attributes.Add("class", "paidBtnDis");
        ShowAllTodayEmployee();

    }
    protected void btnDeactive_Click(object sender, EventArgs e)
    {
        Active = "D";
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnNotPay.Attributes.Add("class", "paidBtnDis");

        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnPay.Attributes.Add("class", "paidBtn");
        ShowAllTodayEmployee();
    }

    protected void btnShowPopup_Click1(object sender, EventArgs e)
    {
       //// Table3.Style.Add("display", "none");
       // ModalPopupExtender3.Show();
    }
    protected void lnkEditDateTime_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        GridViewRow Gv2Row = (GridViewRow)((LinkButton)sender).NamingContainer;
        GridView Childgrid = (GridView)(Gv2Row.Parent.Parent);
        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        int id = Convert.ToInt32(Childgrid.DataKeys[rowIndex].Values[0]);
        string date = Childgrid.DataKeys[rowIndex].Values[1].ToString();
        ddlEmployeeEdit.SelectedValue = id.ToString();     
        if (date != "")
        {
            txtDate.Text = Convert.ToDateTime(date).ToShortDateString();
        }

        dt = objTimeClock.showTodayEmployeHour1("Edit", id.ToString(), date, "","");

        grdDetails.DataSource = dt;
        grdDetails.DataBind();
        ModalPopupExtender3.Show();
        Session.Add("DateTime", dt);
        ddlEmployeeEdit.Enabled = false;
        txtDate.Enabled = false;
      
    }

    protected void btn_Edit_Click(object sender, EventArgs e)
    {       
        ModalPopupExtender3.Hide();

    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {
           
        //int rowIndex = ((sender as Button).NamingContainer as GridViewRow).RowIndex;        
      //  int id = Convert.ToInt32(grdEmployeTimeTracking.DataKeys[rowIndex].Values[0]);
       // ddlEmployeeAdd.SelectedValue = id.ToString();     
        ModalPopupExtender1.Show();
      //  Session["Empid"] = id;       
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
      int j = objTimeClock.AddEmployeHour("Add", ddlEmployeeAdd.SelectedValue, txtAddDate.Text, txtFromTime.Text, txtToTime.Text);
        ShowAllTodayEmployee();
        Response.Write("<script>alert('Add Hours successfully');</script>");
        ddlEmployeeAdd.SelectedIndex = 0;
        txtAddDate.Text = "";
        txtFromTime.Text = "";
        txtToTime.Text = "";
    }

    protected void btn_update_Click(object sender, EventArgs e)
    {
        
        string swipin = "";
        if (Session["DateTime"] != null)
        {
            DataTable dt = (DataTable)Session["DateTime"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    HiddenField attendanceid = (HiddenField)grdDetails.Rows[i].Cells[1].FindControl("id");
                    TextBox txtSwipeIn = (TextBox)grdDetails.Rows[i].Cells[1].FindControl("txtSwipeIn");
                    TextBox txtSwipeOut = (TextBox)grdDetails.Rows[i].Cells[2].FindControl("txtSwipeOut");
                    TextBox txtInComment = (TextBox)grdDetails.Rows[i].Cells[2].FindControl("txtInComment");
                    TextBox txtOutComment = (TextBox)grdDetails.Rows[i].Cells[2].FindControl("txtOutComment");
                    DataRow row = dt.Rows[i];
                    if (txtSwipeIn.Text.Trim() != "")
                    {
                        txtSwipeIn.Text = "1900-01-01 " + txtSwipeIn.Text;
                    }
                    else
                    {
                        txtSwipeIn.Text = "";
                    }
                    if (txtSwipeOut.Text.Trim() != "")
                    {
                        txtSwipeOut.Text = "1900-01-01 " + txtSwipeOut.Text;
                    }
                    else 
                    {
                        txtSwipeOut.Text = "";
                    }
                    int j = objTimeClock.UpdateEmployeHour("Update", attendanceid.Value, txtSwipeIn.Text, txtSwipeOut.Text, txtInComment.Text, txtOutComment.Text);

                }

                Response.Write("<script>alert('Update Hours successfully');</script>");
            }
        }
        ShowAllTodayEmployee();
    }
}

