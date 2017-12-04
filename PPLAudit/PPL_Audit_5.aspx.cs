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

public partial class PPLAudit_PPL_Audit_5 : System.Web.UI.Page
{
    dcPPLAudit ObjPPL = new dcPPLAudit();

    protected void Page_Load(object sender, EventArgs e)
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
                    string JobNum = Request.QueryString["Jobs"].ToString();
                    BindData(JobNum);
                }
            }
            else
            {
                Response.Redirect("../Home.aspx");
            }
        }
        if (Convert.ToString(Session["finalize"]) == "F")
        {
            btnUpdate.Visible = false;
            spnFinal.InnerHtml = "Audit Finalize";
        }
    }


    public void BindData(string JobNum)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ObjPPL.GetPPLAudit_5(JobNum);
            if (dt.Rows.Count > 0)
            {
                string StrTemp = "";
                StrTemp = Convert.ToString(dt.Rows[0]["WaterHeaterType"]).Replace(" ", "");
                //
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
                // CheckBoxList_occupancy.SelectedValue = Convert.ToString(dt.Rows[0]["ownertenant"]);

                if (Convert.ToString(dt.Rows[0]["ownertenant"]) == "O")
                {
                    chkHomeOwner.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["ownertenant"]) == "T")
                {
                    chkRenter.Checked = true;
                }
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


                if (Convert.ToString(dt.Rows[0]["PermitRequire"]) == "Y")
                {
                    ChkPermitRequireYes.Checked = true;
                }
                else if (Convert.ToString(dt.Rows[0]["PermitRequire"]) == "N")
                {
                    ChkPermitRequireNo.Checked = true;
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



                ///////////////////////////////////////////////////////////////////////////////////////////


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
                if (Convert.ToString(dt.Rows[0]["AmpBreaker"]) != "otr")
                {
                    txtHeatPumpWaterHeaterComment.Text = "";
                }

                DDL_RecommendHPWH_reason.SelectedValue = Convert.ToString(dt.Rows[0]["RecommendHPWH_reason"]);

                ///////////////////////////////////////////////////////////////////////////////////////////////  


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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            string PermitRequire, WaterHeaterAge, WaterHeaterCondition, AmpBreaker, wire102, DishWasherWithoutHeater, TwelveYearPayBackTwelveYearPayBack, NoDirtFloor, HPWHNearExistingDrain, TenByTenBy74, TenByTenBy84, PlumbingElectricalShape, ConsistentUsageHabits, CleanFilter, RecommendHPWH, HPWHSize;
            HPWHSize = "";
            if (chkAgeOfWater0to6.Checked)
            {
                WaterHeaterAge = "1";
            }
            else if (chkAgeOfWater7Year.Checked)
            {
                WaterHeaterAge = "2";
            }
            else
            {
                WaterHeaterAge = "";
            }



            if (ChkPermitRequireYes.Checked)
            {
                PermitRequire = "Y";
            }
            else if (ChkPermitRequireNo.Checked)
            {
                PermitRequire = "N";
            }
            else
            {
                PermitRequire = "";
            }



            if (ConditionOfWaterHeaterGood.Checked)
            {
                WaterHeaterCondition = "1";
            }
            else if (ConditionOfWaterHeaterLeakingOrCorroded.Checked)
            {
                WaterHeaterCondition = "2";
            }
            else if (ConditionOfWaterHeaterBadThermostate.Checked)
            {
                WaterHeaterCondition = "3";
            }
            else if (ConditionOfWaterHeaterBadElement.Checked)
            {
                WaterHeaterCondition = "4";
            }
            else
            {
                WaterHeaterCondition = "";
            }

            if (chkDishWaterHeaterYes.Checked)
            {
                DishWasherWithoutHeater = "Y";
            }
            else if (chkDishWaterHeaterNo.Checked)
            {
                DishWasherWithoutHeater = "N";
            }
            else
            {
                DishWasherWithoutHeater = "";
            }

            if (chkAtLeast2OccupantY.Checked)
            {
                TwelveYearPayBackTwelveYearPayBack = "Y";
            }
            else if (chkAtLeast2OccupantN.Checked)
            {
                TwelveYearPayBackTwelveYearPayBack = "N";
            }
            else
            {
                TwelveYearPayBackTwelveYearPayBack = "";
            }

            if (chk_IsBasement_yes.Checked)
            {
                NoDirtFloor = "Y";
            }
            else if (chk_IsBasement_no.Checked)
            {
                NoDirtFloor = "N";
            }
            else
            {
                NoDirtFloor = "";
            }

            if (chk_CondensateLineHPWHY.Checked)
            {
                HPWHNearExistingDrain = "Y";
            }
            else if (chk_CondensateLineHPWHN.Checked)
            {
                HPWHNearExistingDrain = "N";
            }
            else
            {
                HPWHNearExistingDrain = "";
            }
            //if (chk_HPWH10by10by74Y.Checked)
            //{
            //    TenByTenBy74 = "Y";
            //}
            //else if (chk_HPWH10by10by74N.Checked)
            //{
            //    TenByTenBy74 = "N";
            //}
            //else
            //{
            TenByTenBy74 = "";
            //}

            if (chk_HPWH10by10by84Y.Checked)
            {
                TenByTenBy84 = "Y";
            }
            else if (chk_HPWH10by10by84N.Checked)
            {
                TenByTenBy84 = "N";
            }
            else
            {
                TenByTenBy84 = "";
            }

            if (chk_HomePlumbingUse_yes.Checked)
            {
                PlumbingElectricalShape = "Y";
            }
            else if (chk_HomePlumbingUse_no.Checked)
            {
                PlumbingElectricalShape = "N";
            }
            else
            {
                PlumbingElectricalShape = "";
            }

            if (chk_ConsistentUsageHabits_yes.Checked)
            {
                ConsistentUsageHabits = "Y";
            }
            else if (chk_ConsistentUsageHabits_no.Checked)
            {
                ConsistentUsageHabits = "N";
            }
            else
            {
                ConsistentUsageHabits = "";
            }

            if (chk_CleanHPWHFilter_yes.Checked)
            {
                CleanFilter = "Y";
            }
            else if (chk_CleanHPWHFilter_no.Checked)
            {
                CleanFilter = "N";
            }
            else
            {
                CleanFilter = "";
            }

            if (chk_RecommendHPWHY.Checked)
            {
                RecommendHPWH = "Y";
            }
            else if (chk_RecommendHPWHN.Checked)
            {
                RecommendHPWH = "N";
            }
            else
            {
                RecommendHPWH = "";
            }

            AmpBreaker = "";
            if (chk_CondensatePump.Checked == true)
            {
                AmpBreaker = "CP";
            }
            else if (chk_10_2wire_yes.Checked == true)
            {
                AmpBreaker = "ET";
            }
            else if (chk_AmpBreaker_yes.Checked == true)
            {
                AmpBreaker = "AMP";
            }
            else if (chk_AmpBreaker_no.Checked == true)
            {
                AmpBreaker = "wire";
            }
            else if (chk_10_2wire_no.Checked == true)
            {
                AmpBreaker = "otr";
            }

            //if (RecommendHPWHSize40to50Gallon.Checked)
            //{
            //    HPWHSize = "40";
            //}
            //else if (RecommendHPWHSize60to80Gallon.Checked)
            //{
            //    HPWHSize = "80";
            //}
            //else
            //{
            //    HPWHSize = "";
            //}

            string WaterHeaterTypeForPPL5 = "";
            for (int i = 0; i < CheckBoxList_typeofwater.Items.Count; i++)
            {
                if (CheckBoxList_typeofwater.Items[i].Selected)
                {
                    if (WaterHeaterTypeForPPL5 == "")
                    {
                        WaterHeaterTypeForPPL5 = CheckBoxList_typeofwater.Items[i].Value;
                    }
                    else
                    {
                        WaterHeaterTypeForPPL5 = WaterHeaterTypeForPPL5 + "," + CheckBoxList_typeofwater.Items[i].Value;
                    }
                }
            }

            int j = 0;
            j = ObjPPL.UpdatePPLAudit_5(JobNum, CheckBoxList_numberofgallons.SelectedValue.ToString(), WaterHeaterAge, WaterHeaterCondition, txtExistingWaterTemp.Text, "", DishWasherWithoutHeater, TwelveYearPayBackTwelveYearPayBack, NoDirtFloor, HPWHNearExistingDrain, TenByTenBy74, TenByTenBy84, PlumbingElectricalShape, ConsistentUsageHabits, CleanFilter, RecommendHPWH, HPWHSize, txtCommentSection.Text, WaterHeaterTypeForPPL5, PermitRequire, txtHeatPumpWaterHeaterComment.Text, txt_ManufacturerDate.Text, AmpBreaker, "", txt_Gallon.Text, txt_BrandIfKnown.Text, txt_EFIfKnown.Text, Convert.ToString(DDL_RecommendHPWH_reason.SelectedValue));
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
