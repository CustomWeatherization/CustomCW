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

public partial class METED_METED_Audit_Page4 : System.Web.UI.Page
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
            txt_Standard_Bullbs.Attributes.Add("readonly", "readonly");
            //txt_SpecialtyBulbs.Attributes.Add("readonly", "readonly");
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_4(JobNum);
            if (dt.Rows.Count > 0)
            {

                ////////////////////////////////////////////////////////////////////////////////////////////


                txt_TotalLedInstallBulb.Text = Convert.ToString(dt.Rows[0]["TotalNumberLedBulbsInstalled"]);
                txt_RecessedFlood.Text = Convert.ToString(dt.Rows[0]["NumberRecessedFloodBulbsInstalled"]);

                txt_Line1_Total.Text = Convert.ToString(dt.Rows[0]["Line1_Total"]);
                txt_Line2_Total.Text = Convert.ToString(dt.Rows[0]["Line2_Total"]);
                txt_Line3_Total.Text = Convert.ToString(dt.Rows[0]["Line3_Total"]);
                txt_Line4_Total.Text = Convert.ToString(dt.Rows[0]["Line4_Total"]);


                txt_Line1_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line1_Location"]);
                txt_Line2_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line2_Location"]);
                txt_Line3_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line3_Location"]);
                txt_Line4_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line4_Location"]);


                string Line1_68Standard = Convert.ToString(dt.Rows[0]["Line1_68Standard"]);
                if (Line1_68Standard == "Y")
                {
                    Chk_Line1_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line1_68Standard.Checked = false;
                }


                string Line1_913Standard = Convert.ToString(dt.Rows[0]["Line1_913Standard"]);
                if (Line1_913Standard == "Y")
                {
                    Chk_Line1_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line1_913Standard.Checked = false;
                }


                string Line1_23Globe = Convert.ToString(dt.Rows[0]["Line1_23Globe"]);
                if (Line1_23Globe == "Y")
                {
                    Chk_Line1_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line1_23Globe.Checked = false;
                }


                string Line1_35MedBase = Convert.ToString(dt.Rows[0]["Line1_35Torpedo"]);
                if (Line1_35MedBase == "Y")
                {
                    Chk_Line1_35MidBase.Checked = true;
                }
                else
                {
                    Chk_Line1_35MidBase.Checked = false;
                }


                string Line1_Candelabra = Convert.ToString(dt.Rows[0]["Line1_37Candelabra"]);
                if (Line1_Candelabra == "Y")
                {
                    Chk_Line1_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line1_Candelabra.Checked = false;
                }


                string Line1_8Flood = Convert.ToString(dt.Rows[0]["Line1_8Flood"]);
                if (Line1_8Flood == "Y")
                {
                    Chk_Line1_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line1_8Flood.Checked = false;
                }


                string Line1_13Flood = Convert.ToString(dt.Rows[0]["Line1_13Flood"]);
                if (Line1_13Flood == "Y")
                {
                    Chk_Line1_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line1_13Flood.Checked = false;
                }


                string Line1_17Flood = Convert.ToString(dt.Rows[0]["Line1_17Flood"]);
                if (Line1_17Flood == "Y")
                {
                    Chk_Line1_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line1_17Flood.Checked = false;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line2_68Standard = Convert.ToString(dt.Rows[0]["Line2_68Standard"]);
                if (Line2_68Standard == "Y")
                {
                    Chk_Line2_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line2_68Standard.Checked = false;
                }


                string Line2_913Standard = Convert.ToString(dt.Rows[0]["Line2_913Standard"]);
                if (Line2_913Standard == "Y")
                {
                    Chk_Line2_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line2_913Standard.Checked = false;
                }


                string Line2_23Globe = Convert.ToString(dt.Rows[0]["Line2_23Globe"]);
                if (Line2_23Globe == "Y")
                {
                    Chk_Line2_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line2_23Globe.Checked = false;
                }


                string Line2_35MedBase = Convert.ToString(dt.Rows[0]["Line2_35Torpedo"]);
                if (Line2_35MedBase == "Y")
                {
                    Chk_Line2_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line2_35MedBase.Checked = false;
                }


                string Line2_Candelabra = Convert.ToString(dt.Rows[0]["Line2_37Candelabra"]);
                if (Line2_Candelabra == "Y")
                {
                    Chk_Line2_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line2_Candelabra.Checked = false;
                }


                string Line2_8Flood = Convert.ToString(dt.Rows[0]["Line2_8Flood"]);
                if (Line2_8Flood == "Y")
                {
                    Chk_Line2_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line2_8Flood.Checked = false;
                }


                string Line2_13Flood = Convert.ToString(dt.Rows[0]["Line2_13Flood"]);
                if (Line2_13Flood == "Y")
                {
                    Chk_Line2_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line2_13Flood.Checked = false;
                }


                string Line2_17Flood = Convert.ToString(dt.Rows[0]["Line2_17Flood"]);
                if (Line2_17Flood == "Y")
                {
                    Chk_Line2_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line2_17Flood.Checked = false;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line3_68Standard = Convert.ToString(dt.Rows[0]["Line3_68Standard"]);
                if (Line3_68Standard == "Y")
                {
                    Chk_Line3_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line3_68Standard.Checked = false;
                }


                string Line3_913Standard = Convert.ToString(dt.Rows[0]["Line3_913Standard"]);
                if (Line3_913Standard == "Y")
                {
                    Chk_Line3_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line3_913Standard.Checked = false;
                }


                string Line3_23Globe = Convert.ToString(dt.Rows[0]["Line3_23Globe"]);
                if (Line3_23Globe == "Y")
                {
                    Chk_Line3_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line3_23Globe.Checked = false;
                }


                string Line3_35MedBase = Convert.ToString(dt.Rows[0]["Line3_35Torpedo"]);
                if (Line3_35MedBase == "Y")
                {
                    Chk_Line3_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line3_35MedBase.Checked = false;
                }


                string Line3_Candelabra = Convert.ToString(dt.Rows[0]["Line3_37Candelabra"]);
                if (Line3_Candelabra == "Y")
                {
                    Chk_Line3_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line3_Candelabra.Checked = false;
                }


                string Line3_8Flood = Convert.ToString(dt.Rows[0]["Line3_8Flood"]);
                if (Line3_8Flood == "Y")
                {
                    Chk_Line3_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line3_8Flood.Checked = false;
                }


                string Line3_13Flood = Convert.ToString(dt.Rows[0]["Line3_13Flood"]);
                if (Line3_13Flood == "Y")
                {
                    Chk_Line3_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line3_13Flood.Checked = false;
                }


                string Line3_17Flood = Convert.ToString(dt.Rows[0]["Line3_17Flood"]);
                if (Line3_17Flood == "Y")
                {
                    Chk_Line3_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line3_17Flood.Checked = false;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line4_68Standard = Convert.ToString(dt.Rows[0]["Line4_68Standard"]);
                if (Line4_68Standard == "Y")
                {
                    Chk_Line4_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line4_68Standard.Checked = false;
                }


                string Line4_913Standard = Convert.ToString(dt.Rows[0]["Line4_913Standard"]);
                if (Line4_913Standard == "Y")
                {
                    Chk_Line4_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line4_913Standard.Checked = false;
                }


                string Line4_23Globe = Convert.ToString(dt.Rows[0]["Line4_23Globe"]);
                if (Line4_23Globe == "Y")
                {
                    Chk_Line4_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line4_23Globe.Checked = false;
                }


                string Line4_35MedBase = Convert.ToString(dt.Rows[0]["Line4_35Torpedo"]);
                if (Line4_35MedBase == "Y")
                {
                    Chk_Line4_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line4_35MedBase.Checked = false;
                }


                string Line4_Candelabra = Convert.ToString(dt.Rows[0]["Line4_37Candelabra"]);
                if (Line4_Candelabra == "Y")
                {
                    Chk_Line4_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line4_Candelabra.Checked = false;
                }


                string Line4_8Flood = Convert.ToString(dt.Rows[0]["Line4_8Flood"]);
                if (Line4_8Flood == "Y")
                {
                    Chk_Line4_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line4_8Flood.Checked = false;
                }


                string Line4_13Flood = Convert.ToString(dt.Rows[0]["Line4_13Flood"]); ;
                if (Line4_13Flood == "Y")
                {
                    Chk_Line4_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line4_13Flood.Checked = false;
                }


                string Line4_17Flood = Convert.ToString(dt.Rows[0]["Line4_17Flood"]); ;
                if (Line4_17Flood == "Y")
                {
                    Chk_Line4_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line4_17Flood.Checked = false;
                }








                string Line1_Act129 = Convert.ToString(dt.Rows[0]["Line1_Act129"]);
                if (Line1_Act129 == "Y")
                {
                    chk_Line1_Act129.Checked = true;
                }
                else
                {
                    chk_Line1_Act129.Checked = false;
                }

                string Line2_Act129 = Convert.ToString(dt.Rows[0]["Line2_Act129"]);
                if (Line2_Act129 == "Y")
                {
                    chk_Line2_Act129.Checked = true;
                }
                else
                {
                    chk_Line2_Act129.Checked = false;
                }


                string Line3_Act129 = Convert.ToString(dt.Rows[0]["Line3_Act129"]);
                if (Line3_Act129 == "Y")
                {
                    chk_Line3_Act129.Checked = true;
                }
                else
                {
                    chk_Line3_Act129.Checked = false;
                }

                string Line4_Act129 = Convert.ToString(dt.Rows[0]["Line4_Act129"]);
                if (Line4_Act129 == "Y")
                {
                    chk_Line4_Act129.Checked = true;
                }
                else
                {
                    chk_Line4_Act129.Checked = false;
                }

                string Line5_Act129 = Convert.ToString(dt.Rows[0]["Line5_Act129"]);
                if (Line5_Act129 == "Y")
                {
                    chk_Line5_Act129.Checked = true;
                }
                else
                {
                    chk_Line5_Act129.Checked = false;
                }

                string Line6_Act129 = Convert.ToString(dt.Rows[0]["Line6_Act129"]);
                if (Line6_Act129 == "Y")
                {
                    chk_Line6_Act129.Checked = true;
                }
                else
                {
                    chk_Line6_Act129.Checked = false;
                }

                string Line7_Act129 = Convert.ToString(dt.Rows[0]["Line7_Act129"]);
                if (Line7_Act129 == "Y")
                {
                    chk_Line7_Act129.Checked = true;
                }
                else
                {
                    chk_Line7_Act129.Checked = false;
                }

                string Line8_Act129 = Convert.ToString(dt.Rows[0]["Line8_Act129"]);
                if (Line8_Act129 == "Y")
                {
                    chk_Line8_Act129.Checked = true;
                }
                else
                {
                    chk_Line8_Act129.Checked = false;
                }

                string Line9_Act129 = Convert.ToString(dt.Rows[0]["Line9_Act129"]);
                if (Line9_Act129 == "Y")
                {
                    chk_Line9_Act129.Checked = true;
                }
                else
                {
                    chk_Line9_Act129.Checked = false;
                }

                string Line10_Act129 = Convert.ToString(dt.Rows[0]["Line10_Act129"]);
                if (Line10_Act129 == "Y")
                {
                    chk_Line10_Act129.Checked = true;
                }
                else
                {
                    chk_Line10_Act129.Checked = false;
                }


                string Line11_Act129 = Convert.ToString(dt.Rows[0]["Line11_Act129"]);
                if (Line11_Act129 == "Y")
                {
                    chk_Line11_Act129.Checked = true;
                }
                else
                {
                    chk_Line11_Act129.Checked = false;
                }

                string Line12_Act129 = Convert.ToString(dt.Rows[0]["Line12_Act129"]);
                if (Line12_Act129 == "Y")
                {
                    chk_Line12_Act129.Checked = true;
                }
                else
                {
                    chk_Line12_Act129.Checked = false;
                }


                string Line13_Act129 = Convert.ToString(dt.Rows[0]["Line13_Act129"]);
                if (Line13_Act129 == "Y")
                {
                    chk_Line13_Act129.Checked = true;
                }
                else
                {
                    chk_Line13_Act129.Checked = false;
                }

                string Line14_Act129 = Convert.ToString(dt.Rows[0]["Line14_Act129"]);
                if (Line14_Act129 == "Y")
                {
                    chk_Line14_Act129.Checked = true;
                }
                else
                {
                    chk_Line14_Act129.Checked = false;
                }

                string Line15_Act129 = Convert.ToString(dt.Rows[0]["Line15_Act129"]);
                if (Line15_Act129 == "Y")
                {
                    chk_Line15_Act129.Checked = true;
                }
                else
                {
                    chk_Line15_Act129.Checked = false;
                }

                string Line16_Act129 = Convert.ToString(dt.Rows[0]["Line16_Act129"]);
                if (Line16_Act129 == "Y")
                {
                    chk_Line16_Act129.Checked = true;
                }
                else
                {
                    chk_Line16_Act129.Checked = false;
                }

                string Line17_Act129 = Convert.ToString(dt.Rows[0]["Line17_Act129"]);
                if (Line17_Act129 == "Y")
                {
                    chk_Line17_Act129.Checked = true;
                }
                else
                {
                    chk_Line17_Act129.Checked = false;
                }

                string Line18_Act129 = Convert.ToString(dt.Rows[0]["Line18_Act129"]);
                if (Line18_Act129 == "Y")
                {
                    chk_Line18_Act129.Checked = true;
                }
                else
                {
                    chk_Line18_Act129.Checked = false;
                }


                string Line1Liurp = Convert.ToString(dt.Rows[0]["Line1Liurp"]);
                if (Line1Liurp == "Y")
                {
                    chk_Line1_LIURP.Checked = true;
                }
                else
                {
                    chk_Line1_LIURP.Checked = false;
                }

                string Line2Liurp = Convert.ToString(dt.Rows[0]["Line2Liurp"]);
                if (Line2Liurp == "Y")
                {
                    chk_Line2_LIURP.Checked = true;
                }
                else
                {
                    chk_Line2_LIURP.Checked = false;
                }


                string Line3Liurp = Convert.ToString(dt.Rows[0]["Line3Liurp"]);
                if (Line3Liurp == "Y")
                {
                    chk_Line3_LIURP.Checked = true;
                }
                else
                {
                    chk_Line3_LIURP.Checked = false;
                }


                string Line4Liurp = Convert.ToString(dt.Rows[0]["Line4Liurp"]);
                if (Line4Liurp == "Y")
                {
                    chk_Line4_LIURP.Checked = true;
                }
                else
                {
                    chk_Line4_LIURP.Checked = false;
                }


                string Line5Liurp = Convert.ToString(dt.Rows[0]["Line5Liurp"]);
                if (Line5Liurp == "Y")
                {
                    chk_Line5_LIURP.Checked = true;
                }
                else
                {
                    chk_Line5_LIURP.Checked = false;
                }


                string Line6Liurp = Convert.ToString(dt.Rows[0]["Line6Liurp"]);
                if (Line6Liurp == "Y")
                {
                    chk_Line6_LIURP.Checked = true;
                }
                else
                {
                    chk_Line6_LIURP.Checked = false;
                }


                string Line7Liurp = Convert.ToString(dt.Rows[0]["Line7Liurp"]);
                if (Line7Liurp == "Y")
                {
                    chk_Line7_LIURP.Checked = true;
                }
                else
                {
                    chk_Line7_LIURP.Checked = false;
                }


                string Line8Liurp = Convert.ToString(dt.Rows[0]["Line8Liurp"]);
                if (Line8Liurp == "Y")
                {
                    chk_Line8_LIURP.Checked = true;
                }
                else
                {
                    chk_Line8_LIURP.Checked = false;
                }



                string Line9Liurp = Convert.ToString(dt.Rows[0]["Line9Liurp"]);
                if (Line9Liurp == "Y")
                {
                    chk_Line9_LIURP.Checked = true;
                }
                else
                {
                    chk_Line9_LIURP.Checked = false;
                }


                string Line10Liurp = Convert.ToString(dt.Rows[0]["Line10Liurp"]);
                if (Line10Liurp == "Y")
                {
                    chk_Line10_LIURP.Checked = true;
                }
                else
                {
                    chk_Line10_LIURP.Checked = false;
                }


                string Line11Liurp = Convert.ToString(dt.Rows[0]["Line11Liurp"]);
                if (Line11Liurp == "Y")
                {
                    chk_Line11_LIURP.Checked = true;
                }
                else
                {
                    chk_Line11_LIURP.Checked = false;
                }


                string Line12Liurp = Convert.ToString(dt.Rows[0]["Line12Liurp"]);
                if (Line12Liurp == "Y")
                {
                    chk_Line12_LIURP.Checked = true;
                }
                else
                {
                    chk_Line12_LIURP.Checked = false;
                }


                string Line13Liurp = Convert.ToString(dt.Rows[0]["Line13Liurp"]);
                if (Line13Liurp == "Y")
                {
                    chk_Line13_LIURP.Checked = true;
                }
                else
                {
                    chk_Line13_LIURP.Checked = false;
                }

                string Line14Liurp = Convert.ToString(dt.Rows[0]["Line14Liurp"]);
                if (Line14Liurp == "Y")
                {
                    chk_Line14_LIURP.Checked = true;
                }
                else
                {
                    chk_Line14_LIURP.Checked = false;
                }


                string Line15Liurp = Convert.ToString(dt.Rows[0]["Line15Liurp"]);
                if (Line15Liurp == "Y")
                {
                    chk_Line15_LIURP.Checked = true;
                }
                else
                {
                    chk_Line15_LIURP.Checked = false;
                }


                string Line16Liurp = Convert.ToString(dt.Rows[0]["Line16Liurp"]);
                if (Line16Liurp == "Y")
                {
                    chk_Line16_LIURP.Checked = true;
                }
                else
                {
                    chk_Line16_LIURP.Checked = false;
                }


                string Line17Liurp = Convert.ToString(dt.Rows[0]["Line17Liurp"]);
                if (Line17Liurp == "Y")
                {
                    chk_Line17_LIURP.Checked = true;
                }
                else
                {
                    chk_Line17_LIURP.Checked = false;
                }

                string Line18Liurp = Convert.ToString(dt.Rows[0]["Line18Liurp"]);
                if (Line18Liurp == "Y")
                {
                    chk_Line18_LIURP.Checked = true;
                }
                else
                {
                    chk_Line18_LIURP.Checked = false;
                }


                txt_Line1_Install.Text = Convert.ToString(dt.Rows[0]["Line1NumStandardBulbs"]);
                txt_Line1_Location.Text = Convert.ToString(dt.Rows[0]["Line1Location"]);
                txt_Line2_Install.Text = Convert.ToString(dt.Rows[0]["Line2NumStandardBulbs"]);
                txt_Line2_Location.Text = Convert.ToString(dt.Rows[0]["Line2Location"]);
                txt_Line3_Install.Text = Convert.ToString(dt.Rows[0]["Line3NumStandardBulbs"]);
                txt_Line3_Location.Text = Convert.ToString(dt.Rows[0]["Line3Location"]);
                txt_Line4_Install.Text = Convert.ToString(dt.Rows[0]["Line4NumStandardBulbs"]);
                txt_Line4_Location.Text = Convert.ToString(dt.Rows[0]["Line4Location"]);
                txt_Line5_Install.Text = Convert.ToString(dt.Rows[0]["Line5NumStandardBulbs"]);
                txt_Line5_Location.Text = Convert.ToString(dt.Rows[0]["Line5Location"]);
                txt_Line6_Install.Text = Convert.ToString(dt.Rows[0]["Line6NumStandardBulbs"]);
                txt_Line6_Location.Text = Convert.ToString(dt.Rows[0]["Line6Location"]);
                txt_Line7_Install.Text = Convert.ToString(dt.Rows[0]["Line7NumStandardBulbs"]);
                txt_Line7_Location.Text = Convert.ToString(dt.Rows[0]["Line7Location"]);
                txt_Line8_Install.Text = Convert.ToString(dt.Rows[0]["Line8NumStandardBulbs"]);
                txt_Line8_Location.Text = Convert.ToString(dt.Rows[0]["Line8Location"]);
                txt_Line9_Install.Text = Convert.ToString(dt.Rows[0]["Line9NumStandardBulbs"]);
                txt_Line9_Location.Text = Convert.ToString(dt.Rows[0]["Line9Location"]);
                txt_Line10_Install.Text = Convert.ToString(dt.Rows[0]["Line10NumStandardBulbs"]);
                txt_Line10_Location.Text = Convert.ToString(dt.Rows[0]["Line10Location"]);
                txt_Line11_Install.Text = Convert.ToString(dt.Rows[0]["Line11NumStandardBulbs"]);
                txt_Line11_Location.Text = Convert.ToString(dt.Rows[0]["Line11Location"]);
                txt_Line12_Install.Text = Convert.ToString(dt.Rows[0]["Line12NumStandardBulbs"]);
                txt_Line12_Location.Text = Convert.ToString(dt.Rows[0]["Line12Location"]);
                txt_Line13_Install.Text = Convert.ToString(dt.Rows[0]["Line13NumStandardBulbs"]);
                txt_Line13_Location.Text = Convert.ToString(dt.Rows[0]["Line13Location"]);
                txt_Line14_Install.Text = Convert.ToString(dt.Rows[0]["Line14NumStandardBulbs"]);
                txt_Line14_Location.Text = Convert.ToString(dt.Rows[0]["Line14Location"]);
                txt_Line15_Install.Text = Convert.ToString(dt.Rows[0]["Line15NumStandardBulbs"]);
                txt_Line15_Location.Text = Convert.ToString(dt.Rows[0]["Line15Location"]);
                txt_Line16_Install.Text = Convert.ToString(dt.Rows[0]["Line16NumStandardBulbs"]);
                txt_Line16_Location.Text = Convert.ToString(dt.Rows[0]["Line16Location"]);
                txt_Line17_Install.Text = Convert.ToString(dt.Rows[0]["Line17NumStandardBulbs"]);
                txt_Line17_Location.Text = Convert.ToString(dt.Rows[0]["Line17Location"]);
                txt_Line18_Install.Text = Convert.ToString(dt.Rows[0]["Line18NumStandardBulbs"]);
                txt_Line18_Location.Text = Convert.ToString(dt.Rows[0]["Line18Location"]);

                if (Convert.ToString(dt.Rows[0]["TotalNumberOfInstalledStandardBulbs"]) == "")
                {
                    txt_Standard_Bullbs.Text = "0";
                }
                else
                {
                    txt_Standard_Bullbs.Text = Convert.ToString(dt.Rows[0]["TotalNumberOfInstalledStandardBulbs"]);
                }
                //hdn_Standard_Bullbs.Value = Convert.ToString(dt.Rows[0]["TotalNumberOfInstalledStandardBulbs"]);
                txt_SpecialtyBulbs.Text = Convert.ToString(dt.Rows[0]["TotalNumberOfInstalledSpecialtyBulbs"]);

                string Line1CFLReplacement = Convert.ToString(dt.Rows[0]["Line1CFLReplacement"]);
                if (Line1CFLReplacement == "9_13")
                {
                    chk_Line1_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_9_13.Checked = false;
                }

                if (Line1CFLReplacement == "14_16")
                {
                    chk_Line1_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_14_16.Checked = false;
                }


                if (Line1CFLReplacement == "17_20")
                {
                    chk_Line1_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_17_20.Checked = false;
                }


                if (Line1CFLReplacement == "21_25")
                {
                    chk_Line1_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_21_25.Checked = false;
                }

                /////////////////////////////////////////////////////////////////////////////////////////////



                string Line2CFLReplacement = Convert.ToString(dt.Rows[0]["Line2CFLReplacement"]);
                if (Line2CFLReplacement == "9_13")
                {
                    chk_Line2_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_9_13.Checked = false;
                }

                if (Line2CFLReplacement == "14_16")
                {
                    chk_Line2_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_14_16.Checked = false;
                }


                if (Line2CFLReplacement == "17_20")
                {
                    chk_Line2_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_17_20.Checked = false;
                }


                if (Line2CFLReplacement == "21_25")
                {
                    chk_Line2_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line3CFLReplacement = Convert.ToString(dt.Rows[0]["Line3CFLReplacement"]);
                if (Line3CFLReplacement == "9_13")
                {
                    chk_Line3_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_9_13.Checked = false;
                }

                if (Line3CFLReplacement == "14_16")
                {
                    chk_Line3_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_14_16.Checked = false;
                }


                if (Line3CFLReplacement == "17_20")
                {
                    chk_Line3_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_17_20.Checked = false;
                }


                if (Line3CFLReplacement == "21_25")
                {
                    chk_Line3_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////

                string Line4CFLReplacement = Convert.ToString(dt.Rows[0]["Line4CFLReplacement"]);
                if (Line4CFLReplacement == "9_13")
                {
                    chk_Line4_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_9_13.Checked = false;
                }

                if (Line4CFLReplacement == "14_16")
                {
                    chk_Line4_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_14_16.Checked = false;
                }


                if (Line4CFLReplacement == "17_20")
                {
                    chk_Line4_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_17_20.Checked = false;
                }


                if (Line4CFLReplacement == "21_25")
                {
                    chk_Line4_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line5CFLReplacement = Convert.ToString(dt.Rows[0]["Line5CFLReplacement"]);
                if (Line5CFLReplacement == "9_13")
                {
                    chk_Line5_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_9_13.Checked = false;
                }

                if (Line5CFLReplacement == "14_16")
                {
                    chk_Line5_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_14_16.Checked = false;
                }


                if (Line5CFLReplacement == "17_20")
                {
                    chk_Line5_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_17_20.Checked = false;
                }


                if (Line5CFLReplacement == "21_25")
                {
                    chk_Line5_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line6CFLReplacement = Convert.ToString(dt.Rows[0]["Line6CFLReplacement"]);
                if (Line6CFLReplacement == "9_13")
                {
                    chk_Line6_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_9_13.Checked = false;
                }

                if (Line6CFLReplacement == "14_16")
                {
                    chk_Line6_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_14_16.Checked = false;
                }


                if (Line6CFLReplacement == "17_20")
                {
                    chk_Line6_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_17_20.Checked = false;
                }


                if (Line6CFLReplacement == "21_25")
                {
                    chk_Line6_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line7CFLReplacement = Convert.ToString(dt.Rows[0]["Line7CFLReplacement"]);
                if (Line7CFLReplacement == "9_13")
                {
                    chk_Line7_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_9_13.Checked = false;
                }

                if (Line7CFLReplacement == "14_16")
                {
                    chk_Line7_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_14_16.Checked = false;
                }


                if (Line7CFLReplacement == "17_20")
                {
                    chk_Line7_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_17_20.Checked = false;
                }


                if (Line7CFLReplacement == "21_25")
                {
                    chk_Line7_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////




                string Line8CFLReplacement = Convert.ToString(dt.Rows[0]["Line8CFLReplacement"]);
                if (Line8CFLReplacement == "9_13")
                {
                    chk_Line8_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_9_13.Checked = false;
                }

                if (Line8CFLReplacement == "14_16")
                {
                    chk_Line8_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_14_16.Checked = false;
                }


                if (Line8CFLReplacement == "17_20")
                {
                    chk_Line8_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_17_20.Checked = false;
                }


                if (Line8CFLReplacement == "21_25")
                {
                    chk_Line8_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////




                string Line9CFLReplacement = Convert.ToString(dt.Rows[0]["Line9CFLReplacement"]);
                if (Line8CFLReplacement == "9_13")
                {
                    chk_Line9_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_9_13.Checked = false;
                }

                if (Line9CFLReplacement == "14_16")
                {
                    chk_Line9_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_14_16.Checked = false;
                }


                if (Line9CFLReplacement == "17_20")
                {
                    chk_Line9_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_17_20.Checked = false;
                }


                if (Line9CFLReplacement == "21_25")
                {
                    chk_Line9_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line10CFLReplacement = Convert.ToString(dt.Rows[0]["Line10CFLReplacement"]);
                if (Line10CFLReplacement == "9_13")
                {
                    chk_Line10_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_9_13.Checked = false;
                }

                if (Line10CFLReplacement == "14_16")
                {
                    chk_Line10_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_14_16.Checked = false;
                }


                if (Line10CFLReplacement == "17_20")
                {
                    chk_Line10_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_17_20.Checked = false;
                }


                if (Line10CFLReplacement == "21_25")
                {
                    chk_Line10_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line11CFLReplacement = Convert.ToString(dt.Rows[0]["Line11CFLReplacement"]);
                if (Line11CFLReplacement == "9_13")
                {
                    chk_Line11_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_9_13.Checked = false;
                }

                if (Line11CFLReplacement == "14_16")
                {
                    chk_Line11_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_14_16.Checked = false;
                }


                if (Line11CFLReplacement == "17_20")
                {
                    chk_Line11_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_17_20.Checked = false;
                }


                if (Line11CFLReplacement == "21_25")
                {
                    chk_Line11_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line12CFLReplacement = Convert.ToString(dt.Rows[0]["Line12CFLReplacement"]);
                if (Line12CFLReplacement == "9_13")
                {
                    chk_Line12_CFL_9_13.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_9_13.Checked = false;
                }

                if (Line12CFLReplacement == "14_16")
                {
                    chk_Line12_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_14_16.Checked = false;
                }


                if (Line12CFLReplacement == "17_20")
                {
                    chk_Line12_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_17_20.Checked = false;
                }


                if (Line12CFLReplacement == "21_25")
                {
                    chk_Line12_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line13CFLReplacement = Convert.ToString(dt.Rows[0]["Line13CFLReplacement"]);
                if (Line13CFLReplacement == "2_9")
                {
                    chk_Line13_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_2_9.Checked = false;
                }

                if (Line13CFLReplacement == "10_13")
                {
                    chk_Line13_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_10_13.Checked = false;
                }

                if (Line13CFLReplacement == "14_16")
                {
                    chk_Line13_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_14_16.Checked = false;
                }




                if (Line13CFLReplacement == "17_20")
                {
                    chk_Line13_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_17_20.Checked = false;
                }


                if (Line13CFLReplacement == "21_25")
                {
                    chk_Line13_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line14CFLReplacement = Convert.ToString(dt.Rows[0]["Line14CFLReplacement"]);
                if (Line14CFLReplacement == "2_9")
                {
                    chk_Line14_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_2_9.Checked = false;
                }

                if (Line14CFLReplacement == "10_13")
                {
                    chk_Line14_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_10_13.Checked = false;
                }

                if (Line14CFLReplacement == "14_16")
                {
                    chk_Line14_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_14_16.Checked = false;
                }




                if (Line14CFLReplacement == "17_20")
                {
                    chk_Line14_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_17_20.Checked = false;
                }


                if (Line14CFLReplacement == "21_25")
                {
                    chk_Line14_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////

                string Line15CFLReplacement = Convert.ToString(dt.Rows[0]["Line15CFLReplacement"]);
                if (Line15CFLReplacement == "2_9")
                {
                    chk_Line15_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_2_9.Checked = false;
                }

                if (Line15CFLReplacement == "10_13")
                {
                    chk_Line15_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_10_13.Checked = false;
                }

                if (Line15CFLReplacement == "14_16")
                {
                    chk_Line15_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_14_16.Checked = false;
                }


                if (Line15CFLReplacement == "17_20")
                {
                    chk_Line15_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_17_20.Checked = false;
                }


                if (Line15CFLReplacement == "21_25")
                {
                    chk_Line15_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line16CFLReplacement = Convert.ToString(dt.Rows[0]["Line16CFLReplacement"]);
                if (Line16CFLReplacement == "2_9")
                {
                    chk_Line16_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_2_9.Checked = false;
                }

                if (Line16CFLReplacement == "10_13")
                {
                    chk_Line16_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_10_13.Checked = false;
                }

                if (Line16CFLReplacement == "14_16")
                {
                    chk_Line16_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_14_16.Checked = false;
                }


                if (Line16CFLReplacement == "17_20")
                {
                    chk_Line16_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_17_20.Checked = false;
                }


                if (Line16CFLReplacement == "21_25")
                {
                    chk_Line16_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line17CFLReplacement = Convert.ToString(dt.Rows[0]["Line17CFLReplacement"]);
                if (Line17CFLReplacement == "2_9")
                {
                    chk_Line17_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_2_9.Checked = false;
                }

                if (Line17CFLReplacement == "10_13")
                {
                    chk_Line17_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_10_13.Checked = false;
                }

                if (Line17CFLReplacement == "14_16")
                {
                    chk_Line17_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_14_16.Checked = false;
                }


                if (Line17CFLReplacement == "17_20")
                {
                    chk_Line17_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_17_20.Checked = false;
                }


                if (Line17CFLReplacement == "21_25")
                {
                    chk_Line17_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line18CFLReplacement = Convert.ToString(dt.Rows[0]["Line18CFLReplacement"]);
                if (Line18CFLReplacement == "2_9")
                {
                    chk_Line18_CFL_2_9.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_2_9.Checked = false;
                }

                if (Line18CFLReplacement == "10_13")
                {
                    chk_Line18_CFL_10_13.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_10_13.Checked = false;
                }

                if (Line18CFLReplacement == "14_16")
                {
                    chk_Line18_CFL_14_16.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_14_16.Checked = false;
                }


                if (Line18CFLReplacement == "17_20")
                {
                    chk_Line18_CFL_17_20.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_17_20.Checked = false;
                }


                if (Line18CFLReplacement == "21_25")
                {
                    chk_Line18_CFL_21_25.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_21_25.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line1CFLLocation = Convert.ToString(dt.Rows[0]["Line1CFLLocation"]);
                if (Line1CFLLocation == "LR")
                {
                    chk_Line1_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_LR.Checked = false;
                }

                if (Line1CFLLocation == "DR")
                {
                    chk_Line1_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_DR.Checked = false;
                }

                if (Line1CFLLocation == "Kitch")
                {
                    chk_Line1_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_Kitch.Checked = false;
                }


                if (Line1CFLLocation == "BR")
                {
                    chk_Line1_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_BR.Checked = false;
                }


                if (Line1CFLLocation == "Bath")
                {
                    chk_Line1_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_Bath.Checked = false;
                }

                if (Line1CFLLocation == "Hall")
                {
                    chk_Line1_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_Hall.Checked = false;
                }

                if (Line1CFLLocation == "Other")
                {
                    chk_Line1_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line1_CFL_Other.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////


                string Line2CFLLocation = Convert.ToString(dt.Rows[0]["Line2CFLLocation"]);
                if (Line2CFLLocation == "LR")
                {
                    chk_Line2_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_LR.Checked = false;
                }

                if (Line2CFLLocation == "DR")
                {
                    chk_Line2_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_DR.Checked = false;
                }

                if (Line2CFLLocation == "Kitch")
                {
                    chk_Line2_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_Kitch.Checked = false;
                }


                if (Line2CFLLocation == "BR")
                {
                    chk_Line2_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_BR.Checked = false;
                }


                if (Line2CFLLocation == "Bath")
                {
                    chk_Line2_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_Bath.Checked = false;
                }

                if (Line2CFLLocation == "Hall")
                {
                    chk_Line2_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_Hall.Checked = false;
                }

                if (Line2CFLLocation == "Other")
                {
                    chk_Line2_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line2_CFL_Other.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////

                string Line3CFLLocation = Convert.ToString(dt.Rows[0]["Line3CFLLocation"]);
                if (Line3CFLLocation == "LR")
                {
                    chk_Line3_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_LR.Checked = false;
                }

                if (Line3CFLLocation == "DR")
                {
                    chk_Line3_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_DR.Checked = false;
                }

                if (Line3CFLLocation == "Kitch")
                {
                    chk_Line3_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_Kitch.Checked = false;
                }


                if (Line3CFLLocation == "BR")
                {
                    chk_Line3_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_BR.Checked = false;
                }


                if (Line3CFLLocation == "Bath")
                {
                    chk_Line3_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_Bath.Checked = false;
                }

                if (Line3CFLLocation == "Hall")
                {
                    chk_Line3_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_Hall.Checked = false;
                }

                if (Line3CFLLocation == "Other")
                {
                    chk_Line3_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line3_CFL_Other.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////

                string Line4CFLLocation = Convert.ToString(dt.Rows[0]["Line4CFLLocation"]);
                if (Line4CFLLocation == "LR")
                {
                    chk_Line4_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_LR.Checked = false;
                }

                if (Line4CFLLocation == "DR")
                {
                    chk_Line4_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_DR.Checked = false;
                }

                if (Line4CFLLocation == "Kitch")
                {
                    chk_Line4_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_Kitch.Checked = false;
                }


                if (Line4CFLLocation == "BR")
                {
                    chk_Line4_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_BR.Checked = false;
                }


                if (Line4CFLLocation == "Bath")
                {
                    chk_Line4_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_Bath.Checked = false;
                }

                if (Line4CFLLocation == "Hall")
                {
                    chk_Line4_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_Hall.Checked = false;
                }

                if (Line4CFLLocation == "Other")
                {
                    chk_Line4_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line4_CFL_Other.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////

                string Line5CFLLocation = Convert.ToString(dt.Rows[0]["Line5CFLLocation"]);
                if (Line5CFLLocation == "LR")
                {
                    chk_Line5_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_LR.Checked = false;
                }

                if (Line5CFLLocation == "DR")
                {
                    chk_Line5_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_DR.Checked = false;
                }

                if (Line5CFLLocation == "Kitch")
                {
                    chk_Line5_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_Kitch.Checked = false;
                }


                if (Line5CFLLocation == "BR")
                {
                    chk_Line5_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_BR.Checked = false;
                }


                if (Line5CFLLocation == "Bath")
                {
                    chk_Line5_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_Bath.Checked = false;
                }

                if (Line5CFLLocation == "Hall")
                {
                    chk_Line5_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_Hall.Checked = false;
                }

                if (Line5CFLLocation == "Other")
                {
                    chk_Line5_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line5_CFL_Other.Checked = false;
                }


                ///////////////////////////////////////////////////////////////////////////////////////



                string Line6CFLLocation = Convert.ToString(dt.Rows[0]["Line6CFLLocation"]);
                if (Line6CFLLocation == "LR")
                {
                    chk_Line6_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_LR.Checked = false;
                }

                if (Line6CFLLocation == "DR")
                {
                    chk_Line6_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_DR.Checked = false;
                }

                if (Line6CFLLocation == "Kitch")
                {
                    chk_Line6_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_Kitch.Checked = false;
                }


                if (Line6CFLLocation == "BR")
                {
                    chk_Line6_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_BR.Checked = false;
                }


                if (Line6CFLLocation == "Bath")
                {
                    chk_Line6_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_Bath.Checked = false;
                }

                if (Line6CFLLocation == "Hall")
                {
                    chk_Line6_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_Hall.Checked = false;
                }

                if (Line6CFLLocation == "Other")
                {
                    chk_Line6_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line6_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line7CFLLocation = Convert.ToString(dt.Rows[0]["Line7CFLLocation"]);
                if (Line7CFLLocation == "LR")
                {
                    chk_Line7_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_LR.Checked = false;
                }

                if (Line7CFLLocation == "DR")
                {
                    chk_Line7_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_DR.Checked = false;
                }

                if (Line7CFLLocation == "Kitch")
                {
                    chk_Line7_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_Kitch.Checked = false;
                }


                if (Line7CFLLocation == "BR")
                {
                    chk_Line7_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_BR.Checked = false;
                }


                if (Line7CFLLocation == "Bath")
                {
                    chk_Line7_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_Bath.Checked = false;
                }

                if (Line7CFLLocation == "Hall")
                {
                    chk_Line7_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_Hall.Checked = false;
                }

                if (Line7CFLLocation == "Other")
                {
                    chk_Line7_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line7_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line8CFLLocation = Convert.ToString(dt.Rows[0]["Line8CFLLocation"]);
                if (Line8CFLLocation == "LR")
                {
                    chk_Line8_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_LR.Checked = false;
                }

                if (Line8CFLLocation == "DR")
                {
                    chk_Line8_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_DR.Checked = false;
                }

                if (Line8CFLLocation == "Kitch")
                {
                    chk_Line8_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_Kitch.Checked = false;
                }


                if (Line8CFLLocation == "BR")
                {
                    chk_Line8_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_BR.Checked = false;
                }


                if (Line8CFLLocation == "Bath")
                {
                    chk_Line8_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_Bath.Checked = false;
                }

                if (Line8CFLLocation == "Hall")
                {
                    chk_Line8_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_Hall.Checked = false;
                }

                if (Line8CFLLocation == "Other")
                {
                    chk_Line8_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line8_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////



                string Line9CFLLocation = Convert.ToString(dt.Rows[0]["Line9CFLLocation"]);
                if (Line9CFLLocation == "LR")
                {
                    chk_Line9_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_LR.Checked = false;
                }

                if (Line9CFLLocation == "DR")
                {
                    chk_Line9_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_DR.Checked = false;
                }

                if (Line9CFLLocation == "Kitch")
                {
                    chk_Line9_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_Kitch.Checked = false;
                }


                if (Line9CFLLocation == "BR")
                {
                    chk_Line9_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_BR.Checked = false;
                }


                if (Line9CFLLocation == "Bath")
                {
                    chk_Line9_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_Bath.Checked = false;
                }

                if (Line9CFLLocation == "Hall")
                {
                    chk_Line9_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_Hall.Checked = false;
                }

                if (Line9CFLLocation == "Other")
                {
                    chk_Line9_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line9_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line10CFLLocation = Convert.ToString(dt.Rows[0]["Line10CFLLocation"]);
                if (Line10CFLLocation == "LR")
                {
                    chk_Line10_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_LR.Checked = false;
                }

                if (Line10CFLLocation == "DR")
                {
                    chk_Line10_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_DR.Checked = false;
                }

                if (Line10CFLLocation == "Kitch")
                {
                    chk_Line10_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_Kitch.Checked = false;
                }


                if (Line10CFLLocation == "BR")
                {
                    chk_Line10_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_BR.Checked = false;
                }


                if (Line10CFLLocation == "Bath")
                {
                    chk_Line10_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_Bath.Checked = false;
                }

                if (Line10CFLLocation == "Hall")
                {
                    chk_Line10_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_Hall.Checked = false;
                }

                if (Line10CFLLocation == "Other")
                {
                    chk_Line10_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line10_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////

                string Line11CFLLocation = Convert.ToString(dt.Rows[0]["Line11CFLLocation"]);
                if (Line11CFLLocation == "LR")
                {
                    chk_Line11_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_LR.Checked = false;
                }

                if (Line11CFLLocation == "DR")
                {
                    chk_Line11_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_DR.Checked = false;
                }

                if (Line11CFLLocation == "Kitch")
                {
                    chk_Line11_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_Kitch.Checked = false;
                }


                if (Line11CFLLocation == "BR")
                {
                    chk_Line11_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_BR.Checked = false;
                }


                if (Line11CFLLocation == "Bath")
                {
                    chk_Line11_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_Bath.Checked = false;
                }

                if (Line11CFLLocation == "Hall")
                {
                    chk_Line11_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_Hall.Checked = false;
                }

                if (Line11CFLLocation == "Other")
                {
                    chk_Line11_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line11_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////

                string Line12CFLLocation = Convert.ToString(dt.Rows[0]["Line12CFLLocation"]);
                if (Line12CFLLocation == "LR")
                {
                    chk_Line12_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_LR.Checked = false;
                }

                if (Line12CFLLocation == "DR")
                {
                    chk_Line12_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_DR.Checked = false;
                }

                if (Line12CFLLocation == "Kitch")
                {
                    chk_Line12_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_Kitch.Checked = false;
                }


                if (Line12CFLLocation == "BR")
                {
                    chk_Line12_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_BR.Checked = false;
                }


                if (Line12CFLLocation == "Bath")
                {
                    chk_Line12_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_Bath.Checked = false;
                }

                if (Line12CFLLocation == "Hall")
                {
                    chk_Line12_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_Hall.Checked = false;
                }

                if (Line12CFLLocation == "Other")
                {
                    chk_Line12_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line12_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line13CFLLocation = Convert.ToString(dt.Rows[0]["Line13CFLLocation"]);
                if (Line13CFLLocation == "LR")
                {
                    chk_Line13_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_LR.Checked = false;
                }

                if (Line13CFLLocation == "DR")
                {
                    chk_Line13_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_DR.Checked = false;
                }

                if (Line13CFLLocation == "Kitch")
                {
                    chk_Line13_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_Kitch.Checked = false;
                }


                if (Line13CFLLocation == "BR")
                {
                    chk_Line13_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_BR.Checked = false;
                }


                if (Line13CFLLocation == "Bath")
                {
                    chk_Line13_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_Bath.Checked = false;
                }

                if (Line13CFLLocation == "Hall")
                {
                    chk_Line13_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_Hall.Checked = false;
                }

                if (Line13CFLLocation == "Other")
                {
                    chk_Line13_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////

                string Line14CFLLocation = Convert.ToString(dt.Rows[0]["Line14CFLLocation"]);
                if (Line14CFLLocation == "LR")
                {
                    chk_Line14_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_LR.Checked = false;
                }

                if (Line14CFLLocation == "DR")
                {
                    chk_Line14_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_DR.Checked = false;
                }

                if (Line14CFLLocation == "Kitch")
                {
                    chk_Line14_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_Kitch.Checked = false;
                }


                if (Line14CFLLocation == "BR")
                {
                    chk_Line14_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_BR.Checked = false;
                }


                if (Line14CFLLocation == "Bath")
                {
                    chk_Line14_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_Bath.Checked = false;
                }

                if (Line14CFLLocation == "Hall")
                {
                    chk_Line14_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_Hall.Checked = false;
                }

                if (Line14CFLLocation == "Other")
                {
                    chk_Line14_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line15CFLLocation = Convert.ToString(dt.Rows[0]["Line15CFLLocation"]);
                if (Line15CFLLocation == "LR")
                {
                    chk_Line15_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_LR.Checked = false;
                }

                if (Line15CFLLocation == "DR")
                {
                    chk_Line15_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_DR.Checked = false;
                }

                if (Line15CFLLocation == "Kitch")
                {
                    chk_Line15_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_Kitch.Checked = false;
                }


                if (Line15CFLLocation == "BR")
                {
                    chk_Line15_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_BR.Checked = false;
                }


                if (Line15CFLLocation == "Bath")
                {
                    chk_Line15_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_Bath.Checked = false;
                }

                if (Line15CFLLocation == "Hall")
                {
                    chk_Line15_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_Hall.Checked = false;
                }

                if (Line15CFLLocation == "Other")
                {
                    chk_Line15_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line16CFLLocation = Convert.ToString(dt.Rows[0]["Line16CFLLocation"]);
                if (Line16CFLLocation == "LR")
                {
                    chk_Line16_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_LR.Checked = false;
                }

                if (Line16CFLLocation == "DR")
                {
                    chk_Line16_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_DR.Checked = false;
                }

                if (Line16CFLLocation == "Kitch")
                {
                    chk_Line16_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_Kitch.Checked = false;
                }


                if (Line16CFLLocation == "BR")
                {
                    chk_Line16_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_BR.Checked = false;
                }


                if (Line16CFLLocation == "Bath")
                {
                    chk_Line16_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_Bath.Checked = false;
                }

                if (Line16CFLLocation == "Hall")
                {
                    chk_Line16_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_Hall.Checked = false;
                }

                if (Line16CFLLocation == "Other")
                {
                    chk_Line16_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line17CFLLocation = Convert.ToString(dt.Rows[0]["Line17CFLLocation"]);
                if (Line17CFLLocation == "LR")
                {
                    chk_Line17_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_LR.Checked = false;
                }

                if (Line17CFLLocation == "DR")
                {
                    chk_Line17_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_DR.Checked = false;
                }

                if (Line17CFLLocation == "Kitch")
                {
                    chk_Line17_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_Kitch.Checked = false;
                }


                if (Line17CFLLocation == "BR")
                {
                    chk_Line17_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_BR.Checked = false;
                }


                if (Line17CFLLocation == "Bath")
                {
                    chk_Line17_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_Bath.Checked = false;
                }

                if (Line17CFLLocation == "Hall")
                {
                    chk_Line17_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_Hall.Checked = false;
                }

                if (Line17CFLLocation == "Other")
                {
                    chk_Line17_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                string Line18CFLLocation = Convert.ToString(dt.Rows[0]["Line18CFLLocation"]);
                if (Line18CFLLocation == "LR")
                {
                    chk_Line18_CFL_LR.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_LR.Checked = false;
                }

                if (Line18CFLLocation == "DR")
                {
                    chk_Line18_CFL_DR.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_DR.Checked = false;
                }

                if (Line18CFLLocation == "Kitch")
                {
                    chk_Line18_CFL_Kitch.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_Kitch.Checked = false;
                }


                if (Line18CFLLocation == "BR")
                {
                    chk_Line18_CFL_BR.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_BR.Checked = false;
                }


                if (Line18CFLLocation == "Bath")
                {
                    chk_Line18_CFL_Bath.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_Bath.Checked = false;
                }

                if (Line18CFLLocation == "Hall")
                {
                    chk_Line18_CFL_Hall.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_Hall.Checked = false;
                }

                if (Line18CFLLocation == "Other")
                {
                    chk_Line18_CFL_Other.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_Other.Checked = false;
                }
                /////////////////////////////////////////////////////////////////////////


                txt_Line1_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line1WARMMeasure"]);
                txt_Line2_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line2WARMMeasure"]);
                txt_Line3_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line3WARMMeasure"]);
                txt_Line4_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line4WARMMeasure"]);
                txt_Line5_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line5WARMMeasure"]);
                txt_Line6_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line6WARMMeasure"]);
                txt_Line7_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line7WARMMeasure"]);
                txt_Line8_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line8WARMMeasure"]);
                txt_Line9_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line9WARMMeasure"]);
                txt_Line10_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line10WARMMeasure"]);
                txt_Line11_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line11WARMMeasure"]);
                txt_Line12_WarmCode.Text = Convert.ToString(dt.Rows[0]["Line12WARMMeasure"]);


                string Line13BulbType = Convert.ToString(dt.Rows[0]["Line13BulbType"]);
                if (Line13BulbType == "SB")
                {
                    chk_Line13_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_SB.Checked = false;
                }

                if (Line13BulbType == "RF")
                {
                    chk_Line13_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line13_CFL_RF.Checked = false;
                }



                string Line14BulbType = Convert.ToString(dt.Rows[0]["Line14BulbType"]);
                if (Line14BulbType == "SB")
                {
                    chk_Line14_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_SB.Checked = false;
                }

                if (Line14BulbType == "RF")
                {
                    chk_Line14_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line14_CFL_RF.Checked = false;
                }


                string Line15BulbType = Convert.ToString(dt.Rows[0]["Line15BulbType"]);
                if (Line15BulbType == "SB")
                {
                    chk_Line15_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_SB.Checked = false;
                }

                if (Line15BulbType == "RF")
                {
                    chk_Line15_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line15_CFL_RF.Checked = false;
                }




                string Line16BulbType = Convert.ToString(dt.Rows[0]["Line16BulbType"]);
                if (Line16BulbType == "SB")
                {
                    chk_Line16_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_SB.Checked = false;
                }

                if (Line16BulbType == "RF")
                {
                    chk_Line16_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line16_CFL_RF.Checked = false;
                }


                string Line17BulbType = Convert.ToString(dt.Rows[0]["Line17BulbType"]);
                if (Line17BulbType == "SB")
                {
                    chk_Line17_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_SB.Checked = false;
                }

                if (Line17BulbType == "RF")
                {
                    chk_Line17_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line17_CFL_RF.Checked = false;
                }




                string Line18BulbType = Convert.ToString(dt.Rows[0]["Line18BulbType"]);
                if (Line18BulbType == "SB")
                {
                    chk_Line18_CFL_SB.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_SB.Checked = false;
                }

                if (Line18BulbType == "RF")
                {
                    chk_Line18_CFL_RF.Checked = true;
                }
                else
                {
                    chk_Line18_CFL_RF.Checked = false;
                }


                txtTorchInstall.Text = Convert.ToString(dt.Rows[0]["TorchiresInstalled"]);
                txtSpcltyBulbInstall.Text = Convert.ToString(dt.Rows[0]["OtherSpecialityBulbInstalled"]);
            }
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
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int i = 0;

            string Line1_Act129 = "";
            if (chk_Line1_Act129.Checked == true)
            {
                Line1_Act129 = "Y";
            }
            else
            {
                Line1_Act129 = "";
            }

            string Line2_Act129 = "";
            if (chk_Line2_Act129.Checked == true)
            {
                Line2_Act129 = "Y";
            }
            else
            {
                Line2_Act129 = "";
            }


            string Line3_Act129 = "";
            if (chk_Line3_Act129.Checked == true)
            {
                Line3_Act129 = "Y";
            }
            else
            {
                Line3_Act129 = "";
            }

            string Line4_Act129 = "";
            if (chk_Line4_Act129.Checked == true)
            {
                Line4_Act129 = "Y";
            }
            else
            {
                Line4_Act129 = "";
            }

            string Line5_Act129 = "";
            if (chk_Line5_Act129.Checked == true)
            {
                Line5_Act129 = "Y";
            }
            else
            {
                Line5_Act129 = "";
            }

            string Line6_Act129 = "";
            if (chk_Line6_Act129.Checked == true)
            {
                Line6_Act129 = "Y";
            }
            else
            {
                Line6_Act129 = "";
            }

            string Line7_Act129 = "";
            if (chk_Line7_Act129.Checked == true)
            {
                Line7_Act129 = "Y";
            }
            else
            {
                Line7_Act129 = "";
            }

            string Line8_Act129 = "";
            if (chk_Line8_Act129.Checked == true)
            {
                Line8_Act129 = "Y";
            }
            else
            {
                Line8_Act129 = "";
            }

            string Line9_Act129 = "";
            if (chk_Line9_Act129.Checked == true)
            {
                Line9_Act129 = "Y";
            }
            else
            {
                Line9_Act129 = "";
            }

            string Line10_Act129 = "";
            if (chk_Line10_Act129.Checked == true)
            {
                Line10_Act129 = "Y";
            }
            else
            {
                Line10_Act129 = "";
            }

            string Line11_Act129 = "";
            if (chk_Line11_Act129.Checked == true)
            {
                Line11_Act129 = "Y";
            }
            else
            {
                Line11_Act129 = "";
            }

            string Line12_Act129 = "";
            if (chk_Line12_Act129.Checked == true)
            {
                Line12_Act129 = "Y";
            }
            else
            {
                Line12_Act129 = "";
            }

            string Line13_Act129 = "";
            if (chk_Line13_Act129.Checked == true)
            {
                Line13_Act129 = "Y";
            }
            else
            {
                Line13_Act129 = "";
            }

            string Line14_Act129 = "";
            if (chk_Line14_Act129.Checked == true)
            {
                Line14_Act129 = "Y";
            }
            else
            {
                Line14_Act129 = "";
            }

            string Line15_Act129 = "";
            if (chk_Line15_Act129.Checked == true)
            {
                Line15_Act129 = "Y";
            }
            else
            {
                Line15_Act129 = "";
            }

            string Line16_Act129 = "";
            if (chk_Line16_Act129.Checked == true)
            {
                Line16_Act129 = "Y";
            }
            else
            {
                Line16_Act129 = "";
            }

            string Line17_Act129 = "";
            if (chk_Line17_Act129.Checked == true)
            {
                Line17_Act129 = "Y";
            }
            else
            {
                Line17_Act129 = "";
            }

            string Line18_Act129 = "";
            if (chk_Line18_Act129.Checked == true)
            {
                Line18_Act129 = "Y";
            }
            else
            {
                Line18_Act129 = "";
            }

            string Line1Liurp = "";
            if (chk_Line1_LIURP.Checked == true)
            {
                Line1Liurp = "Y";
            }
            else
            {
                Line1Liurp = "";
            }

            string Line2Liurp = "";
            if (chk_Line2_LIURP.Checked == true)
            {
                Line2Liurp = "Y";
            }
            else
            {
                Line2Liurp = "";
            }

            string Line3Liurp = "";
            if (chk_Line3_LIURP.Checked == true)
            {
                Line3Liurp = "Y";
            }
            else
            {
                Line3Liurp = "";
            }

            string Line4Liurp = "";
            if (chk_Line4_LIURP.Checked == true)
            {
                Line4Liurp = "Y";
            }
            else
            {
                Line4Liurp = "";
            }


            string Line5Liurp = "";
            if (chk_Line5_LIURP.Checked == true)
            {
                Line5Liurp = "Y";
            }
            else
            {
                Line5Liurp = "";
            }

            string Line6Liurp = "";
            if (chk_Line6_LIURP.Checked == true)
            {
                Line6Liurp = "Y";
            }
            else
            {
                Line6Liurp = "";
            }

            string Line7Liurp = "";
            if (chk_Line7_LIURP.Checked == true)
            {
                Line7Liurp = "Y";
            }
            else
            {
                Line7Liurp = "";
            }

            string Line8Liurp = "";
            if (chk_Line8_LIURP.Checked == true)
            {
                Line8Liurp = "Y";
            }
            else
            {
                Line8Liurp = "";
            }

            string Line9Liurp = "";
            if (chk_Line9_LIURP.Checked == true)
            {
                Line9Liurp = "Y";
            }
            else
            {
                Line9Liurp = "";
            }

            string Line10Liurp = "";
            if (chk_Line10_LIURP.Checked == true)
            {
                Line10Liurp = "Y";
            }
            else
            {
                Line10Liurp = "";
            }

            string Line11Liurp = "";
            if (chk_Line11_LIURP.Checked == true)
            {
                Line11Liurp = "Y";
            }
            else
            {
                Line11Liurp = "";
            }

            string Line12Liurp = "";
            if (chk_Line12_LIURP.Checked == true)
            {
                Line12Liurp = "Y";
            }
            else
            {
                Line12Liurp = "";
            }

            string Line13Liurp = "";
            if (chk_Line13_LIURP.Checked == true)
            {
                Line13Liurp = "Y";
            }
            else
            {
                Line13Liurp = "";
            }

            string Line14Liurp = "";
            if (chk_Line14_LIURP.Checked == true)
            {
                Line14Liurp = "Y";
            }
            else
            {
                Line14Liurp = "";
            }

            string Line15Liurp = "";
            if (chk_Line15_LIURP.Checked == true)
            {
                Line15Liurp = "Y";
            }
            else
            {
                Line15Liurp = "";
            }

            string Line16Liurp = "";
            if (chk_Line16_LIURP.Checked == true)
            {
                Line16Liurp = "Y";
            }
            else
            {
                Line16Liurp = "";
            }

            string Line17Liurp = "";
            if (chk_Line17_LIURP.Checked == true)
            {
                Line17Liurp = "Y";
            }
            else
            {
                Line17Liurp = "";
            }

            string Line18Liurp = "";
            if (chk_Line18_LIURP.Checked == true)
            {
                Line18Liurp = "Y";
            }
            else
            {
                Line18Liurp = "";
            }




            string Line1CFLReplacement = "";
            if (chk_Line1_CFL_9_13.Checked == true)
            {
                Line1CFLReplacement = "9_13";
            }
            else if (chk_Line1_CFL_14_16.Checked == true)
            {
                Line1CFLReplacement = "14_16";
            }
            else if (chk_Line1_CFL_17_20.Checked == true)
            {
                Line1CFLReplacement = "17_20";
            }
            else if (chk_Line1_CFL_21_25.Checked == true)
            {
                Line1CFLReplacement = "21_25";
            }

            /////////////////////////////////////////////////////////////////////////////////////////////

            string Line2CFLReplacement = "";
            if (chk_Line2_CFL_9_13.Checked == true)
            {
                Line2CFLReplacement = "9_13";
            }
            else if (chk_Line2_CFL_14_16.Checked == true)
            {
                Line2CFLReplacement = "14_16";
            }
            else if (chk_Line2_CFL_17_20.Checked == true)
            {
                Line2CFLReplacement = "17_20";
            }
            else if (chk_Line2_CFL_21_25.Checked == true)
            {
                Line2CFLReplacement = "21_25";
            }

            ///////////////////////////////////////////////////////////////////////////////////////



            string Line3CFLReplacement = "";
            if (chk_Line3_CFL_9_13.Checked == true)
            {
                Line3CFLReplacement = "9_13";
            }
            else if (chk_Line3_CFL_14_16.Checked == true)
            {
                Line3CFLReplacement = "14_16";
            }
            else if (chk_Line3_CFL_17_20.Checked == true)
            {
                Line3CFLReplacement = "17_20";
            }
            else if (chk_Line3_CFL_21_25.Checked == true)
            {
                Line3CFLReplacement = "21_25";
            }


            ///////////////////////////////////////////////////////////////////////////////////////

            string Line4CFLReplacement = "";
            if (chk_Line4_CFL_9_13.Checked == true)
            {
                Line4CFLReplacement = "9_13";
            }
            else if (chk_Line4_CFL_14_16.Checked == true)
            {
                Line4CFLReplacement = "14_16";
            }
            else if (chk_Line4_CFL_17_20.Checked == true)
            {
                Line4CFLReplacement = "17_20";
            }
            else if (chk_Line4_CFL_21_25.Checked == true)
            {
                Line4CFLReplacement = "21_25";
            }


            ///////////////////////////////////////////////////////////////////////////////////////

            string Line5CFLReplacement = "";
            if (chk_Line5_CFL_9_13.Checked == true)
            {
                Line5CFLReplacement = "9_13";
            }
            else if (chk_Line5_CFL_14_16.Checked == true)
            {
                Line5CFLReplacement = "14_16";
            }
            else if (chk_Line5_CFL_17_20.Checked == true)
            {
                Line5CFLReplacement = "17_20";
            }
            else if (chk_Line5_CFL_21_25.Checked == true)
            {
                Line5CFLReplacement = "21_25";
            }


            ///////////////////////////////////////////////////////////////////////////////////////



            string Line6CFLReplacement = "";
            if (chk_Line6_CFL_9_13.Checked == true)
            {
                Line6CFLReplacement = "9_13";
            }
            else if (chk_Line6_CFL_14_16.Checked == true)
            {
                Line6CFLReplacement = "14_16";
            }
            else if (chk_Line6_CFL_17_20.Checked == true)
            {
                Line6CFLReplacement = "17_20";
            }
            else if (chk_Line6_CFL_21_25.Checked == true)
            {
                Line6CFLReplacement = "21_25";
            }

            ///////////////////////////////////////////////////////////////////////////////////////


            string Line7CFLReplacement = "";
            if (chk_Line7_CFL_9_13.Checked == true)
            {
                Line7CFLReplacement = "9_13";
            }
            else if (chk_Line7_CFL_14_16.Checked == true)
            {
                Line7CFLReplacement = "14_16";
            }
            else if (chk_Line7_CFL_17_20.Checked == true)
            {
                Line7CFLReplacement = "17_20";
            }
            else if (chk_Line7_CFL_21_25.Checked == true)
            {
                Line7CFLReplacement = "21_25";
            }

            ///////////////////////////////////////////////////////////////////////////////////////


            string Line8CFLReplacement = "";
            if (chk_Line8_CFL_9_13.Checked == true)
            {
                Line8CFLReplacement = "9_13";
            }
            else if (chk_Line8_CFL_14_16.Checked == true)
            {
                Line8CFLReplacement = "14_16";
            }
            else if (chk_Line8_CFL_17_20.Checked == true)
            {
                Line8CFLReplacement = "17_20";
            }
            else if (chk_Line8_CFL_21_25.Checked == true)
            {
                Line8CFLReplacement = "21_25";
            }

            ///////////////////////////////////////////////////////////////////////////////////////




            string Line9CFLReplacement = "";
            if (chk_Line9_CFL_9_13.Checked == true)
            {
                Line9CFLReplacement = "9_13";
            }
            else if (chk_Line9_CFL_14_16.Checked == true)
            {
                Line9CFLReplacement = "14_16";
            }
            else if (chk_Line9_CFL_17_20.Checked == true)
            {
                Line9CFLReplacement = "17_20";
            }
            else if (chk_Line9_CFL_21_25.Checked == true)
            {
                Line9CFLReplacement = "21_25";
            }

            ///////////////////////////////////////////////////////////////////////////////////////


            string Line10CFLReplacement = "";
            if (chk_Line10_CFL_9_13.Checked == true)
            {
                Line10CFLReplacement = "9_13";
            }
            else if (chk_Line10_CFL_14_16.Checked == true)
            {
                Line10CFLReplacement = "14_16";
            }
            else if (chk_Line10_CFL_17_20.Checked == true)
            {
                Line10CFLReplacement = "17_20";
            }
            else if (chk_Line10_CFL_21_25.Checked == true)
            {
                Line10CFLReplacement = "21_25";
            }


            ///////////////////////////////////////////////////////////////////////////////////////

            string Line11CFLReplacement = "";
            if (chk_Line11_CFL_9_13.Checked == true)
            {
                Line11CFLReplacement = "9_13";
            }
            else if (chk_Line11_CFL_14_16.Checked == true)
            {
                Line11CFLReplacement = "14_16";
            }
            else if (chk_Line11_CFL_17_20.Checked == true)
            {
                Line11CFLReplacement = "17_20";
            }
            else if (chk_Line11_CFL_21_25.Checked == true)
            {
                Line11CFLReplacement = "21_25";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string Line12CFLReplacement = "";
            if (chk_Line12_CFL_9_13.Checked == true)
            {
                Line12CFLReplacement = "9_13";
            }
            else if (chk_Line12_CFL_14_16.Checked == true)
            {
                Line12CFLReplacement = "14_16";
            }
            else if (chk_Line12_CFL_17_20.Checked == true)
            {
                Line12CFLReplacement = "17_20";
            }
            else if (chk_Line12_CFL_21_25.Checked == true)
            {
                Line12CFLReplacement = "21_25";
            }


            ///////////////////////////////////////////////////////////////////////////////////////



            string Line13CFLReplacement = "";
            if (chk_Line13_CFL_2_9.Checked == true)
            {
                Line13CFLReplacement = "2_9";
            }
            else if (chk_Line13_CFL_10_13.Checked == true)
            {
                Line13CFLReplacement = "10_13";
            }
            else if (chk_Line13_CFL_14_16.Checked == true)
            {
                Line13CFLReplacement = "14_16";
            }
            else if (chk_Line13_CFL_17_20.Checked == true)
            {
                Line13CFLReplacement = "17_20";
            }
            else if (chk_Line13_CFL_21_25.Checked == true)
            {
                Line13CFLReplacement = "21_25";
            }




            ///////////////////////////////////////////////////////////////////////////////////////


            string Line14CFLReplacement = "";
            if (chk_Line14_CFL_2_9.Checked == true)
            {
                Line14CFLReplacement = "2_9";
            }
            else if (chk_Line14_CFL_10_13.Checked == true)
            {
                Line14CFLReplacement = "10_13";
            }
            else if (chk_Line14_CFL_14_16.Checked == true)
            {
                Line14CFLReplacement = "14_16";
            }
            else if (chk_Line14_CFL_17_20.Checked == true)
            {
                Line14CFLReplacement = "17_20";
            }
            else if (chk_Line14_CFL_21_25.Checked == true)
            {
                Line14CFLReplacement = "21_25";
            }


            ///////////////////////////////////////////////////////////////////////////////////////

            string Line15CFLReplacement = "";
            if (chk_Line15_CFL_2_9.Checked == true)
            {
                Line15CFLReplacement = "2_9";
            }
            else if (chk_Line15_CFL_10_13.Checked == true)
            {
                Line15CFLReplacement = "10_13";
            }
            else if (chk_Line15_CFL_14_16.Checked == true)
            {
                Line15CFLReplacement = "14_16";
            }
            else if (chk_Line15_CFL_17_20.Checked == true)
            {
                Line15CFLReplacement = "17_20";
            }
            else if (chk_Line15_CFL_21_25.Checked == true)
            {
                Line15CFLReplacement = "21_25";
            }

            ///////////////////////////////////////////////////////////////////////////////////////


            string Line16CFLReplacement = "";
            if (chk_Line16_CFL_2_9.Checked == true)
            {
                Line16CFLReplacement = "2_9";
            }
            else if (chk_Line16_CFL_10_13.Checked == true)
            {
                Line16CFLReplacement = "10_13";
            }
            else if (chk_Line16_CFL_14_16.Checked == true)
            {
                Line16CFLReplacement = "14_16";
            }
            else if (chk_Line16_CFL_17_20.Checked == true)
            {
                Line16CFLReplacement = "17_20";
            }
            else if (chk_Line16_CFL_21_25.Checked == true)
            {
                Line16CFLReplacement = "21_25";
            }

            ///////////////////////////////////////////////////////////////////////////////////////


            string Line17CFLReplacement = "";
            if (chk_Line17_CFL_2_9.Checked == true)
            {
                Line17CFLReplacement = "2_9";
            }
            else if (chk_Line17_CFL_10_13.Checked == true)
            {
                Line17CFLReplacement = "10_13";
            }
            else if (chk_Line17_CFL_14_16.Checked == true)
            {
                Line17CFLReplacement = "14_16";
            }
            else if (chk_Line17_CFL_17_20.Checked == true)
            {
                Line17CFLReplacement = "17_20";
            }
            else if (chk_Line17_CFL_21_25.Checked == true)
            {
                Line17CFLReplacement = "21_25";
            }

            ///////////////////////////////////////////////////////////////////////////////////////


            string Line18CFLReplacement = "";
            if (chk_Line18_CFL_2_9.Checked == true)
            {
                Line18CFLReplacement = "2_9";
            }
            else if (chk_Line18_CFL_10_13.Checked == true)
            {
                Line18CFLReplacement = "10_13";
            }
            else if (chk_Line18_CFL_14_16.Checked == true)
            {
                Line18CFLReplacement = "14_16";
            }
            else if (chk_Line18_CFL_17_20.Checked == true)
            {
                Line18CFLReplacement = "17_20";
            }
            else if (chk_Line18_CFL_21_25.Checked == true)
            {
                Line18CFLReplacement = "21_25";
            }


            ///////////////////////////////////////////////////////////////////////////////////////



            string Line1CFLLocation = "";
            if (chk_Line1_CFL_LR.Checked == true)
            {
                Line1CFLLocation = "LR";
            }
            else if (chk_Line1_CFL_DR.Checked == true)
            {
                Line1CFLLocation = "DR";
            }
            else if (chk_Line1_CFL_Kitch.Checked == true)
            {
                Line1CFLLocation = "Kitch";
            }
            else if (chk_Line1_CFL_BR.Checked == true)
            {
                Line1CFLLocation = "BR";
            }
            else if (chk_Line1_CFL_Bath.Checked == true)
            {
                Line1CFLLocation = "Bath";
            }
            else if (chk_Line1_CFL_Hall.Checked == true)
            {
                Line1CFLLocation = "Hall";
            }
            else if (chk_Line1_CFL_Other.Checked == true)
            {
                Line1CFLLocation = "Other";
            }


            ///////////////////////////////////////////////////////////////////////////////////////


            string Line2CFLLocation = "";
            if (chk_Line2_CFL_LR.Checked == true)
            {
                Line2CFLLocation = "LR";
            }
            else if (chk_Line2_CFL_DR.Checked == true)
            {
                Line2CFLLocation = "DR";
            }
            else if (chk_Line2_CFL_Kitch.Checked == true)
            {
                Line2CFLLocation = "Kitch";
            }
            else if (chk_Line2_CFL_BR.Checked == true)
            {
                Line2CFLLocation = "BR";
            }
            else if (chk_Line2_CFL_Bath.Checked == true)
            {
                Line2CFLLocation = "Bath";
            }
            else if (chk_Line2_CFL_Hall.Checked == true)
            {
                Line2CFLLocation = "Hall";
            }
            else if (chk_Line2_CFL_Other.Checked == true)
            {
                Line2CFLLocation = "Other";
            }


            ///////////////////////////////////////////////////////////////////////////////////////

            string Line3CFLLocation = "";
            if (chk_Line3_CFL_LR.Checked == true)
            {
                Line3CFLLocation = "LR";
            }
            else if (chk_Line3_CFL_DR.Checked == true)
            {
                Line3CFLLocation = "DR";
            }
            else if (chk_Line3_CFL_Kitch.Checked == true)
            {
                Line3CFLLocation = "Kitch";
            }
            else if (chk_Line3_CFL_BR.Checked == true)
            {
                Line3CFLLocation = "BR";
            }
            else if (chk_Line3_CFL_Bath.Checked == true)
            {
                Line3CFLLocation = "Bath";
            }
            else if (chk_Line3_CFL_Hall.Checked == true)
            {
                Line3CFLLocation = "Hall";
            }
            else if (chk_Line3_CFL_Other.Checked == true)
            {
                Line3CFLLocation = "Other";
            }

            ///////////////////////////////////////////////////////////////////////////////////////

            string Line4CFLLocation = "";
            if (chk_Line4_CFL_LR.Checked == true)
            {
                Line4CFLLocation = "LR";
            }
            else if (chk_Line4_CFL_DR.Checked == true)
            {
                Line4CFLLocation = "DR";
            }
            else if (chk_Line4_CFL_Kitch.Checked == true)
            {
                Line4CFLLocation = "Kitch";
            }
            else if (chk_Line4_CFL_BR.Checked == true)
            {
                Line4CFLLocation = "BR";
            }
            else if (chk_Line4_CFL_Bath.Checked == true)
            {
                Line4CFLLocation = "Bath";
            }
            else if (chk_Line4_CFL_Hall.Checked == true)
            {
                Line4CFLLocation = "Hall";
            }
            else if (chk_Line4_CFL_Other.Checked == true)
            {
                Line4CFLLocation = "Other";
            }


            ///////////////////////////////////////////////////////////////////////////////////////

            string Line5CFLLocation = "";
            if (chk_Line5_CFL_LR.Checked == true)
            {
                Line5CFLLocation = "LR";
            }
            else if (chk_Line5_CFL_DR.Checked == true)
            {
                Line5CFLLocation = "DR";
            }
            else if (chk_Line5_CFL_Kitch.Checked == true)
            {
                Line5CFLLocation = "Kitch";
            }
            else if (chk_Line5_CFL_BR.Checked == true)
            {
                Line5CFLLocation = "BR";
            }
            else if (chk_Line5_CFL_Bath.Checked == true)
            {
                Line5CFLLocation = "Bath";
            }
            else if (chk_Line5_CFL_Hall.Checked == true)
            {
                Line5CFLLocation = "Hall";
            }
            else if (chk_Line5_CFL_Other.Checked == true)
            {
                Line5CFLLocation = "Other";
            }


            ///////////////////////////////////////////////////////////////////////////////////////



            string Line6CFLLocation = "";
            if (chk_Line6_CFL_LR.Checked == true)
            {
                Line6CFLLocation = "LR";
            }
            else if (chk_Line6_CFL_DR.Checked == true)
            {
                Line6CFLLocation = "DR";
            }
            else if (chk_Line6_CFL_Kitch.Checked == true)
            {
                Line6CFLLocation = "Kitch";
            }
            else if (chk_Line6_CFL_BR.Checked == true)
            {
                Line6CFLLocation = "BR";
            }
            else if (chk_Line6_CFL_Bath.Checked == true)
            {
                Line6CFLLocation = "Bath";
            }
            else if (chk_Line6_CFL_Hall.Checked == true)
            {
                Line6CFLLocation = "Hall";
            }
            else if (chk_Line6_CFL_Other.Checked == true)
            {
                Line6CFLLocation = "Other";
            }

            /////////////////////////////////////////////////////////////////////////



            string Line7CFLLocation = "";
            if (chk_Line7_CFL_LR.Checked == true)
            {
                Line7CFLLocation = "LR";
            }
            else if (chk_Line7_CFL_DR.Checked == true)
            {
                Line7CFLLocation = "DR";
            }
            else if (chk_Line7_CFL_Kitch.Checked == true)
            {
                Line7CFLLocation = "Kitch";
            }
            else if (chk_Line7_CFL_BR.Checked == true)
            {
                Line7CFLLocation = "BR";
            }
            else if (chk_Line7_CFL_Bath.Checked == true)
            {
                Line7CFLLocation = "Bath";
            }
            else if (chk_Line7_CFL_Hall.Checked == true)
            {
                Line7CFLLocation = "Hall";
            }
            else if (chk_Line7_CFL_Other.Checked == true)
            {
                Line7CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////

            string Line8CFLLocation = "";
            if (chk_Line8_CFL_LR.Checked == true)
            {
                Line8CFLLocation = "LR";
            }
            else if (chk_Line8_CFL_DR.Checked == true)
            {
                Line8CFLLocation = "DR";
            }
            else if (chk_Line8_CFL_Kitch.Checked == true)
            {
                Line8CFLLocation = "Kitch";
            }
            else if (chk_Line8_CFL_BR.Checked == true)
            {
                Line8CFLLocation = "BR";
            }
            else if (chk_Line8_CFL_Bath.Checked == true)
            {
                Line8CFLLocation = "Bath";
            }
            else if (chk_Line8_CFL_Hall.Checked == true)
            {
                Line8CFLLocation = "Hall";
            }
            else if (chk_Line8_CFL_Other.Checked == true)
            {
                Line8CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////


            string Line9CFLLocation = "";
            if (chk_Line9_CFL_LR.Checked == true)
            {
                Line9CFLLocation = "LR";
            }
            else if (chk_Line9_CFL_DR.Checked == true)
            {
                Line9CFLLocation = "DR";
            }
            else if (chk_Line9_CFL_Kitch.Checked == true)
            {
                Line9CFLLocation = "Kitch";
            }
            else if (chk_Line9_CFL_BR.Checked == true)
            {
                Line9CFLLocation = "BR";
            }
            else if (chk_Line9_CFL_Bath.Checked == true)
            {
                Line9CFLLocation = "Bath";
            }
            else if (chk_Line9_CFL_Hall.Checked == true)
            {
                Line9CFLLocation = "Hall";
            }
            else if (chk_Line9_CFL_Other.Checked == true)
            {
                Line9CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////

            string Line10CFLLocation = "";
            if (chk_Line10_CFL_LR.Checked == true)
            {
                Line10CFLLocation = "LR";
            }
            else if (chk_Line10_CFL_DR.Checked == true)
            {
                Line10CFLLocation = "DR";
            }
            else if (chk_Line10_CFL_Kitch.Checked == true)
            {
                Line10CFLLocation = "Kitch";
            }
            else if (chk_Line10_CFL_BR.Checked == true)
            {
                Line10CFLLocation = "BR";
            }
            else if (chk_Line10_CFL_Bath.Checked == true)
            {
                Line10CFLLocation = "Bath";
            }
            else if (chk_Line10_CFL_Hall.Checked == true)
            {
                Line10CFLLocation = "Hall";
            }
            else if (chk_Line10_CFL_Other.Checked == true)
            {
                Line10CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////

            string Line11CFLLocation = "";
            if (chk_Line11_CFL_LR.Checked == true)
            {
                Line11CFLLocation = "LR";
            }
            else if (chk_Line11_CFL_DR.Checked == true)
            {
                Line11CFLLocation = "DR";
            }
            else if (chk_Line11_CFL_Kitch.Checked == true)
            {
                Line11CFLLocation = "Kitch";
            }
            else if (chk_Line11_CFL_BR.Checked == true)
            {
                Line11CFLLocation = "BR";
            }
            else if (chk_Line11_CFL_Bath.Checked == true)
            {
                Line11CFLLocation = "Bath";
            }
            else if (chk_Line11_CFL_Hall.Checked == true)
            {
                Line11CFLLocation = "Hall";
            }
            else if (chk_Line11_CFL_Other.Checked == true)
            {
                Line11CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////


            string Line12CFLLocation = "";
            if (chk_Line12_CFL_LR.Checked == true)
            {
                Line12CFLLocation = "LR";
            }
            else if (chk_Line12_CFL_DR.Checked == true)
            {
                Line12CFLLocation = "DR";
            }
            else if (chk_Line12_CFL_Kitch.Checked == true)
            {
                Line12CFLLocation = "Kitch";
            }
            else if (chk_Line12_CFL_BR.Checked == true)
            {
                Line12CFLLocation = "BR";
            }
            else if (chk_Line12_CFL_Bath.Checked == true)
            {
                Line12CFLLocation = "Bath";
            }
            else if (chk_Line12_CFL_Hall.Checked == true)
            {
                Line12CFLLocation = "Hall";
            }
            else if (chk_Line12_CFL_Other.Checked == true)
            {
                Line12CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////


            string Line13CFLLocation = "";
            if (chk_Line13_CFL_LR.Checked == true)
            {
                Line13CFLLocation = "LR";
            }
            else if (chk_Line13_CFL_DR.Checked == true)
            {
                Line13CFLLocation = "DR";
            }
            else if (chk_Line13_CFL_Kitch.Checked == true)
            {
                Line13CFLLocation = "Kitch";
            }
            else if (chk_Line13_CFL_BR.Checked == true)
            {
                Line13CFLLocation = "BR";
            }
            else if (chk_Line13_CFL_Bath.Checked == true)
            {
                Line13CFLLocation = "Bath";
            }
            else if (chk_Line13_CFL_Hall.Checked == true)
            {
                Line13CFLLocation = "Hall";
            }
            else if (chk_Line13_CFL_Other.Checked == true)
            {
                Line13CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////

            string Line14CFLLocation = "";
            if (chk_Line14_CFL_LR.Checked == true)
            {
                Line14CFLLocation = "LR";
            }
            else if (chk_Line14_CFL_DR.Checked == true)
            {
                Line14CFLLocation = "DR";
            }
            else if (chk_Line14_CFL_Kitch.Checked == true)
            {
                Line14CFLLocation = "Kitch";
            }
            else if (chk_Line14_CFL_BR.Checked == true)
            {
                Line14CFLLocation = "BR";
            }
            else if (chk_Line14_CFL_Bath.Checked == true)
            {
                Line14CFLLocation = "Bath";
            }
            else if (chk_Line14_CFL_Hall.Checked == true)
            {
                Line14CFLLocation = "Hall";
            }
            else if (chk_Line14_CFL_Other.Checked == true)
            {
                Line14CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////


            string Line15CFLLocation = "";
            if (chk_Line15_CFL_LR.Checked == true)
            {
                Line15CFLLocation = "LR";
            }
            else if (chk_Line15_CFL_DR.Checked == true)
            {
                Line15CFLLocation = "DR";
            }
            else if (chk_Line15_CFL_Kitch.Checked == true)
            {
                Line15CFLLocation = "Kitch";
            }
            else if (chk_Line15_CFL_BR.Checked == true)
            {
                Line15CFLLocation = "BR";
            }
            else if (chk_Line15_CFL_Bath.Checked == true)
            {
                Line15CFLLocation = "Bath";
            }
            else if (chk_Line15_CFL_Hall.Checked == true)
            {
                Line15CFLLocation = "Hall";
            }
            else if (chk_Line15_CFL_Other.Checked == true)
            {
                Line15CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////

            string Line16CFLLocation = "";
            if (chk_Line16_CFL_LR.Checked == true)
            {
                Line16CFLLocation = "LR";
            }
            else if (chk_Line16_CFL_DR.Checked == true)
            {
                Line16CFLLocation = "DR";
            }
            else if (chk_Line16_CFL_Kitch.Checked == true)
            {
                Line16CFLLocation = "Kitch";
            }
            else if (chk_Line16_CFL_BR.Checked == true)
            {
                Line16CFLLocation = "BR";
            }
            else if (chk_Line16_CFL_Bath.Checked == true)
            {
                Line16CFLLocation = "Bath";
            }
            else if (chk_Line16_CFL_Hall.Checked == true)
            {
                Line16CFLLocation = "Hall";
            }
            else if (chk_Line16_CFL_Other.Checked == true)
            {
                Line16CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////


            string Line17CFLLocation = "";
            if (chk_Line17_CFL_LR.Checked == true)
            {
                Line17CFLLocation = "LR";
            }
            else if (chk_Line17_CFL_DR.Checked == true)
            {
                Line17CFLLocation = "DR";
            }
            else if (chk_Line17_CFL_Kitch.Checked == true)
            {
                Line17CFLLocation = "Kitch";
            }
            else if (chk_Line17_CFL_BR.Checked == true)
            {
                Line17CFLLocation = "BR";
            }
            else if (chk_Line17_CFL_Bath.Checked == true)
            {
                Line17CFLLocation = "Bath";
            }
            else if (chk_Line17_CFL_Hall.Checked == true)
            {
                Line17CFLLocation = "Hall";
            }
            else if (chk_Line17_CFL_Other.Checked == true)
            {
                Line17CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////



            string Line18CFLLocation = "";
            if (chk_Line18_CFL_LR.Checked == true)
            {
                Line18CFLLocation = "LR";
            }
            else if (chk_Line18_CFL_DR.Checked == true)
            {
                Line18CFLLocation = "DR";
            }
            else if (chk_Line18_CFL_Kitch.Checked == true)
            {
                Line18CFLLocation = "Kitch";
            }
            else if (chk_Line18_CFL_BR.Checked == true)
            {
                Line18CFLLocation = "BR";
            }
            else if (chk_Line18_CFL_Bath.Checked == true)
            {
                Line18CFLLocation = "Bath";
            }
            else if (chk_Line18_CFL_Hall.Checked == true)
            {
                Line18CFLLocation = "Hall";
            }
            else if (chk_Line18_CFL_Other.Checked == true)
            {
                Line18CFLLocation = "Other";
            }
            /////////////////////////////////////////////////////////////////////////



            string Line13BulbType = "";
            if (chk_Line13_CFL_SB.Checked == true)
            {
                Line13BulbType = "SB";
            }
            else if (chk_Line13_CFL_RF.Checked == true)
            {
                Line13BulbType = "RF";
            }







            string Line14BulbType = "";
            if (chk_Line14_CFL_SB.Checked == true)
            {
                Line14BulbType = "SB";
            }
            else if (chk_Line14_CFL_RF.Checked == true)
            {
                Line14BulbType = "RF";
            }


            string Line15BulbType = "";
            if (chk_Line15_CFL_SB.Checked == true)
            {
                Line15BulbType = "SB";
            }
            else if (chk_Line15_CFL_RF.Checked == true)
            {
                Line15BulbType = "RF";
            }



            string Line16BulbType = "";
            if (chk_Line16_CFL_SB.Checked == true)
            {
                Line16BulbType = "SB";
            }
            else if (chk_Line16_CFL_RF.Checked == true)
            {
                Line16BulbType = "RF";
            }



            string Line17BulbType = "";
            if (chk_Line17_CFL_SB.Checked == true)
            {
                Line17BulbType = "SB";
            }
            else if (chk_Line17_CFL_RF.Checked == true)
            {
                Line17BulbType = "RF";
            }




            string Line18BulbType = "";
            if (chk_Line18_CFL_SB.Checked == true)
            {
                Line18BulbType = "SB";
            }
            else if (chk_Line18_CFL_RF.Checked == true)
            {
                Line18BulbType = "RF";
            }


            ////////////////////////////////////////////////////////////////////////////////////////////

            string Line1_68Standard = "";
            if (Chk_Line1_68Standard.Checked == true)
            {
                Line1_68Standard = "Y";
            }
            else
            {
                Line1_68Standard = "";
            }


            string Line1_913Standard = "";
            if (Chk_Line1_913Standard.Checked == true)
            {
                Line1_913Standard = "Y";
            }
            else
            {
                Line1_913Standard = "";
            }


            string Line1_23Globe = "";
            if (Chk_Line1_23Globe.Checked == true)
            {
                Line1_23Globe = "Y";
            }
            else
            {
                Line1_23Globe = "";
            }


            string Line1_35MedBase = "";
            if (Chk_Line1_35MidBase.Checked == true)
            {
                Line1_35MedBase = "Y";
            }
            else
            {
                Line1_35MedBase = "";
            }


            string Line1_Candelabra = "";
            if (Chk_Line1_Candelabra.Checked == true)
            {
                Line1_Candelabra = "Y";
            }
            else
            {
                Line1_Candelabra = "";
            }


            string Line1_8Flood = "";
            if (Chk_Line1_8Flood.Checked == true)
            {
                Line1_8Flood = "Y";
            }
            else
            {
                Line1_8Flood = "";
            }


            string Line1_13Flood = "";
            if (Chk_Line1_13Flood.Checked == true)
            {
                Line1_13Flood = "Y";
            }
            else
            {
                Line1_13Flood = "";
            }


            string Line1_17Flood = "";
            if (Chk_Line1_17Flood.Checked == true)
            {
                Line1_17Flood = "Y";
            }
            else
            {
                Line1_17Flood = "";
            }


            ////////////////////////////////////////////////////////////////////////////////////////////

            string Line2_68Standard = "";
            if (Chk_Line2_68Standard.Checked == true)
            {
                Line2_68Standard = "Y";
            }
            else
            {
                Line2_68Standard = "";
            }


            string Line2_913Standard = "";
            if (Chk_Line2_913Standard.Checked == true)
            {
                Line2_913Standard = "Y";
            }
            else
            {
                Line2_913Standard = "";
            }


            string Line2_23Globe = "";
            if (Chk_Line2_23Globe.Checked == true)
            {
                Line2_23Globe = "Y";
            }
            else
            {
                Line2_23Globe = "";
            }


            string Line2_35MedBase = "";
            if (Chk_Line2_35MedBase.Checked == true)
            {
                Line2_35MedBase = "Y";
            }
            else
            {
                Line2_35MedBase = "";
            }


            string Line2_Candelabra = "";
            if (Chk_Line2_Candelabra.Checked == true)
            {
                Line2_Candelabra = "Y";
            }
            else
            {
                Line2_Candelabra = "";
            }


            string Line2_8Flood = "";
            if (Chk_Line2_8Flood.Checked == true)
            {
                Line2_8Flood = "Y";
            }
            else
            {
                Line2_8Flood = "";
            }


            string Line2_13Flood = "";
            if (Chk_Line2_13Flood.Checked == true)
            {
                Line2_13Flood = "Y";
            }
            else
            {
                Line2_13Flood = "";
            }


            string Line2_17Flood = "";
            if (Chk_Line2_17Flood.Checked == true)
            {
                Line2_17Flood = "Y";
            }
            else
            {
                Line2_17Flood = "";
            }


            ////////////////////////////////////////////////////////////////////////////////////////////

            string Line3_68Standard = "";
            if (Chk_Line3_68Standard.Checked == true)
            {
                Line3_68Standard = "Y";
            }
            else
            {
                Line3_68Standard = "";
            }


            string Line3_913Standard = "";
            if (Chk_Line3_913Standard.Checked == true)
            {
                Line3_913Standard = "Y";
            }
            else
            {
                Line3_913Standard = "";
            }


            string Line3_23Globe = "";
            if (Chk_Line3_23Globe.Checked == true)
            {
                Line3_23Globe = "Y";
            }
            else
            {
                Line3_23Globe = "";
            }


            string Line3_35MedBase = "";
            if (Chk_Line3_35MedBase.Checked == true)
            {
                Line3_35MedBase = "Y";
            }
            else
            {
                Line3_35MedBase = "";
            }


            string Line3_Candelabra = "";
            if (Chk_Line3_Candelabra.Checked == true)
            {
                Line3_Candelabra = "Y";
            }
            else
            {
                Line3_Candelabra = "";
            }


            string Line3_8Flood = "";
            if (Chk_Line3_8Flood.Checked == true)
            {
                Line3_8Flood = "Y";
            }
            else
            {
                Line3_8Flood = "";
            }


            string Line3_13Flood = "";
            if (Chk_Line3_13Flood.Checked == true)
            {
                Line3_13Flood = "Y";
            }
            else
            {
                Line3_13Flood = "";
            }


            string Line3_17Flood = "";
            if (Chk_Line3_17Flood.Checked == true)
            {
                Line3_17Flood = "Y";
            }
            else
            {
                Line3_17Flood = "";
            }

            ////////////////////////////////////////////////////////////////////////////////////////////

            string Line4_68Standard = "";
            if (Chk_Line4_68Standard.Checked == true)
            {
                Line4_68Standard = "Y";
            }
            else
            {
                Line4_68Standard = "";
            }


            string Line4_913Standard = "";
            if (Chk_Line4_913Standard.Checked == true)
            {
                Line4_913Standard = "Y";
            }
            else
            {
                Line4_913Standard = "";
            }


            string Line4_23Globe = "";
            if (Chk_Line4_23Globe.Checked == true)
            {
                Line4_23Globe = "Y";
            }
            else
            {
                Line4_23Globe = "";
            }


            string Line4_35MedBase = "";
            if (Chk_Line4_35MedBase.Checked == true)
            {
                Line4_35MedBase = "Y";
            }
            else
            {
                Line4_35MedBase = "";
            }


            string Line4_Candelabra = "";
            if (Chk_Line4_Candelabra.Checked == true)
            {
                Line4_Candelabra = "Y";
            }
            else
            {
                Line4_Candelabra = "";
            }


            string Line4_8Flood = "";
            if (Chk_Line4_8Flood.Checked == true)
            {
                Line4_8Flood = "Y";
            }
            else
            {
                Line4_8Flood = "";
            }


            string Line4_13Flood = "";
            if (Chk_Line4_13Flood.Checked == true)
            {
                Line4_13Flood = "Y";
            }
            else
            {
                Line4_13Flood = "";
            }


            string Line4_17Flood = "";
            if (Chk_Line4_17Flood.Checked == true)
            {
                Line4_17Flood = "Y";
            }
            else
            {
                Line4_17Flood = "";
            }




            string JobNum = Request.QueryString["Jobs"].ToString();
            i = obj_MetedAudit.UpdateMETEDAudit_4(JobNum,"",Line1Liurp, Line2Liurp, Line3Liurp, Line4Liurp, Line5Liurp, Line6Liurp, Line7Liurp, Line8Liurp, Line9Liurp, Line10Liurp, Line11Liurp, Line12Liurp, Line13Liurp, Line14Liurp, Line15Liurp, Line16Liurp, Line17Liurp, Line18Liurp,string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, txt_Line1_Install.Text, txt_Line1_Location.Text, txt_Line2_Install.Text, txt_Line2_Location.Text, txt_Line3_Install.Text, txt_Line3_Location.Text, txt_Line4_Install.Text, txt_Line4_Location.Text, txt_Line5_Install.Text, txt_Line5_Location.Text, txt_Line6_Install.Text, txt_Line6_Location.Text, txt_Line7_Install.Text, txt_Line7_Location.Text, txt_Line8_Install.Text, txt_Line8_Location.Text, txt_Line9_Install.Text, txt_Line9_Location.Text, txt_Line10_Install.Text, txt_Line10_Location.Text, txt_Line11_Install.Text, txt_Line11_Location.Text, txt_Line12_Install.Text, txt_Line12_Location.Text, txt_Line13_Install.Text, txt_Line13_Location.Text, txt_Line14_Install.Text, txt_Line14_Location.Text, txt_Line15_Install.Text, txt_Line15_Location.Text, txt_Line16_Install.Text, txt_Line16_Location.Text, txt_Line17_Install.Text, txt_Line17_Location.Text, txt_Line18_Install.Text, txt_Line18_Location.Text, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, txt_Standard_Bullbs.Text, txt_SpecialtyBulbs.Text, Line1CFLReplacement, Line2CFLReplacement, Line3CFLReplacement, Line4CFLReplacement, Line5CFLReplacement, Line6CFLReplacement, Line7CFLReplacement, Line8CFLReplacement, Line9CFLReplacement, Line10CFLReplacement, Line11CFLReplacement, Line12CFLReplacement, Line13CFLReplacement, Line14CFLReplacement, Line15CFLReplacement, Line16CFLReplacement, Line17CFLReplacement, Line18CFLReplacement, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, Line1CFLLocation, Line2CFLLocation, Line3CFLLocation, Line4CFLLocation, Line5CFLLocation, Line6CFLLocation, Line7CFLLocation, Line8CFLLocation, Line9CFLLocation, Line10CFLLocation, Line11CFLLocation, Line12CFLLocation, Line13CFLLocation, Line14CFLLocation, Line15CFLLocation, Line16CFLLocation, Line17CFLLocation, Line18CFLLocation, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, txt_Line1_WarmCode.Text, txt_Line2_WarmCode.Text, txt_Line3_WarmCode.Text, txt_Line4_WarmCode.Text, txt_Line5_WarmCode.Text, txt_Line6_WarmCode.Text, txt_Line7_WarmCode.Text, txt_Line8_WarmCode.Text, txt_Line9_WarmCode.Text, txt_Line10_WarmCode.Text, txt_Line11_WarmCode.Text, txt_Line12_WarmCode.Text, Line13BulbType, Line14BulbType, Line15BulbType, Line16BulbType, Line17BulbType, Line18BulbType, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, txtTorchInstall.Text, txtSpcltyBulbInstall.Text, Line1_Act129, Line2_Act129, Line3_Act129, Line4_Act129, Line5_Act129, Line6_Act129, Line7_Act129, Line8_Act129, Line9_Act129, Line10_Act129, Line11_Act129, Line12_Act129, Line13_Act129, Line14_Act129, Line15_Act129, Line16_Act129, Line17_Act129, Line18_Act129, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, txt_Line1_Total.Text, Line1_68Standard, Line1_913Standard, Line1_23Globe, Line1_35MedBase, Line1_Candelabra, Line1_8Flood, Line1_13Flood, Line1_17Flood, txt_Line1_Location_LedBlub.Text, txt_Line2_Total.Text, Line2_68Standard, Line2_913Standard, Line2_23Globe, Line2_35MedBase, Line2_Candelabra, Line2_8Flood, Line2_13Flood, Line2_17Flood, txt_Line2_Location_LedBlub.Text, txt_Line3_Total.Text, Line3_68Standard, Line3_913Standard, Line3_23Globe, Line3_35MedBase, Line3_Candelabra, Line3_8Flood, Line3_13Flood, Line3_17Flood, txt_Line3_Location_LedBlub.Text, txt_Line4_Total.Text, Line4_68Standard, Line4_913Standard, Line4_23Globe, Line4_35MedBase, Line4_Candelabra, Line4_8Flood, Line4_13Flood, Line4_17Flood, txt_Line4_Location_LedBlub.Text, txt_RecessedFlood.Text, txt_TotalLedInstallBulb.Text, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty);
            fill_form();
            Response.Write("<script>alert('Save Successfully');</script>");
        }
        catch
        {
        }
    }
}
