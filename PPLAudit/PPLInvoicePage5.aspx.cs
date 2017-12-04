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

public partial class PPLAudit_PPLInvoicePage5 : System.Web.UI.Page
{

    public string StrUserName = "";
    smUtil objSm = new smUtil();
    dcPPLAudit ObjPPL = new dcPPLAudit();
    dc_AddNewJob objaddnewjob = new dc_AddNewJob();
    public DataTable dtJobSearch = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        //StrUserName = objSm.GetCookie("UserName");
        try
        {
            dtJobSearch = objaddnewjob.ShowJobByJobNumber_ByJobNumber(Request.QueryString["Jobs"].ToString());
            if (Convert.ToBoolean(dtJobSearch.Rows[0]["Act129II"]) != true)
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

    public void BindData(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Invoice_5(JobNum);
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
                    txt_Line12_Qty.Enabled = false;
                    txt_Line13_Qty.Enabled = false;
                    txt_Line14_Qty.Enabled = false;
                    txt_Line15_Qty.Enabled = false;
                    txt_Line16_Qty.Enabled = false;
                    txt_Line17_Qty.Enabled = false;
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
                txt_Line12_Qty.Text = Convert.ToString(dt.Rows[0]["Line12Quantity"]);
                txt_Line13_Qty.Text = Convert.ToString(dt.Rows[0]["Line13Quantity"]);
                txt_Line14_Qty.Text = Convert.ToString(dt.Rows[0]["Line14Quantity"]);
                txt_Line15_Qty.Text = Convert.ToString(dt.Rows[0]["Line15Quantity"]);
                txt_Line16_Qty.Text = Convert.ToString(dt.Rows[0]["Line16Quantity"]);
                txt_Line17_Qty.Text = Convert.ToString(dt.Rows[0]["Line17Quantity"]);
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
                txt_Line12_Total.Text = Convert.ToString(dt.Rows[0]["Line12Total"]);
                txt_Line13_Total.Text = Convert.ToString(dt.Rows[0]["Line13Total"]);
                txt_Line14_Total.Text = Convert.ToString(dt.Rows[0]["Line14Total"]);
                txt_Line15_Total.Text = Convert.ToString(dt.Rows[0]["Line15Total"]);
                txt_Line16_Total.Text = Convert.ToString(dt.Rows[0]["Line16Total"]);
                txt_Line17_Total.Text = Convert.ToString(dt.Rows[0]["Line17Total"]);
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
                hdn_Line12_Total.Value = Convert.ToString(dt.Rows[0]["Line12Total"]);
                hdn_Line13_Total.Value = Convert.ToString(dt.Rows[0]["Line13Total"]);
                hdn_Line14_Total.Value = Convert.ToString(dt.Rows[0]["Line14Total"]);
                hdn_Line15_Total.Value = Convert.ToString(dt.Rows[0]["Line15Total"]);
                hdn_Line16_Total.Value = Convert.ToString(dt.Rows[0]["Line16Total"]);
                hdn_Line17_Total.Value = Convert.ToString(dt.Rows[0]["Line17Total"]);
                hdn_Line18_Total.Value = Convert.ToString(dt.Rows[0]["Line18Total"]);
                hdn_Line19_Total.Value = Convert.ToString(dt.Rows[0]["Line19Total"]);
                hdn_Line20_Total.Value = Convert.ToString(dt.Rows[0]["Line20Total"]);


                hdn_Finalize.Value = Convert.ToString(dt.Rows[0]["Finalized"]);

                txt_Line1_Location.Text = Convert.ToString(dt.Rows[0]["Line1Location"]);
                txt_Line2_Location.Text = Convert.ToString(dt.Rows[0]["Line2Location"]);
                txt_Line3_Location.Text = Convert.ToString(dt.Rows[0]["Line3Location"]);
                txt_Line4_Location.Text = Convert.ToString(dt.Rows[0]["Line4Location"]);
                txt_Line5_Location.Text = Convert.ToString(dt.Rows[0]["Line5Location"]);
                txt_Line6_Location.Text = Convert.ToString(dt.Rows[0]["Line6Location"]);
                txt_Line7_Location.Text = Convert.ToString(dt.Rows[0]["Line7Location"]);
                txt_Line8_Location.Text = Convert.ToString(dt.Rows[0]["Line8Location"]);
                txt_Line9_Location.Text = Convert.ToString(dt.Rows[0]["Line9Location"]);
                txt_Line10_Location.Text = Convert.ToString(dt.Rows[0]["Line10Location"]);
                txt_Line11_Location.Text = Convert.ToString(dt.Rows[0]["Line11Location"]);
                txt_Line12_Location.Text = Convert.ToString(dt.Rows[0]["Line12Location"]);
                txt_Line13_Location.Text = Convert.ToString(dt.Rows[0]["Line13Location"]);
                txt_Line14_Location.Text = Convert.ToString(dt.Rows[0]["Line14Location"]);
                txt_Line15_Location.Text = Convert.ToString(dt.Rows[0]["Line15Location"]);
                txt_Line16_Location.Text = Convert.ToString(dt.Rows[0]["Line16Location"]);
                txt_Line17_Location.Text = Convert.ToString(dt.Rows[0]["Line17Location"]);
                txt_Line18_Location.Text = Convert.ToString(dt.Rows[0]["Line18Location"]);
                txt_Line19_Location.Text = Convert.ToString(dt.Rows[0]["Line19Location"]);
                txt_Line20_Location.Text = Convert.ToString(dt.Rows[0]["Line20Location"]);

                txt_Line12_Cat.Text = Convert.ToString(dt.Rows[0]["Line12Category"]);
                txt_Line12_LIURP.Text = Convert.ToString(dt.Rows[0]["Line12LIURPCode"]);
                txt_Line12_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line12MeasureDescription"]);
                txt_Line12_SC.Text = Convert.ToString(dt.Rows[0]["Line12SC"]);
                txt_Line12_Unit.Text = Convert.ToString(dt.Rows[0]["Line12Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line12LaborRate"]) == "")
                {
                    txt_Line12_LaborRate.Text = "43/68";
                }
                else
                {
                    txt_Line12_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line12LaborRate"]);
                }

                txt_Line12_THW.Text = Convert.ToString(dt.Rows[0]["Line12THW"]);
                txt_Line12_TMC.Text = Convert.ToString(dt.Rows[0]["Line12TMC"]);
                //txt_Line12_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line12CostPerUnit"]);


                txt_Line13_Cat.Text = Convert.ToString(dt.Rows[0]["Line13Category"]);
                txt_Line13_LIURP.Text = Convert.ToString(dt.Rows[0]["Line13LIURPCode"]);
                txt_Line13_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line13MeasureDescription"]);
                txt_Line13_SC.Text = Convert.ToString(dt.Rows[0]["Line13SC"]);
                txt_Line13_Unit.Text = Convert.ToString(dt.Rows[0]["Line13Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line13LaborRate"]) == "")
                {
                    txt_Line13_LaborRate.Text = "43/68";
                }
                else
                {
                    txt_Line13_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line13LaborRate"]);
                }


