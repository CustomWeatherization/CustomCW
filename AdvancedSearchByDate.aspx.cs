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

public partial class AdvancedSearchByDate : System.Web.UI.Page
{
    public string StrSearchname = "";
    string Role = "";
    string Uid = "";
    dc_AdvanceSearch objAdvance = new dc_AdvanceSearch();

    protected void Page_Load(object sender, EventArgs e)
    {
        StrSearchname = "";

        permission();

    }
    public void permission()
    {

        smUtil objSm = new smUtil();
        Role = objSm.GetCookie("Rol_Id");
        Uid = objSm.GetCookie("UId");
    }
    protected void btnDateScheduled_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        if (Role == "Admin" || Role == "Usr_Adm")
        {
            dt = objAdvance.SearchJobByDate("1", txtStartDate.Text, txtEndDate.Text);
        }
        else
        {
            dt = objAdvance.SearchJobByDate1("1", txtStartDate.Text, txtEndDate.Text, Convert.ToInt32(Uid));
        }
        grdAdvanceSearch.DataSource = dt;
        grdAdvanceSearch.DataBind();
        StrSearchname = "Advanced Search Results For Date Scheduled";

    }

    protected void btnDateCompleted_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        if (Role == "Admin" || Role == "Usr_Adm")
        {
            dt = objAdvance.SearchJobByDate("2", txtStartDate.Text, txtEndDate.Text);
        }
        else
        {
            dt = objAdvance.SearchJobByDate1("2", txtStartDate.Text, txtEndDate.Text, Convert.ToInt32(Uid));
        }
        grdAdvanceSearch.DataSource = dt;
        grdAdvanceSearch.DataBind();
        StrSearchname = "Advanced Search Results For Date Completed";

    }
    protected void btnDateAssigned_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        if (Role == "Admin" || Role == "Usr_Adm")
        {
            dt = objAdvance.SearchJobByDate("3", txtStartDate.Text, txtEndDate.Text);
        }
        else
        {
            dt = objAdvance.SearchJobByDate1("3", txtStartDate.Text, txtEndDate.Text, Convert.ToInt32(Uid));
        }
        grdAdvanceSearch.DataSource = dt;
        grdAdvanceSearch.DataBind();
        StrSearchname = "Advanced Search Results For Date Assigned";

    }
    protected void btnDateReturned_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        if (Role == "Admin" || Role == "Usr_Adm")
        {
            dt = objAdvance.SearchJobByDate("4", txtStartDate.Text, txtEndDate.Text);
        }
        else
        {
            dt = objAdvance.SearchJobByDate1("4", txtStartDate.Text, txtEndDate.Text, Convert.ToInt32(Uid));
        }
        grdAdvanceSearch.DataSource = dt;
        grdAdvanceSearch.DataBind();
        StrSearchname = "Advanced Search Results For Date Returned";

    }
    protected void btnFindByGeoGraphic_Click(object sender, EventArgs e)
    {
        StrSearchname = "Advanced Search Results By Geographic";
        string chkValue = "";
        if (rdoAddress.Checked)
        {
            chkValue = "1";
        }
        else if (rdoCity.Checked)
        {
            chkValue = "2";
        }
        else if (rdoZipCode.Checked)
        {
            chkValue = "3";
        }
        else if (rdoLastName.Checked)
        {
            chkValue = "4";
        }

        if (chkValue != "" && txtAddressCityZIp.Text != "")
        {
            //DataTable dt = objAdvance.SearchJob_GEOGRAPHIC(chkValue, txtAddressCityZIp.Text);


            DataTable dt = new DataTable();
            if (Role == "Admin" || Role == "Usr_Adm")
            {
                dt = objAdvance.SearchJob_GEOGRAPHIC(chkValue, txtAddressCityZIp.Text);
            }
            else
            {
                dt = objAdvance.SearchJob_GEOGRAPHIC1(chkValue, txtAddressCityZIp.Text, Convert.ToInt32(Uid));
            }

            grdGeographic.DataSource = dt;
            grdGeographic.DataBind();
        }
    }
}
