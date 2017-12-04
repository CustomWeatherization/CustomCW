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
/// Summary description for Dc_SubCategory
/// </summary>
public class Dc_SubCategory
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public Dc_SubCategory()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    #region PPL

    public int insertSubCategory(int CatId, string SubCatName)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertSubCategory";
        cmd.Parameters.AddWithValue("@CatId", CatId);
        cmd.Parameters.AddWithValue("@SubCatName", SubCatName);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showAllSubCategory()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllSubCategory";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdateSubCategorybyId(int SubId, string SubCatName)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateSubCategoryByID";
        cmd.Parameters.AddWithValue("@SubCatName", SubCatName);
        cmd.Parameters.AddWithValue("@SubCatId", SubId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeleteSubCategorybyId(int SubId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteSubCategoryByID";
        cmd.Parameters.AddWithValue("@SubCatId", SubId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    #endregion


    #region Meted

    public int insertMetedSubCategory(int CatId, string SubCatName, string Discription)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertMetedSubCategory";
        cmd.Parameters.AddWithValue("@CatId", CatId);
        cmd.Parameters.AddWithValue("@SubCatName", SubCatName);
        cmd.Parameters.AddWithValue("@Discription", Discription);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showAllMetedSubCategory()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllMetedSubCategory";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdateMetedSubCategorybyId(int SubId, string SubCatName, string Discription)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateMetedSubCategoryByID";
        cmd.Parameters.AddWithValue("@SubCatName", SubCatName);
        cmd.Parameters.AddWithValue("@Discription", Discription);
        cmd.Parameters.AddWithValue("@SubCatId", SubId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeleteMetedSubCategorybyId(int SubId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteMetedSubCategoryByID";
        cmd.Parameters.AddWithValue("@SubCatId", SubId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    #endregion
}
