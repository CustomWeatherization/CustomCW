﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for AddUGIAllThing
/// </summary>
public class AddUGIAllThingcs
{
	SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public AddUGIAllThingcs()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region Private

    public int InsertPrivateAllThing(int CatId, int MDID, string location, string SC, string liurpCode, string unit, string laborRate, string costPerUnit)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertUGIInvoiceContain";
        cmd.Parameters.AddWithValue("@CatId", CatId);
        cmd.Parameters.AddWithValue("@MDID", MDID);
        cmd.Parameters.AddWithValue("@location", location);
        cmd.Parameters.AddWithValue("@SC", SC);
        cmd.Parameters.AddWithValue("@liurpCode", liurpCode);
        cmd.Parameters.AddWithValue("@unit", unit);
        cmd.Parameters.AddWithValue("@laborRate", laborRate);
        cmd.Parameters.AddWithValue("@costPerUnit", costPerUnit);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showAllPrivateThing()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowAllUGIThings";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdateAllPrivateThingbyId(int RowId, string location, string SC, string liurpCode, string unit, string laborRate, string costPerUnit)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_UpdateAllUGIThingByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        cmd.Parameters.AddWithValue("@location", location);
        cmd.Parameters.AddWithValue("@SC", SC);
        cmd.Parameters.AddWithValue("@liurpCode", liurpCode);
        cmd.Parameters.AddWithValue("@unit", unit);
        cmd.Parameters.AddWithValue("@laborRate", laborRate);
        cmd.Parameters.AddWithValue("@costPerUnit", costPerUnit);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int DeleteAllPrivateThingbyId(int RowId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_DeleteAllUGIThingByID";
        cmd.Parameters.AddWithValue("@RowId", RowId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public int UpdatePrivateLaborRate(string MinLaborRate, string MaxLaborRate)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertBcocLaborRate";
        cmd.Parameters.AddWithValue("@MinLaborRate", MinLaborRate);
        cmd.Parameters.AddWithValue("@MaxLaborRate", MaxLaborRate);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public DataTable showPrivateLaborRate()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowUGILaborRate";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    #endregion
}