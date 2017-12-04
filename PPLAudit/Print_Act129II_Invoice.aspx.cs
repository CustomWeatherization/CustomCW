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

public partial class PPLAudit_Print_Act129II_Invoice : System.Web.UI.Page
{
    public static string StrUserName;
    public static string Finalize1, Finalize2, Finalize3, Finalize4, Finalize5;
    smUtil objSm = new smUtil();
    dcPPLAudit ObjPPL = new dcPPLAudit();

    protected void Page_Load(object sender, EventArgs e)
    {

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
    #region Page1
    public void BindData1(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Act129II_Invoice_1(JobNum);
            if (dt.Rows.Count > 0)
            {

                StrUserName = Convert.ToString(dt.Rows[0]["FullName"]);
                txt_Line1_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line1Quantity"]);
                txt_Line2_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line2Quantity"]);
                txt_Line3_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line3Quantity"]);
                txt_Line4_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line4Quantity"]);
                txt_Line5_Old_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line5Quantity"]);
                txt_Line5_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line5Quantity"]);
                txt_Line6_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line6Quantity"]);
                txt_Line7_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line7Quantity"]);
                txt_Line8_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line8Quantity"]);
                txt_Line9_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line9Quantity"]);
                txt_Line10_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line10Quantity"]);

                txt_Line12_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line12Quantity"]);
                txt_Line13_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line13Quantity"]);
                txt_Line14_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line14Quantity"]);
                txt_Line15_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line15Quantity"]);
                txt_Line16_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line16Quantity"]);
                txt_Line17_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line17Quantity"]);


                txt_Line18_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line18Quantity"]);
                txt_Line19_Qty_Speciality_1.Text = Convert.ToString(dt.Rows[0]["Line19Quantity"]);


                txt_Line20_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line20Quantity"]);
                txt_Line21_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line21Quantity"]);
                txt_Line22_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line22Quantity"]);
                txt_Line23_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line23Quantity"]);
                txt_Line24_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line24Quantity"]);
                txt_Line25_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line25Quantity"]);
                txt_Line26_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line26Quantity"]);
                txt_Line27_Qty_1.Text = Convert.ToString(dt.Rows[0]["Line27Quantity"]);


                txt_Line1_Total_1.Text = Convert.ToString(dt.Rows[0]["Line1Total"]);
                txt_Line2_Total_1.Text = Convert.ToString(dt.Rows[0]["Line2Total"]);
                txt_Line3_Total_1.Text = Convert.ToString(dt.Rows[0]["Line3Total"]);
                txt_Line4_Total_1.Text = Convert.ToString(dt.Rows[0]["Line4Total"]);
                txt_Line5_Old_Total_1.Text = Convert.ToString(dt.Rows[0]["Line5OldTotal"]);

                txt_Line5_Total_1.Text = Convert.ToString(dt.Rows[0]["Line5Total"]);
                txt_Line6_Total_1.Text = Convert.ToString(dt.Rows[0]["Line6Total"]);
                txt_Line7_Total_1.Text = Convert.ToString(dt.Rows[0]["Line7Total"]);
                txt_Line8_Total_1.Text = Convert.ToString(dt.Rows[0]["Line8Total"]);
                txt_Line9_Total_1.Text = Convert.ToString(dt.Rows[0]["Line9Total"]);
                txt_Line10_Total_1.Text = Convert.ToString(dt.Rows[0]["Line10Total"]);

                txt_Line12_Total_1.Text = Convert.ToString(dt.Rows[0]["Line12Total"]);
                txt_Line13_Total_1.Text = Convert.ToString(dt.Rows[0]["Line13Total"]);
                txt_Line14_Total_1.Text = Convert.ToString(dt.Rows[0]["Line14Total"]);
                txt_Line15_Total_1.Text = Convert.ToString(dt.Rows[0]["Line15Total"]);
                txt_Line16_Total_1.Text = Convert.ToString(dt.Rows[0]["Line16Total"]);
                txt_Line17_Total_1.Text = Convert.ToString(dt.Rows[0]["Line17Total"]);


                txt_Line18_Total_1.Text = Convert.ToString(dt.Rows[0]["Line18Total"]);
                txt_Line19_Total_Speciality_1.Text = Convert.ToString(dt.Rows[0]["Line19Total"]);


                txt_Line20_Total_1.Text = Convert.ToString(dt.Rows[0]["Line20Total"]);
                txt_Line21_Total_1.Text = Convert.ToString(dt.Rows[0]["Line21Total"]);
                txt_Line22_Total_1.Text = Convert.ToString(dt.Rows[0]["Line22Total"]);
                txt_Line23_Total_1.Text = Convert.ToString(dt.Rows[0]["Line23Total"]);
                txt_Line24_Total_1.Text = Convert.ToString(dt.Rows[0]["Line24Total"]);
                txt_Line25_Total_1.Text = Convert.ToString(dt.Rows[0]["Line25Total"]);
                txt_Line26_Total_1.Text = Convert.ToString(dt.Rows[0]["Line26Total"]);
                txt_Line27_Total_1.Text = Convert.ToString(dt.Rows[0]["Line27Total"]);





                Finalize1 = Convert.ToString(dt.Rows[0]["Finalized"]);

                txt_Line5_Old_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line5OldCategory"]);
                txt_Line5_Old_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line5OldLIURPCode"]);
                txt_Line5_Old_MeasureDesc_1.Text = Convert.ToString(dt.Rows[0]["Line5OldMeasureDescription"]);
                txt_Line5_Old_SC_1.Text = Convert.ToString(dt.Rows[0]["Line5OldSC"]);
                txt_Line5_Old_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line5OldUnit"]);

                if (Convert.ToString(dt.Rows[0]["Line5OldLaborRate"]) == "")
                {
                    txt_Line5_Old_LaborRate_1.Text = "45/70";
                }
                else
                {
                    txt_Line5_Old_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line5OldLaborRate"]);
                }




                txt_Line5_Old_THW_1.Text = Convert.ToString(dt.Rows[0]["Line5OldTHW"]);
                txt_Line5_Old_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line5OldTMC"]);
                txt_Line5_Old_CostUnit_1.Text = Convert.ToString(dt.Rows[0]["Line5OldCostPerUnit"]);

                txt_Line10_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line10Category"]);
                txt_Line10_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line10LIURPCode"]);
                txt_Line10_MeasureDesc_1.Text = Convert.ToString(dt.Rows[0]["Line10MeasureDescription"]);
                txt_Line10_SC_1.Text = Convert.ToString(dt.Rows[0]["Line10SC"]);
                txt_Line10_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line10Unit"]);



                if (Convert.ToString(dt.Rows[0]["Line10LaborRate"]) == "")
                {
                    txt_Line10_LaborRate_1.Text = "45/70";
                }
                else
                {
                    txt_Line10_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line10LaborRate"]);
                }


                txt_Line10_THW_1.Text = Convert.ToString(dt.Rows[0]["Line10THW"]);
                txt_Line10_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line10TMC"]);
                txt_Line10_CostUnit_1.Text = Convert.ToString(dt.Rows[0]["Line10CostPerUnit"]);

                txt_Line17_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line17Category"]);
                txt_Line17_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line17LIURPCode"]);

                txt_Line17_SC_1.Text = Convert.ToString(dt.Rows[0]["Line17SC"]);
                txt_Line17_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line17Unit"]);




                if (Convert.ToString(dt.Rows[0]["Line17LaborRate"]) == "")
                {
                    txt_Line17_LaborRate_1.Text = "45/70";
                }
                else
                {
                    txt_Line17_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line17LaborRate"]);
                }


                txt_Line17_THW_1.Text = Convert.ToString(dt.Rows[0]["Line17THW"]);
                txt_Line17_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line17TMC"]);
                txt_Line17_CostUnit_1.Text = Convert.ToString(dt.Rows[0]["Line17CostPerUnit"]);


                txt_Line26_Cat_1.Text = Convert.ToString(dt.Rows[0]["Line26Category"]);
                txt_Line26_LIURP_1.Text = Convert.ToString(dt.Rows[0]["Line26LIURPCode"]);

                txt_Line26_SC_1.Text = Convert.ToString(dt.Rows[0]["Line26SC"]);
                txt_Line26_Unit_1.Text = Convert.ToString(dt.Rows[0]["Line26Unit"]);




                if (Convert.ToString(dt.Rows[0]["Line26LaborRate"]) == "")
                {
                    txt_Line26_LaborRate_1.Text = "45/70";
                }
                else
                {
                    txt_Line26_LaborRate_1.Text = Convert.ToString(dt.Rows[0]["Line26LaborRate"]);
                }


                txt_Line26_THW_1.Text = Convert.ToString(dt.Rows[0]["Line26THW"]);
                txt_Line26_TMC_1.Text = Convert.ToString(dt.Rows[0]["Line26TMC"]);
                txt_Line26_CostUnit_1.Text = Convert.ToString(dt.Rows[0]["Line26CostPerUnit"]);


            }
        }
        catch
        {
        }
    }
    #endregion

