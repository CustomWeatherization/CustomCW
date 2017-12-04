using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for dc_Registration
/// </summary>
public class dc_Registration
{
    public dc_Registration()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private string _First_Name;
    private string _Last_Name;
    private string _Phone;
    private string _Address;
    private string _City;
    private string _State;
    private string _Zipcode;
    private string _County;
    private string _Email;
    private string _Login;
    private string _Password;
    private string _Passcode;
    private string _Birthdate;

    public string First_Name
    {
        get { return _First_Name; }
        set { _First_Name = value; }
    }
    public string Last_Name
    {
        get { return _Last_Name; }
        set { _Last_Name = value; }
    }
    public string Phone
    {
        get { return _Phone; }
        set { _Phone = value; }
    }
    public string Address
    {
        get { return _Address; }
        set { _Address = value; }
    }
    public string City
    {
        get { return _City; }
        set { _City = value; }
    }
    public string State
    {
        get { return _State; }
        set { _State = value; }
    }
    public string Zipcode
    {
        get { return _Zipcode; }
        set { _Zipcode = value; }
    }
    public string County
    {
        get { return _County; }
        set { _County = value; }
    }
    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }
    public string Login
    {
        get { return _Login; }
        set { _Login = value; }
    }
    public string Password
    {
        get { return _Password; }
        set { _Password = value; }
    }
    public string Passcode
    {
        get { return _Passcode; }
        set { _Passcode = value; }
    }
    public string Birthdate
    {
        get { return _Birthdate; }
        set { _Birthdate = value; }
    }

    public bool Add_reg(dc_Registration obj_reg)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Proc_Regs";
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        cmd.Parameters.AddWithValue("@Mode", "Ins_Reg");
        cmd.Parameters.AddWithValue("@FName", obj_reg.First_Name);
        cmd.Parameters.AddWithValue("@LName", obj_reg.Last_Name);
        cmd.Parameters.AddWithValue("@phone", obj_reg.Phone);
        cmd.Parameters.AddWithValue("@Address", obj_reg.Address);
        cmd.Parameters.AddWithValue("@City", obj_reg.City);
        cmd.Parameters.AddWithValue("@State", obj_reg.State);
        cmd.Parameters.AddWithValue("@Zipcode", obj_reg.Zipcode);
        cmd.Parameters.AddWithValue("@Email", obj_reg.Email);
        cmd.Parameters.AddWithValue("@Login", obj_reg.Login);
        cmd.Parameters.AddWithValue("@Password", obj_reg.Password);
        cmd.Parameters.AddWithValue("@Passcode", obj_reg.Passcode);
        cmd.Parameters.AddWithValue("@BirthDate", obj_reg.Birthdate);
        cmd.Parameters.AddWithValue("@CWPermissionLevel", "User");
        cmd.Parameters.Add("@out__put", SqlDbType.Int);
        cmd.Parameters["@out__put"].Direction = ParameterDirection.Output;
        cmd.ExecuteNonQuery();
        con.Close();
        int a = Convert.ToInt32(cmd.Parameters["@out__put"].Value.ToString());
        if (a != 0)
            return true;
        else
            return false;

    }
}
