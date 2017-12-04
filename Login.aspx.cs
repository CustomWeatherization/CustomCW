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

public partial class Login : System.Web.UI.Page
{
    dcLogin objlogin = new dcLogin();
    public bool isactivated=false;
    protected void Page_Load(object sender, EventArgs e)
    {

      
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        smUtil objsmutil = new smUtil();
        DataTable dt = objlogin.GetLogin(txtUserLogin.Text, txtPassword.Text);

        if (dt.Rows.Count > 0)
        {
            objsmutil.SetCookie("UserId", dt.Rows[0]["CWLogin"].ToString());
            objsmutil.SetCookie("UserName", dt.Rows[0]["UserName"].ToString());
            objsmutil.SetCookie("UId", dt.Rows[0]["ID"].ToString());
            objsmutil.SetCookie("AId", dt.Rows[0]["AID"].ToString());
            objsmutil.SetCookie("Rol_Id", dt.Rows[0]["CWPermissionLevel"].ToString());
            objsmutil.SetCookie("Profile_Image", dt.Rows[0]["ProfileImage"].ToString());
            objsmutil.SetCookie("UsrRegisterId", dt.Rows[0]["User_Id"].ToString());
    
            dt = objlogin.GetContactDetail(dt.Rows[0]["UserName"].ToString());

            if (dt.Rows.Count > 0)
            {

                objsmutil.SetCookie("UCId", dt.Rows[0]["ID"].ToString());
            }
            Response.Redirect("Default.aspx");
        }
        else
        {
            Response.Write("<script>alert('Username Is Not Activated');</script>");
        }
    }

}
