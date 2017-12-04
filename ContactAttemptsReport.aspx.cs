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

public partial class ContactAttemptsReport : System.Web.UI.Page
{
    public DataTable dt1;
    dcContactAttemptsReport objCAR = new dcContactAttemptsReport();
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            if (Request.QueryString["Jobs"] != null)
            {
                if (Request.QueryString["Jobs"] != "")
                {
                    lblMsg.Text = "";
                    ShowContactPerson();
                    ShowContactResult();
                    ShowContactType();
                    //ShowContactAttempts();
                    ShowContactAttemptsComments();
                    txtTime_ContactAttempt.Text = DateTime.Now.ToString("HH:mm:ss tt");
                    txtDate_ContactAttempt.Text = DateTime.Now.ToString("MM/dd/yyyy");
                }
            }
        }
        ShowContactAttempts();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("AddNewJob.aspx?Jobs=" + Request.QueryString["Jobs"].ToString());
        }
        catch (Exception ex)
        {


        }


        //objCAR.InsertJobContactAttempts();
    }

    #region Fill Contact Person

    public void ShowContactPerson()
    {
        try
        {
            DataTable dt = objNewJob.ShowContactPerson();
            ddlContactPerson.DataSource = dt;
            ddlContactPerson.DataValueField = "ID";
            ddlContactPerson.DataTextField = "ContactPerson";
            ddlContactPerson.DataBind();
            ddlContactPerson.Items.Insert(0, new ListItem("Select Contact Person", "0"));



        }
        catch (Exception ex)
        {


        }

    }
    #endregion
    #region Fill Contact Type

    public void ShowContactType()
    {
        try
        {
            DataTable dt = objNewJob.ShowContactType();
            ddlContactType.DataSource = dt;
            ddlContactType.DataValueField = "ID";
            ddlContactType.DataTextField = "ContactType";
            ddlContactType.DataBind();
            ddlContactType.Items.Insert(0, new ListItem("Select Contact Type", "0"));
            //ddlContactType.Items.Insert(0, "Select Contact Type");

        }
        catch (Exception ex)
        {


        }

    }
    #endregion
    #region Fill Contact Result
    public void ShowContactResult()
    {
        try
        {
            DataTable dt = objNewJob.ShowContactResult();
            ddlContactResult.DataSource = dt;
            ddlContactResult.DataValueField = "ID";
            ddlContactResult.DataTextField = "ContactResult";
            ddlContactResult.DataBind();
            ddlContactResult.Items.Insert(0, new ListItem("Select Contact Result", "0"));
            //ddlContactResult.Items.Insert(0, "Select Contact Result");

        }
        catch (Exception ex)
        {


        }

    }
    #endregion

    #region Fill Contect Attempts
    public void ShowContactAttempts()
    {
        try
        {
            dt1 = objCAR.ShowContactAttempts(Request.QueryString["Jobs"].ToString());
            grdContactAttempts.DataSource = dt1;
            grdContactAttempts.DataBind();

        }
        catch (Exception ex)
        {


        }

    }
    #endregion

    #region Contact attempts Comments Insert Show
    protected void btnSaveComments_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            objCAR.InsertContactAttemptsComments(Request.QueryString["Jobs"].ToString(), txtComments.Text);
            ShowContactAttemptsComments();
            lblMsg.Text = "Comment Post Successfully";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {


        }
    }


    public void ShowContactAttemptsComments()
    {
        try
        {
            DataTable dt = objCAR.ShowContactAttempts_Comments(Request.QueryString["Jobs"].ToString());
            txtComments.Text = dt.Rows[0]["Comments"].ToString();

        }
        catch (Exception ex)
        {


        }

    }
    #endregion
    protected void btnSave_Click1(object sender, EventArgs e)
    {
        try
        {
            objCAR.InsertJobContactAttempts(Request.QueryString["Jobs"].ToString(), txtDate_ContactAttempt.Text + " " + txtTime_ContactAttempt.Text, ddlContactType.SelectedValue, ddlContactPerson.SelectedValue, ddlContactResult.SelectedValue, txtDate_Result.Text);
            ShowContactAttempts();
        }
        catch (Exception ex)
        {


        }


    }
}
