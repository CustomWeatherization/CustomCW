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

public partial class Admin_OldpaidPaymentSubmit : System.Web.UI.Page
{
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    smUtil objSmUtil = new smUtil();
    DataSet ds = new DataSet();
    dc_Admin objAdmin = new dc_Admin();
    public string role = "";
    static string GT = "0.00";
    static string Active = "A";
    int size = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Active = "A";
            grdSubmitPayment.Columns[5].Visible = false;
            role = "";
            role = objSmUtil.GetCookie("Rol_Id");
            if (role == "Usr_Adm")
            {
                grdSubmitPayment.Columns[0].Visible = false;
                grdSubmitPayment.Columns[1].Visible = false;
                grdSubmitPayment.Columns[2].Visible = false;
                grdSubmitPayment.Columns[3].Visible = false;
                grdSubmitPayment.Columns[4].Visible = false;
                grdSubmitPayment.Columns[5].Visible = false;
                grdSubmitPayment.Columns[6].Visible = false;
                grdSubmitPayment.Columns[7].Visible = false;
                grdSubmitPayment.Columns[8].Visible = false;
                grdSubmitPayment.Columns[9].Visible = false;
                grdSubmitPayment.Columns[10].Visible = false;
                grdSubmitPayment.Columns[11].Visible = false;
                grdSubmitPayment.Columns[12].Visible = false;
                grdSubmitPayment.Columns[13].Visible = false;
                grdSubmitPayment.Columns[14].Visible = false;
            }
            GT = "0.00";
            ShowAllPayment();
            FilDDlEmployee();
        }
    }
    protected void grdSubmitPayment_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdSubmitPayment.PageIndex = e.NewPageIndex;
        //ShowAllPayment();
        if (Active == "D")
        {
            grdPaid();
            try
            {
                grdSubmitPayment.HeaderRow.Cells[0].Text = "Paid";
            }
            catch (Exception)
            {

            }

        }
        else if (Active == "A")
        {
            grdNotPaid();
            try
            {
                grdSubmitPayment.HeaderRow.Cells[0].Text = "Select";
            }
            catch (Exception)
            {
            }

        }
        //grdPaid();
    }
    protected void grdSubmitPayment_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int DeleteId = Convert.ToInt32(grdSubmitPayment.DataKeys[e.RowIndex].Value.ToString());
        lbl_HdnId.Text = Convert.ToString(DeleteId);
    }
    public void FilDDlEmployee()
    {
        DataTable dt = objAdmin.FillEmpDrowpDownOldPaid("");
        if (dt.Rows.Count > 0)
        {
            DDL_Employee.DataSource = dt;
            DDL_Employee.DataTextField = "ClientName";
            DDL_Employee.DataValueField = "ClientName";
            DDL_Employee.DataBind();
            DDL_Employee.Items.Insert(0, "All");
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text != "ALL")
        {
            GT = "0.00";
            grdSubmitPayment.AllowPaging = true;
            size = int.Parse(DropDownList1.SelectedItem.Value.ToString());
            grdSubmitPayment.PageSize = size;
            if (Active == "D")
            {
                grdPaid();
                try
                {
                    grdSubmitPayment.HeaderRow.Cells[0].Text = "Paid";
                }
                catch (Exception)
                {
                }

            }
            else if (Active == "A")
            {
                grdNotPaid();
                try
                {
                    grdSubmitPayment.HeaderRow.Cells[0].Text = "Select";
                }
                catch (Exception)
                {
                }

            }
            else
            {
                ShowAllPayment();
            }
        }
        else
        {
            GT = "0.00";
            grdSubmitPayment.AllowPaging = false;
            if (Active == "D")
            {
                grdPaid();
                try
                {
                    grdSubmitPayment.HeaderRow.Cells[0].Text = "Paid";
                }
                catch (Exception)
                {
                }

            }
            else if (Active == "A")
            {
                grdNotPaid();
                try
                {
                    grdSubmitPayment.HeaderRow.Cells[0].Text = "Select";
                }
                catch (Exception)
                {
                }
            }
            else
            {
                ShowAllPayment();
            }
        }
    }

    protected void grdSubmitPayment_DataBound1(object sender, EventArgs e)
    {
        if (Active == "D")
        {
            role = objSmUtil.GetCookie("Rol_Id");
            if (role == "Usr_Adm")
            {
                gridColumnHide();
            }
            else
            {
                grdSubmitPayment.Columns[4].Visible = true;
                grdSubmitPayment.Columns[5].Visible = true;
                grdSubmitPayment.Columns[6].Visible = true;
            }
        }
        else if (Active == "A")
        {
            role = objSmUtil.GetCookie("Rol_Id");
            if (role == "Usr_Adm")
            {
                gridColumnHide();
            }
            else
            {
                grdSubmitPayment.Columns[4].Visible = true;
                grdSubmitPayment.Columns[5].Visible = false;
                grdSubmitPayment.Columns[6].Visible = false;
            }
        }
    }

    public void gridColumnHide()
    {
        role = objSmUtil.GetCookie("Rol_Id");
        if (role == "Usr_Adm")
        {
            DivGrndTotal.Visible = false;
            grdSubmitPayment.Columns[0].Visible = true;
            grdSubmitPayment.Columns[1].Visible = true;
            grdSubmitPayment.Columns[2].Visible = true;
            grdSubmitPayment.Columns[3].Visible = true;
            grdSubmitPayment.Columns[4].Visible = true;
            if (Active == "D")
            {
                grdSubmitPayment.Columns[5].Visible = true;
            }
            else
            {
                grdSubmitPayment.Columns[5].Visible = false;
            }
            grdSubmitPayment.Columns[7].Visible = true;
            grdSubmitPayment.Columns[14].Visible = true;
        }
    }

    public void ShowAllPayment()
    {
        ds = objAdmin.ShowAllPaymentsOldPaid();
        grdSubmitPayment.DataSource = ds;
        grdSubmitPayment.DataBind();
    }

    protected void grdSubmitPayment_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataRowView drview = e.Row.DataItem as DataRowView;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbl_D_JobNum = (Label)e.Row.FindControl("lbl_D_JobNum");

            Label lbl_G_InvoiceAmt = (Label)e.Row.FindControl("lbl_G_InvoiceAmt");
            Label lbl_D_InvoiceAmt = (Label)e.Row.FindControl("lbl_D_InvoiceAmt");
            Label lbl_G_Blank1 = (Label)e.Row.FindControl("lbl_G_Blank1");

            if (lbl_G_InvoiceAmt.Text == "" || lbl_G_InvoiceAmt.Text == null || lbl_G_InvoiceAmt.Text == "0.00")
            {
                lbl_G_InvoiceAmt.Visible = lbl_D_InvoiceAmt.Visible = false;
                lbl_G_Blank1.Visible = true;
            }


            Label lbl_G_Percentage = (Label)e.Row.FindControl("lbl_G_Percentage");
            Label lbl_D_Percentage = (Label)e.Row.FindControl("lbl_D_Percentage");
            Label lbl_G_Blank2 = (Label)e.Row.FindControl("lbl_G_Blank2");
            if (lbl_G_Percentage.Text == "" || lbl_G_Percentage.Text == null || lbl_G_Percentage.Text == "0.00")
            {
                lbl_G_Percentage.Visible = lbl_D_Percentage.Visible = false;
                lbl_G_Blank2.Visible = true;
            }


            Label lbl_G_AuditRate = (Label)e.Row.FindControl("lbl_G_AuditRate");
            Label lbl_D_AuditRate = (Label)e.Row.FindControl("lbl_D_AuditRate");
            Label lbl_G_Blank3 = (Label)e.Row.FindControl("lbl_G_Blank3");
            if (lbl_G_AuditRate.Text == "" || lbl_G_AuditRate.Text == null || lbl_G_AuditRate.Text == "0.00" || lbl_G_AuditRate.Text == " 0.00")
            {
                lbl_G_AuditRate.Visible = lbl_D_AuditRate.Visible = false;
                lbl_G_Blank3.Visible = true;
            }

            Label lbl_G_GrandTotal = (Label)e.Row.FindControl("lbl_G_GrandTotal");
            Label lbl_D_GrandTotal = (Label)e.Row.FindControl("lbl_D_GrandTotal");
            Label lbl_G_Blank4 = (Label)e.Row.FindControl("lbl_G_Blank4");
            if (lbl_G_GrandTotal.Text == "" || lbl_G_GrandTotal.Text == null)
            {
                lbl_G_GrandTotal.Visible = lbl_D_GrandTotal.Visible = false;
                lbl_G_Blank4.Visible = true;
            }

            //dstv197 53733


            Label lbl_G_Audit = (Label)e.Row.FindControl("lbl_G_Audit");
            Label lbl_G_Invoice = (Label)e.Row.FindControl("lbl_G_Invoice");
            if (lbl_G_Blank2.Visible == true)
            {
                lbl_G_Invoice.Visible = false;
                lbl_G_Audit.Visible = true;
            }
            else if (lbl_G_Blank3.Visible == true)
            {
                lbl_G_Audit.Visible = false;
                lbl_G_Invoice.Visible = true;
            }

            Label lbl_E_Measures = (Label)e.Row.FindControl("lbl_E_Measures");
            Label lbl_G_ExtraMeasures = (Label)e.Row.FindControl("lbl_G_ExtraMeasures");
            Label lbl_G_Blank5 = (Label)e.Row.FindControl("lbl_G_Blank5");
            if (lbl_G_ExtraMeasures.Text == "" || lbl_G_ExtraMeasures.Text == null || lbl_G_ExtraMeasures.Text == "0.00")
            {
                lbl_G_ExtraMeasures.Visible = lbl_E_Measures.Visible = false;
                lbl_G_Blank5.Visible = true;
            }


            Label lbl_D_MetedRate = (Label)e.Row.FindControl("lbl_D_MetedRate");
            Label lbl_G_MetedRate = (Label)e.Row.FindControl("lbl_G_MetedRate");
            Label lbl_G_BlankMetedRate = (Label)e.Row.FindControl("lbl_G_BlankMetedRate");
            if (lbl_G_MetedRate.Text == "" || lbl_G_MetedRate.Text == null || lbl_G_MetedRate.Text == "0.00")
            {
                lbl_G_MetedRate.Visible = lbl_D_MetedRate.Visible = false;
                lbl_G_BlankMetedRate.Visible = true;
            }
            else
            {
                lbl_G_Invoice.Visible = lbl_D_Percentage.Visible = lbl_G_Percentage.Visible = false;
                lbl_G_Blank2.Visible = lbl_G_Audit.Visible = true;
            }

            Label lbl_D_SD = (Label)e.Row.FindControl("lbl_D_SD");
            Label LBL_SD_Blank = (Label)e.Row.FindControl("LBL_SD_Blank");

            Label LBL_DAP_Blank = (Label)e.Row.FindControl("LBL_DAP_Blank");
            Label lbl_D_DAP = (Label)e.Row.FindControl("lbl_D_DAP");

            Label LBL_ROD_Blank = (Label)e.Row.FindControl("LBL_ROD_Blank");
            Label lbl_D_ROD = (Label)e.Row.FindControl("lbl_D_ROD");

            if (lbl_D_SD.Text == "1/1/1900")
            {
                LBL_SD_Blank.Visible = true;
                lbl_D_SD.Visible = false;
            }
            else
            {
                LBL_SD_Blank.Visible = false;
                lbl_D_SD.Visible = true;
            }

            if (lbl_D_DAP.Text == "1/1/1900")
            {
                LBL_DAP_Blank.Visible = true;
                lbl_D_DAP.Visible = false;
            }
            else
            {
                LBL_DAP_Blank.Visible = false;
                lbl_D_DAP.Visible = true;
            }


            if (lbl_D_ROD.Text == "1/1/1900" || lbl_D_ROD.Text == "")
            {
                LBL_ROD_Blank.Visible = true;
                lbl_D_ROD.Visible = false;
            }
            else
            {
                LBL_ROD_Blank.Visible = false;
                lbl_D_ROD.Visible = true;
            }


            LinkButton Audi = (LinkButton)e.Row.FindControl("Audi");
            if (Audi.ValidationGroup == "0")
            {
                lbl_G_Percentage.Visible = lbl_G_Invoice.Visible = lbl_D_Percentage.Visible = false;
                lbl_G_Blank2.Visible = true;
                lbl_G_Audit.Visible = true;
            }
            else
            {
                lbl_G_Invoice.Visible = lbl_G_Percentage.Visible = lbl_D_Percentage.Visible = true;
                lbl_G_Blank2.Visible = false;
                lbl_G_Audit.Visible = false;
            }
            LinkButton Inv = (LinkButton)e.Row.FindControl("Inv");
            if (lbl_G_Audit.Visible == true)
            {
                Audi.Visible = true;
                string jobNum = lbl_D_JobNum.Text;
                int Utility = Convert.ToInt32(Audi.CommandArgument);
                int InNo = Convert.ToInt32(Audi.ValidationGroup);
                if (Utility == 1)
                {
                    Audi.PostBackUrl = "../METED/METED_Audit_Page1.aspx?InvoiceNo=" + InNo + "&Jobs=" + jobNum + "&Utility=" + Utility + "";
                }
                else if (Utility == 2)
                {
                    Audi.PostBackUrl = "../PPLAudit/PPL_Audit_1.aspx?InvoiceNo=" + InNo + "&Jobs=" + jobNum + "&Utility=" + Utility + "";
                }
            }
            else if (lbl_G_Invoice.Visible == true)
            {
                Inv.Visible = true;
                string jobNum = lbl_D_JobNum.Text;
                int Utility = Convert.ToInt32(Inv.CommandArgument);
                int InNo = Convert.ToInt32(Inv.ValidationGroup);
                Inv.PostBackUrl = "../Invoice_Crystal.aspx?Back=dj&Jobs=" + jobNum + "&Utility=" + Utility + "&InvoiceNo=" + InNo + "";
            }
        }
    }



    protected void btn_RjctCancel_Click(object sender, EventArgs e)
    {
        if (Active == "D")
        {
            grdPaid();
        }
        else if (Active == "A")
        {
            grdNotPaid();
        }
    }


    protected void btn_reject_Click(object sender, EventArgs e)
    {
        if (Active == "A")
        {
            foreach (GridViewRow row in grdSubmitPayment.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                    if (chkRow.Checked)
                    {
                        int msgId = 0;
                        string str = chkRow.ValidationGroup;
                        Label lbl_D_JobNum = (row.Cells[0].FindControl("lbl_D_JobNum") as Label);
                        Label lbl_D_Submitted = (row.Cells[0].FindControl("lbl_D_Submitted") as Label);
                        string submitName = lbl_D_Submitted.Text;
                        string[] submit_Name = submitName.Split(' ');
                        int ID = objNewJob.getIDSubmitName(Convert.ToString(submit_Name[0]), Convert.ToString(submit_Name[1]));
                        string objUserName = objSmUtil.GetCookie("UserId");
                        objNewJob.InsertJobComments(lbl_D_JobNum.Text, txt_Comment.Text, "", objUserName.ToString());
                        string strUId = objSmUtil.GetCookie("UId");
                        msgId = objNewJob.InsertJobMessage(txt_Comment.Text);
                        objNewJob.InsertJobMessageReadUnread(Convert.ToInt32(strUId), Convert.ToInt32(ID), lbl_D_JobNum.Text, msgId, "U");
                        objAdmin.DeletePayment(str);
                        grdNotPaid();
                    }
                }
            }
        }
        else if (Active == "D")
        {
            foreach (GridViewRow row in grdSubmitPayment.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                    if (Convert.ToString(chkRow.ValidationGroup) == lbl_HdnId.Text)
                    {
                        int msgId = 0;
                        string str = lbl_HdnId.Text;
                        Label lbl_D_JobNum = (row.Cells[0].FindControl("lbl_D_JobNum") as Label);
                        Label lbl_D_Submitted = (row.Cells[0].FindControl("lbl_D_Submitted") as Label);
                        string submitName = lbl_D_Submitted.Text;
                        string[] submit_Name = submitName.Split(' ');
                        int ID = objNewJob.getIDSubmitName(Convert.ToString(submit_Name[0]), Convert.ToString(submit_Name[1]));
                        string objUserName = objSmUtil.GetCookie("UserId");
                        objNewJob.InsertJobComments(lbl_D_JobNum.Text, txt_Comment.Text, "", objUserName.ToString());
                        string strUId = objSmUtil.GetCookie("UId");
                        msgId = objNewJob.InsertJobMessage(txt_Comment.Text);
                        objNewJob.InsertJobMessageReadUnread(Convert.ToInt32(strUId), Convert.ToInt32(ID), lbl_D_JobNum.Text, msgId, "U");
                        objAdmin.UpdateReOpenInvoice(Convert.ToInt32(str));
                        grdPaid();
                    }
                }
            }
        }
    }



    protected void btn_Paid_Click(object sender, EventArgs e)
    {
        GT = "0.00";
        foreach (GridViewRow row in grdSubmitPayment.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                if (chkRow.Checked)
                {
                    string str = chkRow.ValidationGroup;
                    objAdmin.updatePaymentStatus(str);
                }
            }
        }
        Response.Redirect("PaymentSubmit.aspx");
    }

    protected void DDL_Employee_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Active == "D")
        {
            grdPaid();
            try
            {
                grdSubmitPayment.HeaderRow.Cells[0].Text = "Paid";
            }
            catch (Exception)
            {
            }

        }
        else if (Active == "A")
        {
            grdNotPaid();
            try
            {
                grdSubmitPayment.HeaderRow.Cells[0].Text = "Select";
            }
            catch (Exception)
            {
            }

        }
    }


    public void grdNotPaid()
    {
        GT = "0.00";
        string empName = Convert.ToString(DDL_Employee.SelectedItem.Text);

        DataTable dt = objAdmin.FillEmpNotPaidDrowpDownOldPaid(empName);
        if (dt.Rows.Count == 0)
        {
            lbl_GrandTotal.Text = "$ 0.00";
        }
        grdSubmitPayment.DataSource = dt;
        grdSubmitPayment.DataBind();
        btn_Paid.Visible = true;
        foreach (GridViewRow row in grdSubmitPayment.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkReject = (row.Cells[0].FindControl("lnkReject") as LinkButton);
                lnkReject.Visible = false;
            }
        }
    }


    public void grdPaid()
    {
        GT = "0.00";
        string empName = Convert.ToString(DDL_Employee.SelectedItem.Text);

        DataTable dt = objAdmin.FillEmpDrowpDownOldPaid(empName);
        if (dt.Rows.Count == 0)
        {
            lbl_GrandTotal.Text = "$ 0.00";
        }
        grdSubmitPayment.DataSource = dt;
        grdSubmitPayment.DataBind();
        btn_Paid.Visible = false;
        foreach (GridViewRow row in grdSubmitPayment.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);

                chkRow.Checked = true; chkRow.Enabled = false;
            }
        }
    }

    public string addGrandTotal(object GrandTotal)
    {
        string tempStrAmt = Convert.ToString(GrandTotal);
        if (tempStrAmt == "" || tempStrAmt == null)
        {
            tempStrAmt = "0.00";
        }
        decimal tempTotal = Convert.ToDecimal(tempStrAmt);
        decimal tempGTotal = Convert.ToDecimal(GT);
        tempGTotal = tempGTotal + tempTotal;
        GT = Convert.ToString(tempGTotal);
        decimal moneyvalue = Convert.ToDecimal(GT);
        string html = String.Format("{0:C}", moneyvalue);
        lbl_GrandTotal.Text = html;
        //string str = Convert.ToDouble(GrandTotal).ToString("0.00");
        string str = Convert.ToDouble(tempStrAmt).ToString("0.00");
        return Convert.ToString(str);
    }
    protected void grdSubmitPayment_Sorting(object sender, GridViewSortEventArgs e)
    {
        ShowAllPayment();
        DataTable dt = new DataTable();
        dt = ds.Tables[0];
        {
            string SortDir = string.Empty;
            if (dir == SortDirection.Ascending)
            {
                dir = SortDirection.Descending;
                SortDir = "Desc";
            }
            else
            {
                dir = SortDirection.Ascending;
                SortDir = "Asc";
            }
            DataView sortedView = new DataView(dt);
            sortedView.Sort = e.SortExpression + " " + SortDir;
            grdSubmitPayment.DataSource = sortedView;
            grdSubmitPayment.DataBind();
        }
    }
    public SortDirection dir
    {
        get
        {
            if (ViewState["dirState"] == null)
            {
                ViewState["dirState"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["dirState"];
        }
        set
        {
            ViewState["dirState"] = value;
        }
    }
    
    protected void btnNotPay_Click(object sender, EventArgs e)
    {
        Active = "A";
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnNotPay.Attributes.Add("class", "paidBtn");

        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnPay.Attributes.Add("class", "paidBtnDis");
        grdNotPaid();
        try
        {
            grdSubmitPayment.HeaderRow.Cells[0].Text = "Select";
        }
        catch (Exception)
        {
        }
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        Active = "D";
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnNotPay.Attributes.Add("class", "paidBtnDis");
        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnPay.Attributes.Add("class", "paidBtn");
        grdPaid();
        try
        {
            grdSubmitPayment.HeaderRow.Cells[0].Text = "Paid";
        }
        catch (Exception)
        {
        }
    }
}
