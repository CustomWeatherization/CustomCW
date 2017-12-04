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

public partial class Admin_PPlZoneAllThing : System.Web.UI.Page
{
    Dc_AddAllThing objNewThing = new Dc_AddAllThing();
    Dc_Category objCat = new Dc_Category();
    Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
    //Dc_SubCategory objSubCat = new Dc_SubCategory();
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
        int i = objNewThing.InsertZoneAllThing(Convert.ToInt32(DDl_Category.SelectedValue), Convert.ToInt32(DDl_MEASURE_DESCRIPTION.SelectedValue), txt_Location.Text, ddlTypeMeasure.SelectedItem.Text, txt_Liurp.Text, txt_Unit.Text, txt_LaborRate.Text, txt_CPU.Text);
        if (i == 1)
        {
            Response.Write("<script type = 'text/javascript'>alert('Record is Inserted');</script>");
        }
        DDl_MEASURE_DESCRIPTION.SelectedIndex = 0;
        ddlTypeMeasure.SelectedIndex = 0;
        txt_Location.Text = txt_Liurp.Text = txt_Unit.Text = txt_LaborRate.Text = txt_CPU.Text = "";
        ShowAllThing();
    }
    protected void DDl_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDl_Category.SelectedValue != "Select")
        {
            DataTable dt = objInvoice.ShowSubCatByCatId(Convert.ToInt32(DDl_Category.SelectedValue), "Admin", "");
            DDl_MEASURE_DESCRIPTION.DataSource = dt;
            DDl_MEASURE_DESCRIPTION.DataTextField = "SubCatName";
            DDl_MEASURE_DESCRIPTION.DataValueField = "SubCatId";
            DDl_MEASURE_DESCRIPTION.DataBind();
            DDl_MEASURE_DESCRIPTION.Items.Insert(0, "Select");
        }
    }
    public void bindCategory()
    {
        DataTable dt = objCat.showAllCategory();
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
        ddlTypeMeasure.SelectedIndex = 0;
        txt_Location.Text = txt_Liurp.Text = txt_Unit.Text = txt_LaborRate.Text = txt_CPU.Text = "";
    }
    public void ShowAllThing()
    {
        DataTable dt = objNewThing.showAllZoneThing();
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
      //  TextBox txt_U_SC = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_SC");
        DropDownList txt_U_SC = (DropDownList)grdAllThing.Rows[e.RowIndex].FindControl("ddlTypeMeasure");
        TextBox txt_U_liurpCode = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_liurpCode");
        TextBox txt_U_unit = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_unit");
        TextBox txt_U_laborRate = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_laborRate");
        TextBox txt_U_costPerUnit = (TextBox)grdAllThing.Rows[e.RowIndex].FindControl("txt_G_costPerUnit");
        if (txt_U_SC.SelectedItem.Text == "Select")
        {
            txt_U_SC.SelectedItem.Text = "";
        }
        int i = objNewThing.UpdateZoneAllThingbyId(RowId, "", txt_U_SC.SelectedItem.Text, txt_U_liurpCode.Text, txt_U_unit.Text, txt_U_laborRate.Text, txt_U_costPerUnit.Text);
        grdAllThing.EditIndex = -1;
        ShowAllThing();
    }

    protected void RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && grdAllThing.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlTypeMeasure = (DropDownList)e.Row.FindControl("ddlTypeMeasure");
            HiddenField hdnval = (HiddenField)e.Row.FindControl("hdnprice");
            //ddlTypeMeasure.Items.FindByValue((e.Row.FindControl("lblTypeMeasure") as Label).Text).Selected = true;
            if (hdnval.Value != null && hdnval.Value != "")
            {
                ddlTypeMeasure.Items.FindByValue(hdnval.Value.Trim()).Selected = true;
            }
            //else
            //{
            //    ddlTypeMeasure.SelectedItem.Text = "Select Type";
            //}
        }
    }

    protected void grdAllThing_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int RowId = Convert.ToInt32(grdAllThing.DataKeys[e.RowIndex].Value.ToString());
        int i = objNewThing.DeleteZoneAllThingbyId(RowId);
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


    protected void btn_UpdateLaborRate_Click(object sender, EventArgs e)
    {
        try
        {
            decimal min = Convert.ToDecimal(txt_MinLaborRate.Text);
            decimal max = Convert.ToDecimal(txt_MaxLaborRate.Text);
            if (min < max)
            {
                int i = objNewThing.UpdateLaborRate2(txt_MinLaborRate.Text, txt_MaxLaborRate.Text);
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
    protected void grdAllThing_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdAllThing.PageIndex = e.NewPageIndex;
        ShowAllThing();
    }

    public void ShowLaborRate()
    {
        DataTable dt = objNewThing.showLaborRate2();
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
    
        //function CalculateLineSC() {

        //    var SC = document.getElementById('<%=txt_SC.ClientID %>').value;
        //    if (SC != '') {
        //        if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
        //            alert('SC must be set to either  S  or  C  or  R  or  SC . ');
        //            document.getElementById('<%=txt_SC.ClientID %>').value = '';
        //        }
        //        else {
        //            document.getElementById('<%=txt_SC.ClientID %>').value = SC;
        //        }
        //    }
        //    else {
        //        alert('SC must be set to either  S  or  C  or  R  or  SC . ');
        //        document.getElementById('<%=txt_SC.ClientID %>').value = '';
        //    }

        //}
}
