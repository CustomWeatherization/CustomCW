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
/// Summary description for Dc_PrivateCategory
/// </summary>
public class Dc_PrivateCategory
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public Dc_PrivateCategory()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region PrivateCategory


    public int insertPrivateCategory(string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertPrivateCategory";
        cmd.Parameters.AddWithValue("@Category", category);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showAllPrivateCategory()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllPrivateCategory";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdatePrivateCategorybyId(int Id, string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdaePrivateCategoryByID";
        cmd.Parameters.AddWithValue("@Category", category);
        cmd.Parameters.AddWithValue("@CatID", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeletePrivateCategorybyId(int Id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeletePrivateCategoryByID";
        cmd.Parameters.AddWithValue("@CatID", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showPrivateCategoryById(int Id)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_SelectPrivateCategoryByID";
        cmd.Parameters.AddWithValue("@CatID", Id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    #endregion
}
