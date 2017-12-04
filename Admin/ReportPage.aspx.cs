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

public partial class Admin_ReportPage : System.Web.UI.Page
{
   public DataTable dt = new DataTable();
  // DataView dv = new DataView();
    Dc_Category objCat = new Dc_Category();
    int size = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {  
        if (!IsPostBack)
        {   
            ShowAllUser();
            div_drop.Visible = false;
        }
    }
    

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text != "ALL")
        {
            grdCategory.AllowPaging = true;
            size = int.Parse(DropDownList1.SelectedItem.Value.ToString());
            grdCategory.PageSize = size;
            ShowAllUser();
        }
        else
        {
            grdCategory.AllowPaging = false;
            ShowAllUser();
        }
    }
    public void ShowAllUser()
    {
        DataTable dt1 = new DataTable();
        dt1 = objCat.ShowAllUser();
        grdCategory.DataSource = dt1;
        grdCategory.DataBind();
       
    }
    protected void grdCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCategory.PageIndex = e.NewPageIndex;
        ShowAllUser();
    }



    protected void imgBtnIsActive_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton act = sender as ImageButton;
        GridViewRow gvrow = (GridViewRow)act.NamingContainer;
        string id = act.CommandArgument.ToString();
        bool msg = objCat.Act_Status(id);
        if (msg == true)
        {
            Response.Write("<script>alert('User activated Successfully.')</script>");
            ShowAllUser();
        }
        else
        {
            Response.Write("<script>alert('Not activated.')</script>");
        }
    }
    protected void imgBtndeActive_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton deact = sender as ImageButton;
        GridViewRow gvrow = (GridViewRow)deact.NamingContainer;
        string id = deact.CommandArgument.ToString();
        bool msg = objCat.Dact_Status(id);
        if (msg == true)
        {
            Response.Write("<script>alert('User Deactivated Successfully.')</script>");
            ShowAllUser();
        }
        else
        {
            Response.Write("<script>alert('Not Deactivated.')</script>");
        }
    }
    // Status
    protected void Img_IsActStatus_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton act1 = sender as ImageButton;
        GridViewRow gvrow1 = (GridViewRow)act1.NamingContainer;
        string id = act1.CommandArgument.ToString();
        bool msg = objCat.Reg_ActStatus(id);
        if (msg == true)
        {
            Response.Write("<script>alert('Status Deactivated Successfully.')</script>");
            ShowAllUser();
        }
        else
        {
            Response.Write("<script>alert('Not activated.')</script>");
        }
    }

    protected void Img_IsDeActStatus_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton deact1 = sender as ImageButton;
        GridViewRow gvrow11 = (GridViewRow)deact1.NamingContainer;
        string id = deact1.CommandArgument.ToString();
        bool msg = objCat.Reg_DeActStatus(id);
        if (msg == true)
        {
            Response.Write("<script>alert('Status activated Successfully.')</script>");
            ShowAllUser();
        }
        else
        {
            Response.Write("<script>alert('Not Deactivated.')</script>");
        }
    }

    // end

    protected void img_View_Click(object sender, EventArgs e)
    {
        //div_grid.Visible = false;
        //div_page.Visible = false;
        //ddl_invoice.Visible = false;
        //btn_buildR.Visible = false;
        //div_drop.Visible = true;
        ImageButton lnk = sender as ImageButton;
        GridViewRow grd = (GridViewRow)lnk.NamingContainer;
        int ID = Convert.ToInt32(lnk.CommandArgument.ToString());
         
        //dt = objCat.ShowInvo(ID);
        //if (dt.Rows.Count > 0)
        //{
        //    //ViewState["view"] = dt;
        //    ddl_jobno.DataSource = dt;
        //    ddl_jobno.DataTextField = "JobNumber";
        //    ddl_jobno.DataValueField = "JobNumber";
        //    ddl_jobno.DataBind();
        //    ddl_jobno.Items.Insert(0, new ListItem("--Select Job No.--", "0"));
        //}
        //else
        //{
        //    Response.Write("<script>alert('No Record.')</script>");
        //    div_grid.Visible = true;
        //}
    }

    protected void ddl_jobno_SelectedIndexChanged(object sender, EventArgs e)
    {
        string val = ddl_jobno.SelectedValue.ToString();
        DataTable dt1 = new DataTable();
        dt1 = objCat.ShowInvoNo(val);
        if (dt1.Rows.Count > 0)
        {
            ddl_invoice.Visible = true;
            btn_buildR.Visible = false;
            //dv = ((DataTable)ViewState["view"]).DefaultView;
            //dv.RowFilter = "JobNumber='" + ddl_jobno.SelectedValue.ToString() + "'";
            //ddl_invoice.DataSource = dv;
            //ddl_invoice.DataTextField = "NoOfInvoice";
            //ddl_invoice.DataValueField = "NoOfInvoice";

            //ddl_invoice.DataBind();

            
            ddl_invoice.DataSource = dt1;
            ddl_invoice.DataTextField = "invo";
            ddl_invoice.DataValueField = "Utility";
            ddl_invoice.DataBind();
            ddl_invoice.Items.Insert(0, new ListItem("--Select Invoice--", "0"));
        }
        else
            Response.Write("<script>alert('No Record.')</script>");
    }
   
    protected void ddl_invoice_SelectedIndexChanged(object sender, EventArgs e)
    {
        btn_buildR.Visible = true;
    }
    protected void btn_buildR_Click(object sender, EventArgs e)
    {
        string jobNO = ddl_jobno.SelectedValue.ToString();
        string InvNO1=ddl_invoice.SelectedItem.ToString();
        string InvNO=InvNO1.Substring(11);
        string utilityNo = ddl_invoice.SelectedValue.ToString();
        Response.Redirect("../Invoice_Crystal.aspx?Jobs=" + jobNO + "&Utility=" + utilityNo + "&InvoiceNo=" + InvNO);
    }
    protected void btnShowPopup_Click1(object sender, EventArgs e)
    { 
    }
    protected void img_edit_Click(object sender, EventArgs e)
    {
        ImageButton lnk1 = sender as ImageButton;
        GridViewRow grd1 = (GridViewRow)lnk1.NamingContainer;
        string EID = lnk1.CommandArgument.ToString();
        DataTable dt = new DataTable();
        dt = objCat.Show_Pop(EID);
        hid_Id.Value = EID;
        lbl_user.Text = dt.Rows[0]["Name"].ToString();
        txt_pwd.Text = dt.Rows[0]["CWPassword"].ToString();
        txt_phone.Text = dt.Rows[0]["phone"].ToString();
        txt_add.Text = dt.Rows[0]["Address"].ToString();
        txt_city.Text = dt.Rows[0]["City"].ToString();
        txt_state.Text = dt.Rows[0]["State"].ToString();
        txt_zip.Text = dt.Rows[0]["Zipcode"].ToString();
        ModalPopupExtender1.Show();
    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {
        string s = lbl_user.Text;
        string[] words = s.Split(' ');
        string firstname = words[0];
        string lastname = words[1];

        bool msg = objCat.Upd_pop(hid_Id.Value,firstname,lastname, txt_pwd.Text, txt_phone.Text, txt_add.Text, txt_city.Text, txt_state.Text, txt_zip.Text);
        if (msg == true)
        {
            Response.Write("<script>alert('Update Successfully.')</script>");
            ShowAllUser();
        }
        else
            Response.Write("<script>alert('Failed')</script>");
    }
    protected void img_del_Click(object sender, EventArgs e)
    {
        ImageButton lnk2 = sender as ImageButton;
        GridViewRow grd2 = (GridViewRow)lnk2.NamingContainer;
        string EID2 = lnk2.CommandArgument.ToString();
        bool msg1 = objCat.Del_Rec(EID2);
        if (msg1 == true)
        {
            Response.Write("<script>alert('Delete Successfully.')</script>");
            ShowAllUser();
        }
        else
            Response.Write("<script>alert('Failed')</script>");
    }
    protected void grdCategory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {   
            //Find the DropDownList in the Row
            Label lbl = (Label) e.Row.FindControl("lbl_Login");
            string loginid = lbl.Text;
            DropDownList ddlCountries = (e.Row.FindControl("ddl_status") as DropDownList);
            DataSet ds = new DataSet();
            ds = GetData("select CWPermissionLevel from  Users where CWLogin='"+loginid+"'");
               //if(Convert.ToString(ds.Tables[0].Rows[0]["CWPermissionLevel"]).Equals("Usr_Adm"))
               // {
            ddlCountries.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["CWPermissionLevel"]);
              //  }
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
    protected void ddl_status_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl=sender as DropDownList;
        GridViewRow row = ddl.NamingContainer as GridViewRow;
        string ID = ((Label) row.FindControl("lbl_Login")).Text;
        bool msg = objCat.DDLStatus(ID, ddl.SelectedValue.ToString());
        if (msg == true)
        {
            Response.Write("<script>alert('Update Successfully.')</script>");
            ShowAllUser();
        }
        else
            Response.Write("<script>alert('Failed')</script>");
    }
}
