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

public partial class Admin_Admin_Master_Page : System.Web.UI.MasterPage
{

    smUtil objSm = new smUtil();

    protected void Page_Load(object sender, EventArgs e)
    {
        Divlt_name.Attributes.Add("style", "width:auto;");
        Cat.Visible = true;
        subcat.Visible = true;
        // thing.Visible = true;
        cng_pwd.Visible = true;
        rpt.Visible = true;
        sta_menu.Visible = true;
        smUtil objSm = new smUtil();
        string Username = objSm.GetCookie("Admin_Name");
        string newname = "Welcome" + " " + Username;
        lt_name.Text = newname;
        string role = "";
        role = objSm.GetCookie("Rol_Id");
        if (role == "Usr_Adm")
        {
           
            cng_pwd.Visible = false;
            TimeClk_rpt.Visible = false;
            a_rpt.HRef = "#";
            //rpt.Visible = false;
            //sta_menu.Visible = false;
        }
        else
        {
            Username = objSm.GetCookie("UserName");
            newname = "Welcome" + " " + Username + " As Admin";
            lt_name.Text = newname;
        }
        if (!IsPostBack)
        {
            if (Convert.ToString(objSm.GetCookie("AdminID")) == "")
            {
                Response.Redirect("Admin_Login.aspx");
            }
        }

    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        objSm.DeleteCookie("AdminID");
        objSm.DeleteCookie("Admin_Name");
        objSm.DeleteCookie("Admin_Pass");
        Response.Redirect("Admin_Login.aspx");
    }
}
