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

public partial class JobMessages : System.Web.UI.Page
{
    smUtil objSmUtill = new smUtil();
    
    dcMessage objMessage = new dcMessage();
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowContactPerson();
            showUnReadMessagesByUserId();
            showReadMessagesByUserId();
        }
    }
    #region Fill Contact Person

    public void ShowContactPerson()
    {
        try
        {
            //DataTable dt = objNewJob.ShowContactPerson();
            //ddlEmployeeName.DataSource = dt;
            //ddlEmployeeName.DataValueField = "ID";
            //ddlEmployeeName.DataTextField = "ContactPerson";
            //ddlEmployeeName.DataBind();
            //ddlEmployeeName.Items.Insert(0, new ListItem("Select Contact Person", "0"));


        }
        catch (Exception ex)
        {


        }

    }
    #endregion
    #region Showmessage By User id
    public void showUnReadMessagesByUserId()
    {
        lblCountUnReadMsg.Text = "0";
        try
        {
            string strUid = objSmUtill.GetCookie("UId");

            DataTable dt = objMessage.ShowAll_Read_Unread_MessageByUserId(Convert.ToInt32(strUid),0);
            if (dt.Rows.Count > 0)
            {
                lblCountUnReadMsg.Text = dt.Rows[0]["NumberUnReadMessages"].ToString(); 
            }
            else
            {
                lblCountUnReadMsg.Text = "0";
            }
        }
        catch (Exception ex)
        {


        }
    }

    #endregion
    #region Show Read message By User id
    public void showReadMessagesByUserId()
    {
        lblCountReadMsg.Text = "0";
        try
        {
            string strUid = objSmUtill.GetCookie("UId");

            DataTable dt = objMessage.ShowAll_Read_Unread_MessageByUserId(Convert.ToInt32(strUid),1);
            if (dt.Rows.Count > 0)
            {
                lblCountReadMsg.Text = dt.Rows[0]["NumberReadMessages"].ToString(); 
            }
            else
            {
                lblCountReadMsg.Text = "0";
            }
        }
        catch (Exception ex)
        {


        }
    }

    #endregion
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}
