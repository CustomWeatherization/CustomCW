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

public partial class PPLAudit_PPL_Invoice_Page3 : System.Web.UI.Page
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


    public void BindData(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Invoice_3(JobNum);
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
                    txt_Line21_Qty.Enabled = false;
                    txt_Line22_Qty.Enabled = false;
                    txt_Line23_Qty.Enabled = false;
                    txt_Line24_Qty.Enabled = false;
                    txt_Line25_Qty.Enabled = false;
                    txt_Line26_Qty.Enabled = false;
                    txt_Line27_Qty.Enabled = false;
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
                txt_Line21_Location.Text = Convert.ToString(dt.Rows[0]["Line21Location"]);
                txt_Line22_Location.Text = Convert.ToString(dt.Rows[0]["Line22Location"]);
                txt_Line23_Location.Text = Convert.ToString(dt.Rows[0]["Line23Location"]);
                txt_Line24_Location.Text = Convert.ToString(dt.Rows[0]["Line24Location"]);
                txt_Line25_Location.Text = Convert.ToString(dt.Rows[0]["Line25Location"]);
                txt_Line26_Location.Text = Convert.ToString(dt.Rows[0]["Line26Location"]);
                txt_Line27_Location.Text = Convert.ToString(dt.Rows[0]["Line27Location"]);
                txt_Line28_Location.Text = Convert.ToString(dt.Rows[0]["Line28Location"]);
                txt_Line29_Location.Text = Convert.ToString(dt.Rows[0]["Line29Location"]);
                txt_Line30_Location.Text = Convert.ToString(dt.Rows[0]["Line30Location"]);
                txt_Line31_Location.Text = Convert.ToString(dt.Rows[0]["Line31Location"]);
                txt_Line32_Location.Text = Convert.ToString(dt.Rows[0]["Line32Location"]);
                txt_Line33_Location.Text = Convert.ToString(dt.Rows[0]["Line33Location"]);
                txt_Line34_Location.Text = Convert.ToString(dt.Rows[0]["Line34Location"]);
                txt_Line35_Location.Text = Convert.ToString(dt.Rows[0]["Line35Location"]);
                txt_Line36_Location.Text = Convert.ToString(dt.Rows[0]["Line36Location"]);
                txt_Line37_Location.Text = Convert.ToString(dt.Rows[0]["Line37Location"]);

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

                txt_Line33_Cat.Text = Convert.ToString(dt.Rows[0]["Line33Category"]);
                txt_Line33_LIURP.Text = Convert.ToString(dt.Rows[0]["Line33LIURPCode"]);
                txt_Line33_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line33MeasureDescription"]);
                txt_Line33_SC.Text = Convert.ToString(dt.Rows[0]["Line33SC"]);
                txt_Line33_Unit.Text = Convert.ToString(dt.Rows[0]["Line33Unit"]);


                if (Convert.ToString(dt.Rows[0]["Line33LaborRate"]) == "")
                {
                    txt_Line33_LaborRate.Text = "43/68";
                }
                else
                {
                    txt_Line33_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line33LaborRate"]);
                }

                txt_Line33_THW.Text = Convert.ToString(dt.Rows[0]["Line33THW"]);
                txt_Line33_TMC.Text = Convert.ToString(dt.Rows[0]["Line33TMC"]);
                //txt_Line33_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line33CostPerUnit"]);

                txt_Line34_Cat.Text = Convert.ToString(dt.Rows[0]["Line34Category"]);
                txt_Line34_LIURP.Text = Convert.ToString(dt.Rows[0]["Line34LIURPCode"]);
                txt_Line34_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line34MeasureDescription"]);
                txt_Line34_SC.Text = Convert.ToString(dt.Rows[0]["Line34SC"]);
                txt_Line34_Unit.Text = Convert.ToString(dt.Rows[0]["Line34Unit"]);

                if (Convert.ToString(dt.Rows[0]["Line34LaborRate"]) == "")
                {
                    txt_Line34_LaborRate.Text = "43/68";
                }
                else
                {
                    txt_Line34_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line34LaborRate"]);
                }

                txt_Line34_THW.Text = Convert.ToString(dt.Rows[0]["Line34THW"]);
                txt_Line34_TMC.Text = Convert.ToString(dt.Rows[0]["Line34TMC"]);
                //txt_Line34_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line34CostPerUnit"]);

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

            string str = hdn_Line2_Total.Value;
            j = ObjPPL.UpdatePPLAudit_Invoice_3(JobNum, txt_Line1_Qty.Text, txt_Line2_Qty.Text, txt_Line3_Qty.Text, txt_Line4_Qty.Text, txt_Line5_Qty.Text, txt_Line6_Qty.Text, txt_Line7_Qty.Text, txt_Line8_Qty.Text, txt_Line9_Qty.Text, txt_Line10_Qty.Text, txt_Line11_Qty.Text, txt_Line12_Qty.Text, txt_Line13_Qty.Text, txt_Line14_Qty.Text, txt_Line15_Qty.Text, txt_Line16_Qty.Text, txt_Line17_Qty.Text, txt_Line18_Qty.Text, txt_Line19_Qty.Text, txt_Line20_Qty.Text, txt_Line21_Qty.Text, txt_Line22_Qty.Text, txt_Line23_Qty.Text, txt_Line24_Qty.Text, txt_Line25_Qty.Text, txt_Line26_Qty.Text, txt_Line27_Qty.Text, txt_Line28_Qty.Text, txt_Line29_Qty.Text, txt_Line30_Qty.Text, txt_Line31_Qty.Text, txt_Line32_Qty.Text, txt_Line33_Qty.Text, txt_Line34_Qty.Text, txt_Line35_Qty.Text, txt_Line36_Qty.Text, txt_Line37_Qty.Text, hdn_Line1_Total.Value, hdn_Line2_Total.Value, hdn_Line3_Total.Value, hdn_Line4_Total.Value, hdn_Line5_Total.Value, hdn_Line6_Total.Value, hdn_Line7_Total.Value, hdn_Line8_Total.Value, hdn_Line9_Total.Value, hdn_Line10_Total.Value, hdn_Line11_Total.Value, hdn_Line12_Total.Value, hdn_Line13_Total.Value, hdn_Line14_Total.Value, hdn_Line15_Total.Value, hdn_Line16_Total.Value, hdn_Line17_Total.Value, hdn_Line17_Total.Value, hdn_Line19_Total.Value, hdn_Line20_Total.Value, hdn_Line21_Total.Value, hdn_Line22_Total.Value, hdn_Line23_Total.Value, hdn_Line24_Total.Value, hdn_Line25_Total.Value, hdn_Line26_Total.Value, hdn_Line27_Total.Value, hdn_Line28_Total.Value, hdn_Line29_Total.Value, hdn_Line30_Total.Value, hdn_Line31_Total.Value, hdn_Line32_Total.Value, hdn_Line33_Total.Value, hdn_Line34_Total.Value, hdn_Line35_Total.Value, hdn_Line36_Total.Value, hdn_Line37_Total.Value, txt_Line17_Cat.Text, txt_Line17_LIURP.Text, txt_Line17_MeasureDesc.Text, txt_Line17_SC.Text, txt_Line17_Unit.Text, txt_Line17_LaborRate.Text, txt_Line17_THW.Text, txt_Line17_TMC.Text, "", txt_Line18_Cat.Text, txt_Line18_LIURP.Text, txt_Line18_MeasureDesc.Text, txt_Line18_SC.Text, txt_Line18_Unit.Text, txt_Line18_LaborRate.Text, txt_Line18_THW.Text, txt_Line18_TMC.Text, "", txt_Line33_Cat.Text, txt_Line33_LIURP.Text, txt_Line33_MeasureDesc.Text, txt_Line33_SC.Text, txt_Line33_Unit.Text, txt_Line33_LaborRate.Text, txt_Line33_THW.Text, txt_Line33_TMC.Text, "", txt_Line34_Cat.Text, txt_Line34_LIURP.Text, txt_Line34_MeasureDesc.Text, txt_Line34_SC.Text, txt_Line34_Unit.Text, txt_Line34_LaborRate.Text, txt_Line34_THW.Text, txt_Line34_TMC.Text, "", hdn_Finalize.Value, txt_Line1_Location.Text, txt_Line2_Location.Text, txt_Line3_Location.Text, txt_Line4_Location.Text, txt_Line5_Location.Text, txt_Line6_Location.Text, txt_Line7_Location.Text, txt_Line8_Location.Text, txt_Line9_Location.Text, txt_Line10_Location.Text, txt_Line11_Location.Text, txt_Line12_Location.Text, txt_Line13_Location.Text, txt_Line14_Location.Text, txt_Line15_Location.Text, txt_Line16_Location.Text, txt_Line17_Location.Text, txt_Line18_Location.Text, txt_Line19_Location.Text, txt_Line20_Location.Text, txt_Line21_Location.Text, txt_Line22_Location.Text, txt_Line23_Location.Text, txt_Line24_Location.Text, txt_Line25_Location.Text, txt_Line26_Location.Text, txt_Line27_Location.Text, txt_Line28_Location.Text, txt_Line29_Location.Text, txt_Line30_Location.Text, txt_Line31_Location.Text, txt_Line32_Location.Text, txt_Line33_Location.Text, txt_Line34_Location.Text, txt_Line35_Location.Text, txt_Line36_Location.Text, txt_Line37_Location.Text);
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
            j = ObjPPL.UpdatePPLAudit_Invoice_3(JobNum, txt_Line1_Qty.Text, txt_Line2_Qty.Text, txt_Line3_Qty.Text, txt_Line4_Qty.Text, txt_Line5_Qty.Text, txt_Line6_Qty.Text, txt_Line7_Qty.Text, txt_Line8_Qty.Text, txt_Line9_Qty.Text, txt_Line10_Qty.Text, txt_Line11_Qty.Text, txt_Line12_Qty.Text, txt_Line13_Qty.Text, txt_Line14_Qty.Text, txt_Line15_Qty.Text, txt_Line16_Qty.Text, txt_Line17_Qty.Text, txt_Line18_Qty.Text, txt_Line19_Qty.Text, txt_Line20_Qty.Text, txt_Line21_Qty.Text, txt_Line22_Qty.Text, txt_Line23_Qty.Text, txt_Line24_Qty.Text, txt_Line25_Qty.Text, txt_Line26_Qty.Text, txt_Line27_Qty.Text, txt_Line28_Qty.Text, txt_Line29_Qty.Text, txt_Line30_Qty.Text, txt_Line31_Qty.Text, txt_Line32_Qty.Text, txt_Line33_Qty.Text, txt_Line34_Qty.Text, txt_Line35_Qty.Text, txt_Line36_Qty.Text, txt_Line37_Qty.Text, hdn_Line1_Total.Value, hdn_Line2_Total.Value, hdn_Line3_Total.Value, hdn_Line4_Total.Value, hdn_Line5_Total.Value, hdn_Line6_Total.Value, hdn_Line7_Total.Value, hdn_Line8_Total.Value, hdn_Line9_Total.Value, hdn_Line10_Total.Value, hdn_Line11_Total.Value, hdn_Line12_Total.Value, hdn_Line13_Total.Value, hdn_Line14_Total.Value, hdn_Line15_Total.Value, hdn_Line16_Total.Value, hdn_Line17_Total.Value, hdn_Line17_Total.Value, hdn_Line19_Total.Value, hdn_Line20_Total.Value, hdn_Line21_Total.Value, hdn_Line22_Total.Value, hdn_Line23_Total.Value, hdn_Line24_Total.Value, hdn_Line25_Total.Value, hdn_Line26_Total.Value, hdn_Line27_Total.Value, hdn_Line28_Total.Value, hdn_Line29_Total.Value, hdn_Line30_Total.Value, hdn_Line31_Total.Value, hdn_Line32_Total.Value, hdn_Line33_Total.Value, hdn_Line34_Total.Value, hdn_Line35_Total.Value, hdn_Line36_Total.Value, hdn_Line37_Total.Value, txt_Line17_Cat.Text, txt_Line17_LIURP.Text, txt_Line17_MeasureDesc.Text, txt_Line17_SC.Text, txt_Line17_Unit.Text, txt_Line17_LaborRate.Text, txt_Line17_THW.Text, txt_Line17_TMC.Text, "", txt_Line18_Cat.Text, txt_Line18_LIURP.Text, txt_Line18_MeasureDesc.Text, txt_Line18_SC.Text, txt_Line18_Unit.Text, txt_Line18_LaborRate.Text, txt_Line18_THW.Text, txt_Line18_TMC.Text, "", txt_Line33_Cat.Text, txt_Line33_LIURP.Text, txt_Line33_MeasureDesc.Text, txt_Line33_SC.Text, txt_Line33_Unit.Text, txt_Line33_LaborRate.Text, txt_Line33_THW.Text, txt_Line33_TMC.Text, "", txt_Line34_Cat.Text, txt_Line34_LIURP.Text, txt_Line34_MeasureDesc.Text, txt_Line34_SC.Text, txt_Line34_Unit.Text, txt_Line34_LaborRate.Text, txt_Line34_THW.Text, txt_Line34_TMC.Text, "", "F", txt_Line1_Location.Text, txt_Line2_Location.Text, txt_Line3_Location.Text, txt_Line4_Location.Text, txt_Line5_Location.Text, txt_Line6_Location.Text, txt_Line7_Location.Text, txt_Line8_Location.Text, txt_Line9_Location.Text, txt_Line10_Location.Text, txt_Line11_Location.Text, txt_Line12_Location.Text, txt_Line13_Location.Text, txt_Line14_Location.Text, txt_Line15_Location.Text, txt_Line16_Location.Text, txt_Line17_Location.Text, txt_Line18_Location.Text, txt_Line19_Location.Text, txt_Line20_Location.Text, txt_Line21_Location.Text, txt_Line22_Location.Text, txt_Line23_Location.Text, txt_Line24_Location.Text, txt_Line25_Location.Text, txt_Line26_Location.Text, txt_Line27_Location.Text, txt_Line28_Location.Text, txt_Line29_Location.Text, txt_Line30_Location.Text, txt_Line31_Location.Text, txt_Line32_Location.Text, txt_Line33_Location.Text, txt_Line34_Location.Text, txt_Line35_Location.Text, txt_Line36_Location.Text, txt_Line37_Location.Text);
            BindData(JobNum);
            Response.Write("<script>alert('This Job is Finalize');</script>");
        }
        catch
        {
        }
    }
}