                txt_Line13_THW.Text = Convert.ToString(dt.Rows[0]["Line13THW"]);
                txt_Line13_TMC.Text = Convert.ToString(dt.Rows[0]["Line13TMC"]);
                //txt_Line13_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line13CostPerUnit"]); 

                txt_Line16_Cat.Text = Convert.ToString(dt.Rows[0]["Line16Category"]);
                txt_Line16_LIURP.Text = Convert.ToString(dt.Rows[0]["Line16LIURPCode"]);
                txt_Line16_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line16MeasureDescription"]);
                txt_Line16_SC.Text = Convert.ToString(dt.Rows[0]["Line16SC"]);
                txt_Line16_Unit.Text = Convert.ToString(dt.Rows[0]["Line16Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line16LaborRate"]) == "")
                {
                    txt_Line16_LaborRate.Text = "43/68";
                }
                else
                {
                    txt_Line16_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line16LaborRate"]);
                }

                txt_Line16_THW.Text = Convert.ToString(dt.Rows[0]["Line16THW"]);
                txt_Line16_TMC.Text = Convert.ToString(dt.Rows[0]["Line16TMC"]);
                //txt_Line16_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line16CostPerUnit"]); 

                txt_Line17_Cat.Text = Convert.ToString(dt.Rows[0]["Line17Category"]);
                txt_Line17_LIURP.Text = Convert.ToString(dt.Rows[0]["Line17LIURPCode"]);
                txt_Line17_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line17MeasureDescription"]);
                txt_Line17_SC.Text = Convert.ToString(dt.Rows[0]["Line17SC"]);
                txt_Line17_Unit.Text = Convert.ToString(dt.Rows[0]["Line17Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line17LaborRate"]) == "")
                {
                    txt_Line17_LaborRate.Text = "43/68";
                }
                else
                {
                    txt_Line17_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line17LaborRate"]);
                }


                txt_Line17_THW.Text = Convert.ToString(dt.Rows[0]["Line17THW"]);
                txt_Line17_TMC.Text = Convert.ToString(dt.Rows[0]["Line17TMC"]);
                //txt_Line17_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line17CostPerUnit"]); 

                txt_Line18_Cat.Text = Convert.ToString(dt.Rows[0]["Line18Category"]);
                txt_Line18_LIURP.Text = Convert.ToString(dt.Rows[0]["Line18LIURPCode"]);
                txt_Line18_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line18MeasureDescription"]);
                txt_Line18_SC.Text = Convert.ToString(dt.Rows[0]["Line18SC"]);
                txt_Line18_Unit.Text = Convert.ToString(dt.Rows[0]["Line18Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line18LaborRate"]) == "")
                {
                    txt_Line18_LaborRate.Text = "43/68";
                }
                else
                {
                    txt_Line18_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line18LaborRate"]);
                }

                txt_Line18_THW.Text = Convert.ToString(dt.Rows[0]["Line18THW"]);
                txt_Line18_TMC.Text = Convert.ToString(dt.Rows[0]["Line18TMC"]);
                //txt_Line18_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line18CostPerUnit"]); 

                txt_Line19_Cat.Text = Convert.ToString(dt.Rows[0]["Line19Category"]);
                txt_Line19_LIURP.Text = Convert.ToString(dt.Rows[0]["Line19LIURPCode"]);
                txt_Line19_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line19MeasureDescription"]);
                txt_Line19_SC.Text = Convert.ToString(dt.Rows[0]["Line19SC"]);
                txt_Line19_Unit.Text = Convert.ToString(dt.Rows[0]["Line19Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line19LaborRate"]) == "")
                {
                    txt_Line19_LaborRate.Text = "43/68";
                }
                else
                {
                    txt_Line19_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line19LaborRate"]);
                }

                txt_Line19_THW.Text = Convert.ToString(dt.Rows[0]["Line19THW"]);
                txt_Line19_TMC.Text = Convert.ToString(dt.Rows[0]["Line19TMC"]);
                //txt_Line19_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line19CostPerUnit"]); 

                txt_Line20_Cat.Text = Convert.ToString(dt.Rows[0]["Line20Category"]);
                txt_Line20_LIURP.Text = Convert.ToString(dt.Rows[0]["Line20LIURPCode"]);
                txt_Line20_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line20MeasureDescription"]);
                txt_Line20_SC.Text = Convert.ToString(dt.Rows[0]["Line20SC"]);
                txt_Line20_Unit.Text = Convert.ToString(dt.Rows[0]["Line20Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line20LaborRate"]) == "")
                {
                    txt_Line20_LaborRate.Text = "43/68";
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
                Decimal Page4 = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["TotalPage4"].ToString()));
                Decimal Page5 = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["TotalPage5"].ToString()));
                Decimal GrandTotal = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["GrandTotal"].ToString()));


                txt_TotalPage1.Text = "$" + String.Format("{0:00.##}", Page1);
                txt_TotalPage2.Text = "$" + String.Format("{0:00.##}", Page2);
                txt_TotalPage3.Text = "$" + String.Format("{0:00.##}", Page3);
                txt_TotalPage4.Text = "$" + String.Format("{0:00.##}", Page4);
                txt_TotalPage5.Text = "$" + String.Format("{0:00.##}", Page5);
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


    protected void btn_PrintInvoice_Click(object sender, EventArgs e)
    {
        try
        {
            if (hdn_Finalize.Value == "F")
            {
                Response.Redirect("PPL_Invoice_Page.aspx?Jobs=" + Request.QueryString["Jobs"] + "&Utility=" + Request.QueryString["Utility"]);
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
            string str = hdn_Line9_Total.Value;

            j = ObjPPL.UpdatePPLAudit_Invoice_5(JobNum, txt_Line1_Qty.Text, txt_Line2_Qty.Text, txt_Line3_Qty.Text, txt_Line4_Qty.Text, txt_Line5_Qty.Text, txt_Line6_Qty.Text, txt_Line7_Qty.Text, txt_Line8_Qty.Text, txt_Line9_Qty.Text, txt_Line10_Qty.Text, txt_Line11_Qty.Text, txt_Line12_Qty.Text, txt_Line13_Qty.Text, txt_Line14_Qty.Text, txt_Line15_Qty.Text, txt_Line16_Qty.Text, txt_Line17_Qty.Text, txt_Line18_Qty.Text, txt_Line19_Qty.Text, txt_Line20_Qty.Text, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", hdn_Line1_Total.Value, hdn_Line2_Total.Value, hdn_Line3_Total.Value, hdn_Line4_Total.Value, hdn_Line5_Total.Value, hdn_Line6_Total.Value, hdn_Line7_Total.Value, hdn_Line8_Total.Value, hdn_Line9_Total.Value, hdn_Line10_Total.Value, hdn_Line11_Total.Value, hdn_Line12_Total.Value, hdn_Line13_Total.Value, hdn_Line14_Total.Value, hdn_Line15_Total.Value, hdn_Line16_Total.Value, hdn_Line17_Total.Value, hdn_Line17_Total.Value, hdn_Line19_Total.Value, hdn_Line20_Total.Value, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", txt_Line12_Cat.Text, txt_Line12_LIURP.Text, txt_Line12_MeasureDesc.Text, txt_Line12_SC.Text, txt_Line12_Unit.Text, txt_Line12_LaborRate.Text, txt_Line12_THW.Text, txt_Line12_TMC.Text, "", txt_Line13_Cat.Text, txt_Line13_LIURP.Text, txt_Line13_MeasureDesc.Text, txt_Line13_SC.Text, txt_Line13_Unit.Text, txt_Line13_LaborRate.Text, txt_Line13_THW.Text, txt_Line13_TMC.Text, "", txt_Line16_Cat.Text, txt_Line16_LIURP.Text, txt_Line16_MeasureDesc.Text, txt_Line16_SC.Text, txt_Line16_Unit.Text, txt_Line16_LaborRate.Text, txt_Line16_THW.Text, txt_Line16_TMC.Text, "", txt_Line17_Cat.Text, txt_Line17_LIURP.Text, txt_Line17_MeasureDesc.Text, txt_Line17_SC.Text, txt_Line17_Unit.Text, txt_Line17_LaborRate.Text, txt_Line17_THW.Text, txt_Line17_TMC.Text, "", txt_Line18_Cat.Text, txt_Line18_LIURP.Text, txt_Line18_MeasureDesc.Text, txt_Line18_SC.Text, txt_Line18_Unit.Text, txt_Line18_LaborRate.Text, txt_Line18_THW.Text, txt_Line18_TMC.Text, "", txt_Line19_Cat.Text, txt_Line19_LIURP.Text, txt_Line19_MeasureDesc.Text, txt_Line19_SC.Text, txt_Line19_Unit.Text, txt_Line19_LaborRate.Text, txt_Line19_THW.Text, txt_Line19_TMC.Text, "", txt_Line20_Cat.Text, txt_Line20_LIURP.Text, txt_Line20_MeasureDesc.Text, txt_Line20_SC.Text, txt_Line20_Unit.Text, txt_Line20_LaborRate.Text, txt_Line20_THW.Text, txt_Line20_TMC.Text, "", txt_ContractorLine1Type.Text, txt_ContractorLine1Name.Text, txt_ContractorLine1CallDate.Text, txt_ContractorLine1Comments.Text, txt_ContractorLine2Type.Text, txt_ContractorLine2Name.Text, txt_ContractorLine2CallDate.Text, txt_ContractorLine2Comments.Text, txt_ContractorLine3Type.Text, txt_ContractorLine3Name.Text, txt_ContractorLine3CallDate.Text, txt_ContractorLine3Comments.Text, txt_ContractorLine4Type.Text, txt_ContractorLine4Name.Text, txt_ContractorLine4CallDate.Text, txt_ContractorLine4Comments.Text, txt_DateInvoiceSubmitted.Text, txt_DateWorkCompleted.Text, txt_SignatureofContractor.Text, hdn_Finalize.Value, txt_Line1_Location.Text, txt_Line2_Location.Text, txt_Line3_Location.Text, txt_Line4_Location.Text, txt_Line5_Location.Text, txt_Line6_Location.Text, txt_Line7_Location.Text, txt_Line8_Location.Text, txt_Line9_Location.Text, txt_Line10_Location.Text, txt_Line11_Location.Text, txt_Line12_Location.Text, txt_Line13_Location.Text, txt_Line14_Location.Text, txt_Line15_Location.Text, txt_Line16_Location.Text, txt_Line17_Location.Text, txt_Line18_Location.Text, txt_Line19_Location.Text, txt_Line20_Location.Text);
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
            j = ObjPPL.UpdatePPLAudit_Invoice_5(JobNum, txt_Line1_Qty.Text, txt_Line2_Qty.Text, txt_Line3_Qty.Text, txt_Line4_Qty.Text, txt_Line5_Qty.Text, txt_Line6_Qty.Text, txt_Line7_Qty.Text, txt_Line8_Qty.Text, txt_Line9_Qty.Text, txt_Line10_Qty.Text, txt_Line11_Qty.Text, txt_Line12_Qty.Text, txt_Line13_Qty.Text, txt_Line14_Qty.Text, txt_Line15_Qty.Text, txt_Line16_Qty.Text, txt_Line17_Qty.Text, txt_Line18_Qty.Text, txt_Line19_Qty.Text, txt_Line20_Qty.Text, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", hdn_Line1_Total.Value, hdn_Line2_Total.Value, hdn_Line3_Total.Value, hdn_Line4_Total.Value, hdn_Line5_Total.Value, hdn_Line6_Total.Value, hdn_Line7_Total.Value, hdn_Line8_Total.Value, txt_Line9_Total.Text, hdn_Line10_Total.Value, hdn_Line11_Total.Value, hdn_Line12_Total.Value, hdn_Line13_Total.Value, hdn_Line14_Total.Value, hdn_Line15_Total.Value, hdn_Line16_Total.Value, hdn_Line17_Total.Value, hdn_Line17_Total.Value, hdn_Line19_Total.Value, hdn_Line20_Total.Value, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", txt_Line12_Cat.Text, txt_Line12_LIURP.Text, txt_Line12_MeasureDesc.Text, txt_Line12_SC.Text, txt_Line12_Unit.Text, txt_Line12_LaborRate.Text, txt_Line12_THW.Text, txt_Line12_TMC.Text, "", txt_Line13_Cat.Text, txt_Line13_LIURP.Text, txt_Line13_MeasureDesc.Text, txt_Line13_SC.Text, txt_Line13_Unit.Text, txt_Line13_LaborRate.Text, txt_Line13_THW.Text, txt_Line13_TMC.Text, "", txt_Line16_Cat.Text, txt_Line16_LIURP.Text, txt_Line16_MeasureDesc.Text, txt_Line16_SC.Text, txt_Line16_Unit.Text, txt_Line16_LaborRate.Text, txt_Line16_THW.Text, txt_Line16_TMC.Text, "", txt_Line17_Cat.Text, txt_Line17_LIURP.Text, txt_Line17_MeasureDesc.Text, txt_Line17_SC.Text, txt_Line17_Unit.Text, txt_Line17_LaborRate.Text, txt_Line17_THW.Text, txt_Line17_TMC.Text, "", txt_Line18_Cat.Text, txt_Line18_LIURP.Text, txt_Line18_MeasureDesc.Text, txt_Line18_SC.Text, txt_Line18_Unit.Text, txt_Line18_LaborRate.Text, txt_Line18_THW.Text, txt_Line18_TMC.Text, "", txt_Line19_Cat.Text, txt_Line19_LIURP.Text, txt_Line19_MeasureDesc.Text, txt_Line19_SC.Text, txt_Line19_Unit.Text, txt_Line19_LaborRate.Text, txt_Line19_THW.Text, txt_Line19_TMC.Text, "", txt_Line20_Cat.Text, txt_Line20_LIURP.Text, txt_Line20_MeasureDesc.Text, txt_Line20_SC.Text, txt_Line20_Unit.Text, txt_Line20_LaborRate.Text, txt_Line20_THW.Text, txt_Line20_TMC.Text, "", txt_ContractorLine1Type.Text, txt_ContractorLine1Name.Text, txt_ContractorLine1CallDate.Text, txt_ContractorLine1Comments.Text, txt_ContractorLine2Type.Text, txt_ContractorLine2Name.Text, txt_ContractorLine2CallDate.Text, txt_ContractorLine2Comments.Text, txt_ContractorLine3Type.Text, txt_ContractorLine3Name.Text, txt_ContractorLine3CallDate.Text, txt_ContractorLine3Comments.Text, txt_ContractorLine4Type.Text, txt_ContractorLine4Name.Text, txt_ContractorLine4CallDate.Text, txt_ContractorLine4Comments.Text, txt_DateInvoiceSubmitted.Text, txt_DateWorkCompleted.Text, txt_SignatureofContractor.Text, "F", txt_Line1_Location.Text, txt_Line2_Location.Text, txt_Line3_Location.Text, txt_Line4_Location.Text, txt_Line5_Location.Text, txt_Line6_Location.Text, txt_Line7_Location.Text, txt_Line8_Location.Text, txt_Line9_Location.Text, txt_Line10_Location.Text, txt_Line11_Location.Text, txt_Line12_Location.Text, txt_Line13_Location.Text, txt_Line14_Location.Text, txt_Line15_Location.Text, txt_Line16_Location.Text, txt_Line17_Location.Text, txt_Line18_Location.Text, txt_Line19_Location.Text, txt_Line20_Location.Text);
            BindData(JobNum);
            Response.Write("<script>alert('This Job is Finalize');</script>");
        }
        catch
        {
        }
    }
}
