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
using System.Data.SqlClient;
using System.Collections.Generic;

public partial class Admin_viewEmployee : System.Web.UI.Page
{
    smUtil objSm = new smUtil();
    Dc_Category objCat = new Dc_Category();
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    protected void Page_Load(object sender, EventArgs e)
    {
         if (!IsPostBack)
         {
             BindDDLManager();
            if (Request.QueryString["Uid"] != null)
            {
                pnlView.Visible = true;
                pnlEdit.Visible = false;
                FillEmployeeInformation(Convert.ToInt32(Request.QueryString["Uid"]));
                if (imgProfileImage.ImageUrl == "")
                {
                    imgProfileImage.ImageUrl = "Upload/noImage.png";
                }

            }
            if (Request.QueryString["Uid1"] != null)
            {
                pnlView.Visible = false;
                pnlEdit.Visible = true;
                FillEmployeeInformation(Convert.ToInt32(Request.QueryString["Uid1"]));
                if (imgpreview.ImageUrl == "")
                {
                    imgpreview.ImageUrl = "Upload/noImage.png";
                }
            }
            //var holidays = getHolidayList(DateTime.Now.Year);

            //foreach (var holiday in holidays)
            //{
            //    string date = holiday.Date.ToShortDateString();
            //    string day = holiday.Date.DayOfWeek.ToString();
            //    string HolidayName = holiday.HolidayName.ToString();
            //}
            // ColorPicker1.SelectedHexValue = "#9a0000";
       }
    }


    public class Holiday
    {
        public string HolidayName { get; set; }
        public DateTime Date { get; set; }

        public Holiday(string holidayName, DateTime date)
        {
            HolidayName = holidayName;
            Date = date;
        }
    }

