using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class PPLAudit_PPL_Inspection : System.Web.UI.Page
{
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    dc_AddNewJob objNewJob1 = new dc_AddNewJob();
    Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Web.UI.HtmlControls.HtmlGenericControl currdiv = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("Quick_Link");
        currdiv.Style.Add("display", "none");
        if (!IsPostBack)
        {
            if (Request.QueryString["Jobs"] != null || Request.QueryString["Jobs"] != "")
            {

                bind(Request.QueryString["Jobs"]);
            }
        }
        
        smUtil objsmutil = new smUtil();
        int AId = Convert.ToInt32(objsmutil.GetCookie("AId"));
        DataTable dtF = objInvoice.ChkInvoiceAuditFinalize(Convert.ToString(Request.QueryString["Jobs"]), Convert.ToInt32(Request.QueryString["Utility"]), AId, Convert.ToInt32(0));
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
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallFinalize", "Finalize()", true);
            spnFinal.InnerHtml = "Inspection Finalize";
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
            else if (c is CheckBoxList)
            {
                ((CheckBoxList)(c)).Enabled = false;
            }
            else if (c is RadioButtonList)
            {
                ((RadioButtonList)(c)).Enabled = false;
            }
            else if (c is Label)
            {
                ((Label)(c)).Enabled = false;
            }
            DisableControls(c, State);
        }
       
    }
    void bind(string jonno)
    {
        DateTime? IDString = null;
        DateTime? SDString = null;
        
        string jobnum = Request.QueryString["Jobs"].ToString();
        DataTable dtU = objNewJob.ShowJobByJobNumber_ByJobNumber(jobnum);
        DataTable dt = new DataTable();
        dcPPLAudit ppl = new dcPPLAudit();
        dt = ppl.GetPPLInspection(jobnum);
        txtJob.Text = Convert.ToString(jonno);
        if(dtU.Rows.Count>0)
        {
            txtJobName.Text = dtU.Rows[0]["FirstName"].ToString() + " " + dtU.Rows[0]["LastName"].ToString();
            txtInspectorName.Text = Convert.ToString(dtU.Rows[0]["AuditorName"]);
            //if (!DBNull.Value.Equals(dtU.Rows[0]["DateScheduled"]))
            //{
            //    IDString = Convert.ToDateTime(dtU.Rows[0]["DateScheduled"]);
            //    txtDateOfInspection.Text = IDString.Value.ToShortDateString();

            //}
            if (!DBNull.Value.Equals(dtU.Rows[0]["JobNumber"].ToString()))
            {
                DataTable dateschedule = new DataTable();
                dateschedule = objNewJob1.ShowLatestContactAttemptsReport(dtU.Rows[0]["JobNumber"].ToString(),19);
                if (dateschedule.Rows.Count > 0 && !DBNull.Value.Equals(dateschedule.Rows[0]["ContactResultDate"].ToString()))
                {
                    txtDateOfInspection.Text = Convert.ToDateTime(dateschedule.Rows[0]["ContactResultDate"]).ToString("MM/dd/yyyy");

                }
                else
                {
                    txtDateOfInspection.Text = "";
                }


            }
        }
        if (dt.Rows.Count > 0 )
        {
            if (!DBNull.Value.Equals(dt.Rows[0]["SessionDate"]))
            {
                SDString = Convert.ToDateTime(dt.Rows[0]["SessionDate"]);
                txtDateOfSession.Text = SDString.Value.ToShortDateString();
            }
            else
            {
                txtDateOfSession.Text = null;
            }   
           
                // get value from text field
            //if(!string.IsNullOrEmpty(myString))
            //{
            //    DateTime myDateTime = new DateTime();
            //    myDateTime = DateTime.ParseExact(myString, "MM/dd/yyyy", null);
            //    String myString_new = myDateTime.ToString("dd-MM-yyyy"); // add myString_new to oracle
            //    txtDateOfInspection.Text = myString_new;
            //}           

            toggle1.Checked = Convert.ToBoolean(dt.Rows[0]["AreYouAbleToCompleteInspection"]);
            toggle2.Checked = Convert.ToBoolean(dt.Rows[0]["AreThereHealthAndSafetyIssuesToReport"]);
            toggle3.Checked = Convert.ToBoolean(dt.Rows[0]["DoYouNeedToReportAnyMissedOpportunities"]);
            toggle4.Checked = Convert.ToBoolean(dt.Rows[0]["DidCustomerRefuseEnergyEducationSession"]);
            toggle5.Checked = Convert.ToBoolean(dt.Rows[0]["IsTheCustomerOnOnTrack"]);



            txtHealthy.Text = Convert.ToString(dt.Rows[0]["HealthAndSafetyIssuesExplanation"]);
            txtObservation.Text = Convert.ToString(dt.Rows[0]["InspectorsObservationsAndActionRequested"]);
           
            txtMissed.Text = Convert.ToString(dt.Rows[0]["MissedOpportunities"].ToString());
            txtAdditionalComments1.Text = Convert.ToString(dt.Rows[0]["AdditionalComments1"]);
            

            //txtDateOfSession.Text = Convert.ToDateTime(dt.Rows[0]["SessionDate"]).ToShortDateString();
            txtUnder18.Text = Convert.ToString(dt.Rows[0]["NumberOfResidentsInTheDwellingUnder18"]);
            txtAnnualIncome.Text = Convert.ToString(dt.Rows[0]["AnnualHouseHoldIncome"]);
            RBLPrimarySource.SelectedValue = Convert.ToString(dt.Rows[0]["PrimarySourceOfSupplimentalFuel"]);
            
            txtActionToSave.Text = Convert.ToString(dt.Rows[0]["WhatRoleDoYouRemember"]);
            RBLElectricBillChanged.SelectedValue = Convert.ToString(dt.Rows[0]["ElectricBillChangedSinceWeatherization"]);
            txtFurtherSteps.Text = Convert.ToString(dt.Rows[0]["FurtherStepsYouCanTakeToLowerYourElectricBill"]);
            txtAdditionalComments2.Text = Convert.ToString(dt.Rows[0]["AdditionalComments2"]);
            ListItem ls= RBLEmploymentStatus.Items.FindByText(Convert.ToString(dt.Rows[0]["EmploymentStatus"]));
            string[] values = Convert.ToString(dt.Rows[0]["DoYouKnowHowItHasChanged"]).Split(',');

            if (ls != null)
            {
                RBLEmploymentStatus.SelectedValue = Convert.ToString(dt.Rows[0]["EmploymentStatus"]);
                
            }
            else
            {
                txtEmployeeOther.Text = Convert.ToString(dt.Rows[0]["EmploymentStatus"]);

            }


            foreach (ListItem item in CBLHowItHasChanged.Items)
            {
                if (values.Contains(item.Text))
                {
                    item.Selected = true;
                }
            }
        }

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //DateTime DateOfInspection = Convert.ToDateTime(txtDateOfInspection.Text);// DateTime.ParseExact(this.txtDateOfInspection.Text, "MM/dd/yyyy", null);
        //DateTime DateOfSession = Convert.ToDateTime(txtDateOfSession.Text); //  DateTime.ParseExact(this.txtDateOfSession.Text, "MM/dd/yyyy", null);
DateTime? DateOfInspection =null;
DateTime? DateOfSession = null ;
string Under18 = null;
string AnnualIncome = null;
if (txtDateOfInspection.Text != "")
{
 DateOfInspection=Convert.ToDateTime(txtDateOfInspection.Text);
}
if (txtDateOfSession.Text != "")
{
    DateOfSession=Convert.ToDateTime(txtDateOfSession.Text);
}

if (txtUnder18.Text != "")
{
Under18=txtUnder18.Text;
}

if (txtAnnualIncome.Text != "")
{
    AnnualIncome = txtAnnualIncome.Text;
}


        string y="";
        string selectedval = "";
        string[] values =new string[CBLHowItHasChanged.Items.Count];
        List<ListItem> selected = new List<ListItem>();
        foreach (ListItem item in CBLHowItHasChanged.Items)
            if (item.Selected) selected.Add(item);
        for(int i=0;i<selected.Count;i++)
        {
            y += selected[i].Text+ ",";
        }
        y = y.TrimEnd(',');
        dcPPLAudit ppl = new dcPPLAudit();
        if (RBLEmploymentStatus.SelectedValue == "Other"|| RBLEmploymentStatus.SelectedValue==null|| RBLEmploymentStatus.SelectedValue == "")
        {
            selectedval = txtEmployeeOther.Text;
        }
        else
        {
            selectedval = RBLEmploymentStatus.SelectedValue;
        }

        try
        {
            ppl.PPLInspectionUpdate(txtJobName.Text, txtJob.Text, DateOfInspection, txtInspectorName.Text, toggle1.Checked == true, toggle2.Checked == true, txtHealthy.Text, txtObservation.Text, toggle3.Checked == true, txtMissed.Text, txtAdditionalComments1.Text, toggle4.Checked == true, DateOfSession, selectedval,Under18, AnnualIncome, RBLPrimarySource.SelectedValue, toggle5.Checked == true, txtActionToSave.Text, RBLElectricBillChanged.SelectedValue, y, txtFurtherSteps.Text, txtAdditionalComments2.Text);
            bind(txtJob.Text);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

        
    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {

    }

}