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
using CrystalDecisions.CrystalReports.Engine;
using System.Data.SqlClient;



public partial class Invoice_Crystal : System.Web.UI.Page
{
    Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
    public DataTable dt;
    public static string type = "";
    public Object NewInvoiceAmt_;
    public Object NewInvoiceAmtReason_;
    
    public Object Comnt;
    public Object CONTRACTOR_AUDIT_TOTAL;
    public Object CUSTOM_MEASURES_TOTAL;
    public Object MEASURES_TOTAL;
    public Object MEASURES80_TOTAL;
    public Object Invoice_Total;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            smUtil objsmutil = new smUtil();
            int AId = Convert.ToInt32(objsmutil.GetCookie("AId"));
            DataTable dtF = objInvoice.ChkInvoiceAuditFinalize(Convert.ToString(Request.QueryString["Jobs"]), Convert.ToInt32(Request.QueryString["Utility"]), AId, Convert.ToInt32(Request.QueryString["InvoiceNo"]));
            if (dtF.Rows.Count > 0)
            {
                if (Convert.ToString(dtF.Rows[0]["finalize"]) == "F")
                {
                    lnkEdit.Visible = lnkCreateInvoice.Visible = false;
                    // btnShow.Visible =
                    EdtDate.InnerHtml = "Invoice Finalize";
                }
            }
            
        }
        forEstimate();
    }


    public void forEstimate()
    {
        try
        {
            Dc_AddAllThing objNewThing = new Dc_AddAllThing();
            DataTable dtZone = objNewThing.findZone(Convert.ToString(Request.QueryString["Jobs"]));
            string jobno = Request.QueryString["Jobs"];
            int id = Convert.ToInt32(Request.QueryString["InvoiceNo"]);
            int utility = Convert.ToInt32(Request.QueryString["Utility"]);
            dc_AddNewJob objAddJob = new dc_AddNewJob();
            DataTable dtAct = objAddJob.SearchJob(Convert.ToString(Request.QueryString["Jobs"]), "", "", "", "", 0);
            DateTime AsignDate = Convert.ToDateTime(dtAct.Rows[0]["DateAssigned"]);
            DateTime CmprAsignDate = Convert.ToDateTime("2016-01-01 00:00:00.000");
            ReportDocument reportdocument = new ReportDocument();
           // CrystalReportViewer1 CrystalReportViewer = new CrystalReportViewer1();
            if (utility == 2)
            {
                string sConstr = ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(sConstr))
                {
                    using (SqlCommand comm = new SqlCommand())
                    {
                        comm.CommandType = CommandType.StoredProcedure;
                        comm.CommandText = "proc_SetNewInvAmt";
                        comm.Connection = conn;
                        comm.Parameters.AddWithValue("@JobNumber", jobno);
                        comm.Parameters.AddWithValue("@NoOfInvoice", id);
                        conn.Open();
                        using (SqlDataAdapter da = new SqlDataAdapter(comm))
                        {
                            dt = new DataTable();
                            da.Fill(dt);
                            string NewInvoiceAmt = "";
                            string Question = "";
                            string Comment_ = "";
                            if (dt.Rows.Count > 0)
                            {
                                if (Convert.ToString(dtZone.Rows[0]["PPlZone"]) != "3" || (Convert.ToString(dtZone.Rows[0]["PPlZone"]) == "3" && Convert.ToString(dtAct.Rows[0]["Act129"]) == "True"))
                                {
                                    NewInvoiceAmt = Convert.ToString(dt.Rows[0]["NewInvoiceAmt"]);
                                    Question = Convert.ToString(dt.Rows[0]["Question"]);
                                    Comment_ = Convert.ToString(dt.Rows[0]["Comment"]);
                                }
                            }
                            if (NewInvoiceAmt == "" || NewInvoiceAmt == null)
                            {
                                if (Convert.ToString(dtZone.Rows[0]["PPlZone"]) != "3" || (Convert.ToString(dtZone.Rows[0]["PPlZone"]) == "3" && Convert.ToString(dtAct.Rows[0]["Act129"]) == "True"))
                                {
                                    NewInvoiceAmt = "";
                                    Question = "";
                                    Comment_ = "";
                                    NewInvoiceAmt_ = (Object)(NewInvoiceAmt);
                                    if (Question != "" && Question != null)
                                    {
                                        NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                        Comnt = (Object)(Comment_);
                                    }
                                }
                            }
                            else
                            {
                                if (Convert.ToString(dtZone.Rows[0]["PPlZone"]) != "3" || (Convert.ToString(dtZone.Rows[0]["PPlZone"]) == "3" && Convert.ToString(dtAct.Rows[0]["Act129"]) == "True"))
                                {
                                    NewInvoiceAmt_ = (Object)("New invoice amount:                $" + NewInvoiceAmt);
                                    if (Question != "" && Question != null)
                                    {
                                        NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                        Comnt = (Object)(Comment_);
                                    }
                                }
                            }
                        }
                    }
                }

                // && AsignDate <= CmprAsignDate
                if (Convert.ToString(dtZone.Rows[0]["PPlZone"]) == "3" && Convert.ToString(dtAct.Rows[0]["Act129"]) != "True" && Convert.ToString(dtAct.Rows[0]["Act129II"]) != "True")
                {
                    if (AsignDate < CmprAsignDate)
                    {
                        if (NewInvoiceAmt_ == null)
                        {
                            NewInvoiceAmt_ = "";
                        }


                        if (NewInvoiceAmtReason_ == null)
                        {
                            NewInvoiceAmtReason_ = "";
                        }


                        if (Comnt == null)
                        {
                            Comnt = "";
                        }

                        reportdocument.Load(Server.MapPath("~/invoice_Report/Invoice_final.rpt"));
                        reportdocument.SetParameterValue("NewInvoiceAMT", NewInvoiceAmt_);
                        reportdocument.SetParameterValue("NewInvoiceAmtReason", NewInvoiceAmtReason_);
                        reportdocument.SetParameterValue("Comnt", Comnt);
                    }
                    else if (AsignDate >= CmprAsignDate)
                    {
                        string CONTRACTOR_AUDIT_TOTAL_ = "0.00";
                        string CUSTOM_MEASURES_TOTAL_ = "0.00";
                        string MEASURES_TOTAL_ = "0.00";
                        string MEASURES80_TOTAL_ = "0.00";
                        string Invoice_TOTAL_ = "0.00";
                        DataTable totalCACLVMeasures = objNewThing.Func_totalCACLVMeasures(Convert.ToString(Request.QueryString["Jobs"]), Convert.ToString(Request.QueryString["Utility"]), Convert.ToString(Request.QueryString["InvoiceNo"]));

                        if (totalCACLVMeasures.Rows.Count > 0)
                        {
                            CONTRACTOR_AUDIT_TOTAL_ = Convert.ToString(totalCACLVMeasures.Rows[0]["CONTRACTOR_AUDIT_TOTAL"]);
                            if (CONTRACTOR_AUDIT_TOTAL_ == "")
                            {
                                CONTRACTOR_AUDIT_TOTAL_ = "0.00";
                            }

                            CUSTOM_MEASURES_TOTAL_ = Convert.ToString(totalCACLVMeasures.Rows[0]["CUSTOM_MEASURES_TOTAL"]);
                            if (CUSTOM_MEASURES_TOTAL_ == "")
                            {
                                CUSTOM_MEASURES_TOTAL_ = "0.00";
                            }

                            MEASURES_TOTAL_ = Convert.ToString(totalCACLVMeasures.Rows[0]["MEASURES_TOTAL"]);
                            if (MEASURES_TOTAL_ == "")
                            {
                                MEASURES_TOTAL_ = "0.00";
                            }

                            MEASURES80_TOTAL_ = Convert.ToString(totalCACLVMeasures.Rows[0]["MEASURES80_TOTAL"]);
                            if (MEASURES80_TOTAL_ == "")
                            {
                                MEASURES80_TOTAL_ = "0.00";
                            }

                            Invoice_TOTAL_ = Convert.ToString(totalCACLVMeasures.Rows[0]["Invoice_TOTAL"]);
                            if (Invoice_TOTAL_ == "")
                            {
                                Invoice_TOTAL_ = "0.00";
                            }
                        }

                        CONTRACTOR_AUDIT_TOTAL = (Object)(CONTRACTOR_AUDIT_TOTAL_);
                        CUSTOM_MEASURES_TOTAL = (Object)(CUSTOM_MEASURES_TOTAL_);
                        MEASURES_TOTAL = (Object)(MEASURES_TOTAL_);
                        MEASURES80_TOTAL = (Object)(MEASURES80_TOTAL_);
                        Invoice_Total = (Object)(Invoice_TOTAL_);

                        reportdocument.Load(Server.MapPath("~/invoice_Report/PPL_Caclv_Invoice.rpt"));
                        reportdocument.SetParameterValue("CONTRACTOR_AUDIT_TOTAL", CONTRACTOR_AUDIT_TOTAL);
                        reportdocument.SetParameterValue("CUSTOM_MEASURES_TOTAL", CUSTOM_MEASURES_TOTAL);
                        reportdocument.SetParameterValue("MEASURES_TOTAL", MEASURES_TOTAL);
                        reportdocument.SetParameterValue("MEASURES80_TOTAL", MEASURES80_TOTAL);
                        reportdocument.SetParameterValue("Invoice_Total", Invoice_TOTAL_);//Live
                        //s//reportdocument.SetParameterValue("TotalFinal", Invoice_TOTAL_);
                        
                    }
                }
                else //if ((Convert.ToString(dtZone.Rows[0]["PPlZone"]) == "3") && Convert.ToString(dtAct.Rows[0]["Act129"]) != "True" && Convert.ToString(dtAct.Rows[0]["Act129II"]) != "True")
                {
                    if (NewInvoiceAmt_ == null)
                    {
                        NewInvoiceAmt_ = "";
                    }


                    if (NewInvoiceAmtReason_ == null)
                    {
                        NewInvoiceAmtReason_ = "";
                    }


                    if (Comnt == null)
                    {
                        Comnt = "";
                    }
                    
                    reportdocument.Load(Server.MapPath("~/invoice_Report/Invoice_final.rpt"));
                    reportdocument.SetParameterValue("NewInvoiceAMT", NewInvoiceAmt_);
                    reportdocument.SetParameterValue("NewInvoiceAmtReason", NewInvoiceAmtReason_);
                    reportdocument.SetParameterValue("Comnt", Comnt);
                }
            }
            else if (utility == 9)
            {
                string sConstr = ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(sConstr))
                {
                    using (SqlCommand comm = new SqlCommand())
                    {
                        comm.CommandType = CommandType.StoredProcedure;
                        comm.CommandText = "proc_SetNewInvAmt";
                        comm.Connection = conn;
                        comm.Parameters.AddWithValue("@JobNumber", jobno);
                        comm.Parameters.AddWithValue("@NoOfInvoice", id);
                        conn.Open();
                        using (SqlDataAdapter da = new SqlDataAdapter(comm))
                        {
                            dt = new DataTable();
                            da.Fill(dt);
                            string NewInvoiceAmt = "";
                            string Question = "";
                            string Comment_ = "";
                            if (dt.Rows.Count > 0)
                            {
                                NewInvoiceAmt = Convert.ToString(dt.Rows[0]["NewInvoiceAmt"]);
                                Question = Convert.ToString(dt.Rows[0]["Question"]);
                                Comment_ = Convert.ToString(dt.Rows[0]["Comment"]);
                            }
                            if (NewInvoiceAmt == "" || NewInvoiceAmt == null)
                            {
                                NewInvoiceAmt = "";
                                Question = "";
                                Comment_ = "";
                                NewInvoiceAmt_ = (Object)(NewInvoiceAmt);
                                if (Question != "" && Question != null)
                                {
                                    NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                    Comnt = (Object)(Comment_);
                                }
                                //NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                //Comnt = (Object)(Comment_);
                            }
                            else
                            {
                                NewInvoiceAmt_ = (Object)("New invoice amount:                $" + NewInvoiceAmt);
                                //NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                //Comnt = (Object)(Comment_);
                                if (Question != "" && Question != null)
                                {
                                    NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                    Comnt = (Object)(Comment_);
                                }
                            }
                        }
                    }
                }
                reportdocument.Load(Server.MapPath("~/invoice_Report/BCOCInvoice.rpt"));
                reportdocument.SetParameterValue("NewInvoiceAMT", NewInvoiceAmt_);
                reportdocument.SetParameterValue("NewInvoiceAmtReason", NewInvoiceAmtReason_);
                reportdocument.SetParameterValue("Comnt", Comnt);
            }
            else if (utility == 3)
            {
                string sConstr = ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(sConstr))
                {
                    using (SqlCommand comm = new SqlCommand())
                    {
                        comm.CommandType = CommandType.StoredProcedure;
                        comm.CommandText = "proc_SetNewInvAmt";
                        comm.Connection = conn;
                        comm.Parameters.AddWithValue("@JobNumber", jobno);
                        comm.Parameters.AddWithValue("@NoOfInvoice", id);
                        conn.Open();
                        using (SqlDataAdapter da = new SqlDataAdapter(comm))
                        {
                            dt = new DataTable();
                            da.Fill(dt);
                            string NewInvoiceAmt = "";
                            string Question = "";
                            string Comment_ = "";
                            if (dt.Rows.Count > 0)
                            {
                                NewInvoiceAmt = Convert.ToString(dt.Rows[0]["NewInvoiceAmt"]);
                                Question = Convert.ToString(dt.Rows[0]["Question"]);
                                Comment_ = Convert.ToString(dt.Rows[0]["Comment"]);
                            }
                            if (NewInvoiceAmt == "" || NewInvoiceAmt == null)
                            {
                                NewInvoiceAmt = "";
                                Question = "";
                                Comment_ = "";
                                NewInvoiceAmt_ = (Object)(NewInvoiceAmt);
                                if (Question != "" && Question != null)
                                {
                                    NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                    Comnt = (Object)(Comment_);
                                }
                                //NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                //Comnt = (Object)(Comment_);
                            }
                            else
                            {
                               
                                NewInvoiceAmt_ = (Object)("New invoice amount:                $" + NewInvoiceAmt);
                                //NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                //Comnt = (Object)(Comment_);
                                if (Question != "" && Question != null)
                                {
                                    NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                    Comnt = (Object)(Comment_);
                                }
                            }
                        }
                    }
                }
                reportdocument.Load(Server.MapPath("~/invoice_Report/DCEDInvoice.rpt"));
                reportdocument.SetParameterValue("NewInvoiceAMT", NewInvoiceAmt_);
                reportdocument.SetParameterValue("NewInvoiceAmtReason", NewInvoiceAmtReason_);
                reportdocument.SetParameterValue("Comnt", Comnt);
            }
            else if (utility == 4)
            {
                string sConstr = ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(sConstr))
                {
                    using (SqlCommand comm = new SqlCommand())
                    {
                        comm.CommandType = CommandType.StoredProcedure;
                        comm.CommandText = "proc_SetNewInvAmt";
                        comm.Connection = conn;
                        comm.Parameters.AddWithValue("@JobNumber", jobno);
                        comm.Parameters.AddWithValue("@NoOfInvoice", id);
                        conn.Open();
                        using (SqlDataAdapter da = new SqlDataAdapter(comm))
                        {
                            dt = new DataTable();
                            da.Fill(dt);
                            string NewInvoiceAmt = "";
                            string Question = "";
                            string Comment_ = "";
                            if (dt.Rows.Count > 0)
                            {
                                NewInvoiceAmt = Convert.ToString(dt.Rows[0]["NewInvoiceAmt"]);
                                Question = Convert.ToString(dt.Rows[0]["Question"]);
                                Comment_ = Convert.ToString(dt.Rows[0]["Comment"]);
                            }
                            if (NewInvoiceAmt == "" || NewInvoiceAmt == null)
                            {
                                NewInvoiceAmt = "";
                                Question = "";
                                Comment_ = "";
                                NewInvoiceAmt_ = (Object)(NewInvoiceAmt);
                                //NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                //Comnt = (Object)(Comment_);
                                if (Question != "" && Question != null)
                                {
                                    NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                    Comnt = (Object)(Comment_);
                                }
                            }
                            else
                            {
                                NewInvoiceAmt_ = (Object)("New invoice amount:                $" + NewInvoiceAmt);
                                //NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                //Comnt = (Object)(Comment_);
                                if (Question != "" && Question != null)
                                {
                                    NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                    Comnt = (Object)(Comment_);
                                }
                            }
                        }
                    }
                }
                reportdocument.Load(Server.MapPath("~/invoice_Report/UGIInvoice.rpt"));
                reportdocument.SetParameterValue("NewInvoiceAMT", NewInvoiceAmt_);
                reportdocument.SetParameterValue("NewInvoiceAmtReason", NewInvoiceAmtReason_);
                reportdocument.SetParameterValue("Comnt", Comnt);
            }
            else if (utility == 1)
            {
                Object Total_;
                string sConstr = ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(sConstr))
                {
                    using (SqlCommand comm = new SqlCommand())
                    {
                        comm.CommandType = CommandType.StoredProcedure;
                        comm.CommandText = "proc_Act129Total";
                        comm.Connection = conn;
                        comm.Parameters.AddWithValue("@JobNumber", jobno);
                        comm.Parameters.AddWithValue("@Utility", utility);
                        comm.Parameters.AddWithValue("@NoOfInvoice", id);
                        conn.Open();
                        using (SqlDataAdapter da = new SqlDataAdapter(comm))
                        {
                            dt = new DataTable();
                            da.Fill(dt);
                            string ActTotal = Convert.ToString(dt.Rows[0]["Total"]);
                            if (ActTotal == "" || ActTotal == null)
                            {
                                ActTotal = "0.00";
                            }
                            Total_ = (Object)(ActTotal);
                        }
                        conn.Close();

                    }
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "proc_SetNewInvAmt";
                        cmd.Connection = conn;
                        cmd.Parameters.AddWithValue("@JobNumber", jobno);
                        cmd.Parameters.AddWithValue("@NoOfInvoice", id);
                        conn.Open();
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            dt = new DataTable();
                            da.Fill(dt);
                            string NewInvoiceAmt = "";
                            string Question = "";
                            string Comment_ = "";
                            if (dt.Rows.Count > 0)
                            {
                                NewInvoiceAmt = Convert.ToString(dt.Rows[0]["NewInvoiceAmt"]);
                                Question = Convert.ToString(dt.Rows[0]["Question"]);
                                Comment_ = Convert.ToString(dt.Rows[0]["Comment"]);
                            }
                            if (NewInvoiceAmt == "" || NewInvoiceAmt == null)
                            {
                                NewInvoiceAmt = "";
                                Question = "";
                                Comment_ = "";
                                NewInvoiceAmt_ = (Object)(NewInvoiceAmt);
                                //NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                //Comnt = (Object)(Comment_);
                                if (Question != "" && Question != null)
                                {
                                    NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                    Comnt = (Object)(Comment_);
                                }
                            }
                            else
                            {
                                NewInvoiceAmt_ = (Object)("New invoice amount:                $" + NewInvoiceAmt);
                              //  NewInvoiceAmtReason_ = (Object)("Invoiced amount changed because:  " + Question);
                                //NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                //Comnt = (Object)(Comment_);
                                if (Question != "" && Question != null)
                                {
                                    NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                    Comnt = (Object)(Comment_);
                                }
                            }
                        }
                    }
                }
                reportdocument.Load(Server.MapPath("~/invoice_Report/Report_meted.rpt"));
                reportdocument.SetParameterValue("ActTotal", Total_);
                reportdocument.SetParameterValue("NewInvoiceAMT", NewInvoiceAmt_);
                reportdocument.SetParameterValue("NewInvoiceAmtReason", NewInvoiceAmtReason_);
                reportdocument.SetParameterValue("Comnt", Comnt);
            }
            else if (utility == 7)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "proc_SelectEstimateStatus";
                cmd.Parameters.AddWithValue("@JobNumber", Convert.ToString(Request.QueryString["Jobs"]));
                cmd.Parameters.AddWithValue("@invoiceNo", Convert.ToString(Request.QueryString["InvoiceNo"]));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    string sts = Convert.ToString(dt.Rows[0]["status"]);
                    if (sts == "" || sts == null)
                    {
                        type = "ESTIMATE";
                        lnkCreateInvoice.Visible = true;
                    }
                    else
                    {
                        type = Convert.ToString(sts);
                    }
                }
                else
                {
                    type = "ESTIMATE";
                    lnkCreateInvoice.Visible = true;
                }


                //===============================

                using (SqlCommand comm = new SqlCommand())
                {
                    comm.CommandType = CommandType.StoredProcedure;
                    comm.CommandText = "proc_SetNewInvAmt";
                    comm.Connection = con;
                    comm.Parameters.AddWithValue("@JobNumber", jobno);
                    comm.Parameters.AddWithValue("@NoOfInvoice", id);
                    con.Open();
                    using (SqlDataAdapter daa = new SqlDataAdapter(comm))
                    {
                        dt = new DataTable();
                        daa.Fill(dt);
                        string NewInvoiceAmt = "";
                        string Question = "";
                        string Comment_ = "";
                        if (dt.Rows.Count > 0)
                        {
                            NewInvoiceAmt = Convert.ToString(dt.Rows[0]["NewInvoiceAmt"]);
                            Question = Convert.ToString(dt.Rows[0]["Question"]);
                            Comment_ = Convert.ToString(dt.Rows[0]["Comment"]);
                        }
                        if (NewInvoiceAmt == "" || NewInvoiceAmt == null)
                        {
                            NewInvoiceAmt = "";
                            Question = "";
                            Comment_ = "";
                            NewInvoiceAmt_ = (Object)(NewInvoiceAmt);
                            //NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                            //Comnt = (Object)(Comment_);
                            if (Question != "" && Question != null)
                            {
                                NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                Comnt = (Object)(Comment_);
                            }
                        }
                        else
                        {
                            NewInvoiceAmt_ = (Object)("New invoice amount:                $" + NewInvoiceAmt);
                            //NewInvoiceAmtReason_ = (Object)("Invoiced amount changed because:  " + Question);
                            //NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                            //Comnt = (Object)(Comment_);
                            if (Question != "" && Question != null)
                            {
                                NewInvoiceAmtReason_ = (Object)("Invoice amount changed because: " + Question);
                                Comnt = (Object)(Comment_);
                            }
                        }
                    }
                }

                //==============================


                if (Convert.ToString(Request.QueryString["Type"]) == "Default Estimate")
                {
                   // reportdocument.SetDatabaseLogon("sa", "Sa123!@#", "CUSTOM16", "CW_DEMO");
                    //reportdocument.Load(Server.MapPath("~/invoice_Report/PrivateEstimate.rpt"));
                    reportdocument.SetDatabaseLogon("sa", "12345", "DESKTOP-IRT09KE\\SQLEXPRESS", "CW_Staging");
                 //   reportdocument.SetDatabaseLogon("sa", "Sa123!@#", "CUSTOM16", "CW_Staging");
                  //  reportdocument.SetDatabaseLogon("sa", "12345", "DESKTOP-IRT09KE\\SQLEXPRESS", "CW_DEMO");
                    //reportdocument.SetDatabaseLogon("sa", "Sa123!@#", "CUSTOM-2016\\SQLEXPRESS2014", "CW_Staging");
                    //reportdocument.SetDatabaseLogon("sa", "Sa123!@#", "IP-192-169-235-\\MSSQLSERVER2014", "CW_Staging");
                    //c//reportdocument.SetDatabaseLogon("synoris_admin", "fee1G0oD", "98.130.254.204", "synoris_cwether");
                    reportdocument.SetParameterValue("@titleEstimate", type);
                    reportdocument.SetParameterValue("NewInvoiceAMT", NewInvoiceAmt_);
                    reportdocument.SetParameterValue("NewInvoiceAmtReason", NewInvoiceAmtReason_);
                    reportdocument.SetParameterValue("Comnt", Comnt);
                }
                else
                {
                    reportdocument.Load(Server.MapPath("~/invoice_Report/PrivateEstimate_.rpt"));
                    reportdocument.SetParameterValue("@titleEstimate", type);
                    reportdocument.SetParameterValue("NewInvoiceAMT", NewInvoiceAmt_);
                    reportdocument.SetParameterValue("NewInvoiceAmtReason", NewInvoiceAmtReason_);
                    reportdocument.SetParameterValue("Comnt", Comnt);
                }
            }
           // reportdocument.SetDatabaseLogon("sa", "Sa123!@#", "CUSTOM16", "CW_DEMO");
            reportdocument.SetDatabaseLogon("sa", "12345", "DESKTOP-IRT09KE\\SQLEXPRESS", "CW_Staging");
           // reportdocument.SetDatabaseLogon("sa", "12345", "DESKTOP-IRT09KE\\SQLEXPRESS", "CW_DEMO");
          //  reportdocument.SetDatabaseLogon("sa", "Sa123!@#", "CUSTOM16", "CW_Staging");
            //reportdocument.SetDatabaseLogon("sa", "Sa123!@#", "CUSTOM-2016\\SQLEXPRESS2014", "CW_Staging");
            //reportdocument.SetDatabaseLogon("sa", "Sa123!@#", "IP-192-169-235-\\MSSQLSERVER2014", "CW_Staging");
            //c// reportdocument.SetDatabaseLogon("synoris_admin", "fee1G0oD", "98.130.254.204", "synoris_cwether");
            //reportdocument.RecordSelectionFormula= 
            reportdocument.SetParameterValue("@Job_No", jobno);
            reportdocument.SetParameterValue("@Invoice_No", id);
            reportdocument.SetParameterValue("@Utility_No", utility);
            CrystalReportViewer1.ReportSource = reportdocument;
        }
        catch (Exception ex)
        {
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        try
        {
            string jobno = Request.QueryString["Jobs"];
            int id = Convert.ToInt32(Request.QueryString["InvoiceNo"]);
            int utility = Convert.ToInt32(Request.QueryString["Utility"]);
            if (utility == 2)
            {
                Response.Redirect("PPLAudit/AddOrManageInvoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"]);
            }
            else if (utility == 1)
            {
                Response.Redirect("METED/ManageMetedIncoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"]);
            }
            else if (utility == 7)
            {
                Response.Redirect("PrivateCustomer/ManagePrivateEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"] + "&Type=" + Request.QueryString["Type"]);
            }
            else if (utility == 9)
            {
                Response.Redirect("BCOC/ManageBCOCEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"] + "&Type=" + Request.QueryString["Type"]);
            }
            else if (utility == 3)
            {
                Response.Redirect("DCED/ManageDCEDEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"] + "&Type=" + Request.QueryString["Type"]);
            }
            else if (utility == 4)
            {
                Response.Redirect("UGI/ManageUGIEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"] + "&Type=" + Request.QueryString["Type"]);
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void lnkCreateInvoice_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_InsertEstimateStatus";
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@JobNumber", Convert.ToString(Request.QueryString["Jobs"]));
        cmd.Parameters.AddWithValue("@status", "INVOICE");
        cmd.Parameters.AddWithValue("@invoiceNo", Convert.ToString(Request.QueryString["InvoiceNo"]));
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        lnkCreateInvoice.Visible = false;
        forEstimate();
    }

    protected void lnkBack_Click(object sender, EventArgs e)
    {
        string flag = Convert.ToString(Request.QueryString["Back"]);
        if (flag == "dj")
        {
            DataTable dt_Invoice = objInvoice.SearchTotalInvoice(Request.QueryString["jobs"].ToString());
            //int invoice = Convert.ToInt32(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
            string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
            if (IncoiceNo == "")
            {
                IncoiceNo = "1";
            }
            Response.Redirect("DisplayJobSearchRecords.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + IncoiceNo);
        }
        else if (flag == "vi")
        {
            if (Convert.ToString(Request.QueryString["Utility"]) == "1")
            {
                Response.Redirect("METED/ManageMetedIncoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"]);
            }
            else if (Convert.ToString(Request.QueryString["Utility"]) == "2")
            {
                Response.Redirect("PPLAudit/AddOrManageInvoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"]);
            }
            else if (Convert.ToString(Request.QueryString["Utility"]) == "7")
            {
                Response.Redirect("PrivateCustomer/ManagePrivateEstimate.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"] + "&InvoiceNo=" + Request.QueryString["InvoiceNo"] + "&Type=" + Request.QueryString["Type"]);
            }
        }
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_setSubmitDateForInvoice";
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@JobNumber", Convert.ToString(Request.QueryString["Jobs"]));
        cmd.Parameters.AddWithValue("@NoOf_Invoice", Convert.ToString(Request.QueryString["InvoiceNo"]));
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}
