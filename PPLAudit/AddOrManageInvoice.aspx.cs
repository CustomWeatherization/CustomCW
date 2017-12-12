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
using System.Globalization;

public partial class PPLAudit_AddOrManageInvoice : System.Web.UI.Page
{
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    public decimal FinalTotal;
    public static int count = 0;
    public DataTable uniqueCols = new DataTable();
    public DataTable dt_1 = new DataTable();
    public static string DelRowId = "";
    Dc_Category objCat = new Dc_Category();
    Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
    public static int CatId = 0;
    public static DataTable dt_ShowDemoInvoice = new DataTable();
    public static int Invoice_RowId = 0;
    Dc_AddAllThing objNewThing = new Dc_AddAllThing();
    public DataTable dtU = new DataTable();
    public static double YearlyKWH = 0.0;
    public static double ShellAllowance = 0.0;
    public static double RepairAllowance = 0.0;
    public static double Healthallowance = 650.0;
    public static double BudgetAllowance = 0.0;
    public static double OtherAllowance = 0.0;
    //string ShellAllowance = "";
    //string RepairAllowance = "";
    //string Healthallowance = "";
    //string BudgetAllowance = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        //tanveer
        OtherAllowance = 0.0;
        hed_link.Visible = true;
        smUtil objSm = new smUtil();
        string role = "";
        role = objSm.GetCookie("Rol_Id");
        if (role == "User")
        {
            hed_link.Visible = false;
        }
        //end
        if (!IsPostBack)
        {
            count = 0;
            MakeDataTableForInsert();
            ShowAllCategory();
            ShowLaborRate();
            ShowDataN(Request.QueryString["Jobs"].ToString());
         
            GetCompletedDate(Request.QueryString["Jobs"].ToString());
            dtU = objNewJob.ShowJobByJobNumber_ByJobNumber(Convert.ToString(Request.QueryString["Jobs"]));

            if (dtU.Rows.Count > 0 && !DBNull.Value.Equals(dtU.Rows[0]["Inspection"]) && Convert.ToBoolean(dtU.Rows[0]["Inspection"]) != false)
            {
                hdnIsInspection.Value = dtU.Rows[0]["Inspection"].ToString();
            }
            if (dtU.Rows.Count > 0 && !DBNull.Value.Equals(dtU.Rows[0]["YearlyKWHHours"]))
            {
                YearlyKWH = Convert.ToDouble(dtU.Rows[0]["YearlyKWHHours"]);
                ShellAllowance = YearlyKWH * 0.20 * 1.0 + 200;
                RepairAllowance = ShellAllowance * 0.30;
                BudgetAllowance = ShellAllowance + RepairAllowance + Healthallowance;

            }

            lblShellAllowance.Text = "$" + string.Format("{0:0.00}",ShellAllowance);
            lblRepairAllowance.Text = "$" + string.Format("{0:0.00}",RepairAllowance);
            lblHsAllowance.Text = "$" + string.Format("{0:0.00}",Healthallowance);
            lblBudgetAllowance.Text = "$" +string.Format("{0:0.00}", BudgetAllowance);
            lblOtherAllowance.Text = "$" + string.Format("{0:0.00}",OtherAllowance);
            ViewStatePageLoad();
           
        }
    }

    public void ViewStatePageLoad()
    {
        DataTable dt = objInvoice.ViewState_PageLoad(Request.QueryString["Jobs"].ToString(), Convert.ToInt32(Request.QueryString["InvoiceNo"]), Convert.ToInt32(Request.QueryString["Utility"]));
        ViewState["InvoiceTable"] = dt;
        abc();
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
        dt1.Columns.Add("submit_date", typeof(string));//ContactResultDate
        dt1.Columns.Add("Rad_btn", typeof(string));
        dt1.Columns.Add("SubCatId", typeof(int));
        dt1.Columns.Add("LR", typeof(string));
        dt1.Columns.Add("Description", typeof(string));
        dt1.Columns.Add("TypeOfMeasure", typeof(string));
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

        double RepairLeftAllowance = RepairAllowance;
        double HealthLeftallowance = Healthallowance;
        double ShellLeftAllowance = ShellAllowance;
        double OtherLeftAllowance = OtherAllowance;
        
        double BudgetLeftAllowance = 0.0;

        for (int i = 0; i < dt1.Rows.Count; i++)
        {

            if (!DBNull.Value.Equals(dt1.Rows[i]["TypeOfMeasure"]))
            {
                if (dt1.Rows[i]["TypeOfMeasure"].ToString().Trim() == "Repair")
                {
                    RepairLeftAllowance = Convert.ToDouble(RepairLeftAllowance) - Convert.ToDouble(dt1.Rows[i]["Total"]);                    
                }
                if (dt1.Rows[i]["TypeOfMeasure"].ToString().Trim() == "H & S")
                {
                   
                    HealthLeftallowance = Convert.ToDouble(HealthLeftallowance) - Convert.ToDouble(dt1.Rows[i]["Total"]);                    
                }
                if (dt1.Rows[i]["TypeOfMeasure"].ToString().Trim() == "Shell")
                {
                    ShellLeftAllowance = Convert.ToDouble(ShellLeftAllowance) - Convert.ToDouble(dt1.Rows[i]["Total"]);                    
                }
                if (dt1.Rows[i]["TypeOfMeasure"].ToString().Trim() == "Other")
                {
                    OtherLeftAllowance = Convert.ToDouble(dt1.Rows[i]["Total"]) + Convert.ToDouble(OtherLeftAllowance);
                }
         
            }            
        }
        lblRepairLeftAllowance.Text = "$" + string.Format("{0:0.00}", RepairLeftAllowance);
        lblleftHsAllowance.Text = "$" + string.Format("{0:0.00}", HealthLeftallowance);
        lblShellleftAllowance.Text = "$" + string.Format("{0:0.00}", ShellLeftAllowance);
        lblOtherAllowance.Text = "$" + string.Format("{0:0.00}", OtherLeftAllowance);
        BudgetLeftAllowance = RepairLeftAllowance + HealthLeftallowance + ShellLeftAllowance ;
        lblBudgetLeftAllwance.Text = "$"+string.Format("{0:0.00}", BudgetLeftAllowance);
        
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
    public void ShowAllCategory()
    {
        DataTable dt = objCat.showAllCategory();
        rptr.DataSource = dt;
        rptr.DataBind();
    }
    public void rptr_ItemCommand(Object Sender, RepeaterCommandEventArgs e)
    {
        courier.Style.Add("display", "none");
        txt_MEASURE_DESCRIPTION.Style.Add("display", "none");
        DDl_MEASURE_DESCRIPTION.Style.Add("display", "block");
        trEditTypeMeasure.Style.Add("display", "table-row");
        trEditDescLoc.Style.Add("display", "table-row");
        btnSave.Text = "Add Row";
        txtEditCost.Text = txtEditLabor.Text = txt_Qty.Text = txtSDesc.Text = txtLoc.Text = "";
        trEditLabor.Visible = false;
        rdo_Custom.Checked = false;
        rdo_Standard.Checked = true;

        ddlTypeMeasureStandard.SelectedIndex = 0;
        CatId = Convert.ToInt32(e.CommandArgument.ToString());
        lblCatagory.Text = ((LinkButton)e.CommandSource).Text;
        BindSubCatDDL(CatId);
        ShowInvoiceContain();
        abc();
    }
    public void BindSubCatDDL(int Cat_Id)
    {
        DataTable dt = objInvoice.ShowSubCatByCatId(CatId, "front", Request.QueryString["Jobs"].ToString());
        DDl_MEASURE_DESCRIPTION.DataSource = dt;
        DDl_MEASURE_DESCRIPTION.DataTextField = "SubCatName";
        DDl_MEASURE_DESCRIPTION.DataValueField = "SubCatId";
        DDl_MEASURE_DESCRIPTION.DataBind();
        DDl_MEASURE_DESCRIPTION.Items.Insert(0, "Select");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    public void Clear()
    {
        if (btnSave.Text == "Update Row")
        {
            btnSave.Text = "Add Row";
            DDl_MEASURE_DESCRIPTION.Items.Clear();
            trEditLabor.Visible = false;
            rdo_Custom.Checked = false;
            rdo_Standard.Checked = true;
            courier.Style.Add("display", "none");
            txt_MEASURE_DESCRIPTION.Style.Add("display", "none");
            DDl_MEASURE_DESCRIPTION.Style.Add("display", "block");
            trEditTypeMeasure.Style.Add("display", "table-row");
            trEditDescLoc.Style.Add("display", "table-row");
            ddlTypeMeasure.SelectedIndex = 0;
            
            txt_MEASURE_DESCRIPTION.Text = txtEditCost.Text = txtEditLabor.Text = txt_Qty.Text = txt_Location.Text = txt_Liurp.Text = txt_Unit.Text = txt_LaborRate.Text = txt_THW.Text = txt_TMC.Text = txt_Total.Text = "";
            BindSubCatDDL(CatId);
        }
        ddlTypeMeasureStandard.SelectedIndex = 0;
        txtSDesc.Text = "";
        txtLoc.Text = "";
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
    protected void LnkAudit_Click(object sender, EventArgs e)
    {


        if (dtU.Rows.Count > 0 && !DBNull.Value.Equals(dtU.Rows[0]["Inspection"]) && Convert.ToBoolean(dtU.Rows[0]["Inspection"]) != false)
        {
            ViewState["Inspection"] = Convert.ToBoolean(dtU.Rows[0]["Inspection"]);
            // string IncoiceNo = null;

            if (ViewState["Inspection"] != null && Convert.ToBoolean(ViewState["Inspection"]) == true)
            {
                Response.Redirect("PPL_Inspection.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Request.QueryString["Utility"].ToString());

            }
        }
        else
        {
            Response.Redirect("PPL_Audit_1.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
        }


    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        smUtil objSm = new smUtil();
        string Uid = Convert.ToString(objSm.GetCookie("UId"));
        int SubCatId = 0;
        int NoOfInvoice = 0;
        string Location, TypeOfMeasure, LiurpCode, Unit, LaborRate, CostPerUnit, QTY, Total, RowType, JobNumber, THW, TMC, SubCatName, Desc, LR, Description;
        Location = TypeOfMeasure = LiurpCode = Unit = LaborRate = CostPerUnit = QTY = Total = RowType = JobNumber = THW = TMC = SubCatName = Desc = LR = Description = "";
       
        DataTable dt_Fill = new DataTable();
        //JobNumber = Convert.ToString(JobNumber);

        if (txt_Qty.Text.Trim() != "")
        {
            if (rdo_Standard.Checked == true)
            {
                SubCatId = Convert.ToInt32(DDl_MEASURE_DESCRIPTION.SelectedValue);
                if (Convert.ToString(ViewState["PPlZone"]) == "1" || Convert.ToString(ViewState["PPlZone"]) == "2")
                {
                    dt_Fill = objInvoice.showAllThingByCatId_SubCatId(CatId, SubCatId);
                }
                else
                {
                    dt_Fill = objInvoice.showAllThingByCatId_SubCatId(CatId, SubCatId, Convert.ToString(Request.QueryString["Jobs"]));
                }

                if (dt_Fill.Rows.Count > 0)
                {
                    RowType = "S";
                    Location = txtLoc.Text;//Convert.ToString(dt_Fill.Rows[0]["location"]);
                    TypeOfMeasure = Convert.ToString(dt_Fill.Rows[0]["TypeOfMeasure"]);
                    LiurpCode = Convert.ToString(dt_Fill.Rows[0]["liurpCode"]);
                    Unit = Convert.ToString(dt_Fill.Rows[0]["unit"]);
                    LaborRate = Convert.ToString(dt_Fill.Rows[0]["laborRate"]);
                    CostPerUnit = Convert.ToString(dt_Fill.Rows[0]["costPerUnit"]);
                    QTY = txt_Qty.Text;
                    if (QTY == "")
                    {
                        QTY = "0.00";
                    }
                    if (CostPerUnit == "")
                    {
                        CostPerUnit = "0.00";
                    }
                    decimal srt = Convert.ToDecimal(QTY) * Convert.ToDecimal(CostPerUnit);
                    Total = Convert.ToString(srt);
                    NoOfInvoice = Convert.ToInt32(Request.QueryString["InvoiceNo"]);
                    JobNumber = Convert.ToString(Request.QueryString["Jobs"]);
                    SubCatName = Convert.ToString(DDl_MEASURE_DESCRIPTION.SelectedItem);
                    int lenghth = Convert.ToInt32(SubCatName.Length);
                    var pos = 2 + (SubCatName.IndexOf('-'));
                    SubCatName = SubCatName.Substring(pos, lenghth - pos);
                    pos = (SubCatName.IndexOf('$')) - 3;
                    SubCatName = SubCatName.Substring(0, pos);
                    LR = "";
                    Description = txtSDesc.Text;
                   
                }
                else
                {
                    txt_Qty.Text = "";
                    DDl_MEASURE_DESCRIPTION.SelectedIndex = 0;
                    Response.Write("<script>alert('Please select another CATEGORY or MEASURE DESCRIPTION');</script>");
                }
            }
            else if (rdo_Custom.Checked == true)
            {
                RowType = "C";
                Location = txt_Location.Text;
                // SC = txt_SC.Text;
                TypeOfMeasure = ddlTypeMeasure.SelectedItem.Text;
                LiurpCode = txt_Liurp.Text;
                Unit = txt_Unit.Text;
                LaborRate = txt_LaborRate.Text;
                NoOfInvoice = Convert.ToInt32(Request.QueryString["InvoiceNo"]);
                JobNumber = Convert.ToString(Request.QueryString["Jobs"]);
                THW = txt_THW.Text;
                TMC = txt_TMC.Text;
                SubCatName = txt_MEASURE_DESCRIPTION.Text;
                QTY = txt_Qty.Text;
                Total = txt_Total.Text;
                Total = Total.TrimStart('$');
                Description = txtCDesc.Text;
                
            }
            if (btnSave.Text == "Add Row")
            {
                DataTable dt = (DataTable)ViewState["InvoiceTable"];
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
                 if (ddlTypeMeasureStandard.SelectedItem.Text != "Select Measure Type")
                 {
                   TypeOfMeasure = ddlTypeMeasureStandard.SelectedItem.Text.Trim();
                 }
                string UsrId = Convert.ToString(dt_no.Rows[0]["UsrID"]);
                DataTable dt_Insert = (DataTable)ViewState["InsertTable"];
                DataRow rowInt = dt_Insert.NewRow();
                rowInt["InvoiceRowId"] = count;
                rowInt["NoOfInvoice"] = NoOfInvoice;
                rowInt["catId"] = CatId;
                rowInt["SubCategory"] = SubCatName;
                rowInt["Location"] = Location;
                rowInt["TypeOfMeasure"] = TypeOfMeasure;
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
                rowInt["submit_date"] = "";
                rowInt["Rad_btn"] = Desc;
                rowInt["SubCatId"] = SubCatId;
                rowInt["LR"] = LR;
                rowInt["Description"] = Description;

                dt_Insert.Rows.Add(rowInt);
                dt_Insert.AcceptChanges();
                ViewState["InsertTable"] = dt_Insert;


                row_Int["InvoiceRowId"] = count;
                row_Int["NoOfInvoice"] = NoOfInvoice;
                row_Int["catId"] = CatId;
                row_Int["SubCategory"] = SubCatName;
                row_Int["Location"] = Location;
                row_Int["TypeOfMeasure"] = TypeOfMeasure;
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
                row_Int["submit_date"] = "";
                row_Int["Rad_btn"] = Desc;
                row_Int["SubCatId"] = SubCatId;
                row_Int["LR"] = LR;
                row_Int["Description"] = Description;
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
                

            }
            else if (btnSave.Text == "Update Row")
            {
                int i = 0;
                DataTable dt_Insert = (DataTable)ViewState["InsertTable"];
                if (ddlTypeMeasureStandard.SelectedItem.Text != "Select Measure Type")
                {
                    TypeOfMeasure = ddlTypeMeasureStandard.SelectedItem.Text.Trim();
                }
                if (rdo_Standard.Checked == true && dt_Fill.Rows.Count > 0)
                {
                    //i = objInvoice.UpdateInvoice(NoOfInvoice, CatId, SubCatName, THW, TMC, Location, SC, LiurpCode, Unit, LaborRate, CostPerUnit, QTY, Total, RowType, JobNumber, Uid, Invoice_RowId);
                    DataTable dt = (DataTable)ViewState["InvoiceTable"];
                    for (int j = dt.Rows.Count - 1; j >= 0; j--)
                    {
                        // whatever your criteria is
                        if (Convert.ToInt32(dt.Rows[j]["InvoiceRowId"]) == Invoice_RowId)
                        {

                            LaborRate = txtEditLabor.Text; //Convert.ToString(dt_Fill.Rows[0]["laborRate"]);
                            CostPerUnit = txtEditCost.Text;  //Convert.ToString(dt_Fill.Rows[0]["costPerUnit"]);
                            QTY = txt_Qty.Text;
                            decimal srt = Convert.ToDecimal(QTY) * Convert.ToDecimal(CostPerUnit);
                            Total = Convert.ToString(srt);
                            dt.Rows[j]["NoOfInvoice"] = NoOfInvoice;
                            dt.Rows[j]["catId"] = CatId;
                            dt.Rows[j]["SubCategory"] = SubCatName;
                            dt.Rows[j]["THW"] = THW;
                            dt.Rows[j]["TMC"] = TMC;
                            dt.Rows[j]["Location"] = Location;
                            dt.Rows[j]["TypeOfMeasure"] = TypeOfMeasure;
                            dt.Rows[j]["LiurpCode"] = LiurpCode;
                            dt.Rows[j]["Unit"] = Unit;
                            dt.Rows[j]["LaborRate"] = LaborRate;
                            dt.Rows[j]["CostPerUnit"] = CostPerUnit;
                            dt.Rows[j]["QTY"] = QTY;
                            dt.Rows[j]["Total"] = Total;
                            dt.Rows[j]["RowType"] = RowType;
                            dt.Rows[j]["JobNumber"] = JobNumber;
                            dt.Rows[j]["UserId"] = Uid;
                            dt.Rows[j]["Description"] = Description;
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
                            dt_Insert.Rows[j]["TypeOfMeasure"] = TypeOfMeasure;
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
                            dt_Insert.Rows[j]["Description"] = Description;

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
                            dt.Rows[j]["TypeOfMeasure"] = TypeOfMeasure;
                            dt.Rows[j]["LiurpCode"] = LiurpCode;
                            dt.Rows[j]["Unit"] = Unit;
                            dt.Rows[j]["LaborRate"] = LaborRate;
                            dt.Rows[j]["CostPerUnit"] = CostPerUnit;
                            dt.Rows[j]["QTY"] = QTY;
                            dt.Rows[j]["Total"] = Total;
                            dt.Rows[j]["RowType"] = RowType;
                            dt.Rows[j]["JobNumber"] = JobNumber;
                            dt.Rows[j]["UserId"] = Uid;
                            dt.Rows[j]["Description"] = Description;
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
                            dt_Insert.Rows[j]["TypeOfMeasure"] = TypeOfMeasure;
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
                            dt_Insert.Rows[j]["Description"] = Description;
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
                    trEditLabor.Visible = false;
                    rdo_Custom.Checked = false;
                    rdo_Standard.Checked = true;
                    courier.Style.Add("display", "none");
                    txt_MEASURE_DESCRIPTION.Style.Add("display", "none");
                    trEditTypeMeasure.Style.Add("display", "table-row");
                    trEditDescLoc.Style.Add("display", "table-row");
                    DDl_MEASURE_DESCRIPTION.Style.Add("display", "block");
                    ddlTypeMeasure.SelectedIndex = 0;
                    txt_MEASURE_DESCRIPTION.Text = txtLoc.Text = txtSDesc.Text = txt_Qty.Text = txtEditCost.Text = txtEditLabor.Text = txt_Location.Text = txt_Liurp.Text = txt_Unit.Text = txt_LaborRate.Text = txt_THW.Text = txt_TMC.Text = txt_Total.Text = "";
                    abc();
                    BindSubCatDDL(CatId);
                    Response.Write("<script>alert('Record Updated');</script>");
                   // DDl_MEASURE_DESCRIPTION.SelectedIndex = 0;
                }
            }
            txt_Qty.Text = "";

            rdo_Custom.Checked = false;
            rdo_Standard.Checked = true;
            txtLoc.Text = "";
            txtSDesc.Text = "";
            txt_MEASURE_DESCRIPTION.Text = "";
            txtCDesc.Text = "";
            txt_Location.Text = "";
            txt_Liurp.Text = "";
            txt_LaborRate.Text = "";
            txt_TMC.Text = "";
            ddlTypeMeasure.SelectedIndex = 0;
            //  txt_SC.Text = "";
            txt_Unit.Text = "";
            txt_THW.Text = "";
            txt_Total.Text = "";
            ddlTypeMeasureStandard.SelectedIndex = 0;
            DDl_MEASURE_DESCRIPTION.SelectedIndex = 0;
        }
        else
        {
            Response.Write("<script>alert('Enter Qty');</scipt>");
        }
    }





    public void ShowInvoiceContain()
    {
        //DataTable dt = objInvoice.ShowInvoice_Contain(Convert.ToInt32(Request.QueryString["InvoiceNo"]), Convert.ToString(Request.QueryString["Jobs"]), CatId, Convert.ToInt32(Request.QueryString["Utility"]));
        //grdContainOfInvoice.DataSource = dt;
        //grdContainOfInvoice.DataBind();
    }
    protected void btn_Print_Click(object sender, EventArgs e)
    {
        txt_cal.Text = System.DateTime.Now.ToString("MM/dd/yyyy");
        BuildReport("Actual");
    }
    public void ShowLaborRate()
    {
        DataTable dt = new DataTable();
        DataTable dtZone = objNewThing.findZone(Convert.ToString(Request.QueryString["Jobs"]));
        if (Convert.ToString(dtZone.Rows[0]["PPlZone"]) == "1" || Convert.ToString(dtZone.Rows[0]["PPlZone"]) == "2")
        {
            dt = objNewThing.showLaborRate2();
        }
        else
        {
            dt = objNewThing.showLaborRate(Convert.ToString(Request.QueryString["Jobs"]));
        }
        if (dt.Rows.Count > 0)
        {
            hdn_txt_MinLaborRate.Value = Convert.ToString(dt.Rows[0]["MinLaborRate"]);
            if (hdn_txt_MinLaborRate.Value == "")
            {
                hdn_txt_MinLaborRate.Value = "0";
            }
            hdn_txt_MaxLaborRate.Value = Convert.ToString(dt.Rows[0]["MaxLaborRate"]);
            if (hdn_txt_MaxLaborRate.Value == "")
            {
                hdn_txt_MaxLaborRate.Value = "1";
            }
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
        dt_Insert.Columns.Add("TypeOfMeasure", typeof(string));
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
        dt_Insert.Columns.Add("Description", typeof(string));

        dt_Insert.AcceptChanges();
        ViewState["InsertTable"] = dt_Insert;
    }
    protected void grdContainOfInvoice_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Clear();
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
        dt.Columns.Add("Description", typeof(string));
        dt.Columns.Add("TypeOfMeasure", typeof(string));

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
                trEditLabor.Visible = true;
                txtSDesc.Text = dt.Rows[0]["Description"].ToString();
                txtLoc.Text = dt.Rows[0]["Location"].ToString();
                txtEditLabor.Text = Convert.ToString(dt.Rows[0]["LaborRate"]);
                txtEditCost.Text = Convert.ToString(dt.Rows[0]["CostPerUnit"]);
                rdo_Custom.Checked = false;
                rdo_Standard.Checked = true;
                courier.Style.Add("display", "none");
                txt_MEASURE_DESCRIPTION.Style.Add("display", "none");
                DDl_MEASURE_DESCRIPTION.Style.Add("display", "block");
                trEditTypeMeasure.Style.Add("display", "table-row");
                trEditDescLoc.Style.Add("display", "table-row");
                BindSubCatDDL(CatId);
                //string str = Convert.ToString(dt.Rows[0]["SubCategory"]);
                DDl_MEASURE_DESCRIPTION.SelectedValue = Convert.ToString(dt.Rows[0]["SubCatId"]);
                ListItem selectedListItem = DDl_MEASURE_DESCRIPTION.Items.FindByText(Convert.ToString(dt.Rows[0]["SubCategory"]));
                if (selectedListItem != null)
                {
                    selectedListItem.Selected = true;
                };


                ddlTypeMeasureStandard.SelectedValue = Convert.ToString(dt.Rows[0]["TypeOfMeasure"]);
                ListItem selectedListItem1 = ddlTypeMeasureStandard.Items.FindByText(Convert.ToString(dt.Rows[0]["TypeOfMeasure"]));
                if (selectedListItem1 != null)
                {
                    selectedListItem1.Selected = true;
                };

                //ddlTypeMeasureStandard.SelectedItem.Text = Convert.ToString(dt.Rows[0]["TypeOfMeasure"]);
            }
            else if (Convert.ToString(dt.Rows[0]["RowType"]) == "C")
            {
              //  trEditDescLoc.Visible = false;
                rdo_Standard.Checked = false;
                rdo_Custom.Checked = true;
                courier.Style.Add("display", "block");
                txt_MEASURE_DESCRIPTION.Style.Add("display", "block");
                DDl_MEASURE_DESCRIPTION.Style.Add("display", "none");
                txt_Location.Text = Convert.ToString(dt.Rows[0]["Location"]);
                trEditTypeMeasure.Style.Add("display", "none");

                trEditDescLoc.Style.Add("display", "none");
                //txt_SC.Text = Convert.ToString(dt.Rows[0]["TypeOfMeasure"]);
                ddlTypeMeasure.SelectedItem.Text = Convert.ToString(dt.Rows[0]["TypeOfMeasure"]);
                txt_Liurp.Text = Convert.ToString(dt.Rows[0]["LiurpCode"]);
                txt_Unit.Text = Convert.ToString(dt.Rows[0]["Unit"]);
                txt_LaborRate.Text = Convert.ToString(dt.Rows[0]["LaborRate"]);
                txt_THW.Text = Convert.ToString(dt.Rows[0]["THW"]);
                txt_TMC.Text = Convert.ToString(dt.Rows[0]["TMC"]);
                string total = Convert.ToString(dt.Rows[0]["Total"]);
                total = total.Replace('$', ' ');
                txt_Total.Text = Convert.ToString(total);
                txt_MEASURE_DESCRIPTION.Text = Convert.ToString(dt.Rows[0]["SubCategory"]);
                txtCDesc.Text = Convert.ToString(dt.Rows[0]["Description"]);
            }
        }

    }
    protected void btnShowPopup_Click1(object sender, EventArgs e)
    {

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
        string TypeOfMeasure = "";
        if (!DBNull.Value.Equals(dtFnlAmt.Rows[0]["TypeOfMeasure"]))
        {
            TypeOfMeasure = Convert.ToString(dtFnlAmt.Rows[0]["TypeOfMeasure"]);
        }

        //string ActTotal = "";
        //string sConstr = ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString;
        //using (SqlConnection conn = new SqlConnection(sConstr))
        //{
        //    using (SqlCommand comm = new SqlCommand())
        //    {
        //        comm.CommandType = CommandType.StoredProcedure;
        //        comm.CommandText = "proc_Act129Total";
        //        comm.Connection = conn;
        //        comm.Parameters.AddWithValue("@JobNumber", Request.QueryString["Jobs"]);
        //        comm.Parameters.AddWithValue("@Utility", Request.QueryString["Utility"]);
        //        comm.Parameters.AddWithValue("@NoOfInvoice", Request.QueryString["InvoiceNo"]);
        //        conn.Open();
        //        using (SqlDataAdapter da = new SqlDataAdapter(comm))
        //        {
        //            DataTable dtActTotal = new DataTable();
        //            da.Fill(dtActTotal);
        //            ActTotal = Convert.ToString(dtActTotal.Rows[0]["Total"]);
        //            if (ActTotal == "" || ActTotal == null)
        //            {
        //                ActTotal = "0.00";
        //            }
        //        }
        //        conn.Close();
        //    }
        //}
        decimal PaidInvAmt = Convert.ToDecimal(FnlInvAmt);//- Convert.ToDecimal(ActTotal)) * Convert.ToDecimal(0.80)) + Convert.ToDecimal(ActTotal);
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
        //ShowAllCategory();
        ShowLaborRate();
        ShowDataN(Request.QueryString["Jobs"].ToString());
        ViewStatePageLoad();
        setInvoiceAmt();
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
                    command.CommandText = "CREATE TABLE #TmpTable(InvoiceRowId int NOT NULL,NoOfInvoice int NULL,catId int NULL,SubCategory nvarchar(500) NULL,Location nvarchar(50) NULL,SC nvarchar(50) NULL,LiurpCode nvarchar(50) NULL,Unit nvarchar(50) NULL,LaborRate nvarchar(50) NULL,CostPerUnit nvarchar(50) NULL,THW nvarchar(50) NULL,TMC nvarchar(50) NULL,QTY nvarchar(50) NULL,Total nvarchar(50) NULL,RowType nvarchar(50) NULL,JobNumber nvarchar(50) NULL,UserId nvarchar(50) NULL,SwapId int NULL,Utility int NULL,submit_date nvarchar(50) NULL,Rad_btn nvarchar(500) NULL,SubCatId int NULL,LR nvarchar(50) NULL , Description nvarchar(1000) NULL , TypeOfMeasure nvarchar(50) NULL, Category nvarchar(50) NULL,Name nvarchar(50) NULL,MailingAddress1 nvarchar(50) NULL,Adr nvarchar(50) NULL,ContactResultDate nvarchar(50) NULL,WorkPhone nvarchar(50) NULL,Comp_Date nvarchar(50) NULL,Submit_Date1 nvarchar(50) NULL,Fnl_Total nvarchar(50) NULL,labor_Total nvarchar(50) NULL,cost_Total nvarchar(50) NULL,SC1 nvarchar(50) NULL,THW1 nvarchar(50) NULL,TMC1 nvarchar(50) NULL,CostPerUnit1 nvarchar(50) NULL,Total1 nvarchar(50) NULL,LaborRate1 nvarchar(50) NULL,ACT nvarchar(50) NULL,ACT2 nvarchar(50) NULL,Warm1 nvarchar(50) NULL,Warm2 nvarchar(50) NULL)";
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
                    command.CommandText = "UPDATE T SET T.NoOfInvoice = Temp.NoOfInvoice,T.catId = Temp.catId,T.SubCategory = Temp.SubCategory,T.Location = Temp.Location,T.TypeOfMeasure = Temp.TypeOfMeasure,T.LiurpCode = Temp.LiurpCode,T.Unit = Temp.Unit,T.LaborRate = Temp.LaborRate,T.CostPerUnit = Temp.CostPerUnit,T.THW = Temp.THW,T.TMC = Temp.TMC,T.QTY = Temp.QTY,T.Total = Temp.Total,T.RowType = Temp.RowType,T.JobNumber = Temp.JobNumber,T.UserId = Temp.UserId,T.SwapId = Temp.SwapId,T.Utility = Temp.Utility,T.submit_date = Temp.submit_date,T.Rad_btn = Temp.Rad_btn,T.SubCatId=Temp.SubCatId,T.LR=Temp.LR,T.Description=Temp.Description FROM AllInvoiceByJobNumberTBL T INNER JOIN #TmpTable Temp ON T.InvoiceRowId = Temp.InvoiceRowId";
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
                    //Response.Redirect("../Invoice_Crystal.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"]);
                }
            }
        }
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
                    command.CommandText = "CREATE TABLE #TmpTable1(InvoiceRowId int NOT NULL,NoOfInvoice int NULL,catId int NULL,SubCategory nvarchar(500) NULL,Location nvarchar(50) NULL,TypeOfMeasure nvarchar(50) NULL,LiurpCode nvarchar(50) NULL,Unit nvarchar(50) NULL,LaborRate nvarchar(50) NULL,CostPerUnit nvarchar(50) NULL,THW nvarchar(50) NULL,TMC nvarchar(50) NULL,QTY nvarchar(50) NULL,Total nvarchar(50) NULL,RowType nvarchar(50) NULL,JobNumber nvarchar(50) NULL,UserId nvarchar(50) NULL,SwapId int NULL,Utility int NULL,submit_date nvarchar(50) NULL,Rad_btn nvarchar(500) NULL,SubCatId int NULL,LR nvarchar(50) NULL,Description nvarchar(1000) NULL)";
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
                    command.CommandText = "INSERT INTO AllInvoiceByJobNumberTBL(NoOfInvoice, catId, SubCategory, Location, TypeOfMeasure, LiurpCode, Unit, LaborRate, CostPerUnit, THW, TMC, QTY, Total, RowType, JobNumber, UserId, SwapId, Utility, submit_date, Rad_btn, SubCatId, LR,Description) SELECT NoOfInvoice, catId, SubCategory, Location, TypeOfMeasure, LiurpCode, Unit, LaborRate, CostPerUnit, THW, TMC, QTY, Total, RowType, JobNumber, UserId, SwapId, Utility, submit_date, Rad_btn, SubCatId, LR, Description FROM #TmpTable1; DROP TABLE #TmpTable1;";
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    // Handle exception properly
                }
                finally
                {
                    // Deleting destination table
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
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Invoice_Crystal.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"]);
    }
    public void ShowDataN(string jobno)
    {
        DataSet dsShow = objInvoice.ShowDataN(jobno);
        DataTable dtShow = new DataTable();
        dtShow = dsShow.Tables[0];
        lbl_name1.Text = lbl_name.Text = dtShow.Rows[0]["Name"].ToString();
        lbl_jobno1.Text = lbl_jobno.Text = dtShow.Rows[0]["JobNumber"].ToString();
        lbl_phone1.Text = lbl_phone.Text = dtShow.Rows[0]["WorkPhone"].ToString();
        ViewState["PPlZone"] = Convert.ToString(dsShow.Tables[2].Rows[0]["PPlZone"]);
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
    public void GetCompletedDate(string jobno)
    {
        DataSet dt = objInvoice.GetCompletedDate(jobno, "PPl");
        if (dt.Tables[0].Rows.Count > 0)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(dt.Tables[0].Rows[0]["DateJobComplete"])))
                lblCompletedDate.Text = Convert.ToDateTime(dt.Tables[0].Rows[0]["DateJobComplete"]).ToString("MM/dd/yyy");
        }
    }
    // Update Complete Date.
    protected void btnUpdateDate_Click(object sender, EventArgs e)
    {
        DataTable dt = objInvoice.UpdateCompletedDate(Request.QueryString["Jobs"], "PPL", txtSetDate.Text);
        if (dt.Rows.Count > 0)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["AuditDate"])))
                lblCompletedDate.Text = Convert.ToDateTime(dt.Rows[0]["AuditDate"]).ToString("MM/dd/yyy");
        }
    }

    protected void DDl_MEASURE_DESCRIPTION_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtLoc.Text = "";
        txtSDesc.Text = "";
        ddlTypeMeasureStandard.SelectedIndex = 0;
        int SubCatId = Convert.ToInt32(DDl_MEASURE_DESCRIPTION.SelectedValue);
        DataTable dt__Fill = new DataTable();
      string  SubCatName1 = Convert.ToString(DDl_MEASURE_DESCRIPTION.SelectedItem);
        int lenghth = Convert.ToInt32(SubCatName1.Length);
        var pos = 2 + (SubCatName1.IndexOf('-'));
       string  SubCat = SubCatName1.Substring(pos, lenghth - pos);
       pos = (SubCat.IndexOf('$')) - 3;
       SubCat = SubCat.Substring(0, pos);
       var amount = SubCatName1.Substring(SubCatName1.LastIndexOf('-') + 3);

        if (Convert.ToString(ViewState["PPlZone"]) == "1" || Convert.ToString(ViewState["PPlZone"]) == "2")
        {
            dt__Fill = objInvoice.showAllThingByCatId_SubCatId(CatId, SubCatId);
        }
        else
        {
            dt__Fill = objInvoice.showAllThingByCatId_SubCatId(CatId, SubCatId, Convert.ToString(Request.QueryString["Jobs"]));
        }

        if (dt__Fill.Rows.Count > 0)
        {
            if (!DBNull.Value.Equals(dt__Fill.Rows[0]["location"]) && Convert.ToString(dt__Fill.Rows[0]["location"]) != "")
            {
                txtLoc.Text = Convert.ToString(dt__Fill.Rows[0]["location"]);

            }
            if (!DBNull.Value.Equals(dt__Fill.Rows[0]["Description"]) && Convert.ToString(dt__Fill.Rows[0]["Description"]) != "")
            {
                txtSDesc.Text = Convert.ToString(dt__Fill.Rows[0]["Description"]);

            }
            else if (!DBNull.Value.Equals(dt__Fill.Rows[0]["SubCatName"]) && Convert.ToString(dt__Fill.Rows[0]["SubCatName"]) != "")
            {
                txtSDesc.Text = Convert.ToString(dt__Fill.Rows[0]["SubCatName"]);
            }
            else
            {
                txtSDesc.Text = DDl_MEASURE_DESCRIPTION.SelectedItem.Text;
            }
                       
            for (int i = 0; i < dt__Fill.Rows.Count; i++)
            {
                if (!DBNull.Value.Equals(dt__Fill.Rows[i]["SubCatName"]) && Convert.ToString(dt__Fill.Rows[i]["SubCatName"]) != "" && (!DBNull.Value.Equals(dt__Fill.Rows[i]["costPerUnit"]) && Convert.ToString(dt__Fill.Rows[i]["costPerUnit"]) != ""))
                {
                    string catname = dt__Fill.Rows[i]["SubCatName"].ToString();
                    string unit = dt__Fill.Rows[i]["costPerUnit"].ToString();
                    if (catname == SubCat && unit == amount)
                    {

                        if (!DBNull.Value.Equals(dt__Fill.Rows[i]["TypeOfMeasure"]) && Convert.ToString(dt__Fill.Rows[i]["TypeOfMeasure"]) != "")
                        {
                            string measure = dt__Fill.Rows[i]["TypeOfMeasure"].ToString();

                            ddlTypeMeasureStandard.SelectedValue = ddlTypeMeasureStandard.Items.FindByText(measure).Value;
                        }
                    }
                }
            }
        }
    }


    //function CalculateLineSC() {
    //       var SC = document.getElementById('<%=txt_SC.ClientID %>').value;
    //       if (SC != '') {
    //           if (SC != 'S' && SC != 'C' && SC != 'R' && SC != 'SC') {
    //               alert('SC must be set to either  S  or  C  or  R  or  SC . ');
    //               document.getElementById('<%=txt_SC.ClientID %>').value = '';
    //           }
    //           else {
    //               document.getElementById('<%=txt_SC.ClientID %>').value = SC;
    //           }
    //       }
    //       else {
    //           alert('SC must be set to either  S  or  C  or  R  or  SC . ');
    //           document.getElementById('<%=txt_SC.ClientID %>').value = '';
    //       }
    //   }
}
