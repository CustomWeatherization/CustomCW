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

public partial class PPLAudit_PPL_Audit_3 : System.Web.UI.Page
{
    dcPPLAudit objPPl = new dcPPLAudit();
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
        }
        catch
        {
        }
        if (Convert.ToString(Session["finalize"]) == "F")
        {
            btnSave.Visible = false;
            spnFinal.InnerHtml = "Audit Finalize";
        }
    }
    #region Save
    protected void btnSave_Click(object sender, EventArgs e)
    {
        // Refrigerator Tested First 
        string strRefrigeratorTested = "";
        if (chkRefrigeratorTested_C.Checked == true)
        {
            strRefrigeratorTested = "C";
        }

        else if (chkRefrigeratorTested_R.Checked == true)
        {
            strRefrigeratorTested = "R";

        }
        else if (chkRefrigeratorTested_NA.Checked == true)
        {
            strRefrigeratorTested = "N/A";
        }
        else if (chkRefrigeratorTested_NR.Checked == true)
        {
            strRefrigeratorTested = "N/R";
        }

        // Refrigerator Tested Second 
        string strRefrigeratorTestedSec = "";
        if (chkRefrigeratorTestedSec_C.Checked == true)
        {
            strRefrigeratorTestedSec = "C";
        }

        else if (chkRefrigeratorTestedSec_R.Checked == true)
        {
            strRefrigeratorTestedSec = "R";

        }
        else if (chkRefrigeratorTestedSec_NA.Checked == true)
        {
            strRefrigeratorTestedSec = "N/A";
        }
        else if (chkRefrigeratorTestedSec_NR.Checked == true)
        {
            strRefrigeratorTestedSec = "N/R";
        }





        //  Freezer Tested


        string strFreezerTested = "";
        if (chkFreezerTested_C.Checked == true)
        {
            strFreezerTested = "C";
        }

        else if (chkFreezerTested_R.Checked == true)
        {
            strFreezerTested = "R";

        }
        else if (chkFreezerTested_NA.Checked == true)
        {
            strFreezerTested = "N/A";
        }
        else if (chkFreezerTested_NR.Checked == true)
        {
            strFreezerTested = "N/R";
        }




        //Refrigerator Coils
        string strRefrigeratorCoilsCleaned = "";


        if (chkRefrigeratorCoilsCleaned_C.Checked == true)
        {
            strRefrigeratorCoilsCleaned = "C";
        }

        else if (chkRefrigeratorCoilsCleaned_R.Checked == true)
        {
            strRefrigeratorCoilsCleaned = "R";

        }
        else if (chkRefrigeratorCoilsCleaned_NA.Checked == true)
        {
            strRefrigeratorCoilsCleaned = "N/A";
        }
        else if (chkRefrigeratorCoilsCleaned_NR.Checked == true)
        {
            strRefrigeratorCoilsCleaned = "N/R";
        }


        // AC Filter Changed
        string strACFilterChanged = "";

        if (chkACFilterChanged_C.Checked == true)
        {
            strACFilterChanged = "C";
        }

        else if (chkACFilterChanged_R.Checked == true)
        {
            strACFilterChanged = "R";

        }
        else if (chkACFilterChanged_NA.Checked == true)
        {
            strACFilterChanged = "N/A";
        }
        else if (chkACFilterChanged_NR.Checked == true)
        {
            strACFilterChanged = "N/R";
        }



        //AC Filter Cleaned
        string strACFilterCleaned = "";
        if (chkACFilterCleaned_C.Checked == true)
        {
            strACFilterCleaned = "C";
        }

        else if (chkACFilterCleaned_R.Checked == true)
        {
            strACFilterCleaned = "R";

        }
        else if (chkACFilterCleaned_NA.Checked == true)
        {
            strACFilterCleaned = "N/A";
        }
        else if (chkACFilterCleaned_NR.Checked == true)
        {
            strACFilterCleaned = "N/R";
        }



        //AC(s) Replaced
        string strACReplaced = "";


        if (chkACReplaced_C.Checked == true)
        {
            strACReplaced = "C";
        }

        else if (chkACReplaced_R.Checked == true)
        {
            strACReplaced = "R";

        }
        else if (chkACReplaced_NA.Checked == true)
        {
            strACReplaced = "N/A";
        }
        else if (chkACReplaced_NR.Checked == true)
        {
            strACReplaced = "N/R";
        }


        //Dryer Vent Measures
        string strDryerVentMeasures = "";

        if (chkDryerVentMeasures_C.Checked == true)
        {
            strDryerVentMeasures = "C";
        }

        else if (chkDryerVentMeasures_R.Checked == true)
        {
            strDryerVentMeasures = "R";

        }
        else if (chkDryerVentMeasures_NA.Checked == true)
        {
            strDryerVentMeasures = "N/A";
        }


        // Heating Filter Changed
        string strHeatingFilterChanged = "";

        if (chkHeatingFilterChanged_C.Checked == true)
        {
            strHeatingFilterChanged = "C";
        }

        else if (chkHeatingFilterChanged_R.Checked == true)
        {
            strHeatingFilterChanged = "R";

        }
        else if (chkHeatingFilterChanged_NA.Checked == true)
        {
            strHeatingFilterChanged = "N/A";
        }

        // Heating Filter Cleaned ONE
        string strHeatingFilterCleaned = "";

        if (chkHeatingFilterCleaned_C.Checked == true)
        {
            strHeatingFilterCleaned = "C";
        }

        else if (chkHeatingFilterCleaned_R.Checked == true)
        {
            strHeatingFilterCleaned = "R";

        }
        else if (chkHeatingFilterCleaned_NA.Checked == true)
        {
            strHeatingFilterCleaned = "N/A";
        }


        // Heating Filter Cleaned Two
        string strHeatingFilterCleaned_2 = "";

        if (chkHeatingFilterCleaned2_C.Checked == true)
        {
            strHeatingFilterCleaned_2 = "C";
        }

        else if (chkHeatingFilterCleaned2_R.Checked == true)
        {
            strHeatingFilterCleaned_2 = "R";

        }
        else if (chkHeatingFilterCleaned2_NA.Checked == true)
        {
            strHeatingFilterCleaned_2 = "N/A";
        }

        //*****************Waterbed mattress Replacement******************* 

        //King
        string strKing = "";
        if (chkKing.Checked == true)
        {
            strKing = "Y";
        }

        //Queen
        string strQueen = "";
        if (chkQueen.Checked == true)
        {
            strQueen = "Y";

        }
        //Super Single
        string strSuperSingle = "";
        if (chkSuperSingle.Checked == true)
        {
            strSuperSingle = "Y";
        }
        objPPl.UpdatePPLAudit_3(Request.QueryString["Jobs"].ToString(), strRefrigeratorTested, strDryerVentMeasures, strRefrigeratorTestedSec, txtDryerVentMeauresDescribe.Text, strFreezerTested, strHeatingFilterChanged, strRefrigeratorCoilsCleaned, strACFilterChanged, strHeatingFilterCleaned, strACFilterCleaned, txtComfortMeasuresInstalledCommentsLine1.Text, strACReplaced, txtComfortMeasuresInstalledCommentsLine2.Text, txtAcLoaction.Text, txtOtherComments.Text, txtLivingRoom_CFLS.Text, txtLiving_Room_Comments.Text, txtFamilyRoomCFLS.Text, txtFamilyRoomComments.Text, txtKitchenCFLS.Text, txtKitchen_Comments.Text, txtDiningRoomCFLS.Text, txtDiningRoom_Comments.Text, txtBedroom_1_CFLS.Text, txtBedroom_1_Comments.Text, txtBedroom_2_CFLS.Text, txtBedroom_2_Comments.Text, txtBedRoom_3_CFLS.Text, txtBedRoom_3_Comments.Text, txtBath_1_CFLS.Text, txtBath_1_Comments.Text, txtBath_2_CFLS.Text, txtBath_2_Comments.Text, txtHallwayCFLS.Text, txtHallway_Comments.Text, txtOutDoorCFLS.Text, txtOutDoor_Comments.Text, txtOtherCFLS.Text, txtOther_Comments.Text, txtSpareMax2CFLS.Text, txtSapreMax2_Comments.Text, hdntotal.Value, txtTotalBulbs_Comments.Text, strKing, strQueen, strSuperSingle, txtPads_RequestedReason.Text, txtElectric_Usage_CommentsLine1.Text, txtElectric_Usage_CommentsLine2.Text, txtElectric_Usage_CommentsLine3.Text, strHeatingFilterCleaned, chkLiving.Checked, chkFamilyroom.Checked, ChkKitchen.Checked, chkDining.Checked, Chkbedroom.Checked, chkbedRoom2.Checked, chkbedroom3.Checked, chkbath1.Checked, chkBath2.Checked, chkHallway.Checked, chkOutdoors.Checked, chkother.Checked, chkspare.Checked, txtLivingRoom_CFLSWattage.Text, txtLivingRoom_LightBulbsBrand.Text, txtFamilyRoomCFLSWattage.Text, txtFamilyRoomLightBulbBrand.Text, txtKitchenCFLSWattage.Text, txtKitchenLightBulbBrand.Text, txtDiningRoomCFLSWattage.Text, txtDiningRoomLightBulbBrand.Text, txtBedroom_1_CFLSWattage.Text, txtBedroom_1_LightBulbBrand.Text, txtBedroom_2_CFLSWattage.Text, txtBedroom_2_LightBulbBrand.Text, txtBedRoom_3_CFLSWattage.Text, txtBedRoom_3_LightBulbBrand.Text, txtBath_1_CFLSWattage.Text, txtBath_1_LightBulbBrand.Text, txtBath_2_CFLSWattage.Text, txtBath_2_LightBulbBrand.Text, txtHallwayCFLSWattage.Text, txtHallwayLightBulbBrand.Text, txtOutDoorCFLSWattage.Text, txtOutDoorLightBulbBrand.Text, txtOtherCFLSWattage.Text, txtOtherLightBulbBrand.Text, txtSpareMax2CFLSWattage.Text, txtSpareMax2LightBulbBrand.Text, txtLiving.Text, txtFamilyroom.Text, txtKitchen.Text, txtDining.Text, txtbedroom.Text, txtbedRoom2.Text, txtbedroom3.Text, txtbath1.Text, txtBath2.Text, txtHallway.Text, txtOutdoors.Text, txtother.Text, txtspare.Text, Convert.ToString(DDL_Reason.SelectedValue));
        FillUpdateAudit();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Save Successfully');", true);
    }
    #endregion


    #region Fill Data For Update
    public void FillUpdateAudit()
    {

        DataTable dt = objPPl.GetPPLAudit_3(Request.QueryString["Jobs"].ToString());

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
        hdntotal.Value = dt.Rows[0]["TotalLightBulbCFLS"].ToString();
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

        //King
        if (dt.Rows[0]["KingWaterBed"].ToString() == "Y")
        {
            chkKing.Checked = true;
        }

        //Queen
        if (dt.Rows[0]["QueenWaterBed"].ToString() == "Y")
        {
            chkQueen.Checked = true;
        }
        //Super Single
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
