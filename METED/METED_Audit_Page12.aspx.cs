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

public partial class METED_METED_Audit_Page12 : System.Web.UI.Page
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
            DataTable dt = obj_MetedAudit.GetMETEDAudit_12(JobNum);
            if (dt.Rows.Count > 0)
            {
                string FossilFuelAdditionalDuctRun = Convert.ToString(dt.Rows[0]["FossilFuelAdditionalDuctRun"]);
                if (FossilFuelAdditionalDuctRun == "Y")
                {
                    rdo_AddDuctRun_Yes.Checked = true;
                }
                else if (FossilFuelAdditionalDuctRun == "N")
                {
                    rdo_AddDuctRun_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Ceiling_Location1.Text = Convert.ToString(dt.Rows[0]["Ceiling_Location"]);
                txt_Wall_Location.Text = Convert.ToString(dt.Rows[0]["Wall_Location"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string PrimaryHeatingSource = Convert.ToString(dt.Rows[0]["PrimaryHeatingSource"]);
                switch (PrimaryHeatingSource)
                {
                    case "1":
                        rdo_PriHeatSource_UtilityGas.Checked = true;
                        break;
                    case "2":
                        rdo_PriHeatSource_FuelOil.Checked = true;
                        break;
                    case "3":
                        rdo_PriHeatSource_Wood.Checked = true;
                        break;
                    case "4":
                        rdo_PriHeatSource_Coal.Checked = true;
                        break;
                    case "5":
                        rdo_PriHeatSource_Solar.Checked = true;
                        break;
                    case "6":
                        rdo_PriHeatSource_CitySteam.Checked = true;
                        break;
                    case "7":
                        rdo_PriHeatSource_BottleGas.Checked = true;
                        break;
                    case "8":
                        rdo_PriHeatSource_Kerosene.Checked = true;
                        break;
                    case "99":
                        rdo_PriHeatSource_Other.Checked = true;
                        break;
                    default:
                        break;
                }

                ////////////////////////////////////////////////////////////////////////////////

                string ElectricSpaceHeating = Convert.ToString(dt.Rows[0]["ElectricSpaceHeating"]);
                if (ElectricSpaceHeating == "Y")
                {
                    rdo_ElectricSpaceHeat_Yes.Checked = true;
                }
                else if (ElectricSpaceHeating == "N")
                {
                    rdo_ElectricSpaceHeat_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ListMeasureInstall.Text = Convert.ToString(dt.Rows[0]["ListMeasuresInstallComment"]);
                txt_BlowerDoorTet_NotComplete.Text = Convert.ToString(dt.Rows[0]["BlowerDoorTestNotCompleteComment"]);
                txt_Location_1_AirLeaks.Text = Convert.ToString(dt.Rows[0]["LocationOfAirLeaks1_1"]);
                txt_Location_2_AirLeaks.Text = Convert.ToString(dt.Rows[0]["LocationOfAirLeaks1_2"]);
                txt_Location_3_AirLeaks.Text = Convert.ToString(dt.Rows[0]["LocationOfAirLeaks2_1"]);
                txt_Location_4_AirLeaks.Text = Convert.ToString(dt.Rows[0]["LocationOfAirLeaks2_2"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string LiveKnobTube = Convert.ToString(dt.Rows[0]["LiveKnobTube"]);
                if (LiveKnobTube == "Y")
                {
                    rdo_LiveKnobTube_Yes.Checked = true;
                }
                else if (LiveKnobTube == "N")
                {
                    rdo_LiveKnobTube_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_LiveKnobTube_Location.Text = Convert.ToString(dt.Rows[0]["LiveKnobTubeLocation"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string LiveKnobTubeAbatement = Convert.ToString(dt.Rows[0]["LiveKnobTubeAbatement"]);
                if (LiveKnobTubeAbatement == "Y")
                {
                    rdo_Abatement_Yes.Checked = true;
                }
                else if (LiveKnobTubeAbatement == "N")
                {
                    rdo_Abatement_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string EvidenceOfMold = Convert.ToString(dt.Rows[0]["EvidenceOfMold"]);
                if (EvidenceOfMold == "Y")
                {
                    rdo_EvidenceMold_Yes.Checked = true;
                }
                else if (EvidenceOfMold == "N")
                {
                    rdo_EvidenceMold_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string EvidenceOfMoisture = Convert.ToString(dt.Rows[0]["EvidenceOfMoisture"]);
                if (EvidenceOfMoisture == "Y")
                {
                    rdo_EvidenceMoisture_Yes.Checked = true;
                }
                else if (EvidenceOfMoisture == "N")
                {
                    rdo_EvidenceMoisture_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_EvidenceMoisture_Location.Text = Convert.ToString(dt.Rows[0]["EvidenceOfMoistureLocation"]);
                txt_AnyStructuralProb.Text = Convert.ToString(dt.Rows[0]["RoofLeaksPoorDrainageComment"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string KitchenExisting = Convert.ToString(dt.Rows[0]["KitchenExisting"]);
                if (KitchenExisting == "Y")
                {
                    rdo_Kitchen_Existing_Yes.Checked = true;
                }
                else if (KitchenExisting == "N")
                {
                    rdo_Kitchen_Existing_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Kitchen_MeasuredFanFlow.Text = Convert.ToString(dt.Rows[0]["KitchenMeasuredFanFlow"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string KitchenCFMAdd = Convert.ToString(dt.Rows[0]["KitchenCFMAdd"]);
                if (KitchenCFMAdd == "Y")
                {
                    rdo_Kitchen_CFM_Yes.Checked = true;
                }
                else if (KitchenCFMAdd == "N")
                {
                    rdo_Kitchen_CFM_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string VentsOutRecirculates = Convert.ToString(dt.Rows[0]["VentsOutRecirculates"]);
                if (VentsOutRecirculates == "Y")
                {
                    chk_Kitchen_VentRecirculates.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Kitchen_VentRecirculates.Text = Convert.ToString(dt.Rows[0]["VentsOutRecirculatesComment"]);
                txt_Kitchen_Comment.Text = Convert.ToString(dt.Rows[0]["KitchenComment"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathroom1Existing = Convert.ToString(dt.Rows[0]["Bathroom1Existing"]);
                if (Bathroom1Existing == "Y")
                {
                    rdo_1stFloorBathrooms_Exist_Yes.Checked = true;
                }
                else if (Bathroom1Existing == "N")
                {
                    rdo_1stFloorBathrooms_Exist_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_1stFloorBathrooms_MeasuredFanFlow.Text = Convert.ToString(dt.Rows[0]["Bathroom1MeasureFanFlow"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathroom1CFMAdd = Convert.ToString(dt.Rows[0]["Bathroom1CFMAdd"]);
                if (Bathroom1CFMAdd == "Y")
                {
                    rdo_1stFloorBathrooms_CFM_Yes.Checked = true;
                }
                else if (Bathroom1CFMAdd == "N")
                {
                    rdo_1stFloorBathrooms_CFM_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathrooms1LightExisting = Convert.ToString(dt.Rows[0]["Bathrooms1LightExisting"]);
                if (Bathrooms1LightExisting == "Y")
                {
                    rdo_1stFloorBathrooms_LightExist_Yes.Checked = true;
                }
                else if (Bathrooms1LightExisting == "N")
                {
                    rdo_1stFloorBathrooms_LightExist_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathroom1ReplaceRequireLight = Convert.ToString(dt.Rows[0]["Bathroom1ReplaceRequireLight"]);
                if (Bathroom1ReplaceRequireLight == "Y")
                {
                    rdo_1stFloorBathrooms_ReplaceLight_Yes.Checked = true;
                }
                else if (Bathroom1ReplaceRequireLight == "N")
                {
                    rdo_1stFloorBathrooms_ReplaceLight_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathroom1FanOwnSwitch = Convert.ToString(dt.Rows[0]["Bathroom1FanOwnSwitch"]);
                if (Bathroom1FanOwnSwitch == "Y")
                {
                    rdo_1stFloorBathrooms_FanOwnSwitch_Yes.Checked = true;
                }
                else if (Bathroom1FanOwnSwitch == "N")
                {
                    rdo_1stFloorBathrooms_FanOwnSwitch_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathroom1FanShareSwitch = Convert.ToString(dt.Rows[0]["Bathroom1FanShareSwitch"]);
                if (Bathroom1FanShareSwitch == "Y")
                {
                    rdo_1stFloorBathrooms_FanShareSwitch_Yes.Checked = true;
                }
                else if (Bathroom1FanShareSwitch == "N")
                {
                    rdo_1stFloorBathrooms_FanShareSwitch_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_1stFloorBathrooms_Comment.Text = Convert.ToString(dt.Rows[0]["Bathroom1Comment"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathroom2Existing = Convert.ToString(dt.Rows[0]["Bathroom2Existing"]);
                if (Bathroom2Existing == "Y")
                {
                    rdo_2ndFloorBathrooms_Exist_Yes.Checked = true;
                }
                else if (Bathroom2Existing == "N")
                {
                    rdo_2ndFloorBathrooms_Exist_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_2ndFloorBathrooms_MeasuredFanFlow.Text = Convert.ToString(dt.Rows[0]["Bathroom2MeasureFanFlow"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathroom2CFMAdd = Convert.ToString(dt.Rows[0]["Bathroom2CFMAdd"]);
                if (Bathroom2CFMAdd == "Y")
                {
                    rdo_2ndFloorBathrooms_CFM_Yes.Checked = true;
                }
                else if (Bathroom2CFMAdd == "N")
                {
                    rdo_2ndFloorBathrooms_CFM_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathrooms2LightExisting = Convert.ToString(dt.Rows[0]["Bathrooms2LightExisting"]);
                if (Bathrooms2LightExisting == "Y")
                {
                    rdo_2ndFloorBathrooms_LightExist_Yes.Checked = true;
                }
                else if (Bathrooms2LightExisting == "N")
                {
                    rdo_2ndFloorBathrooms_LightExist_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathroom2ReplaceRequireLight = Convert.ToString(dt.Rows[0]["Bathroom2ReplaceRequireLight"]);
                if (Bathroom2ReplaceRequireLight == "Y")
                {
                    rdo_2ndFloorBathrooms_ReplaceLight_Yes.Checked = true;
                }
                else if (Bathroom2ReplaceRequireLight == "N")
                {
                    rdo_2ndFloorBathrooms_ReplaceLight_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathroom2FanOwnSwitch = Convert.ToString(dt.Rows[0]["Bathroom2FanOwnSwitch"]);
                if (Bathroom2FanOwnSwitch == "Y")
                {
                    rdo_2ndFloorBathrooms_FanOwnSwitch_Yes.Checked = true;
                }
                else if (Bathroom2FanOwnSwitch == "N")
                {
                    rdo_2ndFloorBathrooms_FanOwnSwitch_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string Bathroom2FanShareSwitch = Convert.ToString(dt.Rows[0]["Bathroom2FanShareSwitch"]);
                if (Bathroom2FanShareSwitch == "Y")
                {
                    rdo_2ndFloorBathrooms_FanShareSwitch_Yes.Checked = true;
                }
                else if (Bathroom2FanShareSwitch == "N")
                {
                    rdo_2ndFloorBathrooms_FanShareSwitch_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_2ndFloorBathrooms_Comment.Text = Convert.ToString(dt.Rows[0]["Bathroom2Comment"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string AddingFanCeiling = Convert.ToString(dt.Rows[0]["AddingFanCeiling"]);
                if (AddingFanCeiling == "Y")
                {
                    rdo_AddFan_Ceiling_Yes.Checked = true;
                }
                else if (AddingFanCeiling == "N")
                {
                    rdo_AddFan_Ceiling_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_AddFan_Ceiling_Size.Text = Convert.ToString(dt.Rows[0]["AddingFanCeilingComment"]);
                //txt_AddFan_Ceiling_Size.Text = Convert.ToString(dt.Rows[0]["AddingFanCeilingComment"]);
                //txt_AddFan_Ceiling_Size.Text = Convert.ToString(dt.Rows[0]["AddingFanCeilingComment"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string AddingFanWall = Convert.ToString(dt.Rows[0]["AddingFanWall"]);
                if (AddingFanWall == "Y")
                {
                    rdo_AddFan_Wall_Yes.Checked = true;
                }
                else if (AddingFanWall == "N")
                {
                    rdo_AddFan_Wall_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////
                txt_AddFan_Wall_Size.Text = Convert.ToString(dt.Rows[0]["AddingFanWallComment"]);
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

            string FossilFuelAdditionalDuctRun = "";
            if (rdo_AddDuctRun_Yes.Checked == true)
            {
                FossilFuelAdditionalDuctRun = "Y";
            }
            else if (rdo_AddDuctRun_No.Checked == true)
            {
                FossilFuelAdditionalDuctRun = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string PrimaryHeatingSource = "";
            if (rdo_PriHeatSource_UtilityGas.Checked == true)
            {
                PrimaryHeatingSource = "1";
            }
            else if (rdo_PriHeatSource_FuelOil.Checked == true)
            {
                PrimaryHeatingSource = "2";
            }
            else if (rdo_PriHeatSource_Wood.Checked == true)
            {
                PrimaryHeatingSource = "3";
            }
            else if (rdo_PriHeatSource_Coal.Checked == true)
            {
                PrimaryHeatingSource = "4";
            }
            else if (rdo_PriHeatSource_Solar.Checked == true)
            {
                PrimaryHeatingSource = "5";
            }
            else if (rdo_PriHeatSource_CitySteam.Checked == true)
            {
                PrimaryHeatingSource = "6";
            }
            else if (rdo_PriHeatSource_BottleGas.Checked == true)
            {
                PrimaryHeatingSource = "7";
            }
            else if (rdo_PriHeatSource_Kerosene.Checked == true)
            {
                PrimaryHeatingSource = "8";
            }
            else if (rdo_PriHeatSource_Other.Checked == true)
            {
                PrimaryHeatingSource = "99";
            }

            ////////////////////////////////////////////////////////////////////////////////

            string ElectricSpaceHeating = "";
            if (rdo_ElectricSpaceHeat_Yes.Checked == true)
            {
                ElectricSpaceHeating = "Y";
            }
            else if (rdo_ElectricSpaceHeat_No.Checked == true)
            {
                ElectricSpaceHeating = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string LiveKnobTube = "";
            if (rdo_LiveKnobTube_Yes.Checked == true)
            {
                LiveKnobTube = "Y";
            }
            else if (rdo_LiveKnobTube_No.Checked == true)
            {
                LiveKnobTube = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string LiveKnobTubeAbatement = "";
            if (rdo_Abatement_Yes.Checked == true)
            {
                LiveKnobTubeAbatement = "Y";
            }
            else if (rdo_Abatement_No.Checked == true)
            {
                LiveKnobTubeAbatement = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string EvidenceOfMold = "";
            if (rdo_EvidenceMold_Yes.Checked == true)
            {
                EvidenceOfMold = "Y";
            }
            else if (rdo_EvidenceMold_No.Checked == true)
            {
                EvidenceOfMold = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string EvidenceOfMoisture = "";
            if (rdo_EvidenceMoisture_Yes.Checked == true)
            {
                EvidenceOfMoisture = "Y";
            }
            else if (rdo_EvidenceMoisture_No.Checked == true)
            {
                EvidenceOfMoisture = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string KitchenExisting = "";
            if (rdo_Kitchen_Existing_Yes.Checked == true)
            {
                KitchenExisting = "Y";
            }
            else if (rdo_Kitchen_Existing_No.Checked == true)
            {
                KitchenExisting = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string KitchenCFMAdd = "";
            if (rdo_Kitchen_CFM_Yes.Checked == true)
            {
                KitchenCFMAdd = "Y";
            }
            else if (rdo_Kitchen_CFM_No.Checked == true)
            {
                KitchenCFMAdd = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string VentsOutRecirculates = "";
            if (chk_Kitchen_VentRecirculates.Checked == true)
            {
                VentsOutRecirculates = "Y";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathroom1Existing = "";
            if (rdo_1stFloorBathrooms_Exist_Yes.Checked == true)
            {
                Bathroom1Existing = "Y";
            }
            else if (rdo_1stFloorBathrooms_Exist_No.Checked == true)
            {
                Bathroom1Existing = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathroom1CFMAdd = "";
            if (rdo_1stFloorBathrooms_CFM_Yes.Checked == true)
            {
                Bathroom1CFMAdd = "Y";
            }
            else if (rdo_1stFloorBathrooms_CFM_No.Checked == true)
            {
                Bathroom1CFMAdd = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathrooms1LightExisting = "";
            if (rdo_1stFloorBathrooms_LightExist_Yes.Checked == true)
            {
                Bathrooms1LightExisting = "Y";
            }
            else if (rdo_1stFloorBathrooms_LightExist_No.Checked == true)
            {
                Bathrooms1LightExisting = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathroom1ReplaceRequireLight = "";
            if (rdo_1stFloorBathrooms_ReplaceLight_Yes.Checked == true)
            {
                Bathroom1ReplaceRequireLight = "Y";
            }
            else if (rdo_1stFloorBathrooms_ReplaceLight_No.Checked == true)
            {
                Bathroom1ReplaceRequireLight = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathroom1FanOwnSwitch = "";
            if (rdo_1stFloorBathrooms_FanOwnSwitch_Yes.Checked == true)
            {
                Bathroom1FanOwnSwitch = "Y";
            }
            else if (rdo_1stFloorBathrooms_FanOwnSwitch_No.Checked == true)
            {
                Bathroom1FanOwnSwitch = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathroom1FanShareSwitch = "";
            if (rdo_1stFloorBathrooms_FanShareSwitch_Yes.Checked == true)
            {
                Bathroom1FanShareSwitch = "Y";
            }
            else if (rdo_1stFloorBathrooms_FanShareSwitch_No.Checked == true)
            {
                Bathroom1FanShareSwitch = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathroom2Existing = "";
            if (rdo_2ndFloorBathrooms_Exist_Yes.Checked == true)
            {
                Bathroom2Existing = "Y";
            }
            else if (rdo_2ndFloorBathrooms_Exist_No.Checked == true)
            {
                Bathroom2Existing = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathroom2CFMAdd = "";
            if (rdo_2ndFloorBathrooms_CFM_Yes.Checked == true)
            {
                Bathroom2CFMAdd = "Y";
            }
            else if (rdo_2ndFloorBathrooms_CFM_No.Checked == true)
            {
                Bathroom2CFMAdd = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathrooms2LightExisting = "";
            if (rdo_2ndFloorBathrooms_LightExist_Yes.Checked == true)
            {
                Bathrooms2LightExisting = "Y";
            }
            else if (rdo_2ndFloorBathrooms_LightExist_No.Checked == true)
            {
                Bathrooms2LightExisting = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathroom2ReplaceRequireLight = "";
            if (rdo_2ndFloorBathrooms_ReplaceLight_Yes.Checked == true)
            {
                Bathroom2ReplaceRequireLight = "Y";
            }
            else if (rdo_2ndFloorBathrooms_ReplaceLight_No.Checked == true)
            {
                Bathroom2ReplaceRequireLight = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathroom2FanOwnSwitch = "";
            if (rdo_2ndFloorBathrooms_FanOwnSwitch_Yes.Checked == true)
            {
                Bathroom2FanOwnSwitch = "Y";
            }
            else if (rdo_2ndFloorBathrooms_FanOwnSwitch_No.Checked == true)
            {
                Bathroom2FanOwnSwitch = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string Bathroom2FanShareSwitch = "";
            if (rdo_2ndFloorBathrooms_FanShareSwitch_Yes.Checked == true)
            {
                Bathroom2FanShareSwitch = "Y";
            }
            else if (rdo_2ndFloorBathrooms_FanShareSwitch_No.Checked == true)
            {
                Bathroom2FanShareSwitch = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string AddingFanCeiling = "";
            if (rdo_AddFan_Ceiling_Yes.Checked == true)
            {
                AddingFanCeiling = "Y";
            }
            else if (rdo_AddFan_Ceiling_No.Checked == true)
            {
                AddingFanCeiling = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////

            string AddingFanWall = "";
            if (rdo_AddFan_Wall_Yes.Checked == true)
            {
                AddingFanWall = "Y";
            }
            else if (rdo_AddFan_Wall_No.Checked == true)
            {
                AddingFanWall = "N";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////
            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_12(JobNum, FossilFuelAdditionalDuctRun, PrimaryHeatingSource, ElectricSpaceHeating, txt_ListMeasureInstall.Text, txt_BlowerDoorTet_NotComplete.Text, txt_Location_1_AirLeaks.Text, txt_Location_2_AirLeaks.Text, txt_Location_3_AirLeaks.Text, txt_Location_4_AirLeaks.Text, LiveKnobTube, txt_LiveKnobTube_Location.Text, LiveKnobTubeAbatement, EvidenceOfMold, EvidenceOfMoisture, txt_EvidenceMoisture_Location.Text, txt_AnyStructuralProb.Text, KitchenExisting, txt_Kitchen_MeasuredFanFlow.Text, KitchenCFMAdd, VentsOutRecirculates, txt_Kitchen_VentRecirculates.Text, txt_Kitchen_Comment.Text, Bathroom1Existing, txt_1stFloorBathrooms_MeasuredFanFlow.Text, Bathroom1CFMAdd, Bathrooms1LightExisting, Bathroom1ReplaceRequireLight, Bathroom1FanOwnSwitch, Bathroom1FanShareSwitch, txt_1stFloorBathrooms_Comment.Text, Bathroom2Existing, txt_2ndFloorBathrooms_MeasuredFanFlow.Text, Bathroom2CFMAdd, Bathrooms2LightExisting, Bathroom2ReplaceRequireLight, Bathroom2FanOwnSwitch, Bathroom2FanShareSwitch, txt_2ndFloorBathrooms_Comment.Text, AddingFanCeiling, txt_AddFan_Ceiling_Size.Text, AddingFanWall, txt_AddFan_Wall_Size.Text, txt_Wall_Location.Text, txt_Ceiling_Location1.Text,string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }

}
