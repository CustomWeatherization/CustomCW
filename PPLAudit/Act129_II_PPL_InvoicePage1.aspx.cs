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

public partial class PPLAudit_Act129_II_PPL_InvoicePage1 : System.Web.UI.Page
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

    public void BindData(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_Act129II_Invoice_1(JobNum);
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
                    txt_Line5_Old_Qty.Enabled = false;
                    txt_Line5_Qty.Enabled = false;
                    txt_Line6_Qty.Enabled = false;
                    txt_Line7_Qty.Enabled = false;
                    txt_Line8_Qty.Enabled = false;
                    txt_Line9_Qty.Enabled = false;
                    txt_Line10_Qty.Enabled = false;

                    txt_Line12_Qty.Enabled = false;
                    txt_Line13_Qty.Enabled = false;
                    txt_Line14_Qty.Enabled = false;
                    txt_Line15_Qty.Enabled = false;
                    txt_Line16_Qty.Enabled = false;
                    txt_Line17_Qty.Enabled = false;
                    txt_Line18_Qty.Enabled = false;
                    txt_Line19_Qty_Speciality.Enabled = false;
                    txt_Line20_Qty.Enabled = false;
                    txt_Line21_Qty.Enabled = false;
                    txt_Line22_Qty.Enabled = false;
                    txt_Line23_Qty.Enabled = false;
                    txt_Line24_Qty.Enabled = false;
                    txt_Line25_Qty.Enabled = false;
                    txt_Line26_Qty.Enabled = false;
                    txt_Line27_Qty.Enabled = false;
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
                txt_Line5_Old_Qty.Text = Convert.ToString(dt.Rows[0]["Line5Quantity"]);
                txt_Line5_Qty.Text = Convert.ToString(dt.Rows[0]["Line5Quantity"]);
                txt_Line6_Qty.Text = Convert.ToString(dt.Rows[0]["Line6Quantity"]);
                txt_Line7_Qty.Text = Convert.ToString(dt.Rows[0]["Line7Quantity"]);
                txt_Line8_Qty.Text = Convert.ToString(dt.Rows[0]["Line8Quantity"]);
                txt_Line9_Qty.Text = Convert.ToString(dt.Rows[0]["Line9Quantity"]);
                txt_Line10_Qty.Text = Convert.ToString(dt.Rows[0]["Line10Quantity"]);

                txt_Line12_Qty.Text = Convert.ToString(dt.Rows[0]["Line12Quantity"]);
                txt_Line13_Qty.Text = Convert.ToString(dt.Rows[0]["Line13Quantity"]);
                txt_Line14_Qty.Text = Convert.ToString(dt.Rows[0]["Line14Quantity"]);
                txt_Line15_Qty.Text = Convert.ToString(dt.Rows[0]["Line15Quantity"]);
                txt_Line16_Qty.Text = Convert.ToString(dt.Rows[0]["Line16Quantity"]);
                txt_Line17_Qty.Text = Convert.ToString(dt.Rows[0]["Line17Quantity"]);


                txt_Line18_Qty.Text = Convert.ToString(dt.Rows[0]["Line18Quantity"]);
                txt_Line19_Qty_Speciality.Text = Convert.ToString(dt.Rows[0]["Line19Quantity"]);


                txt_Line20_Qty.Text = Convert.ToString(dt.Rows[0]["Line20Quantity"]);
                txt_Line21_Qty.Text = Convert.ToString(dt.Rows[0]["Line21Quantity"]);
                txt_Line22_Qty.Text = Convert.ToString(dt.Rows[0]["Line22Quantity"]);
                txt_Line23_Qty.Text = Convert.ToString(dt.Rows[0]["Line23Quantity"]);
                txt_Line24_Qty.Text = Convert.ToString(dt.Rows[0]["Line24Quantity"]);
                txt_Line25_Qty.Text = Convert.ToString(dt.Rows[0]["Line25Quantity"]);
                txt_Line26_Qty.Text = Convert.ToString(dt.Rows[0]["Line26Quantity"]);
                txt_Line27_Qty.Text = Convert.ToString(dt.Rows[0]["Line27Quantity"]);


                txt_Line1_Total.Text = Convert.ToString(dt.Rows[0]["Line1Total"]);
                txt_Line2_Total.Text = Convert.ToString(dt.Rows[0]["Line2Total"]);
                txt_Line3_Total.Text = Convert.ToString(dt.Rows[0]["Line3Total"]);
                txt_Line4_Total.Text = Convert.ToString(dt.Rows[0]["Line4Total"]);
                txt_Line5_Old_Total.Text = Convert.ToString(dt.Rows[0]["Line5OldTotal"]);

                txt_Line5_Total.Text = Convert.ToString(dt.Rows[0]["Line5Total"]);
                txt_Line6_Total.Text = Convert.ToString(dt.Rows[0]["Line6Total"]);
                txt_Line7_Total.Text = Convert.ToString(dt.Rows[0]["Line7Total"]);
                txt_Line8_Total.Text = Convert.ToString(dt.Rows[0]["Line8Total"]);
                txt_Line9_Total.Text = Convert.ToString(dt.Rows[0]["Line9Total"]);
                txt_Line10_Total.Text = Convert.ToString(dt.Rows[0]["Line10Total"]);

                txt_Line12_Total.Text = Convert.ToString(dt.Rows[0]["Line12Total"]);
                txt_Line13_Total.Text = Convert.ToString(dt.Rows[0]["Line13Total"]);
                txt_Line14_Total.Text = Convert.ToString(dt.Rows[0]["Line14Total"]);
                txt_Line15_Total.Text = Convert.ToString(dt.Rows[0]["Line15Total"]);
                txt_Line16_Total.Text = Convert.ToString(dt.Rows[0]["Line16Total"]);
                txt_Line17_Total.Text = Convert.ToString(dt.Rows[0]["Line17Total"]);


                txt_Line18_Total.Text = Convert.ToString(dt.Rows[0]["Line18Total"]);
                txt_Line19_Total_Speciality.Text = Convert.ToString(dt.Rows[0]["Line19Total"]);


                txt_Line20_Total.Text = Convert.ToString(dt.Rows[0]["Line20Total"]);
                txt_Line21_Total.Text = Convert.ToString(dt.Rows[0]["Line21Total"]);
                txt_Line22_Total.Text = Convert.ToString(dt.Rows[0]["Line22Total"]);
                txt_Line23_Total.Text = Convert.ToString(dt.Rows[0]["Line23Total"]);
                txt_Line24_Total.Text = Convert.ToString(dt.Rows[0]["Line24Total"]);
                txt_Line25_Total.Text = Convert.ToString(dt.Rows[0]["Line25Total"]);
                txt_Line26_Total.Text = Convert.ToString(dt.Rows[0]["Line26Total"]);
                txt_Line27_Total.Text = Convert.ToString(dt.Rows[0]["Line27Total"]);




                hdn_Line1_Total.Value = Convert.ToString(dt.Rows[0]["Line1Total"]);
                hdn_Line2_Total.Value = Convert.ToString(dt.Rows[0]["Line2Total"]);
                hdn_Line3_Total.Value = Convert.ToString(dt.Rows[0]["Line3Total"]);
                hdn_Line4_Total.Value = Convert.ToString(dt.Rows[0]["Line4Total"]);
                hdn_Line5_Old_Total.Value = Convert.ToString(dt.Rows[0]["Line5OldTotal"]);
                hdn_Line5_Total.Value = Convert.ToString(dt.Rows[0]["Line5Total"]);
                hdn_Line6_Total.Value = Convert.ToString(dt.Rows[0]["Line6Total"]);
                hdn_Line7_Total.Value = Convert.ToString(dt.Rows[0]["Line7Total"]);
                hdn_Line8_Total.Value = Convert.ToString(dt.Rows[0]["Line8Total"]);
                hdn_Line9_Total.Value = Convert.ToString(dt.Rows[0]["Line9Total"]);
                hdn_Line10_Total.Value = Convert.ToString(dt.Rows[0]["Line10Total"]);

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


                hdn_Finalize.Value = Convert.ToString(dt.Rows[0]["Finalized"]);

                txt_Line5_Old_Cat.Text = Convert.ToString(dt.Rows[0]["Line5OldCategory"]);
                txt_Line5_Old_LIURP.Text = Convert.ToString(dt.Rows[0]["Line5OldLIURPCode"]);
                txt_Line5_Old_MeasureDesc.Text = Convert.ToString(dt.Rows[0]["Line5OldMeasureDescription"]);
                txt_Line5_Old_SC.Text = Convert.ToString(dt.Rows[0]["Line5OldSC"]);
                txt_Line5_Old_Unit.Text = Convert.ToString(dt.Rows[0]["Line5OldUnit"]);

                if (Convert.ToString(dt.Rows[0]["Line5OldLaborRate"]) == "")
                {
                    txt_Line5_Old_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line5_Old_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line5OldLaborRate"]);
                }




                txt_Line5_Old_THW.Text = Convert.ToString(dt.Rows[0]["Line5OldTHW"]);
                txt_Line5_Old_TMC.Text = Convert.ToString(dt.Rows[0]["Line5OldTMC"]);
                txt_Line5_Old_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line5OldCostPerUnit"]);

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
                txt_Line10_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line10CostPerUnit"]);

                txt_Line17_Cat.Text = Convert.ToString(dt.Rows[0]["Line17Category"]);
                txt_Line17_LIURP.Text = Convert.ToString(dt.Rows[0]["Line17LIURPCode"]);

                txt_Line17_SC.Text = Convert.ToString(dt.Rows[0]["Line17SC"]);
                txt_Line17_Unit.Text = Convert.ToString(dt.Rows[0]["Line17Unit"]);




                if (Convert.ToString(dt.Rows[0]["Line17LaborRate"]) == "")
                {
                    txt_Line17_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line17_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line17LaborRate"]);
                }


                txt_Line17_THW.Text = Convert.ToString(dt.Rows[0]["Line17THW"]);
                txt_Line17_TMC.Text = Convert.ToString(dt.Rows[0]["Line17TMC"]);
                txt_Line17_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line17CostPerUnit"]);


                txt_Line26_Cat.Text = Convert.ToString(dt.Rows[0]["Line26Category"]);
                txt_Line26_LIURP.Text = Convert.ToString(dt.Rows[0]["Line26LIURPCode"]);

                txt_Line26_SC.Text = Convert.ToString(dt.Rows[0]["Line26SC"]);
                txt_Line26_Unit.Text = Convert.ToString(dt.Rows[0]["Line26Unit"]);




                if (Convert.ToString(dt.Rows[0]["Line26LaborRate"]) == "")
                {
                    txt_Line26_LaborRate.Text = "45/70";
                }
                else
                {
                    txt_Line26_LaborRate.Text = Convert.ToString(dt.Rows[0]["Line26LaborRate"]);
                }


                txt_Line26_THW.Text = Convert.ToString(dt.Rows[0]["Line26THW"]);
                txt_Line26_TMC.Text = Convert.ToString(dt.Rows[0]["Line26TMC"]);
                txt_Line26_CostUnit.Text = Convert.ToString(dt.Rows[0]["Line26CostPerUnit"]);


            }
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
            j = ObjPPL.UpdatePPLAudit_Act129II_Invoice_1(JobNum, txt_Line1_Qty.Text, txt_Line2_Qty.Text, txt_Line3_Qty.Text, txt_Line4_Qty.Text, txt_Line5_Old_Qty.Text, txt_Line5_Qty.Text, txt_Line6_Qty.Text, txt_Line7_Qty.Text, txt_Line8_Qty.Text, txt_Line9_Qty.Text, txt_Line10_Qty.Text, txt_Line12_Qty.Text, txt_Line13_Qty.Text, txt_Line14_Qty.Text, txt_Line15_Qty.Text, txt_Line16_Qty.Text, txt_Line17_Qty.Text, txt_Line18_Qty.Text, txt_Line19_Qty_Speciality.Text, txt_Line20_Qty.Text, txt_Line21_Qty.Text, txt_Line22_Qty.Text, txt_Line23_Qty.Text, txt_Line24_Qty.Text, txt_Line25_Qty.Text, txt_Line26_Qty.Text, txt_Line27_Qty.Text, hdn_Line1_Total.Value, hdn_Line2_Total.Value, hdn_Line3_Total.Value, hdn_Line4_Total.Value, hdn_Line5_Old_Total.Value, hdn_Line5_Total.Value, hdn_Line6_Total.Value, hdn_Line7_Total.Value, hdn_Line8_Total.Value, hdn_Line9_Total.Value, hdn_Line10_Total.Value, hdn_Line12_Total.Value, hdn_Line13_Total.Value, hdn_Line14_Total.Value, hdn_Line15_Total.Value, hdn_Line16_Total.Value, hdn_Line17_Total.Value, hdn_Line18_Total.Value, hdn_Line19_Total.Value, hdn_Line20_Total.Value, hdn_Line21_Total.Value, hdn_Line22_Total.Value, hdn_Line23_Total.Value, hdn_Line24_Total.Value, hdn_Line25_Total.Value, hdn_Line26_Total.Value, hdn_Line27_Total.Value, txt_Line5_Old_Cat.Text, txt_Line5_Old_LIURP.Text, txt_Line5_Old_MeasureDesc.Text, txt_Line5_Old_SC.Text, txt_Line5_Old_Unit.Text, txt_Line5_Old_LaborRate.Text, txt_Line5_Old_THW.Text, txt_Line5_Old_TMC.Text, txt_Line5_Old_CostUnit.Text, txt_Line10_Cat.Text, txt_Line10_LIURP.Text, txt_Line10_MeasureDesc.Text, txt_Line10_SC.Text, txt_Line10_Unit.Text, txt_Line10_LaborRate.Text, txt_Line10_THW.Text, txt_Line10_TMC.Text, txt_Line10_CostUnit.Text, txt_Line17_Cat.Text, txt_Line17_LIURP.Text, txt_Line17_SC.Text, txt_Line17_Unit.Text, txt_Line17_LaborRate.Text, txt_Line17_THW.Text, txt_Line17_TMC.Text, txt_Line17_CostUnit.Text, txt_Line26_Cat.Text, txt_Line26_LIURP.Text, txt_Line26_SC.Text, txt_Line26_Unit.Text, txt_Line26_LaborRate.Text, txt_Line26_THW.Text, txt_Line26_TMC.Text, txt_Line26_CostUnit.Text, hdn_Finalize.Value);
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
            j = ObjPPL.UpdatePPLAudit_Act129II_Invoice_1(JobNum, txt_Line1_Qty.Text, txt_Line2_Qty.Text, txt_Line3_Qty.Text, txt_Line4_Qty.Text, txt_Line5_Old_Qty.Text, txt_Line5_Qty.Text, txt_Line6_Qty.Text, txt_Line7_Qty.Text, txt_Line8_Qty.Text, txt_Line9_Qty.Text, txt_Line10_Qty.Text, txt_Line12_Qty.Text, txt_Line13_Qty.Text, txt_Line14_Qty.Text, txt_Line15_Qty.Text, txt_Line16_Qty.Text, txt_Line17_Qty.Text, txt_Line18_Qty.Text, txt_Line19_Qty_Speciality.Text, txt_Line20_Qty.Text, txt_Line21_Qty.Text, txt_Line22_Qty.Text, txt_Line23_Qty.Text, txt_Line24_Qty.Text, txt_Line25_Qty.Text, txt_Line26_Qty.Text, txt_Line27_Qty.Text, hdn_Line1_Total.Value, hdn_Line2_Total.Value, hdn_Line3_Total.Value, hdn_Line4_Total.Value, hdn_Line5_Old_Total.Value, hdn_Line5_Total.Value, hdn_Line6_Total.Value, hdn_Line7_Total.Value, hdn_Line8_Total.Value, hdn_Line9_Total.Value, hdn_Line10_Total.Value, hdn_Line12_Total.Value, hdn_Line13_Total.Value, hdn_Line14_Total.Value, hdn_Line15_Total.Value, hdn_Line16_Total.Value, hdn_Line17_Total.Value, hdn_Line18_Total.Value, hdn_Line19_Total.Value, hdn_Line20_Total.Value, hdn_Line21_Total.Value, hdn_Line22_Total.Value, hdn_Line23_Total.Value, hdn_Line24_Total.Value, hdn_Line25_Total.Value, hdn_Line26_Total.Value, hdn_Line27_Total.Value, txt_Line5_Old_Cat.Text, txt_Line5_Old_LIURP.Text, txt_Line5_Old_MeasureDesc.Text, txt_Line5_Old_SC.Text, txt_Line5_Old_Unit.Text, txt_Line5_Old_LaborRate.Text, txt_Line5_Old_THW.Text, txt_Line5_Old_TMC.Text, txt_Line5_Old_CostUnit.Text, txt_Line10_Cat.Text, txt_Line10_LIURP.Text, txt_Line10_MeasureDesc.Text, txt_Line10_SC.Text, txt_Line10_Unit.Text, txt_Line10_LaborRate.Text, txt_Line10_THW.Text, txt_Line10_TMC.Text, txt_Line10_CostUnit.Text, txt_Line17_Cat.Text, txt_Line17_LIURP.Text, txt_Line17_SC.Text, txt_Line17_Unit.Text, txt_Line17_LaborRate.Text, txt_Line17_THW.Text, txt_Line17_TMC.Text, txt_Line17_CostUnit.Text, txt_Line26_Cat.Text, txt_Line26_LIURP.Text, txt_Line26_SC.Text, txt_Line26_Unit.Text, txt_Line26_LaborRate.Text, txt_Line26_THW.Text, txt_Line26_TMC.Text, txt_Line26_CostUnit.Text, "F");
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
