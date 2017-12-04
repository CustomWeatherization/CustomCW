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

public partial class GenralMessage : System.Web.UI.Page
{
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    smUtil objSmUtil = new smUtil();
    dcMessage objdcMsg = new dcMessage();
    dcMessage objMessage = new dcMessage();
    public string StrRecName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ShowEmployee();
                ShowMessage();
            }
            ShowingCount();
        }
        catch
        {
        }
    }


    public void ShowingCount()
    {
        string strUid = objSmUtil.GetCookie("UId");
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
    #region Fill Employee

    public void ShowEmployee()
    {
        try
        {
            DataTable dt = objNewJob.ShowEmployee();
            lstEmployeeForSendSaveComments.DataSource = dt;
            lstEmployeeForSendSaveComments.DataValueField = "User_Id";
            lstEmployeeForSendSaveComments.DataTextField = "Name";
            lstEmployeeForSendSaveComments.DataBind();

            lstEmployeeForSendSaveCommentsCC.DataSource = dt;
            lstEmployeeForSendSaveCommentsCC.DataValueField = "User_Id";
            lstEmployeeForSendSaveCommentsCC.DataTextField = "Name";
            lstEmployeeForSendSaveCommentsCC.DataBind();

        }
        catch (Exception ex)
        {
        }

    }
    #endregion

    #region Send Message
    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessage.Visible = false;
            int msgId = 0;
            if (txtMessageReply.Text != "" && lstEmployeeForSendSaveComments.SelectedValue != "0")
            {
                msgId = objNewJob.InsertJobMessage(txtMessageReply.Text);
                string strUId = objSmUtil.GetCookie("UId");
                string MsgFrm = "From:- " + objSmUtil.GetCookie("UserName");
                string MsgTo = "";
                //DataTable dt = objdcMsg.ReplyMessageByRecever(Convert.ToInt32(Convert.ToInt32(Request.QueryString["MId"])));
                DataTable dt = objdcMsg.ReplyMessageByRecever(Convert.ToInt32(strUId));
                //Retrive 
                string s = "";
                foreach (ListItem li in lstEmployeeForSendSaveComments.Items)
                {
                    if (li.Selected)
                    {
                        s += li.Value + ",";
                        MsgTo += li.Text + ",";
                    }
                }

                MsgTo = "To:- " + MsgTo;
                MsgTo = MsgTo.TrimEnd(',');
                string s2 = "";
                string MsgCC = "";
                string MsgCCBody = "";


                foreach (ListItem li in lstEmployeeForSendSaveCommentsCC.Items)
                {
                    if (li.Selected)
                    {
                        s2 += li.Value + ",";
                        MsgCC += li.Text + ",";
                        MsgCCBody += li.Text + ",";
                    }
                }

                if (s2 != "")
                {
                    MsgCC = "Cc:- " + MsgCC;
                }
                MsgCC = MsgCC.TrimEnd(',');
                MsgCCBody = MsgCCBody.TrimEnd(',');

                string[] strAry = s.ToString().Split(',');
                string Emails = objNewJob.getEmailAddress(s);

                string CCs = objNewJob.getEmailAddress(s2);
                string[] CC = CCs.Split(',');
                string body = "";
                if (CC != null)
                {
                    body = MsgFrm + "\n" + MsgTo + "," + MsgCCBody + "\n" + txtMessageReply.Text;
                }
                else
                {
                    body = MsgFrm + "\n" + MsgTo + "\n" + txtMessageReply.Text;
                }

               // string body = MsgFrm + "\n" + MsgTo + "\n" + txtMessageReply.Text;
                for (int i = 0; i < strAry.Length - 1; i++)
                {
                    objNewJob.InsertJobMessageReadUnread1(Convert.ToInt32(strUId), Convert.ToInt32(strAry[i]), "0", msgId, "U", "", MsgFrm, MsgTo, MsgCC, strUId, s, s2);
                }

                string[] strAry1 = s2.ToString().Split(',');
                for (int i = 0; i < strAry1.Length - 1; i++)
                {
                    objNewJob.InsertJobMessageReadUnread1(Convert.ToInt32(strUId), Convert.ToInt32(strAry1[i]), "0", msgId, "U", "", MsgFrm, MsgTo, MsgCC, strUId, s, s2);
                }
                var textBoxText = body.Replace(Environment.NewLine, "<br/>");
                objNewJob.SendEmail("General Message" , textBoxText, Emails, CC);//This is SendEmailFunctionality
				
                ShowEmployee();
                ShowMessage();
                lblMessage.Text = "Message Sent Successfully.";
                lblMessage.Visible = true;
                txtMessageReply.Text = "";
                ShowingCount();
            }

        }
        catch (Exception ex)
        {


        }
    }
    #endregion

    #region Cancel
    protected void btnCancel_Click(object sender, EventArgs e)
    {

        txtMessageReply.Text = "";
        Response.Redirect("JobMessages.aspx");
    }
    #endregion

    #region Show Old MEssage
    public void ShowMessage()
    {
        try
        {
            int Id = Convert.ToInt32(objSmUtil.GetCookie("UId"));
            StrRecName = objSmUtil.GetCookie("UserName");
            DataTable dt = objdcMsg.ShowGenralMessageSendedTOUser(Id);
            grdPreviousComment.DataSource = dt;
            grdPreviousComment.DataBind();

        }
        catch (Exception ex)
        {


        }

    }
    #endregion
}
