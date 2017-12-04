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

public partial class Home : System.Web.UI.Page
{
    public string StrUserName = "";
    smUtil objSmUtill = new smUtil();
    dc_AddNewJob objAddJob = new dc_AddNewJob();
    dcMessage objMessage = new dcMessage();
    dc_JobStatus objJobStatus = new dc_JobStatus();
    Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
    DataTable dt_AllJob = new DataTable();
    public int AllJob = 0;
    public int AllvendorJob = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

               
                showMessagesByUserId();
                if (Convert.ToString(Request.QueryString["JobNum"]) != null)
                {
                    if (Convert.ToString(Request.QueryString["GT"]) == "Vendor")
                    {
                        txtVendorNum.Text = Convert.ToString(Request.QueryString["JobNum"]);
                        ShowVendorDetail();
                       
                    }
                    else
                    {
                        txtJobNumber.Text = Convert.ToString(Request.QueryString["JobNum"]);
                        ShowDetail();
                    }
                }
            }

            //////////   Add Css Dynamic /////////////////

            string role = "";
            smUtil objSm = new smUtil();
            role = objSm.GetCookie("Rol_Id");
            StrUserName = objSm.GetCookie("UserName");
            string[] StrUser_Name = StrUserName.Split(' ');
            if (Convert.ToString(StrUser_Name[2]) == "")
            {
                StrUserName = StrUser_Name[0] + "  " + StrUser_Name[3];
            }
            else
            {
                StrUserName = StrUser_Name[0] + " " + StrUser_Name[2];
            }

            if (role == "Admin" || role == "Usr_Adm")
            {
                txtVendorJobNew.Visible = true;
                Panel1.Visible = true;
                DivAssignJob.Style.Add("display", "none");
                grdAssignJob.Style.Add("display", "none");
            }
            else
            {
                txtVendorJobNew.Visible = false;
                lnkAdvanceSearch.Visible = false;

                mid_box2.Style.Add("display", "none");
                btm_box2.Style.Add("display", "none");
                btm_box1.Style.Add("display", "none");
                btm_box1_.Attributes.Add("style", "position: absolute; top: -60px; left: 518px;");
                div_bottmo_secbg.Attributes.Add("style", "min-height: 30px;");
                Diviconright.Style.Add("display", "inline-block");

                int AID = Convert.ToInt32(objSm.GetCookie("AID"));
                string AidStr = "%" + AID + "%";
                DataTable DtUnFnlizeInv = objInvoice.ShowAllActiveInvoice(AidStr, AID);
                //if (DtUnFnlizeInv.Rows.Count > 0)
                //{
                grdAssignJob.DataSource = DtUnFnlizeInv;
                grdAssignJob.DataBind();
                //}
            }

            /////////////////////////////////////////////

            ShowAllJob();
            ShowAllvendorJob();
        }
        catch
        {
        }

    }

    protected void grdAssignJob_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataRowView drview = e.Row.DataItem as DataRowView;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string Comment="No comment";
            DataTable dt = new DataTable();
            Label LblDate = (Label)e.Row.FindControl("LblDate");
            Label LblFinal = (Label)e.Row.FindControl("LblFinal");
            Image ImgRject = (Image)e.Row.FindControl("ImgRject");
            Panel pnlDemo = (Panel)e.Row.FindControl("pnlDemo");//lblCommentText
            Label lblCommentText = (Label)e.Row.FindControl("lblCommentText");
            LinkButton lnkBtnJobNumber = (LinkButton)e.Row.FindControl("lnkBtnJobNumber");
           
            
            

            if (LblFinal.Text == "R")
            {
                if (lnkBtnJobNumber.Text != "" && lnkBtnJobNumber.Text != null)
                {
                    dt = objMessage.ShowLastCommentbyJobnumber(lnkBtnJobNumber.Text);
                    if (dt.Rows.Count > 0)
                    {
                        Comment = Convert.ToString(dt.Rows[0]["Comments"]);
                    }


                }
                ImgRject.Visible = true;
                lblCommentText.Text = Comment;

            }
            else
            {
                pnlDemo.Visible = false;
 
            }

            Label LblDash = (Label)e.Row.FindControl("LblDash");
            if (LblDate.Text == "01/01/1900" || LblDate.Text == null || LblDate.Text == "")
            {
                LblDash.Visible = true;
                LblDate.Visible = false;
            }
        }
    }


    public void ShowAllJob()
    {
        try
        {
            DataSet ds = objJobStatus.ShowJobStatus();
            dt_AllJob = (ds.Tables[0]);
            if (dt_AllJob.Rows.Count > 0)
            {
                for (int i = 0; i < dt_AllJob.Rows.Count; i++)
                {
                    AllJob = Convert.ToInt32(AllJob + Convert.ToInt32(dt_AllJob.Rows[i]["NumberofJobs"]));
                }
            }
        }
        catch
        {
        }
    }
    public void ShowAllvendorJob()
    {
        try
        {
            DataSet ds = objJobStatus.ShowJobVendor();
            dt_AllJob = (ds.Tables[0]);
            if (dt_AllJob.Rows.Count > 0)
            {
                for (int i = 0; i < dt_AllJob.Rows.Count; i++)
                {
                    AllvendorJob = Convert.ToInt32(AllvendorJob + Convert.ToInt32(dt_AllJob.Rows[i]["InvoiceId"]));
                }
            }
        }
        catch
        {
        }
    }

  


    protected void btnNewJob_Click(object sender, EventArgs e)
    {
        try
        {
            string Role = "";
            smUtil objSm = new smUtil();
            Role = objSm.GetCookie("Rol_Id");
            if (Role == "Admin" || Role == "Usr_Adm")
            {
                if (txtJobNew.Text != "")
                {
                    if (Convert.ToString(txtJobNew.Text).Length > 5)
                    {
                        if (Convert.ToString(txtJobNew.Text).Length < 15)
                        {
                            lblMsgNewJob.Text = "";
                            DataTable dt = objAddJob.GetJobExistOrNot(txtJobNew.Text);

                            if (dt.Rows.Count > 0)
                            {
                                lblMsgNewJob.Text = "Job Number already exist.";
                                lblMsgNewJob.ForeColor = System.Drawing.Color.Red;
                            }
                            else
                            {
                                Response.Redirect("AddNewJob.aspx?JobNew=" + txtJobNew.Text + "&Back=Home");
                            }
                        }
                        else
                        {
                            lblMsgNewJob.Text = "You must enter a Job Number in the range of 6 to 14 characters";
                        }
                    }
                    else
                    {
                        lblMsgNewJob.Text = "You must enter a Job Number in the range of 6 to 14 characters";
                    }
                }
                else if (txtVendorJobNew.Text != "")
                {
                    if (Convert.ToString(txtVendorJobNew.Text).Length > 5)
                    {
                        if (Convert.ToString(txtVendorJobNew.Text).Length < 31)
                        {
                            lblMsgNewJob.Text = "";
                            DataTable dt = objAddJob.GetVendorJobExistsorNot(txtVendorJobNew.Text);

                            if (dt.Rows.Count > 0)
                            {
                                lblMsgNewJob.Text = " Vendor Job Number already exist.";
                                lblMsgNewJob.ForeColor = System.Drawing.Color.Red;
                            }
                            else
                            {
                                Response.Redirect("AddNewJob.aspx?JobNew=" + txtVendorJobNew.Text + "&Back=Home&GT=Vendor");
                            }
                        }
                        else
                        {
                            lblMsgNewJob.Text = "You must enter a Vendor Job Number in the range of 6 to 30 characters";
                        }
                    }
                    else
                    {
                        lblMsgNewJob.Text = "You must enter a  Vendor Job Number in the range of 6 to 30 characters";
                    }
                }
                else
                {
                    lblMsgNewJob.Text = "You must enter a Job Number in the range of 6 to 30 characters";
                }
            }
            else
                Response.Write("<script>alert('You do not have permission to Access Job Status');</script>");
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnJobStatus_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobStatusMenu.aspx");
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        if (txtLastName.Text != "Last Name" && txtLastName.Text != "" && txtJobNumber.Text == "" && txtAccount.Text == "" && txtPhone.Text == "")
        {

            Response.Redirect("SearchResultLname.aspx?lname=" + txtLastName.Text + "");
        }
        else
        {
            ShowDetail();
        }
    }

    public void ShowDetail()
    {
        string AcctNo = txtAccount.Text;
        int Uid = 0;
        string role = "";
        smUtil objSm = new smUtil();
        Uid = Convert.ToInt32(objSm.GetCookie("UId"));
        int AID = Convert.ToInt32(objSm.GetCookie("AID"));

        role = objSm.GetCookie("Rol_Id");


        if (txtJobNumber.Text == "Job Number")
        {
            txtJobNumber.Text = "";
        }

        if (txtLastName.Text == "Last Name")
        {
            txtLastName.Text = "";
        }

        if (AcctNo == "Account")
        {
            AcctNo = "";
        }

        if (txtPhone.Text == "Phone")
        {
            txtPhone.Text = "";
        }

        if (AcctNo.Length == 11 || AcctNo.Length == 12)
        {
            AcctNo = txtAccount.Text;
        }
        else if (AcctNo.Length == 13)
        {
            AcctNo = AcctNo.Replace("-", "");
        }
        else if (AcctNo.Length == 10)
        {
            AcctNo = AcctNo.Insert(5, "-");
        }


        if (txtPhone.Text.Length == 12)
        {
            txtPhone.Text = txtPhone.Text;
        }
        else if (txtPhone.Text != "")
        {
            txtPhone.Text = txtPhone.Text.Insert(3, "-");
            txtPhone.Text = txtPhone.Text.Insert(7, "-");
        }

        if (role == "User")
        {
            Uid = AID;
        }



        DataTable dt = objAddJob.SearchJob(txtJobNumber.Text.Trim(), txtLastName.Text, AcctNo, txtPhone.Text, role, Uid);
        if (dt.Rows.Count > 0)
        {
            string AUID = "";
            if (Convert.ToString(dt.Rows[0]["AccessUser"]) != "" && Convert.ToString(dt.Rows[0]["AccessUser"]) != null)
            {
                AUID = Convert.ToString(dt.Rows[0]["AccessUser"]);
            }
            else
            {
                AUID = "0";
            }
            string[] AUID_ = AUID.Split(',');
            string FirstAUID = Convert.ToString(AUID_[0]);
            string SecAUID = "0";
            if (AUID_.Length > 1)
            {
                SecAUID = Convert.ToString(AUID_[1]);
            }
            if ((role == "Admin" || role == "Usr_Adm" || Convert.ToInt32(FirstAUID) == AID || Convert.ToInt32(SecAUID) == AID) || Convert.ToInt32(FirstAUID) == 0)
            {
                if (dt.Rows.Count > 0)
                {
                    DataTable dt_Invoice = objInvoice.SearchTotalInvoice(txtJobNumber.Text.Trim());
                    //int invoice = Convert.ToInt32(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
                    string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
                    if (IncoiceNo == "")
                    {
                        IncoiceNo = "1";
                    }
                    Response.Redirect("DisplayJobSearchRecords.aspx?InvoiceNo=" + IncoiceNo.Trim() + "&Jobs=" + dt.Rows[0]["JobNumber"].ToString().Trim() + "&Utility=" + dt.Rows[0]["UtilityCompany1"].ToString());
                }
                // Use This Store "SearchJobs"
                else
                {
                    if (role == "Admin" || role == "Usr_Adm")
                    {
                        txtJobNumber.Text = txtLastName.Text = txtAccount.Text = txtPhone.Text = "";
                        Response.Write("<script>alert('This Kind of Job does not exist.');</script>");
                    }
                    else
                    {
                        txtJobNumber.Text = txtLastName.Text = txtAccount.Text = txtPhone.Text = "";
                        Response.Write("<script>alert('You do not have permission to View this job.');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('You do not have permission to View this job.');</script>");
            }
        }
    }

    #region Showmessage By User id
    public void showMessagesByUserId()
    {
        try
        {
            string strUid = objSmUtill.GetCookie("UId");

            DataTable dt = objMessage.ShowAll_Read_Unread_MessageByUserId(Convert.ToInt32(strUid), 0);
            if (dt.Rows.Count > 0)
            {
                lblCountMsg.Text = dt.Rows[0]["NumberUnReadMessages"].ToString();
                Page.Title = "Home (" + dt.Rows[0]["NumberUnReadMessages"].ToString() + ")";
            }
            else
            {
                lblCountMsg.Text = "0";
                Page.Title = "Home (" + 0 + ")";
            }
        }
        catch (Exception ex)
        {


        }
    }

    #endregion
    protected void lnk_job_Click(object sender, EventArgs e)
    {
        string Role = "";
        smUtil objSm = new smUtil();
        Role = objSm.GetCookie("Rol_Id");
        if (Role == "Admin" || Role == "Usr_Adm")
        {
            Response.Redirect("JobStatusMenu.aspx");
        }
        else
            Response.Write("<script>alert('You do not have permission to Access Job Status');</script>");

    }
    protected void lnk_vendorJob_Click(object sender, EventArgs e)
    {
        string Role = "";
        smUtil objSm = new smUtil();
        Role = objSm.GetCookie("Rol_Id");
        if (Role == "Admin" || Role == "Usr_Adm")
        {
            string Job = "Vendor";
            Response.Redirect("JobStatusMenu.aspx?vendoreJob=" + Job + "");
        }
        else
            Response.Write("<script>alert('You do not have permission to Access Job Status');</script>");

    }
    protected void btnFindVendor_Click(object sender, EventArgs e)
    {
        if (txtVendorName.Text != "Contact Name" && txtVendorName.Text != "" && txtVendorNum.Text == "" && txtVendorAccount.Text == "" && txtVendorPhone.Text == "")
        {
            Response.Redirect("SearchResultLname.aspx?flag=Vendor&lname=" + txtVendorName.Text + "");
        }
        else if (txtVendorNum.Text != "" && txtVendorNum.Text.Length < 6)
        {
            Response.Redirect("SearchResultLname.aspx?flag=Vendor&Jname=" + txtVendorNum.Text + "");
        }
        else
        {
            ShowVendorDetail();
        }
    }


    public void ShowVendorDetail()
    {
        string AcctNo = txtVendorAccount.Text;


        int Uid = 0;
        string role = "";
        smUtil objSm = new smUtil();
        Uid = Convert.ToInt32(objSm.GetCookie("UId"));
        role = objSm.GetCookie("Rol_Id");

        if (txtVendorNum.Text == "Vendor Number")
        {
            txtVendorNum.Text = "";
        }

        if (txtVendorName.Text == "Vendor Name")
        {
            txtVendorName.Text = "";
        }

        if (AcctNo == "Account")
        {
            AcctNo = "";
        }

        if (txtVendorPhone.Text == "Phone")
        {
            txtVendorPhone.Text = "";
        }

        if (AcctNo.Length == 11 || AcctNo.Length == 12)
        {
            AcctNo = txtVendorAccount.Text;
        }
        else if (AcctNo.Length == 13)
        {
            AcctNo = AcctNo.Replace("-", "");
        }
        else if (AcctNo.Length == 10)
        {
            AcctNo = AcctNo.Insert(5, "-");
        }

        if (txtVendorPhone.Text.Length == 12)
        {
            txtVendorPhone.Text = txtVendorPhone.Text;
        }
        else if (txtVendorPhone.Text != "")
        {
            txtVendorPhone.Text = txtVendorPhone.Text.Insert(3, "-");
            txtVendorPhone.Text = txtVendorPhone.Text.Insert(7, "-");
        }



        DataTable dt = objAddJob.SearchVendorJob(txtVendorNum.Text, txtVendorName.Text, AcctNo, txtVendorPhone.Text, role, Uid);
        if (dt.Rows.Count > 0)
        {
            DataTable dt_Invoice = objInvoice.SearchTotalInvoice(txtVendorNum.Text);
            //int invoice = Convert.ToInt32(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
            string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
            if (IncoiceNo == "")
            {
                IncoiceNo = "1";
            }
            Response.Redirect("DisplayJobSearchRecords.aspx?InvoiceNo=" + IncoiceNo + "&GT=Vendor&Jobs=" + dt.Rows[0]["VendorJobNumber"].ToString());
        }
        // Use This Store "SearchJobs"
        else
        {
            if (role == "Admin" || role == "Usr_Adm")
            {
                txtVendorNum.Text = txtVendorName.Text = txtVendorAccount.Text = txtVendorPhone.Text = "";
                Response.Write("<script>alert('This Kind of Job does not exist.');</script>");
            }
            else
            {
                txtVendorNum.Text = txtVendorName.Text = txtAccount.Text = txtVendorPhone.Text = "";
                Response.Write("<script>alert('You do not have permission to View this job.');</script>");
            }
        }
    }
    protected void grdAssignJob_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string Job_Number = Convert.ToString(grdAssignJob.DataKeys[e.RowIndex].Value.ToString());
        txtJobNumber.Text = Job_Number;
        ShowDetail(); 
    }


  

   
}
