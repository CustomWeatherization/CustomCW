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

public partial class Admin_ViewUserDetails : System.Web.UI.Page
{
    public DataTable dt = new DataTable();
    // DataView dv = new DataView();
    Dc_Category objCat = new Dc_Category();
    int size = 0;
    static string Active = "A";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindEmplyeelist();          
            div_drop.Visible = false;
            ViewAllUserDetailsApprove();
        }
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text != "ALL")
        {
            grdCategory.AllowPaging = true;
            size = int.Parse(DropDownList1.SelectedItem.Value.ToString());
            grdCategory.PageSize = size;
           // ViewAllUserDetails();
        }
        else
        {
            grdCategory.AllowPaging = false;
          //  ViewAllUserDetails();
        }
        if (Active == "A")
        {
            ViewAllUserDetailsApprove();
        }
        else
        {
            ViewAllUserDetailsDeactivated();
        }
    }

    public void ViewAllUserDetailsApprove()
    {
        string emplyeeId = DDL_Employee.SelectedItem.Value.ToString();

        DataTable dt1 = new DataTable();
        if (emplyeeId == "All")
        {
            dt1 = objCat.ViewAllUserStatusDetails("Active");
        }
        else
        {
            dt1 = objCat.ViewAllUserStatusDetails(emplyeeId, "Active");

        }
        grdCategory.DataSource = dt1;
        grdCategory.DataBind();

    }

    public void ViewAllUserDetailsDeactivated()
    {
        string emplyeeId = DDL_Employee.SelectedItem.Value.ToString();

        DataTable dt1 = new DataTable();
        if (emplyeeId == "All")
        {
            dt1 = objCat.ViewAllUserStatusDetails("Deactivated");
        }
        else
        {
            dt1 = objCat.ViewAllUserStatusDetails(emplyeeId, "Deactivated");

        }
        grdCategory.DataSource = dt1;
        grdCategory.DataBind();

    }


    public void BindEmplyeelist()
    {
       
        DataTable dt1 = new DataTable();

        dt1 = objCat.ViewAllUserDetails();

        DDL_Employee.DataSource = dt1;
        DDL_Employee.DataTextField = "Name";
        DDL_Employee.DataValueField = "CWLogin";
        DDL_Employee.DataBind();
        DDL_Employee.Items.Insert(0, "All");
    }
    protected void btnActive_Click(object sender, EventArgs e)
    {
        Active = "A";
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnNotPay.Attributes.Add("class", "paidBtn");     

        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnPay.Attributes.Add("class", "paidBtnDis");
       // ViewAllUserDetails();
        ViewAllUserDetailsApprove();
    }
    protected void btnDeactive_Click(object sender, EventArgs e)
    {
        Active = "D";
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnNotPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnNotPay.Attributes.Add("class", "paidBtnDis");
     
        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtn", "");
        btnPay.CssClass = btnNotPay.CssClass.Replace("paidBtnDis", "");
        btnPay.Attributes.Add("class", "paidBtn");
      //  ViewAllUserDetails();
        ViewAllUserDetailsDeactivated();

    }
    protected void DDL_Employee_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Active == "A")
        {
            ViewAllUserDetailsApprove();
        }
        else
        {
            ViewAllUserDetailsDeactivated();
        }
    }

    protected void grdCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCategory.PageIndex = e.NewPageIndex;
        if (Active == "A")
        {
            ViewAllUserDetailsApprove();
        }
        else
        {
            ViewAllUserDetailsDeactivated();
        }
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
            if (Active == "A")
            {
                ViewAllUserDetailsApprove();
            }
            else
            {
                ViewAllUserDetailsDeactivated();
            }
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
            if (Active == "A")
            {
                ViewAllUserDetailsApprove();
            }
            else
            {
                ViewAllUserDetailsDeactivated();
            }
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
            if (Active == "A")
            {
                ViewAllUserDetailsApprove();
            }
            else
            {
                ViewAllUserDetailsDeactivated();
            }
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
            if (Active == "A")
            {
                ViewAllUserDetailsApprove();
            }
            else
            {
                ViewAllUserDetailsDeactivated();
            }
        }
        else
        {
            Response.Write("<script>alert('Not Deactivated.')</script>");
        }
    }

    // end

    protected void img_View_Click(object sender, EventArgs e)
    {
      
        ImageButton lnk = sender as ImageButton;
        GridViewRow grd = (GridViewRow)lnk.NamingContainer;
        int ID = Convert.ToInt32(lnk.CommandArgument.ToString());
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
        string InvNO1 = ddl_invoice.SelectedItem.ToString();
        string InvNO = InvNO1.Substring(11);
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
     //  dt = objCat.Show_Pop(EID);
        dt = objCat.ViewUserShow_Pop(EID);
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

        bool msg = objCat.Upd_pop(hid_Id.Value, firstname, lastname, txt_pwd.Text, txt_phone.Text, txt_add.Text, txt_city.Text, txt_state.Text, txt_zip.Text);
        if (msg == true)
        {
            Response.Write("<script>alert('Update Successfully.')</script>");
            if (Active == "A")
            {
                ViewAllUserDetailsApprove();
            }
            else
            {
                ViewAllUserDetailsDeactivated();
            }
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
            if (Active == "A")
            {
                ViewAllUserDetailsApprove();
            }
            else
            {
                ViewAllUserDetailsDeactivated();
            }
        }
        else
            Response.Write("<script>alert('Failed')</script>");
    }
    protected void grdCategory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the DropDownList in the Row
            Image imgProfileImage = (Image)e.Row.FindControl("imgProfileImage");

            if (imgProfileImage.ImageUrl == "")
            {
               // string image = Server.MapPath("Upload/noImage.png");
                string image = "Upload/noImage.png";
                imgProfileImage.ImageUrl =image;
            }
            Label lbl = (Label)e.Row.FindControl("lbl_Login");
            Label lblTotalHours = (Label)e.Row.FindControl("lblTotalHours");
            Label Manager = (Label)e.Row.FindControl("lblManager");
            HiddenField maxVacHours = (HiddenField)e.Row.FindControl("hdnTotalMaxHours");
            string loginid = lbl.Text;
            DropDownList ddlCountries = (e.Row.FindControl("ddl_status") as DropDownList);
            DataSet ds = new DataSet();
            ds = GetData("select CWPermissionLevel from  Users where CWLogin='" + loginid + "'");
            ddlCountries.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["CWPermissionLevel"]);
            if (maxVacHours.Value == "" || maxVacHours.Value == "0")
            {
              //  lblTotalHours.Text = "0 Hr. Taken" + "<br/> " + "0 Hr. On Balance -" + "<br/> " + "0 Hr. Pending -" + "<br/>" + " 0 Hr. Approved =<br/> " + "0 Hr. Available";
                lblTotalHours.Text = "0 Hr. Used" + "<br/> "  + "0 Hr. Pending -" + "<br/>" + " 0 Hr. Approved -<br/> " + "0 Hr. Available";                
            }
            else
            {
                DataSet ds1 = new DataSet();              
                //ds1 = GetData("select sum(datediff(minute, 0, TotalHours)) / 60 as Pending from  EmployeeLeave EI inner join User_registration UR on UR.Login=EI.LoginID where Login='" + lbl.Text + "' and EI.Status='Pending'");
                ds1 = GetData("select sum(TotalHours) as Pending from  EmployeeLeave EI inner join User_registration UR on UR.Login=EI.LoginID where Login='" + lbl.Text + "' and EI.Status='Pending' and TypeOfRequesteType not in ('Unpaid','Unpaid Sickness','Emergency Paid Time Off','Holiday Pay')");
                DataSet ds2 = new DataSet();
                ds2 = GetData("select sum(TotalHours) as Approve from  EmployeeLeave EI inner join User_registration UR on UR.Login=EI.LoginID where Login='" + lbl.Text + "' and EI.Status='Approve' and TypeOfRequesteType not in ('Unpaid','Unpaid Sickness','Emergency Paid Time Off','Holiday Pay')");
                string PendingHours = Convert.ToString(ds1.Tables[0].Rows[0]["Pending"]);
                string ApproveHours = Convert.ToString(ds2.Tables[0].Rows[0]["Approve"]);
                string MaxVacationHours = maxVacHours.Value;
                // string approvedHours = "0";

                double TotalHours = 0.0;
                if (PendingHours != "" && ApproveHours != "")
                {
                    TotalHours = Convert.ToDouble(MaxVacationHours) - Convert.ToDouble(PendingHours) - Convert.ToDouble(ApproveHours);
                }
                else if (PendingHours == "" && ApproveHours != "")
                {
                    PendingHours = "0";
                    TotalHours = Convert.ToDouble(MaxVacationHours) - 0 - Convert.ToDouble(ApproveHours);
                }
                else if (PendingHours != "" && ApproveHours == "")
                {
                    ApproveHours = "0";
                    TotalHours = Convert.ToDouble(MaxVacationHours) - Convert.ToDouble(PendingHours) - 0;
                }
                else
                {
                    PendingHours = "0";
                    ApproveHours = "0";
                    TotalHours = Convert.ToDouble(MaxVacationHours) - 0 - 0;

                }
                double TotalHoursTaken = Convert.ToDouble(MaxVacationHours) - TotalHours;

                lblTotalHours.Text = TotalHoursTaken + " " + "Hr. Used " + "<br/> "+ PendingHours + " " + "Hr. Pending -" + "<br/> " + ApproveHours + " " + "Hr. Approved - <br/>" + TotalHours + " " + "Hr. Available";
            }
            if (Manager.Text == "" || Manager.Text == null||  Manager.Text =="Select Manager")
            {
                Manager.Text = "-";
            }

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
        DropDownList ddl = sender as DropDownList;
        GridViewRow row = ddl.NamingContainer as GridViewRow;
        string ID = ((Label)row.FindControl("lbl_Login")).Text;
        bool msg = objCat.DDLStatus(ID, ddl.SelectedValue.ToString());
        if (msg == true)
        {
            Response.Write("<script>alert('Update Successfully.')</script>");
          //  ShowAllUser();
            if (Active == "A")
            {
                ViewAllUserDetailsApprove();
            }
            else
            {
                ViewAllUserDetailsDeactivated();
            }
        }
        else
            Response.Write("<script>alert('Failed')</script>");
    }
}
