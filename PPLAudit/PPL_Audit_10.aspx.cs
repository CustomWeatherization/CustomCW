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

public partial class PPLAudit_PPL_Audit_10 : System.Web.UI.Page
{

    dcPPLAudit ObjPPL = new dcPPLAudit();

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
        if (Convert.ToString(Session["finalize"]) == "F")
        {
            btn_save.Visible = false;
            spnFinal.InnerHtml = "Audit Finalize";
        }
    }


    public void BindData(string JobNumber)
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


    protected void btn_save_Click(object sender, EventArgs e)
    {
        string HeatPump1, CentralAirOnly, ElectricFurnace, Other, Metal, DuctBoard, Flex, InCabinet, ExtSlot, ReturnRegisterSlotCovered;
        if (Chk_SystemType_HeatPump.Checked)
        {
            HeatPump1 = "Y";
        }
        else
        {
            HeatPump1 = "";
        }
        if (Chk_SystemType_CentralAirOnly.Checked)
        {
            CentralAirOnly = "Y";
        }
        else
        {
            CentralAirOnly = "";
        }
        if (Chk_SystemType_ElecFurnace.Checked)
        {
            ElectricFurnace = "Y";
        }
        else
        {
            ElectricFurnace = "";
        }
        if (Chk_SystemType_Other.Checked)
        {
            Other = "Y";
        }
        else
        {
            Other = "";
        }
        if (chk_DuctMaterials_Metal.Checked)
        {
            Metal = "Y";
        }
        else
        {
            Metal = "";
        }
        if (chk_DuctMaterials_DuctBoard.Checked)
        {
            DuctBoard = "Y";
        }
        else
        {
            DuctBoard = "";
        }
        if (chk_DuctMaterials_Flex.Checked)
        {
            Flex = "Y";
        }
        else
        {
            Flex = "";
        }
        if (chk_FilterLocations_InCabinet.Checked)
        {
            InCabinet = "Y";
        }
        else
        {
            InCabinet = "";
        }
        if (chk_FilterLocations_ExtSlot.Checked)
        {
            ExtSlot = "Y";
        }
        else
        {
            ExtSlot = "";
        }
        if (chk_FilterLocations_ReturnRegisterSlotCoveredY.Checked)
        {
            ReturnRegisterSlotCovered = "Y";
        }
        else if (chk_FilterLocations_ReturnRegisterSlotCoveredN.Checked)
        {
            ReturnRegisterSlotCovered = "N";
        }
        else
        {
            ReturnRegisterSlotCovered = "";
        }
        string JobNum = Request.QueryString["Jobs"].ToString();
        int i = 0;
        i = ObjPPL.UpdatePPLAudit_10(JobNum, CentralAirOnly, ElectricFurnace, Other, txt_SystemType_OtherDesc.Text, txt_SupplyDuctLocation_BasementWalls.Text, txt_SupplyDuctLocation_Attic.Text, txt_SupplyDuctLocation_Garage.Text, txt_SupplyDuctLocation_VentedCrawl.Text, txt_AirHandlerLocation.Text, Metal, DuctBoard, Flex, InCabinet, ExtSlot, ReturnRegisterSlotCovered, txt_RegNo_Supply_Pre_1.Text, txt_RegNo_Supply_Post_1.Text, txt_RegNo_Supply_Pre_2.Text, txt_RegNo_Supply_Post_2.Text, txt_RegNo_Supply_Pre_3.Text, txt_RegNo_Supply_Post_3.Text, txt_RegNo_Supply_Pre_4.Text, txt_RegNo_Supply_Post_4.Text, txt_RegNo_Supply_Pre_5.Text, txt_RegNo_Supply_Post_5.Text, txt_RegNo_Supply_Pre_6.Text, txt_RegNo_Supply_Post_6.Text, txt_RegNo_Supply_Pre_7.Text, txt_RegNo_Supply_Post_7.Text, txt_RegNo_Supply_Pre_8.Text, txt_RegNo_Supply_Post_8.Text, txt_RegNo_Return_Pre_1.Text, txt_RegNo_Return_Post_1.Text, txt_RegNo_Return_Pre_2.Text, txt_RegNo_Return_Post_2.Text, txt_RegNo_Return_Pre_3.Text, txt_RegNo_Return_Post_3.Text, txt_RegNo_Return_Pre_4.Text, txt_RegNo_Return_Post_4.Text, txt_RegNo_Return_Pre_5.Text, txt_RegNo_Return_Post_5.Text, txt_RegNo_Return_Pre_6.Text, txt_RegNo_Return_Post_6.Text, txt_RegNo_Return_Pre_7.Text, txt_RegNo_Return_Post_7.Text, txt_RegNo_Return_Pre_8.Text, txt_RegNo_Return_Post_8.Text, txt_RegNo_Supply_Pre_9.Text, txt_RegNo_Supply_Post_9.Text, txt_RegNo_Supply_Pre_10.Text, txt_RegNo_Supply_Post_10.Text, txt_RegNo_Supply_Pre_11.Text, txt_RegNo_Supply_Post_11.Text, txt_RegNo_Supply_Pre_12.Text, txt_RegNo_Supply_Post_12.Text, txt_RegNo_Supply_Pre_13.Text, txt_RegNo_Supply_Post_13.Text, txt_RegNo_Supply_Pre_14.Text, txt_RegNo_Supply_Post_14.Text, txt_RegNo_Supply_Pre_15.Text, txt_RegNo_Supply_Post_15.Text, txt_RegNo_Supply_Pre_16.Text, txt_RegNo_Supply_Post_16.Text, txt_RegNo_Return_Pre_9.Text, txt_RegNo_Return_Post_9.Text, txt_RegNo_Return_Pre_10.Text, txt_RegNo_Return_Post_10.Text, txt_RegNo_Return_Pre_11.Text, txt_RegNo_Return_Post_11.Text, txt_RegNo_Return_Pre_12.Text, txt_RegNo_Return_Post_12.Text, txt_RegNo_Return_Pre_13.Text, txt_RegNo_Return_Post_13.Text, txt_RegNo_Return_Pre_14.Text, txt_RegNo_Return_Post_14.Text, txt_RegNo_Return_Pre_15.Text, txt_RegNo_Return_Post_15.Text, txt_RegNo_Return_Pre_16.Text, txt_RegNo_Return_Post_16.Text, HeatPump1, txt_RegisterNoRoom1.Text, txt_RegisterNoRoom2.Text, txt_RegisterNoRoom3.Text, txt_RegisterNoRoom4.Text, txt_RegisterNoRoom5.Text, txt_RegisterNoRoom6.Text, txt_RegisterNoRoom7.Text, txt_RegisterNoRoom8.Text, txt_RegNo_Room9.Text, txt_RegNo_Room10.Text, txt_RegNo_Room11.Text, txt_RegNo_Room12.Text, txt_RegNo_Room13.Text, txt_RegNo_Room14.Text, txt_RegNo_Room15.Text, txt_RegNo_Room16.Text);
        Response.Write("<script>alert('Save Successfully');</script>");
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
