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

public partial class METED_METED_Audit_Page15 : System.Web.UI.Page
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_15(JobNum);
            if (dt.Rows.Count > 0)
            {
                string HorizontalAtticAccess = Convert.ToString(dt.Rows[0]["HorizontalAtticAccess"]);
                if (HorizontalAtticAccess == "A")
                {
                    rdo_HorizontalAttic_AlreadyDone.Checked = true;
                }
                else if (HorizontalAtticAccess == "W")
                {
                    rdo_HorizontalAttic_WillDo.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////


                txt_HorizontalAttic_Location.Text = Convert.ToString(dt.Rows[0]["HorizontalAtticAccessLocation"]);


                ///////////////////////////////////////////////////////////////////////////////////////

                string HorizontalAtticAccessWaterStripping = Convert.ToString(dt.Rows[0]["HorizontalAtticAccessWaterStripping"]);
                if (HorizontalAtticAccessWaterStripping == "E")
                {
                    rdo_HorizontalAttic_WeatherStripping_Exist.Checked = true;
                }
                else if (HorizontalAtticAccessWaterStripping == "A")
                {
                    rdo_HorizontalAttic_WeatherStripping_add.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                txt_HorizontalAttic_AccesExist.Text = Convert.ToString(dt.Rows[0]["AccessesExisting"]);
                txt_HorizontalAttic_AccesAdd.Text = Convert.ToString(dt.Rows[0]["AccessesAdded"]);

                ///////////////////////////////////////////////////////////////////////////////////////

                string VerticalOpenings = Convert.ToString(dt.Rows[0]["VerticalOpenings"]);
                if (VerticalOpenings == "A")
                {
                    rdo_VerticalOpening_AlreadyDone.Checked = true;
                }
                else if (VerticalOpenings == "W")
                {
                    rdo_VerticalOpening_WillDo.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                txt_VerticalOpening_Location.Text = Convert.ToString(dt.Rows[0]["VerticalOpeningsLocation"]);

                ///////////////////////////////////////////////////////////////////////////////////////

                string VerticalOpeningsWaterStripping = Convert.ToString(dt.Rows[0]["VerticalOpeningsWaterStripping"]);
                if (VerticalOpeningsWaterStripping == "E")
                {
                    rdo_VerticalOpening_WeatherStripping_Exist.Checked = true;
                }
                else if (VerticalOpeningsWaterStripping == "A")
                {
                    rdo_VerticalOpening_WeatherStripping_Add.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                string PullDownStairs = Convert.ToString(dt.Rows[0]["PullDownStairs"]);
                if (PullDownStairs == "A")
                {
                    rdo_PullDownStairs_AlreadyDone.Checked = true;
                }
                else if (PullDownStairs == "W")
                {
                    rdo_PullDownStairs_WillDo.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                txt_PullDownStairs_Location.Text = Convert.ToString(dt.Rows[0]["PullDownStairsLocation"]);

                ///////////////////////////////////////////////////////////////////////////////////////

                string PullDownStairsWaterStripping = Convert.ToString(dt.Rows[0]["PullDownStairsWaterStripping"]);
                if (PullDownStairsWaterStripping == "E")
                {
                    rdo_PullDownStairs_WeatherStripping_Exist.Checked = true;
                }
                else if (PullDownStairsWaterStripping == "A")
                {
                    rdo_PullDownStairs_WeatherStripping_Add.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                string RemainOperableRecommended = Convert.ToString(dt.Rows[0]["RemainOperableRecommended"]);
                if (RemainOperableRecommended == "Y")
                {
                    rdo_Recommended_Yes.Checked = true;
                }
                else if (RemainOperableRecommended == "N")
                {
                    rdo_Recommended_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                string HeateatProducingFixtures = Convert.ToString(dt.Rows[0]["HeateatProducingFixtures"]);
                if (HeateatProducingFixtures == "Y")
                {
                    rdo_RecessedHeatProducingFixtures_Yes.Checked = true;
                }
                else if (HeateatProducingFixtures == "N")
                {
                    rdo_RecessedHeatProducingFixtures_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                txt_ManyRecessedFixtures.Text = Convert.ToString(dt.Rows[0]["FixturesAreThere"]);
                txt_RecessedFixtures_Light.Text = Convert.ToString(dt.Rows[0]["Oflights"]);
                txt_RecessedFixtures_Fans.Text = Convert.ToString(dt.Rows[0]["OfFans"]);
                txt_RecessedFixtures_Other.Text = Convert.ToString(dt.Rows[0]["HeatOther"]);
                txt_IC_Rated.Text = Convert.ToString(dt.Rows[0]["ICRated"]);
                txt_Non_IC_Rated.Text = Convert.ToString(dt.Rows[0]["NonICRated"]);
                txt_Unknown_IC_Rated.Text = Convert.ToString(dt.Rows[0]["UnknownRating"]);
                txt_Protect_Insulation.Text = Convert.ToString(dt.Rows[0]["ProtectThemInsulation"]);
                txt_AirSealed.Text = Convert.ToString(dt.Rows[0]["AirTightInserts"]);

                //////////////////////////////////////////////////////////////////////////////////////

                string ChangedOut = Convert.ToString(dt.Rows[0]["ChangedOut"]);
                if (ChangedOut == "Y")
                {
                    rdo_RecessedLightChange_Yes.Checked = true;
                }
                else if (ChangedOut == "N")
                {
                    rdo_RecessedLightChange_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                txt_Replace_AirTightICRatedRecessedFixtures.Text = Convert.ToString(dt.Rows[0]["SurfaceMountedFixtures"]);
                txt_HorizontalAttic_DamBlock.Text = Convert.ToString(dt.Rows[0]["FiberglassBattBlocking"]);

                ///////////////////////////////////////////////////////////////////////////////////////

                string ChimneyFlueRecommended = Convert.ToString(dt.Rows[0]["ChimneyFlueRecommended"]);
                if (ChimneyFlueRecommended == "Y")
                {
                    rdo_DamChimneyFlues_Yes.Checked = true;
                }
                else if (ChimneyFlueRecommended == "N")
                {
                    rdo_DamChimneyFlues_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                txt_DamChimneyFlues.Text = Convert.ToString(dt.Rows[0]["OfChimney"]);

                ///////////////////////////////////////////////////////////////////////////////////////

                string AreThereCantOverHangs = Convert.ToString(dt.Rows[0]["AreThereCantOverHangs"]);
                if (AreThereCantOverHangs == "Y")
                {
                    rdo_CantileverOverhangs_Yes.Checked = true;
                }
                else if (AreThereCantOverHangs == "N")
                {
                    rdo_CantileverOverhangs_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                string ImpermeableAirBarrier = Convert.ToString(dt.Rows[0]["ImpermeableAirBarrier"]);
                if (ImpermeableAirBarrier == "Y")
                {
                    rdo_ImpermeableAirBarrier_Yes.Checked = true;
                }
                else if (ImpermeableAirBarrier == "N")
                {
                    rdo_ImpermeableAirBarrier_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                string AreTheyBlocked = Convert.ToString(dt.Rows[0]["AreTheyBlocked"]);
                if (AreTheyBlocked == "Y")
                {
                    rdo_JoistsBaysBlocke_Yes.Checked = true;
                }
                else if (AreTheyBlocked == "N")
                {
                    rdo_JoistsBaysBlocke_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////

                txt_Cantilever1_Location.Text = Convert.ToString(dt.Rows[0]["Cantilever1Location"]);
                txt_Cantilever1_SqFt.Text = Convert.ToString(dt.Rows[0]["Cantilever1SqFt"]);
                txt_Cantilever1_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["Cantilever1ExistingRValue"]);
                txt_Cantilever1_Add_R.Text = Convert.ToString(dt.Rows[0]["Cantilever1AddR"]);
                txt_Cantilever1_Insulation.Text = Convert.ToString(dt.Rows[0]["Cantilever1NewR"]);
                txt_Cantilever1_Comment.Text = Convert.ToString(dt.Rows[0]["Cantilever1Comments"]);

                ///////////////////////////////////////////////////////////////////////////////////////

                txt_Cantilever2_Location.Text = Convert.ToString(dt.Rows[0]["Cantilever2Location"]);
                txt_Cantilever2_SqFt.Text = Convert.ToString(dt.Rows[0]["Cantilever2SqFt"]);
                txt_Cantilever2_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["Cantilever2ExistingRValue"]);
                txt_Cantilever2_Add_R.Text = Convert.ToString(dt.Rows[0]["Cantilever2AddR"]);
                txt_Cantilever2_Insulation.Text = Convert.ToString(dt.Rows[0]["Cantilever2NewR"]);
                txt_Cantilever2_Comment.Text = Convert.ToString(dt.Rows[0]["Cantilever2Comments"]);

                ///////////////////////////////////////////////////////////////////////////////////////

                txt_BayWindow_Location.Text = Convert.ToString(dt.Rows[0]["WindowLocation"]);
                txt_BayWindow_SqFt.Text = Convert.ToString(dt.Rows[0]["WindowSqFt"]);
                txt_BayWindow_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["WindowExistingRValue"]);
                txt_BayWindow_Add_R.Text = Convert.ToString(dt.Rows[0]["WindowAddR"]);
                txt_BayWindow_Insulation.Text = Convert.ToString(dt.Rows[0]["WindowNewR"]);
                txt_BayWindow_Comment.Text = Convert.ToString(dt.Rows[0]["WindowComments"]);

                ///////////////////////////////////////////////////////////////////////////////////////

                string Wood = Convert.ToString(dt.Rows[0]["Wood"]);
                if (Wood == "Y")
                {
                    chk_Siding_Wood.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////

                string Asphalt = Convert.ToString(dt.Rows[0]["Asphalt"]);
                if (Asphalt == "Y")
                {
                    chk_Siding_Asphalt.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////

                string Stucco = Convert.ToString(dt.Rows[0]["Stucco"]);
                if (Stucco == "Y")
                {
                    chk_Siding_Stucco.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////

                string Aluminum = Convert.ToString(dt.Rows[0]["Aluminum"]);
                if (Aluminum == "Y")
                {
                    chk_Siding_Aluminum.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////

                string Vinyl = Convert.ToString(dt.Rows[0]["Vinyl"]);
                if (Vinyl == "Y")
                {
                    chk_Siding_Vinyl.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////

                string Brick = Convert.ToString(dt.Rows[0]["Brick"]);
                if (Brick == "Y")
                {
                    chk_Siding_Brick.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////

                txt_Siding_Other.Text = Convert.ToString(dt.Rows[0]["Other"]);
                txt_InteriorWallMaterial.Text = Convert.ToString(dt.Rows[0]["InteriorWallMaterialComments"]);

                /////////////////////////////////////////////////////////////////////////////////////////

                string CanSideWallsBeInsulated = Convert.ToString(dt.Rows[0]["CanSideWallsBeInsulated"]);
                if (CanSideWallsBeInsulated == "Y")
                {
                    rdo_SideWallInsulated_Yes.Checked = true;
                }
                else if (CanSideWallsBeInsulated == "N")
                {
                    rdo_SideWallInsulated_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////

                txt_SideWallInsulated_IfNot.Text = Convert.ToString(dt.Rows[0]["CanSideWallsBeInsulatedIfNotComment"]);
                txt_FaceDirection_Wall_North.Text = Convert.ToString(dt.Rows[0]["NorthComments"]);
                txt_FaceDirection_Wall_South.Text = Convert.ToString(dt.Rows[0]["SouthComments"]);
                txt_FaceDirection_Wall_East.Text = Convert.ToString(dt.Rows[0]["EastComments"]);
                txt_FaceDirection_Wall_West.Text = Convert.ToString(dt.Rows[0]["WestComments"]);
                txt_SideWallIssue.Text = Convert.ToString(dt.Rows[0]["SidewallComments"]);
                txt_GarageCeiling_SqFt.Text = Convert.ToString(dt.Rows[0]["GarageCeilingSqFt"]);
                txt_GarageCeiling_ExistEffect_R.Text = Convert.ToString(dt.Rows[0]["GarageCeilingExistingRValue"]);
                txt_GarageCeiling_Add_R.Text = Convert.ToString(dt.Rows[0]["GarageCeilingAddR"]);
                txt_GarageCeiling_Insulation.Text = Convert.ToString(dt.Rows[0]["GarageCeilingNewR"]);
                txt_GarageCeiling_Comment.Text = Convert.ToString(dt.Rows[0]["GarageCeilingComments"]);

                //////////////////////////////////////////////////////////////////////////////////////

                string ThermalEnvelope = Convert.ToString(dt.Rows[0]["ThermalEnvelope"]);
                if (ThermalEnvelope == "Y")
                {
                    rdo_GarageIsolatedThermal_Envelope_Yes.Checked = true;
                }
                else if (ThermalEnvelope == "N")
                {
                    rdo_GarageIsolatedThermal_Envelope_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////
                //=Convert.ToString(dt.Rows[0]["HealthandSafety"]);
                string HealthandSafety = Convert.ToString(dt.Rows[0]["HealthandSafety"]);
                if (HealthandSafety == "Y")
                {
                    rdo_HealthSafety_Yes.Checked = true;
                }
                else if (HealthandSafety == "N")
                {
                    rdo_HealthSafety_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////
                txt_ZonesOutsideThermal.Text = Convert.ToString(dt.Rows[0]["Page15Comments"]);
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

            string HorizontalAtticAccess = "";
            if (rdo_HorizontalAttic_AlreadyDone.Checked == true)
            {
                HorizontalAtticAccess = "A";
            }
            else if (rdo_HorizontalAttic_WillDo.Checked == true)
            {
                HorizontalAtticAccess = "W";
            }


            ///////////////////////////////////////////////////////////////////////////////////////

            string HorizontalAtticAccessWaterStripping = "";
            if (rdo_HorizontalAttic_WeatherStripping_Exist.Checked == true)
            {
                HorizontalAtticAccessWaterStripping = "E";
            }
            else if (rdo_HorizontalAttic_WeatherStripping_add.Checked == true)
            {
                HorizontalAtticAccessWaterStripping = "A";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string VerticalOpenings = "";
            if (rdo_VerticalOpening_AlreadyDone.Checked == true)
            {
                VerticalOpenings = "A";
            }
            else if (rdo_VerticalOpening_WillDo.Checked == true)
            {
                VerticalOpenings = "W";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string VerticalOpeningsWaterStripping = "";
            if (rdo_VerticalOpening_WeatherStripping_Exist.Checked == true)
            {
                VerticalOpeningsWaterStripping = "E";
            }
            else if (rdo_VerticalOpening_WeatherStripping_Add.Checked == true)
            {
                VerticalOpeningsWaterStripping = "A";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string PullDownStairs = "";
            if (rdo_PullDownStairs_AlreadyDone.Checked == true)
            {
                PullDownStairs = "A";
            }
            else if (rdo_PullDownStairs_WillDo.Checked == true)
            {
                PullDownStairs = "W";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string PullDownStairsWaterStripping = "";
            if (rdo_PullDownStairs_WeatherStripping_Exist.Checked == true)
            {
                PullDownStairsWaterStripping = "E";
            }
            else if (rdo_PullDownStairs_WeatherStripping_Add.Checked == true)
            {
                PullDownStairsWaterStripping = "A";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string RemainOperableRecommended = "";
            if (rdo_Recommended_Yes.Checked == true)
            {
                RemainOperableRecommended = "Y";
            }
            else if (rdo_Recommended_No.Checked == true)
            {
                RemainOperableRecommended = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string HeateatProducingFixtures = "";
            if (rdo_RecessedHeatProducingFixtures_Yes.Checked == true)
            {
                HeateatProducingFixtures = "Y";
            }
            else if (rdo_RecessedHeatProducingFixtures_No.Checked == true)
            {
                HeateatProducingFixtures = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string ChangedOut = "";
            if (rdo_RecessedLightChange_Yes.Checked == true)
            {
                ChangedOut = "Y";
            }
            else if (rdo_RecessedLightChange_No.Checked == true)
            {
                ChangedOut = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string ChimneyFlueRecommended = "";
            if (rdo_DamChimneyFlues_Yes.Checked == true)
            {
                ChimneyFlueRecommended = "Y";
            }
            else if (rdo_DamChimneyFlues_No.Checked == true)
            {
                ChimneyFlueRecommended = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string AreThereCantOverHangs = "";
            if (rdo_CantileverOverhangs_Yes.Checked == true)
            {
                AreThereCantOverHangs = "Y";
            }
            else if (rdo_CantileverOverhangs_No.Checked == true)
            {
                AreThereCantOverHangs = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string ImpermeableAirBarrier = "";
            if (rdo_ImpermeableAirBarrier_Yes.Checked == true)
            {
                ImpermeableAirBarrier = "Y";
            }
            else if (rdo_ImpermeableAirBarrier_No.Checked == true)
            {
                ImpermeableAirBarrier = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string AreTheyBlocked = "";
            if (rdo_JoistsBaysBlocke_Yes.Checked == true)
            {
                AreTheyBlocked = "Y";
            }
            else if (rdo_JoistsBaysBlocke_No.Checked == true)
            {
                AreTheyBlocked = "N";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string Wood = "";
            if (chk_Siding_Wood.Checked == true)
            {
                Wood = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////

            string Asphalt = "";
            if (chk_Siding_Asphalt.Checked == true)
            {
                Asphalt = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////

            string Stucco = "";
            if (chk_Siding_Stucco.Checked == true)
            {
                Stucco = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////

            string Aluminum = "";
            if (chk_Siding_Aluminum.Checked == true)
            {
                Aluminum = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////

            string Vinyl = "";
            if (chk_Siding_Vinyl.Checked == true)
            {
                Vinyl = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////

            string Brick = "";
            if (chk_Siding_Brick.Checked == true)
            {
                Brick = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////

            string CanSideWallsBeInsulated = "";
            if (rdo_SideWallInsulated_Yes.Checked == true)
            {
                CanSideWallsBeInsulated = "Y";
            }
            else if (rdo_SideWallInsulated_No.Checked == true)
            {
                CanSideWallsBeInsulated = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////

            string ThermalEnvelope = "";
            if (rdo_GarageIsolatedThermal_Envelope_Yes.Checked == true)
            {
                ThermalEnvelope = "Y";
            }
            else if (rdo_GarageIsolatedThermal_Envelope_No.Checked == true)
            {
                ThermalEnvelope = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////

            string HealthandSafety = "";
            if (rdo_HealthSafety_Yes.Checked == true)
            {
                HealthandSafety = "Y";
            }
            else if (rdo_HealthSafety_No.Checked == true)
            {
                HealthandSafety = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////

            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_15(JobNum, HorizontalAtticAccess, txt_HorizontalAttic_Location.Text, HorizontalAtticAccessWaterStripping, txt_HorizontalAttic_AccesExist.Text, txt_HorizontalAttic_AccesAdd.Text, VerticalOpenings, txt_VerticalOpening_Location.Text, VerticalOpeningsWaterStripping, PullDownStairs, txt_PullDownStairs_Location.Text, PullDownStairsWaterStripping, RemainOperableRecommended, HeateatProducingFixtures, txt_ManyRecessedFixtures.Text, txt_RecessedFixtures_Light.Text, txt_RecessedFixtures_Fans.Text, txt_RecessedFixtures_Other.Text, txt_IC_Rated.Text, txt_Non_IC_Rated.Text, txt_Unknown_IC_Rated.Text, txt_Protect_Insulation.Text, txt_AirSealed.Text, ChangedOut, txt_Replace_AirTightICRatedRecessedFixtures.Text, txt_HorizontalAttic_DamBlock.Text, ChimneyFlueRecommended, txt_DamChimneyFlues.Text, AreThereCantOverHangs, ImpermeableAirBarrier, AreTheyBlocked, txt_Cantilever1_Location.Text, txt_Cantilever1_SqFt.Text, txt_Cantilever1_ExistEffect_R.Text, txt_Cantilever1_Add_R.Text, txt_Cantilever1_Insulation.Text, txt_Cantilever1_Comment.Text, txt_Cantilever2_Location.Text, txt_Cantilever2_SqFt.Text, txt_Cantilever2_ExistEffect_R.Text, txt_Cantilever2_Add_R.Text, txt_Cantilever2_Insulation.Text, txt_Cantilever2_Comment.Text, txt_BayWindow_Location.Text, txt_BayWindow_SqFt.Text, txt_BayWindow_ExistEffect_R.Text, txt_BayWindow_Add_R.Text, txt_BayWindow_Insulation.Text, txt_BayWindow_Comment.Text, Wood, Asphalt, Stucco, Aluminum, Vinyl, Brick, txt_Siding_Other.Text, txt_InteriorWallMaterial.Text, CanSideWallsBeInsulated, txt_SideWallInsulated_IfNot.Text, txt_FaceDirection_Wall_North.Text, txt_FaceDirection_Wall_South.Text, txt_FaceDirection_Wall_East.Text, txt_FaceDirection_Wall_West.Text, txt_SideWallIssue.Text, txt_GarageCeiling_SqFt.Text, txt_GarageCeiling_ExistEffect_R.Text, txt_GarageCeiling_Add_R.Text, txt_GarageCeiling_Insulation.Text, txt_GarageCeiling_Comment.Text, ThermalEnvelope, HealthandSafety, txt_ZonesOutsideThermal.Text);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {

        }
    }
}


