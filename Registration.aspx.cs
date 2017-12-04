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

public partial class Registration : System.Web.UI.Page
{
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowState();
            ShowCounties();
            randomCode();
        }

    }
    public void randomCode()
    {
        Random randam = new Random();
        string rndmNo = Convert.ToString(randam.Next(0, 9999));
        if (rndmNo.Length == 1)
        {
            rndmNo = "000" + rndmNo;
        }
        else if (rndmNo.Length == 2)
        {
            rndmNo = "00" + rndmNo;
        }
        else if (rndmNo.Length == 3)
        {
            rndmNo = "0" + rndmNo;
        }
        string i = Convert.ToString(objNewJob.ChkRandomNo(rndmNo));
        if (i == "Exist")
        {
            randomCode();
        }
        else
        {
            txtPasscode.Text = rndmNo;
        }
    }
    public void ShowState()
    {
        try
        {
            DataTable dt = objNewJob.ShowStates();
            ddl_State_Mailing.DataSource = dt;
            ddl_State_Mailing.DataValueField = "ID";
            ddl_State_Mailing.DataTextField = "State";
            ddl_State_Mailing.DataBind();
            ddl_State_Mailing.Items.Insert(0, new ListItem("Select State", "0"));

        }
        catch (Exception ex)
        {


        }
    }

    public void ShowCounties()
    {
        try
        {
            DataTable dt = objNewJob.ShowCounties();
            ddlCounty.DataSource = dt;
            ddlCounty.DataValueField = "ID";
            ddlCounty.DataTextField = "County";
            ddlCounty.DataBind();

            ddlCounty.Items.Insert(0, new ListItem("Select County", "0"));

        }
        catch (Exception ex)
        {


        }

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        dc_Registration obj_reg = new dc_Registration();
        obj_reg.First_Name = txt_Firstname.Text;
        obj_reg.Last_Name = txt_lastname.Text;
        obj_reg.Phone = txt_phone.Text;
        obj_reg.Address = txtAddress_Mailing.Text;
        obj_reg.City = txtCity_Mailing.Text;
        obj_reg.State = ddl_State_Mailing.SelectedItem.Text;
        obj_reg.Zipcode = txtZipCode_Mailing.Text;
        obj_reg.County = ddlCounty.SelectedItem.Text;
        obj_reg.Email = txt_email.Text;
        obj_reg.Login = txt_loginId.Text;
        obj_reg.Password = txt_pwd.Text;
        obj_reg.Passcode = txtPasscode.Text;
        obj_reg.Birthdate = txtBirthDate.Text;
        bool msg = obj_reg.Add_reg(obj_reg);
        if (msg == true)
        {
            alertMsg(this, "Registration Completed Successfully.", ResolveUrl("Login.aspx"));
            //Response.Redirect("Login.aspx");
        }
        else
            Response.Write("<script>alert('Failed');</script>");
    }
    public static void alertMsg(System.Web.UI.Page instance, string Message, string url)
    {
        instance.Response.Write(@"<script language='javascript'>alert('" + Message + "');document.location.href='" + url + "'; </script>");
    }
}
