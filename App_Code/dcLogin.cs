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
/// Summary description for dcLogin
/// </summary>
public class dcLogin
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
	public dcLogin()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable GetLogin(string CWLogin, string CWPassword)
    {
        DataTable dt = new DataTable();
        try
        {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "ValidateLogin";
       
            
        cmd.Parameters.AddWithValue("@CWLogin",CWLogin);
        cmd.Parameters.AddWithValue("@CWPassword",CWPassword);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        }
        catch (Exception ex)
        {
            
            
        }
        return dt;

    }



    public DataTable GetContactDetail(string Name)
    {
        string[] AName = Name.ToString().Split(); 
        SqlCommand cmd = new SqlCommand();
        DataTable dt = new DataTable();
        Name = "%" + AName[0] + "%";
        try
        {
            cmd.Connection =con;
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.CommandText = "ProcShowContactInfo";

            cmd.Parameters.AddWithValue("@Name", Name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
            
            
        }
        return dt;
    }
}
