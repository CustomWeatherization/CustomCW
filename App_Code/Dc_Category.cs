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
/// Summary description for Dc_Category
/// </summary>
public class Dc_Category
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public Dc_Category()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region PPL


    public int insertCategory(string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertCategory";
        cmd.Parameters.AddWithValue("@Category", category);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showAllCategory()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllCategory";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdateCategorybyId(int Id, string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdaeCategoryByID";
        cmd.Parameters.AddWithValue("@Category", category);
        cmd.Parameters.AddWithValue("@CatID", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeleteCategorybyId(int Id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteCategoryByID";
        cmd.Parameters.AddWithValue("@CatID", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showCategoryById(int Id)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_SelectCategoryByID";
        cmd.Parameters.AddWithValue("@CatID", Id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable showOccurencesById(int Id)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "View_Occurrences_Details";
        cmd.Parameters.Add("@Mode", "Occurences_View");
        cmd.Parameters.AddWithValue("@OccurrenceID", Id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    #endregion

    public DataTable ViewAllUserDetails()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.Add("@Mode", "Usr_sel");
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }
    public DataTable ViewAllUserStatusDetails(string Mode)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.Add("@Mode", Mode);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewAllUserStatusDetails(string emplyeeid, string Mode)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.Add("@Mode", Mode);
        cmd.Parameters.Add("@Login", emplyeeid);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewVacationDetails(string UserName,string Mode,string RequestType)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.Add("@Mode", Mode);
        cmd.Parameters.Add("@Login", UserName);
        cmd.Parameters.Add("@RequestType", RequestType);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ShowPaymentHistory(string UserName)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.Add("@Mode", "Usr_sel_Payment");
        cmd.Parameters.Add("@Login", UserName);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewSelectedEmployeeDetails(string UserName,int ID,string Mode,string RequestType)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.Add("@Mode", Mode);//Usr_Sel_Appr_sel
        cmd.Parameters.Add("@Login", UserName);
        cmd.Parameters.Add("@RequestType", RequestType);
        cmd.Parameters.Add("@ID", ID);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ShowAllUser()//tanveer
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.Sel_Reg";
        cmd.Parameters.Add("@Mode", "Usr_sel");
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewUserShow_Pop(string logId)//tanveer
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.Add("@Mode", "Usr_sel_pop");
        cmd.Parameters.Add("@Login", logId);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable Show_Pop(string logId)//tanveer
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.Sel_Reg";
        cmd.Parameters.Add("@Mode", "Usr_sel_pop");
        cmd.Parameters.Add("@Login", logId);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }
    public bool Upd_pop(string LogID1,string fname, string lname, string pwd, string phone, string add, string City, string state, string zip)
    {


        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.Sel_Reg";
        cmd.Parameters.AddWithValue("@Mode", "Usr_Upd_pop");
        cmd.Parameters.AddWithValue("@Login", LogID1);
        cmd.Parameters.AddWithValue("@phone", phone);
        cmd.Parameters.AddWithValue("@Address", add);
        cmd.Parameters.AddWithValue("@City", City);
        cmd.Parameters.AddWithValue("@State", state);
        cmd.Parameters.AddWithValue("@Zipcode", zip);
        cmd.Parameters.AddWithValue("@pwd", pwd);
        cmd.Parameters.AddWithValue("@fname", fname);
        cmd.Parameters.AddWithValue("@lname", lname);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }

    public bool Update_Employee_details(string LogID1, string fname, string lname, string email, string password, string profileImage, double MaxVacationHours, string JobTitle, string Manager,string JoiningDate,string PersonlSalary,string BirthDate)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.AddWithValue("@Mode", "Usr_Upd_pop");
        cmd.Parameters.AddWithValue("@Login", LogID1);
        cmd.Parameters.AddWithValue("@fname", fname);
        cmd.Parameters.AddWithValue("@lname", lname);
        cmd.Parameters.AddWithValue("@Email", email);
        cmd.Parameters.AddWithValue("@pwd", password);
        cmd.Parameters.AddWithValue("@profileimage", profileImage);        
        cmd.Parameters.AddWithValue("@MaxVacationHours", MaxVacationHours);
        cmd.Parameters.AddWithValue("@JobTitle", JobTitle);
        cmd.Parameters.AddWithValue("@Manager", Manager);
        cmd.Parameters.AddWithValue("@JoiningDate", JoiningDate);
        cmd.Parameters.AddWithValue("@PersonalSalary", PersonlSalary);
        cmd.Parameters.AddWithValue("@BirthDate", BirthDate);
       
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }

    public bool Update_User_details(string LogID1, string ContactNumber,string Address,string City,string State,string Pincode)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.AddWithValue("@Mode", "Usr_Detl_Upd");
        cmd.Parameters.AddWithValue("@Login", LogID1);
      //  cmd.Parameters.AddWithValue("@BirthDate", BirthDate);
        cmd.Parameters.AddWithValue("@phone", ContactNumber);
       // cmd.Parameters.AddWithValue("@ProfileImage", ProfileImage);
        cmd.Parameters.AddWithValue("@Address", Address);
        cmd.Parameters.AddWithValue("@City", City);
        cmd.Parameters.AddWithValue("@State", State);     
        cmd.Parameters.AddWithValue("@Zipcode", Pincode);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }

    public bool Add_RequestTimeOff_Details(string LoginId, string FromDate, string ToDate, string FromTime, string ToTime, string TypeOFRequestOff, string Comment, double TotalHours, string status)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.AddWithValue("@Mode", "Empl_Ins_Detl");
        cmd.Parameters.AddWithValue("@Login", LoginId);
        cmd.Parameters.AddWithValue("@FromDate", FromDate);
        cmd.Parameters.AddWithValue("@ToDate", ToDate);
        cmd.Parameters.AddWithValue("@FromTime", FromTime);
        cmd.Parameters.AddWithValue("@ToTime", ToTime);
        cmd.Parameters.AddWithValue("@Comment", Comment);
        cmd.Parameters.AddWithValue("@RequestType", TypeOFRequestOff);
        cmd.Parameters.AddWithValue("@TotalHours", TotalHours);
        cmd.Parameters.AddWithValue("@Status", status);
        cmd.Parameters.AddWithValue("@AppliedDate", DateTime.Now);
     
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }
    public bool Update_Holiday_Details(string LoginId, string FromDate,string TypeOFRequestOff)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.AddWithValue("@Mode", "Empl_Del_Detl");
        cmd.Parameters.AddWithValue("@Login", LoginId);
        cmd.Parameters.AddWithValue("@FromDate", FromDate);
        cmd.Parameters.AddWithValue("@RequestType", TypeOFRequestOff);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }
    public bool Insert_Attendance_Details(string LoginId, string FromDate,string FromTime,string ToTime, string Status)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.AddWithValue("@Mode", "Ins_Attendance_Detl");
        cmd.Parameters.AddWithValue("@Login", LoginId);
        cmd.Parameters.AddWithValue("@FromDate", FromDate);
        cmd.Parameters.AddWithValue("@FromTime", FromTime);
        cmd.Parameters.AddWithValue("@ToTime", ToTime);
        cmd.Parameters.AddWithValue("@Status", Status);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
           return true;
        else
            return false;
    }
    public bool Delete_Attendance_Details(string LoginId, string FromDate, string FromTime, string ToTime)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.AddWithValue("@Mode", "Del_Attendance_Detl");
        cmd.Parameters.AddWithValue("@Login", LoginId);
        cmd.Parameters.AddWithValue("@FromDate", FromDate);
        cmd.Parameters.AddWithValue("@FromTime", FromTime);
        cmd.Parameters.AddWithValue("@ToTime", ToTime);
       
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }


    public bool Add_Occuerrences_Details(string EmployeeId, string OccurrencesDate, string Narrative, string SupervisorLogin, string Action, bool Sign, string Response, DateTime ThirdDay)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_Occurrences_Details";
        cmd.Parameters.AddWithValue("@Mode", "Ins_Occu_Detl");
        cmd.Parameters.AddWithValue("@EmpLogin", EmployeeId);
        cmd.Parameters.AddWithValue("@OccurDate", OccurrencesDate);
        cmd.Parameters.AddWithValue("@Narrative", Narrative);
        cmd.Parameters.AddWithValue("@SupervicsorLogin", SupervisorLogin);
        cmd.Parameters.AddWithValue("@Action", Action);
        cmd.Parameters.AddWithValue("@NeedSign", Sign);
        cmd.Parameters.AddWithValue("@Response", Response);
        cmd.Parameters.AddWithValue("@ThirdDay", ThirdDay);
    
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }

    public bool Update_Occuerrences_Details(string EmployeeId, string OccurrencesDate, string Narrative, string SupervisorLogin, string Action, bool Sign, string Response, string OccurenceID)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_Occurrences_Details";
        cmd.Parameters.AddWithValue("@Mode", "Upd_Occu_Detl");
        cmd.Parameters.AddWithValue("@EmpLogin", EmployeeId);
        cmd.Parameters.AddWithValue("@OccurDate", OccurrencesDate);
        cmd.Parameters.AddWithValue("@Narrative", Narrative);
        cmd.Parameters.AddWithValue("@SupervicsorLogin", SupervisorLogin);
        cmd.Parameters.AddWithValue("@Action", Action);
        cmd.Parameters.AddWithValue("@NeedSign", Sign);
        cmd.Parameters.AddWithValue("@Response", Response);
        cmd.Parameters.AddWithValue("@OccurrenceID", OccurenceID);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }

    public bool Delete_Occuerrences_Details(int OccurenceID)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_Occurrences_Details";
        cmd.Parameters.AddWithValue("@Mode", "Del_Occu_Detl");
      
        cmd.Parameters.AddWithValue("@OccurrenceID", OccurenceID);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }


    public bool Del_Rec(string LogID2)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.Sel_Reg";
        cmd.Parameters.AddWithValue("@Mode", "Usr_Del_Rec");
        cmd.Parameters.AddWithValue("@Login", LogID2);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }

  


    public DataTable ViewOccurencesDetails()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_Occurrences_Details";
        cmd.Parameters.Add("@Mode", "View_Occu_Detl");
       
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewSelctedEmployeeOcurDetails(string id)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_Occurrences_Details";
        cmd.Parameters.Add("@Mode", "View_Occu_Detl_ID");
        cmd.Parameters.Add("@EmpLogin", id);

        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewOccurencesDetails_User(string id)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_Occurrences_Details";
        cmd.Parameters.Add("@Mode", "View_User_Occu_Detl");
        cmd.Parameters.Add("@EmpLogin", id);

        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewOccurencesDetails_DateTime(string id,string Action,string FromDate,string ToDate,string Mode)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_Occurrences_Details";
        cmd.Parameters.Add("@Mode", Mode);
        cmd.Parameters.Add("@EmpLogin", id);
        cmd.Parameters.Add("@Action", Action);
        cmd.Parameters.Add("@FromDate", FromDate);
        cmd.Parameters.Add("@ToDate", ToDate);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewVacationDetails(string id)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_Occurrences_Details";
        cmd.Parameters.Add("@Mode", "View_User_Occu_Detl");
        cmd.Parameters.Add("@EmpLogin", id);

        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewOccurencesDetails_Admin(int id)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_Occurrences_Details";
        cmd.Parameters.Add("@Mode", "View_Admin_Occu_Detl");
        cmd.Parameters.Add("@EmpLogin", id);

        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
        return dt;
    }


    public bool UpdateUserRegisterMangaer(string Id, string Manager)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_Occurrences_Details";
        cmd.Parameters.AddWithValue("@Mode", "Update_Manager");
        cmd.Parameters.AddWithValue("@EmpLogin", Id);
        cmd.Parameters.AddWithValue("@Manager", Manager);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }

    public bool DDLStatus(string Id, string status)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.Sel_Reg";
        cmd.Parameters.AddWithValue("@Mode", "DDL_act");
        cmd.Parameters.AddWithValue("@Login", Id);
        cmd.Parameters.AddWithValue("@Status", status);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }
    public bool DDLStatusApproval(int Id, string status,string RejectComment,string ApproveDate,string RejectDate)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.View_User_Details";
        cmd.Parameters.AddWithValue("@Mode", "DDL_Appr_Detl");
        cmd.Parameters.AddWithValue("@ID", Id);
        cmd.Parameters.AddWithValue("@ApprovalStatus", status);
        cmd.Parameters.AddWithValue("@RejectComment", RejectComment);
        cmd.Parameters.AddWithValue("@ApproveDate", ApproveDate);
        cmd.Parameters.AddWithValue("@RejectDate", RejectDate);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }


    public bool Act_Status(string Id)
    {

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.Sel_Reg";
        cmd.Parameters.AddWithValue("@Mode", "active");
        cmd.Parameters.AddWithValue("@Login", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }

    public bool Dact_Status(string Id)
    {

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.Sel_Reg";
        cmd.Parameters.AddWithValue("@Mode", "deactive");
        cmd.Parameters.AddWithValue("@Login", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }

    //Status
    public bool Reg_ActStatus(string Id)
    {

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.Sel_Reg";
        cmd.Parameters.AddWithValue("@Mode", "Sta_Act");
        cmd.Parameters.AddWithValue("@Login", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }
    public bool Reg_DeActStatus(string Id)
    {

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "dbo.Sel_Reg";
        cmd.Parameters.AddWithValue("@Mode", "Sta_Dact");
        cmd.Parameters.AddWithValue("@Login", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
            return true;
        else
            return false;
    }
    //end

    public DataTable GetUserRegistrationNames()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_ShowUserRegister";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    public int InsertPaymentSalary(double OldHourlyRate,double NewHourlyRate, double OldSalary,double NewSalary,string UsrName)
    {
        //proc_UpdateEmployeeInformation
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "InsertPaymentDetails";
        cmd.Parameters.AddWithValue("@HourlyOldRate", OldHourlyRate);
        cmd.Parameters.AddWithValue("@HourlyNewRate", NewHourlyRate);
        cmd.Parameters.AddWithValue("@OldSalary", OldSalary);
        cmd.Parameters.AddWithValue("@NewSalary", NewSalary);
        cmd.Parameters.AddWithValue("@UserName", UsrName);
      
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }



    #region Employee Information
    public int UpdateEmployeeInformation(string Passcode, string AuditRate, string PersentRate, string HourlyRate, int Id, string MetedAudit, string ExtraMesr, string QuestionMesr, string PplZ1Z2, string InspectionRate, string Bcoc, string Dced, string Private, string Ugi,string color)
    {
        //proc_UpdateEmployeeInformation
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateEmployeeInformation";
        cmd.Parameters.AddWithValue("@passcode", Passcode);
        cmd.Parameters.AddWithValue("@AuditRate", AuditRate);
        cmd.Parameters.AddWithValue("@PersentageRate", PersentRate);
        cmd.Parameters.AddWithValue("@HourlyRate", HourlyRate);
        cmd.Parameters.AddWithValue("@User_Id", Id);
        cmd.Parameters.AddWithValue("@MetedAudit", MetedAudit);
        cmd.Parameters.AddWithValue("@ExtraMesr", ExtraMesr);
        cmd.Parameters.AddWithValue("@QuestionMesr", QuestionMesr);
        cmd.Parameters.AddWithValue("@PplZ1Z2", PplZ1Z2);
        cmd.Parameters.AddWithValue("@InspectionRate", InspectionRate);
        cmd.Parameters.AddWithValue("@Bcoc", Bcoc);
        cmd.Parameters.AddWithValue("@Dced", Dced);
        cmd.Parameters.AddWithValue("@Private", Private);
        cmd.Parameters.AddWithValue("@Ugi", Ugi);
        cmd.Parameters.AddWithValue("@Eventcolor", color);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }



    #region
    string test, eventcolor1;
    public string checkcolor(string color)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select Eventcolor from User_registration where  Eventcolor='" + color + "'", con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            test = "true";

        }
        reader.Close();
        con.Close();
        return test;
    }
    #endregion




    public DataTable ShowEmployeeInformation(int uid)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowEmployeeInformation";
        cmd.Parameters.AddWithValue("@User_Id", uid);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataSet ShowRequestTimeOffInfo(int uid)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowRequestDetailsCount";
        cmd.Parameters.AddWithValue("@Login", uid);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }

   


    public string CheckAuditorCheckBox(int Uid)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "proc_CheckAuditorCheckBox";
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        cmd.Parameters.AddWithValue("@Uid", Uid);
        cmd.Parameters.Add("@out_put", SqlDbType.VarChar, 50);
        cmd.Parameters["@out_put"].Direction = ParameterDirection.Output;
        cmd.ExecuteNonQuery();
        con.Close();
        string a = Convert.ToString(cmd.Parameters["@out_put"].Value.ToString());
        return a;
    }

    public int setAuditor(string Uid, string flag)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_setAuditor";
        cmd.Parameters.AddWithValue("@UsrId", Uid);
        cmd.Parameters.AddWithValue("@flag", flag);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    #endregion



    #region METED

    public int insertMetedCategory(string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertMetedCategory";
        cmd.Parameters.AddWithValue("@Category", category);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showAllMetedCategory()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllMetedCategory";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdateMetedCategorybyId(int Id, string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdaeMetedCategoryByID";
        cmd.Parameters.AddWithValue("@Category", category);
        cmd.Parameters.AddWithValue("@CatID", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeleteMetedCategorybyId(int Id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteMetedCategoryByID";
        cmd.Parameters.AddWithValue("@CatID", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showMetedCategoryById(int Id)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_SelectMetedCategoryByID";
        cmd.Parameters.AddWithValue("@CatID", Id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    public DataTable ShowInvo(int Id)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Proc_Upd_invoice";
        cmd.Parameters.AddWithValue("@ID", Id);
        cmd.Parameters.AddWithValue("@Mode", "Show_Inv");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        da.Fill(dt);
        con.Close();
        return dt;

    }

    public DataTable ShowInvoNo(string job)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Proc_Upd_invoice";
        cmd.Parameters.AddWithValue("@JobNumber", job);
        cmd.Parameters.AddWithValue("@Mode", "Show_InvoNo");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        da.Fill(dt);
        con.Close();
        return dt;

    }
    #endregion
}
