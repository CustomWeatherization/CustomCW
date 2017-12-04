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
/// Summary description for dcContactAttemptsReport
/// </summary>
public class dcContactAttemptsReport
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
	public dcContactAttemptsReport()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /*============================================*\
   |*  Insert ContactAttempts                     *|
    \*============================================*/
    public DataTable InsertJobContactAttempts(string JobNumber, string ContactDate, string ContactType, string ContactPerson, string ContactResult, string contactdate)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertContactAttempt";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@ContactDate", ContactDate);
            cmd.Parameters.AddWithValue("@ContactType", ContactType);
            cmd.Parameters.AddWithValue("@ContactPerson", ContactPerson);
            cmd.Parameters.AddWithValue("@ContactResult", ContactResult);
            cmd.Parameters.AddWithValue("@ContactResultDate", contactdate);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

  

   /*===================================*\
  |*  Show all Comments by job number   *|
  \*===================================*/
    public DataTable ShowContactAttempts(string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectCWContactAttemptsReport";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }


 /*=======================================*\
|*  insert  Insert ContactAttempts Comments*|
 \*========================================*/
    public void InsertContactAttemptsComments(string JobNumber,string Comments)
    {
        
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertCWContactAttemptsComments";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@Comments", Comments);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {


        }

      
    }


/*===================================*\
|*  Show all CWContact Attempts Comments   *|
\*===================================*/
    public DataTable ShowContactAttempts_Comments(string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ProcShow_CWContact_Attempts_Comments";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
        }
        return dt;
    }
    
}