    #region Page2

    public void BindData2(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Act129II_Invoice_2(JobNum);
            if (dt.Rows.Count > 0)
            {

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
                txt_Line38_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line38Quantity"]);
                txt_Line39_Qty_2.Text = Convert.ToString(dt.Rows[0]["Line39Quantity"]);




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
                txt_Line38_Total_2.Text = Convert.ToString(dt.Rows[0]["Line38Total"]);
                txt_Line39_Total_2.Text = Convert.ToString(dt.Rows[0]["Line39Total"]);






                Finalize2 = Convert.ToString(dt.Rows[0]["Finalized"]);

                txt_Line8_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line8Category"]);
                txt_Line8_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line8LIURPCode"]);

                txt_Line8_SC_2.Text = Convert.ToString(dt.Rows[0]["Line8SC"]);
                txt_Line8_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line8Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line8LaborRate"]) == "")
                {
                    txt_Line8_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line8_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line8LaborRate"]);
                }




                txt_Line8_THW_2.Text = Convert.ToString(dt.Rows[0]["Line8THW"]);
                txt_Line8_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line8TMC"]);
                txt_Line8_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line8CostPerUnit"]);



                txt_Line9_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line9Category"]);
                txt_Line9_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line9LIURPCode"]);

                txt_Line9_SC_2.Text = Convert.ToString(dt.Rows[0]["Line9SC"]);
                txt_Line9_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line9Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line9LaborRate"]) == "")
                {
                    txt_Line9_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line9_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line9LaborRate"]);
                }




                txt_Line9_THW_2.Text = Convert.ToString(dt.Rows[0]["Line9THW"]);
                txt_Line9_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line9TMC"]);
                txt_Line9_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line9CostPerUnit"]);


                txt_Line10_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line10Category"]);
                txt_Line10_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line10LIURPCode"]);

                txt_Line10_SC_2.Text = Convert.ToString(dt.Rows[0]["Line10SC"]);
                txt_Line10_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line10Unit"]);



                if (Convert.ToString(dt.Rows[0]["Line10LaborRate"]) == "")
                {
                    txt_Line10_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line10_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line10LaborRate"]);
                }


                txt_Line10_THW_2.Text = Convert.ToString(dt.Rows[0]["Line10THW"]);
                txt_Line10_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line10TMC"]);
                txt_Line10_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line10CostPerUnit"]);

                txt_Line11_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line11Category"]);
                txt_Line11_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line11LIURPCode"]);

                txt_Line11_SC_2.Text = Convert.ToString(dt.Rows[0]["Line11SC"]);
                txt_Line11_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line11Unit"]);




                if (Convert.ToString(dt.Rows[0]["Line11LaborRate"]) == "")
                {
                    txt_Line11_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line11_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line11LaborRate"]);
                }


                txt_Line11_THW_2.Text = Convert.ToString(dt.Rows[0]["Line11THW"]);
                txt_Line11_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line11TMC"]);
                txt_Line11_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line11CostPerUnit"]);


                txt_Line12_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line12Category"]);
                txt_Line12_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line12LIURPCode"]);

                txt_Line12_SC_2.Text = Convert.ToString(dt.Rows[0]["Line12SC"]);
                txt_Line12_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line12Unit"]);




                if (Convert.ToString(dt.Rows[0]["Line12LaborRate"]) == "")
                {
                    txt_Line12_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line12_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line12LaborRate"]);
                }


                txt_Line12_THW_2.Text = Convert.ToString(dt.Rows[0]["Line12THW"]);
                txt_Line12_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line12TMC"]);
                txt_Line12_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line12CostPerUnit"]);

                txt_Line15_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line15Category"]);
                txt_Line15_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line15LIURPCode"]);
                txt_Line15_MeasureDesc_2.Text = Convert.ToString(dt.Rows[0]["Line15MeasureDescription"]);
                txt_Line15_SC_2.Text = Convert.ToString(dt.Rows[0]["Line15SC"]);
                txt_Line15_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line15Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line15LaborRate"]) == "")
                {
                    txt_Line15_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line15_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line15LaborRate"]);
                }




                txt_Line15_THW_2.Text = Convert.ToString(dt.Rows[0]["Line15THW"]);
                txt_Line15_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line15TMC"]);
                txt_Line15_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line15CostPerUnit"]);


                txt_Line16_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line16Category"]);
                txt_Line16_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line16LIURPCode"]);
                txt_Line16_MeasureDesc_2.Text = Convert.ToString(dt.Rows[0]["Line16MeasureDescription"]);
                txt_Line16_SC_2.Text = Convert.ToString(dt.Rows[0]["Line16SC"]);
                txt_Line16_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line16Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line16LaborRate"]) == "")
                {
                    txt_Line16_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line16_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line16LaborRate"]);
                }




                txt_Line16_THW_2.Text = Convert.ToString(dt.Rows[0]["Line16THW"]);
                txt_Line16_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line16TMC"]);
                txt_Line16_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line16CostPerUnit"]);


                txt_Line19_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line19Category"]);
                txt_Line19_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line19LIURPCode"]);
                txt_Line19_MeasureDesc_2.Text = Convert.ToString(dt.Rows[0]["Line19MeasureDescription"]);
                txt_Line19_SC_2.Text = Convert.ToString(dt.Rows[0]["Line19SC"]);
                txt_Line19_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line19Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line19LaborRate"]) == "")
                {
                    txt_Line19_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line19_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line19LaborRate"]);
                }




                txt_Line19_THW_2.Text = Convert.ToString(dt.Rows[0]["Line20THW"]);
                txt_Line19_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line20TMC"]);
                txt_Line19_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line20CostPerUnit"]);


                txt_Line20_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line20Category"]);
                txt_Line20_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line20LIURPCode"]);
                txt_Line20_MeasureDesc_2.Text = Convert.ToString(dt.Rows[0]["Line20MeasureDescription"]);
                txt_Line20_SC_2.Text = Convert.ToString(dt.Rows[0]["Line20SC"]);
                txt_Line20_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line20Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line20LaborRate"]) == "")
                {
                    txt_Line20_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line20_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line20LaborRate"]);
                }




                txt_Line20_THW_2.Text = Convert.ToString(dt.Rows[0]["Line20THW"]);
                txt_Line20_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line20TMC"]);
                txt_Line20_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line20CostPerUnit"]);


                txt_Line29_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line29Category"]);
                txt_Line29_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line29LIURPCode"]);
                txt_Line29_MeasureDesc_2.Text = Convert.ToString(dt.Rows[0]["Line29MeasureDescription"]);
                txt_Line29_SC_2.Text = Convert.ToString(dt.Rows[0]["Line29SC"]);
                txt_Line29_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line29Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line29LaborRate"]) == "")
                {
                    txt_Line29_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line29_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line29LaborRate"]);
                }




                txt_Line29_THW_2.Text = Convert.ToString(dt.Rows[0]["Line29THW"]);
                txt_Line29_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line29TMC"]);
                txt_Line29_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line29CostPerUnit"]);



                txt_Line30_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line30Category"]);
                txt_Line30_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line30LIURPCode"]);
                txt_Line30_MeasureDesc_2.Text = Convert.ToString(dt.Rows[0]["Line30MeasureDescription"]);
                txt_Line30_SC_2.Text = Convert.ToString(dt.Rows[0]["Line30SC"]);
                txt_Line30_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line30Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line30LaborRate"]) == "")
                {
                    txt_Line30_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line30_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line30LaborRate"]);
                }




                txt_Line30_THW_2.Text = Convert.ToString(dt.Rows[0]["Line30THW"]);
                txt_Line30_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line30TMC"]);
                txt_Line30_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line30CostPerUnit"]);



                txt_Line34_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line34Category"]);
                txt_Line34_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line34LIURPCode"]);
                txt_Line34_MeasureDesc_2.Text = Convert.ToString(dt.Rows[0]["Line34MeasureDescription"]);
                txt_Line34_SC_2.Text = Convert.ToString(dt.Rows[0]["Line34SC"]);
                txt_Line34_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line34Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line34LaborRate"]) == "")
                {
                    txt_Line34_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line34_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line34LaborRate"]);
                }




                txt_Line34_THW_2.Text = Convert.ToString(dt.Rows[0]["Line34THW"]);
                txt_Line34_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line34TMC"]);
                txt_Line34_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line34CostPerUnit"]);


                txt_Line35_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line35Category"]);
                txt_Line35_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line35LIURPCode"]);
                txt_Line35_MeasureDesc_2.Text = Convert.ToString(dt.Rows[0]["Line35MeasureDescription"]);
                txt_Line35_SC_2.Text = Convert.ToString(dt.Rows[0]["Line35SC"]);
                txt_Line35_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line35Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line35LaborRate"]) == "")
                {
                    txt_Line35_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line35_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line35LaborRate"]);
                }




                txt_Line35_THW.Text = Convert.ToString(dt.Rows[0]["Line35THW"]);
                txt_Line35_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line35TMC"]);
                txt_Line35_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line35CostPerUnit"]);

                txt_Line37_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line37Category"]);
                txt_Line37_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line37LIURPCode"]);
                txt_Line37_MeasureDesc_2.Text = Convert.ToString(dt.Rows[0]["Line37MeasureDescription"]);
                txt_Line37_SC_2.Text = Convert.ToString(dt.Rows[0]["Line37SC"]);
                txt_Line37_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line37Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line37LaborRate"]) == "")
                {
                    txt_Line37_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line37_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line37LaborRate"]);
                }




                txt_Line37_THW_2.Text = Convert.ToString(dt.Rows[0]["Line37THW"]);
                txt_Line37_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line37TMC"]);
                txt_Line37_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line37CostPerUnit"]);


                txt_Line38_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line38Category"]);
                txt_Line38_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line38LIURPCode"]);
                txt_Line38_MeasureDesc_2.Text = Convert.ToString(dt.Rows[0]["Line38MeasureDescription"]);
                txt_Line38_SC_2.Text = Convert.ToString(dt.Rows[0]["Line38SC"]);
                txt_Line38_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line38Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line38LaborRate"]) == "")
                {
                    txt_Line38_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line38_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line38LaborRate"]);
                }




                txt_Line38_THW_2.Text = Convert.ToString(dt.Rows[0]["Line38THW"]);
                txt_Line38_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line38TMC"]);
                txt_Line38_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line38CostPerUnit"]);

                txt_Line39_Cat_2.Text = Convert.ToString(dt.Rows[0]["Line39Category"]);
                txt_Line39_LIURP_2.Text = Convert.ToString(dt.Rows[0]["Line39LIURPCode"]);
                txt_Line39_MeasureDesc_2.Text = Convert.ToString(dt.Rows[0]["Line39MeasureDescription"]);
                txt_Line39_SC_2.Text = Convert.ToString(dt.Rows[0]["Line39SC"]);
                txt_Line39_Unit_2.Text = Convert.ToString(dt.Rows[0]["Line39Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line39LaborRate"]) == "")
                {
                    txt_Line39_LaborRate_2.Text = "45/70";
                }
                else
                {
                    txt_Line39_LaborRate_2.Text = Convert.ToString(dt.Rows[0]["Line39LaborRate"]);
                }




                txt_Line39_THW_2.Text = Convert.ToString(dt.Rows[0]["Line39THW"]);
                txt_Line39_TMC_2.Text = Convert.ToString(dt.Rows[0]["Line39TMC"]);
                txt_Line39_CostUnit_2.Text = Convert.ToString(dt.Rows[0]["Line39CostPerUnit"]);

            }
        }
        catch (Exception ex)
        {
        }
    }
    #endregion

    #region page3
    public void BindData3(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Act129II_Invoice_3(JobNum);
            if (dt.Rows.Count > 0)
            {

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

                txt_Line18_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line18Quantity"]);
                txt_Line19_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line19Quantity"]);
                txt_Line20_Qty_3.Text = Convert.ToString(dt.Rows[0]["Line20Quantity"]);

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

                txt_Line18_Total_3.Text = Convert.ToString(dt.Rows[0]["Line18Total"]);
                txt_Line19_Total_3.Text = Convert.ToString(dt.Rows[0]["Line19Total"]);
                txt_Line20_Total_3.Text = Convert.ToString(dt.Rows[0]["Line20Total"]);




                Finalize3 = Convert.ToString(dt.Rows[0]["Finalized"]);



                txt_Line1_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line1Category"]);
                txt_Line1_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line1LIURPCode"]);
                txt_Line1_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line1MeasureDescription"]);
                txt_Line1_SC_3.Text = Convert.ToString(dt.Rows[0]["Line1SC"]);
                txt_Line1_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line1Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line1LaborRate"]) == "")
                {
                    txt_Line1_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line1_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line1LaborRate"]);
                }

                txt_Line1_THW_3.Text = Convert.ToString(dt.Rows[0]["Line1THW"]);
                txt_Line1_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line1TMC"]);
                //txt_Line12_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line12CostPerUnit"]);


                txt_Line2_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line2Category"]);
                txt_Line2_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line2LIURPCode"]);
                txt_Line2_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line2MeasureDescription"]);
                txt_Line2_SC_3.Text = Convert.ToString(dt.Rows[0]["Line2SC"]);
                txt_Line2_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line2Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line2LaborRate"]) == "")
                {
                    txt_Line2_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line2_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line2LaborRate"]);
                }


                txt_Line2_THW_3.Text = Convert.ToString(dt.Rows[0]["Line2THW"]);
                txt_Line2_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line2TMC"]);
                //txt_Line13_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line13CostPerUnit"]); 

                txt_Line3_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line3Category"]);
                txt_Line3_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line3LIURPCode"]);
                txt_Line3_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line3MeasureDescription"]);
                txt_Line3_SC_3.Text = Convert.ToString(dt.Rows[0]["Line3SC"]);
                txt_Line3_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line3Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line3LaborRate"]) == "")
                {
                    txt_Line3_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line3_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line3LaborRate"]);
                }

                txt_Line3_THW_3.Text = Convert.ToString(dt.Rows[0]["Line3THW"]);
                txt_Line3_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line3TMC"]);
                //txt_Line16_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line16CostPerUnit"]); 

                txt_Line4_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line4Category"]);
                txt_Line4_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line4LIURPCode"]);
                txt_Line4_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line4MeasureDescription"]);
                txt_Line4_SC_3.Text = Convert.ToString(dt.Rows[0]["Line4SC"]);
                txt_Line4_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line4Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line4LaborRate"]) == "")
                {
                    txt_Line4_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line4_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line4LaborRate"]);
                }


                txt_Line4_THW_3.Text = Convert.ToString(dt.Rows[0]["Line4THW"]);
                txt_Line4_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line4TMC"]);




                txt_Line5_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line5Category"]);
                txt_Line5_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line5LIURPCode"]);
                txt_Line5_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line5MeasureDescription"]);
                txt_Line5_SC_3.Text = Convert.ToString(dt.Rows[0]["Line5SC"]);
                txt_Line5_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line5Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line5LaborRate"]) == "")
                {
                    txt_Line5_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line5_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line5LaborRate"]);
                }


                txt_Line5_THW_3.Text = Convert.ToString(dt.Rows[0]["Line5THW"]);
                txt_Line5_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line5TMC"]);


                txt_Line6_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line6Category"]);
                txt_Line6_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line6LIURPCode"]);
                txt_Line6_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line6MeasureDescription"]);
                txt_Line6_SC_3.Text = Convert.ToString(dt.Rows[0]["Line6SC"]);
                txt_Line6_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line6Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line6LaborRate"]) == "")
                {
                    txt_Line6_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line6_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line6LaborRate"]);
                }


                txt_Line6_THW_3.Text = Convert.ToString(dt.Rows[0]["Line6THW"]);
                txt_Line6_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line6TMC"]);


                txt_Line7_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line7Category"]);
                txt_Line7_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line7LIURPCode"]);
                txt_Line7_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line7MeasureDescription"]);
                txt_Line7_SC_3.Text = Convert.ToString(dt.Rows[0]["Line7SC"]);
                txt_Line7_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line7Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line7LaborRate"]) == "")
                {
                    txt_Line7_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line7_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line7LaborRate"]);
                }


                txt_Line7_THW_3.Text = Convert.ToString(dt.Rows[0]["Line7THW"]);
                txt_Line7_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line7TMC"]);


                txt_Line8_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line8Category"]);
                txt_Line8_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line8LIURPCode"]);
                txt_Line8_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line8MeasureDescription"]);
                txt_Line8_SC_3.Text = Convert.ToString(dt.Rows[0]["Line8SC"]);
                txt_Line8_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line8Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line8LaborRate"]) == "")
                {
                    txt_Line8_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line8_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line8LaborRate"]);
                }


                txt_Line8_THW_3.Text = Convert.ToString(dt.Rows[0]["Line8THW"]);
                txt_Line8_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line8TMC"]);


                txt_Line9_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line9Category"]);
                txt_Line9_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line9LIURPCode"]);
                txt_Line9_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line9MeasureDescription"]);
                txt_Line9_SC_3.Text = Convert.ToString(dt.Rows[0]["Line9SC"]);
                txt_Line9_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line9Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line9LaborRate"]) == "")
                {
                    txt_Line9_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line9_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line9LaborRate"]);
                }


                txt_Line9_THW_3.Text = Convert.ToString(dt.Rows[0]["Line9THW"]);
                txt_Line9_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line9TMC"]);


                txt_Line10_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line10Category"]);
                txt_Line10_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line10LIURPCode"]);
                txt_Line10_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line10MeasureDescription"]);
                txt_Line10_SC_3.Text = Convert.ToString(dt.Rows[0]["Line10SC"]);
                txt_Line10_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line10Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line10LaborRate"]) == "")
                {
                    txt_Line10_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line10_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line10LaborRate"]);
                }


                txt_Line10_THW_3.Text = Convert.ToString(dt.Rows[0]["Line10THW"]);
                txt_Line10_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line10TMC"]);

                txt_Line11_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line11Category"]);
                txt_Line11_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line11LIURPCode"]);
                txt_Line11_MeasureDesc_3.Text = Convert.ToString(dt.Rows[0]["Line11MeasureDescription"]);
                txt_Line11_SC_3.Text = Convert.ToString(dt.Rows[0]["Line11SC"]);
                txt_Line11_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line11Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line11LaborRate"]) == "")
                {
                    txt_Line11_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line11_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line11LaborRate"]);
                }


                txt_Line11_THW_3.Text = Convert.ToString(dt.Rows[0]["Line11THW"]);
                txt_Line11_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line11TMC"]);

                //txt_Line17_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line17CostPerUnit"]); 

                txt_Line18_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line18Category"]);
                txt_Line18_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line18LIURPCode"]);

                //txt_Line18_SC_3.Text = Convert.ToString(dt.Rows[0]["Line18SC"]);
                txt_Line18_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line18Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line18LaborRate"]) == "")
                {
                    txt_Line18_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line18_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line18LaborRate"]);
                }

                txt_Line18_THW_3.Text = Convert.ToString(dt.Rows[0]["Line18THW"]);
                txt_Line18_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line18TMC"]);
                //txt_Line18_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line18CostPerUnit"]); 

                txt_Line19_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line19Category"]);
                txt_Line19_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line19LIURPCode"]);

                //txt_Line19_SC_3.Text = Convert.ToString(dt.Rows[0]["Line19SC"]);
                txt_Line19_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line19Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line19LaborRate"]) == "")
                {
                    txt_Line19_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line19_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line19LaborRate"]);
                }

                txt_Line19_THW_3.Text = Convert.ToString(dt.Rows[0]["Line19THW"]);
                txt_Line19_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line19TMC"]);
                //txt_Line19_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line19CostPerUnit"]); 

                txt_Line20_Cat_3.Text = Convert.ToString(dt.Rows[0]["Line20Category"]);
                txt_Line20_LIURP_3.Text = Convert.ToString(dt.Rows[0]["Line20LIURPCode"]);

                //txt_Line20_SC_3.Text = Convert.ToString(dt.Rows[0]["Line20SC"]);
                txt_Line20_Unit_3.Text = Convert.ToString(dt.Rows[0]["Line20Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line20LaborRate"]) == "")
                {
                    txt_Line20_LaborRate_3.Text = "45/70";
                }
                else
                {
                    txt_Line20_LaborRate_3.Text = Convert.ToString(dt.Rows[0]["Line20LaborRate"]);
                }

                txt_Line20_THW_3.Text = Convert.ToString(dt.Rows[0]["Line20THW"]);
                txt_Line20_TMC_3.Text = Convert.ToString(dt.Rows[0]["Line20TMC"]);
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
    #endregion
}
