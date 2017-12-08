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
/// Summary description for CommonCategory
/// </summary>
public class CommonCategory
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public CommonCategory()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region PrivateCategory


    public int insertCommanCategory(string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertCommanCategory";
        cmd.Parameters.AddWithValue("@Category", category);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }


    public int insertUGICategory(string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertUGICategory";
        cmd.Parameters.AddWithValue("@Category", category);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }



    public int insertDCEDCategory(string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertDCEDCategory";
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
        cmd.CommandText = "proc_ShowAllCommonCategory";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable showAllUGICategory()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllUGICategory";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable showAllDCEDCategory()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllDCEDCategory";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdatePrivateCategorybyId(int Id, string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdaeCommonCategoryByID";
        cmd.Parameters.AddWithValue("@Category", category);
        cmd.Parameters.AddWithValue("@CatID", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int UpdateUGICategorybyId(int Id, string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdaeUGICategoryByID";
        cmd.Parameters.AddWithValue("@Category", category);
        cmd.Parameters.AddWithValue("@CatID", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int UpdateDCEDCategorybyId(int Id, string category)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateDCEDCategoryByID";
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
        cmd.CommandText = "proc_DeleteCommonCategoryByID";
        cmd.Parameters.AddWithValue("@CatID", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeleteUGICategorybyId(int Id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteUGICategoryByID";
        cmd.Parameters.AddWithValue("@CatID", Id);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeleteDCEDCategorybyId(int Id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteDCEDCategoryByID";
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
        cmd.CommandText = "proc_SelectCommonCategoryByID";
        cmd.Parameters.AddWithValue("@CatID", Id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable showUGICategoryById(int Id)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_SelectUGICategoryByID";
        cmd.Parameters.AddWithValue("@CatID", Id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable showDCEDCategoryById(int Id)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_SelectDCEDCategoryByID";
        cmd.Parameters.AddWithValue("@CatID", Id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    #endregion
}