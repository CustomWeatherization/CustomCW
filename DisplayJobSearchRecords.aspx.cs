using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class DisplayJobSearchRecords : System.Web.UI.Page
{
    dc_AddNewJob objaddnewjob = new dc_AddNewJob();
    public DataTable dtJobSearch = new DataTable();
    Dc_AddORManageInvoice onjInvoice = new Dc_AddORManageInvoice();
    public static string pas_cd = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            DataTable dtU = objaddnewjob.ShowJobByJobNumber_ByJobNumber(Request.QueryString["Jobs"]);
            if (dtU.Rows.Count > 0 && !DBNull.Value.Equals(dtU.Rows[0]["DateAssigned"]))
            {
                ViewState["DateAssigned"] = Convert.ToDateTime(dtU.Rows[0]["DateAssigned"]).ToString("MM/dd/yyyy");
            }
            if (dtU.Rows.Count > 0 && !DBNull.Value.Equals(dtU.Rows[0]["Inspection"]) && Convert.ToBoolean(dtU.Rows[0]["Inspection"]) == true)
            {
                btnAudit.Text = "Inspection";
                btnPrintAudit.Text = "Print Inspection";

            }

            DivEstimate.Style.Add("display", "none");
            DataTable dt = onjInvoice.CheckJobExist(Request.QueryString["Jobs"]);
            if (Request.QueryString["GT"] == "Vendor")
            {
                try
                {
                    if (Request.QueryString["Jobs"] == dt.Rows[0]["VendorJobNumber"].ToString())
                    {
                        PPLSearch.Visible = false;
                        METEDSearch.Visible = false;
                        PrivateTBL.Visible = false;
                        Table1.Visible = false;
                        TblDCED.Visible = false;
                        tblUGI.Visible = false;
                        tblARRA.Visible = false;
                        tblCADCOM.Visible = false;
                        tblWAP.Visible = false;
                        tblBCOC.Visible = false;
                        tblVendor.Visible = true;
                        ShowVendorByJobID();
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("Home.aspx");
                }


            }
            else
            {
                if (dt.Rows.Count > 0)
                {
                    btnEstimate.Visible = false;
                    btnGenarateInvoice.Visible = false;
                    BtnMetedInvoice.Visible = false;
                    DDL_Invoice.Visible = true;
                    DDL_MetedInvoice.Visible = true;

                    // Bcoc
                    BtnBcoc.Visible = false;
                    Dll_Bcoc.Visible = true;

                    //UGI

                    BtnUGI.Visible = false;
                    Dll_UGI.Visible = true;

                    //DCED

                    BtnDCED.Visible = false;
                    Dll_DCED.Visible = true;

                    //DDL_InvolicePayment.Visible = true;
                    //spnInv.Visible = true;
                    DDL_InvoiceBind();
                }
                else
                {
                    btnEstimate.Visible = true;
                    btnGenarateInvoice.Visible = true;
                    BtnMetedInvoice.Visible = true;
                    DDL_Invoice.Visible = false;
                    DDL_MetedInvoice.Visible = false;
                    DDL_PrivateJob.Visible = false;

                    // Bcoc
                    Dll_Bcoc.Visible = false;
                    BtnBcoc.Visible = true;
                    //UGI
                    BtnUGI.Visible = true;
                    Dll_UGI.Visible = false;

                    //DCED
                    BtnDCED.Visible = true;
                    Dll_DCED.Visible = false;

                    //DDL_InvolicePayment.Visible = false;
                    //spnInv.Visible = false;
                }
                string utlty = Request.QueryString["Utility"].ToString();
                if (Request.QueryString["Jobs"] == null)
                {
                    Response.Redirect("Home.aspx");
                }
                else if (Request.QueryString["Utility"] == null)
                {
                    Response.Redirect("Home.aspx");
                }
                if (Request.QueryString["Utility"].ToString() == "1")
                {
                    PPLSearch.Visible = false;
                    METEDSearch.Visible = true;
                    TblDCED.Visible = false;
                    tblUGI.Visible = false;
                    tblARRA.Visible = false;
                    tblCADCOM.Visible = false;
                    tblWAP.Visible = false;
                    tblBCOC.Visible = false;
                }
                else if (Request.QueryString["Utility"].ToString() == "2")
                {
                    PPLSearch.Visible = true;
                    TblDCED.Visible = false;
                    tblUGI.Visible = false;
                    tblARRA.Visible = false;
                    tblCADCOM.Visible = false;
                    tblWAP.Visible = false;
                    tblBCOC.Visible = false;
                    //DivPayment.Attributes["class"] = DivPayment.Attributes["class"].Replace("Div_Sub", "");
                    //DivPayment.Attributes.Remove("DivSub");
                    //DivPayment.Attributes.Add("class", "Div_Sub");
                    METEDSearch.Visible = false;
                }
                else if (Request.QueryString["Utility"].ToString() == "7")
                {
                    PPLSearch.Visible = false;
                    METEDSearch.Visible = false;
                    PrivateTBL.Visible = true;
                    TblDCED.Visible = false;
                    tblUGI.Visible = false;
                    tblARRA.Visible = false;
                    tblCADCOM.Visible = false;
                    tblWAP.Visible = false;
                    tblBCOC.Visible = false;
                }
                else if (utlty == "3")
                {
                    PPLSearch.Visible = false;
                    METEDSearch.Visible = false;
                    Table1.Visible = false;
                    TblDCED.Visible = true;
                    tblUGI.Visible = false;
                    tblARRA.Visible = false;
                    tblCADCOM.Visible = false;
                    tblWAP.Visible = false;
                    tblBCOC.Visible = false;

                }
                else if (utlty == "4")
                {
                    PPLSearch.Visible = false;
                    METEDSearch.Visible = false;
                    Table1.Visible = false;
                    TblDCED.Visible = false;
                    tblUGI.Visible = true;
                    tblARRA.Visible = false;
                    tblCADCOM.Visible = false;
                    tblWAP.Visible = false;
                    tblBCOC.Visible = false;

                }
                //else if (utlty == "5")
                //{
                //    PPLSearch.Visible = false;
                //    METEDSearch.Visible = false;
                //    Table1.Visible = false;
                //    TblDCED.Visible = false;
                //    tblUGI.Visible = false;
                //    tblARRA.Visible = true;
                //    tblCADCOM.Visible = false;
                //    tblWAP.Visible = false;
                //    tblBCOC.Visible = false;

                //}
                //else if (utlty == "6")
                //{
                //    PPLSearch.Visible = false;
                //    METEDSearch.Visible = false;
                //    Table1.Visible = false;
                //    TblDCED.Visible = false;
                //    tblUGI.Visible = false;
                //    tblARRA.Visible = false;
                //    tblCADCOM.Visible = true;
                //    tblWAP.Visible = false;
                //    tblBCOC.Visible = false;

                //}
                //else if (utlty == "8")
                //{
                //    PPLSearch.Visible = false;
                //    METEDSearch.Visible = false;
                //    Table1.Visible = false;
                //    TblDCED.Visible = false;
                //    tblUGI.Visible = false;
                //    tblARRA.Visible = false;
                //    tblCADCOM.Visible = false;
                //    tblWAP.Visible = true;
                //    tblBCOC.Visible = false;

                //}
                else if (utlty == "9")
                {
                    PPLSearch.Visible = false;
                    METEDSearch.Visible = false;
                    Table1.Visible = false;
                    TblDCED.Visible = false;
                    tblUGI.Visible = false;
                    tblARRA.Visible = false;
                    tblCADCOM.Visible = false;
                    tblWAP.Visible = false;
                    tblBCOC.Visible = true;

                }
                else if (utlty == "5" || utlty == "6" || utlty == "8")
                {
                    PPLSearch.Visible = false;
                    METEDSearch.Visible = false;
                    TblDCED.Visible = false;
                    Table1.Visible = true;
                    TblDCED.Visible = false;
                    tblUGI.Visible = false;
                    tblARRA.Visible = false;
                    tblCADCOM.Visible = false;
                    tblWAP.Visible = false;
                    tblBCOC.Visible = false;
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
                ShowJobsByJobID();
            }

            ShowJobsByJobID();
        }

    }

    public void DDL_InvoiceBind()
    {
        int i = 0;
        for (i = 1; i <= Convert.ToInt32(Request.QueryString["InvoiceNo"].ToString()); i++)
        {
            DDL_Invoice.Items.Add("Invoice No " + i);
            DDL_MetedInvoice.Items.Add("Invoice No " + i);
            DDL_PrivateJob.Items.Add("Estimate No " + i);

            Dll_Bcoc.Items.Add("Invoice No " + i);
            Dll_DCED.Items.Add("Invoice No " + i);

            //DDL_InvolicePayment.Items.Add(i.ToString());
        }
        DDL_Invoice.Items.Add("Generate Invoice");
        DDL_Invoice.Items.Insert(0, "Select");

        Dll_DCED.Items.Add("Generate Invoice");
        Dll_DCED.Items.Insert(0, "Select");

        DDL_MetedInvoice.Items.Add("Generate Invoice");
        DDL_MetedInvoice.Items.Insert(0, "Select");


        Dll_Bcoc.Items.Add("Generate Invoice");
        Dll_Bcoc.Items.Insert(0, "Select");


        DDL_PrivateJob.Items.Add("Generate Estimate");
        DDL_PrivateJob.Items.Insert(0, "Select");
    }


    #region Fill Name OF Customer
    public void ShowJobsByJobID()
    {
        if (Request.QueryString["Jobs"] != null)
        {
            if (Request.QueryString["Jobs"].ToString() != "")
            {
                dtJobSearch = objaddnewjob.ShowJobByJobNumber_ByJobNumber(Request.QueryString["Jobs"].ToString());
                if (dtJobSearch.Rows.Count>0&&!DBNull.Value.Equals(dtJobSearch.Rows[0]["VendorPdfPath"]) )
                {
                    string AllPdf = Convert.ToString(dtJobSearch.Rows[0]["VendorPdfPath"]);//"amar.pdf,sameer.pdf,rohan.pdf,pdf-sample.pdf,baba.pdf,";
                    string[] SplitPdf = AllPdf.Split(',');
                    DDlAllPDF.Items.Insert(0, "Select");
                    for (int i = 0; i < SplitPdf.Length - 1; i++)
                    {
                        DDlAllPDF.Items.Insert(i + 1, Convert.ToString(SplitPdf[i]));
                    }
                
                
                
              
                if (Convert.ToBoolean(dtJobSearch.Rows[0]["Act129"]) == true || Convert.ToBoolean(dtJobSearch.Rows[0]["BaseLoadOnly"]) == true || Convert.ToBoolean(dtJobSearch.Rows[0]["HighPriority"]) == true || Convert.ToBoolean(dtJobSearch.Rows[0]["FullCost"]) == true || Convert.ToBoolean(dtJobSearch.Rows[0]["LowCost"]) == true)
                {
                    //ddlPPLinvoiceMenu2.Visible = true;
                    ddlPPLinvoiceMenu2.Visible = false;
                    ddlAct129IIPPLinvoiceMenu.Visible = false;

                }
                if (Convert.ToBoolean(dtJobSearch.Rows[0]["Act129II"]) == true || Convert.ToBoolean(dtJobSearch.Rows[0]["BaseLoadOnly"]) == true || Convert.ToBoolean(dtJobSearch.Rows[0]["HighPriority"]) == true || Convert.ToBoolean(dtJobSearch.Rows[0]["FullCost"]) == true || Convert.ToBoolean(dtJobSearch.Rows[0]["LowCost"]) == true)
                {
                    //ddlAct129IIPPLinvoiceMenu2.Visible = true;
                    ddlAct129IIPPLinvoiceMenu2.Visible = false;
                    ddlPPLinvoiceMenu.Visible = false;
                }
                if (Convert.ToString(dtJobSearch.Rows[0]["Finalize"]) == "F" && Convert.ToBoolean(dtJobSearch.Rows[0]["Act129"]) == true)
                {
                    //ddlPPLinvoiceMenu.Visible = true;
                    ddlPPLinvoiceMenu.Visible = false;
                    ddlPPLinvoiceMenu2.Visible = false;
                }
                if (Convert.ToString(dtJobSearch.Rows[0]["Finalize"]) == "F" && Convert.ToBoolean(dtJobSearch.Rows[0]["Act129II"]) == true)
                {
                    ddlAct129IIPPLinvoiceMenu2.Visible = false;
                    //ddlAct129IIPPLinvoiceMenu.Visible = true;
                    ddlAct129IIPPLinvoiceMenu.Visible = false;
                }

                if (Convert.ToString(dtJobSearch.Rows[0]["Finalize"]) != "F" && Convert.ToBoolean(dtJobSearch.Rows[0]["Act129II"]) == true)
                {
                    //ddlAct129IIPPLinvoiceMenu2.Visible = true;
                    ddlAct129IIPPLinvoiceMenu2.Visible = false;
                    ddlAct129IIPPLinvoiceMenu.Visible = false;
                }

                if (Convert.ToString(dtJobSearch.Rows[0]["Finalize"]) != "F" && Convert.ToBoolean(dtJobSearch.Rows[0]["Act129"]) == true)
                {
                    //ddlPPLinvoiceMenu2.Visible = true;
                    ddlPPLinvoiceMenu2.Visible = false;
                    ddlPPLinvoiceMenu.Visible = false;
                }
                }
            }
        }
    }
    #region show vendor by id
    public void ShowVendorByJobID()
    {
        if (Request.QueryString["Jobs"] != null)
        {
            if (Request.QueryString["Jobs"].ToString() != "")
            {
                dtJobSearch = objaddnewjob.ShowVendorByVendorNumber_ByVendorNumber(Request.QueryString["Jobs"].ToString());

            }
        }
    }
    #endregion
    protected void btn_Update_Click(object sender, EventArgs e)
    {

        rdoInvoice.Checked = rdoAudit.Checked = false;
        rdoInvoice.Enabled = rdoAudit.Enabled = false;
        trInv.Visible = trQ.Visible = false;
        string UID = "";
        smUtil objSm = new smUtil();
        UID = objSm.GetCookie("AId");
        ////exec proc_insertPayment '4899','181895',2,22
        // DataSet ds = objaddnewjob.InsertPayment(txt_pwd.Text, Convert.ToString(Request.QueryString["jobs"]), Convert.ToInt32(Request.QueryString["Utility"]), Convert.ToInt32(UID));
        DataSet ds = objaddnewjob.InsertPayment(txt_pwd.Text, Convert.ToString(Request.QueryString["jobs"]), Convert.ToInt32(Request.QueryString["Utility"]), Convert.ToInt32(UID));

        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0 && ds.Tables[1].Rows.Count > 0 && (ds.Tables[2].Rows.Count > 0 || ds.Tables[2].Rows.Count == 0))
            {


                decimal PersentRate;
                decimal AuditRate;
                //decimal inspectionrate;
                if (!DBNull.Value.Equals(ds.Tables[0].Rows[0]["InspectionRate"]) && ds.Tables[0].Rows[0]["InspectionRate"] != null)
                {
                    string inspectionrate = Convert.ToString(ds.Tables[0].Rows[0]["InspectionRate"]);
                    int i = objaddnewjob.MakePayment(Convert.ToInt32(1), Convert.ToString(Request.QueryString["jobs"]), Convert.ToInt32(Request.QueryString["Utility"]), "Inspection", txt_pwd.Text, "0.00", Convert.ToDecimal(inspectionrate), UID, "F");
                    Table3.Style.Add("display", "none");
                    Panel1.Visible = false;
                    if (i == 1 || i == 2 || i == 3 || i == 4 || i == 5)
                    {
                        lblMsg.Text = "Submitted successfully !!";
                    }
                    else if (i == -1)
                    {
                        lblMsg.Text = "Already submitted !!";
                    }


                }
                else
                {
                    string Persent_Rate = Convert.ToString(ds.Tables[0].Rows[0]["PersentageRate"]);
                    string Audit_Rate = Convert.ToString(ds.Tables[0].Rows[0]["AuditRate"]);
                    if (Persent_Rate == "")
                    {
                        PersentRate = Convert.ToDecimal("0.00");
                    }
                    else
                    {
                        PersentRate = Convert.ToDecimal(Persent_Rate);
                    }
                    if (Audit_Rate == "")
                    {
                        AuditRate = Convert.ToDecimal("0.00");
                    }
                    else
                    {
                        AuditRate = Convert.ToDecimal(Audit_Rate);
                    }



                    ////////////////////////////////////////////////////////////////////

                    if (AuditRate != Convert.ToDecimal("0.00") && Audit_Rate != "")
                    {
                        rdoAudit.Enabled = true;
                    }
                    if (PersentRate != Convert.ToDecimal("0.00") && Persent_Rate != "")
                    {
                        rdoInvoice.Enabled = true;
                    }

                    /////////////////////////////////////////////////////////////////////




                    string AuditStatus = Convert.ToString(ds.Tables[1].Rows[0]["Status"]);
                    if (ds.Tables[2].Rows.Count > 0)
                    {
                        Ddl_Inv.DataSource = ds.Tables[2];
                        Ddl_Inv.DataTextField = "NoOfInvoice";
                        Ddl_Inv.DataValueField = "NoOfInvoice";
                        Ddl_Inv.DataBind();
                    }

                    P1.Style.Add("display", "none");
                    Table3.Style.Add("display", "none");
                    Panel1.Visible = true;
                    pas_cd = txt_pwd.Text;
                    txt_pwd.Text = "";


                }
            }
            else
            {
                txt_pwd.Text = "";
                P1.Style.Add("display", "block");
                Table3.Style.Add("display", "block");
                lblErMsg.Text = "There is no Audit or Invoice for Pay.";
            }
        }
        else
        {
            txt_pwd.Text = "";
            P1.Style.Add("display", "block");
            Table3.Style.Add("display", "block");
            lblErMsg.Text = "Please enter valid passcode !!";
        }

    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Table3.Style.Add("display", "none");
    }
    protected void btn_CancelP2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
    protected void rdoInvoice_CheckedChanged(Object sender, EventArgs e)
    {
        trQ.Visible = false;
        if (Request.QueryString["InvoiceNo"] != null)
        {
            Ddl_Inv.SelectedValue = Request.QueryString["InvoiceNo"].ToString();
        }
        rdoYes.Checked = rdoNo.Checked = false;
        rdoNo.Checked = true;
        trInv.Visible = true;
        BtnPay.Focus();
    }
    protected void rdoAudit_CheckedChanged(Object sender, EventArgs e)
    {
        trInv.Visible = false;
        DataTable dt = objaddnewjob.GetMesrNdQuestion(pas_cd);
        lblQuesMesr.Text = Convert.ToString(dt.Rows[0]["QuestionMesr"]);
        hdnExtraMesr.Value = Convert.ToString(dt.Rows[0]["ExtraMesr"]);
        trQ.Visible = true;
        BtnPay.Focus();
    }
    protected void BtnPay_Click(object sender, EventArgs e)
    {
        string ActTotal = "";
        string sConstr = ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(sConstr))
        {
            using (SqlCommand comm = new SqlCommand())
            {
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "proc_Act129Total";
                comm.Connection = conn;
                comm.Parameters.AddWithValue("@JobNumber", Convert.ToString(Request.QueryString["jobs"]));
                comm.Parameters.AddWithValue("@Utility", Convert.ToInt32(Request.QueryString["Utility"]));
                comm.Parameters.AddWithValue("@NoOfInvoice", Request.QueryString["InvoiceNo"].ToString());
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(comm))
                {
                    DataTable dt_ = new DataTable();
                    da.Fill(dt_);
                    ActTotal = Convert.ToString(dt_.Rows[0]["Total"]);
                    if (ActTotal == "" || ActTotal == null)
                    {
                        ActTotal = "0.00";
                    }
                }
                conn.Close();
            }
        }
        string invNo = "0";
        string flag = "";
        int i = 0;
        if (rdoInvoice.Checked == true)
        {
            invNo = Convert.ToString(Ddl_Inv.SelectedItem.Text);
            flag = "Invoice";
        }
        else if (rdoAudit.Checked == true)
        {
            flag = "Audit";
        }
        if (rdoInvoice.Checked == true || rdoAudit.Checked == true)
        {
            string ExtraMesr = "0.00";
            if (rdoYes.Checked)
            {
                ExtraMesr = hdnExtraMesr.Value;
            }
            else if (rdoNo.Checked)
            {
                ExtraMesr = "0.00";
            }
            smUtil objSm = new smUtil();
            string AID = "";
            AID = objSm.GetCookie("AID");
            i = objaddnewjob.MakePayment(Convert.ToInt32(invNo), Convert.ToString(Request.QueryString["jobs"]), Convert.ToInt32(Request.QueryString["Utility"]), flag, pas_cd, ExtraMesr, Convert.ToDecimal(ActTotal), AID, "F");
        }
        Table3.Style.Add("display", "none");
        Panel1.Visible = false;
        if (i == 3 || i == 5 || i==4)
        {
            lblMsg.Text = "Submitted successfully !!";
        }
        else if (i == -1)
        {
            lblMsg.Text = "Already submitted !!";
        }
        else if (i == 1)
        {
            lblMsg.Text = "You have successfully ReSubmitted!!";
 
        }

    }

    #endregion

    protected void btnEstimate_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Utility"] != null && Request.QueryString["jobs"] != null)
        {
            if (Request.QueryString["Utility"].ToString() != "" && Request.QueryString["jobs"].ToString() != "")
            {
                Response.Redirect("PrivateCustomer/ManagePrivateEstimate.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Utility"] != null && Request.QueryString["jobs"] != null)
        {
            if (Request.QueryString["Utility"].ToString() != "" && Request.QueryString["jobs"].ToString() != "")
            {
                if (Request.QueryString["Utility"].ToString() == "1")
                {
                    Response.Redirect("AddNewJob.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&UC=MET ED&Back=DisplayJobSearchRecords");
                }
                else if (Request.QueryString["Utility"].ToString() == "2")
                {
                    Response.Redirect("AddNewJob.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&UC=PPL&Back=DisplayJobSearchRecords");
                }
                else if (Request.QueryString["Utility"].ToString() == "3")
                {
                    Response.Redirect("AddNewJob.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&UC=DCED&Back=DisplayJobSearchRecords");
                }
                else if (Request.QueryString["Utility"].ToString() == "4")
                {
                    Response.Redirect("AddNewJob.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&UC=UGI&Back=DisplayJobSearchRecords");
                }
                else if (Request.QueryString["Utility"].ToString() == "5")
                {
                    Response.Redirect("AddNewJob.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&UC=ARRA&Back=DisplayJobSearchRecords");
                }
                else if (Request.QueryString["Utility"].ToString() == "6")
                {
                    Response.Redirect("AddNewJob.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&UC=CADCOM&Back=DisplayJobSearchRecords");
                }
                else if (Request.QueryString["Utility"].ToString() == "7")
                {
                    Response.Redirect("AddNewJob.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&UC=PRIVATE CUSTOMER&Back=DisplayJobSearchRecords");
                }
                else if (Request.QueryString["Utility"].ToString() == "8")
                {
                    Response.Redirect("AddNewJob.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&UC=WAP&Back=DisplayJobSearchRecords");
                }
                else if (Request.QueryString["Utility"].ToString() == "9")
                {
                    Response.Redirect("AddNewJob.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&UC=BCOC&Back=DisplayJobSearchRecords");
                }
            }
        }
    }

    protected void BtnVendor_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["jobs"] != "" && Request.QueryString["jobs"] != null)
        {
            if (Request.QueryString["GT"] == "Vendor")
            {
                Response.Redirect("AddNewJob.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["jobs"].ToString() + "&GT=Vendor&Back=DisplayJobSearchRecords");
            }
        }
    }

    protected void btnAudit_Click(object sender, EventArgs e)
    {
        bool bit = false;
        if (Request.QueryString["Utility"] != null && Request.QueryString["jobs"] != null)
        {
            if (Request.QueryString["Utility"].ToString() != "" && Request.QueryString["jobs"].ToString() != "")
            {
                dtJobSearch = objaddnewjob.ShowJobByJobNumber_ByJobNumber(Request.QueryString["Jobs"].ToString());
               
                if (!DBNull.Value.Equals(dtJobSearch.Rows[0]["Inspection"]))
                {
                    var dbbit = dtJobSearch.Rows[0]["Inspection"];
                    if (dtJobSearch.Rows.Count > 0 && dtJobSearch.Rows[0]["Inspection"] != null && Convert.ToBoolean(dtJobSearch.Rows[0]["Inspection"]) == true)
                    {
                        bit = Convert.ToBoolean(dtJobSearch.Rows[0]["Inspection"]);
                    }
                }
                if (bit == true)
                {
                    Response.Redirect("PPLAudit/PPL_Inspection.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());

                }
                else
                {
                    Response.Redirect("PPLAudit/PPL_Audit_1.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());

                }

            }
        }
    }


    protected void btnPrintAudit_Click(object sender, EventArgs e)
    {
        dtJobSearch = objaddnewjob.ShowJobByJobNumber_ByJobNumber(Request.QueryString["Jobs"].ToString());


        if (dtJobSearch.Rows.Count > 0 && !DBNull.Value.Equals(dtJobSearch.Rows[0]["Inspection"]) && dtJobSearch.Rows[0]["Inspection"] != null && Convert.ToBoolean(dtJobSearch.Rows[0]["Inspection"]) == true)
        {
            Response.Redirect("PPLAudit/PPL_Inspection.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
        }
        else
        {
            Response.Redirect("PPLAudit/PPL_Audit_Page.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }


    protected void ddlPPLinvoiceMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str = ddlPPLinvoiceMenu.SelectedValue;

        if (ddlPPLinvoiceMenu.SelectedValue != "0")
        {
            if (ddlPPLinvoiceMenu.SelectedValue == "1")
            {
                Response.Redirect("PPLAudit/PPL_Invoice_Page1.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlPPLinvoiceMenu.SelectedValue == "2")
            {
                Response.Redirect("PPLAudit/PPL_Invoice_Page2.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlPPLinvoiceMenu.SelectedValue == "3")
            {
                Response.Redirect("PPLAudit/PPL_Invoice_Page3.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlPPLinvoiceMenu.SelectedValue == "4")
            {
                Response.Redirect("PPLAudit/PPL_Invoice_Page4.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlPPLinvoiceMenu.SelectedValue == "5")
            {
                Response.Redirect("PPLAudit/PPLInvoicePage5.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlPPLinvoiceMenu.SelectedValue == "6")
            {
                Response.Redirect("PPLAudit/PPL_Invoice_Page.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
        }
    }




    protected void ddlPPLinvoiceMenu2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str1 = ddlPPLinvoiceMenu2.SelectedValue;

        if (ddlPPLinvoiceMenu2.SelectedValue != "0")
        {
            if (ddlPPLinvoiceMenu2.SelectedValue == "1")
            {
                Response.Redirect("PPLAudit/PPL_Invoice_Page1.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlPPLinvoiceMenu2.SelectedValue == "2")
            {
                Response.Redirect("PPLAudit/PPL_Invoice_Page2.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlPPLinvoiceMenu2.SelectedValue == "3")
            {
                Response.Redirect("PPLAudit/PPL_Invoice_Page3.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlPPLinvoiceMenu2.SelectedValue == "4")
            {
                Response.Redirect("PPLAudit/PPL_Invoice_Page4.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlPPLinvoiceMenu2.SelectedValue == "5")
            {
                Response.Redirect("PPLAudit/PPLInvoicePage5.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlPPLinvoiceMenu2.SelectedValue == "6")
            {
                Response.Redirect("PPLAudit/PPL_Invoice_Page.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
        }
    }

    protected void ddlAct129IIPPLinvoiceMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlAct129IIPPLinvoiceMenu.SelectedValue != "0")
        {
            if (ddlAct129IIPPLinvoiceMenu.SelectedValue == "1")
            {
                Response.Redirect("PPLAudit/Act129_II_PPL_InvoicePage1.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlAct129IIPPLinvoiceMenu.SelectedValue == "2")
            {
                Response.Redirect("PPLAudit/Act129_II_PPL_InvoicePage2.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlAct129IIPPLinvoiceMenu.SelectedValue == "3")
            {
                Response.Redirect("PPLAudit/Act129_II_PPL_InvoicePage3.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlAct129IIPPLinvoiceMenu.SelectedValue == "6")
            {
                Response.Redirect("PPLAudit/Print_Act129II_Invoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }

        }


    }

    protected void ddlAct129IIPPLinvoiceMenu2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlAct129IIPPLinvoiceMenu2.SelectedValue != "0")
        {
            if (ddlAct129IIPPLinvoiceMenu2.SelectedValue == "1")
            {
                Response.Redirect("PPLAudit/Act129_II_PPL_InvoicePage1.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlAct129IIPPLinvoiceMenu2.SelectedValue == "2")
            {
                Response.Redirect("PPLAudit/Act129_II_PPL_InvoicePage2.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlAct129IIPPLinvoiceMenu2.SelectedValue == "3")
            {
                Response.Redirect("PPLAudit/Act129_II_PPL_InvoicePage3.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (ddlAct129IIPPLinvoiceMenu2.SelectedValue == "6")
            {
                Response.Redirect("PPLAudit/Print_Act129II_Invoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
        }
    }








    protected void btnAuditMETED_Click(object sender, EventArgs e)
    {
        dtJobSearch = objaddnewjob.ShowJobByJobNumber_ByJobNumber(Request.QueryString["Jobs"].ToString());
        if (Request.QueryString["Utility"] != null && Request.QueryString["jobs"] != null)
        {
            if (Request.QueryString["Utility"].ToString() != "" && Request.QueryString["jobs"].ToString() != "")
            {
                if (Convert.ToDateTime(ViewState["DateAssigned"]) >= new DateTime(2016, 11, 1, 0, 0, 0))
                {
                    Response.Redirect("NewMETED/METED_Audit_Page1.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Request.QueryString["Utility"].ToString());
                }
                else
                {
                    Response.Redirect("METED/METED_Audit_Page1.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Request.QueryString["Utility"].ToString());
                }
                // Response.Redirect("METED/METED_Audit_Page1.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
            }
        }
    }


    protected void btnPrintAuditMETED_Click(object sender, EventArgs e)
    {
        if (Convert.ToDateTime(ViewState["DateAssigned"]) >= new DateTime(2016, 11, 1, 0, 0, 0))
        {
            Response.Redirect("NewMETED/METED_Audit_Print.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
        }
        else
        {
            Response.Redirect("METED/METED_Audit_Print.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
        }


    }
    protected void DDL_METEDPrintInvoice_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDL_METEDPrintInvoice.SelectedValue != "0")
        {
            if (DDL_METEDPrintInvoice.SelectedValue == "1")
            {
                //Response.Redirect("PPLAudit/PPL_Invoice_Page1.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else if (DDL_METEDPrintInvoice.SelectedValue == "6")
            {
                // Response.Redirect("PPLAudit/PPL_Invoice_Page.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
        }
    }
    protected void BtnMetedInvoice_Click(object sender, EventArgs e)
    {
        Response.Redirect("METED/ManageMetedIncoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"] + "");
    }
    protected void BtnBcoc_Click(object sender, EventArgs e)
    {
        Response.Redirect("BCOC/ManageBCOCEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"] + "");
    }
    protected void btnGenarateInvoice_Click(object sender, EventArgs e)
    {
        Response.Redirect("PPLAudit/AddOrManageInvoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"] + "");
    }
    protected void DDL_Invoice_SelectedIndexChanged(object sender, EventArgs e)
    {
        string DDL_InvoiceItem = Convert.ToString(DDL_Invoice.SelectedItem);
        if (DDL_InvoiceItem == "Select")
        {
            Response.Write("<script>alert('Please select any Invoice or Generate New Invoice');</script>");
        }
        else if (DDL_InvoiceItem == "Generate Invoice")
        {
            int InvoiceNo = Convert.ToInt32(Request.QueryString["InvoiceNo"]) + 1;
            Response.Redirect("PPLAudit/AddOrManageInvoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
        else if (DDL_InvoiceItem != "Generate Invoice" && DDL_InvoiceItem != "Select")
        {
            string[] SplitInvoiceNo = DDL_InvoiceItem.Split(' ');
            string InvoiceNo = Convert.ToString(SplitInvoiceNo[2]);
            Response.Redirect("Invoice_Crystal.aspx?Back=dj&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
    }
    protected void DDL_MetedInvoice_SelectedIndexChanged(object sender, EventArgs e)
    {
        string DDL_InvoiceItem = Convert.ToString(DDL_MetedInvoice.SelectedItem);
        if (DDL_InvoiceItem == "Select")
        {
            Response.Write("<script>alert('Please select any Invoice or Generate New Invoice');</script>");
        }
        else if (DDL_InvoiceItem == "Generate Invoice")
        {
            int InvoiceNo = Convert.ToInt32(Request.QueryString["InvoiceNo"]) + 1;
            Response.Redirect("METED/ManageMetedIncoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");

        }
        else if (DDL_InvoiceItem != "Generate Invoice" && DDL_InvoiceItem != "Select")
        {
            string[] SplitInvoiceNo = DDL_InvoiceItem.Split(' ');
            string InvoiceNo = Convert.ToString(SplitInvoiceNo[2]);
            Response.Redirect("Invoice_Crystal.aspx?Back=dj&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
            //Response.Redirect("METED/ManageMetedIncoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
    }
    protected void DDL_PrivateJob_SelectedIndexChanged(object sender, EventArgs e)
    {
        dtJobSearch = objaddnewjob.ShowJobByJobNumber_ByJobNumber(Request.QueryString["Jobs"].ToString());
        string DDL_InvoiceItem = Convert.ToString(DDL_PrivateJob.SelectedItem);
        if (DDL_InvoiceItem == "Select")
        {
            DivEstimate.Style.Add("display", "none");
            Response.Write("<script>alert('Please select any Invoice or Generate New Invoice');</script>");
        }
        else if (DDL_InvoiceItem == "Generate Estimate")
        {
            int InvoiceNo = Convert.ToInt32(Request.QueryString["InvoiceNo"]) + 1;
            Response.Redirect("PrivateCustomer/ManagePrivateEstimate.aspx?Back=dj&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
        else if (DDL_InvoiceItem != "Generate Invoice" && DDL_InvoiceItem != "Select")
        {
            DivEstimate.Style.Add("display", "block");
            //string[] SplitInvoiceNo = DDL_InvoiceItem.Split(' ');
            //string InvoiceNo = Convert.ToString(SplitInvoiceNo[2]);
            //Response.Redirect("Invoice_Crystal.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
            //Response.Redirect("METED/ManageMetedIncoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
    }
    protected void rdoDefaultEstimate_CheckedChanged(object sender, EventArgs e)
    {
        ShowEstimate(rdoDefaultEstimate.Text);
    }
    protected void rdoStandardEstimate_CheckedChanged(object sender, EventArgs e)
    {
        ShowEstimate(rdoStandardEstimate.Text);
    }
    public void ShowEstimate(string typeEst)
    {
        string DDL_InvoiceItem = Convert.ToString(DDL_PrivateJob.SelectedItem);
        //if (DDL_InvoiceItem == "Select")
        //{
        //    Response.Write("<script>alert('Please select any Invoice or Generate New Invoice');</script>");
        //}
        //else if (DDL_InvoiceItem == "Generate Estimate")
        //{
        //    int InvoiceNo = Convert.ToInt32(Request.QueryString["InvoiceNo"]) + 1;
        //    Response.Redirect("PrivateCustomer/ManagePrivateEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");

        //}
        if (DDL_InvoiceItem != "Generate Invoice" && DDL_InvoiceItem != "Select")
        {
            string[] SplitInvoiceNo = DDL_InvoiceItem.Split(' ');
            string InvoiceNo = Convert.ToString(SplitInvoiceNo[2]);
            Response.Redirect("Invoice_Crystal.aspx?Back=dj&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "&Type=" + typeEst + "");
            //Response.Redirect("METED/ManageMetedIncoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
    }
    protected void Dll_Bcoc_SelectedIndexChanged(object sender, EventArgs e)
    {
        string DDL_InvoiceItem = Convert.ToString(Dll_Bcoc.SelectedItem);
        if (DDL_InvoiceItem == "Select")
        {
            Response.Write("<script>alert('Please select any Invoice or Generate New Invoice');</script>");
        }
        else if (DDL_InvoiceItem == "Generate Invoice")
        {
            int InvoiceNo = Convert.ToInt32(Request.QueryString["InvoiceNo"]) + 1;
            Response.Redirect("BCOC/ManageBCOCEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
        else if (DDL_InvoiceItem != "Generate Invoice" && DDL_InvoiceItem != "Select")
        {
            string[] SplitInvoiceNo = DDL_InvoiceItem.Split(' ');
            string InvoiceNo = Convert.ToString(SplitInvoiceNo[2]);
            Response.Redirect("Invoice_Crystal.aspx?Back=dj&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
            //Response.Redirect("METED/ManageMetedIncoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
    }
    protected void BtnUGI_Click(object sender, EventArgs e)
    {
        Response.Redirect("UGI/ManageUGIEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"] + "");
    }
    protected void Dll_UGI_SelectedIndexChanged(object sender, EventArgs e)
    {
        string DDL_InvoiceItem = Convert.ToString(Dll_UGI.SelectedItem);
        if (DDL_InvoiceItem == "Select")
        {
            Response.Write("<script>alert('Please select any Invoice or Generate New Invoice');</script>");
        }
        else if (DDL_InvoiceItem == "Generate Invoice")
        {
            int InvoiceNo = Convert.ToInt32(Request.QueryString["InvoiceNo"]) + 1;
            Response.Redirect("UGI/ManageUGIEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
        else if (DDL_InvoiceItem != "Generate Invoice" && DDL_InvoiceItem != "Select")
        {
            string[] SplitInvoiceNo = DDL_InvoiceItem.Split(' ');
            string InvoiceNo = Convert.ToString(SplitInvoiceNo[2]);
            Response.Redirect("Invoice_Crystal.aspx?Back=dj&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
            //Response.Redirect("METED/ManageMetedIncoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
    }
    protected void BtnDCED_Click(object sender, EventArgs e)
    {
        Response.Redirect("DCED/ManageDCEDEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"] + "");
    }
    protected void Dll_DCED_SelectedIndexChanged(object sender, EventArgs e)
    {
        string DDL_InvoiceItem = Convert.ToString(Dll_DCED.SelectedItem);
        if (DDL_InvoiceItem == "Select")
        {
            Response.Write("<script>alert('Please select any Invoice or Generate New Invoice');</script>");
        }
        else if (DDL_InvoiceItem == "Generate Invoice")
        {
            int InvoiceNo = Convert.ToInt32(Request.QueryString["InvoiceNo"]) + 1;
            Response.Redirect("DCED/ManageDCEDEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
        else if (DDL_InvoiceItem != "Generate Invoice" && DDL_InvoiceItem != "Select")
        {
            string[] SplitInvoiceNo = DDL_InvoiceItem.Split(' ');
            string InvoiceNo = Convert.ToString(SplitInvoiceNo[2]);
            Response.Redirect("Invoice_Crystal.aspx?Back=dj&Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
            //Response.Redirect("METED/ManageMetedIncoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + InvoiceNo + "");
        }
    }


    protected void Button5_Click(object sender, EventArgs e)
    {
        string PdfFileName = Convert.ToString(DDlAllPDF.SelectedItem.Text);
        Response.Clear();
        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + PdfFileName);
        Response.TransmitFile(Server.MapPath("~/VendorPDF/" + PdfFileName));
        Response.End();
        DDlAllPDF.Items.FindByText("Select").Selected = true;
        ShowVendorByJobID();
    }

    protected void btnPaymentVendor_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["jobs"] != "" && Request.QueryString["jobs"] != null)
        {
            if (Request.QueryString["GT"] == "Vendor")
            {
                Response.Redirect("Vendor/VendorInvoice.aspx?Jobs=" + Request.QueryString["jobs"].ToString() + "&GT=Vendor&Back=DisplayJobSearchRecords");
            }
        }
    }
}
