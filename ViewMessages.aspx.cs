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

public partial class ViewMessages : System.Web.UI.Page
{
    smUtil objSmUtill = new smUtil();
    dcMessage objMessage = new dcMessage();
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    public string StrRecName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
            ShowEmployee();
            showReadMessagesByUserId();
           
        }
        ShowingCount();
        StrRecName = objSmUtill.GetCookie("UserName");
    }


    protected void Timer1_Tick(object sender, EventArgs e)
    {
        ShowingCount();
    }

    protected void btnGrdBind_Click(object sender, EventArgs e)
    {
        ShowingCount();
        showReadMessagesByUserId();
    }

    public void ShowingCount()
    {
        string strUid = objSmUtill.GetCookie("UId");
        DataTable dt = objMessage.ShowAll_Read_Unread_MessageByUserId(Convert.ToInt32(strUid), 0);
        if (dt.Rows.Count > 0)
        {
            lblCountUnReadMsg.Text = dt.Rows[0]["NumberUnReadMessages"].ToString();
        }
        else
        {
            lblCountUnReadMsg.Text = "0";
        }
        dt = objMessage.ShowAll_Read_Unread_MessageByUserId(Convert.ToInt32(strUid), 1);
        if (dt.Rows.Count > 0)
        {
            //lblCountReadMsg.Text = dt.Rows[0]["NumberReadMessages"].ToString();
        }
        else
        {
            //lblCountReadMsg.Text = "0";
        }
    }


    #region All Message Info
    public void showReadMessagesByUserId()
    {
        StrRecName = objSmUtill.GetCookie("UserName");
        try
        {
            string strUid = objSmUtill.GetCookie("UId");
            if (Request.QueryString["UR"] != null)
            {
                if (Request.QueryString["UR"] != "")
                {
                    if (Request.QueryString["UR"].ToString() == "0")
                    {
                        DataTable dt = objMessage.ShowAll_Message_and_Sender_MessageByUserId(Convert.ToInt32(strUid), "U");
                        DataRow row = dt.NewRow();
                        if (dt.Rows.Count > 0)
                        {
                            dt.Rows.InsertAt(row, 0);
                        }
                        grdContactAttempts.DataSource = dt;
                        grdContactAttempts.DataBind();
                    }
                    else if (Request.QueryString["UR"].ToString() == "1")
                    {
                        DataTable dt = objMessage.ShowAll_Message_and_Sender_MessageByUserId(Convert.ToInt32(strUid), "R");
                        DataRow row = dt.NewRow();
                        if (dt.Rows.Count > 0)
                        {
                            dt.Rows.InsertAt(row, 0);
                        }
                        grdContactAttempts.DataSource = dt;
                        grdContactAttempts.DataBind();
                    }
                    else if (Request.QueryString["UR"].ToString() == "2")
                    {
                        DataTable dt = objMessage.Show_SendMessageText_info_UserId(Convert.ToInt32(strUid));
                        DataRow row = dt.NewRow();
                        if (dt.Rows.Count > 0)
                        {
                            dt.Rows.InsertAt(row, 0);
                        }
                        GrdViewSend.DataSource = dt;
                        GrdViewSend.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {

        }
    }

    #endregion
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        showReadMessagesByUserId();
        ddlRecentName.SelectedIndex = 0;
    }

    #region Bind Show MessageFor Reply
    protected void GrdSecFilling_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            //e.Row.Cells[0].Text = "Read";
            //Find the checkbox control in header and add an attribute
            ((CheckBox)e.Row.FindControl("ChkReadUnread")).Attributes.Add("onclick", "javascript:SelectAll('" + ((CheckBox)e.Row.FindControl("ChkReadUnread")).ClientID + "')");
        }
        if (e.Row.RowIndex >= 0)
        {
            string Jobs = Convert.ToString(grdContactAttempts.DataKeys[e.Row.RowIndex].Values[0]);
            string ID = Convert.ToString(grdContactAttempts.DataKeys[e.Row.RowIndex].Values[1]);
            LinkButton lnknote = (LinkButton)e.Row.FindControl("lnknote");
            LinkButton lnknoteAll = (LinkButton)e.Row.FindControl("lnknoteAll");
            string UID = objSmUtill.GetCookie("UId");

            string urlnote = "JobMessageReply.aspx?Mid=" + lnknote.CommandArgument.ToString() + "&UId=" + UID + "&Jobs=" + Jobs + "&ID=" + ID;
            string fullURLnote = "window.open('" + urlnote + "', '_blank', 'height=600,width=690,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=no,titlebar=no' );return false;";
            string url = "ShowChart.aspx?chartId=" + lnknote.CommandArgument.ToString();
            string fullURL = "window.open('" + url + "', '_blank', 'height=600,width=690,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=no,titlebar=no' );return false;";

            lnknote.Attributes.Add("OnClick", fullURLnote);

            //Harpreet

            string urlnoteAll = "JobMessageReply.aspx?View=ViewAll&Mid=" + lnknoteAll.CommandArgument.ToString() + "&UId=" + UID + "&Jobs=" + Jobs + "&ID=" + ID;
            string fullURLnoteAll = "window.open('" + urlnoteAll + "', '_blank', 'height=600,width=690,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=no,titlebar=no' );return false;";
            string urlAll = "ShowChart.aspx?chartId=" + lnknoteAll.CommandArgument.ToString();
            string fullURLAll = "window.open('" + urlAll + "', '_blank', 'height=600,width=690,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=no,titlebar=no' );return false;";

            lnknoteAll.Attributes.Add("OnClick", fullURLnoteAll);





            HiddenField HdnReanUnread = (HiddenField)e.Row.FindControl("HdnReanUnread");
            CheckBox ChkReadUnread = (CheckBox)e.Row.FindControl("ChkReadUnread");

            if (HdnReanUnread != null && ChkReadUnread != null)
            {
                string ReanUnread = HdnReanUnread.Value;
                if (ReanUnread.Trim() == "U")
                {
                    ChkReadUnread.Text = "";
                }
                else
                {
                    ChkReadUnread.Text = "";
                    this.grdContactAttempts.Columns[0].HeaderText = "The new header";
                }
            }

            HiddenField hdnComment = (HiddenField)e.Row.FindControl("hdnComment");
            Label lblCommentDetailsShow = (Label)e.Row.FindControl("lblCommentDetailsShow");
            Label lblCommentShowOnly = (Label)e.Row.FindControl("lblCommentShowOnly");

            if (hdnComment.Value == "")
            {
                lblCommentDetailsShow.Visible = false;
                lblCommentShowOnly.Visible = true;
            }
            else
            {
                lblCommentDetailsShow.Visible = true;
                lblCommentShowOnly.Visible = false;
            }
            Label lblGJobNumber = (Label)e.Row.FindControl("lblGJobNumber");
            Label lbl_Dash_ = (Label)e.Row.FindControl("lbl_Dash_");
            Label lblMessageType = (Label)e.Row.FindControl("lblMessageType");
            ImageButton lblMSGIcon = (ImageButton)e.Row.FindControl("lblMSGIcon");
            ImageButton tmbtn = (ImageButton)e.Row.FindControl("tmbtn");
            ImageButton imgRMessage = (ImageButton)e.Row.FindControl("imgRMessage");
            ImageButton imgOMessage = (ImageButton)e.Row.FindControl("imgOMessage");


            if (lblGJobNumber.Text == "0" && lblMessageType.Text != "R" && lblMessageType.Text != "OR" && lblMessageType.Text != "OA")
            {
                lbl_Dash_.Visible = true;
                lblGJobNumber.Visible = false;
                imgRMessage.Visible = false;
                imgOMessage.Visible = false;
                tmbtn.Visible = false;
                lblMSGIcon.Visible = true;
            }
            else if (lblGJobNumber.Text == "0" && lblMessageType.Text == "R")
            {
                lbl_Dash_.Visible = true;
                lblGJobNumber.Visible = false;
                imgRMessage.Visible = true;
                tmbtn.Visible = false;
                imgOMessage.Visible = false;
                lblMSGIcon.Visible = false;
            }
            else if (lblGJobNumber.Text == "0" && (lblMessageType.Text == "OR" || lblMessageType.Text == "OA"))
            {
                lbl_Dash_.Visible = true;
                lblGJobNumber.Visible = false;
                imgRMessage.Visible = false;
                imgOMessage.Visible = true;
                tmbtn.Visible = false;
                lblMSGIcon.Visible = false;
            }

            if (Request.QueryString["UR"] == "1")
            {
                if (lblGJobNumber.Text == "0" && lblMessageType.Text != "R" && lblMessageType.Text != "OR" && lblMessageType.Text != "OA")
                {
                    tmbtn.ImageUrl = "images/genread.png";
                    lblMSGIcon.ImageUrl = "images/genread.png";
                }
                else if (lblGJobNumber.Text == "0" && lblMessageType.Text == "R")
                {
                    tmbtn.ImageUrl = "images/RMessageOpen.png";
                    imgRMessage.ImageUrl = "images/RMessageOpen.png";
                }
                else if (lblGJobNumber.Text == "0" && (lblMessageType.Text == "OR" || lblMessageType.Text == "OA"))
                {
                    tmbtn.ImageUrl = "images/OMessageOpen.png";
                    imgOMessage.ImageUrl = "images/OMessageOpen.png";
                }
                else
                {
                    tmbtn.ImageUrl = "images/MailOpen.png";
                    lblMSGIcon.ImageUrl = "images/MailOpen.png";
                }
            }
            else if (Request.QueryString["UR"] == "0")
            {
                if (lblGJobNumber.Text == "0" && lblMessageType.Text != "R" && lblMessageType.Text != "OR" && lblMessageType.Text != "OA")
                {
                    tmbtn.ImageUrl = "images/genunread.png";
                    lblMSGIcon.ImageUrl = "images/genunread.png";
                }
                else if (lblGJobNumber.Text == "0" && lblMessageType.Text == "R")
                {
                    tmbtn.ImageUrl = "images/RMessage.png";
                    imgRMessage.ImageUrl = "images/RMessage.png";
                }
                else if (lblGJobNumber.Text == "0" && (lblMessageType.Text == "OR" || lblMessageType.Text == "OA"))
                {
                    tmbtn.ImageUrl = "images/OMessage.png";
                    imgOMessage.ImageUrl = "images/OMessage.png";
                }
                else
                {
                    tmbtn.ImageUrl = "images/emailIcon.png";
                    lblMSGIcon.ImageUrl = "images/emailIcon.png";
                }
            }

            //Label lbl_Message = (Label)e.Row.FindControl("lblMessage");
            Label lbl_Dash = (Label)e.Row.FindControl("lbl_Dash");
            Label lblCustomerLastName = (Label)e.Row.FindControl("lblCustomerLastName");
            Label lblCustomerFirstName = (Label)e.Row.FindControl("lblCustomerFirstName");
            Label lblCustomerServiceAddress1 = (Label)e.Row.FindControl("lblCustomerServiceAddress1");
            Label lblCustomerServiceCity = (Label)e.Row.FindControl("lblCustomerServiceCity");
            Label lblStateName = (Label)e.Row.FindControl("lblStateName");
            Label lblCustomerServiceZipCode = (Label)e.Row.FindControl("lblCustomerServiceZipCode");

            HiddenField hdnMessageCC = (HiddenField)e.Row.FindControl("hdnMessageCC");
            //lbl_Message.ToolTip = HttpUtility.HtmlDecode(lbl_Message.Text);
            if (hdnMessageCC.Value == null || hdnMessageCC.Value == "")
            {
                Label lblCCSi = (Label)e.Row.FindControl("lblCCSi");
                lblCCSi.Visible = false;
            }

            if ((lblCustomerLastName.Text == null || lblCustomerLastName.Text == "") && (lblCustomerFirstName.Text == null || lblCustomerFirstName.Text == ""))
            {
                lblCustomerLastName.Visible = lblCustomerFirstName.Visible = lblCustomerServiceAddress1.Visible = lblCustomerServiceCity.Visible = lblStateName.Visible = lblCustomerServiceZipCode.Visible = false;
                lbl_Dash.Visible = true;
            }
        }

    }
    #endregion

    protected void tmbtn_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        int index = gvRow.RowIndex;
        Label lblGJobNumber = (gvRow.Cells[0].FindControl("lblGJobNumber") as Label);
        HiddenField HdnGMID = (gvRow.Cells[0].FindControl("HdnGMID") as HiddenField);
        string JobNum = lblGJobNumber.Text;
        string MID = HdnGMID.Value;
        DataTable dt = objMessage.messageReadUnreadConvert(Convert.ToInt32(MID), JobNum);
        string UC = Convert.ToString(dt.Rows[0]["UtilityCompany"]);
        if (Convert.ToString(dt.Rows[0]["JobVendor"]) == "Vendor")
        {
            Response.Redirect("AddNewJob.aspx?InvoiceNo=1&Jobs=" + JobNum + "&GT=Vendor&Back=DisplayJobSearchRecords" + "#ConmtHis");
        }
        else
        {
            Response.Redirect("AddNewJob.aspx?Back=JobsStatus&Jobs=" + JobNum + "&UC=" + UC + "#ConmtHis");
        }
    }
    protected void lblMSGIcon_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        int index = gvRow.RowIndex;
        Label lblGJobNumber = (gvRow.Cells[0].FindControl("lblGJobNumber") as Label);
        HiddenField HdnGMID = (gvRow.Cells[0].FindControl("HdnGMID") as HiddenField);
        string JobNum = lblGJobNumber.Text;
        string MID = HdnGMID.Value;
        DataTable dt = objMessage.messageReadUnreadConvert(Convert.ToInt32(MID), JobNum);
        showReadMessagesByUserId();
        StrRecName = objSmUtill.GetCookie("UserName");
    }

    protected void imgRMessage_Click(object sender, ImageClickEventArgs e)
     {
      
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        int index = gvRow.RowIndex;
        Label lblGJobNumber = (gvRow.Cells[0].FindControl("lblGJobNumber") as Label);
        Label RequestType = (gvRow.Cells[0].FindControl("lblRequestType") as Label);
        Label lblSenderUserID = (gvRow.Cells[0].FindControl("lblSenderUserID") as Label);
        HiddenField HdnGMID = (gvRow.Cells[0].FindControl("HdnGMID") as HiddenField);
        string JobNum = lblGJobNumber.Text;
        string MID = HdnGMID.Value;
        DataTable dt = objMessage.messageReadUnreadConvert(Convert.ToInt32(MID), JobNum);
        showReadMessagesByUserId();
        StrRecName = objSmUtill.GetCookie("UserName");
        string objUserName = objSmUtill.GetCookie("UserId");
        string role = "";
        role = objSmUtill.GetCookie("Rol_Id");
        if (role == "Admin" || role == "Usr_Adm")
        {
            if (lblSenderUserID != null)
            {
                Session["UserLogin"] = lblSenderUserID.Text;
            }
            else
            {
                Session["UserLogin"] = "0";
            }
            if (RequestType != null)
            {
                Session["RequestType"] = RequestType.Text;
            }
            else
            {
                Session["RequestType"] = "All";
            }
            Response.Redirect("admin/Admin_Login.aspx");
        }
        //else
        //    Response.Write("<script>alert('You do not have to Access Administer Database');</script>");


    }

    protected void imgOMessage_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        int index = gvRow.RowIndex;
        Label lblGJobNumber = (gvRow.Cells[0].FindControl("lblGJobNumber") as Label);
        Label RequestType = (gvRow.Cells[0].FindControl("lblRequestType") as Label);
        Label lblMessageType = (gvRow.Cells[0].FindControl("lblMessageType") as Label);
        Label lblSenderUserID = (gvRow.Cells[0].FindControl("lblSenderUserID") as Label);
        HiddenField HdnGMID = (gvRow.Cells[0].FindControl("HdnGMID") as HiddenField);
        string JobNum = lblGJobNumber.Text;
        string MID = HdnGMID.Value;
        DataTable dt = objMessage.messageReadUnreadConvert(Convert.ToInt32(MID), JobNum);
        

        StrRecName = objSmUtill.GetCookie("UserName");
        string objUserName = objSmUtill.GetCookie("UserId");
        if (lblMessageType.Text == "OR")
        {
            AjaxControlToolkit.ModalPopupExtender p = this.Master.FindControl("ModalPopupExtender4") as AjaxControlToolkit.ModalPopupExtender;
            p.Show();
        }
        else if (lblMessageType.Text == "OA")
        {
           
            string role = "";
            role = objSmUtill.GetCookie("Rol_Id");
            if (role == "Admin" || role == "Usr_Adm")
            {
                if (lblSenderUserID != null)
                {
                    Session["UserLogin1"] = lblSenderUserID.Text;
                }
                else
                {
                    Session["UserLogin1"] = "0";
                }
                
                Response.Redirect("admin/Admin_Login.aspx");
            }
        }

        showReadMessagesByUserId();
        ShowEmployee();
    }

    public DataSet GetData(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataSet ds = new DataSet())
                {
                    sda.Fill(ds);
                    return ds;
                }
            }
        }
    }

    protected void btnDeleteRead_Click(object sender, EventArgs e)
    {
        try
        {
            int count = 0;
            foreach (GridViewRow row in grdContactAttempts.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.FindControl("ChkReadUnread") as CheckBox);
                   
                    if ((row.FindControl("ChkReadUnread") as CheckBox).Checked)
                    {

                        HiddenField HdnGMID = (row.FindControl("HdnGMID") as HiddenField);
                        string MID = HdnGMID.Value;
                        if (MID != "")
                        {
                            count++;
                            objMessage.DeleteMsgByID(Convert.ToInt32(MID));
                        }
                    }
                }
            }
            if (count > 0)
            {
                showReadMessagesByUserId();
                lblMsg.Text = count + " message deleted successfully";
                ShowingCount();
            }
            else
            {
                //lblMsg.Text = "Please Select At-least one message to Delete.";
                StrRecName = objSmUtill.GetCookie("UserName");
            }
        }
        catch (Exception)
        {
            lblMsg.Text = "Please Select At-least one message to Delete.";
            StrRecName = objSmUtill.GetCookie("UserName");
        }
    }



    protected void btnMsgReadUnread_Click(object sender, EventArgs e)
    {
        try
        {
            int count = 0;
            foreach (GridViewRow row in grdContactAttempts.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("ChkReadUnread") as CheckBox);
                    if (chkRow.Checked)
                    {
                        HiddenField HdnGMID = (row.Cells[0].FindControl("HdnGMID") as HiddenField);
                        string MID = HdnGMID.Value;
                        if (MID != "")
                        {
                            count++;
                            if (Request.QueryString["UR"] == "0")
                            {
                                objMessage.messageReadUnread_Convert(Convert.ToInt32(MID), "R");
                            }
                            else if (Request.QueryString["UR"] == "1")
                            {
                                objMessage.messageReadUnread_Convert(Convert.ToInt32(MID), "U");
                            }
                        }
                    }
                }
            }
            if (count > 0)
            {
                showReadMessagesByUserId();
                lblMsg.Text = count + " message moved successfully";
                ShowingCount();
            }
            else
            {
                lblMsg.Text = "Please Select At-least one message to move.";
                StrRecName = objSmUtill.GetCookie("UserName");
            }
        }
        catch (Exception)
        {
            lblMsg.Text = "Please Select At-least one message to move.";
            StrRecName = objSmUtill.GetCookie("UserName");
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobMessages.aspx");
    }


    #region Select Recent Name
    protected void ddlRecentName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlRecentName.SelectedValue == "0")
        {
            showReadMessagesByUserId();
        }
        else
        {
            string strUid = objSmUtill.GetCookie("UId");
            DataTable dt = objMessage.Search_SendMessageText_By_info_UserId_and_Name(Convert.ToInt32(strUid), Convert.ToInt32(ddlRecentName.SelectedValue));
            StrRecName = objSmUtill.GetCookie("UserName");
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.NewRow();
                dt.Rows.InsertAt(row, 0);
            }
            GrdViewSend.DataSource = dt;
            GrdViewSend.DataBind();
        }
    }
    #endregion
    #region Select Recent Name
    protected void ddlread_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddlread.SelectedValue == "0")
        {
            showReadMessagesByUserId();
        }
        else
        {

            string strUid = objSmUtill.GetCookie("UId");
            DataTable dt = objMessage.Search_ReadMessageText_By_info_UserId_and_Name(Convert.ToInt32(strUid), Convert.ToInt32(ddlread.SelectedValue));
            StrRecName = objSmUtill.GetCookie("UserName");
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.NewRow();
                dt.Rows.InsertAt(row, 0);
            }
            grdContactAttempts.DataSource = dt;
            grdContactAttempts.DataBind();
        }
    }
    #endregion
    #region Fill Employee

    public void ShowEmployee()
    {
        try
        {
            DataTable dt = objNewJob.ShowEmployee();
            ddlRecentName.DataSource = dt;
            ddlRecentName.DataValueField = "User_Id";
            ddlRecentName.DataTextField = "Name";
            ddlRecentName.DataBind();
            //ddlRecentName.Items.Insert(0, new ListItem("", "0"));
            ddlRecentName.Items.Insert(0, new ListItem("Select Contact Person", "0"));
            ddlread.DataSource = dt;
            ddlread.DataValueField = "User_Id";
            ddlread.DataTextField = "Name";
            ddlread.DataBind();
            //ddlRecentName.Items.Insert(0, new ListItem("", "0"));
            ddlread.Items.Insert(0, new ListItem("Select Contact Person", "0"));
            //    Cache["ShowEmployee"] = dt;
            //}
            ////else
            //{
            //    ddlRecentName.DataSource = Cache["ShowEmployee"];
            //    ddlRecentName.DataValueField = "ID";
            //    ddlRecentName.DataTextField = "FullName";
            //    ddlRecentName.DataBind();
            //    ddlRecentName.Items.Insert(0, new ListItem("Select Contact Person", "0"));
            //}
        }
        catch (Exception ex)
        {
        }

    }
    #endregion

    protected void GrdViewSend_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            Label lbl__Dash = (Label)e.Row.FindControl("lbl__Dash");
            Label lbl_CustomerLastName = (Label)e.Row.FindControl("lbl_CustomerLastName");
            Label lbl_CustomerFirstName = (Label)e.Row.FindControl("lbl_CustomerFirstName");
            Label lbl_CustomerServiceAddress1 = (Label)e.Row.FindControl("lbl_CustomerServiceAddress1");
            Label lbl_CustomerServiceCity = (Label)e.Row.FindControl("lbl_CustomerServiceCity");
            Label lbl_StateName = (Label)e.Row.FindControl("lbl_StateName");
            Label lbl_CustomerServiceZipCode = (Label)e.Row.FindControl("lbl_CustomerServiceZipCode");
            if ((lbl_CustomerLastName.Text == null || lbl_CustomerLastName.Text == "") && (lbl_CustomerFirstName.Text == null || lbl_CustomerFirstName.Text == ""))
            {
                lbl_CustomerLastName.Visible =
                    lbl_CustomerFirstName.Visible =
                    lbl_CustomerServiceAddress1.Visible =
                    lbl_CustomerServiceCity.Visible =
                    lbl_StateName.Visible =
                    lbl_CustomerServiceZipCode.Visible = false;
                lbl__Dash.Visible = true;
            }
            Label lbl_Job_Number = (Label)e.Row.FindControl("lbl_Job_Number");
            Label lbl__dash_ = (Label)e.Row.FindControl("lbl__dash_");
            Image ImgIco = (Image)e.Row.FindControl("ImgIco");
            Label lblCCSi = (Label)e.Row.FindControl("lblCCSi");

            HiddenField hdnMessageCC = (HiddenField)e.Row.FindControl("hdnMessageCC");
            if (hdnMessageCC.Value == null || hdnMessageCC.Value == "")
            {
                lblCCSi.Visible = false;
            }

            ImgIco.ImageUrl = "images/SentIcon.png";
            if (lbl_Job_Number.Text == "0")
            {
                lbl__dash_.Visible = true;
                ImgIco.ImageUrl = "images/SentIcon_yellow.png";
                lbl_Job_Number.Visible = false;
            }
        }
    }
}
