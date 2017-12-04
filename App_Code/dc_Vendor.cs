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
/// Summary description for dc_Vendor
/// </summary>
public class dc_Vendor
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public dc_Vendor()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region add new invoice to vendor
    public void InsertVendorInvoice(string VendorJobNumber, string InvoiceDate, string InvoiceNo, string InvoiceAmnt, string PaidDate, string PaidAmnt, string PaymentType, string PaidBy, string CheckNo, string Status, string ModifiedDate, string ModifiedTime, DateTime DueDate_)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertVendorInvoice";
            cmd.Parameters.AddWithValue("@VendorJobNumber", VendorJobNumber);
            cmd.Parameters.AddWithValue("@InvoiceDate", InvoiceDate);
            cmd.Parameters.AddWithValue("@InvoiceNo", InvoiceNo);
            cmd.Parameters.AddWithValue("@InvoiceAmnt", InvoiceAmnt);
            cmd.Parameters.AddWithValue("@PaidDate", PaidDate);
            cmd.Parameters.AddWithValue("@PaidAmnt", PaidAmnt);
            cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
            cmd.Parameters.AddWithValue("@PaidBy", PaidBy);
            cmd.Parameters.AddWithValue("@CheckNo", CheckNo);
            cmd.Parameters.AddWithValue("@Status", Status);
            cmd.Parameters.AddWithValue("@ModifiedDate", ModifiedDate);
            cmd.Parameters.AddWithValue("@ModifiedTime", ModifiedTime);
            cmd.Parameters.AddWithValue("@DueDate", DueDate_);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception ex)
        {
        }
    }
    #endregion

    #region bind grdVendorInvoice

    public DataTable BindGrdVendorInvoice(string VendorJobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "BindGrdVendorInvoice";
        cmd.Parameters.AddWithValue("@VendorJobNumber", VendorJobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    public DataSet BindGrdAllVendorInvoice()
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "BindAllGrdVendorInvoice";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }


    public DataTable getImage(string VendorJobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Proc_getImage";
        cmd.Parameters.AddWithValue("@VendorJobNumber", VendorJobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    #endregion

    #region bind grid vendor contact attempt

    public DataTable BindGrdVendorContactAttempt(string VendorJobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "BindGrdVendorContactAttempt";
        cmd.Parameters.AddWithValue("@VendorJobNumber", VendorJobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    #endregion
    #region bind grdVendorInvoice

    public DataTable BindGrdPaymentHistory(string VendorJobNumber)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "BindGrdPaymentHistory";
        cmd.Parameters.AddWithValue("@VendorJobNumber", VendorJobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    #endregion
    #region Show all Paid By

    public DataTable ShowPaidBy()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectContactPerson";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch (Exception ex)
        {
        }

        return dt;
    }

    #endregion
    #region update payment history
    public void UpdatePaymentHistory(string InvoiceId, string PaidDate, string PaidAmnt, string PaymentType, string PaidBy, string CheckNo, string Status)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateVendorPayment";
            cmd.Parameters.AddWithValue("@InvoiceId", InvoiceId);
            cmd.Parameters.AddWithValue("@PaidDate", PaidDate);
            cmd.Parameters.AddWithValue("@PaidAmnt", PaidAmnt);
            cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
            cmd.Parameters.AddWithValue("@PaidBy", PaidBy);
            cmd.Parameters.AddWithValue("@CheckNo", CheckNo);
            cmd.Parameters.AddWithValue("@Status", Status);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }




    public void UpdatePaidUnpaidVendorInvoice(string InvoiceDate, string InvoiceNo, string InvoiceAmnt, string InvoiceId, string Flag, DateTime ModifiedDate, DateTime PaidDate, string PaidAmnt, string PaymentType, string PaidBy, string CheckNo, string DueDate)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_UpdatePaidUnpaidVendorInvoice";
            cmd.Parameters.AddWithValue("@InvoiceDate", InvoiceDate);
            cmd.Parameters.AddWithValue("@InvoiceNo", InvoiceNo);
            cmd.Parameters.AddWithValue("@InvoiceAmnt", InvoiceAmnt);
            cmd.Parameters.AddWithValue("@InvoiceId", InvoiceId);
            cmd.Parameters.AddWithValue("@Flag", Flag);
            cmd.Parameters.AddWithValue("@ModifiedDate", ModifiedDate);

            cmd.Parameters.AddWithValue("@DueDate", DueDate);

            cmd.Parameters.AddWithValue("@PaidDate", PaidDate);
            cmd.Parameters.AddWithValue("@PaidAmnt", PaidAmnt);
            cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
            cmd.Parameters.AddWithValue("@PaidBy", PaidBy);
            cmd.Parameters.AddWithValue("@CheckNo", CheckNo);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }


    #endregion
    #region insert vendor contact attempt
    public void InsertVendorContactAttempt(string VendorJobNumber, string ContactAttemptDate, string ContactType, string ContactPerson, string VendorAgentName, string VendorAgentId)
    {
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertVendorContactAttempt";
            cmd.Parameters.AddWithValue("@VendorJobNumber", VendorJobNumber);
            cmd.Parameters.AddWithValue("@ContactDateTime", ContactAttemptDate);
            cmd.Parameters.AddWithValue("@ContactType", ContactType);
            cmd.Parameters.AddWithValue("@ContctPerson", ContactPerson);
            cmd.Parameters.AddWithValue("@VendorAgentName", VendorAgentName);
            cmd.Parameters.AddWithValue("@VendorAgentId", VendorAgentId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }
    #endregion

    #region Insert PDF vendor
    public int InsertVendorPDF(string name ,string pdfname, string jobnumber)
    {
        int i=0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertPDF";
            cmd.Parameters.AddWithValue("@Name", pdfname);
            cmd.Parameters.AddWithValue("@PDFName", pdfname);
            cmd.Parameters.AddWithValue("@JobNumber", jobnumber);
            con.Open();
            i=cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception ex)
        {
        }
        return i;
    }
    #endregion


    #region GET all PDF vendor
    public DataTable GetVendorPDF(string jobnumber)
    {
        DataTable dt = new DataTable();
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "gettPDF";
            cmd.Parameters.AddWithValue("@JobNumber", jobnumber);
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
