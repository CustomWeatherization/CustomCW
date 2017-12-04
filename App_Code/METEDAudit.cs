using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// Summary description for METEDAudit
/// </summary>
public class METEDAudit
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());

    public METEDAudit()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region METED Audit Page 1

    public int UpdateMETEDAudit_1(string JobNumber, string WarmOrWarmPlus, string InstalledElectricHeatJob, string ACJob, string EmailAddress, string DefactoHeatJob, string WaterHeatJob, string BaseLoadJob, string UsedDefault, string BaseLoadKWH, string AuditorName, string WinterSeasonalKWH, string AuditDate, string JobFinishedDate, string SummerSeasonalKWH, string SpendingSeasonalAllowance, string CoordinatedWithStateWeatherization, string StateWeatherizationDollars, string CoordinatedWithGasUtilityProgram, string GasUtilityDollars, string OtherProgram, string OtherProgramDollars, string LandLordName, string LandLordPhoneNumber, string DirectionsLine1, string DirectionsLine2, string DirectionsLine3, string CustomerEnrolled, string EligibilityVerification, string VerifiedBy, string HouseholdIncomeDollar, string DateVerified, string PrimarySource, string PrimarySourceOther, string PersonPresentAudit, string RelationshipToCustomer, string RelationshipToCustomerOther, string CustomerDateOfBirth, string EthnicOrigin, string Occupants, string HomePhone, string CellPhone, string WorkPhone, string HandicappedOccupants, string HouseholdEmploymentStatus, string HouseholdEmploymentStatusOther)
    {
        int i = 0;
        if (AuditorName == "" || AuditorName == "Select")
        {
            AuditorName = "0";
        }
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage1Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@WarmOrWarmPlus", WarmOrWarmPlus);
            cmd.Parameters.AddWithValue("@InstalledElectricHeatJob", InstalledElectricHeatJob);
            cmd.Parameters.AddWithValue("@ACJob", ACJob);
            cmd.Parameters.AddWithValue("@EmailAddress", EmailAddress);
            cmd.Parameters.AddWithValue("@DefactoHeatJob", DefactoHeatJob);
            cmd.Parameters.AddWithValue("@WaterHeatJob", WaterHeatJob);
            cmd.Parameters.AddWithValue("@BaseLoadJob", BaseLoadJob);
            cmd.Parameters.AddWithValue("@UsedDefault", UsedDefault);
            cmd.Parameters.AddWithValue("@BaseLoadKWH", BaseLoadKWH);
            cmd.Parameters.AddWithValue("@AuditorName", AuditorName);
            cmd.Parameters.AddWithValue("@WinterSeasonalKWH", WinterSeasonalKWH);
            cmd.Parameters.AddWithValue("@AuditDate", AuditDate);
            cmd.Parameters.AddWithValue("@JobFinishedDate", JobFinishedDate);
            cmd.Parameters.AddWithValue("@SummerSeasonalKWH", SummerSeasonalKWH);
            cmd.Parameters.AddWithValue("@SpendingSeasonalAllowance", SpendingSeasonalAllowance);
            cmd.Parameters.AddWithValue("@CoordinatedWithStateWeatherization", CoordinatedWithStateWeatherization);
            cmd.Parameters.AddWithValue("@StateWeatherizationDollars", StateWeatherizationDollars);
            cmd.Parameters.AddWithValue("@CoordinatedWithGasUtilityProgram", CoordinatedWithGasUtilityProgram);
            cmd.Parameters.AddWithValue("@GasUtilityDollars", GasUtilityDollars);
            cmd.Parameters.AddWithValue("@OtherProgram", OtherProgram);
            cmd.Parameters.AddWithValue("@OtherProgramDollars", OtherProgramDollars);
            cmd.Parameters.AddWithValue("@LandLordName", LandLordName);
            cmd.Parameters.AddWithValue("@LandLordPhoneNumber", LandLordPhoneNumber);
            cmd.Parameters.AddWithValue("@DirectionsLine1", DirectionsLine1);
            cmd.Parameters.AddWithValue("@DirectionsLine2", DirectionsLine2);
            cmd.Parameters.AddWithValue("@DirectionsLine3", DirectionsLine3);
            cmd.Parameters.AddWithValue("@CustomerEnrolled", CustomerEnrolled);
            cmd.Parameters.AddWithValue("@EligibilityVerification", EligibilityVerification);
            cmd.Parameters.AddWithValue("@VerifiedBy", VerifiedBy);
            cmd.Parameters.AddWithValue("@HouseholdIncomeDollar", HouseholdIncomeDollar);
            cmd.Parameters.AddWithValue("@DateVerified", DateVerified);
            cmd.Parameters.AddWithValue("@PrimarySource", PrimarySource);
            cmd.Parameters.AddWithValue("@PrimarySourceOther", PrimarySourceOther);
            cmd.Parameters.AddWithValue("@PersonPresentAudit", PersonPresentAudit);
            cmd.Parameters.AddWithValue("@RelationshipToCustomer", RelationshipToCustomer);
            cmd.Parameters.AddWithValue("@RelationshipToCustomerOther", RelationshipToCustomerOther);
            cmd.Parameters.AddWithValue("@CustomerDateOfBirth", CustomerDateOfBirth);
            cmd.Parameters.AddWithValue("@EthnicOrigin", EthnicOrigin);
            cmd.Parameters.AddWithValue("@Occupants", Occupants);
            cmd.Parameters.AddWithValue("@HomePhone", HomePhone);
            cmd.Parameters.AddWithValue("@CellPhone", CellPhone);
            cmd.Parameters.AddWithValue("@WorkPhone", WorkPhone);
            cmd.Parameters.AddWithValue("@HandicappedOccupants", HandicappedOccupants);
            cmd.Parameters.AddWithValue("@HouseholdEmploymentStatus", HouseholdEmploymentStatus);
            cmd.Parameters.AddWithValue("@HouseholdEmploymentStatusOther", HouseholdEmploymentStatusOther);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        return i;

    }

    public int UpdateMETEDAudit_14Ver2(string JobNumber, string HomeownerNotforsale, string ElectricUnits, string HeatComing, string WeatherConditions, string ExistingHeat, string ElectricWiring, string HeatingAreas, string SufficientSpace, string AdequateSpace, string RemoteControl, string CleaningInterior, string AuditorBelieve, string AuditDate)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_Audit_14Ver2New";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@HomeownerNotforsale", HomeownerNotforsale);
            cmd.Parameters.AddWithValue("@ElectricUnits", ElectricUnits);
            cmd.Parameters.AddWithValue("@HeatComing", HeatComing);
            cmd.Parameters.AddWithValue("@WeatherConditions", WeatherConditions);
            cmd.Parameters.AddWithValue("@ExistingHeat", ExistingHeat);
            cmd.Parameters.AddWithValue("@ElectricWiring", ElectricWiring);
            cmd.Parameters.AddWithValue("@HeatingAreas", HeatingAreas);
            cmd.Parameters.AddWithValue("@SufficientSpace", SufficientSpace);
            cmd.Parameters.AddWithValue("@AdequateSpace", AdequateSpace);
            cmd.Parameters.AddWithValue("@RemoteControl", RemoteControl);
            cmd.Parameters.AddWithValue("@CleaningInterior", CleaningInterior);
            cmd.Parameters.AddWithValue("@AuditorBelieve", AuditorBelieve);
            cmd.Parameters.AddWithValue("@AuditDate", AuditDate); 

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();

        }
        catch
        {

        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        return i;
    }
    
    public DataTable GetMETEDAudit_14Ver2(string jobNum)
    {
        DataTable dt = new DataTable(jobNum);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_Audit_14Ver2New";
            cmd.Parameters.AddWithValue("@JobNumber", jobNum);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    public DataTable GetMETEDAudit_1(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage1";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion



    #region METED Audit Page 2

    public int UpdateMETEDAudit_2(string JobNumber, string AgesUnder19, string Ages19To62, string AgesOver62, string OccupancyType, string StructureType, string OtherStructureTypeComments, string YearConstructed, string SizeOfElectricallyHeatedArea, string TypeOfAirConditioning, string OtherTypeOfAirConditioning, string NumberOfWindowOrWallACUnits, string NumberRoomsAirConditioned, string SizeOfAreaCooled, string PrimaryHeatingSource, string PrimaryHeatingSourceOther, string HeatingSystem, string HeatingSystemOther, string SupplementalHeat, string SupplementalHeatOther, string MainSupplementalHeat, string MainSupplementalHeatOther, string MainSupplementalHeatLocation, string CustomerDwelling, string WaterHeaterFuelType, string WaterHeaterFuelTypeOther, string DryerType, string Comment, string CunstructionType, string SpaceHeater, string SpaceHeater_Other_Cmmnt)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage2Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@AgesUnder19", AgesUnder19);
            cmd.Parameters.AddWithValue("@Ages19To62", Ages19To62);
            cmd.Parameters.AddWithValue("@AgesOver62", AgesOver62);
            cmd.Parameters.AddWithValue("@OccupancyType", OccupancyType);
            cmd.Parameters.AddWithValue("@StructureType", StructureType);
            cmd.Parameters.AddWithValue("@OtherStructureTypeComments", OtherStructureTypeComments);
            cmd.Parameters.AddWithValue("@YearConstructed", YearConstructed);
            cmd.Parameters.AddWithValue("@SizeOfElectricallyHeatedArea", SizeOfElectricallyHeatedArea);
            cmd.Parameters.AddWithValue("@TypeOfAirConditioning", TypeOfAirConditioning);
            cmd.Parameters.AddWithValue("@OtherTypeOfAirConditioning", OtherTypeOfAirConditioning);
            cmd.Parameters.AddWithValue("@NumberOfWindowOrWallACUnits", NumberOfWindowOrWallACUnits);
            cmd.Parameters.AddWithValue("@NumberRoomsAirConditioned", NumberRoomsAirConditioned);
            cmd.Parameters.AddWithValue("@SizeOfAreaCooled", SizeOfAreaCooled);
            cmd.Parameters.AddWithValue("@PrimaryHeatingSource", PrimaryHeatingSource);
            cmd.Parameters.AddWithValue("@PrimaryHeatingSourceOther", PrimaryHeatingSourceOther);
            cmd.Parameters.AddWithValue("@HeatingSystem", HeatingSystem);
            cmd.Parameters.AddWithValue("@HeatingSystemOther", HeatingSystemOther);
            cmd.Parameters.AddWithValue("@SupplementalHeat", SupplementalHeat);
            cmd.Parameters.AddWithValue("@SupplementalHeatOther", SupplementalHeatOther);
            cmd.Parameters.AddWithValue("@MainSupplementalHeat", MainSupplementalHeat);
            cmd.Parameters.AddWithValue("@MainSupplementalHeatOther", MainSupplementalHeatOther);
            cmd.Parameters.AddWithValue("@MainSupplementalHeatLocation", MainSupplementalHeatLocation);
            cmd.Parameters.AddWithValue("@CustomerDwelling", CustomerDwelling);
            cmd.Parameters.AddWithValue("@WaterHeaterFuelType", WaterHeaterFuelType);
            cmd.Parameters.AddWithValue("@WaterHeaterFuelTypeOther", WaterHeaterFuelTypeOther);
            cmd.Parameters.AddWithValue("@DryerType", DryerType);
            cmd.Parameters.AddWithValue("@Comment", Comment);
            cmd.Parameters.AddWithValue("@CunstructionType", CunstructionType);
            cmd.Parameters.AddWithValue("@SpaceHeater", SpaceHeater);
            cmd.Parameters.AddWithValue("@SpaceHeater_Other_Cmmnt", SpaceHeater_Other_Cmmnt);

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();

        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_2(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage2Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion



    #region METED Audit Page 3

    public int UpdateMETEDAudit_3(string JobNumber,string page, string AreaDifficult, string ApplicationProb, string combustionAppliances, string HighestEnergy, string HealthIssues, string Expalain_HealthIssues1, string Expalain_HealthIssues2, string GeneralComments,string LEDNightLights, string Line1LEDNightLightLocation, string Line2LEDNightLightLocation, string Line3LEDNightLightLocation, string Line4LEDNightLightLocation, string SmartPowerStrip, string Line1SmartPowerStripLocation, string Line2SmartPowerStripLocation, string Line3SmartPowerStripLocation, string Line4SmartPowerStripLocation, string Line1SmartPowerStrip6Outlet, string Line2SmartPowerStrip6Outlet, string Line3SmartPowerStrip6Outlet, string Line4SmartPowerStrip6Outlet, string Line1SmartPowerStrip10Outlet, string Line2SmartPowerStrip10Outlet, string Line3SmartPowerStrip10Outlet, string Line4SmartPowerStrip10Outlet, string COAlarms5YearOld, string TotalNEWAlarmsInstalled, string Line1COAlarmLocation, string Line2COAlarmLocation, string Line3COAlarmLocation, string Line4COAlarmLocation, string Line5COAlarmLocation, string InstalledFurnaceFilter)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage3Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@page", page);
            cmd.Parameters.AddWithValue("@AreaDifficult", AreaDifficult);
            cmd.Parameters.AddWithValue("@ApplicationProb", ApplicationProb);
            cmd.Parameters.AddWithValue("@combustionAppliances", combustionAppliances);
            cmd.Parameters.AddWithValue("@HighestEnergy", HighestEnergy);
            cmd.Parameters.AddWithValue("@HealthIssues", HealthIssues);
            cmd.Parameters.AddWithValue("@Expalain_HealthIssues1", Expalain_HealthIssues1);
            cmd.Parameters.AddWithValue("@Expalain_HealthIssues2", Expalain_HealthIssues2); 
            cmd.Parameters.AddWithValue("@GeneralComments", GeneralComments);

            cmd.Parameters.AddWithValue("@LEDNightLights", LEDNightLights);

            cmd.Parameters.AddWithValue("@Line1LEDNightLightLocation", Line1LEDNightLightLocation);
            cmd.Parameters.AddWithValue("@Line2LEDNightLightLocation", Line2LEDNightLightLocation);
            cmd.Parameters.AddWithValue("@Line3LEDNightLightLocation", Line3LEDNightLightLocation);
            cmd.Parameters.AddWithValue("@Line4LEDNightLightLocation", Line4LEDNightLightLocation);

            cmd.Parameters.AddWithValue("@SmartPowerStrip", SmartPowerStrip);
            cmd.Parameters.AddWithValue("@Line1SmartPowerStripLocation", Line1SmartPowerStripLocation);
            cmd.Parameters.AddWithValue("@Line2SmartPowerStripLocation", Line2SmartPowerStripLocation);
            cmd.Parameters.AddWithValue("@Line3SmartPowerStripLocation", Line3SmartPowerStripLocation);
            cmd.Parameters.AddWithValue("@Line4SmartPowerStripLocation", Line4SmartPowerStripLocation);

            cmd.Parameters.AddWithValue("@Line1SmartPowerStrip6Outlet", Line1SmartPowerStrip6Outlet);
            cmd.Parameters.AddWithValue("@Line2SmartPowerStrip6Outlet", Line2SmartPowerStrip6Outlet);
            cmd.Parameters.AddWithValue("@Line3SmartPowerStrip6Outlet", Line3SmartPowerStrip6Outlet);
            cmd.Parameters.AddWithValue("@Line4SmartPowerStrip6Outlet", Line4SmartPowerStrip6Outlet);

            cmd.Parameters.AddWithValue("@Line1SmartPowerStrip10Outlet", Line1SmartPowerStrip10Outlet);
            cmd.Parameters.AddWithValue("@Line2SmartPowerStrip10Outlet", Line2SmartPowerStrip10Outlet);
            cmd.Parameters.AddWithValue("@Line3SmartPowerStrip10Outlet", Line3SmartPowerStrip10Outlet);
            cmd.Parameters.AddWithValue("@Line4SmartPowerStrip10Outlet", Line4SmartPowerStrip10Outlet);

            cmd.Parameters.AddWithValue("@COAlarms5YearOld", COAlarms5YearOld);
            cmd.Parameters.AddWithValue("@TotalNEWAlarmsInstalled", TotalNEWAlarmsInstalled);

            cmd.Parameters.AddWithValue("@Line1COAlarmLocation", Line1COAlarmLocation);
            cmd.Parameters.AddWithValue("@Line2COAlarmLocation", Line2COAlarmLocation);
            cmd.Parameters.AddWithValue("@Line3COAlarmLocation", Line3COAlarmLocation);
            cmd.Parameters.AddWithValue("@Line4COAlarmLocation", Line4COAlarmLocation);
            cmd.Parameters.AddWithValue("@Line5COAlarmLocation", Line5COAlarmLocation);
            cmd.Parameters.AddWithValue("@InstalledFurnaceFilter", InstalledFurnaceFilter);

            
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch(Exception e)
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_3(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage3Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion


    #region METED Audit Page 4

    // public int UpdateMETEDAudit_4(string JobNumber, string Line1Liurp, string Line2Liurp, string Line3Liurp, string Line4Liurp, string Line5Liurp, string Line6Liurp, string Line7Liurp, string Line8Liurp, string Line9Liurp, string Line10Liurp, string Line11Liurp, string Line12Liurp, string Line13Liurp, string Line14Liurp, string Line15Liurp, string Line16Liurp, string Line17Liurp, string Line18Liurp, string Line1NumStandardBulbs, string Line1Location, string Line2NumStandardBulbs, string Line2Location, string Line3NumStandardBulbs, string Line3Location, string Line4NumStandardBulbs, string Line4Location, string Line5NumStandardBulbs, string Line5Location, string Line6NumStandardBulbs, string Line6Location, string Line7NumStandardBulbs, string Line7Location, string Line8NumStandardBulbs, string Line8Location, string Line9NumStandardBulbs, string Line9Location, string Line10NumStandardBulbs, string Line10Location, string Line11NumStandardBulbs, string Line11Location, string Line12NumStandardBulbs, string Line12Location, string Line13NumStandardBulbs, string Line13Location, string Line14NumStandardBulbs, string Line14Location, string Line15NumStandardBulbs, string Line15Location, string Line16NumStandardBulbs, string Line16Location, string Line17NumStandardBulbs, string Line17Location, string Line18NumStandardBulbs, string Line18Location, string TotalNumberOfInstalledStandardBulbs, string TotalNumberOfInstalledSpecialtyBulbs, string Line1CFLReplacement, string Line2CFLReplacement, string Line3CFLReplacement, string Line4CFLReplacement, string Line5CFLReplacement, string Line6CFLReplacement, string Line7CFLReplacement, string Line8CFLReplacement, string Line9CFLReplacement, string Line10CFLReplacement, string Line11CFLReplacement, string Line12CFLReplacement, string Line13CFLReplacement, string Line14CFLReplacement, string Line15CFLReplacement, string Line16CFLReplacement, string Line17CFLReplacement, string Line18CFLReplacement, string Line1CFLLocation, string Line2CFLLocation, string Line3CFLLocation, string Line4CFLLocation, string Line5CFLLocation, string Line6CFLLocation, string Line7CFLLocation, string Line8CFLLocation, string Line9CFLLocation, string Line10CFLLocation, string Line11CFLLocation, string Line12CFLLocation, string Line13CFLLocation, string Line14CFLLocation, string Line15CFLLocation, string Line16CFLLocation, string Line17CFLLocation, string Line18CFLLocation, string Line1WARMMeasure, string Line2WARMMeasure, string Line3WARMMeasure, string Line4WARMMeasure, string Line5WARMMeasure, string Line6WARMMeasure, string Line7WARMMeasure, string Line8WARMMeasure, string Line9WARMMeasure, string Line10WARMMeasure, string Line11WARMMeasure, string Line12WARMMeasure, string Line13BulbType, string Line14BulbType, string Line15BulbType, string Line16BulbType, string Line17BulbType, string Line18BulbType, string TorchiresInstalled, string OtherSpecialityBulbInstalled, string Line1_Act129, string Line2_Act129, string Line3_Act129, string Line4_Act129, string Line5_Act129, string Line6_Act129, string Line7_Act129, string Line8_Act129, string Line9_Act129, string Line10_Act129, string Line11_Act129, string Line12_Act129, string Line13_Act129, string Line14_Act129, string Line15_Act129, string Line16_Act129, string Line17_Act129, string Line18_Act129, string Line1_Total, string Line1_68Standard, string Line1_913Standard, string Line1_23Globe, string Line1_35Torpedo, string Line1_37Candelabra, string Line1_8Flood, string Line1_13Flood, string Line1_17Flood, string Line1_Location, string Line2_Total, string Line2_68Standard, string Line2_913Standard, string Line2_23Globe, string Line2_35Torpedo, string Line2_37Candelabra, string Line2_8Flood, string Line2_13Flood, string Line2_17Flood, string Line2_Location, string Line3_Total, string Line3_68Standard, string Line3_913Standard, string Line3_23Globe, string Line3_35Torpedo, string Line3_37Candelabra, string Line3_8Flood, string Line3_13Flood, string Line3_17Flood, string Line3_Location, string Line4_Total, string Line4_68Standard, string Line4_913Standard, string Line4_23Globe, string Line4_35Torpedo, string Line4_37Candelabra, string Line4_8Flood, string Line4_13Flood, string Line4_17Flood, string Line4_Location, string NumberRecessedFloodBulbsInstalled, string TotalNumberLedBulbsInstalled)
    public int UpdateMETEDAudit_4(string JobNumber, string page, string Line1Liurp, string Line2Liurp, string Line3Liurp, string Line4Liurp, string Line5Liurp, string Line6Liurp, string Line7Liurp, string Line8Liurp, string Line9Liurp, string Line10Liurp, string Line11Liurp, string Line12Liurp, string Line13Liurp, string Line14Liurp, string Line15Liurp, string Line16Liurp, string Line17Liurp, string Line18Liurp, string Line19Liurp, string Line20Liurp, string Line21Liurp, string Line22Liurp, string Line23Liurp, string Line24Liurp, string Line25Liurp, string Line26Liurp, string Line1NumStandardBulbs, string Line1Location, string Line2NumStandardBulbs, string Line2Location, string Line3NumStandardBulbs, string Line3Location, string Line4NumStandardBulbs, string Line4Location, string Line5NumStandardBulbs, string Line5Location, string Line6NumStandardBulbs, string Line6Location, string Line7NumStandardBulbs, string Line7Location, string Line8NumStandardBulbs, string Line8Location, string Line9NumStandardBulbs, string Line9Location, string Line10NumStandardBulbs, string Line10Location, string Line11NumStandardBulbs, string Line11Location, string Line12NumStandardBulbs, string Line12Location, string Line13NumStandardBulbs, string Line13Location, string Line14NumStandardBulbs, string Line14Location, string Line15NumStandardBulbs, string Line15Location, string Line16NumStandardBulbs, string Line16Location, string Line17NumStandardBulbs, string Line17Location, string Line18NumStandardBulbs, string Line18Location, string Line19NumStandardBulbs, string Line19Location, string Line20NumStandardBulbs, string Line20Location, string Line21NumStandardBulbs, string Line21Location, string Line22NumStandardBulbs, string Line22Location, string Line23NumStandardBulbs, string Line23Location, string Line24NumStandardBulbs, string Line24Location, string Line25NumStandardBulbs, string Line25Location, string Line26NumStandardBulbs, string Line26Location, string TotalNumberOfInstalledStandardBulbs, string TotalNumberOfInstalledSpecialtyBulbs, string Line1CFLReplacement, string Line2CFLReplacement, string Line3CFLReplacement, string Line4CFLReplacement, string Line5CFLReplacement, string Line6CFLReplacement, string Line7CFLReplacement, string Line8CFLReplacement, string Line9CFLReplacement, string Line10CFLReplacement, string Line11CFLReplacement, string Line12CFLReplacement, string Line13CFLReplacement, string Line14CFLReplacement, string Line15CFLReplacement, string Line16CFLReplacement, string Line17CFLReplacement, string Line18CFLReplacement, string Line19CFLReplacement, string Line20CFLReplacement, string Line21CFLReplacement, string Line22CFLReplacement, string Line23CFLReplacement, string Line24CFLReplacement, string Line25CFLReplacement, string Line26CFLReplacement, string Line1CFLLocation, string Line2CFLLocation, string Line3CFLLocation, string Line4CFLLocation, string Line5CFLLocation, string Line6CFLLocation, string Line7CFLLocation, string Line8CFLLocation, string Line9CFLLocation, string Line10CFLLocation, string Line11CFLLocation, string Line12CFLLocation, string Line13CFLLocation, string Line14CFLLocation, string Line15CFLLocation, string Line16CFLLocation, string Line17CFLLocation, string Line18CFLLocation, string Line19CFLLocation, string Line20CFLLocation, string Line21CFLLocation, string Line22CFLLocation, string Line23CFLLocation, string Line24CFLLocation, string Line25CFLLocation, string Line26CFLLocation, string Line1WARMMeasure, string Line2WARMMeasure, string Line3WARMMeasure, string Line4WARMMeasure, string Line5WARMMeasure, string Line6WARMMeasure, string Line7WARMMeasure, string Line8WARMMeasure, string Line9WARMMeasure, string Line10WARMMeasure, string Line11WARMMeasure, string Line12WARMMeasure, string Line13BulbType, string Line14BulbType, string Line15BulbType, string Line16BulbType, string Line17BulbType, string Line18BulbType, string Line19BulbType, string Line20BulbType, string Line21BulbType, string Line22BulbType, string Line23BulbType, string Line24BulbType, string Line25BulbType, string Line26BulbType, string TorchiresInstalled, string OtherSpecialityBulbInstalled, string Line1_Act129, string Line2_Act129, string Line3_Act129, string Line4_Act129, string Line5_Act129, string Line6_Act129, string Line7_Act129, string Line8_Act129, string Line9_Act129, string Line10_Act129, string Line11_Act129, string Line12_Act129, string Line13_Act129, string Line14_Act129, string Line15_Act129, string Line16_Act129, string Line17_Act129, string Line18_Act129, string Line19_Act129, string Line20_Act129, string Line21_Act129, string Line22_Act129, string Line23_Act129, string Line24_Act129, string Line25_Act129, string Line26_Act129, string Line1_Total, string Line1_68Standard, string Line1_913Standard, string Line1_23Globe, string Line1_35Torpedo, string Line1_37Candelabra, string Line1_8Flood, string Line1_13Flood, string Line1_17Flood, string Line1_Location, string Line2_Total, string Line2_68Standard, string Line2_913Standard, string Line2_23Globe, string Line2_35Torpedo, string Line2_37Candelabra, string Line2_8Flood, string Line2_13Flood, string Line2_17Flood, string Line2_Location, string Line3_Total, string Line3_68Standard, string Line3_913Standard, string Line3_23Globe, string Line3_35Torpedo, string Line3_37Candelabra, string Line3_8Flood, string Line3_13Flood, string Line3_17Flood, string Line3_Location, string Line4_Total, string Line4_68Standard, string Line4_913Standard, string Line4_23Globe, string Line4_35Torpedo, string Line4_37Candelabra, string Line4_8Flood, string Line4_13Flood, string Line4_17Flood, string Line4_Location, string NumberRecessedFloodBulbsInstalled, string TotalNumberLedBulbsInstalled, string Line5_Total, string Line5_68Standard, string Line5_913Standard, string Line5_23Globe, string Line5_35Torpedo, string Line5_37Candelabra, string Line5_8Flood, string Line5_13Flood, string Line5_17Flood, string Line5_Location, string Line6_Total, string Line6_68Standard, string Line6_913Standard, string Line6_23Globe, string Line6_35Torpedo, string Line6_37Candelabra, string Line6_8Flood, string Line6_13Flood, string Line6_17Flood, string Line6_Location, string Line7_Total, string Line7_68Standard, string Line7_913Standard, string Line7_23Globe, string Line7_35Torpedo, string Line7_37Candelabra, string Line7_8Flood, string Line7_13Flood, string Line7_17Flood, string Line7_Location, string Line8_Total, string Line8_68Standard, string Line8_913Standard, string Line8_23Globe, string Line8_35Torpedo, string Line8_37Candelabra, string Line8_8Flood, string Line8_13Flood, string Line8_17Flood, string Line8_Location, string Line9_Total, string Line9_68Standard, string Line9_913Standard, string Line9_23Globe, string Line9_35Torpedo, string Line9_37Candelabra, string Line9_8Flood, string Line9_13Flood, string Line9_17Flood, string Line9_Location, string Line10_Total, string Line10_68Standard, string Line10_913Standard, string Line10_23Globe, string Line10_35Torpedo, string Line10_37Candelabra, string Line10_8Flood, string Line10_13Flood, string Line10_17Flood, string Line10_Location, string Line11_Total, string Line11_68Standard, string Line11_913Standard, string Line11_23Globe, string Line11_35Torpedo, string Line11_37Candelabra, string Line11_8Flood, string Line11_13Flood, string Line11_17Flood, string Line11_Location, string Line12_Total, string Line12_68Standard, string Line12_913Standard, string Line12_23Globe, string Line12_35Torpedo, string Line12_37Candelabra, string Line12_8Flood, string Line12_13Flood, string Line12_17Flood, string Line12_Location, string Line13_Total, string Line13_68Standard, string Line13_913Standard, string Line13_23Globe, string Line13_35Torpedo, string Line13_37Candelabra, string Line13_8Flood, string Line13_13Flood, string Line13_17Flood, string Line13_Location, string Line14_Total, string Line14_68Standard, string Line14_913Standard, string Line14_23Globe, string Line14_35Torpedo, string Line14_37Candelabra, string Line14_8Flood, string Line14_13Flood, string Line14_17Flood, string Line14_Location, string Line1_RetroKit, string Line2_RetroKit, string Line3_RetroKit, string Line4_RetroKit, string Line5_RetroKit, string Line6_RetroKit, string Line7_RetroKit, string Line8_RetroKit, string Line9_RetroKit, string Line10_RetroKit, string Line11_RetroKit, string Line12_RetroKit, string Line13_RetroKit, string Line14_RetroKit)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage4Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@page", page);
            cmd.Parameters.AddWithValue("@Line1Liurp", Line1Liurp);
            cmd.Parameters.AddWithValue("@Line2Liurp", Line2Liurp);
            cmd.Parameters.AddWithValue("@Line3Liurp", Line3Liurp);
            cmd.Parameters.AddWithValue("@Line4Liurp", Line4Liurp);
            cmd.Parameters.AddWithValue("@Line5Liurp", Line5Liurp);
            cmd.Parameters.AddWithValue("@Line6Liurp", Line6Liurp);
            cmd.Parameters.AddWithValue("@Line7Liurp", Line7Liurp);
            cmd.Parameters.AddWithValue("@Line8Liurp", Line8Liurp);
            cmd.Parameters.AddWithValue("@Line9Liurp", Line9Liurp);
            cmd.Parameters.AddWithValue("@Line10Liurp", Line10Liurp);
            cmd.Parameters.AddWithValue("@Line11Liurp", Line11Liurp);
            cmd.Parameters.AddWithValue("@Line12Liurp", Line12Liurp);
            cmd.Parameters.AddWithValue("@Line13Liurp", Line13Liurp);
            cmd.Parameters.AddWithValue("@Line14Liurp", Line14Liurp);
            cmd.Parameters.AddWithValue("@Line15Liurp", Line15Liurp);
            cmd.Parameters.AddWithValue("@Line16Liurp", Line16Liurp);
            cmd.Parameters.AddWithValue("@Line17Liurp", Line17Liurp);
            cmd.Parameters.AddWithValue("@Line18Liurp", Line18Liurp);
            cmd.Parameters.AddWithValue("@Line19Liurp", Line19Liurp);
            cmd.Parameters.AddWithValue("@Line20Liurp", Line20Liurp);
            cmd.Parameters.AddWithValue("@Line21Liurp", Line21Liurp);
            cmd.Parameters.AddWithValue("@Line22Liurp", Line22Liurp);
            cmd.Parameters.AddWithValue("@Line23Liurp", Line23Liurp);
            cmd.Parameters.AddWithValue("@Line24Liurp", Line24Liurp);
            cmd.Parameters.AddWithValue("@Line25Liurp", Line25Liurp);
            cmd.Parameters.AddWithValue("@Line26Liurp", Line26Liurp);

            cmd.Parameters.AddWithValue("@Line1NumStandardBulbs", Line1NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line1Location", Line1Location);
            cmd.Parameters.AddWithValue("@Line2NumStandardBulbs", Line2NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line2Location", Line2Location);
            cmd.Parameters.AddWithValue("@Line3NumStandardBulbs", Line3NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line3Location", Line3Location);
            cmd.Parameters.AddWithValue("@Line4NumStandardBulbs", Line4NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line4Location", Line4Location);
            cmd.Parameters.AddWithValue("@Line5NumStandardBulbs", Line5NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line5Location", Line5Location);
            cmd.Parameters.AddWithValue("@Line6NumStandardBulbs", Line6NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line6Location", Line6Location);
            cmd.Parameters.AddWithValue("@Line7NumStandardBulbs", Line7NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line7Location", Line7Location);
            cmd.Parameters.AddWithValue("@Line8NumStandardBulbs", Line8NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line8Location", Line8Location);
            cmd.Parameters.AddWithValue("@Line9NumStandardBulbs", Line9NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line9Location", Line9Location);
            cmd.Parameters.AddWithValue("@Line10NumStandardBulbs", Line10NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line10Location", Line10Location);
            cmd.Parameters.AddWithValue("@Line11NumStandardBulbs", Line11NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line11Location", Line11Location);
            cmd.Parameters.AddWithValue("@Line12NumStandardBulbs", Line12NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line12Location", Line12Location);
            cmd.Parameters.AddWithValue("@Line13NumStandardBulbs", Line13NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line13Location", Line13Location);
            cmd.Parameters.AddWithValue("@Line14NumStandardBulbs", Line14NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line14Location", Line14Location);
            cmd.Parameters.AddWithValue("@Line15NumStandardBulbs", Line15NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line15Location", Line15Location);
            cmd.Parameters.AddWithValue("@Line16NumStandardBulbs", Line16NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line16Location", Line16Location);
            cmd.Parameters.AddWithValue("@Line17NumStandardBulbs", Line17NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line17Location", Line17Location);
            cmd.Parameters.AddWithValue("@Line18NumStandardBulbs", Line18NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line18Location", Line18Location);
            cmd.Parameters.AddWithValue("@Line19NumStandardBulbs", Line19NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line19Location", Line19Location);
            cmd.Parameters.AddWithValue("@Line20NumStandardBulbs", Line20NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line20Location", Line20Location);
            cmd.Parameters.AddWithValue("@Line21NumStandardBulbs", Line21NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line21Location", Line21Location);
            cmd.Parameters.AddWithValue("@Line22NumStandardBulbs", Line22NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line22Location", Line22Location);
            cmd.Parameters.AddWithValue("@Line23NumStandardBulbs", Line23NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line23Location", Line23Location);
            cmd.Parameters.AddWithValue("@Line24NumStandardBulbs", Line24NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line24Location", Line24Location);
            cmd.Parameters.AddWithValue("@Line25NumStandardBulbs", Line25NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line25Location", Line25Location);
            cmd.Parameters.AddWithValue("@Line26NumStandardBulbs", Line26NumStandardBulbs);
            cmd.Parameters.AddWithValue("@Line26Location", Line26Location);

            cmd.Parameters.AddWithValue("@TotalNumberOfInstalledStandardBulbs", TotalNumberOfInstalledStandardBulbs);
            cmd.Parameters.AddWithValue("@TotalNumberOfInstalledSpecialtyBulbs", TotalNumberOfInstalledSpecialtyBulbs);

            cmd.Parameters.AddWithValue("@Line1CFLReplacement", Line1CFLReplacement);
            cmd.Parameters.AddWithValue("@Line2CFLReplacement", Line2CFLReplacement);
            cmd.Parameters.AddWithValue("@Line3CFLReplacement", Line3CFLReplacement);
            cmd.Parameters.AddWithValue("@Line4CFLReplacement", Line4CFLReplacement);
            cmd.Parameters.AddWithValue("@Line5CFLReplacement", Line5CFLReplacement);
            cmd.Parameters.AddWithValue("@Line6CFLReplacement", Line6CFLReplacement);
            cmd.Parameters.AddWithValue("@Line7CFLReplacement", Line7CFLReplacement);
            cmd.Parameters.AddWithValue("@Line8CFLReplacement", Line8CFLReplacement);
            cmd.Parameters.AddWithValue("@Line9CFLReplacement", Line9CFLReplacement);
            cmd.Parameters.AddWithValue("@Line10CFLReplacement", Line10CFLReplacement);
            cmd.Parameters.AddWithValue("@Line11CFLReplacement", Line11CFLReplacement);
            cmd.Parameters.AddWithValue("@Line12CFLReplacement", Line12CFLReplacement);
            cmd.Parameters.AddWithValue("@Line13CFLReplacement", Line13CFLReplacement);
            cmd.Parameters.AddWithValue("@Line14CFLReplacement", Line14CFLReplacement);
            cmd.Parameters.AddWithValue("@Line15CFLReplacement", Line15CFLReplacement);
            cmd.Parameters.AddWithValue("@Line16CFLReplacement", Line16CFLReplacement);
            cmd.Parameters.AddWithValue("@Line17CFLReplacement", Line17CFLReplacement);
            cmd.Parameters.AddWithValue("@Line18CFLReplacement", Line18CFLReplacement);
            cmd.Parameters.AddWithValue("@Line19CFLReplacement", Line19CFLReplacement);
            cmd.Parameters.AddWithValue("@Line20CFLReplacement", Line20CFLReplacement);
            cmd.Parameters.AddWithValue("@Line21CFLReplacement", Line21CFLReplacement);
            cmd.Parameters.AddWithValue("@Line22CFLReplacement", Line22CFLReplacement);
            cmd.Parameters.AddWithValue("@Line23CFLReplacement", Line23CFLReplacement);
            cmd.Parameters.AddWithValue("@Line24CFLReplacement", Line24CFLReplacement);
            cmd.Parameters.AddWithValue("@Line25CFLReplacement", Line25CFLReplacement);
            cmd.Parameters.AddWithValue("@Line26CFLReplacement", Line26CFLReplacement);

            cmd.Parameters.AddWithValue("@Line1CFLLocation", Line1CFLLocation);
            cmd.Parameters.AddWithValue("@Line2CFLLocation", Line2CFLLocation);
            cmd.Parameters.AddWithValue("@Line3CFLLocation", Line3CFLLocation);
            cmd.Parameters.AddWithValue("@Line4CFLLocation", Line4CFLLocation);
            cmd.Parameters.AddWithValue("@Line5CFLLocation", Line5CFLLocation);
            cmd.Parameters.AddWithValue("@Line6CFLLocation", Line6CFLLocation);
            cmd.Parameters.AddWithValue("@Line7CFLLocation", Line7CFLLocation);
            cmd.Parameters.AddWithValue("@Line8CFLLocation", Line8CFLLocation);
            cmd.Parameters.AddWithValue("@Line9CFLLocation", Line9CFLLocation);
            cmd.Parameters.AddWithValue("@Line10CFLLocation", Line10CFLLocation);
            cmd.Parameters.AddWithValue("@Line11CFLLocation", Line11CFLLocation);
            cmd.Parameters.AddWithValue("@Line12CFLLocation", Line12CFLLocation);
            cmd.Parameters.AddWithValue("@Line13CFLLocation", Line13CFLLocation);
            cmd.Parameters.AddWithValue("@Line14CFLLocation", Line14CFLLocation);
            cmd.Parameters.AddWithValue("@Line15CFLLocation", Line15CFLLocation);
            cmd.Parameters.AddWithValue("@Line16CFLLocation", Line16CFLLocation);
            cmd.Parameters.AddWithValue("@Line17CFLLocation", Line17CFLLocation);
            cmd.Parameters.AddWithValue("@Line18CFLLocation", Line18CFLLocation);
            cmd.Parameters.AddWithValue("@Line19CFLLocation", Line19CFLLocation);
            cmd.Parameters.AddWithValue("@Line20CFLLocation", Line20CFLLocation);
            cmd.Parameters.AddWithValue("@Line21CFLLocation", Line21CFLLocation);
            cmd.Parameters.AddWithValue("@Line22CFLLocation", Line22CFLLocation);
            cmd.Parameters.AddWithValue("@Line23CFLLocation", Line23CFLLocation);
            cmd.Parameters.AddWithValue("@Line24CFLLocation", Line24CFLLocation);
            cmd.Parameters.AddWithValue("@Line25CFLLocation", Line25CFLLocation);
            cmd.Parameters.AddWithValue("@Line26CFLLocation", Line26CFLLocation); 
            
            
            cmd.Parameters.AddWithValue("@Line1WARMMeasure", Line1WARMMeasure);
            cmd.Parameters.AddWithValue("@Line2WARMMeasure", Line2WARMMeasure);
            cmd.Parameters.AddWithValue("@Line3WARMMeasure", Line3WARMMeasure);
            cmd.Parameters.AddWithValue("@Line4WARMMeasure", Line4WARMMeasure);
            cmd.Parameters.AddWithValue("@Line5WARMMeasure", Line5WARMMeasure);
            cmd.Parameters.AddWithValue("@Line6WARMMeasure", Line6WARMMeasure);
            cmd.Parameters.AddWithValue("@Line7WARMMeasure", Line7WARMMeasure);
            cmd.Parameters.AddWithValue("@Line8WARMMeasure", Line8WARMMeasure);
            cmd.Parameters.AddWithValue("@Line9WARMMeasure", Line9WARMMeasure);
            cmd.Parameters.AddWithValue("@Line10WARMMeasure", Line10WARMMeasure);
            cmd.Parameters.AddWithValue("@Line11WARMMeasure", Line11WARMMeasure);
            cmd.Parameters.AddWithValue("@Line12WARMMeasure", Line12WARMMeasure);

            cmd.Parameters.AddWithValue("@Line13BulbType", Line13BulbType);
            cmd.Parameters.AddWithValue("@Line14BulbType", Line14BulbType);
            cmd.Parameters.AddWithValue("@Line15BulbType", Line15BulbType);
            cmd.Parameters.AddWithValue("@Line16BulbType", Line16BulbType);
            cmd.Parameters.AddWithValue("@Line17BulbType", Line17BulbType);
            cmd.Parameters.AddWithValue("@Line18BulbType", Line18BulbType);
            cmd.Parameters.AddWithValue("@Line19BulbType", Line19BulbType);
            cmd.Parameters.AddWithValue("@Line20BulbType", Line20BulbType);
            cmd.Parameters.AddWithValue("@Line21BulbType", Line21BulbType);
            cmd.Parameters.AddWithValue("@Line22BulbType", Line22BulbType);
            cmd.Parameters.AddWithValue("@Line23BulbType", Line23BulbType);
            cmd.Parameters.AddWithValue("@Line24BulbType", Line24BulbType);
            cmd.Parameters.AddWithValue("@Line25BulbType", Line25BulbType);
            cmd.Parameters.AddWithValue("@Line26BulbType", Line26BulbType);


            cmd.Parameters.AddWithValue("@TorchiresInstalled", TorchiresInstalled);
            cmd.Parameters.AddWithValue("@OtherSpecialityBulbInstalled", OtherSpecialityBulbInstalled);

            cmd.Parameters.AddWithValue("@Line1_Act129", Line1_Act129);
            cmd.Parameters.AddWithValue("@Line2_Act129", Line2_Act129);
            cmd.Parameters.AddWithValue("@Line3_Act129", Line3_Act129);
            cmd.Parameters.AddWithValue("@Line4_Act129", Line4_Act129);
            cmd.Parameters.AddWithValue("@Line5_Act129", Line5_Act129);
            cmd.Parameters.AddWithValue("@Line6_Act129", Line6_Act129);
            cmd.Parameters.AddWithValue("@Line7_Act129", Line7_Act129);
            cmd.Parameters.AddWithValue("@Line8_Act129", Line8_Act129);
            cmd.Parameters.AddWithValue("@Line9_Act129", Line9_Act129);
            cmd.Parameters.AddWithValue("@Line10_Act129", Line10_Act129);
            cmd.Parameters.AddWithValue("@Line11_Act129", Line11_Act129);
            cmd.Parameters.AddWithValue("@Line12_Act129", Line12_Act129);
            cmd.Parameters.AddWithValue("@Line13_Act129", Line13_Act129);
            cmd.Parameters.AddWithValue("@Line14_Act129", Line14_Act129);
            cmd.Parameters.AddWithValue("@Line15_Act129", Line15_Act129);
            cmd.Parameters.AddWithValue("@Line16_Act129", Line16_Act129);
            cmd.Parameters.AddWithValue("@Line17_Act129", Line17_Act129);
            cmd.Parameters.AddWithValue("@Line18_Act129", Line18_Act129);
            cmd.Parameters.AddWithValue("@Line19_Act129", Line19_Act129);
            cmd.Parameters.AddWithValue("@Line20_Act129", Line20_Act129);
            cmd.Parameters.AddWithValue("@Line21_Act129", Line21_Act129);
            cmd.Parameters.AddWithValue("@Line22_Act129", Line22_Act129);
            cmd.Parameters.AddWithValue("@Line23_Act129", Line23_Act129);
            cmd.Parameters.AddWithValue("@Line24_Act129", Line24_Act129);
            cmd.Parameters.AddWithValue("@Line25_Act129", Line25_Act129);
            cmd.Parameters.AddWithValue("@Line26_Act129", Line26_Act129);



            cmd.Parameters.AddWithValue("@Line1_Total", Line1_Total);
            cmd.Parameters.AddWithValue("@Line1_68Standard ", Line1_68Standard);
            cmd.Parameters.AddWithValue("@Line1_913Standard ", Line1_913Standard);
            cmd.Parameters.AddWithValue("@Line1_23Globe ", Line1_23Globe);
            cmd.Parameters.AddWithValue("@Line1_35Torpedo ", Line1_35Torpedo);
            cmd.Parameters.AddWithValue("@Line1_37Candelabra ", Line1_37Candelabra);
            cmd.Parameters.AddWithValue("@Line1_8Flood ", Line1_8Flood);
            cmd.Parameters.AddWithValue("@Line1_13Flood ", Line1_13Flood);
            cmd.Parameters.AddWithValue("@Line1_17Flood ", Line1_17Flood);
            cmd.Parameters.AddWithValue("@Line1_Location", Line1_Location);


            cmd.Parameters.AddWithValue("@Line2_Total", Line2_Total);
            cmd.Parameters.AddWithValue("@Line2_68Standard", Line2_68Standard);
            cmd.Parameters.AddWithValue("@Line2_913Standard", Line2_913Standard);
            cmd.Parameters.AddWithValue("@Line2_23Globe", Line2_23Globe);
            cmd.Parameters.AddWithValue("@Line2_35Torpedo", Line2_35Torpedo);
            cmd.Parameters.AddWithValue("@Line2_37Candelabra", Line2_37Candelabra);
            cmd.Parameters.AddWithValue("@Line2_8Flood", Line2_8Flood);
            cmd.Parameters.AddWithValue("@Line2_13Flood", Line2_13Flood);
            cmd.Parameters.AddWithValue("@Line2_17Flood", Line2_17Flood);
            cmd.Parameters.AddWithValue("@Line2_Location", Line2_Location);

            cmd.Parameters.AddWithValue("@Line3_Total", Line3_Total);
            cmd.Parameters.AddWithValue("@Line3_68Standard", Line3_68Standard);
            cmd.Parameters.AddWithValue("@Line3_913Standard", Line3_913Standard);
            cmd.Parameters.AddWithValue("@Line3_23Globe", Line3_23Globe);
            cmd.Parameters.AddWithValue("@Line3_35Torpedo", Line3_35Torpedo);
            cmd.Parameters.AddWithValue("@Line3_37Candelabra", Line3_37Candelabra);
            cmd.Parameters.AddWithValue("@Line3_8Flood", Line3_8Flood);
            cmd.Parameters.AddWithValue("@Line3_13Flood", Line3_13Flood);
            cmd.Parameters.AddWithValue("@Line3_17Flood", Line3_17Flood);
            cmd.Parameters.AddWithValue("@Line3_Location", Line3_Location);

            cmd.Parameters.AddWithValue("@Line4_Total", Line4_Total);
            cmd.Parameters.AddWithValue("@Line4_68Standard", Line4_68Standard);
            cmd.Parameters.AddWithValue("@Line4_913Standard", Line4_913Standard);
            cmd.Parameters.AddWithValue("@Line4_23Globe", Line4_23Globe);
            cmd.Parameters.AddWithValue("@Line4_35Torpedo", Line4_35Torpedo);
            cmd.Parameters.AddWithValue("@Line4_37Candelabra", Line4_37Candelabra);
            cmd.Parameters.AddWithValue("@Line4_8Flood", Line4_8Flood);
            cmd.Parameters.AddWithValue("@Line4_13Flood", Line4_13Flood);
            cmd.Parameters.AddWithValue("@Line4_17Flood", Line4_17Flood);
            cmd.Parameters.AddWithValue("@Line4_Location", Line4_Location);

            cmd.Parameters.AddWithValue("@TotalNumberLedBulbsInstalled", TotalNumberLedBulbsInstalled);
            cmd.Parameters.AddWithValue("@NumberRecessedFloodBulbsInstalled", NumberRecessedFloodBulbsInstalled);

            cmd.Parameters.AddWithValue("@Line5_Total", Line5_Total);
            cmd.Parameters.AddWithValue("@Line5_68Standard", Line5_68Standard);
            cmd.Parameters.AddWithValue("@Line5_913Standard", Line5_913Standard);
            cmd.Parameters.AddWithValue("@Line5_23Globe", Line5_23Globe);
            cmd.Parameters.AddWithValue("@Line5_35Torpedo", Line5_35Torpedo);
            cmd.Parameters.AddWithValue("@Line5_37Candelabra", Line5_37Candelabra);
            cmd.Parameters.AddWithValue("@Line5_8Flood", Line5_8Flood);
            cmd.Parameters.AddWithValue("@Line5_13Flood", Line5_13Flood);
            cmd.Parameters.AddWithValue("@Line5_17Flood", Line5_17Flood);
            cmd.Parameters.AddWithValue("@Line5_Location", Line5_Location);

            cmd.Parameters.AddWithValue("@Line6_Total", Line6_Total);
            cmd.Parameters.AddWithValue("@Line6_68Standard", Line6_68Standard);
            cmd.Parameters.AddWithValue("@Line6_913Standard", Line6_913Standard);
            cmd.Parameters.AddWithValue("@Line6_23Globe", Line6_23Globe);
            cmd.Parameters.AddWithValue("@Line6_35Torpedo", Line6_35Torpedo);
            cmd.Parameters.AddWithValue("@Line6_37Candelabra", Line6_37Candelabra);
            cmd.Parameters.AddWithValue("@Line6_8Flood", Line6_8Flood);
            cmd.Parameters.AddWithValue("@Line6_13Flood", Line6_13Flood);
            cmd.Parameters.AddWithValue("@Line6_17Flood", Line6_17Flood);
            cmd.Parameters.AddWithValue("@Line6_Location", Line6_Location);


            cmd.Parameters.AddWithValue("@Line7_Total", Line7_Total);
            cmd.Parameters.AddWithValue("@Line7_68Standard", Line7_68Standard);
            cmd.Parameters.AddWithValue("@Line7_913Standard", Line7_913Standard);
            cmd.Parameters.AddWithValue("@Line7_23Globe", Line7_23Globe);
            cmd.Parameters.AddWithValue("@Line7_35Torpedo", Line7_35Torpedo);
            cmd.Parameters.AddWithValue("@Line7_37Candelabra", Line7_37Candelabra);
            cmd.Parameters.AddWithValue("@Line7_8Flood", Line7_8Flood);
            cmd.Parameters.AddWithValue("@Line7_13Flood", Line7_13Flood);
            cmd.Parameters.AddWithValue("@Line7_17Flood", Line7_17Flood);
            cmd.Parameters.AddWithValue("@Line7_Location", Line7_Location);


            cmd.Parameters.AddWithValue("@Line8_Total", Line8_Total);
            cmd.Parameters.AddWithValue("@Line8_68Standard", Line8_68Standard);
            cmd.Parameters.AddWithValue("@Line8_913Standard", Line8_913Standard);
            cmd.Parameters.AddWithValue("@Line8_23Globe", Line8_23Globe);
            cmd.Parameters.AddWithValue("@Line8_35Torpedo", Line8_35Torpedo);
            cmd.Parameters.AddWithValue("@Line8_37Candelabra", Line8_37Candelabra);
            cmd.Parameters.AddWithValue("@Line8_8Flood", Line8_8Flood);
            cmd.Parameters.AddWithValue("@Line8_13Flood", Line8_13Flood);
            cmd.Parameters.AddWithValue("@Line8_17Flood", Line8_17Flood);
            cmd.Parameters.AddWithValue("@Line8_Location", Line8_Location);


            cmd.Parameters.AddWithValue("@Line9_Total", Line9_Total);
            cmd.Parameters.AddWithValue("@Line9_68Standard", Line9_68Standard);
            cmd.Parameters.AddWithValue("@Line9_913Standard", Line9_913Standard);
            cmd.Parameters.AddWithValue("@Line9_23Globe", Line9_23Globe);
            cmd.Parameters.AddWithValue("@Line9_35Torpedo", Line9_35Torpedo);
            cmd.Parameters.AddWithValue("@Line9_37Candelabra", Line9_37Candelabra);
            cmd.Parameters.AddWithValue("@Line9_8Flood", Line9_8Flood);
            cmd.Parameters.AddWithValue("@Line9_13Flood", Line9_13Flood);
            cmd.Parameters.AddWithValue("@Line9_17Flood", Line9_17Flood);
            cmd.Parameters.AddWithValue("@Line9_Location", Line9_Location);


            cmd.Parameters.AddWithValue("@Line10_Total", Line10_Total);
            cmd.Parameters.AddWithValue("@Line10_68Standard", Line10_68Standard);
            cmd.Parameters.AddWithValue("@Line10_913Standard", Line10_913Standard);
            cmd.Parameters.AddWithValue("@Line10_23Globe", Line10_23Globe);
            cmd.Parameters.AddWithValue("@Line10_35Torpedo", Line10_35Torpedo);
            cmd.Parameters.AddWithValue("@Line10_37Candelabra", Line10_37Candelabra);
            cmd.Parameters.AddWithValue("@Line10_8Flood", Line10_8Flood);
            cmd.Parameters.AddWithValue("@Line10_13Flood", Line10_13Flood);
            cmd.Parameters.AddWithValue("@Line10_17Flood", Line10_17Flood);
            cmd.Parameters.AddWithValue("@Line10_Location", Line10_Location);

            cmd.Parameters.AddWithValue("@Line11_Total", Line11_Total);
            cmd.Parameters.AddWithValue("@Line11_68Standard", Line11_68Standard);
            cmd.Parameters.AddWithValue("@Line11_913Standard", Line11_913Standard);
            cmd.Parameters.AddWithValue("@Line11_23Globe", Line11_23Globe);
            cmd.Parameters.AddWithValue("@Line11_35Torpedo", Line11_35Torpedo);
            cmd.Parameters.AddWithValue("@Line11_37Candelabra", Line11_37Candelabra);
            cmd.Parameters.AddWithValue("@Line11_8Flood", Line11_8Flood);
            cmd.Parameters.AddWithValue("@Line11_13Flood", Line11_13Flood);
            cmd.Parameters.AddWithValue("@Line11_17Flood", Line11_17Flood);
            cmd.Parameters.AddWithValue("@Line11_Location", Line11_Location);

            cmd.Parameters.AddWithValue("@Line12_Total", Line12_Total);
            cmd.Parameters.AddWithValue("@Line12_68Standard", Line12_68Standard);
            cmd.Parameters.AddWithValue("@Line12_913Standard", Line12_913Standard);
            cmd.Parameters.AddWithValue("@Line12_23Globe", Line12_23Globe);
            cmd.Parameters.AddWithValue("@Line12_35Torpedo", Line12_35Torpedo);
            cmd.Parameters.AddWithValue("@Line12_37Candelabra", Line12_37Candelabra);
            cmd.Parameters.AddWithValue("@Line12_8Flood", Line12_8Flood);
            cmd.Parameters.AddWithValue("@Line12_13Flood", Line12_13Flood);
            cmd.Parameters.AddWithValue("@Line12_17Flood", Line12_17Flood);
            cmd.Parameters.AddWithValue("@Line12_Location", Line12_Location);


            cmd.Parameters.AddWithValue("@Line13_Total", Line13_Total);
            cmd.Parameters.AddWithValue("@Line13_68Standard", Line13_68Standard);
            cmd.Parameters.AddWithValue("@Line13_913Standard", Line13_913Standard);
            cmd.Parameters.AddWithValue("@Line13_23Globe", Line13_23Globe);
            cmd.Parameters.AddWithValue("@Line13_35Torpedo", Line13_35Torpedo);
            cmd.Parameters.AddWithValue("@Line13_37Candelabra", Line13_37Candelabra);
            cmd.Parameters.AddWithValue("@Line13_8Flood", Line13_8Flood);
            cmd.Parameters.AddWithValue("@Line13_13Flood", Line13_13Flood);
            cmd.Parameters.AddWithValue("@Line13_17Flood", Line13_17Flood);
            cmd.Parameters.AddWithValue("@Line13_Location", Line13_Location);

            cmd.Parameters.AddWithValue("@Line14_Total", Line14_Total);
            cmd.Parameters.AddWithValue("@Line14_68Standard", Line14_68Standard);
            cmd.Parameters.AddWithValue("@Line14_913Standard", Line14_913Standard);
            cmd.Parameters.AddWithValue("@Line14_23Globe", Line14_23Globe);
            cmd.Parameters.AddWithValue("@Line14_35Torpedo", Line14_35Torpedo);
            cmd.Parameters.AddWithValue("@Line14_37Candelabra", Line14_37Candelabra);
            cmd.Parameters.AddWithValue("@Line14_8Flood", Line14_8Flood);
            cmd.Parameters.AddWithValue("@Line14_13Flood", Line14_13Flood);
            cmd.Parameters.AddWithValue("@Line14_17Flood", Line14_17Flood);
            cmd.Parameters.AddWithValue("@Line14_Location", Line14_Location);

            cmd.Parameters.AddWithValue("@Line1_RetroKit", Line1_RetroKit);
            cmd.Parameters.AddWithValue("@Line2_RetroKit", Line2_RetroKit);
            cmd.Parameters.AddWithValue("@Line3_RetroKit", Line3_RetroKit);
            cmd.Parameters.AddWithValue("@Line4_RetroKit", Line4_RetroKit);
            cmd.Parameters.AddWithValue("@Line5_RetroKit", Line5_RetroKit);
            cmd.Parameters.AddWithValue("@Line6_RetroKit", Line6_RetroKit);
            cmd.Parameters.AddWithValue("@Line7_RetroKit", Line7_RetroKit);
            cmd.Parameters.AddWithValue("@Line8_RetroKit", Line8_RetroKit);
            cmd.Parameters.AddWithValue("@Line9_RetroKit", Line9_RetroKit);

            cmd.Parameters.AddWithValue("@Line10_RetroKit", Line10_RetroKit);
            cmd.Parameters.AddWithValue("@Line11_RetroKit", Line11_RetroKit);
            cmd.Parameters.AddWithValue("@Line12_RetroKit", Line12_RetroKit);
            cmd.Parameters.AddWithValue("@Line13_RetroKit", Line13_RetroKit);
            cmd.Parameters.AddWithValue("@Line14_RetroKit", Line14_RetroKit);



            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_4(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage4Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion



    #region METED Audit Page 5

    public int UpdateMETEDAudit_5(string JobNumber, string NumberOfRefrigeratorsUsed, string NumberOfFreezersUsed, string PrimaryRefrigLocation, string PrimaryRefrigCalculatedCostMonth, string PrimaryRefrigMake, string PrimaryRefrigModel, string PrimaryRefrigYear, string PrimaryRefrigSize, string PrimaryRefrigStartTime, string PrimaryRefrigEndTime, string PrimaryRefrigTotalTimeMonitored, string PrimaryRefrigReading, string PrimaryRefrigkWhconversionatonehour, string IsPrimaryRefrigElligibleForReplacement, string PrimaryRefrigReplacementSize, string PrimaryRefrigTemperatureinsidefreshfood, string PrimaryRefrigRoomTemp, string PrimaryRefrigTemperatureinsidefreezer, string PrimaryRefrigDataUsed, string PrimaryRefrigDidNotTestBecause, string PrimaryRefrigCouldNotMove, string SecondaryRefrigLocation, string SecondaryRefrigCalculatedCostMonth, string SecondaryRefrigMake, string SecondaryRefrigModel, string SecondaryRefrigYear, string SecondaryRefrigSize, string SecondaryRefrigStartTime, string SecondaryRefrigEndTime, string SecondaryRefrigTotalTimeMonitored, string SecondaryRefrigReading, string SecondaryRefrigkWhconversionatonehour, string IsSecondaryRefrigElligibleForReplacement, string SecondaryRefrigReplacementSize, string SecondaryRefrigTemperatureinsidefreshfood, string SecondaryRefrigRoomTemp, string SecondaryRefrigTemperatureinsidefreezer, string SecondaryRefirgDatabaseUsed, string SecondaryRefrigDidNotTestBecause, string SecondaryRefrigCouldNotMove, string AdditionalRefrigLocation, string AdditionalRefrigCalculatedCostMonth, string AdditionalRefrigMake, string AdditionalRefrigModel, string AdditionalRefrigYear, string AdditionalRefrigSize, string AdditionalRefrigStartTime, string AdditionalRefrigEndTime, string AdditionalRefrigMonitored, string AdditionalRefrigReading, string AdditionalRefrigkWhConversionOneHour, string AdditionalRefrigTemperatureInsideFreshFood, string AdditionalRefrigRoomTemperature, string AdditionalRefrigTemperatureInsideFreezer, string AdditionalRefrigDatabaseUsed, string AdditionalRefrigReplacementSize, string AdditionalRefrigDidNotTestBecause, string AdditionalRefrigCouldNotMove, string IsAdditionalRefrigElligibleForReplacement, string PrimaryrefrigeratorType, string PrimaryrefrigeratorIcemaker, string SecondryrefrigeratorType, string SecondryrefrigeratorIcemaker, string AdditionalrefrigeratorType, string AdditionalrefrigeratorIcemaker)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage5Ver2";

            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@NumberOfRefrigeratorsUsed", NumberOfRefrigeratorsUsed);
            cmd.Parameters.AddWithValue("@NumberOfFreezersUsed", NumberOfFreezersUsed);

            cmd.Parameters.AddWithValue("@PrimaryRefrigLocation", PrimaryRefrigLocation);
            cmd.Parameters.AddWithValue("@PrimaryRefrigCalculatedCostMonth", PrimaryRefrigCalculatedCostMonth);
            cmd.Parameters.AddWithValue("@PrimaryRefrigMake", PrimaryRefrigMake);
            cmd.Parameters.AddWithValue("@PrimaryRefrigModel", PrimaryRefrigModel);
            cmd.Parameters.AddWithValue("@PrimaryRefrigYear", PrimaryRefrigYear);
            cmd.Parameters.AddWithValue("@PrimaryRefrigSize", PrimaryRefrigSize);
            cmd.Parameters.AddWithValue("@PrimaryRefrigStartTime", PrimaryRefrigStartTime);
            cmd.Parameters.AddWithValue("@PrimaryRefrigEndTime", PrimaryRefrigEndTime);
            cmd.Parameters.AddWithValue("@PrimaryRefrigTotalTimeMonitored", PrimaryRefrigTotalTimeMonitored);
            cmd.Parameters.AddWithValue("@PrimaryRefrigReading", PrimaryRefrigReading);
            cmd.Parameters.AddWithValue("@PrimaryRefrigkWhconversionatonehour", PrimaryRefrigkWhconversionatonehour);
            cmd.Parameters.AddWithValue("@IsPrimaryRefrigElligibleForReplacement", IsPrimaryRefrigElligibleForReplacement);
            cmd.Parameters.AddWithValue("@PrimaryRefrigReplacementSize", PrimaryRefrigReplacementSize);
            cmd.Parameters.AddWithValue("@PrimaryRefrigTemperatureinsidefreshfood", PrimaryRefrigTemperatureinsidefreshfood);
            cmd.Parameters.AddWithValue("@PrimaryRefrigRoomTemp", PrimaryRefrigRoomTemp);
            cmd.Parameters.AddWithValue("@PrimaryRefrigTemperatureinsidefreezer", PrimaryRefrigTemperatureinsidefreezer);
            cmd.Parameters.AddWithValue("@PrimaryRefrigDataUsed", PrimaryRefrigDataUsed);
            cmd.Parameters.AddWithValue("@PrimaryRefrigDidNotTestBecause", PrimaryRefrigDidNotTestBecause);
            cmd.Parameters.AddWithValue("@PrimaryRefrigCouldNotMove", PrimaryRefrigCouldNotMove);

            cmd.Parameters.AddWithValue("@SecondaryRefrigLocation", SecondaryRefrigLocation);
            cmd.Parameters.AddWithValue("@SecondaryRefrigCalculatedCostMonth", SecondaryRefrigCalculatedCostMonth);
            cmd.Parameters.AddWithValue("@SecondaryRefrigMake", SecondaryRefrigMake);
            cmd.Parameters.AddWithValue("@SecondaryRefrigModel", SecondaryRefrigModel);
            cmd.Parameters.AddWithValue("@SecondaryRefrigYear", SecondaryRefrigYear);
            cmd.Parameters.AddWithValue("@SecondaryRefrigSize", SecondaryRefrigSize);
            cmd.Parameters.AddWithValue("@SecondaryRefrigStartTime", SecondaryRefrigStartTime);
            cmd.Parameters.AddWithValue("@SecondaryRefrigEndTime", SecondaryRefrigEndTime);
            cmd.Parameters.AddWithValue("@SecondaryRefrigTotalTimeMonitored", SecondaryRefrigTotalTimeMonitored);
            cmd.Parameters.AddWithValue("@SecondaryRefrigReading", SecondaryRefrigReading);
            cmd.Parameters.AddWithValue("@SecondaryRefrigkWhconversionatonehour", SecondaryRefrigkWhconversionatonehour);
            cmd.Parameters.AddWithValue("@IsSecondaryRefrigElligibleForReplacement", IsSecondaryRefrigElligibleForReplacement);
            cmd.Parameters.AddWithValue("@SecondaryRefrigReplacementSize", SecondaryRefrigReplacementSize);
            cmd.Parameters.AddWithValue("@SecondaryRefrigTemperatureinsidefreshfood", SecondaryRefrigTemperatureinsidefreshfood);
            cmd.Parameters.AddWithValue("@SecondaryRefrigRoomTemp", SecondaryRefrigRoomTemp);
            cmd.Parameters.AddWithValue("@SecondaryRefrigTemperatureinsidefreezer", SecondaryRefrigTemperatureinsidefreezer);
            cmd.Parameters.AddWithValue("@SecondaryRefirgDatabaseUsed", SecondaryRefirgDatabaseUsed);
            cmd.Parameters.AddWithValue("@SecondaryRefrigDidNotTestBecause", SecondaryRefrigDidNotTestBecause);
            cmd.Parameters.AddWithValue("@SecondaryRefrigCouldNotMove", SecondaryRefrigCouldNotMove);

            cmd.Parameters.AddWithValue("@AdditionalRefrigLocation", AdditionalRefrigLocation);
            cmd.Parameters.AddWithValue("@AdditionalRefrigCalculatedCostMonth", AdditionalRefrigCalculatedCostMonth);
            cmd.Parameters.AddWithValue("@AdditionalRefrigMake", AdditionalRefrigMake);
            cmd.Parameters.AddWithValue("@AdditionalRefrigModel", AdditionalRefrigModel);
            cmd.Parameters.AddWithValue("@AdditionalRefrigYear", AdditionalRefrigYear);
            cmd.Parameters.AddWithValue("@AdditionalRefrigSize", AdditionalRefrigSize);
            cmd.Parameters.AddWithValue("@AdditionalRefrigStartTime", AdditionalRefrigStartTime);
            cmd.Parameters.AddWithValue("@AdditionalRefrigEndTime", AdditionalRefrigEndTime);
            cmd.Parameters.AddWithValue("@AdditionalRefrigMonitored", AdditionalRefrigMonitored);
            cmd.Parameters.AddWithValue("@AdditionalRefrigReading", AdditionalRefrigReading);
            cmd.Parameters.AddWithValue("@AdditionalRefrigkWhConversionOneHour", AdditionalRefrigkWhConversionOneHour);
            cmd.Parameters.AddWithValue("@AdditionalRefrigTemperatureInsideFreshFood", AdditionalRefrigTemperatureInsideFreshFood);
            cmd.Parameters.AddWithValue("@AdditionalRefrigRoomTemperature", AdditionalRefrigRoomTemperature);
            cmd.Parameters.AddWithValue("@AdditionalRefrigTemperatureInsideFreezer", AdditionalRefrigTemperatureInsideFreezer);
            cmd.Parameters.AddWithValue("@AdditionalRefrigDatabaseUsed", AdditionalRefrigDatabaseUsed);
            cmd.Parameters.AddWithValue("@AdditionalRefrigReplacementSize", AdditionalRefrigReplacementSize);
            cmd.Parameters.AddWithValue("@AdditionalRefrigDidNotTestBecause", AdditionalRefrigDidNotTestBecause);
            cmd.Parameters.AddWithValue("@AdditionalRefrigCouldNotMove", AdditionalRefrigCouldNotMove);
            cmd.Parameters.AddWithValue("@IsAdditionalRefrigElligibleForReplacement", IsAdditionalRefrigElligibleForReplacement);



            cmd.Parameters.AddWithValue("@PrimaryrefrigeratorType", PrimaryrefrigeratorType);
            cmd.Parameters.AddWithValue("@PrimaryrefrigeratorIcemaker", PrimaryrefrigeratorIcemaker);
            cmd.Parameters.AddWithValue("@SecondryrefrigeratorType", SecondryrefrigeratorType);
            cmd.Parameters.AddWithValue("@SecondryrefrigeratorIcemaker", SecondryrefrigeratorIcemaker);
            cmd.Parameters.AddWithValue("@AdditionalrefrigeratorType", AdditionalrefrigeratorType);
            cmd.Parameters.AddWithValue("@AdditionalrefrigeratorIcemaker", AdditionalrefrigeratorIcemaker);

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        return i;
    }

    public DataTable GetMETEDAudit_5(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETEDA_uditPage5Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion



    #region METED Audit Page 6

    public int UpdateMETEDAudit_6(string JobNumber, string PrimaryFreezerLocation, string PrimaryFreezerCalculatedCostMonth, string PrimaryFreezerMake, string PrimaryFreezerModel, string PrimaryFreezerYear, string PrimaryFreezerSize, string PrimaryFreezerStartTime, string PrimaryFreezerEndTime, string PrimaryFreezerTotalTimeMonitored, string PrimaryFreezerReading, string PrimaryFreezerkWhconversionatonehour, string IsPrimaryFreezerElligibleForReplacement, string PrimaryFreezerTemperatureInsideFreshFood, string PrimaryFreezerRoomTemperature, string PrimaryFreezerDataBaseUsed, string PrimaryFreezerReplacementSize, string PrimaryFreezerTemperatureinsidefreezer, string PrimaryFreezerDidNotTestBecause, string PrimaryFreezerCouldNotMove, string SecondaryFreezerLocation, string SecondaryFreezerCalculatedCostMonth, string SecondaryFreezerMake, string SecondaryFreezerModel, string SecondaryFreezerYear, string SecondaryFreezerSize, string SecondaryFreezerStartTime, string SecondaryFreezerEndTime, string SecondaryFreezerTotalTimeMonitored, string SecondaryFreezerReading, string SecondaryFreezerkWhconversionatonehour, string SecondaryFreezeTemperatureInsideFreshFood, string SecondaryFreezerRoomTemperature, string IsSecondaryFreezerElligibleForReplacement, string SecondaryFreezerDataBaseUsed, string SecondaryFreezerReplacementSize, string SecondaryFreezerTemperatureinsidefreezer, string SecondaryFreezerDidNotTestBecause, string SecondaryFreezerCouldNotMove, string AdditionalFreezerLocation, string AdditionalFreezerCalculatedCostMonth, string AdditionalFreezerMake, string AdditionalPrimaryFreezerModel, string AdditionalFreezerYear, string AdditionalFreezerSize, string AdditionalFreezerStartTime, string AdditionalFreezerEndTime, string AdditionalFreezerTotalTimeMonitored, string AdditionalFreezerReading, string AdditionalFreezerkWhconversionatonehour, string AdditionalFreezeTemperatureInsideFreshFood, string AdditionalFreezerRoomTemperature, string IsAdditionalFreezerElligibleForReplacement, string AdditionalFreezerDataBaseUsed, string AdditionalFreezerReplacementSize, string AdditionalFreezerTemperatureinsidefreezer, string AdditionalFreezerDidNotTestBecause, string AdditionalFreezerCouldNotMove, string Page6Comments, string freezersUsed, string PrimaryUprightChest, string SecondryUprightChest, string AdditionalUprightChest, string PrimaryFreezerFrostFree, string SecondryFreezerFrostFree, string AdditionalFreezerFrostFree)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage6Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@PrimaryFreezerLocation", PrimaryFreezerLocation);
            cmd.Parameters.AddWithValue("@PrimaryFreezerCalculatedCostMonth", PrimaryFreezerCalculatedCostMonth);
            cmd.Parameters.AddWithValue("@PrimaryFreezerMake", PrimaryFreezerMake);
            cmd.Parameters.AddWithValue("@PrimaryFreezerModel", PrimaryFreezerModel);
            cmd.Parameters.AddWithValue("@PrimaryFreezerYear", PrimaryFreezerYear);
            cmd.Parameters.AddWithValue("@PrimaryFreezerSize", PrimaryFreezerSize);
            cmd.Parameters.AddWithValue("@PrimaryFreezerStartTime", PrimaryFreezerStartTime);
            cmd.Parameters.AddWithValue("@PrimaryFreezerEndTime", PrimaryFreezerEndTime);
            cmd.Parameters.AddWithValue("@PrimaryFreezerTotalTimeMonitored", PrimaryFreezerTotalTimeMonitored);
            cmd.Parameters.AddWithValue("@PrimaryFreezerReading", PrimaryFreezerReading);
            cmd.Parameters.AddWithValue("@PrimaryFreezerkWhconversionatonehour", PrimaryFreezerkWhconversionatonehour);
            cmd.Parameters.AddWithValue("@IsPrimaryFreezerElligibleForReplacement", IsPrimaryFreezerElligibleForReplacement);
            cmd.Parameters.AddWithValue("@PrimaryFreezerTemperatureInsideFreshFood", PrimaryFreezerTemperatureInsideFreshFood);
            cmd.Parameters.AddWithValue("@PrimaryFreezerRoomTemperature", PrimaryFreezerRoomTemperature);
            cmd.Parameters.AddWithValue("@PrimaryFreezerDataBaseUsed", PrimaryFreezerDataBaseUsed);
            cmd.Parameters.AddWithValue("@PrimaryFreezerReplacementSize", PrimaryFreezerReplacementSize);
            cmd.Parameters.AddWithValue("@PrimaryFreezerTemperatureinsidefreezer", PrimaryFreezerTemperatureinsidefreezer);
            cmd.Parameters.AddWithValue("@PrimaryFreezerDidNotTestBecause", PrimaryFreezerDidNotTestBecause);
            cmd.Parameters.AddWithValue("@PrimaryFreezerCouldNotMove", PrimaryFreezerCouldNotMove);
            cmd.Parameters.AddWithValue("@PrimaryUprightChest", PrimaryUprightChest);

            cmd.Parameters.AddWithValue("@SecondaryFreezerLocation", SecondaryFreezerLocation);
            cmd.Parameters.AddWithValue("@SecondaryFreezerCalculatedCostMonth", SecondaryFreezerCalculatedCostMonth);
            cmd.Parameters.AddWithValue("@SecondaryFreezerMake", SecondaryFreezerMake);
            cmd.Parameters.AddWithValue("@SecondaryFreezerModel", SecondaryFreezerModel);
            cmd.Parameters.AddWithValue("@SecondaryFreezerYear", SecondaryFreezerYear);
            cmd.Parameters.AddWithValue("@SecondaryFreezerSize", SecondaryFreezerSize);
            cmd.Parameters.AddWithValue("@SecondaryFreezerStartTime", SecondaryFreezerStartTime);
            cmd.Parameters.AddWithValue("@SecondaryFreezerEndTime", SecondaryFreezerEndTime);
            cmd.Parameters.AddWithValue("@SecondaryFreezerTotalTimeMonitored", SecondaryFreezerTotalTimeMonitored);
            cmd.Parameters.AddWithValue("@SecondaryFreezerReading", SecondaryFreezerReading);
            cmd.Parameters.AddWithValue("@SecondaryFreezerkWhconversionatonehour", SecondaryFreezerkWhconversionatonehour);
            cmd.Parameters.AddWithValue("@SecondaryFreezeTemperatureInsideFreshFood", SecondaryFreezeTemperatureInsideFreshFood);
            cmd.Parameters.AddWithValue("@SecondaryFreezerRoomTemperature", SecondaryFreezerRoomTemperature);
            cmd.Parameters.AddWithValue("@IsSecondaryFreezerElligibleForReplacement", IsSecondaryFreezerElligibleForReplacement);
            cmd.Parameters.AddWithValue("@SecondaryFreezerDataBaseUsed", SecondaryFreezerDataBaseUsed);
            cmd.Parameters.AddWithValue("@SecondaryFreezerReplacementSize", SecondaryFreezerReplacementSize);
            cmd.Parameters.AddWithValue("@SecondaryFreezerTemperatureinsidefreezer", SecondaryFreezerTemperatureinsidefreezer);
            cmd.Parameters.AddWithValue("@SecondaryFreezerDidNotTestBecause", SecondaryFreezerDidNotTestBecause);
            cmd.Parameters.AddWithValue("@SecondaryFreezerCouldNotMove", SecondaryFreezerCouldNotMove);
            cmd.Parameters.AddWithValue("@SecondryUprightChest", SecondryUprightChest);

            cmd.Parameters.AddWithValue("@AdditionalFreezerLocation", AdditionalFreezerLocation);
            cmd.Parameters.AddWithValue("@AdditionalFreezerCalculatedCostMonth", AdditionalFreezerCalculatedCostMonth);
            cmd.Parameters.AddWithValue("@AdditionalFreezerMake", AdditionalFreezerMake);
            cmd.Parameters.AddWithValue("@AdditionalPrimaryFreezerModel", AdditionalPrimaryFreezerModel);
            cmd.Parameters.AddWithValue("@AdditionalFreezerYear", AdditionalFreezerYear);
            cmd.Parameters.AddWithValue("@AdditionalFreezerSize", AdditionalFreezerSize);
            cmd.Parameters.AddWithValue("@AdditionalFreezerStartTime", AdditionalFreezerStartTime);
            cmd.Parameters.AddWithValue("@AdditionalFreezerEndTime", AdditionalFreezerEndTime);
            cmd.Parameters.AddWithValue("@AdditionalFreezerTotalTimeMonitored", AdditionalFreezerTotalTimeMonitored);
            cmd.Parameters.AddWithValue("@AdditionalFreezerReading", AdditionalFreezerReading);
            cmd.Parameters.AddWithValue("@AdditionalFreezerkWhconversionatonehour", AdditionalFreezerkWhconversionatonehour);
            cmd.Parameters.AddWithValue("@AdditionalFreezeTemperatureInsideFreshFood", AdditionalFreezeTemperatureInsideFreshFood);
            cmd.Parameters.AddWithValue("@AdditionalFreezerRoomTemperature", AdditionalFreezerRoomTemperature);
            cmd.Parameters.AddWithValue("@IsAdditionalFreezerElligibleForReplacement", IsAdditionalFreezerElligibleForReplacement);
            cmd.Parameters.AddWithValue("@AdditionalFreezerDataBaseUsed", AdditionalFreezerDataBaseUsed);
            cmd.Parameters.AddWithValue("@AdditionalFreezerReplacementSize", AdditionalFreezerReplacementSize);
            cmd.Parameters.AddWithValue("@AdditionalFreezerTemperatureinsidefreezer", AdditionalFreezerTemperatureinsidefreezer);
            cmd.Parameters.AddWithValue("@AdditionalFreezerDidNotTestBecause", AdditionalFreezerDidNotTestBecause);
            cmd.Parameters.AddWithValue("@AdditionalFreezerCouldNotMove", AdditionalFreezerCouldNotMove);
            cmd.Parameters.AddWithValue("@freezersUsed", freezersUsed);
            cmd.Parameters.AddWithValue("@AdditionalUprightChest", AdditionalUprightChest);

            cmd.Parameters.AddWithValue("@Page6Comments", Page6Comments);
            cmd.Parameters.AddWithValue("@PrimaryFreezerFrostFree", PrimaryFreezerFrostFree);
            cmd.Parameters.AddWithValue("@SecondryFreezerFrostFree", SecondryFreezerFrostFree);
            cmd.Parameters.AddWithValue("@AdditionalFreezerFrostFree", AdditionalFreezerFrostFree);

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_6(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage6Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion



    #region METED Audit Page 7

    public int UpdateMETEDAudit_7(string JobNumber, string NumberOfWasherLoadsPerWeek, string WaterHeaterType, string TemperatureCurrentlyUse, string TemperatureCurrentlyUseOther, string WasherComments, string ElectricDryerLoadPerWeek, string TakeToDryALoad, string DryerType, string IsDryerVentedProperly, string VentingLocation, string MakeANewHole, string ApproxNumberOfFeet, string NumberOfElbows, string AddNewVentCapHood, string AluminumFlexUsed, string WouldAClothesLineBeEffective, string IsOneBeingInstalled, string OtherDryingIssuesComments, string HeatingSystemLine1, string NumberInstalledLine1, string FilterDimensionsLine1, string HeatingSystemLine2, string NumberInstalledLine2, string WindowACLine3, string WindowACNumberInstalledLine3, string FilterDimensionsLine3, string HeatingSystemLine4, string NumberInstalledLine4, string WellPumpUsed, string WaterLeaks, string DehumidifierUsed, string PoolPumpUsed, string SepticSystemGrinders, string WillingToRreplaceWaterbed, string ReplacementSize, string CommentSuchASMoistureVentilation, string CommentPage7, string FilterSlotCovered, string VentingDoneOrNot)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage7Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@FilterSlotCovered", FilterSlotCovered);
            cmd.Parameters.AddWithValue("@NumberOfWasherLoadsPerWeek", NumberOfWasherLoadsPerWeek);
            cmd.Parameters.AddWithValue("@WaterHeaterType", WaterHeaterType);
            cmd.Parameters.AddWithValue("@TemperatureCurrentlyUse", TemperatureCurrentlyUse);
            cmd.Parameters.AddWithValue("@TemperatureCurrentlyUseOther", TemperatureCurrentlyUseOther);
            cmd.Parameters.AddWithValue("@WasherComments", WasherComments);
            cmd.Parameters.AddWithValue("@ElectricDryerLoadPerWeek", ElectricDryerLoadPerWeek);
            cmd.Parameters.AddWithValue("@TakeToDryALoad", TakeToDryALoad);
            cmd.Parameters.AddWithValue("@DryerType", DryerType);
            cmd.Parameters.AddWithValue("@IsDryerVentedProperly", IsDryerVentedProperly);
            cmd.Parameters.AddWithValue("@VentingLocation", VentingLocation);
            cmd.Parameters.AddWithValue("@MakeANewHole", MakeANewHole);
            cmd.Parameters.AddWithValue("@ApproxNumberOfFeet", ApproxNumberOfFeet);
            cmd.Parameters.AddWithValue("@NumberOfElbows", NumberOfElbows);
            cmd.Parameters.AddWithValue("@AddNewVentCapHood", AddNewVentCapHood);
            cmd.Parameters.AddWithValue("@AluminumFlexUsed", AluminumFlexUsed);
            cmd.Parameters.AddWithValue("@WouldAClothesLineBeEffective", WouldAClothesLineBeEffective);
            cmd.Parameters.AddWithValue("@IsOneBeingInstalled", IsOneBeingInstalled);
            cmd.Parameters.AddWithValue("@OtherDryingIssuesComments", OtherDryingIssuesComments);
            cmd.Parameters.AddWithValue("@HeatingSystemLine1", HeatingSystemLine1);
            cmd.Parameters.AddWithValue("@NumberInstalledLine1", NumberInstalledLine1);
            cmd.Parameters.AddWithValue("@FilterDimensionsLine1", FilterDimensionsLine1);
            cmd.Parameters.AddWithValue("@HeatingSystemLine2", HeatingSystemLine2);
            cmd.Parameters.AddWithValue("@NumberInstalledLine2", NumberInstalledLine2);
            cmd.Parameters.AddWithValue("@WindowACLine3", WindowACLine3);
            cmd.Parameters.AddWithValue("@WindowACNumberInstalledLine3", WindowACNumberInstalledLine3);
            cmd.Parameters.AddWithValue("@FilterDimensionsLine3", FilterDimensionsLine3);
            cmd.Parameters.AddWithValue("@HeatingSystemLine4", HeatingSystemLine4);
            cmd.Parameters.AddWithValue("@NumberInstalledLine4", NumberInstalledLine4);
            cmd.Parameters.AddWithValue("@WellPumpUsed", WellPumpUsed);
            cmd.Parameters.AddWithValue("@WaterLeaks", WaterLeaks);
            cmd.Parameters.AddWithValue("@DehumidifierUsed", DehumidifierUsed);
            cmd.Parameters.AddWithValue("@PoolPumpUsed", PoolPumpUsed);
            cmd.Parameters.AddWithValue("@SepticSystemGrinders", SepticSystemGrinders);
            cmd.Parameters.AddWithValue("@WillingToRreplaceWaterbed", WillingToRreplaceWaterbed);
            cmd.Parameters.AddWithValue("@ReplacementSize", ReplacementSize);
            cmd.Parameters.AddWithValue("@CommentSuchASMoistureVentilation", CommentSuchASMoistureVentilation);
            cmd.Parameters.AddWithValue("@CommentPage7", CommentPage7);
            cmd.Parameters.AddWithValue("@VentingDoneOrNot", VentingDoneOrNot);

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_7(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage7Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion



    #region METED Audit Page 8

    public int UpdateMETEDAudit_8(string JobNumber, string WaterHeaterFuelType, string WaterHeaterFuelTypeOther, string WaterHeatingIssuesComments, string IsWaterHeaterLeaking, string IsWaterHeaterRusted, string AreTheElementsBad, string IsUnitRatedR8OrLess, string WillWaterHeaterBeReplaced, string EnergyFactor, string ExistingWaterHeaterSize, string ReplacementWaterHeaterSize, string ReplaceOrAddExpansionTank, string AreYouGoingToReplaceElements, string AreYouGoingToReplaceThermostats, string AreYouGoingToFlushTank, string AreYouGoingToAddPressureReliefValve, string AreYouGoingToAddPressureReliefPipe, string DidYouChangeTemperature, string ExistingTemp, string TestLocation, string AdjustedTemp, string AreYouWrappingWaterPipes, string LinearFeetHOtWater, string LinearFeetHOtWater12_34, string LinearFeetHOtWaterLocation, string LinearFeetColdWater, string LinearFeetColdWater12_34, string LinearFeetColdWaterLocation, string LinearFeetComments, string AreThereAnyOtherLeaks, string AreThereAnyOtherLeaksComments, string AreYouGoingToRepairLeaks, string AreYouGoingToRepairLeaksComments, string FaucetAerators, string BathAeratorInstall, string BathAeratorLocation, string KitchenAeratorInstall, string KitchenAeratorLocation, string showerHead, string swivelHeadInstall, string swivelHeadLocation, string shutoffInstall, string shutoffLocation, string WithOutShutoffInstall, string WithOutShutoffLocation, string handheldInstall, string handheldLocation, string DrainPipeDiameter, string ColdWaterSupply, string DrainPipeWaterHeater, string InstallingGFX, string IsCustomerTODRate, string IsCustomerSavingOnRate, string CustomerLifeStyle, string IsCustomerSwitchToTODRate, string DoesCustomerHaveWaterHeaterTimer, string TimerInstalled, string Page8Comments)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage8Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@WaterHeaterFuelType", WaterHeaterFuelType);
            cmd.Parameters.AddWithValue("@WaterHeaterFuelTypeOther", WaterHeaterFuelTypeOther);
            cmd.Parameters.AddWithValue("@WaterHeatingIssuesComments", WaterHeatingIssuesComments);
            cmd.Parameters.AddWithValue("@IsWaterHeaterLeaking", IsWaterHeaterLeaking);
            cmd.Parameters.AddWithValue("@IsWaterHeaterRusted", IsWaterHeaterRusted);
            cmd.Parameters.AddWithValue("@AreTheElementsBad", AreTheElementsBad);
            cmd.Parameters.AddWithValue("@IsUnitRatedR8OrLess", IsUnitRatedR8OrLess);
            cmd.Parameters.AddWithValue("@WillWaterHeaterBeReplaced", WillWaterHeaterBeReplaced);
            cmd.Parameters.AddWithValue("@EnergyFactor", EnergyFactor);
            cmd.Parameters.AddWithValue("@ExistingWaterHeaterSize", ExistingWaterHeaterSize);
            cmd.Parameters.AddWithValue("@ReplacementWaterHeaterSize", ReplacementWaterHeaterSize);
            cmd.Parameters.AddWithValue("@ReplaceOrAddExpansionTank", ReplaceOrAddExpansionTank);
            cmd.Parameters.AddWithValue("@AreYouGoingToReplaceElements", AreYouGoingToReplaceElements);
            cmd.Parameters.AddWithValue("@AreYouGoingToReplaceThermostats", AreYouGoingToReplaceThermostats);
            cmd.Parameters.AddWithValue("@AreYouGoingToFlushTank", AreYouGoingToFlushTank);
            cmd.Parameters.AddWithValue("@AreYouGoingToAddPressureReliefValve", AreYouGoingToAddPressureReliefValve);
            cmd.Parameters.AddWithValue("@AreYouGoingToAddPressureReliefPipe", AreYouGoingToAddPressureReliefPipe);
            cmd.Parameters.AddWithValue("@DidYouChangeTemperature", DidYouChangeTemperature);
            cmd.Parameters.AddWithValue("@ExistingTemp", ExistingTemp);
            cmd.Parameters.AddWithValue("@TestLocation", TestLocation);
            cmd.Parameters.AddWithValue("@AdjustedTemp", AdjustedTemp);
            cmd.Parameters.AddWithValue("@AreYouWrappingWaterPipes", AreYouWrappingWaterPipes);
            cmd.Parameters.AddWithValue("@LinearFeetHOtWater", LinearFeetHOtWater);
            cmd.Parameters.AddWithValue("@LinearFeetHOtWater12_34", LinearFeetHOtWater12_34);
            cmd.Parameters.AddWithValue("@LinearFeetHOtWaterLocation", LinearFeetHOtWaterLocation);
            cmd.Parameters.AddWithValue("@LinearFeetColdWater", LinearFeetColdWater);
            cmd.Parameters.AddWithValue("@LinearFeetColdWater12_34", LinearFeetColdWater12_34);
            cmd.Parameters.AddWithValue("@LinearFeetColdWaterLocation", LinearFeetColdWaterLocation);
            cmd.Parameters.AddWithValue("@LinearFeetComments", LinearFeetComments);
            cmd.Parameters.AddWithValue("@AreThereAnyOtherLeaks", AreThereAnyOtherLeaks);
            cmd.Parameters.AddWithValue("@AreThereAnyOtherLeaksComments", AreThereAnyOtherLeaksComments);
            cmd.Parameters.AddWithValue("@AreYouGoingToRepairLeaks", AreYouGoingToRepairLeaks);
            cmd.Parameters.AddWithValue("@AreYouGoingToRepairLeaksComments", AreYouGoingToRepairLeaksComments);
            cmd.Parameters.AddWithValue("@FaucetAerators", FaucetAerators);
            cmd.Parameters.AddWithValue("@BathAeratorInstall", BathAeratorInstall);
            cmd.Parameters.AddWithValue("@BathAeratorLocation", BathAeratorLocation);
            cmd.Parameters.AddWithValue("@KitchenAeratorInstall", KitchenAeratorInstall);
            cmd.Parameters.AddWithValue("@KitchenAeratorLocation", KitchenAeratorLocation);
            cmd.Parameters.AddWithValue("@showerHead", showerHead);
            cmd.Parameters.AddWithValue("@swivelHeadInstall", swivelHeadInstall);
            cmd.Parameters.AddWithValue("@swivelHeadLocation", swivelHeadLocation);
            cmd.Parameters.AddWithValue("@shutoffInstall", shutoffInstall);
            cmd.Parameters.AddWithValue("@shutoffLocation", shutoffLocation);
            cmd.Parameters.AddWithValue("@WithOutShutoffInstall", WithOutShutoffInstall);
            cmd.Parameters.AddWithValue("@WithOutShutoffLocation", WithOutShutoffLocation);
            cmd.Parameters.AddWithValue("@handheldInstall", handheldInstall);
            cmd.Parameters.AddWithValue("@handheldLocation", handheldLocation);
            cmd.Parameters.AddWithValue("@DrainPipeDiameter", DrainPipeDiameter);
            cmd.Parameters.AddWithValue("@ColdWaterSupply", ColdWaterSupply);
            cmd.Parameters.AddWithValue("@DrainPipeWaterHeater", DrainPipeWaterHeater);
            cmd.Parameters.AddWithValue("@InstallingGFX", InstallingGFX);
            cmd.Parameters.AddWithValue("@IsCustomerTODRate", IsCustomerTODRate);
            cmd.Parameters.AddWithValue("@IsCustomerSavingOnRate", IsCustomerSavingOnRate);
            cmd.Parameters.AddWithValue("@CustomerLifeStyle", CustomerLifeStyle);
            cmd.Parameters.AddWithValue("@IsCustomerSwitchToTODRate", IsCustomerSwitchToTODRate);
            cmd.Parameters.AddWithValue("@DoesCustomerHaveWaterHeaterTimer", DoesCustomerHaveWaterHeaterTimer);
            cmd.Parameters.AddWithValue("@TimerInstalled", TimerInstalled);
            cmd.Parameters.AddWithValue("@Page8Comments", Page8Comments);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();

        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_8(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage8Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion



    #region METED Audit Page 9

    public int UpdateMETEDAudit_9(string JobNumber, string WaterHeaterHPWH, string Homeowners, string LessThenSix, string NoDirtFloor, string ReplaceTheFilter, string StairsAlongRailing, string ExistingDrain, string GoodShape, string UsageHabits, string AssociatedWithHPWH, string CleanHPWHFilter, string HPWHBeInstalled, string HPWHsize, string Comment, string Signature, string Date)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage9Old";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@WaterHeaterHPWH", WaterHeaterHPWH);
            cmd.Parameters.AddWithValue("@Homeowners", Homeowners);
            cmd.Parameters.AddWithValue("@LessThenSix", LessThenSix);
            cmd.Parameters.AddWithValue("@NoDirtFloor", NoDirtFloor);
            cmd.Parameters.AddWithValue("@ReplaceTheFilter", ReplaceTheFilter);
            cmd.Parameters.AddWithValue("@StairsAlongRailing", StairsAlongRailing);
            cmd.Parameters.AddWithValue("@ExistingDrain", ExistingDrain);
            cmd.Parameters.AddWithValue("@GoodShape", GoodShape);
            cmd.Parameters.AddWithValue("@UsageHabits", UsageHabits);
            cmd.Parameters.AddWithValue("@AssociatedWithHPWH", AssociatedWithHPWH);
            cmd.Parameters.AddWithValue("@CleanHPWHFilter", CleanHPWHFilter);
            cmd.Parameters.AddWithValue("@HPWHBeInstalled", HPWHBeInstalled);
            cmd.Parameters.AddWithValue("@HPWHsize", HPWHsize);
            cmd.Parameters.AddWithValue("@Comment", Comment);
            cmd.Parameters.AddWithValue("@Signature", Signature);
            cmd.Parameters.AddWithValue("@Date", Date);

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();

        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_9(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage9Old";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion



    #region METED Audit Page 10

    public int UpdateMETEDAudit_10(string JobNumber, string SummerSeasonalUse, string WindowsNotShaded, string ApproxSquareFootage, string NumberWestFacingWindows, string NumberSouthFacingWindows, string NumberEastFacingWindows, string RollRoofMaterial, string InstallRoofCoat, string ApproxSquareFootageOfRoofTimes2, string ReduceAirConditioning, string WillInstall, string Comment, string UnitWatts1, string EER1, string ReplaceAC1, string CurrentSize1, string CurrentLocation1, string NewSize1, string InstalledLocation1, string ReplaceFilter1, string CleanFilter1, string UnitWatts2, string EER2, string ReplaceAC2, string CurrentSize2, string CurrentLocation2, string NewSize2, string InstalledLocation2, string ReplaceFilter2, string CleanFilter2, string UnitWatts3, string EER3, string ReplaceAC3, string CurrentSize3, string CurrentLocation3, string NewSize3, string InstalledLocation3, string ReplaceFilter3, string CleanFilter3, string UnitWatts4, string EER4, string ReplaceAC4, string CurrentSize4, string CurrentLocation4, string NewSize4, string InstalledLocation4, string ReplaceFilter4, string CleanFilter4, string UnitWatts5, string EER5, string ReplaceAC5, string CurrentSize5, string CurrentLocation5, string NewSize5, string InstalledLocation5, string ReplaceFilter5, string CleanFilter5, string ThermostatUseHabitsComment, string TotalNumberUnitsReplace, string CentralACThermostatUseHabits, string CentralACThermostatAccurate, string CentralACThermostatAccurateNotComment, string ReplacementOfThermostat, string FilterSlotCovered, string LocationOfA_Coil, string InspectTheA_Coil, string CleaningRecommended, string CleaningPerformedBy, string WarrantPartyCleanAndTune, string PartyContractorContacted, string CleanORTune, string TuneRecommendedComment, string InstalledTheSystem, string NumberInstalled, string CleanTheSystem, string NumberClean, string CoiltobeClean, string UnittobeReplaced, string SizeOfUnit, string DuctWorkThermalBoundary, string DuctWorkThermalBoundaryLocation, string InsulationtobeInstalled, string SealingtobeCompleted, string Comment2, string NewestACUnit, string CentralACUnit, string FilterDimension)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage9Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@SummerSeasonalUse", SummerSeasonalUse);
            cmd.Parameters.AddWithValue("@WindowsNotShaded", WindowsNotShaded);
            cmd.Parameters.AddWithValue("@ApproxSquareFootage", ApproxSquareFootage);
            cmd.Parameters.AddWithValue("@NumberWestFacingWindows", NumberWestFacingWindows);
            cmd.Parameters.AddWithValue("@NumberSouthFacingWindows", NumberSouthFacingWindows);
            cmd.Parameters.AddWithValue("@NumberEastFacingWindows", NumberEastFacingWindows);
            cmd.Parameters.AddWithValue("@RollRoofMaterial", RollRoofMaterial);
            cmd.Parameters.AddWithValue("@InstallRoofCoat", InstallRoofCoat);
            cmd.Parameters.AddWithValue("@ApproxSquareFootageOfRoofTimes2", ApproxSquareFootageOfRoofTimes2);
            cmd.Parameters.AddWithValue("@ReduceAirConditioning", ReduceAirConditioning);
            cmd.Parameters.AddWithValue("@WillInstall", WillInstall);
            cmd.Parameters.AddWithValue("@Comment", Comment);
            cmd.Parameters.AddWithValue("@UnitWatts1", UnitWatts1);
            cmd.Parameters.AddWithValue("@EER1", EER1);
            cmd.Parameters.AddWithValue("@ReplaceAC1", ReplaceAC1);
            cmd.Parameters.AddWithValue("@CurrentSize1", CurrentSize1);
            cmd.Parameters.AddWithValue("@CurrentLocation1", CurrentLocation1);
            cmd.Parameters.AddWithValue("@NewSize1", NewSize1);
            cmd.Parameters.AddWithValue("@InstalledLocation1", InstalledLocation1);
            cmd.Parameters.AddWithValue("@ReplaceFilter1", ReplaceFilter1);
            cmd.Parameters.AddWithValue("@CleanFilter1", CleanFilter1);
            cmd.Parameters.AddWithValue("@UnitWatts2", UnitWatts2);
            cmd.Parameters.AddWithValue("@EER2", EER2);
            cmd.Parameters.AddWithValue("@ReplaceAC2", ReplaceAC2);
            cmd.Parameters.AddWithValue("@CurrentSize2", CurrentSize2);
            cmd.Parameters.AddWithValue("@CurrentLocation2", CurrentLocation2);
            cmd.Parameters.AddWithValue("@NewSize2", NewSize2);
            cmd.Parameters.AddWithValue("@InstalledLocation2", InstalledLocation2);
            cmd.Parameters.AddWithValue("@ReplaceFilter2", ReplaceFilter2);
            cmd.Parameters.AddWithValue("@CleanFilter2", CleanFilter2);
            cmd.Parameters.AddWithValue("@UnitWatts3", UnitWatts3);
            cmd.Parameters.AddWithValue("@EER3", EER3);
            cmd.Parameters.AddWithValue("@ReplaceAC3", ReplaceAC3);
            cmd.Parameters.AddWithValue("@CurrentSize3", CurrentSize3);
            cmd.Parameters.AddWithValue("@CurrentLocation3", CurrentLocation3);
            cmd.Parameters.AddWithValue("@NewSize3", NewSize3);
            cmd.Parameters.AddWithValue("@InstalledLocation3", InstalledLocation3);
            cmd.Parameters.AddWithValue("@ReplaceFilter3", ReplaceFilter3);
            cmd.Parameters.AddWithValue("@CleanFilter3", CleanFilter3);
            cmd.Parameters.AddWithValue("@UnitWatts4", UnitWatts4);
            cmd.Parameters.AddWithValue("@EER4", EER4);
            cmd.Parameters.AddWithValue("@ReplaceAC4", ReplaceAC4);
            cmd.Parameters.AddWithValue("@CurrentSize4", CurrentSize4);
            cmd.Parameters.AddWithValue("@CurrentLocation4", CurrentLocation4);
            cmd.Parameters.AddWithValue("@NewSize4", NewSize4);
            cmd.Parameters.AddWithValue("@InstalledLocation4", InstalledLocation4);
            cmd.Parameters.AddWithValue("@ReplaceFilter4", ReplaceFilter4);
            cmd.Parameters.AddWithValue("@CleanFilter4", CleanFilter4);

            cmd.Parameters.AddWithValue("@UnitWatts5", UnitWatts5);
            cmd.Parameters.AddWithValue("@EER5", EER5);
            cmd.Parameters.AddWithValue("@ReplaceAC5", ReplaceAC5);
            cmd.Parameters.AddWithValue("@CurrentSize5", CurrentSize5);
            cmd.Parameters.AddWithValue("@CurrentLocation5", CurrentLocation5);
            cmd.Parameters.AddWithValue("@NewSize5", NewSize5);
            cmd.Parameters.AddWithValue("@InstalledLocation5", InstalledLocation5);
            cmd.Parameters.AddWithValue("@ReplaceFilter5", ReplaceFilter5);
            cmd.Parameters.AddWithValue("@CleanFilter5", CleanFilter5);
            cmd.Parameters.AddWithValue("@ThermostatUseHabitsComment", ThermostatUseHabitsComment);
            cmd.Parameters.AddWithValue("@TotalNumberUnitsReplace", TotalNumberUnitsReplace);
            cmd.Parameters.AddWithValue("@CentralACThermostatUseHabits", CentralACThermostatUseHabits);
            cmd.Parameters.AddWithValue("@CentralACThermostatAccurate", CentralACThermostatAccurate);
            cmd.Parameters.AddWithValue("@CentralACThermostatAccurateNotComment", CentralACThermostatAccurateNotComment);
            cmd.Parameters.AddWithValue("@ReplacementOfThermostat", ReplacementOfThermostat);
            cmd.Parameters.AddWithValue("@FilterSlotCovered", FilterSlotCovered);
            cmd.Parameters.AddWithValue("@LocationOfA_Coil", LocationOfA_Coil);
            cmd.Parameters.AddWithValue("@InspectTheA_Coil", InspectTheA_Coil);
            cmd.Parameters.AddWithValue("@CleaningRecommended", CleaningRecommended);
            cmd.Parameters.AddWithValue("@CleaningPerformedBy", CleaningPerformedBy);
            cmd.Parameters.AddWithValue("@WarrantPartyCleanAndTune", WarrantPartyCleanAndTune);
            cmd.Parameters.AddWithValue("@PartyContractorContacted", PartyContractorContacted);
            cmd.Parameters.AddWithValue("@CleanORTune", CleanORTune);
            cmd.Parameters.AddWithValue("@TuneRecommendedComment", TuneRecommendedComment);
            cmd.Parameters.AddWithValue("@InstalledTheSystem", InstalledTheSystem);
            cmd.Parameters.AddWithValue("@NumberInstalled", NumberInstalled);
            cmd.Parameters.AddWithValue("@CleanTheSystem", CleanTheSystem);
            cmd.Parameters.AddWithValue("@NumberClean", NumberClean);
            cmd.Parameters.AddWithValue("@CoiltobeClean", CoiltobeClean);
            cmd.Parameters.AddWithValue("@UnittobeReplaced", UnittobeReplaced);
            cmd.Parameters.AddWithValue("@SizeOfUnit", SizeOfUnit);
            cmd.Parameters.AddWithValue("@DuctWorkThermalBoundary", DuctWorkThermalBoundary);
            cmd.Parameters.AddWithValue("@DuctWorkThermalBoundaryLocation", DuctWorkThermalBoundaryLocation);
            cmd.Parameters.AddWithValue("@InsulationtobeInstalled", InsulationtobeInstalled);
            cmd.Parameters.AddWithValue("@SealingtobeCompleted", SealingtobeCompleted);
            cmd.Parameters.AddWithValue("@NewestACUnit", NewestACUnit);
            cmd.Parameters.AddWithValue("@CentralACUnit", CentralACUnit);
            cmd.Parameters.AddWithValue("@FilterDimension", FilterDimension);
            cmd.Parameters.AddWithValue("@Comment2", Comment2);

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();

        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_10(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage9Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion



    #region METED Audit Page 11

    public int UpdateMETEDAudit_11(string JobNumber, string ThermostatUsehabit, string ThermostatAccurate, string ThermostatAccurateComment, string SlotCovered, string InspectA_Coil, string CleaningRecommended, string CleanerformeBy, string WarrantPartyCleanTune, string PartyContacted, string CleanTune, string CleanTuneRecommendedComment, string HeatPumpInstallSystem, string HeatPumpNumberInstall, string HeatPumpCleanSystem, string HeatPumpNumberClean, string HeatPumpCoilsClean, string HeatPumpReplace, string HeatPumpSizeUnit, string HeatPumpThermalBoundary, string HeatPumpThermalBoundaryLocation, string HeatPumpInsulationInstall, string HeatPumpSealingComplete, string HeatPumpEnergy, string Comment1, string ElectricHeatType, string ElectricHeatTypeOther, string ElectricHeatThermostatUseHabit, string ElectricHeatThermostatAccurate, string ElectricHeatThermostatAccurateComment, string ElectricHeatReplacementThermostat, string ElectricHeatReplacementThermostatDetail, string ElectricHeatSlotCover, string ElectricHeatLocationThermostat, string ElectricHeatCleanTune, string ElectricHeatCleanTuneRecommendedComment, string ElectricHeatInstallSystem, string ElectricHeatNumberInstall, string ElectricHeatCleanSystem, string ElectricHeatNumberClean, string ElectricHeaterReplace, string ElectricHeatSizeUnit, string ElectricHeatSystemRepair, string ElectricHeatSystemRepairDetail, string PrimaryHeatSource, string PrimaryHeatSourceLocation, string ElectricHeatThermalBoundary, string ElectricHeatThermalBoundaryLocation, string ElectricHeatInsulationInstall, string ElectricHeatSealingComplete, string Comment2, string CustomerheatPump, string CustomerheatPumpOther)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage10Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@ThermostatUsehabit", ThermostatUsehabit);
            cmd.Parameters.AddWithValue("@ThermostatAccurate", ThermostatAccurate);
            cmd.Parameters.AddWithValue("@ThermostatAccurateComment", ThermostatAccurateComment);
            cmd.Parameters.AddWithValue("@SlotCovered", SlotCovered);
            cmd.Parameters.AddWithValue("@InspectA_Coil", InspectA_Coil);
            cmd.Parameters.AddWithValue("@CleaningRecommended", CleaningRecommended);
            cmd.Parameters.AddWithValue("@CleanerformeBy", CleanerformeBy);
            cmd.Parameters.AddWithValue("@WarrantPartyCleanTune", WarrantPartyCleanTune);
            cmd.Parameters.AddWithValue("@PartyContacted", PartyContacted);
            cmd.Parameters.AddWithValue("@CleanTune", CleanTune);
            cmd.Parameters.AddWithValue("@CleanTuneRecommendedComment", CleanTuneRecommendedComment);
            cmd.Parameters.AddWithValue("@HeatPumpInstallSystem", HeatPumpInstallSystem);
            cmd.Parameters.AddWithValue("@HeatPumpNumberInstall", HeatPumpNumberInstall);
            cmd.Parameters.AddWithValue("@HeatPumpCleanSystem", HeatPumpCleanSystem);
            cmd.Parameters.AddWithValue("@HeatPumpNumberClean", HeatPumpNumberClean);
            cmd.Parameters.AddWithValue("@HeatPumpCoilsClean ", HeatPumpCoilsClean);
            cmd.Parameters.AddWithValue("@HeatPumpReplace", HeatPumpReplace);
            cmd.Parameters.AddWithValue("@HeatPumpSizeUnit", HeatPumpSizeUnit);
            cmd.Parameters.AddWithValue("@HeatPumpThermalBoundary", HeatPumpThermalBoundary);
            cmd.Parameters.AddWithValue("@HeatPumpThermalBoundaryLocation", HeatPumpThermalBoundaryLocation);
            cmd.Parameters.AddWithValue("@HeatPumpInsulationInstall", HeatPumpInsulationInstall);
            cmd.Parameters.AddWithValue("@HeatPumpSealingComplete", HeatPumpSealingComplete);
            cmd.Parameters.AddWithValue("@HeatPumpEnergy", HeatPumpEnergy);
            cmd.Parameters.AddWithValue("@Comment1", Comment1);
            cmd.Parameters.AddWithValue("@ElectricHeatType", ElectricHeatType);
            cmd.Parameters.AddWithValue("@ElectricHeatTypeOther", ElectricHeatTypeOther);
            cmd.Parameters.AddWithValue("@ElectricHeatThermostatUseHabit", ElectricHeatThermostatUseHabit);
            cmd.Parameters.AddWithValue("@ElectricHeatThermostatAccurate", ElectricHeatThermostatAccurate);
            cmd.Parameters.AddWithValue("@ElectricHeatThermostatAccurateComment", ElectricHeatThermostatAccurateComment);
            cmd.Parameters.AddWithValue("@ElectricHeatReplacementThermostat", ElectricHeatReplacementThermostat);
            cmd.Parameters.AddWithValue("@ElectricHeatReplacementThermostatDetail", ElectricHeatReplacementThermostatDetail);
            cmd.Parameters.AddWithValue("@ElectricHeatSlotCover", ElectricHeatSlotCover);
            cmd.Parameters.AddWithValue("@ElectricHeatLocationThermostat", ElectricHeatLocationThermostat);
            cmd.Parameters.AddWithValue("@ElectricHeatCleanTune", ElectricHeatCleanTune);
            cmd.Parameters.AddWithValue("@ElectricHeatCleanTuneRecommendedComment", ElectricHeatCleanTuneRecommendedComment);
            cmd.Parameters.AddWithValue("@ElectricHeatInstallSystem", ElectricHeatInstallSystem);
            cmd.Parameters.AddWithValue("@ElectricHeatNumberInstall", ElectricHeatNumberInstall);
            cmd.Parameters.AddWithValue("@ElectricHeatCleanSystem", ElectricHeatCleanSystem);
            cmd.Parameters.AddWithValue("@ElectricHeatNumberClean", ElectricHeatNumberClean);
            cmd.Parameters.AddWithValue("@ElectricHeaterReplace", ElectricHeaterReplace);
            cmd.Parameters.AddWithValue("@ElectricHeatSizeUnit", ElectricHeatSizeUnit);
            cmd.Parameters.AddWithValue("@ElectricHeatSystemRepair", ElectricHeatSystemRepair);
            cmd.Parameters.AddWithValue("@ElectricHeatSystemRepairDetail", ElectricHeatSystemRepairDetail);
            cmd.Parameters.AddWithValue("@PrimaryHeatSource", PrimaryHeatSource);
            cmd.Parameters.AddWithValue("@PrimaryHeatSourceLocation", PrimaryHeatSourceLocation);
            cmd.Parameters.AddWithValue("@ElectricHeatThermalBoundary", ElectricHeatThermalBoundary);
            cmd.Parameters.AddWithValue("@ElectricHeatThermalBoundaryLocation", ElectricHeatThermalBoundaryLocation);
            cmd.Parameters.AddWithValue("@ElectricHeatInsulationInstall", ElectricHeatInsulationInstall);
            cmd.Parameters.AddWithValue("@ElectricHeatSealingComplete", ElectricHeatSealingComplete);
            cmd.Parameters.AddWithValue("@Comment2", Comment2);
            cmd.Parameters.AddWithValue("@CustomerheatPump", CustomerheatPump);
            cmd.Parameters.AddWithValue("@CustomerheatPumpOther", CustomerheatPumpOther);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_11(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage10Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {


        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion


    #region METED Audit Page 12

    public int UpdateMETEDAudit_12(string JobNumber, string FossilFuelAdditionalDuctRun, string PrimaryHeatingSource, string ElectricSpaceHeating, string ListMeasuresInstallComment, string BlowerDoorTestNotCompleteComment, string LocationOfAirLeaks1_1, string LocationOfAirLeaks1_2, string LocationOfAirLeaks2_1, string LocationOfAirLeaks2_2, string LiveKnobTube, string LiveKnobTubeLocation, string LiveKnobTubeAbatement, string EvidenceOfMold, string EvidenceOfMoisture, string EvidenceOfMoistureLocation, string RoofLeaksPoorDrainageComment, string KitchenExisting, string KitchenMeasuredFanFlow, string KitchenCFMAdd, string VentsOutRecirculates, string VentsOutRecirculatesComment, string KitchenComment, string Bathroom1Existing, string Bathroom1MeasureFanFlow, string Bathroom1CFMAdd, string Bathrooms1LightExisting, string Bathroom1ReplaceRequireLight, string Bathroom1FanOwnSwitch, string Bathroom1FanShareSwitch, string Bathroom1Comment, string Bathroom2Existing, string Bathroom2MeasureFanFlow, string Bathroom2CFMAdd, string Bathrooms2LightExisting, string Bathroom2ReplaceRequireLight, string Bathroom2FanOwnSwitch, string Bathroom2FanShareSwitch, string Bathroom2Comment, string AddingFanCeiling, string AddingFanCeilingComment, string AddingFanWall, string AddingFanWallComment, string Wall_Location, string Ceiling_Location, string KitchenRecirculates, string KitchenVentingFan, string KitchenAddingFan, string KitchenSize, string KitchenRangeHood, string KitchenThroughTheWall, string KitchenPreFanFlow, string KitchenPostFanFlow, string Floor1, string Floor1stBathroomsVentingFan, string Floor1stBathroomsAddingFan, string Floor1stBathroomsIfAddingFan, string Floor1stBathroomsPreFanFlow, string Floor1stBathroomsPostFanFlow, string Floor1stBathroomsSize, string Floor2, string Floor2stBathroomsVentingFan, string Floor2stBathroomsAddingFan, string Floor2stBathroomsIfAddingFan, string Floor2stBathroomsPreFanFlow, string Floor2stBathroomsPostFanFlow, string Floor2stBathroomsSize)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage12";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@FossilFuelAdditionalDuctRun", FossilFuelAdditionalDuctRun);
            cmd.Parameters.AddWithValue("@PrimaryHeatingSource", PrimaryHeatingSource);
            cmd.Parameters.AddWithValue("@ElectricSpaceHeating", ElectricSpaceHeating);
            cmd.Parameters.AddWithValue("@ListMeasuresInstallComment", ListMeasuresInstallComment);
            cmd.Parameters.AddWithValue("@BlowerDoorTestNotCompleteComment", BlowerDoorTestNotCompleteComment);

            cmd.Parameters.AddWithValue("@LocationOfAirLeaks1_1", LocationOfAirLeaks1_1);
            cmd.Parameters.AddWithValue("@LocationOfAirLeaks1_2", LocationOfAirLeaks1_2);
            cmd.Parameters.AddWithValue("@LocationOfAirLeaks2_1", LocationOfAirLeaks2_1);
            cmd.Parameters.AddWithValue("@LocationOfAirLeaks2_2", LocationOfAirLeaks2_2);

            cmd.Parameters.AddWithValue("@LiveKnobTube", LiveKnobTube);
            cmd.Parameters.AddWithValue("@LiveKnobTubeLocation", LiveKnobTubeLocation);
            cmd.Parameters.AddWithValue("@LiveKnobTubeAbatement", LiveKnobTubeAbatement);
            cmd.Parameters.AddWithValue("@EvidenceOfMold", EvidenceOfMold);
            cmd.Parameters.AddWithValue("@EvidenceOfMoisture", EvidenceOfMoisture);
            cmd.Parameters.AddWithValue("@EvidenceOfMoistureLocation", EvidenceOfMoistureLocation);
            cmd.Parameters.AddWithValue("@RoofLeaksPoorDrainageComment", RoofLeaksPoorDrainageComment);

            cmd.Parameters.AddWithValue("@KitchenExisting", KitchenExisting);
            cmd.Parameters.AddWithValue("@KitchenMeasuredFanFlow", KitchenMeasuredFanFlow);
            cmd.Parameters.AddWithValue("@KitchenCFMAdd", KitchenCFMAdd);
            cmd.Parameters.AddWithValue("@VentsOutRecirculates", VentsOutRecirculates);
            cmd.Parameters.AddWithValue("@VentsOutRecirculatesComment", VentsOutRecirculatesComment);
            cmd.Parameters.AddWithValue("@KitchenComment", KitchenComment);


            cmd.Parameters.AddWithValue("@Bathroom1Existing", Bathroom1Existing);
            cmd.Parameters.AddWithValue("@Bathroom1MeasureFanFlow", Bathroom1MeasureFanFlow);
            cmd.Parameters.AddWithValue("@Bathroom1CFMAdd", Bathroom1CFMAdd);
            cmd.Parameters.AddWithValue("@Bathrooms1LightExisting", Bathrooms1LightExisting);
            cmd.Parameters.AddWithValue("@Bathroom1ReplaceRequireLight", Bathroom1ReplaceRequireLight);
            cmd.Parameters.AddWithValue("@Bathroom1FanOwnSwitch", Bathroom1FanOwnSwitch);
            cmd.Parameters.AddWithValue("@Bathroom1FanShareSwitch", Bathroom1FanShareSwitch);
            cmd.Parameters.AddWithValue("@Bathroom1Comment", Bathroom1Comment);

            cmd.Parameters.AddWithValue("@Bathroom2Existing", Bathroom2Existing);
            cmd.Parameters.AddWithValue("@Bathroom2MeasureFanFlow", Bathroom2MeasureFanFlow);
            cmd.Parameters.AddWithValue("@Bathroom2CFMAdd", Bathroom2CFMAdd);
            cmd.Parameters.AddWithValue("@Bathrooms2LightExisting", Bathrooms2LightExisting);
            cmd.Parameters.AddWithValue("@Bathroom2ReplaceRequireLight", Bathroom2ReplaceRequireLight);
            cmd.Parameters.AddWithValue("@Bathroom2FanOwnSwitch", Bathroom2FanOwnSwitch);
            cmd.Parameters.AddWithValue("@Bathroom2FanShareSwitch", Bathroom2FanShareSwitch);
            cmd.Parameters.AddWithValue("@Bathroom2Comment", Bathroom2Comment);

            cmd.Parameters.AddWithValue("@AddingFanCeiling", AddingFanCeiling);
            cmd.Parameters.AddWithValue("@AddingFanCeilingComment", AddingFanCeilingComment);
            cmd.Parameters.AddWithValue("@AddingFanWall", AddingFanWall);
            cmd.Parameters.AddWithValue("@AddingFanWallComment", AddingFanWallComment);
            cmd.Parameters.AddWithValue("@Wall_Location", Wall_Location);
            cmd.Parameters.AddWithValue("@Ceiling_Location", Ceiling_Location);

            cmd.Parameters.AddWithValue("@KitchenRecirculates",KitchenRecirculates);
            cmd.Parameters.AddWithValue("@KitchenVentingFan",KitchenVentingFan);
            cmd.Parameters.AddWithValue("@KitchenAddingFan",KitchenAddingFan);
            cmd.Parameters.AddWithValue("@KitchenSize", KitchenSize);
            cmd.Parameters.AddWithValue("@KitchenRangeHood", KitchenRangeHood);
            cmd.Parameters.AddWithValue("@KitchenThroughTheWall",KitchenThroughTheWall);
            cmd.Parameters.AddWithValue("@KitchenPreFanFlow",KitchenPreFanFlow);
            cmd.Parameters.AddWithValue("@KitchenPostFanFlow",KitchenPostFanFlow);
            cmd.Parameters.AddWithValue("@Floor1",Floor1);
            cmd.Parameters.AddWithValue("@Floor1stBathroomsVentingFan",Floor1stBathroomsVentingFan);
            cmd.Parameters.AddWithValue("@Floor1stBathroomsAddingFan",Floor1stBathroomsAddingFan);
            cmd.Parameters.AddWithValue("@Floor1stBathroomsIfAddingFan",Floor1stBathroomsIfAddingFan);
            cmd.Parameters.AddWithValue("@Floor1stBathroomsPreFanFlow",Floor1stBathroomsPreFanFlow);
            cmd.Parameters.AddWithValue("@Floor1stBathroomsPostFanFlow",Floor1stBathroomsPostFanFlow);
            cmd.Parameters.AddWithValue("@Floor1stBathroomsSize",Floor1stBathroomsSize);
            cmd.Parameters.AddWithValue("@Floor2",Floor2);
            cmd.Parameters.AddWithValue("@Floor2stBathroomsVentingFan",Floor2stBathroomsVentingFan);
            cmd.Parameters.AddWithValue("@Floor2stBathroomsAddingFan",Floor2stBathroomsAddingFan);
            cmd.Parameters.AddWithValue("@Floor2stBathroomsIfAddingFan",Floor2stBathroomsIfAddingFan);
            cmd.Parameters.AddWithValue("@Floor2stBathroomsPreFanFlow",Floor2stBathroomsPreFanFlow);
            cmd.Parameters.AddWithValue("@Floor2stBathroomsPostFanFlow",Floor2stBathroomsPostFanFlow);
            cmd.Parameters.AddWithValue("@Floor2stBathroomsSize",Floor2stBathroomsSize);











            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_12(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage12";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion



    #region METED Audit Page 13

    public int UpdateMETEDAudit_13(string JobNumber, string Line1Other, string Line2Other, string Line3Other, string Line4Other, string Line5Other)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage13";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@Line1Other", Line1Other);
            cmd.Parameters.AddWithValue("@Line2Other", Line2Other);
            cmd.Parameters.AddWithValue("@Line3Other", Line3Other);
            cmd.Parameters.AddWithValue("@Line4Other", Line4Other);
            cmd.Parameters.AddWithValue("@Line5Other", Line5Other);

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_13(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage13";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion


    #region METED Audit Page 14

    public int UpdateMETEDAudit_14(string JobNumber, string BasementSealing, string OtherBasementSealingComments, string FloorCrawlLocation, string FloorCrawlSpaceSqFt, string FloorCrawlSpaceExistingRValue, string FloorCrawlSpaceAddR, string FloorCrawlSpaceNewInsulation, string FloorCrawlSpaceComments, string PerimeterLocation, string PerimeterSqFt, string PerimeterExistingRValue, string PerimeterAddR, string PerimeterNewInsulation, string PerimeterComments, string OtherLocation, string OtherSqFt, string OtherExistingRValue, string OtherAddR, string OtherNewInsulation, string OtherComments, string BellyLocation, string BellySqFt, string BellyExistingRValue, string BellyAddR, string BellyNewInsulation, string BellyComments, string InstallGroundCover, string InstallGroundCoverComment, string AnyKneewalls, string BlockedJoistBays, string BlockInsulation, string UF_Attic_1_Location, string UF_Attic_1_SqFt, string UF_Attic_1_ExistingRValue, string UF_Attic_1_AddR, string UF_Attic_1_NewInsulation, string UF_Attic_1_Comment, string UF_Attic_2_Location, string UF_Attic_2_SqFt, string UF_Attic_2_ExistingRValue, string UF_Attic_2_AddR, string UF_Attic_2_NewInsulation, string UF_Attic_2_Comment, string UF_Attic_3_Location, string UF_Attic_3_SqFt, string UF_Attic_3_ExistingRValue, string UF_Attic_3_AddR, string UF_Attic_3_NewInsulation, string UF_Attic_3_Comment, string F_Attic_1_Location, string F_Attic_1_SqFt, string F_Attic_1_ExistingRValue, string F_Attic_1_AddR, string F_Attic_1_NewInsulation, string F_Attic_1_Comment, string F_Attic_2_Location, string F_Attic_2_SqFt, string F_Attic_2_ExistingRValue, string F_Attic_2_AddR, string F_Attic_2_NewInsulation, string F_Attic_2_Comment, string Cathedral_Location, string Cathedral_SqFt, string Cathedral_ExistingRValue, string Cathedral_AddR, string Cathedral_NewInsulation, string Cathedral_Comment, string FinishAttic_Location, string FinishAttic_SqFt, string FinishAttic_ExistingRValue, string FinishAttic_AddR, string FinishAttic_NewInsulation, string FinishAttic_Comment, string KneewallFloor_Location, string KneewallFloor_SqFt, string KneewallFloor_ExistingRValue, string KneewallFloor_AddR, string KneewallFloor_NewInsulation, string KneewallFloor_Comment, string KneewallUnfloor_Location, string KneewallUnfloor_SqFt, string KneewallUnfloor_ExistingRValue, string KneewallUnfloor_AddR, string KneewallUnfloor_NewInsulation, string KneewallUnfloor_Comment, string Slopes_Location, string Slopes_SqFt, string Slopes_ExistingRValue, string Slopes_AddR, string Slopes_NewInsulation, string Slopes_Comment, string VerticalKneewall_Location, string VerticalKneewall_SqFt, string VerticalKneewall_ExistingRValue, string VerticalKneewall_AddR, string VerticalKneewall_NewInsulation, string VerticalKneewall_Comment, string VerticalKneewall2_Location, string VerticalKneewall2_SqFt, string VerticalKneewall2_ExistingRValue, string VerticalKneewall2_AddR, string VerticalKneewall2_NewInsulation, string VerticalKneewall2_Comment, string Area1, string Area1_Location, string Area1_Sqft, string Area1_ExistingRValue, string Area1_AddR, string Area1_NewInsulation, string Area1_Comment, string Area2, string Area2_Location, string Area2_Sqft, string Area2_ExistingRValue, string Area2_AddR, string Area2_NewInsulation, string Area2_Comment, string Area3, string Area3_Location, string Area3_Sqft, string Area3_ExistingRValue, string Area3_AddR, string Area3_NewInsulation, string Area3_Comment, string AdditionalVentilation_Line1, string Location_Line1, string Comments_Line1, string AdditionalVentilation_Line2, string Location_Line2, string Comments_Line2, string AdditionalVentilation_Line3, string Location_Line3, string Comments_Line3, string AdditionalVentilation_Line4, string Location_Line4, string Comments_Line4, string Page14_Comment)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage13Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@BasementSealing", BasementSealing);
            cmd.Parameters.AddWithValue("@OtherBasementSealingComments", OtherBasementSealingComments);
            cmd.Parameters.AddWithValue("@FloorCrawlLocation", FloorCrawlLocation);
            cmd.Parameters.AddWithValue("@FloorCrawlSpaceSqFt", FloorCrawlSpaceSqFt);
            cmd.Parameters.AddWithValue("@FloorCrawlSpaceExistingRValue", FloorCrawlSpaceExistingRValue);
            cmd.Parameters.AddWithValue("@FloorCrawlSpaceAddR", FloorCrawlSpaceAddR);
            cmd.Parameters.AddWithValue("@FloorCrawlSpaceNewInsulation", FloorCrawlSpaceNewInsulation);
            cmd.Parameters.AddWithValue("@FloorCrawlSpaceComments", FloorCrawlSpaceComments);
            cmd.Parameters.AddWithValue("@PerimeterLocation", PerimeterLocation);
            cmd.Parameters.AddWithValue("@PerimeterSqFt", PerimeterSqFt);
            cmd.Parameters.AddWithValue("@PerimeterExistingRValue", PerimeterExistingRValue);
            cmd.Parameters.AddWithValue("@PerimeterAddR", PerimeterAddR);
            cmd.Parameters.AddWithValue("@PerimeterNewInsulation", PerimeterNewInsulation);
            cmd.Parameters.AddWithValue("@PerimeterComments", PerimeterComments);
            cmd.Parameters.AddWithValue("@OtherLocation", OtherLocation);
            cmd.Parameters.AddWithValue("@OtherSqFt", OtherSqFt);
            cmd.Parameters.AddWithValue("@OtherExistingRValue", OtherExistingRValue);
            cmd.Parameters.AddWithValue("@OtherAddR", OtherAddR);
            cmd.Parameters.AddWithValue("@OtherNewInsulation", OtherNewInsulation);
            cmd.Parameters.AddWithValue("@OtherComments", OtherComments);
            cmd.Parameters.AddWithValue("@BellyLocation", BellyLocation);
            cmd.Parameters.AddWithValue("@BellySqFt", BellySqFt);
            cmd.Parameters.AddWithValue("@BellyExistingRValue", BellyExistingRValue);
            cmd.Parameters.AddWithValue("@BellyAddR", BellyAddR);
            cmd.Parameters.AddWithValue("@BellyNewInsulation", BellyNewInsulation);
            cmd.Parameters.AddWithValue("@BellyComments", BellyComments);
            cmd.Parameters.AddWithValue("@InstallGroundCover", InstallGroundCover);
            cmd.Parameters.AddWithValue("@InstallGroundCoverComment", InstallGroundCoverComment);
            cmd.Parameters.AddWithValue("@AnyKneewalls", AnyKneewalls);
            cmd.Parameters.AddWithValue("@BlockedJoistBays", BlockedJoistBays);
            cmd.Parameters.AddWithValue("@BlockInsulation", BlockInsulation);
            cmd.Parameters.AddWithValue("@UF_Attic_1_Location", UF_Attic_1_Location);
            cmd.Parameters.AddWithValue("@UF_Attic_1_SqFt", UF_Attic_1_SqFt);
            cmd.Parameters.AddWithValue("@UF_Attic_1_ExistingRValue", UF_Attic_1_ExistingRValue);
            cmd.Parameters.AddWithValue("@UF_Attic_1_AddR", UF_Attic_1_AddR);
            cmd.Parameters.AddWithValue("@UF_Attic_1_NewInsulation", UF_Attic_1_NewInsulation);
            cmd.Parameters.AddWithValue("@UF_Attic_1_Comment", UF_Attic_1_Comment);
            cmd.Parameters.AddWithValue("@UF_Attic_2_Location", UF_Attic_2_Location);
            cmd.Parameters.AddWithValue("@UF_Attic_2_SqFt", UF_Attic_2_SqFt);
            cmd.Parameters.AddWithValue("@UF_Attic_2_ExistingRValue", UF_Attic_2_ExistingRValue);
            cmd.Parameters.AddWithValue("@UF_Attic_2_AddR", UF_Attic_2_AddR);
            cmd.Parameters.AddWithValue("@UF_Attic_2_NewInsulation", UF_Attic_2_NewInsulation);
            cmd.Parameters.AddWithValue("@UF_Attic_2_Comment", UF_Attic_2_Comment);
            cmd.Parameters.AddWithValue("@UF_Attic_3_Location", UF_Attic_3_Location);
            cmd.Parameters.AddWithValue("@UF_Attic_3_SqFt", UF_Attic_3_SqFt);
            cmd.Parameters.AddWithValue("@UF_Attic_3_ExistingRValue", UF_Attic_3_ExistingRValue);
            cmd.Parameters.AddWithValue("@UF_Attic_3_AddR", UF_Attic_3_AddR);
            cmd.Parameters.AddWithValue("@UF_Attic_3_NewInsulation", UF_Attic_3_NewInsulation);
            cmd.Parameters.AddWithValue("@UF_Attic_3_Comment", UF_Attic_3_Comment);
            cmd.Parameters.AddWithValue("@F_Attic_1_Location", F_Attic_1_Location);
            cmd.Parameters.AddWithValue("@F_Attic_1_SqFt", F_Attic_1_SqFt);
            cmd.Parameters.AddWithValue("@F_Attic_1_ExistingRValue", F_Attic_1_ExistingRValue);
            cmd.Parameters.AddWithValue("@F_Attic_1_AddR", F_Attic_1_AddR);
            cmd.Parameters.AddWithValue("@F_Attic_1_NewInsulation", F_Attic_1_NewInsulation);
            cmd.Parameters.AddWithValue("@F_Attic_1_Comment", F_Attic_1_Comment);
            cmd.Parameters.AddWithValue("@F_Attic_2_Location", F_Attic_2_Location);
            cmd.Parameters.AddWithValue("@F_Attic_2_SqFt", F_Attic_2_SqFt);
            cmd.Parameters.AddWithValue("@F_Attic_2_ExistingRValue", F_Attic_2_ExistingRValue);
            cmd.Parameters.AddWithValue("@F_Attic_2_AddR", F_Attic_2_AddR);
            cmd.Parameters.AddWithValue("@F_Attic_2_NewInsulation", F_Attic_2_NewInsulation);
            cmd.Parameters.AddWithValue("@F_Attic_2_Comment", F_Attic_2_Comment);
            cmd.Parameters.AddWithValue("@Cathedral_Location", Cathedral_Location);
            cmd.Parameters.AddWithValue("@Cathedral_SqFt", Cathedral_SqFt);
            cmd.Parameters.AddWithValue("@Cathedral_ExistingRValue", Cathedral_ExistingRValue);
            cmd.Parameters.AddWithValue("@Cathedral_AddR", Cathedral_AddR);
            cmd.Parameters.AddWithValue("@Cathedral_NewInsulation", Cathedral_NewInsulation);
            cmd.Parameters.AddWithValue("@Cathedral_Comment", Cathedral_Comment);
            cmd.Parameters.AddWithValue("@FinishAttic_Location", FinishAttic_Location);
            cmd.Parameters.AddWithValue("@FinishAttic_SqFt", FinishAttic_SqFt);
            cmd.Parameters.AddWithValue("@FinishAttic_ExistingRValue", FinishAttic_ExistingRValue);
            cmd.Parameters.AddWithValue("@FinishAttic_AddR", FinishAttic_AddR);
            cmd.Parameters.AddWithValue("@FinishAttic_NewInsulation", FinishAttic_NewInsulation);
            cmd.Parameters.AddWithValue("@FinishAttic_Comment", FinishAttic_Comment);
            cmd.Parameters.AddWithValue("@KneewallFloor_Location", KneewallFloor_Location);
            cmd.Parameters.AddWithValue("@KneewallFloor_SqFt", KneewallFloor_SqFt);
            cmd.Parameters.AddWithValue("@KneewallFloor_ExistingRValue", KneewallFloor_ExistingRValue);
            cmd.Parameters.AddWithValue("@KneewallFloor_AddR", KneewallFloor_AddR);
            cmd.Parameters.AddWithValue("@KneewallFloor_NewInsulation", KneewallFloor_NewInsulation);
            cmd.Parameters.AddWithValue("@KneewallFloor_Comment", KneewallFloor_Comment);
            cmd.Parameters.AddWithValue("@KneewallUnfloor_Location", KneewallUnfloor_Location);
            cmd.Parameters.AddWithValue("@KneewallUnfloor_SqFt", KneewallUnfloor_SqFt);
            cmd.Parameters.AddWithValue("@KneewallUnfloor_ExistingRValue", KneewallUnfloor_ExistingRValue);
            cmd.Parameters.AddWithValue("@KneewallUnfloor_AddR", KneewallUnfloor_AddR);
            cmd.Parameters.AddWithValue("@KneewallUnfloor_NewInsulation", KneewallUnfloor_NewInsulation);
            cmd.Parameters.AddWithValue("@KneewallUnfloor_Comment", KneewallUnfloor_Comment);
            cmd.Parameters.AddWithValue("@Slopes_Location", Slopes_Location);
            cmd.Parameters.AddWithValue("@Slopes_SqFt", Slopes_SqFt);
            cmd.Parameters.AddWithValue("@Slopes_ExistingRValue", Slopes_ExistingRValue);
            cmd.Parameters.AddWithValue("@Slopes_AddR", Slopes_AddR);
            cmd.Parameters.AddWithValue("@Slopes_NewInsulation", Slopes_NewInsulation);
            cmd.Parameters.AddWithValue("@Slopes_Comment", Slopes_Comment);
            cmd.Parameters.AddWithValue("@VerticalKneewall_Location", VerticalKneewall_Location);
            cmd.Parameters.AddWithValue("@VerticalKneewall_SqFt", VerticalKneewall_SqFt);
            cmd.Parameters.AddWithValue("@VerticalKneewall_ExistingRValue", VerticalKneewall_ExistingRValue);
            cmd.Parameters.AddWithValue("@VerticalKneewall_AddR", VerticalKneewall_AddR);
            cmd.Parameters.AddWithValue("@VerticalKneewall_NewInsulation", VerticalKneewall_NewInsulation);
            cmd.Parameters.AddWithValue("@VerticalKneewall_Comment", VerticalKneewall_Comment);
            cmd.Parameters.AddWithValue("@VerticalKneewall2_Location", VerticalKneewall2_Location);
            cmd.Parameters.AddWithValue("@VerticalKneewall2_SqFt", VerticalKneewall2_SqFt);
            cmd.Parameters.AddWithValue("@VerticalKneewall2_ExistingRValue", VerticalKneewall2_ExistingRValue);
            cmd.Parameters.AddWithValue("@VerticalKneewall2_AddR", VerticalKneewall2_AddR);
            cmd.Parameters.AddWithValue("@VerticalKneewall2_NewInsulation", VerticalKneewall2_NewInsulation);
            cmd.Parameters.AddWithValue("@VerticalKneewall2_Comment", VerticalKneewall2_Comment);
            cmd.Parameters.AddWithValue("@Area1", Area1);
            cmd.Parameters.AddWithValue("@Area1_Location", Area1_Location);
            cmd.Parameters.AddWithValue("@Area1_Sqft", Area1_Sqft);
            cmd.Parameters.AddWithValue("@Area1_ExistingRValue", Area1_ExistingRValue);
            cmd.Parameters.AddWithValue("@Area1_AddR", Area1_AddR);
            cmd.Parameters.AddWithValue("@Area1_NewInsulation", Area1_NewInsulation);
            cmd.Parameters.AddWithValue("@Area1_Comment", Area1_Comment);
            cmd.Parameters.AddWithValue("@Area2", Area2);
            cmd.Parameters.AddWithValue("@Area2_Location", Area2_Location);
            cmd.Parameters.AddWithValue("@Area2_Sqft", Area2_Sqft);
            cmd.Parameters.AddWithValue("@Area2_ExistingRValue", Area2_ExistingRValue);
            cmd.Parameters.AddWithValue("@Area2_AddR", Area2_AddR);
            cmd.Parameters.AddWithValue("@Area2_NewInsulation", Area2_NewInsulation);
            cmd.Parameters.AddWithValue("@Area2_Comment", Area2_Comment);
            cmd.Parameters.AddWithValue("@Area3", Area3);
            cmd.Parameters.AddWithValue("@Area3_Location", Area3_Location);
            cmd.Parameters.AddWithValue("@Area3_Sqft", Area3_Sqft);
            cmd.Parameters.AddWithValue("@Area3_ExistingRValue", Area3_ExistingRValue);
            cmd.Parameters.AddWithValue("@Area3_AddR", Area3_AddR);
            cmd.Parameters.AddWithValue("@Area3_NewInsulation", Area3_NewInsulation);
            cmd.Parameters.AddWithValue("@Area3_Comment", Area3_Comment);
            cmd.Parameters.AddWithValue("@AdditionalVentilation_Line1", AdditionalVentilation_Line1);
            cmd.Parameters.AddWithValue("@Location_Line1", Location_Line1);
            cmd.Parameters.AddWithValue("@Comments_Line1", Comments_Line1);
            cmd.Parameters.AddWithValue("@AdditionalVentilation_Line2", AdditionalVentilation_Line2);
            cmd.Parameters.AddWithValue("@Location_Line2", Location_Line2);
            cmd.Parameters.AddWithValue("@Comments_Line2", Comments_Line2);
            cmd.Parameters.AddWithValue("@AdditionalVentilation_Line3", AdditionalVentilation_Line3);
            cmd.Parameters.AddWithValue("@Location_Line3", Location_Line3);
            cmd.Parameters.AddWithValue("@Comments_Line3", Comments_Line3);
            cmd.Parameters.AddWithValue("@AdditionalVentilation_Line4", AdditionalVentilation_Line4);
            cmd.Parameters.AddWithValue("@Location_Line4", Location_Line4);
            cmd.Parameters.AddWithValue("@Comments_Line4", Comments_Line4);
            cmd.Parameters.AddWithValue("@Page14_Comment", Page14_Comment);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_14(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage13Ver2";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion


    #region METED Audit Page 15

    public int UpdateMETEDAudit_15(string JobNumber, string HorizontalAtticAccess, string HorizontalAtticAccessLocation, string HorizontalAtticAccessWaterStripping, string AccessesExisting, string AccessesAdded, string VerticalOpenings, string VerticalOpeningsLocation, string VerticalOpeningsWaterStripping, string PullDownStairs, string PullDownStairsLocation, string PullDownStairsWaterStripping, string RemainOperableRecommended, string HeateatProducingFixtures, string FixturesAreThere, string Oflights, string OfFans, string HeatOther, string ICRated, string NonICRated, string UnknownRating, string ProtectThemInsulation, string AirTightInserts, string ChangedOut, string SurfaceMountedFixtures, string FiberglassBattBlocking, string ChimneyFlueRecommended, string OfChimney, string AreThereCantOverHangs, string ImpermeableAirBarrier, string AreTheyBlocked, string Cantilever1Location, string Cantilever1SqFt, string Cantilever1ExistingRValue, string Cantilever1AddR, string Cantilever1NewR, string Cantilever1Comments, string Cantilever2Location, string Cantilever2SqFt, string Cantilever2ExistingRValue, string Cantilever2AddR, string Cantilever2NewR, string Cantilever2Comments, string WindowLocation, string WindowSqFt, string WindowExistingRValue, string WindowAddR, string WindowNewR, string WindowComments, string Wood, string Asphalt, string Stucco, string Aluminum, string Vinyl, string Brick, string Other, string InteriorWallMaterialComments, string CanSideWallsBeInsulated, string CanSideWallsBeInsulatedIfNotComment, string NorthComments, string SouthComments, string EastComments, string WestComments, string SidewallComments, string GarageCeilingSqFt, string GarageCeilingExistingRValue, string GarageCeilingAddR, string GarageCeilingNewR, string GarageCeilingComments, string ThermalEnvelope, string HealthandSafety, string Page15Comments)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage15";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@HorizontalAtticAccess", HorizontalAtticAccess);
            cmd.Parameters.AddWithValue("@HorizontalAtticAccessLocation", HorizontalAtticAccessLocation);
            cmd.Parameters.AddWithValue("@HorizontalAtticAccessWaterStripping", HorizontalAtticAccessWaterStripping);
            cmd.Parameters.AddWithValue("@AccessesExisting", AccessesExisting);
            cmd.Parameters.AddWithValue("@AccessesAdded", AccessesAdded);
            cmd.Parameters.AddWithValue("@VerticalOpenings", VerticalOpenings);
            cmd.Parameters.AddWithValue("@VerticalOpeningsLocation", VerticalOpeningsLocation);
            cmd.Parameters.AddWithValue("@VerticalOpeningsWaterStripping", VerticalOpeningsWaterStripping);
            cmd.Parameters.AddWithValue("@PullDownStairs", PullDownStairs);
            cmd.Parameters.AddWithValue("@PullDownStairsLocation", PullDownStairsLocation);
            cmd.Parameters.AddWithValue("@PullDownStairsWaterStripping", PullDownStairsWaterStripping);
            cmd.Parameters.AddWithValue("@RemainOperableRecommended", RemainOperableRecommended);
            cmd.Parameters.AddWithValue("@HeateatProducingFixtures", HeateatProducingFixtures);
            cmd.Parameters.AddWithValue("@FixturesAreThere", FixturesAreThere);
            cmd.Parameters.AddWithValue("@Oflights", Oflights);
            cmd.Parameters.AddWithValue("@OfFans", OfFans);
            cmd.Parameters.AddWithValue("@HeatOther", HeatOther);
            cmd.Parameters.AddWithValue("@ICRated", ICRated);
            cmd.Parameters.AddWithValue("@NonICRated", NonICRated);
            cmd.Parameters.AddWithValue("@UnknownRating", UnknownRating);
            cmd.Parameters.AddWithValue("@ProtectThemInsulation", ProtectThemInsulation);
            cmd.Parameters.AddWithValue("@AirTightInserts", AirTightInserts);
            cmd.Parameters.AddWithValue("@ChangedOut", ChangedOut);
            cmd.Parameters.AddWithValue("@SurfaceMountedFixtures", SurfaceMountedFixtures);
            cmd.Parameters.AddWithValue("@FiberglassBattBlocking", FiberglassBattBlocking);
            cmd.Parameters.AddWithValue("@ChimneyFlueRecommended", ChimneyFlueRecommended);
            cmd.Parameters.AddWithValue("@OfChimney", OfChimney);
            cmd.Parameters.AddWithValue("@AreThereCantOverHangs", AreThereCantOverHangs);
            cmd.Parameters.AddWithValue("@ImpermeableAirBarrier", ImpermeableAirBarrier);
            cmd.Parameters.AddWithValue("@AreTheyBlocked", AreTheyBlocked);
            cmd.Parameters.AddWithValue("@Cantilever1Location", Cantilever1Location);
            cmd.Parameters.AddWithValue("@Cantilever1SqFt", Cantilever1SqFt);
            cmd.Parameters.AddWithValue("@Cantilever1ExistingRValue", Cantilever1ExistingRValue);
            cmd.Parameters.AddWithValue("@Cantilever1AddR", Cantilever1AddR);
            cmd.Parameters.AddWithValue("@Cantilever1NewR", Cantilever1NewR);
            cmd.Parameters.AddWithValue("@Cantilever1Comments", Cantilever1Comments);
            cmd.Parameters.AddWithValue("@Cantilever2Location", Cantilever2Location);
            cmd.Parameters.AddWithValue("@Cantilever2SqFt", Cantilever2SqFt);
            cmd.Parameters.AddWithValue("@Cantilever2ExistingRValue", Cantilever2ExistingRValue);
            cmd.Parameters.AddWithValue("@Cantilever2AddR", Cantilever2AddR);
            cmd.Parameters.AddWithValue("@Cantilever2NewR", Cantilever2NewR);
            cmd.Parameters.AddWithValue("@Cantilever2Comments", Cantilever2Comments);
            cmd.Parameters.AddWithValue("@WindowLocation", WindowLocation);
            cmd.Parameters.AddWithValue("@WindowSqFt", WindowSqFt);
            cmd.Parameters.AddWithValue("@WindowExistingRValue", WindowExistingRValue);
            cmd.Parameters.AddWithValue("@WindowAddR", WindowAddR);
            cmd.Parameters.AddWithValue("@WindowNewR", WindowNewR);
            cmd.Parameters.AddWithValue("@WindowComments", WindowComments);
            cmd.Parameters.AddWithValue("@Wood", Wood);
            cmd.Parameters.AddWithValue("@Asphalt", Asphalt);
            cmd.Parameters.AddWithValue("@Stucco", Stucco);
            cmd.Parameters.AddWithValue("@Aluminum", Aluminum);
            cmd.Parameters.AddWithValue("@Vinyl", Vinyl);
            cmd.Parameters.AddWithValue("@Brick", Brick);
            cmd.Parameters.AddWithValue("@Other", Other);
            cmd.Parameters.AddWithValue("@InteriorWallMaterialComments", InteriorWallMaterialComments);
            cmd.Parameters.AddWithValue("@CanSideWallsBeInsulated", CanSideWallsBeInsulated);
            cmd.Parameters.AddWithValue("@CanSideWallsBeInsulatedIfNotComment", CanSideWallsBeInsulatedIfNotComment);
            cmd.Parameters.AddWithValue("@NorthComments", NorthComments);
            cmd.Parameters.AddWithValue("@SouthComments", SouthComments);
            cmd.Parameters.AddWithValue("@EastComments", EastComments);
            cmd.Parameters.AddWithValue("@WestComments", WestComments);
            cmd.Parameters.AddWithValue("@SidewallComments", SidewallComments);
            cmd.Parameters.AddWithValue("@GarageCeilingSqFt", GarageCeilingSqFt);
            cmd.Parameters.AddWithValue("@GarageCeilingExistingRValue", GarageCeilingExistingRValue);
            cmd.Parameters.AddWithValue("@GarageCeilingAddR", GarageCeilingAddR);
            cmd.Parameters.AddWithValue("@GarageCeilingNewR", GarageCeilingNewR);
            cmd.Parameters.AddWithValue("@GarageCeilingComments", GarageCeilingComments);
            cmd.Parameters.AddWithValue("@ThermalEnvelope", ThermalEnvelope);
            cmd.Parameters.AddWithValue("@HealthandSafety", HealthandSafety);
            cmd.Parameters.AddWithValue("@Page15Comments", Page15Comments);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_15(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage15";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion


    #region METED Audit Page 16

    public int UpdateMETEDAudit_16(string JobNumber, string NumberOfOccupants, string TIMES15CFM, string FloorLine1, string WidthLine1, string LengthLine1, string AreaLine1, string CeilingHeightLine1, string VolumeLine1, string Times35ACHLine1, string D60MinLin1, string CFMNBLine1, string FloorLine2, string WidthLine2, string LengthLine2, string AreaLine2, string CeilingHeightLine2, string VolumeLine2, string Times35ACHLine2, string D60MinLine2, string CFMNBLine2, string FloorLine3, string WidthLine3, string LengthLine3, string AreaLine3, string CeilingHeightLine3, string VolumeLine3, string Times35ACHLine3, string D60MinLine3, string CFMNBLine3, string FloorLine4, string WidthLine4, string LengthLine4, string AreaLine4, string CeilingHeightLine4, string VolumeLine4, string Times35ACHLine4, string D60MinLine4, string CFMNBLine4, string TotalTimes35ACH, string TotalCFMNB, int NoSAGrade, string HigherOfPOrB, string NFactor, string NFactorOnline, string Answer, string AirSeling, string TargetBAS, string BlowerDoorLocationPreTreatment, string BlowerDoorLocationPostTreatment, string Notes, string PreTreatmentTestResultComment, string BSMTDoorOpenClosed, string AtticDoorOpenClosed, string OtherDoorCommentPre, string OtherDoorOpenClosed, string PostTreatmentTestResultComment, string BSMTPostDoorOpenClosed, string AtticPostDoorOpenClosed, string OtherPostCommentsPost, string OtherPostDoorOpenClosed, string AtticIn, string AtticOut, string AtticPreTest1, string AtticFinal1, string AtticPreTest2, string AtticFinal2, string AtticPreTest3, string AtticFinal3, string BasementIn, string BasementOut, string BasementPreTest1, string BasementFinal1, string BasementPreTest2, string BasementFinal2, string BasementPreTest3, string BasementFinal3, string VentedCrawlIn, string VentedCrawlOut, string VentedCrawlPreTest1, string VentedCrawlFinal1, string VentedCrawlPreTest2, string VentedCrawlFinal2, string VentedCrawlPreTest3, string VentedCrawlFinal3, string Attic_A_In, string Attic_A_Out, string Attic_A_PreTest1, string Attic_A_Final1, string Attic_A_PreTest2, string Attic_A_Final2, string Attic_A_PreTest3, string Attic_A_Final3, string Attic_B_In, string Attic_B_Out, string Attic_B_PreTest1, string Attic_B_Final1, string Attic_B_PreTest2, string Attic_B_Final2, string Attic_B_PreTest3, string Attic_B_Final3, string KneeWall_A_In, string KneeWall_A_Out, string KneeWall_A_PreTest1, string KneeWall_A_Final1, string KneeWall_A_PreTest2, string KneeWall_A_Final2, string KneeWall_A_PreTest3, string KneeWall_A_Final3, string KneeWall_B_In, string KneeWall_B_Out, string KneeWall_B_PreTest1, string KneeWall_B_Final1, string KneeWall_B_PreTest2, string KneeWall_B_Final2, string KneeWall_B_PreTest3, string KneeWall_B_Final3, string GarageIn, string GarageOut, string GaragePreTest1, string GarageFinal1, string GaragePreTest2, string GarageFinal2, string GaragePreTest3, string GarageFinal3, string GarageAtticIn, string GarageAtticOut, string GarageAtticPreTest1, string GarageAtticFinal1, string GarageAtticPreTest2, string GarageAtticFinal2, string GarageAtticPreTest3, string GarageAtticFinal3, string CantileverOverHangIn, string CantileverOverHangOut, string CantileverOverHangPreTest1, string CantileverOverHangFinal1, string CantileverOverHangPreTest2, string CantileverOverHangFinal2, string CantileverOverHangPreTest3, string CantileverOverHangFinal3, string Other1_In, string Other1_Out, string Other1_PreTest1, string Other1_Final1, string Other1_PreTest2, string Other1_Final2, string Other1_PreTest3, string Other1_Final3, string Other2_In, string Other2_Out, string Other2_PreTest1, string Other2_Final1, string Other2_PreTest2, string Other2_Final2, string Other2_PreTest3, string Other2_Final3, string PressureObserved, string DustMaterialMetal, string DustMaterialDuctBoard, string DustMaterialFlex, string SystemTypeHeat, string SystemTypeCentral, string SystemTypeElectric, string SystemTypeOther, string SystemTypeOtherComment, string RegisterRoom1, string RegisterRoom2, string RegisterRoom3, string RegisterRoom4, string RegisterRoom5, string RegisterRoom6, string RegisterRoom7, string RegisterRoom8, string SupplyPre1, string SupplyPost1, string SupplyPre2, string SupplyPost2, string SupplyPre3, string SupplyPost3, string SupplyPre4, string SupplyPost4, string ReturnPre1, string ReturnPost1, string ReturnPre2, string ReturnPost2, string ReturnPre3, string ReturnPost3, string ReturnPre4, string ReturnPost4, string Comments,string CFM50OPENIn, string CFM50OPENOut, string SupplyPre5, string SupplyPost5, string SupplyPre6, string SupplyPost6, string SupplyPre7, string SupplyPost7, string SupplyPre8, string SupplyPost8, string ReturnPre5, string ReturnPost5, string ReturnPre6, string ReturnPost6, string ReturnPre7, string ReturnPost7, string ReturnPre8, string ReturnPost8)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage16";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@NumberOfOccupants", NumberOfOccupants);
            cmd.Parameters.AddWithValue("@TIMES15CFM", TIMES15CFM);
            cmd.Parameters.AddWithValue("@FloorLine1", FloorLine1);
            cmd.Parameters.AddWithValue("@WidthLine1", WidthLine1);
            cmd.Parameters.AddWithValue("@LengthLine1", LengthLine1);
            cmd.Parameters.AddWithValue("@AreaLine1", AreaLine1);
            cmd.Parameters.AddWithValue("@CeilingHeightLine1", CeilingHeightLine1);
            cmd.Parameters.AddWithValue("@VolumeLine1", VolumeLine1);
            cmd.Parameters.AddWithValue("@Times35ACHLine1", Times35ACHLine1);
            cmd.Parameters.AddWithValue("@D60MinLin1", D60MinLin1);
            cmd.Parameters.AddWithValue("@CFMNBLine1", CFMNBLine1);
            cmd.Parameters.AddWithValue("@FloorLine2", FloorLine2);
            cmd.Parameters.AddWithValue("@WidthLine2", WidthLine2);
            cmd.Parameters.AddWithValue("@LengthLine2", LengthLine2);
            cmd.Parameters.AddWithValue("@AreaLine2", AreaLine2);
            cmd.Parameters.AddWithValue("@CeilingHeightLine2", CeilingHeightLine2);
            cmd.Parameters.AddWithValue("@VolumeLine2", VolumeLine2);
            cmd.Parameters.AddWithValue("@Times35ACHLine2", Times35ACHLine2);
            cmd.Parameters.AddWithValue("@D60MinLine2", D60MinLine2);
            cmd.Parameters.AddWithValue("@CFMNBLine2", CFMNBLine2);
            cmd.Parameters.AddWithValue("@FloorLine3", FloorLine3);
            cmd.Parameters.AddWithValue("@WidthLine3", WidthLine3);
            cmd.Parameters.AddWithValue("@LengthLine3", LengthLine3);
            cmd.Parameters.AddWithValue("@AreaLine3", AreaLine3);
            cmd.Parameters.AddWithValue("@CeilingHeightLine3", CeilingHeightLine3);
            cmd.Parameters.AddWithValue("@VolumeLine3", VolumeLine3);
            cmd.Parameters.AddWithValue("@Times35ACHLine3", Times35ACHLine3);
            cmd.Parameters.AddWithValue("@D60MinLine3", D60MinLine3);
            cmd.Parameters.AddWithValue("@CFMNBLine3", CFMNBLine3);
            cmd.Parameters.AddWithValue("@FloorLine4", FloorLine4);
            cmd.Parameters.AddWithValue("@WidthLine4", WidthLine4);
            cmd.Parameters.AddWithValue("@LengthLine4", LengthLine4);
            cmd.Parameters.AddWithValue("@AreaLine4", AreaLine4);
            cmd.Parameters.AddWithValue("@CeilingHeightLine4", CeilingHeightLine4);
            cmd.Parameters.AddWithValue("@VolumeLine4", VolumeLine4);
            cmd.Parameters.AddWithValue("@Times35ACHLine4", Times35ACHLine4);
            cmd.Parameters.AddWithValue("@D60MinLine4", D60MinLine4);
            cmd.Parameters.AddWithValue("@CFMNBLine4", CFMNBLine4);
            cmd.Parameters.AddWithValue("@TotalTimes35ACH", TotalTimes35ACH);
            cmd.Parameters.AddWithValue("@TotalCFMNB", TotalCFMNB);
            cmd.Parameters.AddWithValue("@NoSAGrade", NoSAGrade);
            cmd.Parameters.AddWithValue("@HigherOfPOrB", HigherOfPOrB);
            cmd.Parameters.AddWithValue("@NFactor", NFactor);
            cmd.Parameters.AddWithValue("@NFactorOnline", NFactorOnline);
            cmd.Parameters.AddWithValue("@Answer", Answer);
            cmd.Parameters.AddWithValue("@AirSeling", AirSeling);
            cmd.Parameters.AddWithValue("@TargetBAS", TargetBAS);
            cmd.Parameters.AddWithValue("@BlowerDoorLocationPreTreatment", BlowerDoorLocationPreTreatment);
            cmd.Parameters.AddWithValue("@BlowerDoorLocationPostTreatment", BlowerDoorLocationPostTreatment);
            cmd.Parameters.AddWithValue("@Notes", Notes);
            cmd.Parameters.AddWithValue("@PreTreatmentTestResultComment", PreTreatmentTestResultComment);
            cmd.Parameters.AddWithValue("@BSMTDoorOpenClosed", BSMTDoorOpenClosed);
            cmd.Parameters.AddWithValue("@AtticDoorOpenClosed", AtticDoorOpenClosed);
            cmd.Parameters.AddWithValue("@OtherDoorCommentPre", OtherDoorCommentPre);
            cmd.Parameters.AddWithValue("@OtherDoorOpenClosed", OtherDoorOpenClosed);
            cmd.Parameters.AddWithValue("@PostTreatmentTestResultComment", PostTreatmentTestResultComment);
            cmd.Parameters.AddWithValue("@BSMTPostDoorOpenClosed", BSMTPostDoorOpenClosed);
            cmd.Parameters.AddWithValue("@AtticPostDoorOpenClosed", AtticPostDoorOpenClosed);
            cmd.Parameters.AddWithValue("@OtherPostCommentsPost", OtherPostCommentsPost);
            cmd.Parameters.AddWithValue("@OtherPostDoorOpenClosed", OtherPostDoorOpenClosed);
            cmd.Parameters.AddWithValue("@AtticIn", AtticIn);
            cmd.Parameters.AddWithValue("@AtticOut", AtticOut);
            cmd.Parameters.AddWithValue("@AtticPreTest1", AtticPreTest1);
            cmd.Parameters.AddWithValue("@AtticFinal1", AtticFinal1);
            cmd.Parameters.AddWithValue("@AtticPreTest2", AtticPreTest2);
            cmd.Parameters.AddWithValue("@AtticFinal2", AtticFinal2);
            cmd.Parameters.AddWithValue("@AtticPreTest3", AtticPreTest3);
            cmd.Parameters.AddWithValue("@AtticFinal3", AtticFinal3);
            cmd.Parameters.AddWithValue("@BasementIn", BasementIn);
            cmd.Parameters.AddWithValue("@BasementOut", BasementOut);
            cmd.Parameters.AddWithValue("@BasementPreTest1", BasementPreTest1);
            cmd.Parameters.AddWithValue("@BasementFinal1", BasementFinal1);
            cmd.Parameters.AddWithValue("@BasementPreTest2", BasementPreTest2);
            cmd.Parameters.AddWithValue("@BasementFinal2", BasementFinal2);
            cmd.Parameters.AddWithValue("@BasementPreTest3", BasementPreTest3);
            cmd.Parameters.AddWithValue("@BasementFinal3", BasementFinal3);
            cmd.Parameters.AddWithValue("@VentedCrawlIn", VentedCrawlIn);
            cmd.Parameters.AddWithValue("@VentedCrawlOut", VentedCrawlOut);
            cmd.Parameters.AddWithValue("@VentedCrawlPreTest1", VentedCrawlPreTest1);
            cmd.Parameters.AddWithValue("@VentedCrawlFinal1", VentedCrawlFinal1);
            cmd.Parameters.AddWithValue("@VentedCrawlPreTest2", VentedCrawlPreTest2);
            cmd.Parameters.AddWithValue("@VentedCrawlFinal2", VentedCrawlFinal2);
            cmd.Parameters.AddWithValue("@VentedCrawlPreTest3", VentedCrawlPreTest3);
            cmd.Parameters.AddWithValue("@VentedCrawlFinal3", VentedCrawlFinal3);

            cmd.Parameters.AddWithValue("@Attic_A_In", Attic_A_In);
            cmd.Parameters.AddWithValue("@Attic_A_Out", Attic_A_Out);
            cmd.Parameters.AddWithValue("@Attic_A_PreTest1", Attic_A_PreTest1);
            cmd.Parameters.AddWithValue("@Attic_A_Final1", Attic_A_Final1);
            cmd.Parameters.AddWithValue("@Attic_A_PreTest2", Attic_A_PreTest2);
            cmd.Parameters.AddWithValue("@Attic_A_Final2", Attic_A_Final2);
            cmd.Parameters.AddWithValue("@Attic_A_PreTest3", Attic_A_PreTest3);
            cmd.Parameters.AddWithValue("@Attic_A_Final3", Attic_A_Final3);

            cmd.Parameters.AddWithValue("@Attic_B_In", Attic_B_In);
            cmd.Parameters.AddWithValue("@Attic_B_Out", Attic_B_Out);
            cmd.Parameters.AddWithValue("@Attic_B_PreTest1", Attic_B_PreTest1);
            cmd.Parameters.AddWithValue("@Attic_B_Final1", Attic_B_Final1);
            cmd.Parameters.AddWithValue("@Attic_B_PreTest2", Attic_B_PreTest2);
            cmd.Parameters.AddWithValue("@Attic_B_Final2", Attic_B_Final2);
            cmd.Parameters.AddWithValue("@Attic_B_PreTest3", Attic_B_PreTest3);
            cmd.Parameters.AddWithValue("@Attic_B_Final3", Attic_B_Final3);

            cmd.Parameters.AddWithValue("@KneeWall_A_In", KneeWall_A_In);
            cmd.Parameters.AddWithValue("@KneeWall_A_Out", KneeWall_A_Out);
            cmd.Parameters.AddWithValue("@KneeWall_A_PreTest1", KneeWall_A_PreTest1);
            cmd.Parameters.AddWithValue("@KneeWall_A_Final1", KneeWall_A_Final1);
            cmd.Parameters.AddWithValue("@KneeWall_A_PreTest2", KneeWall_A_PreTest2);
            cmd.Parameters.AddWithValue("@KneeWall_A_Final2", KneeWall_A_Final2);
            cmd.Parameters.AddWithValue("@KneeWall_A_PreTest3", KneeWall_A_PreTest3);
            cmd.Parameters.AddWithValue("@KneeWall_A_Final3", KneeWall_A_Final3);

            cmd.Parameters.AddWithValue("@KneeWall_B_In", KneeWall_B_In);
            cmd.Parameters.AddWithValue("@KneeWall_B_Out", KneeWall_B_Out);
            cmd.Parameters.AddWithValue("@KneeWall_B_PreTest1", KneeWall_B_PreTest1);
            cmd.Parameters.AddWithValue("@KneeWall_B_Final1", KneeWall_B_Final1);
            cmd.Parameters.AddWithValue("@KneeWall_B_PreTest2", KneeWall_B_PreTest2);
            cmd.Parameters.AddWithValue("@KneeWall_B_Final2", KneeWall_B_Final2);
            cmd.Parameters.AddWithValue("@KneeWall_B_PreTest3", KneeWall_B_PreTest3);
            cmd.Parameters.AddWithValue("@KneeWall_B_Final3", KneeWall_B_Final3);

            cmd.Parameters.AddWithValue("@GarageIn", GarageIn);
            cmd.Parameters.AddWithValue("@GarageOut", GarageOut);
            cmd.Parameters.AddWithValue("@GaragePreTest1", GaragePreTest1);
            cmd.Parameters.AddWithValue("@GarageFinal1", GarageFinal1);
            cmd.Parameters.AddWithValue("@GaragePreTest2", GaragePreTest2);
            cmd.Parameters.AddWithValue("@GarageFinal2", GarageFinal2);
            cmd.Parameters.AddWithValue("@GaragePreTest3", GaragePreTest3);
            cmd.Parameters.AddWithValue("@GarageFinal3", GarageFinal3);
            cmd.Parameters.AddWithValue("@GarageAtticIn", GarageAtticIn);
            cmd.Parameters.AddWithValue("@GarageAtticOut", GarageAtticOut);
            cmd.Parameters.AddWithValue("@GarageAtticPreTest1", GarageAtticPreTest1);
            cmd.Parameters.AddWithValue("@GarageAtticFinal1", GarageAtticFinal1);
            cmd.Parameters.AddWithValue("@GarageAtticPreTest2", GarageAtticPreTest2);
            cmd.Parameters.AddWithValue("@GarageAtticFinal2", GarageAtticFinal2);
            cmd.Parameters.AddWithValue("@GarageAtticPreTest3", GarageAtticPreTest3);
            cmd.Parameters.AddWithValue("@GarageAtticFinal3", GarageAtticFinal3);
            cmd.Parameters.AddWithValue("@CantileverOverHangIn", CantileverOverHangIn);
            cmd.Parameters.AddWithValue("@CantileverOverHangOut", CantileverOverHangOut);
            cmd.Parameters.AddWithValue("@CantileverOverHangPreTest1", CantileverOverHangPreTest1);
            cmd.Parameters.AddWithValue("@CantileverOverHangFinal1", CantileverOverHangFinal1);
            cmd.Parameters.AddWithValue("@CantileverOverHangPreTest2", CantileverOverHangPreTest2);
            cmd.Parameters.AddWithValue("@CantileverOverHangFinal2", CantileverOverHangFinal2);
            cmd.Parameters.AddWithValue("@CantileverOverHangPreTest3", CantileverOverHangPreTest3);
            cmd.Parameters.AddWithValue("@CantileverOverHangFinal3", CantileverOverHangFinal3);
            cmd.Parameters.AddWithValue("@Other1_In", Other1_In);
            cmd.Parameters.AddWithValue("@Other1_Out", Other1_Out);
            cmd.Parameters.AddWithValue("@Other1_PreTest1", Other1_PreTest1);
            cmd.Parameters.AddWithValue("@Other1_Final1", Other1_Final1);
            cmd.Parameters.AddWithValue("@Other1_PreTest2", Other1_PreTest2);
            cmd.Parameters.AddWithValue("@Other1_Final2", Other1_Final2);
            cmd.Parameters.AddWithValue("@Other1_PreTest3", Other1_PreTest3);
            cmd.Parameters.AddWithValue("@Other1_Final3", Other1_Final3);
            cmd.Parameters.AddWithValue("@Other2_In", Other2_In);
            cmd.Parameters.AddWithValue("@Other2_Out", Other2_Out);
            cmd.Parameters.AddWithValue("@Other2_PreTest1", Other2_PreTest1);
            cmd.Parameters.AddWithValue("@Other2_Final1", Other2_Final1);
            cmd.Parameters.AddWithValue("@Other2_PreTest2", Other2_PreTest2);
            cmd.Parameters.AddWithValue("@Other2_Final2", Other2_Final2);
            cmd.Parameters.AddWithValue("@Other2_PreTest3", Other2_PreTest3);
            cmd.Parameters.AddWithValue("@Other2_Final3", Other2_Final3);
            cmd.Parameters.AddWithValue("@PressureObserved", PressureObserved);
            cmd.Parameters.AddWithValue("@DustMaterialMetal", DustMaterialMetal);
            cmd.Parameters.AddWithValue("@DustMaterialDuctBoard", DustMaterialDuctBoard);
            cmd.Parameters.AddWithValue("@DustMaterialFlex", DustMaterialFlex);
            cmd.Parameters.AddWithValue("@SystemTypeHeat", SystemTypeHeat);
            cmd.Parameters.AddWithValue("@SystemTypeCentral", SystemTypeCentral);
            cmd.Parameters.AddWithValue("@SystemTypeElectric", SystemTypeElectric);
            cmd.Parameters.AddWithValue("@SystemTypeOther", SystemTypeOther);
            cmd.Parameters.AddWithValue("@SystemTypeOtherComment", SystemTypeOtherComment);
            cmd.Parameters.AddWithValue("@RegisterRoom1", RegisterRoom1);
            cmd.Parameters.AddWithValue("@RegisterRoom2", RegisterRoom2);
            cmd.Parameters.AddWithValue("@RegisterRoom3", RegisterRoom3);
            cmd.Parameters.AddWithValue("@RegisterRoom4", RegisterRoom4);
            cmd.Parameters.AddWithValue("@RegisterRoom5", RegisterRoom5);
            cmd.Parameters.AddWithValue("@RegisterRoom6", RegisterRoom6);
            cmd.Parameters.AddWithValue("@RegisterRoom7", RegisterRoom7);
            cmd.Parameters.AddWithValue("@RegisterRoom8", RegisterRoom8);
            cmd.Parameters.AddWithValue("@SupplyPre1", SupplyPre1);
            cmd.Parameters.AddWithValue("@SupplyPost1", SupplyPost1);
            cmd.Parameters.AddWithValue("@SupplyPre2", SupplyPre2);
            cmd.Parameters.AddWithValue("@SupplyPost2", SupplyPost2);
            cmd.Parameters.AddWithValue("@SupplyPre3", SupplyPre3);
            cmd.Parameters.AddWithValue("@SupplyPost3", SupplyPost3);
            cmd.Parameters.AddWithValue("@SupplyPre4", SupplyPre4);
            cmd.Parameters.AddWithValue("@SupplyPost4", SupplyPost4);
            cmd.Parameters.AddWithValue("@SupplyPre5", SupplyPre5); 
            cmd.Parameters.AddWithValue("@SupplyPost5", SupplyPost5);
            cmd.Parameters.AddWithValue("@SupplyPre6", SupplyPre6);
            cmd.Parameters.AddWithValue("@SupplyPost6", SupplyPost6);
            cmd.Parameters.AddWithValue("@SupplyPre7", SupplyPre7);
            cmd.Parameters.AddWithValue("@SupplyPost7", SupplyPost7);
            cmd.Parameters.AddWithValue("@SupplyPre8", SupplyPre8);
            cmd.Parameters.AddWithValue("@SupplyPost8", SupplyPost8);


            cmd.Parameters.AddWithValue("@ReturnPre1", ReturnPre1);
            cmd.Parameters.AddWithValue("@ReturnPost1", ReturnPost1);
            cmd.Parameters.AddWithValue("@ReturnPre2", ReturnPre2);
            cmd.Parameters.AddWithValue("@ReturnPost2", ReturnPost2);
            cmd.Parameters.AddWithValue("@ReturnPre3", ReturnPre3);
            cmd.Parameters.AddWithValue("@ReturnPost3", ReturnPost3);
            cmd.Parameters.AddWithValue("@ReturnPre4", ReturnPre4);
            cmd.Parameters.AddWithValue("@ReturnPost4", ReturnPost4);
            cmd.Parameters.AddWithValue("@ReturnPre5", ReturnPre5);
            cmd.Parameters.AddWithValue("@ReturnPost5", ReturnPost5);
            cmd.Parameters.AddWithValue("@ReturnPre6", ReturnPre6);
            cmd.Parameters.AddWithValue("@ReturnPost6", ReturnPost6);
            cmd.Parameters.AddWithValue("@ReturnPre7", ReturnPre7);
            cmd.Parameters.AddWithValue("@ReturnPost7", ReturnPost7);
            cmd.Parameters.AddWithValue("@ReturnPre8", ReturnPre8);
            cmd.Parameters.AddWithValue("@ReturnPost8", ReturnPost8);


            cmd.Parameters.AddWithValue("@Comments", Comments); 
            cmd.Parameters.AddWithValue("@CFM50OPENIn", CFM50OPENIn);
            cmd.Parameters.AddWithValue("@CFM50OPENOut", CFM50OPENOut);



            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch(Exception e)
        {
            string x = e.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_16(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage16";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion


    #region METED Audit Page 17

    public int UpdateMETEDAudit_17(string JobNumber, string AuditorCrewWorkTesting, string PrePostWorkTesting, string PrePostWorkTestingComment, string TechName, string TestDate, string CombustionSafetyTestingCombustionAppliances, string CombustionHeatAppliances, string WaterHeaterCOInitialAMB, string WaterHeaterCOInitialCAZ, string WaterHeaterCOAfterAMB, string WaterHeaterCOAfterCAZ, string WaterHeaterGasLeak, string WaterHeaterFlameRollout, string WaterHeaterSpillageWC, string WaterHeaterSpillageNAT, string WaterHeaterSpillageAfterWC, string WaterHeaterSpillageAfterNAT, string WaterHeaterDraftPressureWC, string WaterHeaterDraftPressureNAT, string WaterHeaterDraftPassWC, string WaterHeaterDraftPassNAT, string WaterHeaterCOFlueWC, string WaterHeaterCOFlueNAT, string WaterHeaterCOPassWC, string WaterHeaterCOPassNAT, string WaterHeaterOptionalStackTemp, string WaterHeaterOptionalO2, string WaterHeaterOptionalEff, string FurnaceBoilerCOInitialAMB, string FurnaceBoilerCOInitialCAZ, string FurnaceBoilerCOAfterWC, string FurnaceBoilerCOAfterNAT, string FurnaceBoilerGasLeak, string FurnaceBoilerFlameRollout, string FurnaceBoilerSpillageWC, string FurnaceBoilerSpillageNAT, string FurnaceBoilerSpillageAfterWC, string FurnaceBoilerSpillageAfterNAT, string FurnaceBoilerDraftPressureWC, string FurnaceBoilerDraftPressureNAT, string FurnaceBoilerDraftPassWC, string FurnaceBoilerDraftPassNAT, string FurnaceBoilerCOFlueWC, string FurnaceBoilerCOFlueNAT, string FurnaceBoilerCOPassWC, string FurnaceBoilerCOPassNAT, string FurnaceBoilerOptionalStackTemp, string FurnaceBoilerOptionalO2, string FurnaceBoilerOptionalEff, string GasRangeCOInitialAMB, string GasRangeCOInitialCAZ, string GasRangeCOAfterWC, string GasRangeCOAfterCAZ, string GasRangeGasLeak, string GasRangeFlameRollout, string GasRangeSpillageWC, string GasRangeSpillageNAT, string GasRangeSpillageAfterWC, string GasRangeSpillageAfterNAT, string GasRangeDraftPressureWC, string GasRangeDraftPressureNAT, string GasRangeDraftPassWC, string GasRangeDraftPassNAT, string GasRangeCOFlueWC, string GasRangeCOFlueNAT, string GasRangeCOPassWC, string GasRangeCOPassNAT, string GasRangeOptionalStackTemp, string GasRangeOptionalO2, string GasRangeOptionalEff, string OtherCOInitialAMB, string OtherCOInitialCAZ, string OtherCOAfterAMB, string OtherCOAfterCAZ, string OtherGasLeak, string OtherFlameRollout, string OtherSpillageWC, string OtherSpillageNAT, string OtherSpillageAfterWC, string OtherSpillageAfterNAT, string OtherDraftPressureWC, string OtherDraftPressureNAT, string OtherDraftPassWC, string OtherDraftPassNAT, string OtherCoFlueWC, string OtherCoFlueNAT, string OtherCoPassWC, string OtherCoPassNAT, string OtherOptionalStackTemp, string OtherOptionalO2, string OtherOptionalEff, string Appliance_1, string Appliance_1_COInitialAMB, string Appliance_1_COInitialCAZ, string Appliance_1_COAfterlAMB, string Appliance_1_COAfterCAZ, string Appliance_1_GasLeak, string Appliance_1_FlameRollout, string Appliance_1_SpillageWC, string Appliance_1_SpillageNAT, string Appliance_1_SpillageAfterWC, string Appliance_1_SpillageAfterNAT, string Appliance_1_DraftPressureWC, string Appliance_1_DraftPressureNAT, string Appliance_1_DraftPassWC, string Appliance_1_DraftPassNAT, string Appliance_1_CoFlueWC, string Appliance_1_CoFlueNAT, string Appliance_1_CoPassWC, string Appliance_1_CoPassNAT, string Appliance_1_OptionalStackTemp, string Appliance_1_OptionalO2, string Appliance_1_OptionalEff, string Appliance_2, string Appliance_2_COInitialAMB, string Appliance_2_COInitialCAZ, string Appliance_2_COAfterAMB, string Appliance_2_COAfterCAZ, string Appliance_2_GasLeak, string Appliance_2_FlameRollout, string Appliance_2_SpillageWC, string Appliance_2_SpillageNAT, string Appliance_2_SpillageAfterWC, string Appliance_2_SpillageAfterNAT, string Appliance_2_DraftPressureWC, string Appliance_2_DraftPressureNAT, string Appliance_2_DraftPassWC, string Appliance_2_DraftPassNAT, string Appliance_2_CoFlueWC, string Appliance_2_CoFlueNAT, string Appliance_2_CoPassWC, string Appliance_2_CoPassNAT, string Appliance_2_OptionalStackTemp, string Appliance_2_OptionalO2, string Appliance_2_OptionalEff, string OvenCOAmbient, string OvenCOAt, string BlankCenter_1, string BlankCenter_2, string BlankCenter_3, string BlankCenter_4, string Notes, string OutdoorTemperature, string CAZWorseCaseNatural, string CAZWorseCaseWC, string CAZWorseCaseDiff, string SelectAppliancesCheckbox_Dryer, string SelectAppliancesCheckbox_WHF, string SelectAppliancesCheckbox_Bath, string SelectAppliancesCheckbox_HVAC, string SelectAppliancesCheckbox_KF, string SelectAppliancesCheckbox_AtticFan, string SelectAppliancesCheckbox_Other, string SelectAppliancesCheckbox_Othertext, string PassRadiobtn, string EmergencySituationCheckBox, string WorkCheckbox, string BottomNotes, string Note1_17,string TotalBTUH , string VolumeCombustionAir)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage17";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@AuditorCrewWorkTesting", AuditorCrewWorkTesting);
            cmd.Parameters.AddWithValue("@PrePostWorkTesting", PrePostWorkTesting);
            cmd.Parameters.AddWithValue("@PrePostWorkTestingComment", PrePostWorkTestingComment);
            cmd.Parameters.AddWithValue("@TechName", TechName);
            cmd.Parameters.AddWithValue("@TestDate", TestDate);
            cmd.Parameters.AddWithValue("@CombustionSafetyTestingCombustionAppliances", CombustionSafetyTestingCombustionAppliances);
            cmd.Parameters.AddWithValue("@CombustionHeatAppliances", CombustionHeatAppliances);
            cmd.Parameters.AddWithValue("@WaterHeaterCOInitialAMB", WaterHeaterCOInitialAMB);
            cmd.Parameters.AddWithValue("@WaterHeaterCOInitialCAZ", WaterHeaterCOInitialCAZ);
            cmd.Parameters.AddWithValue("@WaterHeaterCOAfterAMB", WaterHeaterCOAfterAMB);
            cmd.Parameters.AddWithValue("@WaterHeaterCOAfterCAZ", WaterHeaterCOAfterCAZ);
            cmd.Parameters.AddWithValue("@WaterHeaterGasLeak", WaterHeaterGasLeak);
            cmd.Parameters.AddWithValue("@WaterHeaterFlameRollout", WaterHeaterFlameRollout);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageWC", WaterHeaterSpillageWC);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageNAT", WaterHeaterSpillageNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageAfterWC", WaterHeaterSpillageAfterWC);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageAfterNAT", WaterHeaterSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPressureWC", WaterHeaterDraftPressureWC);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPressureNAT", WaterHeaterDraftPressureNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPassWC", WaterHeaterDraftPassWC);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPassNAT", WaterHeaterDraftPassNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterCOFlueWC", WaterHeaterCOFlueWC);
            cmd.Parameters.AddWithValue("@WaterHeaterCOFlueNAT", WaterHeaterCOFlueNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterCOPassWC", WaterHeaterCOPassWC);
            cmd.Parameters.AddWithValue("@WaterHeaterCOPassNAT", WaterHeaterCOPassNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalStackTemp", WaterHeaterOptionalStackTemp);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalO2", WaterHeaterOptionalO2);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalEff", WaterHeaterOptionalEff);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOInitialAMB", FurnaceBoilerCOInitialAMB);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOInitialCAZ", FurnaceBoilerCOInitialCAZ);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOAfterWC ", FurnaceBoilerCOAfterWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOAfterNAT ", FurnaceBoilerCOAfterNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerGasLeak ", FurnaceBoilerGasLeak);
            cmd.Parameters.AddWithValue("@FurnaceBoilerFlameRollout ", FurnaceBoilerFlameRollout);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageWC ", FurnaceBoilerSpillageWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageNAT", FurnaceBoilerSpillageNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageAfterWC", FurnaceBoilerSpillageAfterWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageAfterNAT", FurnaceBoilerSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPressureWC", FurnaceBoilerDraftPressureWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPressureNAT", FurnaceBoilerDraftPressureNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassWC", FurnaceBoilerDraftPassWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassNAT", FurnaceBoilerDraftPassNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOFlueWC", FurnaceBoilerCOFlueWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOFlueNAT", FurnaceBoilerCOFlueNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOPassWC", FurnaceBoilerCOPassWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOPassNAT", FurnaceBoilerCOPassNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalStackTemp", FurnaceBoilerOptionalStackTemp);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalO2", FurnaceBoilerOptionalO2);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalEff", FurnaceBoilerOptionalEff);
            cmd.Parameters.AddWithValue("@GasRangeCOInitialAMB", GasRangeCOInitialAMB);
            cmd.Parameters.AddWithValue("@GasRangeCOInitialCAZ", GasRangeCOInitialCAZ);
            cmd.Parameters.AddWithValue("@GasRangeCOAfterWC", GasRangeCOAfterWC);
            cmd.Parameters.AddWithValue("@GasRangeCOAfterCAZ", GasRangeCOAfterCAZ);
            cmd.Parameters.AddWithValue("@GasRangeGasLeak", GasRangeGasLeak);
            cmd.Parameters.AddWithValue("@GasRangeFlameRollout", GasRangeFlameRollout);
            cmd.Parameters.AddWithValue("@GasRangeSpillageWC", GasRangeSpillageWC);
            cmd.Parameters.AddWithValue("@GasRangeSpillageNAT", GasRangeSpillageNAT);
            cmd.Parameters.AddWithValue("@GasRangeSpillageAfterWC", GasRangeSpillageAfterWC);
            cmd.Parameters.AddWithValue("@GasRangeSpillageAfterNAT", GasRangeSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@GasRangeDraftPressureWC", GasRangeDraftPressureWC);
            cmd.Parameters.AddWithValue("@GasRangeDraftPressureNAT", GasRangeDraftPressureNAT);
            cmd.Parameters.AddWithValue("@GasRangeDraftPassWC", GasRangeDraftPassWC);
            cmd.Parameters.AddWithValue("@GasRangeDraftPassNAT", GasRangeDraftPassNAT);
            cmd.Parameters.AddWithValue("@GasRangeCOFlueWC", GasRangeCOFlueWC);
            cmd.Parameters.AddWithValue("@GasRangeCOFlueNAT", GasRangeCOFlueNAT);
            cmd.Parameters.AddWithValue("@GasRangeCOPassWC", GasRangeCOPassWC);
            cmd.Parameters.AddWithValue("@GasRangeCOPassNAT", GasRangeCOPassNAT);
            cmd.Parameters.AddWithValue("@GasRangeOptionalStackTemp", GasRangeOptionalStackTemp);
            cmd.Parameters.AddWithValue("@GasRangeOptionalO2", GasRangeOptionalO2);
            cmd.Parameters.AddWithValue("@GasRangeOptionalEff", GasRangeOptionalEff);
            cmd.Parameters.AddWithValue("@OtherCOInitialAMB", OtherCOInitialAMB);
            cmd.Parameters.AddWithValue("@OtherCOInitialCAZ", OtherCOInitialCAZ);
            cmd.Parameters.AddWithValue("@OtherCOAfterAMB", OtherCOAfterAMB);
            cmd.Parameters.AddWithValue("@OtherCOAfterCAZ", OtherCOAfterCAZ);
            cmd.Parameters.AddWithValue("@OtherGasLeak", OtherGasLeak);
            cmd.Parameters.AddWithValue("@OtherFlameRollout", OtherFlameRollout);
            cmd.Parameters.AddWithValue("@OtherSpillageWC", OtherSpillageWC);
            cmd.Parameters.AddWithValue("@OtherSpillageNAT", OtherSpillageNAT);
            cmd.Parameters.AddWithValue("@OtherSpillageAfterWC", OtherSpillageAfterWC);
            cmd.Parameters.AddWithValue("@OtherSpillageAfterNAT", OtherSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@OtherDraftPressureWC", OtherDraftPressureWC);
            cmd.Parameters.AddWithValue("@OtherDraftPressureNAT", OtherDraftPressureNAT);
            cmd.Parameters.AddWithValue("@OtherDraftPassWC", OtherDraftPassWC);
            cmd.Parameters.AddWithValue("@OtherDraftPassNAT", OtherDraftPassNAT);
            cmd.Parameters.AddWithValue("@OtherCoFlueWC", OtherCoFlueWC);
            cmd.Parameters.AddWithValue("@OtherCoFlueNAT", OtherCoFlueNAT);
            cmd.Parameters.AddWithValue("@OtherCoPassWC", OtherCoPassWC);
            cmd.Parameters.AddWithValue("@OtherCoPassNAT", OtherCoPassNAT);
            cmd.Parameters.AddWithValue("@OtherOptionalStackTemp", OtherOptionalStackTemp);
            cmd.Parameters.AddWithValue("@OtherOptionalO2", OtherOptionalO2);
            cmd.Parameters.AddWithValue("@OtherOptionalEff", OtherOptionalEff);
            cmd.Parameters.AddWithValue("@Appliance_1", Appliance_1);
            cmd.Parameters.AddWithValue("@Appliance_1_COInitialAMB", Appliance_1_COInitialAMB);
            cmd.Parameters.AddWithValue("@Appliance_1_COInitialCAZ", Appliance_1_COInitialCAZ);
            cmd.Parameters.AddWithValue("@Appliance_1_COAfterlAMB", Appliance_1_COAfterlAMB);
            cmd.Parameters.AddWithValue("@Appliance_1_COAfterCAZ", Appliance_1_COAfterCAZ);
            cmd.Parameters.AddWithValue("@Appliance_1_GasLeak", Appliance_1_GasLeak);
            cmd.Parameters.AddWithValue("@Appliance_1_FlameRollout", Appliance_1_FlameRollout);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageWC", Appliance_1_SpillageWC);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageNAT", Appliance_1_SpillageNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageAfterWC", Appliance_1_SpillageAfterWC);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageAfterNAT", Appliance_1_SpillageAfterNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPressureWC", Appliance_1_DraftPressureWC);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPressureNAT", Appliance_1_DraftPressureNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPassWC", Appliance_1_DraftPassWC);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPassNAT", Appliance_1_DraftPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_CoFlueWC", Appliance_1_CoFlueWC);
            cmd.Parameters.AddWithValue("@Appliance_1_CoFlueNAT", Appliance_1_CoFlueNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_CoPassWC", Appliance_1_CoPassWC);
            cmd.Parameters.AddWithValue("@Appliance_1_CoPassNAT", Appliance_1_CoPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalStackTemp", Appliance_1_OptionalStackTemp);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalO2", Appliance_1_OptionalO2);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalEff", Appliance_1_OptionalEff);
            cmd.Parameters.AddWithValue("@Appliance_2", Appliance_2);
            cmd.Parameters.AddWithValue("@Appliance_2_COInitialAMB", Appliance_2_COInitialAMB);
            cmd.Parameters.AddWithValue("@Appliance_2_COInitialCAZ", Appliance_2_COInitialCAZ);
            cmd.Parameters.AddWithValue("@Appliance_2_COAfterAMB", Appliance_2_COAfterAMB);
            cmd.Parameters.AddWithValue("@Appliance_2_COAfterCAZ", Appliance_2_COAfterCAZ);
            cmd.Parameters.AddWithValue("@Appliance_2_GasLeak", Appliance_2_GasLeak);
            cmd.Parameters.AddWithValue("@Appliance_2_FlameRollout", Appliance_2_FlameRollout);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageWC", Appliance_2_SpillageWC);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageNAT", Appliance_2_SpillageNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageAfterWC", Appliance_2_SpillageAfterWC);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageAfterNAT", Appliance_2_SpillageAfterNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPressureWC", Appliance_2_DraftPressureWC);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPressureNAT", Appliance_2_DraftPressureNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPassWC", Appliance_2_DraftPassWC);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPassNAT", Appliance_2_DraftPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_CoFlueWC", Appliance_2_CoFlueWC);
            cmd.Parameters.AddWithValue("@Appliance_2_CoFlueNAT", Appliance_2_CoFlueNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_CoPassWC", Appliance_2_CoPassWC);
            cmd.Parameters.AddWithValue("@Appliance_2_CoPassNAT", Appliance_2_CoPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalStackTemp", Appliance_2_OptionalStackTemp);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalO2", Appliance_2_OptionalO2);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalEff", Appliance_2_OptionalEff);
            cmd.Parameters.AddWithValue("@OvenCOAmbient", OvenCOAmbient);
            cmd.Parameters.AddWithValue("@OvenCOAt", OvenCOAt);
            cmd.Parameters.AddWithValue("@BlankCenter_1", BlankCenter_1);
            cmd.Parameters.AddWithValue("@BlankCenter_2", BlankCenter_2);
            cmd.Parameters.AddWithValue("@BlankCenter_3", BlankCenter_3);
            cmd.Parameters.AddWithValue("@BlankCenter_4", BlankCenter_4);
            cmd.Parameters.AddWithValue("@Notes", Notes);
            cmd.Parameters.AddWithValue("@OutdoorTemperature", OutdoorTemperature);
            cmd.Parameters.AddWithValue("@CAZWorseCaseNatural", CAZWorseCaseNatural);
            cmd.Parameters.AddWithValue("@CAZWorseCaseWC", CAZWorseCaseWC);
            cmd.Parameters.AddWithValue("@CAZWorseCaseDiff", CAZWorseCaseDiff);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Dryer", SelectAppliancesCheckbox_Dryer);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_WHF", SelectAppliancesCheckbox_WHF);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Bath", SelectAppliancesCheckbox_Bath);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_HVAC", SelectAppliancesCheckbox_HVAC);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_KF", SelectAppliancesCheckbox_KF);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_AtticFan", SelectAppliancesCheckbox_AtticFan);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Other", SelectAppliancesCheckbox_Other);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Othertext", SelectAppliancesCheckbox_Othertext);
            cmd.Parameters.AddWithValue("@PassRadiobtn", PassRadiobtn);
            cmd.Parameters.AddWithValue("@EmergencySituationCheckBox", EmergencySituationCheckBox);
            cmd.Parameters.AddWithValue("@WorkCheckbox", WorkCheckbox);
            cmd.Parameters.AddWithValue("@BottomNotes", BottomNotes);
            cmd.Parameters.AddWithValue("@Note1_17", Note1_17);
            cmd.Parameters.AddWithValue("@TotalBTUH", TotalBTUH);
            cmd.Parameters.AddWithValue("@VolumeCombustionAir", VolumeCombustionAir); 

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_17(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage17";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion


    #region METED Audit Page 18

    public int UpdateMETEDAudit_18(string JobNumber, string AuditorCrewWorkTesting, string PrePostWorkTesting, string PrePostWorkTestingComment, string TechName, string TestDate, string CombustionSafetyTestingCombustionAppliances, string CombustionHeatAppliances, string WaterHeaterCOInitialAMB, string WaterHeaterCOInitialCAZ, string WaterHeaterCOAfterAMB, string WaterHeaterCOAfterCAZ, string WaterHeaterGasLeak, string WaterHeaterFlameRollout, string WaterHeaterSpillageWC, string WaterHeaterSpillageNAT, string WaterHeaterSpillageAfterWC, string WaterHeaterSpillageAfterNAT, string WaterHeaterDraftPressureWC, string WaterHeaterDraftPressureNAT, string WaterHeaterDraftPassWC, string WaterHeaterDraftPassNAT, string WaterHeaterCOFlueWC, string WaterHeaterCOFlueNAT, string WaterHeaterCOPassWC, string WaterHeaterCOPassNAT, string WaterHeaterOptionalStackTemp, string WaterHeaterOptionalO2, string WaterHeaterOptionalEff, string FurnaceBoilerCOInitialAMB, string FurnaceBoilerCOInitialCAZ, string FurnaceBoilerCOAfterWC, string FurnaceBoilerCOAfterNAT, string FurnaceBoilerGasLeak, string FurnaceBoilerFlameRollout, string FurnaceBoilerSpillageWC, string FurnaceBoilerSpillageNAT, string FurnaceBoilerSpillageAfterWC, string FurnaceBoilerSpillageAfterNAT, string FurnaceBoilerDraftPressureWC, string FurnaceBoilerDraftPressureNAT, string FurnaceBoilerDraftPassWC, string FurnaceBoilerDraftPassNAT, string FurnaceBoilerCOFlueWC, string FurnaceBoilerCOFlueNAT, string FurnaceBoilerCOPassWC, string FurnaceBoilerCOPassNAT, string FurnaceBoilerOptionalStackTemp, string FurnaceBoilerOptionalO2, string FurnaceBoilerOptionalEff, string GasRangeCOInitialAMB, string GasRangeCOInitialCAZ, string GasRangeCOAfterWC, string GasRangeCOAfterCAZ, string GasRangeGasLeak, string GasRangeFlameRollout, string GasRangeSpillageWC, string GasRangeSpillageNAT, string GasRangeSpillageAfterWC, string GasRangeSpillageAfterNAT, string GasRangeDraftPressureWC, string GasRangeDraftPressureNAT, string GasRangeDraftPassWC, string GasRangeDraftPassNAT, string GasRangeCOFlueWC, string GasRangeCOFlueNAT, string GasRangeCOPassWC, string GasRangeCOPassNAT, string GasRangeOptionalStackTemp, string GasRangeOptionalO2, string GasRangeOptionalEff, string OtherCOInitialAMB, string OtherCOInitialCAZ, string OtherCOAfterAMB, string OtherCOAfterCAZ, string OtherGasLeak, string OtherFlameRollout, string OtherSpillageWC, string OtherSpillageNAT, string OtherSpillageAfterWC, string OtherSpillageAfterNAT, string OtherDraftPressureWC, string OtherDraftPressureNAT, string OtherDraftPassWC, string OtherDraftPassNAT, string OtherCoFlueWC, string OtherCoFlueNAT, string OtherCoPassWC, string OtherCoPassNAT, string OtherOptionalStackTemp, string OtherOptionalO2, string OtherOptionalEff, string Appliance_1, string Appliance_1_COInitialAMB, string Appliance_1_COInitialCAZ, string Appliance_1_COAfterlAMB, string Appliance_1_COAfterCAZ, string Appliance_1_GasLeak, string Appliance_1_FlameRollout, string Appliance_1_SpillageWC, string Appliance_1_SpillageNAT, string Appliance_1_SpillageAfterWC, string Appliance_1_SpillageAfterNAT, string Appliance_1_DraftPressureWC, string Appliance_1_DraftPressureNAT, string Appliance_1_DraftPassWC, string Appliance_1_DraftPassNAT, string Appliance_1_CoFlueWC, string Appliance_1_CoFlueNAT, string Appliance_1_CoPassWC, string Appliance_1_CoPassNAT, string Appliance_1_OptionalStackTemp, string Appliance_1_OptionalO2, string Appliance_1_OptionalEff, string Appliance_2, string Appliance_2_COInitialAMB, string Appliance_2_COInitialCAZ, string Appliance_2_COAfterAMB, string Appliance_2_COAfterCAZ, string Appliance_2_GasLeak, string Appliance_2_FlameRollout, string Appliance_2_SpillageWC, string Appliance_2_SpillageNAT, string Appliance_2_SpillageAfterWC, string Appliance_2_SpillageAfterNAT, string Appliance_2_DraftPressureWC, string Appliance_2_DraftPressureNAT, string Appliance_2_DraftPassWC, string Appliance_2_DraftPassNAT, string Appliance_2_CoFlueWC, string Appliance_2_CoFlueNAT, string Appliance_2_CoPassWC, string Appliance_2_CoPassNAT, string Appliance_2_OptionalStackTemp, string Appliance_2_OptionalO2, string Appliance_2_OptionalEff, string OvenCOAmbient, string OvenCOAt, string BlankCenter_1, string BlankCenter_2, string BlankCenter_3, string BlankCenter_4, string Notes, string OutdoorTemperature, string CAZWorseCaseNatural, string CAZWorseCaseWC, string CAZWorseCaseDiff, string SelectAppliancesCheckbox_Dryer, string SelectAppliancesCheckbox_WHF, string SelectAppliancesCheckbox_Bath, string SelectAppliancesCheckbox_HVAC, string SelectAppliancesCheckbox_KF, string SelectAppliancesCheckbox_AtticFan, string SelectAppliancesCheckbox_Other, string SelectAppliancesCheckbox_Othertext, string PassRadiobtn, string EmergencySituationCheckBox, string WorkCheckbox, string BottomNotes, string Note1_18, string TotalBTUH, string VolumeCombustionAir)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage18";



            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@AuditorCrewWorkTesting", AuditorCrewWorkTesting);
            cmd.Parameters.AddWithValue("@PrePostWorkTesting", PrePostWorkTesting);
            cmd.Parameters.AddWithValue("@PrePostWorkTestingComment", PrePostWorkTestingComment);
            cmd.Parameters.AddWithValue("@TechName", TechName);
            cmd.Parameters.AddWithValue("@TestDate", TestDate);
            cmd.Parameters.AddWithValue("@CombustionSafetyTestingCombustionAppliances", CombustionSafetyTestingCombustionAppliances);
            cmd.Parameters.AddWithValue("@CombustionHeatAppliances", CombustionHeatAppliances);
            cmd.Parameters.AddWithValue("@WaterHeaterCOInitialAMB", WaterHeaterCOInitialAMB);
            cmd.Parameters.AddWithValue("@WaterHeaterCOInitialCAZ", WaterHeaterCOInitialCAZ);
            cmd.Parameters.AddWithValue("@WaterHeaterCOAfterAMB", WaterHeaterCOAfterAMB);
            cmd.Parameters.AddWithValue("@WaterHeaterCOAfterCAZ", WaterHeaterCOAfterCAZ);
            cmd.Parameters.AddWithValue("@WaterHeaterGasLeak", WaterHeaterGasLeak);
            cmd.Parameters.AddWithValue("@WaterHeaterFlameRollout", WaterHeaterFlameRollout);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageWC", WaterHeaterSpillageWC);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageNAT", WaterHeaterSpillageNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageAfterWC", WaterHeaterSpillageAfterWC);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageAfterNAT", WaterHeaterSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPressureWC", WaterHeaterDraftPressureWC);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPressureNAT", WaterHeaterDraftPressureNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPassWC", WaterHeaterDraftPassWC);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPassNAT", WaterHeaterDraftPassNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterCOFlueWC", WaterHeaterCOFlueWC);
            cmd.Parameters.AddWithValue("@WaterHeaterCOFlueNAT", WaterHeaterCOFlueNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterCOPassWC", WaterHeaterCOPassWC);
            cmd.Parameters.AddWithValue("@WaterHeaterCOPassNAT", WaterHeaterCOPassNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalStackTemp", WaterHeaterOptionalStackTemp);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalO2", WaterHeaterOptionalO2);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalEff", WaterHeaterOptionalEff);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOInitialAMB", FurnaceBoilerCOInitialAMB);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOInitialCAZ", FurnaceBoilerCOInitialCAZ);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOAfterWC ", FurnaceBoilerCOAfterWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOAfterNAT ", FurnaceBoilerCOAfterNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerGasLeak ", FurnaceBoilerGasLeak);
            cmd.Parameters.AddWithValue("@FurnaceBoilerFlameRollout ", FurnaceBoilerFlameRollout);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageWC ", FurnaceBoilerSpillageWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageNAT", FurnaceBoilerSpillageNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageAfterWC", FurnaceBoilerSpillageAfterWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageAfterNAT", FurnaceBoilerSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPressureWC", FurnaceBoilerDraftPressureWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPressureNAT", FurnaceBoilerDraftPressureNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassWC", FurnaceBoilerDraftPassWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassNAT", FurnaceBoilerDraftPassNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOFlueWC", FurnaceBoilerCOFlueWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOFlueNAT", FurnaceBoilerCOFlueNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOPassWC", FurnaceBoilerCOPassWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOPassNAT", FurnaceBoilerCOPassNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalStackTemp", FurnaceBoilerOptionalStackTemp);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalO2", FurnaceBoilerOptionalO2);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalEff", FurnaceBoilerOptionalEff);
            cmd.Parameters.AddWithValue("@GasRangeCOInitialAMB", GasRangeCOInitialAMB);
            cmd.Parameters.AddWithValue("@GasRangeCOInitialCAZ", GasRangeCOInitialCAZ);
            cmd.Parameters.AddWithValue("@GasRangeCOAfterWC", GasRangeCOAfterWC);
            cmd.Parameters.AddWithValue("@GasRangeCOAfterCAZ", GasRangeCOAfterCAZ);
            cmd.Parameters.AddWithValue("@GasRangeGasLeak", GasRangeGasLeak);
            cmd.Parameters.AddWithValue("@GasRangeFlameRollout", GasRangeFlameRollout);
            cmd.Parameters.AddWithValue("@GasRangeSpillageWC", GasRangeSpillageWC);
            cmd.Parameters.AddWithValue("@GasRangeSpillageNAT", GasRangeSpillageNAT);
            cmd.Parameters.AddWithValue("@GasRangeSpillageAfterWC", GasRangeSpillageAfterWC);
            cmd.Parameters.AddWithValue("@GasRangeSpillageAfterNAT", GasRangeSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@GasRangeDraftPressureWC", GasRangeDraftPressureWC);
            cmd.Parameters.AddWithValue("@GasRangeDraftPressureNAT", GasRangeDraftPressureNAT);
            cmd.Parameters.AddWithValue("@GasRangeDraftPassWC", GasRangeDraftPassWC);
            cmd.Parameters.AddWithValue("@GasRangeDraftPassNAT", GasRangeDraftPassNAT);
            cmd.Parameters.AddWithValue("@GasRangeCOFlueWC", GasRangeCOFlueWC);
            cmd.Parameters.AddWithValue("@GasRangeCOFlueNAT", GasRangeCOFlueNAT);
            cmd.Parameters.AddWithValue("@GasRangeCOPassWC", GasRangeCOPassWC);
            cmd.Parameters.AddWithValue("@GasRangeCOPassNAT", GasRangeCOPassNAT);
            cmd.Parameters.AddWithValue("@GasRangeOptionalStackTemp", GasRangeOptionalStackTemp);
            cmd.Parameters.AddWithValue("@GasRangeOptionalO2", GasRangeOptionalO2);
            cmd.Parameters.AddWithValue("@GasRangeOptionalEff", GasRangeOptionalEff);
            cmd.Parameters.AddWithValue("@OtherCOInitialAMB", OtherCOInitialAMB);
            cmd.Parameters.AddWithValue("@OtherCOInitialCAZ", OtherCOInitialCAZ);
            cmd.Parameters.AddWithValue("@OtherCOAfterAMB", OtherCOAfterAMB);
            cmd.Parameters.AddWithValue("@OtherCOAfterCAZ", OtherCOAfterCAZ);
            cmd.Parameters.AddWithValue("@OtherGasLeak", OtherGasLeak);
            cmd.Parameters.AddWithValue("@OtherFlameRollout", OtherFlameRollout);
            cmd.Parameters.AddWithValue("@OtherSpillageWC", OtherSpillageWC);
            cmd.Parameters.AddWithValue("@OtherSpillageNAT", OtherSpillageNAT);
            cmd.Parameters.AddWithValue("@OtherSpillageAfterWC", OtherSpillageAfterWC);
            cmd.Parameters.AddWithValue("@OtherSpillageAfterNAT", OtherSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@OtherDraftPressureWC", OtherDraftPressureWC);
            cmd.Parameters.AddWithValue("@OtherDraftPressureNAT", OtherDraftPressureNAT);
            cmd.Parameters.AddWithValue("@OtherDraftPassWC", OtherDraftPassWC);
            cmd.Parameters.AddWithValue("@OtherDraftPassNAT", OtherDraftPassNAT);
            cmd.Parameters.AddWithValue("@OtherCoFlueWC", OtherCoFlueWC);
            cmd.Parameters.AddWithValue("@OtherCoFlueNAT", OtherCoFlueNAT);
            cmd.Parameters.AddWithValue("@OtherCoPassWC", OtherCoPassWC);
            cmd.Parameters.AddWithValue("@OtherCoPassNAT", OtherCoPassNAT);
            cmd.Parameters.AddWithValue("@OtherOptionalStackTemp", OtherOptionalStackTemp);
            cmd.Parameters.AddWithValue("@OtherOptionalO2", OtherOptionalO2);
            cmd.Parameters.AddWithValue("@OtherOptionalEff", OtherOptionalEff);
            cmd.Parameters.AddWithValue("@Appliance_1", Appliance_1);
            cmd.Parameters.AddWithValue("@Appliance_1_COInitialAMB", Appliance_1_COInitialAMB);
            cmd.Parameters.AddWithValue("@Appliance_1_COInitialCAZ", Appliance_1_COInitialCAZ);
            cmd.Parameters.AddWithValue("@Appliance_1_COAfterlAMB", Appliance_1_COAfterlAMB);
            cmd.Parameters.AddWithValue("@Appliance_1_COAfterCAZ", Appliance_1_COAfterCAZ);
            cmd.Parameters.AddWithValue("@Appliance_1_GasLeak", Appliance_1_GasLeak);
            cmd.Parameters.AddWithValue("@Appliance_1_FlameRollout", Appliance_1_FlameRollout);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageWC", Appliance_1_SpillageWC);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageNAT", Appliance_1_SpillageNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageAfterWC", Appliance_1_SpillageAfterWC);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageAfterNAT", Appliance_1_SpillageAfterNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPressureWC", Appliance_1_DraftPressureWC);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPressureNAT", Appliance_1_DraftPressureNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPassWC", Appliance_1_DraftPassWC);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPassNAT", Appliance_1_DraftPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_CoFlueWC", Appliance_1_CoFlueWC);
            cmd.Parameters.AddWithValue("@Appliance_1_CoFlueNAT", Appliance_1_CoFlueNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_CoPassWC", Appliance_1_CoPassWC);
            cmd.Parameters.AddWithValue("@Appliance_1_CoPassNAT", Appliance_1_CoPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalStackTemp", Appliance_1_OptionalStackTemp);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalO2", Appliance_1_OptionalO2);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalEff", Appliance_1_OptionalEff);
            cmd.Parameters.AddWithValue("@Appliance_2", Appliance_2);
            cmd.Parameters.AddWithValue("@Appliance_2_COInitialAMB", Appliance_2_COInitialAMB);
            cmd.Parameters.AddWithValue("@Appliance_2_COInitialCAZ", Appliance_2_COInitialCAZ);
            cmd.Parameters.AddWithValue("@Appliance_2_COAfterAMB", Appliance_2_COAfterAMB);
            cmd.Parameters.AddWithValue("@Appliance_2_COAfterCAZ", Appliance_2_COAfterCAZ);
            cmd.Parameters.AddWithValue("@Appliance_2_GasLeak", Appliance_2_GasLeak);
            cmd.Parameters.AddWithValue("@Appliance_2_FlameRollout", Appliance_2_FlameRollout);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageWC", Appliance_2_SpillageWC);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageNAT", Appliance_2_SpillageNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageAfterWC", Appliance_2_SpillageAfterWC);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageAfterNAT", Appliance_2_SpillageAfterNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPressureWC", Appliance_2_DraftPressureWC);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPressureNAT", Appliance_2_DraftPressureNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPassWC", Appliance_2_DraftPassWC);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPassNAT", Appliance_2_DraftPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_CoFlueWC", Appliance_2_CoFlueWC);
            cmd.Parameters.AddWithValue("@Appliance_2_CoFlueNAT", Appliance_2_CoFlueNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_CoPassWC", Appliance_2_CoPassWC);
            cmd.Parameters.AddWithValue("@Appliance_2_CoPassNAT", Appliance_2_CoPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalStackTemp", Appliance_2_OptionalStackTemp);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalO2", Appliance_2_OptionalO2);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalEff", Appliance_2_OptionalEff);
            cmd.Parameters.AddWithValue("@OvenCOAmbient", OvenCOAmbient);
            cmd.Parameters.AddWithValue("@OvenCOAt", OvenCOAt);
            cmd.Parameters.AddWithValue("@BlankCenter_1", BlankCenter_1);
            cmd.Parameters.AddWithValue("@BlankCenter_2", BlankCenter_2);
            cmd.Parameters.AddWithValue("@BlankCenter_3", BlankCenter_3);
            cmd.Parameters.AddWithValue("@BlankCenter_4", BlankCenter_4);
            cmd.Parameters.AddWithValue("@Notes", Notes);
            cmd.Parameters.AddWithValue("@OutdoorTemperature", OutdoorTemperature);
            cmd.Parameters.AddWithValue("@CAZWorseCaseNatural", CAZWorseCaseNatural);
            cmd.Parameters.AddWithValue("@CAZWorseCaseWC", CAZWorseCaseWC);
            cmd.Parameters.AddWithValue("@CAZWorseCaseDiff", CAZWorseCaseDiff);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Dryer", SelectAppliancesCheckbox_Dryer);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_WHF", SelectAppliancesCheckbox_WHF);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Bath", SelectAppliancesCheckbox_Bath);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_HVAC", SelectAppliancesCheckbox_HVAC);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_KF", SelectAppliancesCheckbox_KF);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_AtticFan", SelectAppliancesCheckbox_AtticFan);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Other", SelectAppliancesCheckbox_Other);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Othertext", SelectAppliancesCheckbox_Othertext);
            cmd.Parameters.AddWithValue("@PassRadiobtn", PassRadiobtn);
            cmd.Parameters.AddWithValue("@EmergencySituationCheckBox", EmergencySituationCheckBox);
            cmd.Parameters.AddWithValue("@WorkCheckbox", WorkCheckbox);
            cmd.Parameters.AddWithValue("@BottomNotes", BottomNotes);
            cmd.Parameters.AddWithValue("@Note1_18", Note1_18);
            cmd.Parameters.AddWithValue("@TotalBTUH", TotalBTUH);
            cmd.Parameters.AddWithValue("@VolumeCombustionAir", VolumeCombustionAir);


            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_18(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage18";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion



    #region METED Audit Page 19

    public int UpdateMETEDAudit_19(string JobNumber, string AuditorCrewWorkTesting, string PrePostWorkTesting, string PrePostWorkTestingComment, string TechName, string TestDate, string CombustionSafetyTestingCombustionAppliances, string CombustionHeatAppliances, string WaterHeaterCOInitialAMB, string WaterHeaterCOInitialCAZ, string WaterHeaterCOAfterAMB, string WaterHeaterCOAfterCAZ, string WaterHeaterGasLeak, string WaterHeaterFlameRollout, string WaterHeaterSpillageWC, string WaterHeaterSpillageNAT, string WaterHeaterSpillageAfterWC, string WaterHeaterSpillageAfterNAT, string WaterHeaterDraftPressureWC, string WaterHeaterDraftPressureNAT, string WaterHeaterDraftPassWC, string WaterHeaterDraftPassNAT, string WaterHeaterCOFlueWC, string WaterHeaterCOFlueNAT, string WaterHeaterCOPassWC, string WaterHeaterCOPassNAT, string WaterHeaterOptionalStackTemp, string WaterHeaterOptionalO2, string WaterHeaterOptionalEff, string FurnaceBoilerCOInitialAMB, string FurnaceBoilerCOInitialCAZ, string FurnaceBoilerCOAfterWC, string FurnaceBoilerCOAfterNAT, string FurnaceBoilerGasLeak, string FurnaceBoilerFlameRollout, string FurnaceBoilerSpillageWC, string FurnaceBoilerSpillageNAT, string FurnaceBoilerSpillageAfterWC, string FurnaceBoilerSpillageAfterNAT, string FurnaceBoilerDraftPressureWC, string FurnaceBoilerDraftPressureNAT, string FurnaceBoilerDraftPassWC, string FurnaceBoilerDraftPassNAT, string FurnaceBoilerCOFlueWC, string FurnaceBoilerCOFlueNAT, string FurnaceBoilerCOPassWC, string FurnaceBoilerCOPassNAT, string FurnaceBoilerOptionalStackTemp, string FurnaceBoilerOptionalO2, string FurnaceBoilerOptionalEff, string GasRangeCOInitialAMB, string GasRangeCOInitialCAZ, string GasRangeCOAfterWC, string GasRangeCOAfterCAZ, string GasRangeGasLeak, string GasRangeFlameRollout, string GasRangeSpillageWC, string GasRangeSpillageNAT, string GasRangeSpillageAfterWC, string GasRangeSpillageAfterNAT, string GasRangeDraftPressureWC, string GasRangeDraftPressureNAT, string GasRangeDraftPassWC, string GasRangeDraftPassNAT, string GasRangeCOFlueWC, string GasRangeCOFlueNAT, string GasRangeCOPassWC, string GasRangeCOPassNAT, string GasRangeOptionalStackTemp, string GasRangeOptionalO2, string GasRangeOptionalEff, string OtherCOInitialAMB, string OtherCOInitialCAZ, string OtherCOAfterAMB, string OtherCOAfterCAZ, string OtherGasLeak, string OtherFlameRollout, string OtherSpillageWC, string OtherSpillageNAT, string OtherSpillageAfterWC, string OtherSpillageAfterNAT, string OtherDraftPressureWC, string OtherDraftPressureNAT, string OtherDraftPassWC, string OtherDraftPassNAT, string OtherCoFlueWC, string OtherCoFlueNAT, string OtherCoPassWC, string OtherCoPassNAT, string OtherOptionalStackTemp, string OtherOptionalO2, string OtherOptionalEff, string Appliance_1, string Appliance_1_COInitialAMB, string Appliance_1_COInitialCAZ, string Appliance_1_COAfterlAMB, string Appliance_1_COAfterCAZ, string Appliance_1_GasLeak, string Appliance_1_FlameRollout, string Appliance_1_SpillageWC, string Appliance_1_SpillageNAT, string Appliance_1_SpillageAfterWC, string Appliance_1_SpillageAfterNAT, string Appliance_1_DraftPressureWC, string Appliance_1_DraftPressureNAT, string Appliance_1_DraftPassWC, string Appliance_1_DraftPassNAT, string Appliance_1_CoFlueWC, string Appliance_1_CoFlueNAT, string Appliance_1_CoPassWC, string Appliance_1_CoPassNAT, string Appliance_1_OptionalStackTemp, string Appliance_1_OptionalO2, string Appliance_1_OptionalEff, string Appliance_2, string Appliance_2_COInitialAMB, string Appliance_2_COInitialCAZ, string Appliance_2_COAfterAMB, string Appliance_2_COAfterCAZ, string Appliance_2_GasLeak, string Appliance_2_FlameRollout, string Appliance_2_SpillageWC, string Appliance_2_SpillageNAT, string Appliance_2_SpillageAfterWC, string Appliance_2_SpillageAfterNAT, string Appliance_2_DraftPressureWC, string Appliance_2_DraftPressureNAT, string Appliance_2_DraftPassWC, string Appliance_2_DraftPassNAT, string Appliance_2_CoFlueWC, string Appliance_2_CoFlueNAT, string Appliance_2_CoPassWC, string Appliance_2_CoPassNAT, string Appliance_2_OptionalStackTemp, string Appliance_2_OptionalO2, string Appliance_2_OptionalEff, string OvenCOAmbient, string OvenCOAt, string BlankCenter_1, string BlankCenter_2, string BlankCenter_3, string BlankCenter_4, string Notes, string OutdoorTemperature, string CAZWorseCaseNatural, string CAZWorseCaseWC, string CAZWorseCaseDiff, string SelectAppliancesCheckbox_Dryer, string SelectAppliancesCheckbox_WHF, string SelectAppliancesCheckbox_Bath, string SelectAppliancesCheckbox_HVAC, string SelectAppliancesCheckbox_KF, string SelectAppliancesCheckbox_AtticFan, string SelectAppliancesCheckbox_Other, string SelectAppliancesCheckbox_Othertext, string PassRadiobtn, string EmergencySituationCheckBox, string WorkCheckbox, string BottomNotes, string Note1_19, string TotalBTUH, string VolumeCombustionAir)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage19";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@AuditorCrewWorkTesting", AuditorCrewWorkTesting);
            cmd.Parameters.AddWithValue("@PrePostWorkTesting", PrePostWorkTesting);
            cmd.Parameters.AddWithValue("@PrePostWorkTestingComment", PrePostWorkTestingComment);
            cmd.Parameters.AddWithValue("@TechName", TechName);
            cmd.Parameters.AddWithValue("@TestDate", TestDate);
            cmd.Parameters.AddWithValue("@CombustionSafetyTestingCombustionAppliances", CombustionSafetyTestingCombustionAppliances);
            cmd.Parameters.AddWithValue("@CombustionHeatAppliances", CombustionHeatAppliances);
            cmd.Parameters.AddWithValue("@WaterHeaterCOInitialAMB", WaterHeaterCOInitialAMB);
            cmd.Parameters.AddWithValue("@WaterHeaterCOInitialCAZ", WaterHeaterCOInitialCAZ);
            cmd.Parameters.AddWithValue("@WaterHeaterCOAfterAMB", WaterHeaterCOAfterAMB);
            cmd.Parameters.AddWithValue("@WaterHeaterCOAfterCAZ", WaterHeaterCOAfterCAZ);
            cmd.Parameters.AddWithValue("@WaterHeaterGasLeak", WaterHeaterGasLeak);
            cmd.Parameters.AddWithValue("@WaterHeaterFlameRollout", WaterHeaterFlameRollout);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageWC", WaterHeaterSpillageWC);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageNAT", WaterHeaterSpillageNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageAfterWC", WaterHeaterSpillageAfterWC);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageAfterNAT", WaterHeaterSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPressureWC", WaterHeaterDraftPressureWC);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPressureNAT", WaterHeaterDraftPressureNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPassWC", WaterHeaterDraftPassWC);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPassNAT", WaterHeaterDraftPassNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterCOFlueWC", WaterHeaterCOFlueWC);
            cmd.Parameters.AddWithValue("@WaterHeaterCOFlueNAT", WaterHeaterCOFlueNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterCOPassWC", WaterHeaterCOPassWC);
            cmd.Parameters.AddWithValue("@WaterHeaterCOPassNAT", WaterHeaterCOPassNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalStackTemp", WaterHeaterOptionalStackTemp);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalO2", WaterHeaterOptionalO2);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalEff", WaterHeaterOptionalEff);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOInitialAMB", FurnaceBoilerCOInitialAMB);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOInitialCAZ", FurnaceBoilerCOInitialCAZ);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOAfterWC ", FurnaceBoilerCOAfterWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOAfterNAT ", FurnaceBoilerCOAfterNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerGasLeak ", FurnaceBoilerGasLeak);
            cmd.Parameters.AddWithValue("@FurnaceBoilerFlameRollout ", FurnaceBoilerFlameRollout);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageWC ", FurnaceBoilerSpillageWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageNAT", FurnaceBoilerSpillageNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageAfterWC", FurnaceBoilerSpillageAfterWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageAfterNAT", FurnaceBoilerSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPressureWC", FurnaceBoilerDraftPressureWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPressureNAT", FurnaceBoilerDraftPressureNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassWC", FurnaceBoilerDraftPassWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassNAT", FurnaceBoilerDraftPassNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOFlueWC", FurnaceBoilerCOFlueWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOFlueNAT", FurnaceBoilerCOFlueNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOPassWC", FurnaceBoilerCOPassWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOPassNAT", FurnaceBoilerCOPassNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalStackTemp", FurnaceBoilerOptionalStackTemp);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalO2", FurnaceBoilerOptionalO2);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalEff", FurnaceBoilerOptionalEff);
            cmd.Parameters.AddWithValue("@GasRangeCOInitialAMB", GasRangeCOInitialAMB);
            cmd.Parameters.AddWithValue("@GasRangeCOInitialCAZ", GasRangeCOInitialCAZ);
            cmd.Parameters.AddWithValue("@GasRangeCOAfterWC", GasRangeCOAfterWC);
            cmd.Parameters.AddWithValue("@GasRangeCOAfterCAZ", GasRangeCOAfterCAZ);
            cmd.Parameters.AddWithValue("@GasRangeGasLeak", GasRangeGasLeak);
            cmd.Parameters.AddWithValue("@GasRangeFlameRollout", GasRangeFlameRollout);
            cmd.Parameters.AddWithValue("@GasRangeSpillageWC", GasRangeSpillageWC);
            cmd.Parameters.AddWithValue("@GasRangeSpillageNAT", GasRangeSpillageNAT);
            cmd.Parameters.AddWithValue("@GasRangeSpillageAfterWC", GasRangeSpillageAfterWC);
            cmd.Parameters.AddWithValue("@GasRangeSpillageAfterNAT", GasRangeSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@GasRangeDraftPressureWC", GasRangeDraftPressureWC);
            cmd.Parameters.AddWithValue("@GasRangeDraftPressureNAT", GasRangeDraftPressureNAT);
            cmd.Parameters.AddWithValue("@GasRangeDraftPassWC", GasRangeDraftPassWC);
            cmd.Parameters.AddWithValue("@GasRangeDraftPassNAT", GasRangeDraftPassNAT);
            cmd.Parameters.AddWithValue("@GasRangeCOFlueWC", GasRangeCOFlueWC);
            cmd.Parameters.AddWithValue("@GasRangeCOFlueNAT", GasRangeCOFlueNAT);
            cmd.Parameters.AddWithValue("@GasRangeCOPassWC", GasRangeCOPassWC);
            cmd.Parameters.AddWithValue("@GasRangeCOPassNAT", GasRangeCOPassNAT);
            cmd.Parameters.AddWithValue("@GasRangeOptionalStackTemp", GasRangeOptionalStackTemp);
            cmd.Parameters.AddWithValue("@GasRangeOptionalO2", GasRangeOptionalO2);
            cmd.Parameters.AddWithValue("@GasRangeOptionalEff", GasRangeOptionalEff);
            cmd.Parameters.AddWithValue("@OtherCOInitialAMB", OtherCOInitialAMB);
            cmd.Parameters.AddWithValue("@OtherCOInitialCAZ", OtherCOInitialCAZ);
            cmd.Parameters.AddWithValue("@OtherCOAfterAMB", OtherCOAfterAMB);
            cmd.Parameters.AddWithValue("@OtherCOAfterCAZ", OtherCOAfterCAZ);
            cmd.Parameters.AddWithValue("@OtherGasLeak", OtherGasLeak);
            cmd.Parameters.AddWithValue("@OtherFlameRollout", OtherFlameRollout);
            cmd.Parameters.AddWithValue("@OtherSpillageWC", OtherSpillageWC);
            cmd.Parameters.AddWithValue("@OtherSpillageNAT", OtherSpillageNAT);
            cmd.Parameters.AddWithValue("@OtherSpillageAfterWC", OtherSpillageAfterWC);
            cmd.Parameters.AddWithValue("@OtherSpillageAfterNAT", OtherSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@OtherDraftPressureWC", OtherDraftPressureWC);
            cmd.Parameters.AddWithValue("@OtherDraftPressureNAT", OtherDraftPressureNAT);
            cmd.Parameters.AddWithValue("@OtherDraftPassWC", OtherDraftPassWC);
            cmd.Parameters.AddWithValue("@OtherDraftPassNAT", OtherDraftPassNAT);
            cmd.Parameters.AddWithValue("@OtherCoFlueWC", OtherCoFlueWC);
            cmd.Parameters.AddWithValue("@OtherCoFlueNAT", OtherCoFlueNAT);
            cmd.Parameters.AddWithValue("@OtherCoPassWC", OtherCoPassWC);
            cmd.Parameters.AddWithValue("@OtherCoPassNAT", OtherCoPassNAT);
            cmd.Parameters.AddWithValue("@OtherOptionalStackTemp", OtherOptionalStackTemp);
            cmd.Parameters.AddWithValue("@OtherOptionalO2", OtherOptionalO2);
            cmd.Parameters.AddWithValue("@OtherOptionalEff", OtherOptionalEff);
            cmd.Parameters.AddWithValue("@Appliance_1", Appliance_1);
            cmd.Parameters.AddWithValue("@Appliance_1_COInitialAMB", Appliance_1_COInitialAMB);
            cmd.Parameters.AddWithValue("@Appliance_1_COInitialCAZ", Appliance_1_COInitialCAZ);
            cmd.Parameters.AddWithValue("@Appliance_1_COAfterlAMB", Appliance_1_COAfterlAMB);
            cmd.Parameters.AddWithValue("@Appliance_1_COAfterCAZ", Appliance_1_COAfterCAZ);
            cmd.Parameters.AddWithValue("@Appliance_1_GasLeak", Appliance_1_GasLeak);
            cmd.Parameters.AddWithValue("@Appliance_1_FlameRollout", Appliance_1_FlameRollout);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageWC", Appliance_1_SpillageWC);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageNAT", Appliance_1_SpillageNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageAfterWC", Appliance_1_SpillageAfterWC);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageAfterNAT", Appliance_1_SpillageAfterNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPressureWC", Appliance_1_DraftPressureWC);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPressureNAT", Appliance_1_DraftPressureNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPassWC", Appliance_1_DraftPassWC);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPassNAT", Appliance_1_DraftPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_CoFlueWC", Appliance_1_CoFlueWC);
            cmd.Parameters.AddWithValue("@Appliance_1_CoFlueNAT", Appliance_1_CoFlueNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_CoPassWC", Appliance_1_CoPassWC);
            cmd.Parameters.AddWithValue("@Appliance_1_CoPassNAT", Appliance_1_CoPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalStackTemp", Appliance_1_OptionalStackTemp);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalO2", Appliance_1_OptionalO2);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalEff", Appliance_1_OptionalEff);
            cmd.Parameters.AddWithValue("@Appliance_2", Appliance_2);
            cmd.Parameters.AddWithValue("@Appliance_2_COInitialAMB", Appliance_2_COInitialAMB);
            cmd.Parameters.AddWithValue("@Appliance_2_COInitialCAZ", Appliance_2_COInitialCAZ);
            cmd.Parameters.AddWithValue("@Appliance_2_COAfterAMB", Appliance_2_COAfterAMB);
            cmd.Parameters.AddWithValue("@Appliance_2_COAfterCAZ", Appliance_2_COAfterCAZ);
            cmd.Parameters.AddWithValue("@Appliance_2_GasLeak", Appliance_2_GasLeak);
            cmd.Parameters.AddWithValue("@Appliance_2_FlameRollout", Appliance_2_FlameRollout);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageWC", Appliance_2_SpillageWC);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageNAT", Appliance_2_SpillageNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageAfterWC", Appliance_2_SpillageAfterWC);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageAfterNAT", Appliance_2_SpillageAfterNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPressureWC", Appliance_2_DraftPressureWC);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPressureNAT", Appliance_2_DraftPressureNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPassWC", Appliance_2_DraftPassWC);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPassNAT", Appliance_2_DraftPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_CoFlueWC", Appliance_2_CoFlueWC);
            cmd.Parameters.AddWithValue("@Appliance_2_CoFlueNAT", Appliance_2_CoFlueNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_CoPassWC", Appliance_2_CoPassWC);
            cmd.Parameters.AddWithValue("@Appliance_2_CoPassNAT", Appliance_2_CoPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalStackTemp", Appliance_2_OptionalStackTemp);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalO2", Appliance_2_OptionalO2);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalEff", Appliance_2_OptionalEff);
            cmd.Parameters.AddWithValue("@OvenCOAmbient", OvenCOAmbient);
            cmd.Parameters.AddWithValue("@OvenCOAt", OvenCOAt);
            cmd.Parameters.AddWithValue("@BlankCenter_1", BlankCenter_1);
            cmd.Parameters.AddWithValue("@BlankCenter_2", BlankCenter_2);
            cmd.Parameters.AddWithValue("@BlankCenter_3", BlankCenter_3);
            cmd.Parameters.AddWithValue("@BlankCenter_4", BlankCenter_4);
            cmd.Parameters.AddWithValue("@Notes", Notes);
            cmd.Parameters.AddWithValue("@OutdoorTemperature", OutdoorTemperature);
            cmd.Parameters.AddWithValue("@CAZWorseCaseNatural", CAZWorseCaseNatural);
            cmd.Parameters.AddWithValue("@CAZWorseCaseWC", CAZWorseCaseWC);
            cmd.Parameters.AddWithValue("@CAZWorseCaseDiff", CAZWorseCaseDiff);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Dryer", SelectAppliancesCheckbox_Dryer);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_WHF", SelectAppliancesCheckbox_WHF);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Bath", SelectAppliancesCheckbox_Bath);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_HVAC", SelectAppliancesCheckbox_HVAC);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_KF", SelectAppliancesCheckbox_KF);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_AtticFan", SelectAppliancesCheckbox_AtticFan);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Other", SelectAppliancesCheckbox_Other);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Othertext", SelectAppliancesCheckbox_Othertext);
            cmd.Parameters.AddWithValue("@PassRadiobtn", PassRadiobtn);
            cmd.Parameters.AddWithValue("@EmergencySituationCheckBox", EmergencySituationCheckBox);
            cmd.Parameters.AddWithValue("@WorkCheckbox", WorkCheckbox);
            cmd.Parameters.AddWithValue("@BottomNotes", BottomNotes);
            cmd.Parameters.AddWithValue("@Note1_19", Note1_19);
            cmd.Parameters.AddWithValue("@TotalBTUH", TotalBTUH);
            cmd.Parameters.AddWithValue("@VolumeCombustionAir", VolumeCombustionAir);

            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

   
    public DataTable GetMETEDAudit_19(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage19";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion


    #region METED Audit Page 20

    public int UpdateMETEDAudit_20(string JobNumber, string AuditorCrewWorkTesting, string PrePostWorkTesting, string PrePostWorkTestingComment, string TechName, string TestDate, string CombustionSafetyTestingCombustionAppliances, string CombustionHeatAppliances, string WaterHeaterCOInitialAMB, string WaterHeaterCOInitialCAZ, string WaterHeaterCOAfterAMB, string WaterHeaterCOAfterCAZ, string WaterHeaterGasLeak, string WaterHeaterFlameRollout, string WaterHeaterSpillageWC, string WaterHeaterSpillageNAT, string WaterHeaterSpillageAfterWC, string WaterHeaterSpillageAfterNAT, string WaterHeaterDraftPressureWC, string WaterHeaterDraftPressureNAT, string WaterHeaterDraftPassWC, string WaterHeaterDraftPassNAT, string WaterHeaterCOFlueWC, string WaterHeaterCOFlueNAT, string WaterHeaterCOPassWC, string WaterHeaterCOPassNAT, string WaterHeaterOptionalStackTemp, string WaterHeaterOptionalO2, string WaterHeaterOptionalEff, string FurnaceBoilerCOInitialAMB, string FurnaceBoilerCOInitialCAZ, string FurnaceBoilerCOAfterWC, string FurnaceBoilerCOAfterNAT, string FurnaceBoilerGasLeak, string FurnaceBoilerFlameRollout, string FurnaceBoilerSpillageWC, string FurnaceBoilerSpillageNAT, string FurnaceBoilerSpillageAfterWC, string FurnaceBoilerSpillageAfterNAT, string FurnaceBoilerDraftPressureWC, string FurnaceBoilerDraftPressureNAT, string FurnaceBoilerDraftPassWC, string FurnaceBoilerDraftPassNAT, string FurnaceBoilerCOFlueWC, string FurnaceBoilerCOFlueNAT, string FurnaceBoilerCOPassWC, string FurnaceBoilerCOPassNAT, string FurnaceBoilerOptionalStackTemp, string FurnaceBoilerOptionalO2, string FurnaceBoilerOptionalEff, string GasRangeCOInitialAMB, string GasRangeCOInitialCAZ, string GasRangeCOAfterWC, string GasRangeCOAfterCAZ, string GasRangeGasLeak, string GasRangeFlameRollout, string GasRangeSpillageWC, string GasRangeSpillageNAT, string GasRangeSpillageAfterWC, string GasRangeSpillageAfterNAT, string GasRangeDraftPressureWC, string GasRangeDraftPressureNAT, string GasRangeDraftPassWC, string GasRangeDraftPassNAT, string GasRangeCOFlueWC, string GasRangeCOFlueNAT, string GasRangeCOPassWC, string GasRangeCOPassNAT, string GasRangeOptionalStackTemp, string GasRangeOptionalO2, string GasRangeOptionalEff, string OtherCOInitialAMB, string OtherCOInitialCAZ, string OtherCOAfterAMB, string OtherCOAfterCAZ, string OtherGasLeak, string OtherFlameRollout, string OtherSpillageWC, string OtherSpillageNAT, string OtherSpillageAfterWC, string OtherSpillageAfterNAT, string OtherDraftPressureWC, string OtherDraftPressureNAT, string OtherDraftPassWC, string OtherDraftPassNAT, string OtherCoFlueWC, string OtherCoFlueNAT, string OtherCoPassWC, string OtherCoPassNAT, string OtherOptionalStackTemp, string OtherOptionalO2, string OtherOptionalEff, string Appliance_1, string Appliance_1_COInitialAMB, string Appliance_1_COInitialCAZ, string Appliance_1_COAfterlAMB, string Appliance_1_COAfterCAZ, string Appliance_1_GasLeak, string Appliance_1_FlameRollout, string Appliance_1_SpillageWC, string Appliance_1_SpillageNAT, string Appliance_1_SpillageAfterWC, string Appliance_1_SpillageAfterNAT, string Appliance_1_DraftPressureWC, string Appliance_1_DraftPressureNAT, string Appliance_1_DraftPassWC, string Appliance_1_DraftPassNAT, string Appliance_1_CoFlueWC, string Appliance_1_CoFlueNAT, string Appliance_1_CoPassWC, string Appliance_1_CoPassNAT, string Appliance_1_OptionalStackTemp, string Appliance_1_OptionalO2, string Appliance_1_OptionalEff, string Appliance_2, string Appliance_2_COInitialAMB, string Appliance_2_COInitialCAZ, string Appliance_2_COAfterAMB, string Appliance_2_COAfterCAZ, string Appliance_2_GasLeak, string Appliance_2_FlameRollout, string Appliance_2_SpillageWC, string Appliance_2_SpillageNAT, string Appliance_2_SpillageAfterWC, string Appliance_2_SpillageAfterNAT, string Appliance_2_DraftPressureWC, string Appliance_2_DraftPressureNAT, string Appliance_2_DraftPassWC, string Appliance_2_DraftPassNAT, string Appliance_2_CoFlueWC, string Appliance_2_CoFlueNAT, string Appliance_2_CoPassWC, string Appliance_2_CoPassNAT, string Appliance_2_OptionalStackTemp, string Appliance_2_OptionalO2, string Appliance_2_OptionalEff, string OvenCOAmbient, string OvenCOAt, string BlankCenter_1, string BlankCenter_2, string BlankCenter_3, string BlankCenter_4, string Notes, string OutdoorTemperature, string CAZWorseCaseNatural, string CAZWorseCaseWC, string CAZWorseCaseDiff, string SelectAppliancesCheckbox_Dryer, string SelectAppliancesCheckbox_WHF, string SelectAppliancesCheckbox_Bath, string SelectAppliancesCheckbox_HVAC, string SelectAppliancesCheckbox_KF, string SelectAppliancesCheckbox_AtticFan, string SelectAppliancesCheckbox_Other, string SelectAppliancesCheckbox_Othertext, string PassRadiobtn, string EmergencySituationCheckBox, string WorkCheckbox, string BottomNotes, string Note1_20, string TotalBTUH, string VolumeCombustionAir)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage20";



            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@AuditorCrewWorkTesting", AuditorCrewWorkTesting);
            cmd.Parameters.AddWithValue("@PrePostWorkTesting", PrePostWorkTesting);
            cmd.Parameters.AddWithValue("@PrePostWorkTestingComment", PrePostWorkTestingComment);
            cmd.Parameters.AddWithValue("@TechName", TechName);
            cmd.Parameters.AddWithValue("@TestDate", TestDate);
            cmd.Parameters.AddWithValue("@CombustionSafetyTestingCombustionAppliances", CombustionSafetyTestingCombustionAppliances);
            cmd.Parameters.AddWithValue("@CombustionHeatAppliances", CombustionHeatAppliances);
            cmd.Parameters.AddWithValue("@WaterHeaterCOInitialAMB", WaterHeaterCOInitialAMB);
            cmd.Parameters.AddWithValue("@WaterHeaterCOInitialCAZ", WaterHeaterCOInitialCAZ);
            cmd.Parameters.AddWithValue("@WaterHeaterCOAfterAMB", WaterHeaterCOAfterAMB);
            cmd.Parameters.AddWithValue("@WaterHeaterCOAfterCAZ", WaterHeaterCOAfterCAZ);
            cmd.Parameters.AddWithValue("@WaterHeaterGasLeak", WaterHeaterGasLeak);
            cmd.Parameters.AddWithValue("@WaterHeaterFlameRollout", WaterHeaterFlameRollout);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageWC", WaterHeaterSpillageWC);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageNAT", WaterHeaterSpillageNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageAfterWC", WaterHeaterSpillageAfterWC);
            cmd.Parameters.AddWithValue("@WaterHeaterSpillageAfterNAT", WaterHeaterSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPressureWC", WaterHeaterDraftPressureWC);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPressureNAT", WaterHeaterDraftPressureNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPassWC", WaterHeaterDraftPassWC);
            cmd.Parameters.AddWithValue("@WaterHeaterDraftPassNAT", WaterHeaterDraftPassNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterCOFlueWC", WaterHeaterCOFlueWC);
            cmd.Parameters.AddWithValue("@WaterHeaterCOFlueNAT", WaterHeaterCOFlueNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterCOPassWC", WaterHeaterCOPassWC);
            cmd.Parameters.AddWithValue("@WaterHeaterCOPassNAT", WaterHeaterCOPassNAT);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalStackTemp", WaterHeaterOptionalStackTemp);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalO2", WaterHeaterOptionalO2);
            cmd.Parameters.AddWithValue("@WaterHeaterOptionalEff", WaterHeaterOptionalEff);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOInitialAMB", FurnaceBoilerCOInitialAMB);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOInitialCAZ", FurnaceBoilerCOInitialCAZ);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOAfterWC ", FurnaceBoilerCOAfterWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOAfterNAT ", FurnaceBoilerCOAfterNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerGasLeak ", FurnaceBoilerGasLeak);
            cmd.Parameters.AddWithValue("@FurnaceBoilerFlameRollout ", FurnaceBoilerFlameRollout);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageWC ", FurnaceBoilerSpillageWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageNAT", FurnaceBoilerSpillageNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageAfterWC", FurnaceBoilerSpillageAfterWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerSpillageAfterNAT", FurnaceBoilerSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPressureWC", FurnaceBoilerDraftPressureWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPressureNAT", FurnaceBoilerDraftPressureNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassWC", FurnaceBoilerDraftPassWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassNAT", FurnaceBoilerDraftPassNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOFlueWC", FurnaceBoilerCOFlueWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOFlueNAT", FurnaceBoilerCOFlueNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOPassWC", FurnaceBoilerCOPassWC);
            cmd.Parameters.AddWithValue("@FurnaceBoilerCOPassNAT", FurnaceBoilerCOPassNAT);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalStackTemp", FurnaceBoilerOptionalStackTemp);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalO2", FurnaceBoilerOptionalO2);
            cmd.Parameters.AddWithValue("@FurnaceBoilerOptionalEff", FurnaceBoilerOptionalEff);
            cmd.Parameters.AddWithValue("@GasRangeCOInitialAMB", GasRangeCOInitialAMB);
            cmd.Parameters.AddWithValue("@GasRangeCOInitialCAZ", GasRangeCOInitialCAZ);
            cmd.Parameters.AddWithValue("@GasRangeCOAfterWC", GasRangeCOAfterWC);
            cmd.Parameters.AddWithValue("@GasRangeCOAfterCAZ", GasRangeCOAfterCAZ);
            cmd.Parameters.AddWithValue("@GasRangeGasLeak", GasRangeGasLeak);
            cmd.Parameters.AddWithValue("@GasRangeFlameRollout", GasRangeFlameRollout);
            cmd.Parameters.AddWithValue("@GasRangeSpillageWC", GasRangeSpillageWC);
            cmd.Parameters.AddWithValue("@GasRangeSpillageNAT", GasRangeSpillageNAT);
            cmd.Parameters.AddWithValue("@GasRangeSpillageAfterWC", GasRangeSpillageAfterWC);
            cmd.Parameters.AddWithValue("@GasRangeSpillageAfterNAT", GasRangeSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@GasRangeDraftPressureWC", GasRangeDraftPressureWC);
            cmd.Parameters.AddWithValue("@GasRangeDraftPressureNAT", GasRangeDraftPressureNAT);
            cmd.Parameters.AddWithValue("@GasRangeDraftPassWC", GasRangeDraftPassWC);
            cmd.Parameters.AddWithValue("@GasRangeDraftPassNAT", GasRangeDraftPassNAT);
            cmd.Parameters.AddWithValue("@GasRangeCOFlueWC", GasRangeCOFlueWC);
            cmd.Parameters.AddWithValue("@GasRangeCOFlueNAT", GasRangeCOFlueNAT);
            cmd.Parameters.AddWithValue("@GasRangeCOPassWC", GasRangeCOPassWC);
            cmd.Parameters.AddWithValue("@GasRangeCOPassNAT", GasRangeCOPassNAT);
            cmd.Parameters.AddWithValue("@GasRangeOptionalStackTemp", GasRangeOptionalStackTemp);
            cmd.Parameters.AddWithValue("@GasRangeOptionalO2", GasRangeOptionalO2);
            cmd.Parameters.AddWithValue("@GasRangeOptionalEff", GasRangeOptionalEff);
            cmd.Parameters.AddWithValue("@OtherCOInitialAMB", OtherCOInitialAMB);
            cmd.Parameters.AddWithValue("@OtherCOInitialCAZ", OtherCOInitialCAZ);
            cmd.Parameters.AddWithValue("@OtherCOAfterAMB", OtherCOAfterAMB);
            cmd.Parameters.AddWithValue("@OtherCOAfterCAZ", OtherCOAfterCAZ);
            cmd.Parameters.AddWithValue("@OtherGasLeak", OtherGasLeak);
            cmd.Parameters.AddWithValue("@OtherFlameRollout", OtherFlameRollout);
            cmd.Parameters.AddWithValue("@OtherSpillageWC", OtherSpillageWC);
            cmd.Parameters.AddWithValue("@OtherSpillageNAT", OtherSpillageNAT);
            cmd.Parameters.AddWithValue("@OtherSpillageAfterWC", OtherSpillageAfterWC);
            cmd.Parameters.AddWithValue("@OtherSpillageAfterNAT", OtherSpillageAfterNAT);
            cmd.Parameters.AddWithValue("@OtherDraftPressureWC", OtherDraftPressureWC);
            cmd.Parameters.AddWithValue("@OtherDraftPressureNAT", OtherDraftPressureNAT);
            cmd.Parameters.AddWithValue("@OtherDraftPassWC", OtherDraftPassWC);
            cmd.Parameters.AddWithValue("@OtherDraftPassNAT", OtherDraftPassNAT);
            cmd.Parameters.AddWithValue("@OtherCoFlueWC", OtherCoFlueWC);
            cmd.Parameters.AddWithValue("@OtherCoFlueNAT", OtherCoFlueNAT);
            cmd.Parameters.AddWithValue("@OtherCoPassWC", OtherCoPassWC);
            cmd.Parameters.AddWithValue("@OtherCoPassNAT", OtherCoPassNAT);
            cmd.Parameters.AddWithValue("@OtherOptionalStackTemp", OtherOptionalStackTemp);
            cmd.Parameters.AddWithValue("@OtherOptionalO2", OtherOptionalO2);
            cmd.Parameters.AddWithValue("@OtherOptionalEff", OtherOptionalEff);
            cmd.Parameters.AddWithValue("@Appliance_1", Appliance_1);
            cmd.Parameters.AddWithValue("@Appliance_1_COInitialAMB", Appliance_1_COInitialAMB);
            cmd.Parameters.AddWithValue("@Appliance_1_COInitialCAZ", Appliance_1_COInitialCAZ);
            cmd.Parameters.AddWithValue("@Appliance_1_COAfterlAMB", Appliance_1_COAfterlAMB);
            cmd.Parameters.AddWithValue("@Appliance_1_COAfterCAZ", Appliance_1_COAfterCAZ);
            cmd.Parameters.AddWithValue("@Appliance_1_GasLeak", Appliance_1_GasLeak);
            cmd.Parameters.AddWithValue("@Appliance_1_FlameRollout", Appliance_1_FlameRollout);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageWC", Appliance_1_SpillageWC);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageNAT", Appliance_1_SpillageNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageAfterWC", Appliance_1_SpillageAfterWC);
            cmd.Parameters.AddWithValue("@Appliance_1_SpillageAfterNAT", Appliance_1_SpillageAfterNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPressureWC", Appliance_1_DraftPressureWC);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPressureNAT", Appliance_1_DraftPressureNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPassWC", Appliance_1_DraftPassWC);
            cmd.Parameters.AddWithValue("@Appliance_1_DraftPassNAT", Appliance_1_DraftPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_CoFlueWC", Appliance_1_CoFlueWC);
            cmd.Parameters.AddWithValue("@Appliance_1_CoFlueNAT", Appliance_1_CoFlueNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_CoPassWC", Appliance_1_CoPassWC);
            cmd.Parameters.AddWithValue("@Appliance_1_CoPassNAT", Appliance_1_CoPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalStackTemp", Appliance_1_OptionalStackTemp);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalO2", Appliance_1_OptionalO2);
            cmd.Parameters.AddWithValue("@Appliance_1_OptionalEff", Appliance_1_OptionalEff);
            cmd.Parameters.AddWithValue("@Appliance_2", Appliance_2);
            cmd.Parameters.AddWithValue("@Appliance_2_COInitialAMB", Appliance_2_COInitialAMB);
            cmd.Parameters.AddWithValue("@Appliance_2_COInitialCAZ", Appliance_2_COInitialCAZ);
            cmd.Parameters.AddWithValue("@Appliance_2_COAfterAMB", Appliance_2_COAfterAMB);
            cmd.Parameters.AddWithValue("@Appliance_2_COAfterCAZ", Appliance_2_COAfterCAZ);
            cmd.Parameters.AddWithValue("@Appliance_2_GasLeak", Appliance_2_GasLeak);
            cmd.Parameters.AddWithValue("@Appliance_2_FlameRollout", Appliance_2_FlameRollout);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageWC", Appliance_2_SpillageWC);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageNAT", Appliance_2_SpillageNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageAfterWC", Appliance_2_SpillageAfterWC);
            cmd.Parameters.AddWithValue("@Appliance_2_SpillageAfterNAT", Appliance_2_SpillageAfterNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPressureWC", Appliance_2_DraftPressureWC);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPressureNAT", Appliance_2_DraftPressureNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPassWC", Appliance_2_DraftPassWC);
            cmd.Parameters.AddWithValue("@Appliance_2_DraftPassNAT", Appliance_2_DraftPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_CoFlueWC", Appliance_2_CoFlueWC);
            cmd.Parameters.AddWithValue("@Appliance_2_CoFlueNAT", Appliance_2_CoFlueNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_CoPassWC", Appliance_2_CoPassWC);
            cmd.Parameters.AddWithValue("@Appliance_2_CoPassNAT", Appliance_2_CoPassNAT);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalStackTemp", Appliance_2_OptionalStackTemp);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalO2", Appliance_2_OptionalO2);
            cmd.Parameters.AddWithValue("@Appliance_2_OptionalEff", Appliance_2_OptionalEff);
            cmd.Parameters.AddWithValue("@OvenCOAmbient", OvenCOAmbient);
            cmd.Parameters.AddWithValue("@OvenCOAt", OvenCOAt);
            cmd.Parameters.AddWithValue("@BlankCenter_1", BlankCenter_1);
            cmd.Parameters.AddWithValue("@BlankCenter_2", BlankCenter_2);
            cmd.Parameters.AddWithValue("@BlankCenter_3", BlankCenter_3);
            cmd.Parameters.AddWithValue("@BlankCenter_4", BlankCenter_4);
            cmd.Parameters.AddWithValue("@Notes", Notes);
            cmd.Parameters.AddWithValue("@OutdoorTemperature", OutdoorTemperature);
            cmd.Parameters.AddWithValue("@CAZWorseCaseNatural", CAZWorseCaseNatural);
            cmd.Parameters.AddWithValue("@CAZWorseCaseWC", CAZWorseCaseWC);
            cmd.Parameters.AddWithValue("@CAZWorseCaseDiff", CAZWorseCaseDiff);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Dryer", SelectAppliancesCheckbox_Dryer);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_WHF", SelectAppliancesCheckbox_WHF);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Bath", SelectAppliancesCheckbox_Bath);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_HVAC", SelectAppliancesCheckbox_HVAC);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_KF", SelectAppliancesCheckbox_KF);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_AtticFan", SelectAppliancesCheckbox_AtticFan);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Other", SelectAppliancesCheckbox_Other);
            cmd.Parameters.AddWithValue("@SelectAppliancesCheckbox_Othertext", SelectAppliancesCheckbox_Othertext);
            cmd.Parameters.AddWithValue("@PassRadiobtn", PassRadiobtn);
            cmd.Parameters.AddWithValue("@EmergencySituationCheckBox", EmergencySituationCheckBox);
            cmd.Parameters.AddWithValue("@WorkCheckbox", WorkCheckbox);
            cmd.Parameters.AddWithValue("@BottomNotes", BottomNotes);
            cmd.Parameters.AddWithValue("@Note1_20", Note1_20);
            cmd.Parameters.AddWithValue("@TotalBTUH", TotalBTUH);
            cmd.Parameters.AddWithValue("@VolumeCombustionAir", VolumeCombustionAir);



            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_20(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage20";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion


    #region METED Audit Page 21

    public int UpdateMETEDAudit_21(string JobNumber, string ReplaceDoor1UI, string ReplaceDoor1Locations, string ReplaceDoor1Materials, string ReplaceDoor1LaborHours, string ReplaceDoors, string ReplaceDoorsRepair, string ReplaceDoorsUI, string ReplaceDoorsLocations, string ReplaceDoorsMaterials, string ReplaceDoorsLaborHours, string ReplaceDoorsWeatherStrip, string ReplaceDoorsWeatherStripRepair, string ReplaceDoorsWeatherStripUI, string ReplaceDoorsWeatherStripLocations, string ReplaceDoorsWeatherStripMaterials, string ReplaceDoorsWeatherStripLaborHours, string ReplaceDoorsSweeps, string ReplaceDoorsSweepsRepair, string ReplaceDoorsSweepsUI, string ReplaceDoorsSweepsLocations, string ReplaceDoorsSweepsMaterials, string ReplaceDoorsSweepsLaborHours, string ReplaceDoorsThresholds, string ReplaceDoorsThresholdsRepair, string ReplaceDoorsThresholdsUI, string ReplaceDoorsThresholdsLocations, string ReplaceDoorsThresholdsMaterials, string ReplaceDoorsThresholdsLaborHours, string ReplaceDoorsSealing, string ReplaceDoorsSealingRepair, string ReplaceDoorsSealingUI, string ReplaceDoorsSealingLocations, string ReplaceDoorsSealingMaterials, string ReplaceDoorsSealingLaborHours, string ReplaceWindows1UI, string ReplaceWindows1Locations, string ReplaceWindows1Materials, string ReplaceWindows1LaborHours, string ReplaceWindows, string ReplaceWindowsRepair, string ReplaceWindowsUI, string ReplaceWindowsLocations, string ReplaceWindowsMaterials, string ReplaceWindowsLaborHours, string ReplaceWindowsBrokenGlass, string ReplaceWindowsBrokenGlassRepair, string ReplaceWindowsBrokenGlassUI, string ReplaceWindowsBrokenGlassLocations, string ReplaceWindowsBrokenGlassMaterials, string ReplaceWindowsBrokenGlassLaborHours, string ReplaceWindowsReglaze, string ReplaceWindowsReglazeRepair, string ReplaceWindowsReglazeUI, string ReplaceWindowsReglazeLocations, string ReplaceWindowsReglazeMaterials, string ReplaceWindowsReglazeLaborHours, string ReplaceWindowsWeatherStrip, string ReplaceWindowsWeatherStripRepair, string ReplaceWindowsWeatherStripUI, string ReplaceWindowsWeatherStripLocations, string ReplaceWindowsWeatherStripMaterials, string ReplaceWindowsWeatherStripLaborHours, string ReplaceWindowsSashLocks, string ReplaceWindowsSashLocksRepair, string ReplaceWindowsSashLocksUI, string ReplaceWindowsSashLocksLocations, string ReplaceWindowsSashLocksMaterials, string ReplaceWindowsSashLocksLaborHours, string ReplaceWindowsSealing, string ReplaceWindowsSealingRepair, string ReplaceWindowsSealingUI, string ReplaceWindowsSealingLocations, string ReplaceWindowsSealingMaterials, string ReplaceWindowsSealingLaborHours, string ReplaceOther1UI, string ReplaceOther1Locations, string ReplaceOther1Materials, string ReplaceOther1LaborHours, string ReplaceOtherDryerVents, string ReplaceOtherDryerVentsRepair, string ReplaceOtherDryerVentsUI, string ReplaceOtherDryerVentsLocations, string ReplaceOtherDryerVentsMaterials, string ReplaceOtherDryerVentsLaborHours, string ReplaceOtherFirePlace, string ReplaceOtherFirePlaceRepair, string ReplaceOtherFirePlaceUI, string ReplaceOtherFirePlaceLocations, string ReplaceOtherFirePlaceMaterials, string ReplaceOtherFirePlaceLaborHours, string ReplaceOtherPlumbing, string ReplaceOtherPlumbingRepair, string ReplaceOtherPlumbingUI, string ReplaceOtherPlumbingLocations, string ReplaceOtherPlumbingMaterials, string ReplaceOtherPlumbingLaborHours, string ReplaceOtherElectrical, string ReplaceOtherElectricalRepair, string ReplaceOtherElectricalUI, string ReplaceOtherElectricalLocations, string ReplaceOtherElectricalMaterials, string ReplaceOtherElectricalLaborHours, string ReplaceOtherWalls, string ReplaceOtherWallsRepair, string ReplaceOtherWallsUI, string ReplaceOtherWallsLocations, string ReplaceOtherWallsMaterials, string ReplaceOtherWallsLaborHours, string ReplaceOtherStairs, string ReplaceOtherStairsRepair, string ReplaceOtherStairsUI, string ReplaceOtherStairsLocations, string ReplaceOtherStairsMaterials, string ReplaceOtherStairsLaborHours, string ReplaceOtherOther, string ReplaceOtherOtherRepair, string ReplaceOtherOtherUI, string ReplaceOtherOtherLocations, string ReplaceOtherOtherMaterials, string ReplaceOtherOtherLaborHours, string TopPlates, string TopPlatesMaterials, string TopPlatesLabourHours, string PlumbingPenetrations, string PlumbingPenetrationsMaterials, string PlumbingPenetrationsLaborHours, string ElectricalPenetrations, string ElectricalPenetrationsMaterials, string ElectricalPenetrationsLabourHours, string DroppedCeilings, string DroppedCeilingsMaterials, string DroppedCeilingsLaborHours, string BulkheadSoffits, string BulkheadSoffitsMaterials, string BulkheadSoffitsLabourHours, string RecessedFixtures, string RecessedFixturesMaterials, string RecessedFixturesLabourHours, string Access, string AccessMaterials, string AccessLabourHours, string Ducts, string DuctsMaterials, string DuctsLabourHours, string ACorHTG, string ACorHTGMaterials, string ACorHTGLabourHours, string OpenChaseways, string OpenChasewaysMaterials, string OpenChasewaysLabourHours, string Other, string OtherMaterial, string OtherLabourHours, string Page14Comments)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETEDAuditPage21";

            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);

            cmd.Parameters.AddWithValue("@ReplaceDoor1UI", ReplaceDoor1UI);
            cmd.Parameters.AddWithValue("@ReplaceDoor1Locations", ReplaceDoor1Locations);
            cmd.Parameters.AddWithValue("@ReplaceDoor1Materials", ReplaceDoor1Materials);
            cmd.Parameters.AddWithValue("@ReplaceDoor1LaborHours", ReplaceDoor1LaborHours);

            cmd.Parameters.AddWithValue("@ReplaceDoors", ReplaceDoors);
            cmd.Parameters.AddWithValue("@ReplaceDoorsRepair", ReplaceDoorsRepair);
            cmd.Parameters.AddWithValue("@ReplaceDoorsUI", ReplaceDoorsUI);
            cmd.Parameters.AddWithValue("@ReplaceDoorsLocations", ReplaceDoorsLocations);
            cmd.Parameters.AddWithValue("@ReplaceDoorsMaterials", ReplaceDoorsMaterials);
            cmd.Parameters.AddWithValue("@ReplaceDoorsLaborHours", ReplaceDoorsLaborHours);

            cmd.Parameters.AddWithValue("@ReplaceDoorsWeatherStrip", ReplaceDoorsWeatherStrip);
            cmd.Parameters.AddWithValue("@ReplaceDoorsWeatherStripRepair", ReplaceDoorsWeatherStripRepair);
            cmd.Parameters.AddWithValue("@ReplaceDoorsWeatherStripUI", ReplaceDoorsWeatherStripUI);
            cmd.Parameters.AddWithValue("@ReplaceDoorsWeatherStripLocations", ReplaceDoorsWeatherStripLocations);
            cmd.Parameters.AddWithValue("@ReplaceDoorsWeatherStripMaterials", ReplaceDoorsWeatherStripMaterials);
            cmd.Parameters.AddWithValue("@ReplaceDoorsWeatherStripLaborHours", ReplaceDoorsWeatherStripLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceDoorsSweeps", ReplaceDoorsSweeps);
            cmd.Parameters.AddWithValue("@ReplaceDoorsSweepsRepair", ReplaceDoorsSweepsRepair);
            cmd.Parameters.AddWithValue("@ReplaceDoorsSweepsUI", ReplaceDoorsSweepsUI);
            cmd.Parameters.AddWithValue("@ReplaceDoorsSweepsLocations", ReplaceDoorsSweepsLocations);
            cmd.Parameters.AddWithValue("@ReplaceDoorsSweepsMaterials", ReplaceDoorsSweepsMaterials);
            cmd.Parameters.AddWithValue("@ReplaceDoorsSweepsLaborHours", ReplaceDoorsSweepsLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceDoorsThresholds", ReplaceDoorsThresholds);
            cmd.Parameters.AddWithValue("@ReplaceDoorsThresholdsRepair", ReplaceDoorsThresholdsRepair);
            cmd.Parameters.AddWithValue("@ReplaceDoorsThresholdsUI", ReplaceDoorsThresholdsUI);
            cmd.Parameters.AddWithValue("@ReplaceDoorsThresholdsLocations", ReplaceDoorsThresholdsLocations);
            cmd.Parameters.AddWithValue("@ReplaceDoorsThresholdsMaterials", ReplaceDoorsThresholdsMaterials);
            cmd.Parameters.AddWithValue("@ReplaceDoorsThresholdsLaborHours", ReplaceDoorsThresholdsLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceDoorsSealing", ReplaceDoorsSealing);
            cmd.Parameters.AddWithValue("@ReplaceDoorsSealingRepair", ReplaceDoorsSealingRepair);
            cmd.Parameters.AddWithValue("@ReplaceDoorsSealingUI", ReplaceDoorsSealingUI);
            cmd.Parameters.AddWithValue("@ReplaceDoorsSealingLocations", ReplaceDoorsSealingLocations);
            cmd.Parameters.AddWithValue("@ReplaceDoorsSealingMaterials", ReplaceDoorsSealingMaterials);
            cmd.Parameters.AddWithValue("@ReplaceDoorsSealingLaborHours", ReplaceDoorsSealingLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceWindows1UI", ReplaceWindows1UI);
            cmd.Parameters.AddWithValue("@ReplaceWindows1Locations", ReplaceWindows1Locations);
            cmd.Parameters.AddWithValue("@ReplaceWindows1Materials", ReplaceWindows1Materials);
            cmd.Parameters.AddWithValue("@ReplaceWindows1LaborHours", ReplaceWindows1LaborHours);


            cmd.Parameters.AddWithValue("@ReplaceWindows", ReplaceWindows);
            cmd.Parameters.AddWithValue("@ReplaceWindowsRepair", ReplaceWindowsRepair);
            cmd.Parameters.AddWithValue("@ReplaceWindowsUI", ReplaceWindowsUI);
            cmd.Parameters.AddWithValue("@ReplaceWindowsLocations", ReplaceWindowsLocations);
            cmd.Parameters.AddWithValue("@ReplaceWindowsMaterials", ReplaceWindowsMaterials);
            cmd.Parameters.AddWithValue("@ReplaceWindowsLaborHours", ReplaceWindowsLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceWindowsBrokenGlass", ReplaceWindowsBrokenGlass);
            cmd.Parameters.AddWithValue("@ReplaceWindowsBrokenGlassRepair", ReplaceWindowsBrokenGlassRepair);
            cmd.Parameters.AddWithValue("@ReplaceWindowsBrokenGlassUI", ReplaceWindowsBrokenGlassUI);
            cmd.Parameters.AddWithValue("@ReplaceWindowsBrokenGlassLocations", ReplaceWindowsBrokenGlassLocations);
            cmd.Parameters.AddWithValue("@ReplaceWindowsBrokenGlassMaterials", ReplaceWindowsBrokenGlassMaterials);
            cmd.Parameters.AddWithValue("@ReplaceWindowsBrokenGlassLaborHours", ReplaceWindowsBrokenGlassLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceWindowsReglaze", ReplaceWindowsReglaze);
            cmd.Parameters.AddWithValue("@ReplaceWindowsReglazeRepair", ReplaceWindowsReglazeRepair);
            cmd.Parameters.AddWithValue("@ReplaceWindowsReglazeUI", ReplaceWindowsReglazeUI);
            cmd.Parameters.AddWithValue("@ReplaceWindowsReglazeLocations", ReplaceWindowsReglazeLocations);
            cmd.Parameters.AddWithValue("@ReplaceWindowsReglazeMaterials", ReplaceWindowsReglazeMaterials);
            cmd.Parameters.AddWithValue("@ReplaceWindowsReglazeLaborHours", ReplaceWindowsReglazeLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceWindowsWeatherStrip", ReplaceWindowsWeatherStrip);
            cmd.Parameters.AddWithValue("@ReplaceWindowsWeatherStripRepair", ReplaceWindowsWeatherStripRepair);
            cmd.Parameters.AddWithValue("@ReplaceWindowsWeatherStripUI", ReplaceWindowsWeatherStripUI);
            cmd.Parameters.AddWithValue("@ReplaceWindowsWeatherStripLocations", ReplaceWindowsWeatherStripLocations);
            cmd.Parameters.AddWithValue("@ReplaceWindowsWeatherStripMaterials", ReplaceWindowsWeatherStripMaterials);
            cmd.Parameters.AddWithValue("@ReplaceWindowsWeatherStripLaborHours", ReplaceWindowsWeatherStripLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceWindowsSashLocks", ReplaceWindowsSashLocks);
            cmd.Parameters.AddWithValue("@ReplaceWindowsSashLocksRepair", ReplaceWindowsSashLocksRepair);
            cmd.Parameters.AddWithValue("@ReplaceWindowsSashLocksUI", ReplaceWindowsSashLocksUI);
            cmd.Parameters.AddWithValue("@ReplaceWindowsSashLocksLocations", ReplaceWindowsSashLocksLocations);
            cmd.Parameters.AddWithValue("@ReplaceWindowsSashLocksMaterials", ReplaceWindowsSashLocksMaterials);
            cmd.Parameters.AddWithValue("@ReplaceWindowsSashLocksLaborHours", ReplaceWindowsSashLocksLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceWindowsSealing", ReplaceWindowsSealing);
            cmd.Parameters.AddWithValue("@ReplaceWindowsSealingRepair", ReplaceWindowsSealingRepair);
            cmd.Parameters.AddWithValue("@ReplaceWindowsSealingUI", ReplaceWindowsSealingUI);
            cmd.Parameters.AddWithValue("@ReplaceWindowsSealingLocations", ReplaceWindowsSealingLocations);
            cmd.Parameters.AddWithValue("@ReplaceWindowsSealingMaterials", ReplaceWindowsSealingMaterials);
            cmd.Parameters.AddWithValue("@ReplaceWindowsSealingLaborHours", ReplaceWindowsSealingLaborHours);

            cmd.Parameters.AddWithValue("@ReplaceOther1UI", ReplaceOther1UI);
            cmd.Parameters.AddWithValue("@ReplaceOther1Locations", ReplaceOther1Locations);
            cmd.Parameters.AddWithValue("@ReplaceOther1Materials", ReplaceOther1Materials);
            cmd.Parameters.AddWithValue("@ReplaceOther1LaborHours", ReplaceOther1LaborHours);


            cmd.Parameters.AddWithValue("@ReplaceOtherDryerVents", ReplaceOtherDryerVents);
            cmd.Parameters.AddWithValue("@ReplaceOtherDryerVentsRepair", ReplaceOtherDryerVentsRepair);
            cmd.Parameters.AddWithValue("@ReplaceOtherDryerVentsUI", ReplaceOtherDryerVentsUI);
            cmd.Parameters.AddWithValue("@ReplaceOtherDryerVentsLocations", ReplaceOtherDryerVentsLocations);
            cmd.Parameters.AddWithValue("@ReplaceOtherDryerVentsMaterials", ReplaceOtherDryerVentsMaterials);
            cmd.Parameters.AddWithValue("@ReplaceOtherDryerVentsLaborHours", ReplaceOtherDryerVentsLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceOtherFirePlace", ReplaceOtherFirePlace);
            cmd.Parameters.AddWithValue("@ReplaceOtherFirePlaceRepair", ReplaceOtherFirePlaceRepair);
            cmd.Parameters.AddWithValue("@ReplaceOtherFirePlaceUI", ReplaceOtherFirePlaceUI);
            cmd.Parameters.AddWithValue("@ReplaceOtherFirePlaceLocations", ReplaceOtherFirePlaceLocations);
            cmd.Parameters.AddWithValue("@ReplaceOtherFirePlaceMaterials", ReplaceOtherFirePlaceMaterials);
            cmd.Parameters.AddWithValue("@ReplaceOtherFirePlaceLaborHours", ReplaceOtherFirePlaceLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceOtherPlumbing", ReplaceOtherPlumbing);
            cmd.Parameters.AddWithValue("@ReplaceOtherPlumbingRepair", ReplaceOtherPlumbingRepair);
            cmd.Parameters.AddWithValue("@ReplaceOtherPlumbingUI", ReplaceOtherPlumbingUI);
            cmd.Parameters.AddWithValue("@ReplaceOtherPlumbingLocations", ReplaceOtherPlumbingLocations);
            cmd.Parameters.AddWithValue("@ReplaceOtherPlumbingMaterials", ReplaceOtherPlumbingMaterials);
            cmd.Parameters.AddWithValue("@ReplaceOtherPlumbingLaborHours", ReplaceOtherPlumbingLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceOtherElectrical", ReplaceOtherElectrical);
            cmd.Parameters.AddWithValue("@ReplaceOtherElectricalRepair", ReplaceOtherElectricalRepair);
            cmd.Parameters.AddWithValue("@ReplaceOtherElectricalUI", ReplaceOtherElectricalUI);
            cmd.Parameters.AddWithValue("@ReplaceOtherElectricalLocations", ReplaceOtherElectricalLocations);
            cmd.Parameters.AddWithValue("@ReplaceOtherElectricalMaterials", ReplaceOtherElectricalMaterials);
            cmd.Parameters.AddWithValue("@ReplaceOtherElectricalLaborHours", ReplaceOtherElectricalLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceOtherWalls", ReplaceOtherWalls);
            cmd.Parameters.AddWithValue("@ReplaceOtherWallsRepair", ReplaceOtherWallsRepair);
            cmd.Parameters.AddWithValue("@ReplaceOtherWallsUI", ReplaceOtherWallsUI);
            cmd.Parameters.AddWithValue("@ReplaceOtherWallsLocations", ReplaceOtherWallsLocations);
            cmd.Parameters.AddWithValue("@ReplaceOtherWallsMaterials", ReplaceOtherWallsMaterials);
            cmd.Parameters.AddWithValue("@ReplaceOtherWallsLaborHours", ReplaceOtherWallsLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceOtherStairs", ReplaceOtherStairs);
            cmd.Parameters.AddWithValue("@ReplaceOtherStairsRepair", ReplaceOtherStairsRepair);
            cmd.Parameters.AddWithValue("@ReplaceOtherStairsUI", ReplaceOtherStairsUI);
            cmd.Parameters.AddWithValue("@ReplaceOtherStairsLocations", ReplaceOtherStairsLocations);
            cmd.Parameters.AddWithValue("@ReplaceOtherStairsMaterials", ReplaceOtherStairsMaterials);
            cmd.Parameters.AddWithValue("@ReplaceOtherStairsLaborHours", ReplaceOtherStairsLaborHours);


            cmd.Parameters.AddWithValue("@ReplaceOtherOther", ReplaceOtherOther);
            cmd.Parameters.AddWithValue("@ReplaceOtherOtherRepair", ReplaceOtherOtherRepair);
            cmd.Parameters.AddWithValue("@ReplaceOtherOtherUI", ReplaceOtherOtherUI);
            cmd.Parameters.AddWithValue("@ReplaceOtherOtherLocations", ReplaceOtherOtherLocations);
            cmd.Parameters.AddWithValue("@ReplaceOtherOtherMaterials", ReplaceOtherOtherMaterials);
            cmd.Parameters.AddWithValue("@ReplaceOtherOtherLaborHours", ReplaceOtherOtherLaborHours);


            cmd.Parameters.AddWithValue("@TopPlates", TopPlates);
            cmd.Parameters.AddWithValue("@TopPlatesMaterials", TopPlatesMaterials);
            cmd.Parameters.AddWithValue("@TopPlatesLabourHours", TopPlatesLabourHours);

            cmd.Parameters.AddWithValue("@PlumbingPenetrations", PlumbingPenetrations);
            cmd.Parameters.AddWithValue("@PlumbingPenetrationsMaterials", PlumbingPenetrationsMaterials);
            cmd.Parameters.AddWithValue("@PlumbingPenetrationsLaborHours", PlumbingPenetrationsLaborHours);

            cmd.Parameters.AddWithValue("@ElectricalPenetrations", ElectricalPenetrations);
            cmd.Parameters.AddWithValue("@ElectricalPenetrationsMaterials", ElectricalPenetrationsMaterials);
            cmd.Parameters.AddWithValue("@ElectricalPenetrationsLabourHours", ElectricalPenetrationsLabourHours);

            cmd.Parameters.AddWithValue("@DroppedCeilings", DroppedCeilings);
            cmd.Parameters.AddWithValue("@DroppedCeilingsMaterials", DroppedCeilingsMaterials);
            cmd.Parameters.AddWithValue("@DroppedCeilingsLaborHours", DroppedCeilingsLaborHours);

            cmd.Parameters.AddWithValue("@BulkheadSoffits", BulkheadSoffits);
            cmd.Parameters.AddWithValue("@BulkheadSoffitsMaterials", BulkheadSoffitsMaterials);
            cmd.Parameters.AddWithValue("@BulkheadSoffitsLabourHours", BulkheadSoffitsLabourHours);

            cmd.Parameters.AddWithValue("@RecessedFixtures", RecessedFixtures);
            cmd.Parameters.AddWithValue("@RecessedFixturesMaterials", RecessedFixturesMaterials);
            cmd.Parameters.AddWithValue("@RecessedFixturesLabourHours", RecessedFixturesLabourHours);

            cmd.Parameters.AddWithValue("@Access", Access);
            cmd.Parameters.AddWithValue("@AccessMaterials", AccessMaterials);
            cmd.Parameters.AddWithValue("@AccessLabourHours", AccessLabourHours);

            cmd.Parameters.AddWithValue("@Ducts", Ducts);
            cmd.Parameters.AddWithValue("@DuctsMaterials", DuctsMaterials);
            cmd.Parameters.AddWithValue("@DuctsLabourHours", DuctsLabourHours);

            cmd.Parameters.AddWithValue("@ACorHTG", ACorHTG);
            cmd.Parameters.AddWithValue("@ACorHTGMaterials", ACorHTGMaterials);
            cmd.Parameters.AddWithValue("@ACorHTGLabourHours", ACorHTGLabourHours);

            cmd.Parameters.AddWithValue("@OpenChaseways", OpenChaseways);
            cmd.Parameters.AddWithValue("@OpenChasewaysMaterials", OpenChasewaysMaterials);
            cmd.Parameters.AddWithValue("@OpenChasewaysLabourHours", OpenChasewaysLabourHours);

            cmd.Parameters.AddWithValue("@Other", Other);
            cmd.Parameters.AddWithValue("@OtherMaterial", OtherMaterial);
            cmd.Parameters.AddWithValue("@OtherLabourHours", OtherLabourHours);

            cmd.Parameters.AddWithValue("@Page14Comments", Page14Comments);


            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_21(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage21";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion

    #region METED Audit Page 22

    public int UpdateMETEDAudit_22(string JobNumber, string MeasureInstalledLine1, string MeasureFirstenergyLine1, string MeaasureSubcontractorLine1, string MeasureInstalledLine2, string MeasureFirstenergyLine2, string MeaasureSubcontractorLine2, string MeasureInstalledLine3, string MeasureFirstenergyLine3, string MeaasureSubcontractorLine3, string MeasureInstalledLine4, string MeasureFirstenergyLine4, string MeaasureSubcontractorLine4, string MeasureInstalledLine5, string MeasureFirstenergyLine5, string MeaasureSubcontractorLine5, string MeasureInstalledLine6, string MeasureFirstenergyLine6, string MeaasureSubcontractorLine6, string MeasureInstalledLine7, string MeasureFirstenergyLine7, string MeaasureSubcontractorLine7, string MeasureInstalledLine8, string MeasureFirstenergyLine8, string MeaasureSubcontractorLine8, string MeasureInstalledLine9, string MeasureFirstenergyLine9, string MeaasureSubcontractorLine9, string MeasureInstalledLine10, string MeasureFirstenergyLine10, string MeaasureSubcontractorLine10, string OtherInsandEvaluators, string MeasuresRefusedLine1, string CustomerSignDateLine1, string MeasuresRefusedLine2, string CustomerSignDateLine2, string MeasuresRefusedLine3, string CustomerSignDateLine3, string MeasuresRefusedLine4, string CustomerSignDateLine4, string WarmInvoice, string ThisAuditForm, string SeasonalForm, string OurAgreement, string OurStrategy, string CustomerKwh, string AccountKWHWebsite, string RT, string RTNA, string ReceiptsInformation, string ReceiptsInfoNA, string PhotoInaccesible, string PhotoInaccesibleNA, string WeatherizationPresent, string WeatherizationPresentNA, string CopyAirCustomer, string CopyAirCustomerNA, string CopyCustomerWorksheet, string CopyCustomerWorksheetNA, string CopyHSForm, string CopyHSFormNA, string ReferralProgram, string ReferralProgramNA, string AccountsWebsite, string HeatContractor, string ACContrator)
    {
        int i = 0;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMETED_AuditPage22";

            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            cmd.Parameters.AddWithValue("@MeasureInstalledLine1", MeasureInstalledLine1);
            cmd.Parameters.AddWithValue("@MeasureFirstenergyLine1", MeasureFirstenergyLine1);
            cmd.Parameters.AddWithValue("@MeaasureSubcontractorLine1", MeaasureSubcontractorLine1);

            cmd.Parameters.AddWithValue("@MeasureInstalledLine2", MeasureInstalledLine2);
            cmd.Parameters.AddWithValue("@MeasureFirstenergyLine2", MeasureFirstenergyLine2);
            cmd.Parameters.AddWithValue("@MeaasureSubcontractorLine2", MeaasureSubcontractorLine2);

            cmd.Parameters.AddWithValue("@MeasureInstalledLine3", MeasureInstalledLine3);
            cmd.Parameters.AddWithValue("@MeasureFirstenergyLine3", MeasureFirstenergyLine3);
            cmd.Parameters.AddWithValue("@MeaasureSubcontractorLine3", MeaasureSubcontractorLine3);

            cmd.Parameters.AddWithValue("@MeasureInstalledLine4", MeasureInstalledLine4);
            cmd.Parameters.AddWithValue("@MeasureFirstenergyLine4", MeasureFirstenergyLine4);
            cmd.Parameters.AddWithValue("@MeaasureSubcontractorLine4", MeaasureSubcontractorLine4);

            cmd.Parameters.AddWithValue("@MeasureInstalledLine5", MeasureInstalledLine5);
            cmd.Parameters.AddWithValue("@MeasureFirstenergyLine5", MeasureFirstenergyLine5);
            cmd.Parameters.AddWithValue("@MeaasureSubcontractorLine5", MeaasureSubcontractorLine5);

            cmd.Parameters.AddWithValue("@MeasureInstalledLine6", MeasureInstalledLine6);
            cmd.Parameters.AddWithValue("@MeasureFirstenergyLine6", MeasureFirstenergyLine6);
            cmd.Parameters.AddWithValue("@MeaasureSubcontractorLine6", MeaasureSubcontractorLine6);

            cmd.Parameters.AddWithValue("@MeasureInstalledLine7", MeasureInstalledLine7);
            cmd.Parameters.AddWithValue("@MeasureFirstenergyLine7", MeasureFirstenergyLine7);
            cmd.Parameters.AddWithValue("@MeaasureSubcontractorLine7", MeaasureSubcontractorLine7);

            cmd.Parameters.AddWithValue("@MeasureInstalledLine8", MeasureInstalledLine8);
            cmd.Parameters.AddWithValue("@MeasureFirstenergyLine8", MeasureFirstenergyLine8);
            cmd.Parameters.AddWithValue("@MeaasureSubcontractorLine8", MeaasureSubcontractorLine8);

            cmd.Parameters.AddWithValue("@MeasureInstalledLine9", MeasureInstalledLine9);
            cmd.Parameters.AddWithValue("@MeasureFirstenergyLine9", MeasureFirstenergyLine9);
            cmd.Parameters.AddWithValue("@MeaasureSubcontractorLine9", MeaasureSubcontractorLine9);

            cmd.Parameters.AddWithValue("@MeasureInstalledLine10", MeasureInstalledLine10);
            cmd.Parameters.AddWithValue("@MeasureFirstenergyLine10", MeasureFirstenergyLine10);
            cmd.Parameters.AddWithValue("@MeaasureSubcontractorLine10", MeaasureSubcontractorLine10);

            cmd.Parameters.AddWithValue("@OtherInsandEvaluators", OtherInsandEvaluators);

            cmd.Parameters.AddWithValue("@MeasuresRefusedLine1", MeasuresRefusedLine1);
            cmd.Parameters.AddWithValue("@CustomerSignDateLine1", CustomerSignDateLine1);

            cmd.Parameters.AddWithValue("@MeasuresRefusedLine2", MeasuresRefusedLine2);
            cmd.Parameters.AddWithValue("@CustomerSignDateLine2", CustomerSignDateLine2);

            cmd.Parameters.AddWithValue("@MeasuresRefusedLine3", MeasuresRefusedLine3);
            cmd.Parameters.AddWithValue("@CustomerSignDateLine3", CustomerSignDateLine3);

            cmd.Parameters.AddWithValue("@MeasuresRefusedLine4", MeasuresRefusedLine4);
            cmd.Parameters.AddWithValue("@CustomerSignDateLine4", CustomerSignDateLine4);

            cmd.Parameters.AddWithValue("@WarmInvoice", WarmInvoice);
            cmd.Parameters.AddWithValue("@ThisAuditForm", ThisAuditForm);
            cmd.Parameters.AddWithValue("@SeasonalForm", SeasonalForm);
            cmd.Parameters.AddWithValue("@OurAgreement", OurAgreement);
            cmd.Parameters.AddWithValue("@OurStrategy", OurStrategy);
            cmd.Parameters.AddWithValue("@CustomerKwh", CustomerKwh);
            cmd.Parameters.AddWithValue("@AccountKWHWebsite", AccountKWHWebsite);
            cmd.Parameters.AddWithValue("@RT", RT);
            cmd.Parameters.AddWithValue("@RTNA", RTNA);
            cmd.Parameters.AddWithValue("@ReceiptsInformation", ReceiptsInformation);
            cmd.Parameters.AddWithValue("@ReceiptsInfoNA", ReceiptsInfoNA);
            cmd.Parameters.AddWithValue("@PhotoInaccesible", PhotoInaccesible);
            cmd.Parameters.AddWithValue("@PhotoInaccesibleNA", PhotoInaccesibleNA);
            cmd.Parameters.AddWithValue("@WeatherizationPresent", WeatherizationPresent);
            cmd.Parameters.AddWithValue("@WeatherizationPresentNA", WeatherizationPresentNA);
            cmd.Parameters.AddWithValue("@CopyAirCustomer", CopyAirCustomer);
            cmd.Parameters.AddWithValue("@CopyAirCustomerNA", CopyAirCustomerNA);
            cmd.Parameters.AddWithValue("@CopyCustomerWorksheet", CopyCustomerWorksheet);
            cmd.Parameters.AddWithValue("@CopyCustomerWorksheetNA", CopyCustomerWorksheetNA);
            cmd.Parameters.AddWithValue("@CopyHSForm", CopyHSForm);
            cmd.Parameters.AddWithValue("@CopyHSFormNA", CopyHSFormNA);
            cmd.Parameters.AddWithValue("@ReferralProgram", ReferralProgram);
            cmd.Parameters.AddWithValue("@ReferralProgramNA", ReferralProgramNA);
            cmd.Parameters.AddWithValue("@AccountsWebsite", AccountsWebsite);
            cmd.Parameters.AddWithValue("@HeatContractor", HeatContractor);
            cmd.Parameters.AddWithValue("@ACContrator", ACContrator);
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return i;

    }

    public DataTable GetMETEDAudit_22(string JobNumber)
    {
        DataTable dt = new DataTable(JobNumber);
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectMETED_AuditPage22";
            cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        return dt;
    }

    #endregion








}
