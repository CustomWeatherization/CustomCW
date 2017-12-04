using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections.Generic;

/// <summary>
/// Summary description for SearchName
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class SearchName : System.Web.Services.WebService {

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    public SearchName () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    [WebMethod]
    public string[] FunShowLastName(string prefixText)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        cmd.CommandText = "select DISTINCT lastname from jobs where lastname like '%" + prefixText + "%'";

        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        List<string> objlist = new List<string>();
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            objlist.Add(dr["lastname"].ToString());
        }
        return objlist.ToArray();

    }
    [WebMethod]
    public string[] FunShowFirstName(string prefixText)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        cmd.CommandText = "select DISTINCT firstname from jobs where JobVendor='Vendor' And firstname like '%" + prefixText + "%'";

        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        List<string> objlist = new List<string>();
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            objlist.Add(dr["firstname"].ToString());
        }
        return objlist.ToArray();

    }
    [WebMethod]
    public string CheckEmail(string Email)
    {
        string Result = "";
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;

        cmd.CommandText = "select CWLogin from Users where CWLogin=@email";
        cmd.Parameters.Add("@email", Email);

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        da.Fill(dt);
        con.Close();
        if (dt.Rows.Count > 0)
        {
            Result = "True";
            return Result;
        }
        else
        {
            Result = "False";
            return Result;
        }
        

    }
}

