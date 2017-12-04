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

public partial class PPLAudit_Act129_II_PPL_InvoicePage2 : System.Web.UI.Page
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
            dt = ObjPPL.GetPPLAudit_Act129II_Invoice_2(JobNum);
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
                    btn_FinalizeInvoice.Enabled = false;
                    btn_SaveCurrentPg.Visible = false;
                    btn_SaveCurrentPg.Enabled = false;
                    btn_PrintInvoice.Enabled = true;
                    btn_Cancel.Visible = true;
                    btn_Cancel.Enabled = true;

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
                    txt_Line21_Qty.Enabled = false;
                    txt_Line22_Qty.Enabled = false;
                    txt_Line23_Qty.Enabled = false;
                    txt_Line24_Qty.Enabled = false;
                    txt_Line25_Qty.Enabled = false;
                    txt_Line26_Qty.Enabled = false;
                    txt_Line27_Qty.Enabled = false;

                    txt_Line28_Qty.Enabled = false;
                    txt_Line29_Qty.Enabled = false;
                    txt_Line30_Qty.Enabled = false;
                    txt_Line31_Qty.Enabled = false;
                    txt_Line32_Qty.Enabled = false;
                    txt_Line33_Qty.Enabled = false;
                    txt_Line34_Qty.Enabled = false;
                    txt_Line35_Qty.Enabled = false;
                    txt_Line36_Qty.Enabled = false;
                    txt_Line37_Qty.Enabled = false;
                    txt_Line38_Qty.Enabled = false;
                    txt_Line39_Qty.Enabled = false;
                    spann_final.Visible = true;
                }
                else
                {
                    btn_FinalizeInvoice.Visible = true;
                    btn_FinalizeInvoice.Enabled = true;
                    btn_SaveCurrentPg.Visible = true;
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
                txt_Line21_Qty.Text = Convert.ToString(dt.Rows[0]["Line21Quantity"]);
                txt_Line22_Qty.Text = Convert.ToString(dt.Rows[0]["Line22Quantity"]);
                txt_Line23_Qty.Text = Convert.ToString(dt.Rows[0]["Line23Quantity"]);
                txt_Line24_Qty.Text = Convert.ToString(dt.Rows[0]["Line24Quantity"]);
                txt_Line25_Qty.Text = Convert.ToString(dt.Rows[0]["Line25Quantity"]);
                txt_Line26_Qty.Text = Convert.ToString(dt.Rows[0]["Line26Quantity"]);
                txt_Line27_Qty.Text = Convert.ToString(dt.Rows[0]["Line27Quantity"]);

                txt_Line28_Qty.Text = Convert.ToString(dt.Rows[0]["Line28Quantity"]);


                txt_Line29_Qty.Text = Convert.ToString(dt.Rows[0]["Line29Quantity"]);
                txt_Line30_Qty.Text = Convert.ToString(dt.Rows[0]["Line30Quantity"]);


                txt_Line31_Qty.Text = Convert.ToString(dt.Rows[0]["Line31Quantity"]);
                txt_Line32_Qty.Text = Convert.ToString(dt.Rows[0]["Line32Quantity"]);
                txt_Line33_Qty.Text = Convert.ToString(dt.Rows[0]["Line33Quantity"]);
                txt_Line34_Qty.Text = Convert.ToString(dt.Rows[0]["Line34Quantity"]);
                txt_Line35_Qty.Text = Convert.ToString(dt.Rows[0]["Line35Quantity"]);
                txt_Line36_Qty.Text = Convert.ToString(dt.Rows[0]["Line36Quantity"]);
                txt_Line37_Qty.Text = Convert.ToString(dt.Rows[0]["Line37Quantity"]);
                txt_Line38_Qty.Text = Convert.ToString(dt.Rows[0]["Line38Quantity"]);
                txt_Line39_Qty.Text = Convert.ToString(dt.Rows[0]["Line39Quantity"]);




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
                txt_Line21_Total.Text = Convert.ToString(dt.Rows[0]["Line21Total"]);
                txt_Line22_Total.Text = Convert.ToString(dt.Rows[0]["Line22Total"]);
                txt_Line23_Total.Text = Convert.ToString(dt.Rows[0]["Line23Total"]);
                txt_Line24_Total.Text = Convert.ToString(dt.Rows[0]["Line24Total"]);
                txt_Line25_Total.Text = Convert.ToString(dt.Rows[0]["Line25Total"]);
                txt_Line26_Total.Text = Convert.ToString(dt.Rows[0]["Line26Total"]);
                txt_Line27_Total.Text = Convert.ToString(dt.Rows[0]["Line27Total"]);

                txt_Line28_Total.Text = Convert.ToString(dt.Rows[0]["Line28Total"]);


                txt_Line29_Total.Text = Convert.ToString(dt.Rows[0]["Line29Total"]);
                txt_Line30_Total.Text = Convert.ToString(dt.Rows[0]["Line30Total"]);


                txt_Line31_Total.Text = Convert.ToString(dt.Rows[0]["Line31Total"]);
                txt_Line32_Total.Text = Convert.ToString(dt.Rows[0]["Line32Total"]);
                txt_Line33_Total.Text = Convert.ToString(dt.Rows[0]["Line33Total"]);
                txt_Line34_Total.Text = Convert.ToString(dt.Rows[0]["Line34Total"]);
                txt_Line35_Total.Text = Convert.ToString(dt.Rows[0]["Line35Total"]);
                txt_Line36_Total.Text = Convert.ToString(dt.Rows[0]["Line36Total"]);
                txt_Line37_Total.Text = Convert.ToString(dt.Rows[0]["Line37Total"]);
                txt_Line38_Total.Text = Convert.ToString(dt.Rows[0]["Line38Total"]);
                txt_Line39_Total.Text = Convert.ToString(dt.Rows[0]["Line39Total"]);




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
                hdn_Line21_Total.Value = Convert.ToString(dt.Rows[0]["Line21Total"]);
                hdn_Line22_Total.Value = Convert.ToString(dt.Rows[0]["Line22Total"]);
                hdn_Line23_Total.Value = Convert.ToString(dt.Rows[0]["Line23Total"]);
                hdn_Line24_Total.Value = Convert.ToString(dt.Rows[0]["Line24Total"]);
                hdn_Line25_Total.Value = Convert.ToString(dt.Rows[0]["Line25Total"]);
                hdn_Line26_Total.Value = Convert.ToString(dt.Rows[0]["Line26Total"]);
                hdn_Line27_Total.Value = Convert.ToString(dt.Rows[0]["Line27Total"]);

                hdn_Line28_Total.Value = Convert.ToString(dt.Rows[0]["Line28Total"]);
                hdn_Line29_Total.Value = Convert.ToString(dt.Rows[0]["Line29Total"]);


                hdn_Line30_Total.Value = Convert.ToString(dt.Rows[0]["Line30Total"]);
                hdn_Line31_Total.Value = Convert.ToString(dt.Rows[0]["Line31Total"]);


                hdn_Line32_Total.Value = Convert.ToString(dt.Rows[0]["Line32Total"]);
                hdn_Line33_Total.Value = Convert.ToString(dt.Rows[0]["Line33Total"]);
                hdn_Line34_Total.Value = Convert.ToString(dt.Rows[0]["Line34Total"]);
                hdn_Line35_Total.Value = Convert.ToString(dt.Rows[0]["Line35Total"]);
                hdn_Line36_Total.Value = Convert.ToString(dt.Rows[0]["Line36Total"]);
                hdn_Line37_Total.Value = Convert.ToString(dt.Rows[0]["Line37Total"]);
                hdn_Line38_Total.Value = Convert.ToString(dt.Rows[0]["Line38Total"]);
                hdn_Line39_Total.Value = Convert.ToString(dt.Rows[0]["Line39Total"]);


                hdn_Finalize.Value = Convert.ToString(dt.Rows[0]["Finalized"]);

                txt_Line8_Cat.Text = Convert.ToString(dt.Rows[0]["Line8Category"]);
                txt_Line8_LIURP.Text = Convert.ToString(dt.Rows[0]["Line8LIURPCode"]);

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
                txt_Line8_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line8CostPerUnit"]);



                txt_Line9_Cat.Text = Convert.ToString(dt.Rows[0]["Line9Category"]);
                txt_Line9_LIURP.Text = Convert.ToString(dt.Rows[0]["Line9LIURPCode"]);

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
                txt_Line9_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line9CostPerUnit"]);


                txt_Line10_Cat.Text = Convert.ToString(dt.Rows[0]["Line10Category"]);
                txt_Line10_LIURP.Text = Convert.ToString(dt.Rows[0]["Line10LIURPCode"]);

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
                txt_Line10_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line10CostPerUnit"]);

                txt_Line11_Cat.Text = Convert.ToString(dt.Rows[0]["Line11Category"]);
                txt_Line11_LIURP.Text = Convert.ToString(dt.Rows[0]["Line11LIURPCode"]);

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
                txt_Line11_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line11CostPerUnit"]);


                txt_Line12_Cat.Text = Convert.ToString(dt.Rows[0]["Line12Category"]);
                txt_Line12_LIURP.Text = Convert.ToString(dt.Rows[0]["Line12LIURPCode"]);

                txt_Line12_SC.Text = Convert.ToString(dt.Rows[0]["Line12SC"]);
                txt_Line12_Unit.Text = Convert.ToString(dt.Rows[0]["Line12Unit"]);




                if (Convert.ToString(dt.Rows[0]["Line12LaborRate"]) == "")
                {
                    txt_Line12_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line12_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line12LaborRate"]);
                }


                txt_Line12_THW.Text = Convert.ToString(dt.Rows[0]["Line12THW"]);
                txt_Line12_TMC.Text = Convert.ToString(dt.Rows[0]["Line12TMC"]);
                txt_Line12_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line12CostPerUnit"]);

                txt_Line15_Cat.Text = Convert.ToString(dt.Rows[0]["Line15Category"]);
                txt_Line15_LIURP.Text = Convert.ToString(dt.Rows[0]["Line15LIURPCode"]);
                txt_Line15_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line15MeasureDescription"]);
                txt_Line15_SC.Text = Convert.ToString(dt.Rows[0]["Line15SC"]);
                txt_Line15_Unit.Text = Convert.ToString(dt.Rows[0]["Line15Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line15LaborRate"]) == "")
                {
                    txt_Line15_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line15_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line15LaborRate"]);
                }




                txt_Line15_THW.Text = Convert.ToString(dt.Rows[0]["Line15THW"]);
                txt_Line15_TMC.Text = Convert.ToString(dt.Rows[0]["Line15TMC"]);
                txt_Line15_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line15CostPerUnit"]);


                txt_Line16_Cat.Text = Convert.ToString(dt.Rows[0]["Line16Category"]);
                txt_Line16_LIURP.Text = Convert.ToString(dt.Rows[0]["Line16LIURPCode"]);
                txt_Line16_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line16MeasureDescription"]);
                txt_Line16_SC.Text = Convert.ToString(dt.Rows[0]["Line16SC"]);
                txt_Line16_Unit.Text = Convert.ToString(dt.Rows[0]["Line16Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line16LaborRate"]) == "")
                {
                    txt_Line16_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line16_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line16LaborRate"]);
                }




                txt_Line16_THW.Text = Convert.ToString(dt.Rows[0]["Line16THW"]);
                txt_Line16_TMC.Text = Convert.ToString(dt.Rows[0]["Line16TMC"]);
                txt_Line16_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line16CostPerUnit"]);


                txt_Line19_Cat.Text = Convert.ToString(dt.Rows[0]["Line19Category"]);
                txt_Line19_LIURP.Text = Convert.ToString(dt.Rows[0]["Line19LIURPCode"]);
                txt_Line19_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line19MeasureDescription"]);
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




                txt_Line19_THW.Text = Convert.ToString(dt.Rows[0]["Line20THW"]);
                txt_Line19_TMC.Text = Convert.ToString(dt.Rows[0]["Line20TMC"]);
                txt_Line19_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line20CostPerUnit"]);


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
                txt_Line20_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line20CostPerUnit"]);


                txt_Line29_Cat.Text = Convert.ToString(dt.Rows[0]["Line29Category"]);
                txt_Line29_LIURP.Text = Convert.ToString(dt.Rows[0]["Line29LIURPCode"]);
                txt_Line29_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line29MeasureDescription"]);
                txt_Line29_SC.Text = Convert.ToString(dt.Rows[0]["Line29SC"]);
                txt_Line29_Unit.Text = Convert.ToString(dt.Rows[0]["Line29Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line29LaborRate"]) == "")
                {
                    txt_Line29_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line29_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line29LaborRate"]);
                }




                txt_Line29_THW.Text = Convert.ToString(dt.Rows[0]["Line29THW"]);
                txt_Line29_TMC.Text = Convert.ToString(dt.Rows[0]["Line29TMC"]);
                txt_Line29_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line29CostPerUnit"]);



                txt_Line30_Cat.Text = Convert.ToString(dt.Rows[0]["Line30Category"]);
                txt_Line30_LIURP.Text = Convert.ToString(dt.Rows[0]["Line30LIURPCode"]);
                txt_Line30_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line30MeasureDescription"]);
                txt_Line30_SC.Text = Convert.ToString(dt.Rows[0]["Line30SC"]);
                txt_Line30_Unit.Text = Convert.ToString(dt.Rows[0]["Line30Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line30LaborRate"]) == "")
                {
                    txt_Line30_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line30_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line30LaborRate"]);
                }




                txt_Line30_THW.Text = Convert.ToString(dt.Rows[0]["Line30THW"]);
                txt_Line30_TMC.Text = Convert.ToString(dt.Rows[0]["Line30TMC"]);
                txt_Line30_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line30CostPerUnit"]);



                txt_Line34_Cat.Text = Convert.ToString(dt.Rows[0]["Line34Category"]);
                txt_Line34_LIURP.Text = Convert.ToString(dt.Rows[0]["Line34LIURPCode"]);
                txt_Line34_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line34MeasureDescription"]);
                txt_Line34_SC.Text = Convert.ToString(dt.Rows[0]["Line34SC"]);
                txt_Line34_Unit.Text = Convert.ToString(dt.Rows[0]["Line34Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line34LaborRate"]) == "")
                {
                    txt_Line34_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line34_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line34LaborRate"]);
                }




                txt_Line34_THW.Text = Convert.ToString(dt.Rows[0]["Line34THW"]);
                txt_Line34_TMC.Text = Convert.ToString(dt.Rows[0]["Line34TMC"]);
                txt_Line34_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line34CostPerUnit"]);


                txt_Line35_Cat.Text = Convert.ToString(dt.Rows[0]["Line35Category"]);
                txt_Line35_LIURP.Text = Convert.ToString(dt.Rows[0]["Line35LIURPCode"]);
                txt_Line35_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line35MeasureDescription"]);
                txt_Line35_SC.Text = Convert.ToString(dt.Rows[0]["Line35SC"]);
                txt_Line35_Unit.Text = Convert.ToString(dt.Rows[0]["Line35Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line35LaborRate"]) == "")
                {
                    txt_Line35_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line35_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line35LaborRate"]);
                }




                txt_Line35_THW.Text = Convert.ToString(dt.Rows[0]["Line35THW"]);
                txt_Line35_TMC.Text = Convert.ToString(dt.Rows[0]["Line35TMC"]);
                txt_Line35_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line35CostPerUnit"]);

                txt_Line37_Cat.Text = Convert.ToString(dt.Rows[0]["Line37Category"]);
                txt_Line37_LIURP.Text = Convert.ToString(dt.Rows[0]["Line37LIURPCode"]);
                txt_Line37_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line37MeasureDescription"]);
                txt_Line37_SC.Text = Convert.ToString(dt.Rows[0]["Line37SC"]);
                txt_Line37_Unit.Text = Convert.ToString(dt.Rows[0]["Line37Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line37LaborRate"]) == "")
                {
                    txt_Line37_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line37_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line37LaborRate"]);
                }




                txt_Line37_THW.Text = Convert.ToString(dt.Rows[0]["Line37THW"]);
                txt_Line37_TMC.Text = Convert.ToString(dt.Rows[0]["Line37TMC"]);
                txt_Line37_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line37CostPerUnit"]);


                txt_Line38_Cat.Text = Convert.ToString(dt.Rows[0]["Line38Category"]);
                txt_Line38_LIURP.Text = Convert.ToString(dt.Rows[0]["Line38LIURPCode"]);
                txt_Line38_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line38MeasureDescription"]);
                txt_Line38_SC.Text = Convert.ToString(dt.Rows[0]["Line38SC"]);
                txt_Line38_Unit.Text = Convert.ToString(dt.Rows[0]["Line38Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line38LaborRate"]) == "")
                {
                    txt_Line38_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line38_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line38LaborRate"]);
                }




                txt_Line38_THW.Text = Convert.ToString(dt.Rows[0]["Line38THW"]);
                txt_Line38_TMC.Text = Convert.ToString(dt.Rows[0]["Line38TMC"]);
                txt_Line38_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line38CostPerUnit"]);

                txt_Line39_Cat.Text = Convert.ToString(dt.Rows[0]["Line39Category"]);
                txt_Line39_LIURP.Text = Convert.ToString(dt.Rows[0]["Line39LIURPCode"]);
                txt_Line39_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line39MeasureDescription"]);
                txt_Line39_SC.Text = Convert.ToString(dt.Rows[0]["Line39SC"]);
                txt_Line39_Unit.Text = Convert.ToString(dt.Rows[0]["Line39Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line39LaborRate"]) == "")
                {
                    txt_Line39_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line39_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line39LaborRate"]);
                }




                txt_Line39_THW.Text = Convert.ToString(dt.Rows[0]["Line39THW"]);
                txt_Line39_TMC.Text = Convert.ToString(dt.Rows[0]["Line39TMC"]);
                txt_Line39_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line39CostPerUnit"]);

            }
        }
        catch (Exception ex)
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
            j = ObjPPL.UpdatePPLAudit_Act129II_Invoice_2(JobNum, txt_Line1_Qty.Text, txt_Line2_Qty.Text, txt_Line3_Qty.Text, txt_Line4_Qty.Text, txt_Line5_Qty.Text, txt_Line6_Qty.Text, txt_Line7_Qty.Text, txt_Line8_Qty.Text, txt_Line9_Qty.Text, txt_Line10_Qty.Text, txt_Line11_Qty.Text, txt_Line12_Qty.Text, txt_Line13_Qty.Text, txt_Line14_Qty.Text, txt_Line15_Qty.Text, txt_Line16_Qty.Text, txt_Line17_Qty.Text, txt_Line18_Qty.Text, txt_Line19_Qty.Text, txt_Line20_Qty.Text, txt_Line21_Qty.Text, txt_Line22_Qty.Text, txt_Line23_Qty.Text, txt_Line24_Qty.Text, txt_Line25_Qty.Text, txt_Line26_Qty.Text, txt_Line27_Qty.Text, txt_Line28_Qty.Text, txt_Line29_Qty.Text, txt_Line30_Qty.Text, txt_Line31_Qty.Text, txt_Line32_Qty.Text, txt_Line33_Qty.Text, txt_Line34_Qty.Text, txt_Line35_Qty.Text, txt_Line36_Qty.Text, txt_Line37_Qty.Text, txt_Line38_Qty.Text, txt_Line39_Qty.Text, hdn_Line1_Total.Value, hdn_Line2_Total.Value, hdn_Line3_Total.Value, hdn_Line4_Total.Value, hdn_Line5_Total.Value, hdn_Line6_Total.Value, hdn_Line7_Total.Value, hdn_Line8_Total.Value, hdn_Line9_Total.Value, hdn_Line10_Total.Value, hdn_Line11_Total.Value, hdn_Line12_Total.Value, hdn_Line13_Total.Value, hdn_Line14_Total.Value, hdn_Line15_Total.Value, hdn_Line16_Total.Value, hdn_Line17_Total.Value, hdn_Line18_Total.Value, hdn_Line19_Total.Value, hdn_Line20_Total.Value, hdn_Line21_Total.Value, hdn_Line22_Total.Value, hdn_Line23_Total.Value, hdn_Line24_Total.Value, hdn_Line25_Total.Value, hdn_Line26_Total.Value, hdn_Line27_Total.Value, hdn_Line28_Total.Value, hdn_Line29_Total.Value, hdn_Line30_Total.Value, hdn_Line31_Total.Value, hdn_Line32_Total.Value, hdn_Line33_Total.Value, hdn_Line34_Total.Value, hdn_Line35_Total.Value, hdn_Line36_Total.Value, hdn_Line37_Total.Value, hdn_Line38_Total.Value, hdn_Line39_Total.Value, txt_Line8_Cat.Text, txt_Line8_LIURP.Text, "", txt_Line8_SC.Text, txt_Line8_Unit.Text, txt_Line8_LaborRate.Text, txt_Line8_THW.Text, txt_Line8_TMC.Text, txt_Line8_CostUnit.Text, txt_Line9_Cat.Text, txt_Line9_LIURP.Text, "", txt_Line9_SC.Text, txt_Line9_Unit.Text, txt_Line9_LaborRate.Text, txt_Line9_THW.Text, txt_Line9_TMC.Text, txt_Line9_CostUnit.Text, txt_Line10_Cat.Text, txt_Line10_LIURP.Text, "", txt_Line10_SC.Text, txt_Line10_Unit.Text, txt_Line10_LaborRate.Text, txt_Line10_THW.Text, txt_Line10_TMC.Text, txt_Line10_CostUnit.Text, txt_Line11_Cat.Text, txt_Line11_LIURP.Text, txt_Line11_SC.Text, txt_Line11_Unit.Text, txt_Line11_LaborRate.Text, txt_Line11_THW.Text, txt_Line11_TMC.Text, txt_Line11_CostUnit.Text, txt_Line12_Cat.Text, txt_Line12_LIURP.Text, txt_Line12_SC.Text, txt_Line12_Unit.Text, txt_Line12_LaborRate.Text, txt_Line12_THW.Text, txt_Line12_TMC.Text, txt_Line12_CostUnit.Text, txt_Line15_Cat.Text, txt_Line15_LIURP.Text, txt_Line15_MeasureDesc.Text, txt_Line15_SC.Text, txt_Line15_Unit.Text, txt_Line15_LaborRate.Text, txt_Line15_THW.Text, txt_Line15_TMC.Text, txt_Line15_CostUnit.Text, txt_Line16_Cat.Text, txt_Line16_LIURP.Text, txt_Line16_MeasureDesc.Text, txt_Line16_SC.Text, txt_Line16_Unit.Text, txt_Line16_LaborRate.Text, txt_Line16_THW.Text, txt_Line16_TMC.Text, txt_Line16_CostUnit.Text, txt_Line19_Cat.Text, txt_Line19_LIURP.Text, txt_Line19_MeasureDesc.Text, txt_Line19_SC.Text, txt_Line19_Unit.Text, txt_Line19_LaborRate.Text, txt_Line19_THW.Text, txt_Line19_TMC.Text, txt_Line19_CostUnit.Text, txt_Line20_Cat.Text, txt_Line20_LIURP.Text, txt_Line20_MeasureDesc.Text, txt_Line20_SC.Text, txt_Line20_Unit.Text, txt_Line20_LaborRate.Text, txt_Line20_THW.Text, txt_Line20_TMC.Text, txt_Line20_CostUnit.Text, txt_Line29_Cat.Text, txt_Line29_LIURP.Text, txt_Line29_MeasureDesc.Text, txt_Line29_SC.Text, txt_Line29_Unit.Text, txt_Line29_LaborRate.Text, txt_Line29_THW.Text, txt_Line29_TMC.Text, txt_Line29_CostUnit.Text, txt_Line30_Cat.Text, txt_Line30_LIURP.Text, txt_Line30_MeasureDesc.Text, txt_Line30_SC.Text, txt_Line30_Unit.Text, txt_Line30_LaborRate.Text, txt_Line30_THW.Text, txt_Line30_TMC.Text, txt_Line30_CostUnit.Text, txt_Line34_Cat.Text, txt_Line34_LIURP.Text, txt_Line34_MeasureDesc.Text, txt_Line34_SC.Text, txt_Line34_Unit.Text, txt_Line34_LaborRate.Text, txt_Line34_THW.Text, txt_Line34_TMC.Text, txt_Line34_CostUnit.Text, txt_Line35_Cat.Text, txt_Line35_LIURP.Text, txt_Line35_MeasureDesc.Text, txt_Line35_SC.Text, txt_Line35_Unit.Text, txt_Line35_LaborRate.Text, txt_Line35_THW.Text, txt_Line35_TMC.Text, txt_Line35_CostUnit.Text, txt_Line37_Cat.Text, txt_Line37_LIURP.Text, txt_Line37_MeasureDesc.Text, txt_Line37_SC.Text, txt_Line37_Unit.Text, txt_Line37_LaborRate.Text, txt_Line37_THW.Text, txt_Line37_TMC.Text, txt_Line37_CostUnit.Text, txt_Line38_Cat.Text, txt_Line38_LIURP.Text, txt_Line38_MeasureDesc.Text, txt_Line38_SC.Text, txt_Line38_Unit.Text, txt_Line38_LaborRate.Text, txt_Line38_THW.Text, txt_Line38_TMC.Text, txt_Line38_CostUnit.Text, txt_Line39_Cat.Text, txt_Line39_LIURP.Text, txt_Line39_MeasureDesc.Text, txt_Line39_SC.Text, txt_Line39_Unit.Text, txt_Line39_LaborRate.Text, txt_Line39_THW.Text, txt_Line39_TMC.Text, txt_Line39_CostUnit.Text, hdn_Finalize.Value);
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
            j = ObjPPL.UpdatePPLAudit_Act129II_Invoice_2(JobNum, txt_Line1_Qty.Text, txt_Line2_Qty.Text, txt_Line3_Qty.Text, txt_Line4_Qty.Text, txt_Line5_Qty.Text, txt_Line6_Qty.Text, txt_Line7_Qty.Text, txt_Line8_Qty.Text, txt_Line9_Qty.Text, txt_Line10_Qty.Text, txt_Line11_Qty.Text, txt_Line12_Qty.Text, txt_Line13_Qty.Text, txt_Line14_Qty.Text, txt_Line15_Qty.Text, txt_Line16_Qty.Text, txt_Line17_Qty.Text, txt_Line18_Qty.Text, txt_Line19_Qty.Text, txt_Line20_Qty.Text, txt_Line21_Qty.Text, txt_Line22_Qty.Text, txt_Line23_Qty.Text, txt_Line24_Qty.Text, txt_Line25_Qty.Text, txt_Line26_Qty.Text, txt_Line27_Qty.Text, txt_Line28_Qty.Text, txt_Line29_Qty.Text, txt_Line30_Qty.Text, txt_Line31_Qty.Text, txt_Line32_Qty.Text, txt_Line33_Qty.Text, txt_Line34_Qty.Text, txt_Line35_Qty.Text, txt_Line36_Qty.Text, txt_Line37_Qty.Text, txt_Line38_Qty.Text, txt_Line39_Qty.Text, hdn_Line1_Total.Value, hdn_Line2_Total.Value, hdn_Line3_Total.Value, hdn_Line4_Total.Value, hdn_Line5_Total.Value, hdn_Line6_Total.Value, hdn_Line7_Total.Value, hdn_Line8_Total.Value, hdn_Line9_Total.Value, hdn_Line10_Total.Value, hdn_Line11_Total.Value, hdn_Line12_Total.Value, hdn_Line13_Total.Value, hdn_Line14_Total.Value, hdn_Line15_Total.Value, hdn_Line16_Total.Value, hdn_Line17_Total.Value, hdn_Line18_Total.Value, hdn_Line19_Total.Value, hdn_Line20_Total.Value, hdn_Line21_Total.Value, hdn_Line22_Total.Value, hdn_Line23_Total.Value, hdn_Line24_Total.Value, hdn_Line25_Total.Value, hdn_Line26_Total.Value, hdn_Line27_Total.Value, hdn_Line28_Total.Value, hdn_Line29_Total.Value, hdn_Line30_Total.Value, hdn_Line31_Total.Value, hdn_Line32_Total.Value, hdn_Line33_Total.Value, hdn_Line34_Total.Value, hdn_Line35_Total.Value, hdn_Line36_Total.Value, hdn_Line37_Total.Value, hdn_Line38_Total.Value, hdn_Line39_Total.Value, txt_Line8_Cat.Text, txt_Line8_LIURP.Text, "", txt_Line8_SC.Text, txt_Line8_Unit.Text, txt_Line8_LaborRate.Text, txt_Line8_THW.Text, txt_Line8_TMC.Text, txt_Line8_CostUnit.Text, txt_Line9_Cat.Text, txt_Line9_LIURP.Text, "", txt_Line9_SC.Text, txt_Line9_Unit.Text, txt_Line9_LaborRate.Text, txt_Line9_THW.Text, txt_Line9_TMC.Text, txt_Line9_CostUnit.Text, txt_Line10_Cat.Text, txt_Line10_LIURP.Text, "", txt_Line10_SC.Text, txt_Line10_Unit.Text, txt_Line10_LaborRate.Text, txt_Line10_THW.Text, txt_Line10_TMC.Text, txt_Line10_CostUnit.Text, txt_Line11_Cat.Text, txt_Line11_LIURP.Text, txt_Line11_SC.Text, txt_Line11_Unit.Text, txt_Line11_LaborRate.Text, txt_Line11_THW.Text, txt_Line11_TMC.Text, txt_Line11_CostUnit.Text, txt_Line12_Cat.Text, txt_Line12_LIURP.Text, txt_Line12_SC.Text, txt_Line12_Unit.Text, txt_Line12_LaborRate.Text, txt_Line12_THW.Text, txt_Line12_TMC.Text, txt_Line12_CostUnit.Text, txt_Line15_Cat.Text, txt_Line15_LIURP.Text, txt_Line15_MeasureDesc.Text, txt_Line15_SC.Text, txt_Line15_Unit.Text, txt_Line15_LaborRate.Text, txt_Line15_THW.Text, txt_Line15_TMC.Text, txt_Line15_CostUnit.Text, txt_Line16_Cat.Text, txt_Line16_LIURP.Text, txt_Line16_MeasureDesc.Text, txt_Line16_SC.Text, txt_Line16_Unit.Text, txt_Line16_LaborRate.Text, txt_Line16_THW.Text, txt_Line16_TMC.Text, txt_Line16_CostUnit.Text, txt_Line19_Cat.Text, txt_Line19_LIURP.Text, txt_Line19_MeasureDesc.Text, txt_Line19_SC.Text, txt_Line19_Unit.Text, txt_Line19_LaborRate.Text, txt_Line19_THW.Text, txt_Line19_TMC.Text, txt_Line19_CostUnit.Text, txt_Line20_Cat.Text, txt_Line20_LIURP.Text, txt_Line20_MeasureDesc.Text, txt_Line20_SC.Text, txt_Line20_Unit.Text, txt_Line20_LaborRate.Text, txt_Line20_THW.Text, txt_Line20_TMC.Text, txt_Line20_CostUnit.Text, txt_Line29_Cat.Text, txt_Line29_LIURP.Text, txt_Line29_MeasureDesc.Text, txt_Line29_SC.Text, txt_Line29_Unit.Text, txt_Line29_LaborRate.Text, txt_Line29_THW.Text, txt_Line29_TMC.Text, txt_Line29_CostUnit.Text, txt_Line30_Cat.Text, txt_Line30_LIURP.Text, txt_Line30_MeasureDesc.Text, txt_Line30_SC.Text, txt_Line30_Unit.Text, txt_Line30_LaborRate.Text, txt_Line30_THW.Text, txt_Line30_TMC.Text, txt_Line30_CostUnit.Text, txt_Line34_Cat.Text, txt_Line34_LIURP.Text, txt_Line34_MeasureDesc.Text, txt_Line34_SC.Text, txt_Line34_Unit.Text, txt_Line34_LaborRate.Text, txt_Line34_THW.Text, txt_Line34_TMC.Text, txt_Line34_CostUnit.Text, txt_Line35_Cat.Text, txt_Line35_LIURP.Text, txt_Line35_MeasureDesc.Text, txt_Line35_SC.Text, txt_Line35_Unit.Text, txt_Line35_LaborRate.Text, txt_Line35_THW.Text, txt_Line35_TMC.Text, txt_Line35_CostUnit.Text, txt_Line37_Cat.Text, txt_Line37_LIURP.Text, txt_Line37_MeasureDesc.Text, txt_Line37_SC.Text, txt_Line37_Unit.Text, txt_Line37_LaborRate.Text, txt_Line37_THW.Text, txt_Line37_TMC.Text, txt_Line37_CostUnit.Text, txt_Line38_Cat.Text, txt_Line38_LIURP.Text, txt_Line38_MeasureDesc.Text, txt_Line38_SC.Text, txt_Line38_Unit.Text, txt_Line38_LaborRate.Text, txt_Line38_THW.Text, txt_Line38_TMC.Text, txt_Line38_CostUnit.Text, txt_Line39_Cat.Text, txt_Line39_LIURP.Text, txt_Line39_MeasureDesc.Text, txt_Line39_SC.Text, txt_Line39_Unit.Text, txt_Line39_LaborRate.Text, txt_Line39_THW.Text, txt_Line39_TMC.Text, txt_Line39_CostUnit.Text, "F");
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
