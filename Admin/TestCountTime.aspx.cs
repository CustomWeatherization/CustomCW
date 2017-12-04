using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Admin_TestCountTime : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    DC_TimeClockReport objTimeClock = new DC_TimeClockReport();

    public static string EmpName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridview();
        }
    }
    // This method is used to bind gridview from database
    protected void BindGridview()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select top 10 dbo.Attendance.Emp_Id,User_registration.FName + ' ' + User_registration.LName AS FullName, dbo.Attendance.TotalWorkingDuration,dbo.Attendance.Id, dbo.Attendance.ADate,row_number() over (partition by dbo.Attendance.Emp_Id,CONVERT(VARCHAR(10), dbo.Attendance.ADate, 111) order by dbo.Attendance.Id desc) as row_number FROM dbo.Attendance INNER JOIN User_registration ON dbo.Attendance.Emp_Id = User_registration.User_Id", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        gvParentGrid.DataSource = ds;
        gvParentGrid.DataBind();

    }
    protected void gvUserInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            con.Open();
            GridView gv = (GridView)e.Row.FindControl("gvChildGrid");
            int CountryId = Convert.ToInt32(e.Row.Cells[1].Text);
            SqlCommand cmd = new SqlCommand(" select top 10 dbo.Attendance.Emp_Id,User_registration.FName + ' ' + User_registration.LName AS FullName, dbo.Attendance.TotalWorkingDuration,dbo.Attendance.Id, dbo.Attendance.ADate,row_number() over (partition by dbo.Attendance.Emp_Id,CONVERT(VARCHAR(10), dbo.Attendance.ADate, 111) order by dbo.Attendance.Id desc) as row_number FROM  dbo.Attendance INNER JOIN User_registration ON dbo.Attendance.Emp_Id = User_registration.User_Id where Id=4348", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            gv.DataSource = ds;
            gv.DataBind();
        }
    }
   
}
