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

public partial class Admin_PrivateCategory : System.Web.UI.Page
{
    Dc_PrivateCategory objCat = new Dc_PrivateCategory();
    public static int Id = 0;
    int size = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowAllCategory();
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text != "ALL")
        {
            grdCategory.AllowPaging = true;
            size = int.Parse(DropDownList1.SelectedItem.Value.ToString());
            grdCategory.PageSize = size;
            ShowAllCategory();
        }
        else
        {
            grdCategory.AllowPaging = false;
            ShowAllCategory();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "Save")
        {
            int i = objCat.insertPrivateCategory(txtCategory.Text);
            if (i == 1)
            {
                Response.Write("<script type = 'text/javascript'>alert('Category is Inserted');</script>");
            }
            else if (i == -1)
            {
                Response.Write("<script type = 'text/javascript'>alert('Category Already Exixts');</script>");
            }
        }
        else if (btnSave.Text == "Update")
        {
            int i = objCat.UpdatePrivateCategorybyId(Id, txtCategory.Text);
            if (i == 1)
            {
                btnSave.Text = "Save";
                Response.Write("<script type = 'text/javascript'>alert('Category is Updated Successfully');</script>");
            }
        }
        Clear();
        ShowAllCategory();
    }

    public void ShowAllCategory()
    {
        DataTable dt = objCat.showAllPrivateCategory();
        grdCategory.DataSource = dt;
        grdCategory.DataBind();
    }

    public void Clear()
    {
        txtCategory.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
        if (btnSave.Text == "Update")
        {
            btnSave.Text = "Save";
        }
    }
    protected void grdCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        btnSave.Text = "Update";
        Id = Convert.ToInt32(grdCategory.DataKeys[e.RowIndex].Value.ToString());
        DataTable dt = objCat.showPrivateCategoryById(Id);
        if (dt.Rows.Count > 0)
        {
            txtCategory.Text = Convert.ToString(dt.Rows[0]["Category"].ToString());
        }
    }
    protected void grdCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int DeleteId = Convert.ToInt32(grdCategory.DataKeys[e.RowIndex].Value.ToString());
        int i = objCat.DeletePrivateCategorybyId(DeleteId);
        ShowAllCategory();
    }

    protected void grdCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCategory.PageIndex = e.NewPageIndex;
        ShowAllCategory();
    }
}
