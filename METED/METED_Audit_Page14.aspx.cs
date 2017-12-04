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

public partial class METED_METED_Audit_Page14 : System.Web.UI.Page
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_14(JobNum);
            if (dt.Rows.Count > 0)
            {
                string BasementSealing = Convert.ToString(dt.Rows[0]["BasementSealing"]);
                if (BasementSealing == "P")
                {
                    chk_BasementAirSealing_Perimeter.Checked = true;
                }
                else if (BasementSealing == "C")
                {
                    chk_BasementAirSealing_Ceiling.Checked = true;
                }
                else if (BasementSealing == "D")
                {
                    chk_BasementAirSealing_Ducts.Checked = true;
                }
                else if (BasementSealing == "O")
                {
                    chk_BasementAirSealing_Other.Checked = true;
                    txt_BasementAirSealing_Other.Text = Convert.ToString(dt.Rows[0]["OtherBasementSealingComments"]);
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_FloorCrawlSpace_Location.Text = Convert.ToString(dt.Rows[0]["FloorCrawlLocation"]);
                txt_FloorCrawlSpace_SqFt.Text = Convert.ToString(dt.Rows[0]["FloorCrawlSpaceSqFt"]);
                txt_FloorCrawlSpace_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["FloorCrawlSpaceExistingRValue"]);
                txt_FloorCrawlSpace_Add_R.Text = Convert.ToString(dt.Rows[0]["FloorCrawlSpaceAddR"]);
                txt_FloorCrawlSpace_Insulation.Text = Convert.ToString(dt.Rows[0]["FloorCrawlSpaceNewInsulation"]);
                txt_FloorCrawlSpace_Comment.Text = Convert.ToString(dt.Rows[0]["FloorCrawlSpaceComments"]);

                txt_Perimeter_Location.Text = Convert.ToString(dt.Rows[0]["PerimeterLocation"]);
                txt_Perimeter_SqFt.Text = Convert.ToString(dt.Rows[0]["PerimeterSqFt"]);
                txt_Perimeter_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["PerimeterExistingRValue"]);
                txt_Perimeter_Add_R.Text = Convert.ToString(dt.Rows[0]["PerimeterAddR"]);
                txt_Perimeter_Insulation.Text = Convert.ToString(dt.Rows[0]["PerimeterNewInsulation"]);
                txt_Perimeter_Comment.Text = Convert.ToString(dt.Rows[0]["PerimeterComments"]);


                txt_Other_Location.Text = Convert.ToString(dt.Rows[0]["OtherLocation"]);
                txt_Other_SqFt.Text = Convert.ToString(dt.Rows[0]["OtherSqFt"]);
                txt_Other_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["OtherExistingRValue"]);
                txt_Other_Add_R.Text = Convert.ToString(dt.Rows[0]["OtherAddR"]);
                txt_Other_Insulation.Text = Convert.ToString(dt.Rows[0]["OtherNewInsulation"]);
                txt_Other_Comment.Text = Convert.ToString(dt.Rows[0]["OtherComments"]);


                txt_Belly_Location.Text = Convert.ToString(dt.Rows[0]["BellyLocation"]);
                txt_Belly_SqFt.Text = Convert.ToString(dt.Rows[0]["BellySqFt"]);
                txt_Belly_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["BellyExistingRValue"]);
                txt_Belly_Add_R.Text = Convert.ToString(dt.Rows[0]["BellyAddR"]);
                txt_Belly_Insulation.Text = Convert.ToString(dt.Rows[0]["BellyNewInsulation"]);
                txt_Belly_Comment.Text = Convert.ToString(dt.Rows[0]["BellyComments"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////

                string InstallGroundCover = Convert.ToString(dt.Rows[0]["InstallGroundCover"]);
                if (InstallGroundCover == "Y")
                {
                    rdo_GroundCover_Yes.Checked = true;
                }
                else if (InstallGroundCover == "N")
                {
                    rdo_GroundCover_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_GroundCover_SqFt_Instal.Text = Convert.ToString(dt.Rows[0]["InstallGroundCoverComment"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////////

                string AnyKneewalls = Convert.ToString(dt.Rows[0]["AnyKneewalls"]);
                if (AnyKneewalls == "Y")
                {
                    rdo_AnyKneewall_Yes.Checked = true;
                }
                else if (AnyKneewalls == "N")
                {
                    rdo_AnyKneewall_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string BlockedJoistBays = Convert.ToString(dt.Rows[0]["BlockedJoistBays"]);
                if (BlockedJoistBays == "Y")
                {
                    rdo_JoistBays_Yes.Checked = true;
                }
                else if (BlockedJoistBays == "N")
                {
                    rdo_JoistBays_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string BlockInsulation = Convert.ToString(dt.Rows[0]["BlockInsulation"]);
                if (BlockInsulation == "H")
                {
                    chk_Insulation_Heating.Checked = true;
                }
                else if (BlockInsulation == "C")
                {
                    chk_Insulation_Cooling.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_UnflooredAttic1_Location.Text = Convert.ToString(dt.Rows[0]["UF_Attic_1_Location"]);
                txt_UnflooredAttic1_SqFt.Text = Convert.ToString(dt.Rows[0]["UF_Attic_1_SqFt"]);
                txt_UnflooredAttic1_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["UF_Attic_1_ExistingRValue"]);
                txt_UnflooredAttic1_Add_R.Text = Convert.ToString(dt.Rows[0]["UF_Attic_1_AddR"]);
                txt_UnflooredAttic1_Insulation.Text = Convert.ToString(dt.Rows[0]["UF_Attic_1_NewInsulation"]);
                txt_UnflooredAttic1_Comment.Text = Convert.ToString(dt.Rows[0]["UF_Attic_1_Comment"]);

                txt_UnflooredAttic2_Location.Text = Convert.ToString(dt.Rows[0]["UF_Attic_2_Location"]);
                txt_UnflooredAttic2_SqFt.Text = Convert.ToString(dt.Rows[0]["UF_Attic_2_SqFt"]);
                txt_UnflooredAttic2_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["UF_Attic_2_ExistingRValue"]);
                txt_UnflooredAttic2_Add_R.Text = Convert.ToString(dt.Rows[0]["UF_Attic_2_AddR"]);
                txt_UnflooredAttic2_Insulation.Text = Convert.ToString(dt.Rows[0]["UF_Attic_2_NewInsulation"]);
                txt_UnflooredAttic2_Comment.Text = Convert.ToString(dt.Rows[0]["UF_Attic_2_Comment"]);


                txt_UnflooredAttic3_Location.Text = Convert.ToString(dt.Rows[0]["UF_Attic_3_Location"]);
                txt_UnflooredAttic3_SqFt.Text = Convert.ToString(dt.Rows[0]["UF_Attic_3_SqFt"]);
                txt_UnflooredAttic3_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["UF_Attic_3_ExistingRValue"]);
                txt_UnflooredAttic3_Add_R.Text = Convert.ToString(dt.Rows[0]["UF_Attic_3_AddR"]);
                txt_UnflooredAttic3_Insulation.Text = Convert.ToString(dt.Rows[0]["UF_Attic_3_NewInsulation"]);
                txt_UnflooredAttic3_Comment.Text = Convert.ToString(dt.Rows[0]["UF_Attic_3_Comment"]);


                txt_FlooredAttic1_Location.Text = Convert.ToString(dt.Rows[0]["F_Attic_1_Location"]);
                txt_FlooredAttic1_SqFt.Text = Convert.ToString(dt.Rows[0]["F_Attic_1_SqFt"]);
                txt_FlooredAttic1_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["F_Attic_1_ExistingRValue"]);
                txt_FlooredAttic1_Add_R.Text = Convert.ToString(dt.Rows[0]["F_Attic_1_AddR"]);
                txt_FlooredAttic1_Insulation.Text = Convert.ToString(dt.Rows[0]["F_Attic_1_NewInsulation"]);
                txt_FlooredAttic1_Comment.Text = Convert.ToString(dt.Rows[0]["F_Attic_1_Comment"]);


                txt_FlooredAttic2_Location.Text = Convert.ToString(dt.Rows[0]["F_Attic_2_Location"]);
                txt_FlooredAttic2_SqFt.Text = Convert.ToString(dt.Rows[0]["F_Attic_2_SqFt"]);
                txt_FlooredAttic2_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["F_Attic_2_ExistingRValue"]);
                txt_FlooredAttic2_Add_R.Text = Convert.ToString(dt.Rows[0]["F_Attic_2_AddR"]);
                txt_FlooredAttic2_Insulation.Text = Convert.ToString(dt.Rows[0]["F_Attic_2_NewInsulation"]);
                txt_FlooredAttic2_Comment.Text = Convert.ToString(dt.Rows[0]["F_Attic_2_Comment"]);


                txt_Cathedral_Location.Text = Convert.ToString(dt.Rows[0]["Cathedral_Location"]);
                txt_Cathedral_SqFt.Text = Convert.ToString(dt.Rows[0]["Cathedral_SqFt"]);
                txt_Cathedral_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["Cathedral_ExistingRValue"]);
                txt_Cathedral_Add_R.Text = Convert.ToString(dt.Rows[0]["Cathedral_AddR"]);
                txt_Cathedral_Insulation.Text = Convert.ToString(dt.Rows[0]["Cathedral_NewInsulation"]);
                txt_Cathedral_Comment.Text = Convert.ToString(dt.Rows[0]["Cathedral_Comment"]);


                txt_FinishedAttic_Location.Text = Convert.ToString(dt.Rows[0]["FinishAttic_Location"]);
                txt_FinishedAttic_SqFt.Text = Convert.ToString(dt.Rows[0]["FinishAttic_SqFt"]);
                txt_FinishedAttic_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["FinishAttic_ExistingRValue"]);
                txt_FinishedAttic_Add_R.Text = Convert.ToString(dt.Rows[0]["FinishAttic_AddR"]);
                txt_FinishedAttic_Insulation.Text = Convert.ToString(dt.Rows[0]["FinishAttic_NewInsulation"]);
                txt_FinishedAttic_Comment.Text = Convert.ToString(dt.Rows[0]["FinishAttic_Comment"]);


                txt_KneewallFloored_Location.Text = Convert.ToString(dt.Rows[0]["KneewallFloor_Location"]);
                txt_KneewallFloored_SqFt.Text = Convert.ToString(dt.Rows[0]["KneewallFloor_SqFt"]);
                txt_KneewallFloored_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["KneewallFloor_ExistingRValue"]);
                txt_KneewallFloored_Add_R.Text = Convert.ToString(dt.Rows[0]["KneewallFloor_AddR"]);
                txt_KneewallFloored_Insulation.Text = Convert.ToString(dt.Rows[0]["KneewallFloor_NewInsulation"]);
                txt_KneewallFloored_Comment.Text = Convert.ToString(dt.Rows[0]["KneewallFloor_Comment"]);


                txt_KneewallUnfloored_Location.Text = Convert.ToString(dt.Rows[0]["KneewallUnfloor_Location"]);
                txt_KneewallUnfloored_SqFt.Text = Convert.ToString(dt.Rows[0]["KneewallUnfloor_SqFt"]);
                txt_KneewallUnfloored_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["KneewallUnfloor_ExistingRValue"]);
                txt_KneewallUnfloored_Add_R.Text = Convert.ToString(dt.Rows[0]["KneewallUnfloor_AddR"]);
                txt_KneewallUnfloored_Insulation.Text = Convert.ToString(dt.Rows[0]["KneewallUnfloor_NewInsulation"]);
                txt_KneewallUnfloored_Comment.Text = Convert.ToString(dt.Rows[0]["KneewallUnfloor_Comment"]);


                txt_Slope_Location.Text = Convert.ToString(dt.Rows[0]["Slopes_Location"]);
                txt_Slope_SqFt.Text = Convert.ToString(dt.Rows[0]["Slopes_SqFt"]);
                txt_Slope_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["Slopes_ExistingRValue"]);
                txt_Slope_Add_R.Text = Convert.ToString(dt.Rows[0]["Slopes_AddR"]);
                txt_Slope_Insulation.Text = Convert.ToString(dt.Rows[0]["Slopes_NewInsulation"]);
                txt_Slope_Comment.Text = Convert.ToString(dt.Rows[0]["Slopes_Comment "]);


                txt_VerticalKneewall_Location.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall_Location"]);
                txt_VerticalKneewall_SqFt.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall_SqFt"]);
                txt_VerticalKneewall_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall_ExistingRValue"]);
                txt_VerticalKneewall_Add_R.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall_AddR"]);
                txt_VerticalKneewall_Insulation.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall_NewInsulation"]);
                txt_VerticalKneewall_Comment.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall_Comment"]);


                txt_VerticalKneewall2_Location.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall2_Location"]);
                txt_VerticalKneewall2_SqFt.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall2_SqFt"]);
                txt_VerticalKneewall2_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall2_ExistingRValue"]);
                txt_VerticalKneewall2_Add_R.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall2_AddR"]);
                txt_VerticalKneewall2_Insulation.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall2_NewInsulation"]);
                txt_VerticalKneewall2_Comment.Text = Convert.ToString(dt.Rows[0]["VerticalKneewall2_Comment"]);


                txt_Area1.Text = Convert.ToString(dt.Rows[0]["Area1"]);
                txt_Area1_Location.Text = Convert.ToString(dt.Rows[0]["Area1_Location"]);
                txt_Area1_SqFt.Text = Convert.ToString(dt.Rows[0]["Area1_Sqft"]);
                txt_Area1_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["Area1_ExistingRValue"]);
                txt_Area1_Add_R.Text = Convert.ToString(dt.Rows[0]["Area1_AddR"]);
                txt_Area1_Insulation.Text = Convert.ToString(dt.Rows[0]["Area1_NewInsulation"]);
                txt_Area1_Comment.Text = Convert.ToString(dt.Rows[0]["Area1_Comment"]);


                txt_Area2.Text = Convert.ToString(dt.Rows[0]["Area2"]);
                txt_Area2_Location.Text = Convert.ToString(dt.Rows[0]["Area2_Location"]);
                txt_Area2_SqFt.Text = Convert.ToString(dt.Rows[0]["Area2_Sqft"]);
                txt_Area2_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["Area2_ExistingRValue"]);
                txt_Area2_Add_R.Text = Convert.ToString(dt.Rows[0]["Area2_AddR"]);
                txt_Area2_Insulation.Text = Convert.ToString(dt.Rows[0]["Area2_NewInsulation"]);
                txt_Area2_Comment.Text = Convert.ToString(dt.Rows[0]["Area2_Comment"]);


                txt_Area3.Text = Convert.ToString(dt.Rows[0]["Area3"]);
                txt_Area3_Location.Text = Convert.ToString(dt.Rows[0]["Area3_Location"]);
                txt_Area3_SqFt.Text = Convert.ToString(dt.Rows[0]["Area3_Sqft"]);
                txt_Area3_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["Area3_ExistingRValue"]);
                txt_Area3_Add_R.Text = Convert.ToString(dt.Rows[0]["Area3_AddR"]);
                txt_Area3_Insulation.Text = Convert.ToString(dt.Rows[0]["Area3_NewInsulation"]);
                txt_Area3_Comment.Text = Convert.ToString(dt.Rows[0]["Area3_Comment"]);


                txt_RoofVent_PropeseAddVent.Text = Convert.ToString(dt.Rows[0]["AdditionalVentilation_Line1"]);
                txt_RoofVent_Location.Text = Convert.ToString(dt.Rows[0]["Location_Line1"]);
                txt_RoofVent_Comment.Text = Convert.ToString(dt.Rows[0]["Comments_Line1"]);


                txt_GableVent_PropeseAddVent.Text = Convert.ToString(dt.Rows[0]["AdditionalVentilation_Line2"]);
                txt_GableVent_Location.Text = Convert.ToString(dt.Rows[0]["Location_Line2"]);
                txt_GableVent_Comment.Text = Convert.ToString(dt.Rows[0]["Comments_Line2"]);


                txt_SoffitVent_ProposeAddVent.Text = Convert.ToString(dt.Rows[0]["AdditionalVentilation_Line3"]);
                txt_SoffitVent_Location.Text = Convert.ToString(dt.Rows[0]["Location_Line3"]);
                txt_SoffitVent_Comment.Text = Convert.ToString(dt.Rows[0]["Comments_Line3"]);


                txt_RidgeVent_ProposeAddVent.Text = Convert.ToString(dt.Rows[0]["AdditionalVentilation_Line4"]);
                txt_RidgeVent_Location.Text = Convert.ToString(dt.Rows[0]["Location_Line4"]);
                txt_RidgeVent_Comment.Text = Convert.ToString(dt.Rows[0]["Comments_Line4"]);

                txt_Comment.Text = Convert.ToString(dt.Rows[0]["Page14_Comment"]);
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

            /////////////////////////////////////////////////////////////////////////////////////////////////////

            string BasementSealing = "";
            string OtherBasementSealingComments = "";
            if (chk_BasementAirSealing_Perimeter.Checked == true)
            {
                BasementSealing = "P";
            }
            else if (chk_BasementAirSealing_Ceiling.Checked == true)
            {
                BasementSealing = "C";
            }
            else if (chk_BasementAirSealing_Ducts.Checked == true)
            {
                BasementSealing = "D";
            }
            else if (chk_BasementAirSealing_Other.Checked == true)
            {
                BasementSealing = "O";
                OtherBasementSealingComments = txt_BasementAirSealing_Other.Text;
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string InstallGroundCover = "";
            if (rdo_GroundCover_Yes.Checked == true)
            {
                InstallGroundCover = "Y";
            }
            else if (rdo_GroundCover_No.Checked == true)
            {
                InstallGroundCover = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////

            string AnyKneewalls = "";
            if (rdo_AnyKneewall_Yes.Checked == true)
            {
                AnyKneewalls = "Y";
            }
            else if (rdo_AnyKneewall_No.Checked == true)
            {
                AnyKneewalls = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string BlockedJoistBays = "";
            if (rdo_JoistBays_Yes.Checked == true)
            {
                BlockedJoistBays = "Y";
            }
            else if (rdo_JoistBays_No.Checked == true)
            {
                BlockedJoistBays = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string BlockInsulation = "";
            if (chk_Insulation_Heating.Checked == true)
            {
                BlockInsulation = "H";
            }
            else if (chk_Insulation_Cooling.Checked == true)
            {
                BlockInsulation = "C";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////



            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_14(JobNum, BasementSealing, OtherBasementSealingComments, txt_FloorCrawlSpace_Location.Text, txt_FloorCrawlSpace_SqFt.Text, txt_FloorCrawlSpace_ExistEffect_R.Text, txt_FloorCrawlSpace_Add_R.Text, txt_FloorCrawlSpace_Insulation.Text, txt_FloorCrawlSpace_Comment.Text, txt_Perimeter_Location.Text, txt_Perimeter_SqFt.Text, txt_Perimeter_ExistEffect_R.Text, txt_Perimeter_Add_R.Text, txt_Perimeter_Insulation.Text, txt_Perimeter_Comment.Text, txt_Other_Location.Text, txt_Other_SqFt.Text, txt_Other_ExistEffect_R.Text, txt_Other_Add_R.Text, txt_Other_Insulation.Text, txt_Other_Comment.Text, txt_Belly_Location.Text, txt_Belly_SqFt.Text, txt_Belly_ExistEffect_R.Text, txt_Belly_Add_R.Text, txt_Belly_Insulation.Text, txt_Belly_Comment.Text, InstallGroundCover, txt_GroundCover_SqFt_Instal.Text, AnyKneewalls, BlockedJoistBays, BlockInsulation, txt_UnflooredAttic1_Location.Text, txt_UnflooredAttic1_SqFt.Text, txt_UnflooredAttic1_ExistEffect_R.Text, txt_UnflooredAttic1_Add_R.Text, txt_UnflooredAttic1_Insulation.Text, txt_UnflooredAttic1_Comment.Text, txt_UnflooredAttic2_Location.Text, txt_UnflooredAttic2_SqFt.Text, txt_UnflooredAttic2_ExistEffect_R.Text, txt_UnflooredAttic2_Add_R.Text, txt_UnflooredAttic2_Insulation.Text, txt_UnflooredAttic2_Comment.Text, txt_UnflooredAttic3_Location.Text, txt_UnflooredAttic3_SqFt.Text, txt_UnflooredAttic3_ExistEffect_R.Text, txt_UnflooredAttic3_Add_R.Text, txt_UnflooredAttic3_Insulation.Text, txt_UnflooredAttic3_Comment.Text, txt_FlooredAttic1_Location.Text, txt_FlooredAttic1_SqFt.Text, txt_FlooredAttic1_ExistEffect_R.Text, txt_FlooredAttic1_Add_R.Text, txt_FlooredAttic1_Insulation.Text, txt_FlooredAttic1_Comment.Text, txt_FlooredAttic2_Location.Text, txt_FlooredAttic2_SqFt.Text, txt_FlooredAttic2_ExistEffect_R.Text, txt_FlooredAttic2_Add_R.Text, txt_FlooredAttic2_Insulation.Text, txt_FlooredAttic2_Comment.Text, txt_Cathedral_Location.Text, txt_Cathedral_SqFt.Text, txt_Cathedral_ExistEffect_R.Text, txt_Cathedral_Add_R.Text, txt_Cathedral_Insulation.Text, txt_Cathedral_Comment.Text, txt_FinishedAttic_Location.Text, txt_FinishedAttic_SqFt.Text, txt_FinishedAttic_ExistEffect_R.Text, txt_FinishedAttic_Add_R.Text, txt_FinishedAttic_Insulation.Text, txt_FinishedAttic_Comment.Text, txt_KneewallFloored_Location.Text, txt_KneewallFloored_SqFt.Text, txt_KneewallFloored_ExistEffect_R.Text, txt_KneewallFloored_Add_R.Text, txt_KneewallFloored_Insulation.Text, txt_KneewallFloored_Comment.Text, txt_KneewallUnfloored_Location.Text, txt_KneewallUnfloored_SqFt.Text, txt_KneewallUnfloored_ExistEffect_R.Text, txt_KneewallUnfloored_Add_R.Text, txt_KneewallUnfloored_Insulation.Text, txt_KneewallUnfloored_Comment.Text, txt_Slope_Location.Text, txt_Slope_SqFt.Text, txt_Slope_ExistEffect_R.Text, txt_Slope_Add_R.Text, txt_Slope_Insulation.Text, txt_Slope_Comment.Text, txt_VerticalKneewall_Location.Text, txt_VerticalKneewall_SqFt.Text, txt_VerticalKneewall_ExistEffect_R.Text, txt_VerticalKneewall_Add_R.Text, txt_VerticalKneewall_Insulation.Text, txt_VerticalKneewall_Comment.Text, txt_VerticalKneewall2_Location.Text, txt_VerticalKneewall2_SqFt.Text, txt_VerticalKneewall2_ExistEffect_R.Text, txt_VerticalKneewall2_Add_R.Text, txt_VerticalKneewall2_Insulation.Text, txt_VerticalKneewall2_Comment.Text, txt_Area1.Text, txt_Area1_Location.Text, txt_Area1_SqFt.Text, txt_Area1_ExistEffect_R.Text, txt_Area1_Add_R.Text, txt_Area1_Insulation.Text, txt_Area1_Comment.Text, txt_Area2.Text, txt_Area2_Location.Text, txt_Area2_SqFt.Text, txt_Area2_ExistEffect_R.Text, txt_Area2_Add_R.Text, txt_Area2_Insulation.Text, txt_Area2_Comment.Text, txt_Area3.Text, txt_Area3_Location.Text, txt_Area3_SqFt.Text, txt_Area3_ExistEffect_R.Text, txt_Area3_Add_R.Text, txt_Area3_Insulation.Text, txt_Area3_Comment.Text, txt_RoofVent_PropeseAddVent.Text, txt_RoofVent_Location.Text, txt_RoofVent_Comment.Text, txt_GableVent_PropeseAddVent.Text, txt_GableVent_Location.Text, txt_GableVent_Comment.Text, txt_SoffitVent_ProposeAddVent.Text, txt_SoffitVent_Location.Text, txt_SoffitVent_Comment.Text, txt_RidgeVent_ProposeAddVent.Text, txt_RidgeVent_Location.Text, txt_RidgeVent_Comment.Text, txt_Comment.Text);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }
}