    public static List<Holiday> getHolidayList(int vYear)
    {
        int FirstWeek = 1;
        int SecondWeek = 2;
        int ThirdWeek = 3;
        int FourthWeek = 4;
        int LastWeek = 5;

        List<Holiday> HolidayList = new List<Holiday>();

        //   http://www.usa.gov/citizens/holidays.shtml      
        //   http://archive.opm.gov/operating_status_schedules/fedhol/2013.asp

        // New Year's Day            Jan 1
        HolidayList.Add(new Holiday("NewYears", new DateTime(vYear, 1, 1)));

        // Martin Luther King, Jr. third Mon in Jan
        HolidayList.Add(new Holiday("MLK", GetNthDayOfNthWeek(new DateTime(vYear, 1, 1), DayOfWeek.Monday, ThirdWeek)));

        // Washington's Birthday third Mon in Feb
      //  HolidayList.Add(new Holiday("WashingtonsBDay", GetNthDayOfNthWeek(new DateTime(vYear, 2, 1), DayOfWeek.Monday, ThirdWeek)));

        // Memorial Day          last Mon in May
        HolidayList.Add(new Holiday("MemorialDay", GetNthDayOfNthWeek(new DateTime(vYear, 5, 1), DayOfWeek.Monday, LastWeek)));

        // Independence Day      July 4
        HolidayList.Add(new Holiday("IndependenceDay", new DateTime(vYear, 7, 4)));

        // Labor Day             first Mon in Sept
        HolidayList.Add(new Holiday("LaborDay", GetNthDayOfNthWeek(new DateTime(vYear, 9, 1), DayOfWeek.Monday, FirstWeek)));

        // Columbus Day          second Mon in Oct
        HolidayList.Add(new Holiday("Columbus", GetNthDayOfNthWeek(new DateTime(vYear, 10, 1), DayOfWeek.Monday, SecondWeek)));

        // Veterans Day          Nov 11
        HolidayList.Add(new Holiday("Veterans", new DateTime(vYear, 11, 11)));

        // Thanksgiving Day      fourth Thur in Nov
        HolidayList.Add(new Holiday("Thanksgiving", GetNthDayOfNthWeek(new DateTime(vYear, 11, 1), DayOfWeek.Thursday, FourthWeek)));

        // Christmas Day         Dec 25
        HolidayList.Add(new Holiday("Christmas", new DateTime(vYear, 12, 25)));

        //saturday holidays are moved to Fri; Sun to Mon
        //foreach (var holiday in HolidayList)
        //{
        //    if (holiday.Date.DayOfWeek == DayOfWeek.Saturday)
        //    {
        //        holiday.Date = holiday.Date.AddDays(-1);
        //    }
        //    if (holiday.Date.DayOfWeek == DayOfWeek.Sunday)
        //    {
        //        holiday.Date = holiday.Date.AddDays(1);
        //    }
        //}

        //return
        return HolidayList;

    }
    private static System.DateTime GetNthDayOfNthWeek(DateTime dt, DayOfWeek dayofWeek, int WhichWeek)
    {
        //specify which day of which week of a month and this function will get the date
        //this function uses the month and year of the date provided

        //get first day of the given date
        System.DateTime dtFirst = new DateTime(dt.Year, dt.Month, 1);

        //get first DayOfWeek of the month
        System.DateTime dtRet = dtFirst.AddDays(6 - (int)dtFirst.AddDays(-1 * ((int)dayofWeek + 1)).DayOfWeek);

        //get which week
        dtRet = dtRet.AddDays((WhichWeek - 1) * 7);

        //if day is past end of month then adjust backwards a week
        if (dtRet >= dtFirst.AddMonths(1))
        {
            dtRet = dtRet.AddDays(-7);
        }

        //return
        return dtRet;

    }
    public void BindDDLManager()
    {
        DataTable dtDLL = new DataTable();
        dtDLL = objCat.GetUserRegistrationNames();
        ddlManager.DataSource = dtDLL;
        ddlManager.DataValueField = "ID";
        ddlManager.DataTextField = "CWLogin";
        ddlManager.DataBind();
        ddlManager.Items.Insert(0, "Select Manager");
    }
    public void btnShowPopup_Click1(object sender, EventArgs e)
    {
       // ModalPopupExtender1.Show();    
    }
    public void lbnPayment_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
        ShowPaymentHistory();
       // pnlPaymentHistory.Visible = true;
    }
    public void btnShow_Click(object sender, EventArgs e)
    {
        imgPtoHide.Visible = true;
        imgPtoShow.Visible = false;
        pnlHolidays.Visible = true;
    }
    public void btnHide_Click(object sender, EventArgs e)
    {
        imgPtoHide.Visible = false;
        imgPtoShow.Visible = true;
        pnlHolidays.Visible = false;
    }

    public void ShowPaymentHistory()
    { 
    
        string obj = Request.QueryString["Uid1"];
        DataTable dt1 = new DataTable();
        dt1 = objCat.ShowPaymentHistory(obj);
        grdPaymentHistory.DataSource = dt1;
        grdPaymentHistory.DataBind();
    
    }
    protected void grdPaymentHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdPaymentHistory.PageIndex = e.NewPageIndex;
        ShowPaymentHistory();
    }
    public void btn_cancelPayment_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Hide();

    }
    public void FillEmployeeInformation(int uid)
    {
        DataTable dt = objCat.ShowEmployeeInformation(uid);
        DataSet ds = objCat.ShowRequestTimeOffInfo(uid);
        if (dt.Rows.Count > 0)
        {
            lblFirstName.Text = Convert.ToString(dt.Rows[0]["FName"]);
            lblLastName.Text = Convert.ToString(dt.Rows[0]["LName"]);
            if (Convert.ToString(dt.Rows[0]["BirthDate"]) != "")
            {
                lblBirthdate.Text = Convert.ToString(dt.Rows[0]["BirthDate"]);
            }
           // imgProfileImage.ImageUrl = Convert.ToString(dt.Rows[0]["ProfileImage"]);
            lblPhoneNumber.Text = Convert.ToString(dt.Rows[0]["phone"]);
            lblAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
            lblCity.Text = Convert.ToString(dt.Rows[0]["City"]);
            lblState.Text = Convert.ToString(dt.Rows[0]["State"]);
            lblPincode.Text = Convert.ToString(dt.Rows[0]["Zipcode"]);
            lblEmail.Text = Convert.ToString(dt.Rows[0]["Email"]);
            txtLoginId.Text = Convert.ToString(dt.Rows[0]["Login"]);
            txtEmail.Text = Convert.ToString(dt.Rows[0]["Email"]);
            txtHourlyRate.Text = "$" + Convert.ToString(dt.Rows[0]["HourlyRate"]);
            string image = Convert.ToString(dt.Rows[0]["ProfileImage"]);
            imgpreview.ImageUrl = image.Replace("~/Admin/","");
            imgProfileImage.ImageUrl = image.Replace("~/Admin/", "");
            txtPassword.Text = Convert.ToString(dt.Rows[0]["Password"]);
            txtPasscode.Text = Convert.ToString(dt.Rows[0]["passcode"]);
            txtMaxxVacationHours.Text = Convert.ToString(dt.Rows[0]["MaxVacationHours"]);
            
            if (Convert.ToString(dt.Rows[0]["MaxVacationHours"]) == "" ||Convert.ToString(dt.Rows[0]["MaxVacationHours"]) =="0" )
            {
                lblTotalHours.Text = "0 Hr. Taken" + " " + "----" +  " " + "0 Hr. Pending -" + " " + " 0 Hr. Approved -" + "0 Hr. Available";
             //   lblTotalHours.Text = "0 Hr. Taken" + " " + "----" + " " + "0 Hr. On Balance -" + " " + "0 Hr. Pending -" + " " + " 0 Hr. Approved =" + "0 Hr. Available";
                lblTotalHoursEdit.Text = "0 Hr. Taken" + " " + "----" +  "0 Hr. Pending -" + " " + " 0 Hr. Approved -" + "0 Hr. Available";
             //   lblTotalHoursEdit.Text = "0 Hr. Taken" + " " + "----" + " " + "0 Hr. On Balance -" + " " + "0 Hr. Pending -" + " " + " 0 Hr. Approved =" + "0 Hr. Available";
            }
            else
            {             
                double PendingHours = 0;
                double ApproveHours = 0;
                double MaxVacationHours = 0;
                double TotalHours = 0;
               
                PendingHours = !DBNull.Value.Equals(ds.Tables[0].Rows[0]["Pending"]) ? Math.Round(Convert.ToDouble(ds.Tables[0].Rows[0]["Pending"].ToString()), 2) : PendingHours;

                ApproveHours = !DBNull.Value.Equals(ds.Tables[1].Rows[0]["Approve"]) ? Math.Round(Convert.ToDouble(ds.Tables[1].Rows[0]["Approve"]), 2) : ApproveHours;

                MaxVacationHours = !DBNull.Value.Equals(dt.Rows[0]["MaxVacationHours"]) ? Math.Round(Convert.ToDouble(dt.Rows[0]["MaxVacationHours"].ToString()), 2) : MaxVacationHours;
              
                
                TotalHours = MaxVacationHours - PendingHours - ApproveHours;
                if (TotalHours <= 0)
                {
                    TotalHours = 0;
                }
                double TotalHoursTaken = Convert.ToDouble(MaxVacationHours) - TotalHours;
                lblTotalHoursEdit.Text = TotalHoursTaken + " " + "Hr. Taken" + " " + "----" + " " + PendingHours + " " + "Hr. Pending -" + " " + ApproveHours + " " + "Hr. Approved -" + TotalHours + " " + "Hr. Available";
              //  lblTotalHoursEdit.Text = TotalHoursTaken + " " + "Hr. Taken" + " " + "----" + " " + MaxVacationHours + " " + "Hr. On Balance -" + " " + PendingHours + " " + "Hr. Pending -" + " " + ApproveHours + " " + "Hr. Approved =" + TotalHours + " " + "Hr. Available";
                lblTotalHours.Text = TotalHoursTaken + " " + " Hr. Taken" + " " + "----" + " " + PendingHours + " " + "Hr. Pending -" + " " + ApproveHours + " " + "Hr. Approved -" + TotalHours + " " + "Hr. Available";
              //  lblTotalHours.Text = TotalHoursTaken + " " + " Hr. Taken" + " " + "----" + " " + MaxVacationHours + " " + "Hr. On Balance -" + " " + PendingHours + " " + "Hr. Pending -" + " " + ApproveHours + " " + "Hr. Approved =" + TotalHours + " " + "Hr. Available";
            }
            if (Convert.ToString(dt.Rows[0]["BirthDate"]) != "")
            {
                txtBirthDate.Text = Convert.ToDateTime(dt.Rows[0]["BirthDate"]).ToShortDateString();
            }
            txt_PersentRate.Text = Convert.ToString(dt.Rows[0]["PersentageRate"]);
            txt_AuditRate.Text = "$ " + Convert.ToString(dt.Rows[0]["AuditRate"]);

            txtMetedAudit.Text = "$ " + Convert.ToString(dt.Rows[0]["MetedAudit"]);
            txtQuestion.Text = Convert.ToString(dt.Rows[0]["QuestionMesr"]);
            txtExtraMesr.Text = "$" + Convert.ToString(dt.Rows[0]["ExtraMesr"]);
            txtZ1Z2Rate.Text = Convert.ToString(dt.Rows[0]["PplZ1Z2"]);
            txtInspectionRate.Text = Convert.ToString(dt.Rows[0]["InspectionRate"]);
            ColorPickerId.Value = Convert.ToString(dt.Rows[0]["Eventcolor"]);
            
            txtBCOCInvoiceRate.Text = Convert.ToString(dt.Rows[0]["BCOC_Invoice"]);
            txtDCEDInvoiceRate.Text = Convert.ToString(dt.Rows[0]["DCED_Invoice"]);
            txtUGIInvoiceRate.Text = Convert.ToString(dt.Rows[0]["UGI_Invoice"]);
            txtPCInvoiceRate.Text = Convert.ToString(dt.Rows[0]["Private_Customer_Invoice"]);
            if (Convert.ToString(dt.Rows[0]["Salary"]) != "")
            {
                int salary1 = Convert.ToInt32(Convert.ToString(dt.Rows[0]["Salary"]));
                lblPersonalSalary.Text = String.Format("{0:C}", salary1) + "/Yr.";
            }
            else
            {
                lblPersonalSalary.Text = "$ 0.00/Yr.";
            }
            txtJobTitle.Text = Convert.ToString(dt.Rows[0]["JobTitle"]);
            ViewState["HourlyOldRate"] = Convert.ToString(dt.Rows[0]["HourlyRate"]);
            ViewState["OldPayment"] = Convert.ToString(dt.Rows[0]["Salary"]);
            if (Convert.ToString(dt.Rows[0]["Salary"]) == "")
            {
                lblSalary.Text="Not Available";
            }
            else 
            {
                int salary = Convert.ToInt32(dt.Rows[0]["Salary"].ToString());
                lblSalary.Text =String.Format("{0:C}" ,salary)+"/Yr.";
            }
            if (Convert.ToString(dt.Rows[0]["JoiningDate"]) != "")
            {
                lblJoiningDate.Text = Convert.ToDateTime(dt.Rows[0]["JoiningDate"]).ToString("MM/dd/yyyy");
            txtJoiningDate.Text = Convert.ToDateTime(dt.Rows[0]["JoiningDate"]).ToString("MM/dd/yyyy");
            }
            if (Convert.ToString(dt.Rows[0]["JobTitle"]) == "")
            {
                lblDesignation.Text = "Not Available";
            }
            else
            {
                lblDesignation.Text = Convert.ToString(dt.Rows[0]["JobTitle"]);
            }
          
          
             
            if (Convert.ToString(dt.Rows[0]["Manager"]) == "")
            {
                ddlManager.SelectedItem.Text = "Select Manager";
            }
            else
            {

                string qqq=dt.Rows[0]["Manager"].ToString();
              ddlManager.SelectedItem.Text = Convert.ToString(dt.Rows[0]["Manager"]);
            }

          
            lblholidaysincejoining.Text = !DBNull.Value.Equals(ds.Tables[2].Rows[0]["HoidayJoining"]) ? Convert.ToString(ds.Tables[2].Rows[0]["HoidayJoining"]) + " " + "Hr." : "0 Hr.";
            lblHolidaySinceJoining1.Text = !DBNull.Value.Equals(ds.Tables[2].Rows[0]["HoidayJoining"]) ? Convert.ToString(ds.Tables[2].Rows[0]["HoidayJoining"]) + " " + "Hr." : "0 Hr.";
           
            lblholidaythisyear.Text = !DBNull.Value.Equals(ds.Tables[3].Rows[0]["HolidayThisYear"]) ? Convert.ToString(ds.Tables[3].Rows[0]["HolidayThisYear"]) + " " + "Hr." : "0 Hr.";
            lblHolidayThisYear1.Text = !DBNull.Value.Equals(ds.Tables[3].Rows[0]["HolidayThisYear"]) ? Convert.ToString(ds.Tables[3].Rows[0]["HolidayThisYear"]) + " " + "Hr." : "0 Hr.";
          
            lblsicknesssincejoinnig.Text = !DBNull.Value.Equals(ds.Tables[4].Rows[0]["SicknessJoining"]) ? Convert.ToString(ds.Tables[4].Rows[0]["SicknessJoining"]) + " " + "Hr." : "0 Hr.";
            lblSicknessSinceJoinnig1.Text = !DBNull.Value.Equals(ds.Tables[4].Rows[0]["SicknessJoining"]) ? Convert.ToString(ds.Tables[4].Rows[0]["SicknessJoining"]) + " " + "Hr." : "0 Hr.";
          
            lblsicknessthisyear.Text = !DBNull.Value.Equals(ds.Tables[5].Rows[0]["SicknessThisYear"]) ? Convert.ToString(ds.Tables[5].Rows[0]["SicknessThisYear"]) + " " + "Hr." : "0 Hr.";
            lblSicknessThisYear1.Text = !DBNull.Value.Equals(ds.Tables[5].Rows[0]["SicknessThisYear"]) ? Convert.ToString(ds.Tables[5].Rows[0]["SicknessThisYear"]) + " " + "Hr." : "0 Hr.";
           
            lblunpaidsincejoining.Text = !DBNull.Value.Equals(ds.Tables[6].Rows[0]["UnpaidLeaveJoining"]) ? Convert.ToString(ds.Tables[6].Rows[0]["UnpaidLeaveJoining"]) + " " + "Hr." : "0 Hr.";
            lblUnpaidSinceJoining1.Text = !DBNull.Value.Equals(ds.Tables[6].Rows[0]["UnpaidLeaveJoining"]) ? Convert.ToString(ds.Tables[6].Rows[0]["UnpaidLeaveJoining"]) + " " + "Hr." : "0 Hr.";
           
            lblunpaidthisyear.Text = !DBNull.Value.Equals(ds.Tables[7].Rows[0]["UnpaidLeaveThisYear"]) ? Convert.ToString(ds.Tables[7].Rows[0]["UnpaidLeaveThisYear"]) + " " + "Hr." : "0 Hr.";
            lblUnpaidThisYear1.Text = !DBNull.Value.Equals(ds.Tables[7].Rows[0]["UnpaidLeaveThisYear"]) ? Convert.ToString(ds.Tables[7].Rows[0]["UnpaidLeaveThisYear"]) + " " + "Hr." : "0 Hr.";
         
            lblEmergencyPaidTimeOffSinceJoin.Text = !DBNull.Value.Equals(ds.Tables[8].Rows[0]["EmergencyPaidTimeOffJoining"]) ? Convert.ToString(ds.Tables[8].Rows[0]["EmergencyPaidTimeOffJoining"]) + " " + "Hr." : "0 Hr.";
            lblEmergencyPaidTimeOffSinceJoin1.Text = !DBNull.Value.Equals(ds.Tables[8].Rows[0]["EmergencyPaidTimeOffJoining"]) ? Convert.ToString(ds.Tables[8].Rows[0]["EmergencyPaidTimeOffJoining"]) + " " + "Hr." : "0 Hr.";

            lblEmergencyPaidTimeOffThisYear.Text = !DBNull.Value.Equals(ds.Tables[9].Rows[0]["EmergencyPaidTimeOffThisYear"]) ? Convert.ToString(ds.Tables[9].Rows[0]["EmergencyPaidTimeOffThisYear"]) + " " + "Hr." : "0 Hr.";
            lblEmergencyPaidTimeOffThisYear1.Text = !DBNull.Value.Equals(ds.Tables[9].Rows[0]["EmergencyPaidTimeOffThisYear"]) ? Convert.ToString(ds.Tables[9].Rows[0]["EmergencyPaidTimeOffThisYear"]) + " " + "Hr." : "0 Hr.";
           
            lblEmergencyTimeOffSinceJoin.Text = !DBNull.Value.Equals(ds.Tables[10].Rows[0]["EmergencyTimeOffJoining"]) ? Convert.ToString(ds.Tables[10].Rows[0]["EmergencyTimeOffJoining"]) + " " + "Hr." : "0 Hr.";
            lblEmergencyTimeOffSinceJoin1.Text = !DBNull.Value.Equals(ds.Tables[10].Rows[0]["EmergencyTimeOffJoining"]) ? Convert.ToString(ds.Tables[10].Rows[0]["EmergencyTimeOffJoining"]) + " " + "Hr." : "0 Hr.";
         
            lblEmergencyTimeOffThisYear.Text = !DBNull.Value.Equals(ds.Tables[11].Rows[0]["EmergencyTimeOffThisYear"]) ? Convert.ToString(ds.Tables[11].Rows[0]["EmergencyTimeOffThisYear"]) + " " + "Hr." : "0 Hr.";
            lblEmergencyTimeOffThisYear1.Text = !DBNull.Value.Equals(ds.Tables[11].Rows[0]["EmergencyTimeOffThisYear"]) ? Convert.ToString(ds.Tables[11].Rows[0]["EmergencyTimeOffThisYear"]) + " " + "Hr." : "0 Hr.";

            //lblHolidayPaySinceJoin.Text = !DBNull.Value.Equals(ds.Tables[12].Rows[0]["HolidayPayJoining"]) ? Convert.ToString(ds.Tables[12].Rows[0]["HolidayPayJoining"]) + " "  : "0";
            //lblHolidayPaySinceJoin1.Text = !DBNull.Value.Equals(ds.Tables[12].Rows[0]["HolidayPayJoining"]) ? Convert.ToString(ds.Tables[12].Rows[0]["HolidayPayJoining"]) + " " + "" : "0"; 

            lblHolidayPaySinceJoin.Text = !DBNull.Value.Equals(ds.Tables[21].Rows[0]["DayJoining"]) ? Convert.ToString(ds.Tables[21].Rows[0]["DayJoining"]) + " " : "0";
            lblHolidayPaySinceJoin1.Text = !DBNull.Value.Equals(ds.Tables[21].Rows[0]["DayJoining"]) ? Convert.ToString(ds.Tables[21].Rows[0]["DayJoining"]) + " " + "" : "0"; 

            //lblHolidayPayThisYear.Text = !DBNull.Value.Equals(ds.Tables[13].Rows[0]["HolidayPayThisYear"]) ? Convert.ToString(ds.Tables[13].Rows[0]["HolidayPayThisYear"])  : "0";
            //lblHolidayPayThisYear1.Text = !DBNull.Value.Equals(ds.Tables[13].Rows[0]["HolidayPayThisYear"]) ? Convert.ToString(ds.Tables[13].Rows[0]["HolidayPayThisYear"]) : "0";

            lblHolidayPayThisYear.Text = !DBNull.Value.Equals(ds.Tables[20].Rows[0]["DayThisYear"]) ? Convert.ToString(ds.Tables[20].Rows[0]["DayThisYear"]) : "0";
            lblHolidayPayThisYear1.Text = !DBNull.Value.Equals(ds.Tables[20].Rows[0]["DayThisYear"]) ? Convert.ToString(ds.Tables[20].Rows[0]["DayThisYear"]) : "0";


            lblOccurencesSinceJoinng.Text = !DBNull.Value.Equals(ds.Tables[14].Rows[0]["OccurencesJoining"]) ? Convert.ToString(ds.Tables[14].Rows[0]["OccurencesJoining"]) : "0";
            lblOccurencesSinceJoinng1.Text = !DBNull.Value.Equals(ds.Tables[14].Rows[0]["OccurencesJoining"]) ? Convert.ToString(ds.Tables[14].Rows[0]["OccurencesJoining"]) : "0";

            lblOccurencesThisYear.Text = !DBNull.Value.Equals(ds.Tables[15].Rows[0]["OccurencesThisYear"]) ? Convert.ToString(ds.Tables[15].Rows[0]["OccurencesThisYear"]) : "0";
            lblOccurencesThisYear1.Text = !DBNull.Value.Equals(ds.Tables[15].Rows[0]["OccurencesThisYear"]) ? Convert.ToString(ds.Tables[15].Rows[0]["OccurencesThisYear"]) : "0";
          
        }
        string str = objCat.CheckAuditorCheckBox(uid);
        if (str == "True")
        {
            Chk_SetAuditor.Checked = true;
        }
        else if (str == "False")
        {
            Chk_SetAuditor.Checked = false;
        }
        var holidays = getHolidayList(DateTime.Now.Year);
        if (ds.Tables[19].Rows.Count > 0)
        {
            int count = 0;
            for (int i = 0; i < ds.Tables[19].Rows.Count; i++)
            {
                string fromdate = Convert.ToDateTime(ds.Tables[19].Rows[i]["FromDate"]).ToShortDateString();

                foreach (var holiday in holidays)
                {
                    string date = holiday.Date.ToShortDateString();
                    string day = holiday.Date.DayOfWeek.ToString();
                    string HolidayName = holiday.HolidayName.ToString();
                    if (date == fromdate)
                    {
                        if (day == "Sunday" || day == "Saturday")
                        {
                            count = count;
                        }
                        else 
                        {
                            count = count + 1;
                        }
                        chkHolidaysList.Items.FindByValue(HolidayName).Selected = true;
                      //  chkHolidaysList.Items.FindByValue(HolidayName).Enabled = false;
                       //lblHolidayPayThisYear.Text = count.ToString();
                       //lblHolidayPayThisYear1.Text = count.ToString();
                       //lblHolidayPaySinceJoin1.Text = count.ToString();
                       //lblHolidayPaySinceJoin.Text = count.ToString();
                    }
                }
            }
        }
    }
    public DataSet GetData(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["CWeatherCon"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataSet ds = new DataSet())
                {
                    sda.Fill(ds);
                    return ds;
                }
            }
        }
    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewUserDetails.aspx");
    }

    protected void txtHourlyRateChenge_Click(object sender, EventArgs e)
    {
        string HourlyRate = txtHourlyRate.Text;
        HourlyRate = HourlyRate.TrimStart('$');
        double value =0.0;
        if (HourlyRate != "")
        {
          value = Convert.ToDouble(HourlyRate) * 40 * 52;
        }
        else
        {
            value = 0;        
        }
        lblPersonalSalary.Text = String.Format("{0:C}",value);     
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            string profileImage = "";
            string subPath = "~/Admin/Upload/";
            bool flag = false;
            if (profileUpload.HasFile)
            {
                string str = profileUpload.FileName;

                // your code goes here
                profileImage = subPath + str;
                bool exists = System.IO.Directory.Exists(Server.MapPath(subPath));

                if (!exists)
                {
                    System.IO.Directory.CreateDirectory(Server.MapPath(subPath));
                }
                //else
                //{
                //    System.IO.File.Delete(Server.MapPath(profileImage));
                //}
                profileUpload.PostedFile.SaveAs(Server.MapPath(profileImage));
                //  profileImage = "Upload/" + str.ToString();
                //   profileImage = image;
            }
            else
            {
                profileImage = "~/Admin/" + imgpreview.ImageUrl;
            }


            double maxVacHours = 0;
            if (txtMaxxVacationHours.Text == "")
            {
                maxVacHours = 0;
            }
            else
            {
                maxVacHours = Convert.ToDouble(txtMaxxVacationHours.Text.Trim());
            }

            string Manager = "";
            if (ddlManager.SelectedItem.Text == "Select Manager")
            {
                Manager = null;
            }
            else
            {
                Manager = ddlManager.SelectedItem.Text;
            }
            string Payment = lblPersonalSalary.Text;
            Payment = Payment.TrimStart('$');
            Payment = Payment.Replace("/Yr.", "");
            Payment = Payment.Replace(".00", "");
            Payment = Payment.Replace(",", "");
            bool msg = objCat.Update_Employee_details(txtLoginId.Text, lblFirstName.Text, lblLastName.Text, txtEmail.Text.Trim(), txtPassword.Text, profileImage, maxVacHours, txtJobTitle.Text.Trim(), Manager, txtJoiningDate.Text, Payment, txtBirthDate.Text);//, txt_add.Text, txt_city.Text, txt_state.Text, txt_zip.Text


            string PPLAudit = txt_AuditRate.Text;
            PPLAudit = PPLAudit.TrimStart('$');
            PPLAudit = PPLAudit.TrimStart(' ');

            string color = ColorPickerId.Value;

            string MetedAudit = txtMetedAudit.Text;
            MetedAudit = MetedAudit.TrimStart('$');
            MetedAudit = MetedAudit.TrimStart(' ');

            string ExtraMesr = txtExtraMesr.Text;
            ExtraMesr = ExtraMesr.TrimStart('$');

            string Z1Z2Rate = txtZ1Z2Rate.Text;
            Z1Z2Rate = Z1Z2Rate.TrimStart('$');

            string InspectionRate = txtInspectionRate.Text;
            InspectionRate = InspectionRate.TrimStart('$');

            string InvoiceRate = txt_PersentRate.Text;
            InvoiceRate = InvoiceRate.TrimStart('$');

            string HourlyRate = txtHourlyRate.Text;
            HourlyRate = HourlyRate.TrimStart('$');
            double OldHourlyRate = 0;
            double OldPayment = 0.0;
            if (ViewState["HourlyOldRate"] != "")
            {
                OldHourlyRate = Convert.ToDouble(ViewState["HourlyOldRate"].ToString());
            }

            if (ViewState["OldPayment"] != "")
            {
                OldPayment = Convert.ToDouble(ViewState["OldPayment"].ToString());
            }
            if (HourlyRate == "")
            {
                HourlyRate = "0";
            }
            if (Payment == "")
            {
                Payment = "0.0";
            }
            if (OldHourlyRate != Convert.ToDouble(HourlyRate))
            {
                int j = objCat.InsertPaymentSalary(OldHourlyRate, Convert.ToDouble(HourlyRate), OldPayment, Convert.ToDouble(Payment), txtLoginId.Text);

            }
            int i = objCat.UpdateEmployeeInformation(txtPasscode.Text, PPLAudit, InvoiceRate, HourlyRate, Convert.ToInt32(Request.QueryString["Uid1"]), MetedAudit, ExtraMesr, txtQuestion.Text, Z1Z2Rate, InspectionRate, txtBCOCInvoiceRate.Text, txtDCEDInvoiceRate.Text, txtPCInvoiceRate.Text, txtUGIInvoiceRate.Text, color);
            if (i == 1 && msg == true)
            {
                flag = true;

                // Response.Write("<script type = 'text/javascript'>alert('Record is updated');</script>");
            }
            else
            {
                Response.Write("<script type = 'text/javascript'>alert('Try Again !!');</script>");
            }

            //if(Request.QueryString["Uid"]!=null)
            //{
            //FillEmployeeInformation(Convert.ToInt32(Request.QueryString["Uid"]));
            //}
            //else
            //{
            //    FillEmployeeInformation(Convert.ToInt32(Request.QueryString["Uid1"]));
            //}
            string uid = "";
            if (Request.QueryString["Uid"] != null)
            {
                uid = Request.QueryString["Uid"].ToString();
            }
            else if (Request.QueryString["Uid1"] != null)
            {
                uid = Request.QueryString["Uid1"].ToString();
            }
            var holidays = getHolidayList(DateTime.Now.Year);
            string obj = objSm.GetCookie("UserId");
            DataSet ds2 = new DataSet();
            ds2 = GetData("select U1.ID as Sender,U2.ID as Recipient,UR.MaxVacationHours,UR.Email as Email,U1.CWLogin as ReceipientName,U2.CWLogin as SenderName from User_registration UR inner join Users U1 on U1.CWLogin=UR.Login inner join Users U2 on U2.CWLogin=UR.Manager where UR.User_Id='" + uid + "' ");
            DataSet ds = objCat.ShowRequestTimeOffInfo(Convert.ToInt32(uid));
            DataSet ds3 = new DataSet();
            for (int i1 = 0; i1 < chkHolidaysList.Items.Count; i1++)
            {
                //if (chkHolidaysList.Items[i1].Selected)
                //{ 
                string strHoliday = chkHolidaysList.Items[i1].Value.ToString();
                foreach (var holiday in holidays)
                {
                    string date = holiday.Date.ToShortDateString();
                    string day = holiday.Date.DayOfWeek.ToString();
                    string HolidayName = holiday.HolidayName.ToString();


                    if (HolidayName == strHoliday)
                    {

                        ds3 = GetData("select count(FromDate) as Count from EmployeeLeave EI inner join User_registration UR on EI.LoginID=UR.Login  where TypeOfRequesteType='Holiday Pay' and FromDate='" + date + "' and UR.User_Id='" + uid + "'");

                        if (ds3.Tables[0].Rows[0]["Count"].ToString() == "0" && chkHolidaysList.Items[i1].Selected)
                        {
                            bool msg1 = objCat.Add_RequestTimeOff_Details(txtLoginId.Text, date, date, null, null, "Holiday Pay", null, 8, "Approve");//, txt_add.Text, txt_city.Text, txt_state.Text, txt_zip.Text
                            if (msg1 == true)
                            {
                                flag = true;
                                if (ds2.Tables[0].Rows[0]["Recipient"] != "")
                                {
                                    string msgToSend = string.Empty;
                                    int msgId = 0;
                                    msgId = objNewJob.InsertJobMessage(chkHolidaysList.Items[i1].Text.Trim());
                                    objNewJob.InsertJobMessageReadUnread2(Convert.ToInt32(ds2.Tables[0].Rows[0]["Sender"]), Convert.ToInt32(ds2.Tables[0].Rows[0]["Recipient"]), "0", msgId, "U", null, null, null, null, null, null, null, "R", "Holiday Pay");
                                    if (!DBNull.Value.Equals(ds2.Tables[0].Rows[0]["Email"]))
                                    {
                                        string body = "From:" + obj + "\n" + "To:" +ds2.Tables[0].Rows[0]["ReceipientName"].ToString() + "\n" + chkHolidaysList.Items[i1].Text.Trim();
                                        objNewJob.SendEmail("Holiday", body, ds2.Tables[0].Rows[0]["Email"].ToString(),null);
                                    }                                                  
                                }
                                DataSet ds4 = GetData("select count(ADate) as Count from Attendance   where Format(ADate,'MM/dd/yyyy')='" + date + "' and Emp_Id='" + uid + "'");
                                if (ds4.Tables[0].Rows[0]["Count"].ToString() == "0" && chkHolidaysList.Items[i1].Selected)
                                {
                                    if (day != "Sunday" && day != "Saturday")
                                    {
                                        string date1 = date + " 10:00:00.000";
                                        bool msg2 = objCat.Insert_Attendance_Details(uid, date1, "1900-01-01 10:00:00.000", "1900-01-01 18:00:00.000", "P");
                                    }
                                }
                            }
                            else
                                Response.Write("<script>alert('Failed')</script>");

                        }
                        else if (chkHolidaysList.Items.FindByValue(HolidayName).Selected == false)
                        {
                            flag = true;
                            string date1 = date + " 10:00:00.000";
                            bool msg1 = objCat.Update_Holiday_Details(txtLoginId.Text, date, "Holiday Pay");
                            bool msg2 = objCat.Delete_Attendance_Details(uid, date1, "1900-01-01 10:00:00.000", "1900-01-01 18:00:00.000");
                        }
                    }
                }
                //}
            }
            if (flag == true)
            {
                Response.Write("<script type = 'text/javascript'>alert('Record is updated');</script>");
                FillEmployeeInformation(Convert.ToInt32(uid));
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }   
    }
    protected void Chk_SetAuditor_CheckedChanged(object sender, EventArgs e)
    {
        if (Chk_SetAuditor.Checked == true)
        {
            objCat.setAuditor(Convert.ToString(Request.QueryString["Uid"]), "check");
        }
        else if (Chk_SetAuditor.Checked == false)
        {
            objCat.setAuditor(Convert.ToString(Request.QueryString["Uid"]), "Notcheck");
        }
    }

    protected void ShowUserTimeDetails_Click(object sender, EventArgs e)
    {
        pnlTimeTypeDetails.Visible = false;
        imgShow.Visible = false;
        imgHide.Visible = true;
    }

    protected void HideUserTimeDetails_Click(object sender, EventArgs e)
    {
        pnlTimeTypeDetails.Visible = true;
        imgShow.Visible = true;
        imgHide.Visible = false;
    }

    protected void ShowUserTimeDetails_Click1(object sender, EventArgs e)
    {
        pnlTypeOfTimeView.Visible = false;
        imgShowView.Visible = false;
        imgHideView.Visible = true;
    }

    protected void HideUserTimeDetails_Click1(object sender, EventArgs e)
    {
        pnlTypeOfTimeView.Visible = true;
        imgShowView.Visible = true;
        imgHideView.Visible = false;
    }

    public void btnPanelShowOccurences_Click(object sender, EventArgs e)
    {


    }
    //public void btn_occurences_cancel_Click(object sender, EventArgs e)
    //{


    //}
    //public void btn_submit_Occurences_Click(object sender, EventArgs e)
    //{
    //    ModalPopupExtender4.Hide();

    //}
    //public void lbtnOccurences_Click(object sender, EventArgs e)
    //{
    //    ModalPopupExtender4.Show();
    //    ModalPopupExtender1.Hide();
       
    //    pnlOccurences.Visible = true; ;
    //    BindOccurenceDetails();
    //}
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int size = 0;
        if (DropDownList1.SelectedItem.Text != "ALL")
        {
            grdOccurences.AllowPaging = true;
            size = int.Parse(DropDownList1.SelectedItem.Value.ToString());
            grdOccurences.PageSize = size;
            // BindDDLManager();
        }
    }

    public void btn_occurences_cancel_Click(object sender, EventArgs e)
    {
    }
    public void BindOccurenceDetails()
    {
        int id=0;
        if (Request.QueryString["Uid"] != null)
        {
            id=Convert.ToInt32(Request.QueryString["Uid"]);
        }
        else
        {
            id=Convert.ToInt32(Request.QueryString["Uid1"]);
        }

        DataTable dt1 = new DataTable();
        Dc_Category objCat = new Dc_Category();
        dt1 = objCat.ViewOccurencesDetails_Admin(id);
        grdOccurences.DataSource = dt1;
        grdOccurences.DataBind();
    }

    protected void grdOccurences_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdOccurences.PageIndex = e.NewPageIndex;
        BindOccurenceDetails();
    }
}
