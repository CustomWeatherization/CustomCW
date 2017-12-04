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
/// Summary description for DC_ManageBCOCEstimate
/// </summary>
public class DC_ManageBCOCEstimate
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public DC_ManageBCOCEstimate()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable ShowSubCatByCatId(int catId)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_ShowCommonSubCatByCatId";
        cmd.Parameters.AddWithValue("@catId", catId);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable NoOfRecord(string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_NoOfRecord";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    public DataTable showAllThingByCatId_SubCatId(int catId, int subCatId)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_showBCOCAllThingByCatId_SubCatId";
        cmd.Parameters.AddWithValue("@CatId", catId);
        cmd.Parameters.AddWithValue("@SubCatId", subCatId);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    //<!-- UGI -->

    public DataTable showAllUGIThingByCatId_SubCatId(int catId, int subCatId)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_showUGIAllThingByCatId_SubCatId";
        cmd.Parameters.AddWithValue("@CatId", catId);
        cmd.Parameters.AddWithValue("@SubCatId", subCatId);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    //<!-- UGI END-->
    //<!-- DCED -->

    public DataTable showAllDCEDThingByCatId_SubCatId(int catId, int subCatId)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_showDCEDAllThingByCatId_SubCatId";
        cmd.Parameters.AddWithValue("@CatId", catId);
        cmd.Parameters.AddWithValue("@SubCatId", subCatId);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    //<!-- DCED END-->
    public DataTable SearchTotalInvoice(string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_SearchTotalInvoice";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    public DataTable CheckJobExist(string JobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_CheckobExist";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    public DataSet ShowDataN(string jobno)
    {
        DataSet dt = new DataSet();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Proc_Upd_invoice";
        cmd.Parameters.AddWithValue("@Mode", "Show_rec");
        cmd.Parameters.AddWithValue("@JobNumber", jobno);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    public DataTable CheckExistInvoice(string JobNumber, int Invoice, int Utility)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_CheckExixtInvoice";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@NoOfInvoice", Invoice);
        cmd.Parameters.AddWithValue("@Utility", Utility);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable ViewState_PageLoad(string JobNumber, int Invoice, int Utility)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InvoiceShow";
        cmd.Parameters.AddWithValue("@Job_No", JobNumber);
        cmd.Parameters.AddWithValue("@Invoice_No", Invoice);
        cmd.Parameters.AddWithValue("@Utility_No", Utility);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public void InsertOrUpdatePaidAmount(int NoOfInvoice, string JobNumber, string PaidInvAmt, int Utility)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Proc_InsertOrUpdatePaidAmount";
        cmd.Parameters.AddWithValue("@NoOfInvoice", NoOfInvoice);
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@PaidTotalAmount", PaidInvAmt);
        cmd.Parameters.AddWithValue("@JobCompanyType", Utility);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void InsertJobForDate(int NoOfInvoice, string JobNumber)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Proc_InsertJobForDate";
        cmd.Parameters.AddWithValue("@NoOf_Invoice", NoOfInvoice);
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}
