using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class NewMETED_METED_Audit_NewPage5 : System.Web.UI.Page
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
    }

    public void fill_form()
    {
        try
        {
            string JobNum = Request.QueryString["Jobs"].ToString();
            DataTable dt = obj_MetedAudit.GetMETEDAudit_4(JobNum);
            if (dt.Rows.Count > 0)
            {
                txt_TotalLedInstallBulb.Text = Convert.ToString(dt.Rows[0]["TotalNumberLedBulbsInstalled"]);


                txt_Line1_Total.Text = Convert.ToString(dt.Rows[0]["Line1_Total"]);
                txt_Line2_Total.Text = Convert.ToString(dt.Rows[0]["Line2_Total"]);
                txt_Line3_Total.Text = Convert.ToString(dt.Rows[0]["Line3_Total"]);
                txt_Line4_Total.Text = Convert.ToString(dt.Rows[0]["Line4_Total"]);
                txt_Line5_Total.Text = Convert.ToString(dt.Rows[0]["Line5_Total"]);
                txt_Line6_Total.Text = Convert.ToString(dt.Rows[0]["Line6_Total"]);
                txt_Line7_Total.Text = Convert.ToString(dt.Rows[0]["Line7_Total"]);
                txt_Line8_Total.Text = Convert.ToString(dt.Rows[0]["Line8_Total"]);
                txt_Line9_Total.Text = Convert.ToString(dt.Rows[0]["Line9_Total"]);
                txt_Line10_Total.Text = Convert.ToString(dt.Rows[0]["Line10_Total"]);
                txt_Line11_Total.Text = Convert.ToString(dt.Rows[0]["Line11_Total"]);
                txt_Line12_Total.Text = Convert.ToString(dt.Rows[0]["Line12_Total"]);
                txt_Line13_Total.Text = Convert.ToString(dt.Rows[0]["Line13_Total"]);
                txt_Line14_Total.Text = Convert.ToString(dt.Rows[0]["Line14_Total"]);

                txt_Line1_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line1_Location"]);
                txt_Line2_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line2_Location"]);
                txt_Line3_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line3_Location"]);
                txt_Line4_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line4_Location"]);
                txt_Line5_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line5_Location"]);
                txt_Line6_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line6_Location"]);
                txt_Line7_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line7_Location"]);
                txt_Line8_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line8_Location"]);
                txt_Line9_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line9_Location"]);
                txt_Line10_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line10_Location"]);
                txt_Line11_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line11_Location"]);
                txt_Line12_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line12_Location"]);
                txt_Line13_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line13_Location"]);
                txt_Line14_Location_LedBlub.Text = Convert.ToString(dt.Rows[0]["Line14_Location"]);



                ///////////////////////////////////////////////////////////////////////////////////////////////////



                string Line1_RetroKit = Convert.ToString(dt.Rows[0]["Line1_RetroKit"]);
                if (Line1_RetroKit == "Y")
                {
                    Chk_Line1_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line1_RetroKit.Checked = false;
                }

                string Line2_RetroKit = Convert.ToString(dt.Rows[0]["Line2_RetroKit"]);
                if (Line2_RetroKit == "Y")
                {
                    Chk_Line2_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line2_RetroKit.Checked = false;
                }

                string Line3_RetroKit = Convert.ToString(dt.Rows[0]["Line3_RetroKit"]);
                if (Line3_RetroKit == "Y")
                {
                    Chk_Line3_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line3_RetroKit.Checked = false;
                }

                string Line4_RetroKit = Convert.ToString(dt.Rows[0]["Line4_RetroKit"]);
                if (Line4_RetroKit == "Y")
                {
                    Chk_Line4_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line4_RetroKit.Checked = false;
                }

                string Line5_RetroKit = Convert.ToString(dt.Rows[0]["Line5_RetroKit"]);
                if (Line5_RetroKit == "Y")
                {
                    Chk_Line5_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line5_RetroKit.Checked = false;
                }

                string Line6_RetroKit = Convert.ToString(dt.Rows[0]["Line6_RetroKit"]);
                if (Line6_RetroKit == "Y")
                {
                    Chk_Line6_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line6_RetroKit.Checked = false;
                }

                string Line7_RetroKit = Convert.ToString(dt.Rows[0]["Line7_RetroKit"]);
                if (Line7_RetroKit == "Y")
                {
                    Chk_Line7_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line7_RetroKit.Checked = false;
                }

                string Line8_RetroKit = Convert.ToString(dt.Rows[0]["Line8_RetroKit"]);
                if (Line8_RetroKit == "Y")
                {
                    Chk_Line8_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line8_RetroKit.Checked = false;
                }

                string Line9_RetroKit = Convert.ToString(dt.Rows[0]["Line9_RetroKit"]);
                if (Line9_RetroKit == "Y")
                {
                    Chk_Line9_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line9_RetroKit.Checked = false;
                }

                string Line10_RetroKit = Convert.ToString(dt.Rows[0]["Line10_RetroKit"]);
                if (Line10_RetroKit == "Y")
                {
                    Chk_Line10_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line10_RetroKit.Checked = false;
                }

                string Line11_RetroKit = Convert.ToString(dt.Rows[0]["Line11_RetroKit"]);
                if (Line11_RetroKit == "Y")
                {
                    Chk_Line11_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line11_RetroKit.Checked = false;
                }

                string Line12_RetroKit = Convert.ToString(dt.Rows[0]["Line12_RetroKit"]);
                if (Line12_RetroKit == "Y")
                {
                    Chk_Line12_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line12_RetroKit.Checked = false;
                }

                string Line13_RetroKit = Convert.ToString(dt.Rows[0]["Line13_RetroKit"]);
                if (Line13_RetroKit == "Y")
                {
                    Chk_Line13_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line13_RetroKit.Checked = false;
                }

                string Line14_RetroKit = Convert.ToString(dt.Rows[0]["Line14_RetroKit"]);
                if (Line14_RetroKit == "Y")
                {
                    Chk_Line14_RetroKit.Checked = true;
                }
                else
                {
                    Chk_Line14_RetroKit.Checked = false;
                }



                ///////////////////////////////////////////////////////////////////////////////////////////////////

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

                /////////////////////////////////////////////////////////////////////////////////////////
                string Line5_68Standard = Convert.ToString(dt.Rows[0]["Line5_68Standard"]);
                if (Line5_68Standard == "Y")
                {
                    Chk_Line5_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line5_68Standard.Checked = false;
                }


                string Line5_913Standard = Convert.ToString(dt.Rows[0]["Line5_913Standard"]);
                if (Line5_913Standard == "Y")
                {
                    Chk_Line5_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line5_913Standard.Checked = false;
                }


                string Line5_23Globe = Convert.ToString(dt.Rows[0]["Line5_23Globe"]);
                if (Line5_23Globe == "Y")
                {
                    Chk_Line5_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line5_23Globe.Checked = false;
                }


                string Line5_35MedBase = Convert.ToString(dt.Rows[0]["Line5_35Torpedo"]);
                if (Line5_35MedBase == "Y")
                {
                    Chk_Line5_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line5_35MedBase.Checked = false;
                }


                string Line5_Candelabra = Convert.ToString(dt.Rows[0]["Line5_37Candelabra"]);
                if (Line5_Candelabra == "Y")
                {
                    Chk_Line5_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line5_Candelabra.Checked = false;
                }


                string Line5_8Flood = Convert.ToString(dt.Rows[0]["Line5_8Flood"]);
                if (Line5_8Flood == "Y")
                {
                    Chk_Line5_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line5_8Flood.Checked = false;
                }


                string Line5_13Flood = Convert.ToString(dt.Rows[0]["Line5_13Flood"]);
                if (Line5_13Flood == "Y")
                {
                    Chk_Line5_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line5_13Flood.Checked = false;
                }


                string Line5_17Flood = Convert.ToString(dt.Rows[0]["Line5_17Flood"]);
                if (Line5_17Flood == "Y")
                {
                    Chk_Line5_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line5_17Flood.Checked = false;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line6_68Standard = Convert.ToString(dt.Rows[0]["Line6_68Standard"]);
                if (Line6_68Standard == "Y")
                {
                    Chk_Line6_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line6_68Standard.Checked = false;
                }


                string Line6_913Standard = Convert.ToString(dt.Rows[0]["Line6_913Standard"]);
                if (Line6_913Standard == "Y")
                {
                    Chk_Line6_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line6_913Standard.Checked = false;
                }


                string Line6_23Globe = Convert.ToString(dt.Rows[0]["Line6_23Globe"]);
                if (Line6_23Globe == "Y")
                {
                    Chk_Line6_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line6_23Globe.Checked = false;
                }


                string Line6_35MedBase = Convert.ToString(dt.Rows[0]["Line6_35Torpedo"]);
                if (Line6_35MedBase == "Y")
                {
                    Chk_Line6_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line6_35MedBase.Checked = false;
                }


                string Line6_Candelabra = Convert.ToString(dt.Rows[0]["Line6_37Candelabra"]);
                if (Line6_Candelabra == "Y")
                {
                    Chk_Line6_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line6_Candelabra.Checked = false;
                }


                string Line6_8Flood = Convert.ToString(dt.Rows[0]["Line6_8Flood"]);
                if (Line6_8Flood == "Y")
                {
                    Chk_Line6_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line6_8Flood.Checked = false;
                }


                string Line6_13Flood = Convert.ToString(dt.Rows[0]["Line6_13Flood"]);
                if (Line6_13Flood == "Y")
                {
                    Chk_Line6_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line6_13Flood.Checked = false;
                }


                string Line6_17Flood = Convert.ToString(dt.Rows[0]["Line6_17Flood"]);
                if (Line6_17Flood == "Y")
                {
                    Chk_Line6_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line6_17Flood.Checked = false;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line7_68Standard = Convert.ToString(dt.Rows[0]["Line7_68Standard"]);
                if (Line7_68Standard == "Y")
                {
                    Chk_Line7_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line7_68Standard.Checked = false;
                }


                string Line7_913Standard = Convert.ToString(dt.Rows[0]["Line7_913Standard"]);
                if (Line7_913Standard == "Y")
                {
                    Chk_Line7_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line7_913Standard.Checked = false;
                }


                string Line7_23Globe = Convert.ToString(dt.Rows[0]["Line7_23Globe"]);
                if (Line7_23Globe == "Y")
                {
                    Chk_Line7_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line7_23Globe.Checked = false;
                }


                string Line7_35MedBase = Convert.ToString(dt.Rows[0]["Line7_35Torpedo"]);
                if (Line7_35MedBase == "Y")
                {
                    Chk_Line7_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line7_35MedBase.Checked = false;
                }


                string Line7_Candelabra = Convert.ToString(dt.Rows[0]["Line7_37Candelabra"]);
                if (Line7_Candelabra == "Y")
                {
                    Chk_Line7_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line7_Candelabra.Checked = false;
                }


                string Line7_8Flood = Convert.ToString(dt.Rows[0]["Line7_8Flood"]);
                if (Line7_8Flood == "Y")
                {
                    Chk_Line7_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line7_8Flood.Checked = false;
                }


                string Line7_13Flood = Convert.ToString(dt.Rows[0]["Line7_13Flood"]);
                if (Line7_13Flood == "Y")
                {
                    Chk_Line7_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line7_13Flood.Checked = false;
                }


                string Line7_17Flood = Convert.ToString(dt.Rows[0]["Line7_17Flood"]);
                if (Line7_17Flood == "Y")
                {
                    Chk_Line7_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line7_17Flood.Checked = false;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line8_68Standard = Convert.ToString(dt.Rows[0]["Line8_68Standard"]);
                if (Line8_68Standard == "Y")
                {
                    Chk_Line8_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line8_68Standard.Checked = false;
                }


                string Line8_913Standard = Convert.ToString(dt.Rows[0]["Line8_913Standard"]);
                if (Line8_913Standard == "Y")
                {
                    Chk_Line8_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line8_913Standard.Checked = false;
                }


                string Line8_23Globe = Convert.ToString(dt.Rows[0]["Line8_23Globe"]);
                if (Line8_23Globe == "Y")
                {
                    Chk_Line8_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line8_23Globe.Checked = false;
                }


                string Line8_35MedBase = Convert.ToString(dt.Rows[0]["Line8_35Torpedo"]);
                if (Line8_35MedBase == "Y")
                {
                    Chk_Line8_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line8_35MedBase.Checked = false;
                }


                string Line8_Candelabra = Convert.ToString(dt.Rows[0]["Line8_37Candelabra"]);
                if (Line8_Candelabra == "Y")
                {
                    Chk_Line8_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line8_Candelabra.Checked = false;
                }


                string Line8_8Flood = Convert.ToString(dt.Rows[0]["Line8_8Flood"]);
                if (Line8_8Flood == "Y")
                {
                    Chk_Line8_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line8_8Flood.Checked = false;
                }


                string Line8_13Flood = Convert.ToString(dt.Rows[0]["Line8_13Flood"]); ;
                if (Line8_13Flood == "Y")
                {
                    Chk_Line8_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line8_13Flood.Checked = false;
                }


                string Line8_17Flood = Convert.ToString(dt.Rows[0]["Line8_17Flood"]); ;
                if (Line8_17Flood == "Y")
                {
                    Chk_Line8_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line8_17Flood.Checked = false;
                }
                ///////////////////////////////////////////////////////////////////////////////////////////////////////
                string Line9_68Standard = Convert.ToString(dt.Rows[0]["Line9_68Standard"]);
                if (Line9_68Standard == "Y")
                {
                    Chk_Line9_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line9_68Standard.Checked = false;
                }


                string Line9_913Standard = Convert.ToString(dt.Rows[0]["Line9_913Standard"]);
                if (Line9_913Standard == "Y")
                {
                    Chk_Line9_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line9_913Standard.Checked = false;
                }


                string Line9_23Globe = Convert.ToString(dt.Rows[0]["Line9_23Globe"]);
                if (Line9_23Globe == "Y")
                {
                    Chk_Line9_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line9_23Globe.Checked = false;
                }


                string Line9_35MedBase = Convert.ToString(dt.Rows[0]["Line9_35Torpedo"]);
                if (Line9_35MedBase == "Y")
                {
                    Chk_Line9_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line9_35MedBase.Checked = false;
                }


                string Line9_Candelabra = Convert.ToString(dt.Rows[0]["Line9_37Candelabra"]);
                if (Line9_Candelabra == "Y")
                {
                    Chk_Line9_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line9_Candelabra.Checked = false;
                }


                string Line9_8Flood = Convert.ToString(dt.Rows[0]["Line9_8Flood"]);
                if (Line9_8Flood == "Y")
                {
                    Chk_Line9_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line9_8Flood.Checked = false;
                }


                string Line9_13Flood = Convert.ToString(dt.Rows[0]["Line9_13Flood"]);
                if (Line9_13Flood == "Y")
                {
                    Chk_Line9_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line9_13Flood.Checked = false;
                }


                string Line9_17Flood = Convert.ToString(dt.Rows[0]["Line9_17Flood"]);
                if (Line9_17Flood == "Y")
                {
                    Chk_Line9_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line9_17Flood.Checked = false;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line10_68Standard = Convert.ToString(dt.Rows[0]["Line10_68Standard"]);
                if (Line10_68Standard == "Y")
                {
                    Chk_Line10_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line10_68Standard.Checked = false;
                }


                string Line10_913Standard = Convert.ToString(dt.Rows[0]["Line10_913Standard"]);
                if (Line10_913Standard == "Y")
                {
                    Chk_Line10_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line10_913Standard.Checked = false;
                }


                string Line10_23Globe = Convert.ToString(dt.Rows[0]["Line10_23Globe"]);
                if (Line10_23Globe == "Y")
                {
                    Chk_Line10_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line10_23Globe.Checked = false;
                }


                string Line10_35MedBase = Convert.ToString(dt.Rows[0]["Line10_35Torpedo"]);
                if (Line10_35MedBase == "Y")
                {
                    Chk_Line10_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line10_35MedBase.Checked = false;
                }


                string Line10_Candelabra = Convert.ToString(dt.Rows[0]["Line10_37Candelabra"]);
                if (Line10_Candelabra == "Y")
                {
                    Chk_Line10_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line10_Candelabra.Checked = false;
                }


                string Line10_8Flood = Convert.ToString(dt.Rows[0]["Line10_8Flood"]);
                if (Line10_8Flood == "Y")
                {
                    Chk_Line10_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line10_8Flood.Checked = false;
                }


                string Line10_13Flood = Convert.ToString(dt.Rows[0]["Line10_13Flood"]);
                if (Line10_13Flood == "Y")
                {
                    Chk_Line10_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line10_13Flood.Checked = false;
                }


                string Line10_17Flood = Convert.ToString(dt.Rows[0]["Line10_17Flood"]);
                if (Line10_17Flood == "Y")
                {
                    Chk_Line10_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line10_17Flood.Checked = false;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line11_68Standard = Convert.ToString(dt.Rows[0]["Line11_68Standard"]);
                if (Line11_68Standard == "Y")
                {
                    Chk_Line11_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line11_68Standard.Checked = false;
                }


                string Line11_913Standard = Convert.ToString(dt.Rows[0]["Line11_913Standard"]);
                if (Line11_913Standard == "Y")
                {
                    Chk_Line11_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line11_913Standard.Checked = false;
                }


                string Line11_23Globe = Convert.ToString(dt.Rows[0]["Line11_23Globe"]);
                if (Line11_23Globe == "Y")
                {
                    Chk_Line11_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line11_23Globe.Checked = false;
                }


                string Line11_35MedBase = Convert.ToString(dt.Rows[0]["Line11_35Torpedo"]);
                if (Line11_35MedBase == "Y")
                {
                    Chk_Line11_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line11_35MedBase.Checked = false;
                }


                string Line11_Candelabra = Convert.ToString(dt.Rows[0]["Line11_37Candelabra"]);
                if (Line11_Candelabra == "Y")
                {
                    Chk_Line11_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line11_Candelabra.Checked = false;
                }


                string Line11_8Flood = Convert.ToString(dt.Rows[0]["Line11_8Flood"]);
                if (Line11_8Flood == "Y")
                {
                    Chk_Line11_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line11_8Flood.Checked = false;
                }


                string Line11_13Flood = Convert.ToString(dt.Rows[0]["Line11_13Flood"]);
                if (Line11_13Flood == "Y")
                {
                    Chk_Line11_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line11_13Flood.Checked = false;
                }


                string Line11_17Flood = Convert.ToString(dt.Rows[0]["Line11_17Flood"]);
                if (Line11_17Flood == "Y")
                {
                    Chk_Line11_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line11_17Flood.Checked = false;
                }

                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line12_68Standard = Convert.ToString(dt.Rows[0]["Line12_68Standard"]);
                if (Line12_68Standard == "Y")
                {
                    Chk_Line12_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line12_68Standard.Checked = false;
                }


                string Line12_913Standard = Convert.ToString(dt.Rows[0]["Line12_913Standard"]);
                if (Line12_913Standard == "Y")
                {
                    Chk_Line12_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line12_913Standard.Checked = false;
                }


                string Line12_23Globe = Convert.ToString(dt.Rows[0]["Line12_23Globe"]);
                if (Line12_23Globe == "Y")
                {
                    Chk_Line12_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line12_23Globe.Checked = false;
                }


                string Line12_35MedBase = Convert.ToString(dt.Rows[0]["Line12_35Torpedo"]);
                if (Line12_35MedBase == "Y")
                {
                    Chk_Line12_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line12_35MedBase.Checked = false;
                }


                string Line12_Candelabra = Convert.ToString(dt.Rows[0]["Line12_37Candelabra"]);
                if (Line12_Candelabra == "Y")
                {
                    Chk_Line12_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line12_Candelabra.Checked = false;
                }


                string Line12_8Flood = Convert.ToString(dt.Rows[0]["Line12_8Flood"]);
                if (Line12_8Flood == "Y")
                {
                    Chk_Line12_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line12_8Flood.Checked = false;
                }


                string Line12_13Flood = Convert.ToString(dt.Rows[0]["Line12_13Flood"]); ;
                if (Line12_13Flood == "Y")
                {
                    Chk_Line12_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line12_13Flood.Checked = false;
                }


                string Line12_17Flood = Convert.ToString(dt.Rows[0]["Line12_17Flood"]); ;
                if (Line12_17Flood == "Y")
                {
                    Chk_Line12_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line12_17Flood.Checked = false;
                }
                //////////////////////////////////////////////////////////////////////

                string Line13_68Standard = Convert.ToString(dt.Rows[0]["Line13_68Standard"]);
                if (Line13_68Standard == "Y")
                {
                    Chk_Line13_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line13_68Standard.Checked = false;
                }


                string Line13_913Standard = Convert.ToString(dt.Rows[0]["Line13_913Standard"]);
                if (Line13_913Standard == "Y")
                {
                    Chk_Line13_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line13_913Standard.Checked = false;
                }


                string Line13_23Globe = Convert.ToString(dt.Rows[0]["Line13_23Globe"]);
                if (Line13_23Globe == "Y")
                {
                    Chk_Line13_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line13_23Globe.Checked = false;
                }


                string Line13_35MedBase = Convert.ToString(dt.Rows[0]["Line13_35Torpedo"]);
                if (Line13_35MedBase == "Y")
                {
                    Chk_Line13_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line13_35MedBase.Checked = false;
                }


                string Line13_Candelabra = Convert.ToString(dt.Rows[0]["Line13_37Candelabra"]);
                if (Line13_Candelabra == "Y")
                {
                    Chk_Line13_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line13_Candelabra.Checked = false;
                }


                string Line13_8Flood = Convert.ToString(dt.Rows[0]["Line13_8Flood"]);
                if (Line13_8Flood == "Y")
                {
                    Chk_Line13_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line13_8Flood.Checked = false;
                }


                string Line13_13Flood = Convert.ToString(dt.Rows[0]["Line13_13Flood"]);
                if (Line13_13Flood == "Y")
                {
                    Chk_Line13_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line13_13Flood.Checked = false;
                }


                string Line13_17Flood = Convert.ToString(dt.Rows[0]["Line13_17Flood"]);
                if (Line13_17Flood == "Y")
                {
                    Chk_Line13_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line13_17Flood.Checked = false;
                }


                ////////////////////////////////////////////////////////////////////////////////////////////

                string Line14_68Standard = Convert.ToString(dt.Rows[0]["Line14_68Standard"]);
                if (Line14_68Standard == "Y")
                {
                    Chk_Line14_68Standard.Checked = true;
                }
                else
                {
                    Chk_Line14_68Standard.Checked = false;
                }


                string Line14_913Standard = Convert.ToString(dt.Rows[0]["Line14_913Standard"]);
                if (Line14_913Standard == "Y")
                {
                    Chk_Line14_913Standard.Checked = true;
                }
                else
                {
                    Chk_Line14_913Standard.Checked = false;
                }


                string Line14_23Globe = Convert.ToString(dt.Rows[0]["Line14_23Globe"]);
                if (Line14_23Globe == "Y")
                {
                    Chk_Line14_23Globe.Checked = true;
                }
                else
                {
                    Chk_Line14_23Globe.Checked = false;
                }


                string Line14_35MedBase = Convert.ToString(dt.Rows[0]["Line14_35Torpedo"]);
                if (Line14_35MedBase == "Y")
                {
                    Chk_Line14_35MedBase.Checked = true;
                }
                else
                {
                    Chk_Line14_35MedBase.Checked = false;
                }


                string Line14_Candelabra = Convert.ToString(dt.Rows[0]["Line14_37Candelabra"]);
                if (Line14_Candelabra == "Y")
                {
                    Chk_Line14_Candelabra.Checked = true;
                }
                else
                {
                    Chk_Line14_Candelabra.Checked = false;
                }


                string Line14_8Flood = Convert.ToString(dt.Rows[0]["Line14_8Flood"]);
                if (Line14_8Flood == "Y")
                {
                    Chk_Line14_8Flood.Checked = true;
                }
                else
                {
                    Chk_Line14_8Flood.Checked = false;
                }


                string Line14_13Flood = Convert.ToString(dt.Rows[0]["Line14_13Flood"]);
                if (Line14_13Flood == "Y")
                {
                    Chk_Line14_13Flood.Checked = true;
                }
                else
                {
                    Chk_Line14_13Flood.Checked = false;
                }


                string Line14_17Flood = Convert.ToString(dt.Rows[0]["Line14_17Flood"]);
                if (Line14_17Flood == "Y")
                {
                    Chk_Line14_17Flood.Checked = true;
                }
                else
                {
                    Chk_Line14_17Flood.Checked = false;
                }


                /////////////////////////////////////////////////////////////////////////////////////

                DataTable dt2 = obj_MetedAudit.GetMETEDAudit_3(JobNum);
                if (dt.Rows.Count > 0)
                {





                    txt_LedNightLight.Text = Convert.ToString(dt.Rows[0]["LEDNightLights"]);
                    txt_LedNightLight_Location1.Text = Convert.ToString(dt.Rows[0]["Line1LEDNightLightLocation"]);
                    txt_LedNightLight_Location2.Text = Convert.ToString(dt.Rows[0]["Line2LEDNightLightLocation"]);
                    txt_LedNightLight_Location3.Text = Convert.ToString(dt.Rows[0]["Line3LEDNightLightLocation"]);
                    txt_LedNightLight_Location4.Text = Convert.ToString(dt.Rows[0]["Line4LEDNightLightLocation"]);
                    txt_SmartPowerStrip.Text = Convert.ToString(dt.Rows[0]["SmartPowerStrip"]);
                    txt_SmartPower_Location1.Text = Convert.ToString(dt.Rows[0]["Line1SmartPowerStripLocation"]);
                    txt_SmartPower_Location2.Text = Convert.ToString(dt.Rows[0]["Line2SmartPowerStripLocation"]);
                    txt_SmartPower_Location3.Text = Convert.ToString(dt.Rows[0]["Line3SmartPowerStripLocation"]);
                    txt_SmartPower_Location4.Text = Convert.ToString(dt.Rows[0]["Line4SmartPowerStripLocation"]);


                    string Line1SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line1SmartPowerStrip6Outlet"]);
                    if (Line1SmartPowerStrip6Outlet == "Y")
                    {
                        rdo_Line1_6_9_Outlet.Checked = true;
                    }
                    else
                    {
                        rdo_Line1_6_9_Outlet.Checked = false;
                    }



                    string Line2SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line2SmartPowerStrip6Outlet"]);
                    if (Line2SmartPowerStrip6Outlet == "Y")
                    {
                        rdo_Line2_6_9_Outlet.Checked = true;
                    }
                    else
                    {
                        rdo_Line2_6_9_Outlet.Checked = false;
                    }



                    string Line3SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line3SmartPowerStrip6Outlet"]);
                    if (Line3SmartPowerStrip6Outlet == "Y")
                    {
                        rdo_Line3_6_9_Outlet.Checked = true;
                    }
                    else
                    {
                        rdo_Line3_6_9_Outlet.Checked = false;
                    }

                    string Line4SmartPowerStrip6Outlet = Convert.ToString(dt.Rows[0]["Line4SmartPowerStrip6Outlet"]);
                    if (Line4SmartPowerStrip6Outlet == "Y")
                    {
                        rdo_Line4_6_9_Outlet.Checked = true;
                    }
                    else
                    {
                        rdo_Line4_6_9_Outlet.Checked = false;
                    }


                    string Line1SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line1SmartPowerStrip10Outlet"]);
                    if (Line1SmartPowerStrip10Outlet == "Y")
                    {
                        rdo_Line1_10_Outlet.Checked = true;
                    }
                    else
                    {
                        rdo_Line1_10_Outlet.Checked = false;
                    }


                    string Line2SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line2SmartPowerStrip10Outlet"]);
                    if (Line2SmartPowerStrip10Outlet == "Y")
                    {
                        rdo_Line2_10_Outlet.Checked = true;
                    }
                    else
                    {
                        rdo_Line2_10_Outlet.Checked = false;
                    }


                    string Line3SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line3SmartPowerStrip10Outlet"]);
                    if (Line3SmartPowerStrip10Outlet == "Y")
                    {
                        rdo_Line3_10_Outlet.Checked = true;
                    }
                    else
                    {
                        rdo_Line3_10_Outlet.Checked = false;
                    }



                    string Line4SmartPowerStrip10Outlet = Convert.ToString(dt.Rows[0]["Line4SmartPowerStrip10Outlet"]);
                    if (Line4SmartPowerStrip10Outlet == "Y")
                    {
                        rdo_Line4_10_Outlet.Checked = true;
                    }
                    else
                    {
                        rdo_Line4_10_Outlet.Checked = false;
                    }


                    string InstalledFurnaceFilter = Convert.ToString(dt.Rows[0]["InstalledFurnaceFilter"]);
                    if (InstalledFurnaceFilter == "Y")
                    {
                        rdo_FilterWhistle_Yes.Checked = true;
                    }
                    else if (InstalledFurnaceFilter == "N")
                    {
                        rdo_FilterWhistle_No.Checked = true;
                    }


                    txt_ExistingAlarms.Text = Convert.ToString(dt.Rows[0]["COAlarms5YearOld"]);
                    txt_NewAlarms.Text = Convert.ToString(dt.Rows[0]["TotalNEWAlarmsInstalled"]);
                    txt_COAlarms_Location1.Text = Convert.ToString(dt.Rows[0]["Line1COAlarmLocation"]);
                    txt_COAlarms_Location2.Text = Convert.ToString(dt.Rows[0]["Line2COAlarmLocation"]);
                    txt_COAlarms_Location3.Text = Convert.ToString(dt.Rows[0]["Line3COAlarmLocation"]);
                    txt_COAlarms_Location4.Text = Convert.ToString(dt.Rows[0]["Line4COAlarmLocation"]);
                    txt_COAlarms_Location5.Text = Convert.ToString(dt.Rows[0]["Line5COAlarmLocation"]);





                }






            }

        }
        catch
        {
        }

        

    }








    protected void btn_cancel_Click(object sender, EventArgs e)
    {

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int i = 0;
            int j = 0;



            //////////////////////////////////////////////////////////////////////////////////////////////



            string Line1_RetroKit = "";
            if (Chk_Line1_RetroKit.Checked == true)
            {
                Line1_RetroKit = "Y";
            }
            else
            {
                Line1_RetroKit = "";
            }

            string Line2_RetroKit = "";
            if (Chk_Line2_RetroKit.Checked == true)
            {
                Line2_RetroKit = "Y";
            }
            else
            {
                Line2_RetroKit = "";
            }

            string Line3_RetroKit = "";
            if (Chk_Line3_RetroKit.Checked == true)
            {
                Line3_RetroKit = "Y";
            }
            else
            {
                Line3_RetroKit = "";
            }

            string Line4_RetroKit = "";
            if (Chk_Line4_RetroKit.Checked == true)
            {
                Line4_RetroKit = "Y";
            }
            else
            {
                Line4_RetroKit = "";
            }

            string Line5_RetroKit = "";
            if (Chk_Line5_RetroKit.Checked == true)
            {
                Line5_RetroKit = "Y";
            }
            else
            {
                Line5_RetroKit = "";
            }

            string Line6_RetroKit = "";
            if (Chk_Line6_RetroKit.Checked == true)
            {
                Line6_RetroKit = "Y";
            }
            else
            {
                Line6_RetroKit = "";
            }

            string Line7_RetroKit = "";
            if (Chk_Line7_RetroKit.Checked == true)
            {
                Line7_RetroKit = "Y";
            }
            else
            {
                Line7_RetroKit = "";
            }

            string Line8_RetroKit = "";
            if (Chk_Line8_RetroKit.Checked == true)
            {
                Line8_RetroKit = "Y";
            }
            else
            {
                Line8_RetroKit = "";
            }

            string Line9_RetroKit = "";
            if (Chk_Line9_RetroKit.Checked == true)
            {
                Line9_RetroKit = "Y";
            }
            else
            {
                Line9_RetroKit = "";
            }

            string Line10_RetroKit = "";
            if (Chk_Line10_RetroKit.Checked == true)
            {
                Line10_RetroKit = "Y";
            }
            else
            {
                Line10_RetroKit = "";
            }

            string Line11_RetroKit = "";
            if (Chk_Line11_RetroKit.Checked == true)
            {
                Line11_RetroKit = "Y";
            }
            else
            {
                Line11_RetroKit = "";
            }

            string Line12_RetroKit = "";
            if (Chk_Line12_RetroKit.Checked == true)
            {
                Line12_RetroKit = "Y";
            }
            else
            {
                Line12_RetroKit = "";
            }

            string Line13_RetroKit = "";
            if (Chk_Line13_RetroKit.Checked == true)
            {
                Line13_RetroKit = "Y";
            }
            else
            {
                Line13_RetroKit = "";
            }

            string Line14_RetroKit = "";
            if (Chk_Line14_RetroKit.Checked == true)
            {
                Line14_RetroKit = "Y";
            }
            else
            {
                Line14_RetroKit = "";
            }




            //////////////////////////////////////////////////////////////////////////////////////////////
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

            ///////////////////////////////////////////////////////////////////////////////////////////








            string Line5_68Standard = "";
            if (Chk_Line5_68Standard.Checked == true)
            {
                Line5_68Standard = "Y";
            }
            else
            {
                Line5_68Standard = "";
            }


            string Line5_913Standard = "";
            if (Chk_Line5_913Standard.Checked == true)
            {
                Line5_913Standard = "Y";
            }
            else
            {
                Line5_913Standard = "";
            }


            string Line5_23Globe = "";
            if (Chk_Line5_23Globe.Checked == true)
            {
                Line5_23Globe = "Y";
            }
            else
            {
                Line5_23Globe = "";
            }


            string Line5_35MedBase = "";
            if (Chk_Line5_35MedBase.Checked == true)
            {
                Line5_35MedBase = "Y";
            }
            else
            {
                Line5_35MedBase = "";
            }


            string Line5_Candelabra = "";
            if (Chk_Line5_Candelabra.Checked == true)
            {
                Line5_Candelabra = "Y";
            }
            else
            {
                Line5_Candelabra = "";
            }


            string Line5_8Flood = "";
            if (Chk_Line5_8Flood.Checked == true)
            {
                Line5_8Flood = "Y";
            }
            else
            {
                Line5_8Flood = "";
            }


            string Line5_13Flood = "";
            if (Chk_Line5_13Flood.Checked == true)
            {
                Line5_13Flood = "Y";
            }
            else
            {
                Line5_13Flood = "";
            }


            string Line5_17Flood = "";
            if (Chk_Line5_17Flood.Checked == true)
            {
                Line5_17Flood = "Y";
            }
            else
            {
                Line5_17Flood = "";
            }
            ////////////////////////////////////////////////////////////////////////
            string Line6_68Standard = "";
            if (Chk_Line6_68Standard.Checked == true)
            {
                Line6_68Standard = "Y";
            }
            else
            {
                Line6_68Standard = "";
            }


            string Line6_913Standard = "";
            if (Chk_Line6_913Standard.Checked == true)
            {
                Line6_913Standard = "Y";
            }
            else
            {
                Line6_913Standard = "";
            }


            string Line6_23Globe = "";
            if (Chk_Line6_23Globe.Checked == true)
            {
                Line6_23Globe = "Y";
            }
            else
            {
                Line6_23Globe = "";
            }


            string Line6_35MedBase = "";
            if (Chk_Line6_35MedBase.Checked == true)
            {
                Line6_35MedBase = "Y";
            }
            else
            {
                Line6_35MedBase = "";
            }


            string Line6_Candelabra = "";
            if (Chk_Line6_Candelabra.Checked == true)
            {
                Line6_Candelabra = "Y";
            }
            else
            {
                Line6_Candelabra = "";
            }


            string Line6_8Flood = "";
            if (Chk_Line6_8Flood.Checked == true)
            {
                Line6_8Flood = "Y";
            }
            else
            {
                Line6_8Flood = "";
            }


            string Line6_13Flood = "";
            if (Chk_Line6_13Flood.Checked == true)
            {
                Line6_13Flood = "Y";
            }
            else
            {
                Line6_13Flood = "";
            }


            string Line6_17Flood = "";
            if (Chk_Line6_17Flood.Checked == true)
            {
                Line6_17Flood = "Y";
            }
            else
            {
                Line6_17Flood = "";
            }

            //////////////////////////////////////////////////////////////////////
            string Line7_68Standard = "";
            if (Chk_Line7_68Standard.Checked == true)
            {
                Line7_68Standard = "Y";
            }
            else
            {
                Line7_68Standard = "";
            }


            string Line7_913Standard = "";
            if (Chk_Line7_913Standard.Checked == true)
            {
                Line7_913Standard = "Y";
            }
            else
            {
                Line7_913Standard = "";
            }


            string Line7_23Globe = "";
            if (Chk_Line7_23Globe.Checked == true)
            {
                Line7_23Globe = "Y";
            }
            else
            {
                Line7_23Globe = "";
            }


            string Line7_35MedBase = "";
            if (Chk_Line7_35MedBase.Checked == true)
            {
                Line7_35MedBase = "Y";
            }
            else
            {
                Line7_35MedBase = "";
            }


            string Line7_Candelabra = "";
            if (Chk_Line7_Candelabra.Checked == true)
            {
                Line7_Candelabra = "Y";
            }
            else
            {
                Line7_Candelabra = "";
            }


            string Line7_8Flood = "";
            if (Chk_Line7_8Flood.Checked == true)
            {
                Line7_8Flood = "Y";
            }
            else
            {
                Line7_8Flood = "";
            }


            string Line7_13Flood = "";
            if (Chk_Line7_13Flood.Checked == true)
            {
                Line7_13Flood = "Y";
            }
            else
            {
                Line7_13Flood = "";
            }


            string Line7_17Flood = "";
            if (Chk_Line7_17Flood.Checked == true)
            {
                Line7_17Flood = "Y";
            }
            else
            {
                Line7_17Flood = "";
            }
            ////////////////////////////////////////////////////////////////////////
            string Line8_68Standard = "";
            if (Chk_Line8_68Standard.Checked == true)
            {
                Line8_68Standard = "Y";
            }
            else
            {
                Line8_68Standard = "";
            }


            string Line8_913Standard = "";
            if (Chk_Line8_913Standard.Checked == true)
            {
                Line8_913Standard = "Y";
            }
            else
            {
                Line8_913Standard = "";
            }


            string Line8_23Globe = "";
            if (Chk_Line8_23Globe.Checked == true)
            {
                Line8_23Globe = "Y";
            }
            else
            {
                Line8_23Globe = "";
            }


            string Line8_35MedBase = "";
            if (Chk_Line8_35MedBase.Checked == true)
            {
                Line8_35MedBase = "Y";
            }
            else
            {
                Line8_35MedBase = "";
            }


            string Line8_Candelabra = "";
            if (Chk_Line8_Candelabra.Checked == true)
            {
                Line8_Candelabra = "Y";
            }
            else
            {
                Line8_Candelabra = "";
            }


            string Line8_8Flood = "";
            if (Chk_Line8_8Flood.Checked == true)
            {
                Line8_8Flood = "Y";
            }
            else
            {
                Line8_8Flood = "";
            }


            string Line8_13Flood = "";
            if (Chk_Line8_13Flood.Checked == true)
            {
                Line8_13Flood = "Y";
            }
            else
            {
                Line8_13Flood = "";
            }


            string Line8_17Flood = "";
            if (Chk_Line8_17Flood.Checked == true)
            {
                Line8_17Flood = "Y";
            }
            else
            {
                Line8_17Flood = "";
            }
            //////////////////////////////////////////////////////////////////////////
            string Line9_68Standard = "";
            if (Chk_Line9_68Standard.Checked == true)
            {
                Line9_68Standard = "Y";
            }
            else
            {
                Line9_68Standard = "";
            }


            string Line9_913Standard = "";
            if (Chk_Line9_913Standard.Checked == true)
            {
                Line9_913Standard = "Y";
            }
            else
            {
                Line9_913Standard = "";
            }


            string Line9_23Globe = "";
            if (Chk_Line9_23Globe.Checked == true)
            {
                Line9_23Globe = "Y";
            }
            else
            {
                Line9_23Globe = "";
            }


            string Line9_35MedBase = "";
            if (Chk_Line9_35MedBase.Checked == true)
            {
                Line9_35MedBase = "Y";
            }
            else
            {
                Line9_35MedBase = "";
            }


            string Line9_Candelabra = "";
            if (Chk_Line9_Candelabra.Checked == true)
            {
                Line9_Candelabra = "Y";
            }
            else
            {
                Line9_Candelabra = "";
            }


            string Line9_8Flood = "";
            if (Chk_Line9_8Flood.Checked == true)
            {
                Line9_8Flood = "Y";
            }
            else
            {
                Line9_8Flood = "";
            }


            string Line9_13Flood = "";
            if (Chk_Line9_13Flood.Checked == true)
            {
                Line9_13Flood = "Y";
            }
            else
            {
                Line9_13Flood = "";
            }


            string Line9_17Flood = "";
            if (Chk_Line9_17Flood.Checked == true)
            {
                Line9_17Flood = "Y";
            }
            else
            {
                Line9_17Flood = "";
            }
            ///////////////////////////////////////////////////////////////////////////
            string Line10_68Standard = "";
            if (Chk_Line10_68Standard.Checked == true)
            {
                Line10_68Standard = "Y";
            }
            else
            {
                Line10_68Standard = "";
            }


            string Line10_913Standard = "";
            if (Chk_Line10_913Standard.Checked == true)
            {
                Line10_913Standard = "Y";
            }
            else
            {
                Line10_913Standard = "";
            }


            string Line10_23Globe = "";
            if (Chk_Line10_23Globe.Checked == true)
            {
                Line10_23Globe = "Y";
            }
            else
            {
                Line10_23Globe = "";
            }


            string Line10_35MedBase = "";
            if (Chk_Line10_35MedBase.Checked == true)
            {
                Line10_35MedBase = "Y";
            }
            else
            {
                Line10_35MedBase = "";
            }


            string Line10_Candelabra = "";
            if (Chk_Line10_Candelabra.Checked == true)
            {
                Line10_Candelabra = "Y";
            }
            else
            {
                Line10_Candelabra = "";
            }


            string Line10_8Flood = "";
            if (Chk_Line10_8Flood.Checked == true)
            {
                Line10_8Flood = "Y";
            }
            else
            {
                Line10_8Flood = "";
            }


            string Line10_13Flood = "";
            if (Chk_Line10_13Flood.Checked == true)
            {
                Line10_13Flood = "Y";
            }
            else
            {
                Line10_13Flood = "";
            }


            string Line10_17Flood = "";
            if (Chk_Line10_17Flood.Checked == true)
            {
                Line10_17Flood = "Y";
            }
            else
            {
                Line10_17Flood = "";
            }
            /////////////////////////////////////////////////////////////////////////////
            string Line11_68Standard = "";
            if (Chk_Line11_68Standard.Checked == true)
            {
                Line11_68Standard = "Y";
            }
            else
            {
                Line11_68Standard = "";
            }


            string Line11_913Standard = "";
            if (Chk_Line11_913Standard.Checked == true)
            {
                Line11_913Standard = "Y";
            }
            else
            {
                Line11_913Standard = "";
            }


            string Line11_23Globe = "";
            if (Chk_Line11_23Globe.Checked == true)
            {
                Line11_23Globe = "Y";
            }
            else
            {
                Line11_23Globe = "";
            }


            string Line11_35MedBase = "";
            if (Chk_Line11_35MedBase.Checked == true)
            {
                Line11_35MedBase = "Y";
            }
            else
            {
                Line11_35MedBase = "";
            }


            string Line11_Candelabra = "";
            if (Chk_Line11_Candelabra.Checked == true)
            {
                Line11_Candelabra = "Y";
            }
            else
            {
                Line11_Candelabra = "";
            }


            string Line11_8Flood = "";
            if (Chk_Line11_8Flood.Checked == true)
            {
                Line11_8Flood = "Y";
            }
            else
            {
                Line11_8Flood = "";
            }


            string Line11_13Flood = "";
            if (Chk_Line11_13Flood.Checked == true)
            {
                Line11_13Flood = "Y";
            }
            else
            {
                Line11_13Flood = "";
            }


            string Line11_17Flood = "";
            if (Chk_Line11_17Flood.Checked == true)
            {
                Line11_17Flood = "Y";
            }
            else
            {
                Line11_17Flood = "";
            }
            /////////////////////////////////////////////////////////////////////////////
            string Line12_68Standard = "";
            if (Chk_Line12_68Standard.Checked == true)
            {
                Line12_68Standard = "Y";
            }
            else
            {
                Line12_68Standard = "";
            }


            string Line12_913Standard = "";
            if (Chk_Line12_913Standard.Checked == true)
            {
                Line12_913Standard = "Y";
            }
            else
            {
                Line12_913Standard = "";
            }


            string Line12_23Globe = "";
            if (Chk_Line12_23Globe.Checked == true)
            {
                Line12_23Globe = "Y";
            }
            else
            {
                Line12_23Globe = "";
            }


            string Line12_35MedBase = "";
            if (Chk_Line12_35MedBase.Checked == true)
            {
                Line12_35MedBase = "Y";
            }
            else
            {
                Line12_35MedBase = "";
            }


            string Line12_Candelabra = "";
            if (Chk_Line12_Candelabra.Checked == true)
            {
                Line12_Candelabra = "Y";
            }
            else
            {
                Line12_Candelabra = "";
            }


            string Line12_8Flood = "";
            if (Chk_Line12_8Flood.Checked == true)
            {
                Line12_8Flood = "Y";
            }
            else
            {
                Line12_8Flood = "";
            }


            string Line12_13Flood = "";
            if (Chk_Line12_13Flood.Checked == true)
            {
                Line12_13Flood = "Y";
            }
            else
            {
                Line12_13Flood = "";
            }


            string Line12_17Flood = "";
            if (Chk_Line12_17Flood.Checked == true)
            {
                Line12_17Flood = "Y";
            }
            else
            {
                Line12_17Flood = "";
            }
            //////////////////////////////////////////////////////////////////////////////
            string Line13_68Standard = "";
            if (Chk_Line13_68Standard.Checked == true)
            {
                Line13_68Standard = "Y";
            }
            else
            {
                Line13_68Standard = "";
            }


            string Line13_913Standard = "";
            if (Chk_Line13_913Standard.Checked == true)
            {
                Line13_913Standard = "Y";
            }
            else
            {
                Line13_913Standard = "";
            }


            string Line13_23Globe = "";
            if (Chk_Line13_23Globe.Checked == true)
            {
                Line13_23Globe = "Y";
            }
            else
            {
                Line13_23Globe = "";
            }


            string Line13_35MedBase = "";
            if (Chk_Line13_35MedBase.Checked == true)
            {
                Line13_35MedBase = "Y";
            }
            else
            {
                Line13_35MedBase = "";
            }


            string Line13_Candelabra = "";
            if (Chk_Line13_Candelabra.Checked == true)
            {
                Line13_Candelabra = "Y";
            }
            else
            {
                Line13_Candelabra = "";
            }


            string Line13_8Flood = "";
            if (Chk_Line13_8Flood.Checked == true)
            {
                Line13_8Flood = "Y";
            }
            else
            {
                Line13_8Flood = "";
            }


            string Line13_13Flood = "";
            if (Chk_Line13_13Flood.Checked == true)
            {
                Line13_13Flood = "Y";
            }
            else
            {
                Line13_13Flood = "";
            }


            string Line13_17Flood = "";

            if (Chk_Line13_17Flood.Checked == true)
            {
                Line13_17Flood = "Y";
            }
            else
            {
                Line13_17Flood = "";
            }
            //////////////////////////////////////////////////////////////////////////////
            string Line14_68Standard = "";
            if (Chk_Line14_68Standard.Checked == true)
            {
                Line14_68Standard = "Y";
            }
            else
            {
                Line14_68Standard = "";
            }


            string Line14_913Standard = "";
            if (Chk_Line14_913Standard.Checked == true)
            {
                Line14_913Standard = "Y";
            }
            else
            {
                Line14_913Standard = "";
            }


            string Line14_23Globe = "";
            if (Chk_Line14_23Globe.Checked == true)
            {
                Line14_23Globe = "Y";
            }
            else
            {
                Line14_23Globe = "";
            }


            string Line14_35MedBase = "";
            if (Chk_Line14_35MedBase.Checked == true)
            {
                Line14_35MedBase = "Y";
            }
            else
            {
                Line14_35MedBase = "";
            }


            string Line14_Candelabra = "";
            if (Chk_Line14_Candelabra.Checked == true)
            {
                Line14_Candelabra = "Y";
            }
            else
            {
                Line14_Candelabra = "";
            }


            string Line14_8Flood = "";
            if (Chk_Line14_8Flood.Checked == true)
            {
                Line14_8Flood = "Y";
            }
            else
            {
                Line14_8Flood = "";
            }


            string Line14_13Flood = "";
            if (Chk_Line14_13Flood.Checked == true)
            {
                Line14_13Flood = "Y";
            }
            else
            {
                Line14_13Flood = "";
            }


            string Line14_17Flood = "";
            if (Chk_Line14_17Flood.Checked == true)
            {
                Line14_17Flood = "Y";
            }
            else
            {
                Line14_17Flood = "";
            }













            //////////////////////////////////////////////////////////////////////////////////////////




            string Line1SmartPowerStrip6Outlet = "";
            if (rdo_Line1_6_9_Outlet.Checked == true)
            {
                Line1SmartPowerStrip6Outlet = "Y";
            }



            string Line2SmartPowerStrip6Outlet = "";
            if (rdo_Line2_6_9_Outlet.Checked == true)
            {
                Line2SmartPowerStrip6Outlet = "Y";
            }

            string Line3SmartPowerStrip6Outlet = "";
            if (rdo_Line3_6_9_Outlet.Checked == true)
            {
                Line3SmartPowerStrip6Outlet = "Y";
            }


            string Line4SmartPowerStrip6Outlet = "";
            if (rdo_Line4_6_9_Outlet.Checked == true)
            {
                Line4SmartPowerStrip6Outlet = "Y";
            }


            string Line1SmartPowerStrip10Outlet = "";
            if (rdo_Line1_10_Outlet.Checked == true)
            {
                Line1SmartPowerStrip10Outlet = "Y";
            }




            string Line2SmartPowerStrip10Outlet = "";
            if (rdo_Line2_10_Outlet.Checked == true)
            {
                Line2SmartPowerStrip10Outlet = "Y";
            }



            string Line3SmartPowerStrip10Outlet = "";
            if (rdo_Line3_10_Outlet.Checked == true)
            {
                Line3SmartPowerStrip10Outlet = "Y";
            }




            string Line4SmartPowerStrip10Outlet = "";
            if (rdo_Line4_10_Outlet.Checked == true)
            {
                Line4SmartPowerStrip10Outlet = "Y";
            }

            string InstalledFurnaceFilter = "";
            if (rdo_FilterWhistle_Yes.Checked == true)
            {
                InstalledFurnaceFilter = "Y";
            }
            else if (rdo_FilterWhistle_No.Checked == true)
            {
                InstalledFurnaceFilter = "N";
            }










            string JobNum = Request.QueryString["Jobs"].ToString();

            i = obj_MetedAudit.UpdateMETEDAudit_4(JobNum,"5", string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, txt_Line1_Total.Text, Line1_68Standard, Line1_913Standard, Line1_23Globe, Line1_35MedBase, Line1_Candelabra, Line1_8Flood, Line1_13Flood, Line1_17Flood, txt_Line1_Location_LedBlub.Text, txt_Line2_Total.Text, Line2_68Standard, Line2_913Standard, Line2_23Globe, Line2_35MedBase, Line2_Candelabra, Line2_8Flood, Line2_13Flood, Line2_17Flood, txt_Line2_Location_LedBlub.Text, txt_Line3_Total.Text, Line3_68Standard, Line3_913Standard, Line3_23Globe, Line3_35MedBase, Line3_Candelabra, Line3_8Flood, Line3_13Flood, Line3_17Flood, txt_Line3_Location_LedBlub.Text, txt_Line4_Total.Text, Line4_68Standard, Line4_913Standard, Line4_23Globe, Line4_35MedBase, Line4_Candelabra, Line4_8Flood, Line4_13Flood, Line4_17Flood, txt_Line4_Location_LedBlub.Text, string.Empty, txt_TotalLedInstallBulb.Text, txt_Line5_Total.Text, Line5_68Standard, Line5_913Standard, Line5_23Globe, Line5_35MedBase, Line5_Candelabra, Line5_8Flood, Line5_13Flood, Line5_17Flood, txt_Line5_Location_LedBlub.Text, txt_Line6_Total.Text, Line6_68Standard, Line6_913Standard, Line6_23Globe, Line6_35MedBase, Line6_Candelabra, Line6_8Flood, Line6_13Flood, Line6_17Flood, txt_Line6_Location_LedBlub.Text, txt_Line7_Total.Text, Line7_68Standard, Line7_913Standard, Line7_23Globe, Line7_35MedBase, Line7_Candelabra, Line7_8Flood, Line7_13Flood, Line7_17Flood, txt_Line7_Location_LedBlub.Text, txt_Line8_Total.Text, Line8_68Standard, Line8_913Standard, Line8_23Globe, Line8_35MedBase, Line8_Candelabra, Line8_8Flood, Line8_13Flood, Line8_17Flood, txt_Line8_Location_LedBlub.Text, txt_Line9_Total.Text, Line9_68Standard, Line9_913Standard, Line9_23Globe, Line9_35MedBase, Line9_Candelabra, Line9_8Flood, Line9_13Flood, Line9_17Flood, txt_Line9_Location_LedBlub.Text, txt_Line10_Total.Text, Line10_68Standard, Line10_913Standard, Line10_23Globe, Line10_35MedBase, Line10_Candelabra, Line10_8Flood, Line10_13Flood, Line10_17Flood, txt_Line10_Location_LedBlub.Text, txt_Line11_Total.Text, Line11_68Standard, Line11_913Standard, Line11_23Globe, Line11_35MedBase, Line11_Candelabra, Line11_8Flood, Line11_13Flood, Line11_17Flood, txt_Line11_Location_LedBlub.Text, txt_Line12_Total.Text, Line12_68Standard, Line12_913Standard, Line12_23Globe, Line12_35MedBase, Line12_Candelabra, Line12_8Flood, Line12_13Flood, Line12_17Flood, txt_Line12_Location_LedBlub.Text, txt_Line13_Total.Text, Line13_68Standard, Line13_913Standard, Line13_23Globe, Line13_35MedBase, Line13_Candelabra, Line13_8Flood, Line13_13Flood, Line13_17Flood, txt_Line13_Location_LedBlub.Text, txt_Line14_Total.Text, Line14_68Standard, Line14_913Standard, Line14_23Globe, Line14_35MedBase, Line14_Candelabra, Line14_8Flood, Line14_13Flood, Line14_17Flood, txt_Line14_Location_LedBlub.Text, Line1_RetroKit, Line2_RetroKit, Line3_RetroKit, Line4_RetroKit, Line5_RetroKit, Line6_RetroKit, Line7_RetroKit, Line8_RetroKit, Line9_RetroKit, Line10_RetroKit, Line11_RetroKit, Line12_RetroKit, Line13_RetroKit, Line14_RetroKit);


            j = obj_MetedAudit.UpdateMETEDAudit_3(JobNum, "5", string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty,string.Empty ,txt_LedNightLight.Text, txt_LedNightLight_Location1.Text, txt_LedNightLight_Location2.Text, txt_LedNightLight_Location3.Text, txt_LedNightLight_Location4.Text, txt_SmartPowerStrip.Text, txt_SmartPower_Location1.Text, txt_SmartPower_Location2.Text, txt_SmartPower_Location3.Text, txt_SmartPower_Location4.Text, Line1SmartPowerStrip6Outlet, Line2SmartPowerStrip6Outlet, Line3SmartPowerStrip6Outlet, Line4SmartPowerStrip6Outlet, Line1SmartPowerStrip10Outlet, Line2SmartPowerStrip10Outlet, Line3SmartPowerStrip10Outlet, Line4SmartPowerStrip10Outlet, txt_ExistingAlarms.Text, txt_NewAlarms.Text, txt_COAlarms_Location1.Text, txt_COAlarms_Location2.Text, txt_COAlarms_Location3.Text, txt_COAlarms_Location4.Text, txt_COAlarms_Location5.Text, InstalledFurnaceFilter);
            fill_form();


            Response.Write("<script>alert('Save Successfully');</script>");

        }
        catch
        {

        }


    }
}