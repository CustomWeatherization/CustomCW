using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class PhoneCallerPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string JobNumber, InvoiceNo, UC;
        JobNumber = InvoiceNo = UC = "";
        if (Convert.ToString(Request.QueryString["Phone"]) == null || Convert.ToString(Request.QueryString["Phone"]) == "")
        {
        }
        else
        {
            string Phone = Convert.ToString(Request.QueryString["Phone"]);
            if (Phone.Length == 10)
            {
                Phone = Phone.Insert(3, "-");
                Phone = Phone.Insert(7, "-");
            }
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "proc_SearchJobByPhone";
            cmd.Parameters.AddWithValue("@Phone", Phone);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            if (ds.Tables.Count > 0)
            {
                try
                {
                    string U_C = "";
                    JobNumber = Convert.ToString(ds.Tables[0].Rows[0]["JobNumber"]);
                    UC = Convert.ToString(ds.Tables[1].Rows[0]["UtilityCompany"]);
                    U_C = Convert.ToString(ds.Tables[0].Rows[0]["UtilityCompany2"]);
                    if (U_C == "2")
                    {
                        //UC = UC + " Zone " + Convert.ToString(ds.Tables[0].Rows[0]["PPlZone"]);
                    }
                    try
                    {
                        InvoiceNo = Convert.ToString(ds.Tables[2].Rows[0]["NoOfInvoice"]);
                    }
                    catch (Exception ex)
                    {
                        InvoiceNo = "1";
                    }
                    //InvoiceNo = Convert.ToString(ds.Tables[2].Rows[0]["NoOfInvoice"]);
                    if (InvoiceNo == "")
                    {
                        InvoiceNo = "1";
                    }
                    Response.Redirect("AddNewJob.aspx?InvoiceNo=" + InvoiceNo + "&Jobs=" + JobNumber + "&UC=" + UC + "&Back=DisplayJobSearchRecords");
                }
                catch (Exception ex)
                {
                }
            }
        }
    }
}
