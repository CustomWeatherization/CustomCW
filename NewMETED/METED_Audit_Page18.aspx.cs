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

public partial class METED_METED_Audit_Page16 : System.Web.UI.Page
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
                txt_KneewallA_House_Pre.Text = Convert.ToString(dt.Rows[0]["KneeWall_A_PreTest2"]);
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


                //string Other1_In = Convert.ToString(dt.Rows[0]["Other1_In"]);
                //if (Other1_In == "Y")
                //{
                //    Chk_Other_In.Checked = true;
                //}

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                //string Other1_Out = Convert.ToString(dt.Rows[0]["Other1_Out"]);
                //if (Other1_Out == "Y")
                //{
                //    Chk_Other_Out.Checked = true;
                //}


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                //txt_Other1_Blower_Pre.Text = Convert.ToString(dt.Rows[0]["Other1_PreTest1"]);
                //txt_Other1_Blower_Final.Text = Convert.ToString(dt.Rows[0]["Other1_Final1"]);
                //txt_Other1_House_Pre.Text = Convert.ToString(dt.Rows[0]["Other1_PreTest2"]);
                //txt_Other1_House_Final.Text = Convert.ToString(dt.Rows[0]["Other1_Final2"]);
                //txt_Other1_Outside_Pre.Text = Convert.ToString(dt.Rows[0]["Other1_PreTest3"]);
                //txt_Other1_Outside_Final.Text = Convert.ToString(dt.Rows[0]["Other1_Final3"]);


                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                //string Other2_In = Convert.ToString(dt.Rows[0]["Other2_In"]);
                //if (Other2_In == "Y")
                //{
                //    Chk_Other2_In.Checked = true;
                //}

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                //string Other2_Out = Convert.ToString(dt.Rows[0]["Other2_Out"]);
                //if (Other2_Out == "Y")
                //{
                //    Chk_Other2_Out.Checked = true;
                //}

                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_CFM50OPEN_In.Text= Convert.ToString(dt.Rows[0]["CFM50OPENIn"]);
                txt_CFM50OPEN_Out.Text=Convert.ToString(dt.Rows[0]["CFM50OPENOut"]);
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
                txt_Supply_pre5.Text = Convert.ToString(dt.Rows[0]["SupplyPre5"]);
                txt_Supply_pro5.Text = Convert.ToString(dt.Rows[0]["SupplyPost5"]);
                txt_Supply_pre6.Text = Convert.ToString(dt.Rows[0]["SupplyPre6"]);
                txt_Supply_pro6.Text = Convert.ToString(dt.Rows[0]["SupplyPost6"]);
                txt_Supply_pre7.Text = Convert.ToString(dt.Rows[0]["SupplyPre7"]);
                txt_Supply_pro7.Text = Convert.ToString(dt.Rows[0]["SupplyPost7"]);
                txt_Supply_pre8.Text = Convert.ToString(dt.Rows[0]["SupplyPre8"]);
                txt_Supply_pro8.Text = Convert.ToString(dt.Rows[0]["SupplyPost8"]);


                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_Return_pre1.Text = Convert.ToString(dt.Rows[0]["ReturnPre1"]);
                txt_Return_pro1.Text = Convert.ToString(dt.Rows[0]["ReturnPost1"]);
                txt_Return_pre2.Text = Convert.ToString(dt.Rows[0]["ReturnPre2"]);
                txt_Return_pro2.Text = Convert.ToString(dt.Rows[0]["ReturnPost2"]);
                txt_Return_pre3.Text = Convert.ToString(dt.Rows[0]["ReturnPre3"]);
                txt_Return_pro3.Text = Convert.ToString(dt.Rows[0]["ReturnPost3"]);
                txt_Return_pre4.Text = Convert.ToString(dt.Rows[0]["ReturnPre4"]);
                txt_Return_pro4.Text = Convert.ToString(dt.Rows[0]["ReturnPost4"]);

                txt_Return_pre5.Text = Convert.ToString(dt.Rows[0]["ReturnPre5"]);
                txt_Return_pro5.Text = Convert.ToString(dt.Rows[0]["ReturnPost5"]);
                txt_Return_pre6.Text = Convert.ToString(dt.Rows[0]["ReturnPre6"]);
                txt_Return_pro6.Text = Convert.ToString(dt.Rows[0]["ReturnPost6"]);
                txt_Return_pre7.Text = Convert.ToString(dt.Rows[0]["ReturnPre7"]);
                txt_Return_pro7.Text = Convert.ToString(dt.Rows[0]["ReturnPost7"]);
                txt_Return_pre8.Text = Convert.ToString(dt.Rows[0]["ReturnPre8"]);
                txt_Return_pro8.Text = Convert.ToString(dt.Rows[0]["ReturnPost8"]);

                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                txt_Comment.Text = Convert.ToString(dt.Rows[0]["Comments"]);



            }
        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
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
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int i = 0;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////    


            string BSMTDoorOpenClosed = "";
            if (rdo_BasemetDoorOpen.Checked == true)
            {
                BSMTDoorOpenClosed = "Open";

            }
            else if (rdo_BasemetDoorClose.Checked == true)
            {
                BSMTDoorOpenClosed = "Close";

            }


            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string AtticDoorOpenClosed = "";
            if (rdo_AtticDoorOpen.Checked == true)
            {
                AtticDoorOpenClosed = "Open";

            }
            else if (rdo_AtticDoor_Close.Checked == true)
            {
                AtticDoorOpenClosed = "Close";

            }


            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            //txt_OtherDoor.Text = Convert.ToString(dt.Rows[0]["OtherDoorCommentPre"]);
            string OtherDoorOpenClosed = "";

            if (rdo_OtherDoor_Open.Checked == true)
            {
                OtherDoorOpenClosed = "Open";

            }
            else if (rdo_OtherDoor_Close.Checked == true)
            {
                OtherDoorOpenClosed = "Close";

            }
            //////////////////////////////////////////////////////////////////////////////////



            string BSMTPostDoorOpenClosed = "";
            if (rdo_BasemetDoor2_Open.Checked == true)
            {
                BSMTPostDoorOpenClosed = "Open";

            }
            else if (rdo_BasemetDoor2_Close.Checked == true)
            {
                BSMTPostDoorOpenClosed = "Close";

            }


            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string AtticPostDoorOpenClosed = "";
            if (rdo_AtticDoor2_Open.Checked == true)
            {
                AtticPostDoorOpenClosed = "Open";

            }
            else if (rdo_AtticDoor2_Close.Checked == true)
            {
                AtticPostDoorOpenClosed = "Close";

            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////



            string OtherPostDoorOpenClosed = "";
            if (rdo_OtherDoor2_Open.Checked == true)
            {
                OtherPostDoorOpenClosed = "Open";

            }
            else if (rdo_OtherDoor2_Close.Checked == true)
            {
                OtherPostDoorOpenClosed = "Close";

            }


            //////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string AtticIn = "";
            if (Chk_Attic_In.Checked == true)
            {
                AtticIn = "Y";

            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string AtticOut = "";
            if (Chk_Attic_Out.Checked == true)
            {
                AtticOut = "Y";

            }

            ////////////////////////////////////////////////////////////////////////////////////////////





            string BasementIn = "";
            if (Chk_Basement_In.Checked == true)
            {
                BasementIn = "Y";

            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////

            string BasementOut = "";
            if (Chk_Basement_Out.Checked == true)
            {
                BasementOut = "Y";

            }


            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



            string VentedCrawlIn = "";
            if (Chk_VentedCrawl_In.Checked == true)
            {
                VentedCrawlIn = "Y";

            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



            string VentedCrawlOut = "";
            if (Chk_VentedCrawl_Out.Checked == true)
            {
                VentedCrawlOut = "y";

            }



            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            string Attic_A_In = "";
            if (Chk_AtticA_In.Checked == true)
            {
                Attic_A_In = "Y";

            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string Attic_A_Out = "";
            if (Chk_AtticA_Out.Checked == true)
            {
                Attic_A_Out = "Y";

            }



            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



            string Attic_B_In = "";
            if (Chk_AtticB_In.Checked == true)
            {
                Attic_B_In = "Y";

            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



            string Attic_B_Out = "";
            if (Chk_AtticB_Out.Checked == true)
            {
                Attic_B_Out = "Y";

            }




            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



            string KneeWall_A_In = "";
            if (Chk_KneewallA_In.Checked == true)
            {
                KneeWall_A_In = "Y";

            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



            string KneeWall_A_Out = "";
            if (Chk_KneewallA_Out.Checked == true)
            {
                KneeWall_A_Out = "Y";

            }




            ////////////////////////////////////////////////////////////////////////////////////////////////////////


            string KneeWall_B_In = "";
            if (Chk_KneewallB_In.Checked == true)
            {
                KneeWall_B_In = "Y";

            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////



            string KneeWall_B_Out = "";
            if (Chk_KneewallB_Out.Checked == true)
            {
                KneeWall_B_Out = "Y";

            }


            ////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string GarageIn = "";
            if (Chk_Garage_In.Checked == true)
            {
                GarageIn = "Y";

            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////

            string GarageOut = "";
            if (Chk_Garage_Out.Checked == true)
            {
                GarageOut = "Y";

            }




            ////////////////////////////////////////////////////////////////////////////////////////
            string GarageAtticIn = "";
            if (Chk_GarageAttic_In.Checked == true)
            {
                GarageAtticIn = "Y";

            }


            //////////////////////////////////////////////////////////////////////////////////////////


            string GarageAtticOut = "";
            if (Chk_GarageAttic_Out.Checked == true)
            {
                GarageAtticOut = "Y";

            }



            /////////////////////////////////////////////////////////////////////////////////////////////////////////


            string CantileverOverHangIn = "";
            if (Chk_CantileverOverhang_In.Checked == true)
            {
                CantileverOverHangIn = "Y";

            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string CantileverOverHangOut = "";
            if (Chk_CantileverOverhang_Out.Checked == true)
            {
                CantileverOverHangOut = "Y";

            }




            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            //string Other1_In = "";
            //if (Chk_Other_In.Checked == true)
            //{
            //    Other1_In = "Y";

            //}

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            //string Other1_Out = "";
            //if (Chk_Other_Out.Checked == true)
            //{
            //    Other1_Out = "Y";

            //}




            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            //string Other2_In = "";
            //if (Chk_Other2_In.Checked == true)
            //{
            //    Other2_In = "Y";

            //}

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            //string Other2_Out = "";
            //if (Chk_Other2_Out.Checked == true)
            //{
            //    Other2_Out = "Y";

            //}



            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string PressureObserved = "";
            if (rdo_DustObsver_Yes.Checked == true)
            {
                PressureObserved = "Y";

            }
            else if (rdo_DustObsver_No.Checked == true)
            {
                PressureObserved = "N";

            }


            //////////////////////////////////////////////////////////////////////////////////////////////


            string DustMaterialMetal = "";
            if (Chk_Matrial_Metal.Checked == true)
            {
                DustMaterialMetal = "Y";

            }

            //////////////////////////////////////////////////////////////////////////////////////////////////


            string DustMaterialDuctBoard = "";
            if (Chk_Matrial_Ductbord.Checked == true)
            {
                DustMaterialDuctBoard = "Y";

            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string DustMaterialFlex = "";
            if (Chk_Matrial_Flex.Checked == true)
            {
                DustMaterialFlex = "Y";

            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string SystemTypeHeat = "";
            if (Chk_System_HeatPump.Checked == true)
            {
                SystemTypeHeat = "Y";

            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string SystemTypeCentral = "";
            if (Chk_CentralAir.Checked == true)
            {
                SystemTypeCentral = "Y";

            }

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string SystemTypeElectric = "";
            if (Chk_ElectricFurnuase.Checked == true)
            {
                SystemTypeElectric = "Y";

            }

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            string SystemTypeOther = "";
            string SystemTypeOtherComment = "";
            if (Chk_Other.Checked == true)
            {
                SystemTypeOther = "Y";

                SystemTypeOtherComment = txt_SystemType_Other.Text;
            }


            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_16(JobNum, txt_NumberOccupants.Text, txt_TotalCFM.Text, txt_Line1_Floor.Text, txt_Line1_width.Text, txt_Line1_length.Text, txt_Line1_Area.Text, txt_Line1_CellHeight.Text, txt_Line1_Volume.Text, txt_Line1_Ach.Text, txt_Line1_Devide.Text, txt_Line1_CFM.Text, txt_Line2_Floor.Text, txt_Line2_width.Text, txt_Line2_length.Text, txt_Line2_Area.Text, txt_Line2_CellHeight.Text, txt_Line2_Volume.Text, txt_Line2_Ach.Text, txt_Line2_Devide.Text, txt_Line2_CFM.Text, txt_Line3_Floor.Text, txt_Line3_width.Text, txt_Line3_length.Text, txt_Line3_Area.Text, txt_Line3_CellHeight.Text, txt_Line3_Volume.Text, txt_Line3_Ach.Text, txt_Line3_Devide.Text, txt_Line3_CFM.Text, txt_Line4_Floor.Text, txt_Line4_width.Text, txt_Line4_length.Text, txt_Line4_Area.Text, txt_Line4_CellHeight.Text, txt_Line4_Volume.Text, txt_Line4_Ach.Text, txt_Line4_Devide.Text, txt_Line4_CFM.Text, txt_Line5_Ach.Text, txt_Line5_CFM.Text, Convert.ToInt32(DDL_storyGrade.SelectedValue), txt_EnterPorB.Text, txt_CorrectedFactor.Text, txt_FactorOnline.Text, txt_Answer.Text, txt_InstallVentilation.Text, txt_TargetBAS.Text, txt_LocationPreTretment.Text, txt_LocationProTretment.Text, txt_OtherNote.Text, txt_PreTretmentResult.Text, BSMTDoorOpenClosed, AtticDoorOpenClosed, txt_OtherDoor.Text, OtherDoorOpenClosed, txt_PostTretment_Result.Text, BSMTPostDoorOpenClosed, AtticPostDoorOpenClosed, txt_OtherDoor2.Text, OtherPostDoorOpenClosed, AtticIn, AtticOut, txt_Attic_Blower_Pre.Text, txt_Attic_Blower_Final.Text, txt_Attic_House_Pre.Text, txt_Attic_House_Final.Text, txt_Attic_Outside_Pre.Text, txt_Attic_Outside_Final.Text, BasementIn, BasementOut, txt_Basement_Bolower_Pre.Text, txt_Basement_Bolower_Final.Text, txt_Basement_House_Pre.Text, txt_Basement_House_Final.Text, txt_Basement_Outside_Pre.Text, txt_Basement_Outside_Final.Text, VentedCrawlIn, VentedCrawlOut, txt_VentedCrawl_Blower_Pre.Text, txt_VentedCrawl_Blower_Final.Text, txt_VentedCrawl_House_Pre.Text, txt_VentedCrawl_House_Final.Text, txt_VentedCrawl_Outside_Pre.Text, txt_VentedCrawl_Outside_Final.Text, Attic_A_In, Attic_A_Out, txt_AtticA_Blower_Pre.Text, txt_AtticA_Blower_Final.Text, txt_AtticA_House_Pre.Text, txt_AtticA_House_Final.Text, txt_AtticA_Outside_Pre.Text, txt_AtticA_Outside_Final.Text, Attic_B_In, Attic_B_Out, txt_AtticB_Blower_Pre.Text, txt_AtticB_Blower_Final.Text, txt_AtticB_House_Pre.Text, txt_AtticB_House_Final.Text, txt_AtticB_Outside_Pre.Text, txt_AtticB_Outside_Final.Text, KneeWall_A_In, KneeWall_A_Out, txt_KneewallA_Blower_Pre.Text, txt_KneewallA_Blower_Final.Text, txt_KneewallA_House_Pre.Text, txt_KneewallA_House_Final.Text, txt_KneewallA_Outside_Pre.Text, txt_KneewallA_Outside_Final.Text, KneeWall_B_In, KneeWall_B_Out, txt_KneewallB_Blower_Pre.Text, txt_KneewallB_Blower_Final.Text, txt_KneewallB_House_Pre.Text, txt_KneewallB_House_Final.Text, txt_KneewallB_Outside_Pre.Text, txt_KneewallB_Outside_Final.Text, GarageIn, GarageOut, txt_Garage_Blower_Pre.Text, txt_Garage_Blower_Final.Text, txt_Garage_House_Pre.Text, txt_Garage_House_Final.Text, txt_Garage_Outside_Pre.Text, txt_Garage_Outside_Final.Text, GarageAtticIn, GarageAtticOut, txt_GarageAttic_Blower_Pre.Text, txt_GarageAttic_Blower_Final.Text, txt_GarageAttic_House_Pre.Text, txt_GarageAttic_House_Final.Text, txt_GarageAttic_Outside_Pre.Text, txt_GarageAttic_Outside_Final.Text, CantileverOverHangIn, CantileverOverHangOut, txt_CantileverOverhang_Blower_Pre.Text, txt_CantileverOverhang_Blower_Final.Text, txt_CantileverOverhang_House_Pre.Text, txt_CantileverOverhang_House_Final.Text, txt_CantileverOverhang_Outside_Pre.Text, txt_CantileverOverhang_Outside_Final.Text, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, txt_Other2_Blower_Pre.Text, txt_Other2_Blower_Final.Text, txt_Other2_House_Pre.Text, txt_Other2_House_Final.Text, txt_Other2_Outside_Pre.Text, txt_Other2_Outside_Final.Text, PressureObserved, DustMaterialMetal, DustMaterialDuctBoard, DustMaterialFlex, SystemTypeHeat, SystemTypeCentral, SystemTypeElectric, SystemTypeOther, SystemTypeOtherComment, txt_Room1.Text, txt_Room2.Text, txt_Room3.Text, txt_Room4.Text, txt_Room5.Text, txt_Room6.Text, txt_Room7.Text, txt_Room8.Text, txt_Supply_pre1.Text, txt_Supply_pro1.Text, txt_Supply_pre2.Text, txt_Supply_pro2.Text, txt_Supply_pre3.Text, txt_Supply_pro3.Text, txt_Supply_pre4.Text, txt_Supply_pro4.Text, txt_Return_pre1.Text, txt_Return_pro1.Text, txt_Return_pre2.Text, txt_Return_pro2.Text, txt_Return_pre3.Text, txt_Return_pro3.Text, txt_Return_pre4.Text, txt_Return_pro4.Text, txt_Comment.Text,txt_CFM50OPEN_In.Text,txt_CFM50OPEN_Out.Text, txt_Supply_pre5.Text, txt_Supply_pro5.Text, txt_Supply_pre6.Text, txt_Supply_pro6.Text, txt_Supply_pre7.Text, txt_Supply_pro7.Text, txt_Supply_pre8.Text, txt_Supply_pro8.Text,txt_Return_pre5.Text,txt_Return_pro5.Text, txt_Return_pro6.Text, txt_Return_pro6.Text, txt_Return_pre7.Text, txt_Return_pro7.Text, txt_Return_pre8.Text, txt_Return_pro8.Text);
            fill_form();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
            Response.Write("<script>alert('Save Successfully');</script>");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
        }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
        catch                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
        }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
}
