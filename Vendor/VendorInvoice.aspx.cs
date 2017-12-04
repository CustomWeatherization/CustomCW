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



public partial class Vendor_VendorInvoice : System.Web.UI.Page
{
    dc_Vendor vendor = new dc_Vendor();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    //TxtDueDate
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Request.QueryString["Back"]) == "Admin/Admin_Unfinalize")
        {
            spnNewPay.Visible = tblNewInv.Visible = btn_Paid.Visible = false;
            GrdVendorInvoice.Columns[0].Visible = false;
            GrdVendorInvoice.Columns[5].Visible = false;

            GrdPaymentHistory.Columns[10].Visible = true;
            GrdVendorInvoice.Columns[6].Visible = true;
        }
        if (!IsPostBack)
        {
            BindGrdInvoiceVendor();
            BindGrdPaymentHistory();
            ShowPaidBy();
            DataTable dImg = vendor.getImage(Request.QueryString["Jobs"].ToString());
            if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "5")
            {
                tdSpnDueDate.Visible = tdTxtDueDate.Visible = true;
            }
            string VnDueDate = Convert.ToString(dImg.Rows[0]["VendorDueDate"]);
            if (VnDueDate == "01/01/1900 12:00:00 AM" || VnDueDate == "1/1/1900 12:00:00 AM")
            {
            }
            else
            {
                TxtDueDate.Text = Convert.ToDateTime(dImg.Rows[0]["VendorDueDate"]).ToString("MM/dd/yyyy");
            }
        }
        GetImage();
    }

    public void GetImage()
    {
        DataTable dImg = vendor.getImage(Request.QueryString["Jobs"].ToString());
        ImgVen.ImageUrl = "~/VendorImage/" + Convert.ToString(dImg.Rows[0]["VendorImgPath"]);
    }

    protected void btnAddVendorInvoice_Click(object sender, EventArgs e)
    {
        InsertVendorInvoice("Insert");
        btn_Paid.Visible = true;
    }
    protected void btnModity_Click(object sender, EventArgs e)
    {
        InsertVendorInvoice("update");
    }
    #region insert vendor invoice
    public void InsertVendorInvoice(string utl1)//string utl1
    {
        if (utl1 == "Insert")
        {
            DataTable dImg = vendor.getImage(Request.QueryString["Jobs"].ToString());
            string strVendorNumber = Request.QueryString["Jobs"].ToString();
            string paiddate = "";
            string paidamount = "";
            string PaymentType = "";
            string paidby = "";
            string checkno = "";
            string status = "";
            string modifieddate = "";
            string modifiedtime = "";
            string VendorSendByDt = "0";


            if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "0")
            {
                VendorSendByDt = "0";
            }
            else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "1")
            {
                VendorSendByDt = "3";
            }
            else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "2")
            {
                VendorSendByDt = "5";
            }
            else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "3")
            {
                VendorSendByDt = "7";
            }
            else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "4")
            {
                VendorSendByDt = "10";
            }

            DateTime DueDate_ = Convert.ToDateTime("1900-01-01 00:00:00.000");

            if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "5")
            {
                DateTime modifieddate_ = Convert.ToDateTime(TxtDueDate.Text).AddDays(Convert.ToInt32("-" + VendorSendByDt));
                DueDate_ = Convert.ToDateTime(Convert.ToDateTime(TxtDueDate.Text));
                modifieddate = Convert.ToString(modifieddate_);
            }
            else
            {
                string VendorNet = "0";
                if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "1")
                {
                    VendorNet = "0";
                }
                else if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "2")
                {
                    VendorNet = "10";
                }
                else if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "3")
                {
                    VendorNet = "15";
                }
                else if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "4")
                {
                    VendorNet = "30";
                }

                DateTime modifieddate_ = Convert.ToDateTime(txtVendorInvoiceDate.Text).AddDays(Convert.ToInt32(VendorNet));
                DueDate_ = Convert.ToDateTime(modifieddate_);
                modifieddate_ = Convert.ToDateTime(modifieddate_).AddDays(Convert.ToInt32("-" + VendorSendByDt));
                modifieddate = Convert.ToString(modifieddate_);
            }



            vendor.InsertVendorInvoice(strVendorNumber, txtVendorInvoiceDate.Text, txtVendorInvoiceNumber.Text, txtVendorInvoiceAmnt.Text, paiddate, paidamount, PaymentType, paidby, checkno, status, modifieddate, modifiedtime, DueDate_);
            lblMsg.Text = txtVendorInvoiceDate.Text = txtVendorInvoiceNumber.Text = txtVendorInvoiceAmnt.Text = "";
            BindGrdInvoiceVendor();
            BindGrdPaymentHistory();
        }
        else if (utl1 == "update")
        {
            string HdNId = Convert.ToString(hdnInvId.Value);
            string[] HdNId_ = HdNId.Split(',');


            string HdNAmt = Convert.ToString(hdnInvAmt.Value);
            string[] HdNAmt_ = HdNAmt.Split(',');

            for (int i = 0; i < HdNId_.Length; i++)
            {
                if (HdNAmt_.Length > 1)
                {
                    vendor.UpdatePaymentHistory(Convert.ToString(HdNId_[i]), txtPaidDate.Text, Convert.ToString(HdNAmt_[i]), ddlPaymentType.SelectedItem.Text, ddlPaidBy.SelectedItem.Text, txtChckConfrm.Text, "Paid");
                }
                else
                {
                    vendor.UpdatePaymentHistory(Convert.ToString(HdNId_[i]), txtPaidDate.Text, txtPaidAmnt.Text, ddlPaymentType.SelectedItem.Text, ddlPaidBy.SelectedItem.Text, txtChckConfrm.Text, "Paid");
                }
            }
            BindGrdInvoiceVendor();
            BindGrdPaymentHistory();
            lblMsg.Text = txtPaidDate.Text = txtPaidAmnt.Text = txtChckConfrm.Text = "";
            ddlPaymentType.SelectedValue = ddlPaidBy.SelectedValue = "0";
        }
    }
    #endregion
    #region Fill Paid By

    public void ShowPaidBy()
    {
        try
        {
            DataTable dt = vendor.ShowPaidBy();
            ddlPaidBy.DataSource = dt;
            ddlPaidBy.DataValueField = "ID";
            ddlPaidBy.DataTextField = "ContactPerson";
            ddlPaidBy.DataBind();
            ddlPaidBy.Items.Insert(0, new ListItem("Select Contact Person", "0"));
        }
        catch (Exception ex)
        {
        }
    }
    #endregion
    #region bind grdVendorInvoice
    public void BindGrdInvoiceVendor()
    {
        string strVendorNumber = Request.QueryString["Jobs"].ToString();
        DataTable dt = vendor.BindGrdVendorInvoice(strVendorNumber);
        if (dt.Rows.Count <= 0)
        {
            btn_Paid.Visible = false;
        }
        GrdVendorInvoice.DataSource = dt;
        GrdVendorInvoice.DataBind();
        if (Convert.ToString(Request.QueryString["Back"]) == "DisplayJobSearchRecords")
        {
            GrdVendorInvoice.Columns[0].Visible = true;
            GrdVendorInvoice.Columns[4].Visible = true;

            GrdPaymentHistory.Columns[10].Visible = false;
            GrdVendorInvoice.Columns[6].Visible = false;
        }
    }
    #endregion
    #region bind payment history grid
    public void BindGrdPaymentHistory()
    {
        string strVendorNumber = Request.QueryString["Jobs"].ToString();
        DataTable dt = vendor.BindGrdPaymentHistory(strVendorNumber);
        GrdPaymentHistory.DataSource = dt;
        GrdPaymentHistory.DataBind();
    }
    #endregion

    protected void GrdVendorInvoice_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (txtVendorInvoiceDate.Visible == true)
        {
            lblMsg.Text = txtPaidDate.Text = txtPaidAmnt.Text = txtChckConfrm.Text = "";
            ddlPaymentType.SelectedValue = ddlPaidBy.SelectedValue = "0";
            int InvId = Convert.ToInt32(GrdVendorInvoice.DataKeys[e.RowIndex].Value);
            hdnInvId.Value = Convert.ToString(InvId);
            tdTxtPa.Visible = tdSpnPa.Visible = true;
            rfv_txtPaidAmnt.Enabled = true;
            this.ModalPopupExtender1.Show();
        }
        else
        {
            int RowId = Convert.ToInt32(GrdVendorInvoice.DataKeys[e.RowIndex].Value.ToString());
            TextBox Txt_G_InvDate = (TextBox)GrdVendorInvoice.Rows[e.RowIndex].FindControl("Txt_G_InvDate");
            TextBox Txt_G_InvNo = (TextBox)GrdVendorInvoice.Rows[e.RowIndex].FindControl("Txt_G_InvNo");
            TextBox Txt_G_InvoiceAmnt = (TextBox)GrdVendorInvoice.Rows[e.RowIndex].FindControl("Txt_G_InvoiceAmnt");


            DataTable dImg = vendor.getImage(Request.QueryString["Jobs"].ToString());
            string VendorSendByDt = "0";

            if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "0")
            {
                VendorSendByDt = "0";
            }
            else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "1")
            {
                VendorSendByDt = "3";
            }
            else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "2")
            {
                VendorSendByDt = "5";
            }
            else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "3")
            {
                VendorSendByDt = "7";
            }
            else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "4")
            {
                VendorSendByDt = "10";
            }


            DateTime modifieddate_ = Convert.ToDateTime("1/1/1900");
            string status = "paid";
            if (Convert.ToString(dImg.Rows[0]["VendorNet"]) != "5")
            {
                string VendorNet = "0";
                if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "1")
                {
                    VendorNet = "0";
                }
                else if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "2")
                {
                    VendorNet = "10";
                }
                else if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "3")
                {
                    VendorNet = "15";
                }
                else if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "4")
                {
                    VendorNet = "30";
                }

                status = "NotMonthly";
                modifieddate_ = Convert.ToDateTime(Txt_G_InvDate.Text).AddDays(Convert.ToInt32(VendorNet));
                modifieddate_ = Convert.ToDateTime(modifieddate_).AddDays(Convert.ToInt32("-" + VendorSendByDt));
            }
            vendor.UpdatePaidUnpaidVendorInvoice(Txt_G_InvDate.Text, Txt_G_InvNo.Text, Txt_G_InvoiceAmnt.Text, Convert.ToString(RowId), status, modifieddate_, Convert.ToDateTime("1-1-1900"), "", "", "", "", "");
            GrdVendorInvoice.EditIndex = -1;
            BindGrdInvoiceVendor();
            BindGrdPaymentHistory();
            ShowPaidBy();
        }
    }


    protected void btn_Paid_Click(object sender, EventArgs e)
    {
        lblMsg.Text = lblMsg.Text = txtPaidDate.Text = txtPaidAmnt.Text = txtChckConfrm.Text = "";
        ddlPaymentType.SelectedValue = ddlPaidBy.SelectedValue = "0";
        string Ids = ""; string Amts = "";
        foreach (GridViewRow row in GrdVendorInvoice.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                Label lbl_G_InvoiceAmnt = (row.Cells[3].FindControl("lbl_G_InvoiceAmnt") as Label);
                if (chkRow.Checked)
                {
                    string Id = chkRow.ValidationGroup;
                    Ids = Ids + "," + Id;


                    string Amt = lbl_G_InvoiceAmnt.Text;
                    Amts = Amts + "," + Amt;
                }
            }
        }
        hdnInvId.Value = Convert.ToString(Ids.TrimStart(','));
        hdnInvAmt.Value = Convert.ToString(Amts.TrimStart(','));
        if (Ids != "")
        {
            tdTxtPa.Visible = tdSpnPa.Visible = false;
            rfv_txtPaidAmnt.Enabled = false;
            this.ModalPopupExtender1.Show();
        }
        else
        {
            lblMsg.Text = "Please select atleast one Invoice for Pay";
        }
    }
    protected void GrdVendorInvoice_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrdVendorInvoice.EditIndex = e.NewEditIndex;
        BindGrdInvoiceVendor();
        BindGrdPaymentHistory();
        ShowPaidBy();
    }
    protected void GrdVendorInvoice_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrdVendorInvoice.EditIndex = -1;
        BindGrdInvoiceVendor();
        BindGrdPaymentHistory();
        ShowPaidBy();
    }
    protected void GrdVendorInvoice_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int RowId = Convert.ToInt32(GrdVendorInvoice.DataKeys[e.RowIndex].Value.ToString());
        vendor.UpdatePaidUnpaidVendorInvoice("", "", "", Convert.ToString(RowId), "Delete", Convert.ToDateTime("1-1-1900"), Convert.ToDateTime("1-1-1900"), "", "", "", "", "");
        BindGrdInvoiceVendor();
        BindGrdPaymentHistory();
        ShowPaidBy();
    }
    protected void GrdPaymentHistory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int RowId = Convert.ToInt32(GrdPaymentHistory.DataKeys[e.RowIndex].Value.ToString());
        vendor.UpdatePaidUnpaidVendorInvoice("", "", "", Convert.ToString(RowId), "Delete", Convert.ToDateTime("1-1-1900"), Convert.ToDateTime("1-1-1900"), "", "", "", "", "");
        BindGrdInvoiceVendor();
        BindGrdPaymentHistory();
        ShowPaidBy();
    }
    protected void GrdPaymentHistory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrdPaymentHistory.EditIndex = -1;
        BindGrdInvoiceVendor();
        BindGrdPaymentHistory();
        ShowPaidBy();
    }
    protected void GrdPaymentHistory_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrdPaymentHistory.EditIndex = e.NewEditIndex;
        BindGrdInvoiceVendor();
        BindGrdPaymentHistory();
        ShowPaidBy();
    }
    protected void GrdPaymentHistory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int RowId = Convert.ToInt32(GrdPaymentHistory.DataKeys[e.RowIndex].Value.ToString());
        TextBox Txt_G_InvDate = (TextBox)GrdPaymentHistory.Rows[e.RowIndex].FindControl("Txt_G_InvDate");
        TextBox Txt_G_InvNo = (TextBox)GrdPaymentHistory.Rows[e.RowIndex].FindControl("Txt_G_InvNo");
        TextBox Txt_G_InvoiceAmnt = (TextBox)GrdPaymentHistory.Rows[e.RowIndex].FindControl("Txt_G_InvoiceAmnt");


        TextBox Txt_G_PaidDate = (TextBox)GrdPaymentHistory.Rows[e.RowIndex].FindControl("Txt_G_PaidDate");
        TextBox Txt_G_PaymentType = (TextBox)GrdPaymentHistory.Rows[e.RowIndex].FindControl("Txt_G_PaymentType");
        TextBox Txt_G_PaidBy = (TextBox)GrdPaymentHistory.Rows[e.RowIndex].FindControl("Txt_G_PaidBy");

        TextBox Txt_G_CheckNo = (TextBox)GrdPaymentHistory.Rows[e.RowIndex].FindControl("Txt_G_CheckNo");
        TextBox Txt_G_PaidAmnt = (TextBox)GrdPaymentHistory.Rows[e.RowIndex].FindControl("Txt_G_PaidAmnt");

        TextBox Txt_G_DueDate = (TextBox)GrdPaymentHistory.Rows[e.RowIndex].FindControl("Txt_G_DueDate");

        DataTable dImg = vendor.getImage(Request.QueryString["Jobs"].ToString());
        string VendorSendByDt = "0";

        if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "0")
        {
            VendorSendByDt = "0";
        }
        else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "1")
        {
            VendorSendByDt = "3";
        }
        else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "2")
        {
            VendorSendByDt = "5";
        }
        else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "3")
        {
            VendorSendByDt = "7";
        }
        else if (Convert.ToString(dImg.Rows[0]["VendorSendByDt"]) == "4")
        {
            VendorSendByDt = "10";
        }


        DateTime modifieddate_ = Convert.ToDateTime("1/1/1900");
        string status = "paid";
        if (Convert.ToString(dImg.Rows[0]["VendorNet"]) != "5")
        {
            string VendorNet = "0";
            if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "1")
            {
                VendorNet = "0";
            }
            else if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "2")
            {
                VendorNet = "10";
            }
            else if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "3")
            {
                VendorNet = "15";
            }
            else if (Convert.ToString(dImg.Rows[0]["VendorNet"]) == "4")
            {
                VendorNet = "30";
            }

            status = "NotMonthly";
            modifieddate_ = Convert.ToDateTime(Txt_G_InvDate.Text).AddDays(Convert.ToInt32(VendorNet));
            modifieddate_ = Convert.ToDateTime(modifieddate_).AddDays(Convert.ToInt32("-" + VendorSendByDt));
        }

        vendor.UpdatePaidUnpaidVendorInvoice(Txt_G_InvDate.Text, Txt_G_InvNo.Text, Txt_G_InvoiceAmnt.Text, Convert.ToString(RowId), "UnPaid", modifieddate_, Convert.ToDateTime(Txt_G_PaidDate.Text), Txt_G_PaidAmnt.Text, Txt_G_PaymentType.Text, Txt_G_PaidBy.Text, Txt_G_CheckNo.Text, Txt_G_DueDate.Text);

        GrdPaymentHistory.EditIndex = -1;
        BindGrdInvoiceVendor();
        BindGrdPaymentHistory();
        ShowPaidBy();
    }
}
