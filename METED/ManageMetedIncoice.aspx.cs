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

public partial class METED_ManageMetedIncoice : System.Web.UI.Page
{
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    public decimal FinalTotal;
    public static int count = 0;
    Dc_Category objCat = new Dc_Category();
    Dc_AddAllThing objAllThing = new Dc_AddAllThing();
    Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
    public static int CatId = 0;
    public static int Invoice_RowId = 0;
    public static string DelRowId = "";
    public static DataTable dt_ShowDemoInvoice = new DataTable();
    public DataTable uniqueCols = new DataTable();
    public DataTable dt_1 = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            count = 0;
            MakeDataTableForInsert();
            ShowAllCategory();
            ShowDataN(Request.QueryString["Jobs"].ToString());
            ViewStatePageLoad();
            GetCompletedDate(Request.QueryString["Jobs"].ToString());
        }
    }




    public void MakeDataTableForInsert()
    {
        DataTable dt_Insert = new DataTable();
        dt_Insert.Columns.Add("InvoiceRowId", typeof(int));
        dt_Insert.Columns.Add("NoOfInvoice", typeof(int));
        dt_Insert.Columns.Add("catId", typeof(int));
        dt_Insert.Columns.Add("SubCategory", typeof(string));
        dt_Insert.Columns.Add("Location", typeof(string));
        dt_Insert.Columns.Add("SC", typeof(string));
        dt_Insert.Columns.Add("LiurpCode", typeof(string));
        dt_Insert.Columns.Add("Unit", typeof(string));
        dt_Insert.Columns.Add("LaborRate", typeof(string));
        dt_Insert.Columns.Add("CostPerUnit", typeof(string));
        dt_Insert.Columns.Add("THW", typeof(string));
        dt_Insert.Columns.Add("TMC", typeof(string));
        dt_Insert.Columns.Add("QTY", typeof(string));
        dt_Insert.Columns.Add("Total", typeof(string));
        dt_Insert.Columns.Add("RowType", typeof(string));
        dt_Insert.Columns.Add("JobNumber", typeof(string));
        dt_Insert.Columns.Add("UserId", typeof(string));
        dt_Insert.Columns.Add("SwapId", typeof(int));
        dt_Insert.Columns.Add("Utility", typeof(int));
        dt_Insert.Columns.Add("submit_date", typeof(string));
        dt_Insert.Columns.Add("Rad_btn", typeof(string));
        dt_Insert.Columns.Add("SubCatId", typeof(int));
        dt_Insert.Columns.Add("LR", typeof(string));
        dt_Insert.AcceptChanges();
        ViewState["InsertTable"] = dt_Insert;
    }

    public void ViewStatePageLoad()
    {
        DataTable dt = objInvoice.ViewState_PageLoad(Request.QueryString["Jobs"].ToString(), Convert.ToInt32(Request.QueryString["InvoiceNo"]), Convert.ToInt32(Request.QueryString["Utility"]));
        ViewState["InvoiceTable"] = dt;
        string subDate = "";
        if (dt.Rows.Count > 0)
        {
            subDate = Convert.ToString(dt.Rows[0]["submit_date"]);
            txt_cal.Text = subDate;
        }
        abc();
    }

    public void ShowAllCategory()
    {
        DataTable dt = objCat.showAllMetedCategory();
        rptr.DataSource = dt;
        rptr.DataBind();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "Update Row")
        {
            btnSave.Text = "Add Row";
            DDl_MEASURE_DESCRIPTION.Items.Clear();
            trEdirLocation.Visible = false;
            rdo_Custom.Checked = false;
            rdo_Standard.Checked = true;
            courier.Style.Add("display", "none");
            txt_MEASURE_DESCRIPTION.Style.Add("display", "none");
            DDl_MEASURE_DESCRIPTION.Style.Add("display", "block");
            txt_MEASURE_DESCRIPTION.Text = txt_Qty.Text = txt_Location.Text = txt_Discription.Text = txt_Liurp.Text = txt_Cost.Text = txt_Total.Text = txt_Labor.Text = txt_Material.Text = "";
            txtEditDescription.Text = txtEditCost.Text = txtEditLabor.Text = txtEditLocation.Text = txtEditMaterial.Text = txtEditTotal.Text = "";
            BindSubCatDDL(CatId);
        }
    }
    protected void lnkAudit_Click(object sender, EventArgs e)
    {
        string jobnumber = Request.QueryString["jobs"].ToString();

        if (jobnumber != "")
        {
            DataTable dtU = objNewJob.ShowJobByJobNumber_ByJobNumber(jobnumber);
            ViewState["DateAssigned"]  = Convert.ToDateTime(dtU.Rows[0]["DateAssigned"]).ToString("MM/dd/yyyy");
            if (Convert.ToDateTime(ViewState["DateAssigned"]) >= new DateTime(2016, 11, 1, 0, 0, 0))
            {
               // Response.Redirect("NewMETED/METED_Audit_Page1.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
                Response.Redirect("../NewMETED/METED_Audit_Page1.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
            }
            else
            {
                Response.Redirect("METED_Audit_Page1.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
                //Response.Redirect("METED/METED_Audit_Page1.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
            }
        }
  
    }

    public void rptr_ItemCommand(Object Sender, RepeaterCommandEventArgs e)
    {
        courier.Style.Add("display", "none");
        txt_MEASURE_DESCRIPTION.Style.Add("display", "none");
        DDl_MEASURE_DESCRIPTION.Style.Add("display", "block");
        btnSave.Text = "Add Row";
        txt_Qty.Text = "";
        txtEditDescription.Text = txtEditCost.Text = txtEditLabor.Text = txtEditLocation.Text = txtEditMaterial.Text = txtEditTotal.Text = "";
        trEdirLocation.Visible = false;
        rdo_Custom.Checked = false;
        rdo_Standard.Checked = true;
        CatId = Convert.ToInt32(e.CommandArgument.ToString());
        BindSubCatDDL(CatId);
        abc();
    }
    public void BindSubCatDDL(int Cat_Id)
    {
        DataTable dt = objInvoice.ShowMetedSubCatByCatId(CatId, Convert.ToString(Request.QueryString["Jobs"]));
        DDl_MEASURE_DESCRIPTION.DataSource = dt;
        DDl_MEASURE_DESCRIPTION.DataTextField = "SubCatName";
        DDl_MEASURE_DESCRIPTION.DataValueField = "SubCatId";
        DDl_MEASURE_DESCRIPTION.DataBind();
        DDl_MEASURE_DESCRIPTION.Items.Insert(0, "Select");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        smUtil objSm = new smUtil();
        string Uid = Convert.ToString(objSm.GetCookie("UId"));
        int SubCatId = 0;
        int NoOfInvoice = 0;
        string Location, SC, LiurpCode, Unit, LaborRate, CostPerUnit, QTY, Total, RowType, JobNumber, THW, TMC, SubCatName, Desc, LR;
        Location = SC = LiurpCode = Unit = LaborRate = CostPerUnit = QTY = Total = RowType = JobNumber = THW = TMC = SubCatName = Desc = LR = "";
        DataTable dt_Fill = new DataTable();

        if (rdo_Standard.Checked == true)
        {
            SubCatId = Convert.ToInt32(DDl_MEASURE_DESCRIPTION.SelectedValue);
            dt_Fill = objInvoice.showMetedAllThingByCatId_SubCatId(CatId, SubCatId, Convert.ToString(ViewState["WarmOrWarmPlus"]));
            if (dt_Fill.Rows.Count > 0)
            {
                RowType = "S";
                LiurpCode = txtCode.Text;
                LaborRate = txtEditLabor.Text;
                CostPerUnit = txtEditMaterial.Text;
                Unit = txtEditCost.Text;
                QTY = txt_Qty.Text;
                Total = hdntxtEditTotal.Value;
                THW = txtEditTHW.Text;
                TMC = txtEditTW.Text;
                NoOfInvoice = Convert.ToInt32(Request.QueryString["InvoiceNo"]);
                JobNumber = Convert.ToString(Request.QueryString["Jobs"]);

                SubCatName = Convert.ToString(DDl_MEASURE_DESCRIPTION.SelectedItem);
                int lenghth = Convert.ToInt32(SubCatName.Length);
                var pos = 2 + (SubCatName.IndexOf('-'));
                SubCatName = SubCatName.Substring(pos, lenghth - pos);
                pos = (SubCatName.IndexOf('$')) - 3;
                SubCatName = SubCatName.Substring(0, pos);
                SubCatId = Convert.ToInt32(DDl_MEASURE_DESCRIPTION.SelectedValue);
                LR = txt_LaborRate.Text;
                Desc = txtEditDescription.Text;
                Location = txtEditLocation.Text;
            }
            else
            {
                txt_Qty.Text = "";
                DDl_MEASURE_DESCRIPTION.SelectedIndex = 0;
                Response.Write("<script>alert('Please select another CATEGORY or ITEM');</script>");
            }

        }
        else if (rdo_Custom.Checked == true)
        {
            RowType = "C";
            Location = txt_Location.Text;
            //SC = txt_SC.Text;
            LiurpCode = txt_Liurp.Text;
            Unit = txt_Cost.Text;
            LaborRate = txt_Labor.Text;
            NoOfInvoice = Convert.ToInt32(Request.QueryString["InvoiceNo"]);
            JobNumber = Convert.ToString(Request.QueryString["Jobs"]);
            //THW = txt_THW.Text;
            //TMC = txt_TMC.Text;
            CostPerUnit = txt_Material.Text;
            SubCatName = txt_MEASURE_DESCRIPTION.Text;
            Desc = txt_Discription.Text;
            QTY = txt_Qty.Text;
            Total = txt_Total.Text;
            Total = Total.Replace('$', ' ');
            txt_Liurp.Text = txt_Labor.Text = txt_Material.Text = txt_MEASURE_DESCRIPTION.Text = txt_Discription.Text = txt_Qty.Text = txt_Location.Text = txt_Cost.Text = txt_Total.Text = "";
        }
        if (btnSave.Text == "Add Row")
        {
            DataTable dt = (DataTable)ViewState["InvoiceTable"];
            string subDate = "";
            if (dt.Rows.Count > 0)
            {
                subDate = Convert.ToString(dt.Rows[0]["submit_date"]);
                txt_cal.Text = subDate;
            }
            DataRow row_Int = dt.NewRow();
            DataTable dt_no = objInvoice.NoOfRecord(JobNumber);
            int RoId = Convert.ToInt32(dt_no.Rows[0]["InvoiceRowId"]);
            if (count == 0)
            {
                count = RoId + 1;
            }
            else
            {
                count = count + 1;
            }
            string UsrId = Convert.ToString(dt_no.Rows[0]["UsrID"]);
            DataTable dt_Insert = (DataTable)ViewState["InsertTable"];
            DataRow rowInt = dt_Insert.NewRow();
            rowInt["InvoiceRowId"] = count;
            rowInt["NoOfInvoice"] = NoOfInvoice;
            rowInt["catId"] = CatId;
            rowInt["SubCategory"] = SubCatName;
            rowInt["Location"] = Location;
            rowInt["SC"] = SC;
            rowInt["LiurpCode"] = LiurpCode;
            rowInt["Unit"] = Unit;
            rowInt["LaborRate"] = LaborRate;
            rowInt["CostPerUnit"] = CostPerUnit;
            rowInt["THW"] = THW;
            rowInt["TMC"] = TMC;
            rowInt["QTY"] = QTY;
            rowInt["Total"] = Total;
            rowInt["RowType"] = RowType;
            rowInt["JobNumber"] = JobNumber;
            rowInt["UserId"] = UsrId;
            rowInt["SwapId"] = 0;
            rowInt["Utility"] = Convert.ToInt32(Request.QueryString["Utility"]);
            rowInt["submit_date"] = subDate;
            rowInt["Rad_btn"] = Desc;
            rowInt["SubCatId"] = SubCatId;
            rowInt["LR"] = LR;
            dt_Insert.Rows.Add(rowInt);
            dt_Insert.AcceptChanges();
            ViewState["InsertTable"] = dt_Insert;


            row_Int["InvoiceRowId"] = count;
            row_Int["NoOfInvoice"] = NoOfInvoice;
            row_Int["catId"] = CatId;
            row_Int["SubCategory"] = SubCatName;
            row_Int["Location"] = Location;
            row_Int["SC"] = SC;
            row_Int["LiurpCode"] = LiurpCode;
            row_Int["Unit"] = Unit;
            row_Int["LaborRate"] = LaborRate;
            row_Int["CostPerUnit"] = CostPerUnit;
            row_Int["THW"] = THW;
            row_Int["TMC"] = TMC;
            row_Int["QTY"] = QTY;
            row_Int["Total"] = Total;
            row_Int["RowType"] = RowType;
            row_Int["JobNumber"] = JobNumber;
            row_Int["UserId"] = UsrId;
            row_Int["SwapId"] = 0;
            row_Int["Utility"] = Convert.ToInt32(Request.QueryString["Utility"]);
            row_Int["submit_date"] = subDate;
            row_Int["Rad_btn"] = Desc;
            row_Int["SubCatId"] = SubCatId;
            row_Int["LR"] = LR;
            dt.Rows.Add(row_Int);
            dt.AcceptChanges();
            ViewState["InvoiceTable"] = dt;
            abc();

            //catgorder work
            if (ViewState["catGOrder"] == null)
            { createCatgOrder(); }
            DataTable dt_CatgOrder = (DataTable)ViewState["catGOrder"];
            //DataTable dt_CatgOrder = createCatgOrder();
            DataRow rowCatgOrder = dt_CatgOrder.NewRow();
            rowCatgOrder["catId"] = CatId;
            rowCatgOrder["InvoiceNo"] = Convert.ToInt32(Request.QueryString["InvoiceNo"]); ;
            rowCatgOrder["JobNum"] = Convert.ToString(Request.QueryString["Jobs"]);
            dt_CatgOrder.Rows.Add(rowCatgOrder);
            ViewState["catGOrder"] = dt_CatgOrder;


            txtCode.Text = txtEditLabor.Text = txtEditMaterial.Text = txtEditCost.Text = txt_Qty.Text = txtEditTotal.Text = txtEditDescription.Text = txtEditLocation.Text;
            trEdirLocation.Visible = false;
        }
        else if (btnSave.Text == "Update Row")
        {
            int i = 0;
            DataTable dt_Insert = (DataTable)ViewState["InsertTable"];
            if (rdo_Standard.Checked == true && dt_Fill.Rows.Count > 0)
            {
                //i = objInvoice.UpdateInvoice(NoOfInvoice, CatId, SubCatName, THW, TMC, Location, SC, LiurpCode, Unit, LaborRate, CostPerUnit, QTY, Total, RowType, JobNumber, Uid, Invoice_RowId);
                DataTable dt = (DataTable)ViewState["InvoiceTable"];
                for (int j = dt.Rows.Count - 1; j >= 0; j--)
                {
                    // whatever your criteria is
                    if (Convert.ToInt32(dt.Rows[j]["InvoiceRowId"]) == Invoice_RowId)
                    {

                        LaborRate = txtEditLabor.Text;
                        CostPerUnit = txtEditMaterial.Text;
                        QTY = txt_Qty.Text;
                        //decimal srt = Convert.ToDecimal(CostPerUnit) + Convert.ToDecimal(LaborRate);
                        //srt = srt * Convert.ToDecimal(QTY);
                        //Total = Convert.ToString(txtEditTotal.Text);
                        Location = txtEditLocation.Text;
                        Unit = txtEditCost.Text;
                        dt.Rows[j]["NoOfInvoice"] = NoOfInvoice;
                        dt.Rows[j]["catId"] = CatId;
                        dt.Rows[j]["SubCategory"] = SubCatName;
                        dt.Rows[j]["THW"] = THW;
                        dt.Rows[j]["TMC"] = TMC;
                        dt.Rows[j]["Location"] = Location;
                        dt.Rows[j]["SC"] = SC;
                        dt.Rows[j]["LiurpCode"] = LiurpCode;
                        dt.Rows[j]["Unit"] = Unit;
                        dt.Rows[j]["LaborRate"] = LaborRate;
                        dt.Rows[j]["CostPerUnit"] = CostPerUnit;
                        dt.Rows[j]["QTY"] = QTY;
                        dt.Rows[j]["Total"] = Total;
                        dt.Rows[j]["RowType"] = RowType;
                        dt.Rows[j]["JobNumber"] = JobNumber;
                        dt.Rows[j]["UserId"] = Uid;
                        dt.Rows[j]["Rad_btn"] = txtEditDescription.Text;
                        dt.Rows[j]["SubCatId"] = SubCatId;
                        dt.Rows[j]["LR"] = LR;
                        i = 1;
                        break;
                    }
                }
                for (int j = dt_Insert.Rows.Count - 1; j >= 0; j--)
                {
                    // whatever your criteria is
                    if (Convert.ToInt32(dt_Insert.Rows[j]["InvoiceRowId"]) == Invoice_RowId)
                    {
                        dt_Insert.Rows[j]["NoOfInvoice"] = NoOfInvoice;
                        dt_Insert.Rows[j]["catId"] = CatId;
                        dt_Insert.Rows[j]["SubCategory"] = SubCatName;
                        dt_Insert.Rows[j]["THW"] = THW;
                        dt_Insert.Rows[j]["TMC"] = TMC;
                        dt_Insert.Rows[j]["Location"] = Location;
                        dt_Insert.Rows[j]["SC"] = SC;
                        dt_Insert.Rows[j]["LiurpCode"] = LiurpCode;
                        dt_Insert.Rows[j]["Unit"] = Unit;
                        dt_Insert.Rows[j]["LaborRate"] = LaborRate;
                        dt_Insert.Rows[j]["CostPerUnit"] = CostPerUnit;
                        dt_Insert.Rows[j]["QTY"] = QTY;
                        dt_Insert.Rows[j]["Total"] = Total;
                        dt_Insert.Rows[j]["RowType"] = RowType;
                        dt_Insert.Rows[j]["JobNumber"] = JobNumber;
                        dt_Insert.Rows[j]["UserId"] = Uid;
                        dt_Insert.Rows[j]["Rad_btn"] = Desc;
                        dt_Insert.Rows[j]["SubCatId"] = SubCatId;
                        dt_Insert.Rows[j]["LR"] = LR;
                        i = 1;
                        break;
                    }
                }

                dt_Insert.AcceptChanges();
                dt.AcceptChanges();
                ViewState["InvoiceTable"] = dt;
                ViewState["InsertTable"] = dt_Insert;
            }
            else if (rdo_Custom.Checked == true)
            {
                //i = objInvoice.UpdateInvoice(NoOfInvoice, CatId, SubCatName, THW, TMC, Location, SC, LiurpCode, Unit, LaborRate, CostPerUnit, QTY, Total, RowType, JobNumber, Uid, Invoice_RowId);
                DataTable dt = (DataTable)ViewState["InvoiceTable"];
                for (int j = dt.Rows.Count - 1; j >= 0; j--)
                {
                    // whatever your criteria is
                    if (Convert.ToInt32(dt.Rows[j]["InvoiceRowId"]) == Invoice_RowId)
                    {
                        dt.Rows[j]["NoOfInvoice"] = NoOfInvoice;
                        dt.Rows[j]["catId"] = CatId;
                        dt.Rows[j]["SubCategory"] = SubCatName;
                        dt.Rows[j]["THW"] = THW;
                        dt.Rows[j]["TMC"] = TMC;
                        dt.Rows[j]["Location"] = Location;
                        dt.Rows[j]["SC"] = SC;
                        dt.Rows[j]["LiurpCode"] = LiurpCode;
                        dt.Rows[j]["Unit"] = Unit;
                        dt.Rows[j]["LaborRate"] = LaborRate;
                        dt.Rows[j]["CostPerUnit"] = CostPerUnit;
                        dt.Rows[j]["QTY"] = QTY;
                        dt.Rows[j]["Total"] = Total;
                        dt.Rows[j]["RowType"] = RowType;
                        dt.Rows[j]["JobNumber"] = JobNumber;
                        dt.Rows[j]["UserId"] = Uid;
                        dt.Rows[j]["Rad_btn"] = Desc;
                        dt.Rows[j]["SubCatId"] = 0;
                        dt.Rows[j]["LR"] = LR;
                        i = 1;
                        break;
                    }
                }
                for (int j = dt_Insert.Rows.Count - 1; j >= 0; j--)
                {
                    // whatever your criteria is
                    if (Convert.ToInt32(dt_Insert.Rows[j]["InvoiceRowId"]) == Invoice_RowId)
                    {
                        dt_Insert.Rows[j]["NoOfInvoice"] = NoOfInvoice;
                        dt_Insert.Rows[j]["catId"] = CatId;
                        dt_Insert.Rows[j]["SubCategory"] = SubCatName;
                        dt_Insert.Rows[j]["THW"] = THW;
                        dt_Insert.Rows[j]["TMC"] = TMC;
                        dt_Insert.Rows[j]["Location"] = Location;
                        dt_Insert.Rows[j]["SC"] = SC;
                        dt_Insert.Rows[j]["LiurpCode"] = LiurpCode;
                        dt_Insert.Rows[j]["Unit"] = Unit;
                        dt_Insert.Rows[j]["LaborRate"] = LaborRate;
                        dt_Insert.Rows[j]["CostPerUnit"] = CostPerUnit;
                        dt_Insert.Rows[j]["QTY"] = QTY;
                        dt_Insert.Rows[j]["Total"] = Total;
                        dt_Insert.Rows[j]["RowType"] = RowType;
                        dt_Insert.Rows[j]["JobNumber"] = JobNumber;
                        dt_Insert.Rows[j]["UserId"] = Uid;
                        dt_Insert.Rows[j]["Rad_btn"] = Desc;
                        dt_Insert.Rows[j]["SubCatId"] = 0;
                        dt_Insert.Rows[j]["LR"] = LR;
                        i = 1;
                        break;
                    }
                }
                dt_Insert.AcceptChanges();
                dt.AcceptChanges();
                ViewState["InvoiceTable"] = dt;
                ViewState["InsertTable"] = dt_Insert;
            }
            else
            {
                rdo_Custom.Checked = true;
            }
            if (i == 1)
            {
                btnSave.Text = "Add Row";
                trEdirLocation.Visible = false;
                rdo_Custom.Checked = false;
                rdo_Standard.Checked = true;
                courier.Style.Add("display", "none");
                txt_MEASURE_DESCRIPTION.Style.Add("display", "none");
                DDl_MEASURE_DESCRIPTION.Style.Add("display", "block");
                txt_MEASURE_DESCRIPTION.Text = txt_Qty.Text = txt_Liurp.Text = txt_Labor.Text = txt_Material.Text = txt_Discription.Text = txt_Total.Text = "";
                txtEditDescription.Text = txtEditCost.Text = txtEditLabor.Text = txtEditLocation.Text = txtEditMaterial.Text = "";
                abc();
                BindSubCatDDL(CatId);
                Response.Write("<script>alert('Record Updated');</script>");
            }
        }
        txt_Qty.Text = "";
        DDl_MEASURE_DESCRIPTION.SelectedIndex = 0;
        SubCatId = 0;
        rdo_Custom.Checked = false;
        rdo_Standard.Checked = true;
    }
    public DataTable abc()
    {
        DataTable dt = (DataTable)ViewState["InvoiceTable"];
        DataRow[] drModelDetails = dt.Select("NoOfInvoice='" + Convert.ToInt32(Request.QueryString["InvoiceNo"]) + "' AND Utility='" + Convert.ToInt32(Request.QueryString["Utility"]) + "' AND JobNumber='" + Convert.ToString(Request.QueryString["Jobs"]) + "' AND catId='" + CatId + "'");
        DataTable dt1 = new DataTable("MyTable");
        dt1.Columns.Add("InvoiceRowId", typeof(int));
        dt1.Columns.Add("NoOfInvoice", typeof(int));
        dt1.Columns.Add("catId", typeof(int));
        dt1.Columns.Add("SubCategory", typeof(string));
        dt1.Columns.Add("Location", typeof(string));
        dt1.Columns.Add("SC", typeof(string));
        dt1.Columns.Add("LiurpCode", typeof(string));
        dt1.Columns.Add("Unit", typeof(string));
        dt1.Columns.Add("LaborRate", typeof(string));
        dt1.Columns.Add("CostPerUnit", typeof(string));
        dt1.Columns.Add("THW", typeof(string));
        dt1.Columns.Add("TMC", typeof(string));
        dt1.Columns.Add("QTY", typeof(string));
        dt1.Columns.Add("Total", typeof(string));
        dt1.Columns.Add("RowType", typeof(string));
        dt1.Columns.Add("JobNumber", typeof(string));
        dt1.Columns.Add("UserId", typeof(string));
        dt1.Columns.Add("SwapId", typeof(int));
        dt1.Columns.Add("Utility", typeof(int));
        dt1.Columns.Add("submit_date", typeof(string));
        dt1.Columns.Add("Rad_btn", typeof(string));
        dt1.Columns.Add("SubCatId", typeof(int));
        dt1.Columns.Add("LR", typeof(string));
        dt1.Columns.Add("Category", typeof(string));
        dt1.Columns.Add("Name", typeof(string));
        dt1.Columns.Add("MailingAddress1", typeof(string));
        dt1.Columns.Add("Adr", typeof(string));
        dt1.Columns.Add("ContactResultDate", typeof(string));
        dt1.Columns.Add("WorkPhone", typeof(string));
        dt1.Columns.Add("Comp_Date", typeof(DateTime));
        dt1.Columns.Add("Submit_Date1", typeof(string));
        dt1.Columns.Add("Fnl_Total", typeof(string));
        dt1.Columns.Add("labor_Total", typeof(string));
        dt1.Columns.Add("cost_Total", typeof(string));
        dt1.Columns.Add("SC1", typeof(string));
        dt1.Columns.Add("THW1", typeof(string));
        dt1.Columns.Add("TMC1", typeof(string));
        dt1.Columns.Add("CostPerUnit1", typeof(string));
        dt1.Columns.Add("Total1", typeof(string));
        dt1.Columns.Add("LaborRate1", typeof(string));
        dt1.Columns.Add("ACT", typeof(string));
        dt1.Columns.Add("ACT2", typeof(string));
        dt1.Columns.Add("Warm1", typeof(string));
        dt1.Columns.Add("Warm2", typeof(string));
        drModelDetails.CopyToDataTable<DataRow>(dt1, LoadOption.Upsert);
        grdContainOfInvoice.DataSource = dt1;
        grdContainOfInvoice.DataBind();
        return dt1;
    }

    void createCatgOrder()
    {
        DataTable dt1 = new DataTable("catGOrder");
        dt1.Columns.Add("catId", typeof(int));
        dt1.Columns.Add("JobNum", typeof(string));
        dt1.Columns.Add("InvoiceNo", typeof(int));
        ViewState["catGOrder"] = dt1;
    }

    void insertCatgOrder()
    {
        if (ViewState["catGOrder"] != null)
        {
            DataTable dt_CatgOrder = (DataTable)ViewState["catGOrder"];
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString()))
            {
                using (SqlCommand command = new SqlCommand("", conn))
                {
                    try
                    {
                        conn.Open();
                        //string mInvoiceNum = Convert.ToString(Convert.ToInt32(Request.QueryString["InvoiceNo"]));
                        //string mJobNo = Convert.ToString(Request.QueryString["Jobs"].ToString());
                        for (int j = 0; j < dt_CatgOrder.Rows.Count; j++)
                        {
                            string catg = Convert.ToString(dt_CatgOrder.Rows[j]["catId"]);
                            string InvoiceNo = Convert.ToString(dt_CatgOrder.Rows[j]["InvoiceNo"]);
                            string JobNum = Convert.ToString(dt_CatgOrder.Rows[j]["JobNum"]);

                            SqlCommand cmd = new SqlCommand();
                            cmd.Parameters.AddWithValue("@CatId", catg);
                            cmd.Parameters.AddWithValue("@JobNum", JobNum);
                            cmd.Parameters.AddWithValue("@InvoiceNo", InvoiceNo);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Connection = conn;
                            cmd.CommandText = "spInvoiceCatGOrder";
                            cmd.ExecuteNonQuery();
                        }
                    }

                    catch (Exception ex)
                    {
                        // Handle exception properly
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
        }
    }

    protected void lnkBtnBack_Click(object sender, EventArgs e)
    {
        DataTable dt_Invoice = objInvoice.CheckExistInvoice(Convert.ToString(Request.QueryString["Jobs"]), Convert.ToInt32(Request.QueryString["InvoiceNo"]), Convert.ToInt32(Request.QueryString["Utility"]));
        if (dt_Invoice.Rows.Count > 0)
        {
            Response.Redirect("../DisplayJobSearchRecords.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
        }
        else
        {
            if (Request.QueryString["InvoiceNo"].ToString() == "1")
            {
                Response.Redirect("../DisplayJobSearchRecords.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
            }
            else
            {
                int inv = Convert.ToInt32(Request.QueryString["InvoiceNo"]) - 1;
                Response.Redirect("../DisplayJobSearchRecords.aspx?InvoiceNo=" + inv + "&Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
            }
        }

    }

    public void ShowDataN(string jobno)
    {
        DataSet dsShow = objInvoice.ShowDataN(jobno);
        DataTable dtShow = new DataTable();
        dtShow = dsShow.Tables[0];
        lbl_name1.Text = lbl_name.Text = dtShow.Rows[0]["Name"].ToString();
        lbl_jobno1.Text = lbl_jobno.Text = dtShow.Rows[0]["JobNumber"].ToString();
        lbl_phone1.Text = lbl_phone.Text = dtShow.Rows[0]["WorkPhone"].ToString();
        ViewState["WarmOrWarmPlus"] = Convert.ToString(dsShow.Tables[1].Rows[0]["WarmOrWarmPlus"]);
    }

    protected void btn_Print_Click(object sender, EventArgs e)
    {
        //txt_cal.Text = System.DateTime.Now.ToString("MM/dd/yyyy");
        //if (chk_SubmitDate.Checked == true)
        //{
        //    ModalPopupExtender1.Show();
        //}
        //else
        //{
        BuildReport("Actual");
        //}
    }
    protected void btnShowPopup_Click1(object sender, EventArgs e)
    {

    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Invoice_Crystal.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"]);
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        BuildReport("Actual");
    }

    public void BuildReport(string flag)
    {
        bool i = false;
        //bool i = objInvoice.Upd_Sub_Date(txt_cal.Text, Convert.ToInt32(Request.QueryString["InvoiceNo"]), Request.QueryString["Jobs"], Convert.ToInt32(Request.QueryString["Utility"].ToString()));
        DataTable dt = (DataTable)ViewState["InvoiceTable"];
        for (int j = 0; j < dt.Rows.Count; j++)
        {
            dt.Rows[j]["submit_date"] = txt_cal.Text;
        }
        dt.AcceptChanges();
        ViewState["InvoiceTable"] = dt;
        DataTable dt1 = (DataTable)ViewState["InsertTable"];
        for (int j = 0; j < dt1.Rows.Count; j++)
        {
            dt1.Rows[j]["submit_date"] = txt_cal.Text;
        }
        dt1.AcceptChanges();
        ViewState["InsertTable"] = dt1;
        insertCatgOrder();
        ViewState["catGOrder"] = null;
        i = true;
        if (i == true)
        {
            UpdateData("Table1");
            if (flag == "Actual")
            {
                setInvoiceAmt();
                Response.Redirect("../Invoice_Crystal.aspx?Back=vi&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"]);
            }
        }
        else
            Response.Write("<script>alert('Failed');</script>");
    }

    public void setInvoiceAmt()
    {
        DataTable dtFnlAmt = new DataTable();
        ViewStatePageLoad();
        dtFnlAmt = (DataTable)ViewState["InvoiceTable"];
        string FnlInvAmt = Convert.ToString(dtFnlAmt.Rows[0]["Fnl_Total"]);
        string ActTotal = "";
        string sConstr = ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(sConstr))
        {
            using (SqlCommand comm = new SqlCommand())
            {
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "proc_Act129Total";
                comm.Connection = conn;
                comm.Parameters.AddWithValue("@JobNumber", Request.QueryString["Jobs"]);
                comm.Parameters.AddWithValue("@Utility", Request.QueryString["Utility"]);
                comm.Parameters.AddWithValue("@NoOfInvoice", Request.QueryString["InvoiceNo"]);
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(comm))
                {
                    DataTable dtActTotal = new DataTable();
                    da.Fill(dtActTotal);
                    ActTotal = Convert.ToString(dtActTotal.Rows[0]["Total"]);
                    if (ActTotal == "" || ActTotal == null)
                    {
                        ActTotal = "0.00";
                    }
                }
                conn.Close();
            }
        }
        decimal PaidInvAmt = ((Convert.ToDecimal(FnlInvAmt) - Convert.ToDecimal(ActTotal)) * Convert.ToDecimal(0.80)) + Convert.ToDecimal(ActTotal);
        objInvoice.InsertOrUpdatePaidAmount(Convert.ToInt32(Request.QueryString["InvoiceNo"]), Convert.ToString(Request.QueryString["Jobs"]), Convert.ToString(PaidInvAmt), Convert.ToInt32(Request.QueryString["Utility"]));
        objInvoice.InsertJobForDate(Convert.ToInt32(Request.QueryString["InvoiceNo"]), Convert.ToString(Request.QueryString["Jobs"]));
    }



    protected void btn_SaveNormal_Click(object sender, EventArgs e)
    {
        txt_cal.Text = System.DateTime.Now.ToString("MM/dd/yyyy");
        BuildReport("Normal");
        ViewState["catGOrder"] = null; ViewState["InvoiceTable"] = null; ViewState["InsertTable"] = null;
        count = 0;
        MakeDataTableForInsert();
        ShowDataN(Request.QueryString["Jobs"].ToString());
        ViewStatePageLoad();
        setInvoiceAmt();
    }

    protected void grdContainOfInvoice_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Invoice_RowId = Convert.ToInt32(grdContainOfInvoice.DataKeys[e.RowIndex].Value.ToString());
        DataTable dt_Edit = (DataTable)ViewState["InvoiceTable"];  //objInvoice.InvoiceRowForUpdate(Invoice_RowId);
        DataRow[] drModelDetails = dt_Edit.Select("InvoiceRowId='" + Invoice_RowId + "'");
        DataTable dt = new DataTable("MyTable");
        dt.Columns.Add("InvoiceRowId", typeof(int));
        dt.Columns.Add("NoOfInvoice", typeof(int));
        dt.Columns.Add("catId", typeof(int));
        dt.Columns.Add("SubCategory", typeof(string));
        dt.Columns.Add("Location", typeof(string));
        dt.Columns.Add("SC", typeof(string));
        dt.Columns.Add("LiurpCode", typeof(string));
        dt.Columns.Add("Unit", typeof(string));
        dt.Columns.Add("LaborRate", typeof(string));
        dt.Columns.Add("CostPerUnit", typeof(string));
        dt.Columns.Add("THW", typeof(string));
        dt.Columns.Add("TMC", typeof(string));
        dt.Columns.Add("QTY", typeof(string));
        dt.Columns.Add("Total", typeof(string));
        dt.Columns.Add("RowType", typeof(string));
        dt.Columns.Add("JobNumber", typeof(string));
        dt.Columns.Add("UserId", typeof(string));
        dt.Columns.Add("SwapId", typeof(int));
        dt.Columns.Add("Utility", typeof(int));
        dt.Columns.Add("submit_date", typeof(string));
        dt.Columns.Add("Rad_btn", typeof(string));
        dt.Columns.Add("SubCatId", typeof(int));
        dt.Columns.Add("LR", typeof(string));
        dt.Columns.Add("Category", typeof(string));
        dt.Columns.Add("Name", typeof(string));
        dt.Columns.Add("MailingAddress1", typeof(string));
        dt.Columns.Add("Adr", typeof(string));
        dt.Columns.Add("ContactResultDate", typeof(string));
        dt.Columns.Add("WorkPhone", typeof(string));
        dt.Columns.Add("Comp_Date", typeof(DateTime));
        dt.Columns.Add("Submit_Date1", typeof(string));
        dt.Columns.Add("Fnl_Total", typeof(string));
        dt.Columns.Add("labor_Total", typeof(string));
        dt.Columns.Add("cost_Total", typeof(string));
        dt.Columns.Add("SC1", typeof(string));
        dt.Columns.Add("THW1", typeof(string));
        dt.Columns.Add("TMC1", typeof(string));
        dt.Columns.Add("CostPerUnit1", typeof(string));
        dt.Columns.Add("Total1", typeof(string));
        dt.Columns.Add("LaborRate1", typeof(string));
        dt.Columns.Add("ACT", typeof(string));
        dt.Columns.Add("ACT2", typeof(string));
        dt.Columns.Add("Warm1", typeof(string));
        dt.Columns.Add("Warm2", typeof(string));
        drModelDetails.CopyToDataTable<DataRow>(dt, LoadOption.Upsert);
        if (dt.Rows.Count > 0)
        {
            btnSave.Text = "Update Row";
            txt_Qty.Text = Convert.ToString(dt.Rows[0]["QTY"]);
            CatId = Convert.ToInt32(dt.Rows[0]["catId"]);
            if (Convert.ToString(dt.Rows[0]["RowType"]) == "S")
            {
                txtEditDescription.Text = Convert.ToString(dt.Rows[0]["Rad_btn"]);
                //txtEditDescription.Text = Convert.ToString(dt.Rows[0]["SubCatId"]);
                txtEditLocation.Text = Convert.ToString(dt.Rows[0]["Location"]);
                string co_st = Convert.ToString(dt.Rows[0]["Unit"]);
                char[] arr = new char[] { '$' };
                co_st = co_st.TrimStart(arr);
                txtEditCost.Text = co_st;
                txtEditLabor.Text = Convert.ToString(dt.Rows[0]["LaborRate"]);
                if (Convert.ToString(dt.Rows[0]["LaborRate"]) != "")
                {
                    txtEditLabor.Text = "-";
                }

                txtEditMaterial.Text = Convert.ToString(dt.Rows[0]["CostPerUnit"]);

                if (Convert.ToString(dt.Rows[0]["CostPerUnit"]) != "")
                {
                    txtEditMaterial.Text = "-";
                }

                txtEditTotal.Text = Convert.ToString(dt.Rows[0]["Total"]);
                hdntxtEditTotal.Value = Convert.ToString(dt.Rows[0]["Total"]);
                txtCode.Text = Convert.ToString(dt.Rows[0]["LiurpCode"]);

                txtEditTHW.Text = Convert.ToString(dt.Rows[0]["THW"]);
                txtEditTW.Text = Convert.ToString(dt.Rows[0]["TMC"]);

                if (Convert.ToString(dt.Rows[0]["THW"]) == "0.00")
                {
                    txtEditTHW.Text = "-";
                }
                if (Convert.ToString(dt.Rows[0]["TMC"]) == "0.00")
                {
                    txtEditTW.Text = "-";
                }

                txt_LaborRate.Text = Convert.ToString(dt.Rows[0]["LR"]);
                trEdirLocation.Visible = true;
                rdo_Custom.Checked = false;
                rdo_Standard.Checked = true;
                courier.Style.Add("display", "none");
                txt_MEASURE_DESCRIPTION.Style.Add("display", "none");
                DDl_MEASURE_DESCRIPTION.Style.Add("display", "block");
                BindSubCatDDL(CatId);
                DDl_MEASURE_DESCRIPTION.SelectedValue = Convert.ToString(dt.Rows[0]["SubCatId"]);
                string ItmName = Convert.ToString(DDl_MEASURE_DESCRIPTION.SelectedItem);
                int lenghth = Convert.ToInt32(ItmName.Length);
                var pos = (ItmName.IndexOf('$'));
                ItmName = ItmName.Substring(pos, lenghth - pos);
                if (ItmName == "$0.00")
                {
                    txtEditTotal.Enabled = txtEditCost.Enabled = txtEditLabor.Enabled = txtEditMaterial.Enabled = txtEditTHW.Enabled = txtEditTW.Enabled = true;
                }
                else
                {
                    txtEditTotal.Enabled = txtEditCost.Enabled = txtEditLabor.Enabled = txtEditMaterial.Enabled = txtEditTHW.Enabled = txtEditTW.Enabled = false;
                }
            }
            else if (Convert.ToString(dt.Rows[0]["RowType"]) == "C")
            {
                rdo_Standard.Checked = false;
                rdo_Custom.Checked = true;
                courier.Style.Add("display", "block");
                txt_MEASURE_DESCRIPTION.Style.Add("display", "block");
                DDl_MEASURE_DESCRIPTION.Style.Add("display", "none");


                txt_Location.Text = Convert.ToString(dt.Rows[0]["Location"]);
                txt_Cost.Text = Convert.ToString(dt.Rows[0]["Unit"]);

                txt_Liurp.Text = Convert.ToString(dt.Rows[0]["LiurpCode"]);
                txt_Material.Text = Convert.ToString(dt.Rows[0]["CostPerUnit"]);
                txt_Labor.Text = Convert.ToString(dt.Rows[0]["LaborRate"]);
                txt_Discription.Text = Convert.ToString(dt.Rows[0]["Rad_btn"]);
                string total = Convert.ToString(dt.Rows[0]["Total"]);
                total = total.Replace(' ', '$');
                txt_Total.Text = Convert.ToString(total);
                txt_MEASURE_DESCRIPTION.Text = Convert.ToString(dt.Rows[0]["SubCategory"]);
            }
        }
    }
    protected void grdContainOfInvoice_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string InvoiceRowId = Convert.ToString(grdContainOfInvoice.DataKeys[e.RowIndex].Value.ToString());
        DelRowId = DelRowId + "," + InvoiceRowId;
        DelRowId = DelRowId.TrimEnd(',');
        //int result = objInvoice.DeleteInvoice_ContainById(InvoiceRowId);
        DataTable dt = (DataTable)ViewState["InvoiceTable"];
        DataTable dt1 = (DataTable)ViewState["InsertTable"];
        for (int i = dt.Rows.Count - 1; i >= 0; i--)
        {
            // whatever your criteria is
            if (dt.Rows[i]["InvoiceRowId"].ToString() == InvoiceRowId)
            {
                dt.Rows[i].Delete();
                break;
            }
        }

        for (int i = dt1.Rows.Count - 1; i >= 0; i--)
        {
            // whatever your criteria is
            if (dt1.Rows[i]["InvoiceRowId"].ToString() == InvoiceRowId)
            {
                dt1.Rows[i].Delete();
                break;
            }
        }

        dt1.AcceptChanges();
        dt.AcceptChanges();
        ViewState["InvoiceTable"] = dt;
        ViewState["InsertTable"] = dt1;
        abc();
    }
    public void InsertData()
    {
        DataTable dt1 = (DataTable)ViewState["InsertTable"];
        //ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.PerUserRoamingAndLocal);
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString()))
        {
            using (SqlCommand command = new SqlCommand("", conn))
            {
                try
                {
                    conn.Open();
                    command.CommandText = "CREATE TABLE #TmpTable1(InvoiceRowId int NOT NULL,NoOfInvoice int NULL,catId int NULL,SubCategory nvarchar(500) NULL,Location nvarchar(50) NULL,SC nvarchar(50) NULL,LiurpCode nvarchar(50) NULL,Unit nvarchar(50) NULL,LaborRate nvarchar(50) NULL,CostPerUnit nvarchar(50) NULL,THW nvarchar(50) NULL,TMC nvarchar(50) NULL,QTY nvarchar(50) NULL,Total nvarchar(50) NULL,RowType nvarchar(50) NULL,JobNumber nvarchar(50) NULL,UserId nvarchar(50) NULL,SwapId int NULL,Utility int NULL,submit_date nvarchar(50) NULL,Rad_btn nvarchar(500) NULL,SubCatId int NULL,LR nvarchar(500) NULL)";
                    command.ExecuteNonQuery();
                    //Bulk insert into temp table
                    using (SqlBulkCopy bulkcopy1 = new SqlBulkCopy(conn))
                    {
                        bulkcopy1.BulkCopyTimeout = 660;
                        bulkcopy1.DestinationTableName = "#TmpTable1";
                        bulkcopy1.WriteToServer(dt1);
                        bulkcopy1.Close();
                    }
                    command.CommandTimeout = 300;
                    command.CommandText = "INSERT INTO AllInvoiceByJobNumberTBL(NoOfInvoice, catId, SubCategory, Location, SC, LiurpCode, Unit, LaborRate, CostPerUnit, THW, TMC, QTY, Total, RowType, JobNumber, UserId, SwapId, Utility, submit_date, Rad_btn, SubCatId, LR) SELECT NoOfInvoice, catId, SubCategory, Location, SC, LiurpCode, Unit, LaborRate, CostPerUnit, THW, TMC, QTY, Total, RowType, JobNumber, UserId, SwapId, Utility, submit_date, Rad_btn, SubCatId, LR FROM #TmpTable1; DROP TABLE #TmpTable1;";
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    // Handle exception properly
                }
                finally
                {
                    string jobNum = Convert.ToString(Request.QueryString["Jobs"]);
                    string InvoiceNo = Convert.ToString(Request.QueryString["InvoiceNo"]);
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SPDeleteInvoiceCatGOrder";

                    command.Parameters.AddWithValue("@CatId", Convert.ToString(CatId));
                    command.Parameters.AddWithValue("@InvoiceNo", InvoiceNo);
                    command.Parameters.AddWithValue("@JobNum", jobNum);
                    command.ExecuteNonQuery();

                    conn.Close();
                }
            }
        }
    }

    public void UpdateData(string TabelName)
    {
        DataTable dt = new DataTable("AllInvoiceByJobNumberTBL");
        dt = (DataTable)ViewState["InvoiceTable"];
        //ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.PerUserRoamingAndLocal);
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString()))
        {
            using (SqlCommand command = new SqlCommand("", conn))
            {
                try
                {
                    conn.Open();
                    //Creating temp table on database
                    command.CommandText = "CREATE TABLE #TmpTable(InvoiceRowId int NOT NULL,NoOfInvoice int NULL,catId int NULL,SubCategory nvarchar(500) NULL,Location nvarchar(50) NULL,SC nvarchar(50) NULL,LiurpCode nvarchar(50) NULL,Unit nvarchar(50) NULL,LaborRate nvarchar(50) NULL,CostPerUnit nvarchar(50) NULL,THW nvarchar(50) NULL,TMC nvarchar(50) NULL,QTY nvarchar(50) NULL,Total nvarchar(50) NULL,RowType nvarchar(50) NULL,JobNumber nvarchar(50) NULL,UserId nvarchar(50) NULL,SwapId int NULL,Utility int NULL,submit_date nvarchar(50) NULL,Rad_btn nvarchar(500) NULL,SubCatId int NULL,LR nvarchar(500) NULL,Category nvarchar(50) NULL,Name nvarchar(50) NULL,MailingAddress1 nvarchar(50) NULL,Adr nvarchar(50) NULL,ContactResultDate nvarchar(50) NULL,WorkPhone nvarchar(50) NULL,Comp_Date nvarchar(50) NULL,Submit_Date1 nvarchar(50) NULL,Fnl_Total nvarchar(50) NULL,labor_Total nvarchar(50) NULL,cost_Total nvarchar(50) NULL,SC1 nvarchar(50) NULL,THW1 nvarchar(50) NULL,TMC1 nvarchar(50) NULL,CostPerUnit1 nvarchar(50) NULL,Total1 nvarchar(50) NULL,LaborRate1 nvarchar(50) NULL,ACT nvarchar(50) NULL,ACT2 nvarchar(50) NULL,Warm1 nvarchar(50) NULL,Warm2 nvarchar(50) NULL)";
                    command.ExecuteNonQuery();
                    //Bulk insert into temp table
                    using (SqlBulkCopy bulkcopy = new SqlBulkCopy(conn))
                    {
                        bulkcopy.BulkCopyTimeout = 660;
                        bulkcopy.DestinationTableName = "#TmpTable";
                        bulkcopy.WriteToServer(dt);
                        bulkcopy.Close();
                    }
                    // Updating destination table, and dropping temp table
                    command.CommandTimeout = 300;
                    command.CommandText = "UPDATE T SET T.NoOfInvoice = Temp.NoOfInvoice,T.catId = Temp.catId,T.SubCategory = Temp.SubCategory,T.Location = Temp.Location,T.SC = Temp.SC,T.LiurpCode = Temp.LiurpCode,T.Unit = Temp.Unit,T.LaborRate = Temp.LaborRate,T.CostPerUnit = Temp.CostPerUnit,T.THW = Temp.THW,T.TMC = Temp.TMC,T.QTY = Temp.QTY,T.Total = Temp.Total,T.RowType = Temp.RowType,T.JobNumber = Temp.JobNumber,T.UserId = Temp.UserId,T.SwapId = Temp.SwapId,T.Utility = Temp.Utility,T.submit_date = Temp.submit_date,T.Rad_btn = Temp.Rad_btn,T.SubCatId=Temp.SubCatId,T.LR=Temp.LR FROM AllInvoiceByJobNumberTBL T INNER JOIN #TmpTable Temp ON T.InvoiceRowId = Temp.InvoiceRowId";
                    command.ExecuteNonQuery();

                    // Deleting destination table
                    string jobNum = Convert.ToString(Request.QueryString["Jobs"]);
                    string InvoiceNo = Convert.ToString(Request.QueryString["InvoiceNo"]);
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "proc_DeleteMultipleRecord";
                    command.Parameters.AddWithValue("@string", DelRowId);
                    command.Parameters.AddWithValue("@CatId", Convert.ToString(CatId));
                    command.Parameters.AddWithValue("@InvoiceNo", InvoiceNo);
                    command.Parameters.AddWithValue("@JobNum", jobNum);
                    command.ExecuteNonQuery();

                    command.CommandType = CommandType.Text;
                    command.CommandText = "DROP TABLE #TmpTable;";
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    // Handle exception properly
                }
                finally
                {
                    conn.Close();
                    InsertData();
                    //Response.Redirect("../Invoice_Crystal.aspx?Back=vi&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"]);
                }
            }
        }
    }
    protected void Btn_View_Click(object sender, EventArgs e)
    {
        Btn_View.Visible = false; mainformat.Visible = false; Btn_back123.Visible = true; Div.Visible = true;
        dt_ShowDemoInvoice = (DataTable)ViewState["InvoiceTable"];
    }
    protected void Btn_back123_Click(object sender, EventArgs e)
    {
        Btn_View.Visible = true; mainformat.Visible = true; Btn_back123.Visible = false; Div.Visible = false;
    }

    protected void DDl_MEASURE_DESCRIPTION_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDl_MEASURE_DESCRIPTION.SelectedValue != "Select")
        {
            trEdirLocation.Visible = true;
            int SubCatId = Convert.ToInt32(DDl_MEASURE_DESCRIPTION.SelectedValue);
            DataTable dt__Fill = objInvoice.showMetedAllThingByCatId_SubCatId(CatId, SubCatId, Convert.ToString(ViewState["WarmOrWarmPlus"]));
            if(dt__Fill.Rows.Count>0)
            {
            txtEditDescription.Text = Convert.ToString(dt__Fill.Rows[0]["Discription"]);
            txtCode.Text = Convert.ToString(dt__Fill.Rows[0]["Code"]);
            txtEditLocation.Text = Convert.ToString(dt__Fill.Rows[0]["Location"]);
            txtEditCost.Text = Convert.ToString(dt__Fill.Rows[0]["Cost"]);
            dt__Fill = objAllThing.showMetedLaborRate();
            hdnLbrRate.Value = Convert.ToString(dt__Fill.Rows[0]["MinLaborRate"]);
            txt_LaborRate.Text = hdnLbrRate.Value;
            if (txtEditCost.Text == "" || txtEditCost.Text == "0.00")
            {
                txtEditTotal.Enabled = txtEditCost.Enabled = txtEditLabor.Enabled = txtEditMaterial.Enabled = txtEditTHW.Enabled = txtEditTW.Enabled = true;
                txtEditTotal.Text = txtEditCost.Text = txtEditLabor.Text = txtEditMaterial.Text = txtEditTHW.Text = txtEditTW.Text = "";
            }
            else
            {

                txt_Qty.Text = "1";

                string thw, tw;

                if (txtEditTHW.Text == "" || txtEditTHW.Text == "-")
                {
                    thw = "0";
                    txtEditTHW.Text = "0.00";
                }
                else
                {
                    thw = txtEditTHW.Text;
                }

                if (txtEditTW.Text == "" || txtEditTW.Text == "-")
                {
                    tw = "0";
                    txtEditTW.Text = "0.00";
                }
                else
                {
                    tw = txtEditTW.Text;
                }
                txtEditLabor.Text = ((Convert.ToDecimal(hdnLbrRate.Value) * Convert.ToDecimal(thw) * Convert.ToDecimal(tw))).ToString("F");
                txtEditMaterial.Text = (Convert.ToDecimal(txtEditCost.Text) - Convert.ToDecimal(txtEditLabor.Text)).ToString("F");
                txtEditTotal.Text = (Convert.ToDecimal(txt_Qty.Text) * (Convert.ToDecimal(txtEditLabor.Text) + Convert.ToDecimal(txtEditMaterial.Text))).ToString("F");
                hdntxtEditTotal.Value = txtEditTotal.Text;
                txtEditTotal.Enabled = txtEditCost.Enabled = txtEditLabor.Enabled = txtEditMaterial.Enabled = txtEditTHW.Enabled = txtEditTW.Enabled = false;
                txtEditLabor.Text = txtEditMaterial.Text = txtEditTHW.Text = txtEditTW.Text = "-";
            }

        }
        }
    }


    public void GetCompletedDate(string jobno)
    {
        DataSet dt = objInvoice.GetCompletedDate(jobno, "METED");
        if (dt.Tables[0].Rows.Count > 0 )
        {
            if (!string.IsNullOrEmpty(Convert.ToString(dt.Tables[0].Rows[0]["AuditDate"])))
                lblCompletedDate.Text = Convert.ToDateTime(dt.Tables[0].Rows[0]["AuditDate"]).ToString("MM/dd/yyy");
        }
        if (dt.Tables[1].Rows.Count > 0)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(dt.Tables[1].Rows[0]["DateAuditComplete"])))
                lblAuditCompleted.Text = Convert.ToDateTime(dt.Tables[1].Rows[0]["DateAuditComplete"]).ToString("MM/dd/yyy");
        }
    }

    // Update Complete Date.
    protected void btnUpdateDate_Click(object sender, EventArgs e)
    {

        DataTable dt = objInvoice.UpdateCompletedDate(Request.QueryString["Jobs"], "METED", txtSetDate.Text);
        if (dt.Rows.Count > 0)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["AuditDate"])))
                lblCompletedDate.Text = Convert.ToDateTime(dt.Rows[0]["AuditDate"]).ToString("MM/dd/yyy");
            txtSetDate.Text = "";
        }
    }


    // Update Audit Complete Date.
    protected void btnUpdateAuditDate_Click(object sender, EventArgs e)
    {

        DataTable dt = objInvoice.UpdateAuditCompletedDate(Request.QueryString["Jobs"], "METED", txtAuditCompleted.Text);
        if (dt.Rows.Count > 0)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ContactDateTime"])))
                lblAuditCompleted.Text = Convert.ToDateTime(dt.Rows[0]["ContactDateTime"]).ToString("MM/dd/yyy");
            txtAuditCompleted.Text = "";
        }
    }

}
