using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_PaidReport : System.Web.UI.Page
{
    dc_Admin ObjAdmin = new dc_Admin();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToString(Request.QueryString["JobID"]) != "" && Convert.ToString(Request.QueryString["UC"]) != "" && Convert.ToString(Request.QueryString["JobID"]) != null && Convert.ToString(Request.QueryString["UC"]) != null)
            {
                if (!IsPostBack)
                {
                    BindData();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        catch
        {
        }
    }


    public void BindData()
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjAdmin.GetJobWithPaidReport(Convert.ToInt32(Request.QueryString["JobID"]), Convert.ToString(Request.QueryString["UC"]), Convert.ToInt32(Request.QueryString["NoOfInvoice"]));
            if (dt.Rows.Count > 0)
            {
                txtJobNumber.Text = Convert.ToString(dt.Rows[0]["JobNumber"]);
                txtPamt.Text = Convert.ToString(dt.Rows[0]["PaidAmount"]);
                txtRamt.Text = Convert.ToString(dt.Rows[0]["PaidRemainingAmount"]);
                txtTamt.Text = Convert.ToString(dt.Rows[0]["PaidTotalAmount"]);
                //txt_PaymentType.Text = Convert.ToString(dt.Rows[0]["Payment_Type"]);
                //txt_Payment_no.Text = Convert.ToString(dt.Rows[0]["PaymentType_No"]);
                //ddlPaidStaus.SelectedValue = Convert.ToString(dt.Rows[0]["PaidStatus"]);
            }
        }
        catch
        {
        }
    }

    protected void rtn_Update_Click(object sender, EventArgs e)
    {
        try
        {
            ObjAdmin.UpdateAmt(txtJobNumber.Text, txtPamt.Text, txtRamt.Text, txtTamt.Text);
            Response.Redirect("RecivePayment.aspx");
        }
        catch
        {

        }
    }

}