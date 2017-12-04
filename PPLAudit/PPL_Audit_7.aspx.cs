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

public partial class PPLAudit_PPL_Audit_7 : System.Web.UI.Page
{

    dcPPLAudit objppl = new dcPPLAudit();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.UserAgent.Contains("Chrome"))
            {
               // TopBtnDiv.Attributes.Add("style", "position: fixed; top: 65px; z-index: 100; text-align: center; margin: 0 45px;width:510px;");
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["Jobs"] != null)
                {
                    if (Request.QueryString["Jobs"].ToString() != "")
                    {
                        FillUpdateAudit();
                    }
                }
                else
                {
                    Response.Redirect("../Home.aspx");

                }
            }
            if (Convert.ToString(Session["finalize"]) == "F")
            {
                btnSave.Visible = false;
                spnFinal.InnerHtml = "Audit Finalize";
            }
        }
        catch 
        {
        }
    }
    #region Save 
    protected void btnSave_Click(object sender, EventArgs e)
    {
        // Health & Safety/Combustion Testing
        string strHealthAndSafetyCombustionCheckbox = "";
        if (chkHealthAndSafetyCombustionCheckbox_Yes.Checked == true)
        {
            strHealthAndSafetyCombustionCheckbox = "Y";
        }
        else if (chkHealthAndSafetyCombustionCheckbox_No.Checked == true)
        {
            strHealthAndSafetyCombustionCheckbox = "N";
        }


        // Blower Door Depressurization
        string strBlowerDoorDepressurizationCheckbox = "";
        if (chkBlowerDoor_DepressurizationCheckbox_Yes.Checked == true)
        {
            strBlowerDoorDepressurizationCheckbox = "Y";
        }
        else if (chkBlowerDoor_DepressurizationCheckbox_No.Checked == true)
        {
            strBlowerDoorDepressurizationCheckbox = "N";
        }


        //   Blower Door Pressurization (Contaminates)
        string strBlowerDoorPressurizationCheckbox = "";
        if (chkBlowerDoor_Pressurization_Checkbox_Yes.Checked == true)
        {
            strBlowerDoorPressurizationCheckbox = "Y";
        }
        else if (chkBlowerDoor_Pressurization_Checkbox_No.Checked == true)
        {
            strBlowerDoorPressurizationCheckbox = "N";
        }

        //Zonal Pressure Diagnostics
        string strZonalPressureDiagnosticsCheckbox = "";
        if (chkZonalPressure_DiagnosticsCheckbox_Yes.Checked == true)
        {
            strZonalPressureDiagnosticsCheckbox = "Y";
        }
        else if (chkZonalPressure_DiagnosticsCheckbox_No.Checked == true)
        {
            strZonalPressureDiagnosticsCheckbox = "N";
        }


        // Ductwork Test
        string strDuctworkTestCheckbox = "";
        if (chkDuctworkTestCheckbox_Yes.Checked == true)
        {
            strDuctworkTestCheckbox = "Y";
        }
        else if (chkDuctworkTestCheckbox_No.Checked == true)
        {
            strDuctworkTestCheckbox = "N";
        }



        //Final Combustion Test
        string strFinalCombustionTestCheckbox = "";
        if (chkFinalCombustionTestCheckbox_Yes.Checked == true)
        {
            strFinalCombustionTestCheckbox = "Y";
        }
        else if (chkFinalCombustionTestCheckbox_No.Checked == true)
        {
            strFinalCombustionTestCheckbox = "N";
        }


        //Health & Safety
        string strHealthAndSafetyCheckbox = "";
        if (chkHealthAndSafetyCheckbox_Yes.Checked == true)
        {
            strHealthAndSafetyCheckbox = "Y";
        }
        else if (chkHealthAndSafetyCheckbox_No.Checked == true)
        {
            strHealthAndSafetyCheckbox = "N";
        }

        //Major Repairs (e.g. broken glass)
        string strMajorRepairsCheckbox = "";
        if (chkMajorRepairsCheckbox_Yes.Checked == true)
        {
            strMajorRepairsCheckbox = "Y";
        }
        else if (chkMajorRepairsCheckbox_No.Checked == true)
        {
            strMajorRepairsCheckbox = "N";
        }

        // Electric Heat Repairs
        string strElectricHeatRepairsCheckbox = "";
        if (chkElectricHeatRepairsCheckbox_Yes.Checked == true)
        {
            strElectricHeatRepairsCheckbox = "Y";
        }
        else if (chkElectricHeatRepairsCheckbox_No.Checked == true)
        {
            strElectricHeatRepairsCheckbox = "N";
        }

        //  Attic Insulation
        string strAtticInsulationCheckbox = "";
        if (chkAtticInsulationCheckbox_Yes.Checked == true)
        {
            strAtticInsulationCheckbox = "Y";
        }
        else if (chkAtticInsulationCheckbox_No.Checked == true)
        {
            strAtticInsulationCheckbox = "N";
        }

        //  Seal Attic Bypasses & Chaseways
        string strSealAtticBypassesCheckbox = "";
        if (chkSealAtticBypassesCheckbox_Yes.Checked == true)
        {
            strSealAtticBypassesCheckbox = "Y";
        }
        else if (chkSealAtticBypassesCheckbox_No.Checked == true)
        {
            strSealAtticBypassesCheckbox = "N";
        }


        //   Wall Insulation
        string strWallInsulationCheckbox = "";
        if (chkWallInsulationCheckbox_Yes.Checked == true)
        {
            strWallInsulationCheckbox = "Y";
        }
        else if (chkWallInsulationCheckbox_No.Checked == true)
        {
            strWallInsulationCheckbox = "N";
        }


        //        Floor Insulation
        string strFloorInsulationCheckbox = "";
        if (chkFloorInsulationCheckbox_Yes.Checked == true)
        {
            strFloorInsulationCheckbox = "Y";
        }
        else if (chkFloorInsulationCheckbox_No.Checked == true)
        {
            strFloorInsulationCheckbox = "N";
        }

        // Windows & Door Measures
        string strWindowAndDoorMeasuresCheckbox = "";
        if (chkWindowAndDoorMeasuresCheckbox_Yes.Checked == true)
        {
            strWindowAndDoorMeasuresCheckbox = "Y";
        }
        else if (chkWindowAndDoorMeasuresCheckbox_No.Checked == true)
        {
            strWindowAndDoorMeasuresCheckbox = "N";
        }

        //   Heating Measures
        string strHeatingMeasuresCheckbox = "";
        if (chkHeatingMeasuresCheckbox_Yes.Checked == true)
        {
            strHeatingMeasuresCheckbox = "Y";
        }
        else if (chkHeatingMeasuresCheckbox_No.Checked == true)
        {
            strHeatingMeasuresCheckbox = "N";
        }


        //   Cooling Measures
        string strCoolingMeasuresCheckbox = "";
        if (chkCoolingMeasuresCheckbox_Yes.Checked == true)
        {
            strCoolingMeasuresCheckbox = "Y";
        }
        else if (chkCoolingMeasuresCheckbox_No.Checked == true)
        {
            strCoolingMeasuresCheckbox = "N";
        }

        //   Other Measures
        string strOtherMeasuresCheckbox = "";
        if (chkOtherMeasuresCheckbox_Yes.Checked == true)
        {
            strOtherMeasuresCheckbox = "Y";
        }
        else if (chkOtherMeasuresCheckbox_No.Checked == true)
        {
            strOtherMeasuresCheckbox = "N";
        }

        objppl.UpdatePPLAudit_7(Request.QueryString["Jobs"].ToString(), strHealthAndSafetyCombustionCheckbox, txtHealthAndSafetyCombustionComments.Text, strBlowerDoorDepressurizationCheckbox, txtBlowerDoor_Depressurization_Comments.Text, strBlowerDoorPressurizationCheckbox, txtBlowerDoor_Pressurization_Comments.Text, strZonalPressureDiagnosticsCheckbox, txtZonalPressure_DiagnosticsComments.Text, strDuctworkTestCheckbox, txtDuctworkTestComments.Text, strFinalCombustionTestCheckbox, txtFinalCombustionTestComments.Text, strHealthAndSafetyCheckbox, txtHealthAndSafetyComments.Text, strMajorRepairsCheckbox, txtMajorRepairsComments.Text, strElectricHeatRepairsCheckbox, txtElectricHeatRepairsComments.Text, strAtticInsulationCheckbox, txtAtticInsulationComments.Text, strSealAtticBypassesCheckbox, txtSealAtticBypassesComments.Text, strWallInsulationCheckbox, txtWallInsulationComments.Text, strFloorInsulationCheckbox, txtFloorInsulationComments.Text, strWindowAndDoorMeasuresCheckbox, txtWindowAndDoorMeasuresComments.Text, strHeatingMeasuresCheckbox, txtHeatingMeasuresComments.Text, strCoolingMeasuresCheckbox, txtCoolingMeasuresComments.Text, strOtherMeasuresCheckbox, txtOtherMeasuresComments.Text);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Save Successfully');", true); 
    }
    #endregion
    #region Fill Data For Update
    public void FillUpdateAudit()
    {

        DataTable dt = objppl.GetPPLAudit_7(Request.QueryString["Jobs"].ToString());

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
      #endregion

    protected void btnCancel_Click(object sender, EventArgs e)
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
