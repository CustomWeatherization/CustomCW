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
using System.Text;
using System.IO;
//using iTextSharp.text;
//using iTextSharp.text.html.simpleparser;
//using iTextSharp.text.pdf;

public partial class PPLAudit_PPL_Audit_Page : System.Web.UI.Page
{
    public static string StrUserName;
    smUtil objSm = new smUtil();
    public DataTable dtPhoto = new DataTable();
    dcPPLAudit ObjPPL = new dcPPLAudit();

    protected void Page_Load(object sender, EventArgs e)
    {
        StrUserName = objSm.GetCookie("UserName");
        try
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Jobs"] != null)
                {
                    if (Request.QueryString["Jobs"].ToString() != "")
                    {
                        string JobNum = Request.QueryString["Jobs"].ToString();
                        JobNumber.InnerText = JobNum;
                        BindDDLAuditor();
                        BindData1(JobNum);
                        BindData2(JobNum);
                        BindData3(JobNum);
                        BindData4(JobNum);
                        BindData5(JobNum);
                        BindData6(JobNum);
                        BindData7(JobNum);
                        BindData8(JobNum);
                        BindData9(JobNum);
                        BindData9Post(JobNum);
                        BindData10(JobNum);
                        BindPhoto(JobNum);
                    }
                }
                else
                {
                    Response.Redirect("../Home.aspx");
                }

            }
        }
        catch
        {
        }
    }


    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        objSm.DeleteCookie("UId");
        objSm.DeleteCookie("UserId");
        objSm.DeleteCookie("UserName");
        Response.Redirect("Login.aspx");
    }


    #region "Bind DDLAuditor"
    public void BindDDLAuditor()
    {
        DataTable dtDLL = new DataTable();
        dtDLL = ObjPPL.GetAuditorNameForPPLAudit_1();
        DDLAuditor.DataSource = dtDLL;
        DDLAuditor.DataValueField = "ID";
        DDLAuditor.DataTextField = "AuditorName";
        DDLAuditor.DataBind();

    }
    #endregion


    #region "Audti Page 1"
    public void BindData1(string JobNumber)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_1(JobNumber);
            if (dt.Rows.Count > 0)
            {
                txtName.Value = dt.Rows[0]["FullName"].ToString();
                txtAccount.Text = dt.Rows[0]["AccountNumber"].ToString();
                txtAddress.Text = dt.Rows[0]["ServiceAddress1"].ToString();
                txtAddress2.Text = dt.Rows[0]["CityStateZipCode"].ToString();
                txtPhoneHome.Text = dt.Rows[0]["HomePhone"].ToString();
                txtPhoneOther.Text = dt.Rows[0]["CellPhone"].ToString();
                txtCountyTownship.Text = dt.Rows[0]["ServiceCounty"].ToString();
                txtPhoneOther.Text = dt.Rows[0]["CellPhone"].ToString();
                if (Convert.ToString(dt.Rows[0]["LandLordApproval"]) == "Yes")
                {
                    chkLandlordApprovalY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["LandLordApproval"]) == "No")
                {
                    chkLandlordApprovalN.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["LandLordApproval"]) == "N/A")
                {
                    chkLandlordApprovalNA.Checked = true;
                }
                else
                {
                    chkLandlordApprovalNA.Checked = false;
                    chkLandlordApprovalN.Checked = false;
                    chkLandlordApprovalY.Checked = false;
                }
                txtOntrackStartdate.Text = Convert.ToDateTime(dt.Rows[0]["OnTrackStartDate"]).ToString("MM/dd/yyyy");
                txtOntrackPayAmt.Text = Math.Round(Convert.ToDecimal(dt.Rows[0]["OnTrackAmount"]), 2).ToString();
                if (Convert.ToString(dt.Rows[0]["Ontrack"]) == "YES")
                {
                    chkOnTrackCustomerY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["Ontrack"]) == "NO")
                {
                    chkOnTrackCustomerN.Checked = true;
                }
                else
                {
                    chkOnTrackCustomerN.Checked = false;
                    chkOnTrackCustomerY.Checked = false;
                }
                ///////////////////////////////////////////////////////////////////////////////////////////////////////

                string StateOrGasWeatherization = Convert.ToString(dt.Rows[0]["StateOrGasWeatherization"]);
                string[] StrStateOrGasWeatherization = StateOrGasWeatherization.Split(',');

                for (int i = 0; i < StrStateOrGasWeatherization.Length; i++)
                {
                    if (Convert.ToString(StrStateOrGasWeatherization[i]) == "S")
                    {
                        chkReferredStateWeatherization.Checked = true;
                    }
                    else if (Convert.ToString(StrStateOrGasWeatherization[i]) == "G")
                    {
                        chkReferredGasUtilityWeatherization.Checked = true;
                    }
                    else if (Convert.ToString(StrStateOrGasWeatherization[i]) == "DC")
                    {
                        ChkDCEDWAP.Checked = true;
                    }
                    else if (Convert.ToString(StrStateOrGasWeatherization[i]) == "Co")
                    {
                        ChkCountyWx.Checked = true;
                    }
                    else if (Convert.ToString(StrStateOrGasWeatherization[i]) == "LI")
                    {
                        ChkLIHEAP.Checked = true;
                    }
                    else if (Convert.ToString(StrStateOrGasWeatherization[i]) == "On")
                    {
                        ChkOnTrack.Checked = true;
                    }
                    else if (Convert.ToString(StrStateOrGasWeatherization[i]) == "Op")
                    {
                        ChkOperationHELP.Checked = true;
                    }
                    else if (Convert.ToString(StrStateOrGasWeatherization[i]) == "A1")
                    {
                        ChkAct129EPowerWise.Checked = true;
                    }
                    else if (Convert.ToString(StrStateOrGasWeatherization[i]) == "A2")
                    {
                        ChkAct129ApplianceRebate.Checked = true;
                    }
                    else if (Convert.ToString(StrStateOrGasWeatherization[i]) == "Ot")
                    {
                        ChkOtherReferred.Checked = true;
                        txtReferredComments.Text = dt.Rows[0]["StateOrGasWeatherizationComments"].ToString();
                    }
                }


                ////////////////////////////////////////////////////////////////////////////////////////////////////////
                //else
                //{
                //    chkReferredGasUtilityWeatherization.Checked = false;
                //    chkReferredStateWeatherization.Checked = false;
                //    ChkAct129ApplianceRebate.Checked = false;
                //    ChkAct129EPowerWise.Checked = false;
                //    ChkOperationHELP.Checked = false;
                //    ChkOnTrack.Checked = false;
                //    ChkLIHEAP.Checked = false;
                //    ChkCountyWx.Checked = false;
                //    ChkDCEDWAP.Checked = false;
                //}

                if (Convert.ToString(dt.Rows[0]["DoesRentOrMortExceedIncome"]) == "Y")
                {
                    chkDoesRentMortgageExceedIncomeY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DoesRentOrMortExceedIncome"]) == "N")
                {
                    chkDoesRentMortgageExceedIncomeN.Checked = true;
                }
                else
                {
                    chkDoesRentMortgageExceedIncomeN.Checked = false;
                    chkDoesRentMortgageExceedIncomeY.Checked = false;
                }

                chkOriginalJobTypeBaseLoad.Checked = Convert.ToBoolean(dt.Rows[0]["BaseLoadOnly"]);
                chkOriginalJobTypeFullCost.Checked = Convert.ToBoolean(dt.Rows[0]["FullCost"]);
                txtDirectionNInstruction.Text = dt.Rows[0]["DirectionsAndSpecialInstructions"].ToString();
                txtDateAssigned.Text = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]).ToString("MM/dd/yyyy");
                txtActualAllowance.Text = Math.Round(Convert.ToDecimal(dt.Rows[0]["SpendingAllowance"]), 2).ToString();
                if (Convert.ToString(dt.Rows[0]["IfAuditNotCompleted"]) == "O")
                {
                    chkAuditNotCompletedOther.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IfAuditNotCompleted"]) == "SH")
                {
                    chkAuditNotCompletedSafetyHelth.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IfAuditNotCompleted"]) == "NS")
                {
                    chkAuditNotCompletedNoShow.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IfAuditNotCompleted"]) == "NR")
                {
                    chkAuditNotCompletedReasonNoResponse.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IfAuditNotCompleted"]) == "CS")
                {
                    ChkAuditNotContractorSafety.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IfAuditNotCompleted"]) == "M")
                {
                    chkAuditNotCompletedReasonMoved.Checked = true;
                }

                txtContractor.Text = dt.Rows[0]["Contractor"].ToString();
                txtReferredComments.Text = dt.Rows[0]["StateOrGasWeatherizationComments"].ToString();
                txtDateOfAudit.Text = Convert.ToDateTime(dt.Rows[0]["DateOfAudit"]).ToString("MM/dd/yyyy");
                txtSquareFootage.Text = dt.Rows[0]["SquareFootage"].ToString();
                txtAuditNotCompletedOthere.Text = dt.Rows[0]["IfAuditNotCompletedReason"].ToString();
                if (Convert.ToString(dt.Rows[0]["OwnerTenant"]) == "O")
                {
                    chkOccupancyHomeowner.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["OwnerTenant"]) == "T")
                {
                    chkOccupancyTenant.Checked = true;
                }
                txtSeasonalAllowanceKWH.Text = dt.Rows[0]["TWSeasonal"].ToString();
                txtSeasonalAllowanceCent.Text = Math.Round(Convert.ToDecimal(txtSeasonalAllowanceKWH.Text) * Convert.ToDecimal(txtSeasonalAllowanceKWH2.Text), 2).ToString();
                txtSeasonalAllowanceCent3.Text = Math.Round(Convert.ToDecimal(txtSeasonalAllowanceCent.Text) * Convert.ToDecimal(txtSeasonalAllowanceCent2.Text), 2).ToString();
                txtSeasonalAllowanceCent5.Text = Math.Round(Convert.ToDecimal(txtSeasonalAllowanceCent3.Text) + Convert.ToDecimal(txtSeasonalAllowanceCent4.Text), 2).ToString();
                txtRepairAllowance.Text = Math.Round((Convert.ToDecimal(txtSeasonalAllowanceCent5.Text) * 20) / 100, 2).ToString();
                if (Convert.ToString(dt.Rows[0]["Auditor"]) == "0")
                {
                    DDLAuditor.Items.Insert(0, "Select");
                }
                else
                {
                    DDLAuditor.SelectedValue = dt.Rows[0]["Auditor"].ToString();
                }
            }
        }
        catch
        {
        }
    }
    #endregion


    #region "Audit Page 2"
    public void BindData2(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_2(JobNum);

            txtHeatingSystemsLine1.Text = dt.Rows[0]["HeatingSystemsLine1"].ToString();

            txtHeatingSystemsLine2.Text = dt.Rows[0]["HeatingSystemsLine2"].ToString();

            txtACSystemsLine1.Text = dt.Rows[0]["ACSystemsLine1"].ToString();
            txtACSystemsLine2.Text = dt.Rows[0]["ACSystemsLine2"].ToString();


            ///////////////////////////////////////////////////////////////////////////////////

            txtAdditionalComment1.Text = dt.Rows[0]["AdditionalComment1"].ToString();
            txtAdditionalComment2.Text = dt.Rows[0]["AdditionalComment2"].ToString();
            txtAdditionalComment3.Text = dt.Rows[0]["AdditionalComment3"].ToString();
            txtAdditionalComment4.Text = dt.Rows[0]["AdditionalComment4"].ToString();

            //////////////////////////////////////////////////////////////////////////////////


            txtDraftsLine1.Text = dt.Rows[0]["DraftsLine1"].ToString();
            txtDraftsLine2.Text = dt.Rows[0]["DraftsLine2"].ToString();

            txtColdRoomsLine1.Text = dt.Rows[0]["ColdRoomsLine1"].ToString();
            txtColdRoomsLine2.Text = dt.Rows[0]["ColdRoomsLine2"].ToString();

            txtMoistureProblemsLine1.Text = dt.Rows[0]["MoistureProblemsLine1"].ToString();
            txtMoistureProblemsLine2.Text = dt.Rows[0]["MoistureProblemsLine2"].ToString();


            txtSpecialNeedsLine1.Text = dt.Rows[0]["SpecialNeedsLine1"].ToString();

            txtOtherNotesLine1.Text = dt.Rows[0]["OtherNotesLine1"].ToString();
            txtOtherNotesLine2.Text = dt.Rows[0]["OtherNotesLine2"].ToString();

            txtOtherIncreaseComments.Text = dt.Rows[0]["OtherIncreaseComments"].ToString();
            txtDifferentReason.Text = dt.Rows[0]["DifferentReason"].ToString();
            // txtAdditionalMeasuresReason.Text = dt.Rows[0]["AdditionalMeasuresReason"].ToString();


            if (dt.Rows[0]["UsageIncreaseYes"].ToString() == "Y")
            {
                rdoUsersIncreaseYES.Checked = true;
            }

            if (dt.Rows[0]["UsageIncreaseNo"].ToString() == "N")
            {
                rdoUsersIncreaseNo.Checked = true;
                courier.Attributes.Add("style", "display:block;");
            }

            if (dt.Rows[0]["WrapMeasures"].ToString() == "Y")
            {
                chkWrapMessare.Checked = true;
            }
            if (dt.Rows[0]["CustomerUsage"].ToString() == "Y")
            {
                chkCustomerUsage.Checked = true;
            }

            if (dt.Rows[0]["LivingSpace"].ToString() == "Y")
            {
                chkLivingSpace.Checked = true;
            }
            if (dt.Rows[0]["ElectricAppliances"].ToString() == "Y")
            {
                chkElectricAppliances.Checked = true;
            }

            if (dt.Rows[0]["OtherIncrease"].ToString() == "Y")
            {
                chkOtherIncrease.Checked = true;

            }
            if (dt.Rows[0]["BaseLoad"].ToString() == "Y")
            {
                chkBaseLoad.Checked = true;
                DDl_FullCotBaseLoad.SelectedValue = Convert.ToString(dt.Rows[0]["DifferentReason"]);
                DDl_FullCotBaseLoad.Style["display"] = "block";
                DDl_BaseloadFullcost.Style["display"] = "none";
            }

            if (dt.Rows[0]["LowCost"].ToString() == "Y")
            {
                chkLowCost.Checked = true;
            }
            if (dt.Rows[0]["FullCost"].ToString() == "Y")
            {
                chkFullCost.Checked = true;
                DDl_BaseloadFullcost.SelectedValue = Convert.ToString(dt.Rows[0]["DifferentReason"]);
                DDl_BaseloadFullcost.Style["display"] = "block";
                DDl_FullCotBaseLoad.Style["display"] = "none";
            }

            //if (dt.Rows[0]["JobCompleted"].ToString() == "Y")
            //{
            //    chkJobCompleted.Checked = true;
            //}
            //if (dt.Rows[0]["AdditionalMeasures"].ToString() == "Y")
            //{
            //    chkAdditionalMeasures.Checked = true;
            //}
            if (dt.Rows[0]["HouseholdOccupants"].ToString() == "Y")
            {
                chkHouseholdOccupants.Checked = true;
            }

        }
        catch
        {
        }
    }
    #endregion



    #region "Audit Page 3"
    public void BindData3(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();

            dt = ObjPPL.GetPPLAudit_3(JobNum);

            // Refrigerator Tested First 

            if (dt.Rows[0]["RefrigeratorTested1"].ToString() == "C")
            {
                chkRefrigeratorTested_C.Checked = true;
            }

            if (dt.Rows[0]["RefrigeratorTested1"].ToString() == "R")
            {
                chkRefrigeratorTested_R.Checked = true;

            }
            if (dt.Rows[0]["RefrigeratorTested1"].ToString() == "N/A")
            {
                chkRefrigeratorTested_NA.Checked = true;
            }
            if (dt.Rows[0]["RefrigeratorTested1"].ToString() == "N/R")
            {
                chkRefrigeratorTested_NR.Checked = true;
            }

            // Refrigerator Tested Second 

            if (dt.Rows[0]["RefrigeratorTested2"].ToString() == "C")
            {
                chkRefrigeratorTestedSec_C.Checked = true;
            }

            if (dt.Rows[0]["RefrigeratorTested2"].ToString() == "R")
            {
                chkRefrigeratorTestedSec_R.Checked = true;
            }

            if (dt.Rows[0]["RefrigeratorTested2"].ToString() == "N/A")
            {
                chkRefrigeratorTestedSec_NA.Checked = true;
            }
            if (dt.Rows[0]["RefrigeratorTested2"].ToString() == "N/R")
            {
                chkRefrigeratorTestedSec_NR.Checked = true;
            }
            //  Freezer Tested

            if (dt.Rows[0]["FreezerTested"].ToString() == "C")
            {
                chkFreezerTested_C.Checked = true;
            }

            if (dt.Rows[0]["FreezerTested"].ToString() == "R")
            {
                chkFreezerTested_R.Checked = true;
            }

            if (dt.Rows[0]["FreezerTested"].ToString() == "N/A")
            {
                chkFreezerTested_NA.Checked = true;
            }
            if (dt.Rows[0]["FreezerTested"].ToString() == "N/R")
            {
                chkFreezerTested_NR.Checked = true;
            }

            //Refrigerator Coils

            if (dt.Rows[0]["RefrigeratorCoilsCleaned"].ToString() == "C")
            {
                chkRefrigeratorCoilsCleaned_C.Checked = true;
            }

            if (dt.Rows[0]["RefrigeratorCoilsCleaned"].ToString() == "R")
            {
                chkRefrigeratorCoilsCleaned_R.Checked = true;
            }

            if (dt.Rows[0]["RefrigeratorCoilsCleaned"].ToString() == "N/A")
            {
                chkRefrigeratorCoilsCleaned_NA.Checked = true;
            }
            if (dt.Rows[0]["RefrigeratorCoilsCleaned"].ToString() == "N/R")
            {
                chkRefrigeratorCoilsCleaned_NR.Checked = true;
            }

            // AC Filter Changed
            if (dt.Rows[0]["ACFilterChanged"].ToString() == "C")
            {
                chkACFilterChanged_C.Checked = true;
            }

            if (dt.Rows[0]["ACFilterChanged"].ToString() == "R")
            {
                chkACFilterChanged_R.Checked = true;
            }

            if (dt.Rows[0]["ACFilterChanged"].ToString() == "N/A")
            {
                chkACFilterChanged_NA.Checked = true;
            }
            if (dt.Rows[0]["ACFilterChanged"].ToString() == "N/R")
            {
                chkACFilterChanged_NR.Checked = true;
            }

            //AC Filter Cleaned
            if (dt.Rows[0]["ACFilterCleaned"].ToString() == "C")
            {
                chkACFilterCleaned_C.Checked = true;
            }

            if (dt.Rows[0]["ACFilterCleaned"].ToString() == "R")
            {
                chkACFilterCleaned_R.Checked = true;
            }

            if (dt.Rows[0]["ACFilterCleaned"].ToString() == "N/A")
            {
                chkACFilterCleaned_NA.Checked = true;
            }
            if (dt.Rows[0]["ACFilterCleaned"].ToString() == "N/R")
            {
                chkACFilterCleaned_NR.Checked = true;
            }

            //AC(s) Replaced
            if (dt.Rows[0]["ACSReplaced"].ToString() == "C")
            {
                chkACReplaced_C.Checked = true;
            }

            if (dt.Rows[0]["ACSReplaced"].ToString() == "R")
            {
                chkACReplaced_R.Checked = true;
            }

            if (dt.Rows[0]["ACSReplaced"].ToString() == "N/A")
            {
                chkACReplaced_NA.Checked = true;
            }
            if (dt.Rows[0]["ACSReplaced"].ToString() == "N/R")
            {
                chkACReplaced_NR.Checked = true;
            }

            // AC Location(s)
            txtDryerVentMeauresDescribe.Text = dt.Rows[0]["DryerVentMeauresDescribe"].ToString();

            txtAcLoaction.Text = dt.Rows[0]["ACLocationComment"].ToString();
            //Dryer Vent Measures
            if (dt.Rows[0]["DryerVentMeasures"].ToString() == "C")
            {
                chkDryerVentMeasures_C.Checked = true;
            }

            if (dt.Rows[0]["DryerVentMeasures"].ToString() == "R")
            {
                chkDryerVentMeasures_R.Checked = true;
            }

            if (dt.Rows[0]["DryerVentMeasures"].ToString() == "N/A")
            {
                chkDryerVentMeasures_NA.Checked = true;
            }

            // Heating Filter Changed
            if (dt.Rows[0]["HeatingFilter1Changed"].ToString() == "C")
            {
                chkHeatingFilterChanged_C.Checked = true;
            }

            if (dt.Rows[0]["HeatingFilter1Changed"].ToString() == "R")
            {
                chkHeatingFilterChanged_R.Checked = true;
            }

            if (dt.Rows[0]["HeatingFilter1Changed"].ToString() == "N/A")
            {
                chkHeatingFilterChanged_NA.Checked = true;
            }

            // Heating Filter Cleaned ONE
            if (dt.Rows[0]["HeatingFilter1Cleaned"].ToString() == "C")
            {
                chkHeatingFilterCleaned_C.Checked = true;
            }

            if (dt.Rows[0]["HeatingFilter1Cleaned"].ToString() == "R")
            {
                chkHeatingFilterCleaned_R.Checked = true;
            }

            if (dt.Rows[0]["HeatingFilter1Cleaned"].ToString() == "N/A")
            {
                chkHeatingFilterCleaned_NA.Checked = true;
            }

            // Heating Filter Cleaned Two
            if (dt.Rows[0]["HeatingFilter2Cleaned"].ToString() == "C")
            {
                chkHeatingFilterCleaned2_C.Checked = true;
            }

            if (dt.Rows[0]["HeatingFilter2Cleaned"].ToString() == "R")
            {
                chkHeatingFilterCleaned2_R.Checked = true;
            }

            if (dt.Rows[0]["HeatingFilter2Cleaned"].ToString() == "N/A")
            {
                chkHeatingFilterCleaned2_NA.Checked = true;
            }

            //Comfort Measures

            txtLiving.Text = dt.Rows[0]["LivingRoomComments_Supplier"].ToString();
            txtFamilyroom.Text = dt.Rows[0]["FamilyRoomComments_Supplier"].ToString();
            txtKitchen.Text = dt.Rows[0]["KitchenComments_Supplier"].ToString();
            txtDining.Text = dt.Rows[0]["DiningRoomComments_Supplier"].ToString();
            txtbedroom.Text = dt.Rows[0]["BedRoom1Comments_Supplier"].ToString();
            txtbedRoom2.Text = dt.Rows[0]["BedRoom2Comments_Supplier"].ToString();
            txtbedroom3.Text = dt.Rows[0]["BedRoom3Comments_Supplier"].ToString();
            txtbath1.Text = dt.Rows[0]["Bath1_Supplier"].ToString();
            txtBath2.Text = dt.Rows[0]["Bath2_Supplier"].ToString();
            txtHallway.Text = dt.Rows[0]["Hallway_Supplier"].ToString();
            txtOutdoors.Text = dt.Rows[0]["OutDoors_Supplier"].ToString();
            txtother.Text = dt.Rows[0]["Other_Supplier"].ToString();
            txtspare.Text = dt.Rows[0]["Spare_Supplier"].ToString();

            DDL_Reason.SelectedValue = dt.Rows[0]["SelectReason"].ToString();






            txtComfortMeasuresInstalledCommentsLine1.Text = dt.Rows[0]["ComfortMeasuresInstalledCommentsLine1"].ToString();
            txtComfortMeasuresInstalledCommentsLine2.Text = dt.Rows[0]["ComfortMeasuresInstalledCommentsLine2"].ToString();
            //Other Comments
            txtOtherComments.Text = dt.Rows[0]["OtherComments"].ToString();

            //Living Room
            txtLivingRoom_CFLS.Text = dt.Rows[0]["LivingRoomCFLS"].ToString();
            txtLiving_Room_Comments.Text = dt.Rows[0]["LivingRoomComments"].ToString();

            //Family Room
            txtFamilyRoomCFLS.Text = dt.Rows[0]["FamilyRoomCFLS"].ToString();
            txtFamilyRoomComments.Text = dt.Rows[0]["FamilyRoomComments"].ToString();

            //Kitchen
            txtKitchenCFLS.Text = dt.Rows[0]["KitchenCFLS"].ToString();
            txtKitchen_Comments.Text = dt.Rows[0]["KitchenComments"].ToString();

            //Dining Room
            txtDiningRoomCFLS.Text = dt.Rows[0]["DiningRoomCFLS"].ToString();
            txtDiningRoom_Comments.Text = dt.Rows[0]["DiningRoomComments"].ToString();

            //Bedroom 1
            txtBedroom_1_CFLS.Text = dt.Rows[0]["BedRoom1CFLS"].ToString();
            txtBedroom_1_Comments.Text = dt.Rows[0]["BedRoom1Comments"].ToString();
            //Bedroom 2
            txtBedroom_2_CFLS.Text = dt.Rows[0]["BedRoom2CFLS"].ToString();
            txtBedroom_2_Comments.Text = dt.Rows[0]["BedRoom2Comments"].ToString();
            //Bedroom 3
            txtBedRoom_3_CFLS.Text = dt.Rows[0]["BedRoom3CFLS"].ToString();
            txtBedRoom_3_Comments.Text = dt.Rows[0]["BedRoom3Comments"].ToString();

            // Bath 1
            txtBath_1_CFLS.Text = dt.Rows[0]["Bath1CFLS"].ToString();
            txtBath_1_Comments.Text = dt.Rows[0]["Bath1Comments"].ToString();

            //Bath 2
            txtBath_2_CFLS.Text = dt.Rows[0]["Bath2CFLS"].ToString();
            txtBath_2_Comments.Text = dt.Rows[0]["Bath2Comments"].ToString();

            //Hallway
            txtHallwayCFLS.Text = dt.Rows[0]["HallwayCFLS"].ToString();
            txtHallway_Comments.Text = dt.Rows[0]["HallwayComments"].ToString();

            //Outdoors
            txtOutDoorCFLS.Text = dt.Rows[0]["OutDoorsCFLS"].ToString();
            txtOutDoor_Comments.Text = dt.Rows[0]["OutdoorsComments"].ToString();

            //Other
            txtOtherCFLS.Text = dt.Rows[0]["CFLOtherCFLS"].ToString();
            txtOther_Comments.Text = dt.Rows[0]["CFLOtherComments"].ToString();

            //Spare(Max2)
            txtSpareMax2CFLS.Text = dt.Rows[0]["SpareCFLS"].ToString();
            txtSapreMax2_Comments.Text = dt.Rows[0]["SpareComments"].ToString();

            //Total Bulbs
            txtTotalCFLS.Text = dt.Rows[0]["TotalLightBulbCFLS"].ToString();
            txtTotalBulbs_Comments.Text = dt.Rows[0]["TotalLightBulbComments"].ToString();
            //Is Special checkBox
            chkLiving.Checked = Convert.ToBoolean(dt.Rows[0]["LivingRoomComments_CheckBox"].ToString());
            chkFamilyroom.Checked = Convert.ToBoolean(dt.Rows[0]["FamilyRoomComments_CheckBox"].ToString());
            ChkKitchen.Checked = Convert.ToBoolean(dt.Rows[0]["KitchenComments_CheckBox"].ToString());
            chkDining.Checked = Convert.ToBoolean(dt.Rows[0]["DiningRoomComments_CheckBox"].ToString());
            Chkbedroom.Checked = Convert.ToBoolean(dt.Rows[0]["BedRoom1Comments_CheckBox"].ToString());
            chkbedRoom2.Checked = Convert.ToBoolean(dt.Rows[0]["BedRoom2Comments_CheckBox"].ToString());
            chkbedroom3.Checked = Convert.ToBoolean(dt.Rows[0]["BedRoom3Comments_checkBox"].ToString());
            chkbath1.Checked = Convert.ToBoolean(dt.Rows[0]["Bath1_CheckBox"].ToString());
            chkBath2.Checked = Convert.ToBoolean(dt.Rows[0]["Bath2_CheckBox"].ToString());
            chkHallway.Checked = Convert.ToBoolean(dt.Rows[0]["Hallway_CheckBox"].ToString());
            chkOutdoors.Checked = Convert.ToBoolean(dt.Rows[0]["OutDoors_CheckBox"].ToString());
            chkother.Checked = Convert.ToBoolean(dt.Rows[0]["Other_CheckBox"].ToString());
            chkspare.Checked = Convert.ToBoolean(dt.Rows[0]["Spare_CheckBox"].ToString());

            //*****************Waterbed mattress Replacement******************* 

            if (dt.Rows[0]["KingWaterBed"].ToString() == "Y")
            {
                chkKing.Checked = true;
            }

            if (dt.Rows[0]["QueenWaterBed"].ToString() == "Y")
            {
                chkQueen.Checked = true;
            }

            if (dt.Rows[0]["SuperSingleWaterBed"].ToString() == "Y")
            {
                chkSuperSingle.Checked = true;
            }
            txtPads_RequestedReason.Text = dt.Rows[0]["PadsRequestedReason"].ToString();

            //***************************List main Reasons for Electric Usage***************
            txtElectric_Usage_CommentsLine1.Text = dt.Rows[0]["ElectricUsageCommentsLine1"].ToString();
            txtElectric_Usage_CommentsLine2.Text = dt.Rows[0]["ElectricUsageCommentsLine2"].ToString();
            txtElectric_Usage_CommentsLine3.Text = dt.Rows[0]["ElectricUsageCommentsLine3"].ToString();

            txtLivingRoom_CFLSWattage.Text = dt.Rows[0]["LivingRoomCFLSWattage"].ToString();
            txtLivingRoom_LightBulbsBrand.Text = dt.Rows[0]["LivingRoomLightBulbBrand"].ToString();
            txtFamilyRoomCFLSWattage.Text = dt.Rows[0]["FamilyRoomCFLSWattage"].ToString();
            txtFamilyRoomLightBulbBrand.Text = dt.Rows[0]["FamilyRoomLightBulbBrand"].ToString();
            txtKitchenCFLSWattage.Text = dt.Rows[0]["KitchenCFLSWattage"].ToString();
            txtKitchenLightBulbBrand.Text = dt.Rows[0]["KitchenLightBulbBrand"].ToString();
            txtDiningRoomCFLSWattage.Text = dt.Rows[0]["DiningRoomWattage"].ToString();
            txtDiningRoomLightBulbBrand.Text = dt.Rows[0]["DiningRoomLightBulbBrand"].ToString();
            txtBedroom_1_CFLSWattage.Text = dt.Rows[0]["BedRoom1CFLSWattage"].ToString();
            txtBedroom_1_LightBulbBrand.Text = dt.Rows[0]["BedRoom1LightBulbBrand"].ToString();
            txtBedroom_2_CFLSWattage.Text = dt.Rows[0]["BedRoom2CFLSWattage"].ToString();
            txtBedroom_2_LightBulbBrand.Text = dt.Rows[0]["BedRoom2LightBulbBrand"].ToString();
            txtBedRoom_3_CFLSWattage.Text = dt.Rows[0]["BedRoom3CFLSWattage"].ToString();
            txtBedRoom_3_LightBulbBrand.Text = dt.Rows[0]["BedRoomLightBulbBrand"].ToString();
            txtBath_1_CFLSWattage.Text = dt.Rows[0]["Bath1CFLSWattage"].ToString();
            txtBath_1_LightBulbBrand.Text = dt.Rows[0]["Bath1LightBulbBrand"].ToString();
            txtBath_2_CFLSWattage.Text = dt.Rows[0]["Bath2CFLSWattage"].ToString();
            txtBath_2_LightBulbBrand.Text = dt.Rows[0]["Bath2LightBulbBrand"].ToString();
            txtHallwayCFLSWattage.Text = dt.Rows[0]["HallwayCFLSWattage"].ToString();
            txtHallwayLightBulbBrand.Text = dt.Rows[0]["HallwayLightBulbBrand"].ToString();
            txtOutDoorCFLSWattage.Text = dt.Rows[0]["OutDoorsCFLSWattage"].ToString();
            txtOutDoorLightBulbBrand.Text = dt.Rows[0]["OutDoorsLightBulbBrand"].ToString();
            txtOtherCFLSWattage.Text = dt.Rows[0]["CFLOtherCFLsWattage"].ToString();
            txtOtherLightBulbBrand.Text = dt.Rows[0]["CFLOtherLightBulbBrand"].ToString();
            txtSpareMax2CFLSWattage.Text = dt.Rows[0]["SpareCFLSWattage"].ToString();
            txtSpareMax2LightBulbBrand.Text = dt.Rows[0]["SpareLightBulbBrand"].ToString();

        }
        catch
        {
        }
    }
    #endregion


    #region "Audit Page 4"
    public void BindData4(string JobNum)
    {
        try
        {

            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_4(JobNum);
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToString(dt.Rows[0]["RefrigeratorTested"]) == "Y")
                {
                    chk_RefrigeratorTest_Yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["RefrigeratorTested"]) == "N")
                {
                    chk_RefrigeratorTest_No.Checked = true;
                }

                txt_RefrigeratorTest_Reason.Text = Convert.ToString(dt.Rows[0]["NoReason"]);
                txt_PrimaryRefrigerator_Height.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorHeight"]);
                txt_PrimaryRefrigerator_Width.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorWidth"]);
                txt_PrimaryRefrigerator_Depth.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorDepth"]);
                txt_StartTime.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorStartTime"]);
                txt_EndTime.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorEndTime"]);
                txt_TotalMonitored.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorTotalTimeMonitored"]);
                txt_RefrigeratorTemp.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorTemperature"]);
                txt_FreezerTemp.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorFreezerTemperature"]);
                txt_RoomTemp.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorAmbientRoomTemperature"]);
                txt_PeakWattageRunning.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorPeakWattageWhileRunning"]);
                txt_TotalKWH.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorTotalKWHMonitored"]);
                txt_KWH_1_Hour.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorKWH1Hour"]);
                txt_KWH_24_Hour.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorKWH24Hours"]);
                txt_KWH_Month.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorKWHPerMonth"]);
                txt_Month.Text = Convert.ToString(dt.Rows[0]["PrimaryRefrigeratorDollarsPerMonth"]);


                DDL_RefrigeratorAssessment.SelectedValue = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorAssesment"]);
                DDL_REFRIGERATOR_reason.SelectedValue = Convert.ToString(dt.Rows[0]["RefrigeratorReason"]);

                if (Convert.ToString(dt.Rows[0]["IsPrimaryRefrigeratorEligibleForReplacement"]) == "Y")
                {
                    chk_RefrigeratorReplace_Yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsPrimaryRefrigeratorEligibleForReplacement"]) == "N")
                {
                    chk_RefrigeratorReplace_No.Checked = true;
                }


                if (Convert.ToString(dt.Rows[0]["SecondRefrigeratorOrFreezer"]) == "R")
                {
                    chk_SecondRefrigerator.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["SecondRefrigeratorOrFreezer"]) == "F")
                {
                    chk_SecondFreezer.Checked = true;
                }


                txt_SecondRefrigerator_Height.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerHeight"]);
                txt_SecondRefrigerator_Width.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerWidth"]);
                txt_SecondRefrigerator_Depth.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerDepth"]);

                txt_SecondRefrigerator_StartTime.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerStartTime"]);
                txt_SecondRefrigerator_EndTime.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerEndTime"]);
                txt_SecondRefrigerator_TotalMoniter.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerTotalTimeMonitored"]);
                txt_SecondRefrigerator_Temp.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerTemperature"]);
                txt_SecondFreezer_Temp.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerFreezerTemperature"]);
                txt_SecondRoom_Temp.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerAmbientRoomTemperature"]);

                txt_Second_PeakWattageRunning.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerPeakWattageWhileRunning"]);
                txt_Second_KWH_Moniter.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerTotalKWHMonitored"]);
                txt_Second_KWH_1_Hour.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerKWH1Hour"]);
                txt_Second_KWH_24_Hour.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerKWH24Hours"]);
                txt_Second_KWH_Month.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerKWHPerMonth"]);
                txt_Second_Month.Text = Convert.ToString(dt.Rows[0]["SecondaryRefrigeratorOrFreezerDollarsPerMonth"]);

                if (Convert.ToString(dt.Rows[0]["IsSecondaryRefrigeratorEligibleForReplacement"]) == "Y")
                {
                    chk_Second_RefrigeratorReplace_Yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IsSecondaryRefrigeratorEligibleForReplacement"]) == "N")
                {
                    chk_Second_RefrigeratorReplace_No.Checked = true;
                }
            }
        }

        catch
        {
        }
    }
    #endregion

    #region "Audit Page 5"
    public void BindData5(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_5(JobNum);
            if (dt.Rows.Count > 0)
            {
                string StrTemp = "";
                StrTemp = Convert.ToString(dt.Rows[0]["WaterHeaterTypeForPPL5"]).Replace(" ", "");
                string[] k = StrTemp.Split(',');

                for (int m = 0; m < k.Length; m++)
                {
                    for (int i = 0; i < CheckBoxList_typeofwater.Items.Count; i++)
                    {
                        if (CheckBoxList_typeofwater.Items[i].Value == k[m])
                        {
                            CheckBoxList_typeofwater.Items[i].Selected = true;
                        }
                        //CheckBoxList_typeofwater.Items[i].Enabled = false;
                    }
                }

                CheckBoxList_numberofgallons.SelectedValue = Convert.ToString(dt.Rows[0]["WaterTankGallons"]);
                txtCustomer_name.Text = Convert.ToString(dt.Rows[0]["FullName"]);
                txtCustomer_Homephone.Text = Convert.ToString(dt.Rows[0]["HomePhone"]);
                txtCustomer_Otherphone.Text = Convert.ToString(dt.Rows[0]["CellPhone"]);
                txt_numberof_Occupants.Text = Convert.ToString(dt.Rows[0]["NumberOfOccupants"]);
                CheckBoxList_occupancy.SelectedValue = Convert.ToString(dt.Rows[0]["ownertenant"]);
                //CheckBoxList_typeofwater.SelectedValue = Convert.ToString(dt.Rows[0]["WaterHeaterType"]);
                txtCustomer_case.Text = Convert.ToString(dt.Rows[0]["JobNumber"]);
                txtCustomer_address.Text = Convert.ToString(dt.Rows[0]["CityStateZipCode"]);
                txtLandlordName.Text = Convert.ToString(dt.Rows[0]["LandLordName"]);
                txtLandLordPhone.Text = Convert.ToString(dt.Rows[0]["LandLordPhone"]);
                if (Convert.ToString(dt.Rows[0]["WaterHeaterAge"]) == "1")
                {
                    chkAgeOfWater0to6.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["WaterHeaterAge"]) == "2")
                {
                    chkAgeOfWater7Year.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["WaterHeaterCondition"]) == "1")
                {
                    ConditionOfWaterHeaterGood.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["WaterHeaterCondition"]) == "2")
                {
                    ConditionOfWaterHeaterLeakingOrCorroded.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["WaterHeaterCondition"]) == "3")
                {
                    ConditionOfWaterHeaterBadThermostate.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["WaterHeaterCondition"]) == "4")
                {
                    ConditionOfWaterHeaterBadElement.Checked = true;
                }


                txtExistingWaterTemp.Text = Convert.ToString(dt.Rows[0]["ExistingWaterTemperature"]);
                if (Convert.ToString(dt.Rows[0]["DishWasherWithoutHeater"]) == "Y")
                {
                    chkDishWaterHeaterYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DishWasherWithoutHeater"]) == "N")
                {
                    chkDishWaterHeaterNo.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["TwelveYearPayBackTwelveYearPayBack"]) == "Y")
                {
                    chkAtLeast2OccupantY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["TwelveYearPayBackTwelveYearPayBack"]) == "N")
                {
                    chkAtLeast2OccupantN.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["NoDirtFloor"]) == "Y")
                {
                    chk_IsBasement_yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["NoDirtFloor"]) == "N")
                {
                    chk_IsBasement_no.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["HPWHNearExistingDrain"]) == "Y")
                {
                    chk_CondensateLineHPWHY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["HPWHNearExistingDrain"]) == "N")
                {
                    chk_CondensateLineHPWHN.Checked = true;
                }
                //if (Convert.ToString(dt.Rows[0]["TenByTenBy74"]) == "Y")
                //{
                //    chk_HPWH10by10by74Y.Checked = true;
                //}
                //else if (Convert.ToString(dt.Rows[0]["TenByTenBy74"]) == "N")
                //{
                //    chk_HPWH10by10by74N.Checked = true;
                //}

                if (Convert.ToString(dt.Rows[0]["TenByTenBy84"]) == "Y")
                {
                    chk_HPWH10by10by84Y.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["TenByTenBy84"]) == "N")
                {
                    chk_HPWH10by10by84N.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["PlumbingElectricalShape"]) == "Y")
                {
                    chk_HomePlumbingUse_yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["PlumbingElectricalShape"]) == "N")
                {
                    chk_HomePlumbingUse_no.Checked = true;
                }

                if (Convert.ToString(dt.Rows[0]["ConsistentUsageHabits"]) == "Y")
                {
                    chk_ConsistentUsageHabits_yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["ConsistentUsageHabits"]) == "N")
                {
                    chk_ConsistentUsageHabits_no.Checked = true;
                }

                if (Convert.ToString(dt.Rows[0]["CleanFilter"]) == "Y")
                {
                    chk_CleanHPWHFilter_yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["CleanFilter"]) == "N")
                {
                    chk_CleanHPWHFilter_no.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["RecommendHPWH"]) == "Y")
                {
                    chk_RecommendHPWHY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["RecommendHPWH"]) == "N")
                {
                    chk_RecommendHPWHN.Checked = true;
                }





                if (Convert.ToString(dt.Rows[0]["AmpBreaker"]) == "CP")
                {
                    chk_CondensatePump.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["AmpBreaker"]) == "ET")
                {
                    chk_10_2wire_yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["AmpBreaker"]) == "AMP")
                {
                    chk_AmpBreaker_yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["AmpBreaker"]) == "wire")
                {
                    chk_AmpBreaker_no.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["AmpBreaker"]) == "otr")
                {
                    chk_10_2wire_no.Checked = true;
                    txtHeatPumpWaterHeaterComment.Text = Convert.ToString(dt.Rows[0]["HeatPumpWaterHeaterComment"]);
                }
                DDL_RecommendHPWH_reason.SelectedValue = Convert.ToString(dt.Rows[0]["RecommendHPWH_reason"]);




                if (Convert.ToString(dt.Rows[0]["Wire102"]) == "Y")
                {
                    chk_10_2wire_yes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["Wire102"]) == "N")
                {
                    chk_10_2wire_no.Checked = true;
                }
                txt_ManufacturerDate.Text = Convert.ToString(dt.Rows[0]["ManufacturerDate"]);
                txt_Gallon.Text = Convert.ToString(dt.Rows[0]["Gallons"]);
                txt_BrandIfKnown.Text = Convert.ToString(dt.Rows[0]["BrandIfKnown"]);
                txt_EFIfKnown.Text = Convert.ToString(dt.Rows[0]["EFIfKnown"]);
                //if (Convert.ToString(dt.Rows[0]["HPWHSize"]) == "40")
                //{
                //    RecommendHPWHSize40to50Gallon.Checked = true;
                //}
                //else if (Convert.ToString(dt.Rows[0]["HPWHSize"]) == "80")
                //{
                //    RecommendHPWHSize60to80Gallon.Checked = true;
                //}
                txtCommentSection.Text = Convert.ToString(dt.Rows[0]["Comment"]);
            }
        }
        catch
        {
        }
    }
    #endregion


    #region "Audit Page 6"
    public void BindData6(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_6(JobNum);

            // Water Supply

            if (dt.Rows[0]["CityWellWaterSupply"].ToString() == "C")
            {
                chkCityWellWaterSupply_City.Checked = true;
            }

            if (dt.Rows[0]["CityWellWaterSupply"].ToString() == "W")
            {
                chkCityWellWaterSupply_Well.Checked = true;

            }

            // Expansion Tank

            if (dt.Rows[0]["ExpansionTank"].ToString() == "N")
            {
                chkExpansionTank_No.Checked = true;
            }

            if (dt.Rows[0]["ExpansionTank"].ToString() == "Y")
            {
                chkExpansionTank_Yes.Checked = true;

            }

            // If city water, does the water heater have a check valve?

            if (dt.Rows[0]["DoesHeaterHaveCheckValve"].ToString() == "Y")
            {
                chkDoesHeaterHaveCheckValve_Yes.Checked = true;
            }

            if (dt.Rows[0]["DoesHeaterHaveCheckValve"].ToString() == "N")
            {
                chkDoesHeaterHaveCheckValve_No.Checked = true;

            }

            if (dt.Rows[0]["DoesHeaterHaveCheckValve"].ToString() == "U")
            {
                chkDoesHeaterHaveCheckValve_NotSure.Checked = true;
            }

            //Supply:

            if (dt.Rows[0]["SupplyCopperPVC"].ToString() == "C")
            {
                chkSupplyCopperPVC_Copper.Checked = true;
            }

            if (dt.Rows[0]["SupplyCopperPVC"].ToString() == "P")
            {
                chkSupplyCopperPVC_PVC.Checked = true;

            }

            //PVC 30-Amp breaker
            if (dt.Rows[0]["ThirtyAmpBreaker"].ToString() == "Y")
            {
                chkThirtyAmpBreaker_Yes.Checked = true;
            }

            if (dt.Rows[0]["ThirtyAmpBreaker"].ToString() == "N")
            {
                chkThirtyAmpBreaker_No.Checked = true;

            }

            //10-2 wire
            if (dt.Rows[0]["TenTwoWire"].ToString() == "Y")
            {
                chkTenTwoWire_Yes.Checked = true;
            }

            if (dt.Rows[0]["TenTwoWire"].ToString() == "N")
            {
                chkTenTwoWire_No.Checked = true;

            }

            //Recommend Water Heater Replacement
            if (dt.Rows[0]["RecommendWaterHeaterReplacement"].ToString() == "Y")
            {
                chkRecommendWaterHeaterReplacement_Yes.Checked = true;
            }

            if (dt.Rows[0]["RecommendWaterHeaterReplacement"].ToString() == "N")
            {
                chkRecommendWaterHeaterReplacement_No.Checked = true;

            }

            // Is the household shower use at least 15 minutes per day?
            if (dt.Rows[0]["ShowerUse"].ToString() == "Y")
            {
                chkShowerUse_Yes.Checked = true;
            }

            if (dt.Rows[0]["ShowerUse"].ToString() == "N")
            {
                chkShowerUse_No.Checked = true;

            }

            // Is there a basement?
            if (dt.Rows[0]["IsThereABasement"].ToString() == "Y")
            {
                chkIsThereABasement_Yes.Checked = true;
            }

            if (dt.Rows[0]["IsThereABasement"].ToString() == "N")
            {
                chkIsThereABasement_No.Checked = true;

            }

            //Is the drain stack servicing the most used shower(s) exposed?
            if (dt.Rows[0]["DrainStackServicing"].ToString() == "Y")
            {
                chkDrainStackServicing_Yes.Checked = true;
            }

            if (dt.Rows[0]["DrainStackServicing"].ToString() == "N")
            {
                chkDrainStackServicing_No.Checked = true;
            }

            //Is the diameter of the drain pipe at least 3"?
            if (dt.Rows[0]["DrainPipeDiameter"].ToString() == "Y")
            {
                chkDrainPipeDiameter_Yes.Checked = true;
            }

            if (dt.Rows[0]["DrainPipeDiameter"].ToString() == "N")
            {
                chkDrainPipeDiameter_No.Checked = true;
            }

            //Recommend GFX?
            if (dt.Rows[0]["RecommendGFX"].ToString() == "S")
            {
                chkRecommendGFX_S_GFX.Checked = true;
            }

            if (dt.Rows[0]["RecommendGFX"].ToString() == "Y")
            {
                chkRecommendGFX_G_GFX_Yes.Checked = true;

            }
            if (dt.Rows[0]["RecommendGFX"].ToString() == "N")
            {
                chkRecommendGFX_G_GFX_No.Checked = true;

            }
            //Water Heater Repair
            if (dt.Rows[0]["WaterHeaterRepair"].ToString() == "Y")
            {
                chkWaterHeaterRepair_Yes.Checked = true;

            }
            if (dt.Rows[0]["WaterHeaterRepair"].ToString() == "N")
            {
                chkWaterHeaterRepair_No.Checked = true;

            }
            // Repair Water Leaks
            if (dt.Rows[0]["RepairWaterLeaks"].ToString() == "Y")
            {
                chkRepairWaterLeaks_Yes.Checked = true;

            }
            if (dt.Rows[0]["RepairWaterLeaks"].ToString() == "N")
            {
                chkRepairWaterLeaks_No.Checked = true;

            }
            // Low Flow Showerheads
            if (dt.Rows[0]["LowFlowShowerHeads"].ToString() == "Y")
            {
                chkLowFlowShowerHeads_Yes.Checked = true;

            }
            if (dt.Rows[0]["LowFlowShowerHeads"].ToString() == "N")
            {
                chkLowFlowShowerHeads_No.Checked = true;

            }
            // Vertical Height
            if (dt.Rows[0]["VerticalHeight"].ToString() == "Y")
            {
                chkVerticalHeight_Yes.Checked = true;

            }
            if (dt.Rows[0]["VerticalHeight"].ToString() == "N")
            {
                chkVerticalHeight_No.Checked = true;

            }
            //   Aerator(s)
            if (dt.Rows[0]["Aerators"].ToString() == "Y")
            {
                chkAerators_Yes.Checked = true;

            }
            if (dt.Rows[0]["Aerators"].ToString() == "N")
            {
                chkAerators_No.Checked = true;

            }
            // Water Pipe Insulation)
            if (dt.Rows[0]["WaterPipeInsulation"].ToString() == "Y")
            {
                chkWaterPipeInsulation_Yes.Checked = true;

            }
            if (dt.Rows[0]["WaterPipeInsulation"].ToString() == "N")
            {
                chkWaterPipeInsulation_No.Checked = true;

            }
            // Solar Water Maintenance (existing PPL installs)
            if (dt.Rows[0]["SolarWater"].ToString() == "Y")
            {
                chkSolarWater_Yes.Checked = true;

            }
            if (dt.Rows[0]["SolarWater"].ToString() == "N")
            {
                chkSolarWater_No.Checked = true;

            }
            //  Full Cost Measures
            if (dt.Rows[0]["FullCostMeasures"].ToString() == "Y")
            {
                chkFull_Cost_Measures_Yes.Checked = true;

            }
            if (dt.Rows[0]["FullCostMeasures"].ToString() == "N")
            {
                chkFull_Cost_Measures_No.Checked = true;

            }
            //Baseload Measures
            if (dt.Rows[0]["BaseloadMeasures"].ToString() == "Y")
            {
                chkBaseloadMeasures_Yes.Checked = true;

            }
            if (dt.Rows[0]["BaseloadMeasures"].ToString() == "N")
            {
                chkBaseloadMeasures_No.Checked = true;

            }


            ////////////////////////////////////////////////////////////////////////////////////////////

            if (dt.Rows[0]["ChkReasonForNotRecommending"].ToString() == "Y")
            {
                ChkReasonForNotRecommending.Checked = true;
            }
            else if (dt.Rows[0]["ChkReasonForNotRecommending"].ToString() == "N")
            {
                ChkReasonForNotRecommending.Checked = false;
            }

            if (dt.Rows[0]["ChkReasonForNotRecommending"].ToString() == "Y")
            {
                ChkReasonForNotRecommending.Checked = true;
            }
            else if (dt.Rows[0]["ChkReasonForNotRecommending"].ToString() == "N")
            {
                ChkReasonForNotRecommending7Year.Checked = true;
            }

            if (dt.Rows[0]["FaucetRepair"].ToString() == "Y")
            {
                ChkFaucetRepair_Yes.Checked = true;
            }
            else if (dt.Rows[0]["FaucetRepair"].ToString() == "N")
            {
                ChkFaucetRepair_No.Checked = true;
            }


            txtFaucetRepairLocation.Text = dt.Rows[0]["FaucetRepairLocation"].ToString();

            //////////////////////////////////////////////////////////////////////////////////////////////  


            txtBrand.Text = dt.Rows[0]["Brand"].ToString();
            txtReplacementSize.Text = dt.Rows[0]["ReplacementSize"].ToString();
            txtTemperature.Text = dt.Rows[0]["Temperature"].ToString();
            txtReasonForNotRecommending.Text = dt.Rows[0]["ReasonForNotRecommending"].ToString();
            txtWaterHeaterRepairComments.Text = dt.Rows[0]["WaterHeaterRepairComments"].ToString();
            txtRepairWaterLeaksComments.Text = dt.Rows[0]["RepairWaterLeaksComments"].ToString();
            txtLowFlowShowerHeadsComments.Text = dt.Rows[0]["LowFlowShowerHeadsComments"].ToString();
            txtAeratorsComments.Text = dt.Rows[0]["AeratorsComments"].ToString();
            txtWaterPipeInsulationSizeComments.Text = dt.Rows[0]["WaterPipeInsulationSizeComments"].ToString();
            txtWaterPipeInsulationFeetComments.Text = dt.Rows[0]["WaterPipeInsulationFeetComments"].ToString();
            txtSolarWaterComments.Text = dt.Rows[0]["SolarWaterComments"].ToString();

        }
        catch
        {
        }
    }
    #endregion


    #region "Audit Page 7"
    public void BindData7(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_7(JobNum);

            // Health And Safety Combustion

            if (dt.Rows[0]["HealthAndSafetyCombustionCheckbox"].ToString() == "Y")
            {
                chkHealthAndSafetyCombustionCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["HealthAndSafetyCombustionCheckbox"].ToString() == "N")
            {
                chkHealthAndSafetyCombustionCheckbox_No.Checked = true;

            }
            txtHealthAndSafetyCombustionComments.Text = dt.Rows[0]["HealthAndSafetyCombustionComments"].ToString();

            // Blower Door Depressurization

            if (dt.Rows[0]["BlowerDoorDepressurizationCheckbox"].ToString() == "Y")
            {
                chkBlowerDoor_DepressurizationCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["BlowerDoorDepressurizationCheckbox"].ToString() == "N")
            {
                chkBlowerDoor_DepressurizationCheckbox_No.Checked = true;

            }
            txtBlowerDoor_Depressurization_Comments.Text = dt.Rows[0]["BlowerDoorDepressurizationComments"].ToString();


            //  Blower Door Pressurization (Contaminates)

            if (dt.Rows[0]["BlowerDoorPressurizationCheckbox"].ToString() == "Y")
            {
                chkBlowerDoor_Pressurization_Checkbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["BlowerDoorPressurizationCheckbox"].ToString() == "N")
            {
                chkBlowerDoor_Pressurization_Checkbox_No.Checked = true;

            }
            txtBlowerDoor_Pressurization_Comments.Text = dt.Rows[0]["BlowerDoorPressurizationComments"].ToString();


            //Zonal Pressure Diagnostics

            if (dt.Rows[0]["ZonalPressureDiagnosticsCheckbox"].ToString() == "Y")
            {
                chkZonalPressure_DiagnosticsCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["ZonalPressureDiagnosticsCheckbox"].ToString() == "N")
            {
                chkZonalPressure_DiagnosticsCheckbox_No.Checked = true;

            }
            txtZonalPressure_DiagnosticsComments.Text = dt.Rows[0]["ZonalPressureDiagnosticsComments"].ToString();



            // Ductwork Test
            if (dt.Rows[0]["DuctworkTestCheckbox"].ToString() == "Y")
            {
                chkDuctworkTestCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["DuctworkTestCheckbox"].ToString() == "N")
            {
                chkDuctworkTestCheckbox_No.Checked = true;

            }

            txtDuctworkTestComments.Text = dt.Rows[0]["DuctworkTestComments"].ToString();


            //Final Combustion Test
            if (dt.Rows[0]["FinalCombustionTestCheckbox"].ToString() == "Y")
            {
                chkFinalCombustionTestCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["FinalCombustionTestCheckbox"].ToString() == "N")
            {
                chkFinalCombustionTestCheckbox_No.Checked = true;

            }
            txtFinalCombustionTestComments.Text = dt.Rows[0]["FinalCombustionTestComments"].ToString();

            //Health & Safety
            if (dt.Rows[0]["HealthAndSafetyCheckbox"].ToString() == "Y")
            {
                chkHealthAndSafetyCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["HealthAndSafetyCheckbox"].ToString() == "N")
            {
                chkHealthAndSafetyCheckbox_No.Checked = true;

            }
            txtHealthAndSafetyComments.Text = dt.Rows[0]["HealthAndSafetyComments"].ToString();



            // Major Repairs (e.g. broken glass)
            if (dt.Rows[0]["MajorRepairsCheckbox"].ToString() == "Y")
            {
                chkMajorRepairsCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["MajorRepairsCheckbox"].ToString() == "N")
            {
                chkMajorRepairsCheckbox_No.Checked = true;

            }
            txtMajorRepairsComments.Text = dt.Rows[0]["MajorRepairsComments"].ToString();



            // Electric Heat Repairs
            if (dt.Rows[0]["ElectricHeatRepairsCheckbox"].ToString() == "Y")
            {
                chkElectricHeatRepairsCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["ElectricHeatRepairsCheckbox"].ToString() == "N")
            {
                chkElectricHeatRepairsCheckbox_No.Checked = true;

            }
            txtElectricHeatRepairsComments.Text = dt.Rows[0]["ElectricHeatRepairsComments"].ToString();



            //  Attic Insulation
            if (dt.Rows[0]["AtticInsulationCheckbox"].ToString() == "Y")
            {
                chkAtticInsulationCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["AtticInsulationCheckbox"].ToString() == "N")
            {
                chkAtticInsulationCheckbox_No.Checked = true;

            }
            txtAtticInsulationComments.Text = dt.Rows[0]["AtticInsulationComments"].ToString();



            //  Seal Attic Bypasses & Chaseways
            if (dt.Rows[0]["SealAtticBypassesCheckbox"].ToString() == "Y")
            {
                chkSealAtticBypassesCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["SealAtticBypassesCheckbox"].ToString() == "N")
            {
                chkSealAtticBypassesCheckbox_No.Checked = true;

            }
            txtSealAtticBypassesComments.Text = dt.Rows[0]["SealAtticBypassesComments"].ToString();



            //   Wall Insulation
            if (dt.Rows[0]["WallInsulationCheckbox"].ToString() == "Y")
            {
                chkWallInsulationCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["WallInsulationCheckbox"].ToString() == "N")
            {
                chkWallInsulationCheckbox_No.Checked = true;

            }
            txtWallInsulationComments.Text = dt.Rows[0]["WallInsulationComments"].ToString();



            //        Floor Insulation
            if (dt.Rows[0]["FloorInsulationCheckbox"].ToString() == "Y")
            {
                chkFloorInsulationCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["FloorInsulationCheckbox"].ToString() == "N")
            {
                chkFloorInsulationCheckbox_No.Checked = true;

            }
            txtFloorInsulationComments.Text = dt.Rows[0]["FloorInsulationComments"].ToString();


            // Windows & Door Measures
            if (dt.Rows[0]["WindowAndDoorMeasuresCheckbox"].ToString() == "Y")
            {
                chkWindowAndDoorMeasuresCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["WindowAndDoorMeasuresCheckbox"].ToString() == "N")
            {
                chkWindowAndDoorMeasuresCheckbox_No.Checked = true;

            }
            txtWindowAndDoorMeasuresComments.Text = dt.Rows[0]["WindowAndDoorMeasuresComments"].ToString();


            //   Heating Measures
            if (dt.Rows[0]["HeatingMeasuresCheckbox"].ToString() == "Y")
            {
                chkHeatingMeasuresCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["HeatingMeasuresCheckbox"].ToString() == "N")
            {
                chkHeatingMeasuresCheckbox_No.Checked = true;

            }
            txtHeatingMeasuresComments.Text = dt.Rows[0]["HeatingMeasuresComments"].ToString();



            //   Cooling Measures
            if (dt.Rows[0]["CoolingMeasuresCheckbox"].ToString() == "Y")
            {
                chkCoolingMeasuresCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["CoolingMeasuresCheckbox"].ToString() == "N")
            {
                chkCoolingMeasuresCheckbox_No.Checked = true;

            }
            txtCoolingMeasuresComments.Text = dt.Rows[0]["CoolingMeasuresComments"].ToString();


            //   Other Measures
            if (dt.Rows[0]["OtherMeasuresCheckbox"].ToString() == "Y")
            {
                chkOtherMeasuresCheckbox_Yes.Checked = true;
            }

            if (dt.Rows[0]["OtherMeasuresCheckbox"].ToString() == "N")
            {
                chkOtherMeasuresCheckbox_No.Checked = true;

            }
            txtOtherMeasuresComments.Text = dt.Rows[0]["OtherMeasuresComments"].ToString();
        }
        catch
        {
        }
    }
    #endregion


    #region "Audit Page 8"
    public void BindData8(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_8(JobNum);
            if (dt.Rows.Count > 0)
            {
                txtBasement_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["BasementBlowerDoorPretreat"]);
                txtBasement_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["BasementBlowerDoorFinal"]);
                txtBasementHouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["BasementHouseZonePretreat"]);
                txtBasementHouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["BasementHouseZoneFinal"]);
                txtBasementZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["BasementZoneOutsidePretreat"]);
                txtBasementZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["BasementZoneOutsideFinal"]);
                txtVentedCrawlSpace_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["CrawlspaceBlowerDoorPretreat"]);
                txtVentedCrawlSpace_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["CrawlspaceBlowerDoorFinal"]);
                txtVentedCrawlSpaceHouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["VentedCrawlSpaceHouseZonePretreat"]);
                txtVentedCrawlSpaceHouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["VentedCrawlSpaceHouseZoneFinal"]);
                txtVentedCrawlSpaceZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["VentedCrawlSpaceZoneOutsidePretreat"]);
                txtVentedCrawlSpaceZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["VentedCrawlSpaceZoneOutsideFinal"]);
                txtAttic_A_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["AtticABlowerDoorPretreat"]);
                txtAttic_A_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["AtticABlowerDoorFinal"]);
                txtAttic_A_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["AtticAHouseZonePretreat"]);
                txtAttic_A_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["AtticAHouseZoneFinal"]);
                txtAttic_A_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["AtticAZoneOutsidePretreat"]);
                txtAttic_A_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["AtticAZoneOutsideFinal"]);
                txtAttic_B_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["AtticBBlowerDoorPretreat"]);
                txtAttic_B_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["AtticBBlowerDoorFinal"]);
                txtAttic_B_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["AtticBHouseZonePretreat"]);
                txtAttic_B_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["AtticBHouseZoneFinal"]);
                txtAttic_B_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["AtticBZoneOutsidePretreat"]);
                txtAttic_B_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["AtticBZoneOutsideFinal"]);
                txtKneewall_A_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["KneeWallABlowerDoorPretreat"]);
                txtKneewall_A_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["KneeWallABlowerDoorFinal"]);
                txtKneewall_A_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["KneewallAHouseZonePretreat"]);
                txtKneewall_A_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["KneewallAHouseZoneFinal"]);
                txtKneewall_A_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["KneewallAZoneOutsidePretreat"]);
                txtKneewall_A_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["KneewallAZoneOutsideFinal"]);
                txtKneewall_B_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["KneeWallBBlowerDoorPretreat"]);
                txtKneewall_B_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["KneeWallBBlowerDoorFinal"]);
                txtKneewall_B_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["KneewallBHouseZonePretreat"]);
                txtKneewall_B_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["KneewallBHouseZoneFinal"]);
                txtKneewall_B_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["KneewallBZoneOutsidePretreat"]);
                txtKneewall_B_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["KneewallBZoneOutsideFinal"]);
                txtGarage_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["GarageBlowerDoorPretreat"]);
                txtGarage_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["GarageBlowerDoorFinal"]);
                txtGarageHouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["GarageHouseZonePretreat"]);
                txtGarageHouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["GarageHouseZoneFinal"]);
                txtGarageZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["GarageZoneOutsidePretreat"]);
                txtGarageZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["GarageZoneOutsideFinal"]);
                txtGarage_Attic_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["GarageAtticBlowerDoorPretreat"]);
                txtGarage_AtticBlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["GarageAtticBlowerDoorFinal"]);
                txtGarage_AtticHouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["GarageAtticHouseZonePretreat"]);
                txtGarage_AtticHouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["GarageAtticHouseZoneFinal"]);
                txtGarage_AtticZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["GarageAtticZoneOutsidePretreat"]);
                txtGarage_AtticZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["GarageAtticZoneOutsideFinal"]);
                txtCantilever_Overhang_1_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["Cantilever1BlowerDoorPretreat"]);
                txtCantilever_Overhang_1_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["Cantilever1BlowerDoorFinal"]);
                txtCantilever_Overhang_1_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang1HouseZonePretreat"]);
                txtCantilever_Overhang_1_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang1HouseZoneFinal"]);
                txtCantilever_Overhang_1_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang1ZoneOutsidePretreat"]);
                txtCantilever_Overhang_1_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang1ZoneOutsideFinal"]);
                txtCantilever_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["Cantilever2BlowerDoorPretreat"]);
                txtCantilever_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["Cantilever2BlowerDoorFinal"]);
                txtCantilever_Overhang_2_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang2HouseZonePretreat"]);
                txtCantilever_Overhang_2_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang2HouseZoneFinal"]);
                txtCantilever_Overhang_2_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang2ZoneOutsidePretreat"]);
                txtCantilever_Overhang_2_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["CantileverOverhang2ZoneOutsideFinal"]);
                txtOther1_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["Other1BlowerDoorPretreat"]);
                txtOther1_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["Other1BlowerDoorFinal"]);
                txtOther1HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["Other1HouseZonePretreat"]);
                txtOther1HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["Other1HouseZoneFinal"]);
                txtOther1ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["Other1ZoneOutsidePretreat"]);
                txtOther1ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["Other1ZoneOutsideFinal"]);
                txtOther_2_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["Other2BlowerDoorPretreat"]);
                txtOther_2_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["Other2BlowerDoorFinal"]);
                txtOther_2_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["Other2HouseZonePretreat"]);
                txtOther_2_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["Other2HouseZoneFinal"]);
                txtOther_2_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["Other2ZoneOutsidePretreat"]);
                txtOther_2_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["Other2ZoneOutsideFinal"]);
                txtOther_3_BlowerDoorPretreat.Text = Convert.ToString(dt.Rows[0]["Other3BlowerDoorPretreat"]);
                txtOther_3_BlowerDoorFinal.Text = Convert.ToString(dt.Rows[0]["Other3BlowerDoorFinal"]);
                txtOther_3_HouseZonePretreat.Text = Convert.ToString(dt.Rows[0]["Other3HouseZonePretreat"]);
                txtOther_3_HouseZoneFinal.Text = Convert.ToString(dt.Rows[0]["Other3HouseZoneFinal"]);
                txtOther_3_ZoneOutsidePretreat.Text = Convert.ToString(dt.Rows[0]["Other3ZoneOutsidePretreat"]);
                txtOther_3_ZoneOutsideFinal.Text = Convert.ToString(dt.Rows[0]["Other3ZoneOutsideFinal"]);
                txtTargetMVG.Text = Convert.ToString(dt.Rows[0]["TargetMVG"]);
                txtPreweatherizationreadingBDO.Text = Convert.ToString(dt.Rows[0]["PreweatherizationreadingBDO"]);
                txtIndoorTemperature.Text = Convert.ToString(dt.Rows[0]["IndoorTemperature"]);
                txtPreweatherizationreadingBDClosed.Text = Convert.ToString(dt.Rows[0]["PreweatherizationreadingBDClosed"]);
                txtOutdoorTemperature.Text = Convert.ToString(dt.Rows[0]["OutdoorTemperature"]);
                txtPostweatherizationreading.Text = Convert.ToString(dt.Rows[0]["Postweatherizationreading"]);
                txtTotalReduction.Text = Convert.ToString(dt.Rows[0]["TotalReduction"]);
                if (Convert.ToString(dt.Rows[0]["PostweatherizationreadingOpenOrClosedCheckbox"]) == "O")
                {
                    chkPostweatherizationreadingOpenOrClosedCheckbox_Open.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["PostweatherizationreadingOpenOrClosedCheckbox"]) == "C")
                {
                    chkPostweatherizationreadingOpenOrClosedCheckbox_Close.Checked = true;
                }
            }
        }
        catch
        {
        }
    }
    #endregion


    #region "Audit Page 9"
    public void BindData9(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_9(JobNum);
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToString(dt.Rows[0]["AnyCombustionAppliancesInHomeCheckbox"]) == "Y")
                {
                    CombustionAppliancesHomeY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["AnyCombustionAppliancesInHomeCheckbox"]) == "N")
                {
                    CombustionAppliancesHomeN.Checked = true;
                }

                if (Convert.ToString(dt.Rows[0]["CombustibleEquipmentSafetyTestingDoneCheckbox"]) == "Y")
                {
                    CombustibleEquipmentSafetyTestingY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["CombustibleEquipmentSafetyTestingDoneCheckbox"]) == "N")
                {
                    CombustibleEquipmentSafetyTestingN.Checked = true;
                }

                txt_OutdoorTemperature.Text = Convert.ToString(dt.Rows[0]["OutDoorTemperature"]);
                txt_WaterHeater_CO_AMB.Text = Convert.ToString(dt.Rows[0]["WaterHeaterAMB"]);
                txt_WaterHeater_CO_CAZ.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCAZ"]);
                txt_WaterHeater_BackDraft_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterBackDraftNAT"]);
                txt_WaterHeater_BackDraft_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterBackDraftWC"]);
                txt_WaterHeater_DarftEstablished_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftEstablishedNAT"]);
                txt_WaterHeater_DarftEstablished_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftEstablishedWC"]);
                txt_WaterHeater_DarftPressure_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterPressureNAT"]);
                txt_WaterHeater_DarftPressure_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterPressureWC"]);
                txt_WaterHeater_DarftPass_NAT.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassedNAT"]);
                txt_WaterHeater_DarftPass_WC.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassedWC"]);
                txt_WaterHeater_UndilCOFlue.Text = Convert.ToString(dt.Rows[0]["WaterHeaterUndilCOFlue"]);
                txt_WaterHeater_GasLeackDet.Text = Convert.ToString(dt.Rows[0]["WaterHeaterGasLeakDetected"]);
                txt_WaterHeater_PrecentEff.Text = Convert.ToString(dt.Rows[0]["WaterHeaterPercentEfficiency"]);


                txt_FurnaceBoiler_CO_AMB.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerAMB"]);
                txt_FurnaceBoiler_CO_CAZ.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCAZ"]);
                txt_FurnaceBoiler_BackDraft_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerBackDraftNAT"]);
                txt_FurnaceBoiler_BackDraft_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerBackDraftWC"]);
                txt_FurnaceBoiler_DraftEstablished_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftEstablishedNAT"]);
                txt_FurnaceBoiler_DraftEstablished_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftEstablishedWC"]);
                txt_FurnaceBoiler_DarftPressure_NAT.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerPressureNAT"]);
                txt_FurnaceBoiler_DarftPressure_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerPressureWC"]);
                txt_FurnaceBoiler_DarftPass_NA.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassedNAT"]);
                txt_FurnaceBoiler_DarftPass_WC.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassedWC"]);
                txt_FurnaceBoiler_UndilCOFlue.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerUndilCOFlue"]);
                txt_FurnaceBoiler_GasLeackDet.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerGasLeakDetected"]);
                txt_FurnaceBoiler_PrecentEff.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerPercentEfficiency"]);

                txt_Outher1_CO_AMB.Text = Convert.ToString(dt.Rows[0]["Other1AMB"]);
                txt_Outher1_CO_CAZ.Text = Convert.ToString(dt.Rows[0]["Other1CAZ"]);
                txt_Outher1_BackDraft_NAT.Text = Convert.ToString(dt.Rows[0]["Other1BackDraftNAT"]);
                txt_Outher1_BackDraft_WC.Text = Convert.ToString(dt.Rows[0]["Other1BackDraftWC"]);
                txt_Outher1_DarftEstablished_NAT.Text = Convert.ToString(dt.Rows[0]["Other1DraftEstablishedNAT"]);
                txt_Outher1_DarftEstablished_WC.Text = Convert.ToString(dt.Rows[0]["Other1DraftEstablishedWC"]);
                txt_Outher1_DarftPressure_NAT.Text = Convert.ToString(dt.Rows[0]["Other1PressureNAT"]);
                txt_Outher1_DarftPressure_WC.Text = Convert.ToString(dt.Rows[0]["Other1PressureWC"]);
                txt_Outher1_DarftPass_NA.Text = Convert.ToString(dt.Rows[0]["Other1DraftPassedNAT"]);
                txt_Outher1_DarftPass_WC.Text = Convert.ToString(dt.Rows[0]["Other1DraftPassedWC"]);
                txt_Outher1_UndilCOFlue.Text = Convert.ToString(dt.Rows[0]["Other1UndilCOFlue"]);
                txt_Outher1_GasLeackDet.Text = Convert.ToString(dt.Rows[0]["Other1GasLeakDetected"]);
                txt_Outher1_PrecentEff.Text = Convert.ToString(dt.Rows[0]["Other1PercentEfficiency"]);

                txt_Outher2_CO_AMB.Text = Convert.ToString(dt.Rows[0]["Other2AMB"]);
                txt_Outher2_CO_CAZ.Text = Convert.ToString(dt.Rows[0]["Other2CAZ"]);
                txt_Outher2_BackDraft_NAT.Text = Convert.ToString(dt.Rows[0]["Other2BackDraftNAT"]);
                txt_Outher2_BackDraft_WC.Text = Convert.ToString(dt.Rows[0]["Other2BackDraftWC"]);
                txt_Outher2_DarftEstablished_NAT.Text = Convert.ToString(dt.Rows[0]["Other2DraftEstablishedNAT"]);
                txt_Outher2_DarftEstablished_WC.Text = Convert.ToString(dt.Rows[0]["Other2DraftEstablishedWC"]);
                txt_Outher2_DarftPressure_NAT.Text = Convert.ToString(dt.Rows[0]["Other2PressureNAT"]);
                txt_Outher2_DarftPressure_WC.Text = Convert.ToString(dt.Rows[0]["Other2PressureWC"]);
                txt_Outher2_DarftPass_NA.Text = Convert.ToString(dt.Rows[0]["Other2DraftPassedNAT"]);
                txt_Outher2_DarftPass_WC.Text = Convert.ToString(dt.Rows[0]["Other2DraftPassedWC"]);
                txt_Outher2_UndilCOFlue.Text = Convert.ToString(dt.Rows[0]["Other2UndilCOFlue"]);
                txt_Outher2_GasLeackDet.Text = Convert.ToString(dt.Rows[0]["Other2GasLeakDetected"]);
                txt_Outher2_PrecentEff.Text = Convert.ToString(dt.Rows[0]["Other2PercentEfficiency"]);


                txt_RearLeftBurner.Text = Convert.ToString(dt.Rows[0]["BackBurnerLeftCO"]);
                if (Convert.ToString(dt.Rows[0]["BackBurnerLeftRadio"]) == "Y")
                {
                    rdo_RearLeftBurner1.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["BackBurnerLeftRadio"]) == "N")
                {
                    rdo_RearLeftBurner1.Checked = false;
                }




                if (Convert.ToString(dt.Rows[0]["BackBurnerRightRadio"]) == "Y")
                {
                    rdo_RearLeftBurner2.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["BackBurnerRightRadio"]) == "N")
                {
                    rdo_RearLeftBurner2.Checked = false;
                }
                txt_RearRightBurner.Text = Convert.ToString(dt.Rows[0]["BackBurnerRightCO"]);







                txt_FrontLeftBurner.Text = Convert.ToString(dt.Rows[0]["FrontBurnerLeftCO"]);
                if (Convert.ToString(dt.Rows[0]["FrontBurnerLeftRadio"]) == "Y")
                {
                    rdo_FrontLeftBurner1.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["FrontBurnerLeftRadio"]) == "N")
                {
                    rdo_FrontLeftBurner1.Checked = false;
                }





                if (Convert.ToString(dt.Rows[0]["FrontBurnerRightRadio"]) == "Y")
                {
                    rdo_FrontLeftBurner2.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["FrontBurnerRightRadio"]) == "N")
                {
                    rdo_FrontLeftBurner2.Checked = false;
                }
                txt_FrontRightBurner.Text = Convert.ToString(dt.Rows[0]["FrontBurnerRightCO"]);




                if (Convert.ToString(dt.Rows[0]["DryerWorstCaseCheckBox"]) == "Y")
                {
                    chk_CheckAppliancesWorstCaseTestDryerY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["DryerWorstCaseCheckBox"]) == "N")
                {
                    chk_CheckAppliancesWorstCaseTestDryerN.Checked = true;
                }

                if (Convert.ToString(dt.Rows[0]["WholeHouseFanWorstCaseCheckBox"]) == "Y")
                {
                    chk_CheckAppliancesWorstCaseTestWholeHouseFanY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["WholeHouseFanWorstCaseCheckBox"]) == "N")
                {
                    chk_CheckAppliancesWorstCaseTestWholeHouseFanN.Checked = true;
                }

                if (Convert.ToString(dt.Rows[0]["BathFanWorstCaseCheckBox"]) == "Y")
                {
                    chk_CheckAppliancesWorstCaseTestBathFanY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["BathFanWorstCaseCheckBox"]) == "N")
                {
                    chk_CheckAppliancesWorstCaseTestBathFanN.Checked = true;
                }

                if (Convert.ToString(dt.Rows[0]["KitchenFanWorstCaseCheckBox"]) == "Y")
                {
                    chk_CheckAppliancesWorstCaseTestKitchenFanY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["KitchenFanWorstCaseCheckBox"]) == "N")
                {
                    chk_CheckAppliancesWorstCaseTestKitchenFanN.Checked = true;
                }

                if (Convert.ToString(dt.Rows[0]["HVACAirHandlerWorstCaseCheckBox"]) == "Y")
                {
                    chk_HVACAirHandlerY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["HVACAirHandlerWorstCaseCheckBox"]) == "N")
                {
                    chk_HVACAirHandlerN.Checked = true;
                }

                if (Convert.ToString(dt.Rows[0]["EmergencySituationCheckBox"]) == "Y")
                {
                    chk_EmergencySituationGasCompanyCalledY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["EmergencySituationCheckBox"]) == "N")
                {
                    chk_EmergencySituationGasCompanyCalledN.Checked = true;
                }

                if (Convert.ToString(dt.Rows[0]["WorkCannotContinueCheckBox"]) == "Y")
                {
                    chk_WorkCannotContinueToActionLevelY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["WorkCannotContinueCheckBox"]) == "N")
                {
                    chk_WorkCannotContinueToActionLevelN.Checked = true;
                }

                txt_OvenCODataCOAmbient.Text = Convert.ToString(dt.Rows[0]["COAmbient"]);
                txt_OvenCODataCOAtOvenVent.Text = Convert.ToString(dt.Rows[0]["COAtOvenVent"]);
                txt_CAZNat.Text = Convert.ToString(dt.Rows[0]["NATVAL"]);
                txt_CAZPass.Text = Convert.ToString(dt.Rows[0]["PASSVAL"]);
                txt_CAZWC.Text = Convert.ToString(dt.Rows[0]["WCVAL"]);
                txt_CAZDiff.Text = Convert.ToString(dt.Rows[0]["DIFFVAL"]);
                txt_COAlarmsInstalledLocations.Text = Convert.ToString(dt.Rows[0]["COAlarmsInTheseLocations"]);

            }
        }
        catch
        {
        }
    }
    #endregion


    #region "Audit Page 9Post"
    public void BindData9Post(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_9Post(JobNum);
            if (dt.Rows.Count > 0)
            {
               
                    ViewIMG.Visible = false;
                    if (Convert.ToString(dt.Rows[0]["AnyCombustionAppliancesInHomeCheckbox"]) == "Y")
                    {
                        CombustionAppliancesHomeY_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["AnyCombustionAppliancesInHomeCheckbox"]) == "N")
                    {
                        CombustionAppliancesHomeN_P.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["CombustibleEquipmentSafetyTestingDoneCheckbox"]) == "Y")
                    {
                        CombustibleEquipmentSafetyTestingY_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["CombustibleEquipmentSafetyTestingDoneCheckbox"]) == "N")
                    {
                        CombustibleEquipmentSafetyTestingN_P.Checked = true;
                    }

                    txt_OutdoorTemperature_P.Text = Convert.ToString(dt.Rows[0]["OutDoorTemperature"]);
                    txt_WaterHeater_CO_AMB_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterAMB"]);
                    txt_WaterHeater_CO_CAZ_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterCAZ"]);
                    txt_WaterHeater_BackDraft_NAT_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterBackDraftNAT"]);
                    txt_WaterHeater_BackDraft_WC_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterBackDraftWC"]);
                    txt_WaterHeater_DarftEstablished_NAT_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftEstablishedNAT"]);
                    txt_WaterHeater_DarftEstablished_WC_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftEstablishedWC"]);
                    txt_WaterHeater_DarftPressure_NAT_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterPressureNAT"]);
                    txt_WaterHeater_DarftPressure_WC_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterPressureWC"]);
                    txt_WaterHeater_DarftPass_NAT_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassedNAT"]);
                    txt_WaterHeater_DarftPass_WC_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterDraftPassedWC"]);
                    txt_WaterHeater_UndilCOFlue_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterUndilCOFlue"]);
                    txt_WaterHeater_GasLeackDet_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterGasLeakDetected"]);
                    txt_WaterHeater_PrecentEff_P.Text = Convert.ToString(dt.Rows[0]["WaterHeaterPercentEfficiency"]);


                    txt_FurnaceBoiler_CO_AMB_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerAMB"]);
                    txt_FurnaceBoiler_CO_CAZ_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerCAZ"]);
                    txt_FurnaceBoiler_BackDraft_NAT_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerBackDraftNAT"]);
                    txt_FurnaceBoiler_BackDraft_WC_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerBackDraftWC"]);
                    txt_FurnaceBoiler_DraftEstablished_NAT_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftEstablishedNAT"]);
                    txt_FurnaceBoiler_DraftEstablished_WC_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftEstablishedWC"]);
                    txt_FurnaceBoiler_DarftPressure_NAT_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerPressureNAT"]);
                    txt_FurnaceBoiler_DarftPressure_WC_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerPressureWC"]);
                    txt_FurnaceBoiler_DarftPass_NA_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassedNAT"]);
                    txt_FurnaceBoiler_DarftPass_WC_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerDraftPassedWC"]);
                    txt_FurnaceBoiler_UndilCOFlue_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerUndilCOFlue"]);
                    txt_FurnaceBoiler_GasLeackDet_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerGasLeakDetected"]);
                    txt_FurnaceBoiler_PrecentEff_P.Text = Convert.ToString(dt.Rows[0]["FurnaceBoilerPercentEfficiency"]);

                    txt_Outher1_CO_AMB_P.Text = Convert.ToString(dt.Rows[0]["Other1AMB"]);
                    txt_Outher1_CO_CAZ_P.Text = Convert.ToString(dt.Rows[0]["Other1CAZ"]);
                    txt_Outher1_BackDraft_NAT_P.Text = Convert.ToString(dt.Rows[0]["Other1BackDraftNAT"]);
                    txt_Outher1_BackDraft_WC_P.Text = Convert.ToString(dt.Rows[0]["Other1BackDraftWC"]);
                    txt_Outher1_DarftEstablished_NAT_P.Text = Convert.ToString(dt.Rows[0]["Other1DraftEstablishedNAT"]);
                    txt_Outher1_DarftEstablished_WC_P.Text = Convert.ToString(dt.Rows[0]["Other1DraftEstablishedWC"]);
                    txt_Outher1_DarftPressure_NAT_P.Text = Convert.ToString(dt.Rows[0]["Other1PressureNAT"]);
                    txt_Outher1_DarftPressure_WC_P.Text = Convert.ToString(dt.Rows[0]["Other1PressureWC"]);
                    txt_Outher1_DarftPass_NA_P.Text = Convert.ToString(dt.Rows[0]["Other1DraftPassedNAT"]);
                    txt_Outher1_DarftPass_WC_P.Text = Convert.ToString(dt.Rows[0]["Other1DraftPassedWC"]);
                    txt_Outher1_UndilCOFlue_P.Text = Convert.ToString(dt.Rows[0]["Other1UndilCOFlue"]);
                    txt_Outher1_GasLeackDet_P.Text = Convert.ToString(dt.Rows[0]["Other1GasLeakDetected"]);
                    txt_Outher1_PrecentEff_P.Text = Convert.ToString(dt.Rows[0]["Other1PercentEfficiency"]);

                    txt_Outher2_CO_AMB_P.Text = Convert.ToString(dt.Rows[0]["Other2AMB"]);
                    txt_Outher2_CO_CAZ_P.Text = Convert.ToString(dt.Rows[0]["Other2CAZ"]);
                    txt_Outher2_BackDraft_NAT_P.Text = Convert.ToString(dt.Rows[0]["Other2BackDraftNAT"]);
                    txt_Outher2_BackDraft_WC_P.Text = Convert.ToString(dt.Rows[0]["Other2BackDraftWC"]);
                    txt_Outher2_DarftEstablished_NAT_P.Text = Convert.ToString(dt.Rows[0]["Other2DraftEstablishedNAT"]);
                    txt_Outher2_DarftEstablished_WC_P.Text = Convert.ToString(dt.Rows[0]["Other2DraftEstablishedWC"]);
                    txt_Outher2_DarftPressure_NAT_P.Text = Convert.ToString(dt.Rows[0]["Other2PressureNAT"]);
                    txt_Outher2_DarftPressure_WC_P.Text = Convert.ToString(dt.Rows[0]["Other2PressureWC"]);
                    txt_Outher2_DarftPass_NA_P.Text = Convert.ToString(dt.Rows[0]["Other2DraftPassedNAT"]);
                    txt_Outher2_DarftPass_WC_P.Text = Convert.ToString(dt.Rows[0]["Other2DraftPassedWC"]);
                    txt_Outher2_UndilCOFlue_P.Text = Convert.ToString(dt.Rows[0]["Other2UndilCOFlue"]);
                    txt_Outher2_GasLeackDet_P.Text = Convert.ToString(dt.Rows[0]["Other2GasLeakDetected"]);
                    txt_Outher2_PrecentEff_P.Text = Convert.ToString(dt.Rows[0]["Other2PercentEfficiency"]);

                    txt_RearLeftBurner_P.Text = Convert.ToString(dt.Rows[0]["BackBurnerLeftCO"]);
                    if (Convert.ToString(dt.Rows[0]["BackBurnerLeftRadio"]) == "Y")
                    {
                        rdo_RearLeftBurner1_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["BackBurnerLeftRadio"]) == "N")
                    {
                        rdo_RearLeftBurner1_P.Checked = false;
                    }




                    if (Convert.ToString(dt.Rows[0]["BackBurnerRightRadio"]) == "Y")
                    {
                        rdo_RearLeftBurner2_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["BackBurnerRightRadio"]) == "N")
                    {
                        rdo_RearLeftBurner2_P.Checked = false;
                    }
                    txt_RearRightBurner_P.Text = Convert.ToString(dt.Rows[0]["BackBurnerRightCO"]);






                    txt_FrontLeftBurner_P.Text = Convert.ToString(dt.Rows[0]["FrontBurnerLeftCO"]);
                    if (Convert.ToString(dt.Rows[0]["FrontBurnerLeftRadio"]) == "Y")
                    {
                        rdo_FrontLeftBurner1_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["FrontBurnerLeftRadio"]) == "N")
                    {
                        rdo_FrontLeftBurner1_P.Checked = false;
                    }







                    if (Convert.ToString(dt.Rows[0]["FrontBurnerRightRadio"]) == "Y")
                    {
                        rdo_FrontLeftBurner2_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["FrontBurnerRightRadio"]) == "N")
                    {
                        rdo_FrontLeftBurner2_P.Checked = false;
                    }
                    txt_FrontRightBurner_P.Text = Convert.ToString(dt.Rows[0]["FrontBurnerRightCO"]);







                    if (Convert.ToString(dt.Rows[0]["DryerWorstCaseCheckBox"]) == "Y")
                    {
                        chk_CheckAppliancesWorstCaseTestDryerY_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["DryerWorstCaseCheckBox"]) == "N")
                    {
                        chk_CheckAppliancesWorstCaseTestDryerN_P.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["WholeHouseFanWorstCaseCheckBox"]) == "Y")
                    {
                        chk_CheckAppliancesWorstCaseTestWholeHouseFanY_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["WholeHouseFanWorstCaseCheckBox"]) == "N")
                    {
                        chk_CheckAppliancesWorstCaseTestWholeHouseFanN_P.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["BathFanWorstCaseCheckBox"]) == "Y")
                    {
                        chk_CheckAppliancesWorstCaseTestBathFanY_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["BathFanWorstCaseCheckBox"]) == "N")
                    {
                        chk_CheckAppliancesWorstCaseTestBathFanN_P.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["KitchenFanWorstCaseCheckBox"]) == "Y")
                    {
                        chk_CheckAppliancesWorstCaseTestKitchenFanY_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["KitchenFanWorstCaseCheckBox"]) == "N")
                    {
                        chk_CheckAppliancesWorstCaseTestKitchenFanN_P.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["HVACAirHandlerWorstCaseCheckBox"]) == "Y")
                    {
                        chk_HVACAirHandlerY_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["HVACAirHandlerWorstCaseCheckBox"]) == "N")
                    {
                        chk_HVACAirHandlerN_P.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["EmergencySituationCheckBox"]) == "Y")
                    {
                        chk_EmergencySituationGasCompanyCalledY_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["EmergencySituationCheckBox"]) == "N")
                    {
                        chk_EmergencySituationGasCompanyCalledN_P.Checked = true;
                    }

                    if (Convert.ToString(dt.Rows[0]["WorkCannotContinueCheckBox"]) == "Y")
                    {
                        chk_WorkCannotContinueToActionLevelY_P.Checked = true;
                    }
                    else if (Convert.ToString(dt.Rows[0]["WorkCannotContinueCheckBox"]) == "N")
                    {
                        chk_WorkCannotContinueToActionLevelN_P.Checked = true;
                    }

                    txt_OvenCODataCOAmbient_P.Text = Convert.ToString(dt.Rows[0]["COAmbient"]);
                    txt_OvenCODataCOAtOvenVent_P.Text = Convert.ToString(dt.Rows[0]["COAtOvenVent"]);
                    txt_CAZNat_P.Text = Convert.ToString(dt.Rows[0]["NATVAL"]);
                    txt_CAZPass_P.Text = Convert.ToString(dt.Rows[0]["PASSVAL"]);
                    txt_CAZWC_P.Text = Convert.ToString(dt.Rows[0]["WCVAL"]);
                    txt_CAZDiff_P.Text = Convert.ToString(dt.Rows[0]["DIFFVAL"]);
                    txt_COAlarmsInstalledLocations_P.Text = Convert.ToString(dt.Rows[0]["COAlarmsInTheseLocations"]);

                }
                else
                {
                    ViewIMG.Visible = true;
                }
           
        }
        catch
        {
        }
    }
    #endregion


    #region "Audit Page 10"
    public void BindData10(string JobNumber)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_10(JobNumber);
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToString(dt.Rows[0]["HeatPump1"]) == "Y")
                {
                    Chk_SystemType_HeatPump.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["CentralAirOnly"]) == "Y")
                {
                    Chk_SystemType_CentralAirOnly.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["ElectricFurnace"]) == "Y")
                {
                    Chk_SystemType_ElecFurnace.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["Other"]) == "Y")
                {
                    Chk_SystemType_Other.Checked = true;
                }
                txt_SystemType_OtherDesc.Text = Convert.ToString(dt.Rows[0]["OtherDescription"]);
                txt_SupplyDuctLocation_BasementWalls.Text = Convert.ToString(dt.Rows[0]["BasementAndWalls"]).Replace("%", "");
                txt_SupplyDuctLocation_BasementWalls.Text = txt_SupplyDuctLocation_BasementWalls.Text + "%";
                txt_SupplyDuctLocation_Attic.Text = Convert.ToString(dt.Rows[0]["Attic"]).Replace("%", "");
                txt_SupplyDuctLocation_Attic.Text = txt_SupplyDuctLocation_Attic.Text + "%";
                txt_SupplyDuctLocation_Garage.Text = Convert.ToString(dt.Rows[0]["Garage"]).Replace("%", "");
                txt_SupplyDuctLocation_Garage.Text = txt_SupplyDuctLocation_Garage.Text + "%";
                txt_SupplyDuctLocation_VentedCrawl.Text = Convert.ToString(dt.Rows[0]["VentedCrawl"]).Replace("%", "");
                txt_SupplyDuctLocation_VentedCrawl.Text = txt_SupplyDuctLocation_VentedCrawl.Text + "%";
                txt_AirHandlerLocation.Text = Convert.ToString(dt.Rows[0]["AirHandlerLocation"]);
                if (Convert.ToString(dt.Rows[0]["Metal"]) == "Y")
                {
                    chk_DuctMaterials_Metal.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["DuctBoard"]) == "Y")
                {
                    chk_DuctMaterials_DuctBoard.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["Flex"]) == "Y")
                {
                    chk_DuctMaterials_Flex.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["InCabinet"]) == "Y")
                {
                    chk_FilterLocations_InCabinet.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["ExtSlot"]) == "Y")
                {
                    chk_FilterLocations_ExtSlot.Checked = true;
                }
                if (Convert.ToString(dt.Rows[0]["ReturnRegisterSlotCovered"]) == "Y")
                {
                    chk_FilterLocations_ReturnRegisterSlotCoveredY.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["ReturnRegisterSlotCovered"]) == "N")
                {
                    chk_FilterLocations_ReturnRegisterSlotCoveredN.Checked = true;
                }

                txt_RegisterNoRoom1.Text = Convert.ToString(dt.Rows[0]["RoomName1"]);
                txt_RegisterNoRoom2.Text = Convert.ToString(dt.Rows[0]["RoomName2"]);
                txt_RegisterNoRoom3.Text = Convert.ToString(dt.Rows[0]["RoomName3"]);
                txt_RegisterNoRoom4.Text = Convert.ToString(dt.Rows[0]["RoomName4"]);
                txt_RegisterNoRoom5.Text = Convert.ToString(dt.Rows[0]["RoomName5"]);
                txt_RegisterNoRoom6.Text = Convert.ToString(dt.Rows[0]["RoomName6"]);
                txt_RegisterNoRoom7.Text = Convert.ToString(dt.Rows[0]["RoomName7"]);
                txt_RegisterNoRoom8.Text = Convert.ToString(dt.Rows[0]["RoomName8"]);
                txt_RegNo_Room9.Text = Convert.ToString(dt.Rows[0]["RoomName9"]);
                txt_RegNo_Room10.Text = Convert.ToString(dt.Rows[0]["RoomName10"]);
                txt_RegNo_Room11.Text = Convert.ToString(dt.Rows[0]["RoomName11"]);
                txt_RegNo_Room12.Text = Convert.ToString(dt.Rows[0]["RoomName12"]);
                txt_RegNo_Room13.Text = Convert.ToString(dt.Rows[0]["RoomName13"]);
                txt_RegNo_Room14.Text = Convert.ToString(dt.Rows[0]["RoomName14"]);
                txt_RegNo_Room15.Text = Convert.ToString(dt.Rows[0]["RoomName15"]);
                txt_RegNo_Room16.Text = Convert.ToString(dt.Rows[0]["RoomName16"]);

                txt_RegNo_Supply_Pre_1.Text = Convert.ToString(dt.Rows[0]["SupplyPre1"]);
                txt_RegNo_Supply_Pre_2.Text = Convert.ToString(dt.Rows[0]["SupplyPre2"]);
                txt_RegNo_Supply_Pre_3.Text = Convert.ToString(dt.Rows[0]["SupplyPre3"]);
                txt_RegNo_Supply_Pre_4.Text = Convert.ToString(dt.Rows[0]["SupplyPre4"]);
                txt_RegNo_Supply_Pre_5.Text = Convert.ToString(dt.Rows[0]["SupplyPre5"]);
                txt_RegNo_Supply_Pre_6.Text = Convert.ToString(dt.Rows[0]["SupplyPre6"]);
                txt_RegNo_Supply_Pre_7.Text = Convert.ToString(dt.Rows[0]["SupplyPre7"]);
                txt_RegNo_Supply_Pre_8.Text = Convert.ToString(dt.Rows[0]["SupplyPre8"]);
                txt_RegNo_Supply_Pre_9.Text = Convert.ToString(dt.Rows[0]["SupplyPre9"]);
                txt_RegNo_Supply_Pre_10.Text = Convert.ToString(dt.Rows[0]["SupplyPre10"]);
                txt_RegNo_Supply_Pre_11.Text = Convert.ToString(dt.Rows[0]["SupplyPre11"]);
                txt_RegNo_Supply_Pre_12.Text = Convert.ToString(dt.Rows[0]["SupplyPre12"]);
                txt_RegNo_Supply_Pre_13.Text = Convert.ToString(dt.Rows[0]["SupplyPre13"]);
                txt_RegNo_Supply_Pre_14.Text = Convert.ToString(dt.Rows[0]["SupplyPre14"]);
                txt_RegNo_Supply_Pre_15.Text = Convert.ToString(dt.Rows[0]["SupplyPre15"]);
                txt_RegNo_Supply_Pre_16.Text = Convert.ToString(dt.Rows[0]["SupplyPre16"]);

                txt_RegNo_Supply_Post_1.Text = Convert.ToString(dt.Rows[0]["SupplyPost1"]);
                txt_RegNo_Supply_Post_2.Text = Convert.ToString(dt.Rows[0]["SupplyPost2"]);
                txt_RegNo_Supply_Post_3.Text = Convert.ToString(dt.Rows[0]["SupplyPost3"]);
                txt_RegNo_Supply_Post_4.Text = Convert.ToString(dt.Rows[0]["SupplyPost4"]);
                txt_RegNo_Supply_Post_5.Text = Convert.ToString(dt.Rows[0]["SupplyPost5"]);
                txt_RegNo_Supply_Post_6.Text = Convert.ToString(dt.Rows[0]["SupplyPost6"]);
                txt_RegNo_Supply_Post_7.Text = Convert.ToString(dt.Rows[0]["SupplyPost7"]);
                txt_RegNo_Supply_Post_8.Text = Convert.ToString(dt.Rows[0]["SupplyPost8"]);
                txt_RegNo_Supply_Post_9.Text = Convert.ToString(dt.Rows[0]["SupplyPost9"]);
                txt_RegNo_Supply_Post_10.Text = Convert.ToString(dt.Rows[0]["SupplyPost10"]);
                txt_RegNo_Supply_Post_11.Text = Convert.ToString(dt.Rows[0]["SupplyPost11"]);
                txt_RegNo_Supply_Post_12.Text = Convert.ToString(dt.Rows[0]["SupplyPost12"]);
                txt_RegNo_Supply_Post_13.Text = Convert.ToString(dt.Rows[0]["SupplyPost13"]);
                txt_RegNo_Supply_Post_14.Text = Convert.ToString(dt.Rows[0]["SupplyPost14"]);
                txt_RegNo_Supply_Post_15.Text = Convert.ToString(dt.Rows[0]["SupplyPost15"]);
                txt_RegNo_Supply_Post_16.Text = Convert.ToString(dt.Rows[0]["SupplyPost16"]);

                txt_RegNo_Return_Pre_1.Text = Convert.ToString(dt.Rows[0]["ReturnPre1"]);
                txt_RegNo_Return_Pre_2.Text = Convert.ToString(dt.Rows[0]["ReturnPre2"]);
                txt_RegNo_Return_Pre_3.Text = Convert.ToString(dt.Rows[0]["ReturnPre3"]);
                txt_RegNo_Return_Pre_4.Text = Convert.ToString(dt.Rows[0]["ReturnPre4"]);
                txt_RegNo_Return_Pre_5.Text = Convert.ToString(dt.Rows[0]["ReturnPre5"]);
                txt_RegNo_Return_Pre_6.Text = Convert.ToString(dt.Rows[0]["ReturnPre6"]);
                txt_RegNo_Return_Pre_7.Text = Convert.ToString(dt.Rows[0]["ReturnPre7"]);
                txt_RegNo_Return_Pre_8.Text = Convert.ToString(dt.Rows[0]["ReturnPre8"]);
                txt_RegNo_Return_Pre_9.Text = Convert.ToString(dt.Rows[0]["ReturnPre9"]);
                txt_RegNo_Return_Pre_10.Text = Convert.ToString(dt.Rows[0]["ReturnPre10"]);
                txt_RegNo_Return_Pre_11.Text = Convert.ToString(dt.Rows[0]["ReturnPre11"]);
                txt_RegNo_Return_Pre_12.Text = Convert.ToString(dt.Rows[0]["ReturnPre12"]);
                txt_RegNo_Return_Pre_13.Text = Convert.ToString(dt.Rows[0]["ReturnPre13"]);
                txt_RegNo_Return_Pre_14.Text = Convert.ToString(dt.Rows[0]["ReturnPre14"]);
                txt_RegNo_Return_Pre_15.Text = Convert.ToString(dt.Rows[0]["ReturnPre15"]);
                txt_RegNo_Return_Pre_16.Text = Convert.ToString(dt.Rows[0]["ReturnPre16"]);

                txt_RegNo_Return_Post_1.Text = Convert.ToString(dt.Rows[0]["ReturnPost1"]);
                txt_RegNo_Return_Post_2.Text = Convert.ToString(dt.Rows[0]["ReturnPost2"]);
                txt_RegNo_Return_Post_3.Text = Convert.ToString(dt.Rows[0]["ReturnPost3"]);
                txt_RegNo_Return_Post_4.Text = Convert.ToString(dt.Rows[0]["ReturnPost4"]);
                txt_RegNo_Return_Post_5.Text = Convert.ToString(dt.Rows[0]["ReturnPost5"]);
                txt_RegNo_Return_Post_6.Text = Convert.ToString(dt.Rows[0]["ReturnPost6"]);
                txt_RegNo_Return_Post_7.Text = Convert.ToString(dt.Rows[0]["ReturnPost7"]);
                txt_RegNo_Return_Post_8.Text = Convert.ToString(dt.Rows[0]["ReturnPost8"]);
                txt_RegNo_Return_Post_9.Text = Convert.ToString(dt.Rows[0]["ReturnPost9"]);
                txt_RegNo_Return_Post_10.Text = Convert.ToString(dt.Rows[0]["ReturnPost10"]);
                txt_RegNo_Return_Post_11.Text = Convert.ToString(dt.Rows[0]["ReturnPost11"]);
                txt_RegNo_Return_Post_12.Text = Convert.ToString(dt.Rows[0]["ReturnPost12"]);
                txt_RegNo_Return_Post_13.Text = Convert.ToString(dt.Rows[0]["ReturnPost13"]);
                txt_RegNo_Return_Post_14.Text = Convert.ToString(dt.Rows[0]["ReturnPost14"]);
                txt_RegNo_Return_Post_15.Text = Convert.ToString(dt.Rows[0]["ReturnPost15"]);
                txt_RegNo_Return_Post_16.Text = Convert.ToString(dt.Rows[0]["ReturnPost16"]);

            }
        }
        catch
        {
        }
    }
    #endregion

    #region "Bind Photo"
    public void BindPhoto(string JobNum)
    {
        try
        {
            dtPhoto = ObjPPL.SelectPPLPhotoPageTop24_Change(JobNum);

        }
        catch
        {


        }

    }


    #endregion

}
