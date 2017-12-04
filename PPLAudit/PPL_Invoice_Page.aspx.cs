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
using System.Text;
using System.IO;
//using iTextSharp.text.html.simpleparser;
//using iTextSharp.text.pdf;
//using iTextSharp.text;

public partial class PPLAudit_PPL_Invoice_Page : System.Web.UI.Page
{

    public static string StrUserName;
    public static string Finalize1, Finalize2, Finalize3, Finalize4, Finalize5;
    smUtil objSm = new smUtil();
    dcPPLAudit ObjPPL = new dcPPLAudit();


    protected void Page_Load(object sender, EventArgs e)
    {
        //StrUserName = objSm.GetCookie("UserName");
        try
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
                            //JobNumber2.InnerText = JobNum;
                            BindData1(JobNum);
                            BindData2(JobNum);
                            BindData3(JobNum);
                            BindData4(JobNum);
                            BindData5(JobNum);
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
        catch
        {
        }
    }


    #region "Page 1"
    public void BindData1(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Invoice_1(JobNum);
            if (dt.Rows.Count > 0)
            {
                DataTable dt2 = new DataTable();
                dt2 = ObjPPL.GetPPLAudit_Invoice_NonSpecial(JobNum);
                //if (Convert.ToString(dt2.Rows[0]["CFLSSpecial"]) == "0")
                //{
                //    txt_Line18_Qty_Speciality_1.Text = "";
                //    txt_Line18_Total_Speciality_1.Text = "";
                //}
                //else
                //{
                //    txt_Line18_Qty_Speciality_1.Text = Convert.ToString(dt2.Rows[0]["CFLSSpecial"]);
                //    txt_Line18_Total_Speciality_1.Text = Convert.ToString(Math.Round(10.00 * Convert.ToInt32(dt2.Rows[0]["CFLSSpecial"]), 2));
                //}

                //if (Convert.ToString(dt2.Rows[0]["CFLSNonSpecial"]) == "0")
                //{
                //    txt_Line18_Qty.Text = "";
                //    txt_Line18_Total.Text = "";
                //}
                //else
                //{
                //    txt_Line18_Qty.Text = Convert.ToString(dt2.Rows[0]["CFLSNonSpecial"]);
                //    txt_Line18_Total.Text = Convert.ToString(Math.Round(10.00 * Convert.ToInt32(dt2.Rows[0]["CFLSNonSpecial"]), 2));
                //}




                ////if (Convert.ToString(dt.Rows[0]["Finalized"]) == "F")
                ////{ 

                ////    txt_Line1_Qty_1 .Enabled = false;
                ////    txt_Line2_Qty_1.Enabled = false;
                ////    txt_Line3_Qty_1.Enabled = false;
                ////    txt_Line4_Qty_1.Enabled = false;
                ////    txt_Line5_Qty_1.Enabled = false;
                ////    txt_Line6_Qty_1.Enabled = false;
                ////    txt_Line7_Qty_1.Enabled = false;
                ////    txt_Line8_Qty_1.Enabled = false;
                ////    txt_Line9_Qty_1.Enabled = false;
                ////    txt_Line10_Qty_2.Enabled = false;
                ////    txt_Line11_Qty_1.Enabled = false;
                ////    txt_Line12_Qty_1.Enabled = false;
                ////    txt_Line13_Qty_1.Enabled = false;
                ////    txt_Line14_Qty_1.Enabled = false;
                ////    txt_Line15_Qty_1.Enabled = false;
                ////    txt_Line16_Qty_1.Enabled = false;
                ////    txt_Line17_Qty_1.Enabled = false;
                ////    txt_Line18_Qty_1.Enabled = false;
                ////    txt_Line19_Qty_1.Enabled = false;
                ////    txt_Line20_Qty_1.Enabled = false;
                ////    txt_Line21_Qty_1.Enabled = false;
                ////    txt_Line22_Qty_1.Enabled = false;
                ////    txt_Line23_Qty_1.Enabled = false;
                ////    txt_Line24_Qty_1.Enabled = false;
                ////    txt_Line25_Qty_1.Enabled = false;
                ////    txt_Line26_Qty_1.Enabled = false;
                ////    txt_Line27_Qty_1.Enabled = false;
                ////    txt_Line18_Qty_1.Enabled = false;

                ////}
                ////else
                ////{
                ////    //btn_FinalizeInvoice.Visible = true;
                ////    //btn_FinalizeInvoice.Enabled = true;
                ////    //btn_SaveCurrentPg.Visible = true;
                ////    //btn_SaveCurrentPg.Enabled = true;
                ////}
                StrUserName = Convert.ToString(dt.Rows[0]["FullName"]);
                txt_Line1_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line1Quantity"]);
                txt_Line2_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line2Quantity"]);
                txt_Line3_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line3Quantity"]);
                txt_Line4_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line4Quantity"]);
                txt_Line5_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line5Quantity"]);
                txt_Line6_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line6Quantity"]);
                txt_Line7_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line7Quantity"]);
                txt_Line8_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line8Quantity"]);
                txt_Line9_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line9Quantity"]);
                txt_Line10_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line10Quantity"]);
                txt_Line11_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line11Quantity"]);
                txt_Line12_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line12Quantity"]);
                txt_Line13_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line13Quantity"]);
                txt_Line14_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line14Quantity"]);
                txt_Line15_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line15Quantity"]);
                txt_Line16_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line16Quantity"]);
                txt_Line17_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line17Quantity"]);

                txt_Line18_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line18Quantity"]);
                txt_Line18_Qty_Speciality_1.Text = Convert.ToString(dt.Rows[0]["Line19Quantity"]);

                //txt_Line18_Qty.Text  = Convert.ToString(dt.Rows[0]["Line18Quantity"]);
                txt_Line19_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line20Quantity"]);
                txt_Line20_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line21Quantity"]);
                txt_Line21_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line22Quantity"]);
                txt_Line22_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line23Quantity"]);
                txt_Line23_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line24Quantity"]);
                txt_Line24_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line25Quantity"]);
                txt_Line25_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line26Quantity"]);
                txt_Line26_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line27Quantity"]);
                txt_Line27_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line28Quantity"]);

                txt_Line1_Total_1.Text = Convert.ToString(dt.Rows[0]["Line1Total"]);
                txt_Line2_Total_1.Text = Convert.ToString(dt.Rows[0]["Line2Total"]);
                txt_Line3_Total_1.Text = Convert.ToString(dt.Rows[0]["Line3Total"]);
                txt_Line4_Total_1.Text = Convert.ToString(dt.Rows[0]["Line4Total"]);
                txt_Line5_Total_1.Text = Convert.ToString(dt.Rows[0]["Line5Total"]);
                txt_Line6_Total_1.Text = Convert.ToString(dt.Rows[0]["Line6Total"]);
                txt_Line7_Total_1.Text = Convert.ToString(dt.Rows[0]["Line7Total"]);
                txt_Line8_Total_1.Text = Convert.ToString(dt.Rows[0]["Line8Total"]);
                txt_Line9_Total_1.Text = Convert.ToString(dt.Rows[0]["Line9Total"]);
                txt_Line10_Total_1.Text = Convert.ToString(dt.Rows[0]["Line10Total"]);
                txt_Line11_Total_1.Text = Convert.ToString(dt.Rows[0]["Line11Total"]);
                txt_Line12_Total_1.Text = Convert.ToString(dt.Rows[0]["Line12Total"]);
                txt_Line13_Total_1.Text = Convert.ToString(dt.Rows[0]["Line13Total"]);
                txt_Line14_Total_1.Text = Convert.ToString(dt.Rows[0]["Line14Total"]);
                txt_Line15_Total_1.Text = Convert.ToString(dt.Rows[0]["Line15Total"]);
                txt_Line16_Total_1.Text = Convert.ToString(dt.Rows[0]["Line16Total"]);
                txt_Line17_Total_1.Text = Convert.ToString(dt.Rows[0]["Line17Total"]);
                //txt_Line18_Total.Text  = Convert.ToString(dt.Rows[0]["Line18Total"]);


                txt_Line18_Total_1.Text = Convert.ToString(dt.Rows[0]["Line18Total"]);
                txt_Line18_Total_Speciality_1.Text = Convert.ToString(dt.Rows[0]["Line19Total"]);


                txt_Line19_Total_1.Text = Convert.ToString(dt.Rows[0]["Line20Total"]);
                txt_Line20_Total_1.Text = Convert.ToString(dt.Rows[0]["Line21Total"]);
                txt_Line21_Total_1.Text = Convert.ToString(dt.Rows[0]["Line22Total"]);
                txt_Line22_Total_1.Text = Convert.ToString(dt.Rows[0]["Line23Total"]);
                txt_Line23_Total_1.Text = Convert.ToString(dt.Rows[0]["Line24Total"]);
                txt_Line24_Total_1.Text = Convert.ToString(dt.Rows[0]["Line25Total"]);
                txt_Line25_Total_1.Text = Convert.ToString(dt.Rows[0]["Line26Total"]);
                txt_Line26_Total_1.Text = Convert.ToString(dt.Rows[0]["Line27Total"]);
                txt_Line27_Total_1.Text = Convert.ToString(dt.Rows[0]["Line28Total"]);

                Finalize1 = Convert.ToString(dt.Rows[0]["Finalized"]);

                //txt_Line1_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line1Location"]);
                //txt_Line2_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line2Location"]);
                //txt_Line3_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line3Location"]);
                //txt_Line4_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line4Location"]);
                //txt_Line5_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line5Location"]);
                //txt_Line6_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line6Location"]);
                //txt_Line7_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line7Location"]);
                //txt_Line8_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line8Location"]);
                //txt_Line9_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line9Location"]);
                //txt_Line10_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line10Location"]);
                //txt_Line11_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line11Location"]);
                //txt_Line12_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line12Location"]);
                //txt_Line13_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line13Location"]);
                //txt_Line14_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line14Location"]);
                //txt_Line15_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line15Location"]);
                //txt_Line16_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line16Location"]);
                //txt_Line17_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line17Location"]);
                //txt_Line18_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line18Location"]);
                //txt_Line19_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line19Location"]);
                //txt_Line20_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line20Location"]);
                //txt_Line21_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line21Location"]);
                //txt_Line22_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line22Location"]);
                //txt_Line23_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line23Location"]);
                //txt_Line24_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line24Location"]);
                //txt_Line25_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line25Location"]);
                //txt_Line26_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line26Location"]);
                //txt_Line27_Location_1.Text  = Convert.ToString(dt.Rows[0]["Line27Location"]);

                txt_Line9_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line9Category"]);
                txt_Line9_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line9LIURPCode"]);
                txt_Line9_MeasureDesc_1.Text = Convert.ToString(dt.Rows[0]["Line9MeasureDescription"]);
                txt_Line9_SC_1.Text = Convert.ToString(dt.Rows[0]["Line9SC"]);
                txt_Line9_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line9Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line9LaborRate"]) == "")
                {
                    txt_Line9_LaborRate_1.Text = "43/68";
                }
                else
                {
                    txt_Line9_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line9LaborRate"]);
                }

                txt_Line9_THW_1.Text = Convert.ToString(dt.Rows[0]["Line9THW"]);
                txt_Line9_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line9TMC"]);
                //txt_Line9_CostUnit_1.Text  = Convert.ToString(dt.Rows[0]["Line9CostPerUnit"]);

                txt_Line10_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line10Category"]);
                txt_Line10_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line10LIURPCode"]);
                txt_Line10_MeasureDesc_1.Text = Convert.ToString(dt.Rows[0]["Line10MeasureDescription"]);
                txt_Line10_SC_1.Text = Convert.ToString(dt.Rows[0]["Line10SC"]);
                txt_Line10_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line10Unit"]);




                if (Convert.ToString(dt.Rows[0]["Line10LaborRate"]) == "")
                {
                    txt_Line10_LaborRate_1.Text = "43/68";
                }
                else
                {
                    txt_Line10_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line10LaborRate"]);
                }

                txt_Line10_THW_1.Text = Convert.ToString(dt.Rows[0]["Line10THW"]);
                txt_Line10_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line10TMC"]);
                //txt_Line10_CostUnit_1.Text  = Convert.ToString(dt.Rows[0]["Line10CostPerUnit"]);

                txt_Line15_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line15Category"]);
                txt_Line15_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line15LIURPCode"]);
                txt_Line15_MeasureDesc_1.Text = Convert.ToString(dt.Rows[0]["Line15MeasureDescription"]);
                txt_Line15_SC_1.Text = Convert.ToString(dt.Rows[0]["Line15SC"]);
                txt_Line15_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line15Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line15LaborRate"]) == "")
                {
                    txt_Line15_LaborRate_1.Text = "43/68";
                }
                else
                {
                    txt_Line15_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line15LaborRate"]);
                }


                txt_Line15_THW_1.Text = Convert.ToString(dt.Rows[0]["Line15THW"]);
                txt_Line15_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line15TMC"]);
                //txt_Line15_CostUnit_1.Text  = Convert.ToString(dt.Rows[0]["Line15CostPerUnit"]);

                txt_Line16_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line16Category"]);
                txt_Line16_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line16LIURPCode"]);
                txt_Line16_MeasureDesc_1.Text = Convert.ToString(dt.Rows[0]["Line16MeasureDescription"]);
                txt_Line16_SC_1.Text = Convert.ToString(dt.Rows[0]["Line16SC"]);
                txt_Line16_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line16Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line16LaborRate"]) == "")
                {
                    txt_Line16_LaborRate_1.Text = "43/68";
                }
                else
                {
                    txt_Line16_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line16LaborRate"]);
                }


                txt_Line16_THW_1.Text = Convert.ToString(dt.Rows[0]["Line16THW"]);
                txt_Line16_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line16TMC"]);
                //txt_Line16_CostUnit_1.Text  = Convert.ToString(dt.Rows[0]["Line16CostPerUnit"]);

                txt_Line17_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line17Category"]);
                txt_Line17_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line17LIURPCode"]);
                txt_Line17_MeasureDesc_1.Text = Convert.ToString(dt.Rows[0]["Line17MeasureDescription"]);
                txt_Line17_SC_1.Text = Convert.ToString(dt.Rows[0]["Line17SC"]);
                txt_Line17_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line17Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line17LaborRate"]) == "")
                {
                    txt_Line17_LaborRate_1.Text = "43/68";
                }
                else
                {
                    txt_Line17_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line17LaborRate"]);
                }

                txt_Line17_THW_1.Text = Convert.ToString(dt.Rows[0]["Line17THW"]);
                txt_Line17_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line17TMC"]);
                //txt_Line17_CostUnit_1.Text  = Convert.ToString(dt.Rows[0]["Line17CostPerUnit"]);

                txt_Line22_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line22Category"]);
                txt_Line22_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line22LIURPCode"]);
                txt_Line22_MeasureDesc_1.Text = Convert.ToString(dt.Rows[0]["Line22MeasureDescription"]);
                txt_Line22_SC_1.Text = Convert.ToString(dt.Rows[0]["Line22SC"]);
                txt_Line22_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line22Unit"]);




                if (Convert.ToString(dt.Rows[0]["Line22LaborRate"]) == "")
                {
                    txt_Line22_LaborRate_1.Text = "43/68";
                }
                else
                {
                    txt_Line22_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line22LaborRate"]);
                }



                txt_Line22_THW_1.Text = Convert.ToString(dt.Rows[0]["Line22THW"]);
                txt_Line22_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line22TMC"]);


                txt_Line23_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line23Category"]);
                txt_Line23_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line23LIURPCode"]);
                txt_Line23_MeasureDesc_1.Text = Convert.ToString(dt.Rows[0]["Line23MeasureDescription"]);
                txt_Line23_SC_1.Text = Convert.ToString(dt.Rows[0]["Line23SC"]);
                txt_Line23_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line23Unit"]);
                txt_Line23_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line23LaborRate"]);
                txt_Line23_THW_1.Text = Convert.ToString(dt.Rows[0]["Line23THW"]);
                txt_Line23_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line23TMC"]);
                //txt_Line23_CostUnit_1.Text  = Convert.ToString(dt.Rows[0]["Line23CostPerUnit"]);

                txt_Line24_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line24Category"]);
                txt_Line24_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line24LIURPCode"]);
                txt_Line24_MeasureDesc_1.Text = Convert.ToString(dt.Rows[0]["Line24MeasureDescription"]);
                txt_Line24_SC_1.Text = Convert.ToString(dt.Rows[0]["Line24SC"]);
                txt_Line24_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line24Unit"]);
                txt_Line24_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line24LaborRate"]);
                txt_Line24_THW_1.Text = Convert.ToString(dt.Rows[0]["Line24THW"]);
                txt_Line24_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line24TMC"]);
                //txt_Line24_CostUnit_1.Text  = Convert.ToString(dt.Rows[0]["Line24CostPerUnit"]);
            }
        }
        catch
        {
        }
    }
    #endregion



    #region "Page 2"
    public void BindData2(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Invoice_2(JobNum);
            if (dt.Rows.Count > 0)
            {
                ////if (Convert.ToString(dt.Rows[0]["Finalized"]) == "F")
                ////{
                ////    //btn_FinalizeInvoice.Visible = false;
                ////    //btn_SaveCurrentPg.Visible = false;
                ////    //btn_FinalizeInvoice.Enabled = false;
                ////    //btn_SaveCurrentPg.Enabled = false;

                ////    txt_Line1_Qty_2.Enabled = false;
                ////    txt_Line2_Qty_2.Enabled = false;
                ////    txt_Line3_Qty_2.Enabled = false;
                ////    txt_Line4_Qty_2.Enabled = false;
                ////    txt_Line5_Qty_2.Enabled = false;
                ////    txt_Line6_Qty_2.Enabled = false;
                ////    txt_Line7_Qty_2.Enabled = false;
                ////    txt_Line8_Qty_2.Enabled = false;
                ////    txt_Line9_Qty_2.Enabled = false;
                ////    txt_Line10_Qty_2.Enabled = false;
                ////    txt_Line11_Qty_2.Enabled = false;
                ////    txt_Line12_Qty_2.Enabled = false;
                ////    txt_Line13_Qty_2.Enabled = false;
                ////    txt_Line14_Qty_2.Enabled = false;
                ////    txt_Line15_Qty_2.Enabled = false;
                ////    txt_Line16_Qty_2.Enabled = false;
                ////    txt_Line17_Qty_2.Enabled = false;
                ////    txt_Line18_Qty_2.Enabled = false;
                ////    txt_Line19_Qty_2.Enabled = false;
                ////    txt_Line20_Qty_2.Enabled = false;
                ////    txt_Line21_Qty_2.Enabled = false;
                ////    txt_Line22_Qty_2.Enabled = false;
                ////    txt_Line23_Qty_2.Enabled = false;
                ////    txt_Line24_Qty_2.Enabled = false;
                ////    txt_Line25_Qty_2.Enabled = false;
                ////    txt_Line26_Qty_2.Enabled = false;
                ////    txt_Line27_Qty_2.Enabled = false;
                ////    txt_Line28_Qty_2.Enabled = false;
                ////    txt_Line29_Qty_2.Enabled = false;
                ////    txt_Line30_Qty_2.Enabled = false;
                ////    txt_Line30_Qty_2.Enabled = false;
                ////    txt_Line32_Qty_2.Enabled = false;
                ////    txt_Line33_Qty_2.Enabled = false;
                ////    txt_Line34_Qty_2.Enabled = false;
                ////    txt_Line35_Qty_2.Enabled = false;
                ////    txt_Line36_Qty_2.Enabled = false;
                ////    txt_Line37_Qty_2.Enabled = false;
                ////}
                ////else
                ////{
                ////    //btn_FinalizeInvoice.Visible = true;
                ////    //btn_SaveCurrentPg.Visible = true;
                ////    //btn_FinalizeInvoice.Enabled = true;
                ////    //btn_SaveCurrentPg.Enabled = true;
                ////}

                txt_Line1_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line1Quantity"]);
                txt_Line2_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line2Quantity"]);
                txt_Line3_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line3Quantity"]);
                txt_Line4_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line4Quantity"]);
                txt_Line5_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line5Quantity"]);
                txt_Line6_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line6Quantity"]);
                txt_Line7_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line7Quantity"]);
                txt_Line8_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line8Quantity"]);
                txt_Line9_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line9Quantity"]);
                txt_Line10_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line10Quantity"]);
                txt_Line11_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line11Quantity"]);
                txt_Line12_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line12Quantity"]);
                txt_Line13_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line13Quantity"]);
                txt_Line14_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line14Quantity"]);
                txt_Line15_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line15Quantity"]);
                txt_Line16_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line16Quantity"]);
                txt_Line17_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line17Quantity"]);
                txt_Line18_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line18Quantity"]);
                txt_Line19_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line19Quantity"]);
                txt_Line20_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line20Quantity"]);
                txt_Line21_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line21Quantity"]);
                txt_Line22_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line22Quantity"]);
                txt_Line23_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line23Quantity"]);
                txt_Line24_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line24Quantity"]);
                txt_Line25_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line25Quantity"]);
                txt_Line26_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line26Quantity"]);
                txt_Line27_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line27Quantity"]);
                txt_Line28_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line28Quantity"]);
                txt_Line29_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line29Quantity"]);
                txt_Line30_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line30Quantity"]);
                txt_Line31_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line31Quantity"]);
                txt_Line32_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line32Quantity"]);
                txt_Line33_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line33Quantity"]);
                txt_Line34_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line34Quantity"]);
                txt_Line35_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line35Quantity"]);
                txt_Line36_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line36Quantity"]);
                txt_Line37_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line37Quantity"]);
                txt_Line1_Total_2.Text = Convert.ToString(dt.Rows[0]["Line1Total"]);
                txt_Line2_Total_2.Text = Convert.ToString(dt.Rows[0]["Line2Total"]);
                txt_Line3_Total_2.Text = Convert.ToString(dt.Rows[0]["Line3Total"]);
                txt_Line4_Total_2.Text = Convert.ToString(dt.Rows[0]["Line4Total"]);
                txt_Line5_Total_2.Text = Convert.ToString(dt.Rows[0]["Line5Total"]);
                txt_Line6_Total_2.Text = Convert.ToString(dt.Rows[0]["Line6Total"]);
                txt_Line7_Total_2.Text = Convert.ToString(dt.Rows[0]["Line7Total"]);
                txt_Line8_Total_2.Text = Convert.ToString(dt.Rows[0]["Line8Total"]);
                txt_Line9_Total_2.Text = Convert.ToString(dt.Rows[0]["Line9Total"]);
                txt_Line10_Total_2.Text = Convert.ToString(dt.Rows[0]["Line10Total"]);
                txt_Line11_Total_2.Text = Convert.ToString(dt.Rows[0]["Line11Total"]);
                txt_Line12_Total_2.Text = Convert.ToString(dt.Rows[0]["Line12Total"]);
                txt_Line13_Total_2.Text = Convert.ToString(dt.Rows[0]["Line13Total"]);
                txt_Line14_Total_2.Text = Convert.ToString(dt.Rows[0]["Line14Total"]);
                txt_Line15_Total_2.Text = Convert.ToString(dt.Rows[0]["Line15Total"]);
                txt_Line16_Total_2.Text = Convert.ToString(dt.Rows[0]["Line16Total"]);
                txt_Line17_Total_2.Text = Convert.ToString(dt.Rows[0]["Line17Total"]);
                txt_Line18_Total_2.Text = Convert.ToString(dt.Rows[0]["Line18Total"]);
                txt_Line19_Total_2.Text = Convert.ToString(dt.Rows[0]["Line19Total"]);
                txt_Line20_Total_2.Text = Convert.ToString(dt.Rows[0]["Line20Total"]);
                txt_Line21_Total_2.Text = Convert.ToString(dt.Rows[0]["Line21Total"]);
                txt_Line22_Total_2.Text = Convert.ToString(dt.Rows[0]["Line22Total"]);
                txt_Line23_Total_2.Text = Convert.ToString(dt.Rows[0]["Line23Total"]);
                txt_Line24_Total_2.Text = Convert.ToString(dt.Rows[0]["Line24Total"]);
                txt_Line25_Total_2.Text = Convert.ToString(dt.Rows[0]["Line25Total"]);
                txt_Line26_Total_2.Text = Convert.ToString(dt.Rows[0]["Line26Total"]);
                txt_Line27_Total_2.Text = Convert.ToString(dt.Rows[0]["Line27Total"]);
                txt_Line28_Total_2.Text = Convert.ToString(dt.Rows[0]["Line28Total"]);
                txt_Line29_Total_2.Text = Convert.ToString(dt.Rows[0]["Line29Total"]);
                txt_Line30_Total_2.Text = Convert.ToString(dt.Rows[0]["Line30Total"]);
                txt_Line31_Total_2.Text = Convert.ToString(dt.Rows[0]["Line31Total"]);
                txt_Line32_Total_2.Text = Convert.ToString(dt.Rows[0]["Line32Total"]);
                txt_Line33_Total_2.Text = Convert.ToString(dt.Rows[0]["Line33Total"]);
                txt_Line34_Total_2.Text = Convert.ToString(dt.Rows[0]["Line34Total"]);
                txt_Line35_Total_2.Text = Convert.ToString(dt.Rows[0]["Line35Total"]);
                txt_Line36_Total_2.Text = Convert.ToString(dt.Rows[0]["Line36Total"]);
                txt_Line37_Total_2.Text = Convert.ToString(dt.Rows[0]["Line37Total"]);

                Finalize2 = Convert.ToString(dt.Rows[0]["Finalized"]);

                //txt_Line1Location_2.Text  = Convert.ToString(dt.Rows[0]["Line1Location"]);
                //txt_Line2Location_2.Text  = Convert.ToString(dt.Rows[0]["Line2Location"]);
                //txt_Line3Location_2.Text  = Convert.ToString(dt.Rows[0]["Line3Location"]);
                //txt_Line4Location_2.Text  = Convert.ToString(dt.Rows[0]["Line4Location"]);
                //txt_Line5Location_2.Text  = Convert.ToString(dt.Rows[0]["Line5Location"]);
                //txt_Line6Location_2.Text  = Convert.ToString(dt.Rows[0]["Line6Location"]);
                //txt_Line7Location_2.Text  = Convert.ToString(dt.Rows[0]["Line7Location"]);
                //txt_Line8Location_2.Text  = Convert.ToString(dt.Rows[0]["Line8Location"]);
                //txt_Line9Location_2.Text  = Convert.ToString(dt.Rows[0]["Line9Location"]);
                //txt_Line10Location_2.Text  = Convert.ToString(dt.Rows[0]["Line10Location"]);
                //txt_Line11Location_2.Text  = Convert.ToString(dt.Rows[0]["Line11Location"]);
                //txt_Line12Location_2.Text  = Convert.ToString(dt.Rows[0]["Line12Location"]);
                //txt_Line13Location_2.Text  = Convert.ToString(dt.Rows[0]["Line13Location"]);
                //txt_Line14Location_2.Text  = Convert.ToString(dt.Rows[0]["Line14Location"]);
                //txt_Line15Location_2.Text  = Convert.ToString(dt.Rows[0]["Line15Location"]);
                //txt_Line16Location_2.Text  = Convert.ToString(dt.Rows[0]["Line16Location"]);
                //txt_Line17Location_2.Text  = Convert.ToString(dt.Rows[0]["Line17Location"]);
                //txt_Line18Location_2.Text  = Convert.ToString(dt.Rows[0]["Line18Location"]);
                //txt_Line19Location_2.Text  = Convert.ToString(dt.Rows[0]["Line19Location"]);
                //txt_Line20Location_2.Text  = Convert.ToString(dt.Rows[0]["Line20Location"]);
                //txt_Line21Location_2.Text  = Convert.ToString(dt.Rows[0]["Line21Location"]);
                //txt_Line22Location_2.Text  = Convert.ToString(dt.Rows[0]["Line22Location"]);
                //txt_Line23Location_2.Text  = Convert.ToString(dt.Rows[0]["Line23Location"]);
                //txt_Line24Location_2.Text  = Convert.ToString(dt.Rows[0]["Line24Location"]);
                //txt_Line25Location_2.Text  = Convert.ToString(dt.Rows[0]["Line25Location"]);
                //txt_Line26Location_2.Text  = Convert.ToString(dt.Rows[0]["Line26Location"]);
                //txt_Line27Location_2.Text  = Convert.ToString(dt.Rows[0]["Line27Location"]);
                //txt_Line28Location_2.Text  = Convert.ToString(dt.Rows[0]["Line28Location"]);
                //txt_Line29Location_2.Text  = Convert.ToString(dt.Rows[0]["Line29Location"]);
                //txt_Line30Location_2.Text  = Convert.ToString(dt.Rows[0]["Line30Location"]);
                //txt_Line31Location_2.Text  = Convert.ToString(dt.Rows[0]["Line31Location"]);
                //txt_Line32Location_2.Text  = Convert.ToString(dt.Rows[0]["Line32Location"]);
                //txt_Line33Location_2.Text  = Convert.ToString(dt.Rows[0]["Line33Location"]);
                //txt_Line34Location_2.Text  = Convert.ToString(dt.Rows[0]["Line34Location"]);
                //txt_Line35Location_2.Text  = Convert.ToString(dt.Rows[0]["Line35Location"]);
                //txt_Line36Location_2.Text  = Convert.ToString(dt.Rows[0]["Line36Location"]);
                //txt_Line37Location_2.Text  = Convert.ToString(dt.Rows[0]["Line37Location"]);
            }

        }
        catch
        {
        }
    }
    #endregion



    #region "Page 3"
    public void BindData3(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Invoice_3(JobNum);
            if (dt.Rows.Count > 0)
            {
                //if (Convert.ToString(dt.Rows[0]["Finalized"]) == "F")
                //{
                //    //btn_FinalizeInvoice.Visible = false;
                //    //btn_SaveCurrentPg.Visible = false;
                //    //btn_FinalizeInvoice.Enabled = false;
                //    //btn_SaveCurrentPg.Enabled = false;
                //    //btn_PrintInvoice.Enabled = true;

                //    txt_Line1_Qty_3.Enabled = false;
                //    txt_Line2_Qty_3.Enabled = false;
                //    txt_Line3_Qty_3.Enabled = false;
                //    txt_Line4_Qty_3.Enabled = false;
                //    txt_Line5_Qty_3.Enabled = false;
                //    txt_Line6_Qty_3.Enabled = false;
                //    txt_Line7_Qty_3.Enabled = false;
                //    txt_Line8_Qty_3.Enabled = false;
                //    txt_Line9_Qty_3.Enabled = false;
                //    txt_Line10_Qty_3.Enabled = false;
                //    txt_Line11_Qty_3.Enabled = false;
                //    txt_Line12_Qty_3.Enabled = false;
                //    txt_Line13_Qty_3.Enabled = false;
                //    txt_Line14_Qty_3.Enabled = false;
                //    txt_Line15_Qty_3.Enabled = false;
                //    txt_Line16_Qty_3.Enabled = false;
                //    txt_Line17_Qty_3.Enabled = false;
                //    txt_Line18_Qty_3.Enabled = false;
                //    txt_Line19_Qty_3.Enabled = false;
                //    txt_Line20_Qty_3.Enabled = false;
                //    txt_Line21_Qty_3.Enabled = false;
                //    txt_Line22_Qty_3.Enabled = false;
                //    txt_Line23_Qty_3.Enabled = false;
                //    txt_Line24_Qty_3.Enabled = false;
                //    txt_Line25_Qty_3.Enabled = false;
                //    txt_Line26_Qty_3.Enabled = false;
                //    txt_Line27_Qty_3.Enabled = false;
                //    txt_Line18_Qty_3.Enabled = false;
                //    txt_Line19_Qty_3.Enabled = false;
                //    txt_Line20_Qty_3.Enabled = false;
                //    txt_Line21_Qty_3.Enabled = false;
                //    txt_Line22_Qty_3.Enabled = false;
                //    txt_Line23_Qty_3.Enabled = false;
                //    txt_Line24_Qty_3.Enabled = false;
                //    txt_Line25_Qty_3.Enabled = false;
                //    txt_Line26_Qty_3.Enabled = false;
                //    txt_Line27_Qty_3.Enabled = false;
                //    txt_Line28_Qty_3.Enabled = false;
                //    txt_Line29_Qty_3.Enabled = false;
                //    txt_Line30_Qty_3.Enabled = false;
                //    txt_Line31_Qty_3.Enabled = false;
                //    txt_Line32_Qty_3.Enabled = false;
                //    txt_Line33_Qty_3.Enabled = false;
                //    txt_Line34_Qty_3.Enabled = false;
                //    txt_Line35_Qty_3.Enabled = false;
                //    txt_Line36_Qty_3.Enabled = false;
                //    txt_Line37_Qty_3.Enabled = false;

                //}
                //else
                //{
                //    //btn_FinalizeInvoice.Visible = true;
                //    //btn_SaveCurrentPg.Visible = true;
                //    //btn_FinalizeInvoice.Enabled = true;
                //    //btn_SaveCurrentPg.Enabled = true;
                //}

                txt_Line1_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line1Quantity"]);
                txt_Line2_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line2Quantity"]);
                txt_Line3_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line3Quantity"]);
                txt_Line4_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line4Quantity"]);
                txt_Line5_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line5Quantity"]);
                txt_Line6_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line6Quantity"]);
                txt_Line7_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line7Quantity"]);
                txt_Line8_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line8Quantity"]);
                txt_Line9_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line9Quantity"]);
                txt_Line10_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line10Quantity"]);
                txt_Line11_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line11Quantity"]);
                txt_Line12_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line12Quantity"]);
                txt_Line13_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line13Quantity"]);
                txt_Line14_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line14Quantity"]);
                txt_Line15_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line15Quantity"]);
                txt_Line16_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line16Quantity"]);
                txt_Line17_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line17Quantity"]);
                txt_Line18_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line18Quantity"]);
                txt_Line19_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line19Quantity"]);
                txt_Line20_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line20Quantity"]);
                txt_Line21_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line21Quantity"]);
                txt_Line22_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line22Quantity"]);
                txt_Line23_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line23Quantity"]);
                txt_Line24_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line24Quantity"]);
                txt_Line25_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line25Quantity"]);
                txt_Line26_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line26Quantity"]);
                txt_Line27_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line27Quantity"]);
                txt_Line28_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line28Quantity"]);
                txt_Line29_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line29Quantity"]);
                txt_Line30_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line30Quantity"]);
                txt_Line31_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line31Quantity"]);
                txt_Line32_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line32Quantity"]);
                txt_Line33_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line33Quantity"]);
                txt_Line34_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line34Quantity"]);
                txt_Line35_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line35Quantity"]);
                txt_Line36_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line36Quantity"]);
                txt_Line37_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line37Quantity"]);

                txt_Line1_Total_3.Text = Convert.ToString(dt.Rows[0]["Line1Total"]);
                txt_Line2_Total_3.Text = Convert.ToString(dt.Rows[0]["Line2Total"]);
                txt_Line3_Total_3.Text = Convert.ToString(dt.Rows[0]["Line3Total"]);
                txt_Line4_Total_3.Text = Convert.ToString(dt.Rows[0]["Line4Total"]);
                txt_Line5_Total_3.Text = Convert.ToString(dt.Rows[0]["Line5Total"]);
                txt_Line6_Total_3.Text = Convert.ToString(dt.Rows[0]["Line6Total"]);
                txt_Line7_Total_3.Text = Convert.ToString(dt.Rows[0]["Line7Total"]);
                txt_Line8_Total_3.Text = Convert.ToString(dt.Rows[0]["Line8Total"]);
                txt_Line9_Total_3.Text = Convert.ToString(dt.Rows[0]["Line9Total"]);
                txt_Line10_Total_3.Text = Convert.ToString(dt.Rows[0]["Line10Total"]);
                txt_Line11_Total_3.Text = Convert.ToString(dt.Rows[0]["Line11Total"]);
                txt_Line12_Total_3.Text = Convert.ToString(dt.Rows[0]["Line12Total"]);
                txt_Line13_Total_3.Text = Convert.ToString(dt.Rows[0]["Line13Total"]);
                txt_Line14_Total_3.Text = Convert.ToString(dt.Rows[0]["Line14Total"]);
                txt_Line15_Total_3.Text = Convert.ToString(dt.Rows[0]["Line15Total"]);
                txt_Line16_Total_3.Text = Convert.ToString(dt.Rows[0]["Line16Total"]);
                txt_Line17_Total_3.Text = Convert.ToString(dt.Rows[0]["Line17Total"]);
                txt_Line18_Total_3.Text = Convert.ToString(dt.Rows[0]["Line18Total"]);
                txt_Line19_Total_3.Text = Convert.ToString(dt.Rows[0]["Line19Total"]);
                txt_Line20_Total_3.Text = Convert.ToString(dt.Rows[0]["Line20Total"]);
                txt_Line21_Total_3.Text = Convert.ToString(dt.Rows[0]["Line21Total"]);
                txt_Line22_Total_3.Text = Convert.ToString(dt.Rows[0]["Line22Total"]);
                txt_Line23_Total_3.Text = Convert.ToString(dt.Rows[0]["Line23Total"]);
                txt_Line24_Total_3.Text = Convert.ToString(dt.Rows[0]["Line24Total"]);
                txt_Line25_Total_3.Text = Convert.ToString(dt.Rows[0]["Line25Total"]);
                txt_Line26_Total_3.Text = Convert.ToString(dt.Rows[0]["Line26Total"]);
                txt_Line27_Total_3.Text = Convert.ToString(dt.Rows[0]["Line27Total"]);
                txt_Line28_Total_3.Text = Convert.ToString(dt.Rows[0]["Line28Total"]);
                txt_Line29_Total_3.Text = Convert.ToString(dt.Rows[0]["Line29Total"]);
                txt_Line30_Total_3.Text = Convert.ToString(dt.Rows[0]["Line30Total"]);
                txt_Line31_Total_3.Text = Convert.ToString(dt.Rows[0]["Line31Total"]);
                txt_Line32_Total_3.Text = Convert.ToString(dt.Rows[0]["Line32Total"]);
                txt_Line33_Total_3.Text = Convert.ToString(dt.Rows[0]["Line33Total"]);
                txt_Line34_Total_3.Text = Convert.ToString(dt.Rows[0]["Line34Total"]);
                txt_Line35_Total_3.Text = Convert.ToString(dt.Rows[0]["Line35Total"]);
                txt_Line36_Total_3.Text = Convert.ToString(dt.Rows[0]["Line36Total"]);
                txt_Line37_Total_3.Text = Convert.ToString(dt.Rows[0]["Line37Total"]);

                Finalize3 = Convert.ToString(dt.Rows[0]["Finalized"]);

                //txt_Line1_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line1Location"]);
                //txt_Line2_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line2Location"]);
                //txt_Line3_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line3Location"]);
                //txt_Line4_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line4Location"]);
                //txt_Line5_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line5Location"]);
                //txt_Line6_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line6Location"]);
                //txt_Line7_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line7Location"]);
                //txt_Line8_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line8Location"]);
                //txt_Line9_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line9Location"]);
                //txt_Line10_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line10Location"]);
                //txt_Line11_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line11Location"]);
                //txt_Line12_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line12Location"]);
                //txt_Line13_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line13Location"]);
                //txt_Line14_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line14Location"]);
                //txt_Line15_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line15Location"]);
                //txt_Line16_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line16Location"]);
                //txt_Line17_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line17Location"]);
                //txt_Line18_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line18Location"]);
                //txt_Line19_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line19Location"]);
                //txt_Line20_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line20Location"]);
                //txt_Line21_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line21Location"]);
                //txt_Line22_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line22Location"]);
                //txt_Line23_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line23Location"]);
                //txt_Line24_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line24Location"]);
                //txt_Line25_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line25Location"]);
                //txt_Line26_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line26Location"]);
                //txt_Line27_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line27Location"]);
                //txt_Line28_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line28Location"]);
                //txt_Line29_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line29Location"]);
                //txt_Line30_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line30Location"]);
                //txt_Line31_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line31Location"]);
                //txt_Line32_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line32Location"]);
                //txt_Line33_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line33Location"]);
                //txt_Line34_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line34Location"]);
                //txt_Line35_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line35Location"]);
                //txt_Line36_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line36Location"]);
                //txt_Line37_Location_3.Text  = Convert.ToString(dt.Rows[0]["Line37Location"]);

                txt_Line17_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line17Category"]);
                txt_Line17_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line17LIURPCode"]);
                txt_Line17_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line17MeasureDescription"]);
                txt_Line17_SC_3.Text = Convert.ToString(dt.Rows[0]["Line17SC"]);
                txt_Line17_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line17Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line17LaborRate"]) == "")
                {
                    txt_Line17_LaborRate_3.Text = "43/68";
                }
                else
                {
                    txt_Line17_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line17LaborRate"]);
                }


                txt_Line17_THW_3.Text = Convert.ToString(dt.Rows[0]["Line17THW"]);
                txt_Line17_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line17TMC"]);
                //txt_Line17_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line17CostPerUnit"]);

                txt_Line18_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line18Category"]);
                txt_Line18_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line18LIURPCode"]);
                txt_Line18_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line18MeasureDescription"]);
                txt_Line18_SC_3.Text = Convert.ToString(dt.Rows[0]["Line18SC"]);
                txt_Line18_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line18Unit"]);



                if (Convert.ToString(dt.Rows[0]["Line18LaborRate"]) == "")
                {
                    txt_Line18_LaborRate_3.Text = "43/68";
                }
                else
                {
                    txt_Line18_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line18LaborRate"]);
                }

                txt_Line18_THW_3.Text = Convert.ToString(dt.Rows[0]["Line18THW"]);
                txt_Line18_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line18TMC"]);
                //txt_Line18_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line18CostPerUnit"]);

                txt_Line33_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line33Category"]);
                txt_Line33_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line33LIURPCode"]);
                txt_Line33_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line33MeasureDescription"]);
                txt_Line33_SC_3.Text = Convert.ToString(dt.Rows[0]["Line33SC"]);
                txt_Line33_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line33Unit"]);



                if (Convert.ToString(dt.Rows[0]["Line33LaborRate"]) == "")
                {
                    txt_Line33_LaborRate_3.Text = "43/68";
                }
                else
                {
                    txt_Line33_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line33LaborRate"]);
                }



                txt_Line33_THW_3.Text = Convert.ToString(dt.Rows[0]["Line33THW"]);
                txt_Line33_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line33TMC"]);
                //txt_Line33_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line33CostPerUnit"]);

                txt_Line34_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line34Category"]);
                txt_Line34_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line34LIURPCode"]);
                txt_Line34_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line34MeasureDescription"]);
                txt_Line34_SC_3.Text = Convert.ToString(dt.Rows[0]["Line34SC"]);
                txt_Line34_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line34Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line34LaborRate"]) == "")
                {
                    txt_Line34_LaborRate_3.Text = "43/68";
                }
                else
                {
                    txt_Line34_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line34LaborRate"]);
                }





                txt_Line34_THW_3.Text = Convert.ToString(dt.Rows[0]["Line34THW"]);
                txt_Line34_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line34TMC"]);
                //txt_Line34_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line34CostPerUnit"]);
            }
        }
        catch
        {
        }
    }
    #endregion



    #region "Page 4"
    public void BindData4(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Invoice_4(JobNum);
            if (dt.Rows.Count > 0)
            {
                //if (Convert.ToString(dt.Rows[0]["Finalized"]) == "F")
                //{
                //    //btn_FinalizeInvoice.Visible = false;
                //    //btn_SaveCurrentPg.Visible = false;
                //    //btn_PrintInvoice.Enabled = false;
                //    txt_Line1_Qty_4.Enabled = false;
                //    txt_Line2_Qty_4.Enabled = false;
                //    txt_Line3_Qty_4.Enabled = false;
                //    txt_Line4_Qty_4.Enabled = false;
                //    txt_Line5_Qty_4.Enabled = false;
                //    txt_Line6_Qty_4.Enabled = false;
                //    txt_Line7_Qty_4.Enabled = false;
                //    txt_Line8_Qty_4.Enabled = false;
                //    txt_Line9_Qty_4.Enabled = false;
                //    txt_Line10_Qty_4.Enabled = false;
                //    txt_Line11_Qty_4.Enabled = false;
                //    txt_Line12_Qty_4.Enabled = false;
                //    txt_Line13_Qty_4.Enabled = false;
                //    txt_Line14_Qty_4.Enabled = false;
                //    txt_Line15_Qty_4.Enabled = false;
                //    txt_Line16_Qty_4.Enabled = false;
                //    txt_Line17_Qty_4.Enabled = false;
                //    txt_Line18_Qty_4.Enabled = false;
                //    txt_Line19_Qty_4.Enabled = false;
                //    txt_Line20_Qty_4.Enabled = false;
                //    txt_Line21_Qty_4.Enabled = false;
                //    txt_Line22_Qty_4.Enabled = false;
                //    txt_Line23_Qty_4.Enabled = false;
                //    txt_Line24_Qty_4.Enabled = false;
                //    txt_Line25_Qty_4.Enabled = false;
                //    txt_Line26_Qty_4.Enabled = false;
                //    txt_Line27_Qty_4.Enabled = false;
                //    txt_Line18_Qty_4.Enabled = false;
                //    txt_Line19_Qty_4.Enabled = false;
                //    txt_Line20_Qty_4.Enabled = false;
                //    txt_Line21_Qty_4.Enabled = false;
                //    txt_Line22_Qty_4.Enabled = false;
                //    txt_Line23_Qty_4.Enabled = false;
                //    txt_Line24_Qty_4.Enabled = false;
                //    txt_Line25_Qty_4.Enabled = false;
                //    txt_Line26_Qty_4.Enabled = false;
                //    txt_Line27_Qty_4.Enabled = false;
                //    txt_Line28_Qty_4.Enabled = false;
                //    txt_Line29_Qty_4.Enabled = false;
                //    txt_Line30_Qty_4.Enabled = false;
                //    txt_Line31_Qty_4.Enabled = false;
                //    txt_Line32_Qty_4.Enabled = false;
                //    txt_Line33_Qty_4.Enabled = false;
                //    txt_Line34_Qty_4.Enabled = false;
                //    txt_Line35_Qty_4.Enabled = false;
                //    txt_Line36_Qty_4.Enabled = false;
                //    txt_Line37_Qty_4.Enabled = false;
                //    txt_Line38_Qty_4.Enabled = false;

                //}
                //else
                //{
                //    //btn_FinalizeInvoice.Visible = true;
                //    //btn_SaveCurrentPg.Visible = true;
                //}

                txt_Line1_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line1Quantity"]);
                txt_Line2_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line2Quantity"]);
                txt_Line3_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line3Quantity"]);
                txt_Line4_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line4Quantity"]);
                txt_Line5_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line5Quantity"]);
                txt_Line6_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line6Quantity"]);
                txt_Line7_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line7Quantity"]);
                txt_Line8_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line8Quantity"]);
                txt_Line9_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line9Quantity"]);
                txt_Line10_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line10Quantity"]);
                txt_Line11_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line11Quantity"]);
                txt_Line12_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line12Quantity"]);
                txt_Line13_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line13Quantity"]);
                txt_Line14_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line14Quantity"]);
                txt_Line15_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line15Quantity"]);
                txt_Line16_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line16Quantity"]);
                txt_Line17_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line17Quantity"]);
                txt_Line18_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line18Quantity"]);
                txt_Line19_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line19Quantity"]);
                txt_Line20_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line20Quantity"]);
                txt_Line21_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line21Quantity"]);
                txt_Line22_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line22Quantity"]);
                txt_Line23_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line23Quantity"]);
                txt_Line24_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line24Quantity"]);
                txt_Line25_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line25Quantity"]);
                txt_Line26_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line26Quantity"]);
                txt_Line27_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line27Quantity"]);
                txt_Line28_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line28Quantity"]);
                txt_Line29_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line29Quantity"]);
                txt_Line30_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line30Quantity"]);
                txt_Line31_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line31Quantity"]);
                txt_Line32_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line32Quantity"]);
                txt_Line33_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line33Quantity"]);
                txt_Line34_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line34Quantity"]);
                txt_Line35_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line35Quantity"]);
                txt_Line36_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line36Quantity"]);
                txt_Line37_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line37Quantity"]);
                txt_Line38_Qty_4.Text = Convert.ToString(dt.Rows[0]["Line38Quantity"]);

                txt_Line1_Total_4.Text = Convert.ToString(dt.Rows[0]["Line1Total"]);
                txt_Line2_Total_4.Text = Convert.ToString(dt.Rows[0]["Line2Total"]);
                txt_Line3_Total_4.Text = Convert.ToString(dt.Rows[0]["Line3Total"]);
                txt_Line4_Total_4.Text = Convert.ToString(dt.Rows[0]["Line4Total"]);
                txt_Line5_Total_4.Text = Convert.ToString(dt.Rows[0]["Line5Total"]);
                txt_Line6_Total_4.Text = Convert.ToString(dt.Rows[0]["Line6Total"]);
                txt_Line7_Total_4.Text = Convert.ToString(dt.Rows[0]["Line7Total"]);
                txt_Line8_Total_4.Text = Convert.ToString(dt.Rows[0]["Line8Total"]);
                txt_Line9_Total_4.Text = Convert.ToString(dt.Rows[0]["Line9Total"]);
                txt_Line10_Total_4.Text = Convert.ToString(dt.Rows[0]["Line10Total"]);
                txt_Line11_Total_4.Text = Convert.ToString(dt.Rows[0]["Line11Total"]);
                txt_Line12_Total_4.Text = Convert.ToString(dt.Rows[0]["Line12Total"]);
                txt_Line13_Total_4.Text = Convert.ToString(dt.Rows[0]["Line13Total"]);
                txt_Line14_Total_4.Text = Convert.ToString(dt.Rows[0]["Line14Total"]);
                txt_Line15_Total_4.Text = Convert.ToString(dt.Rows[0]["Line15Total"]);
                txt_Line16_Total_4.Text = Convert.ToString(dt.Rows[0]["Line16Total"]);
                txt_Line17_Total_4.Text = Convert.ToString(dt.Rows[0]["Line17Total"]);
                txt_Line18_Total_4.Text = Convert.ToString(dt.Rows[0]["Line18Total"]);
                txt_Line19_Total_4.Text = Convert.ToString(dt.Rows[0]["Line19Total"]);
                txt_Line20_Total_4.Text = Convert.ToString(dt.Rows[0]["Line20Total"]);
                txt_Line21_Total_4.Text = Convert.ToString(dt.Rows[0]["Line21Total"]);
                txt_Line22_Total_4.Text = Convert.ToString(dt.Rows[0]["Line22Total"]);
                txt_Line23_Total_4.Text = Convert.ToString(dt.Rows[0]["Line23Total"]);
                txt_Line24_Total_4.Text = Convert.ToString(dt.Rows[0]["Line24Total"]);
                txt_Line25_Total_4.Text = Convert.ToString(dt.Rows[0]["Line25Total"]);
                txt_Line26_Total_4.Text = Convert.ToString(dt.Rows[0]["Line26Total"]);
                txt_Line27_Total_4.Text = Convert.ToString(dt.Rows[0]["Line27Total"]);
                txt_Line28_Total_4.Text = Convert.ToString(dt.Rows[0]["Line28Total"]);
                txt_Line29_Total_4.Text = Convert.ToString(dt.Rows[0]["Line29Total"]);
                txt_Line30_Total_4.Text = Convert.ToString(dt.Rows[0]["Line30Total"]);
                txt_Line31_Total_4.Text = Convert.ToString(dt.Rows[0]["Line31Total"]);
                txt_Line32_Total_4.Text = Convert.ToString(dt.Rows[0]["Line32Total"]);
                txt_Line33_Total_4.Text = Convert.ToString(dt.Rows[0]["Line33Total"]);
                txt_Line34_Total_4.Text = Convert.ToString(dt.Rows[0]["Line34Total"]);
                txt_Line35_Total_4.Text = Convert.ToString(dt.Rows[0]["Line35Total"]);
                txt_Line36_Total_4.Text = Convert.ToString(dt.Rows[0]["Line36Total"]);
                txt_Line37_Total_4.Text = Convert.ToString(dt.Rows[0]["Line37Total"]);
                txt_Line38_Total_4.Text = Convert.ToString(dt.Rows[0]["Line38Total"]);


                Finalize4 = Convert.ToString(dt.Rows[0]["Finalized"]);

                //txt_Line1_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line1Location"]);
                //txt_Line2_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line2Location"]);
                //txt_Line3_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line3Location"]);
                //txt_Line4_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line4Location"]);
                //txt_Line5_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line5Location"]);
                //txt_Line6_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line6Location"]);
                //txt_Line7_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line7Location"]);
                //txt_Line8_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line8Location"]);
                //txt_Line9_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line9Location"]);
                //txt_Line10_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line10Location"]);
                //txt_Line11_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line11Location"]);
                //txt_Line12_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line12Location"]);
                //txt_Line13_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line13Location"]);
                //txt_Line14_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line14Location"]);
                //txt_Line15_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line15Location"]);
                //txt_Line16_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line16Location"]);
                //txt_Line17_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line17Location"]);
                //txt_Line18_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line18Location"]);
                //txt_Line19_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line19Location"]);
                //txt_Line20_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line20Location"]);
                //txt_Line21_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line21Location"]);
                //txt_Line22_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line22Location"]);
                //txt_Line23_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line23Location"]);
                //txt_Line24_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line24Location"]);
                //txt_Line25_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line25Location"]);
                //txt_Line26_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line26Location"]);
                //txt_Line27_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line27Location"]);
                //txt_Line28_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line28Location"]);
                //txt_Line29_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line29Location"]);
                //txt_Line30_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line30Location"]);
                //txt_Line31_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line31Location"]);
                //txt_Line32_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line32Location"]);
                //txt_Line33_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line33Location"]);
                //txt_Line34_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line34Location"]);
                //txt_Line35_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line35Location"]);
                //txt_Line36_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line36Location"]);
                //txt_Line37_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line37Location"]);
                //txt_Line38_Location_4.Text  = Convert.ToString(dt.Rows[0]["Line38Location"]);

                txt_Line2_Cat_4.Text = Convert.ToString(dt.Rows[0]["Line2Category"]);
                txt_Line2_LIURP_4.Text = Convert.ToString(dt.Rows[0]["Line2LIURPCode"]);
                txt_Line2_MeasureDesc_4.Text = Convert.ToString(dt.Rows[0]["Line2MeasureDescription"]);
                txt_Line2_SC_4.Text = Convert.ToString(dt.Rows[0]["Line2SC"]);
                txt_Line2_Unit_4.Text = Convert.ToString(dt.Rows[0]["Line2Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line2LaborRate"]) == "")
                {
                    txt_Line2_LaborRate_4.Text = "43/68";
                }
                else
                {
                    txt_Line2_LaborRate_4.Text = Convert.ToString(dt.Rows[0]["Line2LaborRate"]);
                }



                txt_Line2_THW_4.Text = Convert.ToString(dt.Rows[0]["Line2THW"]);
                txt_Line2_TMC_4.Text = Convert.ToString(dt.Rows[0]["Line2TMC"]);
                //txt_Line2_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line2CostPerUnit"]);

                txt_Line18_Cat_4.Text = Convert.ToString(dt.Rows[0]["Line18Category"]);
                txt_Line18_LIURP_4.Text = Convert.ToString(dt.Rows[0]["Line18LIURPCode"]);
                txt_Line18_MeasureDesc_4.Text = Convert.ToString(dt.Rows[0]["Line18MeasureDescription"]);
                txt_Line18_SC_4.Text = Convert.ToString(dt.Rows[0]["Line18SC"]);
                txt_Line18_Unit_4.Text = Convert.ToString(dt.Rows[0]["Line18Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line18LaborRate"]) == "")
                {
                    txt_Line18_LaborRate_4.Text = "43/68";
                }
                else
                {
                    txt_Line18_LaborRate_4.Text = Convert.ToString(dt.Rows[0]["Line18LaborRate"]);
                }

                txt_Line18_THW_4.Text = Convert.ToString(dt.Rows[0]["Line18THW"]);
                txt_Line18_TMC_4.Text = Convert.ToString(dt.Rows[0]["Line18TMC"]);
                //txt_Line18_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line18CostPerUnit"]);

                txt_Line19_Cat_4.Text = Convert.ToString(dt.Rows[0]["Line19Category"]);
                txt_Line19_LIURP_4.Text = Convert.ToString(dt.Rows[0]["Line19LIURPCode"]);
                txt_Line19_MeasureDesc_4.Text = Convert.ToString(dt.Rows[0]["Line19MeasureDescription"]);
                txt_Line19_SC_4.Text = Convert.ToString(dt.Rows[0]["Line19SC"]);
                txt_Line19_Unit_4.Text = Convert.ToString(dt.Rows[0]["Line19Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line19LaborRate"]) == "")
                {
                    txt_Line19_LaborRate_4.Text = "43/68";
                }
                else
                {
                    txt_Line19_LaborRate_4.Text = Convert.ToString(dt.Rows[0]["Line19LaborRate"]);
                }


                txt_Line19_THW_4.Text = Convert.ToString(dt.Rows[0]["Line19THW"]);
                txt_Line19_TMC_4.Text = Convert.ToString(dt.Rows[0]["Line19TMC"]);
                //txt_Line18_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line18CostPerUnit"]);

                txt_Line23_Cat_4.Text = Convert.ToString(dt.Rows[0]["Line23Category"]);
                txt_Line23_LIURP_4.Text = Convert.ToString(dt.Rows[0]["Line23LIURPCode"]);
                txt_Line23_MeasureDesc_4.Text = Convert.ToString(dt.Rows[0]["Line23MeasureDescription"]);
                txt_Line23_SC_4.Text = Convert.ToString(dt.Rows[0]["Line23SC"]);
                txt_Line23_Unit_4.Text = Convert.ToString(dt.Rows[0]["Line23Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line23LaborRate"]) == "")
                {
                    txt_Line23_LaborRate_4.Text = "43/68";
                }
                else
                {
                    txt_Line23_LaborRate_4.Text = Convert.ToString(dt.Rows[0]["Line23LaborRate"]);
                }



                txt_Line23_THW_4.Text = Convert.ToString(dt.Rows[0]["Line23THW"]);
                txt_Line23_TMC_4.Text = Convert.ToString(dt.Rows[0]["Line23TMC"]);
                //txt_Line23_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line23CostPerUnit"]);

                //txt_Line24_Cat_4.Text = Convert.ToString(dt.Rows[0]["Line24Category"]);
                txt_Line24_LIURP_4.Text = Convert.ToString(dt.Rows[0]["Line24LIURPCode"]);
                txt_Line24_MeasureDesc_4.Text = Convert.ToString(dt.Rows[0]["Line24MeasureDescription"]);
                txt_Line24_SC_4.Text = Convert.ToString(dt.Rows[0]["Line24SC"]);
                txt_Line24_Unit_4.Text = Convert.ToString(dt.Rows[0]["Line24Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line24LaborRate"]) == "")
                {
                    txt_Line24_LaborRate_4.Text = "43/68";
                }
                else
                {
                    txt_Line24_LaborRate_4.Text = Convert.ToString(dt.Rows[0]["Line24LaborRate"]);
                }



                txt_Line24_THW_4.Text = Convert.ToString(dt.Rows[0]["Line24THW"]);
                txt_Line24_TMC_4.Text = Convert.ToString(dt.Rows[0]["Line24TMC"]);
                //txt_Line24_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line24CostPerUnit"]);

                txt_Line25_Cat_4.Text = Convert.ToString(dt.Rows[0]["Line25Category"]);
                txt_Line25_LIURP_4.Text = Convert.ToString(dt.Rows[0]["Line25LIURPCode"]);
                txt_Line25_MeasureDesc_4.Text = Convert.ToString(dt.Rows[0]["Line25MeasureDescription"]);
                txt_Line25_SC_4.Text = Convert.ToString(dt.Rows[0]["Line25SC"]);
                txt_Line25_Unit_4.Text = Convert.ToString(dt.Rows[0]["Line25Unit"]);




                if (Convert.ToString(dt.Rows[0]["Line25LaborRate"]) == "")
                {
                    txt_Line25_LaborRate_4.Text = "43/68";
                }
                else
                {
                    txt_Line25_LaborRate_4.Text = Convert.ToString(dt.Rows[0]["Line25LaborRate"]);
                }


                txt_Line25_THW_4.Text = Convert.ToString(dt.Rows[0]["Line25THW"]);
                txt_Line25_TMC_4.Text = Convert.ToString(dt.Rows[0]["Line25TMC"]);
                //txt_Line25_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line25CostPerUnit"]);

                txt_Line26_Cat_4.Text = Convert.ToString(dt.Rows[0]["Line26Category"]);
                txt_Line26_LIURP_4.Text = Convert.ToString(dt.Rows[0]["Line26LIURPCode"]);
                txt_Line26_MeasureDesc_4.Text = Convert.ToString(dt.Rows[0]["Line26MeasureDescription"]);
                txt_Line26_SC_4.Text = Convert.ToString(dt.Rows[0]["Line26SC"]);
                txt_Line26_Unit_4.Text = Convert.ToString(dt.Rows[0]["Line26Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line26LaborRate"]) == "")
                {
                    txt_Line26_LaborRate_4.Text = "43/68";
                }
                else
                {
                    txt_Line26_LaborRate_4.Text = Convert.ToString(dt.Rows[0]["Line26LaborRate"]);

                }

                txt_Line26_THW_4.Text = Convert.ToString(dt.Rows[0]["Line26THW"]);
                txt_Line26_TMC_4.Text = Convert.ToString(dt.Rows[0]["Line26TMC"]);
                //txt_Line26_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line26CostPerUnit"]);

                //txt_Line27_Cat_4.Text = Convert.ToString(dt.Rows[0]["Line27Category"]);
                txt_Line27_LIURP_4.Text = Convert.ToString(dt.Rows[0]["Line27LIURPCode"]);
                txt_Line27_MeasureDesc_4.Text = Convert.ToString(dt.Rows[0]["Line27MeasureDescription"]);
                txt_Line27_SC_4.Text = Convert.ToString(dt.Rows[0]["Line27SC"]);
                txt_Line27_Unit_4.Text = Convert.ToString(dt.Rows[0]["Line27Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line27LaborRate"]) == "")
                {
                    txt_Line27_LaborRate_4.Text = "43/68";
                }
                else
                {
                    txt_Line27_LaborRate_4.Text = Convert.ToString(dt.Rows[0]["Line27LaborRate"]);

                }


                txt_Line27_THW_4.Text = Convert.ToString(dt.Rows[0]["Line27THW"]);
                txt_Line27_TMC_4.Text = Convert.ToString(dt.Rows[0]["Line27TMC"]);
                //txt_Line27_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line27CostPerUnit"]);

                txt_Line28_Cat_4.Text = Convert.ToString(dt.Rows[0]["Line28Category"]);
                txt_Line28_LIURP_4.Text = Convert.ToString(dt.Rows[0]["Line28LIURPCode"]);
                txt_Line28_MeasureDesc_4.Text = Convert.ToString(dt.Rows[0]["Line28MeasureDescription"]);
                txt_Line28_SC_4.Text = Convert.ToString(dt.Rows[0]["Line28SC"]);
                txt_Line28_Unit_4.Text = Convert.ToString(dt.Rows[0]["Line28Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line28LaborRate"]) == "")
                {
                    txt_Line28_LaborRate_4.Text = "43/68";
                }
                else
                {
                    txt_Line28_LaborRate_4.Text = Convert.ToString(dt.Rows[0]["Line28LaborRate"]);
                }



                txt_Line28_THW_4.Text = Convert.ToString(dt.Rows[0]["Line28THW"]);
                txt_Line28_TMC_4.Text = Convert.ToString(dt.Rows[0]["Line28TMC"]);
                //txt_Line28_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line28CostPerUnit"]);

                txt_Line29_cat_4.Text = Convert.ToString(dt.Rows[0]["Line29Category"]);
                txt_Line29_LIURP_4.Text = Convert.ToString(dt.Rows[0]["Line29LIURPCode"]);
                txt_Line29_MeasureDesc_4.Text = Convert.ToString(dt.Rows[0]["Line29MeasureDescription"]);
                txt_Line29_SC_4.Text = Convert.ToString(dt.Rows[0]["Line29SC"]);
                txt_Line29_Unit_4.Text = Convert.ToString(dt.Rows[0]["Line29Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line29LaborRate"]) == "")
                {
                    txt_Line29_LaborRate_4.Text = "43/68";
                }
                else
                {
                    txt_Line29_LaborRate_4.Text = Convert.ToString(dt.Rows[0]["Line29LaborRate"]);
                }



                txt_Line29_THW_4.Text = Convert.ToString(dt.Rows[0]["Line29THW"]);
                txt_Line29_TMC_4.Text = Convert.ToString(dt.Rows[0]["Line29TMC"]);
                //txt_Line29_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line29CostPerUnit"]);


            }
        }
        catch
        {
        }
    }
    #endregion



    #region "Page 5"
    public void BindData5(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Invoice_5(JobNum);
            if (dt.Rows.Count > 0)
            {
                //if (Convert.ToString(dt.Rows[0]["Finalized"]) == "F")
                //{
                //    //btn_FinalizeInvoice.Visible = false;
                //    //btn_SaveCurrentPg.Visible = false;
                //    //btn_FinalizeInvoice.Enabled = false;
                //    //btn_SaveCurrentPg.Enabled = false;
                //    //btn_PrintInvoice.Enabled = true;

                //    txt_Line1_Qty.Enabled = false;
                //    txt_Line2_Qty.Enabled = false;
                //    txt_Line3_Qty.Enabled = false;
                //    txt_Line4_Qty.Enabled = false;
                //    txt_Line5_Qty.Enabled = false;
                //    txt_Line6_Qty.Enabled = false;
                //    txt_Line7_Qty.Enabled = false;
                //    txt_Line8_Qty.Enabled = false;
                //    txt_Line9_Qty.Enabled = false;
                //    txt_Line10_Qty.Enabled = false;
                //    txt_Line11_Qty.Enabled = false;
                //    txt_Line12_Qty.Enabled = false;
                //    txt_Line13_Qty.Enabled = false;
                //    txt_Line14_Qty.Enabled = false;
                //    txt_Line15_Qty.Enabled = false;
                //    txt_Line16_Qty.Enabled = false;
                //    txt_Line17_Qty.Enabled = false;
                //    txt_Line18_Qty.Enabled = false;
                //    txt_Line19_Qty.Enabled = false;
                //    txt_Line20_Qty.Enabled = false;

                //}
                //else
                //{
                //    //btn_FinalizeInvoice.Visible = true;
                //    //btn_SaveCurrentPg.Visible = true;
                //    //btn_FinalizeInvoice.Enabled = true;
                //    //btn_SaveCurrentPg.Enabled = true;
                //}

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

                hdn_Finalize.Value = Convert.ToString(dt.Rows[0]["Finalized"]);

                //txt_Line1_Location.Text  = Convert.ToString(dt.Rows[0]["Line1Location"]);
                //txt_Line2_Location.Text  = Convert.ToString(dt.Rows[0]["Line2Location"]);
                //txt_Line3_Location.Text  = Convert.ToString(dt.Rows[0]["Line3Location"]);
                //txt_Line4_Location.Text  = Convert.ToString(dt.Rows[0]["Line4Location"]);
                //txt_Line5_Location.Text  = Convert.ToString(dt.Rows[0]["Line5Location"]);
                //txt_Line6_Location.Text  = Convert.ToString(dt.Rows[0]["Line6Location"]);
                //txt_Line7_Location.Text  = Convert.ToString(dt.Rows[0]["Line7Location"]);
                //txt_Line8_Location.Text  = Convert.ToString(dt.Rows[0]["Line8Location"]);
                //txt_Line9_Location.Text  = Convert.ToString(dt.Rows[0]["Line9Location"]);
                //txt_Line10_Location.Text  = Convert.ToString(dt.Rows[0]["Line10Location"]);
                //txt_Line11_Location.Text  = Convert.ToString(dt.Rows[0]["Line11Location"]);
                //txt_Line12_Location.Text  = Convert.ToString(dt.Rows[0]["Line12Location"]);
                //txt_Line13_Location.Text  = Convert.ToString(dt.Rows[0]["Line13Location"]);
                //txt_Line14_Location.Text  = Convert.ToString(dt.Rows[0]["Line14Location"]);
                //txt_Line15_Location.Text  = Convert.ToString(dt.Rows[0]["Line15Location"]);
                //txt_Line16_Location.Text  = Convert.ToString(dt.Rows[0]["Line16Location"]);
                //txt_Line17_Location.Text  = Convert.ToString(dt.Rows[0]["Line17Location"]);
                //txt_Line18_Location.Text  = Convert.ToString(dt.Rows[0]["Line18Location"]);
                //txt_Line19_Location.Text  = Convert.ToString(dt.Rows[0]["Line19Location"]);
                //txt_Line20_Location.Text  = Convert.ToString(dt.Rows[0]["Line20Location"]);

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
                //txt_Line12_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line12CostPerUnit"]);


                txt_Line13_Cat.Text = Convert.ToString(dt.Rows[0]["Line13Category"]);
                txt_Line13_LIURP.Text = Convert.ToString(dt.Rows[0]["Line13LIURPCode"]);
                txt_Line13_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line13MeasureDescription"]);
                txt_Line13_SC.Text = Convert.ToString(dt.Rows[0]["Line13SC"]);
                txt_Line13_Unit.Text = Convert.ToString(dt.Rows[0]["Line13Unit"]);
                txt_Line13_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line13LaborRate"]);
                txt_Line13_THW.Text = Convert.ToString(dt.Rows[0]["Line13THW"]);
                txt_Line13_TMC.Text = Convert.ToString(dt.Rows[0]["Line13TMC"]);
                //txt_Line13_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line13CostPerUnit"]); 

                txt_Line16_Cat.Text = Convert.ToString(dt.Rows[0]["Line16Category"]);
                txt_Line16_LIURP.Text = Convert.ToString(dt.Rows[0]["Line16LIURPCode"]);
                txt_Line16_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line16MeasureDescription"]);
                txt_Line16_SC.Text = Convert.ToString(dt.Rows[0]["Line16SC"]);
                txt_Line16_Unit.Text = Convert.ToString(dt.Rows[0]["Line16Unit"]);
                txt_Line16_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line16LaborRate"]);
                txt_Line16_THW.Text = Convert.ToString(dt.Rows[0]["Line16THW"]);
                txt_Line16_TMC.Text = Convert.ToString(dt.Rows[0]["Line16TMC"]);
                //txt_Line16_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line16CostPerUnit"]); 

                txt_Line17_Cat.Text = Convert.ToString(dt.Rows[0]["Line17Category"]);
                txt_Line17_LIURP.Text = Convert.ToString(dt.Rows[0]["Line17LIURPCode"]);
                txt_Line17_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line17MeasureDescription"]);
                txt_Line17_SC.Text = Convert.ToString(dt.Rows[0]["Line17SC"]);
                txt_Line17_Unit.Text = Convert.ToString(dt.Rows[0]["Line17Unit"]);
                txt_Line17_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line17LaborRate"]);
                txt_Line17_THW.Text = Convert.ToString(dt.Rows[0]["Line17THW"]);
                txt_Line17_TMC.Text = Convert.ToString(dt.Rows[0]["Line17TMC"]);
                //txt_Line17_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line17CostPerUnit"]); 

                txt_Line18_Cat.Text = Convert.ToString(dt.Rows[0]["Line18Category"]);
                txt_Line18_LIURP.Text = Convert.ToString(dt.Rows[0]["Line18LIURPCode"]);
                txt_Line18_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line18MeasureDescription"]);
                txt_Line18_SC.Text = Convert.ToString(dt.Rows[0]["Line18SC"]);
                txt_Line18_Unit.Text = Convert.ToString(dt.Rows[0]["Line18Unit"]);
                txt_Line18_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line18LaborRate"]);
                txt_Line18_THW.Text = Convert.ToString(dt.Rows[0]["Line18THW"]);
                txt_Line18_TMC.Text = Convert.ToString(dt.Rows[0]["Line18TMC"]);
                //txt_Line18_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line18CostPerUnit"]); 

                txt_Line19_Cat.Text = Convert.ToString(dt.Rows[0]["Line19Category"]);
                txt_Line19_LIURP.Text = Convert.ToString(dt.Rows[0]["Line19LIURPCode"]);
                txt_Line19_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line19MeasureDescription"]);
                txt_Line19_SC.Text = Convert.ToString(dt.Rows[0]["Line19SC"]);
                txt_Line19_Unit.Text = Convert.ToString(dt.Rows[0]["Line19Unit"]);
                txt_Line19_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line19LaborRate"]);
                txt_Line19_THW.Text = Convert.ToString(dt.Rows[0]["Line19THW"]);
                txt_Line19_TMC.Text = Convert.ToString(dt.Rows[0]["Line19TMC"]);
                //txt_Line19_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line19CostPerUnit"]); 

                txt_Line20_Cat.Text = Convert.ToString(dt.Rows[0]["Line20Category"]);
                txt_Line20_LIURP.Text = Convert.ToString(dt.Rows[0]["Line20LIURPCode"]);
                txt_Line20_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line20MeasureDescription"]);
                txt_Line20_SC.Text = Convert.ToString(dt.Rows[0]["Line20SC"]);
                txt_Line20_Unit.Text = Convert.ToString(dt.Rows[0]["Line20Unit"]);
                txt_Line20_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line20LaborRate"]);
                txt_Line20_THW.Text = Convert.ToString(dt.Rows[0]["Line20THW"]);
                txt_Line20_TMC.Text = Convert.ToString(dt.Rows[0]["Line20TMC"]);
                //txt_Line20_CostUnit.Text  = Convert.ToString(dt.Rows[0]["Line20CostPerUnit"]); 




                Decimal Page1 = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["TotalPage1"].ToString()));
                Decimal Page2 = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["TotalPage2"].ToString()));
                Decimal Page3 = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["TotalPage3"].ToString()));
                Decimal Page4 = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["TotalPage4"].ToString()));
                Decimal Page5 = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["TotalPage5"].ToString()));
                Decimal GrandTotal = Convert.ToDecimal(string.Format("{0:F2}", dt.Rows[0]["GrandTotal"].ToString()));

                txt_TotalPage1.Text = String.Format("{0:00.##}", Page1);
                txt_TotalPage2.Text = String.Format("{0:00.##}", Page2);
                txt_TotalPage3.Text = String.Format("{0:00.##}", Page3);
                txt_TotalPage4.Text = String.Format("{0:00.##}", Page4);
                txt_TotalPage5.Text = String.Format("{0:00.##}", Page5);
                txt_GrandTotal.Text = String.Format("{0:00.##}", GrandTotal);






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
    #endregion



    #region "Logout"
    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        try
        {
            objSm.DeleteCookie("UId");
            objSm.DeleteCookie("UserId");
            objSm.DeleteCookie("UserName");
            Response.Redirect("Login.aspx");
        }
        catch
        {

        }
    }
    #endregion




}
