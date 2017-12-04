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
/// Summary description for DC_ManagePrivateEstimate
/// </summary>
public class DC_ManagePrivateEstimate
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public DC_ManagePrivateEstimate()
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
        cmd.CommandText = "proc_ShowPrivateSubCatByCatId";
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

    //public DataTable CreateInvoice(int NoOfInvoice, int catId, string SubCategory, string THW, string TMC, string Location, string SC, string LiurpCode, string Unit_N, string LaborRate, string CostPerUnit, string QTY, string Total, string RowType, string JobNumber, int Utility, string Rad_btn)
    //{
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.CommandText = "proc_CreateNewInvoice";
    //    cmd.Parameters.AddWithValue("@NoOfInvoice", NoOfInvoice);
    //    cmd.Parameters.AddWithValue("@catId", catId);
    //    cmd.Parameters.AddWithValue("@SubCategory", SubCategory);
    //    cmd.Parameters.AddWithValue("@THW", THW);
    //    cmd.Parameters.AddWithValue("@TMC", TMC);
    //    cmd.Parameters.AddWithValue("@Location", Location);
    //    cmd.Parameters.AddWithValue("@SC", SC);
    //    cmd.Parameters.AddWithValue("@LiurpCode", LiurpCode);
    //    cmd.Parameters.AddWithValue("@Unit", Unit_N);
    //    cmd.Parameters.AddWithValue("@LaborRate", LaborRate);
    //    cmd.Parameters.AddWithValue("@CostPerUnit", CostPerUnit);
    //    cmd.Parameters.AddWithValue("@QTY", QTY);
    //    cmd.Parameters.AddWithValue("@Total", Total);
    //    cmd.Parameters.AddWithValue("@RowType", RowType);
    //    cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
    //    cmd.Parameters.AddWithValue("@Utility", Utility);
    //    cmd.Parameters.AddWithValue("@Rad_btn", Rad_btn);
    //    DataTable dt = new DataTable();
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);
    //    da.Fill(dt);
    //    return dt;
    //}

    public DataTable showAllThingByCatId_SubCatId(int catId, int subCatId)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_showPrivateAllThingByCatId_SubCatId";
        cmd.Parameters.AddWithValue("@CatId", catId);
        cmd.Parameters.AddWithValue("@SubCatId", subCatId);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

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

    //public DataTable ShowInvoice_Contain(int InvoiceNo, string JobNumber, int CatId, int Utility)
    //{
    //    DataTable dt = new DataTable();
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.CommandText = "proc_ShowInvoiceContain";
    //    cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
    //    cmd.Parameters.AddWithValue("@NoOfInvoice", InvoiceNo);
    //    cmd.Parameters.AddWithValue("@catId", CatId);
    //    cmd.Parameters.AddWithValue("@Utility", Utility);
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);
    //    da.Fill(dt);
    //    return dt;
    //}

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

    //public int DeleteInvoice_ContainById(int Id)
    //{
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.CommandText = "proc_DeleteInvoiceContainById";
    //    cmd.Parameters.AddWithValue("@InvoiceId", Id);
    //    con.Open();
    //    int i = cmd.ExecuteNonQuery();
    //    con.Close();
    //    return i;
    //}

    //public DataTable InvoiceRowForUpdate(int RowId)
    //{
    //    DataTable dt = new DataTable();
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.CommandText = "proc_InvoiceRowForUpdate";
    //    cmd.Parameters.AddWithValue("@RowId", RowId);
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);
    //    da.Fill(dt);
    //    return dt;
    //}


    //public int UpdateInvoice(int NoOfInvoice, int catId, string SubCategory, string THW, string TMC, string Location, string SC, string LiurpCode, string Unit_N, string LaborRate, string CostPerUnit, string QTY, string Total, string RowType, string JobNumber, string UserId, int RowId)
    //{
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.CommandText = "proc_UpdateInvoiceByRowID";
    //    cmd.Parameters.AddWithValue("@NoOfInvoice", NoOfInvoice);
    //    cmd.Parameters.AddWithValue("@catId", catId);
    //    cmd.Parameters.AddWithValue("@SubCategory", SubCategory);
    //    cmd.Parameters.AddWithValue("@THW", THW);
    //    cmd.Parameters.AddWithValue("@TMC", TMC);
    //    cmd.Parameters.AddWithValue("@Location", Location);
    //    cmd.Parameters.AddWithValue("@SC", SC);
    //    cmd.Parameters.AddWithValue("@LiurpCode", LiurpCode);
    //    cmd.Parameters.AddWithValue("@Unit", Unit_N);
    //    cmd.Parameters.AddWithValue("@LaborRate", LaborRate);
    //    cmd.Parameters.AddWithValue("@CostPerUnit", CostPerUnit);
    //    cmd.Parameters.AddWithValue("@QTY", QTY);
    //    cmd.Parameters.AddWithValue("@Total", Total);
    //    cmd.Parameters.AddWithValue("@RowType", RowType);
    //    cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
    //    cmd.Parameters.AddWithValue("@UserId", UserId);
    //    cmd.Parameters.AddWithValue("@RowId", RowId);
    //    con.Open();
    //    int i = cmd.ExecuteNonQuery();
    //    con.Close();
    //    return i;
    //}


    //public bool Upd_Sub_Date(string sub_date, int inv_no, string job_no, int utility)
    //{
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.CommandText = "Proc_Upd_invoice";
    //    cmd.Parameters.AddWithValue("@Mode", "Subm_date");
    //    cmd.Parameters.AddWithValue("@submit_date", sub_date);
    //    cmd.Parameters.AddWithValue("@NoOfInvoice", inv_no);
    //    cmd.Parameters.AddWithValue("@JobNumber", job_no);
    //    cmd.Parameters.AddWithValue("@Utility", utility);
    //    con.Open();
    //    int i = cmd.ExecuteNonQuery();
    //    con.Close();
    //    if (i != 0)
    //        return true;
    //    else
    //        return false;
    //}

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
