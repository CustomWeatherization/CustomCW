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
using System.Globalization;

public partial class EmployeeTimeTracking : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CWeatherCon"].ToString());
    bool btnPunchOutReturnVal = false;
    smUtil objSm = new smUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindTimeClock();      
        if (Convert.ToString(Request.QueryString["Flag"]) != null || Convert.ToString(Request.QueryString["Flag"]) != "")
        {
            imgLogo.HRef = "Home.aspx";
        }
    }
    public void BindTimeClock()
    {
       // string Emplid = objSm.GetCookie("UsrRegisterId");
        string Emplid =txtPasscode.Text.Trim();
        string cuurentdate = DateTime.Now.ToShortDateString();



        DataTable dt = UserDetails(Emplid, cuurentdate);
        if (dt.Rows.Count > 0)
        {
            string Emp_Id = dt.Rows[0]["Emp_Id"].ToString();
            string SwipeIn = dt.Rows[0]["SwipeIn"].ToString();
            string SwipeOut = dt.Rows[0]["SwipeOut"].ToString();
            string ADate = dt.Rows[0]["ADate"].ToString();
            if ((SwipeIn.Trim() != "" && SwipeIn.Trim() != "&nbsp") && (SwipeOut.Trim() != "" && SwipeOut.Trim() != "&nbsp"))
            {
                //btnPunchOut.Visible = false;
                // btnPunchIn.Visible = true;
                //btnPunchOut.Style.Add("display", "none");
                //btnPunchIn.Style.Add("display", "block");
                lblPunchInTime.Text = SwipeIn;
                lblPunchOutTime.Text = SwipeOut;
            }
            else if (SwipeIn.Trim() != "" && SwipeIn.Trim() != "&nbsp")
            {
                // btnPunchIn.Visible = false;
                // btnPunchOut.Visible = true;
                //btnPunchOut.Style.Add("display", "block");
                //btnPunchIn.Style.Add("display", "none");
                lblPunchInTime.Text = SwipeIn;
                lblPunchOutTime.Text = "";
            }
            else if (SwipeOut.Trim() != "" && SwipeOut.Trim() != "&nbsp")
            {
                lblPunchOutTime.Text = SwipeOut;
                lblPunchInTime.Text = "";
            }
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        var eastern = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
        var local = TimeZoneInfo.Local; // PDT for me
        lblTime.Text = (Convert.ToString(System.DateTime.Now.ToString("hh:mm:ss tt")));
        DateTime timeUtc = DateTime.UtcNow;
        TimeZoneInfo cstZone = TimeZoneInfo.FindSystemTimeZoneById("Central Standard Time");
        DateTime cstTime = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, eastern);
        lblTime.Text = (Convert.ToString(cstTime.ToString("hh:mm:ss tt")));       
    }
    protected void btnOk_OnClick(object sneder, EventArgs e)
    {
        var eastern = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
        var local = TimeZoneInfo.Local;
         lblError.Text = "";
        DateTime dt = Convert.ToDateTime(Convert.ToString(DateTime.Now));//.AddHours(1).Add(eastern.BaseUtcOffset - local.BaseUtcOffset)));
        string emp_id = EmpIdbyPscd(txtPasscode.Text);
        if (emp_id != "")
        {
           // string Emplid = objSm.GetCookie("UsrRegisterId");
            string Emplid = txtPasscode.Text.Trim();
            string cuurentdate = DateTime.Now.ToShortDateString();
          //  DataTable dt1 = UserDetails(Emplid, cuurentdate);
            DataTable dt1 = UserDetails(Emplid, cuurentdate);
            if (dt1.Rows.Count > 0)
            {
                string Emp_Id = dt1.Rows[0]["Emp_Id"].ToString();
                string SwipeIn = dt1.Rows[0]["SwipeIn"].ToString();
                string SwipeOut = dt1.Rows[0]["SwipeOut"].ToString();
                string ADate = dt1.Rows[0]["ADate"].ToString();
                if ((SwipeIn.Trim() != "" && SwipeIn.Trim() != "&nbsp") && (SwipeOut.Trim() != "" && SwipeOut.Trim() != "&nbsp"))
                {
                    ViewState["EMP"] = emp_id;
                    chkSwipe(emp_id, dt);
                    lblError.Text = "Successfully Swiped In";
                    //lblPunchInTime.Text = SwipeIn;
                    //lblPunchOutTime.Text = SwipeOut;
                }
                else if (SwipeIn.Trim() != "" && SwipeIn.Trim() != "&nbsp")
                {
                    lblError.Text = "You are already Swipe In";
                    //lblPunchInTime.Text = SwipeIn;
                    //lblPunchOutTime.Text = "";
                }
                else if (SwipeOut.Trim() != "" && SwipeOut.Trim() != "&nbsp")
                {
                    ViewState["EMP"] = emp_id;
                    chkSwipe(emp_id, dt);
                    lblError.Text = "Successfully Swiped In";
                    //lblPunchOutTime.Text = SwipeOut;
                    //lblPunchInTime.Text = "";
                }
            }
            else
            {
                ViewState["EMP"] = emp_id;
                chkSwipe(emp_id, dt);
                lblError.Text = "Successfully Swiped In";
            }
          //  btnPunchOut.Style.Add("display", "block");
         //   btnPunchIn.Style.Add("display", "none"); 
            //btnPunchOut.Visible = true;
            //btnPunchIn.Visible = false;
           // lblPunchOutTime.Text = "";
           BindTimeClock();
        }
        else
        {
            Response.Write("<script type = 'text/javascript'>alert('Invalid Passcode or Username Is Not Activated');</script>");
        }
    }
    public bool chkSwipe(string custid, DateTime dt)
    {
        con.Open();
        // Type: SwipeIn,Swipeout
        cmd = new SqlCommand("sp_Attendance", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Emp_Id", SqlDbType.NVarChar, 50).Value = custid;
        cmd.Parameters.Add("@ADate", SqlDbType.DateTime).Value = dt;
        cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 50);
        cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
        cmd.Parameters.Add("@Msg2", SqlDbType.NVarChar, 50);
        cmd.Parameters["@Msg2"].Direction = ParameterDirection.Output;
        cmd.Parameters.Add("@Msg3", SqlDbType.NVarChar, 50);
        cmd.Parameters["@Msg3"].Direction = ParameterDirection.Output;
        cmd.ExecuteNonQuery();

        string msg1 = (string)cmd.Parameters["@Msg"].Value.ToString().Trim(' ');
        string msg2 = (string)cmd.Parameters["@Msg2"].Value.ToString().Trim(' ');
        //if ((string)cmd.Parameters["@Msg"].Value.ToString().Trim(' ') == "SwipeInEnable")
        if (msg1 == "SwipeInEnable")
        {
            string inTm;
            btnPunchIn.Enabled = true;
            inTm = (string)cmd.Parameters["@Msg3"].Value.ToString().Trim(' ');
            //inTm = Convert.ToString(inTm.ToString("hh:mm tt"));
            if (inTm != "")
            {
                string[] spltTime = inTm.Split(' ');
                if (spltTime[4].ToString() == "")
                {
                    inTm = spltTime[5];
                }
                else
                {
                    inTm = spltTime[4];
                }

                //inTm = spltTime[5];
            }
            lblPunchInTime.Text = inTm;
            PunchIn();
        }
        else
        {
            string inTime = "No Record";
            string inTime1 = (string)cmd.Parameters["@Msg"].Value.ToString().Trim(' ');
            string inTime2 = (string)cmd.Parameters["@Msg3"].Value.ToString().Trim(' ');
            if (inTime1 == "")
            {
                string[] spltTime = inTime2.Split(' ');
                if (spltTime[4].ToString() == "")
                {
                    inTime2 = spltTime[5];
                }
                else
                {
                    inTime2 = spltTime[4];
                }
                lblPunchInTime.Text = inTime2;
            }
            else if (inTime2 == "")
            {
                string[] spltTime = inTime1.Split(' ');
                if (spltTime[4].ToString() == "")
                {
                    inTime1 = spltTime[5];
                }
                else
                {
                    inTime1 = spltTime[4];
                }
                lblPunchInTime.Text = inTime1;
            }
            else
            {
                lblPunchInTime.Text = inTime;
            }
        }
        if (msg2 == "SwipeOutEnable")
        {
            btnPunchOut.Enabled = true;
            btnPunchOutReturnVal = true;
        }
        else
        {
            string OuTi = "";
            OuTi = msg2;
            if (OuTi != "")
            {
                string[] spltTime = OuTi.Split(' ');

                if (spltTime[4].ToString() == "")
                {
                    OuTi = spltTime[5];
                }
                else
                {
                    OuTi = spltTime[4];
                }

                //OuTi = spltTime[5];
                lblPunchOutTime.Text = OuTi;
            }
        }
        con.Close();
        return btnPunchOutReturnVal;
    }
    protected void btnPunchOut_OnClick(object sneder, EventArgs e)
    {
        lblPunchOutTime.Text = lblPunchInTime.Text = lblError.Text = "";

        var eastern = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");

        var local = TimeZoneInfo.Local;
        //DateTime dt = Convert.ToDateTime(Convert.ToString(DateTime.Now.AddHours(1).Add(eastern.BaseUtcOffset - local.BaseUtcOffset)));
        DateTime dt = Convert.ToDateTime(Convert.ToString(DateTime.Now));//.AddHours(1).Add(eastern.BaseUtcOffset - local.BaseUtcOffset)));
        string emp_id = EmpIdbyPscd(txtPasscode.Text);
        if (emp_id != "")
        {
            
            //if (result == true)
            //{
          //  string Emplid = objSm.GetCookie("UsrRegisterId");
            string Emplid = txtPasscode.Text.Trim();
                string cuurentdate = DateTime.Now.ToShortDateString();
                DataTable dt1 = UserDetails(Emplid, cuurentdate);
            
                if (dt1.Rows.Count > 0)
                {
                    string Emp_Id = dt1.Rows[0]["Emp_Id"].ToString();
                    string SwipeIn = dt1.Rows[0]["SwipeIn"].ToString();
                    string SwipeOut = dt1.Rows[0]["SwipeOut"].ToString();
                    string ADate = dt1.Rows[0]["ADate"].ToString();
                    //if ((SwipeIn.Trim() != "" && SwipeIn.Trim() != "&nbsp") && (SwipeOut.Trim() != "" && SwipeOut.Trim() != "&nbsp"))
                    //{
                    //    // lblPunchOutTime.Text = dt.ToLongTimeString();
                    //    // swipe("SwipeOut", Convert.ToString(ViewState["EMP"]), dt, lblPunchInTime.Text.ToString(), lblPunchOutTime.Text.ToString(), "P", "");
                    //    // ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    //    lblError.Text = "You are already Swipe Out";
                    //    lblPunchInTime.Text = SwipeIn;
                    //    lblPunchOutTime.Text = SwipeOut;
                    //}

                    //else if (SwipeOut.Trim() == "" || SwipeOut.Trim() == null)
                    //{
                    //    lblPunchOutTime.Text = dt.ToLongTimeString();
                    //    swipe("SwipeOut", Convert.ToString(ViewState["EMP"]), dt, lblPunchInTime.Text.ToString(), lblPunchOutTime.Text.ToString(), "P", "");
                    //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    //    lblError.Text = "Successfully Swiped out";
                    //    lblPunchOutTime.Text = SwipeOut;
                    //    lblPunchInTime.Text = "";
                    //}


                    if ((SwipeIn.Trim() != "" && SwipeIn.Trim() != "&nbsp") && (SwipeOut.Trim() != "" && SwipeOut.Trim() != "&nbsp"))
                    {

                        lblError.Text = "You are already Swipe Out";
                        //lblPunchInTime.Text = SwipeIn;
                        //lblPunchOutTime.Text = SwipeOut;
                    }
                   
                    else if (SwipeOut.Trim() != "" && SwipeOut.Trim() != "&nbsp")
                    {

                        lblError.Text = "You are already Swipe Out";
                        //lblPunchOutTime.Text = SwipeOut;
                        //lblPunchInTime.Text = "";
                    }
                    else if (SwipeOut.Trim() == "" || SwipeOut.Trim() == null)
                    {
                        ViewState["EMP"] = emp_id;
                        bool result = chkSwipe(emp_id, DateTime.Now);
                        lblPunchOutTime.Text = dt.ToLongTimeString();
                        swipe("SwipeOut", Convert.ToString(ViewState["EMP"]), dt, lblPunchInTime.Text.ToString(), lblPunchOutTime.Text.ToString(), "P", "");
                       // ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                        lblError.Text = "Successfully Swiped out";
                        //lblPunchOutTime.Text = SwipeOut;
                        //lblPunchInTime.Text = "";
                    }
                    //lblPunchOutTime.Text = dt.ToLongTimeString();
                    //swipe("SwipeOut", Convert.ToString(ViewState["EMP"]), dt, lblPunchInTime.Text.ToString(), lblPunchOutTime.Text.ToString(), "P", "");
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    //btnPunchOut.Visible = false;
                    //btnPunchIn.Visible = true;
                    // btnPunchOut.Style.Add("display", "none");
                    // btnPunchIn.Style.Add("display", "block");
                    //BindTimeClock();
                    BindTimeClock();
                }
               

            //}
            //else
            //{
            //    lblError.Text = "You are already Swipe Out";
            //   // Response.Write("<script type = 'text/javascript'>alert('Invalid Passcode or Username Is Not Activated');</script>");
            //}
        }
        else
        {
            Response.Write("<script type = 'text/javascript'>alert('Invalid Passcode or Username Is Not Activated');</script>");
        }
        //btnPunchIn.Enabled = true;
        //btnPunchOut.Enabled = false;
    }
    protected void btnPunchIn_OnClick(object sender, EventArgs e)
    {
        lblError.Text = "";
        // lblPunchInTime.Text = DateTime.Now.ToLongTimeString();
       // lblPunchOutTime.Text = lblPunchInTime.Text = lblError.Text = "";
        var eastern = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
        var local = TimeZoneInfo.Local;
        //              yha change kiya hai
        DateTime dt = Convert.ToDateTime(Convert.ToString(DateTime.Now));//.AddHours(1).Add(eastern.BaseUtcOffset - local.BaseUtcOffset)));
        lblPunchInTime.Text = dt.ToLongTimeString();
        swipe("SwipeIn", Convert.ToString(ViewState["EMP"]), dt, lblPunchInTime.Text.ToString(), lblPunchOutTime.Text.ToString(), "P", "");
        btnPunchOut.Visible = true;
        btnPunchIn.Visible = false;
        lblPunchOutTime.Text = "";
    }


    public void PunchIn()
    {
        var eastern = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
        var local = TimeZoneInfo.Local;
        //              yha change kiya hai
        DateTime dt = Convert.ToDateTime(Convert.ToString(DateTime.Now));//.AddHours(1).Add(eastern.BaseUtcOffset - local.BaseUtcOffset)));
        lblPunchInTime.Text = dt.ToLongTimeString();
        swipe("SwipeIn", Convert.ToString(ViewState["EMP"]), dt, lblPunchInTime.Text.ToString(), lblPunchOutTime.Text.ToString(), "P", "");
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
    }
    public void PunchOut()
    {
    }

    public string EmpIdbyPscd(string Passcode)
    {
        string Emp_Id = "";
        SqlCommand cmd = new SqlCommand();
        DataTable DtPasscode = new DataTable();
        //cmd = new SqlCommand("select [User_Id] from User_registration where Passcode='" + Passcode + "'", con);
        cmd.Parameters.AddWithValue("@Passcode", Passcode);
        cmd.Parameters.AddWithValue("@Mode", "Passcode");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        cmd.CommandText = "proc_Passcode";
        SqlDataAdapter daPascd = new SqlDataAdapter(cmd);
        daPascd.Fill(DtPasscode);
        if (DtPasscode.Rows.Count > 0)
        {
            Emp_Id = Convert.ToString(DtPasscode.Rows[0]["User_Id"]);
        }
        return Emp_Id;
    }
    public DataTable UserDetails(string Emplid,string date)
    {
        SqlCommand cmd = new SqlCommand();
        DataTable DtUserDetails = new DataTable();
        cmd.Connection = con;
        cmd.CommandText = "proc_Passcode";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "UserTimeDetails");
        cmd.Parameters.AddWithValue("@Date", date);
       // cmd.Parameters.AddWithValue("@EmpId", Emplid);
        cmd.Parameters.AddWithValue("@Passcode", Emplid); 
        SqlDataAdapter daPascd = new SqlDataAdapter(cmd);
        daPascd.Fill(DtUserDetails);
        return DtUserDetails;
    }
    public void swipe(string type, string Empid, DateTime dt, string sin, string sout, string status, string remark)
    {
        try
        {
            con.Close();
            //BusinessLogic.Open_Connection(con);
            cmd = new SqlCommand("sp_Swipe", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Type", SqlDbType.NVarChar).Value = type;
            cmd.Parameters.Add("@Emp_Id", SqlDbType.NVarChar, 50).Value = Empid;
            cmd.Parameters.Add("@Adate", SqlDbType.DateTime).Value = dt;
            cmd.Parameters.Add("@SwipeIn", SqlDbType.NVarChar, 20).Value = sin;
            cmd.Parameters.Add("@SwipeOut", SqlDbType.NVarChar, 20).Value = sout;
            cmd.Parameters.Add("@Status", SqlDbType.Char, 10).Value = status;
            cmd.Parameters.Add("@Remark", SqlDbType.NVarChar, 255).Value = remark;
            cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 50);
            cmd.Parameters["@Msg"].Direction = ParameterDirection.Output;
            con.Open();
            cmd.ExecuteNonQuery();

            lblError.Text = (string)cmd.Parameters["@Msg"].Value.ToString().Trim(' ');
        }
        catch (SqlException ex)
        {
            lblError.Text = (string)cmd.Parameters["@Msg"].Value.ToString().Trim(' ');
        }
        finally
        {
            con.Close();
        }
    }
}
