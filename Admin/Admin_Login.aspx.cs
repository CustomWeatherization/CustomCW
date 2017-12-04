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

public partial class Admin_Admin_Login : System.Web.UI.Page
{

    dc_Admin ObjAdmin = new dc_Admin();
    smUtil objsmutil = new smUtil();

    protected void Page_Load(object sender, EventArgs e)
    {
        //tanveer


        string role = "";
        role = objsmutil.GetCookie("Rol_Id");

        //end
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string role = "";
            role = objsmutil.GetCookie("Rol_Id");
            string ID = objsmutil.GetCookie("UId");
            if (role == "Usr_Adm")
            {
                DataTable dt1 = new DataTable();
                dcLogin objlogin = new dcLogin();
                dt1 = objlogin.GetLogin(txtUserLogin.Text, txtPassword.Text);
                if (dt1.Rows.Count > 0)
                {
                    objsmutil.SetCookie("AdminID", dt1.Rows[0]["CWLogin"].ToString());
                    objsmutil.SetCookie("Admin_Name", dt1.Rows[0]["UserName"].ToString());
                    if (Session["UserLogin"] == null && Session["UserLogin1"] == null)
                    {
                        Response.Redirect("Default.aspx");
                    }
                    else  if (Session["UserLogin"] != null)
                    {
                        Response.Redirect("LeaveApproval.aspx");
                    }else  if (Session["UserLogin1"] != null)
                    {
                        Response.Redirect("Occurrences.aspx");
                    }
                }
                else
                    Response.Write("<script>alert('User Login Name and Password does not match.');</script>");
            }

            else
            {
                DataTable dt = new DataTable();

                dt = ObjAdmin.CheckLoginUser(txtUserLogin.Text, txtPassword.Text);
                if (dt.Rows.Count > 0)
                {

                    objsmutil.SetCookie("AdminID", dt.Rows[0]["ID"].ToString());
                    objsmutil.SetCookie("Admin_Name", dt.Rows[0]["UserName"].ToString());
                    objsmutil.SetCookie("Admin_Pass", dt.Rows[0]["Password"].ToString());
                    if (Session["UserLogin"] == null && Session["UserLogin1"] == null)
                    {
                        Response.Redirect("Default.aspx");
                    }
                    else if (Session["UserLogin"] != null)
                    {
                        Response.Redirect("LeaveApproval.aspx");
                    }
                    else if (Session["UserLogin1"] != null)
                    {
                        Response.Redirect("Occurrences.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('User Login Name and Password does not match.');</script>");
                }
            }
        }
        catch
        {
        }

    }
}
