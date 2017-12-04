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

public partial class PPLAudit_PPL_Audit_1 : System.Web.UI.Page
{
    dcPPLAudit ObjPPL = new dcPPLAudit();
    dc_AddNewJob ObjJob = new dc_AddNewJob();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.UserAgent.Contains("Chrome"))
            {
                //TopBtnDiv.Attributes.Add("style", "position: fixed; top: 65px; z-index: 100; text-align: center; margin: 0 45px;width:510px;");
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["Jobs"] != null)
                {
                    if (Request.QueryString["Jobs"].ToString() != "")
                    {
                        string JobNum = Request.QueryString["Jobs"].ToString();
                        //HtmlGenericControl SpanJobNum = (HtmlGenericControl)Master.FindControl("JobNumber");
                        //SpanJobNum.InnerText = JobNum;
                        BindDDLAuditor();
                        BindData(JobNum);
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
        DDLAuditor.DataSource = dtDLL;
        DDLAuditor.DataValueField = "ID";
        DDLAuditor.DataTextField = "AuditorName";
        DDLAuditor.DataBind();
        DDLAuditor.Items.Insert(0, "Select");
    }

    public void BindData(string JobNumber)
    {
        try
        {
            DataTable dtScheduledate = ObjJob.ShowLatestContactAttemptsReport(Convert.ToString(Request.QueryString["Jobs"]), 4);
            if (dtScheduledate.Rows.Count > 0 && !DBNull.Value.Equals(dtScheduledate.Rows[0]["ContactResultDate"]))
            {

                txtDateJobComplete.Text = Convert.ToDateTime(dtScheduledate.Rows[0]["ContactResultDate"]).ToString("MM/dd/yyyy");

            }
            else
            {
                txtDateJobComplete.Text = "";
 
            }
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_1(JobNumber);
            if (dt.Rows.Count > 0)
            {
                txtName.Text = dt.Rows[0]["FullName"].ToString();
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




                if (Convert.ToBoolean(dt.Rows[0]["BaseLoadOnly"]) == true || Convert.ToBoolean(dt.Rows[0]["Act129II"]) == true || Convert.ToBoolean(dt.Rows[0]["Act129"]) == true || Convert.ToBoolean(dt.Rows[0]["HighPriority"]) == true || Convert.ToBoolean(dt.Rows[0]["LowCost"]) == true)
                {
                    chkOriginalJobTypeBaseLoad.Checked = true;
                }
                //chkOriginalJobTypeBaseLoad.Checked = Convert.ToBoolean(dt.Rows[0]["BaseLoadOnly"]);
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
                    ChkContractorSafety.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["IfAuditNotCompleted"]) == "M")
                {
                    chkAuditNotCompletedReasonMoved.Checked = true;
                }
                //if (!DBNull.Value.Equals(dt.Rows[0]["DateJobComplete"]) && Convert.ToString(dt.Rows[0]["DateJobComplete"]) != "1/1/1900 12:00:00 AM" && Convert.ToString(dt.Rows[0]["DateJobComplete"]) != "")
                //{
                //    txtDateJobComplete.Text = Convert.ToDateTime(dt.Rows[0]["DateJobComplete"]).ToString("MM/dd/yyyy");

                //}


                if (dt.Rows[0]["Contractor"].ToString() != null)
                {
                    //txtContractor.Text = dt.Rows[0]["Contractor"].ToString();
                }




                DateTime DOA = Convert.ToDateTime("1/1/1900 12:00:00 AM");

                if (Convert.ToString(dt.Rows[0]["DateOfAudit"]) != "1/1/1900 12:00:00 AM" && Convert.ToString(dt.Rows[0]["DateOfAudit"]) != "")
                {
                    DOA = Convert.ToDateTime(dt.Rows[0]["DateOfAudit"]);

                }

                if (JobNumber!=null && JobNumber!="")
                {
                    DataTable dateschedule = new DataTable();
                    dateschedule = ObjJob.ShowLatestContactAttemptsReport(JobNumber,14);
                    if (dateschedule.Rows.Count > 0 && !DBNull.Value.Equals(dateschedule.Rows[0]["ContactResultDate"]) && DOA <= Convert.ToDateTime(dateschedule.Rows[0]["ContactResultDate"]))
                    {
                        txtDateOfAudit.Text = Convert.ToDateTime(dateschedule.Rows[0]["ContactResultDate"]).ToString("MM/dd/yyyy");

                    }
                    else if (DBNull.Value.Equals(dateschedule.Rows[0]["ContactResultDate"]) || DOA > Convert.ToDateTime(dateschedule.Rows[0]["ContactResultDate"]))
                    {
                        if (Convert.ToString(DOA) != "1/1/1900 12:00:00 AM" && Convert.ToString(DOA) != "")
                        {
                            txtDateOfAudit.Text = DOA.ToString("MM/dd/yyyy");
                        }
                        else 
                        {
                            txtDateOfAudit.Text = "";
 
                        }
                    }
                    else 
                    {
                        txtDateOfAudit.Text = "";
 
                    }


                }





                string OTSD = Convert.ToString(dt.Rows[0]["OnTrackStartDate"]);
                if (OTSD != "1/1/1900 12:00:00 AM" && OTSD != "")
                {
                    txtOntrackStartdate.Text = Convert.ToDateTime(dt.Rows[0]["OnTrackStartDate"]).ToString("MM/dd/yyyy");
                }
                else
                {
                    txtOntrackStartdate.Text = "";
                }

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
                if (dt.Rows[0]["Auditor"].ToString() != "0")
                {
                    DDLAuditor.SelectedValue = dt.Rows[0]["Auditor"].ToString();
                    DDLAuditor.Items.RemoveAt(0);
                }
                DDLAuditor.Enabled = false;
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
            string LandLordApprove, OnTrackCustomer, ReferredGasUtilityWeatherization, DoesRentMortgageExceedIncome, AuditNotCompleted, OwnerTenant, Auditor;
            LandLordApprove = OnTrackCustomer = ReferredGasUtilityWeatherization = DoesRentMortgageExceedIncome = AuditNotCompleted = OwnerTenant = Auditor = "";
            if (chkLandlordApprovalY.Checked)
            {
                LandLordApprove = "Yes";
            }
            else if (chkLandlordApprovalN.Checked)
            {
                LandLordApprove = "No";
            }
            else if (chkLandlordApprovalNA.Checked)
            {
                LandLordApprove = "N/A";
            }
            else
            {
                LandLordApprove = "";
            }

            if (chkOnTrackCustomerY.Checked)
            {
                OnTrackCustomer = "YES";
            }
            else if (chkOnTrackCustomerN.Checked)
            {
                OnTrackCustomer = "NO";
            }
            else
            {
                OnTrackCustomer = "";
            }

            ///////////////////////////////////////////////////////////////////////////////////////////


            if (chkReferredStateWeatherization.Checked)
            {
                ReferredGasUtilityWeatherization += "S,";
            }
            if (chkReferredGasUtilityWeatherization.Checked)
            {
                ReferredGasUtilityWeatherization += "G,";
            }
            if (ChkDCEDWAP.Checked)
            {
                ReferredGasUtilityWeatherization += "DC,";
            }
            if (ChkCountyWx.Checked)
            {
                ReferredGasUtilityWeatherization += "Co,";
            }
            if (ChkLIHEAP.Checked)
            {
                ReferredGasUtilityWeatherization += "LI,";
            }
            if (ChkOnTrack.Checked)
            {
                ReferredGasUtilityWeatherization += "On,";
            }
            if (ChkOperationHELP.Checked)
            {
                ReferredGasUtilityWeatherization += "Op,";
            }
            if (ChkAct129EPowerWise.Checked)
            {
                ReferredGasUtilityWeatherization += "A1,";
            }
            if (ChkAct129ApplianceRebate.Checked)
            {
                ReferredGasUtilityWeatherization += "A2,";
            }
            if (ChkOtherReferred.Checked)
            {
                ReferredGasUtilityWeatherization += "Ot,";
            }

            ReferredGasUtilityWeatherization = ReferredGasUtilityWeatherization.TrimEnd(',');
            //else
            //{
            //    ReferredGasUtilityWeatherization = "";
            //}





            //////////////////////////////////////////////////////////////////////////////////////////



            if (chkDoesRentMortgageExceedIncomeY.Checked)
            {
                DoesRentMortgageExceedIncome = "Y";
            }
            else if (chkDoesRentMortgageExceedIncomeN.Checked)
            {
                DoesRentMortgageExceedIncome = "N";
            }
            else
            {
                DoesRentMortgageExceedIncome = "";
            }
            if (chkAuditNotCompletedOther.Checked)
            {
                AuditNotCompleted = "O";
            }
            else if (chkAuditNotCompletedSafetyHelth.Checked)
            {
                AuditNotCompleted = "SH";
            }
            else if (chkAuditNotCompletedNoShow.Checked)
            {
                AuditNotCompleted = "NS";
            }
            else if (ChkContractorSafety.Checked)
            {
                AuditNotCompleted = "CS";
            }
            else if (chkAuditNotCompletedReasonNoResponse.Checked)
            {
                AuditNotCompleted = "NR";
            }
            else if (chkAuditNotCompletedReasonMoved.Checked)
            {
                AuditNotCompleted = "M";
            }
            else
            {
                AuditNotCompleted = "";
            }

            if (chkOccupancyHomeowner.Checked)
            {
                OwnerTenant = "O";
            }
            else if (chkOccupancyTenant.Checked)
            {
                OwnerTenant = "T";
            }

            if (txtOntrackPayAmt.Text == "")
            {
                txtOntrackPayAmt.Text = "0.00";
            }
            if (txtActualAllowance.Text == "")
            {
                txtActualAllowance.Text = "0.00";
            }
            if (DDLAuditor.SelectedValue.ToString() == "" || DDLAuditor.SelectedValue.ToString() == "Select")
            {
                Auditor = "0";
            }
            else
            {
                Auditor = DDLAuditor.SelectedValue.ToString();
            }
            //string srt = DDLAuditor.SelectedValue.ToString();
            //string DateJobComplete;


            //if (txtDateJobComplete.Text == " " || txtDateJobComplete.Text == string.Empty)
            //{
            //    DateJobComplete = null;
            //}
            //else
            //{
            //    DateJobComplete = txtDateJobComplete.Text;
            //}
            string DateJobComplete = Request.Form[txtDateJobComplete.UniqueID];

            int i;
            i = ObjPPL.UpdatePPLAudit_1(JobNum, txtContractor.Text, DoesRentMortgageExceedIncome, LandLordApprove, txtDirectionNInstruction.Text, txtOntrackStartdate.Text, Convert.ToDecimal(txtOntrackPayAmt.Text), Convert.ToDecimal(txtActualAllowance.Text), Auditor, txtDateOfAudit.Text, DateJobComplete, txtSquareFootage.Text, AuditNotCompleted.ToString(), txtAuditNotCompletedOthere.Text, ReferredGasUtilityWeatherization, txtReferredComments.Text, txtPhoneHome.Text, txtPhoneOther.Text);

            if (i == 0)
            {
            }
            else
            {
            }

            BindData(JobNum);
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
