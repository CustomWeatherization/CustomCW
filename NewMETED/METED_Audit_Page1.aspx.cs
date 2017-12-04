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

public partial class METED_METED_Audit_Page1 : System.Web.UI.Page
{
    METEDAudit obj_MetedAudit = new METEDAudit();
    dcPPLAudit ObjPPL = new dcPPLAudit();
    dc_AddNewJob ObjJob = new dc_AddNewJob();
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
                        BindDDLAuditor();
                        fill_form();
                    }
                }
            }
        }
        catch
        {
        }

        Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
        smUtil objsmutil = new smUtil();
        int AId = Convert.ToInt32(objsmutil.GetCookie("AId"));
        DataTable dtF = objInvoice.ChkInvoiceAuditFinalize(Convert.ToString(Request.QueryString["Jobs"]), Convert.ToInt32(Request.QueryString["Utility"]), AId, Convert.ToInt32(Request.QueryString["InvoiceNo"]));
        if (dtF.Rows.Count > 0)
        {
            if (Convert.ToString(dtF.Rows[0]["finalize"]) == "F" && Convert.ToString(objsmutil.GetCookie("Rol_Id")) != "Admin")
            {
                Session["finalize"] = "F";
                DisableControls(Page, false);

            }
            else
            {
                Session["finalize"] = null;
            }
        }
        else
        {
            Session["finalize"] = null;
        }
        if (Convert.ToString(Session["finalize"]) == "F")
        {
            btnUpdate.Visible = false;
            spnFinal.InnerHtml = "Audit Finalize";

        }
    }
    protected void DisableControls(Control parent, bool State)
    {
        foreach (Control c in parent.Controls)
        {
            if (c is TextBox)
            {
                ((TextBox)(c)).ReadOnly = true;
            }
            else if (c is CheckBox)
            {
                ((CheckBox)(c)).Enabled = false;
            }
            else if (c is DropDownList)
            {
                ((DropDownList)(c)).Enabled = false;
            }

            DisableControls(c, State);
        }
    }
    public void BindDDLAuditor()
    {
        DataTable dtDLL = new DataTable();
        dtDLL = ObjPPL.GetAuditorNameForPPLAudit_1();
        DDL_Auditor_Name.DataSource = dtDLL;
        DDL_Auditor_Name.DataValueField = "ID";
        DDL_Auditor_Name.DataTextField = "AuditorName";
        DDL_Auditor_Name.DataBind();
        DDL_Auditor_Name.Items.Insert(0, "Select");
    }
    public void fill_form()
    {
        try
        {

            DataTable dtScheduledate = ObjJob.ShowLatestContactAttemptsReport(Convert.ToString(Request.QueryString["Jobs"]), 4);
            DataTable dtAuditDate = ObjJob.ShowLatestContactAttemptsReport(Convert.ToString(Request.QueryString["Jobs"]), 14);

            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_1(JobNum);
            DateTime dateRec = new DateTime(); ;
            if (dt.Rows.Count > 0)
            {
                 dateRec = Convert.ToDateTime(dt.Rows[0]["DateAssigned"]);
 
            }
           
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
                txt_ZipCode.Text = Convert.ToString(dt.Rows[0]["ZipCode"]); // CoordinatedWithGasUtilityProgram
                txt_State.Text = Convert.ToString(dt.Rows[0]["State"]);
                string SSA = Convert.ToString(dt.Rows[0]["SeasonalSpendingAllowance"]);

                if (SSA == "" || SSA == null)
                {
                    SSA = "0.00";
                }
                else
                {
                    //txt_Seasonal.Text = "$" + Convert.ToString(Math.Round(Convert.ToDecimal(Convert.ToString(SSA).Replace("$", "")), 2));
                    txt_Seasonal.Text = "$" + Convert.ToString(Convert.ToDecimal(Convert.ToString(SSA).Replace("$", "")).ToString("#,##0.00"));
                }
                //txt_Seasonal.Text = Convert.ToString(dt.Rows[0]["SeasonalSpendingAllowance"]);
                //"$" + Convert.ToString(Math.Round(Convert.ToDecimal(Convert.ToString(dtU.Rows[0]["SpendingAllowance"]).Replace("$", "")), 2));
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

                rdoListWarm.Enabled = false;
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
                    txt_Household_Income.Text = "$" + Convert.ToString(Convert.ToDecimal(Convert.ToString(HHI).Replace("$", "")).ToString("#,##0.00"));
                }
                //txt_Household_Income.Text = Convert.ToString(dt.Rows[0]["HouseholdIncomeDollar"]);

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
                txt_PhoneNo.Text = Convert.ToString(dt.Rows[0]["HomePhone"]);
                txt_WorkNo.Text = Convert.ToString(dt.Rows[0]["WorkPhone"]);
                txt_OtherNo.Text = Convert.ToString(dt.Rows[0]["CellPhone"]);
                //txt_Seasonal.Text = Convert.ToString(dt.Rows[0]["SeasonalSpendingAllowance"]);
                txt_Email.Text = Convert.ToString(dt.Rows[0]["Email"]);
                txt_SummerSeasonal.Text = Convert.ToString(dt.Rows[0]["SummerSeasonalUse"]);
                txt_WinterSeasonal.Text = Convert.ToString(dt.Rows[0]["WinterSeasonalUse"]);
                txt_Baseload.Text = Convert.ToString(dt.Rows[0]["AnnualBaseUse"]);
                DDL_Auditor_Name.SelectedValue = Convert.ToString(dt.Rows[0]["AuditorName"]);
                DDL_Auditor_Name.Enabled = false;



                

                if (dtAuditDate.Rows.Count > 0 && !DBNull.Value.Equals(dtAuditDate.Rows[0]["ContactResultDate"]))
                {
                    string AuditDate = Convert.ToDateTime(dtAuditDate.Rows[0]["ContactResultDate"]).ToString("MM/dd/yyyy");
                
                if (AuditDate == "01/01/1900")
                {
                    txt_AuditDate.Text = "";
                }
                else
                {
                    txt_AuditDate.Text = Convert.ToDateTime(dtAuditDate.Rows[0]["ContactResultDate"]).ToString("MM/dd/yyyy");
                }
                }



                if (dtScheduledate.Rows.Count > 0 && !DBNull.Value.Equals(dtScheduledate.Rows[0]["ContactResultDate"]))
                {
                    DateTime dtDateCompleted = Convert.ToDateTime(dtScheduledate.Rows[0]["ContactResultDate"]);
                    string DateCompleted = Convert.ToDateTime(dtScheduledate.Rows[0]["ContactResultDate"]).ToString("MM/dd/yyyy");

                    if (DateCompleted == "01/01/1900")
                    {
                        txt_JobCompleteDate.Text = "";
                    }
                    else
                    {
                        txt_JobCompleteDate.Text = Convert.ToDateTime(dtScheduledate.Rows[0]["ContactResultDate"]).ToString("MM/dd/yyyy");
                    }
                }


                txt_Baseload.Text = Convert.ToString(dt.Rows[0]["BaseLoadKWH"]);
                txt_SummerSeasonal.Text = Convert.ToString(dt.Rows[0]["SummerSeasonalKWH"]);

                string SWD = Convert.ToString(dt.Rows[0]["StateWeatherizationDollars"]);
                if (SWD == "" || SWD == null)
                {
                    SWD = "0.00";
                }
                else
                {
                    txt_StateWeather.Text = "$" + Convert.ToString(Convert.ToDecimal(Convert.ToString(SWD).Replace("$", "")).ToString("#,##0.00"));
                }

                //txt_StateWeather.Text = Convert.ToString(dt.Rows[0]["StateWeatherizationDollars"]);


                txt_WinterSeasonal.Text = Convert.ToString(dt.Rows[0]["WinterSeasonalKWH"]);

                string GUD = Convert.ToString(dt.Rows[0]["GasUtilityDollars"]);
                if (GUD == "" || GUD == null)
                {
                    GUD = "0.00";
                }
                else
                {
                    txt_GasUtility.Text = "$" + Convert.ToString(Convert.ToDecimal(Convert.ToString(GUD).Replace("$", "")).ToString("#,##0.00"));
                }

                //txt_GasUtility.Text = Convert.ToString(dt.Rows[0]["GasUtilityDollars"]);

                string OPD = Convert.ToString(dt.Rows[0]["OtherProgramDollar"]);
                if (OPD == "" || OPD == null)
                {
                    OPD = "0.00";
                }
                else
                {
                    txt_OtherProgram.Text = "$" + Convert.ToString(Convert.ToDecimal(Convert.ToString(OPD).Replace("$", "")).ToString("#,##0.00"));
                }

                //txt_OtherProgram.Text = Convert.ToString(dt.Rows[0]["OtherProgramDollar"]);
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
                if (IsPostBack)
                {
                    if (Convert.ToString(dt.Rows[0]["BaseLoadJob"]) == "Y")
                    {
                        chk_BaseloadJob.Checked = true;
                    }
                    else
                    {
                        chk_BaseloadJob.Checked = true;
                    }

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
        catch(Exception ex)
        {
            Response.Write(ex);
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string ElectricHeatJob, ACJob, DefactoHeatJob, WaterHeatJob, BaseloadJob, UsedDefault, WarmOrWarmPlus;
            ElectricHeatJob = ACJob = DefactoHeatJob = WaterHeatJob = BaseloadJob = UsedDefault = WarmOrWarmPlus = "";
            string CoordinateWeatherization = "";
            string PrimarySourceIncome = "";
            string CordinateGas = "";
            string JobNum = Request.QueryString["Jobs"].ToString();
            if (chk_ElectricHeatJob.Checked == true)
            {
                ElectricHeatJob = "Y";
            }
            else
            {
                ElectricHeatJob = "N";
            }
            if (chk_Default.Checked == true)
            {
                UsedDefault = "Y";
            }
            else
            {
                UsedDefault = "N";
            }
            if (chk_AcJob.Checked == true)
            {
                ACJob = "Y";
            }
            else
            {
                ACJob = "N";
            }
            if (chk_DefactoHeatJob.Checked == true)
            {
                DefactoHeatJob = "Y";
            }
            else
            {
                DefactoHeatJob = "N";
            }
            if (chk_WaterHeatJob.Checked == true)
            {
                WaterHeatJob = "Y";
            }
            else
            {
                WaterHeatJob = "N";
            }
            if (chk_BaseloadJob.Checked == false)
            {
                chk_BaseloadJob.Checked = true;
                BaseloadJob = "Y";
            }

            WarmOrWarmPlus = Convert.ToString(rdoListWarm.SelectedValue);
            /////////////////////////////////////////////////////////////////////////

            if (rdo_CordinateState_Yes.Checked == true)
            {
                CoordinateWeatherization = "Y";
            }
            else if (rdo_CordinateState_No.Checked == true)
            {
                CoordinateWeatherization = "N";
            }

            ////////////////////////////////////////////////////////////////////

            if (rdo_CordinateGas_Yes.Checked == true)
            {
                CordinateGas = "Y";
            }
            else if (rdo_CordinateGas_No.Checked == true)
            {
                CordinateGas = "N";
            }

            if (rdo_Employment.Checked)
            {
                PrimarySourceIncome = "1";
            }
            else if (rdo_Public_Assist.Checked)
            {
                PrimarySourceIncome = "2";
            }
            else if (rdo_Pension.Checked)
            {
                PrimarySourceIncome = "3";
            }
            else if (rdo_UnEmployment.Checked)
            {
                PrimarySourceIncome = "4";
            }
            else if (rdo_Disability.Checked)
            {
                PrimarySourceIncome = "5";
            }
            else if (rdo_Other.Checked)
            {
                PrimarySourceIncome = "6";
            }
            else
            {
                PrimarySourceIncome = "";
            }

            // New Part//
            string HouseholdEmploymentStatus = "";

            if (rdo_fulltimeEmploye.Checked)
            {
                HouseholdEmploymentStatus = "1";
            }
            else if (rdo_partTime.Checked)
            {
                HouseholdEmploymentStatus = "2";
            }
            else if (rdo_Unemploye.Checked)
            {
                HouseholdEmploymentStatus = "3";
            }
            else if (rdo_Retired.Checked)
            {
                HouseholdEmploymentStatus = "4";
            }
            else if (rdo_Homemaker.Checked)
            {
                HouseholdEmploymentStatus = "5";
            }
            else if (rdo_Student.Checked)
            {
                HouseholdEmploymentStatus = "6";
            }
            else if (rdo_HouseholdEmployment_other.Checked)
            {
                HouseholdEmploymentStatus = "99";
            }
            else
            {
                HouseholdEmploymentStatus = "";
            }
            // New New Part//

            string Relationship = "";

            if (rdo_Self.Checked)
            {
                Relationship = "0";
            }
            else if (rdo_Spouse.Checked)
            {
                Relationship = "1";
            }
            else if (rdo_Sibling.Checked)
            {
                Relationship = "2";
            }
            else if (rdo_Parent.Checked)
            {
                Relationship = "3";
            }
            else if (rdo_Relative.Checked)
            {
                Relationship = "4";
            }
            else if (rdo_NonRelative.Checked)
            {
                Relationship = "5";
            }
            else if (rdo_Other_Relationship.Checked)
            {
                Relationship = "6";
            }

            string EthnicOrigin = "";
            if (rdo_Caucasian.Checked)
            {
                EthnicOrigin = "1";
            }
            else if (rdo_African.Checked)
            {
                EthnicOrigin = "2";
            }
            else if (rdo_Hispanic.Checked)
            {
                EthnicOrigin = "3";
            }
            else if (rdo_Asian.Checked)
            {
                EthnicOrigin = "4";
            }
            else if (rdo_Native_American.Checked)
            {
                EthnicOrigin = "5";
            }
            else if (rdo_Multi_Racial.Checked)
            {
                EthnicOrigin = "99";
            }

            string EligibilityVerification = "";
            if (rdo_Eligibility_Yes.Checked)
            {
                EligibilityVerification = "Y";
            }
            else if (rdo_Eligibility_No.Checked)
            {
                EligibilityVerification = "N";
            }

            string OtherProgram = "";
            if (rdo_referedState_Yes.Checked)
            {
                OtherProgram = "Y";
            }
            else if (rdo_referedState_No.Checked)
            {
                OtherProgram = "N";
            }

            string CustomerEnrolled = "";
            if (rdo_PCAP_6Month_Yes.Checked)
            {
                CustomerEnrolled = "Y";
            }
            else if (rdo_PCAP_6Month__No.Checked)
            {
                CustomerEnrolled = "N";
            }
            string DateJobComplete = Request.Form[txt_JobCompleteDate.UniqueID];

            int a = obj_MetedAudit.UpdateMETEDAudit_1(JobNum, WarmOrWarmPlus, ElectricHeatJob, ACJob, txt_Email.Text, DefactoHeatJob, WaterHeatJob, BaseloadJob, UsedDefault, txt_Baseload.Text, Convert.ToString(DDL_Auditor_Name.SelectedValue), txt_WinterSeasonal.Text, txt_AuditDate.Text, DateJobComplete, txt_SummerSeasonal.Text, txt_Seasonal.Text, CoordinateWeatherization, txt_StateWeather.Text, CordinateGas, txt_GasUtility.Text, OtherProgram, txt_OtherProgram.Text, txt_Landlord_Name.Text, txt_Landlord_Phone.Text, txt_Direction1.Text, txt_Direction2.Text, txt_Direction3.Text, CustomerEnrolled, EligibilityVerification, txt_Verified.Text, txt_Household_Income.Text, txt_Date_Verifi.Text, PrimarySourceIncome, txt_Other_Income.Text, txt_PersonPresent.Text, Relationship, txt_Other_Relationship.Text, txt_Customer_DateOfBirth.Text, EthnicOrigin, txt_Occupants.Text, txt_PhoneNo.Text, txt_OtherNo.Text, txt_WorkNo.Text, txt_Handicapped_Occupants.Text, HouseholdEmploymentStatus, txt_HouseholdEmployment_other.Text);
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
