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
/// Summary description for dc_Admin
/// </summary>
public class dc_Admin
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());

    public dc_Admin()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    #region "Login Page"

    public DataTable CheckLoginUser(string UserLoginName, string Password)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_Admin_Login";
            cmd.Parameters.AddWithValue("@UserName", UserLoginName);
            cmd.Parameters.AddWithValue("@Passwd", Password);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch
        {

        }
        return dt;
    }

    #endregion



    #region "Unfinalize Page"

    public int UpdateSetUnfinalizeJob(string JobNumber)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UnFinalizeJob";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();

        }
        catch
        {

        }
        return i;
    }

    #endregion



    #region "Update Admin Detail"
    public int Update_Admin_Detail(string OldUserName, string NewUserName, string OldPasswd, string NewPasswd)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {

            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_updateAdminDetail";
            cmd.Parameters.AddWithValue("@Old_UserName", OldUserName);
            cmd.Parameters.AddWithValue("@New_UserName", NewUserName);
            cmd.Parameters.AddWithValue("@Old_Passwd", OldPasswd);
            cmd.Parameters.AddWithValue("@New_passwd", NewPasswd);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {


        }
        return i;
    }
    #endregion



    #region "Show Report By Company"
    public DataTable ShowJob_byCompnayUtility(string UtilityCompnay)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_SelectJobs_WithPaidReport";
            cmd.Parameters.AddWithValue("@Num", UtilityCompnay);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }




    public DataTable SelectJobs_WithAllPaidReport(string UtilityCompnay, string Act129, string BaseLoadOnly, string HighPriority, string LowCost, string FullCost, string Act129II, string SearchChkNo)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_SelectJobs_WithUnPaidReport";
            cmd.Parameters.AddWithValue("@Num", UtilityCompnay);
            if (Act129 != "")
            {
                cmd.Parameters.AddWithValue("@Act129", Act129);
            }
            if (BaseLoadOnly != "")
            {
                cmd.Parameters.AddWithValue("@BaseLoadOnly", BaseLoadOnly);
            }
            if (HighPriority != "")
            {
                cmd.Parameters.AddWithValue("@HighPriority", HighPriority);
            }
            if (LowCost != "")
            {
                cmd.Parameters.AddWithValue("@LowCost", LowCost);
            }
            if (FullCost != "")
            {
                cmd.Parameters.AddWithValue("@FullCost", FullCost);
            }
            if (Act129II != "")
            {
                cmd.Parameters.AddWithValue("@Act129II", Act129II);
            }
            if (SearchChkNo != "")
            {
                cmd.Parameters.AddWithValue("@SearchChkNo", SearchChkNo);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }

        return dt;
    }



    public DataTable SelectJobs_WithPaidReport_WithStatus(string UtilityCompnay)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "Proc_SelectJobs_WithPaidReport_WithStatus";
            cmd.CommandText = "Proc_SelectJobs_WithPaidReport";
            cmd.Parameters.AddWithValue("@Num", UtilityCompnay);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }








    public DataTable GetJobWithPaidReport(int JobID, string UtilityCompnay, int NoOfInvoice)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            if (UtilityCompnay == "PPL Zone 1" || UtilityCompnay == "PPL Zone 2")
            {
                UtilityCompnay = "PPL";
            }
            if (UtilityCompnay == "Private")
            {
                UtilityCompnay = "Private Customer";
            }
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_GetJobWithPaidReport";
            cmd.Parameters.AddWithValue("@JobID", JobID);
            cmd.Parameters.AddWithValue("@JobType", UtilityCompnay);
            cmd.Parameters.AddWithValue("@NoOfInvoice", NoOfInvoice);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {

        }

        return dt;
    }

    #endregion

    #region "Update Record If Job Exist OtherWise Insert The Data"

    public int UpdateJobPaidReport(string JobNumber, string TotalAmount, string PaidAmount, string RemainAmount, string PaidStatus, string PaymentType, string PaymentNo, int JobID, string UtilityCompnay)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_IsertUpdatePaidReportByJobNumber";
            cmd.Parameters.AddWithValue("@JobID", JobID);
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@PaidTotalAmount", TotalAmount);
            cmd.Parameters.AddWithValue("@PaidAmount", PaidAmount);
            cmd.Parameters.AddWithValue("@Payment_Type", PaymentType);
            cmd.Parameters.AddWithValue("@PaymentType_No", PaymentNo);
            cmd.Parameters.AddWithValue("@PaidRemainingAmount", RemainAmount);
            cmd.Parameters.AddWithValue("@PaidStatus", PaidStatus);
            cmd.Parameters.AddWithValue("@JobCompanyType", UtilityCompnay);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

        }
        catch
        {


        }
        return i;
    }






    public int updatePaidTblChanges(string JobNumber, string PaidTotalAmount, string PaidAmount, string PaidRemainingAmount, string NoOfInvoice, string Payment_Type, string PaymentType_No, string Question, string Comment, string KeepRemain, string NewInvoiceAmt)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_updatePaidTblChanges";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@PaidTotalAmount", PaidTotalAmount);
            cmd.Parameters.AddWithValue("@PaidAmount", PaidAmount);
            cmd.Parameters.AddWithValue("@PaidRemainingAmount", PaidRemainingAmount);
            cmd.Parameters.AddWithValue("@NoOfInvoice", NoOfInvoice);
            cmd.Parameters.AddWithValue("@PaymentType_No", PaymentType_No);
            cmd.Parameters.AddWithValue("@Payment_Type", Payment_Type);
            cmd.Parameters.AddWithValue("@Question", Question);
            cmd.Parameters.AddWithValue("@Comment", Comment);
            cmd.Parameters.AddWithValue("@KeepRemain", KeepRemain);
            cmd.Parameters.AddWithValue("@NewInvoiceAmt", NewInvoiceAmt);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        return i;
    }

    public int UpdatePaidReportForNo(string JobNumber, string NoOfInvoice, string NewInvoiceAmount, string Payment_Type, string PaymentType_No)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_UpdatePaidReportForNo";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@NoOfInvoice", NoOfInvoice);
            cmd.Parameters.AddWithValue("@NewInvoiceAmount", NewInvoiceAmount);
            cmd.Parameters.AddWithValue("@Payment_Type", Payment_Type);
            cmd.Parameters.AddWithValue("@PaymentType_No ", PaymentType_No);
            con.Open();
            //i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        return i;
    }
    //
    #endregion

    #region "Change Job Type"

    public int ChangeJobType(string JobNumber, Boolean Act129, Boolean BaseLoadOnly, Boolean HighPriority, Boolean FullCost, Boolean LowCost, Boolean Act129II)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_changeJobType";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@Act129", Act129);
            cmd.Parameters.AddWithValue("@BaseLoadOnly", BaseLoadOnly);
            cmd.Parameters.AddWithValue("@HighPriority", HighPriority);
            cmd.Parameters.AddWithValue("@FullCost", FullCost);
            cmd.Parameters.AddWithValue("@LowCost", LowCost);
            cmd.Parameters.AddWithValue("@Act129II", Act129II);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();

        }
        catch
        {

        }
        return i;
    }

    #endregion






    #region Show Payment

    public DataSet ShowAllPayments()
    {
        DataSet dt = new DataSet();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_showAllPayment";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }

    public DataSet ShowAllPaymentsOldPaid()
    {
        DataSet dt = new DataSet();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_showAllPaymentOldPaid";
            //con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            //cmd.ExecuteNonQuery();
            //con.Close();

        }
        catch (Exception ex)
        {
        }
        return dt;
    }



    public DataTable FillEmpDrowpDown(string emp)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_ShowPaymentByEmp";
            cmd.Parameters.AddWithValue("@ClientName", emp);
            //con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }

    public DataTable FillEmpLeaveDropDown(string Login,int ID)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "View_User_Details";
            cmd.Parameters.Add("@Mode", "Usr_Leave_sel");
            cmd.Parameters.AddWithValue("@Login", Login);
            cmd.Parameters.AddWithValue("@ID", ID);
            //con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }

    public DataTable EmpDropDownInUser()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "View_Occurrences_Details";
            cmd.Parameters.Add("@Mode", "Usr_sel");
        
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }




    public DataTable FillEmpRejected(string emp)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_ShowRejectedPaymentByEmp";
            cmd.Parameters.AddWithValue("@ClientName", emp);
            //con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            //cmd.ExecuteNonQuery();
            //con.Close();

        }
        catch (Exception ex)
        {
        }
        return dt;
    }


    public DataTable FillEmpDrowpDownOldPaid(string emp)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_ShowPaymentByEmpOldPaid";
            cmd.Parameters.AddWithValue("@ClientName", emp);
            //con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            //cmd.ExecuteNonQuery();
            //con.Close();

        }
        catch (Exception ex)
        {
        }
        return dt;
    }



    public void updatePaymentStatus(string sbId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_updatePaymentStatus";
        cmd.Parameters.AddWithValue("@Submit_id", sbId);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public int UpdateReOpenInvoice(int sbId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateReOpenInvoice";
        cmd.Parameters.AddWithValue("@Submit_id", sbId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }






    public void DeletePayment(string sbId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeletePayment";
        cmd.Parameters.AddWithValue("@Submit_id", sbId);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }




    public DataTable FillEmpNotPaidDrowpDown(string emp)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_ShowNPPaymentByEmp";
            cmd.Parameters.AddWithValue("@ClientName", emp);
            //con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            //cmd.ExecuteNonQuery();
            //con.Close();

        }
        catch (Exception ex)
        {
        }
        return dt;
    }


    public DataTable FillEmpNotPaidDrowpDownOldPaid(string emp)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_ShowNPPaymentByEmpOldPaid";
            cmd.Parameters.AddWithValue("@ClientName", emp);
            //con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            //cmd.ExecuteNonQuery();
            //con.Close();

        }
        catch (Exception ex)
        {
        }
        return dt;
    }


    #endregion



    public void UpdateAmt(string jobNo, string Pamt, string Ramt, string Tamt)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "update tbl_PaidReport set PaidAmount=@PaidAmount , PaidRemainingAmount=@PaidRemainingAmount , PaidTotalAmount=@PaidTotalAmount where JobNumber=@JobNumber";
        cmd.Parameters.AddWithValue("@JobNumber", jobNo);
        cmd.Parameters.AddWithValue("@PaidAmount", Pamt);
        cmd.Parameters.AddWithValue("@PaidRemainingAmount", Ramt);
        cmd.Parameters.AddWithValue("@PaidTotalAmount", Tamt);
        con.Open();
        cmd.ExecuteScalar();
        con.Close();
    }


    /*     TEMP PROC    */

    public int ImportJob(string jobNumber)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "tempProc";
            cmd.Parameters.AddWithValue("@jobNumber", jobNumber);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

        }
        catch
        {


        }
        return i;

    }

    /*     End    */


    public int UpdatePaidReport(int PaidID, DateTime UpdatedDate, string Payment_Type, string PaymentType_No)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Prc_UpdatePaidReport";
            cmd.Parameters.AddWithValue("@PaidID", PaidID);
            cmd.Parameters.AddWithValue("@UpdatedDate", UpdatedDate);
            cmd.Parameters.AddWithValue("@Payment_Type", Payment_Type);
            cmd.Parameters.AddWithValue("@PaymentType_No", PaymentType_No);

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

        }
        catch
        {
        }
        return i;

    }


    public void UpdateCheckbox(int PaidID)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_UpdateCheckbox";
            cmd.Parameters.AddWithValue("@PaidID", PaidID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }

    public DataTable All_PaidReportByDate(string monthTo, string monthFrom)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_PaidReportByDate";
            cmd.Parameters.AddWithValue("@monthFrom", monthFrom);
            cmd.Parameters.AddWithValue("@monthTo", monthTo);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }

}
