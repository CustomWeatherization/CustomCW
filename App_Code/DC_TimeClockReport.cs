using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DC_TimeClockReport
/// </summary>
public class DC_TimeClockReport
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public DC_TimeClockReport()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable showTodayEmployeHour()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_showTodayEmployeHour";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    public DataTable showTodayEmployeHour1(string Mode,string EmpId,string beforedate,string currentdate,string comment)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_showTodayEmployeHour1";
        cmd.Parameters.AddWithValue("@Mode", Mode);
        cmd.Parameters.AddWithValue("@Emp_id", EmpId);
        cmd.Parameters.AddWithValue("@BeforeDate", beforedate);
        cmd.Parameters.AddWithValue("@CurrentDate", currentdate);
        cmd.Parameters.AddWithValue("@InComment", comment);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    public int UpdateEmployeHour(string Mode, string EmpId, string beforedate, string currentdate, string InComment, string OutComment)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_showTodayEmployeHour1";
        cmd.Parameters.AddWithValue("@Mode", Mode);
        cmd.Parameters.AddWithValue("@Emp_id", EmpId);
        cmd.Parameters.AddWithValue("@BeforeDate", beforedate);
        cmd.Parameters.AddWithValue("@CurrentDate", currentdate);
        cmd.Parameters.AddWithValue("@InComment", InComment);
        cmd.Parameters.AddWithValue("@OutComment", OutComment);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i; //i
    }

    public int AddEmployeHour(string Mode, string EmpId, string Adddate, string fromTime, string toTime,string Comment)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_showTodayEmployeHour1";
        cmd.Parameters.AddWithValue("@Mode", Mode);
        cmd.Parameters.AddWithValue("@Emp_id", EmpId);
        cmd.Parameters.AddWithValue("@BeforeDate", fromTime);
        if (toTime != "")
        {
            cmd.Parameters.AddWithValue("@CurrentDate", toTime);
        }
        else
        {
            cmd.Parameters.AddWithValue("@CurrentDate", null);
        
        }
        cmd.Parameters.AddWithValue("@AddDate", Adddate);

        cmd.Parameters.AddWithValue("@OutComment", Comment);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i; //i
    }

    public int AddEmployeHour1(string Mode, string EmpId, string Adddate, string fromTime, string Comment)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_showTodayEmployeHour1";
        cmd.Parameters.AddWithValue("@Mode", Mode);
        cmd.Parameters.AddWithValue("@Emp_id", EmpId);
        cmd.Parameters.AddWithValue("@BeforeDate", fromTime);
        
        cmd.Parameters.AddWithValue("@AddDate", Adddate);

        cmd.Parameters.AddWithValue("@InComment", Comment);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i; //i
    }
   
   

    public DataTable EmployeTrackTimeYearly(string EmpId, string Year_, string flag)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_EmployeTrackTimeYearly";
        cmd.Parameters.AddWithValue("@Emp_id", EmpId);
        cmd.Parameters.AddWithValue("@year", Year_);
        cmd.Parameters.AddWithValue("@flag", flag);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable EmployeTrackTimeMonthly(string EmpId, string Year_, string Month_, string flag)
    {
        Month_ = "1900-" + Month_ + "-01";
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_EmployeTrackTimeMonthly";
        cmd.Parameters.AddWithValue("@Emp_id", EmpId);
        cmd.Parameters.AddWithValue("@year", Year_);
        cmd.Parameters.AddWithValue("@month", Month_);
        cmd.Parameters.AddWithValue("@flag", flag);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable EmployeTrackTimeByDate(string EmpId, string Month_From, string Month_To, string flag)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_EmployeTrackTimeByDate";
        cmd.Parameters.AddWithValue("@Emp_id", EmpId);
        cmd.Parameters.AddWithValue("@monthFrom", Month_From);
        cmd.Parameters.AddWithValue("@monthTo", Month_To);
        cmd.Parameters.AddWithValue("@flag", flag);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable ShowAllSwipesByDate(string EmpId, string Date_)//, string SwipeIn, string SwipeOut, string Comments
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllSwipeByDate";
        cmd.Parameters.AddWithValue("@Emp_id", EmpId);
        cmd.Parameters.AddWithValue("@Date_", Date_);
        //cmd.Parameters.AddWithValue("@SwipeIn", SwipeIn);
        //cmd.Parameters.AddWithValue("@SwipeOut", SwipeOut);
        //cmd.Parameters.AddWithValue("@comments", Comments);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable fillTimeTrakEmployee()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "fillTimeTrakEmployee";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdateSwipesById(int Id, string SwipeIn, string SwipeOut, string comments, int EId, string ADate)//, string Working_Duration, string TotalWorkingDuration
    {
        //1900-01-01 00:03:55.050
        SwipeIn = Convert.ToString("1900-01-01 " + SwipeIn);
        SwipeOut = Convert.ToString("1900-01-01 " + SwipeOut);

        ADate = Convert.ToString(ADate + " 00:00:00.000");


        DateTime A_Date = Convert.ToDateTime(ADate);
        ADate = Convert.ToString(A_Date);

        DateTime Swipe_In = Convert.ToDateTime(SwipeIn);
        SwipeIn = Convert.ToString(Swipe_In);

        DateTime Swipe_Out = Convert.ToDateTime(SwipeOut);
        SwipeOut = Convert.ToString(Swipe_Out);


        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateShowSwipesById";
        cmd.Parameters.AddWithValue("@Id", Id);
        cmd.Parameters.AddWithValue("@SwipeIn", SwipeIn);
        cmd.Parameters.AddWithValue("@SwipeOut", SwipeOut);
        cmd.Parameters.AddWithValue("@Adate", ADate);
        cmd.Parameters.AddWithValue("@Emp_Id", EId);
        cmd.Parameters.AddWithValue("@comments", comments);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i; //i
    }



}
