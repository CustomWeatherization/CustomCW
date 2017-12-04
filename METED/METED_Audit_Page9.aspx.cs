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

public partial class METED_METED_Audit_Page9 : System.Web.UI.Page
{
    METEDAudit obj_MetedAudit = new METEDAudit();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Jobs"] != null)
                {
                    if (Request.QueryString["Jobs"].ToString() != "")
                    {
                        fill_form();
                    }
                }
            }
        }
        catch
        {
        }
        if (Convert.ToString(Session["finalize"]) == "F")
        {
            btnUpdate.Visible = false;
            spnFinal.InnerHtml = "Audit Finalize";
        }
    }
    public void fill_form()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_9(JobNum);
            if (dt.Rows.Count > 0)
            {
                string WaterHeaterHPWH = Convert.ToString(dt.Rows[0]["WaterHeaterHPWH"]);
                if (WaterHeaterHPWH == "Y")
                {
                    rdo_WaterHeaterHPWH_Yes.Checked = true;
                }
                else if (WaterHeaterHPWH == "N")
                {
                    rdo_WaterHeaterHPWH_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////

                string Homeowners = Convert.ToString(dt.Rows[0]["Homeowners"]);
                if (Homeowners == "Y")
                {
                    rdo_Homeowners_Yes.Checked = true;
                }
                else if (Homeowners == "N")
                {
                    rdo_Homeowners_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////

                string LessThenSix = Convert.ToString(dt.Rows[0]["LessThenSix"]);
                if (LessThenSix == "Y")
                {
                    rdo_LessThenSix_Yes.Checked = true;
                }
                else if (LessThenSix == "N")
                {
                    rdo_LessThenSix_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////

                string NoDirtFloor = Convert.ToString(dt.Rows[0]["NoDirtFloor"]);
                if (NoDirtFloor == "Y")
                {
                    rdo_NoDirtFloor_Yes.Checked = true;
                }
                else if (NoDirtFloor == "N")
                {
                    rdo_NoDirtFloor_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////
                string ReplaceTheFilter = Convert.ToString(dt.Rows[0]["ReplaceTheFilter"]);
                if (ReplaceTheFilter == "Y")
                {
                    rdo_ReplaceTheFilter_Yes.Checked = true;
                }
                else if (ReplaceTheFilter == "N")
                {
                    rdo_ReplaceTheFilter_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////
                string StairsAlongRailing = Convert.ToString(dt.Rows[0]["StairsAlongRailing"]);
                if (StairsAlongRailing == "Y")
                {
                    rdo_StairsAlongRailing_Yes.Checked = true;
                }
                else if (StairsAlongRailing == "N")
                {
                    rdo_StairsAlongRailing_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////
                string ExistingDrain = Convert.ToString(dt.Rows[0]["ExistingDrain"]);
                if (ExistingDrain == "Y")
                {
                    rdo_ExistingDrain_Yes.Checked = true;
                }
                else if (ExistingDrain == "N")
                {
                    rdo_ExistingDrain_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////
                string GoodShape = Convert.ToString(dt.Rows[0]["GoodShape"]);
                if (GoodShape == "Y")
                {
                    rdo_GoodShape_Yes.Checked = true;
                }
                else if (GoodShape == "N")
                {
                    rdo_GoodShape_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////

                string UsageHabits = Convert.ToString(dt.Rows[0]["UsageHabits"]);

                if (UsageHabits == "Y")
                {
                    rdo_UsageHabits_Yes.Checked = true;
                }
                else if (UsageHabits == "N")
                {
                    rdo_UsageHabits_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////
                string AssociatedWithHPWH = Convert.ToString(dt.Rows[0]["AssociatedWithHPWH"]);
                if (AssociatedWithHPWH == "Y")
                {
                    rdo_AssociatedWithHPWH_Yes.Checked = true;
                }
                else if (AssociatedWithHPWH == "N")
                {
                    rdo_AssociatedWithHPWH_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////

                string CleanHPWHFilter = Convert.ToString(dt.Rows[0]["CleanHPWHFilter"]);

                if (CleanHPWHFilter == "Y")
                {
                    rdo_CleanHPWHFilter_Yes.Checked = true;
                }
                else if (CleanHPWHFilter == "N")
                {
                    rdo_CleanHPWHFilter_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////
                string HPWHBeInstalled = Convert.ToString(dt.Rows[0]["HPWHBeInstalled"]);

                if (HPWHBeInstalled == "Y")
                {
                    rdo_HPWHBeInstalled_Yes.Checked = true;
                }
                else if (HPWHBeInstalled == "N")
                {
                    rdo_HPWHBeInstalled_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////
                string HPWHsize = Convert.ToString(dt.Rows[0]["HPWHsize"]);

                if (HPWHsize == "Y")
                {
                    rdo_HPWHsize.Checked = true;
                }
                else
                {
                    rdo_HPWHsize.Checked = false;
                }

                ////////////////////////////////////////////////////////////////////
                txt_Comment.Text = Convert.ToString(dt.Rows[0]["Comment"]);
                txt_Signature.Text = Convert.ToString(dt.Rows[0]["Signature"]);
                txt_Date.Text = Convert.ToString(dt.Rows[0]["Date"]);
            }
        }
        catch
        {
        }
    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../DisplayJobSearchRecords.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Request.QueryString["Jobs"].ToString() + "&Utility=" + Request.QueryString["Utility"].ToString());
        }
        catch
        {
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int i = 0;

            string WaterHeaterHPWH = "";
            if (rdo_WaterHeaterHPWH_Yes.Checked == true)
            {
                WaterHeaterHPWH = "Y";
            }
            else if (rdo_WaterHeaterHPWH_No.Checked == true)
            {
                WaterHeaterHPWH = "N";
            }

            ////////////////////////////////////////////////////////////////////

            string Homeowners = "";
            if (rdo_Homeowners_Yes.Checked == true)
            {
                Homeowners = "Y";
            }
            else if (rdo_Homeowners_No.Checked == true)
            {
                Homeowners = "N";
            }

            ////////////////////////////////////////////////////////////////////

            string LessThenSix = "";
            if (rdo_LessThenSix_Yes.Checked == true)
            {
                LessThenSix = "Y";
            }
            else if (rdo_LessThenSix_No.Checked == true)
            {
                LessThenSix = "N";
            }

            ////////////////////////////////////////////////////////////////////

            string NoDirtFloor = "";
            if (rdo_NoDirtFloor_Yes.Checked == true)
            {
                NoDirtFloor = "Y";
            }
            else if (rdo_NoDirtFloor_No.Checked == true)
            {
                NoDirtFloor = "N";
            }

            ////////////////////////////////////////////////////////////////////
            string ReplaceTheFilter = "";
            if (rdo_ReplaceTheFilter_Yes.Checked == true)
            {
                ReplaceTheFilter = "Y";
            }
            else if (rdo_ReplaceTheFilter_No.Checked == true)
            {
                ReplaceTheFilter = "N";
            }

            ////////////////////////////////////////////////////////////////////
            string StairsAlongRailing = "";
            if (rdo_StairsAlongRailing_Yes.Checked == true)
            {
                StairsAlongRailing = "Y";
            }
            else if (rdo_StairsAlongRailing_No.Checked == true)
            {
                StairsAlongRailing = "N";
            }

            ////////////////////////////////////////////////////////////////////
            string ExistingDrain = "";
            if (rdo_ExistingDrain_Yes.Checked == true)
            {
                ExistingDrain = "Y";
            }
            else if (rdo_ExistingDrain_No.Checked == true)
            {
                ExistingDrain = "N";
            }

            ////////////////////////////////////////////////////////////////////
            string GoodShape = "";
            if (rdo_GoodShape_Yes.Checked == true)
            {
                GoodShape = "Y";
            }
            else if (rdo_GoodShape_No.Checked == true)
            {
                GoodShape = "N";
            }

            ////////////////////////////////////////////////////////////////////

            string UsageHabits = "";

            if (rdo_UsageHabits_Yes.Checked == true)
            {
                UsageHabits = "Y";
            }
            else if (rdo_UsageHabits_No.Checked == true)
            {
                UsageHabits = "N";
            }

            ////////////////////////////////////////////////////////////////////
            string AssociatedWithHPWH = "";
            if (rdo_AssociatedWithHPWH_Yes.Checked == true)
            {
                AssociatedWithHPWH = "Y";
            }
            else if (rdo_AssociatedWithHPWH_No.Checked == true)
            {
                AssociatedWithHPWH = "N";
            }

            ////////////////////////////////////////////////////////////////////

            string CleanHPWHFilter = "";

            if (rdo_CleanHPWHFilter_Yes.Checked == true)
            {
                CleanHPWHFilter = "Y";
            }
            else if (rdo_CleanHPWHFilter_No.Checked == true)
            {
                CleanHPWHFilter = "N";
            }

            ////////////////////////////////////////////////////////////////////
            string HPWHBeInstalled = "";

            if (rdo_HPWHBeInstalled_Yes.Checked == true)
            {
                HPWHBeInstalled = "Y";
            }
            else if (rdo_HPWHBeInstalled_No.Checked == true)
            {
                HPWHBeInstalled = "N";
            }

            ////////////////////////////////////////////////////////////////////
            string HPWHsize = "";

            if (rdo_HPWHsize.Checked == true)
            {
                HPWHsize = "Y";
            }


            ////////////////////////////////////////////////////////////////////

            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_9(JobNum, WaterHeaterHPWH, Homeowners, LessThenSix, NoDirtFloor, ReplaceTheFilter, StairsAlongRailing, ExistingDrain, GoodShape, UsageHabits, AssociatedWithHPWH, CleanHPWHFilter, HPWHBeInstalled, HPWHsize, txt_Comment.Text, txt_Signature.Text, txt_Date.Text);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }
}
