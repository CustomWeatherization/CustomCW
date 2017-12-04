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

public partial class PPLAudit_Act129_II_PPL_InvoicePage3 : System.Web.UI.Page
{
    public string StrUserName = "";
    smUtil objSm = new smUtil();
    dcPPLAudit ObjPPL = new dcPPLAudit();
    dc_AddNewJob objaddnewjob = new dc_AddNewJob();
    public DataTable dtJobSearch = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        dtJobSearch = objaddnewjob.ShowJobByJobNumber_ByJobNumber(Request.QueryString["Jobs"].ToString());
        if (Convert.ToBoolean(dtJobSearch.Rows[0]["Act129"]) != true)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Jobs"] != null)
                {
                    if (Request.QueryString["Utility"] != null)
                    {
                        if (Request.QueryString["Jobs"].ToString() != "")
                        {
                            string JobNum = Request.QueryString["Jobs"].ToString();
                            JobNumber.InnerText = JobNum;
                            JobNumber2.InnerText = JobNum;
                            BindData(JobNum);
                        }
                    }
                    else
                    {
                        Response.Redirect("../Home.aspx");
                    }
                }
                else
                {
                    Response.Redirect("../Home.aspx");
                }
            }
        }
        else
        {
            Response.Redirect("../Home.aspx");
        }
    }
    public void BindData(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Act129II_Invoice_3(JobNum);
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToString(dt.Rows[0]["Finalized"]) == "F")
                {
                    foreach (Control c in panelReadOnly.Controls)
                    {
                        if (c.GetType() == typeof(TextBox))
                        {
                            ((TextBox)c).ReadOnly = true;
                        }
                    }

                    btn_FinalizeInvoice.Visible = false;
                    btn_SaveCurrentPg.Visible = false;
                    btn_FinalizeInvoice.Enabled = false;
                    btn_SaveCurrentPg.Enabled = false;
                    btn_PrintInvoice.Enabled = true;

                    txt_Line1_Qty.Enabled = false;
                    txt_Line2_Qty.Enabled = false;
                    txt_Line3_Qty.Enabled = false;
                    txt_Line4_Qty.Enabled = false;
                    txt_Line5_Qty.Enabled = false;
                    txt_Line6_Qty.Enabled = false;
                    txt_Line7_Qty.Enabled = false;
                    txt_Line8_Qty.Enabled = false;
                    txt_Line9_Qty.Enabled = false;
                    txt_Line10_Qty.Enabled = false;
                    txt_Line11_Qty.Enabled = false;

                    txt_Line18_Qty.Enabled = false;
                    txt_Line19_Qty.Enabled = false;
                    txt_Line20_Qty.Enabled = false;
                    spann_final.Visible = true;

                }
                else
                {
                    btn_FinalizeInvoice.Visible = true;
                    btn_SaveCurrentPg.Visible = true;
                    btn_FinalizeInvoice.Enabled = true;
                    btn_SaveCurrentPg.Enabled = true;
                    spann_final.Visible = false;
                }
                StrUserName = Convert.ToString(dt.Rows[0]["FullName"]);
                txt_Line1_Qty.Text = Convert.ToString(dt.Rows[0]["Line1Quantity"]);
                txt_Line2_Qty.Text = Convert.ToString(dt.Rows[0]["Line2Quantity"]);
                txt_Line3_Qty.Text = Convert.ToString(dt.Rows[0]["Line3Quantity"]);
                txt_Line4_Qty.Text = Convert.ToString(dt.Rows[0]["Line4Quantity"]);
                txt_Line5_Qty.Text = Convert.ToString(dt.Rows[0]["Line5Quantity"]);
                txt_Line6_Qty.Text = Convert.ToString(dt.Rows[0]["Line6Quantity"]);
                txt_Line7_Qty.Text = Convert.ToString(dt.Rows[0]["Line7Quantity"]);
                txt_Line8_Qty.Text = Convert.ToString(dt.Rows[0]["Line8Quantity"]);
                txt_Line9_Qty.Text = Convert.ToString(dt.Rows[0]["Line9Quantity"]);
                txt_Line10_Qty.Text = Convert.ToString(dt.Rows[0]["Line10Quantity"]);
                txt_Line11_Qty.Text = Convert.ToString(dt.Rows[0]["Line11Quantity"]);

                txt_Line18_Qty.Text = Convert.ToString(dt.Rows[0]["Line18Quantity"]);
                txt_Line19_Qty.Text = Convert.ToString(dt.Rows[0]["Line19Quantity"]);
                txt_Line20_Qty.Text = Convert.ToString(dt.Rows[0]["Line20Quantity"]);

                txt_Line1_Total.Text = Convert.ToString(dt.Rows[0]["Line1Total"]);
                txt_Line2_Total.Text = Convert.ToString(dt.Rows[0]["Line2Total"]);
                txt_Line3_Total.Text = Convert.ToString(dt.Rows[0]["Line3Total"]);
                txt_Line4_Total.Text = Convert.ToString(dt.Rows[0]["Line4Total"]);
                txt_Line5_Total.Text = Convert.ToString(dt.Rows[0]["Line5Total"]);
                txt_Line6_Total.Text = Convert.ToString(dt.Rows[0]["Line6Total"]);
                txt_Line7_Total.Text = Convert.ToString(dt.Rows[0]["Line7Total"]);
                txt_Line8_Total.Text = Convert.ToString(dt.Rows[0]["Line8Total"]);
                txt_Line9_Total.Text = Convert.ToString(dt.Rows[0]["Line9Total"]);
                txt_Line10_Total.Text = Convert.ToString(dt.Rows[0]["Line10Total"]);
                txt_Line11_Total.Text = Convert.ToString(dt.Rows[0]["Line11Total"]);

                txt_Line18_Total.Text = Convert.ToString(dt.Rows[0]["Line18Total"]);
                txt_Line19_Total.Text = Convert.ToString(dt.Rows[0]["Line19Total"]);
                txt_Line20_Total.Text = Convert.ToString(dt.Rows[0]["Line20Total"]);

                hdn_Line1_Total.Value = Convert.ToString(dt.Rows[0]["Line1Total"]);
                hdn_Line2_Total.Value = Convert.ToString(dt.Rows[0]["Line2Total"]);
                hdn_Line3_Total.Value = Convert.ToString(dt.Rows[0]["Line3Total"]);
                hdn_Line4_Total.Value = Convert.ToString(dt.Rows[0]["Line4Total"]);
                hdn_Line5_Total.Value = Convert.ToString(dt.Rows[0]["Line5Total"]);
                hdn_Line6_Total.Value = Convert.ToString(dt.Rows[0]["Line6Total"]);
                hdn_Line7_Total.Value = Convert.ToString(dt.Rows[0]["Line7Total"]);
                hdn_Line8_Total.Value = Convert.ToString(dt.Rows[0]["Line8Total"]);
                hdn_Line9_Total.Value = Convert.ToString(dt.Rows[0]["Line9Total"]);
                hdn_Line10_Total.Value = Convert.ToString(dt.Rows[0]["Line10Total"]);
                hdn_Line11_Total.Value = Convert.ToString(dt.Rows[0]["Line11Total"]);

                hdn_Line18_Total.Value = Convert.ToString(dt.Rows[0]["Line18Total"]);
                hdn_Line19_Total.Value = Convert.ToString(dt.Rows[0]["Line19Total"]);
                hdn_Line20_Total.Value = Convert.ToString(dt.Rows[0]["Line20Total"]);


                hdn_Finalize.Value = Convert.ToString(dt.Rows[0]["Finalized"]);



                txt_Line1_Cat.Text = Convert.ToString(dt.Rows[0]["Line1Category"]);
                txt_Line1_LIURP.Text = Convert.ToString(dt.Rows[0]["Line1LIURPCode"]);
                txt_Line1_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line1MeasureDescription"]);
                txt_Line1_SC.Text = Convert.ToString(dt.Rows[0]["Line1SC"]);
                txt_Line1_Unit.Text = Convert.ToString(dt.Rows[0]["Line1Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line1LaborRate"]) == "")
                {
                    txt_Line1_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line1_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line1LaborRate"]);
                }

                txt_Line1_THW.Text = Convert.ToString(dt.Rows[0]["Line1THW"]);
                txt_Line1_TMC.Text = Convert.ToString(dt.Rows[0]["Line1TMC"]);
                //txt_Line12_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line12CostPerUnit"]);


                txt_Line2_Cat.Text = Convert.ToString(dt.Rows[0]["Line2Category"]);
                txt_Line2_LIURP.Text = Convert.ToString(dt.Rows[0]["Line2LIURPCode"]);
                txt_Line2_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line2MeasureDescription"]);
                txt_Line2_SC.Text = Convert.ToString(dt.Rows[0]["Line2SC"]);
                txt_Line2_Unit.Text = Convert.ToString(dt.Rows[0]["Line2Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line2LaborRate"]) == "")
                {
                    txt_Line2_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line2_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line2LaborRate"]);
                }


                txt_Line2_THW.Text = Convert.ToString(dt.Rows[0]["Line2THW"]);
                txt_Line2_TMC.Text = Convert.ToString(dt.Rows[0]["Line2TMC"]);
                //txt_Line13_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line13CostPerUnit"]); 

                txt_Line3_Cat.Text = Convert.ToString(dt.Rows[0]["Line3Category"]);
                txt_Line3_LIURP.Text = Convert.ToString(dt.Rows[0]["Line3LIURPCode"]);
                txt_Line3_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line3MeasureDescription"]);
                txt_Line3_SC.Text = Convert.ToString(dt.Rows[0]["Line3SC"]);
                txt_Line3_Unit.Text = Convert.ToString(dt.Rows[0]["Line3Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line3LaborRate"]) == "")
                {
                    txt_Line3_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line3_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line3LaborRate"]);
                }

                txt_Line3_THW.Text = Convert.ToString(dt.Rows[0]["Line3THW"]);
                txt_Line3_TMC.Text = Convert.ToString(dt.Rows[0]["Line3TMC"]);
                //txt_Line16_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line16CostPerUnit"]); 

                txt_Line4_Cat.Text = Convert.ToString(dt.Rows[0]["Line4Category"]);
                txt_Line4_LIURP.Text = Convert.ToString(dt.Rows[0]["Line4LIURPCode"]);
                txt_Line4_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line4MeasureDescription"]);
                txt_Line4_SC.Text = Convert.ToString(dt.Rows[0]["Line4SC"]);
                txt_Line4_Unit.Text = Convert.ToString(dt.Rows[0]["Line4Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line4LaborRate"]) == "")
                {
                    txt_Line4_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line4_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line4LaborRate"]);
                }


                txt_Line4_THW.Text = Convert.ToString(dt.Rows[0]["Line4THW"]);
                txt_Line4_TMC.Text = Convert.ToString(dt.Rows[0]["Line4TMC"]);




                txt_Line5_Cat.Text = Convert.ToString(dt.Rows[0]["Line5Category"]);
                txt_Line5_LIURP.Text = Convert.ToString(dt.Rows[0]["Line5LIURPCode"]);
                txt_Line5_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line5MeasureDescription"]);
                txt_Line5_SC.Text = Convert.ToString(dt.Rows[0]["Line5SC"]);
                txt_Line5_Unit.Text = Convert.ToString(dt.Rows[0]["Line5Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line5LaborRate"]) == "")
                {
                    txt_Line5_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line5_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line5LaborRate"]);
                }


                txt_Line5_THW.Text = Convert.ToString(dt.Rows[0]["Line5THW"]);
                txt_Line5_TMC.Text = Convert.ToString(dt.Rows[0]["Line5TMC"]);


                txt_Line6_Cat.Text = Convert.ToString(dt.Rows[0]["Line6Category"]);
                txt_Line6_LIURP.Text = Convert.ToString(dt.Rows[0]["Line6LIURPCode"]);
                txt_Line6_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line6MeasureDescription"]);
                txt_Line6_SC.Text = Convert.ToString(dt.Rows[0]["Line6SC"]);
                txt_Line6_Unit.Text = Convert.ToString(dt.Rows[0]["Line6Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line6LaborRate"]) == "")
                {
                    txt_Line6_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line6_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line6LaborRate"]);
                }


                txt_Line6_THW.Text = Convert.ToString(dt.Rows[0]["Line6THW"]);
                txt_Line6_TMC.Text = Convert.ToString(dt.Rows[0]["Line6TMC"]);


                txt_Line7_Cat.Text = Convert.ToString(dt.Rows[0]["Line7Category"]);
                txt_Line7_LIURP.Text = Convert.ToString(dt.Rows[0]["Line7LIURPCode"]);
                txt_Line7_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line7MeasureDescription"]);
                txt_Line7_SC.Text = Convert.ToString(dt.Rows[0]["Line7SC"]);
                txt_Line7_Unit.Text = Convert.ToString(dt.Rows[0]["Line7Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line7LaborRate"]) == "")
                {
                    txt_Line7_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line7_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line7LaborRate"]);
                }


                txt_Line7_THW.Text = Convert.ToString(dt.Rows[0]["Line7THW"]);
                txt_Line7_TMC.Text = Convert.ToString(dt.Rows[0]["Line7TMC"]);


                txt_Line8_Cat.Text = Convert.ToString(dt.Rows[0]["Line8Category"]);
                txt_Line8_LIURP.Text = Convert.ToString(dt.Rows[0]["Line8LIURPCode"]);
                txt_Line8_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line8MeasureDescription"]);
                txt_Line8_SC.Text = Convert.ToString(dt.Rows[0]["Line8SC"]);
                txt_Line8_Unit.Text = Convert.ToString(dt.Rows[0]["Line8Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line8LaborRate"]) == "")
                {
                    txt_Line8_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line8_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line8LaborRate"]);
                }


                txt_Line8_THW.Text = Convert.ToString(dt.Rows[0]["Line8THW"]);
                txt_Line8_TMC.Text = Convert.ToString(dt.Rows[0]["Line8TMC"]);


                txt_Line9_Cat.Text = Convert.ToString(dt.Rows[0]["Line9Category"]);
                txt_Line9_LIURP.Text = Convert.ToString(dt.Rows[0]["Line9LIURPCode"]);
                txt_Line9_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line9MeasureDescription"]);
                txt_Line9_SC.Text = Convert.ToString(dt.Rows[0]["Line9SC"]);
                txt_Line9_Unit.Text = Convert.ToString(dt.Rows[0]["Line9Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line9LaborRate"]) == "")
                {
                    txt_Line9_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line9_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line9LaborRate"]);
                }


                txt_Line9_THW.Text = Convert.ToString(dt.Rows[0]["Line9THW"]);
                txt_Line9_TMC.Text = Convert.ToString(dt.Rows[0]["Line9TMC"]);


                txt_Line10_Cat.Text = Convert.ToString(dt.Rows[0]["Line10Category"]);
                txt_Line10_LIURP.Text = Convert.ToString(dt.Rows[0]["Line10LIURPCode"]);
                txt_Line10_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line10MeasureDescription"]);
                txt_Line10_SC.Text = Convert.ToString(dt.Rows[0]["Line10SC"]);
                txt_Line10_Unit.Text = Convert.ToString(dt.Rows[0]["Line10Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line10LaborRate"]) == "")
                {
                    txt_Line10_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line10_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line10LaborRate"]);
                }


                txt_Line10_THW.Text = Convert.ToString(dt.Rows[0]["Line10THW"]);
                txt_Line10_TMC.Text = Convert.ToString(dt.Rows[0]["Line10TMC"]);

                txt_Line11_Cat.Text = Convert.ToString(dt.Rows[0]["Line11Category"]);
                txt_Line11_LIURP.Text = Convert.ToString(dt.Rows[0]["Line11LIURPCode"]);
                txt_Line11_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line11MeasureDescription"]);
                txt_Line11_SC.Text = Convert.ToString(dt.Rows[0]["Line11SC"]);
                txt_Line11_Unit.Text = Convert.ToString(dt.Rows[0]["Line11Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line11LaborRate"]) == "")
                {
                    txt_Line11_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line11_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line11LaborRate"]);
                }


                txt_Line11_THW.Text = Convert.ToString(dt.Rows[0]["Line11THW"]);
                txt_Line11_TMC.Text = Convert.ToString(dt.Rows[0]["Line11TMC"]);

                //txt_Line17_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line17CostPerUnit"]); 

                txt_Line18_Cat.Text = Convert.ToString(dt.Rows[0]["Line18Category"]);
                txt_Line18_LIURP.Text = Convert.ToString(dt.Rows[0]["Line18LIURPCode"]);

                txt_Line18_SC.Text = Convert.ToString(dt.Rows[0]["Line18SC"]);
                txt_Line18_Unit.Text = Convert.ToString(dt.Rows[0]["Line18Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line18LaborRate"]) == "")
                {
                    txt_Line18_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line18_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line18LaborRate"]);
                }

                txt_Line18_THW.Text = Convert.ToString(dt.Rows[0]["Line18THW"]);
                txt_Line18_TMC.Text = Convert.ToString(dt.Rows[0]["Line18TMC"]);
                txt_Line18_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line18MeasureDescription"]); 
                txt_Line19_Cat.Text = Convert.ToString(dt.Rows[0]["Line19Category"]);
                txt_Line19_LIURP.Text = Convert.ToString(dt.Rows[0]["Line19LIURPCode"]);

                txt_Line19_SC.Text = Convert.ToString(dt.Rows[0]["Line19SC"]);
                txt_Line19_Unit.Text = Convert.ToString(dt.Rows[0]["Line19Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line19LaborRate"]) == "")
                {
                    txt_Line19_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line19_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line19LaborRate"]);
                }

                txt_Line19_THW.Text = Convert.ToString(dt.Rows[0]["Line19THW"]);
                txt_Line19_TMC.Text = Convert.ToString(dt.Rows[0]["Line19TMC"]);
                txt_Line19_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line19MeasureDescription"]); 

                txt_Line20_Cat.Text = Convert.ToString(dt.Rows[0]["Line20Category"]);
                txt_Line20_LIURP.Text = Convert.ToString(dt.Rows[0]["Line20LIURPCode"]);
                txt_Line20_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line20MeasureDescription"]); 
                txt_Line20_SC.Text = Convert.ToString(dt.Rows[0]["Line20SC"]);
                txt_Line20_Unit.Text = Convert.ToString(dt.Rows[0]["Line20Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line20LaborRate"]) == "")
                {
                    txt_Line20_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line20_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line20LaborRate"]);
                }

                txt_Line20_THW.Text = Convert.ToString(dt.Rows[0]["Line20THW"]);
                txt_Line20_TMC.Text = Convert.ToString(dt.Rows[0]["Line20TMC"]);
                //txt_Line20_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line20CostPerUnit"]); 

                Decimal Page1 = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["TotalPage1"].ToString()));
                Decimal Page2 = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["TotalPage2"].ToString()));
                Decimal Page3 = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["TotalPage3"].ToString()));

                Decimal GrandTotal = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["GrandTotal"].ToString()));


                txt_TotalPage1.Text = "$" + String.Format("{0:00.##}", Page1);
                txt_TotalPage2.Text = "$" + String.Format("{0:00.##}", Page2);
                txt_TotalPage3.Text = "$" + String.Format("{0:00.##}", Page3);

                txt_GrandTotal.Text = "$" + String.Format("{0:00.##}", GrandTotal);

                txt_ContractorLine1Type.Text = Convert.ToString(dt.Rows[0]["ContractorLine1Type"]);
                txt_ContractorLine1Name.Text = Convert.ToString(dt.Rows[0]["ContractorLine1Name"]);
                txt_ContractorLine1Comments.Text = Convert.ToString(dt.Rows[0]["ContractorLine1Comments"]);

                if (Convert.ToString(dt.Rows[0]["ContractorLine1CallDate"]) != "")
                {
                    txt_ContractorLine1CallDate.Text = Convert.ToString(Convert.ToDateTime(dt.Rows[0]["ContractorLine1CallDate"]).ToString("MM/dd/yyyy"));
                }

                txt_ContractorLine2Type.Text = Convert.ToString(dt.Rows[0]["ContractorLine2Type"]);
                txt_ContractorLine2Name.Text = Convert.ToString(dt.Rows[0]["ContractorLine2Name"]);
                txt_ContractorLine2Comments.Text = Convert.ToString(dt.Rows[0]["ContractorLine2Comments"]);

                if (Convert.ToString(dt.Rows[0]["ContractorLine2CallDate"]) != "")
                {
                    txt_ContractorLine2CallDate.Text = Convert.ToString(Convert.ToDateTime(dt.Rows[0]["ContractorLine2CallDate"]).ToString("MM/dd/yyyy"));
                }

                txt_ContractorLine3Type.Text = Convert.ToString(dt.Rows[0]["ContractorLine3Type"]);
                txt_ContractorLine3Name.Text = Convert.ToString(dt.Rows[0]["ContractorLine3Name"]);
                txt_ContractorLine3Comments.Text = Convert.ToString(dt.Rows[0]["ContractorLine3Comments"]);

                if (Convert.ToString(dt.Rows[0]["ContractorLine3CallDate"]) != "")
                {
                    txt_ContractorLine3CallDate.Text = Convert.ToString(Convert.ToDateTime(dt.Rows[0]["ContractorLine3CallDate"]).ToString("MM/dd/yyyy"));
                }

                txt_ContractorLine4Type.Text = Convert.ToString(dt.Rows[0]["ContractorLine4Type"]);
                txt_ContractorLine4Name.Text = Convert.ToString(dt.Rows[0]["ContractorLine4Name"]);
                txt_ContractorLine4Comments.Text = Convert.ToString(dt.Rows[0]["ContractorLine4Comments"]);

                if (Convert.ToString(dt.Rows[0]["ContractorLine4CallDate"]) != "")
                {
                    txt_ContractorLine4CallDate.Text = Convert.ToString(Convert.ToDateTime(dt.Rows[0]["ContractorLine4CallDate"]).ToString("MM/dd/yyyy"));
                }





                txt_SignatureofContractor.Text = Convert.ToString(dt.Rows[0]["SignatureofContractor"]);




                if (Convert.ToString(dt.Rows[0]["DateOfAudit"]) != "1/1/1900 12:00:00 AM")
                {
                    txt_DateWorkCompleted.Text = Convert.ToString(Convert.ToDateTime(dt.Rows[0]["DateOfAudit"]).ToString("MM/dd/yyyy"));
                }
                else
                {
                    txt_DateWorkCompleted.Text = "";
                }

                if (Convert.ToString(dt.Rows[0]["DateInvoiceSubmitted"]) != "1/1/1900 12:00:00 AM")
                {
                    txt_DateInvoiceSubmitted.Text = Convert.ToString(Convert.ToDateTime(dt.Rows[0]["DateInvoiceSubmitted"]).ToString("MM/dd/yyyy"));
                }
                else
                {
                    txt_DateInvoiceSubmitted.Text = "";
                }
            }
        }
        catch
        {
        }
    }


    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        try
        {
            objSm.DeleteCookie("UId");
            objSm.DeleteCookie("UserId");
            objSm.DeleteCookie("UserName");
            Response.Redirect("../Login.aspx");
        }
        catch
        {

        }
    }

    protected void btn_SaveCurrentPg_Click(object sender, EventArgs e)
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            int j = 0;
            j = ObjPPL.UpdatePPLAudit_Act129II_Invoice_3(JobNum, txt_Line1_Qty.Text, txt_Line2_Qty.Text, txt_Line3_Qty.Text, txt_Line4_Qty.Text, txt_Line5_Qty.Text, txt_Line6_Qty.Text, txt_Line7_Qty.Text, txt_Line8_Qty.Text, txt_Line9_Qty.Text, txt_Line10_Qty.Text, txt_Line11_Qty.Text, txt_Line18_Qty.Text, txt_Line19_Qty.Text, txt_Line20_Qty.Text, hdn_Line1_Total.Value, hdn_Line2_Total.Value, hdn_Line3_Total.Value, hdn_Line4_Total.Value, hdn_Line5_Total.Value, hdn_Line6_Total.Value, hdn_Line7_Total.Value, hdn_Line8_Total.Value, hdn_Line9_Total.Value, hdn_Line10_Total.Value, hdn_Line11_Total.Value, hdn_Line18_Total.Value, hdn_Line19_Total.Value, hdn_Line20_Total.Value, txt_Line1_Cat.Text, txt_Line1_LIURP.Text, txt_Line1_MeasureDesc.Text, txt_Line1_SC.Text, txt_Line1_Unit.Text, txt_Line1_LaborRate.Text, txt_Line1_THW.Text, txt_Line1_TMC.Text, txt_Line1_CostUnit.Text, txt_Line2_Cat.Text, txt_Line2_LIURP.Text, txt_Line2_MeasureDesc.Text, txt_Line2_SC.Text, txt_Line2_Unit.Text, txt_Line2_LaborRate.Text, txt_Line2_THW.Text, txt_Line2_TMC.Text, txt_Line2_CostUnit.Text, txt_Line3_Cat.Text, txt_Line3_LIURP.Text, txt_Line3_MeasureDesc.Text, txt_Line3_SC.Text, txt_Line3_Unit.Text, txt_Line3_LaborRate.Text, txt_Line3_THW.Text, txt_Line3_TMC.Text, txt_Line3_CostUnit.Text, txt_Line4_Cat.Text, txt_Line4_LIURP.Text, txt_Line4_MeasureDesc.Text, txt_Line4_SC.Text, txt_Line4_Unit.Text, txt_Line4_LaborRate.Text, txt_Line4_THW.Text, txt_Line4_TMC.Text, txt_Line4_CostUnit.Text, txt_Line5_Cat.Text, txt_Line5_LIURP.Text, txt_Line5_MeasureDesc.Text, txt_Line5_SC.Text, txt_Line5_Unit.Text, txt_Line5_LaborRate.Text, txt_Line5_THW.Text, txt_Line5_TMC.Text, txt_Line5_CostUnit.Text, txt_Line6_Cat.Text, txt_Line6_LIURP.Text, txt_Line6_MeasureDesc.Text, txt_Line6_SC.Text, txt_Line6_Unit.Text, txt_Line6_LaborRate.Text, txt_Line6_THW.Text, txt_Line6_TMC.Text, txt_Line6_CostUnit.Text, txt_Line7_Cat.Text, txt_Line7_LIURP.Text, txt_Line7_MeasureDesc.Text, txt_Line7_SC.Text, txt_Line7_Unit.Text, txt_Line7_LaborRate.Text, txt_Line7_THW.Text, txt_Line7_TMC.Text, txt_Line7_CostUnit.Text, txt_Line8_Cat.Text, txt_Line8_LIURP.Text, txt_Line8_MeasureDesc.Text, txt_Line8_SC.Text, txt_Line8_Unit.Text, txt_Line8_LaborRate.Text, txt_Line8_THW.Text, txt_Line8_TMC.Text, txt_Line8_CostUnit.Text, txt_Line9_Cat.Text, txt_Line9_LIURP.Text, txt_Line9_MeasureDesc.Text, txt_Line9_SC.Text, txt_Line9_Unit.Text, txt_Line9_LaborRate.Text, txt_Line9_THW.Text, txt_Line9_TMC.Text, txt_Line9_CostUnit.Text, txt_Line10_Cat.Text, txt_Line10_LIURP.Text, txt_Line10_MeasureDesc.Text, txt_Line10_SC.Text, txt_Line10_Unit.Text, txt_Line10_LaborRate.Text, txt_Line10_THW.Text, txt_Line10_TMC.Text, txt_Line10_CostUnit.Text, txt_Line11_Cat.Text, txt_Line11_LIURP.Text, txt_Line11_MeasureDesc.Text, txt_Line11_SC.Text, txt_Line11_Unit.Text, txt_Line11_LaborRate.Text, txt_Line11_THW.Text, txt_Line11_TMC.Text, txt_Line11_CostUnit.Text, txt_Line18_Cat.Text, txt_Line18_LIURP.Text, txt_Line18_MeasureDesc.Text, txt_Line18_SC.Text, txt_Line18_Unit.Text, txt_Line18_LaborRate.Text, txt_Line18_THW.Text, txt_Line18_TMC.Text, "", txt_Line19_Cat.Text, txt_Line19_LIURP.Text, txt_Line19_MeasureDesc.Text, txt_Line19_SC.Text, txt_Line19_Unit.Text, txt_Line19_LaborRate.Text, txt_Line19_THW.Text, txt_Line19_TMC.Text, "", txt_Line20_Cat.Text, txt_Line20_LIURP.Text, txt_Line20_MeasureDesc.Text, txt_Line20_SC.Text, txt_Line20_Unit.Text, txt_Line20_LaborRate.Text, txt_Line20_THW.Text, txt_Line20_TMC.Text, "", hdn_Finalize.Value, txt_ContractorLine1Type.Text, txt_ContractorLine1Name.Text, txt_ContractorLine2CallDate.Text, txt_ContractorLine1Comments.Text, txt_ContractorLine2Type.Text, txt_ContractorLine2Name.Text, txt_ContractorLine3CallDate.Text, txt_ContractorLine2Comments.Text, txt_ContractorLine3Type.Text, txt_ContractorLine3Name.Text, txt_ContractorLine3CallDate.Text, txt_ContractorLine3Comments.Text, txt_ContractorLine4Type.Text, txt_ContractorLine4Name.Text, txt_ContractorLine4CallDate.Text, txt_ContractorLine4Comments.Text, txt_DateInvoiceSubmitted.Text, txt_DateWorkCompleted.Text, txt_SignatureofContractor.Text);
            BindData(JobNum);
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }

    }
    protected void btn_FinalizeInvoice_Click(object sender, EventArgs e)
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            int j = 0;
            j = ObjPPL.UpdatePPLAudit_Act129II_Invoice_3(JobNum, txt_Line1_Qty.Text, txt_Line2_Qty.Text, txt_Line3_Qty.Text, txt_Line4_Qty.Text, txt_Line5_Qty.Text, txt_Line6_Qty.Text, txt_Line7_Qty.Text, txt_Line8_Qty.Text, txt_Line9_Qty.Text, txt_Line10_Qty.Text, txt_Line11_Qty.Text, txt_Line18_Qty.Text, txt_Line19_Qty.Text, txt_Line20_Qty.Text, hdn_Line1_Total.Value, hdn_Line2_Total.Value, hdn_Line3_Total.Value, hdn_Line4_Total.Value, hdn_Line5_Total.Value, hdn_Line6_Total.Value, hdn_Line7_Total.Value, hdn_Line8_Total.Value, hdn_Line9_Total.Value, hdn_Line10_Total.Value, hdn_Line11_Total.Value, hdn_Line18_Total.Value, hdn_Line19_Total.Value, hdn_Line20_Total.Value, txt_Line1_Cat.Text, txt_Line1_LIURP.Text, txt_Line1_MeasureDesc.Text, txt_Line1_SC.Text, txt_Line1_Unit.Text, txt_Line1_LaborRate.Text, txt_Line1_THW.Text, txt_Line1_TMC.Text, txt_Line1_CostUnit.Text, txt_Line2_Cat.Text, txt_Line2_LIURP.Text, txt_Line2_MeasureDesc.Text, txt_Line2_SC.Text, txt_Line2_Unit.Text, txt_Line2_LaborRate.Text, txt_Line2_THW.Text, txt_Line2_TMC.Text, txt_Line2_CostUnit.Text, txt_Line3_Cat.Text, txt_Line3_LIURP.Text, txt_Line3_MeasureDesc.Text, txt_Line3_SC.Text, txt_Line3_Unit.Text, txt_Line3_LaborRate.Text, txt_Line3_THW.Text, txt_Line3_TMC.Text, txt_Line3_CostUnit.Text, txt_Line4_Cat.Text, txt_Line4_LIURP.Text, txt_Line4_MeasureDesc.Text, txt_Line4_SC.Text, txt_Line4_Unit.Text, txt_Line4_LaborRate.Text, txt_Line4_THW.Text, txt_Line4_TMC.Text, txt_Line4_CostUnit.Text, txt_Line5_Cat.Text, txt_Line5_LIURP.Text, txt_Line5_MeasureDesc.Text, txt_Line5_SC.Text, txt_Line5_Unit.Text, txt_Line5_LaborRate.Text, txt_Line5_THW.Text, txt_Line5_TMC.Text, txt_Line5_CostUnit.Text, txt_Line6_Cat.Text, txt_Line6_LIURP.Text, txt_Line6_MeasureDesc.Text, txt_Line6_SC.Text, txt_Line6_Unit.Text, txt_Line6_LaborRate.Text, txt_Line6_THW.Text, txt_Line6_TMC.Text, txt_Line6_CostUnit.Text, txt_Line7_Cat.Text, txt_Line7_LIURP.Text, txt_Line7_MeasureDesc.Text, txt_Line7_SC.Text, txt_Line7_Unit.Text, txt_Line7_LaborRate.Text, txt_Line7_THW.Text, txt_Line7_TMC.Text, txt_Line7_CostUnit.Text, txt_Line8_Cat.Text, txt_Line8_LIURP.Text, txt_Line8_MeasureDesc.Text, txt_Line8_SC.Text, txt_Line8_Unit.Text, txt_Line8_LaborRate.Text, txt_Line8_THW.Text, txt_Line8_TMC.Text, txt_Line8_CostUnit.Text, txt_Line9_Cat.Text, txt_Line9_LIURP.Text, txt_Line9_MeasureDesc.Text, txt_Line9_SC.Text, txt_Line9_Unit.Text, txt_Line9_LaborRate.Text, txt_Line9_THW.Text, txt_Line9_TMC.Text, txt_Line9_CostUnit.Text, txt_Line10_Cat.Text, txt_Line10_LIURP.Text, txt_Line10_MeasureDesc.Text, txt_Line10_SC.Text, txt_Line10_Unit.Text, txt_Line10_LaborRate.Text, txt_Line10_THW.Text, txt_Line10_TMC.Text, txt_Line10_CostUnit.Text, txt_Line11_Cat.Text, txt_Line11_LIURP.Text, txt_Line11_MeasureDesc.Text, txt_Line11_SC.Text, txt_Line11_Unit.Text, txt_Line11_LaborRate.Text, txt_Line11_THW.Text, txt_Line11_TMC.Text, txt_Line11_CostUnit.Text, txt_Line18_Cat.Text, txt_Line18_LIURP.Text, txt_Line18_MeasureDesc.Text, txt_Line18_SC.Text, txt_Line18_Unit.Text, txt_Line18_LaborRate.Text, txt_Line18_THW.Text, txt_Line18_TMC.Text, "", txt_Line19_Cat.Text, txt_Line19_LIURP.Text, txt_Line19_MeasureDesc.Text, txt_Line19_SC.Text, txt_Line19_Unit.Text, txt_Line19_LaborRate.Text, txt_Line19_THW.Text, txt_Line19_TMC.Text, "", txt_Line20_Cat.Text, txt_Line20_LIURP.Text, txt_Line20_MeasureDesc.Text, txt_Line20_SC.Text, txt_Line20_Unit.Text, txt_Line20_LaborRate.Text, txt_Line20_THW.Text, txt_Line20_TMC.Text, "", "F", txt_ContractorLine1Type.Text, txt_ContractorLine1Name.Text, txt_ContractorLine2CallDate.Text, txt_ContractorLine1Comments.Text, txt_ContractorLine2Type.Text, txt_ContractorLine2Name.Text, txt_ContractorLine3CallDate.Text, txt_ContractorLine2Comments.Text, txt_ContractorLine3Type.Text, txt_ContractorLine3Name.Text, txt_ContractorLine3CallDate.Text, txt_ContractorLine3Comments.Text, txt_ContractorLine4Type.Text, txt_ContractorLine4Name.Text, txt_ContractorLine4CallDate.Text, txt_ContractorLine4Comments.Text, txt_DateInvoiceSubmitted.Text, txt_DateWorkCompleted.Text, txt_SignatureofContractor.Text);
            BindData(JobNum);
            Response.Write("<script>alert('This Job is Finalize');</script>");
        }
        catch
        {
        }
    }
    protected void btn_PrintInvoice_Click(object sender, EventArgs e)
    {
        try
        {
            if (hdn_Finalize.Value == "F")
            {
                Response.Redirect("Print_Act129II_Invoice.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('you must finalize(make uneditable) an invoice to print.');", true);
            }
        }
        catch
        {
        }
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../DisplayJobSearchRecords.aspx?Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + 2);
        }
        catch
        {
        }
    }
    protected void LnkAudit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToString(Request.QueryString["Jobs"]) != "" && Convert.ToString(Request.QueryString["Utility"]) != "")
            {
                Response.Redirect("PPL_Audit_1.aspx?Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Convert.ToInt32(Request.QueryString["Utility"]));
            }
            else
            {
                Response.Redirect("../Home.aspx");
            }
        }
        catch
        {
        }
    }
}
