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

public partial class Admin_ShowSwipes : System.Web.UI.Page
{
    DC_TimeClockReport objTimeClock = new DC_TimeClockReport();
    public static string TotalWorking = "";
    public static string TotalWorkingDuration = "";
    public static string OverTime = "";
    public static string FixDuration = "00 00";
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Convert.ToString(Request.QueryString["EId"]);
        string date_ = Convert.ToString(Request.QueryString["Adate"]);
        string SwipeIn = "";
        string SwipeOut = "";
        string Comments = "";
        if (!IsPostBack)
        {
            ShowAllSwipesByDate(id, date_);//, SwipeIn, SwipeOut, Comments
        }
    }

    public void ShowAllSwipesByDate(string id, string date_)//, string SwipeIn, string SwipeOut, string Comments
    {
        DataTable dt = objTimeClock.ShowAllSwipesByDate(id, date_);//, SwipeIn, SwipeOut, Comments
        GrdEmployeeTracReport.DataSource = dt;
        GrdEmployeeTracReport.DataBind();
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
        if (strArr[0] == "12")
        {
            strArr[0] = "00";
        }
        reDate = strArr[1] + " Hr. " + strArr[2] + " Min.";
        //strArr[0] + " Day " +
        if (TotalWorking == "")
        {
            TotalWorking = strArr[1] + " " + strArr[2];
            strArrTotalWorking = TotalWorking.Split(' ');
            TotalWorkingDuration = " " + strArrTotalWorking[0] + " Hr. " + strArrTotalWorking[1] + " Min.";
            OverTime = " 00 Hr. 00 Min.";
        }
        else
        {
            strArrTotalWorking = TotalWorking.Split(' ');
            int hour = Convert.ToInt32(strArrTotalWorking[0]);
            int min = Convert.ToInt32(strArrTotalWorking[1]);
            int min_ = min + Convert.ToInt32(strArr[2]);
            min = min_ % 60;
            hour = (hour + Convert.ToInt32(strArr[1])) + min_ / 60;
            TotalWorking = hour + " " + min;
            strArrTotalWorking = TotalWorking.Split(' ');
            hour = Convert.ToInt32(strArrTotalWorking[0]);
            min = Convert.ToInt32(strArrTotalWorking[1]);
            TotalWorkingDuration = " " + strArrTotalWorking[0] + " Hr. " + strArrTotalWorking[1] + "Min.";
            strArrTotalWorking = FixDuration.Split(' ');
            hour = hour - Convert.ToInt32(strArrTotalWorking[0]);
            min = min - Convert.ToInt32(strArrTotalWorking[1]);
            if (hour > 0)
            {
                OverTime = " " + hour + " Hr. " + min + "Min.";
            }
            else
            {
                OverTime = " 00 Hr. 00 Min.";
            }
        }
        return reDate;
    }
    protected void GrdEmployeeTracReport_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrdEmployeeTracReport.EditIndex = e.NewEditIndex;
        string id = Convert.ToString(Request.QueryString["EId"]);
        string date_ = Convert.ToString(Request.QueryString["Adate"]);
        string SwipeIn = "";
        string SwipeOut = "";
        string Comments = "";
        ShowAllSwipesByDate(id, date_);//, SwipeIn, SwipeOut, Comments
    }
    protected void GrdEmployeeTracReport_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int Id = Convert.ToInt32(GrdEmployeeTracReport.DataKeys[e.RowIndex].Values[1].ToString());
        int EId = Convert.ToInt32(GrdEmployeeTracReport.DataKeys[e.RowIndex].Values[0].ToString());
        Label lbl_ADate = (Label)GrdEmployeeTracReport.Rows[e.RowIndex].FindControl("lbl_ADate");
        //TextBox txt_U_Date = (TextBox)GrdEmployeeTracReport.Rows[e.RowIndex].FindControl("txt_G_Date");
        TextBox txt_U_SwipeIn = (TextBox)GrdEmployeeTracReport.Rows[e.RowIndex].FindControl("txt_G_SwipeIn");
        TextBox txt_U_SwipeOut = (TextBox)GrdEmployeeTracReport.Rows[e.RowIndex].FindControl("txt_G_SwipeOut");
        TextBox txt_U_Comments = (TextBox)GrdEmployeeTracReport.Rows[e.RowIndex].FindControl("txt_G_Comments");
        //TextBox txt_U_costPerUnit = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_costPerUnit");
        int i = objTimeClock.UpdateSwipesById(Id, txt_U_SwipeIn.Text, txt_U_SwipeOut.Text, txt_U_Comments.Text, EId, lbl_ADate.Text);
        string id = Convert.ToString(Request.QueryString["EId"]);
        string date_ = Convert.ToString(Request.QueryString["Adate"]);
        ShowAllSwipesByDate(id, date_);//,txt_U_SwipeIn.Text,txt_U_SwipeOut.Text, txt_U_Comments.Text
        GrdEmployeeTracReport.EditIndex = -1;
        Response.Redirect("ShowSwipes.aspx?EId=" + id + "&Adate=" + date_ + "");
    }
    protected void GrdEmployeeTracReport_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  

        GrdEmployeeTracReport.EditIndex = -1;

        string id = Convert.ToString(Request.QueryString["EId"]);
        string date_ = Convert.ToString(Request.QueryString["Adate"]);
        string SwipeIn = "";
        string SwipeOut = "";
        string Comments = "";
        ShowAllSwipesByDate(id, date_);//, SwipeIn, SwipeOut, Comments
    }
}


