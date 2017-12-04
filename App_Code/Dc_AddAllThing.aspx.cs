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
/// Summary description for Dc_AddAllThing
/// </summary>
public class Dc_AddAllThing
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public Dc_AddAllThing()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region PPL

    public int InsertAllThing(int CatId, int MDID, string location, string TypeOfMeasure, string liurpCode, string unit, string laborRate, string costPerUnit)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertInvoiceContain";
        cmd.Parameters.AddWithValue("@CatId", CatId);
        cmd.Parameters.AddWithValue("@MDID", MDID);
        cmd.Parameters.AddWithValue("@location", location);
        cmd.Parameters.AddWithValue("@TypeOfMeasure", TypeOfMeasure);
        cmd.Parameters.AddWithValue("@liurpCode", liurpCode);
        cmd.Parameters.AddWithValue("@unit", unit);
        cmd.Parameters.AddWithValue("@laborRate", laborRate);
        cmd.Parameters.AddWithValue("@costPerUnit", costPerUnit);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public int InsertZoneAllThing(int CatId, int MDID, string location, string TypeOfMeasure, string liurpCode, string unit, string laborRate, string costPerUnit)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertZoneInvoiceContain";
        cmd.Parameters.AddWithValue("@CatId", CatId);
        cmd.Parameters.AddWithValue("@MDID", MDID);
        cmd.Parameters.AddWithValue("@location", location);
        cmd.Parameters.AddWithValue("@TypeOfMeasure", TypeOfMeasure);
        cmd.Parameters.AddWithValue("@liurpCode", liurpCode);
        cmd.Parameters.AddWithValue("@unit", unit);
        cmd.Parameters.AddWithValue("@laborRate", laborRate);
        cmd.Parameters.AddWithValue("@costPerUnit", costPerUnit);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int InsertAct129_2Allthing(int CatId, int MDID, string location, string TypeOfMeasure, string liurpCode, string unit, string laborRate, string costPerUnit)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertAct129CaclvInvoiceContain";
        cmd.Parameters.AddWithValue("@CatId", CatId);
        cmd.Parameters.AddWithValue("@MDID", MDID);
        cmd.Parameters.AddWithValue("@location", location);
        cmd.Parameters.AddWithValue("@TypeOfMeasure", TypeOfMeasure);
        cmd.Parameters.AddWithValue("@liurpCode", liurpCode);
        cmd.Parameters.AddWithValue("@unit", unit);
        cmd.Parameters.AddWithValue("@laborRate", laborRate);
        cmd.Parameters.AddWithValue("@costPerUnit", costPerUnit);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }


    public DataTable showAllThing()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllThings";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    public DataTable showAllZoneThing()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllZoneThings";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }


    public DataTable showAllact129CaclvThing()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllAct129CaclvThings";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }



    public int UpdateAllThingbyId(int RowId, string location, string TypeOfMeasure, string liurpCode, string unit, string laborRate, string costPerUnit, string Description)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateAllThingByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        cmd.Parameters.AddWithValue("@location", location);
        cmd.Parameters.AddWithValue("@TypeOfMeasure", TypeOfMeasure);
        cmd.Parameters.AddWithValue("@liurpCode", liurpCode);
        cmd.Parameters.AddWithValue("@unit", unit);
        cmd.Parameters.AddWithValue("@laborRate", laborRate);
        cmd.Parameters.AddWithValue("@costPerUnit", costPerUnit);
        cmd.Parameters.AddWithValue("@Description", Description);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int UpdateZoneAllThingbyId(int RowId, string location, string TypeOfMeasure, string liurpCode, string unit, string laborRate, string costPerUnit)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateZoneAllThingByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        cmd.Parameters.AddWithValue("@location", location);
       // cmd.Parameters.AddWithValue("@SC", SC);
        cmd.Parameters.AddWithValue("@TypeOfMeasure", TypeOfMeasure);
        cmd.Parameters.AddWithValue("@liurpCode", liurpCode);
        cmd.Parameters.AddWithValue("@unit", unit);
        cmd.Parameters.AddWithValue("@laborRate", laborRate);
        cmd.Parameters.AddWithValue("@costPerUnit", costPerUnit);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int UpdateAllAct129CaclvByID(int RowId, string location, string TypeOfMeasure, string liurpCode, string unit, string laborRate, string costPerUnit)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateAllAct129CaclvByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        cmd.Parameters.AddWithValue("@location", location);
        cmd.Parameters.AddWithValue("@TypeOfMeasure", TypeOfMeasure);
        cmd.Parameters.AddWithValue("@liurpCode", liurpCode);
        cmd.Parameters.AddWithValue("@unit", unit);
        cmd.Parameters.AddWithValue("@laborRate", laborRate);
        cmd.Parameters.AddWithValue("@costPerUnit", costPerUnit);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }



    public int DeleteAllThingbyId(int RowId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteAllThingByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeleteZoneAllThingbyId(int RowId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteZoneAllThingByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeleteAct129CaclvByID(int RowId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteAct129CaclvByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int UpdateLaborRate(string MinLaborRate, string MaxLaborRate)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertLaborRate";
        cmd.Parameters.AddWithValue("@MinLaborRate", MinLaborRate);
        cmd.Parameters.AddWithValue("@MaxLaborRate", MaxLaborRate);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int UpdateLaborRate2(string MinLaborRate, string MaxLaborRate)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertLaborRate2";
        cmd.Parameters.AddWithValue("@MinLaborRate", MinLaborRate);
        cmd.Parameters.AddWithValue("@MaxLaborRate", MaxLaborRate);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }


    public int UpdateAct129LaborRate(string MinLaborRate, string MaxLaborRate)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertAct129LaborRate";
        cmd.Parameters.AddWithValue("@MinLaborRate", MinLaborRate);
        cmd.Parameters.AddWithValue("@MaxLaborRate", MaxLaborRate);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable findZone(string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_findZone";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }


    public DataTable Func_totalCACLVMeasures(string JobNumber, string Utility, string InvoiceNo)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_totalCACLVMeasures";
        cmd.Parameters.AddWithValue("@Job_No", JobNumber);
        cmd.Parameters.AddWithValue("@Invoice_No", InvoiceNo);
        cmd.Parameters.AddWithValue("@Utility_No", Utility);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }


    public DataTable showLaborRate(string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowLaborRate";
        cmd.Parameters.AddWithValue("@JobNum", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }


    public DataTable showAct129LaborRate()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAct129LaborRate";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable showLaborRate2()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowLaborRate2";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    #endregion


    #region Meted

    public int InsertAllMetedThing(int CatId, int ItemId, string Code, string Labor, string Material, string Cost, string Location, string THW, string TW)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertMetedInvoiceContain";
        cmd.Parameters.AddWithValue("@CatId", CatId);
        cmd.Parameters.AddWithValue("@Itemd", ItemId);
        cmd.Parameters.AddWithValue("@Code", Code);
        cmd.Parameters.AddWithValue("@Labor", Labor);
        cmd.Parameters.AddWithValue("@Material", Material);
        cmd.Parameters.AddWithValue("@Location", Location);
        cmd.Parameters.AddWithValue("@Cost", Cost);
        cmd.Parameters.AddWithValue("@THW", THW);
        cmd.Parameters.AddWithValue("@TW", TW);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showAllMetedThing()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllMetedThings";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdateAllMetedThingbyId(int RowId, string Code, string Labor, string Material, string Cost, string Location, string THW, string TW)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateAllMetedThingByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        cmd.Parameters.AddWithValue("@Code", Code);
        cmd.Parameters.AddWithValue("@Labor", Labor);
        cmd.Parameters.AddWithValue("@Material", Material);
        cmd.Parameters.AddWithValue("@Cost", Cost);
        cmd.Parameters.AddWithValue("@Location", Location);
        cmd.Parameters.AddWithValue("@THW", THW);
        cmd.Parameters.AddWithValue("@TW", TW);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeleteAllMetedThingbyId(int RowId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteAllMetedThingByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int UpdateMetedLaborRate(string MinLaborRate)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertMetedLaborRate";
        cmd.Parameters.AddWithValue("@MinLaborRate", MinLaborRate);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public int UpdateMetedLaborRate1(string MinLaborRate)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertMetedLaborRate1";
        cmd.Parameters.AddWithValue("@MinLaborRate", MinLaborRate);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showMetedLaborRate()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowMetedLaborRate";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    public DataTable showMetedLaborRate1()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowMetedLaborRate1";//no storeprocedure found in db
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    #endregion


    #region Meted Warm Plus

    public int InsertAllMetedWarmPlusThing(int CatId, int ItemId, string Code, string Labor, string Material, string Cost, string Location, string THW, string TW)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertMetedWarmPlusInvoiceContain";
        cmd.Parameters.AddWithValue("@CatId", CatId);
        cmd.Parameters.AddWithValue("@Itemd", ItemId);
        cmd.Parameters.AddWithValue("@Code", Code);
        cmd.Parameters.AddWithValue("@Labor", Labor);
        cmd.Parameters.AddWithValue("@Material", Material);
        cmd.Parameters.AddWithValue("@Location", Location);
        cmd.Parameters.AddWithValue("@Cost", Cost);
        cmd.Parameters.AddWithValue("@THW", THW);
        cmd.Parameters.AddWithValue("@TW", TW);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showAllMetedWarmPlusThing()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllMetedWarmPlusThings";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdateAllMetedWarmPlusThingbyId(int RowId, string Code, string Labor, string Material, string Cost, string Location, string THW, string TW)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateAllMetedWarmPlusThingByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        cmd.Parameters.AddWithValue("@Code", Code);
        cmd.Parameters.AddWithValue("@Labor", Labor);
        cmd.Parameters.AddWithValue("@Material", Material);
        cmd.Parameters.AddWithValue("@Cost", Cost);
        cmd.Parameters.AddWithValue("@Location", Location);
        cmd.Parameters.AddWithValue("@TW", TW);
        cmd.Parameters.AddWithValue("@THW", THW);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeleteAllMetedThingWarmPlusbyId(int RowId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteAllMetedWarmPlusThingByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    #endregion
}
