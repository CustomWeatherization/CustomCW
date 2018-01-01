using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Net;
using System.Web.Services;
using System.Collections.Generic;

public partial class ClientMaster : System.Web.UI.MasterPage
{
    public string StrUserName = "";
    public string ProfileImage = "";
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    smUtil objSm = new smUtil();

    Dc_Category objCat = new Dc_Category();
    int size = 0;
    static string Active = "P";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ViewState["Response"] = "0";
            string UR = Convert.ToString(Request.QueryString["UR"]);
            if (UR == "0" || UR == "1" || UR == "2" || UR == "3")
            {
                HeadIco.Visible = true;
                HrefTimeTrac.Visible = false;
            }
            lnk_adminis.Visible = true;
            span_word.Visible = true;
            lnkUser.Text = objSm.GetCookie("UserName");
            ProfileImage = objSm.GetCookie("Profile_Image");
            if (!IsPostBack)
            {
                string obj = objSm.GetCookie("UserId");
                if (obj == "")
                {
                    Response.Redirect("Login.aspx");
                }
                BindOccurenceDetails();
                ShowPaymentHistory();
                string obj1 = objSm.GetCookie("UsrRegisterId");
                FillEmployeeInformation(Convert.ToInt32(obj1));
            }
            if (ProfileImage != "")
            {
                imgProfileImage.ImageUrl = ProfileImage;
            }
            string role = "";
            role = objSm.GetCookie("Rol_Id");
            if (role == "User")
            {
                lnk_adminis.Visible = true;
                span_word.Visible = true;
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('"+ex.Message+"'</script>");
        }
    }

    


