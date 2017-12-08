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

public partial class Admin_AddUGISubcategory : System.Web.UI.Page
{
    CommonSubCategory objSubCat = new CommonSubCategory();
    CommonCategory objCat = new CommonCategory();
    int size = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_DDl_Category();
            showAllSubCategory();
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text != "ALL")
        {
            grdSubCategory.AllowPaging = true;
            size = int.Parse(DropDownList1.SelectedItem.Value.ToString());
            grdSubCategory.PageSize = size;
            showAllSubCategory();
        }
        else
        {
            grdSubCategory.AllowPaging = false;
            showAllSubCategory();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int i = objSubCat.insertUGISubCategory(Convert.ToInt32(DDl_Category.SelectedValue), txtSubCategory.Text);
        if (i == 1)
        {
            Response.Write("<script type = 'text/javascript'>alert('Subcategory is Inserted');</script>");
        }
        else if (i == -1)
        {
            Response.Write("<script type = 'text/javascript'>alert('Subcategory Already Exixts');</script>");
        }
        clear();
        showAllSubCategory();
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    public void clear()
    {
        txtSubCategory.Text = "";
        DDl_Category.SelectedIndex = 0;
    }
    protected void grdSubCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(grdSubCategory.DataKeys[e.RowIndex].Value.ToString());
        TextBox txt_U_SubCatName = (TextBox)grdSubCategory.Rows[e.RowIndex].FindControl("txt_G_SubCatName");
        int i = objSubCat.UpdateUGISubCategorybyId(id, txt_U_SubCatName.Text);
        grdSubCategory.EditIndex = -1;
        showAllSubCategory();
    }
    protected void grdSubCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(grdSubCategory.DataKeys[e.RowIndex].Value.ToString());
        int i = objSubCat.DeleteUGISubCategorybyId(id);
        showAllSubCategory();
    }
    public void showAllSubCategory()
    {
        DataTable dt = objSubCat.showAllUGISubCategory();
        grdSubCategory.DataSource = dt;
        grdSubCategory.DataBind();
    }
    public void Bind_DDl_Category()
    {
        DataTable dt = objCat.showAllUGICategory();
        DDl_Category.DataSource = dt;
        DDl_Category.DataTextField = "Category";
        DDl_Category.DataValueField = "CatID";
        DDl_Category.DataBind();
        DDl_Category.Items.Insert(0, "Select");
    }
    protected void grdSubCategory_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdSubCategory.EditIndex = e.NewEditIndex;
        showAllSubCategory();
    }
    protected void grdSubCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdSubCategory.EditIndex = -1;
        showAllSubCategory();
    }

    protected void grdSubCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdSubCategory.PageIndex = e.NewPageIndex;
        showAllSubCategory();
    }
}
