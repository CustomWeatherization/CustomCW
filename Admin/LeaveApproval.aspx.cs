using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_LeaveApproval : System.Web.UI.Page
{
    smUtil objSm = new smUtil();
    Dc_Category objCat = new Dc_Category();
    int size = 0;
    static string Active = "P";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            string requestType = ddlRequestType.SelectedItem.Text;
            grdCategory.Columns[9].Visible = false;
            Active = "P";
            DataTable dt1 = new DataTable();
            string obj = objSm.GetCookie("UserId");

            FilDDlEmployee();
            if (Session["UserLogin"] == null)
            {
                grdPending();
               
            }
            else
            {
                if (Session["UserLogin"] != null)
                {
                    //DDL_Employee.SelectedValue =Session["UserLogin"].ToString();
                    DDL_Employee.Items.FindByValue(Session["UserLogin"].ToString()).Selected = true;
                }
                string emplyeeId = DDL_Employee.SelectedItem.Value.ToString();
              // ddlRequestType.SelectedItem.Text=Session["RequestType"].ToString();

              //  ddlRequestType.Items.FindByText(Session["RequestType"].ToString()).Selected = true;
                ddlRequestType.SelectedValue = ddlRequestType.Items.FindByText(Session["RequestType"].ToString()).Value;
                DataTable dt12 = new DataTable();
                if (emplyeeId == "All")
                {
                    dt12 = objCat.ViewVacationDetails(obj, "View_Pending", requestType);
                }
                else if (emplyeeId != "Select")
                {
                    dt12 = objCat.ViewSelectedEmployeeDetails(obj, Convert.ToInt32(emplyeeId), "User_Sel_Pending", ddlRequestType.Items.FindByText(Session["RequestType"].ToString()).Text);
                }
                grdCategory.DataSource = dt12;
                grdCategory.DataBind();
                grdCategory.Columns[9].Visible = false;
                grdCategory.Columns[10].Visible = false;
                grdCategory.Columns[11].Visible = false;
                Session["UserLogin"] = null;
                Session["RequestType"] = null;

            }
           
        }
        alertbox();
    }

    protected void BtnRejected_Click(object sender, EventArgs e)
    {
        Active = "R";
        btnPending.CssClass = btnPending.CssClass.Replace("paidBtn", "");
        btnPending.CssClass = btnPending.CssClass.Replace("paidBtnDis", "");
        btnPending.Attributes.Add("class", "paidBtnDis");



        btnApprove.CssClass = btnPending.CssClass.Replace("paidBtn", "");
        btnApprove.CssClass = btnPending.CssClass.Replace("paidBtnDis", "");
        btnApprove.Attributes.Add("class", "paidBtnDis");

        BtnRejected.CssClass = btnPending.CssClass.Replace("paidBtn", "");
        BtnRejected.CssClass = btnPending.CssClass.Replace("paidBtnDis", "");
        BtnRejected.Attributes.Add("class", "paidBtn");
        if (DDL_Employee.SelectedItem.Text != "Select")
        {
            grdRejected();
        }
        pnltotalHours.Visible = false;
        alertbox();
    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        Active = "A";
        btnPending.CssClass = btnPending.CssClass.Replace("paidBtn", "");
        btnPending.CssClass = btnPending.CssClass.Replace("paidBtnDis", "");
        btnPending.Attributes.Add("class", "paidBtnDis");

        BtnRejected.CssClass = btnPending.CssClass.Replace("paidBtn", "");
        BtnRejected.CssClass = btnPending.CssClass.Replace("paidBtnDis", "");
        BtnRejected.Attributes.Add("class", "paidBtnDis");

        btnApprove.CssClass = btnPending.CssClass.Replace("paidBtn", "");
        btnApprove.CssClass = btnPending.CssClass.Replace("paidBtnDis", "");
        btnApprove.Attributes.Add("class", "paidBtn");
        if (DDL_Employee.SelectedItem.Text != "Select")
        {
            grdApproved();
            pnltotalHours.Visible = true;
        }

        alertbox();
    }

    protected void btnPending_Click(object sender, EventArgs e)
    {
        Active = "P";
        btnPending.CssClass = btnPending.CssClass.Replace("paidBtn", "");
        btnPending.CssClass = btnPending.CssClass.Replace("paidBtnDis", "");
        btnPending.Attributes.Add("class", "paidBtn");

        BtnRejected.CssClass = btnPending.CssClass.Replace("paidBtn", "");
        BtnRejected.CssClass = btnPending.CssClass.Replace("paidBtnDis", "");
        BtnRejected.Attributes.Add("class", "paidBtnDis");

        btnApprove.CssClass = btnPending.CssClass.Replace("paidBtn", "");
        btnApprove.CssClass = btnPending.CssClass.Replace("paidBtnDis", "");
        btnApprove.Attributes.Add("class", "paidBtnDis");
        if (DDL_Employee.SelectedItem.Text != "Select")
        {
            grdPending();
        }
        pnltotalHours.Visible = false;
        alertbox();
    }

    public void grdPending()
    {
        string emplyeeId = DDL_Employee.SelectedItem.Value.ToString();
        string requestType = ddlRequestType.SelectedItem.Text;
        string obj = objSm.GetCookie("UserId");
        DataTable dt1 = new DataTable();
        if (emplyeeId == "All")
        {
            dt1 = objCat.ViewVacationDetails(obj, "View_Pending", requestType);
        }
        else if(emplyeeId != "Select")
        {
            dt1 = objCat.ViewSelectedEmployeeDetails(obj, Convert.ToInt32(emplyeeId), "User_Sel_Pending", requestType);
        }
        grdCategory.DataSource = dt1;
        grdCategory.DataBind();
        grdCategory.Columns[9].Visible = false;
        grdCategory.Columns[10].Visible = false;
        grdCategory.Columns[11].Visible = false;
    }

    public void grdApproved()
    {
        string requestType = ddlRequestType.SelectedItem.Text;
        string emplyeeId = DDL_Employee.SelectedItem.Value.ToString();
        string obj = objSm.GetCookie("UserId");
        DataTable dt1 = new DataTable();
        if (emplyeeId == "All")
        {
            dt1 = objCat.ViewVacationDetails(obj, "View_Approve", requestType);
        }
        else if (emplyeeId != "Select")
        {
            dt1 = objCat.ViewSelectedEmployeeDetails(obj, Convert.ToInt32(emplyeeId), "User_Sel_Approved", requestType);
        }

        
        grdCategory.DataSource = dt1;
        grdCategory.DataBind();
        double count = 0;
        for (int i = 0; i < dt1.Rows.Count; i++)
        {
            if (dt1.Rows[i]["TotalHours"] != "")
            {
                count = count + Convert.ToDouble(dt1.Rows[i]["TotalHours"].ToString());
            }
        }
        
            lbl_GrandTotal.Text = Convert.ToString(count)+" "+"Hr.";
            grdCategory.Columns[9].Visible = false;
            grdCategory.Columns[10].Visible = true;
            grdCategory.Columns[11].Visible = false;
    }

    public void grdRejected()
    {
        string requestType = ddlRequestType.SelectedItem.Text;
        string emplyeeId = DDL_Employee.SelectedItem.Value.ToString();
        string obj = objSm.GetCookie("UserId");
        DataTable dt1 = new DataTable();
        if (emplyeeId == "All")
        {
            dt1 = objCat.ViewVacationDetails(obj, "View_Reject", requestType);
        }
        else if (emplyeeId != "Select")
        {
            dt1 = objCat.ViewSelectedEmployeeDetails(obj, Convert.ToInt32(emplyeeId), "User_Sel_Rejected", requestType);
        }
        grdCategory.DataSource = dt1;
        grdCategory.DataBind();
        grdCategory.Columns[9].Visible = true;
        grdCategory.Columns[10].Visible = false;
        grdCategory.Columns[11].Visible = true;
    }
    protected void DDL_Employee_SelectedIndexChanged(object sender, EventArgs e)
    {
        string emplyeeId = DDL_Employee.SelectedItem.Value.ToString();
        string obj = objSm.GetCookie("UserId");
        DataTable dt1 = new DataTable();
      

        if (Active == "P")
        {
            grdPending();
        }
        else if (Active == "A")
        {
            grdApproved();
        }
        else if (Active == "R")
        {
            grdRejected();
        }
       
    }

    protected void ddlRequestType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string emplyeeId = DDL_Employee.SelectedItem.Value.ToString();
        string requestType = ddlRequestType.SelectedItem.Text;
        string obj = objSm.GetCookie("UserId");
        DataTable dt1 = new DataTable();


        if (Active == "P")
        {
            grdPending();
        }
        else if (Active == "A")
        {
            grdApproved();
        }
        else if (Active == "R")
        {
            grdRejected();
        }
        alertbox();
    }
    public void FilDDlEmployee()
    {
        string obj = objSm.GetCookie("UserId");
        dc_Admin objAdmin = new dc_Admin();
        DataTable dt = objAdmin.FillEmpLeaveDropDown(obj, 0);
        if (dt.Rows.Count > 0)
        {
            DDL_Employee.DataSource = dt;
            DDL_Employee.DataTextField = "Name";
            DDL_Employee.DataValueField = "ID";
            DDL_Employee.DataBind();
            DDL_Employee.Items.Insert(0, "All");
        }
        else
        {
            DDL_Employee.Items.Insert(0, "Select");
        }
    }

    public void alertbox()
    {
        foreach (GridViewRow gvr in grdCategory.Rows)
        {
            if (gvr.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl_status = (DropDownList)gvr.FindControl("ddl_status");
                ddl_status.Attributes["onChange"] = "handleChange(this)";
                ddl_status.Attributes["onFocus"] = "this.oldIndex = this.selectedIndex";
            }
        }
    }
    protected void ddl_status_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            dc_AddNewJob objNewJob = new dc_AddNewJob();
            smUtil objSm = new smUtil();
            string obj = objSm.GetCookie("UserId");
            GridViewRow row = (sender as DropDownList).NamingContainer as GridViewRow;
            int dataKey = Convert.ToInt32(this.grdCategory.DataKeys[row.RowIndex].Value.ToString());
            DropDownList ddl = sender as DropDownList;
            Label lblUserName = (Label)(grdCategory.Rows[row.RowIndex].Cells[0].FindControl("lbl_Login"));
            Label lblUserFullName = (Label)(grdCategory.Rows[row.RowIndex].Cells[0].FindControl("lblUserName"));
            Label TypeOfrequesttype = (Label)(grdCategory.Rows[row.RowIndex].Cells[0].FindControl("lblRequestType"));
            Label FromDate = (Label)(grdCategory.Rows[row.RowIndex].Cells[0].FindControl("lblFromDate"));
            Label Todate = (Label)(grdCategory.Rows[row.RowIndex].Cells[0].FindControl("lblToDate"));
            Label TotalHours = (Label)(grdCategory.Rows[row.RowIndex].Cells[0].FindControl("lblTotalHours"));

            string comment = "Hello," + lblUserFullName.Text + "<br/> Request type" + " " + TypeOfrequesttype.Text + " " + " From Date:" + FromDate.Text + " " + "To Date:" + Todate.Text + " " + "Total" + " " + TotalHours.Text + " " + "Hours has been Approved.";
            ViewState["UserName"] = lblUserName.Text;
            if (ddl.SelectedItem.Value == "Reject")
            {
                ModalPopupExtender2.Show();
                pnlRejectComment.Visible = true;
                ViewState["ID"] = dataKey;
            }
            else
            {
                if (ddl.SelectedItem.Value == "Select Status")
                {
                    Response.Write("<script>alert('Please select status.')</script>");
                }
                else
                {
                    ViewState["ID"] = dataKey;
                    bool msg = false;


                    if (ddl.SelectedItem.Value == "Approve")
                    {
                        if (TypeOfrequesttype.Text == "Vacation")
                        {
                            comment = "Hello," + lblUserFullName.Text + "<br/> We are happy to approve your request for vacation leave. You deserve a good break. Rest up and have a lot of fun. We look forward to the renewed energy you will bring back.";
                        }
                        else if (TypeOfrequesttype.Text == "Sickness")
                        {
                            comment = "Hello," + lblUserFullName.Text + "<br/> We are sorry to hear that you’re not feeling well, but you will be happy to know we have approved your sick leave. Get Well Soon!";
                        }
                        else if (TypeOfrequesttype.Text == "Unpaid Sickness")
                        {
                            comment = "Hello," + lblUserFullName.Text + "<br/> We are sorry to hear that you’re not feeling well, but you will be happy to know we have approved your unpaid sick leave. Get Well Soon!";
                        }
                        else if (TypeOfrequesttype.Text == "Unpaid")
                        {
                            comment = "Hello," + lblUserFullName.Text + "<br/>  Your unpaid leave has been successfully approved.";
                        }
                        else if (TypeOfrequesttype.Text == "Emergency Paid Time Off")
                        {
                            comment = "Hello," + lblUserFullName.Text + "<br/>  We understand emergencies come up, so we are approving your paid time off. We hope this time off helps you handle the situation. See you when you return.";
                        }
                        else if (TypeOfrequesttype.Text == "Emergency Time Off")
                        {
                            comment = "Hello," + lblUserFullName.Text + "<br/>  We understand emergencies come up, so we are approving your time off. We hope this time off helps you handle the situation. See you when you when you return.";
                        }
                        msg = objCat.DDLStatusApproval(dataKey, ddl.SelectedValue.ToString(), "", DateTime.Now.ToString(), "");
                        int msgId = 0;
                        DataSet ds2 = new DataSet();
                        ds2 = GetData("select U1.ID as Recipient,U2.ID as Sender,UR.Email as Email,U1.CWLogin as ReceipientName,U2.CWLogin as SenderName from User_registration UR inner join Users U1 on U1.CWLogin=UR.Login inner join Users U2 on U2.CWLogin=UR.Manager where UR.Manager='" + obj + "' and UR.Login='" + lblUserName.Text + "'");
                        msgId = objNewJob.InsertJobMessage(comment);
                        objNewJob.InsertJobMessageReadUnread2(Convert.ToInt32(ds2.Tables[0].Rows[0]["Sender"]), Convert.ToInt32(ds2.Tables[0].Rows[0]["Recipient"]), "0", msgId, "U", null, null, null, null, null, null, null, "R", ddlRequestType.SelectedItem.Value);
                        if (!DBNull.Value.Equals(ds2.Tables[0].Rows[0]["Email"]))
                        {
                            string body = "From:" + obj + "\n" + "To:" + ds2.Tables[0].Rows[0]["ReceipientName"].ToString() + "\n" + comment;
                            var textBoxText = body.Replace(Environment.NewLine, "<br/>");
                            objNewJob.SendEmail(TypeOfrequesttype.Text, textBoxText, ds2.Tables[0].Rows[0]["Email"].ToString(), null);
                        }
                    }
                    else
                    {
                        msg = objCat.DDLStatusApproval(dataKey, ddl.SelectedValue.ToString(), "", "", "");
                    }
                    if (msg == true)
                    {

                        if (Active == "P")
                        {
                            grdPending();

                        }
                        else if (Active == "A")
                        {
                            grdApproved();

                        }
                        else if (Active == "R")
                        {
                            grdRejected();

                        }

                        Response.Write("<script>alert('Update Successfully.')</script>");
                    }
                    else
                        Response.Write("<script>alert('Failed')</script>");
                }
            }

            alertbox();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
     }
    

    protected void grdCategory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HiddenField lblId = (HiddenField)e.Row.FindControl("hdnEmployeeId");

                Label lblFromTime = (Label)e.Row.FindControl("lblFromTime");
                Label lblToTime = (Label)e.Row.FindControl("lblToTime");
                Label Comments = (Label)e.Row.FindControl("lblComments");
                Label RejectComments = (Label)e.Row.FindControl("lblRejectComments");
                DropDownList ddlstatus = (e.Row.FindControl("ddl_status") as DropDownList);
                DataSet ds = new DataSet();
                ds = GetData("select Status,ID from  EmployeeLeave where ID=" + lblId.Value);
                if (ddlstatus.SelectedValue != Convert.ToString(ds.Tables[0].Rows[0]["Status"]))
                {
                    ddlstatus.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["Status"]);

                }
                else
                {
                    ddlstatus.SelectedValue = "Select Status";
                }
                if (lblFromTime.Text.Trim() == "" || lblFromTime.Text.Trim() == "Select Time")
                {
                    lblFromTime.Text = "-";
                }
                if (lblToTime.Text == "" || lblToTime.Text == "Select Time")
                {
                    lblToTime.Text = "-";
                }
                if (Comments.Text == "")
                {
                    Comments.Text = "-";
                }
                if (RejectComments.Text == "")
                {
                    RejectComments.Text = "-";
                }


            }
            alertbox();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
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
    protected void grdCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCategory.PageIndex = e.NewPageIndex;
        if (Active == "P")
        {
            grdPending();
           
        }
        else if (Active == "A")
        {
            grdApproved();
          
        }
        else if (Active == "R")
        {
            grdRejected();
           
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text != "ALL")
        {
            grdCategory.AllowPaging = true;
            size = int.Parse(DropDownList1.SelectedItem.Value.ToString());
            grdCategory.PageSize = size;
           // ViewAllApprovalDetails();
        }
        else
        {
            grdCategory.AllowPaging = false;
          //  ViewAllApprovalDetails();
        }

        if (Active == "P")
        {
            grdPending();

        }
        else if (Active == "A")
        {
            grdApproved();

        }
        else if (Active == "R")
        {
            grdRejected();

        }
        alertbox();
    }

    public void btnPanelShowOff_Click1(object sender, EventArgs e)
    {
        // ModalPopupExtender1.Show();
    }
    public void btn_cancel_Click(object sender, EventArgs e)
    {
        ModalPopupExtender2.Hide();
        txtComment.Text = ""; ;
        if (Active == "P")
        {
            grdPending();

        }
        else if (Active == "A")
        {
            grdApproved();

        }
        else if (Active == "R")
        {
            grdRejected();

        }
        alertbox();
    }

    public void btnComment_Click(object sender, EventArgs e)
    {
        try
        {
            dc_AddNewJob objNewJob = new dc_AddNewJob();
            smUtil objSm = new smUtil();
            if (txtComment.Text != "")
            {
                if (ViewState["ID"] != "")
                {

                    string viewid = ViewState["ID"].ToString();

                    bool msg = objCat.DDLStatusApproval(Convert.ToInt32(ViewState["ID"].ToString()), "Reject", txtComment.Text, "", DateTime.Now.ToString());
                    if (msg == true)
                    {
                        if (Active == "P")
                        {
                            grdPending();

                        }
                        else if (Active == "A")
                        {
                            grdApproved();

                        }
                        else if (Active == "R")
                        {
                            grdRejected();

                        }
                        string obj = objSm.GetCookie("UserId");
                        int msgId = 0;
                        if (ViewState["UserName"] != "")
                        {
                            DataSet ds2 = new DataSet();
                            ds2 = GetData("select U1.ID as Recipient,U2.ID as Sender,UR.Email as Email,U1.CWLogin as ReceipientName,U2.CWLogin as SenderName from User_registration UR inner join Users U1 on U1.CWLogin=UR.Login inner join Users U2 on U2.CWLogin=UR.Manager where UR.Manager='" + obj + "' and UR.Login='" + ViewState["UserName"].ToString() + "'");
                            msgId = objNewJob.InsertJobMessage(txtComment.Text);
                            objNewJob.InsertJobMessageReadUnread2(Convert.ToInt32(ds2.Tables[0].Rows[0]["Sender"]), Convert.ToInt32(ds2.Tables[0].Rows[0]["Recipient"]), "0", msgId, "U", null, null, null, null, null, null, null, "R", ddlRequestType.SelectedItem.Value);
                            if (!DBNull.Value.Equals(ds2.Tables[0].Rows[0]["Email"]))
                            {
                               
                                string body = "From:" + obj + "\n" + "To:" + ds2.Tables[0].Rows[0]["ReceipientName"].ToString() + "\n" + txtComment.Text;
                                var textBoxText = body.Replace(Environment.NewLine, "<br/>");
                                objNewJob.SendEmail("Reject Time Off Request", textBoxText, ds2.Tables[0].Rows[0]["Email"].ToString(), null);
                            }
                        }
                        txtComment.Text = "";
                        Response.Write("<script>alert('Update Successfully.')</script>");
                        alertbox();
                    }
                    else
                        Response.Write("<script>alert('Failed')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please enter comment..!')</script>");
                ModalPopupExtender2.Show();

            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }
}
