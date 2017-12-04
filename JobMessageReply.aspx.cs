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

public partial class JobMessageReply : System.Web.UI.Page
{
    smUtil objSmUtil = new smUtil();
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    dcMessage objdcMsg = new dcMessage();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            updateMsg();
            if (Request.QueryString["View"] == "ViewAll")
            {
                lstEmployeeForSendSaveCommentsCC.Visible = tdCC.Visible = true;
            }
            ShowContactPerson();
            if (Request.QueryString["MId"] != null && Request.QueryString["UId"] != null)
            {
                if (Request.QueryString["MId"] != "" && Request.QueryString["UId"] != "")
                {
                    DataTable dt = objdcMsg.ReplyMessageByRecever(Convert.ToInt32(Convert.ToInt32(Request.QueryString["MId"])));
                    if (dt.Rows.Count > 0)
                    {
                        hdnFrom.Value = dt.Rows[0]["MessageFromID"].ToString();
                        hdnTo.Value = dt.Rows[0]["MessageToID"].ToString();
                        hdnCC.Value = dt.Rows[0]["MessageCCID"].ToString();

                        string allIdsCC = hdnTo.Value + hdnCC.Value;
                        string[] SpltAllID = allIdsCC.Split(',');
                        for (int i = 0; i < SpltAllID.Length - 1; i++)
                        {

                            lstEmployeeForSendSaveCommentsCC.SelectionMode = ListSelectionMode.Multiple;
                            if (Convert.ToString(SpltAllID[i]) == Convert.ToString(Request.QueryString["UId"]))
                            {
                                SpltAllID[i] = "";
                            }
                            else
                            {
                                foreach (ListItem item in lstEmployeeForSendSaveCommentsCC.Items)
                                {
                                    if (item.Value == Convert.ToString(SpltAllID[i]))
                                    {
                                        item.Selected = true;
                                        break;
                                    }
                                }
                            }
                        }
                        lstEmployeeForSendSaveComments.SelectedValue = dt.Rows[0]["SenderUserID"].ToString();
                        lblOldMessage.Text = dt.Rows[0]["TextMessage"].ToString();
                    }
                    objdcMsg.Update_Unread_To_Read_Message(Convert.ToInt32(Convert.ToInt32(Request.QueryString["MId"])));
                }
            }
        }
    }
    #region Fill Contact Person


    public void updateMsg()
    {
        string MID = Convert.ToString(Request.QueryString["ID"]);
        string JobNum = Convert.ToString(Request.QueryString["Jobs"]);
        DataTable dt = objdcMsg.messageReadUnreadConvert1(Convert.ToInt32(MID), JobNum);
    }

    public void ShowContactPerson()
    {
        try
        {
            DataTable dt = objNewJob.ShowContactPerson();
            lstEmployeeForSendSaveComments.DataSource = dt;
            lstEmployeeForSendSaveComments.DataValueField = "ID";
            lstEmployeeForSendSaveComments.DataTextField = "ContactPerson";
            lstEmployeeForSendSaveComments.DataBind();

            lstEmployeeForSendSaveCommentsCC.DataSource = dt;
            lstEmployeeForSendSaveCommentsCC.DataValueField = "ID";
            lstEmployeeForSendSaveCommentsCC.DataTextField = "ContactPerson";
            lstEmployeeForSendSaveCommentsCC.DataBind();
        }
        catch (Exception ex)
        {
        }

    }
    #endregion

    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessage.Visible = false;
            int msgId = 0;
            if (txtReplyText.Text != "" && lstEmployeeForSendSaveComments.SelectedValue != "0")
            {
                msgId = objNewJob.InsertJobMessage(txtReplyText.Text);
                //msgId = 834;
                DataTable dt = objdcMsg.ReplyMessageByRecever(Convert.ToInt32(Convert.ToInt32(Request.QueryString["MId"])));
                string updateMessage = "update jobsmessages set MessageReadOrUnRead='R' where id=" + Convert.ToString(Request.QueryString["MId"]);
                SqlCommand cmd = new SqlCommand();
                try
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = updateMessage;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                catch (Exception ex)
                {
                }
                string strUId = objSmUtil.GetCookie("UID");
                string strUId_ = objSmUtil.GetCookie("UserId");
                string MsgFrm = "From:- " + objSmUtil.GetCookie("UserName");

                string strJobNumber = Request.QueryString["Jobs"].ToString();
                objNewJob.InsertJobComments(strJobNumber, txtReplyText.Text, "", strUId_.ToString());
                string s = "";
                string MsgTo = "";
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
                if (Request.QueryString["View"] == "ViewAll")
                {
                    foreach (ListItem li in lstEmployeeForSendSaveCommentsCC.Items)
                    {
                        if (li.Selected)
                        {
                            s2 += li.Value + ",";
                            MsgCC += li.Text + ",";
                        }
                    }
                    if (s2 != "")
                    {
                        MsgCC = "Cc:- " + MsgCC;
                    }
                    MsgCC = MsgCC.TrimEnd(',');
                }
                string[] strAry = s.ToString().Split(',');
                for (int i = 0; i < strAry.Length - 1; i++)
                {
                    objNewJob.InsertJobMessageReadUnread1(Convert.ToInt32(dt.Rows[0]["RecipientUserID"]), Convert.ToInt32(strAry[i]), Request.QueryString["Jobs"].ToString(), msgId, "U", s, MsgFrm, MsgTo, MsgCC, strUId, s, s2);
                }


                if (Request.QueryString["View"] == "ViewAll")
                {
                    string[] strAry1 = s2.ToString().Split(',');
                    for (int i = 0; i < strAry1.Length - 1; i++)
                    {
                        objNewJob.InsertJobMessageReadUnread1(Convert.ToInt32(dt.Rows[0]["RecipientUserID"]), Convert.ToInt32(strAry1[i]), Request.QueryString["Jobs"].ToString(), msgId, "U", s2, MsgFrm, MsgTo, MsgCC, strUId, s, s2);
                    }
                }
            }
            ShowContactPerson();
            txtReplyText.Text = "";
            lblMessage.Text = "Message Sent Successfully";
            lblMessage.Visible = true;
            Response.Write("<script>var str = confirm('Message Sent Successfully');if(str == true){window.close();}else{}</script>");
        }
        catch (Exception ex)
        {


        }

    }

}
