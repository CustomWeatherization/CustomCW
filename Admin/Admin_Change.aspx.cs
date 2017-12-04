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

public partial class Admin_Admin_Change : System.Web.UI.Page
{
    dc_Admin obj_Admin = new dc_Admin();
    smUtil objSm = new smUtil(); 
    
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }


    public void cancel()
    {
        try
        {
            txt_NewPasswd.Text = txt_NewUserName.Text = txt_OldPasswd.Text = txt_OldUserName.Text = "";
        }
        catch
        {
        }
    }


    protected void btn_ChangePasswd_Click(object sender, EventArgs e)
    {
        try
        {

            string UserName = Convert.ToString(objSm.GetCookie("Admin_Name")); 
            string Passwd = Convert.ToString(objSm.GetCookie("Admin_Pass"));
            if (UserName == txt_OldUserName.Text && Passwd == txt_OldPasswd.Text)
            {
                int i = obj_Admin.Update_Admin_Detail(txt_OldUserName.Text, txt_NewUserName.Text, txt_OldPasswd.Text, txt_NewPasswd.Text);
                if (i > 0)
                {
                    objSm.SetCookie("Admin_Name", txt_NewUserName.Text);
                    objSm.SetCookie("Admin_Pass", txt_NewPasswd.Text);

                    Response.Write("<script>alert('Successfully Changed');</script>");
                } 
                cancel();
            }
            else
            {
                Response.Write("<script>alert('Old User Name Or Old Password does not match.');</script>");
            }
        }
        catch
        {
        }
    }


    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        cancel();
        Response.Redirect("Default.aspx");
    }


    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
