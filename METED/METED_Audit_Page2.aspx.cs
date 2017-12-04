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

public partial class METED_METED_Audit_Page2 : System.Web.UI.Page
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
            int AirConditioning, PrimaryHeatingSource, TypeOfHeatingSystem, SupplementalHeat, ContributionOfSupplementalHeat, WaterHeaterFuelType;
            int OccupancyType, StructureType;
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_2(JobNum);
            DateTime dateRec = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]);
            DateTime dateComr = Convert.ToDateTime("1/12/2015");
            if (dateRec < dateComr)
            {
                tr_CunstructionType.Visible = false;
                rdo_SupplementalHeat_PelletStove.Visible = false;
                spn_PelletStove.Visible = false;
                rdo_SupplementalHeat_SpaceHeater.Visible = false;
                spn_SpaceHeater.Visible = false;
                tr_electricSpaceHeater.Visible = false;
            }
            else
            {

            }


            if (dt.Rows.Count > 0)
            {
                txt_Occupants_under19.Text = Convert.ToString(dt.Rows[0]["AgesUnder19"]);
                txt_Occupants_19_to_62.Text = Convert.ToString(dt.Rows[0]["Ages19To62"]);
                txt_Occupants_Over62.Text = Convert.ToString(dt.Rows[0]["AgesOver62"]);
                if (Convert.ToString(dt.Rows[0]["OccupancyType"]) == "")
                {
                    OccupancyType = 0;
                }
                else
                {
                    OccupancyType = Convert.ToInt32(dt.Rows[0]["OccupancyType"]);
                }

                switch (OccupancyType)
                {
                    case 1:
                        rdo_Occupancy_Own.Checked = true;
                        break;
                    case 2:
                        rdo_Occupancy_Rent.Checked = true;
                        break;

                    case 99:
                        rdo_Occupancy_Other.Checked = true;
                        break;
                    default:
                        break;
                }

                //---------------------------------------
                //Fill SpaceHeater

                string SpaceHeater = Convert.ToString(dt.Rows[0]["SpaceHeater"]);
                switch (SpaceHeater)
                {
                    case "1":
                        chk_SpaceHeater_NoHeat.Checked = true;
                        break;
                    case "2":
                        chk_SpaceHeater_notWork.Checked = true;
                        break;
                    case "3":
                        chk_SpaceHeater_AdditionalHeat.Checked = true;
                        break;
                    case "4":
                        chk_SpaceHeater_Other.Checked = true;
                        txt_SpaceHeater_Other.Text = Convert.ToString(dt.Rows[0]["SpaceHeater_Other_Cmmnt"]);
                        break;
                    default:
                        break;
                }

                //----------------------------------
                //Fill Cunstruction Type  
                string Cunstruction_Type = Convert.ToString(dt.Rows[0]["CunstructionType"]);
                if (Cunstruction_Type == "")
                { Cunstruction_Type = "0"; }
                int CunstructionType = Convert.ToInt32(Cunstruction_Type);
                switch (CunstructionType)
                {
                    case 1:
                        rdo_Cunstruction_Block.Checked = true;
                        break;
                    case 2:
                        rdo_Cunstruction_WoodKnee.Checked = true;
                        break;
                    case 3:
                        rdo_Cunstruction_WoodFull.Checked = true;
                        break;
                    case 4:
                        rdo_Cunstruction_WoodSpace.Checked = true;
                        break;
                    case 5:
                        rdo_Cunstruction_WoodCrawl.Checked = true;
                        break;
                    case 6:
                        rdo_Cunstruction_WoodPost.Checked = true;
                        break;
                    case 7:
                        rdo_Cunstruction_Mobile.Checked = true;
                        break;
                    case 8:
                        rdo_Cunstruction_WoodSlab.Checked = true;
                        break;
                    case 99:
                        rdo_Cunstruction_Other.Checked = true;
                        break;
                    default:
                        break;
                }
                //-----------------------------


                // Fill Structure Type CheckBox

                if (Convert.ToString(dt.Rows[0]["StructureType"]) == "")
                {
                    StructureType = 0;
                }
                else
                {
                    StructureType = Convert.ToInt32(dt.Rows[0]["StructureType"]);
                }
                switch (StructureType)
                {
                    case 1:
                        chk_Structure_Story.Checked = true;
                        break;
                    case 2:
                        chk_Structure_Ranch.Checked = true;
                        break;
                    case 3:
                        chk_Structure_Blevel.Checked = true;
                        break;
                    case 4:
                        chk_Structure_Mobile.Checked = true;
                        break;
                    case 5:
                        chk_Structure_RowInside.Checked = true;
                        break;
                    case 6:
                        chk_Structure_RowOutside.Checked = true;
                        break;
                    case 7:
                        chk_Structure_Duplex.Checked = true;
                        break;
                    case 8:
                        chk_Structure_Multi.Checked = true;
                        break;
                    case 10:
                        chk_Structure_Modular.Checked = true;
                        break;

                    case 99:
                        chk_Structure_Other.Checked = true;
                        break;
                    default:
                        break;
                }

                txt_Structure_Other.Text = Convert.ToString(dt.Rows[0]["OtherStructureTypeComments"]);
                txt_YearConstructed.Text = Convert.ToString(dt.Rows[0]["YearConstructed"]);
                txt_ElectricallyHeatedArea.Text = Convert.ToString(dt.Rows[0]["SizeOfElectricallyHeatedArea"]);

                string StrTemp = Convert.ToString(dt.Rows[0]["TypeOfAirConditioning"]);
                switch (StrTemp)
                {
                    case "1":
                        chk_AirConditioning_Central.Checked = true;
                        break;
                    case "2":
                        chk_AirConditioning_WindowUnits.Checked = true;
                        break;
                    case "3":
                        chk_AirConditioning_WallUnits.Checked = true;
                        break;
                    case "4":
                        chk_AirConditioning_HeatPump.Checked = true;
                        break;
                    case "5":
                        chk_AirConditioning_None.Checked = true;
                        break;

                    case "99":
                        chk_AirConditioning_Other.Checked = true;
                        break;
                    default:
                        break;
                }


                txt_AirConditioning_Other.Text = Convert.ToString(dt.Rows[0]["OtherTypeOfAirConditioning"]);
                txt_WindoworWall.Text = Convert.ToString(dt.Rows[0]["NumberOfWindowOrWallACUnits"]);
                txt_Rooms.Text = Convert.ToString(dt.Rows[0]["NumberRoomsAirConditioned"]);
                txt_AreaCooled.Text = Convert.ToString(dt.Rows[0]["SizeOfAreaCooled"]);
                if (dt.Rows[0]["PrimaryHeatingSource"].ToString() == "")
                {
                    PrimaryHeatingSource = 0;
                }
                else
                {
                    PrimaryHeatingSource = Convert.ToInt32(dt.Rows[0]["PrimaryHeatingSource"]);
                    switch (PrimaryHeatingSource)
                    {
                        case 1:
                            rdo_PrimaryHeatingSource_Electric.Checked = true;
                            break;
                        case 2:
                            rdo_PrimaryHeatingSource_UtilityGas.Checked = true;
                            break;
                        case 3:
                            rdo_PrimaryHeatingSource_FuelOil.Checked = true;
                            break;
                        case 4:
                            rdo_PrimaryHeatingSource_Wood.Checked = true;
                            break;
                        case 5:
                            rdo_PrimaryHeatingSource_Coal.Checked = true;
                            break;
                        case 6:
                            rdo_PrimaryHeatingSource_Solar.Checked = true;
                            break;
                        case 7:
                            rdo_PrimaryHeatingSource_CitySteam.Checked = true;
                            break;
                        case 8:
                            rdo_PrimaryHeatingSource_BottelGas.Checked = true;
                            break;
                        case 9:
                            rdo_PrimaryHeatingSource_Kerosene.Checked = true;
                            break;
                        case 99:
                            rdo_PrimaryHeatingSource_Other.Checked = true;
                            txt_PrimaryHeatingSource_Other.Text = Convert.ToString(dt.Rows[0]["PrimaryHeatingSourceOther"]);
                            break;
                        default:
                            break;
                    }
                }
                if (Convert.ToString(dt.Rows[0]["HeatingSystem"]) == "")
                {
                    PrimaryHeatingSource = 0;
                }
                else
                {
                    TypeOfHeatingSystem = Convert.ToInt32(dt.Rows[0]["HeatingSystem"]);
                    switch (TypeOfHeatingSystem)
                    {
                        case 1:
                            rdo_HeatingSystem_ElectricBaseboard.Checked = true;
                            break;
                        case 2:
                            rdo_HeatingSystem_ElectricHeatPump.Checked = true;
                            break;
                        case 3:
                            rdo_HeatingSystem_ElectricBoiler.Checked = true;
                            break;
                        case 4:
                            rdo_HeatingSystem_ElectricFurnace.Checked = true;
                            break;
                        case 5:
                            rdo_HeatingSystem_ElectricRadiant.Checked = true;
                            break;
                        case 6:
                            rdo_HeatingSystem_ElectricWallBlowers.Checked = true;
                            break;
                        case 7:
                            rdo_HeatingSystem_GasFurnace.Checked = true;
                            break;
                        case 8:
                            rdo_HeatingSystem_Gas_Boiler.Checked = true;
                            break;
                        case 9:
                            rdo_HeatingSystem_OilFurnace.Checked = true;
                            break;
                        case 10:
                            rdo_HeatingSystem_OilBoiler.Checked = true;
                            break;
                        case 99:
                            rdo_HeatingSystem_Other.Checked = true;
                            txt_HeatingSystem_Other.Text = Convert.ToString(dt.Rows[0]["HeatingSystemOther"]);
                            break;
                        default:
                            break;
                    }
                }
                if (Convert.ToString(dt.Rows[0]["SupplementalHeat"]) == "")
                {
                    SupplementalHeat = 0;
                }
                else
                {
                    SupplementalHeat = Convert.ToInt32(dt.Rows[0]["SupplementalHeat"]);
                    switch (SupplementalHeat)
                    {
                        case 00:
                            rdo_SupplementalHeat_None.Checked = true;
                            break;
                        case 1:
                            rdo_SupplementalHeat_FuelOil.Checked = true;
                            break;
                        case 2:
                            rdo_SupplementalHeat_UtilityGas.Checked = true;
                            break;
                        case 3:
                            rdo_SupplementalHeat_BottleGas.Checked = true;
                            break;
                        case 4:
                            rdo_SupplementalHeat_Electricity.Checked = true;
                            break;
                        case 5:
                            rdo_SupplementalHeat_Coal.Checked = true;
                            break;
                        case 6:
                            rdo_SupplementalHeat_CitySteam.Checked = true;
                            break;
                        case 7:
                            rdo_SupplementalHeat_Wood.Checked = true;
                            break;
                        case 8:
                            rdo_SupplementalHeat_Solar.Checked = true;
                            break;
                        case 9:
                            rdo_SupplementalHeat_PelletStove.Checked = true;
                            break;
                        case 10:
                            rdo_SupplementalHeat_SpaceHeater.Checked = true;
                            break;

                        case 99:
                            rdo_SupplementalHeat_Other.Checked = true;
                            break;
                        default:
                            break;
                        //
                    }
                }

                txt_SupplementalHeat_Other.Text = Convert.ToString(dt.Rows[0]["SupplementalHeatOther"]);
                if (Convert.ToString(dt.Rows[0]["MainSupplementalHeat"]) == "")
                {
                    ContributionOfSupplementalHeat = 0;
                }
                else
                {
                    ContributionOfSupplementalHeat = Convert.ToInt32(dt.Rows[0]["MainSupplementalHeat"]);
                    switch (ContributionOfSupplementalHeat)
                    {

                        case 1:
                            rdo_HouseholdHeating_TotallyHeated.Checked = true;
                            break;
                        case 2:
                            rdo_HouseholdHeating_MostHtg.Checked = true;
                            break;
                        case 3:
                            rdo_HouseholdHeating_LessThanHalf.Checked = true;
                            break;
                        case 4:
                            rdo_HouseholdHeating_SupplementalHeatSeldom.Checked = true;
                            break;
                        case 5:
                            rdo_HouseholdHeating_SupplHeat.Checked = true;
                            break;
                        case 6:
                            rdo_HouseholdHeating_NotSupplementalHeat.Checked = true;
                            break;
                        case 99:
                            rdo_HouseholdHeating_other.Checked = true;
                            txt_HouseholdHeating_Other.Text = Convert.ToString(dt.Rows[0]["MainSupplementalHeatOther"]);
                            break;
                        default:
                            break;
                    }
                }
                txt_Location.Text = Convert.ToString(dt.Rows[0]["MainSupplementalHeatLocation"]);
                txt_unblockedFireplaces.Text = Convert.ToString(dt.Rows[0]["CustomerDwelling"]);
                if (Convert.ToString(dt.Rows[0]["WaterHeaterFuelType"]) == "")
                {
                    WaterHeaterFuelType = 0;
                }
                else
                {
                    WaterHeaterFuelType = Convert.ToInt32(dt.Rows[0]["WaterHeaterFuelType"]);
                    switch (WaterHeaterFuelType)
                    {

                        case 1:
                            rdo_FuelType_Electric.Checked = true;
                            break;
                        case 2:
                            rdo_FuelType_FuelOil.Checked = true;
                            break;
                        case 3:
                            rdo_FuelType_UtilityGas.Checked = true;
                            break;
                        case 4:
                            rdo_FuelType_BottelGas.Checked = true;
                            break;
                        case 99:
                            rdo_FuelType_Other.Checked = true;
                            break;
                        default:
                            break;
                    }
                }

                txt_FuelType_Other.Text = Convert.ToString(dt.Rows[0]["WaterHeaterFuelTypeOther"]);

                string strDType = Convert.ToString(dt.Rows[0]["DryerType"]);
                switch (strDType)
                {
                    case "E":
                        chk_Electric.Checked = true;
                        break;
                    case "G":
                        chk_Gas.Checked = true;
                        break;
                    default:
                        break;
                }

                txt_Comments.Text = Convert.ToString(dt.Rows[0]["Comment"]);
            }
        }
        catch
        {
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            string OccupancyType; string StructureType; string AirConditioning; string PrimaryHeatingSource; string HeatingSystem; string SupplementalHeat; string ContributionSupplementalHeat; string WaterHeaterFuelType; string SpaceHeater_NoHeat; string SpaceHeater_notWork; string SpaceHeater_AdditionalHeat; string SpaceHeater_Other;
            OccupancyType = StructureType = AirConditioning = PrimaryHeatingSource = HeatingSystem = SupplementalHeat = ContributionSupplementalHeat = WaterHeaterFuelType = SpaceHeater_NoHeat = SpaceHeater_notWork = SpaceHeater_AdditionalHeat = SpaceHeater_Other = "";
            string OtherStructureTypeComment = "";
            string OtherAirConditioningComment = "";
            string OtherPrimaryHeatingSourceComment = "";
            string OtherHeatingSystemComment = "";
            string OtherSupplementalHeatComment = "";
            string OtherContributionSupplementalHeat = "";
            string OtherWaterHeaterFuelType = "";

            //-----------------------------------------------
            // Check Which Occupancy Type is checked

            if (rdo_Occupancy_Own.Checked == true)
            {
                OccupancyType = "1";
            }
            if (rdo_Occupancy_Rent.Checked == true)
            {
                OccupancyType = "2";
            }
            if (rdo_Occupancy_Other.Checked == true)
            {
                OccupancyType = "99";
            }

            //------------------------------------------------
            // Check Which Structure Type is checked

            if (chk_Structure_Story.Checked == true)
            {
                StructureType = "1";
            }
            if (chk_Structure_Ranch.Checked == true)
            {
                StructureType = "2";
            }
            if (chk_Structure_Blevel.Checked == true)
            {
                StructureType = "3";
            }
            if (chk_Structure_Mobile.Checked == true)
            {
                StructureType = "4";
            }
            if (chk_Structure_RowInside.Checked == true)
            {
                StructureType = "5";
            }
            if (chk_Structure_RowOutside.Checked == true)
            {
                StructureType = "6";
            }
            if (chk_Structure_Duplex.Checked == true)
            {
                StructureType = "7";
            }
            if (chk_Structure_Multi.Checked == true)
            {
                StructureType = "8";
            }
            if (chk_Structure_Modular.Checked == true)
            {
                StructureType = "10";
            }
            if (chk_Structure_Other.Checked == true)
            {
                StructureType = "99";
                OtherStructureTypeComment = txt_Structure_Other.Text;
            }

            //---------------------------------------------------
            // Type of Air Conditioning
            if (chk_AirConditioning_Central.Checked == true)
            {
                if (AirConditioning == "")
                {
                    AirConditioning = "1";
                }
                else
                {
                    AirConditioning = AirConditioning + "1";
                }
            }
            if (chk_AirConditioning_WindowUnits.Checked == true)
            {
                if (AirConditioning == "")
                {
                    AirConditioning = "2";
                }
                else
                {
                    AirConditioning = AirConditioning + "2";
                }
            }
            if (chk_AirConditioning_WallUnits.Checked == true)
            {
                if (AirConditioning == "")
                {
                    AirConditioning = "3";
                }
                else
                {
                    AirConditioning = AirConditioning + "3";
                }
            }
            if (chk_AirConditioning_HeatPump.Checked == true)
            {
                if (AirConditioning == "")
                {
                    AirConditioning = "4";
                }
                else
                {
                    AirConditioning = AirConditioning + "4";
                }
            }
            if (chk_AirConditioning_None.Checked == true)
            {
                if (AirConditioning == "")
                {
                    AirConditioning = "5";
                }
                else
                {
                    AirConditioning = AirConditioning + "5";
                }
            }
            if (chk_AirConditioning_Other.Checked == true)
            {
                if (AirConditioning == "")
                {
                    AirConditioning = "99";
                }
                else
                {
                    AirConditioning = AirConditioning + "99";
                }
                OtherAirConditioningComment = txt_AirConditioning_Other.Text;
            }

            //-------------------------------------------------------
            // Check Primary Heating Source


            if (rdo_PrimaryHeatingSource_Electric.Checked == true)
            {
                PrimaryHeatingSource = "1";
            }
            if (rdo_PrimaryHeatingSource_UtilityGas.Checked == true)
            {
                PrimaryHeatingSource = "2";
            }
            if (rdo_PrimaryHeatingSource_FuelOil.Checked == true)
            {
                PrimaryHeatingSource = "3";
            }
            if (rdo_PrimaryHeatingSource_Wood.Checked == true)
            {
                PrimaryHeatingSource = "4";
            }
            if (rdo_PrimaryHeatingSource_Coal.Checked == true)
            {
                PrimaryHeatingSource = "5";
            }
            if (rdo_PrimaryHeatingSource_Solar.Checked == true)
            {
                PrimaryHeatingSource = "6";
            }
            if (rdo_PrimaryHeatingSource_CitySteam.Checked == true)
            {
                PrimaryHeatingSource = "7";
            }
            if (rdo_PrimaryHeatingSource_BottelGas.Checked == true)
            {
                PrimaryHeatingSource = "8";
            }
            if (rdo_PrimaryHeatingSource_Kerosene.Checked == true)
            {
                PrimaryHeatingSource = "9";
            }
            if (rdo_PrimaryHeatingSource_Other.Checked == true)
            {
                PrimaryHeatingSource = "99";
                OtherPrimaryHeatingSourceComment = txt_PrimaryHeatingSource_Other.Text;
            }

            //-------------------------------------------------------
            // Check Heating System

            if (rdo_HeatingSystem_ElectricBaseboard.Checked == true)
            {
                HeatingSystem = "1";
            }
            if (rdo_HeatingSystem_ElectricHeatPump.Checked == true)
            {
                HeatingSystem = "2";
            }
            if (rdo_HeatingSystem_ElectricBoiler.Checked == true)
            {
                HeatingSystem = "3";
            }
            if (rdo_HeatingSystem_ElectricFurnace.Checked == true)
            {
                HeatingSystem = "4";
            }
            if (rdo_HeatingSystem_ElectricRadiant.Checked == true)
            {
                HeatingSystem = "5";
            }
            if (rdo_HeatingSystem_ElectricWallBlowers.Checked == true)
            {
                HeatingSystem = "6";
            }
            if (rdo_HeatingSystem_GasFurnace.Checked == true)
            {
                HeatingSystem = "7";
            }
            if (rdo_HeatingSystem_Gas_Boiler.Checked == true)
            {
                HeatingSystem = "8";
            }
            if (rdo_HeatingSystem_OilFurnace.Checked == true)
            {
                HeatingSystem = "9";
            }
            if (rdo_HeatingSystem_OilBoiler.Checked == true)
            {
                HeatingSystem = "10";
            }
            if (rdo_HeatingSystem_Other.Checked == true)
            {
                HeatingSystem = "99";
                OtherHeatingSystemComment = txt_HeatingSystem_Other.Text;
            }

            //-------------------------------------------------------
            // Check Supplemental Heat

            if (rdo_SupplementalHeat_None.Checked == true)
            {
                SupplementalHeat = "00";
            }
            if (rdo_SupplementalHeat_FuelOil.Checked == true)
            {
                SupplementalHeat = "1";
            }
            if (rdo_SupplementalHeat_UtilityGas.Checked == true)
            {
                SupplementalHeat = "2";
            }
            if (rdo_SupplementalHeat_BottleGas.Checked == true)
            {
                SupplementalHeat = "3";
            }
            if (rdo_SupplementalHeat_Electricity.Checked == true)
            {
                SupplementalHeat = "4";
            }
            if (rdo_SupplementalHeat_Coal.Checked == true)
            {
                SupplementalHeat = "5";
            }
            if (rdo_SupplementalHeat_CitySteam.Checked == true)
            {
                SupplementalHeat = "6";
            }
            if (rdo_SupplementalHeat_Wood.Checked == true)
            {
                SupplementalHeat = "7";
            }
            if (rdo_SupplementalHeat_Solar.Checked == true)
            {
                SupplementalHeat = "8";
            }
            if (rdo_SupplementalHeat_PelletStove.Checked == true)
            {
                SupplementalHeat = "9";
            }
            if (rdo_SupplementalHeat_SpaceHeater.Checked == true)
            {
                SupplementalHeat = "10";
            }
            if (rdo_PrimaryHeatingSource_Other.Checked == true)
            {
                SupplementalHeat = "99";
                OtherSupplementalHeatComment = txt_SupplementalHeat_Other.Text;
            }

            //------------------------------------------
            // Check Contribution Supplemental Heat

            if (rdo_HouseholdHeating_TotallyHeated.Checked == true)
            {
                ContributionSupplementalHeat = "1";
            }
            if (rdo_HouseholdHeating_MostHtg.Checked == true)
            {
                ContributionSupplementalHeat = "2";
            }
            if (rdo_HouseholdHeating_LessThanHalf.Checked == true)
            {
                ContributionSupplementalHeat = "3";
            }
            if (rdo_HouseholdHeating_SupplementalHeatSeldom.Checked == true)
            {
                ContributionSupplementalHeat = "4";
            }
            if (rdo_HouseholdHeating_SupplHeat.Checked == true)
            {
                ContributionSupplementalHeat = "5";
            }
            if (rdo_HouseholdHeating_NotSupplementalHeat.Checked == true)
            {
                ContributionSupplementalHeat = "6";
            }
            if (rdo_PrimaryHeatingSource_Other.Checked == true)
            {
                ContributionSupplementalHeat = "99";
                OtherContributionSupplementalHeat = txt_HouseholdHeating_Other.Text;
            }


            //------------------------------------------
            // Check Water Heater Fuel Type

            if (rdo_FuelType_Electric.Checked == true)
            {
                WaterHeaterFuelType = "1";
            }
            if (rdo_FuelType_FuelOil.Checked == true)
            {
                WaterHeaterFuelType = "2";
            }
            if (rdo_FuelType_UtilityGas.Checked == true)
            {
                WaterHeaterFuelType = "3";
            }
            if (rdo_FuelType_BottelGas.Checked == true)
            {
                WaterHeaterFuelType = "4";
            }
            if (rdo_FuelType_Other.Checked == true)
            {
                WaterHeaterFuelType = "99";
                OtherWaterHeaterFuelType = txt_HouseholdHeating_Other.Text;
            }

            string DryerType, ACTypeCentral, ACTypeHeatPump, ACTypeWindowUnit, ACTypeWallUnit, ACTypeNone, ACTypeOther;
            DryerType = ACTypeCentral = ACTypeHeatPump = ACTypeWindowUnit = ACTypeWallUnit = ACTypeNone = ACTypeOther = "";

            if (chk_Electric.Checked)
            {
                DryerType = "E";
            }
            else if (chk_Gas.Checked)
            {
                DryerType = "G";
            }

            if (chk_AirConditioning_Central.Checked)
            {
                ACTypeCentral = "Y";
            }

            if (chk_AirConditioning_HeatPump.Checked)
            {
                ACTypeHeatPump = "Y";
            }

            if (chk_AirConditioning_WindowUnits.Checked)
            {
                ACTypeWindowUnit = "Y";
            }

            if (chk_AirConditioning_WallUnits.Checked)
            {
                ACTypeWallUnit = "Y";
            }
            if (chk_AirConditioning_None.Checked)
            {
                ACTypeNone = "Y";
            }
            //-----------------------------
            //Chek Cunstruction Type
            string CunstructionType = "";
            if (rdo_Cunstruction_Block.Checked == true)
            {
                CunstructionType = "1";
            }
            if (rdo_Cunstruction_WoodKnee.Checked == true)
            {
                CunstructionType = "2";
            }
            if (rdo_Cunstruction_WoodFull.Checked == true)
            {
                CunstructionType = "3";
            }
            if (rdo_Cunstruction_WoodSpace.Checked == true)
            {
                CunstructionType = "4";
            }
            if (rdo_Cunstruction_WoodCrawl.Checked == true)
            {
                CunstructionType = "5";
            }
            if (rdo_Cunstruction_WoodPost.Checked == true)
            {
                CunstructionType = "6";
            }
            if (rdo_Cunstruction_Mobile.Checked == true)
            {
                CunstructionType = "7";
            }
            if (rdo_Cunstruction_WoodSlab.Checked == true)
            {
                CunstructionType = "8";
            }
            if (rdo_Cunstruction_Other.Checked == true)
            {
                CunstructionType = "99";
            }

            //-----------------------------
            //Chk SpaceHeater
            string SpaceHeater = "";
            if (chk_SpaceHeater_NoHeat.Checked)
            {
                SpaceHeater = "1";
            }
            else if (chk_SpaceHeater_notWork.Checked)
            {
                SpaceHeater = "2";
            }
            else if (chk_SpaceHeater_AdditionalHeat.Checked)
            {
                SpaceHeater = "3";
            }
            else if (chk_SpaceHeater_Other.Checked)
            {
                SpaceHeater = "4";
            }

            //----------------------------------

            obj_MetedAudit.UpdateMETEDAudit_2(JobNum, txt_Occupants_under19.Text, txt_Occupants_19_to_62.Text, txt_Occupants_Over62.Text, OccupancyType, StructureType, OtherStructureTypeComment, txt_YearConstructed.Text, txt_ElectricallyHeatedArea.Text, AirConditioning, txt_AirConditioning_Other.Text, txt_WindoworWall.Text, txt_Rooms.Text, txt_AreaCooled.Text, PrimaryHeatingSource, txt_PrimaryHeatingSource_Other.Text, HeatingSystem, txt_HeatingSystem_Other.Text, SupplementalHeat, txt_SupplementalHeat_Other.Text, ContributionSupplementalHeat, txt_HouseholdHeating_Other.Text, txt_Location.Text, txt_unblockedFireplaces.Text, WaterHeaterFuelType, txt_FuelType_Other.Text, DryerType, txt_Comments.Text, CunstructionType, SpaceHeater, txt_SpaceHeater_Other.Text);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
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
}
