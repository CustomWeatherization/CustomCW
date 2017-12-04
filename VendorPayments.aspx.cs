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

public partial class VendorPayments : System.Web.UI.Page
{
    public DataSet dt_jobvendor = new DataSet();

    dc_Vendor allinv = new dc_Vendor();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        dt_jobvendor = allinv.BindGrdAllVendorInvoice();
        gvCustomers.DataSource = dt_jobvendor.Tables[0]; ;
        gvCustomers.DataBind();
    }
    protected void gvCustomers_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        HyperLinkColumn hplink = new HyperLinkColumn();
        hplink.Text = "VendorJobNumber";
        dt.Columns.Add(new DataColumn("InvoiceId"));
        dt.Columns.Add(new DataColumn("InvoiceNo"));
        dt.Columns.Add(new DataColumn("InvoiceAmnt"));
        dt.Columns.Add(new DataColumn("InvoiceDate"));
        dt.Columns.Add(new DataColumn("DueDate"));
        dt.Columns.Add(hplink.Text);

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string customerId = gvCustomers.DataKeys[e.Row.RowIndex].Value.ToString();
            GridView gvOrders = e.Row.FindControl("gvOrders") as GridView;
            ds = GetData();
            foreach (DataRow row in ds.Tables[1].Rows)
            {
                if (customerId == row["VendorJobNumber"].ToString())
                {
                    object[] RowValues = { "", "", "", "", "", "" };

                    RowValues[0] = row[0];
                    RowValues[1] = row[3];
                    RowValues[2] = Convert.ToDecimal(row[4]).ToString("C2");

                    RowValues[3] = Convert.ToDateTime(row[2]).ToString("MM/dd/yyyy");
                    RowValues[4] = Convert.ToDateTime(row[13]).ToString("MM/dd/yyyy");
                    RowValues[5] = row[1];
                    dt.Rows.Add(RowValues);
                    dt.AcceptChanges();
                }

            }
            if (dt.Rows.Count > 0)
            {
                gvOrders.DataSource = dt;
                gvOrders.DataBind();
            }
        }
    }
    private static DataSet GetData()
    {
        DataSet dt = new DataSet();
        dc_Vendor allinv = new dc_Vendor();
        dt = allinv.BindGrdAllVendorInvoice();
        return dt;
    }

    protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCustomers.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobStatusMenu.aspx?vendoreJob=Vendor");
    }
}
