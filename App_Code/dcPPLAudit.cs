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
/// Summary description for dcPPLAudit
/// </summary>
public class dcPPLAudit
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    private int i;

    public dcPPLAudit()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    #region Audit PPL 1

    public void userId(int Id, string Job)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Proc_UserIdJob";
        cmd.Parameters.AddWithValue("@Id", Id);
        cmd.Parameters.AddWithValue("@JobNumber", Job);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }


    public DataTable GetPPLInspection(string JobNumber)
    {
        DataTable dtshow = new DataTable();
        SqlCommand cmd = new SqlCommand();
        ///int jobnum = Convert.ToInt32(JobNumber);
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from PPLInspection1 where JobNumber='" + JobNumber + "'";
        //cmd.CommandText = "select * from PPLInspection1 where JobNumber='" + jobnum + "'";
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        dtshow.Load(dr);
        return dtshow;

    }
    public int PPLInspectionUpdate(string JobName, string Job, DateTime? DateOfInspection, string InspectorName, bool toggle1, bool toggle2, string Healthy, string Observation, bool toggle3, string Missed,
        string AdditionalComments1, bool toggle4, DateTime? DateOfSession, string EmploymentStatus, string Under18, string AnnualIncome, string PrimarySource, bool toggle5, string ActionToSave,
        string ElectricBillChanged, string HowItHasChanged, string FurtherSteps, string AdditionalComments2)
    { 
     SqlCommand cmd = new SqlCommand();
        
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PPLInspectionUpdateByJobNumber";
            cmd.Parameters.AddWithValue("@Job", Job);
            cmd.Parameters.AddWithValue("@JobName", JobName);
            cmd.Parameters.AddWithValue("@DateOfInspection", DateOfInspection);
            cmd.Parameters.AddWithValue("@InspectorName", InspectorName);
            cmd.Parameters.AddWithValue("@toggle1", toggle1);
            cmd.Parameters.AddWithValue("@toggle2", toggle2);
            cmd.Parameters.AddWithValue("@Healthy", Healthy);
            cmd.Parameters.AddWithValue("@Observation", Observation);
            cmd.Parameters.AddWithValue("@toggle3", toggle3);
            cmd.Parameters.AddWithValue("@Missed", Missed);
            cmd.Parameters.AddWithValue("@AdditionalComments1", AdditionalComments1);
            cmd.Parameters.AddWithValue("@toggle4", toggle4);
            cmd.Parameters.AddWithValue("@DateOfSession", DateOfSession);
            cmd.Parameters.AddWithValue("@EmploymentStatus", EmploymentStatus);
            cmd.Parameters.AddWithValue("@Under18", Under18);
            cmd.Parameters.AddWithValue("@AnnualIncome", AnnualIncome);
            cmd.Parameters.AddWithValue("@PrimarySource", PrimarySource);
            cmd.Parameters.AddWithValue("@toggle5", toggle5);
            cmd.Parameters.AddWithValue("@ActionToSave", ActionToSave);
            cmd.Parameters.AddWithValue("@ElectricBillChanged", ElectricBillChanged);
            cmd.Parameters.AddWithValue("@HowItHasChanged", HowItHasChanged);
            cmd.Parameters.AddWithValue("@FurtherSteps", FurtherSteps);
            cmd.Parameters.AddWithValue("@AdditionalComments2", AdditionalComments2);
            con.Open();
            int i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
      
        return i;
    }

    public int UpdatePPLAudit_1(string JobNumber, string Contractor, string DoesRentOrMortExceedIncome, string LandLordApproval, string DirectionsAndSpecialInstructions, string OnTrackStartDate, decimal OnTrackAmount, decimal ActualAllowance, string Auditor, string DateOfAudit, string DateJobComplete, string SquareFootage, string IfAuditNotCompleted, string IfAuditNotCompletedReason, string StateOrGasWeatherization, string StateOrGasWeatherizationComments, string HomePhone, string CellPhone)
{
    userId(Convert.ToInt32(Auditor), JobNumber);
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAuditPage1Ver2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@Contractor", Contractor);
        cmd.Parameters.AddWithValue("@DoesRentOrMortExceedIncome", DoesRentOrMortExceedIncome);
        cmd.Parameters.AddWithValue("@LandLordApproval", LandLordApproval);


        cmd.Parameters.AddWithValue("@DirectionsAndSpecialInstructions", DirectionsAndSpecialInstructions);
        cmd.Parameters.AddWithValue("@OnTrackStartDate", OnTrackStartDate);
        cmd.Parameters.AddWithValue("@OnTrackAmount", OnTrackAmount);
        cmd.Parameters.AddWithValue("@ActualAllowance", ActualAllowance);

        cmd.Parameters.AddWithValue("@Auditor", Auditor);
        cmd.Parameters.AddWithValue("@DateOfAudit", DateOfAudit);
        cmd.Parameters.AddWithValue("@DateJobComplete", DateJobComplete);
        cmd.Parameters.AddWithValue("@SquareFootage", SquareFootage);
        cmd.Parameters.AddWithValue("@IfAuditNotCompleted", IfAuditNotCompleted);
        cmd.Parameters.AddWithValue("@IfAuditNotCompletedReason", IfAuditNotCompletedReason);

        cmd.Parameters.AddWithValue("@StateOrGasWeatherization", StateOrGasWeatherization);
        cmd.Parameters.AddWithValue("@StateOrGasWeatherizationComments", StateOrGasWeatherizationComments);
        cmd.Parameters.AddWithValue("@HomePhone", HomePhone);
        cmd.Parameters.AddWithValue("@CellPhone", CellPhone);

        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();

    }
    catch (Exception ex)
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

public DataTable GetPPLAudit_1(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLAuditPage1Ver2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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

public DataTable GetAuditorNameForPPLAudit_1ById(string id)
{
    DataTable dt = new DataTable();
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectAuditorsById";
        cmd.Parameters.AddWithValue("@id", id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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

public DataTable GetAuditorNameForPPLAudit_1()
{
    DataTable dt = new DataTable();
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "proc_AuditorAndCrewDDl";//SelectAuditors
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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


#region Audit PPL 2
public DataTable UpdatePPLAudit_2(string JobNumber, string HeatingSystemsLine1, string HeatingSystemsLine2, string ACSystemsLine1, string ACSystemsLine2, string DraftsLine1, string DraftsLine2, string ColdRoomsLine1, string ColdRoomsLine2, string MoistureProblemsLine1, string MoistureProblemsLine2, string SpecialNeedsLine1, string OtherNotesLine1, string OtherNotesLine2, string OtherIncreaseComments, string DifferentReason, string AdditionalMeasuresReason, string UsageIncreaseYes, string UsageIncreaseNo, string WrapMeasures, string CustomerUsage, string LivingSpace, string ElectricAppliances, string OtherIncrease, string BaseLoad, string LowCost, string FullCost, string JobCompleted, string AdditionalMeasures, string HouseholdOccupants, string AdditionalComment1, string AdditionalComment2, string AdditionalComment3, string AdditionalComment4)
{

    DataTable dt = new DataTable();
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAuditPage2Ver2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);

        cmd.Parameters.AddWithValue("@HeatingSystemsLine1", HeatingSystemsLine1);
        cmd.Parameters.AddWithValue("@HeatingSystemsLine2", HeatingSystemsLine2);

        cmd.Parameters.AddWithValue("@ACSystemsLine1", ACSystemsLine1);
        cmd.Parameters.AddWithValue("@ACSystemsLine2", ACSystemsLine2);

        cmd.Parameters.AddWithValue("DraftsLine1", DraftsLine1);
        cmd.Parameters.AddWithValue("@DraftsLine2", DraftsLine2);

        cmd.Parameters.AddWithValue("@ColdRoomsLine1", ColdRoomsLine1);
        cmd.Parameters.AddWithValue("@ColdRoomsLine2", ColdRoomsLine2);

        cmd.Parameters.AddWithValue("@MoistureProblemsLine1", MoistureProblemsLine1);
        cmd.Parameters.AddWithValue("@MoistureProblemsLine2", MoistureProblemsLine2);
        cmd.Parameters.AddWithValue("@SpecialNeedsLine1", SpecialNeedsLine1);

        cmd.Parameters.AddWithValue("@OtherNotesLine1", OtherNotesLine1);
        cmd.Parameters.AddWithValue("@OtherNotesLine2", OtherNotesLine2);

        cmd.Parameters.AddWithValue("@OtherIncreaseComments", OtherIncreaseComments);
        cmd.Parameters.AddWithValue("@DifferentReason", DifferentReason);

        cmd.Parameters.AddWithValue("@AdditionalMeasuresReason", AdditionalMeasuresReason);

        cmd.Parameters.AddWithValue("@UsageIncreaseYes", UsageIncreaseYes);
        cmd.Parameters.AddWithValue("@UsageIncreaseNo", UsageIncreaseNo);

        cmd.Parameters.AddWithValue("@WrapMeasures", WrapMeasures);
        cmd.Parameters.AddWithValue("@CustomerUsage", CustomerUsage);

        cmd.Parameters.AddWithValue("@LivingSpace", LivingSpace);
        cmd.Parameters.AddWithValue("@ElectricAppliances", ElectricAppliances);

        cmd.Parameters.AddWithValue("@OtherIncrease", OtherIncrease);
        cmd.Parameters.AddWithValue("@BaseLoad", BaseLoad);

        cmd.Parameters.AddWithValue("@LowCost", LowCost);
        cmd.Parameters.AddWithValue("@FullCost", FullCost);

        cmd.Parameters.AddWithValue("@JobCompleted", JobCompleted);
        cmd.Parameters.AddWithValue("@AdditionalMeasures", AdditionalMeasures);

        cmd.Parameters.AddWithValue("@HouseholdOccupants", HouseholdOccupants);

        cmd.Parameters.AddWithValue("@AdditionalComment1", AdditionalComment1);
        cmd.Parameters.AddWithValue("@AdditionalComment2", AdditionalComment2);
        cmd.Parameters.AddWithValue("@AdditionalComment3", AdditionalComment3);
        cmd.Parameters.AddWithValue("@AdditionalComment4", AdditionalComment4);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
    catch (Exception ex)
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
public DataTable GetPPLAudit_2(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLAuditPage2Ver2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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







#region Audit PPL 3
public int UpdatePPLAudit_3(string JobNumber, string RefrigeratorTested1, string DryerVentMeasures, string RefrigeratorTested2, string DryerVentMeauresDescribe, string FreezerTested, string HeatingFilter1Changed, string RefrigeratorCoilsCleaned, string ACFilterChanged, string HeatingFilter2Cleaned, string ACFilterCleaned, string ComfortMeasuresInstalledCommentsLine1, string ACSReplaced, string ComfortMeasuresInstalledCommentsLine2, string ACLocationComment, string OtherComments, string LivingRoomCFLS, string LivingRoomComments, string FamilyRoomCFLS, string FamilyRoomComments, string KitchenCFLS, string KitchenComments, string DiningRoomCFLS, string DiningRoomComments, string BedRoom1CFLS, string BedRoom1Comments, string BedRoom2CFLS, string BedRoom2Comments, string BedRoom3CFLS, string BedRoom3Comments, string Bath1CFLS, string Bath1Comments, string Bath2CFLS, string Bath2Comments, string HallwayCFLS, string HallwayComments, string OutDoorsCFLS, string OutdoorsComments, string CFLOtherCFLS, string CFLOtherComments, string SpareCFLS, string SpareComments, string TotalLightBulbCFLS, string TotalLightBulbComments, string KingWaterBed, string QueenWaterBed, string SuperSingleWaterBed, string PadsRequestedReason, string ElectricUsageCommentsLine1, string ElectricUsageCommentsLine2, string ElectricUsageCommentsLine3, string HeatingFilter1Cleaned, bool LivingRoomComments_CheckBox, bool FamilyRoomComments_CheckBox, bool KitchenComments_CheckBox, bool DiningRoomComments_CheckBox, bool BedRoom1Comments_CheckBox, bool BedRoom2Comments_CheckBox, bool BedRoom3Comments_checkBox, bool Bath1_CheckBox, bool Bath2_CheckBox, bool Hallway_CheckBox, bool OutDoors_CheckBox, bool Other_CheckBox, bool Spare_CheckBox, string LivingRoomCFLSWattage, string LivingRoomLightBulbBrand, string FamilyRoomCFLSWattage, string FamilyRoomLightBulbBrand, string KitchenCFLSWattage, string KitchenLightBulbBrand, string DiningRoomWattage, string DiningRoomLightBulbBrand, string BedRoom1CFLSWattage, string BedRoom1LightBulbBrand, string BedRoom2CFLSWattage, string BedRoom2LightBulbBrand, string BedRoom3CFLSWattage, string BedRoomLightBulbBrand, string Bath1CFLSWattage, string Bath1LightBulbBrand, string Bath2CFLSWattage, string Bath2LightBulbBrand, string HallwayCFLSWattage, string HallwayLightBulbBrand, string OutDoorsCFLSWattage, string OutDoorsLightBulbBrand, string CFLOtherCFLsWattage, string CFLOtherLightBulbBrand, string SpareCFLSWattage, string SpareLightBulbBrand, string LivingRoomComments_Supplier, string FamilyRoomComments_Supplier, string KitchenComments_Supplier, string DiningRoomComments_Supplier, string BedRoom1Comments_Supplier, string BedRoom2Comments_Supplier, string BedRoom3Comments_Supplier, string Bath1_Supplier, string Bath2_Supplier, string Hallway_Supplier, string OutDoors_Supplier, string Other_Supplier, string Spare_Supplier, string Reason)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAuditPage4Ver2_Change";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@RefrigeratorTested1", RefrigeratorTested1);
        cmd.Parameters.AddWithValue("@DryerVentMeasures", DryerVentMeasures);
        cmd.Parameters.AddWithValue("@RefrigeratorTested2", RefrigeratorTested2);
        cmd.Parameters.AddWithValue("@DryerVentMeauresDescribe", DryerVentMeauresDescribe);
        cmd.Parameters.AddWithValue("@FreezerTested", FreezerTested);
        cmd.Parameters.AddWithValue("@HeatingFilter1Changed", HeatingFilter1Changed);
        cmd.Parameters.AddWithValue("@RefrigeratorCoilsCleaned", RefrigeratorCoilsCleaned);
        cmd.Parameters.AddWithValue("@ACFilterChanged", ACFilterChanged);
        cmd.Parameters.AddWithValue("@HeatingFilter2Cleaned", HeatingFilter2Cleaned);
        cmd.Parameters.AddWithValue("@ACFilterCleaned", ACFilterCleaned);
        cmd.Parameters.AddWithValue("@ComfortMeasuresInstalledCommentsLine1", ComfortMeasuresInstalledCommentsLine1);
        cmd.Parameters.AddWithValue("@ACSReplaced", ACSReplaced);
        cmd.Parameters.AddWithValue("@ComfortMeasuresInstalledCommentsLine2", ComfortMeasuresInstalledCommentsLine2);
        cmd.Parameters.AddWithValue("@ACLocationComment", ACLocationComment);
        cmd.Parameters.AddWithValue("@OtherComments", OtherComments);
        cmd.Parameters.AddWithValue("@LivingRoomCFLS", LivingRoomCFLS);
        cmd.Parameters.AddWithValue("@LivingRoomComments", LivingRoomComments);
        cmd.Parameters.AddWithValue("@FamilyRoomCFLS", FamilyRoomCFLS);
        cmd.Parameters.AddWithValue("@FamilyRoomComments", FamilyRoomComments);
        cmd.Parameters.AddWithValue("@KitchenCFLS", KitchenCFLS);
        cmd.Parameters.AddWithValue("@KitchenComments", KitchenComments);
        cmd.Parameters.AddWithValue("@DiningRoomCFLS", DiningRoomCFLS);
        cmd.Parameters.AddWithValue("@DiningRoomComments", DiningRoomComments);
        cmd.Parameters.AddWithValue("@BedRoom1CFLS", BedRoom1CFLS);
        cmd.Parameters.AddWithValue("@BedRoom1Comments", BedRoom1Comments);
        cmd.Parameters.AddWithValue("@BedRoom2CFLS", BedRoom2CFLS);
        cmd.Parameters.AddWithValue("@BedRoom2Comments", BedRoom2Comments);
        cmd.Parameters.AddWithValue("@BedRoom3CFLS", BedRoom3CFLS);
        cmd.Parameters.AddWithValue("@BedRoom3Comments", BedRoom3Comments);
        cmd.Parameters.AddWithValue("@Bath1CFLS", Bath1CFLS);
        cmd.Parameters.AddWithValue("@Bath1Comments", Bath1Comments);
        cmd.Parameters.AddWithValue("@Bath2CFLS", Bath2CFLS);
        cmd.Parameters.AddWithValue("@Bath2Comments", Bath2Comments);
        cmd.Parameters.AddWithValue("@HallwayCFLS", HallwayCFLS);
        cmd.Parameters.AddWithValue("@HallwayComments", HallwayComments);
        cmd.Parameters.AddWithValue("@OutDoorsCFLS", OutDoorsCFLS);
        cmd.Parameters.AddWithValue("@OutdoorsComments", OutdoorsComments);
        cmd.Parameters.AddWithValue("@CFLOtherCFLS", CFLOtherCFLS);
        cmd.Parameters.AddWithValue("@CFLOtherComments", CFLOtherComments);
        cmd.Parameters.AddWithValue("@SpareCFLS", SpareCFLS);
        cmd.Parameters.AddWithValue("@SpareComments", SpareComments);
        cmd.Parameters.AddWithValue("@TotalLightBulbCFLS", TotalLightBulbCFLS);
        cmd.Parameters.AddWithValue("@TotalLightBulbComments", TotalLightBulbComments);
        cmd.Parameters.AddWithValue("@KingWaterBed", KingWaterBed);
        cmd.Parameters.AddWithValue("@QueenWaterBed", QueenWaterBed);
        cmd.Parameters.AddWithValue("@SuperSingleWaterBed", SuperSingleWaterBed);
        cmd.Parameters.AddWithValue("@PadsRequestedReason", PadsRequestedReason);
        cmd.Parameters.AddWithValue("@ElectricUsageCommentsLine1", ElectricUsageCommentsLine1);
        cmd.Parameters.AddWithValue("@ElectricUsageCommentsLine2", ElectricUsageCommentsLine2);
        cmd.Parameters.AddWithValue("@ElectricUsageCommentsLine3", ElectricUsageCommentsLine3);
        cmd.Parameters.AddWithValue("@HeatingFilter1Cleaned", HeatingFilter1Cleaned);
        cmd.Parameters.AddWithValue("@LivingRoomComments_CheckBox", LivingRoomComments_CheckBox);
        cmd.Parameters.AddWithValue("@FamilyRoomComments_CheckBox", FamilyRoomComments_CheckBox);
        cmd.Parameters.AddWithValue("@KitchenComments_CheckBox", KitchenComments_CheckBox);
        cmd.Parameters.AddWithValue("@DiningRoomComments_CheckBox", DiningRoomComments_CheckBox);
        cmd.Parameters.AddWithValue("@BedRoom1Comments_CheckBox", BedRoom1Comments_CheckBox);
        cmd.Parameters.AddWithValue("@BedRoom2Comments_CheckBox", BedRoom2Comments_CheckBox);
        cmd.Parameters.AddWithValue("@BedRoom3Comments_checkBox", BedRoom3Comments_checkBox);
        cmd.Parameters.AddWithValue("@Bath1_CheckBox", Bath1_CheckBox);
        cmd.Parameters.AddWithValue("@Bath2_CheckBox", Bath2_CheckBox);
        cmd.Parameters.AddWithValue("@Hallway_CheckBox", Hallway_CheckBox);
        cmd.Parameters.AddWithValue("@OutDoors_CheckBox", OutDoors_CheckBox);
        cmd.Parameters.AddWithValue("@Other_CheckBox", Other_CheckBox);
        cmd.Parameters.AddWithValue("@Spare_CheckBox", Spare_CheckBox);
        cmd.Parameters.AddWithValue("@LivingRoomCFLSWattage", LivingRoomCFLSWattage);
        cmd.Parameters.AddWithValue("@LivingRoomLightBulbBrand", LivingRoomLightBulbBrand);
        cmd.Parameters.AddWithValue("@FamilyRoomCFLSWattage", FamilyRoomCFLSWattage);
        cmd.Parameters.AddWithValue("@FamilyRoomLightBulbBrand", FamilyRoomLightBulbBrand);
        cmd.Parameters.AddWithValue("@KitchenCFLSWattage", KitchenCFLSWattage);
        cmd.Parameters.AddWithValue("@KitchenLightBulbBrand", KitchenLightBulbBrand);
        cmd.Parameters.AddWithValue("@DiningRoomWattage", DiningRoomWattage);
        cmd.Parameters.AddWithValue("@DiningRoomLightBulbBrand", DiningRoomLightBulbBrand);
        cmd.Parameters.AddWithValue("@BedRoom1CFLSWattage", BedRoom1CFLSWattage);
        cmd.Parameters.AddWithValue("@BedRoom1LightBulbBrand", BedRoom1LightBulbBrand);
        cmd.Parameters.AddWithValue("@BedRoom2CFLSWattage", BedRoom2CFLSWattage);
        cmd.Parameters.AddWithValue("@BedRoom2LightBulbBrand", BedRoom2LightBulbBrand);
        cmd.Parameters.AddWithValue("@BedRoom3CFLSWattage", BedRoom3CFLSWattage);
        cmd.Parameters.AddWithValue("@BedRoomLightBulbBrand", BedRoomLightBulbBrand);
        cmd.Parameters.AddWithValue("@Bath1CFLSWattage", Bath1CFLSWattage);
        cmd.Parameters.AddWithValue("@Bath1LightBulbBrand", Bath1LightBulbBrand);
        cmd.Parameters.AddWithValue("@Bath2CFLSWattage", Bath2CFLSWattage);
        cmd.Parameters.AddWithValue("@Bath2LightBulbBrand", Bath2LightBulbBrand);
        cmd.Parameters.AddWithValue("@HallwayCFLSWattage", HallwayCFLSWattage);
        cmd.Parameters.AddWithValue("@HallwayLightBulbBrand", HallwayLightBulbBrand);
        cmd.Parameters.AddWithValue("@OutDoorsCFLSWattage", OutDoorsCFLSWattage);
        cmd.Parameters.AddWithValue("@OutDoorsLightBulbBrand", OutDoorsLightBulbBrand);
        cmd.Parameters.AddWithValue("@CFLOtherCFLsWattage", CFLOtherCFLsWattage);
        cmd.Parameters.AddWithValue("@CFLOtherLightBulbBrand", CFLOtherLightBulbBrand);
        cmd.Parameters.AddWithValue("@SpareCFLSWattage", SpareCFLSWattage);
        cmd.Parameters.AddWithValue("@SpareLightBulbBrand", SpareLightBulbBrand);



        cmd.Parameters.AddWithValue("@LivingRoomComments_Supplier", LivingRoomComments_Supplier);
        cmd.Parameters.AddWithValue("@FamilyRoomComments_Supplier", FamilyRoomComments_Supplier);
        cmd.Parameters.AddWithValue("@KitchenComments_Supplier", KitchenComments_Supplier);
        cmd.Parameters.AddWithValue("@DiningRoomComments_Supplier", DiningRoomComments_Supplier);
        cmd.Parameters.AddWithValue("@BedRoom1Comments_Supplier", BedRoom1Comments_Supplier);
        cmd.Parameters.AddWithValue("@BedRoom2Comments_Supplier", BedRoom2Comments_Supplier);
        cmd.Parameters.AddWithValue("@BedRoom3Comments_Supplier", BedRoom3Comments_Supplier);
        cmd.Parameters.AddWithValue("@Bath1_Supplier", Bath1_Supplier);
        cmd.Parameters.AddWithValue("@Bath2_Supplier", Bath2_Supplier);
        cmd.Parameters.AddWithValue("@Hallway_Supplier", Hallway_Supplier);
        cmd.Parameters.AddWithValue("@OutDoors_Supplier", OutDoors_Supplier);
        cmd.Parameters.AddWithValue("@Other_Supplier", Other_Supplier);
        cmd.Parameters.AddWithValue("@Spare_Supplier", Spare_Supplier);
        cmd.Parameters.AddWithValue("@SelectReason", Reason);


        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();

    }
    catch (Exception ex)
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
public DataTable GetPPLAudit_3(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLAuditPage4Ver2_Change";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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



#region Audit PPL 4
public int UpdatePPLAudit_4(string JobNumber, string RefrigeratorTested, string NoReason, string PrimaryRefrigeratorHeight, string PrimaryRefrigeratorWidth, string PrimaryRefrigeratorDepth, string PrimaryRefrigeratorStartTime, string PrimaryRefrigeratorEndTime, string PrimaryRefrigeratorTotalTimeMonitored, string PrimaryRefrigeratorTemperature, string PrimaryRefrigeratorFreezerTemperature, string PrimaryRefrigeratorAmbientRoomTemperature, string PrimaryRefrigeratorPeakWattageWhileRunning, string PrimaryRefrigeratorTotalKWHMonitored, string PrimaryRefrigeratorKWH1Hour, string PrimaryRefrigeratorKWH24Hours, string PrimaryRefrigeratorKWHPerMonth, string PrimaryRefrigeratorDollarsPerMonth, string IsPrimaryRefrigeratorEligibleForReplacement, string SecondRefrigeratorOrFreezer, string SecondaryRefrigeratorOrFreezerHeight, string SecondaryRefrigeratorOrFreezerWidth, string SecondaryRefrigeratorOrFreezerDepth, string SecondaryRefrigeratorOrFreezerStartTime, string SecondaryRefrigeratorOrFreezerEndTime, string SecondaryRefrigeratorOrFreezerTotalTimeMonitored, string SecondaryRefrigeratorOrFreezerTemperature, string SecondaryRefrigeratorOrFreezerFreezerTemperature, string SecondaryRefrigeratorOrFreezerAmbientRoomTemperature, string SecondaryRefrigeratorOrFreezerPeakWattageWhileRunning, string SecondaryRefrigeratorOrFreezerTotalKWHMonitored, string SecondaryRefrigeratorOrFreezerKWH1Hour, string SecondaryRefrigeratorOrFreezerKWH24Hours, string SecondaryRefrigeratorOrFreezerKWHPerMonth, string SecondaryRefrigeratorOrFreezerDollarsPerMonth, string IsSecondaryRefrigeratorEligibleForReplacement, string SecondaryRefrigeratorAssesment, string RefrigeratorReason)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAuditPage4Ver2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@RefrigeratorTested", RefrigeratorTested);
        cmd.Parameters.AddWithValue("@NoReason", NoReason);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorHeight", PrimaryRefrigeratorHeight);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorWidth", PrimaryRefrigeratorWidth);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorDepth", PrimaryRefrigeratorDepth);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorStartTime", PrimaryRefrigeratorStartTime);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorEndTime", PrimaryRefrigeratorEndTime);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorTotalTimeMonitored", PrimaryRefrigeratorTotalTimeMonitored);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorTemperature", PrimaryRefrigeratorTemperature);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorFreezerTemperature", PrimaryRefrigeratorFreezerTemperature);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorAmbientRoomTemperature", PrimaryRefrigeratorAmbientRoomTemperature);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorPeakWattageWhileRunning", PrimaryRefrigeratorPeakWattageWhileRunning);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorTotalKWHMonitored", PrimaryRefrigeratorTotalKWHMonitored);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorKWH1Hour", PrimaryRefrigeratorKWH1Hour);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorKWH24Hours", PrimaryRefrigeratorKWH24Hours);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorKWHPerMonth", PrimaryRefrigeratorKWHPerMonth);
        cmd.Parameters.AddWithValue("@PrimaryRefrigeratorDollarsPerMonth", PrimaryRefrigeratorDollarsPerMonth);
        cmd.Parameters.AddWithValue("@IsPrimaryRefrigeratorEligibleForReplacement", IsPrimaryRefrigeratorEligibleForReplacement);
        cmd.Parameters.AddWithValue("@SecondRefrigeratorOrFreezer", SecondRefrigeratorOrFreezer);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerHeight", SecondaryRefrigeratorOrFreezerHeight);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerWidth", SecondaryRefrigeratorOrFreezerWidth);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerDepth", SecondaryRefrigeratorOrFreezerDepth);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerStartTime", SecondaryRefrigeratorOrFreezerStartTime);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerEndTime", SecondaryRefrigeratorOrFreezerEndTime);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerTotalTimeMonitored", SecondaryRefrigeratorOrFreezerTotalTimeMonitored);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerTemperature", SecondaryRefrigeratorOrFreezerTemperature);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerFreezerTemperature", SecondaryRefrigeratorOrFreezerFreezerTemperature);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerAmbientRoomTemperature", SecondaryRefrigeratorOrFreezerAmbientRoomTemperature);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerPeakWattageWhileRunning", SecondaryRefrigeratorOrFreezerPeakWattageWhileRunning);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerTotalKWHMonitored", SecondaryRefrigeratorOrFreezerTotalKWHMonitored);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerKWH1Hour", SecondaryRefrigeratorOrFreezerKWH1Hour);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerKWH24Hours", SecondaryRefrigeratorOrFreezerKWH24Hours);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerKWHPerMonth", SecondaryRefrigeratorOrFreezerKWHPerMonth);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorOrFreezerDollarsPerMonth", SecondaryRefrigeratorOrFreezerDollarsPerMonth);
        cmd.Parameters.AddWithValue("@IsSecondaryRefrigeratorEligibleForReplacement", IsSecondaryRefrigeratorEligibleForReplacement);
        cmd.Parameters.AddWithValue("@SecondaryRefrigeratorAssesment", SecondaryRefrigeratorAssesment);
        cmd.Parameters.AddWithValue("@RefrigeratorReason", RefrigeratorReason);


        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();

    }
    catch (Exception ex)
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
public DataTable GetPPLAudit_4(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLAuditPage4Ver2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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



#region Audit PPL 5

public int UpdatePPLAudit_5(string JobNumber, string WaterTankGallons, string WaterHeaterAge, string WaterHeaterCondition, string ExistingWaterTemperature, string ExpansionTank, string DishWasherWithoutHeater, string TwelveYearPayBackTwelveYearPayBack, string NoDirtFloor, string HPWHNearExistingDrain, string TenByTenBy74, string TenByTenBy84, string PlumbingElectricalShape, string ConsistentUsageHabits, string CleanFilter, string RecommendHPWH, string HPWHSize, string Comment, string WaterHeaterTypeForPPL5, string PermitRequire, string HeatPumpWaterHeaterComment, string ManufacturerDate, string AmpBreaker, string Wire102, string Gallons, string BrandIfKnown, string EFIfKnown, string RecommendHPWH_reason)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAuditPage5Ver2_Change";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@WaterTankGallons", WaterTankGallons);
        cmd.Parameters.AddWithValue("@WaterHeaterAge", WaterHeaterAge);
        cmd.Parameters.AddWithValue("@WaterHeaterCondition", WaterHeaterCondition);
        cmd.Parameters.AddWithValue("@ExistingWaterTemperature", ExistingWaterTemperature);
        cmd.Parameters.AddWithValue("@ExpansionTank", ExpansionTank);
        cmd.Parameters.AddWithValue("@DishWasherWithoutHeater", DishWasherWithoutHeater);
        cmd.Parameters.AddWithValue("@TwelveYearPayBackTwelveYearPayBack", TwelveYearPayBackTwelveYearPayBack);
        cmd.Parameters.AddWithValue("@NoDirtFloor", NoDirtFloor);
        cmd.Parameters.AddWithValue("@HPWHNearExistingDrain", HPWHNearExistingDrain);
        cmd.Parameters.AddWithValue("@TenByTenBy74", TenByTenBy74);
        cmd.Parameters.AddWithValue("@TenByTenBy84", TenByTenBy84);
        cmd.Parameters.AddWithValue("@PlumbingElectricalShape", PlumbingElectricalShape);
        cmd.Parameters.AddWithValue("@ConsistentUsageHabits", ConsistentUsageHabits);
        cmd.Parameters.AddWithValue("@CleanFilter", CleanFilter);
        cmd.Parameters.AddWithValue("@RecommendHPWH", RecommendHPWH);
        cmd.Parameters.AddWithValue("@HPWHSize", HPWHSize);
        cmd.Parameters.AddWithValue("@Comment", Comment);
        cmd.Parameters.AddWithValue("@WaterHeaterTypeForPPL5", WaterHeaterTypeForPPL5);
        cmd.Parameters.AddWithValue("@PermitRequire", PermitRequire);
        cmd.Parameters.AddWithValue("@HeatPumpWaterHeaterComment", HeatPumpWaterHeaterComment);
        cmd.Parameters.AddWithValue("@ManufacturerDate", ManufacturerDate);
        cmd.Parameters.AddWithValue("@AmpBreaker", AmpBreaker);
        cmd.Parameters.AddWithValue("@Wire102", Wire102);
        cmd.Parameters.AddWithValue("@Gallons", Gallons);
        cmd.Parameters.AddWithValue("@BrandIfKnown", BrandIfKnown);
        cmd.Parameters.AddWithValue("@EFIfKnown", EFIfKnown);
        cmd.Parameters.AddWithValue("@RecommendHPWH_reason", RecommendHPWH_reason);
        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();

    }
    catch (Exception ex)
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

