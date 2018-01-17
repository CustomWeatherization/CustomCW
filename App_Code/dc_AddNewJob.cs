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
using System.Net.Mail;
using System.Net;
using System.Web.Mail;
using System.Collections.Generic;


/// <summary>
/// Summary description for dc_AddNewJob
/// </summary>
public class dc_AddNewJob
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString);
    public dc_AddNewJob()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region Show all County

    public DataTable ShowCounties()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectCounties";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }
    #endregion

    #region Show all State
    public DataTable ShowStates()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectStates";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    #endregion
    #region Show all Companies
    public DataTable ShowUtilityCompanies()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectUtilityCompanies";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }
    #endregion

    #region Insert New Job in job table
    public void InserJob(string JobNumber,string WarmOrWarmPlus,string DateAssigned,string DateCompleted,string AuditScheduleDate,int UtilityCompany1,int UtilityCompany2,
        string FirstName,string LastName,string AccountNumber,string MailingAddress1,string ServiceAddress1,string MailingCity,string ServiceCity,int MailingState,int ServiceState,
        string MailingZipCode,string ServiceZipCode,string Email,string YearHomeBuilt,int ServiceCounty,string HomePhone,string CellPhone,int NumberOfOccupants,string HeatSource,string TypeOfHeat,
        string WaterHeaterType,string AirConditionerType,string NumACUnits,string YearlyKWHHours,string JuneKWHHours,string JulyKWHHours,string AugustKWHHours,string SeptemberKWHHours,string Low1KWHHours,
        string Low2KWHHours,string BaseLoad,string TWSeasonal,string TSSeasonal,string SpendingAllowance,string ONTRACK,string OwnerTenant,string LandLordName,string LandLordPhone,string LLEmailOrFax,
        string LLAddress,string LLCity,int LLState,string LLZipCode,string PCAP,decimal PCapAmount,string TODCUSTOMER,string SSNumLast4,string SummerSeasonalUse,string WinterSeasonalUse,
        string AnnualBaseUse,string TotalAnnualUse,string ContactDate,string ContactTime, int ContactType,int ContactPerson,int ContactResult,string CWReturnDate,bool Act129,bool Act129II,
        bool Inspection,bool Remedial,bool BaseLoadOnly,bool HighPriority,bool FullCost,string Login,bool LowCost,string OnTrackAmount,string WorkPhone,decimal SeasonalSpendingAllowance,string zone,
        int Uid,string JobVendor, double ShellAllowance, double RepairAllowance, double HealthAllowance, double BudgetAllowance)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertJob";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@DateAssigned", DateAssigned);
            cmd.Parameters.AddWithValue("@AuditScheduleDate", AuditScheduleDate);
            cmd.Parameters.AddWithValue("@DateCompleted", DateCompleted);
            cmd.Parameters.AddWithValue("@UtilityCompany1", UtilityCompany1);
            cmd.Parameters.AddWithValue("@UtilityCompany2", UtilityCompany2);
            cmd.Parameters.AddWithValue("@zone", zone);
            cmd.Parameters.AddWithValue("@FirstName", FirstName);
            cmd.Parameters.AddWithValue("@LastName", LastName);
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
            cmd.Parameters.AddWithValue("@MailingAddress1", MailingAddress1);
            cmd.Parameters.AddWithValue("@ServiceAddress1", ServiceAddress1);
            cmd.Parameters.AddWithValue("@MailingCity", MailingCity);
            cmd.Parameters.AddWithValue("@ServiceCity", ServiceCity);
            cmd.Parameters.AddWithValue("@MailingState", MailingState);
            cmd.Parameters.AddWithValue("@ServiceState", ServiceState);
            cmd.Parameters.AddWithValue("@MailingZipCode", MailingZipCode);
            cmd.Parameters.AddWithValue("@ServiceZipCode", ServiceZipCode);
            cmd.Parameters.AddWithValue("@YearHomeBuilt", YearHomeBuilt);
            cmd.Parameters.AddWithValue("@ServiceCounty", ServiceCounty);
            cmd.Parameters.AddWithValue("@HomePhone", HomePhone);
            cmd.Parameters.AddWithValue("@CellPhone", CellPhone);
            cmd.Parameters.AddWithValue("@NumberOfOccupants", NumberOfOccupants);
            cmd.Parameters.AddWithValue("@HeatSource", HeatSource);
            cmd.Parameters.AddWithValue("@TypeOfHeat", TypeOfHeat);
            cmd.Parameters.AddWithValue("@WaterHeaterType", WaterHeaterType);
            cmd.Parameters.AddWithValue("@AirConditionerType", AirConditionerType);
            cmd.Parameters.AddWithValue("@NumACUnits", NumACUnits);
            cmd.Parameters.AddWithValue("@YearlyKWHHours", YearlyKWHHours);
            cmd.Parameters.AddWithValue("@JuneKWHHours", JuneKWHHours);
            cmd.Parameters.AddWithValue("@JulyKWHHours", JulyKWHHours);
            cmd.Parameters.AddWithValue("@AugustKWHHours", AugustKWHHours);
            cmd.Parameters.AddWithValue("@SeptemberKWHHours", SeptemberKWHHours);
            cmd.Parameters.AddWithValue("@Low1KWHHours", Low1KWHHours);
            cmd.Parameters.AddWithValue("@Low2KWHHours", Low2KWHHours);
            cmd.Parameters.AddWithValue("@BaseLoad", BaseLoad);
            cmd.Parameters.AddWithValue("@TWSeasonal", TWSeasonal);
            cmd.Parameters.AddWithValue("@TSSeasonal", TSSeasonal);
            cmd.Parameters.AddWithValue("@SpendingAllowance", SpendingAllowance);
            cmd.Parameters.AddWithValue("@ONTRACK", ONTRACK);
            cmd.Parameters.AddWithValue("@OwnerTenant", OwnerTenant);
            cmd.Parameters.AddWithValue("@LandLordName", LandLordName);
            cmd.Parameters.AddWithValue("@LandLordPhone", LandLordPhone);
            cmd.Parameters.AddWithValue("@LLEmailOrFax", LLEmailOrFax);
            cmd.Parameters.AddWithValue("@LLAddress", LLAddress);
            cmd.Parameters.AddWithValue("@LLCity", LLCity);
            cmd.Parameters.AddWithValue("@LLState", LLState);
            cmd.Parameters.AddWithValue("@LLZipCode", LLZipCode);
            cmd.Parameters.AddWithValue("@PCAP", PCAP);
            cmd.Parameters.AddWithValue("@PCapAmount", PCapAmount);
            cmd.Parameters.AddWithValue("@TODCUSTOMER", TODCUSTOMER);
            cmd.Parameters.AddWithValue("@SSNumLast4", SSNumLast4);
            cmd.Parameters.AddWithValue("@SummerSeasonalUse", SummerSeasonalUse);
            cmd.Parameters.AddWithValue("@WinterSeasonalUse", WinterSeasonalUse);
            cmd.Parameters.AddWithValue("@AnnualBaseUse", AnnualBaseUse);
            cmd.Parameters.AddWithValue("@TotalAnnualUse", TotalAnnualUse);
            cmd.Parameters.AddWithValue("@ContactDate", ContactDate);
            cmd.Parameters.AddWithValue("@ContactTime", ContactTime);
            cmd.Parameters.AddWithValue("@ContactType", ContactType);
            cmd.Parameters.AddWithValue("@ContactPerson", ContactPerson);
            cmd.Parameters.AddWithValue("@ContactResult", ContactResult);
            cmd.Parameters.AddWithValue("@CWReturnDate", CWReturnDate);
            cmd.Parameters.AddWithValue("@Act129", Act129);
            cmd.Parameters.AddWithValue("@Act129II", Act129II);
            cmd.Parameters.AddWithValue("@Inspection", Inspection);
            cmd.Parameters.AddWithValue("@Remedial", Remedial);
            cmd.Parameters.AddWithValue("@BaseLoadOnly", BaseLoadOnly);
            cmd.Parameters.AddWithValue("@HighPriority", HighPriority);
            cmd.Parameters.AddWithValue("@FullCost", FullCost);
            cmd.Parameters.AddWithValue("@Login", Login);
            cmd.Parameters.AddWithValue("@LowCost", LowCost);
            cmd.Parameters.AddWithValue("@OnTrackAmount", OnTrackAmount);
            cmd.Parameters.AddWithValue("@WorkPhone", WorkPhone);
            cmd.Parameters.AddWithValue("@SeasonalSpendingAllowance", SeasonalSpendingAllowance);
            cmd.Parameters.AddWithValue("@WarmOrWarmPlus", WarmOrWarmPlus);
            cmd.Parameters.AddWithValue("@Uid", Uid);
            cmd.Parameters.AddWithValue("@JobVendor", JobVendor);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@ShellAllowance", ShellAllowance);
            cmd.Parameters.AddWithValue("@RepairAllowance", RepairAllowance);
            cmd.Parameters.AddWithValue("@HealthAllowance", HealthAllowance);
            cmd.Parameters.AddWithValue("@BudgetAllowance", BudgetAllowance);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception ex)
        {
        }
    }
    #endregion

    #region insert vendor job
    public void InsertVendorJob(string JobNumber,
        string Net,
        string DueDate,
        string SendByDate,
        string Category,
        string AccountNumber,
        string PhoneNum,
        string Contactperson,
        string CompanyName,
        string MailingAddress1,
        string Address1,
        string MailingCity,
        string City,
        int MailingState,
        string State,
        string MailingZipCode,
        string ZipCode, string Email,
        string JobVendor, string VendorImgPath, string VendorPdfPath, string cntctPhoneNum, string WorkPhone, string txtExt
       )
    // string VendorImgPath,
    //string VendorPdfPath
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertVendorJob";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@Net", Net);
            cmd.Parameters.AddWithValue("@DueDate", DueDate);
            cmd.Parameters.AddWithValue("@SendByDate", SendByDate);
            cmd.Parameters.AddWithValue("@Category", Category);
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
            cmd.Parameters.AddWithValue("@PhoneNum", PhoneNum);
            cmd.Parameters.AddWithValue("@ContactPerson", Contactperson);
            cmd.Parameters.AddWithValue("@CompanyName", CompanyName);
            cmd.Parameters.AddWithValue("@MailingAddress1", MailingAddress1);
            cmd.Parameters.AddWithValue("@Address1", Address1);
            cmd.Parameters.AddWithValue("@MailingCity", MailingCity);
            cmd.Parameters.AddWithValue("@City", City);
            cmd.Parameters.AddWithValue("@MailingState", MailingState);
            cmd.Parameters.AddWithValue("@State", State);
            cmd.Parameters.AddWithValue("@MailingZip", MailingZipCode);
            cmd.Parameters.AddWithValue("@zip", ZipCode);
            cmd.Parameters.AddWithValue("@JobVendor", JobVendor);
            cmd.Parameters.AddWithValue("@VendorImgPath", VendorImgPath);
            cmd.Parameters.AddWithValue("@VendorPdfPath", VendorPdfPath);
            cmd.Parameters.AddWithValue("@cntctPhoneNum", cntctPhoneNum);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@WorkPhone", WorkPhone);
            cmd.Parameters.AddWithValue("@txtExt", txtExt);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception ex)
        {

        }
    }
    #endregion
    #region Update Job in job table

    public void UpdateJob(string JobNumber, string DateAssigned, string DateCompleted, int UtilityCompany1, int UtilityCompany2, string FirstName, string LastName, string AccountNumber, string MailingAddress1, string ServiceAddress1, string MailingCity, string ServiceCity, int MailingState, int ServiceState, string MailingZipCode, string ServiceZipCode, string YearHomeBuilt, int ServiceCounty, string HomePhone, string CellPhone, int NumberOfOccupants, string HeatSource, string TypeOfHeat, string WaterHeaterType, string AirConditionerType, int NumACUnits, int YearlyKWHHours, int JuneKWHHours, int JulyKWHHours, int AugustKWHHours, int SeptemberKWHHours, int Low1KWHHours, int Low2KWHHours, int BaseLoad, int TWSeasonal, int TSSeasonal, string SpendingAllowance, string ONTRACK, string OwnerTenant, string LandLordName, string LandLordPhone, string LLEmailOrFax, string LLAddress, string LLCity, int LLState, string LLZipCode, string PCAP, string PCapAmount, string TODCUSTOMER, string SSNumLast4, int SummerSeasonalUse, int WinterSeasonalUse, int AnnualBaseUse, int TotalAnnualUse, string ContactDate, string ContactTime, int ContactType, int ContactPerson, int ContactResult, string CWReturnDate, string Act129, string BaseLoadOnly, string HighPriority, string FullCost, string LowCost, string OnTrackAmount, string WorkPhone, string RescheduledDate, string CommentHeader, string UserLogin, string AuditorName)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertJob";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@DateAssigned", DateAssigned);
            cmd.Parameters.AddWithValue("@DateCompleted", DateCompleted);
            cmd.Parameters.AddWithValue("@UtilityCompany1", UtilityCompany1);
            cmd.Parameters.AddWithValue("@UtilityCompany2", UtilityCompany2);

            cmd.Parameters.AddWithValue("@FirstName", FirstName);
            cmd.Parameters.AddWithValue("@LastName", LastName);
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
            cmd.Parameters.AddWithValue("@MailingAddress1", MailingAddress1);
            cmd.Parameters.AddWithValue("@ServiceAddress1", ServiceAddress1);
            cmd.Parameters.AddWithValue("@MailingCity", MailingCity);


            cmd.Parameters.AddWithValue("@ServiceCity", ServiceCity);
            cmd.Parameters.AddWithValue("@MailingState", MailingState);
            cmd.Parameters.AddWithValue("@ServiceState", ServiceState);
            cmd.Parameters.AddWithValue("@MailingZipCode", MailingZipCode);
            cmd.Parameters.AddWithValue("@ServiceZipCode", ServiceZipCode);
            cmd.Parameters.AddWithValue("@YearHomeBuilt", YearHomeBuilt);


            cmd.Parameters.AddWithValue("@ServiceCounty", ServiceCounty);
            cmd.Parameters.AddWithValue("@HomePhone", HomePhone);
            cmd.Parameters.AddWithValue("@CellPhone", CellPhone);
            cmd.Parameters.AddWithValue("@NumberOfOccupants", NumberOfOccupants);
            cmd.Parameters.AddWithValue("@HeatSource", HeatSource);
            cmd.Parameters.AddWithValue("@TypeOfHeat", TypeOfHeat);

            cmd.Parameters.AddWithValue("@WaterHeaterType", WaterHeaterType);
            cmd.Parameters.AddWithValue("@AirConditionerType", AirConditionerType);
            cmd.Parameters.AddWithValue("@NumACUnits", NumACUnits);
            cmd.Parameters.AddWithValue("@YearlyKWHHours", YearlyKWHHours);
            cmd.Parameters.AddWithValue("@JuneKWHHours", JuneKWHHours);
            cmd.Parameters.AddWithValue("@JulyKWHHours", JulyKWHHours);

            cmd.Parameters.AddWithValue("@AugustKWHHours", AugustKWHHours);
            cmd.Parameters.AddWithValue("@SeptemberKWHHours", SeptemberKWHHours);
            cmd.Parameters.AddWithValue("@Low1KWHHours", Low1KWHHours);
            cmd.Parameters.AddWithValue("@Low2KWHHours", Low2KWHHours);
            cmd.Parameters.AddWithValue("@BaseLoad", BaseLoad);
            cmd.Parameters.AddWithValue("@TWSeasonal", TWSeasonal);
            cmd.Parameters.AddWithValue("@TSSeasonal", TSSeasonal);

            cmd.Parameters.AddWithValue("@SpendingAllowance", SpendingAllowance);
            cmd.Parameters.AddWithValue("@ONTRACK", ONTRACK);
            cmd.Parameters.AddWithValue("@OwnerTenant", OwnerTenant);
            cmd.Parameters.AddWithValue("@LandLordName", LandLordName);
            cmd.Parameters.AddWithValue("@LandLordPhone", LandLordPhone);



            cmd.Parameters.AddWithValue("@LLEmailOrFax", LLEmailOrFax);
            cmd.Parameters.AddWithValue("@LLAddress", LLAddress);
            cmd.Parameters.AddWithValue("@LLCity", LLCity);
            cmd.Parameters.AddWithValue("@LLState", LLState);
            cmd.Parameters.AddWithValue("@LLZipCode", LLZipCode);



            cmd.Parameters.AddWithValue("@PCAP", PCAP);
            cmd.Parameters.AddWithValue("@PCapAmount", PCapAmount);
            cmd.Parameters.AddWithValue("@TODCUSTOMER", TODCUSTOMER);
            cmd.Parameters.AddWithValue("@SSNumLast4", SSNumLast4);
            cmd.Parameters.AddWithValue("@SummerSeasonalUse", SummerSeasonalUse);


            cmd.Parameters.AddWithValue("@WinterSeasonalUse", WinterSeasonalUse);
            cmd.Parameters.AddWithValue("@AnnualBaseUse", AnnualBaseUse);
            cmd.Parameters.AddWithValue("@TotalAnnualUse", TotalAnnualUse);
            cmd.Parameters.AddWithValue("@ContactDate", ContactDate);
            cmd.Parameters.AddWithValue("@ContactTime", ContactTime);


            cmd.Parameters.AddWithValue("@ContactType", ContactType);
            cmd.Parameters.AddWithValue("@ContactPerson", ContactPerson);
            cmd.Parameters.AddWithValue("@ContactResult", ContactResult);
            cmd.Parameters.AddWithValue("@CWReturnDate", CWReturnDate);
            cmd.Parameters.AddWithValue("@Act129", Act129);


            cmd.Parameters.AddWithValue("@BaseLoadOnly", BaseLoadOnly);
            cmd.Parameters.AddWithValue("@HighPriority", HighPriority);
            cmd.Parameters.AddWithValue("@FullCost", FullCost);
            cmd.Parameters.AddWithValue("@LowCost", LowCost);
            cmd.Parameters.AddWithValue("@OnTrackAmount", OnTrackAmount);
            cmd.Parameters.AddWithValue("@WorkPhone", WorkPhone);


            cmd.Parameters.AddWithValue("@RescheduledDate", RescheduledDate);
            cmd.Parameters.AddWithValue("@CommentHeader", CommentHeader);
            cmd.Parameters.AddWithValue("@UserLogin", UserLogin);
            cmd.Parameters.AddWithValue("@AuditorName", AuditorName);

        }
        catch (Exception ex)
        {


        }
    }

    #endregion
    #region Get Rejected messege
    public DataTable RejectedCommentbyJobnumber(string jobnumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select top 1 JobMessageText.[Message] from  JobsMessages full outer join JobMessageText on JobsMessages.TheMessageID = JobMessageText.MsgID where JobsMessages.JobNumber= '" + jobnumber + "' order by JobsMessages.ID desc";

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {
        }

        return dt;
    }
    #endregion
    #region Get JOb status by Number

    public DataTable ShowJobByJobNumber_ByJobNumber(string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectJobByJobNumber";

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }

    #endregion

    #region show vendor Number
    public DataTable ShowVendorByVendorNumber_ByVendorNumber(string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "SelectVendorByVendorNumber";
            cmd.CommandText = "SelectVendorByVendorNumber";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.AddWithValue("@VendorNumber", JobNumber);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }
    #endregion


    #region Show all Contact Person

    public DataTable ShowContactPerson()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectContactPerson";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }

        return dt;
    }

    #endregion

    #region Show all Employee

    public DataTable XShowEmployee()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectUsers";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }
    public DataTable ShowEmployee()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "dbo.Sel_Reg";
            cmd.Parameters.Add("@Mode", "NewUsr_sel");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    #endregion

    #region Show all Contact Type

    public DataTable ShowContactType()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectContactType";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    #endregion

    #region Show all Contact Result

    public DataTable ShowContactResult()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectContactResult";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    #endregion

    #region Show all Select CWContact Attempts Report

    public DataTable ShowContactAttemptsReport(string JobNumber, string GT)
    {
        string ddd = GT;
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            if (GT == "Vendor")
            {
                cmd.CommandText = "SelectCWContactAttemptsReportVendor";
                // cmd.CommandText = "SelectCWContactAttemptsReport";
                cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            }
            else
            {

                cmd.CommandText = "SelectCWContactAttemptsReport";
                cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {
        }

        return dt;
    }

    #endregion

    #region Show all Top 1 Contact Attempt

    public DataTable ShowLatestContactAttemptsReport(string JobNumber, int ContactResult)
    {

        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ShowLatestContactAttemptsReport";
            cmd.Parameters.Add("@JobNumber", SqlDbType.NVarChar);
            cmd.Parameters.Add("@ContactResult", SqlDbType.Int);
            cmd.Parameters["@JobNumber"].Value = JobNumber;//@ContactResult
            cmd.Parameters["@ContactResult"].Value = ContactResult;
            //cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
        }
        catch (Exception ex)
        {
        }
        return dt;

    }

    #endregion

    #region Insert Job Comments

    public DataTable InsertJobComments(string JobNumber, string Comments, string Commentheader, string UserLogin)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertJobComments";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@Comments", Comments);
            cmd.Parameters.AddWithValue("@CommentHeader", Commentheader);
            cmd.Parameters.AddWithValue("@UserLogin", UserLogin);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
        int i= cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    #endregion

    #region Show all Comments by job number

    public DataTable ShowCommentsHistory(string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectCommentsHistoryForAJob";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }
    #endregion

    #region Dose job exists or not


    public DataTable GetJobExistOrNot(string NewJobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DoesJobExist";
            cmd.Parameters.AddWithValue("@NewJobNumber", NewJobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }
    #endregion

    #region Does Vendor job exists or not
    public DataTable GetVendorJobExistsorNot(string NewVendorJobNumber)
    {
        DataTable dtv = new DataTable();
        SqlCommand cmd1 = new SqlCommand();
        try
        {
            cmd1.Connection = con;
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.CommandText = "sp_DoesVendorJobExist";
            cmd1.Parameters.AddWithValue("@NewVendorJobNumber", NewVendorJobNumber);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            da1.Fill(dtv);
        }
        catch (Exception ex)
        {

        }

        return dtv;

    }
    #endregion

    #region Search job exists or not
    public DataTable SearchJob(string JobNumber, string LastName, string AccountNumber, string Phone, string UMode, int Usrid)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SearchJobs";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@LastName", LastName);
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
            cmd.Parameters.AddWithValue("@Phone", Phone);
            cmd.Parameters.AddWithValue("@USRID", Usrid);
            cmd.Parameters.AddWithValue("@mode", UMode);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }
    #endregion

    #region Search vendor job exist or not
    public DataTable SearchVendorJob(string VendorNumber, string VendorName, string AccountNumber, string Phone, string UMode, int Usrid)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SearchVendorJobs";
            cmd.Parameters.AddWithValue("@VendorNumber", VendorNumber);
            cmd.Parameters.AddWithValue("@VendorName", VendorName);
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
            cmd.Parameters.AddWithValue("@Phone", Phone);
            cmd.Parameters.AddWithValue("@USRID", Usrid);
            cmd.Parameters.AddWithValue("@mode", UMode);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }
    #endregion

    #region Insert Job Message Text
    public int InsertJobMessage(string Message)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertJobMessageText";
            cmd.Parameters.AddWithValue("@Message", Message);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
        }
        catch (Exception ex)
        {
        }
        return i;
    }
    #endregion


    public int UpdateResponseMessage(string Message, int OccurId, string ResponseDate, int PassCode, bool ResponseStatus)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "dbo.View_Occurrences_Details";
            cmd.Parameters.Add("@Mode", "Upd_Resp_Occur");
            cmd.Parameters.AddWithValue("@Response", Message);
            cmd.Parameters.AddWithValue("@OccurrenceID", OccurId);
            cmd.Parameters.AddWithValue("@ResponseDate", ResponseDate);
            cmd.Parameters.AddWithValue("@Passcode", PassCode);
            cmd.Parameters.AddWithValue("@ResponseStatus", ResponseStatus);


            con.Open();
            i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
        }
        catch (Exception ex)
        {
        }
        return i;
    }

    #region Insert Job Message
    public void InsertJobMessageReadUnread(int SenderUserID, int RecipientUserID, string JobNumber, int TheMessageID, string readUnread)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertJobMessages";
            cmd.Parameters.AddWithValue("@SenderUserID", SenderUserID);
            cmd.Parameters.AddWithValue("@RecipientUserID", RecipientUserID);
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@TheMessageID", TheMessageID);
            cmd.Parameters.AddWithValue("@ReadUnread", readUnread);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
        }
    }

    public void InsertJobMessageReadUnread1(int SenderUserID, int RecipientUserID, string JobNumber, int TheMessageID, string readUnread, string Recipients, string MsgFrom, string MsgTo, string MsgCC, string MsgFromID, string MsgToID, string MsgCCID)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertJobMessages";
            cmd.Parameters.AddWithValue("@SenderUserID", SenderUserID);
            cmd.Parameters.AddWithValue("@RecipientUserID", RecipientUserID);
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@TheMessageID", TheMessageID);
            cmd.Parameters.AddWithValue("@ReadUnread", readUnread);
            cmd.Parameters.AddWithValue("@MsgFrom", MsgFrom);
            cmd.Parameters.AddWithValue("@MsgTo", MsgTo);
            cmd.Parameters.AddWithValue("@MsgCC", MsgCC);
            cmd.Parameters.AddWithValue("@MsgFromID", MsgFromID);
            cmd.Parameters.AddWithValue("@MsgToID", MsgToID);
            cmd.Parameters.AddWithValue("@MsgCCID", MsgCCID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
        }
    }
    public void SendEmail(string subject, string body, string to, string[] CC)
    {
        // using (System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage("customweatherization.noreply@gmail.com", "receivemailtesting@gmail.com,applicationneedtesting@gmail.com"))
        using (System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage("customweatherization.noreply@gmail.com", to))     
        {
            if (CC != null)
            {
                foreach (string item in CC)
                {
                    if (item != "")
                        mm.CC.Add(new MailAddress(item));
                }
            }
            mm.Subject = subject;
            mm.Body = body;
            mm.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("customweatherization.noreply@gmail.com", "Custom123");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }
    }




    public string getEmailAddress(string IDs)
    {
        IDs = IDs.TrimEnd(',');
        string Emails = "";
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select Email from User_registration join Users on User_registration.Login=Users.CWLogin where ID in (" + IDs + ")";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
            foreach (DataRow row in dt.Rows)
            {
                Emails += Convert.ToString(row["Email"]);
                Emails += ",";

            }
            Emails = Emails.TrimEnd(',');
        }
        catch (Exception ex)
        {
        }
        return Emails;
    }


    public bool SendEmail1(string emailTo, string emailFrom, string subject, string mailInfo)
    {
        System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
        mailMessage.From = new System.Net.Mail.MailAddress(emailFrom);
        mailMessage.To.Add(new System.Net.Mail.MailAddress(emailTo));
        mailMessage.IsBodyHtml = true;
        mailMessage.Subject = subject;
        mailMessage.Body = mailInfo.ToString();
        System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient();
        smtpClient.Host = "s2smtpout.secureserver.net";
        try
        {
            smtpClient.Send(mailMessage);
            return true;
        }
        catch (System.Net.Mail.SmtpException smtpExc)
        {
            //Log error information on which email failed.
            return false;
        }
        catch (Exception ex)
        {
            //Log general errors
            return false;
        }
    }
    public void InsertJobMessageReadUnread2(int SenderUserID, int RecipientUserID, string JobNumber, int TheMessageID, string readUnread, string Recipients, string MsgFrom, string MsgTo, string MsgCC, string MsgFromID, string MsgToID, string MsgCCID, string MessageType, string RequestType)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertJobMessages";
            cmd.Parameters.AddWithValue("@SenderUserID", SenderUserID);
            cmd.Parameters.AddWithValue("@RecipientUserID", RecipientUserID);
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@TheMessageID", TheMessageID);
            cmd.Parameters.AddWithValue("@ReadUnread", readUnread);
            cmd.Parameters.AddWithValue("@MsgFrom", MsgFrom);
            cmd.Parameters.AddWithValue("@MsgTo", MsgTo);
            cmd.Parameters.AddWithValue("@MsgCC", MsgCC);
            cmd.Parameters.AddWithValue("@MsgFromID", MsgFromID);
            cmd.Parameters.AddWithValue("@MsgToID", MsgToID);
            cmd.Parameters.AddWithValue("@MsgCCID", MsgCCID);
            cmd.Parameters.AddWithValue("@MsgType", MessageType);
            cmd.Parameters.AddWithValue("@RequestType", RequestType);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
        }
    }
    #endregion

    //


    public void UpdtaePdfNew(string jobs, string AllPdfName)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ProcUpdtaePdf";
            cmd.Parameters.AddWithValue("@VendorPdfPath", AllPdfName);
            cmd.Parameters.AddWithValue("@JobNumber", jobs);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
        }
    }


    public void UpdtaeReturnDate(string jobs)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_UpdtaeReturnDate";
            cmd.Parameters.AddWithValue("@JobNumber", jobs);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
        }
    }







    public DataTable getDateOfAudit(string jobNo, string JobType)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            if (JobType == "PPL")
            {
                cmd.CommandText = "select DateOfAudit from PPLAuditPage1Ver2 where jobNumber=@JobNumber";
            }
            if (JobType == "MET ED")
            {
                cmd.CommandText = "select AuditDate from METEDAuditPage1 where jobNumber=@JobNumber";
            }
            cmd.Parameters.AddWithValue("@JobNumber", jobNo);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

        }
        catch (Exception ex)
        {
        }
        return dt;
    }
    public int getIDSubmitName(string Fname, string Lname)
    {
        int i = 0;
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select top(1) ID from users where FirstName=@Fname And LastName=@Lname order by ID desc";
            cmd.Parameters.AddWithValue("@Fname", Fname);
            cmd.Parameters.AddWithValue("@Lname", Lname);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            i = Convert.ToInt32(dt.Rows[0]["ID"]);
            con.Close();
        }
        catch (Exception ex)
        {
        }
        return i;
    }
    public DataTable getAuditCompleteDate(string jobNo, string JobType)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select DateAuditComplete from Jobs where jobNumber=@JobNumber";
            cmd.Parameters.AddWithValue("@JobNumber", jobNo);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

        }
        catch (Exception ex)
        {
        }
        return dt;
    }
    #region Change Dheeraj Update
    public int UpdateChange(string DateScheduledComments, string JobNumber, string DateCompleted, string ReturnDate, string AuditorName, int Utility, string GoBackRecive, string GoBackReturn, string CrewCheifName)
    {
        try
        {
            if (AuditorName == "Select" || AuditorName == "")
            {
                AuditorName = "0";
            }
            if (CrewCheifName == "Select")
            {
                CrewCheifName = "0";
            }
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "update Jobs set DateScheduledComments=@DateScheduledComments,DateCompleted=@DateCompleted,CWReturnDate=@ReturnDate,AuditorName=@AuditorName where JobNumber=@JobNumber";
            cmd.CommandText = "proc_ChangeAuditorOrDate";
            cmd.Parameters.AddWithValue("@DateScheduledComments", DateScheduledComments);
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@DateCompleted", DateCompleted);
            cmd.Parameters.AddWithValue("@ReturnDate", ReturnDate);
            cmd.Parameters.AddWithValue("@UtilityCompany1", Utility);
            cmd.Parameters.AddWithValue("@AuditorName", AuditorName);
            cmd.Parameters.AddWithValue("@GoBackRecive", GoBackRecive);
            cmd.Parameters.AddWithValue("@GoBackReturne", GoBackReturn);
            cmd.Parameters.AddWithValue("@CrewCheifName", CrewCheifName);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }
        catch
        {
            return 0;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

    }

    string eventcolor1;
    //public string insertStatusAndDate(string JobNumber, string Status, string Date, string RescheduledDate, string ScheduledDate, string AuditScheduleDate, string GoBackRecive, string GoBackReturned, string GoBackSchedule)
    public string insertStatusAndDate(string JobNumber, string Status, string Date, string AuditScheduleDate, string GoBackSchedule, string RescheduledDate, string ScheduledDate, string Name, string ServiceAddress, string Phone, string ContactResult, string CrewCheifName, string AuditorName, string jobtype, string allday, string status, string time, string contact, string eventcolor)
    {

        string i = "";
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update Jobs set RescheduledDate=@RescheduledDate,GoBackSchedule=@GoBackSchedule,DateScheduled=@ScheduledDate,AuditScheduleDate=@AuditScheduleDate,Status=@Status,ContactDateTime=@ContactDateTime where JobNumber=@JobNumber";
            cmd.Parameters.AddWithValue("@RescheduledDate", RescheduledDate);
            cmd.Parameters.AddWithValue("@ScheduledDate", ScheduledDate);
            cmd.Parameters.AddWithValue("@AuditScheduleDate", AuditScheduleDate);
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@Status", Status);
            cmd.Parameters.AddWithValue("@ContactDateTime", Date);
            //cmd.Parameters.AddWithValue("@GoBackRecive", GoBackRecive);
            cmd.Parameters.AddWithValue("@GoBackSchedule", GoBackSchedule);
            // cmd.Parameters.AddWithValue("@GoBackReturne", GoBackReturned);
            DateTime event_end = Convert.ToDateTime("1900 -01-01 00:00:00.000");
            DateTime event_start = Convert.ToDateTime("1900-01-01 00:00:00.000");
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            if (status == "true")
            {
                con.Open();
                SqlCommand color = new SqlCommand("select U.[Id] as [ID],R.Eventcolor from User_registration R JOIN dbo.Users U ON R.Login=U.CWLogin where R.Del_rec=1  and AuditorPayOutPermissionLevel=1 and U.id=" + eventcolor + "", con);
                SqlDataReader reader = color.ExecuteReader();
                if (reader.Read())
                {
                    eventcolor1 = Convert.ToString(reader["Eventcolor"]);

                }
                reader.Close();
                con.Close();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "insert into CalendarEvent1 (Name, ServiceAddress,Phone,ContactResult,CrewCheifName,AuditorName,jobtype,allday,Timeslot,contact,Eventcolor,event_start,event_end) values(@Name, @ServiceAddress,@Phone,@ContactResult,@CrewCheifName,@AuditorName,@jobtype,@allday,@Timeslot,@contact,@Eventcolor,@event_start,@event_end)";
                cmd.Parameters.AddWithValue("@Name", Name);
                cmd.Parameters.AddWithValue("@ServiceAddress", ServiceAddress);
                cmd.Parameters.AddWithValue("@Phone", Phone);
                cmd.Parameters.AddWithValue("@ContactResult", ContactResult);
                cmd.Parameters.AddWithValue("@CrewCheifName", CrewCheifName);
                cmd.Parameters.AddWithValue("@AuditorName", AuditorName);
                cmd.Parameters.AddWithValue("@jobtype", jobtype);
                cmd.Parameters.AddWithValue("@allday", allday);
                cmd.Parameters.AddWithValue("@Timeslot", time);
                cmd.Parameters.AddWithValue("@contact", contact);
                cmd.Parameters.AddWithValue("@Eventcolor", eventcolor1);

                cmd.Parameters.AddWithValue("@event_start", event_start);
                cmd.Parameters.AddWithValue("@event_end", event_end);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }




        }
        catch (Exception ex)
        {
        }
        return i;
    }
    #endregion





    #region Create New Balkrishna Update
    public int UpdateChangeWithJob(string DateAssigned, string DateCompleted, string GoBackRecive, string GoBackSchedule, string GoBackReturne, string AuditScheduleDate, string ReturnDate, string RescheduledDate, string DateScheduled, string DateScheduledComments, string AuditorName, bool Act129, bool Act129II, bool Inspection, bool Remedial, bool BaseLoadOnly, bool HighPriority, bool FullCost, string WarmOrWarmPlus, string FirstName, string LastName, string AccountNumber, string MailingAddress1, string ServiceAddress1, string MailingCity, string ServiceCity, string MailingZipCode, string ServiceZipCode, string Email, string YearHomeBuilt, string HomePhone, string CellPhone, string WorkPhone, int NumberOfOccupants, string Jobnumber, int UtilityCompany1, int UtilityCompany2, string zone, int MailingState, int ServiceState, int ServiceCounty, string HeatSource, string TypeOfHeat, string WaterHeaterType, string AirConditionerType, string NumACUnits, string YearlyKWHHours, string JuneKWHHours, string JulyKWHHours, string AugustKWHHours, string SeptemberKWHHours, string Low1KWHHours, string Low2KWHHours, string BaseLoad, string TWSeasonal, string TSSeasonal, string SpendingAllowance, string ONTRACK, string OwnerTenant, string LandLordName, string LandLordPhone, string LLEmailOrFax, string LLAddress, string LLCity, int LLState, string LLZipCode, string PCAP, decimal PCapAmount, string TODCUSTOMER, string SSNumLast4, string SummerSeasonalUse, string WinterSeasonalUse, string AnnualBaseUse, string TotalAnnualUse, string ContactDate, string ContactTime, int ContactType, int ContactPerson, int ContactResult, string Login, bool LowCost, string OnTrackAmount, decimal SeasonalSpendingAllowance, double ShellAllowance, double RepairAllowance, double HealthAllowance, double BudgetAllowance)
    {
        if (AuditorName == "Select" || AuditorName == "")
        {
            AuditorName = "0";
        }
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateJobWithJob";
            cmd.Parameters.AddWithValue("@DateAssigned", DateAssigned);
            cmd.Parameters.AddWithValue("@DateCompleted", DateCompleted);
            cmd.Parameters.AddWithValue("@CWReturnDate", ReturnDate);
            cmd.Parameters.AddWithValue("@RescheduledDate", RescheduledDate);
            cmd.Parameters.AddWithValue("@DateScheduled", DateScheduled);
            cmd.Parameters.AddWithValue("@DateScheduledComments", DateScheduledComments);
            cmd.Parameters.AddWithValue("@AuditScheduleDate", AuditScheduleDate);

            cmd.Parameters.AddWithValue("@GoBackRecive", GoBackRecive);
            cmd.Parameters.AddWithValue("@GoBackSchedule", GoBackSchedule);
            cmd.Parameters.AddWithValue("@GoBackReturne", GoBackReturne);

            cmd.Parameters.AddWithValue("@AuditorName", AuditorName);
            cmd.Parameters.AddWithValue("@Act129", Act129);
            cmd.Parameters.AddWithValue("@Act129II", Act129II);
            cmd.Parameters.AddWithValue("@Inspection", Inspection);
            cmd.Parameters.AddWithValue("@Remedial", Remedial);
            cmd.Parameters.AddWithValue("@BaseLoadOnly", BaseLoadOnly);
            cmd.Parameters.AddWithValue("@HighPriority", HighPriority);
            cmd.Parameters.AddWithValue("@FullCost", FullCost);
            cmd.Parameters.AddWithValue("@WarmOrWarmPlus", WarmOrWarmPlus);
            cmd.Parameters.AddWithValue("@FirstName", FirstName);
            cmd.Parameters.AddWithValue("@LastName", LastName);
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
            cmd.Parameters.AddWithValue("@MailingAddress1", MailingAddress1);
            cmd.Parameters.AddWithValue("@ServiceAddress1", ServiceAddress1);
            cmd.Parameters.AddWithValue("@MailingCity", MailingCity);
            cmd.Parameters.AddWithValue("@ServiceCity", ServiceCity);
            cmd.Parameters.AddWithValue("@MailingZipCode", MailingZipCode);
            cmd.Parameters.AddWithValue("@ServiceZipCode", ServiceZipCode);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@YearHomeBuilt", YearHomeBuilt);
            cmd.Parameters.AddWithValue("@HomePhone", HomePhone);
            cmd.Parameters.AddWithValue("@CellPhone", CellPhone);
            cmd.Parameters.AddWithValue("@WorkPhone", WorkPhone);
            cmd.Parameters.AddWithValue("@NumberOfOccupants", NumberOfOccupants);
            cmd.Parameters.AddWithValue("@JobNumber", Jobnumber);
            //
            cmd.Parameters.AddWithValue("@UtilityCompany1", UtilityCompany1);
            cmd.Parameters.AddWithValue("@UtilityCompany2", UtilityCompany2);
            cmd.Parameters.AddWithValue("@zone", zone);
            cmd.Parameters.AddWithValue("@MailingState", MailingState);
            cmd.Parameters.AddWithValue("@ServiceState", ServiceState);
            cmd.Parameters.AddWithValue("@ServiceCounty", ServiceCounty);
            cmd.Parameters.AddWithValue("@HeatSource", HeatSource);
            cmd.Parameters.AddWithValue("@TypeOfHeat", TypeOfHeat);
            cmd.Parameters.AddWithValue("@WaterHeaterType", WaterHeaterType);
            cmd.Parameters.AddWithValue("@AirConditionerType", AirConditionerType);
            cmd.Parameters.AddWithValue("@NumACUnits", NumACUnits);
            cmd.Parameters.AddWithValue("@YearlyKWHHours", YearlyKWHHours);
            cmd.Parameters.AddWithValue("@JuneKWHHours", JuneKWHHours);
            cmd.Parameters.AddWithValue("@JulyKWHHours", JulyKWHHours);
            cmd.Parameters.AddWithValue("@AugustKWHHours", AugustKWHHours);
            cmd.Parameters.AddWithValue("@SeptemberKWHHours", SeptemberKWHHours);
            cmd.Parameters.AddWithValue("@Low1KWHHours", Low1KWHHours);
            cmd.Parameters.AddWithValue("@Low2KWHHours", Low2KWHHours);
            cmd.Parameters.AddWithValue("@BaseLoad", BaseLoad);
            cmd.Parameters.AddWithValue("@TWSeasonal", TWSeasonal);
            cmd.Parameters.AddWithValue("@TSSeasonal", TSSeasonal);
            cmd.Parameters.AddWithValue("@SpendingAllowance", SpendingAllowance);
            cmd.Parameters.AddWithValue("@ONTRACK", ONTRACK);
            cmd.Parameters.AddWithValue("@OwnerTenant", OwnerTenant);
            cmd.Parameters.AddWithValue("@LandLordName", LandLordName);
            cmd.Parameters.AddWithValue("@LandLordPhone", LandLordPhone);
            cmd.Parameters.AddWithValue("@LLEmailOrFax", LLEmailOrFax);
            cmd.Parameters.AddWithValue("@LLAddress", LLAddress);
            cmd.Parameters.AddWithValue("@LLCity", LLCity);
            cmd.Parameters.AddWithValue("@LLState", LLState);
            cmd.Parameters.AddWithValue("@LLZipCode", LLZipCode);
            cmd.Parameters.AddWithValue("@PCAP", PCAP);
            cmd.Parameters.AddWithValue("@PCapAmount", PCapAmount);
            cmd.Parameters.AddWithValue("@TODCUSTOMER", TODCUSTOMER);
            cmd.Parameters.AddWithValue("@SSNumLast4", SSNumLast4);
            cmd.Parameters.AddWithValue("@SummerSeasonalUse", SummerSeasonalUse);
            cmd.Parameters.AddWithValue("@WinterSeasonalUse", WinterSeasonalUse);
            cmd.Parameters.AddWithValue("@AnnualBaseUse", AnnualBaseUse);
            cmd.Parameters.AddWithValue("@TotalAnnualUse", TotalAnnualUse);
            cmd.Parameters.AddWithValue("@ContactDate", ContactDate);
            cmd.Parameters.AddWithValue("@ContactTime", ContactTime);
            cmd.Parameters.AddWithValue("@ContactType", ContactType);
            cmd.Parameters.AddWithValue("@ContactPerson", ContactPerson);
            cmd.Parameters.AddWithValue("@ContactResult", ContactResult);
            cmd.Parameters.AddWithValue("@Login", Login);
            cmd.Parameters.AddWithValue("@LowCost", LowCost);
            cmd.Parameters.AddWithValue("@OnTrackAmount", OnTrackAmount);
            cmd.Parameters.AddWithValue("@SeasonalSpendingAllowance", SeasonalSpendingAllowance);
            cmd.Parameters.AddWithValue("@ShellAllowance", ShellAllowance);
            cmd.Parameters.AddWithValue("@RepairAllowance", RepairAllowance);
            cmd.Parameters.AddWithValue("@HealthAllowance", HealthAllowance);
            cmd.Parameters.AddWithValue("@BudgetAllowance", BudgetAllowance);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }
        catch
        {
            return 0;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

    }
    #endregion

    #region update vendor job
    public int UpdateVendorJob(string JobNumber,
        string Net,
        string DueDate,
        string SendByDate,
        string Category,
        string AccountNumber,
        string PhoneNum,
        string Contactperson,
        string CompanyName,
        string MailingAddress1,
        string Address1,
        string MailingCity,
        string City,
        int MailingState,
        int State,
        string MailingZipCode,
        string ZipCode,
        string Email,
        string JobVendor,
        string VendorImgPath,
        string VendorPdfPath,
        string CntctPhoneNum,
        string WorkPhone,
        string txtExt
       )
    {
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateVendorWithJob";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@Net", Net);
            cmd.Parameters.AddWithValue("@DueDate", DueDate);
            cmd.Parameters.AddWithValue("@SendByDate", SendByDate);
            cmd.Parameters.AddWithValue("@Category", Category);
            cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
            cmd.Parameters.AddWithValue("@PhoneNum", PhoneNum);
            cmd.Parameters.AddWithValue("@ContactPersonName", Contactperson);
            cmd.Parameters.AddWithValue("@CompanyName", CompanyName);
            cmd.Parameters.AddWithValue("@MailingAddress1", MailingAddress1);
            cmd.Parameters.AddWithValue("@Address1", Address1);
            cmd.Parameters.AddWithValue("@MailingCity", MailingCity);
            cmd.Parameters.AddWithValue("@City", City);
            cmd.Parameters.AddWithValue("@MailingState", MailingState);
            cmd.Parameters.AddWithValue("@State", State);
            cmd.Parameters.AddWithValue("@MailingZip", MailingZipCode);
            cmd.Parameters.AddWithValue("@zip", ZipCode);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@JobVendor", JobVendor);
            cmd.Parameters.AddWithValue("@VendorImgPath", VendorImgPath);
            cmd.Parameters.AddWithValue("@VendorPdfPath", VendorPdfPath);
            cmd.Parameters.AddWithValue("@CntctPhoneNum", CntctPhoneNum);
            cmd.Parameters.AddWithValue("@WorkPhone", WorkPhone);
            cmd.Parameters.AddWithValue("@txtExt", txtExt);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }
        catch
        {
            return 0;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

    }
    #endregion

    #region Check Dose job Type is Act129 or Act129II For Invoice


    public DataTable GetJobTypeForInvoice(string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_CheckJobTypeForInvoice";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {
        }

        return dt;
    }
    #endregion


    public string ChkRandomNo(string randmNo)
    {
        string i = "";
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_chkRandomNo";
            cmd.Parameters.AddWithValue("@randomNo", randmNo);
            cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 50);
            cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            i = (string)cmd.Parameters["@Msg"].Value.ToString().Trim(' ');
        }
        catch (Exception ex)
        {
        }
        return i;
    }

    //Tanveer
    public DataTable ShowFname()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_Regs";
            cmd.Parameters.AddWithValue("@Mode", "Sel_FName");
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            //cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    public bool CheckPasscode(int passcode, string LoginN)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT CAST(CASE WHEN EXISTS(select [User_Id] from User_registration where Login=@LoginN and passcode=@passcode) THEN 1 ELSE 0 END AS BIT)";
        cmd.Parameters.AddWithValue("@LoginN", LoginN);
        cmd.Parameters.AddWithValue("@passcode", passcode);
        con.Open();
        object i = cmd.ExecuteScalar();

        con.Close();
        if (bool.Parse(i.ToString()) != false)
            return true;
        else
            return false;
    }

    public DataTable ShowLname(string Fname)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_Regs";
            cmd.Parameters.AddWithValue("@Mode", "Sel_LName");
            cmd.Parameters.AddWithValue("@FirstName", Fname);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
        }
        catch (Exception ex)
        {
        }
        return dt;
    }


    //end

    #region Get All JOb by Last Name

    public DataTable ShowJobByLastName(string lastname, string Flag)
    {
        //Proc_ShowAllvendor
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_searchAllJobByName";

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.AddWithValue("@lname", lastname);
            if (Flag != null && Flag != "")
            {
                cmd.Parameters.AddWithValue("@flag", Flag);
            }
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }


    public DataTable ShowJobByName_(string jobNumber)
    {
        jobNumber = "%" + jobNumber + "%";
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_ShowAllvendor";

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.AddWithValue("@jobNumber", jobNumber);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }

    #endregion

    #region Insert Payment
    public DataSet InsertPayment(string Pascode, string JobNumber, int utility, int UID)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_insertPayment";
            cmd.Parameters.AddWithValue("@Pascode", Pascode);
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@utility", utility);
            cmd.Parameters.AddWithValue("@UserId", UID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {
        }
        return ds;
    }



    public DataTable GetMesrNdQuestion(string Pascode)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_GetMesrNdQuestion";
            cmd.Parameters.AddWithValue("@passcode", Pascode);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        catch (Exception ex)
        {
        }
        return dt;
    }


    public int MakePayment(int inv_no, string job_no, int utility, string flag, string pascode, string ExtraMesr, decimal ActTotal, string PaidUsrId, string finalize)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_MakePayment";
        cmd.Parameters.AddWithValue("@pascode", pascode);
        cmd.Parameters.AddWithValue("@flag", flag);
        //cmd.Parameters.AddWithValue("@Invoice", inv_no);
        cmd.Parameters.AddWithValue("@JobNumber", job_no);
        cmd.Parameters.AddWithValue("@Utility", utility);
        cmd.Parameters.AddWithValue("@ExtraMesr", ExtraMesr);
        cmd.Parameters.AddWithValue("@ActTotal", ActTotal);
        cmd.Parameters.AddWithValue("@PaidUsrId", PaidUsrId);
        cmd.Parameters.AddWithValue("@finalize", finalize);

        if (flag == "Inspection")
        {
            cmd.Parameters.AddWithValue("@Invoice", 0);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Invoice", inv_no);
        }



        if (flag == "Invoice")
        {
            cmd.Parameters.AddWithValue("@InvoiceY", "Y");
        }
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    #endregion

    public DataTable getPaidRecordByFilter(string fromDate, string ToDate, string empName)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ProcAllFilterPaidList";
            cmd.Parameters.AddWithValue("@fromDate", fromDate);
            cmd.Parameters.AddWithValue("@ToDate", ToDate);
            cmd.Parameters.AddWithValue("@empName", empName);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

        }
        catch (Exception ex)
        {
        }
        return dt;
    }


}
