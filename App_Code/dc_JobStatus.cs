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
/// Summary description for dc_JobStatus
/// </summary>
public class dc_JobStatus
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public dc_JobStatus()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    /*===========================*\
    |*  Get JOb status by Number *|
    \*===========================*/
    public DataTable ShowJobStatusBy_Number(int number)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectJobsStatus";

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.AddWithValue("@Num", number);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    /*===========================*\
    |*  Get Jobs Status Menu *|
    \*===========================*/
    public DataSet ShowJobStatus()
    {
        DataSet dt = new DataSet();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "select COUNT(*)as NumberofJobs,Uc.UtilityCompany from Jobs J ,UtilityCompanies Uc where J.UtilityCompany1 = Uc.ID and J.PPLZone=0 and J.CWReturnDate='1900-01-01 00:00:00.000' GROUP BY Uc.UtilityCompany";
            cmd.CommandText = "proc_manageJobStatus";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }

        return dt;
    }

    /* get job Count with Vendore job */

    public DataSet ShowJobVendor()
    {
        DataSet dt = new DataSet();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "select COUNT(*)as NumberofJobs,Uc.UtilityCompany from Jobs J ,UtilityCompanies Uc where J.UtilityCompany1 = Uc.ID and J.PPLZone=0 and J.CWReturnDate='1900-01-01 00:00:00.000' GROUP BY Uc.UtilityCompany";
            cmd.CommandText = "Proc_GetInvoiceCount";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }

        return dt;
    }

    public DataSet Show_JobStatus()
    {
        DataSet dt = new DataSet();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "select COUNT(*)as NumberofJobs,Uc.UtilityCompany from Jobs J ,UtilityCompanies Uc where J.UtilityCompany1 = Uc.ID and J.PPLZone=0 and J.CWReturnDate='1900-01-01 00:00:00.000' GROUP BY Uc.UtilityCompany";
            cmd.CommandText = "proc_manage_JobStatus";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }

        return dt;
    }

    /*=====================================*\
    |*  Get Jobs Status By Company Utility *|
    \*=====================================*/
    public DataTable ShowJob_byCompnayUtility(string UtilityCompnay)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectJobsStatus_ByJobName";
            cmd.Parameters.AddWithValue("@Num", UtilityCompnay);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }

        return dt;
    }

    public DataTable ShowJob_byCompnayUtilityByFilter(string UtilityCompnay, string FilterType)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectJobsStatus_ByJobName";
            cmd.Parameters.AddWithValue("@Num", UtilityCompnay);
            cmd.Parameters.AddWithValue("@Name", FilterType);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }

        return dt;
    }
}