public DataTable GetPPLAudit_5(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLAuditPage5Ver2_Change";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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


#region Audit PPL 6
public void UpdatePPLAudit_6(string JobNumber, string CityWellWaterSupply, string ExpansionTank, string DoesHeaterHaveCheckValve, string SupplyCopperPVC, string ThirtyAmpBreaker, string Brand, string TenTwoWire, string RecommendWaterHeaterReplacement, string ReplacementSize, string Temperature, string ReasonForNotRecommending, string ShowerUse, string IsThereABasement, string DrainStackServicing, string VerticalHeight, string DrainPipeDiameter, string RecommendGFX, string WaterHeaterRepair, string WaterHeaterRepairComments, string RepairWaterLeaks, string RepairWaterLeaksComments, string LowFlowShowerHeads, string LowFlowShowerHeadsComments, string Aerators, string AeratorsComments, string WaterPipeInsulation, string WaterPipeInsulationSizeComments, string WaterPipeInsulationFeetComments, string SolarWater, string SolarWaterComments, string FullCostMeasures, string BaseloadMeasures, string ChkReasonForNotRecommending, string FaucetRepair, string FaucetRepairLocation)
{


    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAuditPage6Ver2";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@CityWellWaterSupply", CityWellWaterSupply);


        cmd.Parameters.AddWithValue("@ExpansionTank ", ExpansionTank);
        cmd.Parameters.AddWithValue("@DoesHeaterHaveCheckValve", DoesHeaterHaveCheckValve);

        cmd.Parameters.AddWithValue("@SupplyCopperPVC", SupplyCopperPVC);
        cmd.Parameters.AddWithValue("@ThirtyAmpBreaker", ThirtyAmpBreaker);

        cmd.Parameters.AddWithValue("@Brand", Brand);
        cmd.Parameters.AddWithValue("@TenTwoWire", TenTwoWire);

        cmd.Parameters.AddWithValue("@RecommendWaterHeaterReplacement", RecommendWaterHeaterReplacement);
        cmd.Parameters.AddWithValue("@ReplacementSize", ReplacementSize);

        cmd.Parameters.AddWithValue("@Temperature", Temperature);
        cmd.Parameters.AddWithValue("@ReasonForNotRecommending", ReasonForNotRecommending);

        cmd.Parameters.AddWithValue("@ShowerUse", ShowerUse);
        cmd.Parameters.AddWithValue("@IsThereABasement", IsThereABasement);

        cmd.Parameters.AddWithValue("@DrainStackServicing", DrainStackServicing);
        cmd.Parameters.AddWithValue("@VerticalHeight", VerticalHeight);

        cmd.Parameters.AddWithValue("@DrainPipeDiameter", DrainPipeDiameter);
        cmd.Parameters.AddWithValue("@RecommendGFX", RecommendGFX);

        cmd.Parameters.AddWithValue("@WaterHeaterRepair", WaterHeaterRepair);
        cmd.Parameters.AddWithValue("@WaterHeaterRepairComments", WaterHeaterRepairComments);

        cmd.Parameters.AddWithValue("@RepairWaterLeaks", RepairWaterLeaks);
        cmd.Parameters.AddWithValue("@RepairWaterLeaksComments", RepairWaterLeaksComments);

        cmd.Parameters.AddWithValue("@LowFlowShowerHeads", LowFlowShowerHeads);
        cmd.Parameters.AddWithValue("@LowFlowShowerHeadsComments", LowFlowShowerHeadsComments);

        cmd.Parameters.AddWithValue("@Aerators", Aerators);
        cmd.Parameters.AddWithValue("@AeratorsComments", AeratorsComments);

        cmd.Parameters.AddWithValue("@WaterPipeInsulation", WaterPipeInsulation);
        cmd.Parameters.AddWithValue("@WaterPipeInsulationSizeComments ", WaterPipeInsulationSizeComments);

        cmd.Parameters.AddWithValue("@WaterPipeInsulationFeetComments", WaterPipeInsulationFeetComments);
        cmd.Parameters.AddWithValue("@SolarWater", SolarWater);

        cmd.Parameters.AddWithValue("@SolarWaterComments", SolarWaterComments);
        cmd.Parameters.AddWithValue("@FullCostMeasures", FullCostMeasures);

        cmd.Parameters.AddWithValue("@BaseloadMeasures", BaseloadMeasures);



        cmd.Parameters.AddWithValue("@ChkReasonForNotRecommending", ChkReasonForNotRecommending);
        cmd.Parameters.AddWithValue("@FaucetRepair", FaucetRepair);
        cmd.Parameters.AddWithValue("@FaucetRepairLocation", FaucetRepairLocation);


        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
    catch (Exception ex)
    {


    }
    finally
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }


}
public DataTable GetPPLAudit_6(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLAuditPage6Ver2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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


#region Audit PPL 7
public void UpdatePPLAudit_7(string JobNumber, string HealthAndSafetyCombustionCheckbox, string HealthAndSafetyCombustionComments, string BlowerDoorDepressurizationCheckbox, string BlowerDoorDepressurizationComments, string BlowerDoorPressurizationCheckbox, string BlowerDoorPressurizationComments, string ZonalPressureDiagnosticsCheckbox, string ZonalPressureDiagnosticsComments, string DuctworkTestCheckbox, string DuctworkTestComments, string FinalCombustionTestCheckbox, string FinalCombustionTestComments, string HealthAndSafetyCheckbox, string HealthAndSafetyComments, string MajorRepairsCheckbox, string MajorRepairsComments, string ElectricHeatRepairsCheckbox, string ElectricHeatRepairsComments, string AtticInsulationCheckbox, string AtticInsulationComments, string SealAtticBypassesCheckbox, string SealAtticBypassesComments, string WallInsulationCheckbox, string WallInsulationComments, string FloorInsulationCheckbox, string FloorInsulationComments, string WindowAndDoorMeasuresCheckbox, string WindowAndDoorMeasuresComments, string HeatingMeasuresCheckbox, string HeatingMeasuresComments, string CoolingMeasuresCheckbox, string CoolingMeasuresComments, string OtherMeasuresCheckbox, string OtherMeasuresComments)
{
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAuditPage7Ver2";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@HealthAndSafetyCombustionCheckbox", HealthAndSafetyCombustionCheckbox);
        cmd.Parameters.AddWithValue("@HealthAndSafetyCombustionComments", HealthAndSafetyCombustionComments);

        cmd.Parameters.AddWithValue("@BlowerDoorDepressurizationCheckbox", BlowerDoorDepressurizationCheckbox);
        cmd.Parameters.AddWithValue("@BlowerDoorDepressurizationComments", BlowerDoorDepressurizationComments);


        cmd.Parameters.AddWithValue("@BlowerDoorPressurizationCheckbox", BlowerDoorPressurizationCheckbox);
        cmd.Parameters.AddWithValue("@BlowerDoorPressurizationComments", BlowerDoorPressurizationComments);


        cmd.Parameters.AddWithValue("@ZonalPressureDiagnosticsCheckbox", ZonalPressureDiagnosticsCheckbox);
        cmd.Parameters.AddWithValue("@ZonalPressureDiagnosticsComments", ZonalPressureDiagnosticsComments);


        cmd.Parameters.AddWithValue("@DuctworkTestCheckbox", DuctworkTestCheckbox);
        cmd.Parameters.AddWithValue("@DuctworkTestComments", DuctworkTestComments);


        cmd.Parameters.AddWithValue("@FinalCombustionTestCheckbox", FinalCombustionTestCheckbox);
        cmd.Parameters.AddWithValue("@FinalCombustionTestComments", FinalCombustionTestComments);


        cmd.Parameters.AddWithValue("@HealthAndSafetyCheckbox", HealthAndSafetyCheckbox);
        cmd.Parameters.AddWithValue("@HealthAndSafetyComments", HealthAndSafetyComments);


        cmd.Parameters.AddWithValue("@MajorRepairsCheckbox", MajorRepairsCheckbox);
        cmd.Parameters.AddWithValue("@MajorRepairsComments", MajorRepairsComments);


        cmd.Parameters.AddWithValue("@ElectricHeatRepairsCheckbox", ElectricHeatRepairsCheckbox);
        cmd.Parameters.AddWithValue("@ElectricHeatRepairsComments", ElectricHeatRepairsComments);


        cmd.Parameters.AddWithValue("@AtticInsulationCheckbox", AtticInsulationCheckbox);
        cmd.Parameters.AddWithValue("@AtticInsulationComments", AtticInsulationComments);


        cmd.Parameters.AddWithValue("@SealAtticBypassesCheckbox", SealAtticBypassesCheckbox);
        cmd.Parameters.AddWithValue("@SealAtticBypassesComments", SealAtticBypassesComments);


        cmd.Parameters.AddWithValue("@WallInsulationCheckbox", WallInsulationCheckbox);
        cmd.Parameters.AddWithValue("@WallInsulationComments", WallInsulationComments);


        cmd.Parameters.AddWithValue("@FloorInsulationCheckbox", FloorInsulationCheckbox);
        cmd.Parameters.AddWithValue("@FloorInsulationComments", FloorInsulationComments);


        cmd.Parameters.AddWithValue("@WindowAndDoorMeasuresCheckbox", WindowAndDoorMeasuresCheckbox);
        cmd.Parameters.AddWithValue("@WindowAndDoorMeasuresComments", WindowAndDoorMeasuresComments);


        cmd.Parameters.AddWithValue("@HeatingMeasuresCheckbox", HeatingMeasuresCheckbox);
        cmd.Parameters.AddWithValue("@HeatingMeasuresComments", HeatingMeasuresComments);


        cmd.Parameters.AddWithValue("@CoolingMeasuresCheckbox", CoolingMeasuresCheckbox);
        cmd.Parameters.AddWithValue("@CoolingMeasuresComments", CoolingMeasuresComments);


        cmd.Parameters.AddWithValue("@OtherMeasuresCheckbox", OtherMeasuresCheckbox);
        cmd.Parameters.AddWithValue("@OtherMeasuresComments", OtherMeasuresComments);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
    catch (Exception ex)
    {


    }
    finally
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }


}
public DataTable GetPPLAudit_7(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLAuditPage7Ver2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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


#region Audit PPL 8
public void UpdatePPLAudit_8(string JobNumber, string TargetMVG, string Temperature, string PreweatherizationreadingBDO, string IndoorTemperature, string PreweatherizationreadingBDClosed, string OutdoorTemperature, string Postweatherizationreading, string PostweatherizationreadingOpenOrClosedCheckbox, string TotalReduction, string BasementHouseZonePretreat, string BasementHouseZoneFinal, string BasementZoneOutsidePretreat, string BasementZoneOutsideFinal, string VentedCrawlSpaceHouseZonePretreat, string VentedCrawlSpaceHouseZoneFinal, string VentedCrawlSpaceZoneOutsidePretreat, string VentedCrawlSpaceZoneOutsideFinal, string AtticAHouseZonePretreat, string AtticAHouseZoneFinal, string AtticAZoneOutsidePretreat, string AtticAZoneOutsideFinal, string AtticBHouseZonePretreat, string AtticBHouseZoneFinal, string AtticBZoneOutsidePretreat, string AtticBZoneOutsideFinal, string KneewallAHouseZonePretreat, string KneewallAHouseZoneFinal, string KneewallAZoneOutsidePretreat, string KneewallAZoneOutsideFinal, string KneewallBHouseZonePretreat, string KneewallBHouseZoneFinal, string KneewallBZoneOutsidePretreat, string KneewallBZoneOutsideFinal, string GarageHouseZonePretreat, string GarageHouseZoneFinal, string GarageZoneOutsidePretreat, string GarageZoneOutsideFinal, string GarageAtticHouseZonePretreat, string GarageAtticHouseZoneFinal, string GarageAtticZoneOutsidePretreat, string GarageAtticZoneOutsideFinal, string CantileverOverhang1HouseZonePretreat, string CantileverOverhang1HouseZoneFinal, string CantileverOverhang1ZoneOutsidePretreat, string CantileverOverhang1ZoneOutsideFinal, string CantileverOverhang2HouseZonePretreat, string CantileverOverhang2HouseZoneFinal, string CantileverOverhang2ZoneOutsidePretreat, string CantileverOverhang2ZoneOutsideFinal, string Other1HouseZonePretreat, string Other1HouseZoneFinal, string Other1ZoneOutsidePretreat, string Other1ZoneOutsideFinal, string Other2HouseZonePretreat, string Other2HouseZoneFinal, string Other2ZoneOutsidePretreat, string Other2ZoneOutsideFinal, string Other3HouseZonePretreat, string Other3HouseZoneFinal, string Other3ZoneOutsidePretreat, string Other3ZoneOutsideFinal, string Other1Name, string Other2Name, string Other3Name, string BasementBlowerDoorPretreat, string BasementBlowerDoorFinal, string CrawlspaceBlowerDoorPretreat, string CrawlspaceBlowerDoorFinal, string AtticABlowerDoorPretreat, string AtticABlowerDoorFinal, string AtticBBlowerDoorPretreat, string AtticBBlowerDoorFinal, string KneeWallABlowerDoorPretreat, string KneeWallABlowerDoorFinal, string KneeWallBBlowerDoorPretreat, string KneeWallBBlowerDoorFinal, string GarageBlowerDoorPretreat, string GarageBlowerDoorFinal, string GarageAtticBlowerDoorPretreat, string GarageAtticBlowerDoorFinal, string Cantilever1BlowerDoorPretreat, string Cantilever1BlowerDoorFinal, string Cantilever2BlowerDoorPretreat, string Cantilever2BlowerDoorFinal, string Other1BlowerDoorPretreat, string Other1BlowerDoorFinal, string Other2BlowerDoorPretreat, string Other2BlowerDoorFinal, string Other3BlowerDoorPretreat, string Other3BlowerDoorFinal)
{
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAuditPage8Ver2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@TargetMVG", TargetMVG);
        cmd.Parameters.AddWithValue("@Temperature", Temperature);
        cmd.Parameters.AddWithValue("@PreweatherizationreadingBDO", PreweatherizationreadingBDO);
        cmd.Parameters.AddWithValue("@IndoorTemperature", IndoorTemperature);
        cmd.Parameters.AddWithValue("@PreweatherizationreadingBDClosed", PreweatherizationreadingBDClosed);
        cmd.Parameters.AddWithValue("@OutdoorTemperature", OutdoorTemperature);
        cmd.Parameters.AddWithValue("@Postweatherizationreading", Postweatherizationreading);
        cmd.Parameters.AddWithValue("@PostweatherizationreadingOpenOrClosedCheckbox", PostweatherizationreadingOpenOrClosedCheckbox);
        cmd.Parameters.AddWithValue("@TotalReduction", TotalReduction);
        cmd.Parameters.AddWithValue("@BasementHouseZonePretreat", BasementHouseZonePretreat);
        cmd.Parameters.AddWithValue("@BasementHouseZoneFinal", BasementHouseZoneFinal);
        cmd.Parameters.AddWithValue("@BasementZoneOutsidePretreat", BasementZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@BasementZoneOutsideFinal", BasementZoneOutsideFinal);
        cmd.Parameters.AddWithValue("@VentedCrawlSpaceHouseZonePretreat", VentedCrawlSpaceHouseZonePretreat);


        cmd.Parameters.AddWithValue("@VentedCrawlSpaceHouseZoneFinal", VentedCrawlSpaceHouseZoneFinal);
        cmd.Parameters.AddWithValue("@VentedCrawlSpaceZoneOutsidePretreat", VentedCrawlSpaceZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@VentedCrawlSpaceZoneOutsideFinal", VentedCrawlSpaceZoneOutsideFinal);
        cmd.Parameters.AddWithValue("@AtticAHouseZonePretreat", AtticAHouseZonePretreat);
        cmd.Parameters.AddWithValue("@AtticAHouseZoneFinal", AtticAHouseZoneFinal);


        cmd.Parameters.AddWithValue("@AtticAZoneOutsidePretreat", AtticAZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@AtticAZoneOutsideFinal", AtticAZoneOutsideFinal);
        cmd.Parameters.AddWithValue("@AtticBHouseZonePretreat", AtticBHouseZonePretreat);
        cmd.Parameters.AddWithValue("@AtticBHouseZoneFinal", AtticBHouseZoneFinal);
        cmd.Parameters.AddWithValue("@AtticBZoneOutsidePretreat", AtticBZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@AtticBZoneOutsideFinal", AtticBZoneOutsideFinal);
        cmd.Parameters.AddWithValue("@KneewallAHouseZonePretreat", KneewallAHouseZonePretreat);
        cmd.Parameters.AddWithValue("@KneewallAHouseZoneFinal", KneewallAHouseZoneFinal);




        cmd.Parameters.AddWithValue("@KneewallAZoneOutsidePretreat", KneewallAZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@KneewallAZoneOutsideFinal", KneewallAZoneOutsideFinal);
        cmd.Parameters.AddWithValue("@KneewallBHouseZonePretreat", KneewallBHouseZonePretreat);
        cmd.Parameters.AddWithValue("@KneewallBHouseZoneFinal", KneewallBHouseZoneFinal);
        cmd.Parameters.AddWithValue("@KneewallBZoneOutsidePretreat", KneewallBZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@KneewallBZoneOutsideFinal", KneewallBZoneOutsideFinal);
        cmd.Parameters.AddWithValue("@GarageHouseZonePretreat", GarageHouseZonePretreat);
        cmd.Parameters.AddWithValue("@GarageHouseZoneFinal", GarageHouseZoneFinal);
        cmd.Parameters.AddWithValue("@GarageZoneOutsidePretreat", GarageZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@GarageZoneOutsideFinal", GarageZoneOutsideFinal);




        cmd.Parameters.AddWithValue("@GarageAtticHouseZonePretreat", GarageAtticHouseZonePretreat);
        cmd.Parameters.AddWithValue("@GarageAtticHouseZoneFinal", GarageAtticHouseZoneFinal);
        cmd.Parameters.AddWithValue("@GarageAtticZoneOutsidePretreat", GarageAtticZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@GarageAtticZoneOutsideFinal", GarageAtticZoneOutsideFinal);
        cmd.Parameters.AddWithValue("@CantileverOverhang1HouseZonePretreat", CantileverOverhang1HouseZonePretreat);
        cmd.Parameters.AddWithValue("@CantileverOverhang1HouseZoneFinal", CantileverOverhang1HouseZoneFinal);
        cmd.Parameters.AddWithValue("@CantileverOverhang1ZoneOutsidePretreat", CantileverOverhang1ZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@CantileverOverhang1ZoneOutsideFinal", CantileverOverhang1ZoneOutsideFinal);



        cmd.Parameters.AddWithValue("@CantileverOverhang2HouseZonePretreat", CantileverOverhang2HouseZonePretreat);
        cmd.Parameters.AddWithValue("@CantileverOverhang2HouseZoneFinal", CantileverOverhang2HouseZoneFinal);
        cmd.Parameters.AddWithValue("@CantileverOverhang2ZoneOutsidePretreat", CantileverOverhang2ZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@CantileverOverhang2ZoneOutsideFinal", CantileverOverhang2ZoneOutsideFinal);
        cmd.Parameters.AddWithValue("@Other1HouseZonePretreat", Other1HouseZonePretreat);
        cmd.Parameters.AddWithValue("@Other1HouseZoneFinal", Other1HouseZoneFinal);
        cmd.Parameters.AddWithValue("@Other1ZoneOutsidePretreat", Other1ZoneOutsidePretreat);



        cmd.Parameters.AddWithValue("@Other1ZoneOutsideFinal", Other1ZoneOutsideFinal);
        cmd.Parameters.AddWithValue("@Other2HouseZonePretreat", Other2HouseZonePretreat);
        cmd.Parameters.AddWithValue("@Other2HouseZoneFinal", Other2HouseZoneFinal);
        cmd.Parameters.AddWithValue("@Other2ZoneOutsidePretreat", Other2ZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@Other2ZoneOutsideFinal", Other2ZoneOutsideFinal);
        cmd.Parameters.AddWithValue("@Other3HouseZonePretreat", Other3HouseZonePretreat);



        cmd.Parameters.AddWithValue("@Other3HouseZoneFinal", Other3HouseZoneFinal);
        cmd.Parameters.AddWithValue("@Other3ZoneOutsidePretreat", Other3ZoneOutsidePretreat);
        cmd.Parameters.AddWithValue("@Other3ZoneOutsideFinal", Other3ZoneOutsideFinal);
        cmd.Parameters.AddWithValue("@Other1Name", Other1Name);
        cmd.Parameters.AddWithValue("@Other2Name", Other2Name);
        cmd.Parameters.AddWithValue("@Other3Name", Other3Name);
        cmd.Parameters.AddWithValue("@BasementBlowerDoorPretreat", BasementBlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@BasementBlowerDoorFinal", BasementBlowerDoorFinal);
        cmd.Parameters.AddWithValue("@CrawlspaceBlowerDoorPretreat", CrawlspaceBlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@CrawlspaceBlowerDoorFinal", CrawlspaceBlowerDoorFinal);



        cmd.Parameters.AddWithValue("@AtticABlowerDoorPretreat", AtticABlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@AtticABlowerDoorFinal", AtticABlowerDoorFinal);
        cmd.Parameters.AddWithValue("@AtticBBlowerDoorPretreat", AtticBBlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@AtticBBlowerDoorFinal", AtticBBlowerDoorFinal);
        cmd.Parameters.AddWithValue("@KneeWallABlowerDoorPretreat", KneeWallABlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@KneeWallABlowerDoorFinal", KneeWallABlowerDoorFinal);
        cmd.Parameters.AddWithValue("@KneeWallBBlowerDoorPretreat", KneeWallBBlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@KneeWallBBlowerDoorFinal", KneeWallBBlowerDoorFinal);
        cmd.Parameters.AddWithValue("@GarageBlowerDoorPretreat", GarageBlowerDoorPretreat);



        cmd.Parameters.AddWithValue("@GarageBlowerDoorFinal", GarageBlowerDoorFinal);
        cmd.Parameters.AddWithValue("@GarageAtticBlowerDoorPretreat", GarageAtticBlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@GarageAtticBlowerDoorFinal", GarageAtticBlowerDoorFinal);
        cmd.Parameters.AddWithValue("@Cantilever1BlowerDoorPretreat", Cantilever1BlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@Cantilever1BlowerDoorFinal", Cantilever1BlowerDoorFinal);
        cmd.Parameters.AddWithValue("@Cantilever2BlowerDoorPretreat", Cantilever2BlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@Cantilever2BlowerDoorFinal", Cantilever2BlowerDoorFinal);
        cmd.Parameters.AddWithValue("@Other1BlowerDoorPretreat", Other1BlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@Other1BlowerDoorFinal", Other1BlowerDoorFinal);



        cmd.Parameters.AddWithValue("@Other2BlowerDoorPretreat", Other2BlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@Other2BlowerDoorFinal", Other2BlowerDoorFinal);
        cmd.Parameters.AddWithValue("@Other3BlowerDoorPretreat", Other3BlowerDoorPretreat);
        cmd.Parameters.AddWithValue("@Other3BlowerDoorFinal", Other3BlowerDoorFinal);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    catch (Exception ex)
    {

    }
    finally
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }
}

public DataTable GetPPLAudit_8(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLAuditPage8Ver2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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


#region Audit PPL 9 Pre

public int UpdatePPLAudit_9(string JobNumber, string AnyCombustionAppliancesInHomeCheckbox, string CombustibleEquipmentSafetyTestingDoneCheckbox, string OutDoorTemperature, string WaterHeaterAMB, string WaterHeaterCAZ, string WaterHeaterBackDraftWC, string WaterHeaterBackDraftNAT, string WaterHeaterDraftEstablishedWC, string WaterHeaterDraftEstablishedNAT, string WaterHeaterPressureWC, string WaterHeaterPressureNAT, string WaterHeaterDraftPassedWC, string WaterHeaterDraftPassedNAT, string WaterHeaterUndilCOFlue, string WaterHeaterGasLeakDetected, string WaterHeaterPercentEfficiency, string FurnaceBoilerAMB, string FurnaceBoilerCAZ, string FurnaceBoilerBackDraftWC, string FurnaceBoilerBackDraftNAT, string FurnaceBoilerDraftEstablishedWC, string FurnaceBoilerDraftEstablishedNAT, string FurnaceBoilerPressureWC, string FurnaceBoilerPressureNAT, string FurnaceBoilerDraftPassedWC, string FurnaceBoilerDraftPassedNAT, string FurnaceBoilerUndilCOFlue, string FurnaceBoilerGasLeakDetected, string FurnaceBoilerPercentEfficiency, string Other1AMB, string Other1CAZ, string Other1BackDraftWC, string Other1BackDraftNAT, string Other1DraftEstablishedWC, string Other1DraftEstablishedNAT, string Other1PressureWC, string Other1PressureNAT, string Other1DraftPassedWC, string Other1DraftPassedNAT, string Other1UndilCOFlue, string Other1GasLeakDetected, string Other1PercentEfficiency, string Other2AMB, string Other2CAZ, string Other2BackDraftWC, string Other2BackDraftNAT, string Other2DraftEstablishedWC, string Other2DraftEstablishedNAT, string Other2PressureWC, string Other2PressureNAT, string Other2DraftPassedWC, string Other2DraftPassedNAT, string Other2UndilCOFlue, string Other2GasLeakDetected, string Other2PercentEfficiency, string BackBurnerLeftCO, string BackBurnerLeftRadio, string BackBurnerRightRadio, string BackBurnerRightCO, string FrontBurnerLeftCO, string FrontBurnerLeftRadio, string FrontBurnerRightRadio, string FrontBurnerRightCO, string DryerWorstCaseCheckBox, string WholeHouseFanWorstCaseCheckBox, string BathFanWorstCaseCheckBox, string KitchenFanWorstCaseCheckBox, string COAmbient, string COAtOvenVent, string HVACAirHandlerWorstCaseCheckBox, string COAlarmsInTheseLocations, string EmergencySituationCheckBox, string WorkCannotContinueCheckBox, string NATVAL, string WCVAL, string DIFFVAL, string PASSVAL)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAuditPage9PreVer2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@AnyCombustionAppliancesInHomeCheckbox", AnyCombustionAppliancesInHomeCheckbox);
        cmd.Parameters.AddWithValue("@CombustibleEquipmentSafetyTestingDoneCheckbox", CombustibleEquipmentSafetyTestingDoneCheckbox);
        cmd.Parameters.AddWithValue("@OutDoorTemperature", OutDoorTemperature);
        cmd.Parameters.AddWithValue("@WaterHeaterAMB", WaterHeaterAMB);
        cmd.Parameters.AddWithValue("@WaterHeaterCAZ", WaterHeaterCAZ);
        cmd.Parameters.AddWithValue("@WaterHeaterBackDraftWC", WaterHeaterBackDraftWC);
        cmd.Parameters.AddWithValue("@WaterHeaterBackDraftNAT", WaterHeaterBackDraftNAT);
        cmd.Parameters.AddWithValue("@WaterHeaterDraftEstablishedWC", WaterHeaterDraftEstablishedWC);
        cmd.Parameters.AddWithValue("@WaterHeaterDraftEstablishedNAT", WaterHeaterDraftEstablishedNAT);
        cmd.Parameters.AddWithValue("@WaterHeaterPressureWC", WaterHeaterPressureWC);
        cmd.Parameters.AddWithValue("@WaterHeaterPressureNAT", WaterHeaterPressureNAT);
        cmd.Parameters.AddWithValue("@WaterHeaterDraftPassedWC", WaterHeaterDraftPassedWC);
        cmd.Parameters.AddWithValue("@WaterHeaterDraftPassedNAT", WaterHeaterDraftPassedNAT);
        cmd.Parameters.AddWithValue("@WaterHeaterUndilCOFlue", WaterHeaterUndilCOFlue);
        cmd.Parameters.AddWithValue("@WaterHeaterGasLeakDetected", WaterHeaterGasLeakDetected);
        cmd.Parameters.AddWithValue("@WaterHeaterPercentEfficiency", WaterHeaterPercentEfficiency);
        cmd.Parameters.AddWithValue("@FurnaceBoilerAMB", FurnaceBoilerAMB);
        cmd.Parameters.AddWithValue("@FurnaceBoilerCAZ", FurnaceBoilerCAZ);
        cmd.Parameters.AddWithValue("@FurnaceBoilerBackDraftWC", FurnaceBoilerBackDraftWC);
        cmd.Parameters.AddWithValue("@FurnaceBoilerBackDraftNAT", FurnaceBoilerBackDraftNAT);
        cmd.Parameters.AddWithValue("@FurnaceBoilerDraftEstablishedWC", FurnaceBoilerDraftEstablishedWC);
        cmd.Parameters.AddWithValue("@FurnaceBoilerDraftEstablishedNAT", FurnaceBoilerDraftEstablishedNAT);
        cmd.Parameters.AddWithValue("@FurnaceBoilerPressureWC", FurnaceBoilerPressureWC);
        cmd.Parameters.AddWithValue("@FurnaceBoilerPressureNAT", FurnaceBoilerPressureNAT);
        cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassedWC", FurnaceBoilerDraftPassedWC);
        cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassedNAT", FurnaceBoilerDraftPassedNAT);
        cmd.Parameters.AddWithValue("@FurnaceBoilerUndilCOFlue", FurnaceBoilerUndilCOFlue);
        cmd.Parameters.AddWithValue("@FurnaceBoilerGasLeakDetected", FurnaceBoilerGasLeakDetected);
        cmd.Parameters.AddWithValue("@FurnaceBoilerPercentEfficiency", FurnaceBoilerPercentEfficiency);
        cmd.Parameters.AddWithValue("@Other1AMB", Other1AMB);
        cmd.Parameters.AddWithValue("@Other1CAZ", Other1CAZ);
        cmd.Parameters.AddWithValue("@Other1BackDraftWC", Other1BackDraftWC);
        cmd.Parameters.AddWithValue("@Other1BackDraftNAT", Other1BackDraftNAT);
        cmd.Parameters.AddWithValue("@Other1DraftEstablishedWC", Other1DraftEstablishedWC);
        cmd.Parameters.AddWithValue("@Other1DraftEstablishedNAT", Other1DraftEstablishedNAT);
        cmd.Parameters.AddWithValue("@Other1PressureWC", Other1PressureWC);
        cmd.Parameters.AddWithValue("@Other1PressureNAT", Other1PressureNAT);
        cmd.Parameters.AddWithValue("@Other1DraftPassedWC", Other1DraftPassedWC);
        cmd.Parameters.AddWithValue("@Other1DraftPassedNAT", Other1DraftPassedNAT);
        cmd.Parameters.AddWithValue("@Other1UndilCOFlue", Other1UndilCOFlue);
        cmd.Parameters.AddWithValue("@Other1GasLeakDetected", Other1GasLeakDetected);
        cmd.Parameters.AddWithValue("@Other1PercentEfficiency", Other1PercentEfficiency);
        cmd.Parameters.AddWithValue("@Other2AMB", Other2AMB);
        cmd.Parameters.AddWithValue("@Other2CAZ", Other2CAZ);
        cmd.Parameters.AddWithValue("@Other2BackDraftWC", Other2BackDraftWC);
        cmd.Parameters.AddWithValue("@Other2BackDraftNAT", Other2BackDraftNAT);
        cmd.Parameters.AddWithValue("@Other2DraftEstablishedWC", Other2DraftEstablishedWC);
        cmd.Parameters.AddWithValue("@Other2DraftEstablishedNAT", Other2DraftEstablishedNAT);
        cmd.Parameters.AddWithValue("@Other2PressureWC", Other2PressureWC);
        cmd.Parameters.AddWithValue("@Other2PressureNAT", Other2PressureNAT);
        cmd.Parameters.AddWithValue("@Other2DraftPassedWC", Other2DraftPassedWC);
        cmd.Parameters.AddWithValue("@Other2DraftPassedNAT", Other2DraftPassedNAT);
        cmd.Parameters.AddWithValue("@Other2UndilCOFlue", Other2UndilCOFlue);
        cmd.Parameters.AddWithValue("@Other2GasLeakDetected", Other2GasLeakDetected);
        cmd.Parameters.AddWithValue("@Other2PercentEfficiency", Other2PercentEfficiency);
        cmd.Parameters.AddWithValue("@BackBurnerLeftCO", BackBurnerLeftCO);
        cmd.Parameters.AddWithValue("@BackBurnerLeftRadio", BackBurnerLeftRadio);
        cmd.Parameters.AddWithValue("@BackBurnerRightRadio", BackBurnerRightRadio);
        cmd.Parameters.AddWithValue("@BackBurnerRightCO", BackBurnerRightCO);
        cmd.Parameters.AddWithValue("@FrontBurnerLeftCO", FrontBurnerLeftCO);
        cmd.Parameters.AddWithValue("@FrontBurnerLeftRadio", FrontBurnerLeftRadio);
        cmd.Parameters.AddWithValue("@FrontBurnerRightRadio", FrontBurnerRightRadio);
        cmd.Parameters.AddWithValue("@FrontBurnerRightCO", FrontBurnerRightCO);
        cmd.Parameters.AddWithValue("@DryerWorstCaseCheckBox", DryerWorstCaseCheckBox);
        cmd.Parameters.AddWithValue("@WholeHouseFanWorstCaseCheckBox", WholeHouseFanWorstCaseCheckBox);
        cmd.Parameters.AddWithValue("@BathFanWorstCaseCheckBox", BathFanWorstCaseCheckBox);
        cmd.Parameters.AddWithValue("@KitchenFanWorstCaseCheckBox", KitchenFanWorstCaseCheckBox);
        cmd.Parameters.AddWithValue("@COAmbient", COAmbient);
        cmd.Parameters.AddWithValue("@COAtOvenVent", COAtOvenVent);
        cmd.Parameters.AddWithValue("@HVACAirHandlerWorstCaseCheckBox", HVACAirHandlerWorstCaseCheckBox);
        cmd.Parameters.AddWithValue("@COAlarmsInTheseLocations", COAlarmsInTheseLocations);
        cmd.Parameters.AddWithValue("@EmergencySituationCheckBox", EmergencySituationCheckBox);
        cmd.Parameters.AddWithValue("@WorkCannotContinueCheckBox", WorkCannotContinueCheckBox);
        cmd.Parameters.AddWithValue("@NATVAL", NATVAL);
        cmd.Parameters.AddWithValue("@WCVAL", WCVAL);
        cmd.Parameters.AddWithValue("@DIFFVAL", DIFFVAL);
        cmd.Parameters.AddWithValue("@PASSVAL", PASSVAL);

        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();

    }
    catch (Exception ex)
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

public DataTable GetPPLAudit_9(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLAuditPage9PreVer2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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


#region Audit PPL 9 Post

public int UpdatePPLAudit_9Post(string JobNumber, string AnyCombustionAppliancesInHomeCheckbox, string CombustibleEquipmentSafetyTestingDoneCheckbox, string OutDoorTemperature, string WaterHeaterAMB, string WaterHeaterCAZ, string WaterHeaterBackDraftWC, string WaterHeaterBackDraftNAT, string WaterHeaterDraftEstablishedWC, string WaterHeaterDraftEstablishedNAT, string WaterHeaterPressureWC, string WaterHeaterPressureNAT, string WaterHeaterDraftPassedWC, string WaterHeaterDraftPassedNAT, string WaterHeaterUndilCOFlue, string WaterHeaterGasLeakDetected, string WaterHeaterPercentEfficiency, string FurnaceBoilerAMB, string FurnaceBoilerCAZ, string FurnaceBoilerBackDraftWC, string FurnaceBoilerBackDraftNAT, string FurnaceBoilerDraftEstablishedWC, string FurnaceBoilerDraftEstablishedNAT, string FurnaceBoilerPressureWC, string FurnaceBoilerPressureNAT, string FurnaceBoilerDraftPassedWC, string FurnaceBoilerDraftPassedNAT, string FurnaceBoilerUndilCOFlue, string FurnaceBoilerGasLeakDetected, string FurnaceBoilerPercentEfficiency, string Other1AMB, string Other1CAZ, string Other1BackDraftWC, string Other1BackDraftNAT, string Other1DraftEstablishedWC, string Other1DraftEstablishedNAT, string Other1PressureWC, string Other1PressureNAT, string Other1DraftPassedWC, string Other1DraftPassedNAT, string Other1UndilCOFlue, string Other1GasLeakDetected, string Other1PercentEfficiency, string Other2AMB, string Other2CAZ, string Other2BackDraftWC, string Other2BackDraftNAT, string Other2DraftEstablishedWC, string Other2DraftEstablishedNAT, string Other2PressureWC, string Other2PressureNAT, string Other2DraftPassedWC, string Other2DraftPassedNAT, string Other2UndilCOFlue, string Other2GasLeakDetected, string Other2PercentEfficiency, string BackBurnerLeftCO, string BackBurnerLeftRadio, string BackBurnerRightRadio, string BackBurnerRightCO, string FrontBurnerLeftCO, string FrontBurnerLeftRadio, string FrontBurnerRightRadio, string FrontBurnerRightCO, string DryerWorstCaseCheckBox, string WholeHouseFanWorstCaseCheckBox, string BathFanWorstCaseCheckBox, string KitchenFanWorstCaseCheckBox, string COAmbient, string COAtOvenVent, string HVACAirHandlerWorstCaseCheckBox, string COAlarmsInTheseLocations, string EmergencySituationCheckBox, string WorkCannotContinueCheckBox, string NATVAL, string WCVAL, string DIFFVAL, string PASSVAL)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAuditPage9PostVer2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@AnyCombustionAppliancesInHomeCheckbox", AnyCombustionAppliancesInHomeCheckbox);
        cmd.Parameters.AddWithValue("@CombustibleEquipmentSafetyTestingDoneCheckbox", CombustibleEquipmentSafetyTestingDoneCheckbox);
        cmd.Parameters.AddWithValue("@OutDoorTemperature", OutDoorTemperature);
        cmd.Parameters.AddWithValue("@WaterHeaterAMB", WaterHeaterAMB);
        cmd.Parameters.AddWithValue("@WaterHeaterCAZ", WaterHeaterCAZ);
        cmd.Parameters.AddWithValue("@WaterHeaterBackDraftWC", WaterHeaterBackDraftWC);
        cmd.Parameters.AddWithValue("@WaterHeaterBackDraftNAT", WaterHeaterBackDraftNAT);
        cmd.Parameters.AddWithValue("@WaterHeaterDraftEstablishedWC", WaterHeaterDraftEstablishedWC);
        cmd.Parameters.AddWithValue("@WaterHeaterDraftEstablishedNAT", WaterHeaterDraftEstablishedNAT);
        cmd.Parameters.AddWithValue("@WaterHeaterPressureWC", WaterHeaterPressureWC);
        cmd.Parameters.AddWithValue("@WaterHeaterPressureNAT", WaterHeaterPressureNAT);
        cmd.Parameters.AddWithValue("@WaterHeaterDraftPassedWC", WaterHeaterDraftPassedWC);
        cmd.Parameters.AddWithValue("@WaterHeaterDraftPassedNAT", WaterHeaterDraftPassedNAT);
        cmd.Parameters.AddWithValue("@WaterHeaterUndilCOFlue", WaterHeaterUndilCOFlue);
        cmd.Parameters.AddWithValue("@WaterHeaterGasLeakDetected", WaterHeaterGasLeakDetected);
        cmd.Parameters.AddWithValue("@WaterHeaterPercentEfficiency", WaterHeaterPercentEfficiency);
        cmd.Parameters.AddWithValue("@FurnaceBoilerAMB", FurnaceBoilerAMB);
        cmd.Parameters.AddWithValue("@FurnaceBoilerCAZ", FurnaceBoilerCAZ);
        cmd.Parameters.AddWithValue("@FurnaceBoilerBackDraftWC", FurnaceBoilerBackDraftWC);
        cmd.Parameters.AddWithValue("@FurnaceBoilerBackDraftNAT", FurnaceBoilerBackDraftNAT);
        cmd.Parameters.AddWithValue("@FurnaceBoilerDraftEstablishedWC", FurnaceBoilerDraftEstablishedWC);
        cmd.Parameters.AddWithValue("@FurnaceBoilerDraftEstablishedNAT", FurnaceBoilerDraftEstablishedNAT);
        cmd.Parameters.AddWithValue("@FurnaceBoilerPressureWC", FurnaceBoilerPressureWC);
        cmd.Parameters.AddWithValue("@FurnaceBoilerPressureNAT", FurnaceBoilerPressureNAT);
        cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassedWC", FurnaceBoilerDraftPassedWC);
        cmd.Parameters.AddWithValue("@FurnaceBoilerDraftPassedNAT", FurnaceBoilerDraftPassedNAT);
        cmd.Parameters.AddWithValue("@FurnaceBoilerUndilCOFlue", FurnaceBoilerUndilCOFlue);
        cmd.Parameters.AddWithValue("@FurnaceBoilerGasLeakDetected", FurnaceBoilerGasLeakDetected);
        cmd.Parameters.AddWithValue("@FurnaceBoilerPercentEfficiency", FurnaceBoilerPercentEfficiency);
        cmd.Parameters.AddWithValue("@Other1AMB", Other1AMB);
        cmd.Parameters.AddWithValue("@Other1CAZ", Other1CAZ);
        cmd.Parameters.AddWithValue("@Other1BackDraftWC", Other1BackDraftWC);
        cmd.Parameters.AddWithValue("@Other1BackDraftNAT", Other1BackDraftNAT);
        cmd.Parameters.AddWithValue("@Other1DraftEstablishedWC", Other1DraftEstablishedWC);
        cmd.Parameters.AddWithValue("@Other1DraftEstablishedNAT", Other1DraftEstablishedNAT);
        cmd.Parameters.AddWithValue("@Other1PressureWC", Other1PressureWC);
        cmd.Parameters.AddWithValue("@Other1PressureNAT", Other1PressureNAT);
        cmd.Parameters.AddWithValue("@Other1DraftPassedWC", Other1DraftPassedWC);
        cmd.Parameters.AddWithValue("@Other1DraftPassedNAT", Other1DraftPassedNAT);
        cmd.Parameters.AddWithValue("@Other1UndilCOFlue", Other1UndilCOFlue);
        cmd.Parameters.AddWithValue("@Other1GasLeakDetected", Other1GasLeakDetected);
        cmd.Parameters.AddWithValue("@Other1PercentEfficiency", Other1PercentEfficiency);
        cmd.Parameters.AddWithValue("@Other2AMB", Other2AMB);
        cmd.Parameters.AddWithValue("@Other2CAZ", Other2CAZ);
        cmd.Parameters.AddWithValue("@Other2BackDraftWC", Other2BackDraftWC);
        cmd.Parameters.AddWithValue("@Other2BackDraftNAT", Other2BackDraftNAT);
        cmd.Parameters.AddWithValue("@Other2DraftEstablishedWC", Other2DraftEstablishedWC);
        cmd.Parameters.AddWithValue("@Other2DraftEstablishedNAT", Other2DraftEstablishedNAT);
        cmd.Parameters.AddWithValue("@Other2PressureWC", Other2PressureWC);
        cmd.Parameters.AddWithValue("@Other2PressureNAT", Other2PressureNAT);
        cmd.Parameters.AddWithValue("@Other2DraftPassedWC", Other2DraftPassedWC);
        cmd.Parameters.AddWithValue("@Other2DraftPassedNAT", Other2DraftPassedNAT);
        cmd.Parameters.AddWithValue("@Other2UndilCOFlue", Other2UndilCOFlue);
        cmd.Parameters.AddWithValue("@Other2GasLeakDetected", Other2GasLeakDetected);
        cmd.Parameters.AddWithValue("@Other2PercentEfficiency", Other2PercentEfficiency);
        cmd.Parameters.AddWithValue("@BackBurnerLeftCO", BackBurnerLeftCO);
        cmd.Parameters.AddWithValue("@BackBurnerLeftRadio", BackBurnerLeftRadio);
        cmd.Parameters.AddWithValue("@BackBurnerRightRadio", BackBurnerRightRadio);
        cmd.Parameters.AddWithValue("@BackBurnerRightCO", BackBurnerRightCO);
        cmd.Parameters.AddWithValue("@FrontBurnerLeftCO", FrontBurnerLeftCO);
        cmd.Parameters.AddWithValue("@FrontBurnerLeftRadio", FrontBurnerLeftRadio);
        cmd.Parameters.AddWithValue("@FrontBurnerRightRadio", FrontBurnerRightRadio);
        cmd.Parameters.AddWithValue("@FrontBurnerRightCO", FrontBurnerRightCO);
        cmd.Parameters.AddWithValue("@DryerWorstCaseCheckBox", DryerWorstCaseCheckBox);
        cmd.Parameters.AddWithValue("@WholeHouseFanWorstCaseCheckBox", WholeHouseFanWorstCaseCheckBox);
        cmd.Parameters.AddWithValue("@BathFanWorstCaseCheckBox", BathFanWorstCaseCheckBox);
        cmd.Parameters.AddWithValue("@KitchenFanWorstCaseCheckBox", KitchenFanWorstCaseCheckBox);
        cmd.Parameters.AddWithValue("@COAmbient", COAmbient);
        cmd.Parameters.AddWithValue("@COAtOvenVent", COAtOvenVent);
        cmd.Parameters.AddWithValue("@HVACAirHandlerWorstCaseCheckBox", HVACAirHandlerWorstCaseCheckBox);
        cmd.Parameters.AddWithValue("@COAlarmsInTheseLocations", COAlarmsInTheseLocations);
        cmd.Parameters.AddWithValue("@EmergencySituationCheckBox", EmergencySituationCheckBox);
        cmd.Parameters.AddWithValue("@WorkCannotContinueCheckBox", WorkCannotContinueCheckBox);
        cmd.Parameters.AddWithValue("@NATVAL", NATVAL);
        cmd.Parameters.AddWithValue("@WCVAL", WCVAL);
        cmd.Parameters.AddWithValue("@DIFFVAL", DIFFVAL);
        cmd.Parameters.AddWithValue("@PASSVAL", PASSVAL);

        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();

    }
    catch (Exception ex)
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

public DataTable GetPPLAudit_9Post(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLAuditPage9PostVer2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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

#region Audit PPL 10
public int UpdatePPLAudit_10(string JobNumber, string CentralAirOnly, string ElectricFurnace, string Other, string OtherDescription, string BasementAndWalls, string Attic, string Garage, string VentedCrawl, string AirHandlerLocation, string Metal, string DuctBoard, string Flex, string InCabinet, string ExtSlot, string ReturnRegisterSlotCovered, string SupplyPre1, string SupplyPost1, string SupplyPre2, string SupplyPost2, string SupplyPre3, string SupplyPost3, string SupplyPre4, string SupplyPost4, string SupplyPre5, string SupplyPost5, string SupplyPre6, string SupplyPost6, string SupplyPre7, string SupplyPost7, string SupplyPre8, string SupplyPost8, string ReturnPre1, string ReturnPost1, string ReturnPre2, string ReturnPost2, string ReturnPre3, string ReturnPost3, string ReturnPre4, string ReturnPost4, string ReturnPre5, string ReturnPost5, string ReturnPre6, string ReturnPost6, string ReturnPre7, string ReturnPost7, string ReturnPre8, string ReturnPost8, string SupplyPre9, string SupplyPost9, string SupplyPre10, string SupplyPost10, string SupplyPre11, string SupplyPost11, string SupplyPre12, string SupplyPost12, string SupplyPre13, string SupplyPost13, string SupplyPre14, string SupplyPost14, string SupplyPre15, string SupplyPost15, string SupplyPre16, string SupplyPost16, string ReturnPre9, string ReturnPost9, string ReturnPre10, string ReturnPost10, string ReturnPre11, string ReturnPost11, string ReturnPre12, string ReturnPost12, string ReturnPre13, string ReturnPost13, string ReturnPre14, string ReturnPost14, string ReturnPre15, string ReturnPost15, string ReturnPre16, string ReturnPost16, string HeatPump1, string RoomName1, string RoomName2, string RoomName3, string RoomName4, string RoomName5, string RoomName6, string RoomName7, string RoomName8, string RoomName9, string RoomName10, string RoomName11, string RoomName12, string RoomName13, string RoomName14, string RoomName15, string RoomName16)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAuditPage10Ver2";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@CentralAirOnly", CentralAirOnly);
        cmd.Parameters.AddWithValue("@ElectricFurnace", ElectricFurnace);
        cmd.Parameters.AddWithValue("@Other", Other);
        cmd.Parameters.AddWithValue("@OtherDescription", OtherDescription);
        cmd.Parameters.AddWithValue("@BasementAndWalls", BasementAndWalls);
        cmd.Parameters.AddWithValue("@Attic", Attic);
        cmd.Parameters.AddWithValue("@Garage", Garage);
        cmd.Parameters.AddWithValue("@VentedCrawl", VentedCrawl);

        cmd.Parameters.AddWithValue("@AirHandlerLocation", AirHandlerLocation);
        cmd.Parameters.AddWithValue("@Metal", Metal);
        cmd.Parameters.AddWithValue("@DuctBoard", DuctBoard);
        cmd.Parameters.AddWithValue("@Flex", Flex);
        cmd.Parameters.AddWithValue("@InCabinet", InCabinet);

        cmd.Parameters.AddWithValue("@ExtSlot", ExtSlot);
        cmd.Parameters.AddWithValue("@ReturnRegisterSlotCovered", ReturnRegisterSlotCovered);
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
        cmd.Parameters.AddWithValue("@SupplyPre9", SupplyPre9);
        cmd.Parameters.AddWithValue("@SupplyPost9", SupplyPost9);
        cmd.Parameters.AddWithValue("@SupplyPre10", SupplyPre10);
        cmd.Parameters.AddWithValue("@SupplyPost10", SupplyPost10);
        cmd.Parameters.AddWithValue("@SupplyPre11", SupplyPre11);
        cmd.Parameters.AddWithValue("@SupplyPost11", SupplyPost11);

        cmd.Parameters.AddWithValue("@SupplyPre12", SupplyPre12);
        cmd.Parameters.AddWithValue("@SupplyPost12", SupplyPost12);
        cmd.Parameters.AddWithValue("@SupplyPre13", SupplyPre13);
        cmd.Parameters.AddWithValue("@SupplyPost13", SupplyPost13);
        cmd.Parameters.AddWithValue("@SupplyPre14", SupplyPre14);
        cmd.Parameters.AddWithValue("@SupplyPost14", SupplyPost14);


        cmd.Parameters.AddWithValue("@SupplyPre15", SupplyPre15);
        cmd.Parameters.AddWithValue("@SupplyPost15", SupplyPost15);
        cmd.Parameters.AddWithValue("@SupplyPre16", SupplyPre16);
        cmd.Parameters.AddWithValue("@SupplyPost16", SupplyPost16);
        cmd.Parameters.AddWithValue("@ReturnPre9", ReturnPre9);
        cmd.Parameters.AddWithValue("@ReturnPost9", ReturnPost9);


        cmd.Parameters.AddWithValue("@ReturnPre10", ReturnPre10);
        cmd.Parameters.AddWithValue("@ReturnPost10", ReturnPost10);
        cmd.Parameters.AddWithValue("@ReturnPre11", ReturnPre11);
        cmd.Parameters.AddWithValue("@ReturnPost11", ReturnPost11);
        cmd.Parameters.AddWithValue("@ReturnPre12", ReturnPre12);
        cmd.Parameters.AddWithValue("@ReturnPost12", ReturnPost12);
        cmd.Parameters.AddWithValue("@ReturnPre13", ReturnPre13);

        cmd.Parameters.AddWithValue("@ReturnPost13", ReturnPost13);
        cmd.Parameters.AddWithValue("@ReturnPre14", ReturnPre14);
        cmd.Parameters.AddWithValue("@ReturnPost14", ReturnPost14);
        cmd.Parameters.AddWithValue("@ReturnPre15", ReturnPre15);
        cmd.Parameters.AddWithValue("@ReturnPost15", ReturnPost15);
        cmd.Parameters.AddWithValue("@ReturnPre16", ReturnPre16);
        cmd.Parameters.AddWithValue("@ReturnPost16", ReturnPost16);

        cmd.Parameters.AddWithValue("@HeatPump1", HeatPump1);
        cmd.Parameters.AddWithValue("@RoomName1", RoomName1);
        cmd.Parameters.AddWithValue("@RoomName2", RoomName2);
        cmd.Parameters.AddWithValue("@RoomName3", RoomName3);
        cmd.Parameters.AddWithValue("@RoomName4", RoomName4);
        cmd.Parameters.AddWithValue("@RoomName5", RoomName5);
        cmd.Parameters.AddWithValue("@RoomName6", RoomName6);

        cmd.Parameters.AddWithValue("@RoomName7", RoomName7);
        cmd.Parameters.AddWithValue("@RoomName8", RoomName8);
        cmd.Parameters.AddWithValue("@RoomName9", RoomName9);
        cmd.Parameters.AddWithValue("@RoomName10", RoomName10);
        cmd.Parameters.AddWithValue("@RoomName11", RoomName11);

        cmd.Parameters.AddWithValue("@RoomName12", RoomName12);
        cmd.Parameters.AddWithValue("@RoomName13", RoomName13);
        cmd.Parameters.AddWithValue("@RoomName14", RoomName14);
        cmd.Parameters.AddWithValue("@RoomName15", RoomName15);
        cmd.Parameters.AddWithValue("@RoomName16", RoomName16);
        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();
    }
    catch (Exception ex)
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


public DataTable GetPPLAudit_10(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLAuditPage10Ver2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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


#region PPLAudit Invoice 1
public int UpdatePPLAudit_Invoice_1(string JobNumber, string Line1Quantity, string Line2Quantity, string Line3Quantity, string Line4Quantity, string Line5Quantity, string Line6Quantity, string Line7Quantity, string Line8Quantity, string Line9Quantity, string Line10Quantity, string Line11Quantity, string Line12Quantity, string Line13Quantity, string Line14Quantity, string Line15Quantity, string Line16Quantity, string Line17Quantity, string Line18Quantity, string Line19Quantity, string Line20Quantity, string Line21Quantity, string Line22Quantity, string Line23Quantity, string Line24Quantity, string Line25Quantity, string Line26Quantity, string Line27Quantity, string Line28Quantity, string Line29Quantity, string Line30Quantity, string Line31Quantity, string Line32Quantity, string Line33Quantity, string Line34Quantity, string Line35Quantity, string Line36Quantity, string Line37Quantity, string Line1Total, string Line2Total, string Line3Total, string Line4Total, string Line5Total, string Line6Total, string Line7Total, string Line8Total, string Line9Total, string Line10Total, string Line11Total, string Line12Total, string Line13Total, string Line14Total, string Line15Total, string Line16Total, string Line17Total, string Line18Total, string Line19Total, string Line20Total, string Line21Total, string Line22Total, string Line23Total, string Line24Total, string Line25Total, string Line26Total, string Line27Total, string Line28Total, string Line29Total, string Line30Total, string Line31Total, string Line32Total, string Line33Total, string Line34Total, string Line35Total, string Line36Total, string Line37Total, string Line9Category, string Line9LIURPCode, string Line9MeasureDescription, string Line9SC, string Line9Unit, string Line9LaborRate, string Line9THW, string Line9TMC, string Line9CostPerUnit, string Line10Category, string Line10LIURPCode, string Line10MeasureDescription, string Line10SC, string Line10Unit, string Line10LaborRate, string Line10THW, string Line10TMC, string Line10CostPerUnit, string Line15Category, string Line15LIURPCode, string Line15MeasureDescription, string Line15SC, string Line15Unit, string Line15LaborRate, string Line15THW, string Line15TMC, string Line15CostPerUnit, string Line16Category, string Line16LIURPCode, string Line16MeasureDescription, string Line16SC, string Line16Unit, string Line16LaborRate, string Line16THW, string Line16TMC, string Line16CostPerUnit, string Line17Category, string Line17LIURPCode, string Line17MeasureDescription, string Line17SC, string Line17Unit, string Line17LaborRate, string Line17THW, string Line17TMC, string Line17CostPerUnit, string Line22Category, string Line22LIURPCode, string Line22MeasureDescription, string Line22SC, string Line22Unit, string Line22LaborRate, string Line22THW, string Line22TMC, string Line22CostPerUnit, string Line23Category, string Line23LIURPCode, string Line23MeasureDescription, string Line23SC, string Line23Unit, string Line23LaborRate, string Line23THW, string Line23TMC, string Line23CostPerUnit, string Line24Category, string Line24LIURPCode, string Line24MeasureDescription, string Line24SC, string Line24Unit, string Line24LaborRate, string Line24THW, string Line24TMC, string Line24CostPerUnit, string Finalized, string Line1Location, string Line2Location, string Line3Location, string Line4Location, string Line5Location, string Line6Location, string Line7Location, string Line8Location, string Line9Location, string Line10Location, string Line11Location, string Line12Location, string Line13Location, string Line14Location, string Line15Location, string Line16Location, string Line17Location, string Line18Location, string Line19Location, string Line20Location, string Line21Location, string Line22Location, string Line23Location, string Line24Location, string Line25Location, string Line26Location, string Line27Location, string Line28Location)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLInvoicePage1";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@Line1Quantity", Line1Quantity);
        cmd.Parameters.AddWithValue("@Line2Quantity", Line2Quantity);
        cmd.Parameters.AddWithValue("@Line3Quantity", Line3Quantity);
        cmd.Parameters.AddWithValue("@Line4Quantity", Line4Quantity);
        cmd.Parameters.AddWithValue("@Line5Quantity", Line5Quantity);
        cmd.Parameters.AddWithValue("@Line6Quantity", Line6Quantity);
        cmd.Parameters.AddWithValue("@Line7Quantity", Line7Quantity);
        cmd.Parameters.AddWithValue("@Line8Quantity", Line8Quantity);
        cmd.Parameters.AddWithValue("@Line9Quantity", Line9Quantity);
        cmd.Parameters.AddWithValue("@Line10Quantity", Line10Quantity);
        cmd.Parameters.AddWithValue("@Line11Quantity", Line11Quantity);
        cmd.Parameters.AddWithValue("@Line12Quantity", Line12Quantity);
        cmd.Parameters.AddWithValue("@Line13Quantity", Line13Quantity);
        cmd.Parameters.AddWithValue("@Line14Quantity", Line14Quantity);
        cmd.Parameters.AddWithValue("@Line15Quantity", Line15Quantity);
        cmd.Parameters.AddWithValue("@Line16Quantity", Line16Quantity);
        cmd.Parameters.AddWithValue("@Line17Quantity", Line17Quantity);
        cmd.Parameters.AddWithValue("@Line18Quantity", Line18Quantity);
        cmd.Parameters.AddWithValue("@Line19Quantity", Line19Quantity);
        cmd.Parameters.AddWithValue("@Line20Quantity", Line20Quantity);
        cmd.Parameters.AddWithValue("@Line21Quantity", Line21Quantity);
        cmd.Parameters.AddWithValue("@Line22Quantity", Line22Quantity);
        cmd.Parameters.AddWithValue("@Line23Quantity", Line23Quantity);
        cmd.Parameters.AddWithValue("@Line24Quantity", Line24Quantity);
        cmd.Parameters.AddWithValue("@Line25Quantity", Line25Quantity);
        cmd.Parameters.AddWithValue("@Line26Quantity", Line26Quantity);
        cmd.Parameters.AddWithValue("@Line27Quantity", Line27Quantity);
        cmd.Parameters.AddWithValue("@Line28Quantity", Line28Quantity);
        cmd.Parameters.AddWithValue("@Line29Quantity", Line29Quantity);
        cmd.Parameters.AddWithValue("@Line30Quantity", Line30Quantity);
        cmd.Parameters.AddWithValue("@Line31Quantity", Line31Quantity);
        cmd.Parameters.AddWithValue("@Line32Quantity", Line32Quantity);
        cmd.Parameters.AddWithValue("@Line33Quantity", Line33Quantity);
        cmd.Parameters.AddWithValue("@Line34Quantity", Line34Quantity);
        cmd.Parameters.AddWithValue("@Line35Quantity", Line35Quantity);
        cmd.Parameters.AddWithValue("@Line36Quantity", Line36Quantity);
        cmd.Parameters.AddWithValue("@Line37Quantity", Line37Quantity);

        cmd.Parameters.AddWithValue("@Line1Total", Line1Total);
        cmd.Parameters.AddWithValue("@Line2Total", Line2Total);
        cmd.Parameters.AddWithValue("@Line3Total", Line3Total);
        cmd.Parameters.AddWithValue("@Line4Total", Line4Total);
        cmd.Parameters.AddWithValue("@Line5Total", Line5Total);
        cmd.Parameters.AddWithValue("@Line6Total", Line6Total);
        cmd.Parameters.AddWithValue("@Line7Total", Line7Total);
        cmd.Parameters.AddWithValue("@Line8Total", Line8Total);
        cmd.Parameters.AddWithValue("@Line9Total", Line9Total);
        cmd.Parameters.AddWithValue("@Line10Total", Line10Total);
        cmd.Parameters.AddWithValue("@Line11Total", Line11Total);
        cmd.Parameters.AddWithValue("@Line12Total", Line12Total);
        cmd.Parameters.AddWithValue("@Line13Total", Line13Total);
        cmd.Parameters.AddWithValue("@Line14Total", Line14Total);
        cmd.Parameters.AddWithValue("@Line15Total", Line15Total);
        cmd.Parameters.AddWithValue("@Line16Total", Line16Total);
        cmd.Parameters.AddWithValue("@Line17Total", Line17Total);
        cmd.Parameters.AddWithValue("@Line18Total", Line18Total);
        cmd.Parameters.AddWithValue("@Line19Total", Line19Total);
        cmd.Parameters.AddWithValue("@Line20Total", Line20Total);
        cmd.Parameters.AddWithValue("@Line21Total", Line21Total);
        cmd.Parameters.AddWithValue("@Line22Total", Line22Total);
        cmd.Parameters.AddWithValue("@Line23Total", Line23Total);
        cmd.Parameters.AddWithValue("@Line24Total", Line24Total);
        cmd.Parameters.AddWithValue("@Line25Total", Line25Total);
        cmd.Parameters.AddWithValue("@Line26Total", Line26Total);
        cmd.Parameters.AddWithValue("@Line27Total", Line27Total);
        cmd.Parameters.AddWithValue("@Line28Total", Line28Total);
        cmd.Parameters.AddWithValue("@Line29Total", Line29Total);
        cmd.Parameters.AddWithValue("@Line30Total", Line30Total);
        cmd.Parameters.AddWithValue("@Line31Total", Line31Total);
        cmd.Parameters.AddWithValue("@Line32Total", Line32Total);
        cmd.Parameters.AddWithValue("@Line33Total", Line33Total);
        cmd.Parameters.AddWithValue("@Line34Total", Line34Total);
        cmd.Parameters.AddWithValue("@Line35Total", Line35Total);
        cmd.Parameters.AddWithValue("@Line36Total", Line36Total);
        cmd.Parameters.AddWithValue("@Line37Total", Line37Total);

        cmd.Parameters.AddWithValue("@Finalized", Finalized);

        cmd.Parameters.AddWithValue("@Line1Location", Line1Location);
        cmd.Parameters.AddWithValue("@Line2Location", Line2Location);
        cmd.Parameters.AddWithValue("@Line3Location", Line3Location);
        cmd.Parameters.AddWithValue("@Line4Location", Line4Location);
        cmd.Parameters.AddWithValue("@Line5Location", Line5Location);
        cmd.Parameters.AddWithValue("@Line6Location", Line6Location);
        cmd.Parameters.AddWithValue("@Line7Location", Line7Location);
        cmd.Parameters.AddWithValue("@Line8Location", Line8Location);
        cmd.Parameters.AddWithValue("@Line9Location", Line9Location);
        cmd.Parameters.AddWithValue("@Line10Location", Line10Location);
        cmd.Parameters.AddWithValue("@Line11Location", Line11Location);
        cmd.Parameters.AddWithValue("@Line12Location", Line12Location);
        cmd.Parameters.AddWithValue("@Line13Location", Line13Location);
        cmd.Parameters.AddWithValue("@Line14Location", Line14Location);
        cmd.Parameters.AddWithValue("@Line15Location", Line15Location);
        cmd.Parameters.AddWithValue("@Line16Location", Line16Location);
        cmd.Parameters.AddWithValue("@Line17Location", Line17Location);
        cmd.Parameters.AddWithValue("@Line18Location", Line18Location);
        cmd.Parameters.AddWithValue("@Line19Location", Line19Location);
        cmd.Parameters.AddWithValue("@Line20Location", Line20Location);
        cmd.Parameters.AddWithValue("@Line21Location", Line21Location);
        cmd.Parameters.AddWithValue("@Line22Location", Line22Location);
        cmd.Parameters.AddWithValue("@Line23Location", Line23Location);
        cmd.Parameters.AddWithValue("@Line24Location", Line24Location);
        cmd.Parameters.AddWithValue("@Line25Location", Line25Location);
        cmd.Parameters.AddWithValue("@Line26Location", Line26Location);
        cmd.Parameters.AddWithValue("@Line27Location", Line27Location);
        cmd.Parameters.AddWithValue("@Line28Location", Line28Location);

        cmd.Parameters.AddWithValue("@Line9Category", Line9Category);
        cmd.Parameters.AddWithValue("@Line9LIURPCode", Line9LIURPCode);
        cmd.Parameters.AddWithValue("@Line9MeasureDescription", Line9MeasureDescription);
        cmd.Parameters.AddWithValue("@Line9SC", Line9SC);
        cmd.Parameters.AddWithValue("@Line9Unit", Line9Unit);
        cmd.Parameters.AddWithValue("@Line9LaborRate", Line9LaborRate);
        cmd.Parameters.AddWithValue("@Line9THW", Line9THW);
        cmd.Parameters.AddWithValue("@Line9TMC", Line9TMC);
        cmd.Parameters.AddWithValue("@Line9CostPerUnit", Line9CostPerUnit);
        cmd.Parameters.AddWithValue("@Line10Category", Line10Category);
        cmd.Parameters.AddWithValue("@Line10LIURPCode", Line10LIURPCode);
        cmd.Parameters.AddWithValue("@Line10MeasureDescription", Line10MeasureDescription);
        cmd.Parameters.AddWithValue("@Line10SC", Line10SC);
        cmd.Parameters.AddWithValue("@Line10Unit", Line10Unit);
        cmd.Parameters.AddWithValue("@Line10LaborRate", Line10LaborRate);
        cmd.Parameters.AddWithValue("@Line10THW", Line10THW);
        cmd.Parameters.AddWithValue("@Line10TMC", Line10TMC);
        cmd.Parameters.AddWithValue("@Line10CostPerUnit", Line10CostPerUnit);
        cmd.Parameters.AddWithValue("@Line15Category", Line15Category);
        cmd.Parameters.AddWithValue("@Line15LIURPCode", Line15LIURPCode);
        cmd.Parameters.AddWithValue("@Line15MeasureDescription", Line15MeasureDescription);
        cmd.Parameters.AddWithValue("@Line15SC", Line15SC);
        cmd.Parameters.AddWithValue("@Line15Unit", Line15Unit);
        cmd.Parameters.AddWithValue("@Line15LaborRate", Line15LaborRate);
        cmd.Parameters.AddWithValue("@Line15THW", Line15THW);
        cmd.Parameters.AddWithValue("@Line15TMC", Line15TMC);
        cmd.Parameters.AddWithValue("@Line15CostPerUnit", Line15CostPerUnit);
        cmd.Parameters.AddWithValue("@Line16Category", Line16Category);
        cmd.Parameters.AddWithValue("@Line16LIURPCode", Line16LIURPCode);
        cmd.Parameters.AddWithValue("@Line16MeasureDescription", Line16MeasureDescription);
        cmd.Parameters.AddWithValue("@Line16SC", Line16SC);
        cmd.Parameters.AddWithValue("@Line16Unit", Line16Unit);
        cmd.Parameters.AddWithValue("@Line16LaborRate", Line16LaborRate);
        cmd.Parameters.AddWithValue("@Line16THW", Line16THW);
        cmd.Parameters.AddWithValue("@Line16TMC", Line16TMC);
        cmd.Parameters.AddWithValue("@Line16CostPerUnit", Line16CostPerUnit);
        cmd.Parameters.AddWithValue("@Line17Category", Line17Category);
        cmd.Parameters.AddWithValue("@Line17LIURPCode", Line17LIURPCode);
        cmd.Parameters.AddWithValue("@Line17MeasureDescription", Line17MeasureDescription);
        cmd.Parameters.AddWithValue("@Line17SC", Line17SC);
        cmd.Parameters.AddWithValue("@Line17Unit", Line17Unit);
        cmd.Parameters.AddWithValue("@Line17LaborRate", Line17LaborRate);
        cmd.Parameters.AddWithValue("@Line17THW", Line17THW);
        cmd.Parameters.AddWithValue("@Line17TMC", Line17TMC);
        cmd.Parameters.AddWithValue("@Line17CostPerUnit", Line17CostPerUnit);
        cmd.Parameters.AddWithValue("@Line22Category", Line22Category);
        cmd.Parameters.AddWithValue("@Line22LIURPCode", Line22LIURPCode);
        cmd.Parameters.AddWithValue("@Line22MeasureDescription", Line22MeasureDescription);
        cmd.Parameters.AddWithValue("@Line22SC", Line22SC);
        cmd.Parameters.AddWithValue("@Line22Unit", Line22Unit);
        cmd.Parameters.AddWithValue("@Line22LaborRate", Line22LaborRate);
        cmd.Parameters.AddWithValue("@Line22THW", Line22THW);
        cmd.Parameters.AddWithValue("@Line22TMC", Line22TMC);
        cmd.Parameters.AddWithValue("@Line22CostPerUnit", Line22CostPerUnit);
        cmd.Parameters.AddWithValue("@Line23Category", Line23Category);
        cmd.Parameters.AddWithValue("@Line23LIURPCode", Line23LIURPCode);
        cmd.Parameters.AddWithValue("@Line23MeasureDescription", Line23MeasureDescription);
        cmd.Parameters.AddWithValue("@Line23SC", Line23SC);
        cmd.Parameters.AddWithValue("@Line23Unit", Line23Unit);
        cmd.Parameters.AddWithValue("@Line23LaborRate", Line23LaborRate);
        cmd.Parameters.AddWithValue("@Line23THW", Line23THW);
        cmd.Parameters.AddWithValue("@Line23TMC", Line23TMC);
        cmd.Parameters.AddWithValue("@Line23CostPerUnit", Line23CostPerUnit);
        cmd.Parameters.AddWithValue("@Line24Category", Line24Category);
        cmd.Parameters.AddWithValue("@Line24LIURPCode", Line24LIURPCode);
        cmd.Parameters.AddWithValue("@Line24MeasureDescription", Line24MeasureDescription);
        cmd.Parameters.AddWithValue("@Line24SC", Line24SC);
        cmd.Parameters.AddWithValue("@Line24Unit", Line24Unit);
        cmd.Parameters.AddWithValue("@Line24LaborRate", Line24LaborRate);
        cmd.Parameters.AddWithValue("@Line24THW", Line24THW);
        cmd.Parameters.AddWithValue("@Line24TMC", Line24TMC);
        cmd.Parameters.AddWithValue("@Line24CostPerUnit", Line24CostPerUnit);

        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();
    }
    catch (Exception ex)
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


public DataTable GetPPLAudit_Invoice_1(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLInvoicePage1";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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



public DataTable GetPPLAudit_Invoice_NonSpecial(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SELECTPPLInvoicePage1_WithCFL_Change";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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



#region PPLAudit Invoice 2
public int UpdatePPLAudit_Invoice_2(string JobNumber, string Line1Quantity, string Line2Quantity, string Line3Quantity, string Line4Quantity, string Line5Quantity, string Line6Quantity, string Line7Quantity, string Line8Quantity, string Line9Quantity, string Line10Quantity, string Line11Quantity, string Line12Quantity, string Line13Quantity, string Line14Quantity, string Line15Quantity, string Line16Quantity, string Line17Quantity, string Line18Quantity, string Line19Quantity, string Line20Quantity, string Line21Quantity, string Line22Quantity, string Line23Quantity, string Line24Quantity, string Line25Quantity, string Line26Quantity, string Line27Quantity, string Line28Quantity, string Line29Quantity, string Line30Quantity, string Line31Quantity, string Line32Quantity, string Line33Quantity, string Line34Quantity, string Line35Quantity, string Line36Quantity, string Line37Quantity, string Line1Total, string Line2Total, string Line3Total, string Line4Total, string Line5Total, string Line6Total, string Line7Total, string Line8Total, string Line9Total, string Line10Total, string Line11Total, string Line12Total, string Line13Total, string Line14Total, string Line15Total, string Line16Total, string Line17Total, string Line18Total, string Line19Total, string Line20Total, string Line21Total, string Line22Total, string Line23Total, string Line24Total, string Line25Total, string Line26Total, string Line27Total, string Line28Total, string Line29Total, string Line30Total, string Line31Total, string Line32Total, string Line33Total, string Line34Total, string Line35Total, string Line36Total, string Line37Total, string Finalized, string Line1Location, string Line2Location, string Line3Location, string Line4Location, string Line5Location, string Line6Location, string Line7Location, string Line8Location, string Line9Location, string Line10Location, string Line11Location, string Line12Location, string Line13Location, string Line14Location, string Line15Location, string Line16Location, string Line17Location, string Line18Location, string Line19Location, string Line20Location, string Line21Location, string Line22Location, string Line23Location, string Line24Location, string Line25Location, string Line26Location, string Line27Location, string Line28Location, string Line29Location, string Line30Location, string Line31Location, string Line32Location, string Line33Location, string Line34Location, string Line35Location, string Line36Location, string Line37Location)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLInvoicePage2";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@Line1Quantity", Line1Quantity);
        cmd.Parameters.AddWithValue("@Line2Quantity", Line2Quantity);
        cmd.Parameters.AddWithValue("@Line3Quantity", Line3Quantity);
        cmd.Parameters.AddWithValue("@Line4Quantity", Line4Quantity);
        cmd.Parameters.AddWithValue("@Line5Quantity", Line5Quantity);
        cmd.Parameters.AddWithValue("@Line6Quantity", Line6Quantity);
        cmd.Parameters.AddWithValue("@Line7Quantity", Line7Quantity);
        cmd.Parameters.AddWithValue("@Line8Quantity", Line8Quantity);
        cmd.Parameters.AddWithValue("@Line9Quantity", Line9Quantity);
        cmd.Parameters.AddWithValue("@Line10Quantity", Line10Quantity);
        cmd.Parameters.AddWithValue("@Line11Quantity", Line11Quantity);
        cmd.Parameters.AddWithValue("@Line12Quantity", Line12Quantity);
        cmd.Parameters.AddWithValue("@Line13Quantity", Line13Quantity);
        cmd.Parameters.AddWithValue("@Line14Quantity", Line14Quantity);
        cmd.Parameters.AddWithValue("@Line15Quantity", Line15Quantity);
        cmd.Parameters.AddWithValue("@Line16Quantity", Line16Quantity);
        cmd.Parameters.AddWithValue("@Line17Quantity", Line17Quantity);
        cmd.Parameters.AddWithValue("@Line18Quantity", Line18Quantity);
        cmd.Parameters.AddWithValue("@Line19Quantity", Line19Quantity);
        cmd.Parameters.AddWithValue("@Line20Quantity", Line20Quantity);
        cmd.Parameters.AddWithValue("@Line21Quantity", Line21Quantity);
        cmd.Parameters.AddWithValue("@Line22Quantity", Line22Quantity);
        cmd.Parameters.AddWithValue("@Line23Quantity", Line23Quantity);
        cmd.Parameters.AddWithValue("@Line24Quantity", Line24Quantity);
        cmd.Parameters.AddWithValue("@Line25Quantity", Line25Quantity);
        cmd.Parameters.AddWithValue("@Line26Quantity", Line26Quantity);
        cmd.Parameters.AddWithValue("@Line27Quantity", Line27Quantity);
        cmd.Parameters.AddWithValue("@Line28Quantity", Line28Quantity);
        cmd.Parameters.AddWithValue("@Line29Quantity", Line29Quantity);
        cmd.Parameters.AddWithValue("@Line30Quantity", Line30Quantity);
        cmd.Parameters.AddWithValue("@Line31Quantity", Line31Quantity);
        cmd.Parameters.AddWithValue("@Line32Quantity", Line32Quantity);
        cmd.Parameters.AddWithValue("@Line33Quantity", Line33Quantity);
        cmd.Parameters.AddWithValue("@Line34Quantity", Line34Quantity);
        cmd.Parameters.AddWithValue("@Line35Quantity", Line35Quantity);
        cmd.Parameters.AddWithValue("@Line36Quantity", Line36Quantity);
        cmd.Parameters.AddWithValue("@Line37Quantity", Line37Quantity);
        cmd.Parameters.AddWithValue("@Line1Total", Line1Total);
        cmd.Parameters.AddWithValue("@Line2Total", Line2Total);
        cmd.Parameters.AddWithValue("@Line3Total", Line3Total);
        cmd.Parameters.AddWithValue("@Line4Total", Line4Total);
        cmd.Parameters.AddWithValue("@Line5Total", Line5Total);
        cmd.Parameters.AddWithValue("@Line6Total", Line6Total);
        cmd.Parameters.AddWithValue("@Line7Total", Line7Total);
        cmd.Parameters.AddWithValue("@Line8Total", Line8Total);
        cmd.Parameters.AddWithValue("@Line9Total", Line9Total);
        cmd.Parameters.AddWithValue("@Line10Total", Line10Total);
        cmd.Parameters.AddWithValue("@Line11Total", Line11Total);
        cmd.Parameters.AddWithValue("@Line12Total", Line12Total);
        cmd.Parameters.AddWithValue("@Line13Total", Line13Total);
        cmd.Parameters.AddWithValue("@Line14Total", Line14Total);
        cmd.Parameters.AddWithValue("@Line15Total", Line15Total);
        cmd.Parameters.AddWithValue("@Line16Total", Line16Total);
        cmd.Parameters.AddWithValue("@Line17Total", Line17Total);
        cmd.Parameters.AddWithValue("@Line18Total", Line18Total);
        cmd.Parameters.AddWithValue("@Line19Total", Line19Total);
        cmd.Parameters.AddWithValue("@Line20Total", Line20Total);
        cmd.Parameters.AddWithValue("@Line21Total", Line21Total);
        cmd.Parameters.AddWithValue("@Line22Total", Line22Total);
        cmd.Parameters.AddWithValue("@Line23Total", Line23Total);
        cmd.Parameters.AddWithValue("@Line24Total", Line24Total);
        cmd.Parameters.AddWithValue("@Line25Total", Line25Total);
        cmd.Parameters.AddWithValue("@Line26Total", Line26Total);
        cmd.Parameters.AddWithValue("@Line27Total", Line27Total);
        cmd.Parameters.AddWithValue("@Line28Total", Line28Total);
        cmd.Parameters.AddWithValue("@Line29Total", Line29Total);
        cmd.Parameters.AddWithValue("@Line30Total", Line30Total);
        cmd.Parameters.AddWithValue("@Line31Total", Line31Total);
        cmd.Parameters.AddWithValue("@Line32Total", Line32Total);
        cmd.Parameters.AddWithValue("@Line33Total", Line33Total);
        cmd.Parameters.AddWithValue("@Line34Total", Line34Total);
        cmd.Parameters.AddWithValue("@Line35Total", Line35Total);
        cmd.Parameters.AddWithValue("@Line36Total", Line36Total);
        cmd.Parameters.AddWithValue("@Line37Total", Line37Total);
        cmd.Parameters.AddWithValue("@Finalized", Finalized);
        cmd.Parameters.AddWithValue("@Line1Location", Line1Location);
        cmd.Parameters.AddWithValue("@Line2Location", Line2Location);
        cmd.Parameters.AddWithValue("@Line3Location", Line3Location);
        cmd.Parameters.AddWithValue("@Line4Location", Line4Location);
        cmd.Parameters.AddWithValue("@Line5Location", Line5Location);
        cmd.Parameters.AddWithValue("@Line6Location", Line6Location);
        cmd.Parameters.AddWithValue("@Line7Location", Line7Location);
        cmd.Parameters.AddWithValue("@Line8Location", Line8Location);
        cmd.Parameters.AddWithValue("@Line9Location", Line9Location);
        cmd.Parameters.AddWithValue("@Line10Location", Line10Location);
        cmd.Parameters.AddWithValue("@Line11Location", Line11Location);
        cmd.Parameters.AddWithValue("@Line12Location", Line12Location);
        cmd.Parameters.AddWithValue("@Line13Location", Line13Location);
        cmd.Parameters.AddWithValue("@Line14Location", Line14Location);
        cmd.Parameters.AddWithValue("@Line15Location", Line15Location);
        cmd.Parameters.AddWithValue("@Line16Location", Line16Location);
        cmd.Parameters.AddWithValue("@Line17Location", Line17Location);
        cmd.Parameters.AddWithValue("@Line18Location", Line18Location);
        cmd.Parameters.AddWithValue("@Line19Location", Line19Location);
        cmd.Parameters.AddWithValue("@Line20Location", Line20Location);
        cmd.Parameters.AddWithValue("@Line21Location", Line21Location);
        cmd.Parameters.AddWithValue("@Line22Location", Line22Location);
        cmd.Parameters.AddWithValue("@Line23Location", Line23Location);
        cmd.Parameters.AddWithValue("@Line24Location", Line24Location);
        cmd.Parameters.AddWithValue("@Line25Location", Line25Location);
        cmd.Parameters.AddWithValue("@Line26Location", Line26Location);
        cmd.Parameters.AddWithValue("@Line27Location", Line27Location);
        cmd.Parameters.AddWithValue("@Line28Location", Line28Location);
        cmd.Parameters.AddWithValue("@Line29Location", Line29Location);
        cmd.Parameters.AddWithValue("@Line30Location", Line30Location);
        cmd.Parameters.AddWithValue("@Line31Location", Line31Location);
        cmd.Parameters.AddWithValue("@Line32Location", Line32Location);
        cmd.Parameters.AddWithValue("@Line33Location", Line33Location);
        cmd.Parameters.AddWithValue("@Line34Location", Line34Location);
        cmd.Parameters.AddWithValue("@Line35Location", Line35Location);
        cmd.Parameters.AddWithValue("@Line36Location", Line36Location);
        cmd.Parameters.AddWithValue("@Line37Location", Line37Location);

        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();
    }
    catch (Exception ex)
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


public DataTable GetPPLAudit_Invoice_2(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLInvoicePage2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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


#region PPLAudit Invoice 3
public int UpdatePPLAudit_Invoice_3(string JobNumber, string Line1Quantity, string Line2Quantity, string Line3Quantity, string Line4Quantity, string Line5Quantity, string Line6Quantity, string Line7Quantity, string Line8Quantity, string Line9Quantity, string Line10Quantity, string Line11Quantity, string Line12Quantity, string Line13Quantity, string Line14Quantity, string Line15Quantity, string Line16Quantity, string Line17Quantity, string Line18Quantity, string Line19Quantity, string Line20Quantity, string Line21Quantity, string Line22Quantity, string Line23Quantity, string Line24Quantity, string Line25Quantity, string Line26Quantity, string Line27Quantity, string Line28Quantity, string Line29Quantity, string Line30Quantity, string Line31Quantity, string Line32Quantity, string Line33Quantity, string Line34Quantity, string Line35Quantity, string Line36Quantity, string Line37Quantity, string Line1Total, string Line2Total, string Line3Total, string Line4Total, string Line5Total, string Line6Total, string Line7Total, string Line8Total, string Line9Total, string Line10Total, string Line11Total, string Line12Total, string Line13Total, string Line14Total, string Line15Total, string Line16Total, string Line17Total, string Line18Total, string Line19Total, string Line20Total, string Line21Total, string Line22Total, string Line23Total, string Line24Total, string Line25Total, string Line26Total, string Line27Total, string Line28Total, string Line29Total, string Line30Total, string Line31Total, string Line32Total, string Line33Total, string Line34Total, string Line35Total, string Line36Total, string Line37Total, string Line17Category, string Line17LIURPCode, string Line17MeasureDescription, string Line17SC, string Line17Unit, string Line17LaborRate, string Line17THW, string Line17TMC, string Line17CostPerUnit, string Line18Category, string Line18LIURPCode, string Line18MeasureDescription, string Line18SC, string Line18Unit, string Line18LaborRate, string Line18THW, string Line18TMC, string Line18CostPerUnit, string Line33Category, string Line33LIURPCode, string Line33MeasureDescription, string Line33SC, string Line33Unit, string Line33LaborRate, string Line33THW, string Line33TMC, string Line33CostPerUnit, string Line34Category, string Line34LIURPCode, string Line34MeasureDescription, string Line34SC, string Line34Unit, string Line34LaborRate, string Line34THW, string Line34TMC, string Line34CostPerUnit, string Finalized, string Line1Location, string Line2Location, string Line3Location, string Line4Location, string Line5Location, string Line6Location, string Line7Location, string Line8Location, string Line9Location, string Line10Location, string Line11Location, string Line12Location, string Line13Location, string Line14Location, string Line15Location, string Line16Location, string Line17Location, string Line18Location, string Line19Location, string Line20Location, string Line21Location, string Line22Location, string Line23Location, string Line24Location, string Line25Location, string Line26Location, string Line27Location, string Line28Location, string Line29Location, string Line30Location, string Line31Location, string Line32Location, string Line33Location, string Line34Location, string Line35Location, string Line36Location, string Line37Location)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLInvoicePage3";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@Line1Quantity", Line1Quantity);
        cmd.Parameters.AddWithValue("@Line2Quantity", Line2Quantity);
        cmd.Parameters.AddWithValue("@Line3Quantity", Line3Quantity);
        cmd.Parameters.AddWithValue("@Line4Quantity", Line4Quantity);
        cmd.Parameters.AddWithValue("@Line5Quantity", Line5Quantity);
        cmd.Parameters.AddWithValue("@Line6Quantity", Line6Quantity);
        cmd.Parameters.AddWithValue("@Line7Quantity", Line7Quantity);
        cmd.Parameters.AddWithValue("@Line8Quantity", Line8Quantity);
        cmd.Parameters.AddWithValue("@Line9Quantity", Line9Quantity);
        cmd.Parameters.AddWithValue("@Line10Quantity", Line10Quantity);
        cmd.Parameters.AddWithValue("@Line11Quantity", Line11Quantity);
        cmd.Parameters.AddWithValue("@Line12Quantity", Line12Quantity);
        cmd.Parameters.AddWithValue("@Line13Quantity", Line13Quantity);
        cmd.Parameters.AddWithValue("@Line14Quantity", Line14Quantity);
        cmd.Parameters.AddWithValue("@Line15Quantity", Line15Quantity);
        cmd.Parameters.AddWithValue("@Line16Quantity", Line16Quantity);
        cmd.Parameters.AddWithValue("@Line17Quantity", Line17Quantity);
        cmd.Parameters.AddWithValue("@Line18Quantity", Line18Quantity);
        cmd.Parameters.AddWithValue("@Line19Quantity", Line19Quantity);
        cmd.Parameters.AddWithValue("@Line20Quantity", Line20Quantity);
        cmd.Parameters.AddWithValue("@Line21Quantity", Line21Quantity);
        cmd.Parameters.AddWithValue("@Line22Quantity", Line22Quantity);
        cmd.Parameters.AddWithValue("@Line23Quantity", Line23Quantity);
        cmd.Parameters.AddWithValue("@Line24Quantity", Line24Quantity);
        cmd.Parameters.AddWithValue("@Line25Quantity", Line25Quantity);
        cmd.Parameters.AddWithValue("@Line26Quantity", Line26Quantity);
        cmd.Parameters.AddWithValue("@Line27Quantity", Line27Quantity);
        cmd.Parameters.AddWithValue("@Line28Quantity", Line28Quantity);
        cmd.Parameters.AddWithValue("@Line29Quantity", Line29Quantity);
        cmd.Parameters.AddWithValue("@Line30Quantity", Line30Quantity);
        cmd.Parameters.AddWithValue("@Line31Quantity", Line31Quantity);
        cmd.Parameters.AddWithValue("@Line32Quantity", Line32Quantity);
        cmd.Parameters.AddWithValue("@Line33Quantity", Line33Quantity);
        cmd.Parameters.AddWithValue("@Line34Quantity", Line34Quantity);
        cmd.Parameters.AddWithValue("@Line35Quantity", Line35Quantity);
        cmd.Parameters.AddWithValue("@Line36Quantity", Line36Quantity);
        cmd.Parameters.AddWithValue("@Line37Quantity", Line37Quantity);
        cmd.Parameters.AddWithValue("@Line1Total", Line1Total);
        cmd.Parameters.AddWithValue("@Line2Total", Line2Total);
        cmd.Parameters.AddWithValue("@Line3Total", Line3Total);
        cmd.Parameters.AddWithValue("@Line4Total", Line4Total);
        cmd.Parameters.AddWithValue("@Line5Total", Line5Total);
        cmd.Parameters.AddWithValue("@Line6Total", Line6Total);
        cmd.Parameters.AddWithValue("@Line7Total", Line7Total);
        cmd.Parameters.AddWithValue("@Line8Total", Line8Total);
        cmd.Parameters.AddWithValue("@Line9Total", Line9Total);
        cmd.Parameters.AddWithValue("@Line10Total", Line10Total);
        cmd.Parameters.AddWithValue("@Line11Total", Line11Total);
        cmd.Parameters.AddWithValue("@Line12Total", Line12Total);
        cmd.Parameters.AddWithValue("@Line13Total", Line13Total);
        cmd.Parameters.AddWithValue("@Line14Total", Line14Total);
        cmd.Parameters.AddWithValue("@Line15Total", Line15Total);
        cmd.Parameters.AddWithValue("@Line16Total", Line16Total);
        cmd.Parameters.AddWithValue("@Line17Total", Line17Total);
        cmd.Parameters.AddWithValue("@Line18Total", Line18Total);
        cmd.Parameters.AddWithValue("@Line19Total", Line19Total);
        cmd.Parameters.AddWithValue("@Line20Total", Line20Total);
        cmd.Parameters.AddWithValue("@Line21Total", Line21Total);
        cmd.Parameters.AddWithValue("@Line22Total", Line22Total);
        cmd.Parameters.AddWithValue("@Line23Total", Line23Total);
        cmd.Parameters.AddWithValue("@Line24Total", Line24Total);
        cmd.Parameters.AddWithValue("@Line25Total", Line25Total);
        cmd.Parameters.AddWithValue("@Line26Total", Line26Total);
        cmd.Parameters.AddWithValue("@Line27Total", Line27Total);
        cmd.Parameters.AddWithValue("@Line28Total", Line28Total);
        cmd.Parameters.AddWithValue("@Line29Total", Line29Total);
        cmd.Parameters.AddWithValue("@Line30Total", Line30Total);
        cmd.Parameters.AddWithValue("@Line31Total", Line31Total);
        cmd.Parameters.AddWithValue("@Line32Total", Line32Total);
        cmd.Parameters.AddWithValue("@Line33Total", Line33Total);
        cmd.Parameters.AddWithValue("@Line34Total", Line34Total);
        cmd.Parameters.AddWithValue("@Line35Total", Line35Total);
        cmd.Parameters.AddWithValue("@Line36Total", Line36Total);
        cmd.Parameters.AddWithValue("@Line37Total", Line37Total);
        cmd.Parameters.AddWithValue("@Line17Category", Line17Category);
        cmd.Parameters.AddWithValue("@Line17LIURPCode", Line17LIURPCode);
        cmd.Parameters.AddWithValue("@Line17MeasureDescription", Line17MeasureDescription);
        cmd.Parameters.AddWithValue("@Line17SC", Line17SC);
        cmd.Parameters.AddWithValue("@Line17Unit", Line17Unit);
        cmd.Parameters.AddWithValue("@Line17LaborRate", Line17LaborRate);
        cmd.Parameters.AddWithValue("@Line17THW", Line17THW);
        cmd.Parameters.AddWithValue("@Line17TMC", Line17TMC);
        cmd.Parameters.AddWithValue("@Line17CostPerUnit", Line17CostPerUnit);
        cmd.Parameters.AddWithValue("@Line18Category", Line18Category);
        cmd.Parameters.AddWithValue("@Line18LIURPCode", Line18LIURPCode);
        cmd.Parameters.AddWithValue("@Line18MeasureDescription", Line18MeasureDescription);
        cmd.Parameters.AddWithValue("@Line18SC", Line18SC);
        cmd.Parameters.AddWithValue("@Line18Unit", Line18Unit);
        cmd.Parameters.AddWithValue("@Line18LaborRate", Line18LaborRate);
        cmd.Parameters.AddWithValue("@Line18THW", Line18THW);
        cmd.Parameters.AddWithValue("@Line18TMC", Line18TMC);
        cmd.Parameters.AddWithValue("@Line18CostPerUnit", Line18CostPerUnit);
        cmd.Parameters.AddWithValue("@Line33Category", Line33Category);
        cmd.Parameters.AddWithValue("@Line33LIURPCode", Line33LIURPCode);
        cmd.Parameters.AddWithValue("@Line33MeasureDescription", Line33MeasureDescription);
        cmd.Parameters.AddWithValue("@Line33SC", Line33SC);
        cmd.Parameters.AddWithValue("@Line33Unit", Line33Unit);
        cmd.Parameters.AddWithValue("@Line33LaborRate", Line33LaborRate);
        cmd.Parameters.AddWithValue("@Line33THW", Line33THW);
        cmd.Parameters.AddWithValue("@Line33TMC", Line33TMC);
        cmd.Parameters.AddWithValue("@Line33CostPerUnit", Line33CostPerUnit);
        cmd.Parameters.AddWithValue("@Line34Category", Line34Category);
        cmd.Parameters.AddWithValue("@Line34LIURPCode", Line34LIURPCode);
        cmd.Parameters.AddWithValue("@Line34MeasureDescription", Line34MeasureDescription);
        cmd.Parameters.AddWithValue("@Line34SC", Line34SC);
        cmd.Parameters.AddWithValue("@Line34Unit", Line34Unit);
        cmd.Parameters.AddWithValue("@Line34LaborRate", Line34LaborRate);
        cmd.Parameters.AddWithValue("@Line34THW", Line34THW);
        cmd.Parameters.AddWithValue("@Line34TMC", Line34TMC);
        cmd.Parameters.AddWithValue("@Line34CostPerUnit", Line34CostPerUnit);
        cmd.Parameters.AddWithValue("@Finalized", Finalized);
        cmd.Parameters.AddWithValue("@Line1Location", Line1Location);
        cmd.Parameters.AddWithValue("@Line2Location", Line2Location);
        cmd.Parameters.AddWithValue("@Line3Location", Line3Location);
        cmd.Parameters.AddWithValue("@Line4Location", Line4Location);
        cmd.Parameters.AddWithValue("@Line5Location", Line5Location);
        cmd.Parameters.AddWithValue("@Line6Location", Line6Location);
        cmd.Parameters.AddWithValue("@Line7Location", Line7Location);
        cmd.Parameters.AddWithValue("@Line8Location", Line8Location);
        cmd.Parameters.AddWithValue("@Line9Location", Line9Location);
        cmd.Parameters.AddWithValue("@Line10Location", Line10Location);
        cmd.Parameters.AddWithValue("@Line11Location", Line11Location);
        cmd.Parameters.AddWithValue("@Line12Location", Line12Location);
        cmd.Parameters.AddWithValue("@Line13Location", Line13Location);
        cmd.Parameters.AddWithValue("@Line14Location", Line14Location);
        cmd.Parameters.AddWithValue("@Line15Location", Line15Location);
        cmd.Parameters.AddWithValue("@Line16Location", Line16Location);
        cmd.Parameters.AddWithValue("@Line17Location", Line17Location);
        cmd.Parameters.AddWithValue("@Line18Location", Line18Location);
        cmd.Parameters.AddWithValue("@Line19Location", Line19Location);
        cmd.Parameters.AddWithValue("@Line20Location", Line20Location);
        cmd.Parameters.AddWithValue("@Line21Location", Line21Location);
        cmd.Parameters.AddWithValue("@Line22Location", Line22Location);
        cmd.Parameters.AddWithValue("@Line23Location", Line23Location);
        cmd.Parameters.AddWithValue("@Line24Location", Line24Location);
        cmd.Parameters.AddWithValue("@Line25Location", Line25Location);
        cmd.Parameters.AddWithValue("@Line26Location", Line26Location);
        cmd.Parameters.AddWithValue("@Line27Location", Line27Location);
        cmd.Parameters.AddWithValue("@Line28Location", Line28Location);
        cmd.Parameters.AddWithValue("@Line29Location", Line29Location);
        cmd.Parameters.AddWithValue("@Line30Location", Line30Location);
        cmd.Parameters.AddWithValue("@Line31Location", Line31Location);
        cmd.Parameters.AddWithValue("@Line32Location", Line32Location);
        cmd.Parameters.AddWithValue("@Line33Location", Line33Location);
        cmd.Parameters.AddWithValue("@Line34Location", Line34Location);
        cmd.Parameters.AddWithValue("@Line35Location", Line35Location);
        cmd.Parameters.AddWithValue("@Line36Location", Line36Location);
        cmd.Parameters.AddWithValue("@Line37Location", Line37Location);

        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();
    }
    catch (Exception ex)
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


public DataTable GetPPLAudit_Invoice_3(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLInvoicePage3";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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


#region PPLAudit Invoice 4
public int UpdatePPLAudit_Invoice_4(string JobNumber, string Line1Quantity, string Line2Quantity, string Line3Quantity, string Line4Quantity, string Line5Quantity, string Line6Quantity, string Line7Quantity, string Line8Quantity, string Line9Quantity, string Line10Quantity, string Line11Quantity, string Line12Quantity, string Line13Quantity, string Line14Quantity, string Line15Quantity, string Line16Quantity, string Line17Quantity, string Line18Quantity, string Line19Quantity, string Line20Quantity, string Line21Quantity, string Line22Quantity, string Line23Quantity, string Line24Quantity, string Line25Quantity, string Line26Quantity, string Line27Quantity, string Line28Quantity, string Line29Quantity, string Line30Quantity, string Line31Quantity, string Line32Quantity, string Line33Quantity, string Line34Quantity, string Line35Quantity, string Line36Quantity, string Line37Quantity, string Line1Total, string Line2Total, string Line3Total, string Line4Total, string Line5Total, string Line6Total, string Line7Total, string Line8Total, string Line9Total, string Line10Total, string Line11Total, string Line12Total, string Line13Total, string Line14Total, string Line15Total, string Line16Total, string Line17Total, string Line18Total, string Line19Total, string Line20Total, string Line21Total, string Line22Total, string Line23Total, string Line24Total, string Line25Total, string Line26Total, string Line27Total, string Line28Total, string Line29Total, string Line30Total, string Line31Total, string Line32Total, string Line33Total, string Line34Total, string Line35Total, string Line36Total, string Line37Total, string Line2Category, string Line2LIURPCode, string Line2MeasureDescription, string Line2SC, string Line2Unit, string Line2LaborRate, string Line2THW, string Line2TMC, string Line2CostPerUnit, string Line18Category, string Line18LIURPCode, string Line18MeasureDescription, string Line18SC, string Line18Unit, string Line18LaborRate, string Line18THW, string Line18TMC, string Line18CostPerUnit, string Line19Category, string Line19LIURPCode, string Line19MeasureDescription, string Line19SC, string Line19Unit, string Line19LaborRate, string Line19THW, string Line19TMC, string Line19CostPerUnit, string Line24Category, string Line24LIURPCode, string Line24MeasureDescription, string Line24SC, string Line24Unit, string Line24LaborRate, string Line24THW, string Line24TMC, string Line24CostPerUnit, string Line25Category, string Line25LIURPCode, string Line25MeasureDescription, string Line25SC, string Line25Unit, string Line25LaborRate, string Line25THW, string Line25TMC, string Line25CostPerUnit, string Line26Category, string Line26LIURPCode, string Line26MeasureDescription, string Line26SC, string Line26Unit, string Line26LaborRate, string Line26THW, string Line26TMC, string Line26CostPerUnit, string Line27Category, string Line27LIURPCode, string Line27MeasureDescription, string Line27SC, string Line27Unit, string Line27LaborRate, string Line27THW, string Line27TMC, string Line27CostPerUnit, string Line28Category, string Line28LIURPCode, string Line28MeasureDescription, string Line28SC, string Line28Unit, string Line28LaborRate, string Line28THW, string Line28TMC, string Line28CostPerUnit, string Line29Category, string Line29LIURPCode, string Line29MeasureDescription, string Line29SC, string Line29Unit, string Line29LaborRate, string Line29THW, string Line29TMC, string Line29CostPerUnit, string Line23Category, string Line23LIURPCode, string Line23MeasureDescription, string Line23SC, string Line23Unit, string Line23LaborRate, string Line23THW, string Line23TMC, string Line23CostPerUnit, string Line38Quantity, string Line38Total, string Finalized, string Line1Location, string Line2Location, string Line3Location, string Line4Location, string Line5Location, string Line6Location, string Line7Location, string Line8Location, string Line9Location, string Line10Location, string Line11Location, string Line12Location, string Line13Location, string Line14Location, string Line15Location, string Line16Location, string Line17Location, string Line18Location, string Line19Location, string Line20Location, string Line21Location, string Line22Location, string Line23Location, string Line24Location, string Line25Location, string Line26Location, string Line27Location, string Line28Location, string Line29Location, string Line30Location, string Line31Location, string Line32Location, string Line33Location, string Line34Location, string Line35Location, string Line36Location, string Line37Location, string Line38Location)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLInvoicePage4";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@Line1Quantity", Line1Quantity);
        cmd.Parameters.AddWithValue("@Line2Quantity", Line2Quantity);
        cmd.Parameters.AddWithValue("@Line3Quantity", Line3Quantity);
        cmd.Parameters.AddWithValue("@Line4Quantity", Line4Quantity);
        cmd.Parameters.AddWithValue("@Line5Quantity", Line5Quantity);
        cmd.Parameters.AddWithValue("@Line6Quantity", Line6Quantity);
        cmd.Parameters.AddWithValue("@Line7Quantity", Line7Quantity);
        cmd.Parameters.AddWithValue("@Line8Quantity", Line8Quantity);
        cmd.Parameters.AddWithValue("@Line9Quantity", Line9Quantity);
        cmd.Parameters.AddWithValue("@Line10Quantity", Line10Quantity);
        cmd.Parameters.AddWithValue("@Line11Quantity", Line11Quantity);
        cmd.Parameters.AddWithValue("@Line12Quantity", Line12Quantity);
        cmd.Parameters.AddWithValue("@Line13Quantity", Line13Quantity);
        cmd.Parameters.AddWithValue("@Line14Quantity", Line14Quantity);
        cmd.Parameters.AddWithValue("@Line15Quantity", Line15Quantity);
        cmd.Parameters.AddWithValue("@Line16Quantity", Line16Quantity);
        cmd.Parameters.AddWithValue("@Line17Quantity", Line17Quantity);
        cmd.Parameters.AddWithValue("@Line18Quantity", Line18Quantity);
        cmd.Parameters.AddWithValue("@Line19Quantity", Line19Quantity);
        cmd.Parameters.AddWithValue("@Line20Quantity", Line20Quantity);
        cmd.Parameters.AddWithValue("@Line21Quantity", Line21Quantity);
        cmd.Parameters.AddWithValue("@Line22Quantity", Line22Quantity);
        cmd.Parameters.AddWithValue("@Line23Quantity", Line23Quantity);
        cmd.Parameters.AddWithValue("@Line24Quantity", Line24Quantity);
        cmd.Parameters.AddWithValue("@Line25Quantity", Line25Quantity);
        cmd.Parameters.AddWithValue("@Line26Quantity", Line26Quantity);
        cmd.Parameters.AddWithValue("@Line27Quantity", Line27Quantity);
        cmd.Parameters.AddWithValue("@Line28Quantity", Line28Quantity);
        cmd.Parameters.AddWithValue("@Line29Quantity", Line29Quantity);
        cmd.Parameters.AddWithValue("@Line30Quantity", Line30Quantity);
        cmd.Parameters.AddWithValue("@Line31Quantity", Line31Quantity);
        cmd.Parameters.AddWithValue("@Line32Quantity", Line32Quantity);
        cmd.Parameters.AddWithValue("@Line33Quantity", Line33Quantity);
        cmd.Parameters.AddWithValue("@Line34Quantity", Line34Quantity);
        cmd.Parameters.AddWithValue("@Line35Quantity", Line35Quantity);
        cmd.Parameters.AddWithValue("@Line36Quantity", Line36Quantity);
        cmd.Parameters.AddWithValue("@Line37Quantity", Line37Quantity);
        cmd.Parameters.AddWithValue("@Line1Total", Line1Total);
        cmd.Parameters.AddWithValue("@Line2Total", Line2Total);
        cmd.Parameters.AddWithValue("@Line3Total", Line3Total);
        cmd.Parameters.AddWithValue("@Line4Total", Line4Total);
        cmd.Parameters.AddWithValue("@Line5Total", Line5Total);
        cmd.Parameters.AddWithValue("@Line6Total", Line6Total);
        cmd.Parameters.AddWithValue("@Line7Total", Line7Total);
        cmd.Parameters.AddWithValue("@Line8Total", Line8Total);
        cmd.Parameters.AddWithValue("@Line9Total", Line9Total);
        cmd.Parameters.AddWithValue("@Line10Total", Line10Total);
        cmd.Parameters.AddWithValue("@Line11Total", Line11Total);
        cmd.Parameters.AddWithValue("@Line12Total", Line12Total);
        cmd.Parameters.AddWithValue("@Line13Total", Line13Total);
        cmd.Parameters.AddWithValue("@Line14Total", Line14Total);
        cmd.Parameters.AddWithValue("@Line15Total", Line15Total);
        cmd.Parameters.AddWithValue("@Line16Total", Line16Total);
        cmd.Parameters.AddWithValue("@Line17Total", Line17Total);
        cmd.Parameters.AddWithValue("@Line18Total", Line18Total);
        cmd.Parameters.AddWithValue("@Line19Total", Line19Total);
        cmd.Parameters.AddWithValue("@Line20Total", Line20Total);
        cmd.Parameters.AddWithValue("@Line21Total", Line21Total);
        cmd.Parameters.AddWithValue("@Line22Total", Line22Total);
        cmd.Parameters.AddWithValue("@Line23Total", Line23Total);
        cmd.Parameters.AddWithValue("@Line24Total", Line24Total);
        cmd.Parameters.AddWithValue("@Line25Total", Line25Total);
        cmd.Parameters.AddWithValue("@Line26Total", Line26Total);
        cmd.Parameters.AddWithValue("@Line27Total", Line27Total);
        cmd.Parameters.AddWithValue("@Line28Total", Line28Total);
        cmd.Parameters.AddWithValue("@Line29Total", Line29Total);
        cmd.Parameters.AddWithValue("@Line30Total", Line30Total);
        cmd.Parameters.AddWithValue("@Line31Total", Line31Total);
        cmd.Parameters.AddWithValue("@Line32Total", Line32Total);
        cmd.Parameters.AddWithValue("@Line33Total", Line33Total);
        cmd.Parameters.AddWithValue("@Line34Total", Line34Total);
        cmd.Parameters.AddWithValue("@Line35Total", Line35Total);
        cmd.Parameters.AddWithValue("@Line36Total", Line36Total);
        cmd.Parameters.AddWithValue("@Line37Total", Line37Total);
        cmd.Parameters.AddWithValue("@Line2Category", Line2Category);
        cmd.Parameters.AddWithValue("@Line2LIURPCode", Line2LIURPCode);
        cmd.Parameters.AddWithValue("@Line2MeasureDescription", Line2MeasureDescription);
        cmd.Parameters.AddWithValue("@Line2SC", Line2SC);
        cmd.Parameters.AddWithValue("@Line2Unit", Line2Unit);
        cmd.Parameters.AddWithValue("@Line2LaborRate", Line2LaborRate);
        cmd.Parameters.AddWithValue("@Line2THW", Line2THW);
        cmd.Parameters.AddWithValue("@Line2TMC", Line2TMC);
        cmd.Parameters.AddWithValue("@Line2CostPerUnit", Line2CostPerUnit);
        cmd.Parameters.AddWithValue("@Line18Category", Line18Category);
        cmd.Parameters.AddWithValue("@Line18LIURPCode", Line18LIURPCode);
        cmd.Parameters.AddWithValue("@Line18MeasureDescription", Line18MeasureDescription);
        cmd.Parameters.AddWithValue("@Line18SC", Line18SC);
        cmd.Parameters.AddWithValue("@Line18Unit", Line18Unit);
        cmd.Parameters.AddWithValue("@Line18LaborRate", Line18LaborRate);
        cmd.Parameters.AddWithValue("@Line18THW", Line18THW);
        cmd.Parameters.AddWithValue("@Line18TMC", Line18TMC);
        cmd.Parameters.AddWithValue("@Line18CostPerUnit", Line18CostPerUnit);
        cmd.Parameters.AddWithValue("@Line19Category", Line19Category);
        cmd.Parameters.AddWithValue("@Line19LIURPCode", Line19LIURPCode);
        cmd.Parameters.AddWithValue("@Line19MeasureDescription", Line19MeasureDescription);
        cmd.Parameters.AddWithValue("@Line19SC", Line19SC);
        cmd.Parameters.AddWithValue("@Line19Unit", Line19Unit);
        cmd.Parameters.AddWithValue("@Line19LaborRate", Line19LaborRate);
        cmd.Parameters.AddWithValue("@Line19THW", Line19THW);
        cmd.Parameters.AddWithValue("@Line19TMC", Line19TMC);
        cmd.Parameters.AddWithValue("@Line19CostPerUnit", Line19CostPerUnit);
        cmd.Parameters.AddWithValue("@Line24Category", Line24Category);
        cmd.Parameters.AddWithValue("@Line24LIURPCode", Line24LIURPCode);
        cmd.Parameters.AddWithValue("@Line24MeasureDescription", Line24MeasureDescription);
        cmd.Parameters.AddWithValue("@Line24SC", Line24SC);
        cmd.Parameters.AddWithValue("@Line24Unit", Line24Unit);
        cmd.Parameters.AddWithValue("@Line24LaborRate", Line24LaborRate);
        cmd.Parameters.AddWithValue("@Line24THW", Line24THW);
        cmd.Parameters.AddWithValue("@Line24TMC", Line24TMC);
        cmd.Parameters.AddWithValue("@Line24CostPerUnit", Line24CostPerUnit);
        cmd.Parameters.AddWithValue("@Line25Category", Line25Category);
        cmd.Parameters.AddWithValue("@Line25LIURPCode", Line25LIURPCode);
        cmd.Parameters.AddWithValue("@Line25MeasureDescription", Line25MeasureDescription);
        cmd.Parameters.AddWithValue("@Line25SC", Line25SC);
        cmd.Parameters.AddWithValue("@Line25Unit", Line25Unit);
        cmd.Parameters.AddWithValue("@Line25LaborRate", Line25LaborRate);
        cmd.Parameters.AddWithValue("@Line25THW", Line25THW);
        cmd.Parameters.AddWithValue("@Line25TMC", Line25TMC);
        cmd.Parameters.AddWithValue("@Line25CostPerUnit", Line25CostPerUnit);
        cmd.Parameters.AddWithValue("@Line26Category", Line26Category);
        cmd.Parameters.AddWithValue("@Line26LIURPCode", Line26LIURPCode);
        cmd.Parameters.AddWithValue("@Line26MeasureDescription", Line26MeasureDescription);
        cmd.Parameters.AddWithValue("@Line26SC", Line26SC);
        cmd.Parameters.AddWithValue("@Line26Unit", Line26Unit);
        cmd.Parameters.AddWithValue("@Line26LaborRate", Line26LaborRate);
        cmd.Parameters.AddWithValue("@Line26THW", Line26THW);
        cmd.Parameters.AddWithValue("@Line26TMC", Line26TMC);
        cmd.Parameters.AddWithValue("@Line26CostPerUnit", Line26CostPerUnit);
        cmd.Parameters.AddWithValue("@Line27Category", Line27Category);
        cmd.Parameters.AddWithValue("@Line27LIURPCode", Line27LIURPCode);
        cmd.Parameters.AddWithValue("@Line27MeasureDescription", Line27MeasureDescription);
        cmd.Parameters.AddWithValue("@Line27SC", Line27SC);
        cmd.Parameters.AddWithValue("@Line27Unit", Line27Unit);
        cmd.Parameters.AddWithValue("@Line27LaborRate", Line27LaborRate);
        cmd.Parameters.AddWithValue("@Line27THW", Line27THW);
        cmd.Parameters.AddWithValue("@Line27TMC", Line27TMC);
        cmd.Parameters.AddWithValue("@Line27CostPerUnit", Line27CostPerUnit);
        cmd.Parameters.AddWithValue("@Line28Category", Line28Category);
        cmd.Parameters.AddWithValue("@Line28LIURPCode", Line28LIURPCode);
        cmd.Parameters.AddWithValue("@Line28MeasureDescription", Line28MeasureDescription);
        cmd.Parameters.AddWithValue("@Line28SC", Line28SC);
        cmd.Parameters.AddWithValue("@Line28Unit", Line28Unit);
        cmd.Parameters.AddWithValue("@Line28LaborRate", Line28LaborRate);
        cmd.Parameters.AddWithValue("@Line28THW", Line28THW);
        cmd.Parameters.AddWithValue("@Line28TMC", Line28TMC);
        cmd.Parameters.AddWithValue("@Line28CostPerUnit", Line28CostPerUnit);
        cmd.Parameters.AddWithValue("@Line29Category", Line29Category);
        cmd.Parameters.AddWithValue("@Line29LIURPCode", Line29LIURPCode);
        cmd.Parameters.AddWithValue("@Line29MeasureDescription", Line29MeasureDescription);
        cmd.Parameters.AddWithValue("@Line29SC", Line29SC);
        cmd.Parameters.AddWithValue("@Line29Unit", Line29Unit);
        cmd.Parameters.AddWithValue("@Line29LaborRate", Line29LaborRate);
        cmd.Parameters.AddWithValue("@Line29THW", Line29THW);
        cmd.Parameters.AddWithValue("@Line29TMC", Line29TMC);
        cmd.Parameters.AddWithValue("@Line29CostPerUnit", Line29CostPerUnit);
        cmd.Parameters.AddWithValue("@Line23Category", Line23Category);
        cmd.Parameters.AddWithValue("@Line23LIURPCode", Line23LIURPCode);
        cmd.Parameters.AddWithValue("@Line23MeasureDescription", Line23MeasureDescription);
        cmd.Parameters.AddWithValue("@Line23SC", Line23SC);
        cmd.Parameters.AddWithValue("@Line23Unit", Line23Unit);
        cmd.Parameters.AddWithValue("@Line23LaborRate", Line23LaborRate);
        cmd.Parameters.AddWithValue("@Line23THW", Line23THW);
        cmd.Parameters.AddWithValue("@Line23TMC", Line23TMC);
        cmd.Parameters.AddWithValue("@Line23CostPerUnit", Line23CostPerUnit);
        cmd.Parameters.AddWithValue("@Line38Quantity", Line38Quantity);
        cmd.Parameters.AddWithValue("@Line38Total", Line38Total);
        cmd.Parameters.AddWithValue("@Finalized", Finalized);
        cmd.Parameters.AddWithValue("@Line1Location", Line1Location);
        cmd.Parameters.AddWithValue("@Line2Location", Line2Location);
        cmd.Parameters.AddWithValue("@Line3Location", Line3Location);
        cmd.Parameters.AddWithValue("@Line4Location", Line4Location);
        cmd.Parameters.AddWithValue("@Line5Location", Line5Location);
        cmd.Parameters.AddWithValue("@Line6Location", Line6Location);
        cmd.Parameters.AddWithValue("@Line7Location", Line7Location);
        cmd.Parameters.AddWithValue("@Line8Location", Line8Location);
        cmd.Parameters.AddWithValue("@Line9Location", Line9Location);
        cmd.Parameters.AddWithValue("@Line10Location", Line10Location);
        cmd.Parameters.AddWithValue("@Line11Location", Line11Location);
        cmd.Parameters.AddWithValue("@Line12Location", Line12Location);
        cmd.Parameters.AddWithValue("@Line13Location", Line13Location);
        cmd.Parameters.AddWithValue("@Line14Location", Line14Location);
        cmd.Parameters.AddWithValue("@Line15Location", Line15Location);
        cmd.Parameters.AddWithValue("@Line16Location", Line16Location);
        cmd.Parameters.AddWithValue("@Line17Location", Line17Location);
        cmd.Parameters.AddWithValue("@Line18Location", Line18Location);
        cmd.Parameters.AddWithValue("@Line19Location", Line19Location);
        cmd.Parameters.AddWithValue("@Line20Location", Line20Location);
        cmd.Parameters.AddWithValue("@Line21Location", Line21Location);
        cmd.Parameters.AddWithValue("@Line22Location", Line22Location);
        cmd.Parameters.AddWithValue("@Line23Location", Line23Location);
        cmd.Parameters.AddWithValue("@Line24Location", Line24Location);
        cmd.Parameters.AddWithValue("@Line25Location", Line25Location);
        cmd.Parameters.AddWithValue("@Line26Location", Line26Location);
        cmd.Parameters.AddWithValue("@Line27Location", Line27Location);
        cmd.Parameters.AddWithValue("@Line28Location", Line28Location);
        cmd.Parameters.AddWithValue("@Line29Location", Line29Location);
        cmd.Parameters.AddWithValue("@Line30Location", Line30Location);
        cmd.Parameters.AddWithValue("@Line31Location", Line31Location);
        cmd.Parameters.AddWithValue("@Line32Location", Line32Location);
        cmd.Parameters.AddWithValue("@Line33Location", Line33Location);
        cmd.Parameters.AddWithValue("@Line34Location", Line34Location);
        cmd.Parameters.AddWithValue("@Line35Location", Line35Location);
        cmd.Parameters.AddWithValue("@Line36Location", Line36Location);
        cmd.Parameters.AddWithValue("@Line37Location", Line37Location);
        cmd.Parameters.AddWithValue("@Line38Location", Line38Location);

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


public DataTable GetPPLAudit_Invoice_4(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLInvoicePage4";
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


#region PPLAudit Invoice 5
public int UpdatePPLAudit_Invoice_5(string JobNumber, string Line1Quantity, string Line2Quantity, string Line3Quantity, string Line4Quantity, string Line5Quantity, string Line6Quantity, string Line7Quantity, string Line8Quantity, string Line9Quantity, string Line10Quantity, string Line11Quantity, string Line12Quantity, string Line13Quantity, string Line14Quantity, string Line15Quantity, string Line16Quantity, string Line17Quantity, string Line18Quantity, string Line19Quantity, string Line20Quantity, string Line21Quantity, string Line22Quantity, string Line23Quantity, string Line24Quantity, string Line25Quantity, string Line26Quantity, string Line27Quantity, string Line28Quantity, string Line29Quantity, string Line30Quantity, string Line31Quantity, string Line32Quantity, string Line33Quantity, string Line34Quantity, string Line35Quantity, string Line36Quantity, string Line37Quantity, string Line1Total, string Line2Total, string Line3Total, string Line4Total, string Line5Total, string Line6Total, string Line7Total, string Line8Total, string Line9Total, string Line10Total, string Line11Total, string Line12Total, string Line13Total, string Line14Total, string Line15Total, string Line16Total, string Line17Total, string Line18Total, string Line19Total, string Line20Total, string Line21Total, string Line22Total, string Line23Total, string Line24Total, string Line25Total, string Line26Total, string Line27Total, string Line28Total, string Line29Total, string Line30Total, string Line31Total, string Line32Total, string Line33Total, string Line34Total, string Line35Total, string Line36Total, string Line37Total, string Line12Category, string Line12LIURPCode, string Line12MeasureDescription, string Line12SC, string Line12Unit, string Line12LaborRate, string Line12THW, string Line12TMC, string Line12CostPerUnit, string Line13Category, string Line13LIURPCode, string Line13MeasureDescription, string Line13SC, string Line13Unit, string Line13LaborRate, string Line13THW, string Line13TMC, string Line13CostPerUnit, string Line16Category, string Line16LIURPCode, string Line16MeasureDescription, string Line16SC, string Line16Unit, string Line16LaborRate, string Line16THW, string Line16TMC, string Line16CostPerUnit, string Line17Category, string Line17LIURPCode, string Line17MeasureDescription, string Line17SC, string Line17Unit, string Line17LaborRate, string Line17THW, string Line17TMC, string Line17CostPerUnit, string Line18Category, string Line18LIURPCode, string Line18MeasureDescription, string Line18SC, string Line18Unit, string Line18LaborRate, string Line18THW, string Line18TMC, string Line18CostPerUnit, string Line19Category, string Line19LIURPCode, string Line19MeasureDescription, string Line19SC, string Line19Unit, string Line19LaborRate, string Line19THW, string Line19TMC, string Line19CostPerUnit, string Line20Category, string Line20LIURPCode, string Line20MeasureDescription, string Line20SC, string Line20Unit, string Line20LaborRate, string Line20THW, string Line20TMC, string Line20CostPerUnit, string ContractorLine1Type, string ContractorLine1Name, string ContractorLine1CallDate, string ContractorLine1Comments, string ContractorLine2Type, string ContractorLine2Name, string ContractorLine2CallDate, string ContractorLine2Comments, string ContractorLine3Type, string ContractorLine3Name, string ContractorLine3CallDate, string ContractorLine3Comments, string ContractorLine4Type, string ContractorLine4Name, string ContractorLine4CallDate, string ContractorLine4Comments, string DateInvoiceSubmitted, string DateWorkCompleted, string SignatureofContractor, string Finalized, string Line1Location, string Line2Location, string Line3Location, string Line4Location, string Line5Location, string Line6Location, string Line7Location, string Line8Location, string Line9Location, string Line10Location, string Line11Location, string Line12Location, string Line13Location, string Line14Location, string Line15Location, string Line16Location, string Line17Location, string Line18Location, string Line19Location, string Line20Location)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLInvoicePage5";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@Line1Quantity", Line1Quantity);
        cmd.Parameters.AddWithValue("@Line2Quantity", Line2Quantity);
        cmd.Parameters.AddWithValue("@Line3Quantity", Line3Quantity);
        cmd.Parameters.AddWithValue("@Line4Quantity", Line4Quantity);
        cmd.Parameters.AddWithValue("@Line5Quantity", Line5Quantity);
        cmd.Parameters.AddWithValue("@Line6Quantity", Line6Quantity);
        cmd.Parameters.AddWithValue("@Line7Quantity", Line7Quantity);
        cmd.Parameters.AddWithValue("@Line8Quantity", Line8Quantity);
        cmd.Parameters.AddWithValue("@Line9Quantity", Line9Quantity);
        cmd.Parameters.AddWithValue("@Line10Quantity", Line10Quantity);
        cmd.Parameters.AddWithValue("@Line11Quantity", Line11Quantity);
        cmd.Parameters.AddWithValue("@Line12Quantity", Line12Quantity);
        cmd.Parameters.AddWithValue("@Line13Quantity", Line13Quantity);
        cmd.Parameters.AddWithValue("@Line14Quantity", Line14Quantity);
        cmd.Parameters.AddWithValue("@Line15Quantity", Line15Quantity);
        cmd.Parameters.AddWithValue("@Line16Quantity", Line16Quantity);
        cmd.Parameters.AddWithValue("@Line17Quantity", Line17Quantity);
        cmd.Parameters.AddWithValue("@Line18Quantity", Line18Quantity);
        cmd.Parameters.AddWithValue("@Line19Quantity", Line19Quantity);
        cmd.Parameters.AddWithValue("@Line20Quantity", Line20Quantity);
        cmd.Parameters.AddWithValue("@Line21Quantity", Line21Quantity);
        cmd.Parameters.AddWithValue("@Line22Quantity", Line22Quantity);
        cmd.Parameters.AddWithValue("@Line23Quantity", Line23Quantity);
        cmd.Parameters.AddWithValue("@Line24Quantity", Line24Quantity);
        cmd.Parameters.AddWithValue("@Line25Quantity", Line25Quantity);
        cmd.Parameters.AddWithValue("@Line26Quantity", Line26Quantity);
        cmd.Parameters.AddWithValue("@Line27Quantity", Line27Quantity);
        cmd.Parameters.AddWithValue("@Line28Quantity", Line28Quantity);
        cmd.Parameters.AddWithValue("@Line29Quantity", Line29Quantity);
        cmd.Parameters.AddWithValue("@Line30Quantity", Line30Quantity);
        cmd.Parameters.AddWithValue("@Line31Quantity", Line31Quantity);
        cmd.Parameters.AddWithValue("@Line32Quantity", Line32Quantity);
        cmd.Parameters.AddWithValue("@Line33Quantity", Line33Quantity);
        cmd.Parameters.AddWithValue("@Line34Quantity", Line34Quantity);
        cmd.Parameters.AddWithValue("@Line35Quantity", Line35Quantity);
        cmd.Parameters.AddWithValue("@Line36Quantity", Line36Quantity);
        cmd.Parameters.AddWithValue("@Line37Quantity", Line37Quantity);
        cmd.Parameters.AddWithValue("@Line1Total", Line1Total);
        cmd.Parameters.AddWithValue("@Line2Total", Line2Total);
        cmd.Parameters.AddWithValue("@Line3Total", Line3Total);
        cmd.Parameters.AddWithValue("@Line4Total", Line4Total);
        cmd.Parameters.AddWithValue("@Line5Total", Line5Total);
        cmd.Parameters.AddWithValue("@Line6Total", Line6Total);
        cmd.Parameters.AddWithValue("@Line7Total", Line7Total);
        cmd.Parameters.AddWithValue("@Line8Total", Line8Total);
        cmd.Parameters.AddWithValue("@Line9Total", Line9Total);
        cmd.Parameters.AddWithValue("@Line10Total", Line10Total);
        cmd.Parameters.AddWithValue("@Line11Total", Line11Total);
        cmd.Parameters.AddWithValue("@Line12Total", Line12Total);
        cmd.Parameters.AddWithValue("@Line13Total", Line13Total);
        cmd.Parameters.AddWithValue("@Line14Total", Line14Total);
        cmd.Parameters.AddWithValue("@Line15Total", Line15Total);
        cmd.Parameters.AddWithValue("@Line16Total", Line16Total);
        cmd.Parameters.AddWithValue("@Line17Total", Line17Total);
        cmd.Parameters.AddWithValue("@Line18Total", Line18Total);
        cmd.Parameters.AddWithValue("@Line19Total", Line19Total);
        cmd.Parameters.AddWithValue("@Line20Total", Line20Total);
        cmd.Parameters.AddWithValue("@Line21Total", Line21Total);
        cmd.Parameters.AddWithValue("@Line22Total", Line22Total);
        cmd.Parameters.AddWithValue("@Line23Total", Line23Total);
        cmd.Parameters.AddWithValue("@Line24Total", Line24Total);
        cmd.Parameters.AddWithValue("@Line25Total", Line25Total);
        cmd.Parameters.AddWithValue("@Line26Total", Line26Total);
        cmd.Parameters.AddWithValue("@Line27Total", Line27Total);
        cmd.Parameters.AddWithValue("@Line28Total", Line28Total);
        cmd.Parameters.AddWithValue("@Line29Total", Line29Total);
        cmd.Parameters.AddWithValue("@Line30Total", Line30Total);
        cmd.Parameters.AddWithValue("@Line31Total", Line31Total);
        cmd.Parameters.AddWithValue("@Line32Total", Line32Total);
        cmd.Parameters.AddWithValue("@Line33Total", Line33Total);
        cmd.Parameters.AddWithValue("@Line34Total", Line34Total);
        cmd.Parameters.AddWithValue("@Line35Total", Line35Total);
        cmd.Parameters.AddWithValue("@Line36Total", Line36Total);
        cmd.Parameters.AddWithValue("@Line37Total", Line37Total);
        cmd.Parameters.AddWithValue("@Line12Category", Line12Category);
        cmd.Parameters.AddWithValue("@Line12LIURPCode", Line12LIURPCode);
        cmd.Parameters.AddWithValue("@Line12MeasureDescription", Line12MeasureDescription);
        cmd.Parameters.AddWithValue("@Line12SC", Line12SC);
        cmd.Parameters.AddWithValue("@Line12Unit", Line12Unit);
        cmd.Parameters.AddWithValue("@Line12LaborRate", Line12LaborRate);
        cmd.Parameters.AddWithValue("@Line12THW", Line12THW);
        cmd.Parameters.AddWithValue("@Line12TMC", Line12TMC);
        cmd.Parameters.AddWithValue("@Line12CostPerUnit", Line12CostPerUnit);
        cmd.Parameters.AddWithValue("@Line13Category", Line13Category);
        cmd.Parameters.AddWithValue("@Line13LIURPCode", Line13LIURPCode);
        cmd.Parameters.AddWithValue("@Line13MeasureDescription", Line13MeasureDescription);
        cmd.Parameters.AddWithValue("@Line13SC", Line13SC);
        cmd.Parameters.AddWithValue("@Line13Unit", Line13Unit);
        cmd.Parameters.AddWithValue("@Line13LaborRate", Line13LaborRate);
        cmd.Parameters.AddWithValue("@Line13THW", Line13THW);
        cmd.Parameters.AddWithValue("@Line13TMC", Line13TMC);
        cmd.Parameters.AddWithValue("@Line13CostPerUnit", Line13CostPerUnit);
        cmd.Parameters.AddWithValue("@Line16Category", Line16Category);
        cmd.Parameters.AddWithValue("@Line16LIURPCode", Line16LIURPCode);
        cmd.Parameters.AddWithValue("@Line16MeasureDescription", Line16MeasureDescription);
        cmd.Parameters.AddWithValue("@Line16SC", Line16SC);
        cmd.Parameters.AddWithValue("@Line16Unit", Line16Unit);
        cmd.Parameters.AddWithValue("@Line16LaborRate", Line16LaborRate);
        cmd.Parameters.AddWithValue("@Line16THW", Line16THW);
        cmd.Parameters.AddWithValue("@Line16TMC", Line16TMC);
        cmd.Parameters.AddWithValue("@Line16CostPerUnit", Line16CostPerUnit);
        cmd.Parameters.AddWithValue("@Line17Category", Line17Category);
        cmd.Parameters.AddWithValue("@Line17LIURPCode", Line17LIURPCode);
        cmd.Parameters.AddWithValue("@Line17MeasureDescription", Line17MeasureDescription);
        cmd.Parameters.AddWithValue("@Line17SC", Line17SC);
        cmd.Parameters.AddWithValue("@Line17Unit", Line17Unit);
        cmd.Parameters.AddWithValue("@Line17LaborRate", Line17LaborRate);
        cmd.Parameters.AddWithValue("@Line17THW", Line17THW);
        cmd.Parameters.AddWithValue("@Line17TMC", Line17TMC);
        cmd.Parameters.AddWithValue("@Line17CostPerUnit", Line17CostPerUnit);
        cmd.Parameters.AddWithValue("@Line18Category", Line18Category);
        cmd.Parameters.AddWithValue("@Line18LIURPCode", Line18LIURPCode);
        cmd.Parameters.AddWithValue("@Line18MeasureDescription", Line18MeasureDescription);
        cmd.Parameters.AddWithValue("@Line18SC", Line18SC);
        cmd.Parameters.AddWithValue("@Line18Unit", Line18Unit);
        cmd.Parameters.AddWithValue("@Line18LaborRate", Line18LaborRate);
        cmd.Parameters.AddWithValue("@Line18THW", Line18THW);
        cmd.Parameters.AddWithValue("@Line18TMC", Line18TMC);
        cmd.Parameters.AddWithValue("@Line18CostPerUnit", Line18CostPerUnit);
        cmd.Parameters.AddWithValue("@Line19Category", Line19Category);
        cmd.Parameters.AddWithValue("@Line19LIURPCode", Line19LIURPCode);
        cmd.Parameters.AddWithValue("@Line19MeasureDescription", Line19MeasureDescription);
        cmd.Parameters.AddWithValue("@Line19SC", Line19SC);
        cmd.Parameters.AddWithValue("@Line19Unit", Line19Unit);
        cmd.Parameters.AddWithValue("@Line19LaborRate", Line19LaborRate);
        cmd.Parameters.AddWithValue("@Line19THW", Line19THW);
        cmd.Parameters.AddWithValue("@Line19TMC", Line19TMC);
        cmd.Parameters.AddWithValue("@Line19CostPerUnit", Line19CostPerUnit);
        cmd.Parameters.AddWithValue("@Line20Category", Line20Category);
        cmd.Parameters.AddWithValue("@Line20LIURPCode", Line20LIURPCode);
        cmd.Parameters.AddWithValue("@Line20MeasureDescription", Line20MeasureDescription);
        cmd.Parameters.AddWithValue("@Line20SC", Line20SC);
        cmd.Parameters.AddWithValue("@Line20Unit", Line20Unit);
        cmd.Parameters.AddWithValue("@Line20LaborRate", Line20LaborRate);
        cmd.Parameters.AddWithValue("@Line20THW", Line20THW);
        cmd.Parameters.AddWithValue("@Line20TMC", Line20TMC);
        cmd.Parameters.AddWithValue("@Line20CostPerUnit", Line20CostPerUnit);
        cmd.Parameters.AddWithValue("@ContractorLine1Type", ContractorLine1Type);
        cmd.Parameters.AddWithValue("@ContractorLine1Name", ContractorLine1Name);
        cmd.Parameters.AddWithValue("@ContractorLine1CallDate", ContractorLine1CallDate);
        cmd.Parameters.AddWithValue("@ContractorLine1Comments", ContractorLine1Comments);
        cmd.Parameters.AddWithValue("@ContractorLine2Type", ContractorLine2Type);
        cmd.Parameters.AddWithValue("@ContractorLine2Name", ContractorLine2Name);
        cmd.Parameters.AddWithValue("@ContractorLine2CallDate", ContractorLine2CallDate);
        cmd.Parameters.AddWithValue("@ContractorLine2Comments", ContractorLine2Comments);
        cmd.Parameters.AddWithValue("@ContractorLine3Type", ContractorLine3Type);
        cmd.Parameters.AddWithValue("@ContractorLine3Name", ContractorLine3Name);
        cmd.Parameters.AddWithValue("@ContractorLine3CallDate", ContractorLine3CallDate);
        cmd.Parameters.AddWithValue("@ContractorLine3Comments", ContractorLine3Comments);
        cmd.Parameters.AddWithValue("@ContractorLine4Type", ContractorLine4Type);
        cmd.Parameters.AddWithValue("@ContractorLine4Name", ContractorLine4Name);
        cmd.Parameters.AddWithValue("@ContractorLine4CallDate", ContractorLine4CallDate);
        cmd.Parameters.AddWithValue("@ContractorLine4Comments", ContractorLine4Comments);
        cmd.Parameters.AddWithValue("@DateInvoiceSubmitted", DateInvoiceSubmitted);
        cmd.Parameters.AddWithValue("@DateWorkCompleted", DateWorkCompleted);
        cmd.Parameters.AddWithValue("@SignatureofContractor", SignatureofContractor);
        cmd.Parameters.AddWithValue("@Finalized", Finalized);
        cmd.Parameters.AddWithValue("@Line1Location", Line1Location);
        cmd.Parameters.AddWithValue("@Line2Location", Line2Location);
        cmd.Parameters.AddWithValue("@Line3Location", Line3Location);
        cmd.Parameters.AddWithValue("@Line4Location", Line4Location);
        cmd.Parameters.AddWithValue("@Line5Location", Line5Location);
        cmd.Parameters.AddWithValue("@Line6Location", Line6Location);
        cmd.Parameters.AddWithValue("@Line7Location", Line7Location);
        cmd.Parameters.AddWithValue("@Line8Location", Line8Location);
        cmd.Parameters.AddWithValue("@Line9Location", Line9Location);
        cmd.Parameters.AddWithValue("@Line10Location", Line10Location);
        cmd.Parameters.AddWithValue("@Line11Location", Line11Location);
        cmd.Parameters.AddWithValue("@Line12Location", Line12Location);
        cmd.Parameters.AddWithValue("@Line13Location", Line13Location);
        cmd.Parameters.AddWithValue("@Line14Location", Line14Location);
        cmd.Parameters.AddWithValue("@Line15Location", Line15Location);
        cmd.Parameters.AddWithValue("@Line16Location", Line16Location);
        cmd.Parameters.AddWithValue("@Line17Location", Line17Location);
        cmd.Parameters.AddWithValue("@Line18Location", Line18Location);
        cmd.Parameters.AddWithValue("@Line19Location", Line19Location);
        cmd.Parameters.AddWithValue("@Line20Location", Line20Location);

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


public DataTable GetPPLAudit_Invoice_5(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLInvoicePage5";
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




#region "Photo Page"


public int InsertPPL_PhotoPage(string JobNumber, string PhotoName, string PhotoTitle, string PhotoDescription1, string PhotoDescription2, string PhotoDescription3, string CreatedDate, int PhotoOrderNo, string Job_Type)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "InsertPPLPhotoPage_Change";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@PhotoName", PhotoName);
        cmd.Parameters.AddWithValue("@PhotoTitle", PhotoTitle);
        cmd.Parameters.AddWithValue("@PhotoDescription1", PhotoDescription1);
        cmd.Parameters.AddWithValue("@PhotoDescription2", PhotoDescription2);
        cmd.Parameters.AddWithValue("@PhotoDescription3", PhotoDescription3);
        cmd.Parameters.AddWithValue("@CreatedDate", CreatedDate);
        cmd.Parameters.AddWithValue("@PhotoOrderNo", PhotoOrderNo);
        cmd.Parameters.AddWithValue("@Job_Type", Job_Type);

        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();
    }
    catch (Exception ex)
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

public int UpdatePPL_PhotoPage(int ID, string JobNumber, string PhotoName, string PhotoTitle, string PhotoDescription1, string PhotoDescription2, string PhotoDescription3, int PhotoOrderNo, string ImageFor)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLPhotoPage_Change";

        cmd.Parameters.AddWithValue("@ID", ID);
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@PhotoName", PhotoName);
        cmd.Parameters.AddWithValue("@PhotoTitle", PhotoTitle);
        cmd.Parameters.AddWithValue("@PhotoDescription1", PhotoDescription1);
        cmd.Parameters.AddWithValue("@PhotoDescription2", PhotoDescription2);
        cmd.Parameters.AddWithValue("@PhotoDescription3", PhotoDescription3);
        cmd.Parameters.AddWithValue("@PhotoOrderNo", PhotoOrderNo);
        cmd.Parameters.AddWithValue("@ImageFor", ImageFor);

            con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();
    }
    catch (Exception ex)
    {

    }
    finally
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }

    //return i;
    return 1;
}


public DataTable GetPPL_PhotoPage(string JobNumber, string Job_Type)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPhotoPage_Change";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@Job_Type", Job_Type);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
    }
    catch (Exception ex)
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



public int DeletePPL_PhotoPage(int ID)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "DeletePPLPhotoPage_Change";
        cmd.Parameters.AddWithValue("@ID", ID);
        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();
    }
    catch (Exception ex)
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
#endregion

#region "Photo Page PPL_Audit"
public DataTable SelectPPLPhotoPageTop24_Change(string JobNum)
{
    DataTable dt = new DataTable(JobNum);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLPhotoPageTop24_Change";
        cmd.Parameters.AddWithValue("@Jobnumber", JobNum);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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


#region "Insert Questionaire"
public void insert_Questionaire(string JobNumber, string TypeOfHome, string ApartmentFloor, string IsThereAnAttic, string AtticAccessComments, string IsTheAtticInsulated, string FlatOrSlopedCeilings, string AnyExhaustFansInBathroom, string AnyExhaustFansInBathroomComments, string IsHomeBuiltOnConcreteSlab, string DoYouHaveABaseMent, string IsbasementHeated, string CrawlSpace, string AnyHeatersInCrawlSpace, string IsCrawlSpaceHeated, string DoPipesFreezeInWinter, string PipesOrFaucetsLeak, string Faucets1Comments, string Faucets1handles, string Faucets2Comments, string Faucets2handles, string Pipes1Comments, string Pipes2Comments, string DoYouHaveAGarage, string RoomsOverGarage, string RoomsOverGarageComments, string ColdRoomsOverGarage, string IsGarageConnectedToHome, string MainTypeOfHeating, string TypeOfHeatingUnit, string ThermostatLocation, string DoYouUseElectricSpaceHeaters, string AmountOfElectricSpaceHeaters, string DoAllHeatersWorkProperly, string HeatProblemsComments, string DoYouUseAirConditioningUnits, string NumberOfAirConditioningUnits, string WindowOrWallUnits, string ColorOfAirConditioners, string HotWaterHeaterLocation, string AgeOfHotWaterHeater, string DoesHotWaterHeaterLeak, string DoesHotWaterHeaterLeakComments, string IsHotWaterHeaterRusty, string IsHotWaterHeaterRustyComments, string NumGallonsHotWaterHeater, string DoYouUseChestFreezer, string AgeFridge1, string AgeFridge2, string AgeFreezer1, string DoYouUseAWasher, string AgeWasher, string AgeWasherComments, string DoYouUseADryer, string AgeDryer, string AgeDryerComments, string WasherLoadsPerWeek, string TimeToDryOneLoad, string AllOtherComments, string NumRefrigeratorsInHome, string LineAComments, string LineBComments, string LineCComments, string LineDComments, string LineEComments, string LineFComments, string LineGComments, string LineHComments, string LineIComments, string LineJComments, string LineKComments, string LineLComments, string LineMComments, string LineNComments, string LineOComments, string LinePComments, string LineQComments, string LineRComments, string LineSComments, string LineTComments, string ApartmentFloorAbove, string ApartmentFloorBelow, string ApartmentFloorAboveOrBelowComments, string StairwayAccess, string HatchNoPDS, string HatchWithPDS, string IsbasementInsulated, string IsBasementInsulatedComments, string HeatingComments, string DoYouUseCombustibleAppliances, string CombustibleAppliancesComments, string DoYouUseCombustible2Appliances, string Combustible2AppliancesComments, string DoYouUseCombustible3Appliances, string Combustible3AppliancesComments)
{
    try
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLCustomerQuestionaire";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@TypeOfHome", TypeOfHome);
        cmd.Parameters.AddWithValue("@ApartmentFloor", ApartmentFloor);
        cmd.Parameters.AddWithValue("@IsThereAnAttic", IsThereAnAttic);
        cmd.Parameters.AddWithValue("@AtticAccessComments", AtticAccessComments);
        cmd.Parameters.AddWithValue("@IsTheAtticInsulated", IsTheAtticInsulated);
        cmd.Parameters.AddWithValue("@FlatOrSlopedCeilings", FlatOrSlopedCeilings);
        cmd.Parameters.AddWithValue("@AnyExhaustFansInBathroom", AnyExhaustFansInBathroom);
        cmd.Parameters.AddWithValue("@AnyExhaustFansInBathroomComments", AnyExhaustFansInBathroomComments);
        cmd.Parameters.AddWithValue("@IsHomeBuiltOnConcreteSlab", IsHomeBuiltOnConcreteSlab);
        cmd.Parameters.AddWithValue("@DoYouHaveABaseMent", DoYouHaveABaseMent);
        cmd.Parameters.AddWithValue("@IsbasementHeated", IsbasementHeated);
        cmd.Parameters.AddWithValue("@CrawlSpace", CrawlSpace);
        cmd.Parameters.AddWithValue("@AnyHeatersInCrawlSpace", AnyHeatersInCrawlSpace);
        cmd.Parameters.AddWithValue("@IsCrawlSpaceHeated", IsCrawlSpaceHeated);
        cmd.Parameters.AddWithValue("@DoPipesFreezeInWinter", DoPipesFreezeInWinter);
        cmd.Parameters.AddWithValue("@PipesOrFaucetsLeak", PipesOrFaucetsLeak);
        cmd.Parameters.AddWithValue("@Faucets1Comments", Faucets1Comments);
        cmd.Parameters.AddWithValue("@Faucets1handles", Faucets1handles);
        cmd.Parameters.AddWithValue("@Faucets2Comments", Faucets2Comments);
        cmd.Parameters.AddWithValue("@Faucets2handles", Faucets2handles);
        cmd.Parameters.AddWithValue("@Pipes1Comments", Pipes1Comments);
        cmd.Parameters.AddWithValue("@Pipes2Comments", Pipes2Comments);
        cmd.Parameters.AddWithValue("@DoYouHaveAGarage", DoYouHaveAGarage);
        cmd.Parameters.AddWithValue("@RoomsOverGarage", RoomsOverGarage);
        cmd.Parameters.AddWithValue("@RoomsOverGarageComments", RoomsOverGarageComments);
        cmd.Parameters.AddWithValue("@ColdRoomsOverGarage", ColdRoomsOverGarage);
        cmd.Parameters.AddWithValue("@IsGarageConnectedToHome", IsGarageConnectedToHome);
        cmd.Parameters.AddWithValue("@MainTypeOfHeating", MainTypeOfHeating);
        cmd.Parameters.AddWithValue("@TypeOfHeatingUnit", TypeOfHeatingUnit);
        cmd.Parameters.AddWithValue("@ThermostatLocation", ThermostatLocation);
        cmd.Parameters.AddWithValue("@DoYouUseElectricSpaceHeaters", DoYouUseElectricSpaceHeaters);
        cmd.Parameters.AddWithValue("@AmountOfElectricSpaceHeaters", AmountOfElectricSpaceHeaters);
        cmd.Parameters.AddWithValue("@DoAllHeatersWorkProperly", DoAllHeatersWorkProperly);
        cmd.Parameters.AddWithValue("@HeatProblemsComments", HeatProblemsComments);
        cmd.Parameters.AddWithValue("@DoYouUseAirConditioningUnits", DoYouUseAirConditioningUnits);
        cmd.Parameters.AddWithValue("@NumberOfAirConditioningUnits", NumberOfAirConditioningUnits);
        cmd.Parameters.AddWithValue("@WindowOrWallUnits", WindowOrWallUnits);
        cmd.Parameters.AddWithValue("@ColorOfAirConditioners", ColorOfAirConditioners);
        cmd.Parameters.AddWithValue("@HotWaterHeaterLocation", HotWaterHeaterLocation);
        cmd.Parameters.AddWithValue("@AgeOfHotWaterHeater", AgeOfHotWaterHeater);
        cmd.Parameters.AddWithValue("@DoesHotWaterHeaterLeak", DoesHotWaterHeaterLeak);
        cmd.Parameters.AddWithValue("@DoesHotWaterHeaterLeakComments", DoesHotWaterHeaterLeakComments);
        cmd.Parameters.AddWithValue("@IsHotWaterHeaterRusty", IsHotWaterHeaterRusty);
        cmd.Parameters.AddWithValue("@IsHotWaterHeaterRustyComments", IsHotWaterHeaterRustyComments);
        cmd.Parameters.AddWithValue("@NumGallonsHotWaterHeater", NumGallonsHotWaterHeater);
        cmd.Parameters.AddWithValue("@DoYouUseChestFreezer", DoYouUseChestFreezer);
        cmd.Parameters.AddWithValue("@AgeFridge1", AgeFridge1);
        cmd.Parameters.AddWithValue("@AgeFridge2", AgeFridge2);
        cmd.Parameters.AddWithValue("@AgeFreezer1", AgeFreezer1);
        cmd.Parameters.AddWithValue("@DoYouUseAWasher", DoYouUseAWasher);
        cmd.Parameters.AddWithValue("@AgeWasher", AgeWasher);
        cmd.Parameters.AddWithValue("@AgeWasherComments", AgeWasherComments);
        cmd.Parameters.AddWithValue("@DoYouUseADryer", DoYouUseADryer);
        cmd.Parameters.AddWithValue("@AgeDryer", AgeDryer);
        cmd.Parameters.AddWithValue("@AgeDryerComments", AgeDryerComments);
        cmd.Parameters.AddWithValue("@WasherLoadsPerWeek", WasherLoadsPerWeek);
        cmd.Parameters.AddWithValue("@TimeToDryOneLoad", TimeToDryOneLoad);
        cmd.Parameters.AddWithValue("@AllOtherComments", AllOtherComments);
        cmd.Parameters.AddWithValue("@NumRefrigeratorsInHome", NumRefrigeratorsInHome);
        cmd.Parameters.AddWithValue("@LineAComments", LineAComments);
        cmd.Parameters.AddWithValue("@LineBComments", LineBComments);
        cmd.Parameters.AddWithValue("@LineCComments", LineCComments);
        cmd.Parameters.AddWithValue("@LineDComments", LineDComments);
        cmd.Parameters.AddWithValue("@LineEComments", LineEComments);
        cmd.Parameters.AddWithValue("@LineFComments", LineFComments);
        cmd.Parameters.AddWithValue("@LineGComments", LineGComments);
        cmd.Parameters.AddWithValue("@LineHComments", LineHComments);
        cmd.Parameters.AddWithValue("@LineIComments", LineIComments);
        cmd.Parameters.AddWithValue("@LineJComments", LineJComments);
        cmd.Parameters.AddWithValue("@LineKComments", LineKComments);
        cmd.Parameters.AddWithValue("@LineLComments", LineLComments);
        cmd.Parameters.AddWithValue("@LineMComments", LineMComments);
        cmd.Parameters.AddWithValue("@LineNComments", LineNComments);
        cmd.Parameters.AddWithValue("@LineOComments", LineOComments);
        cmd.Parameters.AddWithValue("@LinePComments", LinePComments);
        cmd.Parameters.AddWithValue("@LineQComments", LineQComments);
        cmd.Parameters.AddWithValue("@LineRComments", LineRComments);
        cmd.Parameters.AddWithValue("@LineSComments", LineSComments);
        cmd.Parameters.AddWithValue("@LineTComments", LineTComments);
        cmd.Parameters.AddWithValue("@ApartmentFloorAbove", ApartmentFloorAbove);
        cmd.Parameters.AddWithValue("@ApartmentFloorBelow", ApartmentFloorBelow);
        cmd.Parameters.AddWithValue("@ApartmentFloorAboveOrBelowComments", ApartmentFloorAboveOrBelowComments);
        cmd.Parameters.AddWithValue("@StairwayAccess", StairwayAccess);
        cmd.Parameters.AddWithValue("@HatchNoPDS", HatchNoPDS);
        cmd.Parameters.AddWithValue("@HatchWithPDS", HatchWithPDS);
        cmd.Parameters.AddWithValue("@IsbasementInsulated", IsbasementInsulated);
        cmd.Parameters.AddWithValue("@IsBasementInsulatedComments", IsBasementInsulatedComments);
        cmd.Parameters.AddWithValue("@HeatingComments", HeatingComments);
        cmd.Parameters.AddWithValue("@DoYouUseCombustibleAppliances", DoYouUseCombustibleAppliances);
        cmd.Parameters.AddWithValue("@CombustibleAppliancesComments", CombustibleAppliancesComments);
        cmd.Parameters.AddWithValue("@DoYouUseCombustible2Appliances", DoYouUseCombustible2Appliances);
        cmd.Parameters.AddWithValue("@Combustible2AppliancesComments", Combustible2AppliancesComments);
        cmd.Parameters.AddWithValue("@DoYouUseCombustible3Appliances", DoYouUseCombustible3Appliances);
        cmd.Parameters.AddWithValue("@Combustible3AppliancesComments", Combustible3AppliancesComments);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    catch
    {


    }

}


public DataTable GetPPL_Questionaire(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectPPLQuestionairePage1";
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



#region PPLAudit Act129II_Invoice 1
public int UpdatePPLAudit_Act129II_Invoice_1(string JobNumber, string Line1Quantity, string Line2Quantity, string Line3Quantity, string Line4Quantity, string Line5OldQuantity, string Line5Quantity, string Line6Quantity, string Line7Quantity, string Line8Quantity, string Line9Quantity, string Line10Quantity, string Line12Quantity, string Line13Quantity, string Line14Quantity, string Line15Quantity, string Line16Quantity, string Line17Quantity, string Line18Quantity, string Line19Quantity, string Line20Quantity, string Line21Quantity, string Line22Quantity, string Line23Quantity, string Line24Quantity, string Line25Quantity, string Line26Quantity, string Line27Quantity, string Line1Total, string Line2Total, string Line3Total, string Line4Total, string Line5OldTotal, string Line5Total, string Line6Total, string Line7Total, string Line8Total, string Line9Total, string Line10Total, string Line12Total, string Line13Total, string Line14Total, string Line15Total, string Line16Total, string Line17Total, string Line18Total, string Line19Total, string Line20Total, string Line21Total, string Line22Total, string Line23Total, string Line24Total, string Line25Total, string Line26Total, string Line27Total, string Line5OldCategory, string Line5OldLIURPCode, string Line5OldMeasureDescription, string Line5OldSC, string Line5OldUnit, string Line5OldLaborRate, string Line5OldTHW, string Line5OldTMC, string Line5OldCostPerUnit, string Line10Category, string Line10LIURPCode, string Line10MeasureDescription, string Line10SC, string Line10Unit, string Line10LaborRate, string Line10THW, string Line10TMC, string Line10CostPerUnit, string Line17Category, string Line17LIURPCode, string Line17SC, string Line17Unit, string Line17LaborRate, string Line17THW, string Line17TMC, string Line17CostPerUnit, string Line26Category, string Line26LIURPCode, string Line26SC, string Line26Unit, string Line26LaborRate, string Line26THW, string Line26TMC, string Line26CostPerUnit, string Finalized)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAct129II_InvoicePage1";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@Line1Quantity", Line1Quantity);
        cmd.Parameters.AddWithValue("@Line2Quantity", Line2Quantity);
        cmd.Parameters.AddWithValue("@Line3Quantity", Line3Quantity);
        cmd.Parameters.AddWithValue("@Line4Quantity", Line4Quantity);
        cmd.Parameters.AddWithValue("@Line5OldQuantity", Line5OldQuantity);
        cmd.Parameters.AddWithValue("@Line5Quantity", Line5Quantity);
        cmd.Parameters.AddWithValue("@Line6Quantity", Line6Quantity);
        cmd.Parameters.AddWithValue("@Line7Quantity", Line7Quantity);
        cmd.Parameters.AddWithValue("@Line8Quantity", Line8Quantity);
        cmd.Parameters.AddWithValue("@Line9Quantity", Line9Quantity);
        cmd.Parameters.AddWithValue("@Line10Quantity", Line10Quantity);

        cmd.Parameters.AddWithValue("@Line12Quantity", Line12Quantity);
        cmd.Parameters.AddWithValue("@Line13Quantity", Line13Quantity);
        cmd.Parameters.AddWithValue("@Line14Quantity", Line14Quantity);
        cmd.Parameters.AddWithValue("@Line15Quantity", Line15Quantity);
        cmd.Parameters.AddWithValue("@Line16Quantity", Line16Quantity);
        cmd.Parameters.AddWithValue("@Line17Quantity", Line17Quantity);
        cmd.Parameters.AddWithValue("@Line18Quantity", Line18Quantity);
        cmd.Parameters.AddWithValue("@Line19Quantity", Line19Quantity);
        cmd.Parameters.AddWithValue("@Line20Quantity", Line20Quantity);
        cmd.Parameters.AddWithValue("@Line21Quantity", Line21Quantity);
        cmd.Parameters.AddWithValue("@Line22Quantity", Line22Quantity);
        cmd.Parameters.AddWithValue("@Line23Quantity", Line23Quantity);
        cmd.Parameters.AddWithValue("@Line24Quantity", Line24Quantity);
        cmd.Parameters.AddWithValue("@Line25Quantity", Line25Quantity);
        cmd.Parameters.AddWithValue("@Line26Quantity", Line26Quantity);
        cmd.Parameters.AddWithValue("@Line27Quantity", Line27Quantity);


        cmd.Parameters.AddWithValue("@Line1Total", Line1Total);
        cmd.Parameters.AddWithValue("@Line2Total", Line2Total);
        cmd.Parameters.AddWithValue("@Line3Total", Line3Total);
        cmd.Parameters.AddWithValue("@Line4Total", Line4Total);
        cmd.Parameters.AddWithValue("@Line5OLdTotal", Line5OldTotal);
        cmd.Parameters.AddWithValue("@Line5Total", Line5Total);
        cmd.Parameters.AddWithValue("@Line6Total", Line6Total);
        cmd.Parameters.AddWithValue("@Line7Total", Line7Total);
        cmd.Parameters.AddWithValue("@Line8Total", Line8Total);
        cmd.Parameters.AddWithValue("@Line9Total", Line9Total);
        cmd.Parameters.AddWithValue("@Line10Total", Line10Total);

        cmd.Parameters.AddWithValue("@Line12Total", Line12Total);
        cmd.Parameters.AddWithValue("@Line13Total", Line13Total);
        cmd.Parameters.AddWithValue("@Line14Total", Line14Total);
        cmd.Parameters.AddWithValue("@Line15Total", Line15Total);
        cmd.Parameters.AddWithValue("@Line16Total", Line16Total);
        cmd.Parameters.AddWithValue("@Line17Total", Line17Total);
        cmd.Parameters.AddWithValue("@Line18Total", Line18Total);
        cmd.Parameters.AddWithValue("@Line19Total", Line19Total);
        cmd.Parameters.AddWithValue("@Line20Total", Line20Total);
        cmd.Parameters.AddWithValue("@Line21Total", Line21Total);
        cmd.Parameters.AddWithValue("@Line22Total", Line22Total);
        cmd.Parameters.AddWithValue("@Line23Total", Line23Total);
        cmd.Parameters.AddWithValue("@Line24Total", Line24Total);
        cmd.Parameters.AddWithValue("@Line25Total", Line25Total);
        cmd.Parameters.AddWithValue("@Line26Total", Line26Total);
        cmd.Parameters.AddWithValue("@Line27Total", Line27Total);

        cmd.Parameters.AddWithValue("@Finalized", Finalized);

        cmd.Parameters.AddWithValue("@Line5OldCategory", Line5OldCategory);
        cmd.Parameters.AddWithValue("@Line5OldLIURPCode", Line5OldLIURPCode);
        cmd.Parameters.AddWithValue("@Line5OldMeasureDescription", Line5OldMeasureDescription);
        cmd.Parameters.AddWithValue("@Line5OldSC", Line5OldSC);
        cmd.Parameters.AddWithValue("@Line5OldUnit", Line5OldUnit);
        cmd.Parameters.AddWithValue("@Line5OldLaborRate", Line5OldLaborRate);
        cmd.Parameters.AddWithValue("@Line5OldTHW", Line5OldTHW);
        cmd.Parameters.AddWithValue("@Line5OldTMC", Line5OldTMC);
        cmd.Parameters.AddWithValue("@Line5OldCostPerUnit", Line5OldCostPerUnit);


        cmd.Parameters.AddWithValue("@Line10Category", Line10Category);
        cmd.Parameters.AddWithValue("@Line10LIURPCode", Line10LIURPCode);
        cmd.Parameters.AddWithValue("@Line10MeasureDescription", Line10MeasureDescription);
        cmd.Parameters.AddWithValue("@Line10SC", Line10SC);
        cmd.Parameters.AddWithValue("@Line10Unit", Line10Unit);
        cmd.Parameters.AddWithValue("@Line10LaborRate", Line10LaborRate);
        cmd.Parameters.AddWithValue("@Line10THW", Line10THW);
        cmd.Parameters.AddWithValue("@Line10TMC", Line10TMC);
        cmd.Parameters.AddWithValue("@Line10CostPerUnit", Line10CostPerUnit);

        cmd.Parameters.AddWithValue("@Line17Category", Line17Category);
        cmd.Parameters.AddWithValue("@Line17LIURPCode", Line17LIURPCode);

        cmd.Parameters.AddWithValue("@Line17SC", Line17SC);
        cmd.Parameters.AddWithValue("@Line17Unit", Line17Unit);
        cmd.Parameters.AddWithValue("@Line17LaborRate", Line17LaborRate);
        cmd.Parameters.AddWithValue("@Line17THW", Line17THW);
        cmd.Parameters.AddWithValue("@Line17TMC", Line17TMC);
        cmd.Parameters.AddWithValue("@Line17CostPerUnit", Line17CostPerUnit);

        cmd.Parameters.AddWithValue("@Line26Category", Line26Category);
        cmd.Parameters.AddWithValue("@Line26LIURPCode", Line26LIURPCode);

        cmd.Parameters.AddWithValue("@Line26SC", Line26SC);
        cmd.Parameters.AddWithValue("@Line26Unit", Line26Unit);
        cmd.Parameters.AddWithValue("@Line26LaborRate", Line26LaborRate);
        cmd.Parameters.AddWithValue("@Line26THW", Line26THW);
        cmd.Parameters.AddWithValue("@Line26TMC", Line26TMC);
        cmd.Parameters.AddWithValue("@Line26CostPerUnit", Line26CostPerUnit);

        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();
    }
    catch (Exception ex)
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


public DataTable GetPPLAudit_Act129II_Invoice_1(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectAct129_PPLInvoicePage1";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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

#region PPLAudit Act129II_Invoice 2
public int UpdatePPLAudit_Act129II_Invoice_2(string JobNumber, string Line1Quantity, string Line2Quantity, string Line3Quantity, string Line4Quantity, string Line5Quantity, string Line6Quantity, string Line7Quantity, string Line8Quantity, string Line9Quantity, string Line10Quantity, string Line11Quantity, string Line12Quantity, string Line13Quantity, string Line14Quantity, string Line15Quantity, string Line16Quantity, string Line17Quantity, string Line18Quantity, string Line19Quantity, string Line20Quantity, string Line21Quantity, string Line22Quantity, string Line23Quantity, string Line24Quantity, string Line25Quantity, string Line26Quantity, string Line27Quantity, string Line28Quantity, string Line29Quantity, string Line30Quantity, string Line31Quantity, string Line32Quantity, string Line33Quantity, string Line34Quantity, string Line35Quantity, string Line36Quantity, string Line37Quantity, string Line38Quantity, string Line39Quantity, string Line1Total, string Line2Total, string Line3Total, string Line4Total, string Line5Total, string Line6Total, string Line7Total, string Line8Total, string Line9Total, string Line10Total, string Line11Total, string Line12Total, string Line13Total, string Line14Total, string Line15Total, string Line16Total, string Line17Total, string Line18Total, string Line19Total, string Line20Total, string Line21Total, string Line22Total, string Line23Total, string Line24Total, string Line25Total, string Line26Total, string Line27Total, string Line28Total, string Line29Total, string Line30Total, string Line31Total, string Line32Total, string Line33Total, string Line34Total, string Line35Total, string Line36Total, string Line37Total, string Line38Total, string Line39Total, string Line8Category, string Line8LIURPCode, string Line8MeasureDescription, string Line8SC, string Line8Unit, string Line8LaborRate, string Line8THW, string Line8TMC, string Line8CostPerUnit, string Line9Category, string Line9LIURPCode, string Line9MeasureDescription, string Line9SC, string Line9Unit, string Line9LaborRate, string Line9THW, string Line9TMC, string Line9CostPerUnit, string Line10Category, string Line10LIURPCode, string Line10MeasureDescription, string Line10SC, string Line10Unit, string Line10LaborRate, string Line10THW, string Line10TMC, string Line10CostPerUnit, string Line11Category, string Line11LIURPCode, string Line11SC, string Line11Unit, string Line11LaborRate, string Line11THW, string Line11TMC, string Line11CostPerUnit, string Line12Category, string Line12LIURPCode, string Line12SC, string Line12Unit, string Line12LaborRate, string Line12THW, string Line12TMC, string Line12CostPerUnit, string Line15Category, string Line15LIURPCode, string Line15MeasureDescription, string Line15SC, string Line15Unit, string Line15LaborRate, string Line15THW, string Line15TMC, string Line15CostPerUnit, string Line16Category, string Line16LIURPCode, string Line16MeasureDescription, string Line16SC, string Line16Unit, string Line16LaborRate, string Line16THW, string Line16TMC, string Line16CostPerUnit, string Line19Category, string Line19LIURPCode, string Line19MeasureDescription, string Line19SC, string Line19Unit, string Line19LaborRate, string Line19THW, string Line19TMC, string Line19CostPerUnit, string Line20Category, string Line20LIURPCode, string Line20MeasureDescription, string Line20SC, string Line20Unit, string Line20LaborRate, string Line20THW, string Line20TMC, string Line20CostPerUnit, string Line29Category, string Line29LIURPCode, string Line29MeasureDescription, string Line29SC, string Line29Unit, string Line29LaborRate, string Line29THW, string Line29TMC, string Line29CostPerUnit, string Line30Category, string Line30LIURPCode, string Line30MeasureDescription, string Line30SC, string Line30Unit, string Line30LaborRate, string Line30THW, string Line30TMC, string Line30CostPerUnit, string Line34Category, string Line34LIURPCode, string Line34MeasureDescription, string Line34SC, string Line34Unit, string Line34LaborRate, string Line34THW, string Line34TMC, string Line34CostPerUnit, string Line35Category, string Line35LIURPCode, string Line35MeasureDescription, string Line35SC, string Line35Unit, string Line35LaborRate, string Line35THW, string Line35TMC, string Line35CostPerUnit, string Line37Category, string Line37LIURPCode, string Line37MeasureDescription, string Line37SC, string Line37Unit, string Line37LaborRate, string Line37THW, string Line37TMC, string Line37CostPerUnit, string Line38Category, string Line38LIURPCode, string Line38MeasureDescription, string Line38SC, string Line38Unit, string Line38LaborRate, string Line38THW, string Line38TMC, string Line38CostPerUnit, string Line39Category, string Line39LIURPCode, string Line39MeasureDescription, string Line39SC, string Line39Unit, string Line39LaborRate, string Line39THW, string Line39TMC, string Line39CostPerUnit, string Finalized)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAct129II_InvoicePage2";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@Line1Quantity", Line1Quantity);
        cmd.Parameters.AddWithValue("@Line2Quantity", Line2Quantity);
        cmd.Parameters.AddWithValue("@Line3Quantity", Line3Quantity);
        cmd.Parameters.AddWithValue("@Line4Quantity", Line4Quantity);

        cmd.Parameters.AddWithValue("@Line5Quantity", Line5Quantity);
        cmd.Parameters.AddWithValue("@Line6Quantity", Line6Quantity);
        cmd.Parameters.AddWithValue("@Line7Quantity", Line7Quantity);
        cmd.Parameters.AddWithValue("@Line8Quantity", Line8Quantity);
        cmd.Parameters.AddWithValue("@Line9Quantity", Line9Quantity);
        cmd.Parameters.AddWithValue("@Line10Quantity", Line10Quantity);
        cmd.Parameters.AddWithValue("@Line11Quantity", Line11Quantity);

        cmd.Parameters.AddWithValue("@Line12Quantity", Line12Quantity);
        cmd.Parameters.AddWithValue("@Line13Quantity", Line13Quantity);
        cmd.Parameters.AddWithValue("@Line14Quantity", Line14Quantity);
        cmd.Parameters.AddWithValue("@Line15Quantity", Line15Quantity);
        cmd.Parameters.AddWithValue("@Line16Quantity", Line16Quantity);
        cmd.Parameters.AddWithValue("@Line17Quantity", Line17Quantity);
        cmd.Parameters.AddWithValue("@Line18Quantity", Line18Quantity);
        cmd.Parameters.AddWithValue("@Line19Quantity", Line19Quantity);
        cmd.Parameters.AddWithValue("@Line20Quantity", Line20Quantity);
        cmd.Parameters.AddWithValue("@Line21Quantity", Line21Quantity);
        cmd.Parameters.AddWithValue("@Line22Quantity", Line22Quantity);
        cmd.Parameters.AddWithValue("@Line23Quantity", Line23Quantity);
        cmd.Parameters.AddWithValue("@Line24Quantity", Line24Quantity);
        cmd.Parameters.AddWithValue("@Line25Quantity", Line25Quantity);
        cmd.Parameters.AddWithValue("@Line26Quantity", Line26Quantity);
        cmd.Parameters.AddWithValue("@Line27Quantity", Line27Quantity);
        cmd.Parameters.AddWithValue("@Line28Quantity", Line28Quantity);
        cmd.Parameters.AddWithValue("@Line29Quantity", Line29Quantity);
        cmd.Parameters.AddWithValue("@Line30Quantity", Line30Quantity);
        cmd.Parameters.AddWithValue("@Line31Quantity", Line31Quantity);
        cmd.Parameters.AddWithValue("@Line32Quantity", Line32Quantity);
        cmd.Parameters.AddWithValue("@Line33Quantity", Line33Quantity);
        cmd.Parameters.AddWithValue("@Line34Quantity", Line34Quantity);
        cmd.Parameters.AddWithValue("@Line35Quantity", Line35Quantity);
        cmd.Parameters.AddWithValue("@Line36Quantity", Line36Quantity);
        cmd.Parameters.AddWithValue("@Line37Quantity", Line37Quantity);
        cmd.Parameters.AddWithValue("@Line38Quantity", Line38Quantity);
        cmd.Parameters.AddWithValue("@Line39Quantity", Line39Quantity);


        cmd.Parameters.AddWithValue("@Line1Total", Line1Total);
        cmd.Parameters.AddWithValue("@Line2Total", Line2Total);
        cmd.Parameters.AddWithValue("@Line3Total", Line3Total);
        cmd.Parameters.AddWithValue("@Line4Total", Line4Total);

        cmd.Parameters.AddWithValue("@Line5Total", Line5Total);
        cmd.Parameters.AddWithValue("@Line6Total", Line6Total);
        cmd.Parameters.AddWithValue("@Line7Total", Line7Total);
        cmd.Parameters.AddWithValue("@Line8Total", Line8Total);
        cmd.Parameters.AddWithValue("@Line9Total", Line9Total);
        cmd.Parameters.AddWithValue("@Line10Total", Line10Total);
        cmd.Parameters.AddWithValue("@Line11Total", Line11Total);

        cmd.Parameters.AddWithValue("@Line12Total", Line12Total);
        cmd.Parameters.AddWithValue("@Line13Total", Line13Total);
        cmd.Parameters.AddWithValue("@Line14Total", Line14Total);
        cmd.Parameters.AddWithValue("@Line15Total", Line15Total);
        cmd.Parameters.AddWithValue("@Line16Total", Line16Total);
        cmd.Parameters.AddWithValue("@Line17Total", Line17Total);
        cmd.Parameters.AddWithValue("@Line18Total", Line18Total);
        cmd.Parameters.AddWithValue("@Line19Total", Line19Total);
        cmd.Parameters.AddWithValue("@Line20Total", Line20Total);
        cmd.Parameters.AddWithValue("@Line21Total", Line21Total);
        cmd.Parameters.AddWithValue("@Line22Total", Line22Total);
        cmd.Parameters.AddWithValue("@Line23Total", Line23Total);
        cmd.Parameters.AddWithValue("@Line24Total", Line24Total);
        cmd.Parameters.AddWithValue("@Line25Total", Line25Total);
        cmd.Parameters.AddWithValue("@Line26Total", Line26Total);
        cmd.Parameters.AddWithValue("@Line27Total", Line27Total);
        cmd.Parameters.AddWithValue("@Line28Total", Line28Total);
        cmd.Parameters.AddWithValue("@Line29Total", Line29Total);
        cmd.Parameters.AddWithValue("@Line30Total", Line30Total);
        cmd.Parameters.AddWithValue("@Line31Total", Line31Total);
        cmd.Parameters.AddWithValue("@Line32Total", Line32Total);
        cmd.Parameters.AddWithValue("@Line33Total", Line33Total);
        cmd.Parameters.AddWithValue("@Line34Total", Line34Total);
        cmd.Parameters.AddWithValue("@Line35Total", Line35Total);
        cmd.Parameters.AddWithValue("@Line36Total", Line36Total);
        cmd.Parameters.AddWithValue("@Line37Total", Line37Total);
        cmd.Parameters.AddWithValue("@Line38Total", Line38Total);
        cmd.Parameters.AddWithValue("@Line39Total", Line39Total);

        cmd.Parameters.AddWithValue("@Finalized", Finalized);

        cmd.Parameters.AddWithValue("@Line8Category", Line8Category);
        cmd.Parameters.AddWithValue("@Line8LIURPCode", Line8LIURPCode);
        cmd.Parameters.AddWithValue("@Line8MeasureDescription", Line8MeasureDescription);
        cmd.Parameters.AddWithValue("@Line8SC", Line8SC);
        cmd.Parameters.AddWithValue("@Line8Unit", Line8Unit);
        cmd.Parameters.AddWithValue("@Line8LaborRate", Line8LaborRate);
        cmd.Parameters.AddWithValue("@Line8THW", Line8THW);
        cmd.Parameters.AddWithValue("@Line8TMC", Line8TMC);
        cmd.Parameters.AddWithValue("@Line8CostPerUnit", Line8CostPerUnit);

        cmd.Parameters.AddWithValue("@Line9Category", Line9Category);
        cmd.Parameters.AddWithValue("@Line9LIURPCode", Line9LIURPCode);
        cmd.Parameters.AddWithValue("@Line9MeasureDescription", Line9MeasureDescription);
        cmd.Parameters.AddWithValue("@Line9SC", Line9SC);
        cmd.Parameters.AddWithValue("@Line9Unit", Line9Unit);
        cmd.Parameters.AddWithValue("@Line9LaborRate", Line9LaborRate);
        cmd.Parameters.AddWithValue("@Line9THW", Line9THW);
        cmd.Parameters.AddWithValue("@Line9TMC", Line9TMC);
        cmd.Parameters.AddWithValue("@Line9CostPerUnit", Line9CostPerUnit);

        cmd.Parameters.AddWithValue("@Line10Category", Line10Category);
        cmd.Parameters.AddWithValue("@Line10LIURPCode", Line10LIURPCode);
        cmd.Parameters.AddWithValue("@Line10MeasureDescription", Line10MeasureDescription);
        cmd.Parameters.AddWithValue("@Line10SC", Line10SC);
        cmd.Parameters.AddWithValue("@Line10Unit", Line10Unit);
        cmd.Parameters.AddWithValue("@Line10LaborRate", Line10LaborRate);
        cmd.Parameters.AddWithValue("@Line10THW", Line10THW);
        cmd.Parameters.AddWithValue("@Line10TMC", Line10TMC);
        cmd.Parameters.AddWithValue("@Line10CostPerUnit", Line10CostPerUnit);

        cmd.Parameters.AddWithValue("@Line11Category", Line11Category);
        cmd.Parameters.AddWithValue("@Line11LIURPCode", Line11LIURPCode);
        cmd.Parameters.AddWithValue("@Line11MeasureDescription", "");
        cmd.Parameters.AddWithValue("@Line11SC", Line11SC);
        cmd.Parameters.AddWithValue("@Line11Unit", Line11Unit);
        cmd.Parameters.AddWithValue("@Line11LaborRate", Line11LaborRate);
        cmd.Parameters.AddWithValue("@Line11THW", Line11THW);
        cmd.Parameters.AddWithValue("@Line11TMC", Line11TMC);
        cmd.Parameters.AddWithValue("@Line11CostPerUnit", Line11CostPerUnit);

        cmd.Parameters.AddWithValue("@Line12Category", Line12Category);
        cmd.Parameters.AddWithValue("@Line12LIURPCode", Line12LIURPCode);
        cmd.Parameters.AddWithValue("@Line12SC", Line12SC);
        cmd.Parameters.AddWithValue("@Line12MeasureDescription", "");
        cmd.Parameters.AddWithValue("@Line12Unit", Line12Unit);
        cmd.Parameters.AddWithValue("@Line12LaborRate", Line12LaborRate);
        cmd.Parameters.AddWithValue("@Line12THW", Line12THW);
        cmd.Parameters.AddWithValue("@Line12TMC", Line12TMC);
        cmd.Parameters.AddWithValue("@Line12CostPerUnit", Line12CostPerUnit);

        cmd.Parameters.AddWithValue("@Line15Category", Line15Category);
        cmd.Parameters.AddWithValue("@Line15LIURPCode", Line15LIURPCode);
        cmd.Parameters.AddWithValue("@Line15MeasureDescription", Line15MeasureDescription);
        cmd.Parameters.AddWithValue("@Line15SC", Line15SC);
        cmd.Parameters.AddWithValue("@Line15Unit", Line15Unit);
        cmd.Parameters.AddWithValue("@Line15LaborRate", Line15LaborRate);
        cmd.Parameters.AddWithValue("@Line15THW", Line15THW);
        cmd.Parameters.AddWithValue("@Line15TMC", Line15TMC);
        cmd.Parameters.AddWithValue("@Line15CostPerUnit", Line15CostPerUnit);

        cmd.Parameters.AddWithValue("@Line16Category", Line16Category);
        cmd.Parameters.AddWithValue("@Line16LIURPCode", Line16LIURPCode);
        cmd.Parameters.AddWithValue("@Line16MeasureDescription", Line16MeasureDescription);
        cmd.Parameters.AddWithValue("@Line16SC", Line16SC);
        cmd.Parameters.AddWithValue("@Line16Unit", Line16Unit);
        cmd.Parameters.AddWithValue("@Line16LaborRate", Line16LaborRate);
        cmd.Parameters.AddWithValue("@Line16THW", Line16THW);
        cmd.Parameters.AddWithValue("@Line16TMC", Line16TMC);
        cmd.Parameters.AddWithValue("@Line16CostPerUnit", Line16CostPerUnit);

        cmd.Parameters.AddWithValue("@Line19Category", Line19Category);
        cmd.Parameters.AddWithValue("@Line19LIURPCode", Line19LIURPCode);
        cmd.Parameters.AddWithValue("@Line19MeasureDescription", Line19MeasureDescription);
        cmd.Parameters.AddWithValue("@Line19SC", Line19SC);
        cmd.Parameters.AddWithValue("@Line19Unit", Line19Unit);
        cmd.Parameters.AddWithValue("@Line19LaborRate", Line19LaborRate);
        cmd.Parameters.AddWithValue("@Line19THW", Line19THW);
        cmd.Parameters.AddWithValue("@Line19TMC", Line19TMC);
        cmd.Parameters.AddWithValue("@Line19CostPerUnit", Line19CostPerUnit);

        cmd.Parameters.AddWithValue("@Line20Category", Line20Category);
        cmd.Parameters.AddWithValue("@Line20LIURPCode", Line20LIURPCode);
        cmd.Parameters.AddWithValue("@Line20MeasureDescription", Line20MeasureDescription);
        cmd.Parameters.AddWithValue("@Line20SC", Line20SC);
        cmd.Parameters.AddWithValue("@Line20Unit", Line20Unit);
        cmd.Parameters.AddWithValue("@Line20LaborRate", Line20LaborRate);
        cmd.Parameters.AddWithValue("@Line20THW", Line20THW);
        cmd.Parameters.AddWithValue("@Line20TMC", Line20TMC);
        cmd.Parameters.AddWithValue("@Line20CostPerUnit", Line20CostPerUnit);

        cmd.Parameters.AddWithValue("@Line29Category", Line29Category);
        cmd.Parameters.AddWithValue("@Line29LIURPCode", Line29LIURPCode);
        cmd.Parameters.AddWithValue("@Line29MeasureDescription", Line29MeasureDescription);
        cmd.Parameters.AddWithValue("@Line29SC", Line29SC);
        cmd.Parameters.AddWithValue("@Line29Unit", Line29Unit);
        cmd.Parameters.AddWithValue("@Line29LaborRate", Line29LaborRate);
        cmd.Parameters.AddWithValue("@Line29THW", Line29THW);
        cmd.Parameters.AddWithValue("@Line29TMC", Line29TMC);
        cmd.Parameters.AddWithValue("@Line29CostPerUnit", Line29CostPerUnit);

        cmd.Parameters.AddWithValue("@Line30Category", Line30Category);
        cmd.Parameters.AddWithValue("@Line30LIURPCode", Line30LIURPCode);
        cmd.Parameters.AddWithValue("@Line30MeasureDescription", Line30MeasureDescription);
        cmd.Parameters.AddWithValue("@Line30SC", Line30SC);
        cmd.Parameters.AddWithValue("@Line30Unit", Line30Unit);
        cmd.Parameters.AddWithValue("@Line30LaborRate", Line30LaborRate);
        cmd.Parameters.AddWithValue("@Line30THW", Line30THW);
        cmd.Parameters.AddWithValue("@Line30TMC", Line30TMC);
        cmd.Parameters.AddWithValue("@Line30CostPerUnit", Line30CostPerUnit);

        cmd.Parameters.AddWithValue("@Line34Category", Line34Category);
        cmd.Parameters.AddWithValue("@Line34LIURPCode", Line34LIURPCode);
        cmd.Parameters.AddWithValue("@Line34MeasureDescription", Line34MeasureDescription);
        cmd.Parameters.AddWithValue("@Line34SC", Line34SC);
        cmd.Parameters.AddWithValue("@Line34Unit", Line34Unit);
        cmd.Parameters.AddWithValue("@Line34LaborRate", Line34LaborRate);
        cmd.Parameters.AddWithValue("@Line34THW", Line34THW);
        cmd.Parameters.AddWithValue("@Line34TMC", Line34TMC);
        cmd.Parameters.AddWithValue("@Line34CostPerUnit", Line34CostPerUnit);

        cmd.Parameters.AddWithValue("@Line35Category", Line35Category);
        cmd.Parameters.AddWithValue("@Line35LIURPCode", Line35LIURPCode);
        cmd.Parameters.AddWithValue("@Line35MeasureDescription", Line35MeasureDescription);
        cmd.Parameters.AddWithValue("@Line35SC", Line35SC);
        cmd.Parameters.AddWithValue("@Line35Unit", Line35Unit);
        cmd.Parameters.AddWithValue("@Line35LaborRate", Line35LaborRate);
        cmd.Parameters.AddWithValue("@Line35THW", Line35THW);
        cmd.Parameters.AddWithValue("@Line35TMC", Line35TMC);
        cmd.Parameters.AddWithValue("@Line35CostPerUnit", Line35CostPerUnit);

        cmd.Parameters.AddWithValue("@Line37Category", Line37Category);
        cmd.Parameters.AddWithValue("@Line37LIURPCode", Line37LIURPCode);
        cmd.Parameters.AddWithValue("@Line37MeasureDescription", Line37MeasureDescription);
        cmd.Parameters.AddWithValue("@Line37SC", Line37SC);
        cmd.Parameters.AddWithValue("@Line37Unit", Line37Unit);
        cmd.Parameters.AddWithValue("@Line37LaborRate", Line37LaborRate);
        cmd.Parameters.AddWithValue("@Line37THW", Line37THW);
        cmd.Parameters.AddWithValue("@Line37TMC", Line37TMC);
        cmd.Parameters.AddWithValue("@Line37CostPerUnit", Line37CostPerUnit);

        cmd.Parameters.AddWithValue("@Line38Category", Line38Category);
        cmd.Parameters.AddWithValue("@Line38LIURPCode", Line38LIURPCode);
        cmd.Parameters.AddWithValue("@Line38MeasureDescription", Line38MeasureDescription);
        cmd.Parameters.AddWithValue("@Line38SC", Line38SC);
        cmd.Parameters.AddWithValue("@Line38Unit", Line38Unit);
        cmd.Parameters.AddWithValue("@Line38LaborRate", Line38LaborRate);
        cmd.Parameters.AddWithValue("@Line38THW", Line38THW);
        cmd.Parameters.AddWithValue("@Line38TMC", Line38TMC);
        cmd.Parameters.AddWithValue("@Line38CostPerUnit", Line38CostPerUnit);

        cmd.Parameters.AddWithValue("@Line39Category", Line39Category);
        cmd.Parameters.AddWithValue("@Line39LIURPCode", Line39LIURPCode);
        cmd.Parameters.AddWithValue("@Line39MeasureDescription", Line39MeasureDescription);
        cmd.Parameters.AddWithValue("@Line39SC", Line39SC);
        cmd.Parameters.AddWithValue("@Line39Unit", Line39Unit);
        cmd.Parameters.AddWithValue("@Line39LaborRate", Line39LaborRate);
        cmd.Parameters.AddWithValue("@Line39THW", Line39THW);
        cmd.Parameters.AddWithValue("@Line39TMC", Line39TMC);
        cmd.Parameters.AddWithValue("@Line39CostPerUnit", Line39CostPerUnit);

        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();
    }
    catch (Exception ex)
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


public DataTable GetPPLAudit_Act129II_Invoice_2(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectAct129IIPPLInvoicePage2";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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

#region PPLAudit Act129II_Invoice 3
public int UpdatePPLAudit_Act129II_Invoice_3(string JobNumber, string Line1Quantity, string Line2Quantity, string Line3Quantity, string Line4Quantity, string Line5Quantity, string Line6Quantity, string Line7Quantity, string Line8Quantity, string Line9Quantity, string Line10Quantity, string Line11Quantity, string Line18Quantity, string Line19Quantity, string Line20Quantity, string Line1Total, string Line2Total, string Line3Total, string Line4Total, string Line5Total, string Line6Total, string Line7Total, string Line8Total, string Line9Total, string Line10Total, string Line11Total, string Line18Total, string Line19Total, string Line20Total, string Line1Category, string Line1LIURPCode, string Line1MeasureDescription, string Line1SC, string Line1Unit, string Line1LaborRate, string Line1THW, string Line1TMC, string Line1CostPerUnit, string Line2Category, string Line2LIURPCode, string Line2MeasureDescription, string Line2SC, string Line2Unit, string Line2LaborRate, string Line2THW, string Line2TMC, string Line2CostPerUnit, string Line3Category, string Line3LIURPCode, string Line3MeasureDescription, string Line3SC, string Line3Unit, string Line3LaborRate, string Line3THW, string Line3TMC, string Line3CostPerUnit, string Line4Category, string Line4LIURPCode, string Line4MeasureDescription, string Line4SC, string Line4Unit, string Line4LaborRate, string Line4THW, string Line4TMC, string Line4CostPerUnit, string Line5Category, string Line5LIURPCode, string Line5MeasureDescription, string Line5SC, string Line5Unit, string Line5LaborRate, string Line5THW, string Line5TMC, string Line5CostPerUnit, string Line6Category, string Line6LIURPCode, string Line6MeasureDescription, string Line6SC, string Line6Unit, string Line6LaborRate, string Line6THW, string Line6TMC, string Line6CostPerUnit, string Line7Category, string Line7LIURPCode, string Line7MeasureDescription, string Line7SC, string Line7Unit, string Line7LaborRate, string Line7THW, string Line7TMC, string Line7CostPerUnit, string Line8Category, string Line8LIURPCode, string Line8MeasureDescription, string Line8SC, string Line8Unit, string Line8LaborRate, string Line8THW, string Line8TMC, string Line8CostPerUnit, string Line9Category, string Line9LIURPCode, string Line9MeasureDescription, string Line9SC, string Line9Unit, string Line9LaborRate, string Line9THW, string Line9TMC, string Line9CostPerUnit, string Line10Category, string Line10LIURPCode, string Line10MeasureDescription, string Line10SC, string Line10Unit, string Line10LaborRate, string Line10THW, string Line10TMC, string Line10CostPerUnit, string Line11Category, string Line11LIURPCode, string Line11MeasureDescription, string Line11SC, string Line11Unit, string Line11LaborRate, string Line11THW, string Line11TMC, string Line11CostPerUnit, string Line18Category, string Line18LIURPCode, string Line18MeasureDescription, string Line18SC, string Line18Unit, string Line18LaborRate, string Line18THW, string Line18TMC, string Line18CostPerUnit, string Line19Category, string Line19LIURPCode, string Line19MeasureDescription, string Line19SC, string Line19Unit, string Line19LaborRate, string Line19THW, string Line19TMC, string Line19CostPerUnit, string Line20Category, string Line20LIURPCode, string Line20MeasureDescription, string Line20SC, string Line20Unit, string Line20LaborRate, string Line20THW, string Line20TMC, string Line20CostPerUnit, string Finalized, string ContractorLine1Type, string ContractorLine1Name, string ContractorLine1CallDate, string ContractorLine1Comments, string ContractorLine2Type, string ContractorLine2Name, string ContractorLine2CallDate, string ContractorLine2Comments, string ContractorLine3Type, string ContractorLine3Name, string ContractorLine3CallDate, string ContractorLine3Comments, string ContractorLine4Type, string ContractorLine4Name, string ContractorLine4CallDate, string ContractorLine4Comments, string DateInvoiceSubmitted, string DateWorkCompleted, string SignatureofContractor)
{
    int i = 0;
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "UpdatePPLAct129II_InvoicePage3";

        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        cmd.Parameters.AddWithValue("@Line1Quantity", Line1Quantity);
        cmd.Parameters.AddWithValue("@Line2Quantity", Line2Quantity);
        cmd.Parameters.AddWithValue("@Line3Quantity", Line3Quantity);
        cmd.Parameters.AddWithValue("@Line4Quantity", Line4Quantity);

        cmd.Parameters.AddWithValue("@Line5Quantity", Line5Quantity);
        cmd.Parameters.AddWithValue("@Line6Quantity", Line6Quantity);
        cmd.Parameters.AddWithValue("@Line7Quantity", Line7Quantity);
        cmd.Parameters.AddWithValue("@Line8Quantity", Line8Quantity);
        cmd.Parameters.AddWithValue("@Line9Quantity", Line9Quantity);
        cmd.Parameters.AddWithValue("@Line10Quantity", Line10Quantity);
        cmd.Parameters.AddWithValue("@Line11Quantity", Line11Quantity);


        cmd.Parameters.AddWithValue("@Line18Quantity", Line18Quantity);
        cmd.Parameters.AddWithValue("@Line19Quantity", Line19Quantity);
        cmd.Parameters.AddWithValue("@Line20Quantity", Line20Quantity);


        cmd.Parameters.AddWithValue("@Line1Total", Line1Total);
        cmd.Parameters.AddWithValue("@Line2Total", Line2Total);
        cmd.Parameters.AddWithValue("@Line3Total", Line3Total);
        cmd.Parameters.AddWithValue("@Line4Total", Line4Total);

        cmd.Parameters.AddWithValue("@Line5Total", Line5Total);
        cmd.Parameters.AddWithValue("@Line6Total", Line6Total);
        cmd.Parameters.AddWithValue("@Line7Total", Line7Total);
        cmd.Parameters.AddWithValue("@Line8Total", Line8Total);
        cmd.Parameters.AddWithValue("@Line9Total", Line9Total);
        cmd.Parameters.AddWithValue("@Line10Total", Line10Total);
        cmd.Parameters.AddWithValue("@Line11Total", Line11Total);


        cmd.Parameters.AddWithValue("@Line18Total", Line18Total);
        cmd.Parameters.AddWithValue("@Line19Total", Line19Total);
        cmd.Parameters.AddWithValue("@Line20Total", Line20Total);

        cmd.Parameters.AddWithValue("@Finalized", Finalized);

        cmd.Parameters.AddWithValue("@Line1Category", Line1Category);
        cmd.Parameters.AddWithValue("@Line1LIURPCode", Line1LIURPCode);
        cmd.Parameters.AddWithValue("@Line1MeasureDescription", Line1MeasureDescription);
        cmd.Parameters.AddWithValue("@Line1SC", Line1SC);
        cmd.Parameters.AddWithValue("@Line1Unit", Line1Unit);
        cmd.Parameters.AddWithValue("@Line1LaborRate", Line1LaborRate);
        cmd.Parameters.AddWithValue("@Line1THW", Line1THW);
        cmd.Parameters.AddWithValue("@Line1TMC", Line1TMC);
        cmd.Parameters.AddWithValue("@Line1CostPerUnit", Line1CostPerUnit);

        cmd.Parameters.AddWithValue("@Line2Category", Line2Category);
        cmd.Parameters.AddWithValue("@Line2LIURPCode", Line2LIURPCode);
        cmd.Parameters.AddWithValue("@Line2MeasureDescription", Line2MeasureDescription);
        cmd.Parameters.AddWithValue("@Line2SC", Line2SC);
        cmd.Parameters.AddWithValue("@Line2Unit", Line2Unit);
        cmd.Parameters.AddWithValue("@Line2LaborRate", Line2LaborRate);
        cmd.Parameters.AddWithValue("@Line2THW", Line2THW);
        cmd.Parameters.AddWithValue("@Line2TMC", Line2TMC);
        cmd.Parameters.AddWithValue("@Line2CostPerUnit", Line2CostPerUnit);

        cmd.Parameters.AddWithValue("@Line3Category", Line3Category);
        cmd.Parameters.AddWithValue("@Line3LIURPCode", Line3LIURPCode);
        cmd.Parameters.AddWithValue("@Line3MeasureDescription", Line3MeasureDescription);
        cmd.Parameters.AddWithValue("@Line3SC", Line3SC);
        cmd.Parameters.AddWithValue("@Line3Unit", Line3Unit);
        cmd.Parameters.AddWithValue("@Line3LaborRate", Line3LaborRate);
        cmd.Parameters.AddWithValue("@Line3THW", Line3THW);
        cmd.Parameters.AddWithValue("@Line3TMC", Line3TMC);
        cmd.Parameters.AddWithValue("@Line3CostPerUnit", Line3CostPerUnit);

        cmd.Parameters.AddWithValue("@Line4Category", Line4Category);
        cmd.Parameters.AddWithValue("@Line4LIURPCode", Line4LIURPCode);
        cmd.Parameters.AddWithValue("@Line4MeasureDescription", Line4MeasureDescription);
        cmd.Parameters.AddWithValue("@Line4SC", Line4SC);
        cmd.Parameters.AddWithValue("@Line4Unit", Line4Unit);
        cmd.Parameters.AddWithValue("@Line4LaborRate", Line4LaborRate);
        cmd.Parameters.AddWithValue("@Line4THW", Line4THW);
        cmd.Parameters.AddWithValue("@Line4TMC", Line4TMC);
        cmd.Parameters.AddWithValue("@Line4CostPerUnit", Line4CostPerUnit);

        cmd.Parameters.AddWithValue("@Line5Category", Line5Category);
        cmd.Parameters.AddWithValue("@Line5LIURPCode", Line5LIURPCode);
        cmd.Parameters.AddWithValue("@Line5MeasureDescription", Line5MeasureDescription);
        cmd.Parameters.AddWithValue("@Line5SC", Line5SC);
        cmd.Parameters.AddWithValue("@Line5Unit", Line5Unit);
        cmd.Parameters.AddWithValue("@Line5LaborRate", Line5LaborRate);
        cmd.Parameters.AddWithValue("@Line5THW", Line5THW);
        cmd.Parameters.AddWithValue("@Line5TMC", Line5TMC);
        cmd.Parameters.AddWithValue("@Line5CostPerUnit", Line5CostPerUnit);

        cmd.Parameters.AddWithValue("@Line6Category", Line6Category);
        cmd.Parameters.AddWithValue("@Line6LIURPCode", Line6LIURPCode);
        cmd.Parameters.AddWithValue("@Line6MeasureDescription", Line6MeasureDescription);
        cmd.Parameters.AddWithValue("@Line6SC", Line6SC);
        cmd.Parameters.AddWithValue("@Line6Unit", Line6Unit);
        cmd.Parameters.AddWithValue("@Line6LaborRate", Line6LaborRate);
        cmd.Parameters.AddWithValue("@Line6THW", Line6THW);
        cmd.Parameters.AddWithValue("@Line6TMC", Line6TMC);
        cmd.Parameters.AddWithValue("@Line6CostPerUnit", Line6CostPerUnit);

        cmd.Parameters.AddWithValue("@Line7Category", Line7Category);
        cmd.Parameters.AddWithValue("@Line7LIURPCode", Line7LIURPCode);
        cmd.Parameters.AddWithValue("@Line7MeasureDescription", Line7MeasureDescription);
        cmd.Parameters.AddWithValue("@Line7SC", Line7SC);
        cmd.Parameters.AddWithValue("@Line7Unit", Line7Unit);
        cmd.Parameters.AddWithValue("@Line7LaborRate", Line7LaborRate);
        cmd.Parameters.AddWithValue("@Line7THW", Line7THW);
        cmd.Parameters.AddWithValue("@Line7TMC", Line7TMC);
        cmd.Parameters.AddWithValue("@Line7CostPerUnit", Line7CostPerUnit);

        cmd.Parameters.AddWithValue("@Line8Category", Line8Category);
        cmd.Parameters.AddWithValue("@Line8LIURPCode", Line8LIURPCode);
        cmd.Parameters.AddWithValue("@Line8MeasureDescription", Line8MeasureDescription);
        cmd.Parameters.AddWithValue("@Line8SC", Line8SC);
        cmd.Parameters.AddWithValue("@Line8Unit", Line8Unit);
        cmd.Parameters.AddWithValue("@Line8LaborRate", Line8LaborRate);
        cmd.Parameters.AddWithValue("@Line8THW", Line8THW);
        cmd.Parameters.AddWithValue("@Line8TMC", Line8TMC);
        cmd.Parameters.AddWithValue("@Line8CostPerUnit", Line8CostPerUnit);

        cmd.Parameters.AddWithValue("@Line9Category", Line9Category);
        cmd.Parameters.AddWithValue("@Line9LIURPCode", Line9LIURPCode);
        cmd.Parameters.AddWithValue("@Line9MeasureDescription", Line9MeasureDescription);
        cmd.Parameters.AddWithValue("@Line9SC", Line9SC);
        cmd.Parameters.AddWithValue("@Line9Unit", Line9Unit);
        cmd.Parameters.AddWithValue("@Line9LaborRate", Line9LaborRate);
        cmd.Parameters.AddWithValue("@Line9THW", Line9THW);
        cmd.Parameters.AddWithValue("@Line9TMC", Line9TMC);
        cmd.Parameters.AddWithValue("@Line9CostPerUnit", Line9CostPerUnit);

        cmd.Parameters.AddWithValue("@Line10Category", Line10Category);
        cmd.Parameters.AddWithValue("@Line10LIURPCode", Line10LIURPCode);
        cmd.Parameters.AddWithValue("@Line10MeasureDescription", Line10MeasureDescription);
        cmd.Parameters.AddWithValue("@Line10SC", Line10SC);
        cmd.Parameters.AddWithValue("@Line10Unit", Line10Unit);
        cmd.Parameters.AddWithValue("@Line10LaborRate", Line10LaborRate);
        cmd.Parameters.AddWithValue("@Line10THW", Line10THW);
        cmd.Parameters.AddWithValue("@Line10TMC", Line10TMC);
        cmd.Parameters.AddWithValue("@Line10CostPerUnit", Line10CostPerUnit);

        cmd.Parameters.AddWithValue("@Line11Category", Line11Category);
        cmd.Parameters.AddWithValue("@Line11LIURPCode", Line11LIURPCode);
        cmd.Parameters.AddWithValue("@Line11MeasureDescription", Line11MeasureDescription);
        cmd.Parameters.AddWithValue("@Line11SC", Line11SC);
        cmd.Parameters.AddWithValue("@Line11Unit", Line11Unit);
        cmd.Parameters.AddWithValue("@Line11LaborRate", Line11LaborRate);
        cmd.Parameters.AddWithValue("@Line11THW", Line11THW);
        cmd.Parameters.AddWithValue("@Line11TMC", Line11TMC);
        cmd.Parameters.AddWithValue("@Line11CostPerUnit", Line11CostPerUnit);


        cmd.Parameters.AddWithValue("@Line18Category", Line18Category);
        cmd.Parameters.AddWithValue("@Line18LIURPCode", Line18LIURPCode);
        cmd.Parameters.AddWithValue("@Line18MeasureDescription", Line18MeasureDescription);
        cmd.Parameters.AddWithValue("@Line18SC", Line18SC);
        cmd.Parameters.AddWithValue("@Line18Unit", Line18Unit);
        cmd.Parameters.AddWithValue("@Line18LaborRate", Line18LaborRate);
        cmd.Parameters.AddWithValue("@Line18THW", Line18THW);
        cmd.Parameters.AddWithValue("@Line18TMC", Line18TMC);
        cmd.Parameters.AddWithValue("@Line18CostPerUnit", Line18CostPerUnit);

        cmd.Parameters.AddWithValue("@Line19Category", Line19Category);
        cmd.Parameters.AddWithValue("@Line19LIURPCode", Line19LIURPCode);
        cmd.Parameters.AddWithValue("@Line19MeasureDescription", Line19MeasureDescription);
        cmd.Parameters.AddWithValue("@Line19SC", Line19SC);
        cmd.Parameters.AddWithValue("@Line19Unit", Line19Unit);
        cmd.Parameters.AddWithValue("@Line19LaborRate", Line19LaborRate);
        cmd.Parameters.AddWithValue("@Line19THW", Line19THW);
        cmd.Parameters.AddWithValue("@Line19TMC", Line19TMC);
        cmd.Parameters.AddWithValue("@Line19CostPerUnit", Line19CostPerUnit);

        cmd.Parameters.AddWithValue("@Line20Category", Line20Category);
        cmd.Parameters.AddWithValue("@Line20LIURPCode", Line20LIURPCode);
        cmd.Parameters.AddWithValue("@Line20MeasureDescription", Line20MeasureDescription);
        cmd.Parameters.AddWithValue("@Line20SC", Line20SC);
        cmd.Parameters.AddWithValue("@Line20Unit", Line20Unit);
        cmd.Parameters.AddWithValue("@Line20LaborRate", Line20LaborRate);
        cmd.Parameters.AddWithValue("@Line20THW", Line20THW);
        cmd.Parameters.AddWithValue("@Line20TMC", Line20TMC);
        cmd.Parameters.AddWithValue("@Line20CostPerUnit", Line20CostPerUnit);

        cmd.Parameters.AddWithValue("@ContractorLine1Type", ContractorLine1Type);
        cmd.Parameters.AddWithValue("@ContractorLine1Name", ContractorLine1Name);
        cmd.Parameters.AddWithValue("@ContractorLine1CallDate", ContractorLine1CallDate);
        cmd.Parameters.AddWithValue("@ContractorLine1Comments", ContractorLine1Comments);
        cmd.Parameters.AddWithValue("@ContractorLine2Type", ContractorLine2Type);
        cmd.Parameters.AddWithValue("@ContractorLine2Name", ContractorLine2Name);
        cmd.Parameters.AddWithValue("@ContractorLine2CallDate", ContractorLine2CallDate);
        cmd.Parameters.AddWithValue("@ContractorLine2Comments", ContractorLine2Comments);
        cmd.Parameters.AddWithValue("@ContractorLine3Type", ContractorLine3Type);
        cmd.Parameters.AddWithValue("@ContractorLine3Name", ContractorLine3Name);
        cmd.Parameters.AddWithValue("@ContractorLine3CallDate", ContractorLine3CallDate);
        cmd.Parameters.AddWithValue("@ContractorLine3Comments", ContractorLine3Comments);
        cmd.Parameters.AddWithValue("@ContractorLine4Type", ContractorLine4Type);
        cmd.Parameters.AddWithValue("@ContractorLine4Name", ContractorLine4Name);
        cmd.Parameters.AddWithValue("@ContractorLine4CallDate", ContractorLine4CallDate);
        cmd.Parameters.AddWithValue("@ContractorLine4Comments", ContractorLine4Comments);
        cmd.Parameters.AddWithValue("@DateInvoiceSubmitted", DateInvoiceSubmitted);
        cmd.Parameters.AddWithValue("@DateWorkCompleted", DateWorkCompleted);
        cmd.Parameters.AddWithValue("@SignatureofContractor", SignatureofContractor);



        con.Open();
        i = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();
    }
    catch (Exception ex)
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


public DataTable GetPPLAudit_Act129II_Invoice_3(string JobNumber)
{
    DataTable dt = new DataTable(JobNumber);
    SqlCommand cmd = new SqlCommand();
    try
    {
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SelectAct129IIPPLInvoicePage3";
        cmd.Parameters.AddWithValue("@JobNumber", JobNumber);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

    }
    catch (Exception ex)
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
