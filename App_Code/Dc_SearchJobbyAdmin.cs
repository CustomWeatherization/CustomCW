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
/// Summary description for Dc_SearchJobbyAdmin
/// </summary>
public class Dc_SearchJobbyAdmin
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public Dc_SearchJobbyAdmin()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region Does job exists or not
    public DataTable SearchJobByAdmin(string JobNumber, string Flag)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SearchJobWithJobnumber";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@flag", Flag);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {
        }
        return dt;
    }

    public void DeleteJobOrInvoice(string JobNumber, int NoOfInvoice, string Flag)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_DeleteInvoice";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@NoOfInvoice", NoOfInvoice);
            cmd.Parameters.AddWithValue("@Flag", Flag);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
        }
    }
    #endregion

    public void UpdateSubmitDate(string subDate)
    {        
        //DateTime subDate_ = Convert.ToDateTime(subDate);
        //subDate = Convert.ToString(subDate_);
        SqlCommand cmd = new SqlCommand();
        try
        {
            //string JobNumber, int NoOfInvoice, 
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_UpdateSubmitDate";
            //cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            //cmd.Parameters.AddWithValue("@NoOf_Invoice", NoOfInvoice);
            cmd.Parameters.AddWithValue("@SubmitDate", subDate);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
        }
    }

    public DataTable getSubmitDate()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_getSubmitDate";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }


}
