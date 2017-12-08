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

public partial class Admin_MetedWarmPlusThings : System.Web.UI.Page
{
    Dc_Category objCat = new Dc_Category();
    Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
    Dc_AddAllThing objNewThing = new Dc_AddAllThing();
    int size = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
            ShowAllThing();
            ShowLaborRate();
        }
    }
    protected void btn_UpdateLaborRate_Click(object sender, EventArgs e)
    {
        try
        {
            decimal min = Convert.ToDecimal(txt_MinLaborRate.Text);
            int i = objNewThing.UpdateMetedLaborRate1(txt_MinLaborRate.Text);
            if (i == 1)
            {
                Response.Write("<script type = 'text/javascript'>alert('Labor rate is updated');</script>");
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
       // DataTable dt = objNewThing.showMetedLaborRate1();//No SP in DB, Similar SP found in DB
        DataTable dt = objNewThing.showMetedLaborRate();
        if (dt.Rows.Count > 0)
        {
            txt_MinLaborRate.Text = Convert.ToString(dt.Rows[0]["MinLaborRate"]);
            if (txt_MinLaborRate.Text == "")
            {
                txt_MinLaborRate.Text = "0";
            }
        }
    }

    public void BindCategory()
    {
        DataTable dt = objCat.showAllMetedCategory();
        DDl_Category.DataSource = dt;
        DDl_Category.DataTextField = "Category";
        DDl_Category.DataValueField = "CatID";
        DDl_Category.DataBind();
        DDl_Category.Items.Insert(0, "Select");
        DDl_Item.Items.Insert(0, "Select");
    }

    protected void DDl_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDl_Category.SelectedValue != "Select")
        {
            DataTable dt = objInvoice.Show_MetedSubCatByCatId(Convert.ToInt32(DDl_Category.SelectedValue));
            DDl_Item.DataSource = dt;
            DDl_Item.DataTextField = "SubCatName";
            DDl_Item.DataValueField = "SubCatId";
            DDl_Item.DataBind();
            DDl_Item.Items.Insert(0, "Select");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string labor, Cost, Material, THW, TW;
        labor = txtLabor.Text;
        Cost = txtCost.Text;
        Material = txtMaterial.Text;
        THW = txtTHW.Text;
        TW = txtTW.Text;

        if (labor == "")
        {
            labor = "0.00";
        }
        if (Cost == "")
        {
            Cost = "0.00";
        }
        if (Material == "")
        {
            Material = "0.00";
        }
        if (THW == "")
        {
            THW = "0.00";
        }
        if (TW == "")
        {
            TW = "0.00";
        }
        int i = objNewThing.InsertAllMetedWarmPlusThing(Convert.ToInt32(DDl_Category.SelectedValue), Convert.ToInt32(DDl_Item.SelectedValue), txtCode.Text, labor, Material, Cost, txtLocation.Text, THW, TW);
        if (i == 1)
        {
            Response.Write("<script type = 'text/javascript'>alert('Record is Inserted');</script>");
        }
        DDl_Item.SelectedIndex = 0;
        txtCode.Text = txtLabor.Text = txtMaterial.Text = txtCost.Text = txtLocation.Text = txtTHW.Text = txtTW.Text = "";
        ShowAllThing();
    }
    public void ShowAllThing()
    {
        DataTable dt = objNewThing.showAllMetedWarmPlusThing();
        grdAllMetedThing.DataSource = dt;
        grdAllMetedThing.DataBind();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        DDl_Item.SelectedIndex = 0;
        txtCode.Text = txtLabor.Text = txtMaterial.Text = txtCost.Text = txtLocation.Text = txtTHW.Text = txtTW.Text = "";
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text != "ALL")
        {
            grdAllMetedThing.AllowPaging = true;
            size = int.Parse(DropDownList1.SelectedItem.Value.ToString());
            grdAllMetedThing.PageSize = size;
            ShowAllThing();
        }
        else
        {
            grdAllMetedThing.AllowPaging = false;
            ShowAllThing();
        }
    }
    protected void grdAllMetedThing_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdAllMetedThing.PageIndex = e.NewPageIndex;
        ShowAllThing();
    }
    protected void grdAllMetedThing_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdAllMetedThing.EditIndex = -1;
        ShowAllThing();
    }
    protected void grdAllMetedThing_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int RowId = Convert.ToInt32(grdAllMetedThing.DataKeys[e.RowIndex].Value.ToString());
        int i = objNewThing.DeleteAllMetedThingWarmPlusbyId(RowId);
        ShowAllThing();
    }
    protected void grdAllMetedThing_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdAllMetedThing.EditIndex = e.NewEditIndex;
        ShowAllThing();
    }
    protected void grdAllMetedThing_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int RowId = Convert.ToInt32(grdAllMetedThing.DataKeys[e.RowIndex].Value.ToString());
        TextBox txt_U_Code = (TextBox)grdAllMetedThing.Rows[e.RowIndex].FindControl("txt_G_Code");
        TextBox txt_U_Labor = (TextBox)grdAllMetedThing.Rows[e.RowIndex].FindControl("txt_G_Labor");
        TextBox txt_U_Material = (TextBox)grdAllMetedThing.Rows[e.RowIndex].FindControl("txt_G_Material");
        TextBox txt_U_Location = (TextBox)grdAllMetedThing.Rows[e.RowIndex].FindControl("txt_G_Location");
        TextBox txt_U_Cost = (TextBox)grdAllMetedThing.Rows[e.RowIndex].FindControl("txt_G_Cost");
        TextBox txt_G_THW = (TextBox)grdAllMetedThing.Rows[e.RowIndex].FindControl("txt_G_THW");
        TextBox txt_G_TW = (TextBox)grdAllMetedThing.Rows[e.RowIndex].FindControl("txt_G_TW");
        int i = objNewThing.UpdateAllMetedWarmPlusThingbyId(RowId, txt_U_Code.Text, txt_U_Labor.Text, txt_U_Material.Text, txt_U_Cost.Text, txt_U_Location.Text, txt_G_THW.Text, txt_G_TW.Text);
        grdAllMetedThing.EditIndex = -1;
        ShowAllThing();
    }
}