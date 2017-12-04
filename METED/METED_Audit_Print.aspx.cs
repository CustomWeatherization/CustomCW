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

public partial class METED_METED_Audit_Print : System.Web.UI.Page
{
    METEDAudit obj_MetedAudit = new METEDAudit();
    public DataTable dtPhoto = new DataTable();
    dcPPLAudit ObjPPL = new dcPPLAudit();
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
                        fill_form1();
                        fill_form2();
                        fill_form3();
                        fill_form4();
                        fill_form5();
                        fill_form6();
                        fill_form7();
                        fill_form8();
                        fill_form9();
                        fill_form10();
                        fill_form11();
                        fill_form12();
                        fill_form13();
                        fill_form14();
                        fill_form15();
                        fill_form16();
                        fill_form17();
                        fill_form18();
                        fill_form19();
                        fill_form20();
                        fill_form21();
                        fill_form22();
                        fill_form23();

                    }
                }
            }
        }
        catch
        {
        }
    }

    # region form1
    public void fill_form1()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_1(JobNum);
            DateTime dateRec = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]);
            DateTime dateComr = Convert.ToDateTime("12/01/2015");

            if (dateRec < dateComr)
            {
                //Spn_RevisedDate.Visible = false;
                //rdoListWarm.Items.Remove("Multi Family Plus");
                spn_EffectiveDate2.Visible = true;
                spn_EffectiveDate1.Visible = false;
                tr_HouseholdEmployment.Visible = true;

                spn_memberpresent.Visible = false;
                spn_Personpresent.Visible = true;
            }
            else
            {
                spn_EffectiveDate2.Visible = true;
                spn_EffectiveDate1.Visible = false;
                tr_HouseholdEmployment.Visible = true;

                spn_memberpresent.Visible = true;
                spn_Personpresent.Visible = false;
            }
            if (dt.Rows.Count > 0)
            {
                txt_Name.Text = Convert.ToString(dt.Rows[0]["FullName"]);
                txt_Address.Text = Convert.ToString(dt.Rows[0]["ServiceAddress1"]);

                //*-*-*-*-* sudhanshu Update on 10 Jun 2013 *-*-*-*-*
                txt_City.Text = Convert.ToString(dt.Rows[0]["City"]);
                txt_ZipCode.Text = Convert.ToString(dt.Rows[0]["ZipCode"]);
                txt_State.Text = Convert.ToString(dt.Rows[0]["State"]); // CoordinatedWithGasUtilityProgram
                string SSA = Convert.ToString(dt.Rows[0]["SeasonalSpendingAllowance"]);
                if (SSA == "" || SSA == null)
                {
                    SSA = "0.00";
                }
                else
                {
                    txt_Seasonal.Text = "$" + Convert.ToString(Math.Round(Convert.ToDecimal(Convert.ToString(SSA).Replace("$", "")), 2));
                }
                //txt_Seasonal.Text = Convert.ToString(dt.Rows[0]["SeasonalSpendingAllowance"]);
                if (Convert.ToString(dt.Rows[0]["CoordinatedWithStateWeatherization"]) == "Y")
                {
                    rdo_CordinateState_Yes.Checked = true;
                }
                else
                {
                    rdo_CordinateState_Yes.Checked = false;
                }
                if (Convert.ToString(dt.Rows[0]["CoordinatedWithStateWeatherization"]) == "N")
                {
                    rdo_CordinateState_No.Checked = true;
                }
                else
                {
                    rdo_CordinateState_No.Checked = false;
                }


                /////////////////////////////////////////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["WarmOrWarmPlus"]) == "Warm")
                {
                    rdoListWarm.SelectedValue = Convert.ToString(dt.Rows[0]["WarmOrWarmPlus"]);
                }
                else if (Convert.ToString(dt.Rows[0]["WarmOrWarmPlus"]) == "Warm Plus")
                {
                    rdoListWarm.SelectedValue = Convert.ToString(dt.Rows[0]["WarmOrWarmPlus"]);
                }
                else if (Convert.ToString(dt.Rows[0]["WarmOrWarmPlus"]) == "Multi Family Plus")
                {
                    rdoListWarm.SelectedValue = Convert.ToString(dt.Rows[0]["WarmOrWarmPlus"]);
                }

                /////////////////////////////////////////////////////////////////////////


                if (Convert.ToString(dt.Rows[0]["CoordinatedWithGasUtilityProgram"]) == "Y")
                {
                    rdo_CordinateGas_Yes.Checked = true;
                }
                else
                {
                    rdo_CordinateGas_Yes.Checked = false;
                }
                if (Convert.ToString(dt.Rows[0]["CoordinatedWithGasUtilityProgram"]) == "N")
                {
                    rdo_CordinateGas_No.Checked = true;
                }
                else
                {
                    rdo_CordinateGas_No.Checked = false;
                }

                ///////////////////////////////////////////////////////////////////////////


                txt_Verified.Text = Convert.ToString(dt.Rows[0]["VerifiedBy"]);
                txt_Date_Verifi.Text = Convert.ToString(dt.Rows[0]["DateVerified"]);
                string HHI = Convert.ToString(dt.Rows[0]["HouseholdIncomeDollar"]);
                if (HHI == "" || HHI == null)
                {
                    HHI = "0.00";
                }
                else
                {
                    txt_Household_Income.Text = "$" + Convert.ToString(Math.Round(Convert.ToDecimal(Convert.ToString(HHI).Replace("$", "")), 2));
                }

                if (Convert.ToString(dt.Rows[0]["CustomerEnrolled"]) != "")
                {
                    if (Convert.ToString(dt.Rows[0]["CustomerEnrolled"]) == "Y")
                    {
                        rdo_PCAP_6Month_Yes.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["CustomerEnrolled"]) == "N")
                    {
                        rdo_PCAP_6Month__No.Checked = true;
                    }
                }

                /////////////////////////////////////////////////////////////////////////////

                if (Convert.ToString(dt.Rows[0]["OtherProgram"]) != "")
                {
                    if (Convert.ToString(dt.Rows[0]["OtherProgram"]) == "Y")
                    {
                        rdo_referedState_Yes.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["OtherProgram"]) == "N")
                    {
                        rdo_referedState_No.Checked = true;
                    }
                }

                if (Convert.ToString(dt.Rows[0]["EligibilityVerification"]) != "")
                {
                    if (Convert.ToString(dt.Rows[0]["EligibilityVerification"]) == "Y")
                    {
                        rdo_Eligibility_Yes.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["EligibilityVerification"]) == "N")
                    {
                        rdo_Eligibility_No.Checked = true;
                    }
                }

                ///////////////////////////////////////////////////////////////////////////

                txt_AccountNo.Text = Convert.ToString(dt.Rows[0]["AccountNumber"]);
                txt_Email.Text = Convert.ToString(dt.Rows[0]["Email"]);
                txt_PhoneNo.Text = Convert.ToString(dt.Rows[0]["HomePhone"]);
                txt_WorkNo.Text = Convert.ToString(dt.Rows[0]["WorkPhone"]);
                txt_OtherNo.Text = Convert.ToString(dt.Rows[0]["CellPhone"]);
                //txt_Seasonal.Text = Convert.ToString(dt.Rows[0]["SeasonalSpendingAllowance"]);
                DataTable dtDLL = new DataTable();
                dtDLL = ObjPPL.GetAuditorNameForPPLAudit_1();
                DataRow[] drModelDetails = dtDLL.Select("ID='" + Convert.ToInt32(dt.Rows[0]["AuditorName"]) + "' ");
                DataTable dtAuditName = new DataTable("MyTable");
                dtAuditName.Columns.Add("UserTableID", typeof(int));
                dtAuditName.Columns.Add("ID", typeof(int));
                dtAuditName.Columns.Add("AuditorName", typeof(string));
                drModelDetails.CopyToDataTable<DataRow>(dtAuditName, LoadOption.Upsert);
                if (dtAuditName.Rows.Count > 0)
                {
                    txt_Auditor_Name.Text = Convert.ToString(dtAuditName.Rows[0]["AuditorName"]);
                }
                string AuditDate = Convert.ToDateTime(dt.Rows[0]["AuditDate"]).ToString("MM/dd/yyyy");

                if (AuditDate == "01/01/1900")
                {
                    txt_AuditDate.Text = "";
                }
                else
                {
                    txt_AuditDate.Text = Convert.ToDateTime(dt.Rows[0]["AuditDate"]).ToString("MM/dd/yyyy");
                }


                string JobFinishedDate = Convert.ToDateTime(dt.Rows[0]["JobFinishedDate"]).ToString("MM/dd/yyyy");

                if (JobFinishedDate == "01/01/1900")
                {
                    txt_JobCompleteDate.Text = "";
                }
                else
                {
                    txt_JobCompleteDate.Text = Convert.ToDateTime(dt.Rows[0]["JobFinishedDate"]).ToString("MM/dd/yyyy");
                }

                txt_Baseload.Text = Convert.ToString(dt.Rows[0]["BaseLoadKWH"]);
                txt_SummerSeasonal.Text = Convert.ToString(dt.Rows[0]["SummerSeasonalKWH"]);
                txt_StateWeather.Text = Convert.ToString(dt.Rows[0]["StateWeatherizationDollars"]);
                txt_WinterSeasonal.Text = Convert.ToString(dt.Rows[0]["WinterSeasonalKWH"]);
                string GUD = Convert.ToString(dt.Rows[0]["GasUtilityDollars"]);
                if (GUD == "" || GUD == null)
                {
                    GUD = "0.00";
                }
                else
                {
                    txt_GasUtility.Text = "$" + Convert.ToString(Math.Round(Convert.ToDecimal(Convert.ToString(GUD).Replace("$", "")), 2));
                }

                //txt_GasUtility.Text = Convert.ToString(dt.Rows[0]["GasUtilityDollars"]);

                string OPD = Convert.ToString(dt.Rows[0]["OtherProgramDollar"]);
                if (OPD == "" || OPD == null)
                {
                    OPD = "0.00";
                }
                else
                {
                    txt_OtherProgram.Text = "$" + Convert.ToString(Math.Round(Convert.ToDecimal(Convert.ToString(OPD).Replace("$", "")), 2));
                }
                txt_Landlord_Name.Text = Convert.ToString(dt.Rows[0]["LandLordName"]);
                txt_Landlord_Phone.Text = Convert.ToString(dt.Rows[0]["LandLordPhoneNumber"]);
                txt_Direction1.Text = Convert.ToString(dt.Rows[0]["DirectionsLine1"]);
                txt_Direction2.Text = Convert.ToString(dt.Rows[0]["DirectionsLine2"]);
                txt_Direction3.Text = Convert.ToString(dt.Rows[0]["DirectionsLine3"]);
                txt_Customer_DateOfBirth.Text = Convert.ToString(dt.Rows[0]["CustomerDateOfBirth"]);
                txt_Occupants.Text = Convert.ToString(dt.Rows[0]["Occupants"]);
                txt_Handicapped_Occupants.Text = Convert.ToString(dt.Rows[0]["HandicappedOccupants"]);
                txt_PersonPresent.Text = Convert.ToString(dt.Rows[0]["PersonPresentAudit"]);

                if (Convert.ToString(dt.Rows[0]["InstalledElectricHeatJob"]) == "Y")
                {
                    chk_ElectricHeatJob.Checked = true;
                }
                else
                {
                    chk_ElectricHeatJob.Checked = false;
                }
                if (Convert.ToString(dt.Rows[0]["ACJob"]) == "Y")
                {
                    chk_AcJob.Checked = true;
                }
                else
                {
                    chk_AcJob.Checked = false;
                }
                if (Convert.ToString(dt.Rows[0]["DefactoHeatJob"]) == "Y")
                {
                    chk_DefactoHeatJob.Checked = true;
                }
                else
                {
                    chk_DefactoHeatJob.Checked = false;
                }
                if (Convert.ToString(dt.Rows[0]["WaterHeatJob"]) == "Y")
                {
                    chk_WaterHeatJob.Checked = true;
                }
                else
                {
                    chk_WaterHeatJob.Checked = false;
                }
                if (Convert.ToString(dt.Rows[0]["BaseLoadJob"]) == "Y")
                {
                    chk_BaseloadJob.Checked = true;
                }
                else
                {
                    chk_BaseloadJob.Checked = false;
                }
                if (Convert.ToString(dt.Rows[0]["UsedDefault"]) == "Y")
                {
                    chk_Default.Checked = true;
                }
                else
                {
                    chk_Default.Checked = false;
                }


                string Income = Convert.ToString(dt.Rows[0]["PrimarySource"]);
                switch (Income)
                {
                    case "1":
                        rdo_Employment.Checked = true;
                        break;

                    case "2":
                        rdo_Public_Assist.Checked = true;
                        break;
                    case "3":
                        rdo_Pension.Checked = true;
                        break;
                    case "4":
                        rdo_UnEmployment.Checked = true;
                        break;
                    case "5":
                        rdo_Disability.Checked = true;
                        break;
                    case "6":
                        rdo_Other.Checked = true;
                        break;
                    default:
                        break;
                }
                txt_Other_Income.Text = Convert.ToString(dt.Rows[0]["PrimarySourceOther"]);

                //------------------------------
                // Household Employment Status

                string HouseholdEmploymentStatus = Convert.ToString(dt.Rows[0]["HouseholdEmploymentStatus"]);
                switch (HouseholdEmploymentStatus)
                {
                    case "1":
                        rdo_fulltimeEmploye.Checked = true;
                        break;
                    case "2":
                        rdo_partTime.Checked = true;
                        break;

                    case "3":
                        rdo_Unemploye.Checked = true;
                        break;
                    case "4":
                        rdo_Retired.Checked = true;
                        break;
                    case "5":
                        rdo_Homemaker.Checked = true;
                        break;
                    case "6":
                        rdo_Student.Checked = true;
                        break;
                    case "99":
                        rdo_HouseholdEmployment_other.Checked = true;
                        txt_HouseholdEmployment_other.Text = Convert.ToString(dt.Rows[0]["HouseholdEmploymentStatusOther"]);
                        break;
                    default:
                        break;
                }

                //---------------------
                //  Checked the radio button of Relationship to customer

                string i = Convert.ToString(dt.Rows[0]["RelationshipToCustomer"]);
                switch (i)
                {
                    case "0":
                        rdo_Self.Checked = true;
                        break;
                    case "1":
                        rdo_Spouse.Checked = true;
                        break;

                    case "2":
                        rdo_Sibling.Checked = true;
                        break;
                    case "3":
                        rdo_Parent.Checked = true;
                        break;
                    case "4":
                        rdo_Relative.Checked = true;
                        break;
                    case "5":
                        rdo_NonRelative.Checked = true;
                        break;
                    case "6":
                        rdo_Other_Relationship.Checked = true;
                        txt_Other_Relationship.Text = Convert.ToString(dt.Rows[0]["RelationshipToCustomerOther"]);
                        break;
                    default:
                        break;
                }

                //----------------------
                // Checked the radio button of Ethnic Origin

                string EthnicOrigin = Convert.ToString(dt.Rows[0]["EthnicOrigin"]);
                switch (EthnicOrigin)
                {

                    case "1":
                        rdo_Caucasian.Checked = true;
                        break;

                    case "2":
                        rdo_African.Checked = true;
                        break;
                    case "3":
                        rdo_Hispanic.Checked = true;
                        break;
                    case "4":
                        rdo_Asian.Checked = true;
                        break;
                    case "5":
                        rdo_Native_American.Checked = true;
                        break;
                    case "99":
                        rdo_Multi_Racial.Checked = true;
                        break;
                    default:
                        break;
                }

            }
        }
        catch
        {
        }
    }
    #endregion

    # region form2
    public void fill_form2()
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
                //Fill Cunstruction Type  
                string CunstructionType = Convert.ToString(dt.Rows[0]["CunstructionType"]);
                switch (CunstructionType)
                {
                    case "1":
                        rdo_Cunstruction_Block.Checked = true;
                        break;
                    case "2":
                        rdo_Cunstruction_WoodKnee.Checked = true;
                        break;
                    case "3":
                        rdo_Cunstruction_WoodFull.Checked = true;
                        break;
                    case "4":
                        rdo_Cunstruction_WoodSpace.Checked = true;
                        break;
                    case "5":
                        rdo_Cunstruction_WoodCrawl.Checked = true;
                        break;
                    case "6":
                        rdo_Cunstruction_WoodPost.Checked = true;
                        break;
                    case "7":
                        rdo_Cunstruction_Mobile.Checked = true;
                        break;
                    case "8":
                        rdo_Cunstruction_WoodSlab.Checked = true;
                        break;
                    case "99":
                        rdo_Cunstruction_Other.Checked = true;
                        break;
                    default:
                        break;
                }
                //-----------------------------
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
    #endregion

    # region form3
    public void fill_form3()
    {
        string JobNum = Request.QueryString["Jobs"].ToString();
        DataTable dt = obj_MetedAudit.GetMETEDAudit_3(JobNum);
        if (dt.Rows.Count > 0)
        {
            //--------------------------------------------------

            txt_AreaDifficult.Text = Convert.ToString(dt.Rows[0]["AreaDifficult"]);
            txt_ApplicationProb.Text = Convert.ToString(dt.Rows[0]["ApplicationProb"]);
            txt_HighestEnergy.Text = Convert.ToString(dt.Rows[0]["HighestEnergy"]);
            txt_Expalain_HealthIssues1.Text = Convert.ToString(dt.Rows[0]["Expalain_HealthIssues1"]);
            txt_HealthIssue2.Text = Convert.ToString(dt.Rows[0]["Expalain_HealthIssues2"]);

            //--------------------------------------------------


            string i = Convert.ToString(dt.Rows[0]["combustionAppliances"]);
            switch (i)
            {
                case "Y":
                    chk_combustionAppliances_Yes.Checked = true;
                    break;
                case "N":
                    chk_combustionAppliances_No.Checked = true;
                    break;

                case "N/A":
                    chk_combustionAppliances_Null.Checked = true;
                    break;
                default:
                    break;
            }

            string j = Convert.ToString(dt.Rows[0]["HealthIssues"]);
            switch (j)
            {
                case "Y":
                    chk_HealthIssues_Yes.Checked = true;
                    break;
                case "N":
                    chk_HealthIssues_No.Checked = true;
                    break;
                default:
                    break;
            }



        }
    }
    #endregion

    # region form4
    public void fill_form4()
    {
        try
        {
            txt_Standard_Bullbs.Attributes.Add("readonly", "readonly");
            txt_SpecialtyBulbs.Attributes.Add("readonly", "readonly");
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_4(JobNum);
            if (dt.Rows.Count > 0)
            {


                string Line1_Act129 = Convert.ToString(dt.Rows[0]["Line1_Act129"]);
                if (Line1_Act129 == "Y")
                {
                    chk_Line1_Act129.Checked = true;
                }
                else
                {
                    chk_Line1_Act129.Checked = false;
                }

                string Line2_Act129 = Convert.ToString(dt.Rows[0]["Line2_Act129"]);
                if (Line2_Act129 == "Y")
                {
                    chk_Line2_Act129.Checked = true;
                }
                else
                {
                    chk_Line2_Act129.Checked = false;
                }


                string Line3_Act129 = Convert.ToString(dt.Rows[0]["Line3_Act129"]);
                if (Line3_Act129 == "Y")
                {
                    chk_Line3_Act129.Checked = true;
                }
                else
                {
                    chk_Line3_Act129.Checked = false;
                }

                string Line4_Act129 = Convert.ToString(dt.Rows[0]["Line4_Act129"]);
                if (Line4_Act129 == "Y")
                {
                    chk_Line4_Act129.Checked = true;
                }
                else
                {
                    chk_Line4_Act129.Checked = false;
                }

                string Line5_Act129 = Convert.ToString(dt.Rows[0]["Line5_Act129"]);
                if (Line5_Act129 == "Y")
                {
                    chk_Line5_Act129.Checked = true;
                }
                else
                {
                    chk_Line5_Act129.Checked = false;
                }

                string Line6_Act129 = Convert.ToString(dt.Rows[0]["Line6_Act129"]);
                if (Line6_Act129 == "Y")
                {
                    chk_Line6_Act129.Checked = true;
                }
                else
                {
                    chk_Line6_Act129.Checked = false;
                }

                string Line7_Act129 = Convert.ToString(dt.Rows[0]["Line7_Act129"]);
                if (Line7_Act129 == "Y")
                {
                    chk_Line7_Act129.Checked = true;
                }
                else
                {
                    chk_Line7_Act129.Checked = false;
                }

                string Line8_Act129 = Convert.ToString(dt.Rows[0]["Line8_Act129"]);
                if (Line8_Act129 == "Y")
                {
                    chk_Line8_Act129.Checked = true;
                }
                else
                {
                    chk_Line8_Act129.Checked = false;
                }

                string Line9_Act129 = Convert.ToString(dt.Rows[0]["Line9_Act129"]);
                if (Line9_Act129 == "Y")
                {
                    chk_Line9_Act129.Checked = true;
                }
                else
                {
                    chk_Line9_Act129.Checked = false;
                }

                string Line10_Act129 = Convert.ToString(dt.Rows[0]["Line10_Act129"]);
                if (Line10_Act129 == "Y")
                {
                    chk_Line10_Act129.Checked = true;
                }
                else
                {
                    chk_Line10_Act129.Checked = false;
                }


                string Line11_Act129 = Convert.ToString(dt.Rows[0]["Line11_Act129"]);
                if (Line11_Act129 == "Y")
                {
                    chk_Line11_Act129.Checked = true;
                }
                else
                {
                    chk_Line11_Act129.Checked = false;
                }

                string Line12_Act129 = Convert.ToString(dt.Rows[0]["Line12_Act129"]);
                if (Line12_Act129 == "Y")
                {
                    chk_Line12_Act129.Checked = true;
                }
                else
                {
                    chk_Line12_Act129.Checked = false;
                }


                string Line13_Act129 = Convert.ToString(dt.Rows[0]["Line13_Act129"]);
                if (Line13_Act129 == "Y")
                {
                    chk_Line13_Act129.Checked = true;
                }
                else
                {
                    chk_Line13_Act129.Checked = false;
                }

                string Line14_Act129 = Convert.ToString(dt.Rows[0]["Line14_Act129"]);
                if (Line14_Act129 == "Y")
                {
                    chk_Line14_Act129.Checked = true;
                }
                else
                {
                    chk_Line14_Act129.Checked = false;
                }

                string Line15_Act129 = Convert.ToString(dt.Rows[0]["Line15_Act129"]);
                if (Line15_Act129 == "Y")
                {
                    chk_Line15_Act129.Checked = true;
                }
                else
                {
                    chk_Line15_Act129.Checked = false;
                }

                string Line16_Act129 = Convert.ToString(dt.Rows[0]["Line16_Act129"]);
                if (Line16_Act129 == "Y")
                {
                    chk_Line16_Act129.Checked = true;
                }
                else
                {
                    chk_Line16_Act129.Checked = false;
                }

                string Line17_Act129 = Convert.ToString(dt.Rows[0]["Line17_Act129"]);
                if (Line17_Act129 == "Y")
                {
                    chk_Line17_Act129.Checked = true;
                }
                else
                {
                    chk_Line17_Act129.Checked = false;
                }

                string Line18_Act129 = Convert.ToString(dt.Rows[0]["Line18_Act129"]);
                if (Line18_Act129 == "Y")
                {
                    chk_Line18_Act129.Checked = true;
                }
                else
                {
                    chk_Line18_Act129.Checked = false;
                }


                string Line1Liurp = Convert.ToString(dt.Rows[0]["Line1Liurp"]);
                if (Line1Liurp == "Y")
                {
                    chk_Line1_LIURP.Checked = true;
                }
                else
                {
                    chk_Line1_LIURP.Checked = false;
                }

                string Line2Liurp = Convert.ToString(dt.Rows[0]["Line2Liurp"]);
                if (Line2Liurp == "Y")
                {
                    chk_Line2_LIURP.Checked = true;
                }
                else
                {
                    chk_Line2_LIURP.Checked = false;
                }


                string Line3Liurp = Convert.ToString(dt.Rows[0]["Line3Liurp"]);
                if (Line3Liurp == "Y")
                {
                    chk_Line3_LIURP.Checked = true;
                }
                else
                {
                    chk_Line3_LIURP.Checked = false;
                }


                string Line4Liurp = Convert.ToString(dt.Rows[0]["Line4Liurp"]);
                if (Line4Liurp == "Y")
                {
                    chk_Line4_LIURP.Checked = true;
                }
                else
                {
                    chk_Line4_LIURP.Checked = false;
                }


                string Line5Liurp = Convert.ToString(dt.Rows[0]["Line5Liurp"]);
                if (Line5Liurp == "Y")
                {
                    chk_Line5_LIURP.Checked = true;
                }
                else
                {
                    chk_Line5_LIURP.Checked = false;
                }


                string Line6Liurp = Convert.ToString(dt.Rows[0]["Line6Liurp"]);
                if (Line6Liurp == "Y")
                {
                    chk_Line6_LIURP.Checked = true;
                }
                else
                {
                    chk_Line6_LIURP.Checked = false;
                }


                string Line7Liurp = Convert.ToString(dt.Rows[0]["Line7Liurp"]);
                if (Line7Liurp == "Y")
                {
                    chk_Line7_LIURP.Checked = true;
                }
                else
                {
                    chk_Line7_LIURP.Checked = false;
                }


                string Line8Liurp = Convert.ToString(dt.Rows[0]["Line8Liurp"]);
                if (Line8Liurp == "Y")
                {
                    chk_Line8_LIURP.Checked = true;
                }
                else
                {
                    chk_Line8_LIURP.Checked = false;
                }



                string Line9Liurp = Convert.ToString(dt.Rows[0]["Line9Liurp"]);
                if (Line9Liurp == "Y")
                {
                    chk_Line9_LIURP.Checked = true;
                }
                else
                {
                    chk_Line9_LIURP.Checked = false;
                }


                string Line10Liurp = Convert.ToString(dt.Rows[0]["Line10Liurp"]);
                if (Line10Liurp == "Y")
                {
                    chk_Line10_LIURP.Checked = true;
                }
                else
                {
                    chk_Line10_LIURP.Checked = false;
                }


                string Line11Liurp = Convert.ToString(dt.Rows[0]["Line11Liurp"]);
                if (Line11Liurp == "Y")
                {
                    chk_Line11_LIURP.Checked = true;
                }
                else
                {
                    chk_Line11_LIURP.Checked = false;
                }


                string Line12Liurp = Convert.ToString(dt.Rows[0]["Line12Liurp"]);
                if (Line12Liurp == "Y")
                {
                    chk_Line12_LIURP.Checked = true;
                }
                else
                {
                    chk_Line12_LIURP.Checked = false;
                }


                string Line13Liurp = Convert.ToString(dt.Rows[0]["Line13Liurp"]);
                if (Line13Liurp == "Y")
                {
                    chk_Line13_LIURP.Checked = true;
                }
                else
                {
                    chk_Line13_LIURP.Checked = false;
                }

                string Line14Liurp = Convert.ToString(dt.Rows[0]["Line14Liurp"]);
                if (Line14Liurp == "Y")
                {
                    chk_Line14_LIURP.Checked = true;
                }
                else
                {
                    chk_Line14_LIURP.Checked = false;
                }


                string Line15Liurp = Convert.ToString(dt.Rows[0]["Line15Liurp"]);
                if (Line15Liurp == "Y")
                {
                    chk_Line15_LIURP.Checked = true;
                }
                else
                {
                    chk_Line15_LIURP.Checked = false;
                }


                string Line16Liurp = Convert.ToString(dt.Rows[0]["Line16Liurp"]);
                if (Line16Liurp == "Y")
                {
                    chk_Line16_LIURP.Checked = true;
                }
                else
                {
                    chk_Line16_LIURP.Checked = false;
                }


                string Line17Liurp = Convert.ToString(dt.Rows[0]["Line17Liurp"]);
                if (Line17Liurp == "Y")
                {
                    chk_Line17_LIURP.Checked = true;
                }
                else
                {
                    chk_Line17_LIURP.Checked = false;
                }

                string Line18Liurp = Convert.ToString(dt.Rows[0]["Line18Liurp"]);
                if (Line18Liurp == "Y")
                {
                    chk_Line18_LIURP.Checked = true;
                }
                else
                {
                    chk_Line18_LIURP.Checked = false;
                }


                txt_Line1_Install.Text = Convert.ToString(dt.Rows[0]["Line1NumStandardBulbs"]);
                txt_Line1_Location.Text = Convert.ToString(dt.Rows[0]["Line1Location"]);
                txt_Line2_Install.Text = Convert.ToString(dt.Rows[0]["Line2NumStandardBulbs"]);
                txt_Line2_Location.Text = Convert.ToString(dt.Rows[0]["Line2Location"]);
                txt_Line3_Install.Text = Convert.ToString(dt.Rows[0]["Line3NumStandardBulbs"]);
                txt_Line3_Location.Text = Convert.ToString(dt.Rows[0]["Line3Location"]);
                txt_Line4_Install.Text = Convert.ToString(dt.Rows[0]["Line4NumStandardBulbs"]);
                txt_Line4_Location.Text = Convert.ToString(dt.Rows[0]["Line4Location"]);
                txt_Line5_Install.Text = Convert.ToString(dt.Rows[0]["Line5NumStandardBulbs"]);
                txt_Line5_Location.Text = Convert.ToString(dt.Rows[0]["Line5Location"]);
                txt_Line6_Install.Text = Convert.ToString(dt.Rows[0]["Line6NumStandardBulbs"]);
                txt_Line6_Location.Text = Convert.ToString(dt.Rows[0]["Line6Location"]);
                txt_Line7_Install.Text = Convert.ToString(dt.Rows[0]["Line7NumStandardBulbs"]);
                txt_Line7_Location.Text = Convert.ToString(dt.Rows[0]["Line7Location"]);
                txt_Line8_Install.Text = Convert.ToString(dt.Rows[0]["Line8NumStandardBulbs"]);
                txt_Line8_Location.Text = Convert.ToString(dt.Rows[0]["Line8Location"]);
                txt_Line9_Install.Text = Convert.ToString(dt.Rows[0]["Line9NumStandardBulbs"]);
                txt_Line9_Location.Text = Convert.ToString(dt.Rows[0]["Line9Location"]);
                txt_Line10_Install.Text = Convert.ToString(dt.Rows[0]["Line10NumStandardBulbs"]);
                txt_Line10_Location.Text = Convert.ToString(dt.Rows[0]["Line10Location"]);
                txt_Line11_Install.Text = Convert.ToString(dt.Rows[0]["Line11NumStandardBulbs"]);
                txt_Line11_Location.Text = Convert.ToString(dt.Rows[0]["Line11Location"]);
                txt_Line12_Install.Text = Convert.ToString(dt.Rows[0]["Line12NumStandardBulbs"]);
                txt_Line12_Location.Text = Convert.ToString(dt.Rows[0]["Line12Location"]);
                txt_Line13_Install.Text = Convert.ToString(dt.Rows[0]["Line13NumStandardBulbs"]);
                txt_Line13_Location.Text = Convert.ToString(dt.Rows[0]["Line13Location"]);
                txt_Line14_Install.Text = Convert.ToString(dt.Rows[0]["Line14NumStandardBulbs"]);
                txt_Line14_Location.Text = Convert.ToString(dt.Rows[0]["Line14Location"]);
                txt_Line15_Install.Text = Convert.ToString(dt.Rows[0]["Line15NumStandardBulbs"]);
                txt_Line15_Location.Text = Convert.ToString(dt.Rows[0]["Line15Location"]);
                txt_Line16_Install.Text = Convert.ToString(dt.Rows[0]["Line16NumStandardBulbs"]);
                txt_Line16_Location.Text = Convert.ToString(dt.Rows[0]["Line16Location"]);
                txt_Line17_Install.Text = Convert.ToString(dt.Rows[0]["Line17NumStandardBulbs"]);
                txt_Line17_Location.Text = Convert.ToString(dt.Rows[0]["Line17Location"]);
                txt_Line18_Install.Text = Convert.ToString(dt.Rows[0]["Line18NumStandardBulbs"]);
                txt_Line18_Location.Text = Convert.ToString(dt.Rows[0]["Line18Location"]);
                txt_Standard_Bullbs.Text = Convert.ToString(dt.Rows[0]["TotalNumberOfInstalledStandardBulbs"]);
                //hdn_Standard_Bullbs.Value = Convert.ToString(dt.Rows[0]["TotalNumberOfInstalledStandardBulbs"]);
                txt_SpecialtyBulbs.Text = Convert.ToString(dt.Rows[0]["TotalNumberOfInstalledSpecialtyBulbs"]);

                string Line1CFLReplacement = Convert.ToString(dt.Rows[0]["Line1CFLReplacement"]);
                if (Line1CFLReplacement == "9_13")
                {
                    chk_Line1_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_9_13.Checked = false;
                }

                if (Line1CFLReplacement == "14_16")
                {
                    chk_Line1_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_14_16.Checked = false;
                }


                if (Line1CFLReplacement == "17_20")
                {
                    chk_Line1_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_17_20.Checked = false;
                }


                if (Line1CFLReplacement == "21_25")
                {
                    chk_Line1_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_21_25.Checked = false;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////



                string Line2CFLReplacement = Convert.ToString(dt.Rows[0]["Line2CFLReplacement"]);
                if (Line2CFLReplacement == "9_13")
                {
                    chk_Line2_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_9_13.Checked = false;
                }

                if (Line2CFLReplacement == "14_16")
                {
                    chk_Line2_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_14_16.Checked = false;
                }


                if (Line2CFLReplacement == "17_20")
                {
                    chk_Line2_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_17_20.Checked = false;
                }


                if (Line2CFLReplacement == "21_25")
                {
                    chk_Line2_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line3CFLReplacement = Convert.ToString(dt.Rows[0]["Line3CFLReplacement"]);
                if (Line3CFLReplacement == "9_13")
                {
                    chk_Line3_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_9_13.Checked = false;
                }

                if (Line3CFLReplacement == "14_16")
                {
                    chk_Line3_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_14_16.Checked = false;
                }


                if (Line3CFLReplacement == "17_20")
                {
                    chk_Line3_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_17_20.Checked = false;
                }


                if (Line3CFLReplacement == "21_25")
                {
                    chk_Line3_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////

                string Line4CFLReplacement = Convert.ToString(dt.Rows[0]["Line4CFLReplacement"]);
                if (Line4CFLReplacement == "9_13")
                {
                    chk_Line4_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_9_13.Checked = false;
                }

                if (Line4CFLReplacement == "14_16")
                {
                    chk_Line4_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_14_16.Checked = false;
                }


                if (Line4CFLReplacement == "17_20")
                {
                    chk_Line4_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_17_20.Checked = false;
                }


                if (Line4CFLReplacement == "21_25")
                {
                    chk_Line4_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line5CFLReplacement = Convert.ToString(dt.Rows[0]["Line5CFLReplacement"]);
                if (Line5CFLReplacement == "9_13")
                {
                    chk_Line5_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_9_13.Checked = false;
                }

                if (Line5CFLReplacement == "14_16")
                {
                    chk_Line5_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_14_16.Checked = false;
                }


                if (Line5CFLReplacement == "17_20")
                {
                    chk_Line5_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_17_20.Checked = false;
                }


                if (Line5CFLReplacement == "21_25")
                {
                    chk_Line5_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line6CFLReplacement = Convert.ToString(dt.Rows[0]["Line6CFLReplacement"]);
                if (Line6CFLReplacement == "9_13")
                {
                    chk_Line6_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_9_13.Checked = false;
                }

                if (Line6CFLReplacement == "14_16")
                {
                    chk_Line6_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_14_16.Checked = false;
                }


                if (Line6CFLReplacement == "17_20")
                {
                    chk_Line6_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_17_20.Checked = false;
                }


                if (Line6CFLReplacement == "21_25")
                {
                    chk_Line6_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line7CFLReplacement = Convert.ToString(dt.Rows[0]["Line7CFLReplacement"]);
                if (Line7CFLReplacement == "9_13")
                {
                    chk_Line7_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_9_13.Checked = false;
                }

                if (Line7CFLReplacement == "14_16")
                {
                    chk_Line7_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_14_16.Checked = false;
                }


                if (Line7CFLReplacement == "17_20")
                {
                    chk_Line7_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_17_20.Checked = false;
                }


                if (Line7CFLReplacement == "21_25")
                {
                    chk_Line7_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////




                string Line8CFLReplacement = Convert.ToString(dt.Rows[0]["Line8CFLReplacement"]);
                if (Line8CFLReplacement == "9_13")
                {
                    chk_Line8_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_9_13.Checked = false;
                }

                if (Line8CFLReplacement == "14_16")
                {
                    chk_Line8_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_14_16.Checked = false;
                }


                if (Line8CFLReplacement == "17_20")
                {
                    chk_Line8_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_17_20.Checked = false;
                }


                if (Line8CFLReplacement == "21_25")
                {
                    chk_Line8_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////




                string Line9CFLReplacement = Convert.ToString(dt.Rows[0]["Line9CFLReplacement"]);
                if (Line8CFLReplacement == "9_13")
                {
                    chk_Line9_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_9_13.Checked = false;
                }

                if (Line9CFLReplacement == "14_16")
                {
                    chk_Line9_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_14_16.Checked = false;
                }


                if (Line9CFLReplacement == "17_20")
                {
                    chk_Line9_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_17_20.Checked = false;
                }


                if (Line9CFLReplacement == "21_25")
                {
                    chk_Line9_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line10CFLReplacement = Convert.ToString(dt.Rows[0]["Line10CFLReplacement"]);
                if (Line10CFLReplacement == "9_13")
                {
                    chk_Line10_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_9_13.Checked = false;
                }

                if (Line10CFLReplacement == "14_16")
                {
                    chk_Line10_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_14_16.Checked = false;
                }


                if (Line10CFLReplacement == "17_20")
                {
                    chk_Line10_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_17_20.Checked = false;
                }


                if (Line10CFLReplacement == "21_25")
                {
                    chk_Line10_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line11CFLReplacement = Convert.ToString(dt.Rows[0]["Line11CFLReplacement"]);
                if (Line11CFLReplacement == "9_13")
                {
                    chk_Line11_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_9_13.Checked = false;
                }

                if (Line11CFLReplacement == "14_16")
                {
                    chk_Line11_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_14_16.Checked = false;
                }


                if (Line11CFLReplacement == "17_20")
                {
                    chk_Line11_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_17_20.Checked = false;
                }


                if (Line11CFLReplacement == "21_25")
                {
                    chk_Line11_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line12CFLReplacement = Convert.ToString(dt.Rows[0]["Line12CFLReplacement"]);
                if (Line12CFLReplacement == "9_13")
                {
                    chk_Line12_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_9_13.Checked = false;
                }

                if (Line12CFLReplacement == "14_16")
                {
                    chk_Line12_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_14_16.Checked = false;
                }


                if (Line12CFLReplacement == "17_20")
                {
                    chk_Line12_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_17_20.Checked = false;
                }


                if (Line12CFLReplacement == "21_25")
                {
                    chk_Line12_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line13CFLReplacement = Convert.ToString(dt.Rows[0]["Line13CFLReplacement"]);
                if (Line13CFLReplacement == "2_9")
                {
                    chk_Line13_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_2_9.Checked = false;
                }

                if (Line13CFLReplacement == "10_13")
                {
                    chk_Line13_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_10_13.Checked = false;
                }

                if (Line13CFLReplacement == "14_16")
                {
                    chk_Line13_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_14_16.Checked = false;
                }




                if (Line13CFLReplacement == "17_20")
                {
                    chk_Line13_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_17_20.Checked = false;
                }


                if (Line13CFLReplacement == "21_25")
                {
                    chk_Line13_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line14CFLReplacement = Convert.ToString(dt.Rows[0]["Line14CFLReplacement"]);
                if (Line14CFLReplacement == "2_9")
                {
                    chk_Line14_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_2_9.Checked = false;
                }

                if (Line14CFLReplacement == "10_13")
                {
                    chk_Line14_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_10_13.Checked = false;
                }

                if (Line14CFLReplacement == "14_16")
                {
                    chk_Line14_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_14_16.Checked = false;
                }




                if (Line14CFLReplacement == "17_20")
                {
                    chk_Line14_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_17_20.Checked = false;
                }


                if (Line14CFLReplacement == "21_25")
                {
                    chk_Line14_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////

                string Line15CFLReplacement = Convert.ToString(dt.Rows[0]["Line15CFLReplacement"]);
                if (Line15CFLReplacement == "2_9")
                {
                    chk_Line15_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_2_9.Checked = false;
                }

                if (Line15CFLReplacement == "10_13")
                {
                    chk_Line15_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_10_13.Checked = false;
                }

                if (Line15CFLReplacement == "14_16")
                {
                    chk_Line15_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_14_16.Checked = false;
                }


                if (Line15CFLReplacement == "17_20")
                {
                    chk_Line15_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_17_20.Checked = false;
                }


                if (Line15CFLReplacement == "21_25")
                {
                    chk_Line15_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line16CFLReplacement = Convert.ToString(dt.Rows[0]["Line16CFLReplacement"]);
                if (Line16CFLReplacement == "2_9")
                {
                    chk_Line16_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_2_9.Checked = false;
                }

                if (Line16CFLReplacement == "10_13")
                {
                    chk_Line16_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_10_13.Checked = false;
                }

                if (Line16CFLReplacement == "14_16")
                {
                    chk_Line16_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_14_16.Checked = false;
                }


                if (Line16CFLReplacement == "17_20")
                {
                    chk_Line16_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_17_20.Checked = false;
                }


                if (Line16CFLReplacement == "21_25")
                {
                    chk_Line16_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line17CFLReplacement = Convert.ToString(dt.Rows[0]["Line17CFLReplacement"]);
                if (Line17CFLReplacement == "2_9")
                {
                    chk_Line17_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_2_9.Checked = false;
                }

                if (Line17CFLReplacement == "10_13")
                {
                    chk_Line17_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_10_13.Checked = false;
                }

                if (Line17CFLReplacement == "14_16")
                {
                    chk_Line17_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_14_16.Checked = false;
                }


                if (Line17CFLReplacement == "17_20")
                {
                    chk_Line17_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_17_20.Checked = false;
                }


                if (Line17CFLReplacement == "21_25")
                {
                    chk_Line17_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line18CFLReplacement = Convert.ToString(dt.Rows[0]["Line18CFLReplacement"]);
                if (Line18CFLReplacement == "2_9")
                {
                    chk_Line18_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_2_9.Checked = false;
                }

                if (Line18CFLReplacement == "10_13")
                {
                    chk_Line18_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_10_13.Checked = false;
                }

                if (Line18CFLReplacement == "14_16")
                {
                    chk_Line18_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_14_16.Checked = false;
                }


                if (Line18CFLReplacement == "17_20")
                {
                    chk_Line18_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_17_20.Checked = false;
                }


                if (Line18CFLReplacement == "21_25")
                {
                    chk_Line18_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line1CFLLocation = Convert.ToString(dt.Rows[0]["Line1CFLLocation"]);
                if (Line1CFLLocation == "LR")
                {
                    chk_Line1_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_LR.Checked = false;
                }

                if (Line1CFLLocation == "DR")
                {
                    chk_Line1_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_DR.Checked = false;
                }

                if (Line1CFLLocation == "Kitch")
                {
                    chk_Line1_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_Kitch.Checked = false;
                }


                if (Line1CFLLocation == "BR")
                {
                    chk_Line1_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_BR.Checked = false;
                }


                if (Line1CFLLocation == "Bath")
                {
                    chk_Line1_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_Bath.Checked = false;
                }

                if (Line1CFLLocation == "Hall")
                {
                    chk_Line1_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_Hall.Checked = false;
                }

                if (Line1CFLLocation == "Other")
                {
                    chk_Line1_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_Other.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line2CFLLocation = Convert.ToString(dt.Rows[0]["Line2CFLLocation"]);
                if (Line2CFLLocation == "LR")
                {
                    chk_Line2_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_LR.Checked = false;
                }

                if (Line2CFLLocation == "DR")
                {
                    chk_Line2_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_DR.Checked = false;
                }

                if (Line2CFLLocation == "Kitch")
                {
                    chk_Line2_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_Kitch.Checked = false;
                }


                if (Line2CFLLocation == "BR")
                {
                    chk_Line2_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_BR.Checked = false;
                }


                if (Line2CFLLocation == "Bath")
                {
                    chk_Line2_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_Bath.Checked = false;
                }

                if (Line2CFLLocation == "Hall")
                {
                    chk_Line2_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_Hall.Checked = false;
                }

                if (Line2CFLLocation == "Other")
                {
                    chk_Line2_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_Other.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////

                string Line3CFLLocation = Convert.ToString(dt.Rows[0]["Line3CFLLocation"]);
                if (Line3CFLLocation == "LR")
                {
                    chk_Line3_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_LR.Checked = false;
                }

                if (Line3CFLLocation == "DR")
                {
                    chk_Line3_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_DR.Checked = false;
                }

                if (Line3CFLLocation == "Kitch")
                {
                    chk_Line3_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_Kitch.Checked = false;
                }


                if (Line3CFLLocation == "BR")
                {
                    chk_Line3_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_BR.Checked = false;
                }


                if (Line3CFLLocation == "Bath")
                {
                    chk_Line3_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_Bath.Checked = false;
                }

                if (Line3CFLLocation == "Hall")
                {
                    chk_Line3_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_Hall.Checked = false;
                }

                if (Line3CFLLocation == "Other")
                {
                    chk_Line3_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_Other.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////

                string Line4CFLLocation = Convert.ToString(dt.Rows[0]["Line4CFLLocation"]);
                if (Line4CFLLocation == "LR")
                {
                    chk_Line4_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_LR.Checked = false;
                }

                if (Line4CFLLocation == "DR")
                {
                    chk_Line4_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_DR.Checked = false;
                }

                if (Line4CFLLocation == "Kitch")
                {
                    chk_Line4_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_Kitch.Checked = false;
                }


                if (Line4CFLLocation == "BR")
                {
                    chk_Line4_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_BR.Checked = false;
                }


                if (Line4CFLLocation == "Bath")
                {
                    chk_Line4_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_Bath.Checked = false;
                }

                if (Line4CFLLocation == "Hall")
                {
                    chk_Line4_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_Hall.Checked = false;
                }

                if (Line4CFLLocation == "Other")
                {
                    chk_Line4_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_Other.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////

                string Line5CFLLocation = Convert.ToString(dt.Rows[0]["Line5CFLLocation"]);
                if (Line5CFLLocation == "LR")
                {
                    chk_Line5_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_LR.Checked = false;
                }

                if (Line5CFLLocation == "DR")
                {
                    chk_Line5_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_DR.Checked = false;
                }

                if (Line5CFLLocation == "Kitch")
                {
                    chk_Line5_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_Kitch.Checked = false;
                }


                if (Line5CFLLocation == "BR")
                {
                    chk_Line5_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_BR.Checked = false;
                }


                if (Line5CFLLocation == "Bath")
                {
                    chk_Line5_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_Bath.Checked = false;
                }

                if (Line5CFLLocation == "Hall")
                {
                    chk_Line5_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_Hall.Checked = false;
                }

                if (Line5CFLLocation == "Other")
                {
                    chk_Line5_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_Other.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line6CFLLocation = Convert.ToString(dt.Rows[0]["Line6CFLLocation"]);
                if (Line6CFLLocation == "LR")
                {
                    chk_Line6_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_LR.Checked = false;
                }

                if (Line6CFLLocation == "DR")
                {
                    chk_Line6_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_DR.Checked = false;
                }

                if (Line6CFLLocation == "Kitch")
                {
                    chk_Line6_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_Kitch.Checked = false;
                }


                if (Line6CFLLocation == "BR")
                {
                    chk_Line6_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_BR.Checked = false;
                }


                if (Line6CFLLocation == "Bath")
                {
                    chk_Line6_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_Bath.Checked = false;
                }

                if (Line6CFLLocation == "Hall")
                {
                    chk_Line6_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_Hall.Checked = false;
                }

                if (Line6CFLLocation == "Other")
                {
                    chk_Line6_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line7CFLLocation = Convert.ToString(dt.Rows[0]["Line7CFLLocation"]);
                if (Line7CFLLocation == "LR")
                {
                    chk_Line7_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_LR.Checked = false;
                }

                if (Line7CFLLocation == "DR")
                {
                    chk_Line7_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_DR.Checked = false;
                }

                if (Line7CFLLocation == "Kitch")
                {
                    chk_Line7_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_Kitch.Checked = false;
                }


                if (Line7CFLLocation == "BR")
                {
                    chk_Line7_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_BR.Checked = false;
                }


                if (Line7CFLLocation == "Bath")
                {
                    chk_Line7_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_Bath.Checked = false;
                }

                if (Line7CFLLocation == "Hall")
                {
                    chk_Line7_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_Hall.Checked = false;
                }

                if (Line7CFLLocation == "Other")
                {
                    chk_Line7_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line8CFLLocation = Convert.ToString(dt.Rows[0]["Line8CFLLocation"]);
                if (Line8CFLLocation == "LR")
                {
                    chk_Line8_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_LR.Checked = false;
                }

                if (Line8CFLLocation == "DR")
                {
                    chk_Line8_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_DR.Checked = false;
                }

                if (Line8CFLLocation == "Kitch")
                {
                    chk_Line8_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_Kitch.Checked = false;
                }


                if (Line8CFLLocation == "BR")
                {
                    chk_Line8_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_BR.Checked = false;
                }


                if (Line8CFLLocation == "Bath")
                {
                    chk_Line8_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_Bath.Checked = false;
                }

                if (Line8CFLLocation == "Hall")
                {
                    chk_Line8_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_Hall.Checked = false;
                }

                if (Line8CFLLocation == "Other")
                {
                    chk_Line8_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////



                string Line9CFLLocation = Convert.ToString(dt.Rows[0]["Line9CFLLocation"]);
                if (Line9CFLLocation == "LR")
                {
                    chk_Line9_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_LR.Checked = false;
                }

                if (Line9CFLLocation == "DR")
                {
                    chk_Line9_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_DR.Checked = false;
                }

                if (Line9CFLLocation == "Kitch")
                {
                    chk_Line9_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_Kitch.Checked = false;
                }


                if (Line9CFLLocation == "BR")
                {
                    chk_Line9_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_BR.Checked = false;
                }


                if (Line9CFLLocation == "Bath")
                {
                    chk_Line9_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_Bath.Checked = false;
                }

                if (Line9CFLLocation == "Hall")
                {
                    chk_Line9_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_Hall.Checked = false;
                }

                if (Line9CFLLocation == "Other")
                {
                    chk_Line9_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line10CFLLocation = Convert.ToString(dt.Rows[0]["Line10CFLLocation"]);
                if (Line10CFLLocation == "LR")
                {
                    chk_Line10_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_LR.Checked = false;
                }

                if (Line10CFLLocation == "DR")
                {
                    chk_Line10_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_DR.Checked = false;
                }

                if (Line10CFLLocation == "Kitch")
                {
                    chk_Line10_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_Kitch.Checked = false;
                }


                if (Line10CFLLocation == "BR")
                {
                    chk_Line10_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_BR.Checked = false;
                }


                if (Line10CFLLocation == "Bath")
                {
                    chk_Line10_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_Bath.Checked = false;
                }

                if (Line10CFLLocation == "Hall")
                {
                    chk_Line10_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_Hall.Checked = false;
                }

                if (Line10CFLLocation == "Other")
                {
                    chk_Line10_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////

                string Line11CFLLocation = Convert.ToString(dt.Rows[0]["Line11CFLLocation"]);
                if (Line11CFLLocation == "LR")
                {
                    chk_Line11_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_LR.Checked = false;
                }

                if (Line11CFLLocation == "DR")
                {
                    chk_Line11_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_DR.Checked = false;
                }

                if (Line11CFLLocation == "Kitch")
                {
                    chk_Line11_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_Kitch.Checked = false;
                }


                if (Line11CFLLocation == "BR")
                {
                    chk_Line11_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_BR.Checked = false;
                }


                if (Line11CFLLocation == "Bath")
                {
                    chk_Line11_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_Bath.Checked = false;
                }

                if (Line11CFLLocation == "Hall")
                {
                    chk_Line11_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_Hall.Checked = false;
                }

                if (Line11CFLLocation == "Other")
                {
                    chk_Line11_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////

                string Line12CFLLocation = Convert.ToString(dt.Rows[0]["Line12CFLLocation"]);
                if (Line12CFLLocation == "LR")
                {
                    chk_Line12_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_LR.Checked = false;
                }

                if (Line12CFLLocation == "DR")
                {
                    chk_Line12_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_DR.Checked = false;
                }

                if (Line12CFLLocation == "Kitch")
                {
                    chk_Line12_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_Kitch.Checked = false;
                }


                if (Line12CFLLocation == "BR")
                {
                    chk_Line12_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_BR.Checked = false;
                }


                if (Line12CFLLocation == "Bath")
                {
                    chk_Line12_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_Bath.Checked = false;
                }

                if (Line12CFLLocation == "Hall")
                {
                    chk_Line12_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_Hall.Checked = false;
                }

                if (Line12CFLLocation == "Other")
                {
                    chk_Line12_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line13CFLLocation = Convert.ToString(dt.Rows[0]["Line13CFLLocation"]);
                if (Line13CFLLocation == "LR")
                {
                    chk_Line13_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_LR.Checked = false;
                }

                if (Line13CFLLocation == "DR")
                {
                    chk_Line13_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_DR.Checked = false;
                }

                if (Line13CFLLocation == "Kitch")
                {
                    chk_Line13_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_Kitch.Checked = false;
                }


                if (Line13CFLLocation == "BR")
                {
                    chk_Line13_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_BR.Checked = false;
                }


                if (Line13CFLLocation == "Bath")
                {
                    chk_Line13_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_Bath.Checked = false;
                }

                if (Line13CFLLocation == "Hall")
                {
                    chk_Line13_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_Hall.Checked = false;
                }

                if (Line13CFLLocation == "Other")
                {
                    chk_Line13_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////

                string Line14CFLLocation = Convert.ToString(dt.Rows[0]["Line14CFLLocation"]);
                if (Line14CFLLocation == "LR")
                {
                    chk_Line14_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_LR.Checked = false;
                }

                if (Line14CFLLocation == "DR")
                {
                    chk_Line14_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_DR.Checked = false;
                }

                if (Line14CFLLocation == "Kitch")
                {
                    chk_Line14_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_Kitch.Checked = false;
                }


                if (Line14CFLLocation == "BR")
                {
                    chk_Line14_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_BR.Checked = false;
                }


                if (Line14CFLLocation == "Bath")
                {
                    chk_Line14_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_Bath.Checked = false;
                }

                if (Line14CFLLocation == "Hall")
                {
                    chk_Line14_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_Hall.Checked = false;
                }

                if (Line14CFLLocation == "Other")
                {
                    chk_Line14_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line15CFLLocation = Convert.ToString(dt.Rows[0]["Line15CFLLocation"]);
                if (Line15CFLLocation == "LR")
                {
                    chk_Line15_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_LR.Checked = false;
                }

                if (Line15CFLLocation == "DR")
                {
                    chk_Line15_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_DR.Checked = false;
                }

                if (Line15CFLLocation == "Kitch")
                {
                    chk_Line15_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_Kitch.Checked = false;
                }


                if (Line15CFLLocation == "BR")
                {
                    chk_Line15_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_BR.Checked = false;
                }


                if (Line15CFLLocation == "Bath")
                {
                    chk_Line15_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_Bath.Checked = false;
                }

                if (Line15CFLLocation == "Hall")
                {
                    chk_Line15_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_Hall.Checked = false;
                }

                if (Line15CFLLocation == "Other")
                {
                    chk_Line15_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line16CFLLocation = Convert.ToString(dt.Rows[0]["Line16CFLLocation"]);
                if (Line16CFLLocation == "LR")
                {
                    chk_Line16_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_LR.Checked = false;
                }

                if (Line16CFLLocation == "DR")
                {
                    chk_Line16_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_DR.Checked = false;
                }

                if (Line16CFLLocation == "Kitch")
                {
                    chk_Line16_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_Kitch.Checked = false;
                }


                if (Line16CFLLocation == "BR")
                {
                    chk_Line16_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_BR.Checked = false;
                }


                if (Line16CFLLocation == "Bath")
                {
                    chk_Line16_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_Bath.Checked = false;
                }

                if (Line16CFLLocation == "Hall")
                {
                    chk_Line16_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_Hall.Checked = false;
                }

                if (Line16CFLLocation == "Other")
                {
                    chk_Line16_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line17CFLLocation = Convert.ToString(dt.Rows[0]["Line17CFLLocation"]);
                if (Line17CFLLocation == "LR")
                {
                    chk_Line17_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_LR.Checked = false;
                }

                if (Line17CFLLocation == "DR")
                {
                    chk_Line17_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_DR.Checked = false;
                }

                if (Line17CFLLocation == "Kitch")
                {
                    chk_Line17_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_Kitch.Checked = false;
                }


                if (Line17CFLLocation == "BR")
                {
                    chk_Line17_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_BR.Checked = false;
                }


                if (Line17CFLLocation == "Bath")
                {
                    chk_Line17_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_Bath.Checked = false;
                }

                if (Line17CFLLocation == "Hall")
                {
                    chk_Line17_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_Hall.Checked = false;
                }

                if (Line17CFLLocation == "Other")
                {
                    chk_Line17_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line18CFLLocation = Convert.ToString(dt.Rows[0]["Line18CFLLocation"]);
                if (Line18CFLLocation == "LR")
                {
                    chk_Line18_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_LR.Checked = false;
                }

                if (Line18CFLLocation == "DR")
                {
                    chk_Line18_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_DR.Checked = false;
                }

                if (Line18CFLLocation == "Kitch")
                {
                    chk_Line18_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_Kitch.Checked = false;
                }


                if (Line18CFLLocation == "BR")
                {
                    chk_Line18_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_BR.Checked = false;
                }


                if (Line18CFLLocation == "Bath")
                {
                    chk_Line18_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_Bath.Checked = false;
                }

                if (Line18CFLLocation == "Hall")
                {
                    chk_Line18_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_Hall.Checked = false;
                }

                if (Line18CFLLocation == "Other")
                {
                    chk_Line18_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                txt_Line1_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line1WARMMeasure"]);
                txt_Line2_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line2WARMMeasure"]);
                txt_Line3_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line3WARMMeasure"]);
                txt_Line4_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line4WARMMeasure"]);
                txt_Line5_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line5WARMMeasure"]);
                txt_Line6_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line6WARMMeasure"]);
                txt_Line7_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line7WARMMeasure"]);
                txt_Line8_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line8WARMMeasure"]);
                txt_Line9_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line9WARMMeasure"]);
                txt_Line10_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line10WARMMeasure"]);
                txt_Line11_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line11WARMMeasure"]);
                txt_Line12_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line12WARMMeasure"]);


                string Line13BulbType = Convert.ToString(dt.Rows[0]["Line13BulbType"]);
                if (Line13BulbType == "SB")
                {
                    chk_Line13_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_SB.Checked = false;
                }

                if (Line13BulbType == "RF")
                {
                    chk_Line13_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_RF.Checked = false;
                }



                string Line14BulbType = Convert.ToString(dt.Rows[0]["Line14BulbType"]);
                if (Line14BulbType == "SB")
                {
                    chk_Line14_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_SB.Checked = false;
                }

                if (Line14BulbType == "RF")
                {
                    chk_Line14_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_RF.Checked = false;
                }


                string Line15BulbType = Convert.ToString(dt.Rows[0]["Line15BulbType"]);
                if (Line15BulbType == "SB")
                {
                    chk_Line15_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_SB.Checked = false;
                }

                if (Line15BulbType == "RF")
                {
                    chk_Line15_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_RF.Checked = false;
                }




                string Line16BulbType = Convert.ToString(dt.Rows[0]["Line16BulbType"]);
                if (Line16BulbType == "SB")
                {
                    chk_Line16_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_SB.Checked = false;
                }

                if (Line16BulbType == "RF")
                {
                    chk_Line16_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_RF.Checked = false;
                }


                string Line17BulbType = Convert.ToString(dt.Rows[0]["Line17BulbType"]);
                if (Line17BulbType == "SB")
                {
                    chk_Line17_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_SB.Checked = false;
                }

                if (Line17BulbType == "RF")
                {
                    chk_Line17_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_RF.Checked = false;
                }




                string Line18BulbType = Convert.ToString(dt.Rows[0]["Line18BulbType"]);
                if (Line18BulbType == "SB")
                {
                    chk_Line18_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_SB.Checked = false;
                }

                if (Line18BulbType == "RF")
                {
                    chk_Line18_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_RF.Checked = false;
                }






                string InstalledFurnaceFilter = Convert.ToString(dt.Rows[0]["InstalledFurnaceFilter"]);
                if (InstalledFurnaceFilter == "Y")
                {
                    rdo_FilterWhistle_Yes.Checked = true;
                }
                else if (InstalledFurnaceFilter == "N")
                {
                    rdo_FilterWhistle_No.Checked = true;
                }





                txtTorchInstall.Text = Convert.ToString(dt.Rows[0]["TorchiresInstalled"]);
                txtSpcltyBulbInstall.Text = Convert.ToString(dt.Rows[0]["OtherSpecialityBulbInstalled"]);
                txt_LedNightLight.Text = Convert.ToString(dt.Rows[0]["LEDNightLights"]);

                txt_LedNightLight_Location1.Text = Convert.ToString(dt.Rows[0]["Line1LEDNightLightLocation"]);
                txt_LedNightLight_Location2.Text = Convert.ToString(dt.Rows[0]["Line2LEDNightLightLocation"]);
                txt_LedNightLight_Location3.Text = Convert.ToString(dt.Rows[0]["Line3LEDNightLightLocation"]);
                txt_LedNightLight_Location4.Text = Convert.ToString(dt.Rows[0]["Line4LEDNightLightLocation"]);

                txt_SmartPowerStrip.Text = Convert.ToString(dt.Rows[0]["SmartPowerStrip"]);
                txt_SmartPower_Location1.Text = Convert.ToString(dt.Rows[0]["Line1SmartPowerStripLocation"]);
                txt_SmartPower_Location2.Text = Convert.ToString(dt.Rows[0]["Line2SmartPowerStripLocation"]);
                txt_SmartPower_Location3.Text = Convert.ToString(dt.Rows[0]["Line3SmartPowerStripLocation"]);
                txt_SmartPower_Location4.Text = Convert.ToString(dt.Rows[0]["Line4SmartPowerStripLocation"]);


                string Line1SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line1SmartPowerStrip6Outlet"]);
                if (Line1SmartPowerStrip6Outlet == "Y")
                {
                    rdo_Line1_6_9_Outlet.Checked = true;
                }
                else
                {
                    rdo_Line1_6_9_Outlet.Checked = false;
                }




                string Line2SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line2SmartPowerStrip6Outlet"]);
                if (Line2SmartPowerStrip6Outlet == "Y")
                {
                    rdo_Line2_6_9_Outlet.Checked = true;
                }
                else
                {
                    rdo_Line2_6_9_Outlet.Checked = false;
                }


                string Line3SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line3SmartPowerStrip6Outlet"]);
                if (Line3SmartPowerStrip6Outlet == "Y")
                {
                    rdo_Line3_6_9_Outlet.Checked = true;
                }
                else
                {
                    rdo_Line3_6_9_Outlet.Checked = false;
                }


                string Line4SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line4SmartPowerStrip6Outlet"]);
                if (Line4SmartPowerStrip6Outlet == "Y")
                {
                    rdo_Line4_6_9_Outlet.Checked = true;
                }
                else
                {
                    rdo_Line4_6_9_Outlet.Checked = false;
                }


                string Line1SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line1SmartPowerStrip10Outlet"]);
                if (Line1SmartPowerStrip10Outlet == "Y")
                {
                    rdo_Line1_10_Outlet.Checked = true;
                }
                else
                {
                    rdo_Line1_10_Outlet.Checked = false;
                }


                string Line2SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line2SmartPowerStrip10Outlet"]);
                if (Line2SmartPowerStrip10Outlet == "Y")
                {
                    rdo_Line2_10_Outlet.Checked = true;
                }
                else
                {
                    rdo_Line2_10_Outlet.Checked = false;
                }


                string Line3SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line3SmartPowerStrip10Outlet"]);
                if (Line3SmartPowerStrip10Outlet == "Y")
                {
                    rdo_Line3_10_Outlet.Checked = true;
                }
                else
                {
                    rdo_Line3_10_Outlet.Checked = false;
                }



                string Line4SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line4SmartPowerStrip10Outlet"]);
                if (Line4SmartPowerStrip10Outlet == "Y")
                {
                    rdo_Line4_10_Outlet.Checked = true;
                }
                else
                {
                    rdo_Line4_10_Outlet.Checked = false;
                }

                txt_ExistingAlarms.Text = Convert.ToString(dt.Rows[0]["COAlarms5YearOld"]);
                txt_NewAlarms.Text = Convert.ToString(dt.Rows[0]["TotalNEWAlarmsInstalled"]);

                txt_COAlarms_Location1.Text = Convert.ToString(dt.Rows[0]["Line1COAlarmLocation"]);
                txt_COAlarms_Location2.Text = Convert.ToString(dt.Rows[0]["Line2COAlarmLocation"]);
                txt_COAlarms_Location3.Text = Convert.ToString(dt.Rows[0]["Line3COAlarmLocation"]);
                txt_COAlarms_Location4.Text = Convert.ToString(dt.Rows[0]["Line4COAlarmLocation"]);
                txt_COAlarms_Location5.Text = Convert.ToString(dt.Rows[0]["Line5COAlarmLocation"]);

            }
        }
        catch
        {
        }
    }
    #endregion

    # region form5
    public void fill_form5()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_4(JobNum);
            if (dt.Rows.Count > 0)
            {

                txt_TotalLedInstallBulb.Text = Convert.ToString(dt.Rows[0]["TotalNumberLedBulbsInstalled"]);
                txt_RecessedFlood.Text = Convert.ToString(dt.Rows[0]["NumberRecessedFloodBulbsInstalled"]);

                txt_Line1_Total.Text = Convert.ToString(dt.Rows[0]["Line1_Total"]);
                txt_Line2_Total.Text = Convert.ToString(dt.Rows[0]["Line2_Total"]);
                txt_Line3_Total.Text = Convert.ToString(dt.Rows[0]["Line3_Total"]);
                txt_Line4_Total.Text = Convert.ToString(dt.Rows[0]["Line4_Total"]);


                txt_Line1_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line1_Location"]);
                txt_Line2_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line2_Location"]);
                txt_Line3_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line3_Location"]);
                txt_Line4_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line4_Location"]);

                string Line1_68Standard = Convert.ToString(dt.Rows[0]["Line1_68Standard"]);
                if (Line1_68Standard == "Y")
                {
                    Chk_Line1_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line1_68Standard.Checked = false;
                }


                string Line1_913Standard = Convert.ToString(dt.Rows[0]["Line1_913Standard"]);
                if (Line1_913Standard == "Y")
                {
                    Chk_Line1_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line1_913Standard.Checked = false;
                }


                string Line1_23Globe = Convert.ToString(dt.Rows[0]["Line1_23Globe"]);
                if (Line1_23Globe == "Y")
                {
                    Chk_Line1_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line1_23Globe.Checked = false;
                }


                string Line1_35MedBase = Convert.ToString(dt.Rows[0]["Line1_35Torpedo"]);
                if (Line1_35MedBase == "Y")
                {
                    Chk_Line1_35MidBase.Checked = true;
                }
                else
                {
                    Chk_Line1_35MidBase.Checked = false;
                }


                string Line1_Candelabra = Convert.ToString(dt.Rows[0]["Line1_37Candelabra"]);
                if (Line1_Candelabra == "Y")
                {
                    Chk_Line1_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line1_Candelabra.Checked = false;
                }


                string Line1_8Flood = Convert.ToString(dt.Rows[0]["Line1_8Flood"]);
                if (Line1_8Flood == "Y")
                {
                    Chk_Line1_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line1_8Flood.Checked = false;
                }


                string Line1_13Flood = Convert.ToString(dt.Rows[0]["Line1_13Flood"]);
                if (Line1_13Flood == "Y")
                {
                    Chk_Line1_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line1_13Flood.Checked = false;
                }


                string Line1_17Flood = Convert.ToString(dt.Rows[0]["Line1_17Flood"]);
                if (Line1_17Flood == "Y")
                {
                    Chk_Line1_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line1_17Flood.Checked = false;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line2_68Standard = Convert.ToString(dt.Rows[0]["Line2_68Standard"]);
                if (Line2_68Standard == "Y")
                {
                    Chk_Line2_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line2_68Standard.Checked = false;
                }


                string Line2_913Standard = Convert.ToString(dt.Rows[0]["Line2_913Standard"]);
                if (Line2_913Standard == "Y")
                {
                    Chk_Line2_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line2_913Standard.Checked = false;
                }


                string Line2_23Globe = Convert.ToString(dt.Rows[0]["Line2_23Globe"]);
                if (Line2_23Globe == "Y")
                {
                    Chk_Line2_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line2_23Globe.Checked = false;
                }


                string Line2_35MedBase = Convert.ToString(dt.Rows[0]["Line2_35Torpedo"]);
                if (Line2_35MedBase == "Y")
                {
                    Chk_Line2_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line2_35MedBase.Checked = false;
                }


                string Line2_Candelabra = Convert.ToString(dt.Rows[0]["Line2_37Candelabra"]);
                if (Line2_Candelabra == "Y")
                {
                    Chk_Line2_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line2_Candelabra.Checked = false;
                }


                string Line2_8Flood = Convert.ToString(dt.Rows[0]["Line2_8Flood"]);
                if (Line2_8Flood == "Y")
                {
                    Chk_Line2_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line2_8Flood.Checked = false;
                }


                string Line2_13Flood = Convert.ToString(dt.Rows[0]["Line2_13Flood"]);
                if (Line2_13Flood == "Y")
                {
                    Chk_Line2_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line2_13Flood.Checked = false;
                }


                string Line2_17Flood = Convert.ToString(dt.Rows[0]["Line2_17Flood"]);
                if (Line2_17Flood == "Y")
                {
                    Chk_Line2_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line2_17Flood.Checked = false;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line3_68Standard = Convert.ToString(dt.Rows[0]["Line3_68Standard"]);
                if (Line3_68Standard == "Y")
                {
                    Chk_Line3_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line3_68Standard.Checked = false;
                }


                string Line3_913Standard = Convert.ToString(dt.Rows[0]["Line3_913Standard"]);
                if (Line3_913Standard == "Y")
                {
                    Chk_Line3_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line3_913Standard.Checked = false;
                }


                string Line3_23Globe = Convert.ToString(dt.Rows[0]["Line3_23Globe"]);
                if (Line3_23Globe == "Y")
                {
                    Chk_Line3_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line3_23Globe.Checked = false;
                }


                string Line3_35MedBase = Convert.ToString(dt.Rows[0]["Line3_35Torpedo"]);
                if (Line3_35MedBase == "Y")
                {
                    Chk_Line3_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line3_35MedBase.Checked = false;
                }


                string Line3_Candelabra = Convert.ToString(dt.Rows[0]["Line3_37Candelabra"]);
                if (Line3_Candelabra == "Y")
                {
                    Chk_Line3_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line3_Candelabra.Checked = false;
                }


                string Line3_8Flood = Convert.ToString(dt.Rows[0]["Line3_8Flood"]);
                if (Line3_8Flood == "Y")
                {
                    Chk_Line3_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line3_8Flood.Checked = false;
                }


                string Line3_13Flood = Convert.ToString(dt.Rows[0]["Line3_13Flood"]);
                if (Line3_13Flood == "Y")
                {
                    Chk_Line3_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line3_13Flood.Checked = false;
                }


                string Line3_17Flood = Convert.ToString(dt.Rows[0]["Line3_17Flood"]);
                if (Line3_17Flood == "Y")
                {
                    Chk_Line3_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line3_17Flood.Checked = false;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line4_68Standard = Convert.ToString(dt.Rows[0]["Line4_68Standard"]);
                if (Line4_68Standard == "Y")
                {
                    Chk_Line4_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line4_68Standard.Checked = false;
                }


                string Line4_913Standard = Convert.ToString(dt.Rows[0]["Line4_913Standard"]);
                if (Line4_913Standard == "Y")
                {
                    Chk_Line4_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line4_913Standard.Checked = false;
                }


                string Line4_23Globe = Convert.ToString(dt.Rows[0]["Line4_23Globe"]);
                if (Line4_23Globe == "Y")
                {
                    Chk_Line4_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line4_23Globe.Checked = false;
                }


                string Line4_35MedBase = Convert.ToString(dt.Rows[0]["Line4_35Torpedo"]);
                if (Line4_35MedBase == "Y")
                {
                    Chk_Line4_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line4_35MedBase.Checked = false;
                }


                string Line4_Candelabra = Convert.ToString(dt.Rows[0]["Line4_37Candelabra"]);
                if (Line4_Candelabra == "Y")
                {
                    Chk_Line4_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line4_Candelabra.Checked = false;
                }


                string Line4_8Flood = Convert.ToString(dt.Rows[0]["Line4_8Flood"]);
                if (Line4_8Flood == "Y")
                {
                    Chk_Line4_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line4_8Flood.Checked = false;
                }


                string Line4_13Flood = Convert.ToString(dt.Rows[0]["Line4_13Flood"]); ;
                if (Line4_13Flood == "Y")
                {
                    Chk_Line4_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line4_13Flood.Checked = false;
                }


                string Line4_17Flood = Convert.ToString(dt.Rows[0]["Line4_17Flood"]); ;
                if (Line4_17Flood == "Y")
                {
                    Chk_Line4_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line4_17Flood.Checked = false;
                }


            }




            dt = obj_MetedAudit.GetMETEDAudit_5(JobNum);
            DateTime dateRec = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]);
            DateTime dateComr = Convert.ToDateTime("1/12/2015");
            if (dateRec < dateComr)
            {
                spn_freezersUsed.Visible = true;
                txt_FreezersUsed.Visible = true;
            }
            else
            {
                spn_freezersUsed.Visible = false;
                txt_FreezersUsed.Visible = false;
            }

            if (dt.Rows.Count > 0)
            {
                txt_RefrigeratorsUsed.Text = Convert.ToString(dt.Rows[0]["NumberOfRefrigeratorsUsed"]);
                txt_FreezersUsed.Text = Convert.ToString(dt.Rows[0]["NumberOfFreezersUsed"]);
                txt_PriRefrigerator_Location.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigLocation"]);
                txt_PriRefrigerator_OperatingCost.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigCalculatedCostMonth"]);
                txt_PriRefrigerator_Make.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigMake"]);
                txt_PriRefrigerator_Model.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigModel"]);
                txt_PriRefrigerator_Year.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigYear"]);
                txt_PriRefrigerator_Size.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigSize"]);
                txt_PriRefrigerator_StartTime.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigStartTime"]);
                txt_PriRefrigerator_EndTime.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigEndTime"]);
                txt_PriRefrigerator_TotalTime.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigTotalTimeMonitored"]);
                txt_PriRefrigerator_Monitor.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigReading"]);
                txt_PriRefrigerator_Conversion.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigkWhconversionatonehour"]);

                string IsPrimaryRefrigElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsPrimaryRefrigElligibleForReplacement"]);
                if (IsPrimaryRefrigElligibleForReplacement == "Y")
                {
                    rdo_PriRefrigerator_Replacement_Yes.Checked = true;
                }
                else if (IsPrimaryRefrigElligibleForReplacement == "N")
                {
                    rdo_PriRefrigerator_Replacement_No.Checked = true;
                }



                txt_PriRefrigerator_ReplaceSize.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigReplacementSize"]);
                txt_PriRefrigerator_TemperatureFood.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigTemperatureinsidefreshfood"]);
                txt_PriRefrigerator_TemperatureRoom.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigRoomTemp"]);
                txt_PriRefrigerator_TemperatureFrezer.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigTemperatureinsidefreezer"]);

                string PrimaryRefrigDataUsed = Convert.ToString(dt.Rows[0]["PrimaryRefrigDataUsed"]);
                if (PrimaryRefrigDataUsed == "Y")
                {
                    chk_PriRefrigerator_DatabaseUsed.Checked = true;
                }
                else
                {
                    chk_PriRefrigerator_DatabaseUsed.Checked = false;
                }
                string PrimaryRefrigDidNotTestBecause = Convert.ToString(dt.Rows[0]["PrimaryRefrigDidNotTestBecause"]);
                if (PrimaryRefrigDidNotTestBecause == "Y")
                {
                    chk_PriRefrigerator_NotTest.Checked = true;
                }
                else
                {
                    chk_PriRefrigerator_NotTest.Checked = false;
                }
                string PrimaryRefrigCouldNotMove = Convert.ToString(dt.Rows[0]["PrimaryRefrigCouldNotMove"]);
                if (PrimaryRefrigCouldNotMove == "CM")
                {
                    rdo_PriRefrigerator_NotTst_NotMove.Checked = true;
                }
                else if (PrimaryRefrigCouldNotMove == "5Y")
                {
                    rdo_PriRefrigerator_NotTst_5Yr_Old.Checked = true;
                }
                else if (PrimaryRefrigCouldNotMove == "CR")
                {
                    rdo_PriRefrigerator_NotTst_CustomerRefuse.Checked = true;
                }



                txt_SecoRefrigerator_Location.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigLocation"]);
                txt_SecoRefrigerator_OperatingCost.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigCalculatedCostMonth"]);
                txt_SecoRefrigerator_Make.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigMake"]);
                txt_SecoRefrigerator_Model.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigModel"]);
                txt_SecoRefrigerator_Year.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigYear"]);
                txt_SecoRefrigerator_Size.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigSize"]);
                txt_SecoRefrigerator_StartTime.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigStartTime"]);
                txt_SecoRefrigerator_EndTime.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigEndTime"]);
                txt_SecoRefrigerator_TotalTime.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigTotalTimeMonitored"]);
                txt_SecoRefrigerator_Monitor.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigReading"]);
                txt_SecoRefrigerator_Conversion.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigkWhconversionatonehour"]);
                string IsSecondaryRefrigElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsSecondaryRefrigElligibleForReplacement"]);
                if (IsSecondaryRefrigElligibleForReplacement == "Y")
                {
                    rdo_SecoRefrigerator_Replacement_Yes.Checked = true;
                }
                else if (IsSecondaryRefrigElligibleForReplacement == "N")
                {
                    rdo_SecoRefrigerator_Replacement_No.Checked = true;
                }


                txt_SecoRefrigerator_ReplacementSize.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigReplacementSize"]);
                txt_SecoRefrigerator_TemperatureFood.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigTemperatureinsidefreshfood"]);
                txt_SecoRefrigerator_TemperatureRoom.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigRoomTemp"]);
                txt_SecoRefrigerator_TemperatureFrezer.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigTemperatureinsidefreezer"]);
                string SecondaryRefirgDatabaseUsed = Convert.ToString(dt.Rows[0]["SecondaryRefirgDatabaseUsed"]);
                if (SecondaryRefirgDatabaseUsed == "Y")
                {
                    chk_SecoRefrigerator_DatabaseUsed.Checked = true;
                }
                else
                {
                    chk_SecoRefrigerator_DatabaseUsed.Checked = false;
                }
                string SecondaryRefrigDidNotTestBecause = Convert.ToString(dt.Rows[0]["SecondaryRefrigDidNotTestBecause"]);
                if (SecondaryRefrigDidNotTestBecause == "Y")
                {
                    chk_SecoRefrigerator_NotTest.Checked = true;
                }
                else
                {
                    chk_SecoRefrigerator_NotTest.Checked = false;
                }

                string SecondaryRefrigCouldNotMove = Convert.ToString(dt.Rows[0]["SecondaryRefrigCouldNotMove"]);

                if (SecondaryRefrigCouldNotMove == "CM")
                {
                    rdo_SecoRefrigerator_NotTest_NotMove.Checked = true;
                }
                else if (SecondaryRefrigCouldNotMove == "5Y")
                {
                    rdo_SecoRefrigerator_NotTest_5Yr_Old.Checked = true;
                }
                else if (SecondaryRefrigCouldNotMove == "CR")
                {
                    rdo_SecoRefrigerator_NotTest_CustomerRefuse.Checked = true;
                }



                txt_AddRefrigerator_Location.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigLocation"]);
                txt_AddRefrigerator_OperatingCost.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigCalculatedCostMonth"]);
                txt_AddRefrigerator_Make.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigMake"]);
                txt_AddRefrigerator_Model.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigModel"]);
                txt_AddRefrigerator_Year.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigYear"]);
                txt_AddRefrigerator_Size.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigSize"]);
                txt_AddRefrigerator_StartTime.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigStartTime"]);
                txt_AddRefrigerator_EndTime.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigEndTime"]);
                txt_AddRefrigerator_TotalTime.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigMonitored"]);
                txt_AddRefrigerator_Monitor.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigReading"]);
                txt_AddRefrigerator_Conversion.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigkWhConversionOneHour"]);
                txt_AddRefrigerator_TemperatureFood.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigTemperatureInsideFreshFood"]);
                txt_AddRefrigerator_TemperatureRoom.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigRoomTemperature"]);
                txt_AddRefrigerator_TemperatureFrezer.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigTemperatureInsideFreezer"]);
                string AdditionalRefrigDatabaseUsed = Convert.ToString(dt.Rows[0]["AdditionalRefrigDatabaseUsed"]);
                if (AdditionalRefrigDatabaseUsed == "Y")
                {
                    chk_AddRefrigerator_DatabaseUsed.Checked = true;
                }
                else
                {
                    chk_AddRefrigerator_DatabaseUsed.Checked = false;
                }

                txt_AddRefrigerator_ReplacementSize.Text = Convert.ToString(dt.Rows[0]["AdditionalRefrigReplacementSize"]);
                string AdditionalRefrigDidNotTestBecause = Convert.ToString(dt.Rows[0]["AdditionalRefrigDidNotTestBecause"]);
                if (AdditionalRefrigDidNotTestBecause == "Y")
                {
                    chk_AddRefrigerator_NotTest.Checked = true;
                }
                string AdditionalRefrigCouldNotMove = Convert.ToString(dt.Rows[0]["AdditionalRefrigCouldNotMove"]);
                if (AdditionalRefrigCouldNotMove == "CM")
                {
                    rdo_AddRefrigerator_NotTest_NotMove.Checked = true;
                }
                else if (AdditionalRefrigCouldNotMove == "5Y")
                {
                    rdo_AddRefrigerator_NotTest_5Yr_Old.Checked = true;
                }
                else if (AdditionalRefrigCouldNotMove == "CR")
                {
                    rdo_AddRefrigerator_NotTest_CustomerRefuse.Checked = true;
                }


                string IsAdditionalRefrigElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsAdditionalRefrigElligibleForReplacement"]);
                if (IsAdditionalRefrigElligibleForReplacement == "Y")
                {
                    rdo_AddRefrigerator_Replacement_Yes.Checked = true;
                }
                else if (IsAdditionalRefrigElligibleForReplacement == "N")
                {
                    rdo_AddRefrigerator_Replacement_No.Checked = true;
                }
            }
        }
        catch
        {
        }
    }
    #endregion

    # region form6
    public void fill_form6()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_5(JobNum);
            if (dt.Rows.Count > 0)
            {

                ////////////////////////////////////////////////////////////////////////////

                string PrimaryrefrigeratorType = Convert.ToString(dt.Rows[0]["PrimaryrefrigeratorType"]);
                if (PrimaryrefrigeratorType == "T")
                {
                    Chk_AddRefrigerator_TopMount.Checked = true;
                }
                else if (PrimaryrefrigeratorType == "B")
                {
                    Chk_AddRefrigerator_BottomMount.Checked = true;
                }
                else if (PrimaryrefrigeratorType == "S")
                {
                    Chk_AddRefrigerator_SxS.Checked = true;
                }



                string SecondryrefrigeratorType = Convert.ToString(dt.Rows[0]["SecondryrefrigeratorType"]);
                if (SecondryrefrigeratorType == "T")
                {
                    Chk_SecoRefrigerator_TopMount.Checked = true;
                }
                else if (SecondryrefrigeratorType == "B")
                {
                    Chk_SecoRefrigerator_BottomMount.Checked = true;
                }
                else if (SecondryrefrigeratorType == "S")
                {
                    Chk_SecoRefrigerator_SxS.Checked = true;
                }


                string AdditionalrefrigeratorType = Convert.ToString(dt.Rows[0]["AdditionalrefrigeratorType"]);
                if (AdditionalrefrigeratorType == "T")
                {
                    Chk_AddRefrigerator_TopMount.Checked = true;
                }
                else if (AdditionalrefrigeratorType == "B")
                {
                    Chk_AddRefrigerator_BottomMount.Checked = true;
                }
                else if (AdditionalrefrigeratorType == "S")
                {
                    Chk_AddRefrigerator_SxS.Checked = true;
                }




                string PrimaryrefrigeratorIcemaker = Convert.ToString(dt.Rows[0]["PrimaryrefrigeratorIcemaker"]);
                if (PrimaryrefrigeratorIcemaker == "Y")
                {
                    Chk_PriRefrigerator_IceMaker_Yes.Checked = true;
                }
                else if (PrimaryrefrigeratorIcemaker == "N")
                {
                    Chk_PriRefrigerator_IceMaker_No.Checked = true;
                }


                string SecondryrefrigeratorIcemaker = Convert.ToString(dt.Rows[0]["SecondryrefrigeratorIcemaker"]);
                if (SecondryrefrigeratorIcemaker == "Y")
                {
                    Chk_SecoRefrigerator_IceMaker_Yes.Checked = true;
                }
                else if (SecondryrefrigeratorIcemaker == "N")
                {
                    Chk_SecoRefrigerator_IceMaker_No.Checked = true;
                }


                string AdditionalrefrigeratorIcemaker = Convert.ToString(dt.Rows[0]["AdditionalrefrigeratorIcemaker"]);
                if (AdditionalrefrigeratorIcemaker == "Y")
                {
                    Chk_AddRefrigerator_IceMaker_Yes.Checked = true;
                }
                else if (AdditionalrefrigeratorIcemaker == "N")
                {
                    Chk_AddRefrigerator_IceMaker_No.Checked = true;
                }
            }

            //////////////////////////////////////////////////////////////////////////


            dt = obj_MetedAudit.GetMETEDAudit_6(JobNum);
            if (dt.Rows.Count > 0)
            {

                string PrimaryFreezerFrostFree = Convert.ToString(dt.Rows[0]["PrimaryFreezerFrostFree"]);
                if (PrimaryFreezerFrostFree == "Y")
                {
                    chk_PriFrezer_FrostFree_Yes.Checked = true;
                }
                else if (PrimaryFreezerFrostFree == "N")
                {
                    chk_PriFrezer_FrostFree_No.Checked = true;
                }


                string SecondryFreezerFrostFree = Convert.ToString(dt.Rows[0]["SecondryFreezerFrostFree"]);
                if (SecondryFreezerFrostFree == "Y")
                {
                    Chk_SecoFrezer_FrostFree_Yes.Checked = true;
                }
                else if (SecondryFreezerFrostFree == "N")
                {
                    Chk_SecoFrezer_FrostFree_No.Checked = true;
                }


                string AdditionalFreezerFrostFree = Convert.ToString(dt.Rows[0]["AdditionalFreezerFrostFree"]);
                if (AdditionalFreezerFrostFree == "Y")
                {
                    Chk_AddFrezer_FrostFree_Yes.Checked = true;
                }
                else if (AdditionalFreezerFrostFree == "N")
                {
                    Chk_AddFrezer_FrostFree_No.Checked = true;
                }
            }


            dt = obj_MetedAudit.GetMETEDAudit_6(JobNum);
            DateTime dateRec = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]);
            DateTime dateComr = Convert.ToDateTime("1/12/2015");
            if (dateRec < dateComr)
            {
                tr_freezersUsed.Visible = false;
            }
            else
            {
                tr_freezersUsed.Visible = true;
            }
            if (dt.Rows.Count > 0)
            {
                txt_FreezersUsed6.Text = Convert.ToString(dt.Rows[0]["freezersUsed"]);
                txt_PriFrezer_Location.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerLocation"]);
                txt_PriFrezer_OperatingCost.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerCalculatedCostMonth"]);
                txt_PriFrezer_Make.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerMake"]);
                txt_PriFrezer_Model.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerModel"]);
                txt_PriFrezer_Year.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerYear"]);
                txt_PriFrezer_Size.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerSize"]);
                txt_PriFrezer_StartTime.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerStartTime"]);
                txt_PriFrezer_EndTime.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerEndTime"]);
                txt_PriFrezer_TotalTime.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerTotalTimeMonitored"]);
                txt_PriFrezer_Monitor.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerReading"]);
                txt_PriFrezer_Conversion.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerkWhconversionatonehour"]);

                string IsPrimaryFreezerElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsPrimaryFreezerElligibleForReplacement"]);
                if (IsPrimaryFreezerElligibleForReplacement == "Y")
                {
                    rdo_PriFrezer_Replacement_Yes.Checked = true;
                }
                else if (IsPrimaryFreezerElligibleForReplacement == "N")
                {
                    rdo_PriFrezer_Replacement_No.Checked = true;
                }

                txt_PriFrezer_TemperatureFood.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerTemperatureInsideFreshFood"]);
                txt_PriFrezer_TemperatureRoom.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerRoomTemperature"]);

                string PrimaryFreezerDataBaseUsed = Convert.ToString(dt.Rows[0]["PrimaryFreezerDataBaseUsed"]);
                if (PrimaryFreezerDataBaseUsed == "Y")
                {
                    chk_PriFrezer_DatabseUsed.Checked = true;
                }


                txt_PriFrezer_ReplacementSize.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerReplacementSize"]);
                txt_PriFrezer_TemperatureFrezer.Text = Convert.ToString(dt.Rows[0]["PrimaryFreezerTemperatureinsidefreezer"]);

                string PrimaryFreezerDidNotTestBecause = Convert.ToString(dt.Rows[0]["PrimaryFreezerDidNotTestBecause"]);
                if (PrimaryFreezerDidNotTestBecause == "Y")
                {
                    chk_PriFrezer_NotTst.Checked = true;
                }


                string PrimaryFreezerCouldNotMove = Convert.ToString(dt.Rows[0]["PrimaryFreezerCouldNotMove"]);
                if (PrimaryFreezerCouldNotMove == "CM")
                {
                    rdo_PriFrezer_NotTst_NotMove.Checked = true;
                }
                else if (PrimaryFreezerCouldNotMove == "5Y")
                {
                    rdo_PriFrezer_NotTst_5Yr_Old.Checked = true;
                }
                else if (PrimaryFreezerCouldNotMove == "CR")
                {
                    rdo_PriFrezer_NotTst_CustomerRefuse.Checked = true;
                }


                string PrimaryUprightChest = Convert.ToString(dt.Rows[0]["PrimaryUprightChest"]);
                if (PrimaryUprightChest == "U")
                {
                    rdoPrimaryUpright.Checked = true;
                }
                else if (PrimaryUprightChest == "C")
                {
                    rdoAdditionalChest.Checked = true;
                }

                txt_SecoFrezer_Location.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerLocation"]);
                txt_SecoFrezer_OperatingCost.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerCalculatedCostMonth"]);
                txt_SecoFrezer_Make.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerMake"]);
                txt_SecoFrezer_Model.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerModel"]);
                txt_SecoFrezer_year.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerYear"]);
                txt_SecoFrezer_Size.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerSize"]);
                txt_SecoFrezer_StartTime.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerStartTime"]);
                txt_SecoFrezer_EndTime.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerEndTime"]);
                txt_SecoFrezer_TotalTime.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerTotalTimeMonitored"]);
                txt_SecoFrezer_Monitor.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerReading"]);
                txt_SecoFrezer_Conversion.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerkWhconversionatonehour"]);
                txt_SecoFrezer_TemperactureFood.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezeTemperatureInsideFreshFood"]);
                txt_SecoFrezer_TemperactureRoom.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerRoomTemperature"]);

                string IsSecondaryFreezerElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsSecondaryFreezerElligibleForReplacement"]);
                if (IsSecondaryFreezerElligibleForReplacement == "Y")
                {
                    rdo_SecoFrezer_Replacement_Yes.Checked = true;
                }
                else if (IsSecondaryFreezerElligibleForReplacement == "N")
                {
                    rdo_SecoFrezer_Replacement_No.Checked = true;
                }


                string SecondaryFreezerDataBaseUsed = Convert.ToString(dt.Rows[0]["SecondaryFreezerDataBaseUsed"]);
                if (SecondaryFreezerDataBaseUsed == "Y")
                {
                    chk_SecoFrezer_DatabseUsed.Checked = true;
                }

                txt_SecoFrezer_ReplacementSize.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerReplacementSize"]);
                txt_SecoFrezer_TemperactureFrezer.Text = Convert.ToString(dt.Rows[0]["SecondaryFreezerTemperatureinsidefreezer"]);

                string SecondaryFreezerDidNotTestBecause = Convert.ToString(dt.Rows[0]["SecondaryFreezerDidNotTestBecause"]);
                if (SecondaryFreezerDidNotTestBecause == "Y")
                {
                    chk_SecoFrezer_NotTst.Checked = true;
                }


                string SecondaryFreezerCouldNotMove = Convert.ToString(dt.Rows[0]["SecondaryFreezerCouldNotMove"]);
                if (SecondaryFreezerCouldNotMove == "CM")
                {
                    rdo_SecoFrezer_NotTst_NotMove.Checked = true;
                }
                else if (SecondaryFreezerCouldNotMove == "5Y")
                {
                    rdo_SecoFrezer_NotTst_5Yr_Old.Checked = true;
                }
                else if (SecondaryFreezerCouldNotMove == "CR")
                {
                    rdo_SecoFrezer_NotTst_CustomerRefuse.Checked = true;
                }



                string SecondaryUprightChest = Convert.ToString(dt.Rows[0]["SecondryUprightChest"]);
                if (SecondaryUprightChest == "U")
                {
                    rdo_SecondryUpright.Checked = true;
                }
                else if (SecondaryUprightChest == "C")
                {
                    rdoSecondryChest.Checked = true;
                }
                txt_AddFrezer_Location.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerLocation"]);
                txt_AddFrezer_OperatingCost.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerCalculatedCostMonth"]);
                txt_AddFrezer_Make.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerMake"]);
                txt_AddFrezer_Model.Text = Convert.ToString(dt.Rows[0]["AdditionalPrimaryFreezerModel"]);
                txt_AddFrezer_Year.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerYear"]);
                txt_AddFrezer_Size.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerSize"]);
                txt_AddFrezer_StartTime.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerStartTime"]);
                txt_AddFrezer_EndTime.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerEndTime"]);
                txt_AddFrezer_TotalTime.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerTotalTimeMonitored"]);
                txt_AddFrezer_Monitor.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerReading"]);
                txt_AddFrezer_Conversion.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerkWhconversionatonehour"]);
                txt_AddFrezer_TemperatureFood.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezeTemperatureInsideFreshFood"]);
                txt_AddFrezer_TemperatureRoom.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerRoomTemperature"]);
                string IsAdditionalFreezerElligibleForReplacement = Convert.ToString(dt.Rows[0]["IsAdditionalFreezerElligibleForReplacement"]);
                if (IsAdditionalFreezerElligibleForReplacement == "Y")
                {
                    rdo_AddFrezer_Replacement_Yes.Checked = true;
                }
                else if (IsAdditionalFreezerElligibleForReplacement == "N")
                {
                    rdo_AddFrezer_Replacement_No.Checked = true;
                }

                string AdditionalFreezerDataBaseUsed = Convert.ToString(dt.Rows[0]["AdditionalFreezerDataBaseUsed"]);
                if (AdditionalFreezerDataBaseUsed == "Y")
                {
                    chk_AddFrezer_DatabseUsed.Checked = true;
                }

                txt_AddFrezer_ReplacementSize.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerReplacementSize"]);
                txt_AddFrezer_TemperatureFrezer.Text = Convert.ToString(dt.Rows[0]["AdditionalFreezerTemperatureinsidefreezer"]);
                string AdditionalFreezerDidNotTestBecause = Convert.ToString(dt.Rows[0]["AdditionalFreezerDidNotTestBecause"]);
                if (AdditionalFreezerDidNotTestBecause == "Y")
                {
                    chk_AddFrezer_NotTst.Checked = true;
                }
                string AdditionalFreezerCouldNotMove = Convert.ToString(dt.Rows[0]["AdditionalFreezerCouldNotMove"]);
                if (AdditionalFreezerCouldNotMove == "CM")
                {
                    rdo_AddFrezer_NotTst_NotMove.Checked = true;
                }
                else if (AdditionalFreezerCouldNotMove == "5Y")
                {
                    rdo_AddFrezer_NotTst_5Yr_Old.Checked = true;
                }
                else if (AdditionalFreezerCouldNotMove == "CR")
                {
                    rdo_AddFrezer_NotTst_CustomerRefuse.Checked = true;
                }


                string AdditionalUprightChest = Convert.ToString(dt.Rows[0]["AdditionalUprightChest"]);
                if (AdditionalUprightChest == "U")
                {
                    rdoAdditionalUpright.Checked = true;
                }
                else if (AdditionalUprightChest == "C")
                {
                    rdoAdditionalChest.Checked = true;
                }

                txt_Refrigerators_Freezers.Text = Convert.ToString(dt.Rows[0]["Page6Comments"]);
            }
        }
        catch
        {
        }
    }
    #endregion

    # region form7
    public void fill_form7()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_7(JobNum);
            DateTime dateRec = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]);
            DateTime dateComr = Convert.ToDateTime("1/12/2015");
            if (dateRec < dateComr)
            {
                tr_InstallCentralAC.Visible = true;
                tr_CentralWindowAC.Visible = true;
            }
            else
            {
                tr_InstallCentralAC.Visible = false;
                tr_CentralWindowAC.Visible = false;
            }
            if (dt.Rows.Count > 0)
            {
                txt_WasherLoadWeek.Text = Convert.ToString(dt.Rows[0]["NumberOfWasherLoadsPerWeek"]);

                ////////////////////////////////////////////////////////////////////////



                string FilterSlotCovered = Convert.ToString(dt.Rows[0]["FilterSlotCovered"]);
                if (FilterSlotCovered == "Y")
                {
                    rdo_slotCovered_yes.Checked = true;
                }
                else if (FilterSlotCovered == "N")
                {
                    rdo_slotCovered_no.Checked = true;
                }
                else if (FilterSlotCovered == "NA")
                {
                    rdo_slotCovered_na.Checked = true;
                }



                string WaterHeaterType = Convert.ToString(dt.Rows[0]["WaterHeaterType"]);
                if (WaterHeaterType == "E")
                {
                    rdo_WaterHeater_Electric.Checked = true;
                }
                else if (WaterHeaterType == "G")
                {
                    rdo_WaterHeater_Gas.Checked = true;
                }
                ////////////////////////////////////////////////////////////////////////


                string VentingDoneOrNot = Convert.ToString(dt.Rows[0]["VentingDoneOrNot"]);
                if (VentingDoneOrNot == "Y")
                {
                    rdo_VentinYes.Checked = true;
                }
                else if (VentingDoneOrNot == "N")
                {
                    rdo_VentinNo.Checked = true;
                }


                ////////////////////////////////////////////////////////////////////////

                string TemperatureCurrentlyUse = Convert.ToString(dt.Rows[0]["TemperatureCurrentlyUse"]);
                if (TemperatureCurrentlyUse == "HW")
                {
                    chk_HotWash.Checked = true;
                }
                else if (TemperatureCurrentlyUse == "WW")
                {
                    chk_WarmWash.Checked = true;
                }
                else if (TemperatureCurrentlyUse == "CW")
                {
                    chk_ColdWash.Checked = true;
                }
                else if (TemperatureCurrentlyUse == "O")
                {
                    chk_OtherWash.Checked = true;
                    txt_Temperature_Other.Text = Convert.ToString(dt.Rows[0]["TemperatureCurrentlyUseOther"]);
                }

                ////////////////////////////////////////////////////////////////////////

                txt_WasherComment.Text = Convert.ToString(dt.Rows[0]["WasherComments"]);
                txt_ElectricDrayerLoadWeek.Text = Convert.ToString(dt.Rows[0]["ElectricDryerLoadPerWeek"]);
                txt_DryALoad.Text = Convert.ToString(dt.Rows[0]["TakeToDryALoad"]);

                ////////////////////////////////////////////////////////////////////////

                string DryerType = Convert.ToString(dt.Rows[0]["DryerType"]);
                if (DryerType == "E")
                {
                    rdo_DryerType_Electic.Checked = true;
                }
                else if (DryerType == "G")
                {
                    rdo_DryerType_Gas.Checked = true;
                }


                ////////////////////////////////////////////////////////////////////////

                string IsDryerVentedProperly = Convert.ToString(dt.Rows[0]["IsDryerVentedProperly"]);
                if (IsDryerVentedProperly == "Y")
                {
                    rdo_DryerVented_Yes.Checked = true;
                }
                else if (IsDryerVentedProperly == "N")
                {
                    rdo_DryerVented_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////

                txt_DryerVenting_Location.Text = Convert.ToString(dt.Rows[0]["VentingLocation"]);

                //////////////////////////////////////////////////////////////////////// 

                string MakeANewHole = Convert.ToString(dt.Rows[0]["MakeANewHole"]);
                if (MakeANewHole == "MNH")
                {
                    rdo_MakeNewHole.Checked = true;
                }
                else if (MakeANewHole == "V")
                {
                    rdo_DryerUseExistingHole.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////

                txt_ExistingHole_Feet.Text = Convert.ToString(dt.Rows[0]["ApproxNumberOfFeet"]);
                txt_ExistingHole_Elbows.Text = Convert.ToString(dt.Rows[0]["NumberOfElbows"]);

                ////////////////////////////////////////////////////////////////////////

                string AddNewVentCapHood = Convert.ToString(dt.Rows[0]["AddNewVentCapHood"]);
                if (AddNewVentCapHood == "Y")
                {
                    chk_NewVentCap.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////

                txt_AluminumFlexUsed.Text = Convert.ToString(dt.Rows[0]["AluminumFlexUsed"]);

                ////////////////////////////////////////////////////////////////////////
                string WouldAClothesLineBeEffective = Convert.ToString(dt.Rows[0]["WouldAClothesLineBeEffective"]);
                if (WouldAClothesLineBeEffective == "Y")
                {
                    rdo_ClothesCostEffect_Yes.Checked = true;
                }
                else if (WouldAClothesLineBeEffective == "N")
                {
                    rdo_ClothesCostEffect_No.Checked = true;
                }
                string IsOneBeingInstalled = Convert.ToString(dt.Rows[0]["IsOneBeingInstalled"]);
                if (IsOneBeingInstalled == "Y")
                {
                    rdo_BeingInstall_Yes.Checked = true;
                }
                else if (IsOneBeingInstalled == "N")
                {
                    rdo_BeingInstall_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////


                txt_OtherDryIssue.Text = Convert.ToString(dt.Rows[0]["OtherDryingIssuesComments"]);
                ///////////////////////////////////////////////////////////////////////////////

                string HeatingSystemLine1 = Convert.ToString(dt.Rows[0]["HeatingSystemLine1"]);
                if (HeatingSystemLine1 == "Y")
                {
                    rdo_NewFilterInstal1_Yes.Checked = true;
                }
                else if (HeatingSystemLine1 == "N")
                {
                    rdo_NewFilterInstal1_No.Checked = true;
                }
                /////////////////////////////////////////////////////////////////////////

                txt_NumberNewFilterInstal1.Text = Convert.ToString(dt.Rows[0]["NumberInstalledLine1"]);
                txt_FilterDimensions1.Text = Convert.ToString(dt.Rows[0]["FilterDimensionsLine1"]);

                ////////////////////////////////////////////////////////////////////////////


                string HeatingSystemLine2 = Convert.ToString(dt.Rows[0]["HeatingSystemLine2"]);
                if (HeatingSystemLine2 == "Y")
                {
                    rdo_NewFilterInstal2_Yes.Checked = true;
                }
                else if (HeatingSystemLine2 == "N")
                {
                    rdo_NewFilterInstal2_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////

                txt_NumberNewFilterInstal2.Text = Convert.ToString(dt.Rows[0]["NumberInstalledLine2"]);

                ////////////////////////////////////////////////////////////////////////////

                string WindowACLine3 = Convert.ToString(dt.Rows[0]["WindowACLine3"]);
                if (WindowACLine3 == "Y")
                {
                    rdo_NewFilterACInstal_Yes.Checked = true;
                }
                else if (WindowACLine3 == "N")
                {
                    rdo_NewFilterACInstal_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////


                txt_NumberNewFilterACInstal.Text = Convert.ToString(dt.Rows[0]["WindowACNumberInstalledLine3"]);
                txt_FilterDimensions2.Text = Convert.ToString(dt.Rows[0]["FilterDimensionsLine3"]);

                ////////////////////////////////////////////////////////////////////////////////

                string HeatingSystemLine4 = Convert.ToString(dt.Rows[0]["HeatingSystemLine4"]);
                if (HeatingSystemLine4 == "Y")
                {
                    rdo_NewFilterInstal3_Yes.Checked = true;
                }
                else if (HeatingSystemLine4 == "N")
                {
                    rdo_NewFilterInstal3_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////

                txt_NumberNewFilterInstal3.Text = Convert.ToString(dt.Rows[0]["NumberInstalledLine4"]);

                //////////////////////////////////////////////////////////////////////////////

                string WellPumpUsed = Convert.ToString(dt.Rows[0]["WellPumpUsed"]);
                if (WellPumpUsed == "Y")
                {
                    rdo_WellPumpUsed_Yes.Checked = true;
                }
                else if (WellPumpUsed == "N")
                {
                    rdo_WellPumpUsed_No.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////

                string WaterLeaks = Convert.ToString(dt.Rows[0]["WaterLeaks"]);
                if (WaterLeaks == "Y")
                {
                    rdo_WaterLeaks_Yes.Checked = true;
                }
                else if (WaterLeaks == "N")
                {
                    rdo_WaterLeaks_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////

                string DehumidifierUsed = Convert.ToString(dt.Rows[0]["DehumidifierUsed"]);
                if (DehumidifierUsed == "Y")
                {
                    rdo_DehumidifierUsed_Yes.Checked = true;
                }
                else if (DehumidifierUsed == "N")
                {
                    rdo_DehumidifierUsed_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////

                string PoolPumpUsed = Convert.ToString(dt.Rows[0]["PoolPumpUsed"]);
                if (PoolPumpUsed == "Y")
                {
                    rdo_PoolPumpUsed_Yes.Checked = true;
                }
                else if (PoolPumpUsed == "N")
                {
                    rdo_PoolPumpUsed_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////

                string SepticSystemGrinders = Convert.ToString(dt.Rows[0]["SepticSystemGrinders"]);
                if (SepticSystemGrinders == "Y")
                {
                    rdo_SepticSystemGrinders_Yes.Checked = true;
                }
                else if (SepticSystemGrinders == "N")
                {
                    rdo_SepticSystemGrinders_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////

                string WillingToRreplaceWaterbed = Convert.ToString(dt.Rows[0]["WillingToRreplaceWaterbed"]);
                if (WillingToRreplaceWaterbed == "Y")
                {
                    rdo_ReplaceWaterbed_Yes.Checked = true;
                }
                else if (WillingToRreplaceWaterbed == "N")
                {
                    rdo_ReplaceWaterbed_No.Checked = true;
                }
                else if (WillingToRreplaceWaterbed == "NA")
                {
                    rdo_ReplaceWaterbed_NA.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////


                string ReplacementSize = Convert.ToString(dt.Rows[0]["ReplacementSize"]);
                if (ReplacementSize == "SS")
                {
                    rdo_Replacement_SuperSingle.Checked = true;
                }
                else if (ReplacementSize == "Q")
                {
                    rdo_Replacement_Queen.Checked = true;
                }
                else if (ReplacementSize == "K")
                {
                    rdo_Replacement_King.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////

                txt_MoistureVentilationElectricComment.Text = Convert.ToString(dt.Rows[0]["CommentSuchASMoistureVentilation"]);
                txt_Comment.Text = Convert.ToString(dt.Rows[0]["CommentPage7"]);
            }
        }
        catch
        {
        }
    }
    #endregion

    # region form8
    public void fill_form8()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_8(JobNum);
            if (dt.Rows.Count > 0)
            {

                ///////////////////////////////////////////////////////////////////////////////////////////

                string WaterHeaterFuelType = Convert.ToString(dt.Rows[0]["WaterHeaterFuelType"]);
                if (WaterHeaterFuelType == "E")
                {
                    rdo_WaterHeaterFuel_Electric.Checked = true;
                }
                else if (WaterHeaterFuelType == "F")
                {
                    rdo_WaterHeaterFuel_FuelOil.Checked = true;
                }
                else if (WaterHeaterFuelType == "U")
                {
                    rdo_WaterHeaterFuel_UtilityGas.Checked = true;
                }
                else if (WaterHeaterFuelType == "B")
                {
                    rdo_WaterHeaterFuel_BottledGas.Checked = true;
                }
                else if (WaterHeaterFuelType == "O")
                {
                    rdo_WaterHeaterFuel_Other.Checked = true;
                    txt_WaterHeaterFuel_Other.Text = Convert.ToString(dt.Rows[0]["WaterHeaterFuelTypeOther"]);
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////

                txt_WaterHeatingIssues_Comment.Text = Convert.ToString(dt.Rows[0]["WaterHeatingIssuesComments"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////

                string IsWaterHeaterLeaking = Convert.ToString(dt.Rows[0]["IsWaterHeaterLeaking"]);
                if (IsWaterHeaterLeaking == "Y")
                {
                    rdo_WaterHeaterLeak_Yes.Checked = true;
                }
                else if (IsWaterHeaterLeaking == "N")
                {
                    rdo_WaterHeaterLeak_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string IsWaterHeaterRusted = Convert.ToString(dt.Rows[0]["IsWaterHeaterRusted"]);
                if (IsWaterHeaterRusted == "Y")
                {
                    rdo_WaterHeaterRusted_Yes.Checked = true;
                }
                else if (IsWaterHeaterRusted == "N")
                {
                    rdo_WaterHeaterRusted_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////



                string AreTheElementsBad = Convert.ToString(dt.Rows[0]["AreTheElementsBad"]);
                if (AreTheElementsBad == "Y")
                {
                    rdo_ElementBad_Yes.Checked = true;
                }
                else if (AreTheElementsBad == "N")
                {
                    rdo_ElementBad_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string IsUnitRatedR8OrLess = Convert.ToString(dt.Rows[0]["IsUnitRatedR8OrLess"]);
                if (IsUnitRatedR8OrLess == "Y")
                {
                    rdo_UnitRated_Yes.Checked = true;
                }
                else if (IsUnitRatedR8OrLess == "N")
                {
                    rdo_UnitRated_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string WillWaterHeaterBeReplaced = Convert.ToString(dt.Rows[0]["WillWaterHeaterBeReplaced"]);
                if (WillWaterHeaterBeReplaced == "Y")
                {
                    rdo_WaterHeaterReplace_Yes.Checked = true;
                }
                else if (WillWaterHeaterBeReplaced == "N")
                {
                    rdo_WaterHeaterReplace_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txtEnergyFctr.Text = Convert.ToString(dt.Rows[0]["EnergyFactor"]);
                txt_ExistingWaterHeaterSize.Text = Convert.ToString(dt.Rows[0]["ExistingWaterHeaterSize"]);
                txt_WaterHeaterReplaceSize.Text = Convert.ToString(dt.Rows[0]["ReplacementWaterHeaterSize"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ReplaceOrAddExpansionTank = Convert.ToString(dt.Rows[0]["ReplaceOrAddExpansionTank"]);
                if (ReplaceOrAddExpansionTank == "Y")
                {
                    chk_AddExpansionTank_Yes.Checked = true;
                }
                else if (ReplaceOrAddExpansionTank == "N")
                {
                    chk_AddExpansionTank_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string AreYouGoingToReplaceElements = Convert.ToString(dt.Rows[0]["AreYouGoingToReplaceElements"]);
                if (AreYouGoingToReplaceElements == "Y")
                {
                    chk_ReplaceElemnt_Yes.Checked = true;
                }
                else if (AreYouGoingToReplaceElements == "N")
                {
                    chk_ReplaceElemnt_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string AreYouGoingToReplaceThermostats = Convert.ToString(dt.Rows[0]["AreYouGoingToReplaceThermostats"]);
                if (AreYouGoingToReplaceThermostats == "Y")
                {
                    chk_ReplaceThermostats_Yes.Checked = true;
                }
                else if (AreYouGoingToReplaceThermostats == "N")
                {
                    chk_ReplaceThermostats_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////



                string AreYouGoingToFlushTank = Convert.ToString(dt.Rows[0]["AreYouGoingToFlushTank"]);
                if (AreYouGoingToFlushTank == "Y")
                {
                    chk_FlushTank_Yes.Checked = true;
                }
                else if (AreYouGoingToFlushTank == "N")
                {
                    chk_FlushTank_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string AreYouGoingToAddPressureReliefValve = Convert.ToString(dt.Rows[0]["AreYouGoingToAddPressureReliefValve"]);
                if (AreYouGoingToAddPressureReliefValve == "Y")
                {
                    chk_PressureReliefValve_Yes.Checked = true;
                }
                else if (AreYouGoingToAddPressureReliefValve == "N")
                {
                    chk_PressureReliefValve_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string AreYouGoingToAddPressureReliefPipe = Convert.ToString(dt.Rows[0]["AreYouGoingToAddPressureReliefPipe"]);
                if (AreYouGoingToAddPressureReliefPipe == "Y")
                {
                    chk_PressureReliefPipe_Yes.Checked = true;
                }
                else if (AreYouGoingToAddPressureReliefPipe == "N")
                {
                    chk_PressureReliefPipe_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string DidYouChangeTemperature = Convert.ToString(dt.Rows[0]["DidYouChangeTemperature"]);
                if (DidYouChangeTemperature == "Y")
                {
                    rdo_ChangeTemperature_Yes.Checked = true;
                }
                else if (DidYouChangeTemperature == "N")
                {
                    rdo_ChangeTemperature_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                txt_ExistingTemp.Text = Convert.ToString(dt.Rows[0]["ExistingTemp"]);
                txt_TstLocation.Text = Convert.ToString(dt.Rows[0]["TestLocation"]);
                txt_AdjustTemp.Text = Convert.ToString(dt.Rows[0]["AdjustedTemp"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////



                string AreYouWrappingWaterPipes = Convert.ToString(dt.Rows[0]["AreYouWrappingWaterPipes"]);
                if (AreYouWrappingWaterPipes == "Y")
                {
                    rdo_WrappingWaterPipe_Yes.Checked = true;
                }
                else if (AreYouWrappingWaterPipes == "N")
                {
                    rdo_WrappingWaterPipe_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Linear_FT.Text = Convert.ToString(dt.Rows[0]["LinearFeetHOtWater"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string LinearFeetHOtWater12_34 = Convert.ToString(dt.Rows[0]["LinearFeetHOtWater12_34"]);
                if (LinearFeetHOtWater12_34 == "12")
                {
                    rdoHot1_2.Checked = true;
                }
                else if (LinearFeetHOtWater12_34 == "34")
                {
                    rdoHot3_4.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                page8_txt_Location.Text = Convert.ToString(dt.Rows[0]["LinearFeetHOtWaterLocation"]);
                txt_Linear_ColdFt.Text = Convert.ToString(dt.Rows[0]["LinearFeetColdWater"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string LinearFeetColdWater12_34 = Convert.ToString(dt.Rows[0]["LinearFeetColdWater12_34"]);
                if (LinearFeetColdWater12_34 == "12")
                {
                    rdoCold1_2.Checked = true;
                }
                else if (LinearFeetColdWater12_34 == "34")
                {
                    rdoCold3_4.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txtLocationColdFT.Text = Convert.ToString(dt.Rows[0]["LinearFeetColdWaterLocation"]);
                page8_txt_Comments.Text = Convert.ToString(dt.Rows[0]["LinearFeetComments"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                string AreThereAnyOtherLeaks = Convert.ToString(dt.Rows[0]["AreThereAnyOtherLeaks"]);
                if (AreThereAnyOtherLeaks == "Y")
                {
                    rdo_HotWaterLeaks_Yes.Checked = true;
                }
                else if (AreThereAnyOtherLeaks == "N")
                {
                    rdo_HotWaterLeaks_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txt_HotWaterLeaksYes_Comment.Text = Convert.ToString(dt.Rows[0]["AreThereAnyOtherLeaksComments"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string AreYouGoingToRepairLeaks = Convert.ToString(dt.Rows[0]["AreYouGoingToRepairLeaks"]);
                if (AreYouGoingToRepairLeaks == "Y")
                {
                    rdo_RepairLeaks_Yes.Checked = true;
                }
                else if (AreYouGoingToRepairLeaks == "N")
                {
                    rdo_RepairLeaks_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txt_RepairLeaks_Yes_Comment.Text = Convert.ToString(dt.Rows[0]["AreYouGoingToRepairLeaksComments"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string FaucetAerators = Convert.ToString(dt.Rows[0]["FaucetAerators"]);
                if (FaucetAerators == "Y")
                {
                    rdoInstalFaucetYes.Checked = true;
                }
                else if (FaucetAerators == "N")
                {
                    rdoInstalFaucetNo.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txtBathAerator.Text = Convert.ToString(dt.Rows[0]["BathAeratorInstall"]);
                txtBathLocation.Text = Convert.ToString(dt.Rows[0]["BathAeratorLocation"]);
                txtKitchenAerator.Text = Convert.ToString(dt.Rows[0]["KitchenAeratorInstall"]);
                txtKitchenLocation.Text = Convert.ToString(dt.Rows[0]["KitchenAeratorLocation"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string showerHead = Convert.ToString(dt.Rows[0]["showerHead"]);
                if (showerHead == "Y")
                {
                    rdoInstalShowerYes.Checked = true;
                }
                else if (showerHead == "N")
                {
                    rdoInstalShowerNo.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txtSwivel.Text = Convert.ToString(dt.Rows[0]["swivelHeadInstall"]);
                txtSwivelLocation.Text = Convert.ToString(dt.Rows[0]["swivelHeadLocation"]);
                txtShutoff.Text = Convert.ToString(dt.Rows[0]["shutoffInstall"]);
                txtShutoffLocation.Text = Convert.ToString(dt.Rows[0]["shutoffLocation"]);
                txtWOshutoff.Text = Convert.ToString(dt.Rows[0]["WithOutShutoffInstall"]);
                txtWOshutoffLocation.Text = Convert.ToString(dt.Rows[0]["WithOutShutoffLocation"]);
                txtHandheld.Text = Convert.ToString(dt.Rows[0]["handheldInstall"]);
                txtHandheldLocation.Text = Convert.ToString(dt.Rows[0]["handheldLocation"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////

                string DrainPipeDiameter = Convert.ToString(dt.Rows[0]["DrainPipeDiameter"]);
                if (DrainPipeDiameter == "Y")
                {
                    rdoGFXsystemYes.Checked = true;
                }
                else if (DrainPipeDiameter == "N")
                {
                    rdoGFXsystemNo.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                txtColdWatrSupply.Text = Convert.ToString(dt.Rows[0]["ColdWaterSupply"]);
                txtWaterHeater.Text = Convert.ToString(dt.Rows[0]["DrainPipeWaterHeater"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string InstallingGFX = Convert.ToString(dt.Rows[0]["InstallingGFX"]);
                if (InstallingGFX == "Y")
                {
                    rdoInstallGFXyes.Checked = true;
                }
                else if (InstallingGFX == "N")
                {
                    rdoInstallGFXno.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string IsCustomerTODRate = Convert.ToString(dt.Rows[0]["IsCustomerTODRate"]);
                if (IsCustomerTODRate == "Y")
                {
                    rdo_Customer_TOD_Yes.Checked = true;
                }
                else if (IsCustomerTODRate == "N")
                {
                    rdo_Customer_TOD_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string IsCustomerSavingOnRate = Convert.ToString(dt.Rows[0]["IsCustomerSavingOnRate"]);
                if (IsCustomerSavingOnRate == "Y")
                {
                    rdo_CustomerSavingRate_Yes.Checked = true;
                }
                else if (IsCustomerSavingOnRate == "N")
                {
                    rdo_CustomerSavingRate_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CustomerLifeStyle = Convert.ToString(dt.Rows[0]["CustomerLifeStyle"]);
                if (CustomerLifeStyle == "Y")
                {
                    rdo_CustomerSuitRateChange_Yes.Checked = true;
                }
                else if (CustomerLifeStyle == "N")
                {
                    rdo_CustomerSuitRateChange_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string IsCustomerSwitchToTODRate = Convert.ToString(dt.Rows[0]["IsCustomerSwitchToTODRate"]);
                if (IsCustomerSwitchToTODRate == "Y")
                {
                    rdo_CustomerSwitchTOD_Yes.Checked = true;
                }
                else if (IsCustomerSwitchToTODRate == "N")
                {
                    rdo_CustomerSwitchTOD_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string DoesCustomerHaveWaterHeaterTimer = Convert.ToString(dt.Rows[0]["DoesCustomerHaveWaterHeaterTimer"]);
                if (DoesCustomerHaveWaterHeaterTimer == "Y")
                {
                    rdo_Customer_WaterHeaterTimer_Yes.Checked = true;
                }
                else if (DoesCustomerHaveWaterHeaterTimer == "N")
                {
                    rdo_Customer_WaterHeaterTimer_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string TimerInstalled = Convert.ToString(dt.Rows[0]["TimerInstalled"]);
                if (TimerInstalled == "Y")
                {
                    rdo_TimerInstalled_Yes.Checked = true;
                }
                else if (TimerInstalled == "N")
                {
                    rdo_TimerInstalled_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////
                txt_comment1.Text = Convert.ToString(dt.Rows[0]["Page8Comments"]);
            }
        }
        catch
        {
        }
    }
    #endregion

    # region form9
    public void fill_form9()
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
                page9_txt_Comment.Text = Convert.ToString(dt.Rows[0]["Comment"]);
                txt_Signature.Text = Convert.ToString(dt.Rows[0]["Signature"]);
                txt_Date.Text = Convert.ToString(dt.Rows[0]["Date"]);
            }
        }
        catch
        {
        }
    }
    #endregion


    # region form10
    public void fill_form10()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_10(JobNum);
            DateTime dateRec = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]);
            DateTime dateComr = Convert.ToDateTime("1/12/2015");
            if (dateRec < dateComr)
            {
                tr_NewestACUnit.Visible = false;
                td_CentralACUnit.Visible = false;
            }
            else
            {
                tr_NewestACUnit.Visible = true;
                td_CentralACUnit.Visible = true;
            }
            if (dt.Rows.Count > 0)
            {

                txt_SummerSeasonalUse.Text = Convert.ToString(dt.Rows[0]["SummerSeasonalUse"]);


                txt_CentralACUnit.Text = Convert.ToString(dt.Rows[0]["CentralACUnit"]);
                txt_NewestACUnit.Text = Convert.ToString(dt.Rows[0]["NewestACUnit"]);
                //////////////////////////////////////////////////////////////////////////////////////////

                string WindowsNotShaded = Convert.ToString(dt.Rows[0]["WindowsNotShaded"]);
                if (WindowsNotShaded == "Y")
                {
                    rdo_WindowFilm_Yes.Checked = true;
                }
                else if (WindowsNotShaded == "N")
                {
                    rdo_WindowFilm_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////

                txt_WindowFilmNeeded.Text = Convert.ToString(dt.Rows[0]["ApproxSquareFootage"]);
                txt_West_ReceiveFilm.Text = Convert.ToString(dt.Rows[0]["NumberWestFacingWindows"]);
                txt_South_ReceiveFilm.Text = Convert.ToString(dt.Rows[0]["NumberSouthFacingWindows"]);
                txt_East_ReceiveFilm.Text = Convert.ToString(dt.Rows[0]["NumberEastFacingWindows"]);

                /////////////////////////////////////////////////////////////////////////////////////////

                string RollRoofMaterial = Convert.ToString(dt.Rows[0]["RollRoofMaterial"]);
                if (RollRoofMaterial == "Y")
                {
                    rdo_RoofCoating_Roofmaterial_Yes.Checked = true;
                }
                else if (RollRoofMaterial == "N")
                {
                    rdo_RoofCoating_Roofmaterial_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////


                string InstallRoofCoat = Convert.ToString(dt.Rows[0]["InstallRoofCoat"]);
                if (InstallRoofCoat == "Y")
                {
                    rdo_InstallRoofCoat_Yes.Checked = true;
                }
                else if (InstallRoofCoat == "N")
                {
                    rdo_InstallRoofCoat_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////

                txt_FootageOfRoof.Text = Convert.ToString(dt.Rows[0]["ApproxSquareFootageOfRoofTimes2"]);

                /////////////////////////////////////////////////////////////////////////////////////////

                string ReduceAirConditioning = Convert.ToString(dt.Rows[0]["ReduceAirConditioning"]);
                if (ReduceAirConditioning == "Y")
                {
                    rdo_ReduceACUse_Yes.Checked = true;
                }
                else if (ReduceAirConditioning == "N")
                {
                    rdo_ReduceACUse_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////

                txt_Will_Install.Text = Convert.ToString(dt.Rows[0]["WillInstall"]);
                page10_txt_comment.Text = Convert.ToString(dt.Rows[0]["Comment"]);

                /////////////////////////////////////////////////////////////////////////////////////////

                txt_Line1_UnitWatts.Text = Convert.ToString(dt.Rows[0]["UnitWatts1"]);
                txt_Line1_EER.Text = Convert.ToString(dt.Rows[0]["EER1"]);

                string ReplaceAC1 = Convert.ToString(dt.Rows[0]["ReplaceAC1"]);
                if (ReplaceAC1 == "Y")
                {
                    chk_Line1_ReplaceAC.Checked = true;
                }
                txt_Line1_CurrentSize_BTU.Text = Convert.ToString(dt.Rows[0]["CurrentSize1"]);
                txt_Line1_CurrentLocation.Text = Convert.ToString(dt.Rows[0]["CurrentLocation1"]);
                txt_Line1_NewSize_BTU.Text = Convert.ToString(dt.Rows[0]["NewSize1"]);
                txt_Line1_Install_Location.Text = Convert.ToString(dt.Rows[0]["InstalledLocation1"]);

                string ReplaceFilter1 = Convert.ToString(dt.Rows[0]["ReplaceFilter1"]);
                if (ReplaceFilter1 == "Y")
                {
                    chk_Line1_ReplaceFilter.Checked = true;
                }
                string CleanFilter1 = Convert.ToString(dt.Rows[0]["CleanFilter1"]);
                if (CleanFilter1 == "Y")
                {
                    chk_Line1_CleanFilter.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////

                txt_Line2_UnitWatts.Text = Convert.ToString(dt.Rows[0]["UnitWatts2"]);
                txt_Line2_EER.Text = Convert.ToString(dt.Rows[0]["EER2"]);

                string ReplaceAC2 = Convert.ToString(dt.Rows[0]["ReplaceAC2"]);
                if (ReplaceAC2 == "Y")
                {
                    chk_Line2_ReplaceAC.Checked = true;
                }
                txt_Line2_CurrentSize_BTU.Text = Convert.ToString(dt.Rows[0]["CurrentSize2"]);
                txt_Line2_CurrentLocation.Text = Convert.ToString(dt.Rows[0]["CurrentLocation2"]);
                txt_Line2_NewSize_BTU.Text = Convert.ToString(dt.Rows[0]["NewSize2"]);
                txt_Line2_Install_Location.Text = Convert.ToString(dt.Rows[0]["InstalledLocation2"]);

                string ReplaceFilter2 = Convert.ToString(dt.Rows[0]["ReplaceFilter2"]);
                if (ReplaceFilter2 == "Y")
                {
                    chk_Line2_ReplaceFilter.Checked = true;
                }
                string CleanFilter2 = Convert.ToString(dt.Rows[0]["CleanFilter2"]);
                if (CleanFilter2 == "Y")
                {
                    chk_Line2_CleanFilter.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////

                txt_Line3_UnitWatts.Text = Convert.ToString(dt.Rows[0]["UnitWatts3"]);
                txt_Line3_EER.Text = Convert.ToString(dt.Rows[0]["EER3"]);

                string ReplaceAC3 = Convert.ToString(dt.Rows[0]["ReplaceAC3"]);
                if (ReplaceAC3 == "Y")
                {
                    chk_Line3_ReplaceAC.Checked = true;
                }
                txt_Line3_CurrentSize_BTU.Text = Convert.ToString(dt.Rows[0]["CurrentSize3"]);
                txt_Line3_CurrentLocation.Text = Convert.ToString(dt.Rows[0]["CurrentLocation3"]);
                txt_Line3_NewSize_BTU.Text = Convert.ToString(dt.Rows[0]["NewSize3"]);
                txt_Line3_Install_Location.Text = Convert.ToString(dt.Rows[0]["InstalledLocation3"]);

                string ReplaceFilter3 = Convert.ToString(dt.Rows[0]["ReplaceFilter3"]);
                if (ReplaceFilter3 == "Y")
                {
                    chk_Line3_ReplaceFilter.Checked = true;
                }
                string CleanFilter3 = Convert.ToString(dt.Rows[0]["CleanFilter3"]);
                if (CleanFilter3 == "Y")
                {
                    chk_Line3_CleanFilter.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////

                txt_Line4_UnitWatts.Text = Convert.ToString(dt.Rows[0]["UnitWatts4"]);
                txt_Line4_EER.Text = Convert.ToString(dt.Rows[0]["EER4"]);

                string ReplaceAC4 = Convert.ToString(dt.Rows[0]["ReplaceAC4"]);
                if (ReplaceAC4 == "Y")
                {
                    chk_Line4_ReplaceAC.Checked = true;
                }
                txt_Line4_CurrentSize_BTU.Text = Convert.ToString(dt.Rows[0]["CurrentSize4"]);
                txt_Line4_CurrentLocation.Text = Convert.ToString(dt.Rows[0]["CurrentLocation4"]);
                txt_Line4_NewSize_BTU.Text = Convert.ToString(dt.Rows[0]["NewSize4"]);
                txt_Line4_Install_Location.Text = Convert.ToString(dt.Rows[0]["InstalledLocation4"]);

                string ReplaceFilter4 = Convert.ToString(dt.Rows[0]["ReplaceFilter4"]);
                if (ReplaceFilter4 == "Y")
                {
                    chk_Line4_ReplaceFilter.Checked = true;
                }
                string CleanFilter4 = Convert.ToString(dt.Rows[0]["CleanFilter4"]);
                if (CleanFilter4 == "Y")
                {
                    chk_Line4_CleanFilter.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////

                txt_Line5_UnitWatts.Text = Convert.ToString(dt.Rows[0]["UnitWatts5"]);
                txt_Line5_EER.Text = Convert.ToString(dt.Rows[0]["EER5"]);

                string ReplaceAC5 = Convert.ToString(dt.Rows[0]["ReplaceAC5"]);
                if (ReplaceAC5 == "Y")
                {
                    chk_Line5_ReplaceAC.Checked = true;
                }
                txt_Line5_CurrentSize_BTU.Text = Convert.ToString(dt.Rows[0]["CurrentSize5"]);
                txt_Line5_CurrentLocation.Text = Convert.ToString(dt.Rows[0]["CurrentLocation5"]);
                txt_Line5_NewSize_BTU.Text = Convert.ToString(dt.Rows[0]["NewSize5"]);
                txt_Line5_Install_Location.Text = Convert.ToString(dt.Rows[0]["InstalledLocation5"]);

                string ReplaceFilter5 = Convert.ToString(dt.Rows[0]["ReplaceFilter5"]);
                if (ReplaceFilter5 == "Y")
                {
                    chk_Line5_ReplaceFilter.Checked = true;
                }
                string CleanFilter5 = Convert.ToString(dt.Rows[0]["CleanFilter5"]);
                if (CleanFilter5 == "Y")
                {
                    chk_Line5_CleanFilter.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////

                txt_CustomerWindowACThermostat_Comment.Text = Convert.ToString(dt.Rows[0]["ThermostatUseHabitsComment"]);
                txt_AC_ReplaceUnit.Text = Convert.ToString(dt.Rows[0]["TotalNumberUnitsReplace"]);
                txt_CustomerACThermostatUse.Text = Convert.ToString(dt.Rows[0]["CentralACThermostatUseHabits"]);

                ////////////////////////////////////////////////////////////////////////////////////

                string CentralACThermostatAccurate = Convert.ToString(dt.Rows[0]["CentralACThermostatAccurate"]);
                if (CentralACThermostatAccurate == "Y")
                {
                    rdo_ThermostatAccurate_Yes.Checked = true;
                }
                else if (CentralACThermostatAccurate == "N")
                {
                    rdo_ThermostatAccurate_No.Checked = true;
                }
                else if (CentralACThermostatAccurate == "Not")
                {
                    rdo_ThermostatAccurate_IfNot.Checked = true;
                }

                txt_ThermostatAccurate_IfNot.Text = Convert.ToString(dt.Rows[0]["CentralACThermostatAccurateNotComment"]);
                string ReplacementOfThermostat = Convert.ToString(dt.Rows[0]["ReplacementOfThermostat"]);
                if (ReplacementOfThermostat == "Y")
                {
                    rdo_ReplacementThermostat_Yes.Checked = true;
                }
                else if (ReplacementOfThermostat == "N")
                {
                    rdo_ReplacementThermostat_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////

                string FilterSlotCovered = Convert.ToString(dt.Rows[0]["FilterSlotCovered"]);
                if (FilterSlotCovered == "Y")
                {
                    rdo_filterSlotCovered_Yes.Checked = true;
                }
                else if (FilterSlotCovered == "N")
                {
                    rdo_filterSlotCovered_No.Checked = true;
                }
                else if (FilterSlotCovered == "NA")
                {
                    rdo_filterSlotCovered_NA.Checked = true;
                }
                //////////////////////////////////////////////////////////////////////////////////////////

                string LocationOfA_Coil = Convert.ToString(dt.Rows[0]["LocationOfA_Coil"]);
                if (LocationOfA_Coil == "I")
                {
                    rdo_LocationAcoil_Inside.Checked = true;
                }
                else if (LocationOfA_Coil == "O")
                {
                    rdo_LocationAcoil_Outside.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string InspectTheA_Coil = Convert.ToString(dt.Rows[0]["InspectTheA_Coil"]);
                if (InspectTheA_Coil == "Y")
                {
                    rdo_InspectAcoil_Yes.Checked = true;
                }
                else if (InspectTheA_Coil == "N")
                {
                    rdo_InspectAcoil_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string CleaningRecommended = Convert.ToString(dt.Rows[0]["CleaningRecommended"]);
                if (CleaningRecommended == "Y")
                {
                    rdo_CleaningRecommended_Yes.Checked = true;
                }
                else if (CleaningRecommended == "N")
                {
                    rdo_CleaningRecommended_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string CleaningPerformedBy = Convert.ToString(dt.Rows[0]["CleaningPerformedBy"]);
                if (CleaningPerformedBy == "A")
                {
                    rdo_CleaningPerformedBy_Auditor.Checked = true;
                }
                else if (CleaningPerformedBy == "3P")
                {
                    rdo_CleaningPerformedBy_3rd_Party.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string WarrantPartyCleanAndTune = Convert.ToString(dt.Rows[0]["WarrantPartyCleanAndTune"]);
                if (WarrantPartyCleanAndTune == "Y")
                {
                    rdo_Acoil_3rd_PartyClean_Yes.Checked = true;
                }
                else if (WarrantPartyCleanAndTune == "N")
                {
                    rdo_Acoil_3rd_PartyClean_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string PartyContractorContacted = Convert.ToString(dt.Rows[0]["PartyContractorContacted"]);
                if (PartyContractorContacted == "Y")
                {
                    rdo_3rd_PartyContractor_Yes.Checked = true;
                }
                else if (PartyContractorContacted == "N")
                {
                    rdo_3rd_PartyContractor_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string CleanORTune = Convert.ToString(dt.Rows[0]["CleanORTune"]);
                if (CleanORTune == "Y")
                {
                    rdo_CleanTune_Yes.Checked = true;
                }
                else if (CleanORTune == "N")
                {
                    rdo_CleanTune_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                txt_CleanTuneRecommended.Text = Convert.ToString(dt.Rows[0]["TuneRecommendedComment"]);

                ////////////////////////////////////////////////////////////////////////////////////////////

                string InstalledTheSystem = Convert.ToString(dt.Rows[0]["InstalledTheSystem"]);
                if (InstalledTheSystem == "Y")
                {
                    rdo_NewFilterInstall_Yes.Checked = true;
                }
                else if (InstalledTheSystem == "N")
                {
                    rdo_NewFilterInstall_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////
                txt_NumberInstall.Text = Convert.ToString(dt.Rows[0]["NumberInstalled"]);
                /////////////////////////////////////////////////////////////////////////////////////////

                string CleanTheSystem = Convert.ToString(dt.Rows[0]["CleanTheSystem"]);
                if (CleanTheSystem == "Y")
                {
                    rdo_FilterClean_Yes.Checked = true;
                }
                else if (CleanTheSystem == "N")
                {
                    rdo_FilterClean_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////
                txt_NumberClean.Text = Convert.ToString(dt.Rows[0]["NumberClean"]);
                ////////////////////////////////////////////////////////////////////////////////////////////

                string CoiltobeClean = Convert.ToString(dt.Rows[0]["CoiltobeClean"]);
                if (CoiltobeClean == "Y")
                {
                    rdo_CoilClean_Yes.Checked = true;
                }
                else if (CoiltobeClean == "N")
                {
                    rdo_CoilClean_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////
                string UnittobeReplaced = Convert.ToString(dt.Rows[0]["UnittobeReplaced"]);
                if (UnittobeReplaced == "Y")
                {
                    rdo_CA_UnitReplace_Yes.Checked = true;
                }
                else if (UnittobeReplaced == "N")
                {
                    rdo_CA_UnitReplace_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                txt_SizeUnit.Text = Convert.ToString(dt.Rows[0]["SizeOfUnit"]);
                txt_FilterDimension.Text = Convert.ToString(dt.Rows[0]["FilterDimension"]);

                //////////////////////////////////////////////////////////////////////////////////////////

                string DuctWorkThermalBoundary = Convert.ToString(dt.Rows[0]["DuctWorkThermalBoundary"]);
                if (DuctWorkThermalBoundary == "Y")
                {
                    rdo_DuctWork_Yes.Checked = true;
                }
                else if (DuctWorkThermalBoundary == "N")
                {
                    rdo_DuctWork_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                txt_DuctWork_Location.Text = Convert.ToString(dt.Rows[0]["DuctWorkThermalBoundaryLocation"]);

                //////////////////////////////////////////////////////////////////////////////////////////

                string InsulationtobeInstalled = Convert.ToString(dt.Rows[0]["InsulationtobeInstalled"]);
                if (InsulationtobeInstalled == "Y")
                {
                    rdo_InsulationInstall_Yes.Checked = true;
                }
                else if (InsulationtobeInstalled == "N")
                {
                    rdo_InsulationInstall_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////

                string SealingtobeCompleted = Convert.ToString(dt.Rows[0]["SealingtobeCompleted"]);
                if (SealingtobeCompleted == "Y")
                {
                    rdo_SealingCompleted_Yes.Checked = true;
                }
                else if (SealingtobeCompleted == "N")
                {
                    rdo_SealingCompleted_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////
                txt_comment2.Text = Convert.ToString(dt.Rows[0]["Comment2"]);
            }
        }
        catch
        {
        }
    }
    #endregion


    # region form11
    public void fill_form11()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_11(JobNum);
            if (dt.Rows.Count > 0)
            {

                txt_customerHeatPumpThermostatUse.Text = Convert.ToString(dt.Rows[0]["ThermostatUsehabit"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                string ThermostatAccurate = Convert.ToString(dt.Rows[0]["ThermostatAccurate"]);
                if (ThermostatAccurate == "Y")
                {
                    page11_rdo_ThermostatAccurate_Yes.Checked = true;
                }
                else if (ThermostatAccurate == "N")
                {
                    page11_rdo_ThermostatAccurate_No.Checked = true;
                }
                else if (ThermostatAccurate == "Not")
                {
                    page11_rdo_ThermostatAccurate_IfNot.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                string CusHeatPump = Convert.ToString(dt.Rows[0]["CustomerheatPump"]);
                if (CusHeatPump == "H")
                {
                    rdoCusHeat.Checked = true;
                }
                else if (CusHeatPump == "A")
                {
                    rdoCusAc.Checked = true;
                }
                else if (CusHeatPump == "N")
                {
                    rdoCusNa.Checked = true;
                }
                else if (CusHeatPump == "O")
                {
                    rdoCusOther.Checked = true;
                    txtCusOther.Text = Convert.ToString(dt.Rows[0]["CustomerheatPumpOther"]);
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                page11_txt_ThermostatAccurate_IfNot.Text = Convert.ToString(dt.Rows[0]["ThermostatAccurateComment"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                string SlotCovered = Convert.ToString(dt.Rows[0]["SlotCovered"]);
                if (SlotCovered == "Y")
                {
                    page11_rdo_FilterSlotCovered_Yes.Checked = true;
                }
                else if (SlotCovered == "N")
                {
                    page11_rdo_FilterSlotCovered_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////

                string InspectA_Coil = Convert.ToString(dt.Rows[0]["InspectA_Coil"]);
                if (InspectA_Coil == "Y")
                {
                    page11_rdo_InspectAcoil_Yes.Checked = true;
                }
                else if (InspectA_Coil == "N")
                {
                    page11_rdo_InspectAcoil_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string CleaningRecommended = Convert.ToString(dt.Rows[0]["CleaningRecommended"]);
                if (CleaningRecommended == "Y")
                {
                    page11_rdo_CleaningRecommended_Yes.Checked = true;
                }
                else if (CleaningRecommended == "N")
                {
                    page11_rdo_CleaningRecommended_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string CleanerformeBy = Convert.ToString(dt.Rows[0]["CleanerformeBy"]);
                if (CleanerformeBy == "A")
                {
                    page11_rdo_CleaningPerformedBy_Auditor.Checked = true;
                }
                else if (CleanerformeBy == "3P")
                {
                    page11_rdo_CleaningPerformedBy_3rd_Party.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string WarrantPartyCleanTune = Convert.ToString(dt.Rows[0]["WarrantPartyCleanTune"]);
                if (WarrantPartyCleanTune == "Y")
                {
                    page11_rdo_Acoil_3rd_PartyClean_Yes.Checked = true;
                }
                else if (WarrantPartyCleanTune == "N")
                {
                    page11_rdo_Acoil_3rd_PartyClean_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string PartyContacted = Convert.ToString(dt.Rows[0]["PartyContacted"]);
                if (PartyContacted == "Y")
                {
                    page11_rdo_3rdPartyContacted_Yes.Checked = true;
                }
                else if (PartyContacted == "N")
                {
                    page11_rdo_3rdPartyContacted_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string CleanTune = Convert.ToString(dt.Rows[0]["CleanTune"]);
                if (CleanTune == "Y")
                {
                    page11_rdo_CleanTune_Yes.Checked = true;
                }
                else if (CleanTune == "N")
                {
                    page11_rdo_CleanTune_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                page11_paftxt_CleanTuneRecommended.Text = Convert.ToString(dt.Rows[0]["CleanTuneRecommendedComment"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpInstallSystem = Convert.ToString(dt.Rows[0]["HeatPumpInstallSystem"]);
                if (HeatPumpInstallSystem == "Y")
                {
                    page11_rdo_NewfilterInstall_Yes.Checked = true;
                }
                else if (HeatPumpInstallSystem == "N")
                {
                    page11_rdo_NewfilterInstall_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                page11_txt_NumberInstall.Text = Convert.ToString(dt.Rows[0]["HeatPumpNumberInstall"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpCleanSystem = Convert.ToString(dt.Rows[0]["HeatPumpCleanSystem"]);
                if (HeatPumpCleanSystem == "Y")
                {
                    rdo_FilterCleaned_Yes.Checked = true;
                }
                else if (HeatPumpCleanSystem == "N")
                {
                    rdo_FilterCleaned_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_NumberCleaned.Text = Convert.ToString(dt.Rows[0]["HeatPumpNumberClean"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpCoilsClean = Convert.ToString(dt.Rows[0]["HeatPumpCoilsClean"]);
                if (HeatPumpCoilsClean == "Y")
                {
                    rdo_CoilsCleaned_Yes.Checked = true;
                }
                else if (HeatPumpCoilsClean == "N")
                {
                    rdo_CoilsCleaned_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpReplace = Convert.ToString(dt.Rows[0]["HeatPumpReplace"]);
                if (HeatPumpReplace == "Y")
                {
                    rdo_HeatPumpReplaced_Yes.Checked = true;
                }
                else if (HeatPumpReplace == "N")
                {
                    rdo_HeatPumpReplaced_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                page11_txt_SizeUnit.Text = Convert.ToString(dt.Rows[0]["HeatPumpSizeUnit"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpThermalBoundary = Convert.ToString(dt.Rows[0]["HeatPumpThermalBoundary"]);
                if (HeatPumpThermalBoundary == "Y")
                {
                    page11_rdo_DuctWork_Yes.Checked = true;
                }
                else if (HeatPumpThermalBoundary == "N")
                {
                    page11_rdo_DuctWork_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_DuctWorkLocation.Text = Convert.ToString(dt.Rows[0]["HeatPumpThermalBoundaryLocation"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpInsulationInstall = Convert.ToString(dt.Rows[0]["HeatPumpInsulationInstall"]);
                if (HeatPumpInsulationInstall == "Y")
                {
                    page11_rdo_InsulationInstall_Yes.Checked = true;
                }
                else if (HeatPumpInsulationInstall == "N")
                {
                    page11_rdo_InsulationInstall_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpSealingComplete = Convert.ToString(dt.Rows[0]["HeatPumpSealingComplete"]);
                if (HeatPumpSealingComplete == "Y")
                {
                    rdo_SealingComplete_Yes.Checked = true;
                }
                else if (HeatPumpSealingComplete == "N")
                {
                    rdo_SealingComplete_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatPumpEnergy = Convert.ToString(dt.Rows[0]["HeatPumpEnergy"]);
                if (HeatPumpEnergy == "Y")
                {
                    rdo_PumpPamphletProvide_Yes.Checked = true;
                }
                else if (HeatPumpEnergy == "N")
                {
                    rdo_PumpPamphletProvide_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                page11_txt_Comment.Text = Convert.ToString(dt.Rows[0]["Comment1"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatType = Convert.ToString(dt.Rows[0]["ElectricHeatType"]);
                switch (ElectricHeatType)
                {
                    case "1":
                        rdo_TypeHeating_ElectricBaseboard.Checked = true;
                        break;

                    case "2":
                        rdo_TypeHeating_ElectricHeatPump.Checked = true;
                        break;

                    case "3":
                        rdo_TypeHeating_ElectricBoiler.Checked = true;
                        break;

                    case "4":
                        rdo_TypeHeating_ElectricFurnace.Checked = true;
                        break;

                    case "5":
                        rdo_TypeHeating_ElectricRadiant.Checked = true;
                        break;

                    case "6":
                        rdo_TypeHeating_ElectricWallBlowers.Checked = true;
                        break;

                    case "99":
                        rdo_TypeHeating_Other.Checked = true;
                        txt_TypeHeating_Other.Text = Convert.ToString(dt.Rows[0]["ElectricHeatTypeOther"]);
                        break;

                    default:
                        break;
                }
                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ElectricHeatThermostatUse.Text = Convert.ToString(dt.Rows[0]["ElectricHeatThermostatUseHabit"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatThermostatAccurate = Convert.ToString(dt.Rows[0]["ElectricHeatThermostatAccurate"]);
                if (ElectricHeatThermostatAccurate == "Y")
                {
                    rdo_ThermostatAccurate2_Yes.Checked = true;
                }
                else if (ElectricHeatThermostatAccurate == "N")
                {
                    rdo_ThermostatAccurate2_Yes.Checked = true;
                }
                else if (ElectricHeatThermostatAccurate == "Not")
                {
                    rdo_ThermostatAccurate2_IfNot.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ThermostatAccurate.Text = Convert.ToString(dt.Rows[0]["ElectricHeatThermostatAccurateComment"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatReplacementThermostat = Convert.ToString(dt.Rows[0]["ElectricHeatReplacementThermostat"]);
                if (ElectricHeatReplacementThermostat == "Y")
                {
                    page11_rdo_ReplacementThermostat_Yes.Checked = true;
                }
                else if (ElectricHeatReplacementThermostat == "N")
                {
                    page11_rdo_ReplacementThermostat_Yes.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ReplacementThermostats_Details.Text = Convert.ToString(dt.Rows[0]["ElectricHeatReplacementThermostatDetail"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatSlotCover = Convert.ToString(dt.Rows[0]["ElectricHeatSlotCover"]);
                if (ElectricHeatSlotCover == "Y")
                {
                    rdo_FilterSlotCovere_Yes.Checked = true;
                }
                else if (ElectricHeatSlotCover == "N")
                {
                    rdo_FilterSlotCovere_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_LocationsThermostat.Text = Convert.ToString(dt.Rows[0]["ElectricHeatLocationThermostat"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatCleanTune = Convert.ToString(dt.Rows[0]["ElectricHeatCleanTune"]);
                if (ElectricHeatCleanTune == "Y")
                {
                    rdo_CleanTune2_Yes.Checked = true;
                }
                else if (ElectricHeatCleanTune == "N")
                {
                    rdo_CleanTune2_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_CleanTuneRecommended2.Text = Convert.ToString(dt.Rows[0]["ElectricHeatCleanTuneRecommendedComment"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatInstallSystem = Convert.ToString(dt.Rows[0]["ElectricHeatInstallSystem"]);
                if (ElectricHeatInstallSystem == "Y")
                {
                    rdo_FilterInstalled_Yes.Checked = true;
                }
                else if (ElectricHeatInstallSystem == "N")
                {
                    rdo_FilterInstalled_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_NumberInstall2.Text = Convert.ToString(dt.Rows[0]["ElectricHeatNumberInstall"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatCleanSystem = Convert.ToString(dt.Rows[0]["ElectricHeatCleanSystem"]);
                if (ElectricHeatCleanSystem == "Y")
                {
                    page11_rdo_FilterClean_Yes.Checked = true;
                }
                else if (ElectricHeatCleanSystem == "N")
                {
                    page11_rdo_FilterClean_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                page11_txt_NumberClean.Text = Convert.ToString(dt.Rows[0]["ElectricHeatNumberClean"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeaterReplace = Convert.ToString(dt.Rows[0]["ElectricHeaterReplace"]);
                if (ElectricHeaterReplace == "Y")
                {
                    rdo_ElectricHeaterReplaced_Yes.Checked = true;
                }
                else if (ElectricHeaterReplace == "N")
                {
                    rdo_ElectricHeaterReplaced_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ElectricHeaterReplaced_SizeUnit.Text = Convert.ToString(dt.Rows[0]["ElectricHeatSizeUnit"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatSystemRepair = Convert.ToString(dt.Rows[0]["ElectricHeatSystemRepair"]);
                if (ElectricHeatSystemRepair == "Y")
                {
                    rdo_ElectricHeatRepair_Yes.Checked = true;
                }
                else if (ElectricHeatSystemRepair == "N")
                {
                    rdo_ElectricHeatRepair_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_ElectricHeatRepair_Detail.Text = Convert.ToString(dt.Rows[0]["ElectricHeatSystemRepairDetail"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string PrimaryHeatSource = Convert.ToString(dt.Rows[0]["PrimaryHeatSource"]);
                if (PrimaryHeatSource == "Y")
                {
                    rdo_PriHeatSource_Yes.Checked = true;
                }
                else if (PrimaryHeatSource == "N")
                {
                    rdo_PriHeatSource_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_PriHeatSourceLocation.Text = Convert.ToString(dt.Rows[0]["PrimaryHeatSourceLocation"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatThermalBoundary = Convert.ToString(dt.Rows[0]["ElectricHeatThermalBoundary"]);
                if (ElectricHeatThermalBoundary == "Y")
                {
                    rdo_DuctWork2_Yes.Checked = true;
                }
                else if (ElectricHeatThermalBoundary == "N")
                {
                    rdo_DuctWork2_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                txt_DuctWork2Location.Text = Convert.ToString(dt.Rows[0]["ElectricHeatThermalBoundaryLocation"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatInsulationInstall = Convert.ToString(dt.Rows[0]["ElectricHeatInsulationInstall"]);
                if (ElectricHeatInsulationInstall == "Y")
                {
                    rdo_InsulationInstal2_Yes.Checked = true;
                }
                else if (ElectricHeatInsulationInstall == "N")
                {
                    rdo_InsulationInstal2_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////

                string ElectricHeatSealingComplete = Convert.ToString(dt.Rows[0]["ElectricHeatSealingComplete"]);
                if (ElectricHeatSealingComplete == "Y")
                {
                    rdo_SealingComplete2_Yes.Checked = true;
                }
                else if (ElectricHeatSealingComplete == "N")
                {
                    rdo_SealingComplete2_No.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////
                page11_txt_Comment2.Text = Convert.ToString(dt.Rows[0]["Comment2"]);
            }
        }
        catch
        {
        }
    }
    #endregion

    # region form12
    public void fill_form12()
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
                //////////////////////////////////////////////////////////////////////////////////////////////////////

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
    #endregion

    # region form13
    public void fill_form13()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_13(JobNum);
            if (dt.Rows.Count > 0)
            {
                txt_Line1_Other.Text = Convert.ToString(dt.Rows[0]["Line1Other"]);
                txt_Line2_Other.Text = Convert.ToString(dt.Rows[0]["Line2Other"]);
                txt_Line3_Other.Text = Convert.ToString(dt.Rows[0]["Line3Other"]);
                txt_Line4_Other.Text = Convert.ToString(dt.Rows[0]["Line4Other"]);
                txt_Line15_Other.Text = Convert.ToString(dt.Rows[0]["Line5Other"]);
            }
        }
        catch
        {
        }
    }
    #endregion

    # region form14
    public void fill_form14()
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

                txt14_Comment.Text = Convert.ToString(dt.Rows[0]["Page14_Comment"]);
            }
        }
        catch
        {
        }
    }
    #endregion

    # region form15
    public void fill_form15()
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
    #endregion

    # region form16
    public void fill_form16()
    {
        try
        {
            txt_Line1_Area.Attributes.Add("readonly", "readonly");
            txt_Line2_Area.Attributes.Add("readonly", "readonly");
            txt_Line3_Area.Attributes.Add("readonly", "readonly");
            txt_Line4_Area.Attributes.Add("readonly", "readonly");
            txt_Line1_Volume.Attributes.Add("readonly", "readonly");
            txt_Line2_Volume.Attributes.Add("readonly", "readonly");
            txt_Line3_Volume.Attributes.Add("readonly", "readonly");
            txt_Line4_Volume.Attributes.Add("readonly", "readonly");
            txt_Line1_Ach.Attributes.Add("readonly", "readonly");
            txt_Line2_Ach.Attributes.Add("readonly", "readonly");
            txt_Line3_Ach.Attributes.Add("readonly", "readonly");
            txt_Line4_Ach.Attributes.Add("readonly", "readonly");
            txt_Line5_Ach.Attributes.Add("readonly", "readonly");
            txt_Line1_CFM.Attributes.Add("readonly", "readonly");
            txt_Line2_CFM.Attributes.Add("readonly", "readonly");
            txt_Line3_CFM.Attributes.Add("readonly", "readonly");
            txt_Line4_CFM.Attributes.Add("readonly", "readonly");
            txt_Line5_CFM.Attributes.Add("readonly", "readonly");
            txt_TotalCFM.Attributes.Add("readonly", "readonly");
            txt_CorrectedFactor.Attributes.Add("readonly", "readonly");
            txt_FactorOnline.Attributes.Add("readonly", "readonly");
            txt_Answer.Attributes.Add("readonly", "readonly");
            txt_InstallVentilation.Attributes.Add("readonly", "readonly");
            txt_TargetBAS.Attributes.Add("readonly", "readonly");

            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_16(JobNum);
            if (dt.Rows.Count > 0)
            {

                /////////////////////////////////////////////////////////////////////////////////

                txt_NumberOccupants.Text = Convert.ToString(dt.Rows[0]["NumberOfOccupants"]);
                txt_TotalCFM.Text = Convert.ToString(dt.Rows[0]["TIMES15CFM"]);

                /////////////////////////////////////////////////////////////////////////////////



                txt_Line1_Floor.Text = Convert.ToString(dt.Rows[0]["FloorLine1"]);
                txt_Line1_width.Text = Convert.ToString(dt.Rows[0]["WidthLine1"]);
                txt_Line1_length.Text = Convert.ToString(dt.Rows[0]["LengthLine1"]);
                txt_Line1_Area.Text = Convert.ToString(dt.Rows[0]["AreaLine1"]);
                txt_Line1_CellHeight.Text = Convert.ToString(dt.Rows[0]["CeilingHeightLine1"]);
                txt_Line1_Volume.Text = Convert.ToString(dt.Rows[0]["VolumeLine1"]);
                txt_Line1_Ach.Text = Convert.ToString(dt.Rows[0]["Times35ACHLine1"]);
                txt_Line1_Devide.Text = Convert.ToString(dt.Rows[0]["D60MinLin1"]);
                txt_Line1_CFM.Text = Convert.ToString(dt.Rows[0]["CFMNBLine1"]);
                txt_Line2_Floor.Text = Convert.ToString(dt.Rows[0]["FloorLine2"]);
                txt_Line2_width.Text = Convert.ToString(dt.Rows[0]["WidthLine2"]);
                txt_Line2_length.Text = Convert.ToString(dt.Rows[0]["LengthLine2"]);
                txt_Line2_Area.Text = Convert.ToString(dt.Rows[0]["AreaLine2"]);
                txt_Line2_CellHeight.Text = Convert.ToString(dt.Rows[0]["CeilingHeightLine2"]);
                txt_Line2_Volume.Text = Convert.ToString(dt.Rows[0]["VolumeLine2"]);
                txt_Line2_Ach.Text = Convert.ToString(dt.Rows[0]["Times35ACHLine2"]);
                txt_Line2_Devide.Text = Convert.ToString(dt.Rows[0]["D60MinLine2"]);
                txt_Line2_CFM.Text = Convert.ToString(dt.Rows[0]["CFMNBLine2"]);
                txt_Line3_Floor.Text = Convert.ToString(dt.Rows[0]["FloorLine3"]);
                txt_Line3_width.Text = Convert.ToString(dt.Rows[0]["WidthLine3"]);
                txt_Line3_length.Text = Convert.ToString(dt.Rows[0]["LengthLine3"]);
                txt_Line3_Area.Text = Convert.ToString(dt.Rows[0]["AreaLine3"]);
                txt_Line3_CellHeight.Text = Convert.ToString(dt.Rows[0]["CeilingHeightLine3"]);
                txt_Line3_Volume.Text = Convert.ToString(dt.Rows[0]["VolumeLine3"]);
                txt_Line3_Ach.Text = Convert.ToString(dt.Rows[0]["Times35ACHLine3"]);
                txt_Line3_Devide.Text = Convert.ToString(dt.Rows[0]["D60MinLine3"]);
                txt_Line3_CFM.Text = Convert.ToString(dt.Rows[0]["CFMNBLine3"]);
                txt_Line4_Floor.Text = Convert.ToString(dt.Rows[0]["FloorLine4"]);
                txt_Line4_width.Text = Convert.ToString(dt.Rows[0]["WidthLine4"]);
                txt_Line4_length.Text = Convert.ToString(dt.Rows[0]["LengthLine4"]);
                txt_Line4_Area.Text = Convert.ToString(dt.Rows[0]["AreaLine4"]);
                txt_Line4_CellHeight.Text = Convert.ToString(dt.Rows[0]["CeilingHeightLine4"]);
                txt_Line4_Volume.Text = Convert.ToString(dt.Rows[0]["VolumeLine4"]);
                txt_Line4_Ach.Text = Convert.ToString(dt.Rows[0]["Times35ACHLine4"]);
                txt_Line4_Devide.Text = Convert.ToString(dt.Rows[0]["D60MinLine4"]);
                txt_Line4_CFM.Text = Convert.ToString(dt.Rows[0]["CFMNBLine4"]);
                txt_Line5_Ach.Text = Convert.ToString(dt.Rows[0]["TotalTimes35ACH"]);
                txt_Line5_CFM.Text = Convert.ToString(dt.Rows[0]["TotalCFMNB"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////

                DDL_storyGrade.SelectedValue = Convert.ToString(dt.Rows[0]["NoSAGrade"]);
                txt_EnterPorB.Text = Convert.ToString(dt.Rows[0]["HigherOfPOrB"]);
                txt_CorrectedFactor.Text = Convert.ToString(dt.Rows[0]["NFactor"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_FactorOnline.Text = Convert.ToString(dt.Rows[0]["NFactorOnline"]);
                txt_Answer.Text = Convert.ToString(dt.Rows[0]["Answer"]);
                txt_InstallVentilation.Text = Convert.ToString(dt.Rows[0]["AirSeling"]);
                txt_TargetBAS.Text = Convert.ToString(dt.Rows[0]["TargetBAS"]);
                txt_LocationPreTretment.Text = Convert.ToString(dt.Rows[0]["BlowerDoorLocationPreTreatment"]);
                txt_LocationProTretment.Text = Convert.ToString(dt.Rows[0]["BlowerDoorLocationPostTreatment"]);
                txt_OtherNote.Text = Convert.ToString(dt.Rows[0]["Notes"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_PreTretmentResult.Text = Convert.ToString(dt.Rows[0]["PreTreatmentTestResultComment"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////

                string BSMTDoorOpenClosed = Convert.ToString(dt.Rows[0]["BSMTDoorOpenClosed"]);
                if (BSMTDoorOpenClosed == "Open")
                {
                    rdo_BasemetDoorOpen.Checked = true;
                }
                else if (BSMTDoorOpenClosed == "Close")
                {
                    rdo_BasemetDoorClose.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string AtticDoorOpenClosed = Convert.ToString(dt.Rows[0]["AtticDoorOpenClosed"]);
                if (AtticDoorOpenClosed == "Open")
                {
                    rdo_AtticDoorOpen.Checked = true;
                }
                else if (AtticDoorOpenClosed == "Close")
                {
                    rdo_AtticDoor_Close.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_OtherDoor.Text = Convert.ToString(dt.Rows[0]["OtherDoorCommentPre"]);
                string OtherDoorOpenClosed = Convert.ToString(dt.Rows[0]["OtherDoorOpenClosed"]);

                if (OtherDoorOpenClosed == "Open")
                {
                    rdo_OtherDoor_Open.Checked = true;
                }
                else if (OtherDoorOpenClosed == "Close")
                {
                    rdo_OtherDoor_Close.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_PostTretment_Result.Text = Convert.ToString(dt.Rows[0]["PostTreatmentTestResultComment"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string BSMTPostDoorOpenClosed = Convert.ToString(dt.Rows[0]["BSMTPostDoorOpenClosed"]);
                if (BSMTPostDoorOpenClosed == "Open")
                {
                    rdo_BasemetDoor2_Open.Checked = true;
                }
                else if (BSMTPostDoorOpenClosed == "Close")
                {
                    rdo_BasemetDoor2_Close.Checked = true;
                }


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string AtticPostDoorOpenClosed = Convert.ToString(dt.Rows[0]["AtticPostDoorOpenClosed"]);
                if (AtticPostDoorOpenClosed == "Open")
                {
                    rdo_AtticDoor2_Open.Checked = true;
                }
                else if (AtticPostDoorOpenClosed == "Close")
                {
                    rdo_AtticDoor2_Close.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_OtherDoor2.Text = Convert.ToString(dt.Rows[0]["OtherPostCommentsPost"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string OtherPostDoorOpenClosed = Convert.ToString(dt.Rows[0]["OtherPostDoorOpenClosed"]);
                if (OtherPostDoorOpenClosed == "Open")
                {
                    rdo_OtherDoor2_Open.Checked = true;
                }
                else if (OtherPostDoorOpenClosed == "Close")
                {
                    rdo_OtherDoor2_Close.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string AtticIn = Convert.ToString(dt.Rows[0]["AtticIn"]);
                if (AtticIn == "Y")
                {
                    Chk_Attic_In.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string AtticOut = Convert.ToString(dt.Rows[0]["AtticOut"]);
                if (AtticOut == "Y")
                {
                    Chk_Attic_Out.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Attic_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["AtticPreTest1"]);
                txt_Attic_Blower_Final.Text = Convert.ToString(dt.Rows[0]["AtticFinal1"]);
                txt_Attic_House_Pre.Text = Convert.ToString(dt.Rows[0]["AtticPreTest2"]);
                txt_Attic_House_Final.Text = Convert.ToString(dt.Rows[0]["AtticFinal2"]);
                txt_Attic_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["AtticPreTest3"]);
                txt_Attic_Outside_Final.Text = Convert.ToString(dt.Rows[0]["AtticFinal3"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string BasementIn = Convert.ToString(dt.Rows[0]["BasementIn"]);
                if (BasementIn == "Y")
                {
                    Chk_Basement_In.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////

                string BasementOut = Convert.ToString(dt.Rows[0]["BasementOut"]);
                if (BasementOut == "Y")
                {
                    Chk_Basement_Out.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Basement_Bolower_Pre.Text = Convert.ToString(dt.Rows[0]["BasementPreTest1"]);
                txt_Basement_Bolower_Final.Text = Convert.ToString(dt.Rows[0]["BasementFinal1"]);
                txt_Basement_House_Pre.Text = Convert.ToString(dt.Rows[0]["BasementPreTest2"]);
                txt_Basement_House_Final.Text = Convert.ToString(dt.Rows[0]["BasementFinal2"]);
                txt_Basement_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["BasementPreTest3"]);
                txt_Basement_Outside_Final.Text = Convert.ToString(dt.Rows[0]["BasementFinal3"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string VentedCrawlIn = Convert.ToString(dt.Rows[0]["VentedCrawlIn"]);
                if (VentedCrawlIn == "Y")
                {
                    Chk_VentedCrawl_In.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string VentedCrawlOut = Convert.ToString(dt.Rows[0]["VentedCrawlOut"]);
                if (VentedCrawlOut == "y")
                {
                    Chk_VentedCrawl_Out.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_VentedCrawl_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["VentedCrawlPreTest1"]);
                txt_VentedCrawl_Blower_Final.Text = Convert.ToString(dt.Rows[0]["VentedCrawlFinal1"]);
                txt_VentedCrawl_House_Pre.Text = Convert.ToString(dt.Rows[0]["VentedCrawlPreTest2"]);
                txt_VentedCrawl_House_Final.Text = Convert.ToString(dt.Rows[0]["VentedCrawlFinal2"]);
                txt_VentedCrawl_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["VentedCrawlPreTest3"]);
                txt_VentedCrawl_Outside_Final.Text = Convert.ToString(dt.Rows[0]["VentedCrawlFinal3"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string Attic_A_In = Convert.ToString(dt.Rows[0]["Attic_A_In"]);
                if (Attic_A_In == "Y")
                {
                    Chk_AtticA_In.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string Attic_A_Out = Convert.ToString(dt.Rows[0]["Attic_A_Out"]);
                if (Attic_A_Out == "Y")
                {
                    Chk_AtticA_Out.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_AtticA_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["Attic_A_PreTest1"]);
                txt_AtticA_Blower_Final.Text = Convert.ToString(dt.Rows[0]["Attic_A_Final1"]);
                txt_AtticA_House_Pre.Text = Convert.ToString(dt.Rows[0]["Attic_A_PreTest2"]);
                txt_AtticA_House_Final.Text = Convert.ToString(dt.Rows[0]["Attic_A_Final2"]);
                txt_AtticA_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["Attic_A_PreTest3"]);
                txt_AtticA_Outside_Final.Text = Convert.ToString(dt.Rows[0]["Attic_A_Final3"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string Attic_B_In = Convert.ToString(dt.Rows[0]["Attic_B_In"]);
                if (Attic_B_In == "Y")
                {
                    Chk_AtticB_In.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string Attic_B_Out = Convert.ToString(dt.Rows[0]["Attic_B_Out"]);
                if (Attic_B_Out == "Y")
                {
                    Chk_AtticB_Out.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_AtticB_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["Attic_B_PreTest1"]);
                txt_AtticB_Blower_Final.Text = Convert.ToString(dt.Rows[0]["Attic_B_Final1"]);
                txt_AtticB_House_Pre.Text = Convert.ToString(dt.Rows[0]["Attic_B_PreTest2"]);
                txt_AtticB_House_Final.Text = Convert.ToString(dt.Rows[0]["Attic_B_Final2"]);
                txt_AtticB_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["Attic_B_PreTest3"]);
                txt_AtticB_Outside_Final.Text = Convert.ToString(dt.Rows[0]["Attic_B_Final3"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string KneeWall_A_In = Convert.ToString(dt.Rows[0]["KneeWall_A_In"]);
                if (KneeWall_A_In == "Y")
                {
                    Chk_KneewallA_In.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                string KneeWall_A_Out = Convert.ToString(dt.Rows[0]["KneeWall_A_Out"]);
                if (KneeWall_A_Out == "Y")
                {
                    Chk_KneewallA_Out.Checked = true;
                }


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




                txt_KneewallA_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["KneeWall_A_PreTest1"]);
                txt_KneewallA_Blower_Final.Text = Convert.ToString(dt.Rows[0]["KneeWall_A_Final1"]);
                txt_KneewallA_House_Pre.Text = Convert.ToString(dt.Rows[0]["KneeWall_B_PreTest2"]);
                txt_KneewallA_House_Final.Text = Convert.ToString(dt.Rows[0]["KneeWall_A_Final2"]);
                txt_KneewallA_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["KneeWall_A_PreTest3"]);
                txt_KneewallA_Outside_Final.Text = Convert.ToString(dt.Rows[0]["KneeWall_A_Final3"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////


                string KneeWall_B_In = Convert.ToString(dt.Rows[0]["KneeWall_B_In"]);
                if (KneeWall_B_In == "Y")
                {
                    Chk_KneewallB_In.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////



                string KneeWall_B_Out = Convert.ToString(dt.Rows[0]["KneeWall_B_Out"]);
                if (KneeWall_B_Out == "Y")
                {
                    Chk_KneewallB_Out.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_KneewallB_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["KneeWall_B_PreTest1"]);
                txt_KneewallB_Blower_Final.Text = Convert.ToString(dt.Rows[0]["KneeWall_B_Final1"]);
                txt_KneewallB_House_Pre.Text = Convert.ToString(dt.Rows[0]["KneeWall_B_PreTest2"]);
                txt_KneewallB_House_Final.Text = Convert.ToString(dt.Rows[0]["KneeWall_B_Final2"]);
                txt_KneewallB_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["KneeWall_B_PreTest3"]);
                txt_KneewallB_Outside_Final.Text = Convert.ToString(dt.Rows[0]["KneeWall_B_Final3"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string GarageIn = Convert.ToString(dt.Rows[0]["GarageIn"]);
                if (GarageIn == "Y")
                {
                    Chk_Garage_In.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////

                string GarageOut = Convert.ToString(dt.Rows[0]["GarageOut"]);
                if (GarageOut == "Y")
                {
                    Chk_Garage_Out.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////




                txt_Garage_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["GaragePreTest1"]);
                txt_Garage_Blower_Final.Text = Convert.ToString(dt.Rows[0]["GarageFinal1"]);
                txt_Garage_House_Pre.Text = Convert.ToString(dt.Rows[0]["GaragePreTest2"]);
                txt_Garage_House_Final.Text = Convert.ToString(dt.Rows[0]["GarageFinal2"]);
                txt_Garage_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["GaragePreTest3"]);
                txt_Garage_Outside_Final.Text = Convert.ToString(dt.Rows[0]["GarageFinal3"]);


                ////////////////////////////////////////////////////////////////////////////////////////
                string GarageAtticIn = Convert.ToString(dt.Rows[0]["GarageAtticIn"]);
                if (GarageAtticIn == "Y")
                {
                    Chk_GarageAttic_In.Checked = true;
                }


                //////////////////////////////////////////////////////////////////////////////////////////


                string GarageAtticOut = Convert.ToString(dt.Rows[0]["GarageAtticOut"]);
                if (GarageAtticOut == "Y")
                {
                    Chk_GarageAttic_Out.Checked = true;
                }


                ///////////////////////////////////////////////////////////////////////////////////////////////////


                txt_GarageAttic_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["GarageAtticPreTest1"]);
                txt_GarageAttic_Blower_Final.Text = Convert.ToString(dt.Rows[0]["GarageAtticFinal1"]);
                txt_GarageAttic_House_Pre.Text = Convert.ToString(dt.Rows[0]["GarageAtticPreTest2"]);
                txt_GarageAttic_House_Final.Text = Convert.ToString(dt.Rows[0]["GarageAtticFinal2"]);
                txt_GarageAttic_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["GarageAtticPreTest3"]);
                txt_GarageAttic_Outside_Final.Text = Convert.ToString(dt.Rows[0]["GarageAtticFinal3"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////////


                string CantileverOverHangIn = Convert.ToString(dt.Rows[0]["CantileverOverHangIn"]);
                if (CantileverOverHangIn == "Y")
                {
                    Chk_CantileverOverhang_In.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string CantileverOverHangOut = Convert.ToString(dt.Rows[0]["CantileverOverHangOut"]);
                if (CantileverOverHangOut == "Y")
                {
                    Chk_CantileverOverhang_Out.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_CantileverOverhang_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["CantileverOverHangPreTest1"]);
                txt_CantileverOverhang_Blower_Final.Text = Convert.ToString(dt.Rows[0]["CantileverOverHangFinal1"]);
                txt_CantileverOverhang_House_Pre.Text = Convert.ToString(dt.Rows[0]["CantileverOverHangPreTest2"]);
                txt_CantileverOverhang_House_Final.Text = Convert.ToString(dt.Rows[0]["CantileverOverHangFinal2"]);
                txt_CantileverOverhang_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["CantileverOverHangPreTest3"]);
                txt_CantileverOverhang_Outside_Final.Text = Convert.ToString(dt.Rows[0]["CantileverOverHangFinal3"]);


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string Other1_In = Convert.ToString(dt.Rows[0]["Other1_In"]);
                if (Other1_In == "Y")
                {
                    Chk_Other_In.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string Other1_Out = Convert.ToString(dt.Rows[0]["Other1_Out"]);
                if (Other1_Out == "Y")
                {
                    Chk_Other_Out.Checked = true;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_Other1_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["Other1_PreTest1"]);
                txt_Other1_Blower_Final.Text = Convert.ToString(dt.Rows[0]["Other1_Final1"]);
                txt_Other1_House_Pre.Text = Convert.ToString(dt.Rows[0]["Other1_PreTest2"]);
                txt_Other1_House_Final.Text = Convert.ToString(dt.Rows[0]["Other1_Final2"]);
                txt_Other1_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["Other1_PreTest3"]);
                txt_Other1_Outside_Final.Text = Convert.ToString(dt.Rows[0]["Other1_Final3"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string Other2_In = Convert.ToString(dt.Rows[0]["Other2_In"]);
                if (Other2_In == "Y")
                {
                    Chk_Other2_In.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string Other2_Out = Convert.ToString(dt.Rows[0]["Other2_Out"]);
                if (Other2_Out == "Y")
                {
                    Chk_Other2_Out.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                txt_Other2_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["Other2_PreTest1"]);
                txt_Other2_Blower_Final.Text = Convert.ToString(dt.Rows[0]["Other2_Final1"]);
                txt_Other2_House_Pre.Text = Convert.ToString(dt.Rows[0]["Other2_PreTest2"]);
                txt_Other2_House_Final.Text = Convert.ToString(dt.Rows[0]["Other2_Final2"]);
                txt_Other2_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["Other2_PreTest3"]);
                txt_Other2_Outside_Final.Text = Convert.ToString(dt.Rows[0]["Other2_Final3"]);

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string PressureObserved = Convert.ToString(dt.Rows[0]["PressureObserved"]);
                if (PressureObserved == "Y")
                {
                    rdo_DustObsver_Yes.Checked = true;
                }
                else if (PressureObserved == "N")
                {
                    rdo_DustObsver_No.Checked = true;
                }


                //////////////////////////////////////////////////////////////////////////////////////////////


                string DustMaterialMetal = Convert.ToString(dt.Rows[0]["DustMaterialMetal"]);
                if (DustMaterialMetal == "Y")
                {
                    Chk_Matrial_Metal.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////


                string DustMaterialDuctBoard = Convert.ToString(dt.Rows[0]["DustMaterialDuctBoard"]);
                if (DustMaterialDuctBoard == "Y")
                {
                    Chk_Matrial_Ductbord.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string DustMaterialFlex = Convert.ToString(dt.Rows[0]["DustMaterialFlex"]);
                if (DustMaterialFlex == "Y")
                {
                    Chk_Matrial_Flex.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SystemTypeHeat = Convert.ToString(dt.Rows[0]["SystemTypeHeat"]);
                if (SystemTypeHeat == "Y")
                {
                    Chk_System_HeatPump.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SystemTypeCentral = Convert.ToString(dt.Rows[0]["SystemTypeCentral"]);
                if (SystemTypeCentral == "Y")
                {
                    Chk_CentralAir.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SystemTypeElectric = Convert.ToString(dt.Rows[0]["SystemTypeElectric"]);
                if (SystemTypeElectric == "Y")
                {
                    Chk_ElectricFurnuase.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SystemTypeOther = Convert.ToString(dt.Rows[0]["SystemTypeOther"]);
                if (SystemTypeOther == "Y")
                {
                    Chk_Other.Checked = true;
                    txt_SystemType_Other.Text = Convert.ToString(dt.Rows[0]["SystemTypeOtherComment"]);
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                txt_Room1.Text = Convert.ToString(dt.Rows[0]["RegisterRoom1"]);
                txt_Room2.Text = Convert.ToString(dt.Rows[0]["RegisterRoom2"]);
                txt_Room3.Text = Convert.ToString(dt.Rows[0]["RegisterRoom3"]);
                txt_Room4.Text = Convert.ToString(dt.Rows[0]["RegisterRoom4"]);
                txt_Room5.Text = Convert.ToString(dt.Rows[0]["RegisterRoom5"]);
                txt_Room6.Text = Convert.ToString(dt.Rows[0]["RegisterRoom6"]);
                txt_Room7.Text = Convert.ToString(dt.Rows[0]["RegisterRoom7"]);
                txt_Room8.Text = Convert.ToString(dt.Rows[0]["RegisterRoom8"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                txt_Supply_pre1.Text = Convert.ToString(dt.Rows[0]["SupplyPre1"]);
                txt_Supply_pro1.Text = Convert.ToString(dt.Rows[0]["SupplyPost1"]);
                txt_Supply_pre2.Text = Convert.ToString(dt.Rows[0]["SupplyPre2"]);
                txt_Supply_pro2.Text = Convert.ToString(dt.Rows[0]["SupplyPost2"]);
                txt_Supply_pre3.Text = Convert.ToString(dt.Rows[0]["SupplyPre3"]);
                txt_Supply_pro3.Text = Convert.ToString(dt.Rows[0]["SupplyPost3"]);
                txt_Supply_pre4.Text = Convert.ToString(dt.Rows[0]["SupplyPre4"]);
                txt_Supply_pro4.Text = Convert.ToString(dt.Rows[0]["SupplyPost4"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_Return_pre1.Text = Convert.ToString(dt.Rows[0]["ReturnPre1"]);
                txt_Return_pro1.Text = Convert.ToString(dt.Rows[0]["ReturnPost1"]);
                txt_Return_pre2.Text = Convert.ToString(dt.Rows[0]["ReturnPre2"]);
                txt_Return_pro2.Text = Convert.ToString(dt.Rows[0]["ReturnPost2"]);
                txt_Return_pre3.Text = Convert.ToString(dt.Rows[0]["ReturnPre3"]);
                txt_Return_pro3.Text = Convert.ToString(dt.Rows[0]["ReturnPost3"]);
                txt_Return_pre4.Text = Convert.ToString(dt.Rows[0]["ReturnPre4"]);
                txt_Return_pro4.Text = Convert.ToString(dt.Rows[0]["ReturnPost4"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt16_Comment.Text = Convert.ToString(dt.Rows[0]["Comments"]);



            }
        }
        catch
        { }
    }
    #endregion

    # region form17
    public void fill_form17()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_17(JobNum);
            if (dt.Rows.Count > 0)
            {
                string PrePostWorkTesting = Convert.ToString(dt.Rows[0]["PrePostWorkTesting"]);
                if (PrePostWorkTesting == "Pre")
                {
                    rdo_PreTest.Checked = true;
                }
                else if (PrePostWorkTesting == "Post")
                {
                    rdo_PostTest.Checked = true;
                }


                string AuditorCrewWorkTesting = Convert.ToString(dt.Rows[0]["AuditorCrewWorkTesting"]);
                if (AuditorCrewWorkTesting == "A")
                {
                    rdo_Auditor.Checked = true;
                }
                else if (AuditorCrewWorkTesting == "C")
                {
                    rdo_Crew.Checked = true;
                    txt_Crew.Text = Convert.ToString(dt.Rows[0]["PrePostWorkTestingComment"]);
                }


                //////////////////////////////////////////////////////////////////////////////////

                txt_TechName1.Text = Convert.ToString(dt.Rows[0]["TechName"]);
                txt_TestDate.Text = Convert.ToString(dt.Rows[0]["TestDate"]);
                txt_Note1_17.Text = Convert.ToString(dt.Rows[0]["Note1_17"]);

                /////////////////////////////////////////////////////////////////////////////////

                string CombustionSafetyTestingCombustionAppliances = Convert.ToString(dt.Rows[0]["CombustionSafetyTestingCombustionAppliances"]);
                if (CombustionSafetyTestingCombustionAppliances == "Y")
                {
                    rdo_CombustionAppliances_Yes.Checked = true;
                }
                else if (CombustionSafetyTestingCombustionAppliances == "N")
                {
                    rdo_CombustionAppliances_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////

                string CombustionHeatAppliances = Convert.ToString(dt.Rows[0]["CombustionHeatAppliances"]);
                if (CombustionHeatAppliances == "Y")
                {
                    rdo_UnventedCombustionHeatingApp_Y.Checked = true;
                }
                else if (CombustionHeatAppliances == "N")
                {
                    rdo_UnventedCombustionHeatingApp_N.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////

                txt_Co_WaterHeater_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOInitialAMB"]);
                txt_Co_WaterHeater_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOInitialCAZ"]);
                txt_After_WaterHeater_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOAfterAMB"]);
                txt_After_WaterHeater_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOAfterCAZ"]);
                txt_GasLeak_WaterHeater.Text = Convert.ToString(dt.Rows[0]["WaterHeaterGasLeak"]);
                txt_Flame_WaterHeater.Text = Convert.ToString(dt.Rows[0]["WaterHeaterFlameRollout"]);
                txt_Spillage_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageWC"]);
                txt_Spillage_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageNAT"]);
                txt_SpillageAfter_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageAfterWC"]);
                txt_SpillageAfter_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageAfterNAT"]);
                txt_DraftPress_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPressureWC"]);
                txt_DraftPress_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPressureNAT"]);
                txt_DraftPass_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassWC"]);
                txt_DraftPass_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassNAT"]);
                txt_CoFuel_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOFlueWC"]);
                txt_CoFuel_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOFlueNAT"]);
                txt_CoPass_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOPassWC"]);
                txt_CoPass_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOPassNAT"]);
                txt_Optional_WaterHeater_StackTemp.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalStackTemp"]);
                txt_Optional_WaterHeater_O2.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalO2"]);
                txt_Optional_WaterHeater_Eff.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalEff"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////////

                txt_Co_FurnaceBoil_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOInitialAMB"]);
                txt_Co_FurnaceBoil_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOInitialCAZ"]);
                txt_CoAfter_FurnaceBoil_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOAfterWC"]);
                txt_CoAfter_FurnaceBoil_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOAfterNAT"]);
                txt_GasLeak_FurnaceBoil.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerGasLeak"]);
                txt_Flame_FurnaceBoil.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerFlameRollout"]);
                txt_Spillage_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageWC"]);
                txt_Spillage_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageNAT"]);
                txt_SpillageAfter_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageAfterWC"]);
                txt_SpillageAfter_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageAfterNAT"]);
                txt_DraftPress_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPressureWC"]);
                txt_DraftPress_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPressureNAT"]);
                txt_DraftPass_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassWC"]);
                txt_DraftPass_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassNAT"]);
                txt_CoFuel_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOFlueWC"]);
                txt_CoFuel_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOFlueNAT"]);
                txt_CoPass_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOPassWC"]);
                txt_CoPass_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOPassNAT"]);
                txt_Optional_FurnaceBoil_Stack.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalStackTemp"]);
                txt_Optional_FurnaceBoil_O2.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalO2"]);
                txt_Optional_FurnaceBoil_Eff.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalEff"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_Co_GasRange_AMB.Text = Convert.ToString(dt.Rows[0]["GasRangeCOInitialAMB"]);
                txt_Co_GasRange_CAZ.Text = Convert.ToString(dt.Rows[0]["GasRangeCOInitialCAZ"]);
                txt_CoAfter_GasRange_AMB.Text = Convert.ToString(dt.Rows[0]["GasRangeCOAfterWC"]);
                txt_CoAfter_GasRange_CAZ.Text = Convert.ToString(dt.Rows[0]["GasRangeCOAfterCAZ"]);
                txt_GasLeak_GasRange.Text = Convert.ToString(dt.Rows[0]["GasRangeGasLeak"]);
                txt_Flame_GasRange.Text = Convert.ToString(dt.Rows[0]["GasRangeFlameRollout"]);
                txt_Spillage_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageWC"]);
                txt_Spillage_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageNAT"]);
                txt_SpillageAfter_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageAfterWC"]);
                txt_SpillageAfter_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageAfterNAT"]);
                txt_DraftPress_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPressureWC"]);
                txt_DraftPress_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPressureNAT"]);
                txt_DraftPass_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPassWC"]);
                txt_DraftPass_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPassNAT"]);
                txt_CoFuel_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeCOFlueWC"]);
                txt_CoFuel_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeCOFlueNAT"]);
                txt_CoPass_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeCOPassWC"]);
                txt_CoPass_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeCOPassNAT"]);
                txt_Optional_GasRange_Stack.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalStackTemp"]);
                txt_Optional_GasRange_O2.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalO2"]);
                txt_Optional_GasRange_Eff.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalEff"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_Co_Other_AMB.Text = Convert.ToString(dt.Rows[0]["OtherCOInitialAMB"]);
                txt_Co_Other_CAZ.Text = Convert.ToString(dt.Rows[0]["OtherCOInitialCAZ"]);
                txt_CoAfter_Other_AMB.Text = Convert.ToString(dt.Rows[0]["OtherCOAfterAMB"]);
                txt_CoAfter_Other_CAZ.Text = Convert.ToString(dt.Rows[0]["OtherCOAfterCAZ"]);
                txt_GasLeak_Other.Text = Convert.ToString(dt.Rows[0]["OtherGasLeak"]);
                txt_Flame_Other.Text = Convert.ToString(dt.Rows[0]["OtherFlameRollout"]);
                txt_Spillage_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherSpillageWC"]);
                txt_Spillage_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherSpillageNAT"]);
                txt_SpillageAfter_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherSpillageAfterWC"]);
                txt_SpillageAfter_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherSpillageAfterNAT"]);
                txt_DraftPress_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherDraftPressureWC"]);
                txt_DraftPress_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherDraftPressureNAT"]);
                txt_DraftPass_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherDraftPassWC"]);
                txt_DraftPass_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherDraftPassNAT"]);
                txt_CoFuel_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherCoFlueWC"]);
                txt_CoFuel_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherCoFlueNAT"]);
                txt_CoPass_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherCoPassWC"]);
                txt_CoPass_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherCoPassNAT"]);
                txt_Optional_Other_Stack.Text = Convert.ToString(dt.Rows[0]["OtherOptionalStackTemp"]);
                txt_Optional_Other_O2.Text = Convert.ToString(dt.Rows[0]["OtherOptionalO2"]);
                txt_Optional_Other_Eff.Text = Convert.ToString(dt.Rows[0]["OtherOptionalEff"]);


                /////////////////////////////////////////////////////////////////////////////////////


                txt_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1"]);
                txt_Co_Col1Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COInitialAMB"]);
                txt_Co_Col1Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COInitialCAZ"]);
                txt_CoAfter_Col1Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COAfterlAMB"]);
                txt_CoAfter_Col1Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COAfterCAZ"]);
                txt_GasLeak_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1_GasLeak"]);
                txt_Flame_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1_FlameRollout"]);
                txt_Spillage_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageWC"]);
                txt_Spillage_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageNAT"]);
                txt_SpillageAfter_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageAfterWC"]);
                txt_SpillageAfter_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageAfterNAT"]);
                txt_DraftPress_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPressureWC"]);
                txt_DraftPress_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPressureNAT"]);
                txt_DraftPass_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPassWC"]);
                txt_DraftPass_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPassNAT"]);
                txt_CoFuel_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoFlueWC"]);
                txt_CoFuel_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoFlueNAT"]);
                txt_CoPass_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoPassWC"]);
                txt_CoPass_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoPassNAT"]);
                txt_Optional_Col1Cat_Stack.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalStackTemp"]);
                txt_Optional_Col1Cat_O2.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalO2"]);
                txt_Optional_Col1Cat_Eff.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalEff"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2"]);
                txt_Co_Col2Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COInitialAMB"]);
                txt_Co_Col2Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COInitialCAZ"]);
                txt_CoAfter_Col2Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COAfterAMB"]);
                txt_CoAfter_Col2Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COAfterCAZ"]);
                txt_GasLeak_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2_GasLeak"]);
                txt_Flame_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2_FlameRollout"]);
                txt_Spillage_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageWC"]);
                txt_Spillage_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageNAT"]);
                txt_SpillageAfter_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageAfterWC"]);
                txt_SpillageAfter_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageAfterNAT"]);
                txt_DraftPress_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPressureWC"]);
                txt_DraftPress_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPressureNAT"]);
                txt_DraftPass_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPassWC"]);
                txt_DraftPass_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPassNAT"]);
                txt_CoFuel_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoFlueWC"]);
                txt_CoFuel_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoFlueNAT"]);
                txt_CoPass_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoPassWC"]);
                txt_CoPass_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoPassNAT"]);
                txt_Optional_Col2Cat_Stack.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalStackTemp"]);
                txt_Optional_Col2Cat_O2.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalO2"]);
                txt_Optional_Col2Cat_Eff.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalEff"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_COAmbient.Text = Convert.ToString(dt.Rows[0]["OvenCOAmbient"]);
                txt_CO_Oven_Vent.Text = Convert.ToString(dt.Rows[0]["OvenCOAt"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_CoNotes1.Text = Convert.ToString(dt.Rows[0]["BlankCenter_1"]);
                txt_CoNotes2.Text = Convert.ToString(dt.Rows[0]["BlankCenter_2"]);
                txt_CoNotes3.Text = Convert.ToString(dt.Rows[0]["BlankCenter_3"]);
                txt_CoNotes4.Text = Convert.ToString(dt.Rows[0]["BlankCenter_4"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_CoNotes.Text = Convert.ToString(dt.Rows[0]["Notes"]);

                /////////////////////////////////////////////////////////////////////////////////////////////


                txt_OutdoorTemperature.Text = Convert.ToString(dt.Rows[0]["OutdoorTemperature"]);

                //////////////////////////////////////////////////////////////////////////////////////////////


                txt_CAZDepressurization_Natural.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseNatural"]);
                txt_CAZDepressurization_WC.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseWC"]);
                txt_CAZDepressurization_Diff.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseDiff"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string SelectAppliancesCheckbox_Dryer = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Dryer"]);
                if (SelectAppliancesCheckbox_Dryer == "Y")
                {
                    chk_Appliances_WorstCase_Dryer.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_WHF = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_WHF"]);
                if (SelectAppliancesCheckbox_WHF == "Y")
                {
                    chk_Appliances_WorstCase_WholeHouseFan.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_Bath = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Bath"]);
                if (SelectAppliancesCheckbox_Bath == "Y")
                {
                    chk_Appliances_WorstCase_BathFan.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_HVAC = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_HVAC"]);
                if (SelectAppliancesCheckbox_HVAC == "Y")
                {
                    chk_Appliances_WorstCase_HVACAirHandler.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_KF = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_KF"]);
                if (SelectAppliancesCheckbox_KF == "Y")
                {
                    chk_Appliances_WorstCase_KitchenFan.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_AtticFan = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_AtticFan"]);
                if (SelectAppliancesCheckbox_AtticFan == "Y")
                {
                    chk_Appliances_WorstCase_AtticFan.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_Other = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Other"]);
                if (SelectAppliancesCheckbox_Other == "Y")
                {
                    chk_Appliances_WorstCase_Other.Checked = true;
                    txt_Appliances_WorstCase_Other.Text = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Othertext"]);
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string PassRadiobtn = Convert.ToString(dt.Rows[0]["PassRadiobtn"]);
                if (PassRadiobtn == "Y")
                {
                    rdo_CAZPass_Yes.Checked = true;
                }
                else if (PassRadiobtn == "N")
                {
                    rdo_CAZPass_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string EmergencySituationCheckBox = Convert.ToString(dt.Rows[0]["EmergencySituationCheckBox"]);
                if (EmergencySituationCheckBox == "Y")
                {
                    chk_Emergency_GasCompanyCalled.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string WorkCheckbox = Convert.ToString(dt.Rows[0]["WorkCheckbox"]);
                if (WorkCheckbox == "Y")
                {
                    chk_WorkCannot_MoreFailedTests.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_FinalNotes.Text = Convert.ToString(dt.Rows[0]["BottomNotes"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



            }

        }
        catch
        {

        }

    }
    #endregion

    # region form18
    public void fill_form18()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_18(JobNum);
            if (dt.Rows.Count > 0)
            {
                string PrePostWorkTesting = Convert.ToString(dt.Rows[0]["PrePostWorkTesting"]);
                if (PrePostWorkTesting == "Pre")
                {
                    page18_rdo_PreTest.Checked = true;
                }
                else if (PrePostWorkTesting == "Post")
                {
                    page18_rdo_PostTest.Checked = true;
                }


                string AuditorCrewWorkTesting = Convert.ToString(dt.Rows[0]["AuditorCrewWorkTesting"]);
                if (AuditorCrewWorkTesting == "A")
                {
                    page18_rdo_Auditor.Checked = true;
                }
                else if (AuditorCrewWorkTesting == "C")
                {
                    page18_rdo_Crew.Checked = true;
                    page18_txt_Crew.Text = Convert.ToString(dt.Rows[0]["PrePostWorkTestingComment"]);
                }


                //////////////////////////////////////////////////////////////////////////////////

                page18_txt_TechName.Text = Convert.ToString(dt.Rows[0]["TechName"]);
                page18_txt_TestDate.Text = Convert.ToString(dt.Rows[0]["TestDate"]);
                txt_Note1_18.Text = Convert.ToString(dt.Rows[0]["Note1_18"]);

                /////////////////////////////////////////////////////////////////////////////////

                string CombustionSafetyTestingCombustionAppliances = Convert.ToString(dt.Rows[0]["CombustionSafetyTestingCombustionAppliances"]);
                if (CombustionSafetyTestingCombustionAppliances == "Y")
                {
                    page18_rdo_CombustionAppliances_Yes.Checked = true;
                }
                else if (CombustionSafetyTestingCombustionAppliances == "N")
                {
                    page18_rdo_CombustionAppliances_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////

                string CombustionHeatAppliances = Convert.ToString(dt.Rows[0]["CombustionHeatAppliances"]);
                if (CombustionHeatAppliances == "Y")
                {
                    page18_rdo_UnventedCombustionHeatingApp_Y.Checked = true;
                }
                else if (CombustionHeatAppliances == "N")
                {
                    page18_rdo_UnventedCombustionHeatingApp_N.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////

                page18_txt_Co_WaterHeater_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOInitialAMB"]);
                page18_txt_Co_WaterHeater_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOInitialCAZ"]);
                page18_txt_After_WaterHeater_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOAfterAMB"]);
                page18_txt_After_WaterHeater_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOAfterCAZ"]);
                page18_txt_GasLeak_WaterHeater.Text = Convert.ToString(dt.Rows[0]["WaterHeaterGasLeak"]);
                page18_txt_Flame_WaterHeater.Text = Convert.ToString(dt.Rows[0]["WaterHeaterFlameRollout"]);
                page18_txt_Spillage_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageWC"]);
                page18_txt_Spillage_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageNAT"]);
                page18_txt_SpillageAfter_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageAfterWC"]);
                page18_txt_SpillageAfter_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageAfterNAT"]);
                page18_txt_DraftPress_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPressureWC"]);
                page18_txt_DraftPress_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPressureNAT"]);
                page18_txt_DraftPass_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassWC"]);
                page18_txt_DraftPass_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassNAT"]);
                page18_txt_CoFuel_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOFlueWC"]);
                page18_txt_CoFuel_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOFlueNAT"]);
                page18_txt_CoPass_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOPassWC"]);
                page18_txt_CoPass_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOPassNAT"]);
                page18_txt_Optional_WaterHeater_StackTemp.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalStackTemp"]);
                page18_txt_Optional_WaterHeater_O2.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalO2"]);
                page18_txt_Optional_WaterHeater_Eff.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalEff"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////////

                page18_txt_Co_FurnaceBoil_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOInitialAMB"]);
                page18_txt_Co_FurnaceBoil_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOInitialCAZ"]);
                page18_txt_CoAfter_FurnaceBoil_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOAfterWC"]);
                page18_txt_CoAfter_FurnaceBoil_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOAfterNAT"]);
                page18_txt_GasLeak_FurnaceBoil.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerGasLeak"]);
                page18_txt_Flame_FurnaceBoil.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerFlameRollout"]);
                page18_txt_Spillage_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageWC"]);
                page18_txt_Spillage_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageNAT"]);
                page18_txt_SpillageAfter_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageAfterWC"]);
                page18_txt_SpillageAfter_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageAfterNAT"]);
                page18_txt_DraftPress_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPressureWC"]);
                page18_txt_DraftPress_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPressureNAT"]);
                page18_txt_DraftPass_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassWC"]);
                page18_txt_DraftPass_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassNAT"]);
                page18_txt_CoFuel_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOFlueWC"]);
                page18_txt_CoFuel_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOFlueNAT"]);
                page18_txt_CoPass_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOPassWC"]);
                page18_txt_CoPass_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOPassNAT"]);
                page18_txt_Optional_FurnaceBoil_Stack.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalStackTemp"]);
                page18_txt_Optional_FurnaceBoil_O2.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalO2"]);
                page18_txt_Optional_FurnaceBoil_Eff.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalEff"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////


                page18_txt_Co_GasRange_AMB.Text = Convert.ToString(dt.Rows[0]["GasRangeCOInitialAMB"]);
                page18_txt_Co_GasRange_CAZ.Text = Convert.ToString(dt.Rows[0]["GasRangeCOInitialCAZ"]);
                page18_txt_CoAfter_GasRange_AMB.Text = Convert.ToString(dt.Rows[0]["GasRangeCOAfterWC"]);
                page18_txt_CoAfter_GasRange_CAZ.Text = Convert.ToString(dt.Rows[0]["GasRangeCOAfterCAZ"]);
                page18_txt_GasLeak_GasRange.Text = Convert.ToString(dt.Rows[0]["GasRangeGasLeak"]);
                page18_txt_Flame_GasRange.Text = Convert.ToString(dt.Rows[0]["GasRangeFlameRollout"]);
                page18_txt_Spillage_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageWC"]);
                page18_txt_Spillage_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageNAT"]);
                page18_txt_SpillageAfter_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageAfterWC"]);
                page18_txt_SpillageAfter_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageAfterNAT"]);
                page18_txt_DraftPress_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPressureWC"]);
                page18_txt_DraftPress_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPressureNAT"]);
                page18_txt_DraftPass_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPassWC"]);
                page18_txt_DraftPass_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPassNAT"]);
                page18_txt_CoFuel_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeCOFlueWC"]);
                page18_txt_CoFuel_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeCOFlueNAT"]);
                page18_txt_CoPass_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeCOPassWC"]);
                page18_txt_CoPass_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeCOPassNAT"]);
                page18_txt_Optional_GasRange_Stack.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalStackTemp"]);
                page18_txt_Optional_GasRange_O2.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalO2"]);
                page18_txt_Optional_GasRange_Eff.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalEff"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page18_txt_Co_Other_AMB.Text = Convert.ToString(dt.Rows[0]["OtherCOInitialAMB"]);
                page18_txt_Co_Other_CAZ.Text = Convert.ToString(dt.Rows[0]["OtherCOInitialCAZ"]);
                page18_txt_CoAfter_Other_AMB.Text = Convert.ToString(dt.Rows[0]["OtherCOAfterAMB"]);
                page18_txt_CoAfter_Other_CAZ.Text = Convert.ToString(dt.Rows[0]["OtherCOAfterCAZ"]);
                page18_txt_GasLeak_Other.Text = Convert.ToString(dt.Rows[0]["OtherGasLeak"]);
                page18_txt_Flame_Other.Text = Convert.ToString(dt.Rows[0]["OtherFlameRollout"]);
                page18_txt_Spillage_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherSpillageWC"]);
                page18_txt_Spillage_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherSpillageNAT"]);
                page18_txt_SpillageAfter_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherSpillageAfterWC"]);
                page18_txt_SpillageAfter_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherSpillageAfterNAT"]);
                page18_txt_DraftPress_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherDraftPressureWC"]);
                page18_txt_DraftPress_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherDraftPressureNAT"]);
                page18_txt_DraftPass_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherDraftPassWC"]);
                page18_txt_DraftPass_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherDraftPassNAT"]);
                page18_txt_CoFuel_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherCoFlueWC"]);
                page18_txt_CoFuel_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherCoFlueNAT"]);
                page18_txt_CoPass_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherCoPassWC"]);
                page18_txt_CoPass_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherCoPassNAT"]);
                page18_txt_Optional_Other_Stack.Text = Convert.ToString(dt.Rows[0]["OtherOptionalStackTemp"]);
                page18_txt_Optional_Other_O2.Text = Convert.ToString(dt.Rows[0]["OtherOptionalO2"]);
                page18_txt_Optional_Other_Eff.Text = Convert.ToString(dt.Rows[0]["OtherOptionalEff"]);


                /////////////////////////////////////////////////////////////////////////////////////


                page18_txt_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1"]);
                page18_txt_Co_Col1Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COInitialAMB"]);
                page18_txt_Co_Col1Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COInitialCAZ"]);
                page18_txt_CoAfter_Col1Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COAfterlAMB"]);
                page18_txt_CoAfter_Col1Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COAfterCAZ"]);
                page18_txt_GasLeak_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1_GasLeak"]);
                page18_txt_Flame_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1_FlameRollout"]);
                page18_txt_Spillage_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageWC"]);
                page18_txt_Spillage_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageNAT"]);
                page18_txt_SpillageAfter_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageAfterWC"]);
                page18_txt_SpillageAfter_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageAfterNAT"]);
                page18_txt_DraftPress_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPressureWC"]);
                page18_txt_DraftPress_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPressureNAT"]);
                page18_txt_DraftPass_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPassWC"]);
                page18_txt_DraftPass_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPassNAT"]);
                page18_txt_CoFuel_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoFlueWC"]);
                page18_txt_CoFuel_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoFlueNAT"]);
                page18_txt_CoPass_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoPassWC"]);
                page18_txt_CoPass_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoPassNAT"]);
                page18_txt_Optional_Col1Cat_Stack.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalStackTemp"]);
                page18_txt_Optional_Col1Cat_O2.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalO2"]);
                page18_txt_Optional_Col1Cat_Eff.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalEff"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////


                page18_txt_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2"]);
                page18_txt_Co_Col2Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COInitialAMB"]);
                page18_txt_Co_Col2Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COInitialCAZ"]);
                page18_txt_CoAfter_Col2Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COAfterAMB"]);
                page18_txt_CoAfter_Col2Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COAfterCAZ"]);
                page18_txt_GasLeak_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2_GasLeak"]);
                page18_txt_Flame_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2_FlameRollout"]);
                page18_txt_Spillage_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageWC"]);
                page18_txt_Spillage_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageNAT"]);
                page18_txt_SpillageAfter_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageAfterWC"]);
                page18_txt_SpillageAfter_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageAfterNAT"]);
                page18_txt_DraftPress_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPressureWC"]);
                page18_txt_DraftPress_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPressureNAT"]);
                page18_txt_DraftPass_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPassWC"]);
                page18_txt_DraftPass_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPassNAT"]);
                page18_txt_CoFuel_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoFlueWC"]);
                page18_txt_CoFuel_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoFlueNAT"]);
                page18_txt_CoPass_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoPassWC"]);
                page18_txt_CoPass_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoPassNAT"]);
                page18_txt_Optional_Col2Cat_Stack.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalStackTemp"]);
                page18_txt_Optional_Col2Cat_O2.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalO2"]);
                page18_txt_Optional_Col2Cat_Eff.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalEff"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////


                page18_txt_COAmbient.Text = Convert.ToString(dt.Rows[0]["OvenCOAmbient"]);
                page18_txt_CO_Oven_Vent.Text = Convert.ToString(dt.Rows[0]["OvenCOAt"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page18_txt_CoNotes1.Text = Convert.ToString(dt.Rows[0]["BlankCenter_1"]);
                page18_txt_CoNotes2.Text = Convert.ToString(dt.Rows[0]["BlankCenter_2"]);
                page18_txt_CoNotes3.Text = Convert.ToString(dt.Rows[0]["BlankCenter_3"]);
                page18_txt_CoNotes4.Text = Convert.ToString(dt.Rows[0]["BlankCenter_4"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page18_txt_CoNotes.Text = Convert.ToString(dt.Rows[0]["Notes"]);

                /////////////////////////////////////////////////////////////////////////////////////////////


                page18_txt_OutdoorTemperature.Text = Convert.ToString(dt.Rows[0]["OutdoorTemperature"]);

                //////////////////////////////////////////////////////////////////////////////////////////////


                page18_txt_CAZDepressurization_Natural.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseNatural"]);
                page18_txt_CAZDepressurization_WC.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseWC"]);
                page18_txt_CAZDepressurization_Diff.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseDiff"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string SelectAppliancesCheckbox_Dryer = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Dryer"]);
                if (SelectAppliancesCheckbox_Dryer == "Y")
                {
                    page18_chk_Appliances_WorstCase_Dryer.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_WHF = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_WHF"]);
                if (SelectAppliancesCheckbox_WHF == "Y")
                {
                    page18_chk_Appliances_WorstCase_WholeHouseFan.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_Bath = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Bath"]);
                if (SelectAppliancesCheckbox_Bath == "Y")
                {
                    page18_chk_Appliances_WorstCase_BathFan.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_HVAC = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_HVAC"]);
                if (SelectAppliancesCheckbox_HVAC == "Y")
                {
                    page18_chk_Appliances_WorstCase_HVACAirHandler.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_KF = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_KF"]);
                if (SelectAppliancesCheckbox_KF == "Y")
                {
                    page18_chk_Appliances_WorstCase_KitchenFan.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_AtticFan = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_AtticFan"]);
                if (SelectAppliancesCheckbox_AtticFan == "Y")
                {
                    page18_chk_Appliances_WorstCase_AtticFan.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_Other = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Other"]);
                if (SelectAppliancesCheckbox_Other == "Y")
                {
                    page18_chk_Appliances_WorstCase_Other.Checked = true;
                    page18_txt_Appliances_WorstCase_Other.Text = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Othertext"]);
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string PassRadiobtn = Convert.ToString(dt.Rows[0]["PassRadiobtn"]);
                if (PassRadiobtn == "Y")
                {
                    page18_rdo_CAZPass_Yes.Checked = true;
                }
                else if (PassRadiobtn == "N")
                {
                    page18_rdo_CAZPass_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string EmergencySituationCheckBox = Convert.ToString(dt.Rows[0]["EmergencySituationCheckBox"]);
                if (EmergencySituationCheckBox == "Y")
                {
                    page18_chk_Emergency_GasCompanyCalled.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string WorkCheckbox = Convert.ToString(dt.Rows[0]["WorkCheckbox"]);
                if (WorkCheckbox == "Y")
                {
                    page18_chk_WorkCannot_MoreFailedTests.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page18_txt_FinalNotes.Text = Convert.ToString(dt.Rows[0]["BottomNotes"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            }

        }
        catch
        {

        }

    }
    #endregion

    # region form19
    public void fill_form19()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_19(JobNum);
            if (dt.Rows.Count > 0)
            {
                string PrePostWorkTesting = Convert.ToString(dt.Rows[0]["PrePostWorkTesting"]);
                if (PrePostWorkTesting == "Pre")
                {
                    page19_rdo_PreTest.Checked = true;
                }
                else if (PrePostWorkTesting == "Post")
                {
                    page19_rdo_PostTest.Checked = true;
                }




                string AuditorCrewWorkTesting = Convert.ToString(dt.Rows[0]["AuditorCrewWorkTesting"]);
                if (AuditorCrewWorkTesting == "A")
                {
                    page19_rdo_Auditor.Checked = true;
                }
                else if (AuditorCrewWorkTesting == "C")
                {
                    page19_rdo_Crew.Checked = true;
                    page19_txt_Crew.Text = Convert.ToString(dt.Rows[0]["PrePostWorkTestingComment"]);
                }


                //////////////////////////////////////////////////////////////////////////////////

                page19_txt_TechName.Text = Convert.ToString(dt.Rows[0]["TechName"]);
                page19_txt_TestDate.Text = Convert.ToString(dt.Rows[0]["TestDate"]);
                txt_Note1_19.Text = Convert.ToString(dt.Rows[0]["Note1_19"]);

                /////////////////////////////////////////////////////////////////////////////////

                string CombustionSafetyTestingCombustionAppliances = Convert.ToString(dt.Rows[0]["CombustionSafetyTestingCombustionAppliances"]);
                if (CombustionSafetyTestingCombustionAppliances == "Y")
                {
                    page19_rdo_CombustionAppliances_Yes.Checked = true;
                }
                else if (CombustionSafetyTestingCombustionAppliances == "N")
                {
                    page19_rdo_CombustionAppliances_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////

                string CombustionHeatAppliances = Convert.ToString(dt.Rows[0]["CombustionHeatAppliances"]);
                if (CombustionHeatAppliances == "Y")
                {
                    page19_rdo_UnventedCombustionHeatingApp_Y.Checked = true;
                }
                else if (CombustionHeatAppliances == "N")
                {
                    page19_rdo_UnventedCombustionHeatingApp_N.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////

                page19_txt_Co_WaterHeater_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOInitialAMB"]);
                page19_txt_Co_WaterHeater_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOInitialCAZ"]);
                page19_txt_After_WaterHeater_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOAfterAMB"]);
                page19_txt_After_WaterHeater_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOAfterCAZ"]);
                page19_txt_GasLeak_WaterHeater.Text = Convert.ToString(dt.Rows[0]["WaterHeaterGasLeak"]);
                page19_txt_Flame_WaterHeater.Text = Convert.ToString(dt.Rows[0]["WaterHeaterFlameRollout"]);
                page19_txt_Spillage_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageWC"]);
                page19_txt_Spillage_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageNAT"]);
                page19_txt_SpillageAfter_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageAfterWC"]);
                page19_txt_SpillageAfter_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageAfterNAT"]);
                page19_txt_DraftPress_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPressureWC"]);
                page19_txt_DraftPress_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPressureNAT"]);
                page19_txt_DraftPass_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassWC"]);
                page19_txt_DraftPass_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassNAT"]);
                page19_txt_CoFuel_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOFlueWC"]);
                page19_txt_CoFuel_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOFlueNAT"]);
                page19_txt_CoPass_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOPassWC"]);
                page19_txt_CoPass_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOPassNAT"]);
                page19_txt_Optional_WaterHeater_StackTemp.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalStackTemp"]);
                page19_txt_Optional_WaterHeater_O2.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalO2"]);
                page19_txt_Optional_WaterHeater_Eff.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalEff"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////////

                page19_txt_Co_FurnaceBoil_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOInitialAMB"]);
                page19_txt_Co_FurnaceBoil_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOInitialCAZ"]);
                page19_txt_CoAfter_FurnaceBoil_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOAfterWC"]);
                page19_txt_CoAfter_FurnaceBoil_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOAfterNAT"]);
                page19_txt_GasLeak_FurnaceBoil.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerGasLeak"]);
                page19_txt_Flame_FurnaceBoil.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerFlameRollout"]);
                page19_txt_Spillage_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageWC"]);
                page19_txt_Spillage_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageNAT"]);
                page19_txt_SpillageAfter_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageAfterWC"]);
                page19_txt_SpillageAfter_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageAfterNAT"]);
                page19_txt_DraftPress_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPressureWC"]);
                page19_txt_DraftPress_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPressureNAT"]);
                page19_txt_DraftPass_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassWC"]);
                page19_txt_DraftPass_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassNAT"]);
                page19_txt_CoFuel_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOFlueWC"]);
                page19_txt_CoFuel_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOFlueNAT"]);
                page19_txt_CoPass_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOPassWC"]);
                page19_txt_CoPass_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOPassNAT"]);
                page19_txt_Optional_FurnaceBoil_Stack.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalStackTemp"]);
                page19_txt_Optional_FurnaceBoil_O2.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalO2"]);
                page19_txt_Optional_FurnaceBoil_Eff.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalEff"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////


                page19_txt_Co_GasRange_AMB.Text = Convert.ToString(dt.Rows[0]["GasRangeCOInitialAMB"]);
                page19_txt_Co_GasRange_CAZ.Text = Convert.ToString(dt.Rows[0]["GasRangeCOInitialCAZ"]);
                page19_txt_CoAfter_GasRange_AMB.Text = Convert.ToString(dt.Rows[0]["GasRangeCOAfterWC"]);
                page19_txt_CoAfter_GasRange_CAZ.Text = Convert.ToString(dt.Rows[0]["GasRangeCOAfterCAZ"]);
                page19_txt_GasLeak_GasRange.Text = Convert.ToString(dt.Rows[0]["GasRangeGasLeak"]);
                page19_txt_Flame_GasRange.Text = Convert.ToString(dt.Rows[0]["GasRangeFlameRollout"]);
                page19_txt_Spillage_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageWC"]);
                page19_txt_Spillage_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageNAT"]);
                page19_txt_SpillageAfter_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageAfterWC"]);
                page19_txt_SpillageAfter_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageAfterNAT"]);
                page19_txt_DraftPress_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPressureWC"]);
                page19_txt_DraftPress_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPressureNAT"]);
                page19_txt_DraftPass_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPassWC"]);
                page19_txt_DraftPass_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPassNAT"]);
                page19_txt_CoFuel_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeCOFlueWC"]);
                page19_txt_CoFuel_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeCOFlueNAT"]);
                page19_txt_CoPass_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeCOPassWC"]);
                page19_txt_CoPass_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeCOPassNAT"]);
                page19_txt_Optional_GasRange_Stack.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalStackTemp"]);
                page19_txt_Optional_GasRange_O2.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalO2"]);
                page19_txt_Optional_GasRange_Eff.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalEff"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page19_txt_Co_Other_AMB.Text = Convert.ToString(dt.Rows[0]["OtherCOInitialAMB"]);
                page19_txt_Co_Other_CAZ.Text = Convert.ToString(dt.Rows[0]["OtherCOInitialCAZ"]);
                page19_txt_CoAfter_Other_AMB.Text = Convert.ToString(dt.Rows[0]["OtherCOAfterAMB"]);
                page19_txt_CoAfter_Other_CAZ.Text = Convert.ToString(dt.Rows[0]["OtherCOAfterCAZ"]);
                page19_txt_GasLeak_Other.Text = Convert.ToString(dt.Rows[0]["OtherGasLeak"]);
                page19_txt_Flame_Other.Text = Convert.ToString(dt.Rows[0]["OtherFlameRollout"]);
                page19_txt_Spillage_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherSpillageWC"]);
                page19_txt_Spillage_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherSpillageNAT"]);
                page19_txt_SpillageAfter_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherSpillageAfterWC"]);
                page19_txt_SpillageAfter_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherSpillageAfterNAT"]);
                page19_txt_DraftPress_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherDraftPressureWC"]);
                page19_txt_DraftPress_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherDraftPressureNAT"]);
                page19_txt_DraftPass_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherDraftPassWC"]);
                page19_txt_DraftPass_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherDraftPassNAT"]);
                page19_txt_CoFuel_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherCoFlueWC"]);
                page19_txt_CoFuel_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherCoFlueNAT"]);
                page19_txt_CoPass_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherCoPassWC"]);
                page19_txt_CoPass_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherCoPassNAT"]);
                page19_txt_Optional_Other_Stack.Text = Convert.ToString(dt.Rows[0]["OtherOptionalStackTemp"]);
                page19_txt_Optional_Other_O2.Text = Convert.ToString(dt.Rows[0]["OtherOptionalO2"]);
                page19_txt_Optional_Other_Eff.Text = Convert.ToString(dt.Rows[0]["OtherOptionalEff"]);


                /////////////////////////////////////////////////////////////////////////////////////


                page19_txt_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1"]);
                page19_txt_Co_Col1Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COInitialAMB"]);
                page19_txt_Co_Col1Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COInitialCAZ"]);
                page19_txt_CoAfter_Col1Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COAfterlAMB"]);
                page19_txt_CoAfter_Col1Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COAfterCAZ"]);
                page19_txt_GasLeak_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1_GasLeak"]);
                page19_txt_Flame_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1_FlameRollout"]);
                page19_txt_Spillage_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageWC"]);
                page19_txt_Spillage_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageNAT"]);
                page19_txt_SpillageAfter_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageAfterWC"]);
                page19_txt_SpillageAfter_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageAfterNAT"]);
                page19_txt_DraftPress_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPressureWC"]);
                page19_txt_DraftPress_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPressureNAT"]);
                page19_txt_DraftPass_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPassWC"]);
                page19_txt_DraftPass_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPassNAT"]);
                page19_txt_CoFuel_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoFlueWC"]);
                page19_txt_CoFuel_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoFlueNAT"]);
                page19_txt_CoPass_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoPassWC"]);
                page19_txt_CoPass_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoPassNAT"]);
                page19_txt_Optional_Col1Cat_Stack.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalStackTemp"]);
                page19_txt_Optional_Col1Cat_O2.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalO2"]);
                page19_txt_Optional_Col1Cat_Eff.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalEff"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////


                page19_txt_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2"]);
                page19_txt_Co_Col2Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COInitialAMB"]);
                page19_txt_Co_Col2Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COInitialCAZ"]);
                page19_txt_CoAfter_Col2Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COAfterAMB"]);
                page19_txt_CoAfter_Col2Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COAfterCAZ"]);
                page19_txt_GasLeak_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2_GasLeak"]);
                page19_txt_Flame_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2_FlameRollout"]);
                page19_txt_Spillage_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageWC"]);
                page19_txt_Spillage_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageNAT"]);
                page19_txt_SpillageAfter_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageAfterWC"]);
                page19_txt_SpillageAfter_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageAfterNAT"]);
                page19_txt_DraftPress_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPressureWC"]);
                page19_txt_DraftPress_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPressureNAT"]);
                page19_txt_DraftPass_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPassWC"]);
                page19_txt_DraftPass_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPassNAT"]);
                page19_txt_CoFuel_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoFlueWC"]);
                page19_txt_CoFuel_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoFlueNAT"]);
                page19_txt_CoPass_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoPassWC"]);
                page19_txt_CoPass_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoPassNAT"]);
                page19_txt_Optional_Col2Cat_Stack.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalStackTemp"]);
                page19_txt_Optional_Col2Cat_O2.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalO2"]);
                page19_txt_Optional_Col2Cat_Eff.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalEff"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////


                page19_txt_COAmbient.Text = Convert.ToString(dt.Rows[0]["OvenCOAmbient"]);
                page19_txt_CO_Oven_Vent.Text = Convert.ToString(dt.Rows[0]["OvenCOAt"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page19_txt_CoNotes1.Text = Convert.ToString(dt.Rows[0]["BlankCenter_1"]);
                page19_txt_CoNotes2.Text = Convert.ToString(dt.Rows[0]["BlankCenter_2"]);
                page19_txt_CoNotes3.Text = Convert.ToString(dt.Rows[0]["BlankCenter_3"]);
                page19_txt_CoNotes4.Text = Convert.ToString(dt.Rows[0]["BlankCenter_4"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page19_txt_CoNotes.Text = Convert.ToString(dt.Rows[0]["Notes"]);

                /////////////////////////////////////////////////////////////////////////////////////////////


                page19_txt_OutdoorTemperature.Text = Convert.ToString(dt.Rows[0]["OutdoorTemperature"]);

                //////////////////////////////////////////////////////////////////////////////////////////////


                page19_txt_CAZDepressurization_Natural.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseNatural"]);
                page19_txt_CAZDepressurization_WC.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseWC"]);
                page19_txt_CAZDepressurization_Diff.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseDiff"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string SelectAppliancesCheckbox_Dryer = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Dryer"]);
                if (SelectAppliancesCheckbox_Dryer == "Y")
                {
                    page19_chk_Appliances_WorstCase_Dryer.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_WHF = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_WHF"]);
                if (SelectAppliancesCheckbox_WHF == "Y")
                {
                    page19_chk_Appliances_WorstCase_WholeHouseFan.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_Bath = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Bath"]);
                if (SelectAppliancesCheckbox_Bath == "Y")
                {
                    page19_chk_Appliances_WorstCase_BathFan.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_HVAC = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_HVAC"]);
                if (SelectAppliancesCheckbox_HVAC == "Y")
                {
                    page19_chk_Appliances_WorstCase_HVACAirHandler.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_KF = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_KF"]);
                if (SelectAppliancesCheckbox_KF == "Y")
                {
                    page19_chk_Appliances_WorstCase_KitchenFan.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_AtticFan = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_AtticFan"]);
                if (SelectAppliancesCheckbox_AtticFan == "Y")
                {
                    page19_chk_Appliances_WorstCase_AtticFan.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_Other = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Other"]);
                if (SelectAppliancesCheckbox_Other == "Y")
                {
                    page19_chk_Appliances_WorstCase_Other.Checked = true;
                    page19_txt_Appliances_WorstCase_Other.Text = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Othertext"]);
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string PassRadiobtn = Convert.ToString(dt.Rows[0]["PassRadiobtn"]);
                if (PassRadiobtn == "Y")
                {
                    page19_rdo_CAZPass_Yes.Checked = true;
                }
                else if (PassRadiobtn == "N")
                {
                    page19_rdo_CAZPass_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string EmergencySituationCheckBox = Convert.ToString(dt.Rows[0]["EmergencySituationCheckBox"]);
                if (EmergencySituationCheckBox == "Y")
                {
                    page19_chk_Emergency_GasCompanyCalled.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string WorkCheckbox = Convert.ToString(dt.Rows[0]["WorkCheckbox"]);
                if (WorkCheckbox == "Y")
                {
                    page19_chk_WorkCannot_MoreFailedTests.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page19_txt_FinalNotes.Text = Convert.ToString(dt.Rows[0]["BottomNotes"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            }

        }
        catch
        {

        }

    }
    #endregion

    # region form20
    public void fill_form20()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_20(JobNum);
            if (dt.Rows.Count > 0)
            {
                string PrePostWorkTesting = Convert.ToString(dt.Rows[0]["PrePostWorkTesting"]);
                if (PrePostWorkTesting == "Pre")
                {
                    page20_rdo_PreTest.Checked = true;
                }
                else if (PrePostWorkTesting == "Post")
                {
                    page20_rdo_PostTest.Checked = true;
                }



                string AuditorCrewWorkTesting = Convert.ToString(dt.Rows[0]["AuditorCrewWorkTesting"]);
                if (AuditorCrewWorkTesting == "A")
                {
                    page20_rdo_Auditor.Checked = true;
                }
                else if (AuditorCrewWorkTesting == "C")
                {
                    page20_rdo_Crew.Checked = true;
                    page20_txt_Crew.Text = Convert.ToString(dt.Rows[0]["PrePostWorkTestingComment"]);
                }


                //////////////////////////////////////////////////////////////////////////////////

                page20_txt_TechName.Text = Convert.ToString(dt.Rows[0]["TechName"]);
                page20_txt_TestDate.Text = Convert.ToString(dt.Rows[0]["TestDate"]);
                txt_Note1_20.Text = Convert.ToString(dt.Rows[0]["Note1_20"]);

                /////////////////////////////////////////////////////////////////////////////////

                string CombustionSafetyTestingCombustionAppliances = Convert.ToString(dt.Rows[0]["CombustionSafetyTestingCombustionAppliances"]);
                if (CombustionSafetyTestingCombustionAppliances == "Y")
                {
                    page20_rdo_CombustionAppliances_Yes.Checked = true;
                }
                else if (CombustionSafetyTestingCombustionAppliances == "N")
                {
                    page20_rdo_CombustionAppliances_No.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////

                string CombustionHeatAppliances = Convert.ToString(dt.Rows[0]["CombustionHeatAppliances"]);
                if (CombustionHeatAppliances == "Y")
                {
                    page20_rdo_UnventedCombustionHeatingApp_Y.Checked = true;
                }
                else if (CombustionHeatAppliances == "N")
                {
                    page20_rdo_UnventedCombustionHeatingApp_N.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////

                page20_txt_Co_WaterHeater_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOInitialAMB"]);
                page20_txt_Co_WaterHeater_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOInitialCAZ"]);
                page20_txt_After_WaterHeater_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOAfterAMB"]);
                page20_txt_After_WaterHeater_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOAfterCAZ"]);
                page20_txt_GasLeak_WaterHeater.Text = Convert.ToString(dt.Rows[0]["WaterHeaterGasLeak"]);
                page20_txt_Flame_WaterHeater.Text = Convert.ToString(dt.Rows[0]["WaterHeaterFlameRollout"]);
                page20_txt_Spillage_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageWC"]);
                page20_txt_Spillage_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageNAT"]);
                page20_txt_SpillageAfter_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageAfterWC"]);
                page20_txt_SpillageAfter_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterSpillageAfterNAT"]);
                page20_txt_DraftPress_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPressureWC"]);
                page20_txt_DraftPress_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPressureNAT"]);
                page20_txt_DraftPass_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassWC"]);
                page20_txt_DraftPass_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassNAT"]);
                page20_txt_CoFuel_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOFlueWC"]);
                page20_txt_CoFuel_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOFlueNAT"]);
                page20_txt_CoPass_WaterHeater_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOPassWC"]);
                page20_txt_CoPass_WaterHeater_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCOPassNAT"]);
                page20_txt_Optional_WaterHeater_StackTemp.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalStackTemp"]);
                page20_txt_Optional_WaterHeater_O2.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalO2"]);
                page20_txt_Optional_WaterHeater_Eff.Text = Convert.ToString(dt.Rows[0]["WaterHeaterOptionalEff"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////////////

                page20_txt_Co_FurnaceBoil_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOInitialAMB"]);
                page20_txt_Co_FurnaceBoil_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOInitialCAZ"]);
                page20_txt_CoAfter_FurnaceBoil_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOAfterWC"]);
                page20_txt_CoAfter_FurnaceBoil_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOAfterNAT"]);
                page20_txt_GasLeak_FurnaceBoil.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerGasLeak"]);
                page20_txt_Flame_FurnaceBoil.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerFlameRollout"]);
                page20_txt_Spillage_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageWC"]);
                page20_txt_Spillage_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageNAT"]);
                page20_txt_SpillageAfter_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageAfterWC"]);
                page20_txt_SpillageAfter_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerSpillageAfterNAT"]);
                page20_txt_DraftPress_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPressureWC"]);
                page20_txt_DraftPress_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPressureNAT"]);
                page20_txt_DraftPass_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassWC"]);
                page20_txt_DraftPass_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassNAT"]);
                page20_txt_CoFuel_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOFlueWC"]);
                page20_txt_CoFuel_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOFlueNAT"]);
                page20_txt_CoPass_FurnaceBoil_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOPassWC"]);
                page20_txt_CoPass_FurnaceBoil_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCOPassNAT"]);
                page20_txt_Optional_FurnaceBoil_Stack.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalStackTemp"]);
                page20_txt_Optional_FurnaceBoil_O2.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalO2"]);
                page20_txt_Optional_FurnaceBoil_Eff.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerOptionalEff"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////


                page20_txt_Co_GasRange_AMB.Text = Convert.ToString(dt.Rows[0]["GasRangeCOInitialAMB"]);
                page20_txt_Co_GasRange_CAZ.Text = Convert.ToString(dt.Rows[0]["GasRangeCOInitialCAZ"]);
                page20_txt_CoAfter_GasRange_AMB.Text = Convert.ToString(dt.Rows[0]["GasRangeCOAfterWC"]);
                page20_txt_CoAfter_GasRange_CAZ.Text = Convert.ToString(dt.Rows[0]["GasRangeCOAfterCAZ"]);
                page20_txt_GasLeak_GasRange.Text = Convert.ToString(dt.Rows[0]["GasRangeGasLeak"]);
                page20_txt_Flame_GasRange.Text = Convert.ToString(dt.Rows[0]["GasRangeFlameRollout"]);
                page20_txt_Spillage_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageWC"]);
                page20_txt_Spillage_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageNAT"]);
                page20_txt_SpillageAfter_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageAfterWC"]);
                page20_txt_SpillageAfter_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeSpillageAfterNAT"]);
                page20_txt_DraftPress_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPressureWC"]);
                page20_txt_DraftPress_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPressureNAT"]);
                page20_txt_DraftPass_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPassWC"]);
                page20_txt_DraftPass_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeDraftPassNAT"]);
                page20_txt_CoFuel_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeCOFlueWC"]);
                page20_txt_CoFuel_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeCOFlueNAT"]);
                page20_txt_CoPass_GasRange_WC.Text = Convert.ToString(dt.Rows[0]["GasRangeCOPassWC"]);
                page20_txt_CoPass_GasRange_NAT.Text = Convert.ToString(dt.Rows[0]["GasRangeCOPassNAT"]);
                page20_txt_Optional_GasRange_Stack.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalStackTemp"]);
                page20_txt_Optional_GasRange_O2.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalO2"]);
                page20_txt_Optional_GasRange_Eff.Text = Convert.ToString(dt.Rows[0]["GasRangeOptionalEff"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page20_txt_Co_Other_AMB.Text = Convert.ToString(dt.Rows[0]["OtherCOInitialAMB"]);
                page20_txt_Co_Other_CAZ.Text = Convert.ToString(dt.Rows[0]["OtherCOInitialCAZ"]);
                page20_txt_CoAfter_Other_AMB.Text = Convert.ToString(dt.Rows[0]["OtherCOAfterAMB"]);
                page20_txt_CoAfter_Other_CAZ.Text = Convert.ToString(dt.Rows[0]["OtherCOAfterCAZ"]);
                page20_txt_GasLeak_Other.Text = Convert.ToString(dt.Rows[0]["OtherGasLeak"]);
                page20_txt_Flame_Other.Text = Convert.ToString(dt.Rows[0]["OtherFlameRollout"]);
                page20_txt_Spillage_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherSpillageWC"]);
                page20_txt_Spillage_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherSpillageNAT"]);
                page20_txt_SpillageAfter_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherSpillageAfterWC"]);
                page20_txt_SpillageAfter_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherSpillageAfterNAT"]);
                page20_txt_DraftPress_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherDraftPressureWC"]);
                page20_txt_DraftPress_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherDraftPressureNAT"]);
                page20_txt_DraftPass_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherDraftPassWC"]);
                page20_txt_DraftPass_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherDraftPassNAT"]);
                page20_txt_CoFuel_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherCoFlueWC"]);
                page20_txt_CoFuel_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherCoFlueNAT"]);
                page20_txt_CoPass_Other_WC.Text = Convert.ToString(dt.Rows[0]["OtherCoPassWC"]);
                page20_txt_CoPass_Other_NAT.Text = Convert.ToString(dt.Rows[0]["OtherCoPassNAT"]);
                page20_txt_Optional_Other_Stack.Text = Convert.ToString(dt.Rows[0]["OtherOptionalStackTemp"]);
                page20_txt_Optional_Other_O2.Text = Convert.ToString(dt.Rows[0]["OtherOptionalO2"]);
                page20_txt_Optional_Other_Eff.Text = Convert.ToString(dt.Rows[0]["OtherOptionalEff"]);


                /////////////////////////////////////////////////////////////////////////////////////


                page20_txt_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1"]);
                page20_txt_Co_Col1Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COInitialAMB"]);
                page20_txt_Co_Col1Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COInitialCAZ"]);
                page20_txt_CoAfter_Col1Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COAfterlAMB"]);
                page20_txt_CoAfter_Col1Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_1_COAfterCAZ"]);
                page20_txt_GasLeak_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1_GasLeak"]);
                page20_txt_Flame_Col1Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_1_FlameRollout"]);
                page20_txt_Spillage_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageWC"]);
                page20_txt_Spillage_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageNAT"]);
                page20_txt_SpillageAfter_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageAfterWC"]);
                page20_txt_SpillageAfter_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_SpillageAfterNAT"]);
                page20_txt_DraftPress_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPressureWC"]);
                page20_txt_DraftPress_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPressureNAT"]);
                page20_txt_DraftPass_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPassWC"]);
                page20_txt_DraftPass_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_DraftPassNAT"]);
                page20_txt_CoFuel_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoFlueWC"]);
                page20_txt_CoFuel_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoFlueNAT"]);
                page20_txt_CoPass_Col1Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoPassWC"]);
                page20_txt_CoPass_Col1Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_1_CoPassNAT"]);
                page20_txt_Optional_Col1Cat_Stack.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalStackTemp"]);
                page20_txt_Optional_Col1Cat_O2.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalO2"]);
                page20_txt_Optional_Col1Cat_Eff.Text = Convert.ToString(dt.Rows[0]["Appliance_1_OptionalEff"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////


                page20_txt_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2"]);
                page20_txt_Co_Col2Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COInitialAMB"]);
                page20_txt_Co_Col2Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COInitialCAZ"]);
                page20_txt_CoAfter_Col2Cat_AMB.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COAfterAMB"]);
                page20_txt_CoAfter_Col2Cat_CAZ.Text = Convert.ToString(dt.Rows[0]["Appliance_2_COAfterCAZ"]);
                page20_txt_GasLeak_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2_GasLeak"]);
                page20_txt_Flame_Col2Cat.Text = Convert.ToString(dt.Rows[0]["Appliance_2_FlameRollout"]);
                page20_txt_Spillage_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageWC"]);
                page20_txt_Spillage_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageNAT"]);
                page20_txt_SpillageAfter_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageAfterWC"]);
                page20_txt_SpillageAfter_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_SpillageAfterNAT"]);
                page20_txt_DraftPress_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPressureWC"]);
                page20_txt_DraftPress_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPressureNAT"]);
                page20_txt_DraftPass_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPassWC"]);
                page20_txt_DraftPass_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_DraftPassNAT"]);
                page20_txt_CoFuel_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoFlueWC"]);
                page20_txt_CoFuel_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoFlueNAT"]);
                page20_txt_CoPass_Col2Cat_WC.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoPassWC"]);
                page20_txt_CoPass_Col2Cat_NAT.Text = Convert.ToString(dt.Rows[0]["Appliance_2_CoPassNAT"]);
                page20_txt_Optional_Col2Cat_Stack.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalStackTemp"]);
                page20_txt_Optional_Col2Cat_O2.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalO2"]);
                page20_txt_Optional_Col2Cat_Eff.Text = Convert.ToString(dt.Rows[0]["Appliance_2_OptionalEff"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////


                page20_txt_COAmbient.Text = Convert.ToString(dt.Rows[0]["OvenCOAmbient"]);
                page20_txt_CO_Oven_Vent.Text = Convert.ToString(dt.Rows[0]["OvenCOAt"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page20_txt_CoNotes1.Text = Convert.ToString(dt.Rows[0]["BlankCenter_1"]);
                page20_txt_CoNotes2.Text = Convert.ToString(dt.Rows[0]["BlankCenter_2"]);
                page20_txt_CoNotes3.Text = Convert.ToString(dt.Rows[0]["BlankCenter_3"]);
                page20_txt_CoNotes4.Text = Convert.ToString(dt.Rows[0]["BlankCenter_4"]);


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page20_txt_CoNotes.Text = Convert.ToString(dt.Rows[0]["Notes"]);

                /////////////////////////////////////////////////////////////////////////////////////////////


                page20_txt_OutdoorTemperature.Text = Convert.ToString(dt.Rows[0]["OutdoorTemperature"]);

                //////////////////////////////////////////////////////////////////////////////////////////////


                page20_txt_CAZDepressurization_Natural.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseNatural"]);
                page20_txt_CAZDepressurization_WC.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseWC"]);
                page20_txt_CAZDepressurization_Diff.Text = Convert.ToString(dt.Rows[0]["CAZWorseCaseDiff"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////

                string SelectAppliancesCheckbox_Dryer = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Dryer"]);
                if (SelectAppliancesCheckbox_Dryer == "Y")
                {
                    page20_chk_Appliances_WorstCase_Dryer.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_WHF = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_WHF"]);
                if (SelectAppliancesCheckbox_WHF == "Y")
                {
                    page20_chk_Appliances_WorstCase_WholeHouseFan.Checked = true;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_Bath = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Bath"]);
                if (SelectAppliancesCheckbox_Bath == "Y")
                {
                    page20_chk_Appliances_WorstCase_BathFan.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_HVAC = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_HVAC"]);
                if (SelectAppliancesCheckbox_HVAC == "Y")
                {
                    page20_chk_Appliances_WorstCase_HVACAirHandler.Checked = true;
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_KF = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_KF"]);
                if (SelectAppliancesCheckbox_KF == "Y")
                {
                    page20_chk_Appliances_WorstCase_KitchenFan.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_AtticFan = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_AtticFan"]);
                if (SelectAppliancesCheckbox_AtticFan == "Y")
                {
                    page20_chk_Appliances_WorstCase_AtticFan.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string SelectAppliancesCheckbox_Other = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Other"]);
                if (SelectAppliancesCheckbox_Other == "Y")
                {
                    page20_chk_Appliances_WorstCase_Other.Checked = true;
                    page20_txt_Appliances_WorstCase_Other.Text = Convert.ToString(dt.Rows[0]["SelectAppliancesCheckbox_Othertext"]);
                }

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string PassRadiobtn = Convert.ToString(dt.Rows[0]["PassRadiobtn"]);
                if (PassRadiobtn == "Y")
                {
                    page20_rdo_CAZPass_Yes.Checked = true;
                }
                else if (PassRadiobtn == "N")
                {
                    page20_rdo_CAZPass_No.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string EmergencySituationCheckBox = Convert.ToString(dt.Rows[0]["EmergencySituationCheckBox"]);
                if (EmergencySituationCheckBox == "Y")
                {
                    page20_chk_Emergency_GasCompanyCalled.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                string WorkCheckbox = Convert.ToString(dt.Rows[0]["WorkCheckbox"]);
                if (WorkCheckbox == "Y")
                {
                    page20_chk_WorkCannot_MoreFailedTests.Checked = true;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                page20_txt_FinalNotes.Text = Convert.ToString(dt.Rows[0]["BottomNotes"]);

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            }

        }
        catch
        {

        }

    }
    #endregion

    # region form21
    public void fill_form21()
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
                page21_txt_Other_Location.Text = Convert.ToString(dt.Rows[0]["ReplaceOther1Locations"]);
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

                txt21_Comment.Text = Convert.ToString(dt.Rows[0]["Page14Comments"]);


            }
        }
        catch
        { }
    }
    #endregion

    # region form22
    public void fill_form22()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_22(JobNum);
            if (dt.Rows.Count > 0)
            {
                txt_MeasureInstalledLine1.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine1"]);
                txt_MeasureFirstenergyLine1.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine1"]);
                txt_MeaasureSubcontractorLine1.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine1"]);
                txt_MeasureInstalledLine2.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine2"]);
                txt_MeasureFirstenergyLine2.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine2"]);
                txt_MeaasureSubcontractorLine2.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine2"]);
                txt_MeasureInstalledLine3.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine3"]);
                txt_MeasureFirstenergyLine3.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine3"]);
                txt_MeaasureSubcontractorLine3.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine3"]);
                txt_MeasureInstalledLine4.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine4"]);
                txt_MeasureFirstenergyLine4.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine4"]);
                txt_MeaasureSubcontractorLine4.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine4"]);
                txt_MeasureInstalledLine5.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine5"]);
                txt_MeasureFirstenergyLine5.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine5"]);
                txt_MeaasureSubcontractorLine5.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine5"]);
                txt_MeasureInstalledLine6.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine6"]);
                txt_MeasureFirstenergyLine6.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine6"]);
                txt_MeaasureSubcontractorLine6.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine6"]);
                txt_MeasureInstalledLine7.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine7"]);
                txt_MeasureFirstenergyLine7.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine7"]);
                txt_MeaasureSubcontractorLine7.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine7"]);
                txt_MeasureInstalledLine8.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine8"]);
                txt_MeasureFirstenergyLine8.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine8"]);
                txt_MeaasureSubcontractorLine8.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine8"]);
                txt_MeasureInstalledLine9.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine9"]);
                txt_MeasureFirstenergyLine9.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine9"]);
                txt_MeaasureSubcontractorLine9.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine9"]);
                txt_MeasureInstalledLine10.Text = Convert.ToString(dt.Rows[0]["MeasureInstalledLine10"]);
                txt_MeasureFirstenergyLine10.Text = Convert.ToString(dt.Rows[0]["MeasureFirstenergyLine10"]);
                txt_MeaasureSubcontractorLine10.Text = Convert.ToString(dt.Rows[0]["MeaasureSubcontractorLine10"]);
                txt_OtherInsandEvaluators.Text = Convert.ToString(dt.Rows[0]["OtherInsandEvaluators"]);
                txt_MeasuresRefusedLine1.Text = Convert.ToString(dt.Rows[0]["MeasuresRefusedLine1"]);
                txt_CustomerSignDateLine1.Text = Convert.ToString(dt.Rows[0]["CustomerSignDateLine1"]);
                txt_MeasuresRefusedLine2.Text = Convert.ToString(dt.Rows[0]["MeasuresRefusedLine2"]);
                txt_CustomerSignDateLine2.Text = Convert.ToString(dt.Rows[0]["CustomerSignDateLine2"]);
                txt_MeasuresRefusedLine3.Text = Convert.ToString(dt.Rows[0]["MeasuresRefusedLine3"]);
                txt_CustomerSignDateLine3.Text = Convert.ToString(dt.Rows[0]["CustomerSignDateLine3"]);
                txt_MeasuresRefusedLine4.Text = Convert.ToString(dt.Rows[0]["MeasuresRefusedLine4"]);
                txt_CustomerSignDateLine4.Text = Convert.ToString(dt.Rows[0]["CustomerSignDateLine4"]);

                string WarmInvoice = Convert.ToString(dt.Rows[0]["WarmInvoice"]);
                if (WarmInvoice == "Y")
                {
                    Chk_WarmInvoice.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ThisAuditForm = Convert.ToString(dt.Rows[0]["ThisAuditForm"]);
                if (ThisAuditForm == "Y")
                {
                    Chk_ThisAuditForm.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string SeasonalForm = Convert.ToString(dt.Rows[0]["SeasonalForm"]);
                if (SeasonalForm == "Y")
                {
                    Chk_SeasonalForm.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string OurAgreement = Convert.ToString(dt.Rows[0]["OurAgreement"]);
                if (OurAgreement == "Y")
                {
                    Chk_OurAgreement.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string OurStrategy = Convert.ToString(dt.Rows[0]["OurStrategy"]);
                if (OurStrategy == "Y")
                {
                    Chk_OurStrategy.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CustomerKwh = Convert.ToString(dt.Rows[0]["CustomerKwh"]);
                if (CustomerKwh == "Y")
                {
                    Chk_CustomerKwh.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string AccountKWHWebsite = Convert.ToString(dt.Rows[0]["AccountKWHWebsite"]);
                if (AccountKWHWebsite == "Y")
                {
                    Chk_AccountKWHWebsite.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string RT = Convert.ToString(dt.Rows[0]["RT"]);
                if (RT == "Y")
                {
                    Chk_RT.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string RTNA = Convert.ToString(dt.Rows[0]["RTNA"]);
                if (RTNA == "Y")
                {
                    Chk_RTNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ReceiptsInformation = Convert.ToString(dt.Rows[0]["ReceiptsInformation"]);
                if (ReceiptsInformation == "Y")
                {
                    Chk_ReceiptsInformation.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ReceiptsInfoNA = Convert.ToString(dt.Rows[0]["ReceiptsInfoNA"]);
                if (ReceiptsInfoNA == "Y")
                {
                    Chk_ReceiptsInfoNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string PhotoInaccesible = Convert.ToString(dt.Rows[0]["PhotoInaccesible"]);
                if (PhotoInaccesible == "Y")
                {
                    Chk_PhotoInaccesible.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string PhotoInaccesibleNA = Convert.ToString(dt.Rows[0]["PhotoInaccesibleNA"]);
                if (PhotoInaccesibleNA == "Y")
                {
                    Chk_PhotoInaccesibleNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string WeatherizationPresent = Convert.ToString(dt.Rows[0]["WeatherizationPresent"]);
                if (WeatherizationPresent == "Y")
                {
                    Chk_WeatherizationPresent.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string WeatherizationPresentNA = Convert.ToString(dt.Rows[0]["WeatherizationPresentNA"]);
                if (WeatherizationPresentNA == "Y")
                {
                    Chk_WeatherizationPresentNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyAirCustomer = Convert.ToString(dt.Rows[0]["CopyAirCustomer"]);
                if (CopyAirCustomer == "Y")
                {
                    Chk_CopyAirCustomer.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyAirCustomerNA = Convert.ToString(dt.Rows[0]["CopyAirCustomerNA"]);
                if (CopyAirCustomerNA == "Y")
                {
                    Chk_CopyAirCustomerNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyCustomerWorksheet = Convert.ToString(dt.Rows[0]["CopyCustomerWorksheet"]);
                if (CopyCustomerWorksheet == "Y")
                {
                    Chk_CopyCustomerWorksheet.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyCustomerWorksheetNA = Convert.ToString(dt.Rows[0]["CopyCustomerWorksheetNA"]);
                if (CopyCustomerWorksheetNA == "Y")
                {
                    Chk_CopyCustomerWorksheetNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyHSForm = Convert.ToString(dt.Rows[0]["CopyHSForm"]);
                if (CopyHSForm == "Y")
                {
                    Chk_CopyHSForm.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string CopyHSFormNA = Convert.ToString(dt.Rows[0]["CopyHSFormNA"]);
                if (CopyHSFormNA == "Y")
                {
                    Chk_CopyHSFormNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ReferralProgram = Convert.ToString(dt.Rows[0]["ReferralProgram"]);
                if (ReferralProgram == "Y")
                {
                    Chk_ReferralProgram.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ReferralProgramNA = Convert.ToString(dt.Rows[0]["ReferralProgramNA"]);
                if (ReferralProgramNA == "Y")
                {
                    Chk_ReferralProgramNA.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string AccountsWebsite = Convert.ToString(dt.Rows[0]["AccountsWebsite"]);
                if (AccountsWebsite == "Y")
                {
                    Chk_AccountsWebsite.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string HeatContractor = Convert.ToString(dt.Rows[0]["HeatContractor"]);
                if (HeatContractor == "Y")
                {
                    Chk_HeatContractor.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////

                string ACContrator = Convert.ToString(dt.Rows[0]["ACContrator"]);
                if (ACContrator == "Y")
                {
                    Chk_ACContrator.Checked = true;
                }

                //////////////////////////////////////////////////////////////////////////////////////////////////
            }
        }
        catch
        {
        }
    }
    #endregion

    #region "form23"
    public void fill_form23()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            dtPhoto = ObjPPL.SelectPPLPhotoPageTop24_Change(JobNum);

        }
        catch
        {


        }

    }
    #endregion
}
