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

public partial class PaidUnPaidInvoice : System.Web.UI.Page
{
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    smUtil objSmUtil = new smUtil();
    DataSet ds = new DataSet();
    dc_Admin objAdmin = new dc_Admin();
    static string GT = "0.00";
    static string Active = "A";
    int size = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divrangeFilter.Style.Add("display", "none");
            Active = "A";
            grdSubmitPayment.Columns[5].Visible = false;
            GT = "0.00";
            if (Active == "D")
            {
                grdPaid();
            }
            else if (Active == "A")
            {
                grdNotPaid();
            }
        }
    }
    protected void grdSubmitPayment_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdSubmitPayment.PageIndex = e.NewPageIndex;
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
            grdSubmitPayment.Columns[4].Visible = true;
            grdSubmitPayment.Columns[5].Visible = true;
            grdSubmitPayment.Columns[6].Visible = true;
        }
        else if (Active == "A")
        {
            grdSubmitPayment.Columns[4].Visible = true;
            grdSubmitPayment.Columns[5].Visible = false;
            grdSubmitPayment.Columns[6].Visible = false;
        }
    }

    public void ShowAllPayment()
    {
        ds = objAdmin.ShowAllPayments();
        grdSubmitPayment.DataSource = ds;
        grdSubmitPayment.DataBind();
        foreach (GridViewRow row in grdSubmitPayment.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkReject = (row.Cells[0].FindControl("lnkReject") as LinkButton);
                lnkReject.Visible = false;
            }
        }
    }

    protected void grdSubmitPayment_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (Active == "A")
        {
            grdSubmitPayment.Columns[0].HeaderText = "Paid";
        }
        if (Active == "D")
        {
            grdSubmitPayment.Columns[0].HeaderText = "Select";
        }
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
                    Audi.PostBackUrl = "METED/METED_Audit_Page1.aspx?InvoiceNo=" + InNo + "&Jobs=" + jobNum + "&Utility=" + Utility + "";
                }
                else if (Utility == 2)
                {
                    Audi.PostBackUrl = "PPLAudit/PPL_Audit_1.aspx?InvoiceNo=" + InNo + "&Jobs=" + jobNum + "&Utility=" + Utility + "";
                }
            }
            else if (lbl_G_Invoice.Visible == true)
            {
                Inv.Visible = true;
                string jobNum = lbl_D_JobNum.Text;
                int Utility = Convert.ToInt32(Inv.CommandArgument);
                int InNo = Convert.ToInt32(Inv.ValidationGroup);
                Inv.PostBackUrl = "Invoice_Crystal.aspx?Back=dj&Jobs=" + jobNum + "&Utility=" + Utility + "&InvoiceNo=" + InNo + "";
            }
        }
    }

    public void grdNotPaid()
    {
        GT = "0.00";
        string empName = Convert.ToString(Request.QueryString["UsrName"]);

        DataTable dt = objAdmin.FillEmpNotPaidDrowpDown(empName);
        if (dt.Rows.Count == 0)
        {
            lbl_GrandTotal.Text = "$ 0.00";
        }
        grdSubmitPayment.DataSource = dt;
        grdSubmitPayment.DataBind();



        foreach (GridViewRow row in grdSubmitPayment.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                chkRow.Checked = false; chkRow.Enabled = false;
            }
        }
    }


    public void grdPaid()
    {
        GT = "0.00";
        string empName = Convert.ToString(Request.QueryString["UsrName"]);

        DataTable dt = objAdmin.FillEmpDrowpDown(empName);
        if (dt.Rows.Count == 0)
        {
            lbl_GrandTotal.Text = "$ 0.00";
        }
        grdSubmitPayment.DataSource = dt;
        grdSubmitPayment.DataBind();


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
        divrangeFilter.Style.Add("display", "none");
        Divpaging.Style.Remove("margin-top");
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
        divrangeFilter.Style.Add("display", "block");
        Divpaging.Style.Add("margin-top", "65px");
        try
        {
            grdSubmitPayment.HeaderRow.Cells[0].Text = "Paid";
        }
        catch (Exception)
        {
        }
    }
    protected void DDL_Range_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = Convert.ToInt32(DDL_Range.SelectedValue);
        GT = "0.00";
        DateTime FilterDate = DateTime.Now;
        if (i != 0 || i != 8)
        {
            int caseSwitch = i;
            switch (caseSwitch)
            {
                case 1:
                    string empName = Convert.ToString(Request.QueryString["UsrName"]);
                    DataTable dt = objNewJob.getPaidRecordByFilter("", "", empName);
                    DateTime LastAproveDate = Convert.ToDateTime(dt.Rows[0]["max_date"]);
                    txt_FromDate.Text = LastAproveDate.ToString("MM/dd/yyyy");
                    txt_ToDate.Text = LastAproveDate.ToString("MM/dd/yyyy");
                    CommonFilter(Convert.ToString(LastAproveDate), Convert.ToString(LastAproveDate));
                    break;
                case 2:
                    DateTime firstOfThisMonth = new DateTime(FilterDate.Year, FilterDate.Month, 1);
                    int days = DateTime.DaysInMonth(FilterDate.Year, FilterDate.Month);
                    days = days - 1;
                    DateTime lastOfThisMonth = firstOfThisMonth.AddDays(days);
                    txt_FromDate.Text = firstOfThisMonth.ToString("MM/dd/yyyy");
                    txt_ToDate.Text = lastOfThisMonth.ToString("MM/dd/yyyy");
                    CommonFilter(Convert.ToString(firstOfThisMonth), Convert.ToString(lastOfThisMonth));
                    break;
                case 3:
                    int Month = FilterDate.Month;
                    if (Month == 1 || Month == 2 || Month == 3)
                    {
                        FindFirstQtr();
                    }
                    if (Month == 4 || Month == 5 || Month == 6)
                    {
                        FindSecondQtr();
                    }
                    if (Month == 7 || Month == 8 || Month == 9)
                    {
                        FindThirdQtr();
                    }
                    if (Month == 10 || Month == 11 || Month == 12)
                    {
                        FindFourthQtr();
                    }
                    break;
                case 4:
                    int year_ = FilterDate.Year;
                    DateTime firstDay_ = new DateTime(year_, 1, 1);
                    DateTime lastDay_ = new DateTime(year_, 12, 31);
                    txt_FromDate.Text = firstDay_.ToString("MM/dd/yyyy");
                    txt_ToDate.Text = lastDay_.ToString("MM/dd/yyyy");
                    CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
                    break;
                case 5:
                    firstOfThisMonth = new DateTime(FilterDate.Year, FilterDate.Month, 1);
                    firstOfThisMonth = firstOfThisMonth.AddDays(-1);
                    firstOfThisMonth = new DateTime(firstOfThisMonth.Year, firstOfThisMonth.Month, 1);
                    days = DateTime.DaysInMonth(firstOfThisMonth.Year, firstOfThisMonth.Month);
                    days = days - 1;
                    lastOfThisMonth = firstOfThisMonth.AddDays(days);
                    txt_FromDate.Text = firstOfThisMonth.ToString("MM/dd/yyyy");
                    txt_ToDate.Text = lastOfThisMonth.ToString("MM/dd/yyyy");
                    CommonFilter(Convert.ToString(firstOfThisMonth), Convert.ToString(lastOfThisMonth));
                    break;
                case 6:
                    Month = FilterDate.Month;
                    if (Month == 1 || Month == 2 || Month == 3)
                    {
                        year_ = FilterDate.Year;
                        year_ = year_ - 1;
                        firstDay_ = new DateTime(year_, 10, 1);
                        lastDay_ = new DateTime(year_, 12, 31);
                        txt_FromDate.Text = firstDay_.ToString("MM/dd/yyyy");
                        txt_ToDate.Text = lastDay_.ToString("MM/dd/yyyy");
                        CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
                    }
                    if (Month == 4 || Month == 5 || Month == 6)
                    {
                        FindFirstQtr();
                    }
                    if (Month == 7 || Month == 8 || Month == 9)
                    {
                        FindSecondQtr();
                    }
                    if (Month == 10 || Month == 11 || Month == 12)
                    {
                        FindThirdQtr();
                    }
                    break;
                case 7:
                    year_ = (FilterDate.Year) - 1;
                    firstDay_ = new DateTime(year_, 1, 1);
                    lastDay_ = new DateTime(year_, 12, 31);
                    txt_FromDate.Text = firstDay_.ToString("MM/dd/yyyy");
                    txt_ToDate.Text = lastDay_.ToString("MM/dd/yyyy");
                    CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
                    break;
                case 9:
                    FindFirstQtr();
                    break;
                case 10:
                    FindSecondQtr();
                    break;
                case 11:
                    FindThirdQtr();
                    break;
                case 12:
                    FindFourthQtr();
                    break;
            }
        }
    }

    public void FindFirstQtr()
    {
        DateTime FilterDate = DateTime.Now;
        int year_ = FilterDate.Year;
        DateTime firstDay_ = new DateTime(year_, 1, 1);
        DateTime lastDay_ = new DateTime(year_, 3, 31);
        txt_FromDate.Text = firstDay_.ToString("MM/dd/yyyy");
        txt_ToDate.Text = lastDay_.ToString("MM/dd/yyyy");
        CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
    }
    public void FindSecondQtr()
    {
        DateTime FilterDate = DateTime.Now;
        int year_ = FilterDate.Year;
        DateTime firstDay_ = new DateTime(year_, 4, 1);
        DateTime lastDay_ = new DateTime(year_, 6, 30);
        txt_FromDate.Text = firstDay_.ToString("MM/dd/yyyy");
        txt_ToDate.Text = lastDay_.ToString("MM/dd/yyyy");
        CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
    }
    public void FindThirdQtr()
    {
        DateTime FilterDate = DateTime.Now;
        int year_ = FilterDate.Year;
        DateTime firstDay_ = new DateTime(year_, 7, 1);
        DateTime lastDay_ = new DateTime(year_, 9, 30);
        txt_FromDate.Text = firstDay_.ToString("MM/dd/yyyy");
        txt_ToDate.Text = lastDay_.ToString("MM/dd/yyyy");
        CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
    }
    public void FindFourthQtr()
    {
        DateTime FilterDate = DateTime.Now;
        int year_ = FilterDate.Year;
        DateTime firstDay_ = new DateTime(year_, 10, 1);
        DateTime lastDay_ = new DateTime(year_, 12, 31);
        txt_FromDate.Text = firstDay_.ToString("MM/dd/yyyy");
        txt_ToDate.Text = lastDay_.ToString("MM/dd/yyyy");
        CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
    }


    public void CommonFilter(string fromDate, string ToDate)
    {
        DateTime To_Date = Convert.ToDateTime(ToDate);
        To_Date = To_Date.AddDays(1);
        ToDate = Convert.ToString(To_Date);
        string empName = Convert.ToString(Request.QueryString["UsrName"]);
        DataTable dt = objNewJob.getPaidRecordByFilter(fromDate, ToDate, empName);
        if (dt.Rows.Count == 0)
        { lbl_GrandTotal.Text = "$ 0.00"; }
        grdSubmitPayment.DataSource = dt;
        grdSubmitPayment.DataBind();
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GT = "0.00";
        DDL_Range.SelectedIndex = 0;
        CommonFilter(txt_FromDate.Text, txt_ToDate.Text);
    }
}
