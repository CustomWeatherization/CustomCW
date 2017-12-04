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

public partial class Admin_PaidReportPage : System.Web.UI.Page
{
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    dc_Admin ObjAdmin = new dc_Admin();
    public string JobType = "";
    public DataTable dtMergeAllPaidJob = new DataTable();
    public decimal TotalAmt;
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowAllPaidJobs();
    }

    public void ShowAllPaidJobs()
    {
        DataTable dtAllPaidJob = new DataTable();
        DataTable dt = objNewJob.ShowUtilityCompanies();
        if (dt.Rows.Count > 0)
        {
            DataRow row = dt.NewRow();
            dt.Rows.Add(row);
            row["UtilityCompany"] = "PPL Zone 1";
            dt.AcceptChanges();


            DataRow row_ = dt.NewRow();
            dt.Rows.Add(row_);
            row_["UtilityCompany"] = "PPL Zone 2";
            dt.AcceptChanges();


            DataRow row__ = dt.NewRow();
            dt.Rows.Add(row__);
            row__["UtilityCompany"] = "PPL Zone 3";
            dt.AcceptChanges();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string utlity = Convert.ToString(dt.Rows[i]["UtilityCompany"]);
                if (DDL_Utility.SelectedValue != "0" && DDL_Utility.SelectedValue != "")
                {
                    utlity = DDL_Utility.SelectedItem.Text;
                }
                dtAllPaidJob = ObjAdmin.SelectJobs_WithAllPaidReport(utlity, "", "", "", "", "", "", txt_SearchChk.Text);
                dtMergeAllPaidJob.Merge(dtAllPaidJob);
                if (DDL_Utility.SelectedValue != "0" && DDL_Utility.SelectedValue != "")
                {
                    break;
                }
            }
        }
    }

    protected void DDl_SortBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        chkAct129.Checked = chkAct129II.Checked = chkBaseLoad.Checked = chkHighPriority.Checked = chkLowCost.Checked = chkFullCost.Checked = false;
        int DDL_Value = Convert.ToInt32(DDl_SortBy.SelectedValue);
        if (DDL_Value == 1)
        {
            AllJobType.Visible = false;
            PPLZones.Visible = false;
            DDL_Zone.SelectedIndex = 0;
            MetedJobType.Visible = false;
            DDL_MetedType.SelectedIndex = 0;
            TrDatePart.Visible = false;
            tdtrUtility.Visible = true;
            trUtility.Visible = true;
            ShowUtilityCompany();

        }
        else if (DDL_Value == 2)
        {
            AllJobType.Visible = false;
            tdtrUtility.Visible = false;
            trUtility.Visible = false;
            TrDatePart.Visible = true;
            txtFromDate.Text = txtToDate.Text = "";
        }
    }
    public void ShowUtilityCompany()
    {
        try
        {
            DataTable dt = objNewJob.ShowUtilityCompanies();
            DDL_Utility.DataSource = dt;
            DDL_Utility.DataValueField = "ID";
            DDL_Utility.DataTextField = "UtilityCompany";
            DDL_Utility.DataBind();
            DDL_Utility.Items.Insert(0, new ListItem("Select Utility", "0"));
        }
        catch (Exception ex)
        {
        }
    }

    protected void DDL_Utility_SelectedIndexChanged(object sender, EventArgs e)
    {
        chkAct129.Checked = chkAct129II.Checked = chkBaseLoad.Checked = chkHighPriority.Checked = chkLowCost.Checked = chkFullCost.Checked = false;
        int Utility = Convert.ToInt32(DDL_Utility.SelectedValue);
        if (Utility == 1)
        {
            PPLZones.Visible = false;
            AllJobType.Visible = false;
            MetedJobType.Visible = true;
            DDL_MetedType.SelectedIndex = 0;
        }
        else if (Utility == 2)
        {
            MetedJobType.Visible = false;
            PPLZones.Visible = true;
            AllJobType.Visible = true;
            DDL_Zone.SelectedIndex = 0;
        }
        else
        {
            MetedJobType.Visible = false;
            PPLZones.Visible = false;
            AllJobType.Visible = true;
        }
    }
    protected void btn_Search_Click(object sender, EventArgs e)
    {
        int FltrBy = Convert.ToInt32(DDl_SortBy.SelectedValue);
        if (FltrBy == 2)
        {
            if (txtToDate.Text == "" || txtFromDate.Text == "")
            {
                DataTable dt = new DataTable();
                dtMergeAllPaidJob = dt;
            }
            else
            {
                DateTime ToDate = Convert.ToDateTime(txtToDate.Text);
                ToDate = ToDate.AddDays(1);
                string To_Date = Convert.ToString(ToDate);
                dtMergeAllPaidJob = ObjAdmin.All_PaidReportByDate(To_Date, txtFromDate.Text);
            }
        }
        else if (FltrBy == 1)
        {
            string Act129II = ""; string Act129 = ""; string BaseLoadOnly = ""; string HighPriority = ""; string LowCost = ""; string FullCost = "";
            string utlity = Convert.ToString(DDL_Utility.SelectedItem.Text);
            if (utlity != "MET ED" && utlity != "Select Utility")
            {
                if (chkAct129.Checked == true)
                {
                    Act129 = "Y";
                }
                else
                {
                    Act129 = "N";
                }

                if (chkBaseLoad.Checked == true)
                {
                    BaseLoadOnly = "Y";
                }
                else
                {
                    BaseLoadOnly = "N";
                }

                if (chkHighPriority.Checked == true)
                {
                    HighPriority = "Y";
                }
                else
                {
                    HighPriority = "N";
                }

                if (chkLowCost.Checked == true)
                {
                    LowCost = "Y";
                }
                else
                {
                    LowCost = "N";
                }

                if (chkFullCost.Checked == true)
                {
                    FullCost = "Y";
                }
                else
                {
                    FullCost = "N";
                }

                if (chkAct129II.Checked == true)
                {
                    Act129II = "Y";
                }
                else
                {
                    Act129II = "N";
                }
            }


            if (DDL_Utility.SelectedValue == "1")
            {
                string METED_TYPE = Convert.ToString(DDL_MetedType.SelectedItem.Text);
                if (METED_TYPE == "All")
                {
                    METED_TYPE = "MET ED";
                }
                else if (METED_TYPE == "Warm")
                {
                    METED_TYPE = "Warm";

                }
                else if (METED_TYPE == "Warm Plus")
                {
                    METED_TYPE = "Warm Plus";
                }
                dtMergeAllPaidJob = ObjAdmin.SelectJobs_WithAllPaidReport(METED_TYPE, "", "", "", "", "", "", txt_SearchChk.Text);
            }

            if (DDL_Utility.SelectedValue == "2")
            {
                string Zone_TYPE = Convert.ToString(DDL_Zone.SelectedItem.Text);
                if (Zone_TYPE == "All Zone")
                {
                    Zone_TYPE = "PPL";
                }
                else if (Zone_TYPE == "Zone 1")
                {
                    Zone_TYPE = "PPL Zone 1";

                }
                else if (Zone_TYPE == "Zone 2")
                {
                    Zone_TYPE = "PPL Zone 2";
                }
                else if (Zone_TYPE == "Zone CACLV")
                {
                    Zone_TYPE = "PPL Zone 3";
                }
                dtMergeAllPaidJob = ObjAdmin.SelectJobs_WithAllPaidReport(Zone_TYPE, Act129, BaseLoadOnly, HighPriority, LowCost, FullCost, Act129II, txt_SearchChk.Text);
            }

            if (DDL_Utility.SelectedValue != "2" && DDL_Utility.SelectedValue != "1" && DDL_Utility.SelectedValue != "0")
            {
                string utl = Convert.ToString(DDL_Utility.SelectedItem.Text);
                dtMergeAllPaidJob = ObjAdmin.SelectJobs_WithAllPaidReport(utl, Act129, BaseLoadOnly, HighPriority, LowCost, FullCost, Act129II, txt_SearchChk.Text);
            }           
        }
    }
}
