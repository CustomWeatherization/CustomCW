using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class Vendor_Vendor : System.Web.UI.MasterPage
{
    public string StrUserName = "";
    smUtil objSm = new smUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        lnk_adminis.Visible = true;
        span_word.Visible = true;
        StrUserName = objSm.GetCookie("UserName");
        if (!IsPostBack)
        {

            string obj = objSm.GetCookie("UserId");



            if (obj == "")
            {
                Response.Redirect("Login.aspx");
            }
            //objSm.GetCookie("UserFirstName");

        }
        string role = "";
        role = objSm.GetCookie("Rol_Id");
        if (role == "User")
        {
            lnk_adminis.Visible = true;
            span_word.Visible = true;
        }
    }
    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        //data side logout
        objSm.DeleteCookie("AdminID");
        objSm.DeleteCookie("Admin_Name");
        objSm.DeleteCookie("Admin_Pass");
        //end
        objSm.DeleteCookie("UId");
        objSm.DeleteCookie("UserId");
        objSm.DeleteCookie("UserName");
        objSm.DeleteCookie("Rol_Id");
        Response.Redirect("../Login.aspx");
    }
    protected void lnk_adminis_Click(object sender, EventArgs e)
    {
        string role = "";
        role = objSm.GetCookie("Rol_Id");
        if (role == "Admin" || role == "Usr_Adm")
            Response.Redirect("../admin/Admin_Unfinalize.aspx");
        else
            Response.Write("<script>alert('You do not have to Access Administer Database');</script>");

    }
}
