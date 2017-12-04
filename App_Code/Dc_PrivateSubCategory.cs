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
/// Summary description for Dc_PrivateSubCategory
/// </summary>
public class Dc_PrivateSubCategory
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public Dc_PrivateSubCategory()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region PrivateCustomer

    public int insertPrivateSubCategory(int CatId, string SubCatName)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertPrivateSubCategory";
        cmd.Parameters.AddWithValue("@CatId", CatId);
        cmd.Parameters.AddWithValue("@SubCatName", SubCatName);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showAllPrivateSubCategory()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllPrivateSubCategory";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdatePrivateSubCategorybyId(int SubId, string SubCatName)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdatePrivateSubCategoryByID";
        cmd.Parameters.AddWithValue("@SubCatName", SubCatName);
        cmd.Parameters.AddWithValue("@SubCatId", SubId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeletePrivateSubCategorybyId(int SubId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeletePrivateSubCategoryByID";
        cmd.Parameters.AddWithValue("@SubCatId", SubId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    #endregion
}
