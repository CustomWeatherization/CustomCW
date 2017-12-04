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

public partial class Admin_testmultiselect : System.Web.UI.Page
{
    dc_Admin objAdmin = new dc_Admin();
    protected void Page_Load(object sender, EventArgs e)
    {
        FilDDlEmployee();
    }

    public void FilDDlEmployee()
    {
        DataTable dt = objAdmin.FillEmpDrowpDown("");
        if (dt.Rows.Count > 0)
        {
            lstHobbies.DataSource = dt;
            lstHobbies.DataTextField = "ClientName";
            lstHobbies.DataValueField = "ClientName";
            lstHobbies.DataBind();
         //   lstHobbies.Items.Insert(0, "All");
        }
        else
        {
            lstHobbies.Items.Insert(0, "Select");
        }
    }
}
