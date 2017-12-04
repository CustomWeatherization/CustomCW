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

public partial class Admin_BcocAllThing : System.Web.UI.Page
{
    AddBcocAllThing objNewThing = new AddBcocAllThing();
    CommonCategory objCat = new CommonCategory();
    //Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();

    int size = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowAllThing();
            bindCategory();
            ShowLaborRate();
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int i = objNewThing.InsertPrivateAllThing(Convert.ToInt32(DDl_Category.SelectedValue), Convert.ToInt32(DDl_MEASURE_DESCRIPTION.SelectedValue), txt_Location.Text, txt_SC.Text, txt_Liurp.Text, txt_Unit.Text, txt_LaborRate.Text, txt_CPU.Text);
        if (i == 1)
        {
            Response.Write("<script type = 'text/javascript'>alert('Record is Inserted');</script>");
        }
        DDl_MEASURE_DESCRIPTION.SelectedIndex = 0;
        txt_Location.Text = txt_SC.Text = txt_Liurp.Text = txt_Unit.Text = txt_LaborRate.Text = txt_CPU.Text = "";
        ShowAllThing();
    }
    protected void DDl_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDl_Category.SelectedValue != "Select")
        {
            //DataTable dt = objInvoice.ShowSubCatByCatId(Convert.ToInt32(DDl_Category.SelectedValue));
            //-------------Temp Work---------------//
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
            DataTable dt = new DataTable();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_ShowCommonSubCatByCatId";
            cmd.Parameters.AddWithValue("@catId", Convert.ToInt32(DDl_Category.SelectedValue));
            System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(cmd);
            da.Fill(dt);

            //-------------Temp Work---------------//
            DDl_MEASURE_DESCRIPTION.DataSource = dt;
            DDl_MEASURE_DESCRIPTION.DataTextField = "SubCatName";
            DDl_MEASURE_DESCRIPTION.DataValueField = "SubCatId";
            DDl_MEASURE_DESCRIPTION.DataBind();
            DDl_MEASURE_DESCRIPTION.Items.Insert(0, "Select");
        }
    }
    public void bindCategory()
    {
        DataTable dt = objCat.showAllPrivateCategory();
        DDl_Category.DataSource = dt;
        DDl_Category.DataTextField = "Category";
        DDl_Category.DataValueField = "CatID";
        DDl_Category.DataBind();
        DDl_Category.Items.Insert(0, "Select");
        DDl_MEASURE_DESCRIPTION.Items.Insert(0, "Select");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    public void clear()
    {
        DDl_MEASURE_DESCRIPTION.Items.Clear();
        DDl_MEASURE_DESCRIPTION.Items.Insert(0, "Select");
        DDl_Category.SelectedIndex = 0;
        txt_Location.Text = txt_SC.Text = txt_Liurp.Text = txt_Unit.Text = txt_LaborRate.Text = txt_CPU.Text = "";
    }
    public void ShowAllThing()
    {
        DataTable dt = objNewThing.showAllPrivateThing();
        grdAllThing.DataSource = dt;
        grdAllThing.DataBind();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text != "ALL")
        {
            grdAllThing.AllowPaging = true;
            size = int.Parse(DropDownList1.SelectedItem.Value.ToString());
            grdAllThing.PageSize = size;
            ShowAllThing();
        }
        else
        {
            grdAllThing.AllowPaging = false;
            ShowAllThing();
        }
    }

    protected void grdAllThing_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int RowId = Convert.ToInt32(grdAllThing.DataKeys[e.RowIndex].Value.ToString());
        //TextBox txt_U_location = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_location");
        TextBox txt_U_SC = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_SC");
        TextBox txt_U_liurpCode = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_liurpCode");
        TextBox txt_U_unit = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_unit");
        TextBox txt_U_laborRate = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_laborRate");
        TextBox txt_U_costPerUnit = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_costPerUnit");
        int i = objNewThing.UpdateAllPrivateThingbyId(RowId, "", txt_U_SC.Text, txt_U_liurpCode.Text, txt_U_unit.Text, txt_U_laborRate.Text, txt_U_costPerUnit.Text);
        grdAllThing.EditIndex = -1;
        ShowAllThing();
    }
    protected void grdAllThing_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int RowId = Convert.ToInt32(grdAllThing.DataKeys[e.RowIndex].Value.ToString());
        int i = objNewThing.DeleteAllPrivateThingbyId(RowId);
        ShowAllThing();
    }

    protected void grdAllThing_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdAllThing.EditIndex = e.NewEditIndex;
        ShowAllThing();
    }
    protected void grdAllThing_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdAllThing.EditIndex = -1;
        ShowAllThing();
    }

    protected void grdAllThing_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdAllThing.PageIndex = e.NewPageIndex;
        ShowAllThing();
    }
    protected void btn_UpdateLaborRate_Click(object sender, EventArgs e)
    {
        try
        {
            decimal min = Convert.ToDecimal(txt_MinLaborRate.Text);
            decimal max = Convert.ToDecimal(txt_MaxLaborRate.Text);
            if (min < max)
            {
                int i = objNewThing.UpdatePrivateLaborRate(txt_MinLaborRate.Text, txt_MaxLaborRate.Text);
                if (i == 1)
                {
                    Response.Write("<script type = 'text/javascript'>alert('Labor rate is updated');</script>");
                }
            }
            else if (min > max || min > max)
            {
                Response.Write("<script type = 'text/javascript'>alert('Minimum Labor rate can not be greater or Equal then Maximum Labor rate');</script>");
            }
            ShowLaborRate();
        }
        catch (Exception ex)
        {
            Response.Write("<script type = 'text/javascript'>alert('Cost is not in Format(Exp.12.34)');</script>");
        }
    }
    public void ShowLaborRate()
    {
        DataTable dt = objNewThing.showPrivateLaborRate();
        if (dt.Rows.Count > 0)
        {
            txt_MinLaborRate.Text = Convert.ToString(dt.Rows[0]["MinLaborRate"]);
            if (txt_MinLaborRate.Text == "")
            {
                txt_MinLaborRate.Text = "0";
            }
            txt_MaxLaborRate.Text = Convert.ToString(dt.Rows[0]["MaxLaborRate"]);
            if (txt_MaxLaborRate.Text == "")
            {
                txt_MaxLaborRate.Text = "1";
            }
            hdn_txt_MinLaborRate.Value = txt_MinLaborRate.Text;
            hdn_txt_MaxLaborRate.Value = txt_MaxLaborRate.Text;
        }
    }
}