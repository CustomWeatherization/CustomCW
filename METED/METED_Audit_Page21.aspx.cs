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

public partial class METED_METED_Audit_Page21 : System.Web.UI.Page
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_21(JobNum);
            if (dt.Rows.Count > 0)
            {



                txt_Door_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceDoor1UI"]);
                txt_Door_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceDoor1Locations"]);
                txt_Door_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceDoor1Materials"]);
                txt_Door_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceDoor1LaborHours"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string ReplaceDoors = Convert.ToString(dt.Rows[0]["ReplaceDoors"]);
                if (ReplaceDoors == "Y")
                {
                    chk_DoorReplace.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string ReplaceDoorsRepair = Convert.ToString(dt.Rows[0]["ReplaceDoorsRepair"]);
                if (ReplaceDoorsRepair == "Y")
                {
                    chk_DoorReplace_Repair.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_DoorReplace_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsUI"]);
                txt_DoorReplace_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsLocations"]);
                txt_DoorReplace_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsMaterials"]);
                txt_DoorReplace_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsLaborHours"]);


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string ReplaceDoorsWeatherStrip = Convert.ToString(dt.Rows[0]["ReplaceDoorsWeatherStrip"]);
                if (ReplaceDoorsWeatherStrip == "Y")
                {
                    chk_DoorWeatherstrip.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_DoorWeatherstrip_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsWeatherStripRepair"]);
                txt_DoorWeatherstrip_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsWeatherStripUI"]);
                txt_DoorWeatherstrip_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsWeatherStripLocations"]);
                txt_DoorWeatherstrip_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsWeatherStripMaterials"]);
                txt_DoorWeatherstrip_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsWeatherStripLaborHours"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




                string ReplaceDoorsSweeps = Convert.ToString(dt.Rows[0]["ReplaceDoorsSweeps"]);
                if (ReplaceDoorsSweeps == "Y")
                {
                    chk_DoorSweep.Checked = true;
                }


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_DoorSweep_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsSweepsRepair"]);
                txt_DoorSweep_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsSweepsUI"]);
                txt_DoorSweep_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsSweepsLocations"]);
                txt_DoorSweep_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsSweepsMaterials"]);
                txt_DoorSweep_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsSweepsLaborHours"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




                string ReplaceDoorsThresholds = Convert.ToString(dt.Rows[0]["ReplaceDoorsThresholds"]);
                if (ReplaceDoorsThresholds == "Y")
                {
                    chk_DoorThreshold.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_DoorThreshold_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsThresholdsRepair"]);
                txt_DoorThreshold_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsThresholdsUI"]);
                txt_DoorThreshold_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsThresholdsLocations"]);
                txt_DoorThreshold_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsThresholdsMaterials"]);
                txt_DoorThreshold_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsThresholdsLaborHours"]);


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string ReplaceDoorsSealing = Convert.ToString(dt.Rows[0]["ReplaceDoorsSealing"]);
                if (ReplaceDoorsSealing == "Y")
                {
                    chk_DoorSealing.Checked = true;
                }


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_DoorSealing_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsSealingRepair"]);
                txt_DoorSealing_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsSealingUI"]);
                txt_DoorSealing_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsSealingLocations"]);
                txt_DoorSealing_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsSealingMaterials"]);
                txt_DoorSealing_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceDoorsSealingLaborHours"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_Windows_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceWindows1UI"]);
                txt_Windows_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceWindows1Locations"]);
                txt_Windows_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceWindows1Materials"]);
                txt_Windows_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceWindows1LaborHours"]);



                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string ReplaceWindows = Convert.ToString(dt.Rows[0]["ReplaceWindows"]);
                if (ReplaceWindows == "Y")
                {
                    chk_WindowsReplace.Checked = true;
                }


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string ReplaceWindowsRepair = Convert.ToString(dt.Rows[0]["ReplaceWindowsRepair"]);
                if (ReplaceWindowsRepair == "Y")
                {
                    chk_WindowsReplace_Repair.Checked = true;
                }


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_WindowsReplace_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsUI"]);
                txt_WindowsReplace_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsLocations"]);
                txt_WindowsReplace_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsMaterials"]);
                txt_WindowsReplace_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsLaborHours"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string ReplaceWindowsBrokenGlass = Convert.ToString(dt.Rows[0]["ReplaceWindowsBrokenGlass"]);
                if (ReplaceWindowsBrokenGlass == "Y")
                {
                    chk_WindowsReplace_BrokenGlass.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_WindowsReplace_BrokenGlass_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsBrokenGlassRepair"]);
                txt_WindowsReplace_BrokenGlass_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsBrokenGlassUI"]);
                txt_WindowsReplace_BrokenGlass_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsBrokenGlassLocations"]);
                txt_WindowsReplace_BrokenGlass_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsBrokenGlassMaterials"]);
                txt_WindowsReplace_BrokenGlass_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsBrokenGlassLaborHours"]);


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




                string ReplaceWindowsReglaze = Convert.ToString(dt.Rows[0]["ReplaceWindowsReglaze"]);
                if (ReplaceWindowsReglaze == "Y")
                {
                    chk_WindowsReglaze.Checked = true;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_WindowsReglaze_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsReglazeRepair"]);
                txt_WindowsReglaze_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsReglazeUI"]);
                txt_WindowsReglaze_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsReglazeLocations"]);
                txt_WindowsReglaze_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsReglazeMaterials"]);
                txt_WindowsReglaze_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsReglazeLaborHours"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




                string ReplaceWindowsWeatherStrip = Convert.ToString(dt.Rows[0]["ReplaceWindowsWeatherStrip"]);
                if (ReplaceWindowsWeatherStrip == "Y")
                {
                    chk_WindowsWeatherstrip.Checked = true;
                }


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_WindowsWeatherstrip_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsWeatherStripRepair"]);
                txt_WindowsWeatherstrip_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsWeatherStripUI"]);
                txt_WindowsWeatherstrip_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsWeatherStripLocations"]);
                txt_WindowsWeatherstrip_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsWeatherStripMaterials"]);
                txt_WindowsWeatherstrip_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsWeatherStripLaborHours"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




                string ReplaceWindowsSashLocks = Convert.ToString(dt.Rows[0]["ReplaceWindowsSashLocks"]);
                if (ReplaceWindowsSashLocks == "Y")
                {
                    chk_WindowsSashLock.Checked = true;
                }


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_WindowsSashLock_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsSashLocksRepair"]);
                txt_WindowsSashLock_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsSashLocksUI"]);
                txt_WindowsSashLock_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsSashLocksLocations"]);
                txt_WindowsSashLock_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsSashLocksMaterials"]);
                txt_WindowsSashLock_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsSashLocksLaborHours"]);


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




                string ReplaceWindowsSealing = Convert.ToString(dt.Rows[0]["ReplaceWindowsSealing"]);
                if (ReplaceWindowsSealing == "Y")
                {
                    chk_WindowsSealing.Checked = true;
                }


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_WindowsSealing_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsSealingRepair"]);
                txt_WindowsSealing_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsSealingUI"]);
                txt_WindowsSealing_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsSealingLocations"]);
                txt_WindowsSealing_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsSealingMaterials"]);
                txt_WindowsSealing_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceWindowsSealingLaborHours"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                txt_Other_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceOther1UI"]);
                txt_Other_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceOther1Locations"]);
                txt_Other_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceOther1Materials"]);
                txt_Other_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceOther1LaborHours"]);



                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string ReplaceOtherDryerVents = Convert.ToString(dt.Rows[0]["ReplaceOtherDryerVents"]);
                if (ReplaceOtherDryerVents == "Y")
                {
                    chk_OtherDryerOtherVents.Checked = true;
                }


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_OtherDryerOtherVents_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherDryerVentsRepair"]);
                txt_OtherDryerOtherVents_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherDryerVentsUI"]);
                txt_OtherDryerOtherVents_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherDryerVentsLocations"]);
                txt_OtherDryerOtherVents_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherDryerVentsMaterials"]);
                txt_OtherDryerOtherVents_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherDryerVentsLaborHours"]);


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                string ReplaceOtherFirePlace = Convert.ToString(dt.Rows[0]["ReplaceOtherFirePlace"]);
                if (ReplaceOtherFirePlace == "Y")
                {
                    chk_OtherFireplace.Checked = true;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                txt_OtherFireplace_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherFirePlaceRepair"]);
                txt_OtherFireplace_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherFirePlaceUI"]);
                txt_OtherFireplace_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherFirePlaceLocations"]);
                txt_OtherFireplace_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherFirePlaceMaterials"]);
                txt_OtherFireplace_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherFirePlaceLaborHours"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string ReplaceOtherPlumbing = Convert.ToString(dt.Rows[0]["ReplaceOtherPlumbing"]);
                if (ReplaceOtherPlumbing == "Y")
                {
                    chk_OtherPlumbing.Checked = true;
                }


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_OtherPlumbing_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherPlumbingRepair"]);
                txt_OtherPlumbing_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherPlumbingUI"]);
                txt_OtherPlumbing_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherPlumbingLocations"]);
                txt_OtherPlumbing_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherPlumbingMaterials"]);
                txt_OtherPlumbing_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherPlumbingLaborHours"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string ReplaceOtherElectrical = Convert.ToString(dt.Rows[0]["ReplaceOtherElectrical"]);
                if (ReplaceOtherElectrical == "Y")
                {
                    chk_OtherElectrical.Checked = true;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                txt_OtherElectrical_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherElectricalRepair"]);
                txt_OtherElectrical_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherElectricalUI"]);
                txt_OtherElectrical_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherElectricalLocations"]);
                txt_OtherElectrical_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherElectricalMaterials"]);
                txt_OtherElectrical_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherElectricalLaborHours"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string ReplaceOtherWalls = Convert.ToString(dt.Rows[0]["ReplaceOtherWalls"]);
                if (ReplaceOtherWalls == "Y")
                {
                    chk_OtherWall.Checked = true;
                }


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_OtherWall_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherWallsRepair"]);
                txt_OtherWall_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherWallsUI"]);
                txt_OtherWall_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherWallsLocations"]);
                txt_OtherWall_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherWallsMaterials"]);
                txt_OtherWall_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherWallsLaborHours"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                string ReplaceOtherStairs = Convert.ToString(dt.Rows[0]["ReplaceOtherStairs"]);
                if (ReplaceOtherStairs == "Y")
                {
                    chk_OtherStairs.Checked = true;
                }


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_OtherStairs_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherStairsRepair"]);
                txt_OtherStairs_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherStairsUI"]);
                txt_OtherStairs_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherStairsLocations"]);
                txt_OtherStairs_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherStairsMaterials"]);
                txt_OtherStairs_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherStairsLaborHours"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string ReplaceOtherOther = Convert.ToString(dt.Rows[0]["ReplaceOtherOther"]);
                if (ReplaceOtherOther == "Y")
                {
                    chk_OtherOther.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_OtherOther_Blank.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherOtherRepair"]);
                txt_OtherOther_UI.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherOtherUI"]);
                txt_OtherOther_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherOtherLocations"]);
                txt_OtherOther_Material.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherOtherMaterials"]);
                txt_OtherOther_LaborHr.Text = Convert.ToString(dt.Rows[0]["ReplaceOtherOtherLaborHours"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




                string TopPlates = Convert.ToString(dt.Rows[0]["TopPlates"]);
                if (TopPlates == "Y")
                {
                    chk_AirSealing_TopPlates.Checked = true;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_AirSealing_TopPlates_Material.Text = Convert.ToString(dt.Rows[0]["TopPlatesMaterials"]);
                txt_AirSealing_TopPlates_LaborHr.Text = Convert.ToString(dt.Rows[0]["TopPlatesLabourHours"]);


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string PlumbingPenetrations = Convert.ToString(dt.Rows[0]["PlumbingPenetrations"]);
                if (PlumbingPenetrations == "Y")
                {
                    chk_AirSealing_Plumbing.Checked = true;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////////


                txt_AirSealing_Plumbing_Material.Text = Convert.ToString(dt.Rows[0]["PlumbingPenetrationsMaterials"]);
                txt_AirSealing_Plumbing_LaborHr.Text = Convert.ToString(dt.Rows[0]["PlumbingPenetrationsLaborHours"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////


                string ElectricalPenetrations = Convert.ToString(dt.Rows[0]["ElectricalPenetrations"]);
                if (ElectricalPenetrations == "Y")
                {
                    chk_AirSealing_Electrical.Checked = true;
                }


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_AirSealing_Electrical_Material.Text = Convert.ToString(dt.Rows[0]["ElectricalPenetrationsMaterials"]);
                txt_AirSealing_Electrical_LaborHr.Text = Convert.ToString(dt.Rows[0]["ElectricalPenetrationsLabourHours"]);


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string DroppedCeilings = Convert.ToString(dt.Rows[0]["DroppedCeilings"]);
                if (DroppedCeilings == "Y")
                {
                    chk_AirSealing_DropCeiling.Checked = true;
                }


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_AirSealing_DropCeiling_Material.Text = Convert.ToString(dt.Rows[0]["DroppedCeilingsMaterials"]);
                txt_AirSealing_DropCeiling_LaborHr.Text = Convert.ToString(dt.Rows[0]["DroppedCeilingsLaborHours"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string BulkheadSoffits = Convert.ToString(dt.Rows[0]["BulkheadSoffits"]);
                if (BulkheadSoffits == "Y")
                {
                    chk_AirSealing_BulkheadSoffits.Checked = true;
                }


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                txt_AirSealing_BulkheadSoffits_Material.Text = Convert.ToString(dt.Rows[0]["BulkheadSoffitsMaterials"]);
                txt_AirSealing_BulkheadSoffits_LaborHr.Text = Convert.ToString(dt.Rows[0]["BulkheadSoffitsLabourHours"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                string RecessedFixtures = Convert.ToString(dt.Rows[0]["RecessedFixtures"]);
                if (RecessedFixtures == "Y")
                {
                    chk_AirSealing_RecessedFixtures.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////



                txt_AirSealing_RecessedFixtures_Material.Text = Convert.ToString(dt.Rows[0]["RecessedFixturesMaterials"]);
                txt_AirSealing_RecessedFixtures_LaborHr.Text = Convert.ToString(dt.Rows[0]["RecessedFixturesLabourHours"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string Access = Convert.ToString(dt.Rows[0]["Access"]);
                if (Access == "Y")
                {
                    chk_AirSealing_Access.Checked = true;
                }


                /////////////////////////////////////////////////////////////////////////////////////////////////


                txt_AirSealing_Access_Material.Text = Convert.ToString(dt.Rows[0]["AccessMaterials"]);
                txt_AirSealing_Access_LaborHr.Text = Convert.ToString(dt.Rows[0]["AccessLabourHours"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string Ducts = Convert.ToString(dt.Rows[0]["Ducts"]);
                if (Ducts == "Y")
                {
                    chk_AirSealing_Ducts.Checked = true;
                }


                //////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_AirSealing_Ducts_Material.Text = Convert.ToString(dt.Rows[0]["DuctsMaterials"]);
                txt_AirSealing_Ducts_LaborHr.Text = Convert.ToString(dt.Rows[0]["DuctsLabourHours"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////




                string ACorHTG = Convert.ToString(dt.Rows[0]["ACorHTG"]);
                if (ACorHTG == "Y")
                {
                    chk_AirSealing_AcHtg.Checked = true;
                }


                ///////////////////////////////////////////////////////////////////////////////////////////////////


                txt_AirSealing_AcHtg_Material.Text = Convert.ToString(dt.Rows[0]["ACorHTGMaterials"]);
                txt_AirSealing_AcHtg_LaborHr.Text = Convert.ToString(dt.Rows[0]["ACorHTGLabourHours"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string OpenChaseways = Convert.ToString(dt.Rows[0]["OpenChaseways"]);
                if (OpenChaseways == "Y")
                {
                    chk_AirSealing_OpenChaseways.Checked = true;
                }


                /////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_AirSealing_OpenChaseways_Material.Text = Convert.ToString(dt.Rows[0]["OpenChasewaysMaterials"]);
                txt_AirSealing_OpenChaseways_LaborHr.Text = Convert.ToString(dt.Rows[0]["OpenChasewaysLabourHours"]);


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




                string Other = Convert.ToString(dt.Rows[0]["Other"]);
                if (Other == "Y")
                {
                    chk_AirSealing_Other.Checked = true;
                }


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_AirSealing_Other_Material.Text = Convert.ToString(dt.Rows[0]["OtherMaterial"]);
                txt_AirSealing_LaborHr.Text = Convert.ToString(dt.Rows[0]["OtherLabourHours"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Comment.Text = Convert.ToString(dt.Rows[0]["Page14Comments"]);


            }
        }
        catch
        { }
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
            ////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceDoors = "";
            if (chk_DoorReplace.Checked == true)
            {
                ReplaceDoors = "Y";
            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceDoorsRepair = "";
            if (chk_DoorReplace_Repair.Checked == true)
            {
                ReplaceDoorsRepair = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceDoorsWeatherStrip = "";
            if (chk_DoorWeatherstrip.Checked == true)
            {
                ReplaceDoorsWeatherStrip = "Y";
            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceDoorsSweeps = "";
            if (chk_DoorSweep.Checked == true)
            {
                ReplaceDoorsSweeps = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceDoorsThresholds = "";
            if (chk_DoorThreshold.Checked == true)
            {
                ReplaceDoorsThresholds = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceDoorsSealing = "";
            if (chk_DoorSealing.Checked == true)
            {
                ReplaceDoorsSealing = "Y";
            }


            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceWindows = "";
            if (chk_WindowsReplace.Checked == true)
            {
                ReplaceWindows = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            string ReplaceWindowsRepair = "";
            if (chk_WindowsReplace_Repair.Checked == true)
            {
                ReplaceWindowsRepair = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceWindowsBrokenGlass = "";
            if (chk_WindowsReplace_BrokenGlass.Checked == true)
            {
                ReplaceWindowsBrokenGlass = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceWindowsReglaze = "";
            if (chk_WindowsReglaze.Checked == true)
            {
                ReplaceWindowsReglaze = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            string ReplaceWindowsWeatherStrip = "";
            if (chk_WindowsWeatherstrip.Checked == true)
            {
                ReplaceWindowsWeatherStrip = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceWindowsSashLocks = "";
            if (chk_WindowsSashLock.Checked == true)
            {
                ReplaceWindowsSashLocks = "Y";
            }


            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceWindowsSealing = "";
            if (chk_WindowsSealing.Checked == true)
            {
                ReplaceWindowsSealing = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceOtherDryerVents = "";
            if (chk_OtherDryerOtherVents.Checked == true)
            {
                ReplaceOtherDryerVents = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



            string ReplaceOtherFirePlace = "";
            if (chk_OtherFireplace.Checked == true)
            {
                ReplaceOtherFirePlace = "Y";
            }


            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceOtherPlumbing = "";
            if (chk_OtherPlumbing.Checked == true)
            {
                ReplaceOtherPlumbing = "Y";
            }


            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceOtherElectrical = "";
            if (chk_OtherElectrical.Checked == true)
            {
                ReplaceOtherElectrical = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceOtherWalls = "";
            if (chk_OtherWall.Checked == true)
            {
                ReplaceOtherWalls = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceOtherStairs = "";
            if (chk_OtherStairs.Checked == true)
            {
                ReplaceOtherStairs = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ReplaceOtherOther = "";
            if (chk_OtherOther.Checked == true)
            {
                ReplaceOtherOther = "Y";
            }
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string TopPlates = "";
            if (chk_AirSealing_TopPlates.Checked == true)
            {
                TopPlates = "Y";
            }


            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            string PlumbingPenetrations = "";
            if (chk_AirSealing_Plumbing.Checked == true)
            {
                PlumbingPenetrations = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////


            string ElectricalPenetrations = "";
            if (chk_AirSealing_Electrical.Checked == true)
            {
                ElectricalPenetrations = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            string DroppedCeilings = "";
            if (chk_AirSealing_DropCeiling.Checked == true)
            {
                DroppedCeilings = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string BulkheadSoffits = "";
            if (chk_AirSealing_BulkheadSoffits.Checked == true)
            {
                BulkheadSoffits = "Y";
            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



            string RecessedFixtures = "";
            if (chk_AirSealing_RecessedFixtures.Checked == true)
            {
                RecessedFixtures = "Y";
            }
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            string Access = "";
            if (chk_AirSealing_Access.Checked == true)
            {
                Access = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string Ducts = "";
            if (chk_AirSealing_Ducts.Checked == true)
            {
                Ducts = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string ACorHTG = "";
            if (chk_AirSealing_AcHtg.Checked == true)
            {
                ACorHTG = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string OpenChaseways = "";
            if (chk_AirSealing_OpenChaseways.Checked == true)
            {
                OpenChaseways = "Y";
            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string Other = "";
            if (chk_AirSealing_Other.Checked == true)
            {
                Other = "Y";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////
            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_21(JobNum, txt_Door_UI.Text, txt_Door_Location.Text, txt_Door_Material.Text, txt_Door_LaborHr.Text, ReplaceDoors, ReplaceDoorsRepair, txt_DoorReplace_UI.Text, txt_DoorReplace_Location.Text, txt_DoorReplace_Material.Text, txt_DoorReplace_LaborHr.Text, ReplaceDoorsWeatherStrip, txt_DoorWeatherstrip_Blank.Text, txt_DoorWeatherstrip_UI.Text, txt_DoorWeatherstrip_Location.Text, txt_DoorWeatherstrip_Material.Text, txt_DoorWeatherstrip_LaborHr.Text, ReplaceDoorsSweeps, txt_DoorSweep_Blank.Text, txt_DoorSweep_UI.Text, txt_DoorSweep_Location.Text, txt_DoorSweep_Material.Text, txt_DoorSweep_LaborHr.Text, ReplaceDoorsThresholds, txt_DoorThreshold_Blank.Text, txt_DoorThreshold_UI.Text, txt_DoorThreshold_Location.Text, txt_DoorThreshold_Material.Text, txt_DoorThreshold_LaborHr.Text, ReplaceDoorsSealing, txt_DoorSealing_Blank.Text, txt_DoorSealing_UI.Text, txt_DoorSealing_Location.Text, txt_DoorSealing_Material.Text, txt_DoorSealing_LaborHr.Text, txt_Windows_UI.Text, txt_Windows_Location.Text, txt_Windows_Material.Text, txt_Windows_LaborHr.Text, ReplaceWindows, ReplaceWindowsRepair, txt_WindowsReplace_UI.Text, txt_WindowsReplace_Location.Text, txt_WindowsReplace_Material.Text, txt_WindowsReplace_LaborHr.Text, ReplaceWindowsBrokenGlass, txt_WindowsReplace_BrokenGlass_Blank.Text, txt_WindowsReplace_BrokenGlass_UI.Text, txt_WindowsReplace_BrokenGlass_Location.Text, txt_WindowsReplace_BrokenGlass_Material.Text, txt_WindowsReplace_BrokenGlass_LaborHr.Text, ReplaceWindowsReglaze, txt_WindowsReglaze_Blank.Text, txt_WindowsReglaze_UI.Text, txt_WindowsReglaze_Location.Text, txt_WindowsReglaze_Material.Text, txt_WindowsReglaze_LaborHr.Text, ReplaceWindowsWeatherStrip, txt_WindowsWeatherstrip_Blank.Text, txt_WindowsWeatherstrip_UI.Text, txt_WindowsWeatherstrip_Location.Text, txt_WindowsWeatherstrip_Material.Text, txt_WindowsWeatherstrip_LaborHr.Text, ReplaceWindowsSashLocks, txt_WindowsSashLock_Blank.Text, txt_WindowsSashLock_UI.Text, txt_WindowsSashLock_Location.Text, txt_WindowsSashLock_Material.Text, txt_WindowsSashLock_LaborHr.Text, ReplaceWindowsSealing, txt_WindowsSealing_Blank.Text, txt_WindowsSealing_UI.Text, txt_WindowsSealing_Location.Text, txt_WindowsSealing_Material.Text, txt_WindowsSealing_LaborHr.Text, txt_Other_UI.Text, txt_Other_Location.Text, txt_Other_Material.Text, txt_Other_LaborHr.Text, ReplaceOtherDryerVents, txt_OtherDryerOtherVents_Blank.Text, txt_OtherDryerOtherVents_UI.Text, txt_OtherDryerOtherVents_Location.Text, txt_OtherDryerOtherVents_Material.Text, txt_OtherDryerOtherVents_LaborHr.Text, ReplaceOtherFirePlace, txt_OtherFireplace_Blank.Text, txt_OtherFireplace_UI.Text, txt_OtherFireplace_Location.Text, txt_OtherFireplace_Material.Text, txt_OtherFireplace_LaborHr.Text, ReplaceOtherPlumbing, txt_OtherPlumbing_Blank.Text, txt_OtherPlumbing_UI.Text, txt_OtherPlumbing_Location.Text, txt_OtherPlumbing_Material.Text, txt_OtherPlumbing_LaborHr.Text, ReplaceOtherElectrical, txt_OtherElectrical_Blank.Text, txt_OtherElectrical_UI.Text, txt_OtherElectrical_Location.Text, txt_OtherElectrical_Material.Text, txt_OtherElectrical_LaborHr.Text, ReplaceOtherWalls, txt_OtherWall_Blank.Text, txt_OtherWall_UI.Text, txt_OtherWall_Location.Text, txt_OtherWall_Material.Text, txt_OtherWall_LaborHr.Text, ReplaceOtherStairs, txt_OtherStairs_Blank.Text, txt_OtherStairs_UI.Text, txt_OtherStairs_Location.Text, txt_OtherStairs_Material.Text, txt_OtherStairs_LaborHr.Text, ReplaceOtherOther, txt_OtherOther_Blank.Text, txt_OtherOther_UI.Text, txt_OtherOther_Location.Text, txt_OtherOther_Material.Text, txt_OtherOther_LaborHr.Text, TopPlates, txt_AirSealing_TopPlates_Material.Text, txt_AirSealing_TopPlates_LaborHr.Text, PlumbingPenetrations, txt_AirSealing_Plumbing_Material.Text, txt_AirSealing_Plumbing_LaborHr.Text, ElectricalPenetrations, txt_AirSealing_Electrical_Material.Text, txt_AirSealing_Electrical_LaborHr.Text, DroppedCeilings, txt_AirSealing_DropCeiling_Material.Text, txt_AirSealing_DropCeiling_LaborHr.Text, BulkheadSoffits, txt_AirSealing_BulkheadSoffits_Material.Text, txt_AirSealing_BulkheadSoffits_LaborHr.Text, RecessedFixtures, txt_AirSealing_RecessedFixtures_Material.Text, txt_AirSealing_RecessedFixtures_LaborHr.Text, Access, txt_AirSealing_Access_Material.Text, txt_AirSealing_Access_LaborHr.Text, Ducts, txt_AirSealing_Ducts_Material.Text, txt_AirSealing_Ducts_LaborHr.Text, ACorHTG, txt_AirSealing_AcHtg_Material.Text, txt_AirSealing_AcHtg_LaborHr.Text, OpenChaseways, txt_AirSealing_OpenChaseways_Material.Text, txt_AirSealing_OpenChaseways_LaborHr.Text, Other, txt_AirSealing_Other_Material.Text, txt_AirSealing_LaborHr.Text, txt_Comment.Text);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }
}