    protected void DDL_Range_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindOccurences();
    }

    public void BindOccurences()
    {
        string obj = objSm.GetCookie("UId");
        int i = Convert.ToInt32(DDL_Range.SelectedValue);
        //GT = "0.00";
        DateTime FilterDate = DateTime.Now;

        string ddlaction = "";

        if (ddlAction.SelectedIndex!= 0)
        {
            ddlaction = ddlAction.SelectedItem.Text;
        }
        else
        {
            ddlaction = "";
        }

        if (DDL_Range.SelectedIndex!=0)//txtFromDateOccur.Text == "" && txtToDateOccur.Text == ""
        {
            if (i != 0 || i != 8)
            {
                int caseSwitch = i;
                switch (caseSwitch)
                {
                    case 1:
                        DataTable dt = objCat.ViewOccurencesDetails_DateTime(obj, "", "", "", "SelectLastDate");
                        if(!DBNull.Value.Equals(dt.Rows[0]["maxdate"]))
                        {
                        DateTime LastAproveDate = Convert.ToDateTime(dt.Rows[0]["maxdate"]);
                        txtFromDateOccur.Text = LastAproveDate.ToString("MM/dd/yyyy");
                        txtToDateOccur.Text = LastAproveDate.ToString("MM/dd/yyyy");
                        CommonFilter(Convert.ToString(LastAproveDate), Convert.ToString(LastAproveDate));
                        }
                        break;
                    case 2:
                        DateTime firstOfThisMonth = new DateTime(FilterDate.Year, FilterDate.Month, 1);
                        int days = DateTime.DaysInMonth(FilterDate.Year, FilterDate.Month);
                        days = days - 1;
                        DateTime lastOfThisMonth = firstOfThisMonth.AddDays(days);
                        txtFromDateOccur.Text = firstOfThisMonth.ToString("MM/dd/yyyy");
                        txtToDateOccur.Text = lastOfThisMonth.ToString("MM/dd/yyyy");
                        CommonFilter(Convert.ToString(firstOfThisMonth), Convert.ToString(lastOfThisMonth));
                        break;
                    case 3:
                        int Month = FilterDate.Month;
                        if (Month == 1 || Month == 2 || Month == 3)
                        {
                            FindFirstQtr();
                        }
                        if (Month == 4 || Month == 5 || Month == 6)
                        {
                            FindSecondQtr();
                        }
                        if (Month == 7 || Month == 8 || Month == 9)
                        {
                            FindThirdQtr();
                        }
                        if (Month == 10 || Month == 11 || Month == 12)
                        {
                            FindFourthQtr();
                        }
                        break;
                    case 4:
                        int year_ = FilterDate.Year;
                        DateTime firstDay_ = new DateTime(year_, 1, 1);
                        DateTime lastDay_ = new DateTime(year_, 12, 31);
                        txtFromDateOccur.Text = firstDay_.ToString("MM/dd/yyyy");
                        txtToDateOccur.Text = lastDay_.ToString("MM/dd/yyyy");
                        CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
                        break;
                    case 5:
                        firstOfThisMonth = new DateTime(FilterDate.Year, FilterDate.Month, 1);
                        firstOfThisMonth = firstOfThisMonth.AddDays(-1);
                        firstOfThisMonth = new DateTime(firstOfThisMonth.Year, firstOfThisMonth.Month, 1);
                        days = DateTime.DaysInMonth(firstOfThisMonth.Year, firstOfThisMonth.Month);
                        days = days - 1;
                        lastOfThisMonth = firstOfThisMonth.AddDays(days);
                        txtFromDateOccur.Text = firstOfThisMonth.ToString("MM/dd/yyyy");
                        txtToDateOccur.Text = lastOfThisMonth.ToString("MM/dd/yyyy");
                        CommonFilter(Convert.ToString(firstOfThisMonth), Convert.ToString(lastOfThisMonth));
                        break;
                    case 6:
                        Month = FilterDate.Month;
                        if (Month == 1 || Month == 2 || Month == 3)
                        {
                            year_ = FilterDate.Year;
                            year_ = year_ - 1;
                            firstDay_ = new DateTime(year_, 10, 1);
                            lastDay_ = new DateTime(year_, 12, 31);
                            txtFromDateOccur.Text = firstDay_.ToString("MM/dd/yyyy");
                            txtToDateOccur.Text = lastDay_.ToString("MM/dd/yyyy");
                            CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
                        }
                        if (Month == 4 || Month == 5 || Month == 6)
                        {
                            FindFirstQtr();
                        }
                        if (Month == 7 || Month == 8 || Month == 9)
                        {
                            FindSecondQtr();
                        }
                        if (Month == 10 || Month == 11 || Month == 12)
                        {
                            FindThirdQtr();
                        }
                        break;
                    case 7:
                        year_ = (FilterDate.Year) - 1;
                        firstDay_ = new DateTime(year_, 1, 1);
                        lastDay_ = new DateTime(year_, 12, 31);
                        txtFromDateOccur.Text = firstDay_.ToString("MM/dd/yyyy");
                        txtToDateOccur.Text = lastDay_.ToString("MM/dd/yyyy");
                        CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
                        break;
                    case 9:
                        FindFirstQtr();
                        break;
                    case 10:
                        FindSecondQtr();
                        break;
                    case 11:
                        FindThirdQtr();
                        break;
                    case 12:
                        FindFourthQtr();
                        break;
                }
            }
        }
        else
        {
            if (DDL_Range.SelectedIndex == 0 && txtFromDateOccur.Text != "" && txtToDateOccur.Text != "")
            {
                CommonFilter(txtFromDateOccur.Text, txtToDateOccur.Text);
            }
            else
            {
                BindOccurenceDetails();
            }
        }
    }

    public void FindFirstQtr()
    {
        DateTime FilterDate = DateTime.Now;
        int year_ = FilterDate.Year;
        DateTime firstDay_ = new DateTime(year_, 1, 1);
        DateTime lastDay_ = new DateTime(year_, 3, 31);
        txtFromDateOccur.Text = firstDay_.ToString("MM/dd/yyyy");
        txtToDateOccur.Text = lastDay_.ToString("MM/dd/yyyy");
        CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
    }
    public void FindSecondQtr()
    {
        DateTime FilterDate = DateTime.Now;
        int year_ = FilterDate.Year;
        DateTime firstDay_ = new DateTime(year_, 4, 1);
        DateTime lastDay_ = new DateTime(year_, 6, 30);
        txtFromDateOccur.Text = firstDay_.ToString("MM/dd/yyyy");
        txtToDateOccur.Text = lastDay_.ToString("MM/dd/yyyy");
        CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
    }
    public void FindThirdQtr()
    {
        DateTime FilterDate = DateTime.Now;
        int year_ = FilterDate.Year;
        DateTime firstDay_ = new DateTime(year_, 7, 1);
        DateTime lastDay_ = new DateTime(year_, 9, 30);
        txtFromDateOccur.Text = firstDay_.ToString("MM/dd/yyyy");
        txtToDateOccur.Text = lastDay_.ToString("MM/dd/yyyy");
        CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
    }
    public void FindFourthQtr()
    {
        DateTime FilterDate = DateTime.Now;
        int year_ = FilterDate.Year;
        DateTime firstDay_ = new DateTime(year_, 10, 1);
        DateTime lastDay_ = new DateTime(year_, 12, 31);
        txtFromDateOccur.Text = firstDay_.ToString("MM/dd/yyyy");
        txtToDateOccur.Text = lastDay_.ToString("MM/dd/yyyy");
        CommonFilter(Convert.ToString(firstDay_), Convert.ToString(lastDay_));
    }


    public void CommonFilter(string fromDate, string ToDate)
    {
        string ddlaction = "";

        if (ddlAction.SelectedIndex != 0)
        {
            ddlaction = ddlAction.SelectedItem.Text;
        }
        else
        {
            ddlaction = "";
        }

        Dc_Category objCat = new Dc_Category();
        string obj = objSm.GetCookie("UId");
        DateTime To_Date = Convert.ToDateTime(ToDate);
        To_Date = To_Date.AddDays(1);
        ToDate = Convert.ToString(To_Date);
        DataTable dt = objCat.ViewOccurencesDetails_DateTime(obj, ddlaction, fromDate, ToDate, "ViewAllOccurencesList");
        grdOccurences.DataSource = dt;
        grdOccurences.DataBind();
        ModalPopupExtender4.Show();
    }
    public void btnShowPopup_Click1(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    public void FillEmployeeInformation(int uid)
    {
        try
        {
            Dc_Category objCat = new Dc_Category();
            DataTable dt = objCat.ShowEmployeeInformation(uid);
            DataSet ds = objCat.ShowRequestTimeOffInfo(uid);
            string obj = objSm.GetCookie("UserId");

            if (dt.Rows.Count > 0)
            {
                lblFirstName.Text = Convert.ToString(dt.Rows[0]["FName"]);
                lblLastName.Text = Convert.ToString(dt.Rows[0]["LName"]);
                if (Convert.ToString(dt.Rows[0]["BirthDate"]) != "")
                {
                    lblBirthDate.Text = Convert.ToDateTime(dt.Rows[0]["BirthDate"]).ToShortDateString();
                }
                else
                {
                    lblBirthDate.Text = "01/01/1900";
                }
                lblPhoneNumber.Text = Convert.ToString(dt.Rows[0]["phone"]);
                txtPhoneNumber.Text = Convert.ToString(dt.Rows[0]["phone"]);
                lblAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
                txtAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
                lblCity.Text = Convert.ToString(dt.Rows[0]["City"]);
                txtCity.Text = Convert.ToString(dt.Rows[0]["City"]);
                lblState.Text = Convert.ToString(dt.Rows[0]["State"]);
                txtState.Text = Convert.ToString(dt.Rows[0]["State"]);
                lblPincode.Text = Convert.ToString(dt.Rows[0]["Zipcode"]);
                txtPincode.Text = Convert.ToString(dt.Rows[0]["Zipcode"]);
                ProfileImage = Convert.ToString(dt.Rows[0]["ProfileImage"]);
                lblEmail.Text = !DBNull.Value.Equals(dt.Rows[0]["Email"]) ? Convert.ToString(dt.Rows[0]["Email"]) : "Not Available";

                lblJoiningDate.Text = !DBNull.Value.Equals(dt.Rows[0]["JoiningDate"]) ? Convert.ToDateTime(dt.Rows[0]["JoiningDate"]).ToShortDateString() : "Not Available";

                lblDesignation.Text = !DBNull.Value.Equals(dt.Rows[0]["JobTitle"]) ? Convert.ToString(dt.Rows[0]["JobTitle"]) : "Not Available";

                if (Convert.ToString(dt.Rows[0]["MaxVacationHours"]) == "" || Convert.ToString(dt.Rows[0]["MaxVacationHours"]) == "0")
                {
                    lblTotalHours.Text = "0 Hr. Taken" + "----" + " " + "0 Hr. Pending -" + " " + "0 Hr. Approved -" + "0 Hr. Available";
                }
                else
                {
                    double PendingHours = 0;
                    double ApproveHours = 0;
                   // double AvailableHours = 0;
                    double MaxVacationHours = 0;

                    PendingHours = !DBNull.Value.Equals(ds.Tables[0].Rows[0]["Pending"]) ? Math.Round(Convert.ToDouble(ds.Tables[0].Rows[0]["Pending"].ToString()), 2) : PendingHours;
                    ApproveHours = !DBNull.Value.Equals(ds.Tables[1].Rows[0]["Approve"]) ? Math.Round(Convert.ToDouble(ds.Tables[1].Rows[0]["Approve"]), 2) : ApproveHours;
                  //  AvailableHours = !DBNull.Value.Equals(ds.Tables[18].Rows[0]["AvilableHours"]) ? Math.Round(Convert.ToDouble(ds.Tables[18].Rows[0]["AvilableHours"]), 2) : AvailableHours;
                    MaxVacationHours = !DBNull.Value.Equals(dt.Rows[0]["MaxVacationHours"]) ? Math.Round(Convert.ToDouble(dt.Rows[0]["MaxVacationHours"].ToString()), 2) : MaxVacationHours;
                    double TotalHours = 0;

                    TotalHours = MaxVacationHours - PendingHours - ApproveHours;
                    //   TotalHours = MaxVacationHours - PendingHours - AvailableHours;
                    if (TotalHours <= 0)
                    {
                        TotalHours = 0;
                    }

                    double TotalHoursTaken = Convert.ToDouble(MaxVacationHours) - TotalHours;

                    lblTotalHours.Text = TotalHoursTaken + " " + "Hr. Taken" + " " + "----" + " " + PendingHours + " " + "Hr. Pending -" + " " + ApproveHours + " " + "Hr. Approved -" + TotalHours + " " + "Hr. Available";
                    lblHolidaySinceJoining.Text = !DBNull.Value.Equals(ds.Tables[2].Rows[0]["HoidayJoining"]) ? Convert.ToString(ds.Tables[2].Rows[0]["HoidayJoining"]) + " " + "Hr." : "0 Hr.";

                    lblHolidayThisYear.Text = !DBNull.Value.Equals(ds.Tables[3].Rows[0]["HolidayThisYear"]) ? Convert.ToString(ds.Tables[3].Rows[0]["HolidayThisYear"]) + " " + "Hr." : "0 Hr.";

                    lblSicknessSinceJoinnig.Text = !DBNull.Value.Equals(ds.Tables[4].Rows[0]["SicknessJoining"]) ? Convert.ToString(ds.Tables[4].Rows[0]["SicknessJoining"]) + " " + "Hr." : "0 Hr.";

                    lblSicknessThisYear.Text = !DBNull.Value.Equals(ds.Tables[5].Rows[0]["SicknessThisYear"]) ? Convert.ToString(ds.Tables[5].Rows[0]["SicknessThisYear"]) + " " + "Hr." : "0 Hr.";

                    lblUnpaidSinceJoining.Text = !DBNull.Value.Equals(ds.Tables[6].Rows[0]["UnpaidLeaveJoining"]) ? Convert.ToString(ds.Tables[6].Rows[0]["UnpaidLeaveJoining"]) + " " + "Hr." : "0 Hr.";

                    lblUnpaidThisYear.Text = !DBNull.Value.Equals(ds.Tables[7].Rows[0]["UnpaidLeaveThisYear"]) ? Convert.ToString(ds.Tables[7].Rows[0]["UnpaidLeaveThisYear"]) + " " + "Hr." : "0 Hr.";

                    lblEmergencyPaidTimeOffSinceJoin.Text = !DBNull.Value.Equals(ds.Tables[8].Rows[0]["EmergencyPaidTimeOffJoining"]) ? Convert.ToString(ds.Tables[8].Rows[0]["EmergencyPaidTimeOffJoining"]) + " " + "Hr." : "0 Hr.";

                    lblEmergencyPaidTimeOffThisYear.Text = !DBNull.Value.Equals(ds.Tables[9].Rows[0]["EmergencyPaidTimeOffThisYear"]) ? Convert.ToString(ds.Tables[9].Rows[0]["EmergencyPaidTimeOffThisYear"]) + " " + "Hr." : "0 Hr.";

                    lblEmergencyTimeOffSinceJoin.Text = !DBNull.Value.Equals(ds.Tables[10].Rows[0]["EmergencyTimeOffJoining"]) ? Convert.ToString(ds.Tables[10].Rows[0]["EmergencyTimeOffJoining"]) + " " + "Hr." : "0 Hr.";

                    lblEmergencyTimeOffThisYear.Text = !DBNull.Value.Equals(ds.Tables[11].Rows[0]["EmergencyTimeOffThisYear"]) ? Convert.ToString(ds.Tables[11].Rows[0]["EmergencyTimeOffThisYear"]) + " " + "Hr." : "0 Hr.";

                    //  lblHolidayPaySinceJoin.Text = !DBNull.Value.Equals(ds.Tables[12].Rows[0]["HolidayPayJoining"]) ? Convert.ToString(ds.Tables[12].Rows[0]["HolidayPayJoining"]) + " " : "0";
                    lblHolidayPaySinceJoin.Text = !DBNull.Value.Equals(ds.Tables[21].Rows[0]["DayJoining"]) ? Convert.ToString(ds.Tables[21].Rows[0]["DayJoining"]) : "0";
                    lblHolidayPayThisYear.Text = !DBNull.Value.Equals(ds.Tables[20].Rows[0]["DayThisYear"]) ? Convert.ToString(ds.Tables[20].Rows[0]["DayThisYear"]) : "0";
                    lblUnpaidSicknessSinceJoinning.Text = !DBNull.Value.Equals(ds.Tables[16].Rows[0]["UnpaidSicknessJoining"]) ? Convert.ToString(ds.Tables[16].Rows[0]["UnpaidSicknessJoining"]) + " " + "Hr." : "0 Hr.";

                    lblUnpaidSicknessThisYear.Text = !DBNull.Value.Equals(ds.Tables[17].Rows[0]["UnpaidSicknessThisYear"]) ? Convert.ToString(ds.Tables[17].Rows[0]["UnpaidSicknessThisYear"]) + " " + "Hr." : "0 Hr.";

                }

      
                lblOccurencesSinceJoinng.Text = !DBNull.Value.Equals(ds.Tables[14].Rows[0]["OccurencesJoining"]) ? Convert.ToString(ds.Tables[14].Rows[0]["OccurencesJoining"]) : "0";

                lblOccurencesThisYear.Text = !DBNull.Value.Equals(ds.Tables[15].Rows[0]["OccurencesThisYear"]) ? Convert.ToString(ds.Tables[15].Rows[0]["OccurencesThisYear"]) : "0";

              
                if (Convert.ToString(dt.Rows[0]["Salary"]) == "")
                {
                    lblSalary.Text = "Not Available";
                }
                else
                {
                    int salary = Convert.ToInt32(dt.Rows[0]["Salary"].ToString());
                    lblSalary.Text = String.Format("{0:C}", salary) + "/Yr.";
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
                                chkHolidaysList.Items.FindByValue(HolidayName).Selected = true;
                                chkHolidaysList.Items.FindByValue(HolidayName).Attributes.Add("style", "display:inline-block");
                            }
                        }
                    }
                }
                chkHolidaysList.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
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

    public void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            smUtil objsmutil = new smUtil();
            string profileImage = "";
            //if (profileUpload.HasFile)
            //{
            //    string str = profileUpload.FileName;

            //    string subPath = "~/Admin/Upload/"; // your code goes here
            //    profileImage = subPath + str;
            //    bool exists = System.IO.Directory.Exists(Server.MapPath(subPath));

            //    if (!exists)
            //    {
            //        System.IO.Directory.CreateDirectory(Server.MapPath(subPath));
            //    }
            //    //else
            //    //{
            //    //    System.IO.File.Delete(Server.MapPath(profileImage));
            //    //}
            //    profileUpload.PostedFile.SaveAs(Server.MapPath(profileImage));
            //    //  profileImage = "Upload/" + str.ToString();
            //    //   profileImage = image;
            //}
            //else
            //{
            //    profileImage=imgProfilePanel.ImageUrl;
            //}

            objsmutil.SetCookie("Profile_Image", profileImage);

            string obj = objSm.GetCookie("UserId");

            Dc_Category objCat = new Dc_Category();

            bool msg = objCat.Update_User_details(obj, txtPhoneNumber.Text, txtAddress.Text, txtCity.Text, txtState.Text, txtPincode.Text);//, txt_add.Text, txt_city.Text, txt_state.Text, txt_zip.Text

            if (msg == true)
            {
                Response.Write("<script>alert('Update Successfully.')</script>");
                ModalPopupExtender1.Hide();
            }
            else
                Response.Write("<script>alert('Failed')</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {
        try
        {
            string UID = "";
            smUtil objSm = new smUtil();
            UID = objSm.GetCookie("AId");
            string obj = objSm.GetCookie("UserId");
            bool IsValid = objNewJob.CheckPasscode(Convert.ToInt32(txt_pwd.Text), obj);
            Session["Passcode"] = txt_pwd.Text;
            if (IsValid)
            {
                ModalPopupExtender5.Show();
                Table3.Style.Add("display", "none");
                txt_pwd.Text = "";
            }
            else
            {
                txt_pwd.Text = "";
                P1.Style.Add("display", "block");
                Table3.Style.Add("display", "block");
                lblErMsg.Text = "Please enter valid passcode !!";
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        //data side logout
        objSm.DeleteCookie("AdminID");
        objSm.DeleteCookie("Admin_Name");
        objSm.DeleteCookie("Admin_Pass");
        //end
        objSm.DeleteCookie("UId");
        objSm.DeleteCookie("UserId");
        objSm.DeleteCookie("UserName");
        objSm.DeleteCookie("Rol_Id");
        Response.Redirect("Login.aspx");
    }
    protected void lnk_adminis_Click(object sender, EventArgs e)
    {
        string role = "";
        role = objSm.GetCookie("Rol_Id");

        if (role == "Admin" || role == "Usr_Adm")
            Response.Redirect("admin/Admin_Unfinalize.aspx");

        else
            Response.Write("<script>alert('You do not have to Access Administer Database');</script>");
    }
    public void btnSumitRequestTime_Click(object sender, EventArgs e)
    {
        try
        {
            smUtil objSm = new smUtil();
            string obj = objSm.GetCookie("UserId");
            Dc_Category objCat = new Dc_Category();
            string fromTime = "";
            string toTime = "";
            bool flag = false;
            double totalhours = 0.00;
            string obj1 = objSm.GetCookie("UsrRegisterId");
            if (ddlFromTime.SelectedItem.Text != "Select From Time")
            {
                fromTime = ddlFromTime.SelectedItem.Text;
            }

            if (ddlToTime.SelectedItem.Text != "Select To Time")
            {
                toTime = ddlToTime.SelectedItem.Text;
            }
            double TotalHours = 0.0;

            if (txtFromDate.Text != txtToDate.Text)
            {
                double totaldays = (Convert.ToDateTime(txtToDate.Text) - Convert.ToDateTime(txtFromDate.Text)).TotalDays;

                TotalHours = (totaldays + 1) * 8;
                totalhours = TotalHours;
            }
            else
            {

                if (DateTime.Parse(fromTime) > DateTime.Parse(toTime))
                {
                    TimeSpan duration = DateTime.Parse(fromTime).Subtract(DateTime.Parse(toTime));
                }
                else
                {
                    TimeSpan duration = DateTime.Parse(toTime).Subtract(DateTime.Parse(fromTime));
                    string ddd1 = DateTime.Parse(toTime).Subtract(DateTime.Parse(fromTime)).TotalMinutes.ToString();
                    totalhours = Math.Round(Convert.ToDouble(ddd1));
                    totalhours = totalhours / 60;
                }
            }
            DataSet ds5 = new DataSet();
            ds5 = GetData("SELECT Count(ID) as CountID FROM EmployeeLeave WHERE  CAST('" + Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd") + "' AS DATE) >= FromDate  AND  CAST('" + Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd") + "' AS DATE) <= ToDate  and LoginID='" + obj + "'");

            if (txtFromDate.Text == txtToDate.Text && totalhours > Convert.ToDouble("08.00"))
            {
                Response.Write("<script>alert('Sorry but you can not exceed an 8 hour work day');</script>");
                ModalPopupExtender2.Hide();
                ModalPopupExtender1.Show();
            }
            else if (ds5.Tables[0].Rows[0]["CountID"].ToString() == "0")
            {
                TotalHours = totalhours;
                DataSet ds1 = new DataSet();
                ds1 = GetData("select sum(TotalHours) as TotalHours from  EmployeeLeave EI where LoginID='" + obj + "' and Status in ('Pending','Approve') and TypeOfRequesteType not in ('Unpaid','Unpaid Sickness','Emergency Paid Time Off','Holiday Pay') ");

                DataSet ds2 = new DataSet();
                ds2 = GetData("select U1.ID as Sender,U2.ID as Recipient,UR.MaxVacationHours,U1.CWLogin as ReceipientName,U2.CWLogin as SenderName from User_registration UR inner join Users U1 on U1.CWLogin=UR.Login inner join Users U2 on U2.CWLogin=UR.Manager where UR.Login='" + obj + "' ");
               
                DataSet ds3 = new DataSet();
                ds3 = GetData("select Email,Login from  User_registration where Login=(select Manager from User_registration where Login='" + obj + "' )");
            
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    if (Convert.ToString(ds2.Tables[0].Rows[0]["MaxVacationHours"]) != "")
                    {
                        if ((ddlTypeOfRequested.SelectedItem.Text == "Emergency Paid Time Off" || ddlTypeOfRequested.SelectedItem.Text == "Emergency Time Off") && txtComments.Text == "")
                        {
                            Response.Write("<script>alert('Please Enter The Comment...!')</script>");
                            ModalPopupExtender2.Show();
                            pnlRequestTimeOff.Visible = true;
                        }
                        else
                        {
                            double TotalCountMaxHours = 0.0;
                            if (Convert.ToString(ds1.Tables[0].Rows[0]["TotalHours"]) != "")
                            {
                                TotalCountMaxHours = Convert.ToDouble(ds1.Tables[0].Rows[0]["TotalHours"]) + TotalHours;
                            }
                            else
                            {
                                TotalCountMaxHours = TotalHours;
                            }

                            if (ddlTypeOfRequested.SelectedItem.Text == "Unpaid" || ddlTypeOfRequested.SelectedItem.Text == "Emergency Paid Time Off" || ddlTypeOfRequested.SelectedItem.Text == "Unpaid Sickness")
                            {
                                flag = true;
                            }
                            else if (TotalCountMaxHours <= Convert.ToDouble(ds2.Tables[0].Rows[0]["MaxVacationHours"]))
                            {
                                flag = true;
                            }
                            else
                            {
                                flag = false;
                            }
                            if (flag == true)
                            {
                                bool msg = objCat.Add_RequestTimeOff_Details(obj, txtFromDate.Text, txtToDate.Text, fromTime, toTime, ddlTypeOfRequested.SelectedItem.Text, txtComments.Text, TotalHours, "Pending");//, txt_add.Text, txt_city.Text, txt_state.Text, txt_zip.Text

                                if (msg == true)
                                {
                                    Response.Write("<script>alert('Request Submit Successfully.')</script>");

                                    ModalPopupExtender1.Hide();
                                    ModalPopupExtender2.Hide();
                                    txtFromDate.Text = "";
                                    txtToDate.Text = "";

                                    if (ds2.Tables[0].Rows[0]["Recipient"] != "")
                                    {
                                        ModalPopupExtender2.Hide();
                                        string msgToSend = string.Empty;
                                        int msgId = 0;
                                        string objUserName = objSm.GetCookie("UserId");
                                        msgId = objNewJob.InsertJobMessage(txtComments.Text);
                                        objNewJob.InsertJobMessageReadUnread2(Convert.ToInt32(ds2.Tables[0].Rows[0]["Sender"]), Convert.ToInt32(ds2.Tables[0].Rows[0]["Recipient"]), "0", msgId, "U", null, null, null, null, null, null, null, "R", ddlTypeOfRequested.SelectedItem.Text);
                                        if (!DBNull.Value.Equals(ds3.Tables[0].Rows[0]["Email"]))
                                        {
                                            string body = "From:" + obj + "\n" + "To:" + ds2.Tables[0].Rows[0]["SenderName"].ToString() + "\n" + txtComments.Text;
                                          objNewJob.SendEmail(ddlTypeOfRequested.SelectedItem.Text, body, ds3.Tables[0].Rows[0]["Email"].ToString(),null);
                                        }
                                    }
                                    ddlTypeOfRequested.SelectedIndex = 0;
                                    ddlFromTime.SelectedIndex = 0;
                                    ddlToTime.SelectedIndex = 0;
                                    FillEmployeeInformation(Convert.ToInt32(obj1));
                                }
                                else
                                    Response.Write("<script>alert('Failed')</script>");
                                ModalPopupExtender2.Hide();
                                ModalPopupExtender1.Show();
                            }
                            else
                            {
                                Response.Write("<script>alert('Your selection has exceeded the maximum hours allowed.')</script>");
                                ModalPopupExtender2.Hide();
                                ModalPopupExtender1.Show();
                            }
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Max vacation Hours not set please contact to admin.')</script>");
                        ModalPopupExtender2.Hide();
                        ModalPopupExtender1.Show();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Manager not Add User please contact to admin.')</script>");
                    ModalPopupExtender2.Hide();
                    ModalPopupExtender1.Show();
                }
            }
            else
            {
                Response.Write("<script>alert('Sorry these days were already selected.')</script>");
                ModalPopupExtender2.Hide();
                ModalPopupExtender1.Show();
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }

    protected static bool SetVisibility(object Desc, int length)
    {
        return Desc.ToString().Length > length;
    }

    protected void ReadMoreLinkButton_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton button = (LinkButton)sender;
            GridViewRow row = button.NamingContainer as GridViewRow;
            Label descLabel = row.FindControl("lblDescription") as Label;
            LinkButton lblReadMore = row.FindControl("lblReadMore") as LinkButton;
            if (lblReadMore.Text == "..Read More")
            {
                lblReadMore.Text = "Hide";
            }
            else if (lblReadMore.Text == "Hide")
            {
                lblReadMore.Text = "..Read More";
            }
            ModalPopupExtender4.Show();
            string temp = descLabel.Text;
            descLabel.Text = descLabel.ToolTip;
            descLabel.ToolTip = temp;
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }



    protected void grdOccurences_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblNeedSign = (Label)e.Row.FindControl("NeedToSign");
                Label lblResponseStatus = (Label)e.Row.FindControl("lblResponseStatus");
                LinkButton lbtnAccept = (LinkButton)e.Row.FindControl("lnkbtnAccept");
                ImageButton lnkPdf = (ImageButton)e.Row.FindControl("lnk_Edit");
                if (lblNeedSign.Text == "True" && (lblResponseStatus.Text == "False" || lblResponseStatus.Text == ""))
                {
                    lbtnAccept.Visible = true;
                    lnkPdf.Visible = false;
                }
                else
                {
                    lnkPdf.Visible = true;
                    lbtnAccept.Visible = false;

                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }

    protected void grdOccurences_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int Id = Convert.ToInt32(grdOccurences.DataKeys[e.RowIndex].Value.ToString());
            Label lblResponseStatus = grdOccurences.Rows[e.RowIndex].FindControl("lblResponseStatus") as Label;           
            DownloadPDF(Id);           
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }

    }
    public void DownloadPDF(int id)
    {
        try
        {          
            DataTable dt = objCat.showOccurencesById(id);
            string sign = "";
            if (dt.Rows[0]["NeedToSign"].ToString() == "False")
            {
                sign = "N";
            }
            else
            {
                sign = "Y";
            }
            if (dt.Rows.Count > 0)
            {
                string HTMLContent = "<b><h3>                                             Custom Weatherization, LLC</h3></b> <h3><b>                                                      Occurrence Form</b></h3><br/><br/><b>Employee Name: </b>" + dt.Rows[0]["EmployeeName"].ToString() + "                                                                  <b>           Date: </b>" + Convert.ToDateTime(dt.Rows[0]["Date"]).ToShortDateString() + "<br/><br/><b>Narrative:</b><br/><u>" + dt.Rows[0]["Narrative"].ToString() + "</u><br/><br/><h3><b>                                            For Administration Use Only</b></h3><br/><br/><b>Supervisor Assigned: </b>" + dt.Rows[0]["ManagerName"].ToString() + "<br/><br/><b>Action Taken: </b>" + dt.Rows[0]["ActionTaken"].ToString() + "<br/><br/><b>Signature of Employee: </b>" + sign + "             <b>Pin: </b>" + dt.Rows[0]["PassCode"].ToString() + "                     <b>Date Signed: </b>" + dt.Rows[0]["ResponseDate"].ToString() + " <br/><br/><b>Response: </b><br/><u>" + dt.Rows[0]["Response"].ToString() + "</u>";
                Response.Clear();
                string path = "OccurrenceForm.pdf";
                Response.ContentType = "application/pdf";
                Response.AppendHeader("content-disposition", "attachment;filename=" + path);
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(GetPDF(HTMLContent));
                Response.End();
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }

    public byte[] GetPDF(string pHTML)
    {      
            byte[] bPDF = null;
            MemoryStream ms = new MemoryStream();
            TextReader txtReader = new StringReader(pHTML);
            Document doc = new Document(PageSize.A4, 25, 25, 25, 25);
            PdfWriter oPdfWriter = PdfWriter.GetInstance(doc, ms);
            HTMLWorker htmlWorker = new HTMLWorker(doc);
            doc.Open();
            htmlWorker.StartDocument();
            htmlWorker.Parse(txtReader);
            htmlWorker.EndDocument();
            htmlWorker.Close();
            doc.Close();
            bPDF = ms.ToArray();
            return bPDF;       
    }


    protected static string Limit(object Desc, int length)
    {
        var descStr = Desc.ToString();
        if (descStr.Length > 45)
            return descStr.Substring(0, length);
        else
            return descStr;
    }

    public void btnPanelShowOff_Click1(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    public void ShowPaymentHistory()
    {
        try
        {
            Dc_Category objCat = new Dc_Category();
            string obj = objSm.GetCookie("UsrRegisterId");
            DataTable dt1 = new DataTable();
            dt1 = objCat.ShowPaymentHistory(obj);
            grdPaymentHistory.DataSource = dt1;
            grdPaymentHistory.DataBind();
            ModalPopupExtender1.Hide();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }

    protected void grdPaymentHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            grdPaymentHistory.PageIndex = e.NewPageIndex;
            ShowPaymentHistory();
            ModalPopupExtender3.Show();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }

    public void btnHoliday_Click(object sender, EventArgs e)
    {

    }

  
    public void lnkEmergencyPaid_Click(object sender, EventArgs e)
    {
        grdApproved("Emergency Paid Time Off");
        ModalPopupExtender6.Show();
        ddlRequestType.SelectedValue = ddlRequestType.Items.FindByText("Emergency Paid Time Off").Value;
        Active = "A";
    }
    public void lnkEmergencyTime_Click(object sender, EventArgs e)
    {
        grdApproved("Emergency Time Off");
        ModalPopupExtender6.Show();
        ddlRequestType.SelectedValue = ddlRequestType.Items.FindByText("Emergency Time Off").Value;
        Active = "A";
    }
    public void lnkSickness_Click(object sender, EventArgs e)
    {
        grdApproved("Sickness");
        ModalPopupExtender6.Show();
        ddlRequestType.SelectedValue = ddlRequestType.Items.FindByText("Sickness").Value;
        Active = "A";
    }
    public void lnkUnpaid_Click(object sender, EventArgs e)
    {
        grdApproved("Unpaid");
        ModalPopupExtender6.Show();
        ddlRequestType.SelectedValue = ddlRequestType.Items.FindByText("Unpaid").Value;
        Active = "A";
    }
    public void lnkUnpaidSickness_Click(object sender, EventArgs e)
    {
        grdApproved("Unpaid Sickness");
        ModalPopupExtender6.Show();
        ddlRequestType.SelectedValue = ddlRequestType.Items.FindByText("Unpaid Sickness").Value;
        Active = "A";
    }
    public void lnkVacation_Click(object sender, EventArgs e)
    {
        grdApproved("Vacation");
        ModalPopupExtender6.Show();
        ddlRequestType.SelectedValue = ddlRequestType.Items.FindByText("Vacation").Value;
        Active = "A";
    }

    public void btnPanelShowOccurences_Click(object sender, EventArgs e)
    {
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        int size = 0;
        if (DropDownList2.SelectedItem.Text != "ALL")
        {
            gvVacationDetails.AllowPaging = true;
            size = int.Parse(DropDownList2.SelectedItem.Value.ToString());
            gvVacationDetails.PageSize = size;
        }
        BindOccurenceDetails();
        ModalPopupExtender6.Show();
    }

    public void BindOccurenceDetails()
    {
        try
        {
            string obj = objSm.GetCookie("UserId");

            DataTable dt1 = new DataTable();
            Dc_Category objCat = new Dc_Category();
            dt1 = objCat.ViewOccurencesDetails_User(obj);
            grdOccurences.DataSource = dt1;
            grdOccurences.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }
    
    protected void grdOccurences_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdOccurences.PageIndex = e.NewPageIndex;
           BindOccurences();
      
        ModalPopupExtender4.Show();
    }
    protected void ddlRequestType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string requestType = ddlRequestType.SelectedItem.Text;
        string obj = objSm.GetCookie("UserId");
        DataTable dt1 = new DataTable();
        if (Active == "P")
        {
            grdPending();
        }
        else if (Active == "A")
        {
            grdApproved(requestType);
        }
        else if (Active == "R")
        {
            grdRejected();
        }
        ModalPopupExtender6.Show();
    }

    public void grdPending()
    {
        string requestType = ddlRequestType.SelectedItem.Text;
        string obj = objSm.GetCookie("UserId");
        DataTable dt1 = new DataTable();
        dt1 = objCat.ViewVacationDetails(obj, "View_Pending", requestType);
        gvVacationDetails.DataSource = dt1;
        gvVacationDetails.DataBind();
        gvVacationDetails.Columns[9].Visible = false;
        gvVacationDetails.Columns[10].Visible = false;
        gvVacationDetails.Columns[11].Visible = false;
    }


    public void grdApproved(string RequestType)
    {
        string obj = objSm.GetCookie("UserId");
        DataTable dt1 = new DataTable();

        dt1 = objCat.ViewVacationDetails(obj, "View_Approve_UserId", RequestType);

        gvVacationDetails.DataSource = dt1;
        gvVacationDetails.DataBind();
        double count = 0;
        for (int i = 0; i < dt1.Rows.Count; i++)
        {
            if (dt1.Rows[i]["TotalHours"] != "")
            {
                count = count + Convert.ToDouble(dt1.Rows[i]["TotalHours"].ToString());
            }
        }

        lbl_GrandTotal.Text = Convert.ToString(count) + " " + "Hr.";
        gvVacationDetails.Columns[9].Visible = false;
        gvVacationDetails.Columns[10].Visible = true;
        gvVacationDetails.Columns[11].Visible = false;
    }

    public void grdRejected()
    {
        try
        {
            string requestType = ddlRequestType.SelectedItem.Text;

            string obj = objSm.GetCookie("UserId");
            DataTable dt1 = new DataTable();

            dt1 = objCat.ViewVacationDetails(obj, "View_Reject", requestType);

            gvVacationDetails.DataSource = dt1;
            gvVacationDetails.DataBind();
            gvVacationDetails.Columns[9].Visible = true;
            gvVacationDetails.Columns[10].Visible = false;
            gvVacationDetails.Columns[11].Visible = true;
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }


    protected void gvVacationDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvVacationDetails.PageIndex = e.NewPageIndex;
        if (Active == "P")
        {
            grdPending();

        }
        else if (Active == "A")
        {
            grdApproved(ddlRequestType.SelectedItem.Text);

        }
        else if (Active == "R")
        {
            grdRejected();
        }
    }


    protected void grdOccurences_UpdateRow(object sender, EventArgs e)
    {
        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        int id = Convert.ToInt32(grdOccurences.DataKeys[rowIndex].Values[0]);
        Session["Response"] = id;
    }

    public void btn_submit_Occur_Click(object sender, EventArgs e)
    {
        try
        {
            smUtil objSm = new smUtil();
            string obj = objSm.GetCookie("UserId");
            string aaa = hdnDatakeyValue.Value;
            if (hdnDatakeyValue.Value != "")
            {
                int responseid = Convert.ToInt32(hdnDatakeyValue.Value);
                if (Session["Passcode"] != null)
                {
                    objNewJob.UpdateResponseMessage(txtResponse.Text, responseid, DateTime.Now.ToString(), Convert.ToInt32(Session["Passcode"].ToString()), true);
                }
                else
                {
                    objNewJob.UpdateResponseMessage(txtResponse.Text, responseid, DateTime.Now.ToString(), Convert.ToInt32(null), true);

                }
                DataSet ds2 = new DataSet();
                ds2 = GetData("select U1.ID as Sender,U2.ID as Recipient,UR.MaxVacationHours,UR.Email as Email,U1.CWLogin as ReceipientName,U2.CWLogin as SenderName from User_registration UR inner join Users U1 on U1.CWLogin=UR.Login inner join Users U2 on U2.CWLogin=UR.Manager where UR.Login='" + obj + "' ");
                DataSet ds3 = new DataSet();
                ds3 = GetData("select Email from  User_registration where Login=(select Manager from User_registration where Login='" + obj + "' )");
               
                string msgToSend = string.Empty;
                int msgId = 0;
                string objUserName = objSm.GetCookie("UserId");
                msgId = objNewJob.InsertJobMessage(txtResponse.Text);
                objNewJob.InsertJobMessageReadUnread2(Convert.ToInt32(ds2.Tables[0].Rows[0]["Sender"]), Convert.ToInt32(ds2.Tables[0].Rows[0]["Recipient"]), "0", msgId, "U", null, null, null, null, null, null, null, "OA", null);
                if (!DBNull.Value.Equals(ds3.Tables[0].Rows[0]["Email"]))
                {
                    string body = "From:" + obj + "\n" + "To:" + ds2.Tables[0].Rows[0]["SenderName"].ToString() + "\n" + txtResponse.Text;
                    objNewJob.SendEmail("Occurrence Accept", body, ds3.Tables[0].Rows[0]["Email"].ToString(), null);
                }
                Session["Passcode"] = null;
                Response.Write("<script>alert('Response Update Successfully.')</script>");
                BindOccurenceDetails();

            }
            else
            {
                Response.Write("<script>alert('Something went wrong.')</script>");
            }
            ModalPopupExtender4.Show();
            txtResponse.Text = "";
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
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
            HolidayList.Add(new Holiday("NewYears", new DateTime(vYear, 01, 01)));
            // Martin Luther King, Jr. third Mon in Jan
            HolidayList.Add(new Holiday("MLK", GetNthDayOfNthWeek(new DateTime(vYear, 01, 01), DayOfWeek.Monday, ThirdWeek)));
            // Washington's Birthday third Mon in Feb
            //  HolidayList.Add(new Holiday("WashingtonsBDay", GetNthDayOfNthWeek(new DateTime(vYear, 2, 1), DayOfWeek.Monday, ThirdWeek)));
            // Memorial Day          last Mon in May
            HolidayList.Add(new Holiday("MemorialDay", GetNthDayOfNthWeek(new DateTime(vYear, 05, 01), DayOfWeek.Monday, LastWeek)));
            // Independence Day      July 4
            HolidayList.Add(new Holiday("IndependenceDay", new DateTime(vYear, 07, 04)));
            // Labor Day             first Mon in Sept
            HolidayList.Add(new Holiday("LaborDay", GetNthDayOfNthWeek(new DateTime(vYear, 09, 01), DayOfWeek.Monday, FirstWeek)));
            // Columbus Day          second Mon in Oct
            HolidayList.Add(new Holiday("Columbus", GetNthDayOfNthWeek(new DateTime(vYear, 10, 01), DayOfWeek.Monday, SecondWeek)));
            // Veterans Day          Nov 11
            HolidayList.Add(new Holiday("Veterans", new DateTime(vYear, 11, 11)));
            // Thanksgiving Day      fourth Thur in Nov
            HolidayList.Add(new Holiday("Thanksgiving", GetNthDayOfNthWeek(new DateTime(vYear, 11, 01), DayOfWeek.Thursday, FourthWeek)));
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
        }                //return
        return dtRet;
    }


    public void btn_Search_Click(object sender, EventArgs e)
    {
        try
        {
            string ddlaction = "";

            if (ddlAction.SelectedIndex != 0)
            {
                ddlaction = ddlAction.SelectedItem.Text;
            }
            else
            {
                ddlaction = "";
            }
            string obj = objSm.GetCookie("UId");
            DDL_Range.SelectedIndex = 0;
            DataTable dt1 = new DataTable();
            Dc_Category objCat = new Dc_Category();
            dt1 = objCat.ViewOccurencesDetails_DateTime(obj, ddlaction, txtFromDateOccur.Text, txtToDateOccur.Text, "ViewAllOccurencesList");//ViewOccurencesDetails_DateTime
            grdOccurences.DataSource = dt1;
            grdOccurences.DataBind();
            ModalPopupExtender4.Show();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "'</script>");
        }
    }

    public void lbtnOccurences_Click(object sender, EventArgs e)
    {
        ModalPopupExtender4.Show();
        ModalPopupExtender1.Hide();
        ModalPopupExtender2.Hide();
        ModalPopupExtender3.Hide();
        pnlOccurences.Visible = true;
        BindOccurenceDetails();
        txtToDateOccur.Text = "";
        txtFromDateOccur.Text = "";
       DDL_Range.SelectedIndex = 0;
       ddlAction.SelectedIndex = 0;
    }

    //protected void DDL_Range_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string obj = objSm.GetCookie("UId");
    //    DataTable dt1 = new DataTable();
    //    Dc_Category objCat = new Dc_Category();

    //    DateTime FilterDate = DateTime.Now;
    //    int year_ = FilterDate.Year;
    //    DateTime firstDay_ = DateTime.Now;
    //    DateTime lastDay_ = DateTime.Now;
    //     string range;
    //     range = DDL_Range.SelectedItem.Text;
    //     int Month = FilterDate.Month;
    //     if (Month == 1 || Month == 2 || Month == 3)
    //     {
    //         firstDay_ = new DateTime(year_, 1, 1);
    //         lastDay_ = new DateTime(year_, 3, 31);
    //     }
    //     if (Month == 4 || Month == 5 || Month == 6)
    //     {
    //         firstDay_ = new DateTime(year_, 4, 1);
    //         lastDay_ = new DateTime(year_, 6, 30);
    //     }
    //     if (Month == 7 || Month == 8 || Month == 9)
    //     {
    //         firstDay_ = new DateTime(year_, 7, 1);
    //         lastDay_ = new DateTime(year_, 9, 30);
    //     }
    //     if (Month == 10 || Month == 11 || Month == 12)
    //     {
    //         firstDay_ = new DateTime(year_, 10, 1);
    //         lastDay_ = new DateTime(year_, 12, 31);
    //     }
    //   // ddlAction.SelectedItem.Text
    //     switch (range)
    //    {
    //        case "Last Date":

    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj,"", txtFromDateOccur.Text, txtToDateOccur.Text, "Last_Date");
    //            break;
    //        case "This Month":
    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj, "", txtFromDateOccur.Text, txtToDateOccur.Text, "This_Month");
    //            break;
    //        case "This Qtr":              
    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj, "", firstDay_.ToString(), lastDay_.ToString(), "This_Qtr");
    //            break;
    //        case "This Year":
    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj, "", txtFromDateOccur.Text, txtToDateOccur.Text, "This_Year");
    //            break;
    //        case "Last Month":
    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj, "", txtFromDateOccur.Text, txtToDateOccur.Text, "Last_Month");
    //            break;
    //        case "Last Qtr":
    //            Month = FilterDate.Month;
    //            if (Month == 1 || Month == 2 || Month == 3)
    //            {
    //                year_ = FilterDate.Year;
    //                year_ = year_ - 1;
    //                firstDay_ = new DateTime(year_, 10, 1);
    //                lastDay_ = new DateTime(year_, 12, 31);
    //            }
    //            if (Month == 4 || Month == 5 || Month == 6)
    //            {
    //                firstDay_ = new DateTime(year_, 1, 1);
    //                lastDay_ = new DateTime(year_, 3, 31);
    //            }
    //            if (Month == 7 || Month == 8 || Month == 9)
    //            {
    //                firstDay_ = new DateTime(year_, 4, 1);
    //                lastDay_ = new DateTime(year_, 6, 30);
    //            }
    //            if (Month == 10 || Month == 11 || Month == 12)
    //            {
    //                firstDay_ = new DateTime(year_, 7, 1);
    //                lastDay_ = new DateTime(year_, 9, 30);
    //            }
    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj, "", firstDay_.ToString(), lastDay_.ToString(), "Last_Qtr");
    //            break;

    //        case "Last Year":
    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj,"", txtFromDateOccur.Text, txtToDateOccur.Text, "Last_Year");
    //            break;        
    //        case "First Qtr":
    //            firstDay_ = new DateTime(year_, 1, 1);
    //            lastDay_ = new DateTime(year_, 3, 31);
    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj, "", firstDay_.ToString(), lastDay_.ToString(), "First_Qtr");
    //            break;
    //        case "Second Qtr":
    //            firstDay_ = new DateTime(year_, 4, 1);
    //            lastDay_ = new DateTime(year_, 6, 30);
    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj,"", firstDay_.ToString(), lastDay_.ToString(), "Second_Qtr");
    //            break;
    //        case "Third Qtr":
    //            firstDay_ = new DateTime(year_, 7, 1);
    //            lastDay_ = new DateTime(year_, 9, 30);
    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj,"", firstDay_.ToString(), lastDay_.ToString(), "Third_Qtr");
    //            break;
    //        case "Fourth Qtr":
    //            firstDay_ = new DateTime(year_, 10, 1);
    //            lastDay_ = new DateTime(year_, 12, 31);
    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj, "", firstDay_.ToString(), lastDay_.ToString(), "Fourth_Qtr");
    //            break;
    //        default:
    //            dt1 = objCat.ViewOccurencesDetails_DateTime(obj,"", txtFromDateOccur.Text, txtToDateOccur.Text, "ViewOccurences_All");

    //            Response.Write("<script>alert('Please make a selection!');</script>");
    //            break;
    //    }

    //     grdOccurences.DataSource = dt1;
    //     grdOccurences.DataBind();
    //     ModalPopupExtender4.Show();
    //}

    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int size = 0;
    //    if (DropDownList1.SelectedItem.Text != "ALL")
    //    {
    //        grdOccurences.AllowPaging = true;
    //        size = int.Parse(DropDownList1.SelectedItem.Value.ToString());
    //        grdOccurences.PageSize = size;
    //    }
    //    ModalPopupExtender4.Show();
    //}
    //public void btnSubmitHolidays_Click(object sender, EventArgs e)
    //{

    //      var holidays = getHolidayList(DateTime.Now.Year);
    //    string obj = objSm.GetCookie("UserId");
    //    string obj1 = objSm.GetCookie("UsrRegisterId");
    //    DataSet ds2 = new DataSet();
    //    ds2 = GetData("select U1.ID as Sender,U2.ID as Recipient,UR.MaxVacationHours from User_registration UR inner join Users U1 on U1.CWLogin=UR.Login inner join Users U2 on U2.CWLogin=UR.Manager where UR.Login='" + obj + "' ");
    //    DataSet ds = objCat.ShowRequestTimeOffInfo(Convert.ToInt32(obj1));

    //    for (int i = 0; i < chkHolidaysList.Items.Count; i++)
    //    {
    //        if (chkHolidaysList.Items[i].Selected)
    //        {
    //          foreach (var holiday in holidays)
    //            {
    //                string date = holiday.Date.ToShortDateString();
    //                string day = holiday.Date.DayOfWeek.ToString();
    //                string HolidayName = holiday.HolidayName.ToString();

    //                string strHoliday = chkHolidaysList.Items[i].Value.ToString();
    //                if (HolidayName == strHoliday)
    //                {
    //                 DataSet ds3 = new DataSet();
    //                 ds3 = GetData("select count(FromDate) as Count from EmployeeLeave where TypeOfRequesteType='Holiday Pay'	and FromDate='" + date + "' and LoginID=" + obj + "");


    //                if(ds3.Tables[0].Rows[0]["Count"].ToString()=="0")
    //                  {
    //                    bool msg = objCat.Add_RequestTimeOff_Details(obj, date, date, null, null, "Holiday Pay", txtComments.Text, 8, "Pending");//, txt_add.Text, txt_city.Text, txt_state.Text, txt_zip.Text
    //                    if (msg == true)
    //                    {
    //                        Response.Write("<script>alert('Request Submit Successfully.')</script>");
    //                        chkHolidaysList.Items.FindByValue(HolidayName).Enabled = false;
    //                        FillEmployeeInformation(Convert.ToInt32(obj1));
    //                        if (ds2.Tables[0].Rows[0]["Recipient"] != "")
    //                        {                                
    //                            string msgToSend = string.Empty;
    //                            int msgId = 0;
    //                            string objUserName = objSm.GetCookie("UserId");
    //                            msgId = objNewJob.InsertJobMessage(chkHolidaysList.Items[i].Text.Trim());
    //                            objNewJob.InsertJobMessageReadUnread2(Convert.ToInt32(ds2.Tables[0].Rows[0]["Sender"]), Convert.ToInt32(ds2.Tables[0].Rows[0]["Recipient"]), "0", msgId, "U", null, null, null, null, null, null, null, "R", "Holiday Pay");
    //                        }                                              
    //                    }
    //                    else
    //                        Response.Write("<script>alert('Failed')</script>");
    //                    break;
    //                      }
    //                  }                   
    //            }
    //        }
    //    }
    //    ModalPopupExtender7.Show();

    //}
    //public void btnImageProFile_Click(object sender, EventArgs e)
    //{

    //    ModalPopupExtender1.Show();
    //    string obj = objSm.GetCookie("UsrRegisterId");
    //    FillEmployeeInformation(Convert.ToInt32(obj));
    //    //if (imgProfilePanel.ImageUrl == "")
    //    //{
    //    //    imgProfilePanel.ImageUrl = "Admin/Upload/noImage.png";
    //    //}

    //}
    //protected void btn_Cancel_Click(object sender, EventArgs e)
    //{
    //    Table3.Style.Add("display", "none");
    //    ModalPopupExtender4.Show();
    //}

    //public void btn_cancel_Click(object sender, EventArgs e)
    //{
    //    ModalPopupExtender1.Hide();
    //    ddlFromTime.SelectedIndex = 0;
    //    ddlToTime.SelectedIndex = 0;
    //    ddlTypeOfRequested.SelectedIndex = 0;
    //    txtFromDate.Text = "";
    //    txtToDate.Text = "";
    //    txtComments.Text = "";
    //    //lblFromTime.Visible = false;
    //    //lblToTime.Visible = false;
    //    //ddlFromTime.Visible = false;
    //    //ddlToTime.Visible = false;
    //    ddlToTime.Style.Add("display", "none");
    //    ddlFromTime.Style.Add("display", "none");
    //    lblFromTime.Style.Add("display", "none");
    //    lblToTime.Style.Add("display", "none");

    //}
    //protected void ShowUserTimeDetails_Click1(object sender, EventArgs e)
    //{
    //    pnlTypeOfTimeView.Visible = false;
    //    imgShowView.Visible = false;
    //    imgHideView.Visible = true;
    //    ModalPopupExtender1.Show();
    //}

    //protected void HideUserTimeDetails_Click1(object sender, EventArgs e)
    //{
    //    pnlTypeOfTimeView.Visible = true;
    //    imgShowView.Visible = true;
    //    imgHideView.Visible = false;
    //    ModalPopupExtender1.Show();
    //}
    //protected void DownloadFile_Click(object sender, EventArgs e)
    //{
    //    ImageButton lnk = sender as ImageButton;
    //    GridViewRow grd = (GridViewRow)lnk.NamingContainer;
    //    //   int ID = Convert.ToInt32(lnk.CommandArgument.ToString());
    //    int index = grd.RowIndex;

    //    int id = Convert.ToInt32(grdOccurences.DataKeys[index].Value.ToString());
    //    Label lblresponsestatus = grdOccurences.Rows[index].FindControl("lblresponsestatus") as Label;
    //    if (lblresponsestatus.Text == "True")
    //    {
    //        DownloadPDF(id);
    //    }

    //}

    //protected override void VerifyRenderingInServerForm(System.Web.UI.Control control)
    //{ }
    //void DownloadPDF(int id)
    //{
    //    DataTable dt = objCat.showOccurencesById(id);
    //    string HTMLContent = "<b><h3>                                             Custom Weatherization, LLC</h3></b> <h3><b>                                                      Occurrence Form</b></h3><br/><br/><b>Employee Name: </b>" + dt.Rows[0]["EmployeeName"].ToString() + "                                                                  <b>           Date: </b>" + Convert.ToDateTime(dt.Rows[0]["Date"]).ToShortDateString() + "<br/><br/><b>Narrative:</b><br/><u>" + dt.Rows[0]["Narrative"].ToString() + "</u><br/><br/><h3><b>                                            For Administration Use Only</b></h3><br/><br/><b>Supervisor Assigned: </b>" + dt.Rows[0]["ManagerName"].ToString() + "<br/><br/><b>Action Taken: </b>" + dt.Rows[0]["ActionTaken"].ToString() + "<br/><br/><b>Signature of Employee: </b>" + sign + "             <b>Pin: </b>" + dt.Rows[0]["PassCode"].ToString() + "                     <b>Date Signed: </b>" + dt.Rows[0]["ResponseDate"].ToString() + " <br/><br/><b>Response: </b><br/><u>" + dt.Rows[0]["Response"].ToString() + "</u>";

    //    Response.ContentType = "application/pdf";
    //    Response.AddHeader("content-disposition", "attachment;filename=TestPage.pdf");
    //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
    //    StringWriter sw = new StringWriter();
    //    HtmlTextWriter hw = new HtmlTextWriter(sw);



    //    StringReader sr = new StringReader(sw.ToString());
    //    Document pdfDoc = new Document(PageSize.A4, 80f, 80f, -2f, 35f);
    //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
    //    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
    //    pdfDoc.Open();
    //    htmlparser.Parse(sr);
    //    pdfDoc.Close();
    //    Response.Write(pdfDoc);
    //    Response.End();
    //}
    //public void txtFromDate_Click(object sender, EventArgs e)
    //{
    //    double Totaldays=(Convert.ToDateTime(txtFromDate.Text) - DateTime.Now).TotalDays;
    //    TimeSpan diff = DateTime.Today-Convert.ToDateTime(txtFromDate.Text);
    //    int days = diff.Days;
    //    int count = 0;
    //    if (ddlTypeOfRequested.SelectedItem.Text != "Sickness" && days <= 0)
    //    {
    //        if (txtFromDate.Text == txtToDate.Text)
    //        {
    //            //ddlToTime.Visible = true;
    //            //ddlFromTime.Visible = true;
    //            //lblFromTime.Visible = true;
    //            //lblToTime.Visible = true;
    //            ddlToTime.Style.Add("display", "block");
    //            ddlFromTime.Style.Add("display", "block");
    //            lblFromTime.Style.Add("display", "block");
    //            lblToTime.Style.Add("display", "block");
    //        }
    //        else
    //        {
    //            //ddlToTime.Visible = false;
    //            //ddlFromTime.Visible = false;
    //            //lblFromTime.Visible = false;
    //            //lblToTime.Visible = false;
    //            ddlToTime.Style.Add("display", "none");
    //            ddlFromTime.Style.Add("display", "none");
    //            lblFromTime.Style.Add("display", "none");
    //            lblToTime.Style.Add("display", "none");
    //        }
    //    }
    //    else if(ddlTypeOfRequested.SelectedItem.Text != "Sickness")
    //    {            
    //       string message = "alert('Please select Date greater or equel Current Date!')";
    //        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
    //        txtFromDate.Text = "";
    //        txtToDate.Text = "";           
    //    }
    //    if (ddlTypeOfRequested.SelectedItem.Text == "Sickness" && days <= 3)
    //    {
    //        if (txtFromDate.Text == txtToDate.Text)
    //        {
    //            ddlToTime.Style.Add("display", "block");
    //            ddlFromTime.Style.Add("display", "block");
    //            lblFromTime.Style.Add("display", "block");
    //            lblToTime.Style.Add("display", "block");
    //            //ddlToTime.Visible = true;
    //            //ddlFromTime.Visible = true;
    //            //lblFromTime.Visible = true;
    //            //lblToTime.Visible = true;
    //        }
    //        else
    //        {
    //            //ddlToTime.Visible = false;
    //            //ddlFromTime.Visible = false;
    //            //lblFromTime.Visible = false;
    //            //lblToTime.Visible = false;
    //            ddlToTime.Style.Add("display", "none");
    //            ddlFromTime.Style.Add("display", "none");
    //            lblFromTime.Style.Add("display", "none");
    //            lblToTime.Style.Add("display", "none");
    //        }
    //    }
    //    else if (ddlTypeOfRequested.SelectedItem.Text == "Sickness")
    //    {
    //        string message = "alert('Please select Date only 3 days before Current Date!')";
    //        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
    //        txtFromDate.Text = "";
    //        txtToDate.Text = "";
    //    }
    //    ModalPopupExtender2.Show();
    //    pnlRequestTimeOff.Visible = true;
    //}

    //public void txtToDate_Click(object sender, EventArgs e)
    //{
    //    if (txtFromDate.Text == txtToDate.Text)
    //    {
    //        ddlToTime.Style.Add("display", "block");
    //        ddlFromTime.Style.Add("display", "block");
    //        lblFromTime.Style.Add("display", "block");
    //        lblToTime.Style.Add("display", "block");
    //        //ddlToTime.Visible = true;
    //        //ddlFromTime.Visible = true;
    //        //lblFromTime.Visible = true;
    //        //lblToTime.Visible = true;
    //    }
    //    else
    //    {
    //        //ddlToTime.Visible = false;
    //        //ddlFromTime.Visible = false;
    //        //lblFromTime.Visible = false;
    //        //lblToTime.Visible = false;
    //          ddlToTime.Style.Add("display", "none");
    //            ddlFromTime.Style.Add("display", "none");
    //            lblFromTime.Style.Add("display", "none");
    //            lblToTime.Style.Add("display", "none");
    //    }
    //    ModalPopupExtender2.Show();
    //    pnlRequestTimeOff.Visible = true;
    //}
    //public void lnkTimeOffDetails_Click(object sender, EventArgs e)
    //{
    //    string obj = objSm.GetCookie("UsrRegisterId");
    //    ModalPopupExtender1.Hide();
    //    ModalPopupExtender2.Show();
    //    pnlRequestTimeOff.Visible = true;
    //}

    //public void lbnPayment_Click(object sender, EventArgs e)
    //{
    //    ModalPopupExtender3.Show();
    //    ShowPaymentHistory();
    //    pnlPaymentHistory.Visible = true;
    //}
    //public void btn_cancelPayment_Click(object sender, EventArgs e)
    //{
    //    ModalPopupExtender3.Hide();
    //    ModalPopupExtender1.Show();
    //}
}
