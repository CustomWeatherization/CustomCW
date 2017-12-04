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
/// Summary description for dc_AdvanceSearch
/// </summary>
public class dc_AdvanceSearch
{
     SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
	public dc_AdvanceSearch()
	{
		//
		// TODO: Add constructor logic here
		//
    }
    #region Search Job By Date
    public DataTable SearchJobByDate(string TypeOfSearch,string StartDate,string EndDate)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectByDateTypeAndRange";
            cmd.Parameters.AddWithValue("@TypeOfSearch", TypeOfSearch);
            cmd.Parameters.AddWithValue("@StartDate", StartDate);
            cmd.Parameters.AddWithValue("@EndDate", EndDate);
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }


    public DataTable SearchJobByDate1(string TypeOfSearch, string StartDate, string EndDate, int UsrId)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectByDateTypeAndRange1";
            cmd.Parameters.AddWithValue("@TypeOfSearch", TypeOfSearch);
            cmd.Parameters.AddWithValue("@StartDate", StartDate);
            cmd.Parameters.AddWithValue("@EndDate", EndDate);
            cmd.Parameters.AddWithValue("@UsrID", UsrId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }
    #endregion


    #region Search  BY GEOGRAPHIC
    public DataTable SearchJob_GEOGRAPHIC(string TypeOfSearch, string TheSearchString)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "AdvancedSearchByGeographic";
            cmd.Parameters.AddWithValue("@TypeOfSearch", TypeOfSearch);
            cmd.Parameters.AddWithValue("@TheSearchString", TheSearchString);
        

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    public DataTable SearchJob_GEOGRAPHIC1(string TypeOfSearch, string TheSearchString, int Uid)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "AdvancedSearchByGeographic1";
            cmd.Parameters.AddWithValue("@TypeOfSearch", TypeOfSearch);
            cmd.Parameters.AddWithValue("@TheSearchString", TheSearchString);
            cmd.Parameters.AddWithValue("@UsrID", Uid);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {


        }

        return dt;
    }

    #endregion
    
}
