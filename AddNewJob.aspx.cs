using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using CuteWebUI;

public partial class AddNewJob : System.Web.UI.Page
{
    public DataTable dt_recipent = new DataTable();
    dcMessage objMessage = new dcMessage();
	dc_AddNewJob objNewJob = new dc_AddNewJob();
	dc_Vendor vendor1 = new dc_Vendor();
	smUtil objSmUtil = new smUtil();
	dcContactAttemptsReport objCAR = new dcContactAttemptsReport();
	Dc_AddORManageInvoice objInvoice = new Dc_AddORManageInvoice();
	public DataTable dtContactAttempts = new DataTable();
    public DataTable dtInvoice = new DataTable();

	static string strJobNumber = "";
	public string StrUserName = "";
	public string browser = "";
	string ddlzone = "0";
	public int i_update = 0;
	dcPPLAudit ObjPPL = new dcPPLAudit();
	public string JobStatus = "";
	public static string filename = "";
	public string jobtype_ = "";
	public string ContactResult = "";
	public string Name = "";
	public string ServiceAddress = "";
	public string Phone = "";
	public static string Stauts = "";
	public static string time = "";
	public static string contactResult = "";
	public static string contactP = "";
	//public static DateTime assigndate = 11/01/2016


     
	protected void Page_Load(object sender, EventArgs e)
	{

		//tanveer 
        ShowContactAttempt();
		hid_admin.Visible = true;
		smUtil objSm = new smUtil();
		string role = "";
		role = objSm.GetCookie("Rol_Id");
		if (!IsPostBack)
		{
           
			if (Request.QueryString["GT"] == "Vendor")
			{
			}
			else
			{
				BindDDLAuditor();
			}
		}
		if (IsPostBack)
		{
		}
		if (Convert.ToString(Request.QueryString["Back"]) == "JobsStatus" || Convert.ToString(Request.QueryString["Back"]) == "DisplayJobSearchRecords" || Convert.ToString(Request.QueryString["Back"]) == "Admin/Admin_Unfinalize")
		{
			btnUpdate.Visible = false;
			btnFewFld.Visible = true;
			if (role == "User")
			{
				hid_admin.Visible = false;
			}
			else
			{
				hid_admin.Visible = true;
			}
			EnblDsbl();
		}
		else
		{
			btnUpdate.Visible = true;
		}
		//end//
		try
		{
			StrUserName = objSmUtil.GetCookie("UserName");
			if (!IsPostBack)
			{
				string obj = objSmUtil.GetCookie("UserId");
                

				if (obj == "")
				{
					Response.Redirect("Login.aspx");
				}


				if (Request.QueryString["JobNew"] != null)
				{
					if (Request.QueryString["JobNew"] != "")
					{
						txtJobNumber.Text = Request.QueryString["JobNew"].ToString();
						txtJobNumber.ReadOnly = true;
						txtEnterSeheduling.Visible = false;
						if (Request.QueryString["GT"] == "Vendor")
						{
							job.Visible = false;
							DateRcvd.Visible = false;
							DateCmplt.Visible = false;
							returndte.Visible = false;
							txtDateReceived.Visible = false;
							Calander.Enabled = false;
							FilteredTextBoxExtender17.Enabled = false;
							duedate.Visible = false;
							txtReturnDate.Visible = false;
							UtilityComp1.Visible = false;
							UtilityComp2.Visible = false;
							DDl_UtilityCompany_1.Visible = false;
							DDL_UtilityCompany_2.Visible = false;
							txtEnterSeheduling.Visible = false;
							Jbtp.Visible = false;
							jobtype.Visible = false;
							tblDetails.Visible = false;
							ddlCounty.Visible = false;
							RequiredFieldValidator4.Enabled = false;
							county.Visible = false;
							srvc.InnerText = "Location Address";
							btnSaveComments_.Visible = true;
							btnSaveComments.Visible = false;
							btnQuestionaire.Visible = false;
							txtDateCompleted.Visible = false;
							phones.Visible = false;
							noOfOccu.Visible = false;
							heating.Visible = false;
							spnJob.Visible = false;
							spnjb.Visible = false;
							spnUpJb.Visible = false;
							spnNewJob.Visible = false;
							rfv_UtilityCompany_1.Enabled = false;
							RequiredFieldValidator7.Enabled = false;
							sch.Visible = false;
							schdt.Visible = false;
							dateGoBackReceive.Visible = false;
							txt_GobackRecive.Visible = false;
						}
						else
						{
							btnSaveComments_.Visible = false;
							btnSaveComments.Visible = true;
							vendor.Visible = false;
							net.Visible = false;
							DDl_Net.Visible = false;
							duedate.Visible = false;
							SendDte.Visible = false;
							DDl_SendByDate.Visible = false;
							Category.Visible = false;
							spnEmailVendor.Visible = false;
							txtEmailVendor.Visible = false;
							Accno.Visible = false;
							DDl_Category.Visible = false;
							txtAcc.Visible = false;
							txtCntctNum.Visible = false;
							txtCompanyName.Visible = false;
							spnPhone.Visible = false;
							SpnExt.Visible = false;
							CntctPer.Visible = false;
							//btnVendorContactAttempt.Visible = false;
							txtPhone.Visible = false;
							txtExt.Visible = false;
							SpnExt.Visible = false;
							txtFaxNo.Visible = false;
							txtCntctPer.Visible = false;
							lblFileupload.Visible = false;
							txtFileUpload.Visible = false;
							spnVendor.Visible = false;
							spnven.Visible = false;
							spnUpVen.Visible = false;
							spnNewVendor.Visible = false;
							//Uploader1.Visible = false;
							//Attachments1.Visible = false;
                            GVPdfview.Visible = false;
                            FileUpload1.Visible = false;
                            btnupload.Visible = false;
						}
					}

				}
				else
				{
					if (Request.QueryString["GT"] == "Vendor" && (Request.QueryString["Back"] == "DisplayJobSearchRecords" || Request.QueryString["Back"] == "Admin/Admin_Unfinalize" || Request.QueryString["Back"] == "JobsStatus"))
					{
						strJobNumber = Convert.ToString(Request.QueryString["Jobs"]);
						job.Visible = false;
						DateRcvd.Visible = false;
						DateCmplt.Visible = false;
						returndte.Visible = false;
						txtDateReceived.Visible = false;
						Calander.Enabled = false;
						FilteredTextBoxExtender17.Enabled = false;
						duedate.Visible = false;
						txtReturnDate.Visible = false;
						UtilityComp1.Visible = false;
						UtilityComp2.Visible = false;
						DDl_UtilityCompany_1.Visible = false;
						DDL_UtilityCompany_2.Visible = false;
						Jbtp.Visible = false;
						jobtype.Visible = false;
						tblDetails.Visible = false;
						ddlCounty.Visible = false;
						RequiredFieldValidator4.Enabled = false;
						county.Visible = false;
						srvc.InnerText = "Location Address";
						btnSaveComments_.Visible = true;
						btnSaveComments.Visible = false;
						btnQuestionaire.Visible = false;
						txtDateCompleted.Visible = false;
						phones.Visible = false;
						noOfOccu.Visible = false;
						heating.Visible = false;
						txtEnterSeheduling.Visible = false;
						txt_GobackReturned.Visible = false;
						txt_AuditScheduledDate.Visible = false;
						txtRe_ScheduledDate.Visible = false;
						DDL_Auditor_Name.Visible = false;
						DDl_CrewCheif.Visible = false;
						txt_GobackRecive.Visible = false;
						txtDateCompleted.Visible = false;
						dateGoBackReceive.Visible = false;
						spnAuditor.Visible = false;
						spnAuditSchdt.Visible = false;
						spnAuditSchdt.Visible = false;
						spnSchInst.Visible = false;
                        spnContactResuldate.Visible = false;
						ddlContactResult.Visible = false;
						spnCntctres.Visible = false;
						spn3drpbx.Visible = false;
						spnCntctattem.Visible = false;
						cntctAttempt.Visible = false;
						spnJob.Visible = false;
						spnjb.Visible = false;
						spnUpJb.Visible = false;
						spnNewJob.Visible = false;
						rfv_UtilityCompany_1.Enabled = false;
						RequiredFieldValidator7.Enabled = false;
						sch.Visible = false;
						schdt.Visible = false;
                      //  btnVendorContactAttempt.Visible = true;//New change 
						ShowContactAttempt();
					}
					else
					{
						btnSaveComments_.Visible = false;
						btnSaveComments.Visible = true;
						vendor.Visible = false;
						net.Visible = false;
						DDl_Net.Visible = false;
						duedate.Visible = false;
						SendDte.Visible = false;
						DDl_SendByDate.Visible = false;
						Category.Visible = false;
						spnEmailVendor.Visible = false;
						txtEmailVendor.Visible = false;
						Accno.Visible = false;
						DDl_Category.Visible = false;
						txtAcc.Visible = false;
						txtCompanyName.Visible = false;
						spnPhone.Visible = false;
						SpnExt.Visible = false;
						CntctPer.Visible = false;
						txtPhone.Visible = false;
						txtExt.Visible = false;
						SpnExt.Visible = false;
						txtFaxNo.Visible = false;
						txtCntctPer.Visible = false;
						spncomm.Visible = false;
						spn2drpbx.Visible = false;
					//	btnVendorContactAttempt.Visible = false;
						txtVendorAgentName.Visible = false;
						txtVendorAgentId.Visible = false;
						spnVendorAgent.Visible = false;
						spnAgentId.Visible = false;
						Vendornamecomm.Visible = false;
						lblFileupload.Visible = false;
						txtFileUpload.Visible = false;
						spnVendor.Visible = false;
						spnven.Visible = false;
						spnUpVen.Visible = false;
						spnNewVendor.Visible = false;
						//Uploader1.Visible = false;
						//Attachments1.Visible = false;
                        GVPdfview.Visible = false;
                        FileUpload1.Visible = false;
                        btnupload.Visible = false;
					}
				}
				strJobNumber = "";
                PDFdatabind();
				ShowCounties();
				ShowState();
				ShowUtilityCompany();
				FillImployee();
				ShowContactPerson();
				ShowContactType();
				ShowContactResult();
				//ShowFName();
                dtInvoice = objInvoice.SearchTotalInvoice(Convert.ToString(Request.QueryString["Jobs"]));
                string jobsnumber =Request.QueryString["Jobs"].ToString();
                //string strUid = objSmUtil.GetCookie("UId");
                //dt_recipent = objMessage.ShowDetails_comments_CC(jobsnumber, Convert.ToInt32(strUid));
               

				if (Request.QueryString["Jobs"] != null)
				{
					if (Request.QueryString["Jobs"] != "")
					{
						//DivDates.Visible = true;
						strJobNumber = Request.QueryString["Jobs"].ToString();
						if (Request.QueryString["GT"] == "Vendor" && (Request.QueryString["Back"] == "DisplayJobSearchRecords" || Request.QueryString["Back"] == "Admin/Admin_Unfinalize" || Request.QueryString["Back"] == "JobsStatus"))
						{
							txtEnterSeheduling.Visible = false;
						}
						else
						{
							txtEnterSeheduling.Visible = true;
						}
						FillDataForUpdate();
						if (!DBNull.Value.Equals(ViewState["Inspection"]) && Convert.ToString(ViewState["Inspection"]) != "" && Convert.ToString(ViewState["Inspection"]) != "False")
						{
							spnAuditSchdt.Visible = false;
							spnInspectionSchdt.Visible = true;
							//ddlContactResult.Items[1].Attributes["disabled"] = "disabled";
							ddlContactResult.Items.Remove(ddlContactResult.Items.FindByValue("14"));
						}
						else
						{
							ddlContactResult.Items.Remove(ddlContactResult.Items.FindByValue("19")); 
						}
						//FillVendorDataForUpdate();
					}
				}
				else
				{
					DivDates.Visible = false;
					lblScheduleDtae.Visible = false;
					txtScheduleDtae.Visible = false;
				}
			}

			if (Request.QueryString["Jobs"] != null)
			{
				if (Request.QueryString["Jobs"] != "")
				{
					showComments();
				}
			}
            if (txtBaseLoad.Text != "")
            {
                txtBaseLoad.Text = ((Convert.ToInt32(txtLow1KWHHours.Text) * 1 + Convert.ToInt32(txtLow1KWHHours.Text) * 1) / 2 * 12).ToString();
            }
            if (txtTWinterSeasonal.Text != "")
            {
                txtTWinterSeasonal.Text = ((Convert.ToInt32(txtYearlyKWH_Hours.Text) * 1) - (Convert.ToInt32(txtBaseLoad.Text) * 1)).ToString();
            }
            if (txtTSummerSeasonal.Text != "")
            {
                txtTSummerSeasonal.Text = ((Convert.ToInt32(txtJuneKWH.Text) * 1 + Convert.ToInt32(txtJulyKWH.Text) * 1 + Convert.ToInt32(txtAugustKWH.Text) * 1 + Convert.ToInt32(txtSeptemberKWH.Text) * 1) - (Convert.ToInt32(txtLow1KWHHours.Text) * 1 + Convert.ToInt32(txtLow1KWHHours.Text) * 1) / 2 * 4).ToString();
            }
            smUtil objsmutil = new smUtil();
			string Roll = Convert.ToString(objsmutil.GetCookie("Rol_Id"));
			if (Roll == "User")
			{
				DisableControls(Page, false);
				btnFewFld.Visible = false;
				CalendarExtender8.Enabled = CalendarExtender2.Enabled = CalendarExtender7.Enabled = false;
			}
			txtCommentsSendAnd.ReadOnly = false;

		}
		catch (Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message+ "');</script>");
		}

	}




    protected void btnupload_Click(object sender, EventArgs e)
    {

        Label2.Visible = true;
        string filePath = FileUpload1.PostedFile.FileName;          // getting the file path of uploaded file
        string filename1 = Path.GetFileName(filePath);               // getting the file name of uploaded file
        string ext = Path.GetExtension(filename1);                      // getting the file extension of uploaded file
        string type = String.Empty;
        if (!FileUpload1.HasFile)
        {
            Label2.Text = "Please Select File";                          //if file uploader has no file selected
        }
        else
            if (FileUpload1.HasFile)
            {
                try
                {

                    switch (ext)
                    {
                        case ".pdf":
                            type = "application/pdf";
                            break;

                    }

                    if (type != String.Empty)
                    {
                        string name = Path.GetFileNameWithoutExtension(FileUpload1.PostedFile.FileName);
                        filename1 = String.Format("PDF_{0}" +filename1, DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                        ////filename += DateTime.Now;
                        //SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-IRT09KE\SQLEXPRESS;Initial Catalog=Demo;User ID=sa;Password=12345; MultipleActiveResultSets=True;");
                        //SqlCommand cmd = new SqlCommand("insert into tblPDF (PdfName) values ('" + filename + "')", conn);
                        //conn.Open();
                        //int i = cmd.ExecuteNonQuery();
                        //conn.Close();
                        int i = vendor1.InsertVendorPDF(name, filename1, Convert.ToString(Request.QueryString["Jobs"]));

                        if (i == 1)
                        {
                            FileUpload1.SaveAs(Server.MapPath("~/VendorPDF/" + filename1));
                        }
                        Label2.ForeColor = System.Drawing.Color.Green;
                        Label2.Text = "File Uploaded Successfully";
                        PDFdatabind();
                    }
                    else
                    {
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "Select Only PDF Files  ";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
    }


    private void PDFdatabind()
    {        
     DataTable allPDF= vendor1.GetVendorPDF(Convert.ToString(Request.QueryString["Jobs"]));
     if (allPDF.Rows.Count > 0)
     {
         GVPdfview.DataSource = allPDF;
         GVPdfview.DataBind(); 
     } 
    }

    protected void DownloadFile(object sender, EventArgs e)
    {
        string filePath = (sender as LinkButton).CommandArgument;
        //Response.Redirect("~/VendorPDF/" + filePath);
        string sPageRedirect = "VendorPDF/" + filePath;
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + sPageRedirect + "','_blank')", true);
    }
    
	protected void DisableControls(Control parent, bool State)
	{
		foreach (Control c in parent.Controls)
		{
			if (c is TextBox)
			{
				((TextBox)(c)).ReadOnly = true;
			}
			else if (c is CheckBox)
			{
				((CheckBox)(c)).Enabled = false;
			}
			else if (c is DropDownList)
			{
				((DropDownList)(c)).Enabled = false;
			}

			DisableControls(c, State);
		}
	}
	public void EnblDsbl()
	{
		if (Request.QueryString["Back"] == "Admin/Admin_Unfinalize")
		{
		}
		else
		{
			txtAuthorName.ReadOnly = true;

			if (Request.QueryString["UC"] == "PRIVATE CUSTOMER" || Request.QueryString["UC"] == "Private")
			{
				DDL_Auditor_Name.Enabled = true;
			}
			else
			{
				DDL_Auditor_Name.Enabled = true;
			}
			DDL_UtilityCompany_2.Enabled = false;
			DDl_UtilityCompany_1.Enabled = false;
			//lblScheduleDtae.Visible = true;
			//txtScheduleDtae.Visible = true;
			RequiredFieldValidator4.Enabled = false;
			txtDateReceived.ReadOnly = true;
			//txtDateCompleted.ReadOnly = true;
			//txtReturnDate.ReadOnly = true;
			//txtScheduleDtae.ReadOnly = true;
			//txtRe_ScheduledDate.ReadOnly = true;
			txt_AuditScheduledDate.ReadOnly = true;
			//txt_GobackRecive.ReadOnly = true;
			// txt_GobackReturned.ReadOnly = true;

			//txt_GoBackSchedule.ReadOnly = true;

			Calander.Enabled = false;
			//CalendarExtender1.Enabled = false;
			// CalendarExtender2.Enabled = false;
			//CalendarExtender3.Enabled = false;
			//CalendarExtender4.Enabled = false;
			CalendarExtender5.Enabled = false;
			//CalendarExtender6.Enabled = false;
			//CalendarExtender7.Enabled = false;
			//CalendarExtender8.Enabled = false;

			if (Request.QueryString["UC"] == "MET ED" || Request.QueryString["UC"] == "PPL" || Request.QueryString["UC"] == "PPL Zone 1" || Request.QueryString["UC"] == "PPL Zone 2" || Request.QueryString["UC"] == "PPL CACLV")
			{
				LnkAudit.Visible = true;
			}
			else
			{
				LnkAudit.Visible = false;
			}
			chkAct129.Enabled = false;
			chkBaseLoad.Enabled = false;
			chkHighPriority.Enabled = false;
			chkLowCost.Enabled = false;
			chkFullCost.Enabled = false;
			chkAct129II.Enabled = false;
			chkInspection.Enabled = false;
			chkRemedial.Enabled = false;
			txtFirstName.ReadOnly = true;
			//txt_AuditScheduledDate.ReadOnly = false;
			txtLastName.ReadOnly = true;
			txtAccountNumber.ReadOnly = true;
			txtAddress_Mailing.ReadOnly = true;
			txtCity_Mailing.ReadOnly = true;
			txtZipCode_Mailing.ReadOnly = true;
			ddl_State_Mailing.Enabled = false;
			txtHomeBuilt.ReadOnly = true;
			txtPhone_Home.ReadOnly = true;
			txtPhone_Cell.ReadOnly = true;
			txtPhone_Work.ReadOnly = true;
			txtAddress_Service.ReadOnly = true;
			txtCity_Service.ReadOnly = true;
			txtZipCode_Service.ReadOnly = true;
			txtEmailId.ReadOnly = true;
			ddl_State_Service.Enabled = false;
			ddlCounty.Enabled = false;
			txtNumberOfOccupants.ReadOnly = true;
			chkSetServiceToMailingAddress.Enabled = false;
			txt_TotalNumberOfUnit_AirConditioning.ReadOnly = true;
			//txtYearlyKWH_Hours.ReadOnly = true;
			txtJuneKWH.ReadOnly = true;
			txtJulyKWH.ReadOnly = true;
			txtAugustKWH.ReadOnly = true;
			txtSeptemberKWH.ReadOnly = true;
			txtLow1KWHHours.ReadOnly = true;
			txtLow2KWH_Hours.ReadOnly = true;
			txtBaseLoad.ReadOnly = true;
			txtTWinterSeasonal.ReadOnly = true;
			txtTSummerSeasonal.ReadOnly = true;
			txtSpendingAllowance.ReadOnly = true;
			rdoNo_OnTrack.Enabled = false;
			rdoYes_OnTrack.Enabled = false;
			txtOnTrackAmount.ReadOnly = true;
			rdoOwner.Enabled = false;
			rdoTenant.Enabled = false;
			txtLandlordName.ReadOnly = true;
			txtLandlordPhone.ReadOnly = true;
			txtLandlordEmailOrFax.ReadOnly = true;
			txtLandlordAddress.ReadOnly = true;
			txtLandlordCity.ReadOnly = true;
			txtLandlordZipCode.ReadOnly = true;
			ddl_State_PPLproprietary.Enabled = false;

			//METED

			rdo_Warm.Enabled = rdo_WarmPlus.Enabled = false;
			rdoPCAP_No.Enabled = false;
			rdoPCAP_Yes.Enabled = false;
			txtPCAP_Amount.ReadOnly = true;
			rdoTOD_No.Enabled = false;
			rdoTOD_Yes.Enabled = false;
			txtLast_4_SS.ReadOnly = true;
			txtSummer_SesonalUse.ReadOnly = true;
			txtWinter_SesonalUse.ReadOnly = true;
			txtAnnualBaseUse.ReadOnly = true;
			txtTotalAnnualUse.ReadOnly = true;
			txt_SeasonalSpendingAllowance.ReadOnly = true;

			if (Request.QueryString["GT"] == "Vendor")
			{
				txtDateCompleted.ReadOnly = true;
				txt_GobackRecive.ReadOnly = true;
			}


			//Vendor txt_GobackRecive.ReadOnly =

			DDl_Net.Enabled = DDl_SendByDate.Enabled = DDl_Category.Enabled = false;
			txtExt.ReadOnly = txtAcc.ReadOnly = txtPhone.ReadOnly = txtCntctNum.ReadOnly = txtFaxNo.ReadOnly = txtEmailVendor.ReadOnly = txtCntctPer.ReadOnly = true;

		}
	}


	protected void lnkLogin_Click(object sender, EventArgs e)
	{
		try
		{
			objSmUtil.DeleteCookie("UId");
			objSmUtil.DeleteCookie("UserId");
			objSmUtil.DeleteCookie("UserName");
			Response.Redirect("Login.aspx");
		}
		catch(Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}

	#region Fill County

	public void ShowCounties()
	{
		try
		{
			DataTable dt = objNewJob.ShowCounties();
			ddlCounty.DataSource = dt;
			ddlCounty.DataValueField = "ID";
			ddlCounty.DataTextField = "County";
			ddlCounty.DataBind();

			ddlCounty.Items.Insert(0, new ListItem("Select County", "0"));
		}
		catch (Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}
	#endregion
	#region Fill State

	public void ShowState()
	{
		try
		{
			DataTable dt = objNewJob.ShowStates();
			ddl_State_Mailing.DataSource = dt;
			ddl_State_Mailing.DataValueField = "ID";
			ddl_State_Mailing.DataTextField = "State";
			ddl_State_Mailing.DataBind();
			ddl_State_Mailing.Items.Insert(0, new ListItem("Select State", "0"));

			ddl_State_Service.DataSource = dt;
			ddl_State_Service.DataValueField = "ID";
			ddl_State_Service.DataTextField = "State";
			ddl_State_Service.DataBind();
			ddl_State_Service.Items.Insert(0, new ListItem("Select State", "0"));


			ddl_State_PPLproprietary.DataSource = dt;
			ddl_State_PPLproprietary.DataValueField = "ID";
			ddl_State_PPLproprietary.DataTextField = "State";
			ddl_State_PPLproprietary.DataBind();
			ddl_State_PPLproprietary.Items.Insert(0, new ListItem("Select State", "0"));
		}
		catch (Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}
	#endregion
	#region Fill Utility Company

	public void ShowUtilityCompany()
	{
		try
		{
			DataTable dt = objNewJob.ShowUtilityCompanies();
			DDL_UtilityCompany_2.DataSource = dt;
			DDL_UtilityCompany_2.DataValueField = "ID";
			DDL_UtilityCompany_2.DataTextField = "UtilityCompany";
			DDL_UtilityCompany_2.DataBind();

			DDL_UtilityCompany_2.Items.Insert(0, new ListItem("Select Utility", "0"));

			DDl_UtilityCompany_1.DataSource = dt;
			DDl_UtilityCompany_1.DataValueField = "ID";
			DDl_UtilityCompany_1.DataTextField = "UtilityCompany";
			DDl_UtilityCompany_1.DataBind();

			DDl_UtilityCompany_1.Items.Insert(0, new ListItem("Select Utility", "0"));
		}
		catch (Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}
	#endregion
	#region Fill Contact Person

	public void ShowContactPerson()
	{
		try
		{
			DataTable dt = objNewJob.ShowContactPerson();
			ddlContactPerson.DataSource = dt;
			ddlContactPerson.DataValueField = "ID";
			ddlContactPerson.DataTextField = "ContactPerson";
			ddlContactPerson.DataBind();
			ddlContactPerson.Items.Insert(0, new ListItem("Select Contact Person", "0"));
		}
		catch (Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}
	#endregion
	#region Fill Contact Type

	public void ShowContactType()
	{
		try
		{
			DataTable dt = objNewJob.ShowContactType();
			ddlContactType.DataSource = dt;
			ddlContactType.DataValueField = "ID";
			ddlContactType.DataTextField = "ContactType";
			ddlContactType.DataBind();
			ddlContactType.Items.Insert(0, new ListItem("Select Contact Type", "0"));
		}
		catch (Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}
	#endregion
	#region Fill Contact Result
	public void ShowContactResult()
	{
		try
		{
			DataTable dt = objNewJob.ShowContactResult();
			ddlContactResult.DataSource = dt;
			ddlContactResult.DataValueField = "ID";
			ddlContactResult.DataTextField = "ContactResult";
			ddlContactResult.DataBind();
			ddlContactResult.Items.Insert(0, new ListItem("Select Contact Result", "0"));
			

			if (Convert.ToString(Request.QueryString["UC"]) == "Private")
			{
				ddlContactResult.Items.RemoveAt(4);
			}
		}
		catch (Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}
	#endregion

	#region Fill Employee
	public void FillImployee()
	{
		try
		{
			//if (Cache["ShowEmployee"] == null)
			//{
			DataTable dt = objNewJob.ShowEmployee();
			dt.Columns["Name"].ColumnName = "FullName";
			dt.Columns["User_Id"].ColumnName = "ID";
			lstEmployeeForSendSaveComments.DataSource = dt;
			lstEmployeeForSendSaveComments.DataValueField = "ID";
			lstEmployeeForSendSaveComments.DataTextField = "FullName";
			lstEmployeeForSendSaveComments.DataBind();

			lstEmployeeForSendSaveCommentsCC.DataSource = dt;
			lstEmployeeForSendSaveCommentsCC.DataValueField = "ID";
			lstEmployeeForSendSaveCommentsCC.DataTextField = "FullName";
            lstEmployeeForSendSaveCommentsCC.Attributes.Add("EmailId", "Email");
			lstEmployeeForSendSaveCommentsCC.DataBind();
			//lstEmployeeForSendSaveComments.Items.Insert(0, new ListItem("", "0"));
			//    Cache["ShowEmployee"] = dt;
			//}
			//else
			//{
			//    lstEmployeeForSendSaveComments.DataSource = Cache["ShowEmployee"];
			//    lstEmployeeForSendSaveComments.DataValueField = "ID";
			//    lstEmployeeForSendSaveComments.DataTextField = "FullName";
			//    lstEmployeeForSendSaveComments.DataBind();
			//    //lstEmployeeForSendSaveComments.Items.Insert(0, new ListItem("", "0"));
			//}
		}
		catch(Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}

	}

	#endregion

	#region insert Job
	protected void txtSave_Click(object sender, EventArgs e)
	{
        DataTable dt=new DataTable();
		if (Request.QueryString["GT"] == "Vendor")
		{
            dt=objNewJob.GetVendorJobExistsorNot(Convert.ToString(Request.QueryString["JobNew"]));
            if (dt.Rows.Count>0)
            {
                InsertVendorJob("update");
            }
            else
            {
			InsertVendorJob("Insert");
            }
		}
		else
		{
			JobInsertORUpdate("Insert");
		}
	}

	public void JobInsertORUpdate(string Utl)
	{
		try
		{
			bool HeatSource = false;

			foreach (ListItem item in chkLst_HeatSource.Items)
			{
				if (item.Selected)
				{
					HeatSource = true;
				}
			}

			bool Heat_Type = false;

			foreach (ListItem item in chklst_Heat_Type.Items)
			{
				if (item.Selected)
				{
					Heat_Type = true;
				}
			}

			bool WaterHeaterType = false;

			foreach (ListItem item in chklst_WaterHeaterType.Items)
			{
				if (item.Selected)
				{
					WaterHeaterType = true;
				}
			}

			bool Air_Conditioning = false;

			foreach (ListItem item in chkLst_Air_Conditioning.Items)
			{
				if (item.Selected)
				{
					Air_Conditioning = true;
				}
			}




			if (HeatSource == false || Heat_Type == false || WaterHeaterType == false || Air_Conditioning == false)
			{
				Response.Write("<script>alert('Please Select Atleast One Option From each section of Heating,WaterHeater,Air Conditioning');</script>");
			}
			else
			{
				//if (Utl == "Insert")
				//{
				if (DDl_UtilityCompany_1.SelectedValue == "1")
				{
					InsertNewJobForMETED(Utl);
				}
				if (DDl_UtilityCompany_1.SelectedValue == "2")
				{
					InsertNewJobForPPL(Utl);
				}
				if (DDl_UtilityCompany_1.SelectedValue != "1" && DDl_UtilityCompany_1.SelectedValue != "2")
				{
					InsertNewJob(Utl);
				}
			}
		}
		catch(Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}

	public void InsertNewJobForMETED(string utl)
	{
		InsertNewJob(utl);
	}
	public void InsertNewJobForPPL(string utl)
	{
		if (rdoYes_OnTrack.Checked == false && rdoNo_OnTrack.Checked == false)
		{
			Response.Write("<script>alert('Please select any one option of on track');</script>");
		}
		else if (rdoTenant.Checked == false && rdoOwner.Checked == false)
		{
			Response.Write("<script>alert('Please Select Any One Option From TENANT or OWNER');</script>");
		}
		else if (DDl_UtilityCompany_1.SelectedValue == "2" && DDL_UtilityCompany_2.SelectedValue == "2")
		{
			if (DDL_PplZone.SelectedValue == "0")
			{
				Response.Write("<script>alert('Please Select Any Zone for PPL');</script>");
			}
			else
			{
				ddlzone = DDL_PplZone.SelectedValue;
				InsertNewJob(utl);
			}
		}
		else if (DDl_UtilityCompany_1.SelectedValue == "2" && DDL_UtilityCompany_2.SelectedValue == "2")
		{
			InsertNewJob(utl);
		}
		else if (DDl_UtilityCompany_1.SelectedValue == "2")
		{
			InsertNewJob(utl);
		}
	}

	/// <summary>
	///This is for giving defalult value for ("") coz its gives error while saving recrod
	/// </summary>
	/// 

	public void InsertNewJob(string utl)
	{
		string Str_HeatType = "";
		string Uid = "";
		smUtil objSm = new smUtil();
		Uid = objSm.GetCookie("UId");
		foreach (ListItem item in chklst_Heat_Type.Items)
		{
			if (item.Selected)
			{
				if (Str_HeatType == "")
				{
					Str_HeatType = item.Value;
				}
				else
				{
					Str_HeatType = Str_HeatType + "," + item.Value;
				}
			}
		}
		string Str_HeatSource = "";
		foreach (ListItem item in chkLst_HeatSource.Items)
		{
			if (item.Selected)
			{
				if (Str_HeatSource == "")
				{
					Str_HeatSource = item.Value;
				}
				else
				{
					Str_HeatSource = Str_HeatSource + "," + item.Value;
				}
			}
		}


		string Str_WaterHeaterType = "";
		foreach (ListItem item in chklst_WaterHeaterType.Items)
		{
			if (item.Selected)
			{
				if (Str_WaterHeaterType == "")
				{
					Str_WaterHeaterType = item.Value;
				}
				else
				{
					Str_WaterHeaterType = Str_WaterHeaterType + "," + item.Value;
				}
			}
		}
		string Str_Air_Conditioning = "";
		foreach (ListItem item in chkLst_Air_Conditioning.Items)
		{
			if (item.Selected)
			{
				if (Str_Air_Conditioning == "")
				{
					Str_Air_Conditioning = item.Value;
				}
				else
				{
					Str_Air_Conditioning = Str_Air_Conditioning + "," + item.Value;
				}
			}

		}
		string strOwnerTenent = "";
		//owner Tenent
		if (rdoOwner.Checked)
		{
			strOwnerTenent = "O";
		}
		else if (rdoTenant.Checked)
		{
			strOwnerTenent = "T";
		}
		string strOntrack = "";
		//Ontrack
		if (rdoNo_OnTrack.Checked)
		{
			// strOntrack = rdoNo_OnTrack.Text;
			strOntrack = "NO";
		}
		else if (rdoYes_OnTrack.Checked)
		{
			// strOntrack = rdoYes_OnTrack.Text;
			strOntrack = "YES";
		}

		//

		string strPCAP = "";
		if (rdoPCAP_Yes.Checked)
		{
			strPCAP = rdoPCAP_Yes.Text;
		}
		else if (rdoPCAP_No.Checked)
		{
			strPCAP = rdoPCAP_No.Text;
		}
		//TOD
		string strTOD = "";
		if (rdoTOD_Yes.Checked)
		{
			strTOD = rdoTOD_Yes.Text;
		}
		else if (rdoTOD_No.Checked)
		{
			strTOD = rdoTOD_No.Text;
		}

		FillDefaultvalueforBlanck();

		string strLoginName = objSmUtil.GetCookie("UserName");
		string SAllowance = "";
		SAllowance = txtSpendingAllowance.Text;
		string SAllowance2 = SAllowance.Replace("$", "");

		if (SAllowance2 == "")
		{
			SAllowance2 = "0";
		}

		string TSummerSeasonal, TWinterSeasonal, BaseLoad;
		TSummerSeasonal = TWinterSeasonal = BaseLoad = "0";
		if (hdnTSummerSeasonal.Value != "")
		{
			TSummerSeasonal = Convert.ToString(hdnTSummerSeasonal.Value);
		}

		if (hdnTWinterSeasonal.Value != "")
		{
			TWinterSeasonal = Convert.ToString(hdnTWinterSeasonal.Value);
		}

		if (hdnBaseLoad.Value != "")
		{
			BaseLoad = Convert.ToString(hdnBaseLoad.Value);
		}

		string WarmOrWarmPlus = "";
		if (rdo_Warm.Checked == true)
		{
			WarmOrWarmPlus = "Warm";
		}
		else if (rdo_WarmPlus.Checked == true)
		{
			WarmOrWarmPlus = "Warm Plus";
		}

		string ShipAddress = "";
		string ShipCity = "";
		int ShipState = 0;
		string Zipcode = "";
		string EmailId = txtEmailId.Text;
		if (chkSetServiceToMailingAddress.Checked == true)
		{
			ShipAddress = txtAddress_Mailing.Text;
			ShipCity = txtCity_Mailing.Text;
			ShipState = Convert.ToInt32(ddl_State_Mailing.SelectedValue);
			Zipcode = txtZipCode_Mailing.Text;
		}
		else
		{
			ShipAddress = txtAddress_Service.Text;
			ShipCity = txtCity_Service.Text;
			ShipState = Convert.ToInt32(ddl_State_Service.SelectedValue);
			Zipcode = txtZipCode_Service.Text;
		}

		string Str_SeasonalSpendingAllowance = "";
		if (txt_SeasonalSpendingAllowance.Text == "")
		{
			Str_SeasonalSpendingAllowance = "0.00";
		}
		else
		{
			Str_SeasonalSpendingAllowance = txt_SeasonalSpendingAllowance.Text;
		}
		Str_SeasonalSpendingAllowance = Str_SeasonalSpendingAllowance.Replace("$", "");
		Str_SeasonalSpendingAllowance = Str_SeasonalSpendingAllowance.Replace(",", "");
		decimal SeasonalSpendingAllowance = Convert.ToDecimal(Str_SeasonalSpendingAllowance);


		///////////////////////////////////////////////////////////////////////////////////////////

		string Str_PCAP_Amt = "";
		if (txtPCAP_Amount.Text == "")
		{
			Str_PCAP_Amt = "0.00";
		}
		else
		{
			Str_PCAP_Amt = txtPCAP_Amount.Text;
		}
		Str_PCAP_Amt = Str_PCAP_Amt.Replace("$", "");
		Str_PCAP_Amt = Str_PCAP_Amt.Replace(",", "");
		decimal PCAP_Amt = Convert.ToDecimal(Str_PCAP_Amt);

		//////////////////////////////////////////////////////////////////////////////////////////
        double shellallwance = 0.0;

        if (txtShellallwnance.Text != "")
        {
            shellallwance = Convert.ToDouble(txtShellallwnance.Text.Replace("$", ""));
        }
        double repairallowance = 0.0;

        if (txtRepairAllowance.Text != "")
        {
            repairallowance = Convert.ToDouble(txtRepairAllowance.Text.Replace("$", ""));
        }
        double HealthAllowance = 0.0;
        if (txtHealthAllowance.Text != "")
        {
            HealthAllowance = Convert.ToDouble(txtHealthAllowance.Text.Replace("$", ""));
        }
        double BudgetAllowance = 0.0;
        if (txtBudgetAllowance.Text != "")
        {
            BudgetAllowance = Convert.ToDouble(txtBudgetAllowance.Text.Replace("$", ""));
        }

		int NumberOfOccupants = 0;
		if (txtNumberOfOccupants.Text == "")
		{
			NumberOfOccupants = 0;
		}
		else
		{
			NumberOfOccupants = Convert.ToInt32(txtNumberOfOccupants.Text);
		}
		if (utl == "Insert")
		{
            objNewJob.InserJob(txtJobNumber.Text, WarmOrWarmPlus, txtDateReceived.Text, txtDateCompleted.Text, txt_AuditScheduledDate.Text, Convert.ToInt32(DDl_UtilityCompany_1.SelectedValue), Convert.ToInt32(DDL_UtilityCompany_2.SelectedValue), txtFirstName.Text, txtLastName.Text, txtAccountNumber.Text, txtAddress_Mailing.Text, ShipAddress, txtCity_Mailing.Text, ShipCity, Convert.ToInt32(ddl_State_Mailing.SelectedValue), Convert.ToInt32(ShipState), txtZipCode_Mailing.Text, Zipcode, txtEmailId.Text, txtHomeBuilt.Text, Convert.ToInt32(ddlCounty.SelectedValue), txtPhone_Home.Text, txtPhone_Cell.Text, Convert.ToInt32(NumberOfOccupants), Str_HeatSource, Str_HeatType, Str_WaterHeaterType, Str_Air_Conditioning, Convert.ToString(txt_TotalNumberOfUnit_AirConditioning.Text), Convert.ToString(txtYearlyKWH_Hours.Text), Convert.ToString(txtJuneKWH.Text), Convert.ToString(txtJulyKWH.Text), Convert.ToString(txtAugustKWH.Text), Convert.ToString(txtSeptemberKWH.Text), Convert.ToString(txtLow1KWHHours.Text), Convert.ToString(txtLow2KWH_Hours.Text), BaseLoad, TWinterSeasonal, TSummerSeasonal, SAllowance2, strOntrack, strOwnerTenent, txtLandlordName.Text, txtLandlordPhone.Text, txtLandlordEmailOrFax.Text, txtLandlordAddress.Text, txtLandlordCity.Text, Convert.ToInt32(ddl_State_PPLproprietary.SelectedValue), txtLandlordZipCode.Text, strPCAP, PCAP_Amt, strTOD, txtLast_4_SS.Text, Convert.ToString(txtSummer_SesonalUse.Text), Convert.ToString(txtWinter_SesonalUse.Text), Convert.ToString(txtAnnualBaseUse.Text), Convert.ToString(txtTotalAnnualUse.Text), txtDate_ContactAttempt.Text, txtTime_ContactAttempt.Text, Convert.ToInt32(ddlContactType.SelectedValue), Convert.ToInt32(ddlContactPerson.SelectedValue), Convert.ToInt32(ddlContactResult.SelectedValue), txtReturnDate.Text, chkAct129.Checked, chkAct129II.Checked, chkInspection.Checked, chkRemedial.Checked, chkBaseLoad.Checked, chkHighPriority.Checked, chkFullCost.Checked, strLoginName, chkLowCost.Checked, txtOnTrackAmount.Text, txtPhone_Work.Text, Convert.ToDecimal(SeasonalSpendingAllowance), ddlzone, Convert.ToInt32(objSmUtil.GetCookie("UId")), "Normal", shellallwance, repairallowance, HealthAllowance, BudgetAllowance);
			ScriptManager.RegisterStartupScript(this, GetType(), "Scrpt", "MessageAndRedirectPage();", true);
		}
		else if (utl == "update")
		{
			ddlzone = DDL_PplZone.SelectedValue;
			//ddlzone = Hdn_PplZone.Value;
            i_update = objNewJob.UpdateChangeWithJob(txtDateReceived.Text, txtDateCompleted.Text, txt_GobackRecive.Text, txt_GoBackSchedule.Text, txt_GobackReturned.Text, txt_AuditScheduledDate.Text, txtReturnDate.Text, txtRe_ScheduledDate.Text, txtScheduleDtae.Text, txtEnterSeheduling.Text, Convert.ToString(DDL_Auditor_Name.SelectedValue), chkAct129.Checked, chkAct129II.Checked, chkInspection.Checked, chkRemedial.Checked, chkBaseLoad.Checked, chkHighPriority.Checked, chkFullCost.Checked, WarmOrWarmPlus, txtFirstName.Text, txtLastName.Text, txtAccountNumber.Text, txtAddress_Mailing.Text, txtAddress_Service.Text, txtCity_Mailing.Text, txtCity_Service.Text, txtZipCode_Mailing.Text, txtZipCode_Service.Text, txtEmailId.Text, txtHomeBuilt.Text, txtPhone_Home.Text, txtPhone_Cell.Text, txtPhone_Work.Text, Convert.ToInt32(txtNumberOfOccupants.Text), strJobNumber, Convert.ToInt32(DDl_UtilityCompany_1.SelectedValue), Convert.ToInt32(DDL_UtilityCompany_2.SelectedValue), ddlzone, Convert.ToInt32(ddl_State_Mailing.SelectedValue), Convert.ToInt32(ddl_State_Service.SelectedValue), Convert.ToInt32(ddlCounty.SelectedValue), Str_HeatSource, Str_HeatType, Str_WaterHeaterType, Str_Air_Conditioning, Convert.ToString(txt_TotalNumberOfUnit_AirConditioning.Text), Convert.ToString(txtYearlyKWH_Hours.Text), Convert.ToString(txtJuneKWH.Text), Convert.ToString(txtJulyKWH.Text), Convert.ToString(txtAugustKWH.Text), Convert.ToString(txtSeptemberKWH.Text), Convert.ToString(txtLow1KWHHours.Text), Convert.ToString(txtLow2KWH_Hours.Text), BaseLoad, TWinterSeasonal, TSummerSeasonal, SAllowance2, strOntrack, strOwnerTenent, txtLandlordName.Text, txtLandlordPhone.Text, txtLandlordEmailOrFax.Text, txtLandlordAddress.Text, txtLandlordCity.Text, Convert.ToInt32(ddl_State_PPLproprietary.SelectedValue), txtLandlordZipCode.Text, strPCAP, PCAP_Amt, strTOD, txtLast_4_SS.Text, Convert.ToString(txtSummer_SesonalUse.Text), Convert.ToString(txtWinter_SesonalUse.Text), Convert.ToString(txtAnnualBaseUse.Text), Convert.ToString(txtTotalAnnualUse.Text), txtDate_ContactAttempt.Text, txtTime_ContactAttempt.Text, Convert.ToInt32(ddlContactType.SelectedValue), Convert.ToInt32(ddlContactPerson.SelectedValue), Convert.ToInt32(ddlContactResult.SelectedValue), strLoginName, chkLowCost.Checked, txtOnTrackAmount.Text, SeasonalSpendingAllowance, shellallwance, repairallowance, HealthAllowance, BudgetAllowance);
		}
	}
	#region insert vendor job
	public void InsertVendorJob(string utl1)//string utl1
	{

		if (utl1 == "Insert")
		{
			string imgName = "";
			string pdfname = "";

			if (AsyncFileUpload1.HasFile)
			{
				imgName = AsyncFileUpload1.FileName;
				AsyncFileUpload1.SaveAs(Server.MapPath("~/VendorImage/" + imgName));
			}
			else
			{
				imgName = "no_image.png";
			}
			if (filename != null && filename != "")
			{
                //foreach (AttachmentItem item in Attachments1.Items)
                //{
                //    item.CopyTo("~/VendorPDF/" + item.FileName);
                //}
                pdfname = filename;
			}
			objNewJob.InsertVendorJob(txtJobNumber.Text,
				DDl_Net.SelectedValue,
				txt_GobackRecive.Text,
				DDl_SendByDate.SelectedValue,
				DDl_Category.SelectedValue,
				txtAcc.Text,
				txtPhone.Text,
				txtCntctPer.Text,
				txtCompanyName.Text,
				txtAddress_Mailing.Text,
				hdnAddress_Service.Value,
				txtCity_Mailing.Text,
				hdnCity_Service.Value,
				Convert.ToInt32(ddl_State_Mailing.SelectedValue),
				hdn_State_Service.Value,
				txtZipCode_Mailing.Text,
				hdnZipCode_Service.Value, txtEmailVendor.Text,
				"Vendor", imgName, pdfname, txtCntctNum.Text, txtFaxNo.Text, txtExt.Text);
			filename = "";
			ScriptManager.RegisterStartupScript(this, GetType(), "Scrpt", "MessageAndRedirectPage();", true);
		}
		else if (utl1 == "update")
		{
			string imgName = "";
			string pdfname = "";
			filename = "";
			if (AsyncFileUpload1.HasFile)
			{
				imgName = AsyncFileUpload1.FileName;
				AsyncFileUpload1.SaveAs(Server.MapPath("~/VendorImage/" + imgName));

			}
			else
			{
				if (Convert.ToString(hdn_imgFileUpload.Value) == "")
				{
					imgName = "no_image.png";
				}
				else
				{
					imgName = Convert.ToString(hdn_imgFileUpload.Value);
				}
			}
			if (filename != null)
			{
                //foreach (AttachmentItem item in Attachments1.Items)
                //{
                //    item.CopyTo("~/VendorPDF/" + item.FileName);
                //    filename = item.FileName + "," + filename;
                //}
				pdfname = filename;
			}


			i_update = objNewJob.UpdateVendorJob(txtJobNumber.Text,
				DDl_Net.SelectedValue,
				txt_GobackRecive.Text,
				DDl_SendByDate.SelectedValue,
				DDl_Category.SelectedValue,
				txtAcc.Text,
				txtPhone.Text,
				txtCntctPer.Text,
				txtCompanyName.Text,
				txtAddress_Mailing.Text,
				txtAddress_Service.Text,
				txtCity_Mailing.Text,
				txtCity_Service.Text,
				Convert.ToInt32(ddl_State_Mailing.SelectedValue),
				Convert.ToInt32(ddl_State_Service.SelectedValue),
				txtZipCode_Mailing.Text,
				txtZipCode_Service.Text,
				txtEmailVendor.Text,
				"Vendor",
				imgName,
				pdfname,
				txtCntctNum.Text,
				txtFaxNo.Text,
				txtExt.Text
				);
			FillDataForUpdate();
		}
	}
	#endregion
	public void FillDefaultvalueforBlanck()
	{
		try
		{

			// ____________This is for PPL Seasonal Costs and Allowances_______________
			if (txtTotalAnnualUse.Text == "")
			{
				txtTotalAnnualUse.Text = "0";
			}

			if (txt_SeasonalSpendingAllowance.Text == "")
			{
				txt_SeasonalSpendingAllowance.Text = "0";
			}

			if (txtYearlyKWH_Hours.Text == "")
			{
				txtYearlyKWH_Hours.Text = "0";
			}
			if (txtJuneKWH.Text == "")
			{
				txtJuneKWH.Text = "0";
			}

			if (txtJulyKWH.Text == "")
			{
				txtJulyKWH.Text = "0";
			}

			if (txtAugustKWH.Text == "")
			{
				txtAugustKWH.Text = "0";
			}

			if (txtSeptemberKWH.Text == "")
			{
				txtSeptemberKWH.Text = "0";
			}
			if (txtLow1KWHHours.Text == "")
			{
				txtLow1KWHHours.Text = "0";
			}

			if (txtLow2KWH_Hours.Text == "")
			{
				txtLow2KWH_Hours.Text = "0";
			}
			if (txtBaseLoad.Text == "")
			{
				txtBaseLoad.Text = "0";
			}
			if (txtTWinterSeasonal.Text == "")
			{
				txtTWinterSeasonal.Text = "0";
			}
			if (txtTSummerSeasonal.Text == "")
			{
				txtTSummerSeasonal.Text = "0";
			}

			if (txtOnTrackAmount.Text == "")
			{
				txtOnTrackAmount.Text = "0";
			}

			//________________MET ED Proprietary Usage__________________

			if (txtPCAP_Amount.Text == "")
			{
				txtPCAP_Amount.Text = "0";
			}
			if (txtLast_4_SS.Text == "")
			{
				txtLast_4_SS.Text = "0";
			}

			if (txtSummer_SesonalUse.Text == "")
			{
				txtSummer_SesonalUse.Text = "0";
			}

			if (txtWinter_SesonalUse.Text == "")
			{
				txtWinter_SesonalUse.Text = "0";
			}
			if (txtAnnualBaseUse.Text == "")
			{
				txtAnnualBaseUse.Text = "0";
			}
			if (txtTotalAnnualUse.Text == "")
			{
				txtTotalAnnualUse.Text = "0";
			}
		}
		catch(Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}
	#endregion
	#region Fill Data For Update
	public void FillDataForUpdate()
	{

		smUtil objSm = new smUtil();
		string role = "";
		string AllPdFile = "";
		role = objSm.GetCookie("Rol_Id");
		try
		{
			if (Request.QueryString["GT"] == "Vendor" && (Request.QueryString["Back"] == "DisplayJobSearchRecords" || Request.QueryString["Back"] == "Admin/Admin_Unfinalize"))
			{
				DataTable dtU = objNewJob.ShowVendorByVendorNumber_ByVendorNumber(strJobNumber);
				if (dtU.Rows.Count > 0)
				{
					AllPdFile = Convert.ToString(dtU.Rows[0]["VendorPdfPath"]);
					string[] AllPdFile_ = AllPdFile.Split(',');
					DataTable dtPdf = new DataTable();
					dtPdf.Clear();
					dtPdf.Columns.Add("pdf");
					dtPdf.Columns.Add("AllPdf");
					for (int i = 0; i < AllPdFile_.Length - 1; i++)
					{
						DataRow row = dtPdf.NewRow();
						row["pdf"] = Convert.ToString(AllPdFile_[i]);
						row["AllPdf"] = AllPdFile;
						dtPdf.Rows.Add(row);
					}
					dtPdf.AcceptChanges();
					grdPdf.DataSource = dtPdf;
					grdPdf.DataBind();

					txtJobNumber.Text = dtU.Rows[0]["JobNumber"].ToString();
					txtJobNumber.ReadOnly = true;

					DDl_Net.SelectedValue = dtU.Rows[0]["VendorNet"].ToString();
					//DDl_Net.Enabled = false;
					txt_GobackRecive.Text = Convert.ToDateTime(dtU.Rows[0]["VendorDueDate"]).ToString("MM/dd/yyyy");
					if (dtU.Rows[0]["VendorNet"].ToString() == "5" || dtU.Rows[0]["VendorNet"].ToString() == "Monthly")
					{
						txt_GobackRecive.Visible = false;
						duedate.Visible = false;
					}
					//txt_GobackRecive.ReadOnly = true;
					//txtDateReceived.ReadOnly = true;
					//Calander.Enabled = false;
					DDl_SendByDate.SelectedValue = dtU.Rows[0]["VendorSendByDt"].ToString();
					//DDl_SendByDate.Enabled = false;
					DDl_Category.SelectedValue = dtU.Rows[0]["VendorCategory"].ToString();
					//DDl_Category.Enabled = false;
					txtAcc.Text = dtU.Rows[0]["AccountNumber"].ToString();
					//txtAcc.ReadOnly = true;
					txtPhone.Text = dtU.Rows[0]["CellPhone"].ToString();
					txtExt.Text = dtU.Rows[0]["LandLordPhone"].ToString();
					//txtPhone.ReadOnly = true;
					txtCntctPer.Text = dtU.Rows[0]["FirstName"].ToString();
					txtCntctNum.Text = dtU.Rows[0]["HomePhone"].ToString();
					txtFaxNo.Text = dtU.Rows[0]["WorkPhone"].ToString();
					//txtCntctPer.ReadOnly = true;
					txtCompanyName.Text = dtU.Rows[0]["VendorCompany"].ToString();
					txtCompanyName.ReadOnly = true;

					imgFileUpload.Visible = true;
					imgFileUpload.Src = "~/VendorImage/" + dtU.Rows[0]["VendorImgPath"].ToString();
					hdn_imgFileUpload.Value = dtU.Rows[0]["VendorImgPath"].ToString();
					//**************Mailing Address*******************


					txtAddress_Mailing.Text = dtU.Rows[0]["MailingAddress1"].ToString();
					//txtAddress_Mailing.ReadOnly = true;
					//  if (Convert.ToBoolean(dtU.Rows[0][""]) == true)
					//{
					//    chkSetServiceToMailingAddress.Checked = true;
					//}

					txtCity_Mailing.Text = dtU.Rows[0]["MailingCity"].ToString();
					//txtCity_Mailing.ReadOnly = true;

					txtZipCode_Mailing.Text = dtU.Rows[0]["MailingZipCode"].ToString();
					//txtZipCode_Mailing.ReadOnly = true;
					if (Convert.ToString(dtU.Rows[0]["MailingState"]) != "0")
					{
						ddl_State_Mailing.SelectedValue = dtU.Rows[0]["MailingState"].ToString();
						//ddl_State_Mailing.Enabled = false;

					}


					//**************Service Address*******************

					txtAddress_Service.Text = dtU.Rows[0]["ServiceAddress1"].ToString();
					hdnAddress_Service.Value = dtU.Rows[0]["ServiceAddress1"].ToString();
					//txtAddress_Service.ReadOnly = true;

					txtCity_Service.Text = dtU.Rows[0]["ServiceCity"].ToString();
					hdnCity_Service.Value = dtU.Rows[0]["ServiceCity"].ToString();
					//txtCity_Service.ReadOnly = true;

					txtZipCode_Service.Text = dtU.Rows[0]["ServiceZipCode"].ToString();

					if (Convert.ToString(Request.QueryString["GT"]) == "Vendor")
					{
						txtEmailVendor.Text = dtU.Rows[0]["email"].ToString();
					}
					else
					{
						txtEmailId.Text = dtU.Rows[0]["email"].ToString();
					}


					hdnZipCode_Service.Value = dtU.Rows[0]["ServiceZipCode"].ToString();
					//txtZipCode_Service.ReadOnly = true;

					if (Convert.ToString(dtU.Rows[0]["ServiceState"]) != "0")
					{
						ddl_State_Service.SelectedValue = dtU.Rows[0]["ServiceState"].ToString();
					}
					if (Convert.ToString(dtU.Rows[0]["ServiceCounty"]) != "0")
					{
						ddlCounty.SelectedValue = dtU.Rows[0]["ServiceCounty"].ToString();
					}

					if (txtAddress_Service.Text == hdnAddress_Service.Value && txtCity_Service.Text == hdnCity_Service.Value && txtZipCode_Service.Text == hdnZipCode_Service.Value)
					{
						chkSetServiceToMailingAddress.Checked = true;
					}
					else if (txtAddress_Service.Text != hdnAddress_Service.Value && txtCity_Service.Text != hdnCity_Service.Value && txtZipCode_Service.Text != hdnZipCode_Service.Value)
					{
						chkSetServiceToMailingAddress.Checked = false;
					}
					if (Request.QueryString["Back"] == "DisplayJobSearchRecords")
					{
						CalendarExtender8.Enabled = false;
					}
				}
			}
			else
			{
               
				DataTable dtU = objNewJob.ShowJobByJobNumber_ByJobNumber(strJobNumber);

				if (dtU.Rows.Count > 0)
				{

					if (Request.QueryString["Back"] == "DisplayJobSearchRecords")
					{
						CalendarExtender8.Enabled = true;
						txt_GobackRecive.ReadOnly = false;
					}

					//***********First Block*******************
					txtJobNumber.Text = dtU.Rows[0]["JobNumber"].ToString();
					txtJobNumber.ReadOnly = true;
                   
                    

					ViewState["DateAssigned"] = txtDateReceived.Text = Convert.ToDateTime(dtU.Rows[0]["DateAssigned"]).ToString("MM/dd/yyyy");
					if (!DBNull.Value.Equals(dtU.Rows[0]["Inspection1"]))
					{
						ViewState["Inspection"] = Convert.ToBoolean(dtU.Rows[0]["Inspection1"]);
					}
					

					hdnTxtDateReceived.Value = Convert.ToDateTime(dtU.Rows[0]["DateAssigned"]).ToString("MM/dd/yyyy");
					//txtDateReceived.ReadOnly = true;
					//Calander.Enabled = false;
					JobStatus = Convert.ToString(dtU.Rows[0]["Status"]);

					//Convert.ToString(dtU.Rows[0]["PPLZone"]) != "0" && ( )
					if (Convert.ToString(dtU.Rows[0]["UtilityCompany1"]) == "2" && Convert.ToString(dtU.Rows[0]["UtilityCompany2"]) == "2")  //&& Convert.ToString(dtU.Rows[0]["UtilityCompany1"])
					{
						DDL_PplZone.Visible = spn.Visible = true;
						if (Convert.ToString(Request.QueryString["Back"]) == "Admin/Admin_Unfinalize")
						{
							DDL_PplZone.Enabled = true;
						}
						else
						{
							DDL_PplZone.Enabled = false;
						}
						DDL_PplZone.SelectedValue = Convert.ToString(dtU.Rows[0]["PPLZone"]);
						Hdn_PplZone.Value = Convert.ToString(dtU.Rows[0]["PPLZone"]);
					}

					if (Convert.ToString(dtU.Rows[0]["DateCompleted"]) != "")
					{
						if (Convert.ToDateTime(dtU.Rows[0]["DateCompleted"]).ToString("MM/dd/yyyy") != "01/01/1900")
						{
							txtDateCompleted.Text = Convert.ToDateTime(dtU.Rows[0]["DateCompleted"]).ToString("MM/dd/yyyy");
							hdntxtDateCompleted.Value = Convert.ToDateTime(dtU.Rows[0]["DateCompleted"]).ToString("MM/dd/yyyy");
							//txtDateCompleted.Enabled = false; 
						}
					}


					///////////////////////////////////////////////////////////////////////////////////////////////////////



					if (Convert.ToString(dtU.Rows[0]["GoBackRecive"]) != "")
					{
						if (Convert.ToDateTime(dtU.Rows[0]["GoBackRecive"]).ToString("MM/dd/yyyy") != "01/01/1900")
						{
							txt_GobackRecive.Text = Convert.ToDateTime(dtU.Rows[0]["GoBackRecive"]).ToString("MM/dd/yyyy");
						}
					}



					if (Convert.ToString(dtU.Rows[0]["GoBackSchedule"]) != "")
					{
						if (Convert.ToDateTime(dtU.Rows[0]["GoBackSchedule"]).ToString("MM/dd/yyyy") != "01/01/1900")
						{
							txt_GoBackSchedule.Text = Convert.ToDateTime(dtU.Rows[0]["GoBackSchedule"]).ToString("MM/dd/yyyy");
						}
					}


					if (Convert.ToString(dtU.Rows[0]["GoBackReturne"]) != "")
					{
						if (Convert.ToDateTime(dtU.Rows[0]["GoBackReturne"]).ToString("MM/dd/yyyy") != "01/01/1900")
						{
							txt_GobackReturned.Text = Convert.ToDateTime(dtU.Rows[0]["GoBackReturne"]).ToString("MM/dd/yyyy");
						}
					}


					////////////////////////////////////////////////////////////////////////////////////////////////////////////////

					if (Convert.ToString(dtU.Rows[0]["CWReturnDate"]) != "")
					{
						if (Convert.ToDateTime(dtU.Rows[0]["CWReturnDate"]).ToString("MM/dd/yyyy") != "01/01/1900")
						{
							txtReturnDate.Text = Convert.ToDateTime(dtU.Rows[0]["CWReturnDate"]).ToString("MM/dd/yyyy");
							hdnTxtReturnDate.Value = Convert.ToDateTime(dtU.Rows[0]["CWReturnDate"]).ToString("MM/dd/yyyy");
							//txtReturnDate.Enabled = false;  
						}
					}

					if (Convert.ToString(dtU.Rows[0]["ReScheduledDate"]) != "")
					{
						if (Convert.ToDateTime(dtU.Rows[0]["ReScheduledDate"]).ToString("MM/dd/yyyy") != "01/01/1900")
						{
							txtRe_ScheduledDate.Text = Convert.ToDateTime(dtU.Rows[0]["ReScheduledDate"]).ToString("MM/dd/yyyy");
							//  txtRe_ScheduledDate.Enabled = false;
						}
					}
					if (Convert.ToString(dtU.Rows[0]["DateScheduled"]) != "")
					{
						if (Convert.ToDateTime(dtU.Rows[0]["DateScheduled"]).ToString("MM/dd/yyyy") != "01/01/1900")
						{
							//lblScheduleDtae.Visible = true;
							//txtScheduleDtae.Visible = true;
							txtScheduleDtae.Text = Convert.ToDateTime(dtU.Rows[0]["DateScheduled"]).ToString("MM/dd/yyyy");
						}
					}

					txtEnterSeheduling.Text = dtU.Rows[0]["DateScheduledComments"].ToString();
					//  txtEnterSeheduling.Enabled = false;

					//txtAuthorName.Text = dtU.Rows[0]["AuditorName"].ToString();
					//DDL_Auditor_Name.SelectedItem.Text = dtU.Rows[0]["AuditorName"].ToString();

					string Dt_Aid = dtU.Rows[0]["AuditorID"].ToString();

					if (Dt_Aid == "0" || Dt_Aid == "" || Dt_Aid == null)
					{
						DDL_Auditor_Name.SelectedValue = "Select";
					}
					else
					{
						DDL_Auditor_Name.SelectedValue = dtU.Rows[0]["AuditorID"].ToString();
					}



					string Dt_Cid = dtU.Rows[0]["CrewCheifName"].ToString();

					if (Dt_Cid == "0" || Dt_Cid == "" || Dt_Cid == null)
					{
						DDl_CrewCheif.SelectedValue = "Select";
					}
					else
					{
						DDl_CrewCheif.SelectedValue = dtU.Rows[0]["CrewCheifName"].ToString();
					}



					//txtAuthorName.ReadOnly = true;

					if (Convert.ToString(dtU.Rows[0]["UtilityCompany1"]) != "0")
					{
						DDl_UtilityCompany_1.SelectedValue = dtU.Rows[0]["UtilityCompany1"].ToString();

					}
					if (Convert.ToString(dtU.Rows[0]["UtilityCompany2"]) != "0")
					{
						DDL_UtilityCompany_2.SelectedValue = dtU.Rows[0]["UtilityCompany2"].ToString();

					}


					if (Convert.ToString(dtU.Rows[0]["UtilityCompany1"]) == "9" || Convert.ToString(dtU.Rows[0]["UtilityCompany1"]) == "3" || Convert.ToString(dtU.Rows[0]["UtilityCompany1"]) == "4")
					{
						LnkAudit.Visible = false;

					}

					//DDL_UtilityCompany_2.Enabled = false;
					//DDl_UtilityCompany_1.Enabled = false;

					//***********Job Type Section*******************
					if (Convert.ToBoolean(dtU.Rows[0]["Act129"]) == true)
					{
						chkAct129.Checked = true;
					}
					if (Convert.ToBoolean(dtU.Rows[0]["Act129II"]) == true)
					{
						chkAct129II.Checked = true;
					}
					if (Convert.ToBoolean(dtU.Rows[0]["BaseLoadOnly"]) == true)
					{
						chkBaseLoad.Checked = true;
					}

					if (Convert.ToBoolean(dtU.Rows[0]["HighPriority"]) == true)
					{
						chkHighPriority.Checked = true;
					}
					if (!DBNull.Value.Equals(dtU.Rows[0]["Remedial"]) && Convert.ToBoolean(dtU.Rows[0]["Remedial"].ToString()) == true)
					{
						chkRemedial.Checked = true;
					}
					if (!DBNull.Value.Equals(dtU.Rows[0]["Inspection"]) && Convert.ToBoolean(dtU.Rows[0]["Inspection"].ToString()) == true)
					{
						chkInspection.Checked = true;
					}
					if (Convert.ToBoolean(dtU.Rows[0]["LowCost"]) == true)
					{
						chkLowCost.Checked = true;
					}
					if (Convert.ToBoolean(dtU.Rows[0]["FullCost"]) == true)
					{
						chkFullCost.Checked = true;
					}

					txtFirstName.Text = dtU.Rows[0]["FirstName"].ToString();
                    DateTime AuditDate = Convert.ToDateTime("1/1/1900 12:00:00 AM");
                    DataTable dateschedule = new DataTable();
                    dateschedule = objNewJob.ShowLatestContactAttemptsReport(dtU.Rows[0]["JobNumber"].ToString(),4);
                    if (!DBNull.Value.Equals(dtU.Rows[0]["JobNumber"].ToString()))
                    {
                        
                        if (dateschedule.Rows.Count > 0 && !DBNull.Value.Equals(dateschedule.Rows[0]["ContactResultDate"]) && !DBNull.Value.Equals(dateschedule.Rows[0]["ContactResultID"]) && Convert.ToString(dateschedule.Rows[0]["ContactResultID"]) == "14")//Audit Schedule Date
                        {
                            AuditDate = Convert.ToDateTime(dateschedule.Rows[0]["ContactResultDate"]);//.ToString("MM/dd/yyyy")

                        }
                        else if (dateschedule.Rows.Count > 0 && !DBNull.Value.Equals(dateschedule.Rows[0]["ContactResultID"]) && Convert.ToString(dateschedule.Rows[0]["ContactResultID"]) == "11" && !DBNull.Value.Equals(dateschedule.Rows[0]["ContactResultDate"]))
                        {
                            txtScheduleDtae.Text = Convert.ToDateTime(dateschedule.Rows[0]["ContactResultDate"]).ToString("MM/dd/yyyy");
                        }


                    }

                    if (!DBNull.Value.Equals(dtU.Rows[0]["AuditScheduleDate"]) && (Convert.ToString(dtU.Rows[0]["AuditScheduleDate"]) != "" || Convert.ToString(dtU.Rows[0]["AuditScheduleDate"]) != "1/1/1900 12:00:00 AM") && AuditDate > Convert.ToDateTime(dtU.Rows[0]["AuditScheduleDate"]))
                    {
                        txt_AuditScheduledDate.Text = AuditDate.ToString("MM/dd/yyyy");
                    }
                    else if (!DBNull.Value.Equals(dtU.Rows[0]["AuditScheduleDate"]) && (Convert.ToString(dtU.Rows[0]["AuditScheduleDate"]) != "" || Convert.ToString(dtU.Rows[0]["AuditScheduleDate"]) != "1/1/1900 12:00:00 AM") && Convert.ToDateTime(dtU.Rows[0]["AuditScheduleDate"]) > Convert.ToDateTime("1/1/1900 12:00:00 AM"))
                    {
                        txt_AuditScheduledDate.Text = Convert.ToDateTime(dtU.Rows[0]["AuditScheduleDate"]).ToString("MM/dd/yyyy");
                    }
                    else 
                    {
                        txt_AuditScheduledDate.Text = "";
                    }

                    if (Convert.ToBoolean(ViewState["Inspection"]) == true)
                    {
                        if (dateschedule.Rows.Count > 0 && !DBNull.Value.Equals(dateschedule.Rows[0]["ContactResultID"]) && Convert.ToString(dateschedule.Rows[0]["ContactResultID"]) == "19" && !DBNull.Value.Equals(dateschedule.Rows[0]["ContactResultDate"]))
                        {
                            txt_AuditScheduledDate.Text = Convert.ToDateTime(dateschedule.Rows[0]["ContactResultDate"]).ToString("MM/dd/yyyy");

 
                        }
 
                    }

					hdnFName.Value = Convert.ToString(dtU.Rows[0]["FirstName"]);
					//txtFirstName.ReadOnly = true;
					txtLastName.Text = dtU.Rows[0]["LastName"].ToString();
					hdnLName.Value = Convert.ToString(dtU.Rows[0]["LastName"]);
					hdnJobNo.Value = Convert.ToString(strJobNumber);
					//txtLastName.ReadOnly = true;
					txtAccountNumber.Text = dtU.Rows[0]["AccountNumber"].ToString();
					//txtAccountNumber.ReadOnly = true;

					//**************Mailing Address*******************


					txtAddress_Mailing.Text = dtU.Rows[0]["MailingAddress1"].ToString();
					//txtAddress_Mailing.ReadOnly = true;
					//  if (Convert.ToBoolean(dtU.Rows[0][""]) == true)
					//{
					//    chkSetServiceToMailingAddress.Checked = true;
					//}

					txtCity_Mailing.Text = dtU.Rows[0]["MailingCity"].ToString();
					//txtCity_Mailing.ReadOnly = true;

					txtZipCode_Mailing.Text = dtU.Rows[0]["MailingZipCode"].ToString();
					//txtZipCode_Mailing.ReadOnly = true;

					if (Convert.ToString(dtU.Rows[0]["MailingState"]) != "0")
					{
						ddl_State_Mailing.SelectedValue = dtU.Rows[0]["MailingState"].ToString();
						//ddl_State_Mailing.Enabled = false;

					}
					txtHomeBuilt.Text = dtU.Rows[0]["YearHomeBuilt"].ToString();
					//txtHomeBuilt.ReadOnly = true;

					//**************Phone detail*******************

					txtPhone_Home.Text = dtU.Rows[0]["HomePhone"].ToString();
					//txtPhone_Home.ReadOnly = true;

					txtPhone_Cell.Text = dtU.Rows[0]["CellPhone"].ToString();
					//txtPhone_Cell.ReadOnly = true;

					txtPhone_Work.Text = dtU.Rows[0]["WorkPhone"].ToString();
					//txtPhone_Work.ReadOnly = true;

					//**************Service Address*******************

					txtAddress_Service.Text = dtU.Rows[0]["ServiceAddress1"].ToString();
					//txtAddress_Service.ReadOnly = true;

					txtCity_Service.Text = dtU.Rows[0]["ServiceCity"].ToString();
					//txtCity_Service.ReadOnly = true;

					txtZipCode_Service.Text = dtU.Rows[0]["ServiceZipCode"].ToString();
					txtEmailId.Text = dtU.Rows[0]["Email"].ToString();
					//txtZipCode_Service.ReadOnly = true;

					if (Convert.ToString(dtU.Rows[0]["ServiceState"]) != "0")
					{
						ddl_State_Service.SelectedValue = dtU.Rows[0]["ServiceState"].ToString();
					}
					if (Convert.ToString(dtU.Rows[0]["ServiceCounty"]) != "0")
					{
						ddlCounty.SelectedValue = dtU.Rows[0]["ServiceCounty"].ToString();
					}

					//ddl_State_Service.Enabled = false;
					//ddlCounty.Enabled = false;

					txtNumberOfOccupants.Text = dtU.Rows[0]["NumberOfOccupants"].ToString();
					//txtNumberOfOccupants.ReadOnly = true;

					//**************Checked SetService To MailingAddress Checkbox*******************

					//chkSetServiceToMailingAddress.Enabled = false;


					//**************Heating & WaterHeater & Air Conditioning*******************
					string StrTemp = "";
					StrTemp = dtU.Rows[0]["HeatSource"].ToString().Replace(" ", "");
					string[] k = StrTemp.Split(',');

					// k = dtU.Rows[0]["HeatSource"].ToString().Split(',');

					for (int m = 0; m < k.Length; m++)
					{
						for (int i = 0; i < chkLst_HeatSource.Items.Count; i++)
						{
							if (chkLst_HeatSource.Items[i].Value == k[m])
							{
								chkLst_HeatSource.Items[i].Selected = true;
							}
							if (role == "User")
							{
								chkLst_HeatSource.Items[i].Enabled = false;
							}
							else
							{
								chkLst_HeatSource.Items[i].Enabled = true;

							}

						}
					}

					StrTemp = dtU.Rows[0]["TypeOfHeat"].ToString().Replace(" ", "");
					k = StrTemp.Split(',');
					// k = dtU.Rows[0]["TypeOfHeat"].ToString().Split(',');
					for (int m = 0; m < k.Length; m++)
					{
						for (int i = 0; i < chklst_Heat_Type.Items.Count; i++)
						{
							if (chklst_Heat_Type.Items[i].Value == k[m])
							{
								chklst_Heat_Type.Items[i].Selected = true;
							}
							if (role == "User")
							{
								chklst_Heat_Type.Items[i].Enabled = false;
							}
							else
							{
								chklst_Heat_Type.Items[i].Enabled = true;
							}
							//chklst_Heat_Type.Items[i].Enabled = false;
						}
					}


					StrTemp = dtU.Rows[0]["WaterHeaterType"].ToString().Replace(" ", "");
					k = StrTemp.Split(',');
					// k = dtU.Rows[0]["WaterHeaterType"].ToString().Split(',');
					for (int m = 0; m < k.Length; m++)
					{
						for (int i = 0; i < chklst_WaterHeaterType.Items.Count; i++)
						{
							if (chklst_WaterHeaterType.Items[i].Value == k[m])
							{
								chklst_WaterHeaterType.Items[i].Selected = true;

							}
							if (role == "User")
							{
								chklst_WaterHeaterType.Items[i].Enabled = false;
							}
							else
							{
								chklst_WaterHeaterType.Items[i].Enabled = true;
							}
							//chklst_WaterHeaterType.Items[i].Enabled = false;
						}
					}


					StrTemp = dtU.Rows[0]["AirConditionerType"].ToString().Replace(" ", "");
					k = StrTemp.Split(',');
					// k = dtU.Rows[0]["AirConditionerType"].ToString().Split(',');
					for (int m = 0; m < k.Length; m++)
					{
						for (int i = 0; i < chkLst_Air_Conditioning.Items.Count; i++)
						{
							if (chkLst_Air_Conditioning.Items[i].Value == k[m])
							{
								chkLst_Air_Conditioning.Items[i].Selected = true;

							}
							if (role == "User")
							{
								chkLst_Air_Conditioning.Items[i].Enabled = false;
							}
							else
							{
								chkLst_Air_Conditioning.Items[i].Enabled = true;
							}
							//chkLst_Air_Conditioning.Items[i].Enabled = false;
						}

					}

					txt_TotalNumberOfUnit_AirConditioning.Text = dtU.Rows[0]["NumACUnits"].ToString();
					//txt_TotalNumberOfUnit_AirConditioning.ReadOnly = true;

					//**************PPL Seasonal Costs and Allowances*******************

					txtYearlyKWH_Hours.Text = dtU.Rows[0]["YearlyKWHHours"].ToString();
					//txtYearlyKWH_Hours.ReadOnly = true;


					txtJuneKWH.Text = dtU.Rows[0]["JuneKWHHours"].ToString();
					//txtJuneKWH.ReadOnly = true;


					txtJulyKWH.Text = dtU.Rows[0]["JulyKWHHours"].ToString();
					//txtJulyKWH.ReadOnly = true;


					txtAugustKWH.Text = dtU.Rows[0]["AugustKWHHours"].ToString();
					//txtAugustKWH.ReadOnly = true;

					txtSeptemberKWH.Text = dtU.Rows[0]["SeptemberKWHHours"].ToString();
					//txtSeptemberKWH.ReadOnly = true;

					txtLow1KWHHours.Text = dtU.Rows[0]["Low1KWHHours"].ToString();
					//txtLow1KWHHours.ReadOnly = true;


					txtLow2KWH_Hours.Text = dtU.Rows[0]["Low2KWHHours"].ToString();
					//txtLow2KWH_Hours.ReadOnly = true;


					txtBaseLoad.Text = dtU.Rows[0]["BaseLoad"].ToString();
					//txtBaseLoad.ReadOnly = true;


					txtTWinterSeasonal.Text = dtU.Rows[0]["TWSeasonal"].ToString();
					//txtTWinterSeasonal.ReadOnly = true;

					txtTSummerSeasonal.Text = dtU.Rows[0]["TSSeasonal"].ToString();
					//txtTSummerSeasonal.ReadOnly = true;


					txtSpendingAllowance.Text = "$" + Convert.ToString(Math.Round(Convert.ToDecimal(Convert.ToString(dtU.Rows[0]["SpendingAllowance"]).Replace("$", "")), 2));
					//txtSpendingAllowance.ReadOnly = true;



                    //double shellallowance = Math.Round(Convert.ToDouble(Convert.ToString(dtU.Rows[0]["YearlyKWHHours"])) * 0.20 * 1.0 + 200);
                    double shellallowance = Convert.ToDouble(Convert.ToString(dtU.Rows[0]["YearlyKWHHours"])) * 0.20 * 1.0 + 200;
                    txtShellallwnance.Text="$"+shellallowance;
                    double repairallowance=shellallowance*0.30;
                    txtRepairAllowance.Text="$"+repairallowance;
                    double HealthAllwonce=650.00;
                    txtHealthAllowance.Text="$"+HealthAllwonce;
                    double BudgetAllowance=shellallowance+repairallowance+HealthAllwonce;
                     txtBudgetAllowance.Text="$"+BudgetAllowance;





					//*******************PPL Proprietary Usage***********************
					if (Convert.ToString(dtU.Rows[0]["ONTRACK"]) == "YES")
					{
						rdoYes_OnTrack.Checked = true;
					}
					else if (Convert.ToString(dtU.Rows[0]["ONTRACK"]) == "NO")
					{
						rdoNo_OnTrack.Checked = true;
					}
					//rdoNo_OnTrack.Enabled = false;
					//rdoYes_OnTrack.Enabled = false;
					string OnTrackAmount = Convert.ToString(dtU.Rows[0]["OnTrackAmount"]);
					if (OnTrackAmount == "")
					{
						OnTrackAmount = "0.00";
					}
					txtOnTrackAmount.Text = "$" + Convert.ToString(Math.Round(Convert.ToDecimal(Convert.ToString(OnTrackAmount).Replace("$", "")), 2));
					//txtOnTrackAmount.ReadOnly = true;

					if (Convert.ToString(dtU.Rows[0]["OwnerTenant"]) == "O")
					{
						rdoOwner.Checked = true;
					}
					else if (Convert.ToString(dtU.Rows[0]["OwnerTenant"]) == "T")
					{
						rdoTenant.Checked = true;
					}
					//rdoOwner.Enabled = false;
					//rdoTenant.Enabled = false;
					//*******************Landlord Information MUST  be completed if the customer is a Tenant***********************

					txtLandlordName.Text = dtU.Rows[0]["LandLordName"].ToString();
					//txtLandlordName.ReadOnly = true;

					txtLandlordPhone.Text = dtU.Rows[0]["LandLordPhone"].ToString();
					//txtLandlordPhone.ReadOnly = true;

					txtLandlordEmailOrFax.Text = dtU.Rows[0]["LLEmailOrFax"].ToString();
					//txtLandlordEmailOrFax.ReadOnly = true;

					txtLandlordAddress.Text = dtU.Rows[0]["LLAddress"].ToString();
					//txtLandlordAddress.ReadOnly = true;

					txtLandlordCity.Text = dtU.Rows[0]["LLCity"].ToString();
					//txtLandlordCity.ReadOnly = true;

					txtLandlordZipCode.Text = dtU.Rows[0]["LLZipCode"].ToString();
					//txtLandlordZipCode.ReadOnly = true;


					if (Convert.ToString(dtU.Rows[0]["LLState"]) != "0")
					{
						ddl_State_PPLproprietary.SelectedValue = dtU.Rows[0]["LLState"].ToString();
						//ddl_State_PPLproprietary.Enabled = false;

					}

					//*******************MET ED Proprietary Usage***********************
					string Utility = Convert.ToString(Request.QueryString["UC"]);
					if (Utility == "MET ED")
					{
						pnlMetEd.Visible = true;
						pnlPPLShow.Visible = false;
						PanelJobTypeMETED.Visible = true;
						PanelJobTypePPL.Visible = false;
					}
					else
					{
						pnlMetEd.Visible = false;
						pnlPPLShow.Visible = false;
						PanelJobTypeMETED.Visible = false;
						PanelJobTypePPL.Visible = true;
					}

					string WarmOrWarmPlus = Convert.ToString(dtU.Rows[0]["WarmOrWarmPlus"]);
					//rdo_WarmPlus.Enabled = rdo_WarmPlus.Enabled = false;
					if (WarmOrWarmPlus == "Warm")
					{
						rdo_Warm.Checked = true;
					}
					else if (WarmOrWarmPlus == "Warm Plus")
					{
						rdo_WarmPlus.Checked = true;
					}


					if (Convert.ToString(dtU.Rows[0]["PCAP"]) == "No")
					{
						rdoPCAP_No.Checked = true;
					}
					else if (Convert.ToString(dtU.Rows[0]["PCAP"]) == "Yes")
					{
						rdoPCAP_Yes.Checked = true;
					}
					//rdoPCAP_No.Enabled = false;
					//rdoPCAP_Yes.Enabled = false;

					string LLZipCode = Convert.ToString(dtU.Rows[0]["LLZipCode"]);

					txtPCAP_Amount.Text = "$" + Math.Round(Convert.ToDecimal(dtU.Rows[0]["PCapAmount"]), 2).ToString();

					//txtPCAP_Amount.ReadOnly = true;

					if (Convert.ToString(dtU.Rows[0]["TODCUSTOMER"]) == "No")
					{
						rdoTOD_No.Checked = true;
					}
					else if (Convert.ToString(dtU.Rows[0]["TODCUSTOMER"]) == "Yes")
					{
						rdoTOD_Yes.Checked = true;
					}
					//rdoTOD_No.Enabled = false;
					//rdoTOD_Yes.Enabled = false;

					txtLast_4_SS.Text = dtU.Rows[0]["SSNumLast4"].ToString();
					//txtLast_4_SS.ReadOnly = true;

					txtSummer_SesonalUse.Text = dtU.Rows[0]["SummerSeasonalUse"].ToString();
					//txtSummer_SesonalUse.ReadOnly = true;

					txtWinter_SesonalUse.Text = dtU.Rows[0]["WinterSeasonalUse"].ToString();
					//txtWinter_SesonalUse.ReadOnly = true;

					txtAnnualBaseUse.Text = dtU.Rows[0]["AnnualBaseUse"].ToString();
					//txtAnnualBaseUse.ReadOnly = true;

					txtTotalAnnualUse.Text = dtU.Rows[0]["TotalAnnualUse"].ToString();
					//txtTotalAnnualUse.ReadOnly = true;

					if (Convert.ToString(dtU.Rows[0]["SeasonalSpendingAllowance"]) != "")
					{
						//txt_SeasonalSpendingAllowance.Text = "$" + Math.Round(Convert.ToDecimal(dtU.Rows[0]["SeasonalSpendingAllowance"]), 2).ToString();
						txt_SeasonalSpendingAllowance.Text = "$" + Convert.ToString(Convert.ToDecimal(Convert.ToString(dtU.Rows[0]["SeasonalSpendingAllowance"]).Replace("$", "")).ToString("#,##0.00"));
					}
					//txt_SeasonalSpendingAllowance.ReadOnly = true;

					//*******************Custom Weatherization Contact Attempt(s)         Contact Attempts Report ***********************

					ShowContactAttempt();

					//*******************Add a New Comment And/Or Send a message About this Job to Other Employee(s) ***********************

					//*******************Comments History ***********************


					// ********____ Code by Sudhanshu ON 16 May 2013 For Showing Panel According to Utility Company 1 _____*********** // 

					if (DDl_UtilityCompany_1.SelectedValue == "1")
					{
						pnlMetEd.Visible = true;
					}
					else if (DDl_UtilityCompany_1.SelectedValue == "2")
					{
						pnlPPLShow.Visible = true;
						if (rdoTenant.Checked)
						{
							courier.Attributes.Add("style", "display:block;");
						}
					}
					else if (DDl_UtilityCompany_1.SelectedValue == "3")
					{
						pnlPPLShow.Visible = false;
					}
					else
					{
						pnlMetEd.Visible = false;
						pnlPPLShow.Visible = false;
					}
					// ********____ End/ Code by Sudhanshu ON 16 May 2013 For Showing Panel According to Utility Company 1 _____*********** // 
					//ScriptManager.RegisterStartupScript(this, GetType(), "scrpt", "SetCheckboxReadOnly();", true);
					chkLst_HeatSource.Attributes.Add("onclick", "return SetCheckboxReadOnly();");
					chklst_WaterHeaterType.Attributes.Add("onclick", "return SetCheckboxReadOnly();");
					chklst_Heat_Type.Attributes.Add("onclick", "return SetCheckboxReadOnly();");
					chkLst_Air_Conditioning.Attributes.Add("onclick", "return SetCheckboxReadOnly();");
					//}
				}
			}


		}
		catch (Exception e)
		{
            Response.Write("<script>alert('" + e.Message + "');</script>");
		}

	}
	#endregion
    /// <summary>
    /// This is SendEmailFunctionality
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
	protected void btnSaveAndSend_Click(object sender, EventArgs e)
	{
		try
		{
			int msgId = 0;
			string msgToSend = string.Empty;
			string msgCCSend = string.Empty;

			string MsgTo = string.Empty;
			string MsgCC = string.Empty;


			foreach (ListItem item in lstEmployeeForSendSaveComments.Items)
			{
				if (item.Selected)
				{
					msgToSend += item.Value + ",";
					MsgTo += item.Text + ",";
				}
			}
			MsgTo = "To:- " + MsgTo;
			MsgTo = MsgTo.TrimEnd(',');
            string MsgCCBody = "";
			foreach (ListItem item in lstEmployeeForSendSaveCommentsCC.Items)
			{
				if (item.Selected)
				{
					msgCCSend += item.Value + ",";
					MsgCC += item.Text + ",";
                    MsgCCBody += item.Text + ",";
				}
			}
			if (msgCCSend != "")
			{
				MsgCC = "Cc:- " + MsgCC;
			}
			MsgCC = MsgCC.TrimEnd(',');
            MsgCCBody = MsgCCBody.TrimEnd(',');

			if (txtCommentsSendAnd.Text != "" && lstEmployeeForSendSaveComments.SelectedValue != "0")
			{
				msgId = objNewJob.InsertJobMessage(txtCommentsSendAnd.Text);
				string Customername="";
                string strUId = objSmUtil.GetCookie("UId");
				string MsgFrm = "From:- " + objSmUtil.GetCookie("UserName");

				string[] msgIdTosend = msgToSend.Split(',');
                DataTable dtjob= objNewJob.ShowJobByJobNumber_ByJobNumber(Request.QueryString["Jobs"].ToString());
                
                if (dtjob.Rows.Count > 0)
                {
                    Customername = dtjob.Rows[0]["FirstName"] + " " + dtjob.Rows[0]["LastName"];
                }

				for (int i = 0; i < msgIdTosend.Length - 1; i++)
				{
                    objNewJob.InsertJobMessageReadUnread1(Convert.ToInt32(strUId), Convert.ToInt32(msgIdTosend[i]), Request.QueryString["Jobs"].ToString(), msgId, "U", msgToSend, MsgFrm, MsgTo, MsgCC, strUId, msgToSend, msgCCSend);
				}
                string Emails = objNewJob.getEmailAddress(msgToSend);                                                                //This is SendEmailFunctionality

				string[] msgIdCCsend = msgCCSend.Split(',');
				for (int i = 0; i < msgIdCCsend.Length - 1; i++)
				{
					objNewJob.InsertJobMessageReadUnread1(Convert.ToInt32(strUId), Convert.ToInt32(msgIdCCsend[i]), Request.QueryString["Jobs"].ToString(), msgId, "U", msgCCSend, MsgFrm, MsgTo, MsgCC, strUId, msgToSend, msgCCSend);
				}
                string CCs = objNewJob.getEmailAddress(msgCCSend);

                string[] CC = CCs.Split(',');
                string body = "";
                if (CC != null)
                {
                    body = MsgFrm + "\n" + MsgTo + "," + MsgCCBody + "\n" + txtCommentsSendAnd.Text;
                }
                else
                {
                    body = MsgFrm + "\n" + MsgTo + "\n" + txtCommentsSendAnd.Text;
                }
                var textBoxText = body.Replace(Environment.NewLine, "<br/>");
                objNewJob.SendEmail("Jobnumber: " + Request.QueryString["Jobs"].ToString() + " Customer name:" + Customername, textBoxText, Emails, CC);//This is SendEmailFunctionality
				strJobNumber = Request.QueryString["Jobs"].ToString();
				string objUserName = objSmUtil.GetCookie("UserId");
				objNewJob.InsertJobComments(strJobNumber, txtCommentsSendAnd.Text, "", objUserName.ToString());
				txtCommentsSendAnd.Text = "";
				//showComments();   
                if (Request.QueryString["GT"] == "Vendor")
                {
                    InsertVendorContactAttempt();
                    strJobNumber = Request.QueryString["Jobs"].ToString();
                    //objNewJob.InsertJobComments(strJobNumber, txtCommentsSendAnd.Text, "", objUserName.ToString());
                    // showComments();
                    ShowContactAttempt();
                    txtCommentsSendAnd.Text = "";

                    lblMsg.Visible = true;
                    lblMsg.Text = "Comment Post Successfully";
                    pnlSuccessMsg_ModalPopupExtender.Show();
                }
                else
                {
                    Response.Write("<script>alert('Comment Post Successfully');</script>");                
                }
			}
			FillImployee();
            showComments();

		}
		catch(Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}


	#region Save Comments
	protected void BtnSaveComments_Click(object sender, EventArgs e)
	{
		try
		{
			string objUserName = objSmUtil.GetCookie("UserId");
			strJobNumber = Request.QueryString["Jobs"].ToString();

			objNewJob.InsertJobComments(strJobNumber, txtCommentsSendAnd.Text, "", objUserName.ToString());
			showComments();
			txtCommentsSendAnd.Text = "";
			
			lblMsg.Text = "Comment Post Successfully";
			pnlSuccessMsg_ModalPopupExtender.Show();
		}
		catch (Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}
	#endregion
	#region Show Comments
	public void showComments()
	{
		try
		{
			strJobNumber = Request.QueryString["Jobs"].ToString();
			DataTable dt = objNewJob.ShowCommentsHistory(strJobNumber);
			if (dt.Rows.Count > 0)
			{
               
				dlComments.DataSource = dt;
				dlComments.DataBind();
				btnPrintHistory.Visible = true;
			}
		}
		catch (Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}

	}
	#endregion


    

    protected void dlComments_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        StrUserName = objSmUtil.GetCookie("UserName");
        string obj = objSmUtil.GetCookie("UserId");
        if (e.Item.ItemType == ListItemType.Item ||
         e.Item.ItemType == ListItemType.AlternatingItem)
        {

            Label lblCCSi = (Label)e.Item.FindControl("lblCCSi");
            Label lblMessageFrom = (Label)e.Item.FindControl("lblMessageFrom");
            Label lblUserLogin = (Label)e.Item.FindControl("lblUserLogin");
            if (lblUserLogin.Text == obj && (lblMessageFrom.Text != ""))
            {
                lblCCSi.Visible = true;
            }
        }
    }

	protected void txtCancel_Click(object sender, EventArgs e)
	{
		try
		{
			if (Request.QueryString["UC"] != null)
			{
				Response.Redirect("JobsStatus.aspx?UC=" + Request.QueryString["UC"].ToString());
			}
			else if (Request.QueryString["JobNew"] != null)
			{
				Response.Redirect("Home.aspx");
			}
		}
		catch(Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}

	}
	#region Update Record
	protected void btnUpdate_Click(object sender, EventArgs e)
	{
		try
		{
			UpdateBindJob();
			if (i_update == 1)
			{
				lblMsg.Text = "Record Updated !";
			}
			else
			{
				lblMsg.Text = "Record Not Updated...";
			}
			pnlSuccessMsg_ModalPopupExtender.Show();
			//ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Record Updated !');", true);
		}
		catch(Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}
	#endregion
	public void UpdateBindJob()
	{
		try
		{
			strJobNumber = Request.QueryString["Jobs"].ToString();
			string str_ScheduledDate = "";
			if (ddlContactResult.SelectedValue == "4")
			{
				//lblScheduleDtae.Visible = true;
				//txtScheduleDtae.Visible = true;
				str_ScheduledDate = txtScheduleDtae.Text;
			}
			if (ddlContactResult.SelectedValue == "4" && (str_ScheduledDate == "" || txtScheduleDtae.Text.ToLower() == "enter schedule date"))
			{
				//txtScheduleDtae.Text = "enter schedule date";
				//Response.Write("<script>alert('You must select Scheduled Date first .');</script>");           
				lblMsg.Text = "You must select Scheduled Date first .";
				pnlSuccessMsg_ModalPopupExtender.Show();
			}
			else if (ddlContactResult.SelectedValue == "11" && (txtRe_ScheduledDate.Text == "" || txtRe_ScheduledDate.Text.ToLower() == "enter re-schedule date"))
			{
				//txtRe_ScheduledDate.Text = "enter re-schedule date";
				//Response.Write("<script>alert('You must select Re-Scheduled Date first .');</script>");
				lblMsg.Text = "You must select Re-Scheduled Date first .";
				pnlSuccessMsg_ModalPopupExtender.Show();
			}
			else
			{
				if (txtScheduleDtae.Text.ToLower() == "enter schedule date")
				{
					txtScheduleDtae.Text = "";
					str_ScheduledDate = "";
				}
				if (txtRe_ScheduledDate.Text.ToLower() == "Enter Re-Schedule Date")
				{
					txtRe_ScheduledDate.Text = "";
				}
				str_ScheduledDate = txtScheduleDtae.Text;
				string WarmOrWarmPlus = "";
				if (rdo_Warm.Checked == true)
				{
					WarmOrWarmPlus = "Warm";
				}
				else if (rdo_WarmPlus.Checked == true)
				{
					WarmOrWarmPlus = "Warm Plus";
				}
				i_update = 0;
				JobInsertORUpdate("update");
				if (i_update == 1)
				{
					if (ddlContactType.SelectedValue != "0" && ddlContactPerson.SelectedValue != "0" && ddlContactResult.SelectedValue != "0")
					{
						objCAR.InsertJobContactAttempts(Request.QueryString["Jobs"].ToString(), txtDate_ContactAttempt.Text + " " + txtTime_ContactAttempt.Text, ddlContactType.SelectedValue, ddlContactPerson.SelectedValue, ddlContactResult.SelectedValue, txtDate_Result.Text);
					}
				}
				else
				{
					Response.Write("<script>alert('You must select Date Properly .');</script>");
				}
			}
			ShowContactAttempt();
		}
		catch(Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}
	public void ShowContactAttempt()
	{
		try
		{
            dtContactAttempts = new DataTable();
			dtContactAttempts = objNewJob.ShowContactAttemptsReport(strJobNumber, Convert.ToString(Request.QueryString["GT"]));
			txtTime_ContactAttempt.Text = DateTime.Now.ToString("hh:mm:ss tt");
			txtDate_ContactAttempt.Text = DateTime.Now.ToString("MM/dd/yyyy");
		}
		catch(Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}
	}
	protected void DDl_UtilityCompany_1_SelectedIndexChanged(object sender, EventArgs e)
	{
		try
		{
			txtAccountNumber.Text = "";
			if (chkSetServiceToMailingAddress.Checked == true)
			{
				txtAddress_Service.Text = txtAddress_Mailing.Text;
				txtCity_Service.Text = txtCity_Mailing.Text;
				ddl_State_Service.SelectedValue = ddl_State_Mailing.SelectedValue;
				txtZipCode_Service.Text = txtZipCode_Mailing.Text;
				txtAddress_Service.Enabled = txtCity_Service.Enabled = txtZipCode_Service.Enabled = txtZipCode_Mailing.Enabled = false;
				ddl_State_Service.Enabled = false;
			}

			if (DDl_UtilityCompany_1.SelectedValue == "1")
			{
				txtAccountNumber.MaxLength = 12;
				pnlMetEd.Visible = true;
				pnlPPLShow.Visible = false;
				RequiredFieldValidator22.Enabled = false;
				PanelJobTypeMETED.Visible = true;
				PanelJobTypePPL.Visible = false;
				chkAct129.Checked = chkBaseLoad.Checked = chkHighPriority.Checked = chkLowCost.Checked = chkFullCost.Checked = chkAct129II.Checked = false;
			}
			else if (DDl_UtilityCompany_1.SelectedValue == "2")
			{
				txtAccountNumber.MaxLength = 11;
				pnlMetEd.Visible = false;
				pnlPPLShow.Visible = true;
				RequiredFieldValidator22.Enabled = true;
				PanelJobTypeMETED.Visible = false;
				PanelJobTypePPL.Visible = true;
				rdo_Warm.Checked = rdo_WarmPlus.Checked = false;
			}
			else
			{
				pnlMetEd.Visible = false;
				pnlPPLShow.Visible = false;
				RequiredFieldValidator22.Enabled = true;
				PanelJobTypeMETED.Visible = false;
				PanelJobTypePPL.Visible = true;
				rdo_Warm.Checked = rdo_WarmPlus.Checked = false;
			}
			if (DDl_UtilityCompany_1.SelectedValue == DDL_UtilityCompany_2.SelectedValue && DDl_UtilityCompany_1.SelectedItem.Text == "PPL" && DDL_UtilityCompany_2.SelectedItem.Text == "PPL")
			{
				DDL_PplZone.Visible = true;
				spn.Visible = true;
			}
			else
			{
				spn.Visible = DDL_PplZone.Visible = false;
			}
		}
		catch(Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		}

	}
	protected void DDL_UtilityCompany_2_SelectedIndexChanged(object sender, EventArgs e)
	{
		try
		{
			if (chkSetServiceToMailingAddress.Checked == true)
			{
				txtAddress_Service.Text = txtAddress_Mailing.Text;
				txtCity_Service.Text = txtCity_Mailing.Text;
				ddl_State_Service.SelectedValue = ddl_State_Mailing.SelectedValue;
				txtZipCode_Service.Text = txtZipCode_Mailing.Text;

				txtAddress_Service.Enabled = txtCity_Service.Enabled = txtZipCode_Service.Enabled = txtZipCode_Mailing.Enabled = false;
				ddl_State_Service.Enabled = false;
			}
			if (DDL_UtilityCompany_2.SelectedValue == "1")
			{
				pnlMetEd.Visible = true;
				pnlPPLShow.Visible = false;
			}
			else if (DDL_UtilityCompany_2.SelectedValue == "2")
			{
				pnlMetEd.Visible = false;
				pnlPPLShow.Visible = true;
			}
			else
			{
				pnlMetEd.Visible = false;
				pnlPPLShow.Visible = false;
			}
			if (DDl_UtilityCompany_1.SelectedValue == DDL_UtilityCompany_2.SelectedValue && DDl_UtilityCompany_1.SelectedItem.Text == "PPL" && DDL_UtilityCompany_2.SelectedItem.Text == "PPL")
			{
				spn.Visible = DDL_PplZone.Visible = true;
			}
			else
			{
				spn.Visible = DDL_PplZone.Visible = false;
			}
		}
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
	}
	protected void btnQuestionaire_Click(object sender, EventArgs e)
	{
		try
		{
			if (Convert.ToString(Request.QueryString["Back"]) == "JobsStatus")
			{
				DataTable dt_Invoice = objInvoice.SearchTotalInvoice(Convert.ToString(Request.QueryString["Jobs"]));
				//int invoice = Convert.ToInt32(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
				string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
				if (IncoiceNo == "")
				{
					IncoiceNo = "1";
				}
				Response.Redirect("PPLQuestionairePage.aspx?Jobs=" + Request.QueryString["Jobs"] + "&UC=" + Request.QueryString["UC"].ToString() + "&InvoiceNo=" + IncoiceNo);
			}
			else
			{
				Response.Redirect("PPLQuestionairePage.aspx?Jobs=" + Request.QueryString["Jobs"] + "&UC=" + Request.QueryString["UC"].ToString() + "&InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString());
			}
		}
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
	}
	protected void Button1_Click(object sender, EventArgs e)
	{
		UpdateBindJob();
	}
	protected void Button2_Click(object sender, EventArgs e)
	{
		string RescheduledDate = ""; string ScheduledDate = ""; string AuditScheduleDate = ""; string GoBackSchedule = "";
		AuditScheduleDate = txt_AuditScheduledDate.Text;
		ScheduledDate = txtScheduleDtae.Text;
		RescheduledDate = txtRe_ScheduledDate.Text;

		if (ddlContactResult.SelectedValue == "14")
		{
			JobStatus = "Audit Scheduled";
			AuditScheduleDate = txtDate_Result.Text;
			ContactResult = txtDate_Result.Text;
		}
		if (ddlContactResult.SelectedValue == "15")
		{
			JobStatus = "Go Back Scheduled";
			GoBackSchedule = txtDate_Result.Text;
			ContactResult = txtDate_Result.Text;
		}
		if (ddlContactResult.SelectedValue == "11")
		{
			JobStatus = "Work Re-Scheduled";
			RescheduledDate = txtDate_Result.Text;
			ContactResult = txtDate_Result.Text;
		}
		if (ddlContactResult.SelectedValue == "4")
		{
			JobStatus = "Work Scheduled";
			ScheduledDate = txtDate_Result.Text;
			ContactResult = txtDate_Result.Text;
		}
        if (ddlContactResult.SelectedValue == "19")
        {
            JobStatus = "Inspection Scheduled";
            AuditScheduleDate = txtDate_Result.Text;
            ContactResult = txtDate_Result.Text;
        }
		if (ddlContactResult.SelectedValue == "14" || ddlContactResult.SelectedValue == "15" || ddlContactResult.SelectedValue == "11" || ddlContactResult.SelectedValue == "4")
		{
			contactResult = ddlContactResult.SelectedItem.Text;
			Name = txtFirstName.Text + " " + txtLastName.Text;
			ServiceAddress = txtAddress_Service.Text + " " + txtCity_Service.Text + " " + ddl_State_Service.SelectedItem.Text + " " + txtZipCode_Service.Text;
			Phone = txtPhone_Home.Text + ',' + txtPhone_Cell.Text + ',' + txtPhone_Work.Text;
			if (Phone.Contains(",,"))
			{
				Phone = Phone.Replace(",,", ",");
			}
			Phone = Phone.TrimStart(',');
			Phone = Phone.TrimEnd(',');
			if (chkAct129.Checked == true || chkBaseLoad.Checked == true || chkHighPriority.Checked == true || chkLowCost.Checked == true || chkFullCost.Checked == true || chkAct129II.Checked == true)
			{
				if (chkAct129.Checked == true)
				{
					jobtype_ = chkAct129.Text + ',';

				}
				if (chkBaseLoad.Checked == true)
				{
					jobtype_ += chkBaseLoad.Text;


				}
				if (chkHighPriority.Checked == true)
				{

					jobtype_ += chkHighPriority.Text;


				}
				if (chkLowCost.Checked == true)
				{
					jobtype_ += chkLowCost.Text;


				}
				if (chkFullCost.Checked == true)
				{
					jobtype_ += chkFullCost.Text;

				}
				if (chkAct129II.Checked == true)
				{
					jobtype_ += chkAct129II.Text;

				}
				if (chkInspection.Checked == true)
				{
					jobtype_ += chkInspection.Text;

				}



				//jobtype_ = chkAct129.Text + ',' + chkBaseLoad.Text + ',' + chkHighPriority.Text + ',' + chkLowCost.Text + ',' + chkFullCost.Text + ',' + chkAct129II.Text;

				if (jobtype_.Contains(",,"))
				{
					jobtype_ = jobtype_.Replace(",,", ",");
				}
				jobtype_ = jobtype_.TrimStart(',');
				jobtype_ = jobtype_.TrimEnd(',');
			}
			else if (rdo_Warm.Checked == true)
			{

				jobtype_ = "Warm";

			}
			else if (rdo_WarmPlus.Checked == true)
			{

				jobtype_ = "WarmPlus";
			}

			Stauts = "true";
			time = ddltime.SelectedItem.Text;


			contactP = ddlContactPerson.SelectedValue;

		}

		objNewJob.insertStatusAndDate(Convert.ToString(Request.QueryString["Jobs"]), JobStatus, txtDate_Result.Text, AuditScheduleDate, GoBackSchedule, RescheduledDate, ScheduledDate, Name, ServiceAddress, Phone, ContactResult, DDl_CrewCheif.SelectedItem.Text, DDL_Auditor_Name.SelectedItem.Text, jobtype_, "1", Stauts, time, contactResult, contactP);
		//objCAR.InsertJobContactAttempts(Request.QueryString["Jobs"].ToString(), txtDate_ContactAttempt.Text + " " + txtTime_ContactAttempt.Text, ddlContactType.SelectedValue, ddlContactPerson.SelectedValue, ddlContactResult.SelectedValue);
		objCAR.InsertJobContactAttempts(Convert.ToString(Request.QueryString["Jobs"]), txtDate_ContactAttempt.Text + " " + txtTime_ContactAttempt.Text, ddlContactType.SelectedValue, ddlContactPerson.SelectedValue, ddlContactResult.SelectedValue, txtDate_Result.Text);

		FillDataForUpdate();
		ddltime.SelectedIndex = 0;
		lblDateMsg.Text = "Date Update successfully.";
		txt_AllDates.Text = txtDate_Result.Text = ""; DDL_AllDates.SelectedValue = "Select"; ddlContactResult.SelectedIndex = 0;//Select Contact Result
        //ClientScript.RegisterStartupScript(typeof(Page), "MessagePopUp", "alert('Your Massage');", true);
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "@#$", "alert('HIIIIII');", true);
        Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "Loading_Hide();", true);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowStatus", "javascript:alert('Record is updated');", true);
        //Response.Write("<script>alert('Done'); ");
		ShowContactAttempt();
        //UpdateBindJob();
        Response.Redirect("AddNewJob.aspx?Back=" + Convert.ToString(Request.QueryString["Back"]) + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&UC=" + Convert.ToString(Request.QueryString["UC"]) + "");
        
		//Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Loading_Hide()", true);
	}
	protected void LnkBack_Click(object sender, EventArgs e)
	{
		try
		{
			if (Convert.ToString(Request.QueryString["Back"]) != "")
			{
				string Utility = "";
				if (Convert.ToString(Request.QueryString["Back"]) == "DisplayJobSearchRecords" && Convert.ToString(Request.QueryString["UC"]) != null)
				{
					if (Convert.ToString(Request.QueryString["UC"]) == "PPL")
					{
						Utility = "2";
					}
					else if (Convert.ToString(Request.QueryString["UC"]) == "MET ED")
					{
						Utility = "1";
					}

					else if (Convert.ToString(Request.QueryString["UC"]) == "DCED")
					{
						Utility = "3";
					}
					else if (Convert.ToString(Request.QueryString["UC"]) == "UGI")
					{
						Utility = "4";
					}
					else if (Convert.ToString(Request.QueryString["UC"]) == "ARRA")
					{
						Utility = "5";
					}
					else if (Convert.ToString(Request.QueryString["UC"]) == "CADCOM")
					{
						Utility = "6";
					}
					else if (Convert.ToString(Request.QueryString["UC"]) == "PRIVATE CUSTOMER")
					{
						Utility = "7";
					}
					else if (Convert.ToString(Request.QueryString["UC"]) == "WAP")
					{
						Utility = "8";
					}
					else if (Convert.ToString(Request.QueryString["UC"]) == "BCOC")
					{
						Utility = "9";
					}
					else
					{
						Response.Redirect("Home.aspx");
					}

					Response.Redirect(Convert.ToString(Request.QueryString["Back"]) + ".aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
				}
				else if (Convert.ToString(Request.QueryString["GT"]) == "Vendor")
				{
					Response.Redirect(Convert.ToString(Request.QueryString["Back"]) + ".aspx?InvoiceNo=1&GT=Vendor&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]));
				}
				else
				{
					if (Convert.ToString(Request.QueryString["UC"]) == "Private")
					{
						Response.Redirect(Convert.ToString(Request.QueryString["Back"]) + ".aspx?UC=PRIVATE CUSTOMER");
					}
					else
					{ 
                        Response.Redirect(Convert.ToString(Request.QueryString["Back"]) + ".aspx?UC=" + Convert.ToString(Request.QueryString["UC"]));
                    }
				}
			}
		}
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
	}
	protected void LnkHome_Click(object sender, EventArgs e)
	{
		try
		{
			Response.Redirect("Home.aspx");
		}
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
	}
	protected void LnkAudit_Click(object sender, EventArgs e)
	{
		try
		{

			if (Convert.ToString(Request.QueryString["Jobs"]) != "" && Convert.ToString(Request.QueryString["UC"]) != "")
			{
				string Utility = "";
				if (Convert.ToString(Request.QueryString["UC"]) == "PPL" || Convert.ToString(Request.QueryString["UC"]) == "PPL Zone 1" || Convert.ToString(Request.QueryString["UC"]) == "PPL Zone 2" || Convert.ToString(Request.QueryString["UC"]) == "PPL CACLV")
				{

					Utility = "2";

					DataTable dtU = objNewJob.ShowJobByJobNumber_ByJobNumber(strJobNumber);
					if (!DBNull.Value.Equals(dtU.Rows[0]["Inspection"]) || Convert.ToString(dtU.Rows[0]["Inspection"])!="")
					{
					ViewState["Inspection"] = Convert.ToBoolean(dtU.Rows[0]["Inspection"]);
					}
					if (Convert.ToString(Request.QueryString["InvoiceNo"]) != null && Convert.ToString(Request.QueryString["InvoiceNo"]) != "")
					{

						if (dtU.Rows.Count > 0 && !DBNull.Value.Equals(dtU.Rows[0]["Inspection"]) && Convert.ToBoolean(dtU.Rows[0]["Inspection"]) == true)
						{

							DataTable dt_Invoice = objInvoice.SearchTotalInvoice(Convert.ToString(Request.QueryString["Jobs"]));
							//int invoice = Convert.ToInt32(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
							string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());

							//if (ViewState["Inspection"] != null && Convert.ToBoolean(ViewState["Inspection"]) == true)
							//{
							if (IncoiceNo == "")
							{
								IncoiceNo = "1";
							}
							Response.Redirect("PPLAudit/PPL_Inspection.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
							//}
						}
						else
						{
							DataTable dt_Invoice = objInvoice.SearchTotalInvoice(Convert.ToString(Request.QueryString["Jobs"]));							
							string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
							if (IncoiceNo == "")
							{
								IncoiceNo = "1";
							}
							Response.Redirect("PPLAudit/PPL_Audit_1.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
						}
					}
				
					else
					{
						if (Convert.ToString(Request.QueryString["Back"]) == "JobsStatus")
						{
							string IncoiceNo;
							DataTable dt_Invoice = objInvoice.SearchTotalInvoice(Convert.ToString(Request.QueryString["Jobs"]));
							IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());

							if (dtU.Rows.Count > 0 && !DBNull.Value.Equals(dtU.Rows[0]["Inspection"]) && Convert.ToBoolean(dtU.Rows[0]["Inspection"]) == true)
							{

								if (IncoiceNo == "")
								{
									IncoiceNo = "1";
								}
								Response.Redirect("PPLAudit/PPL_Inspection.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
							}

							else
							{
								if (IncoiceNo == "")
								{
									IncoiceNo = "1";
								}
								Response.Redirect("PPLAudit/PPL_Audit_1.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
							}
						}
					}
                }
				else if (Convert.ToString(Request.QueryString["UC"]) == "MET ED")
				{
					Utility = "1";
					if (Convert.ToString(Request.QueryString["InvoiceNo"]) != null)
					{
						DataTable dt_Invoice = objInvoice.SearchTotalInvoice(Convert.ToString(Request.QueryString["Jobs"]));
						//int invoice = Convert.ToInt32(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
						string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
						if (IncoiceNo == "")
						{
							IncoiceNo = "1";
						}
						if (Convert.ToDateTime(ViewState["DateAssigned"]) >= new DateTime(2016, 11, 1, 0, 0, 0))
						{
							Response.Redirect("NewMETED/METED_Audit_Page1.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
						}
						else
						{
							Response.Redirect("METED/METED_Audit_Page1.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
						}
					}
					else
					{
						if (Convert.ToString(Request.QueryString["Back"]) == "JobsStatus")
						{
							DataTable dt_Invoice = objInvoice.SearchTotalInvoice(Convert.ToString(Request.QueryString["Jobs"]));
							string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
							if (IncoiceNo == "")
							{
								IncoiceNo = "1";
							}
							if (Convert.ToDateTime(ViewState["DateAssigned"]) >= new DateTime(2016, 11, 1, 0, 0, 0))
							{
								Response.Redirect("NewMETED/METED_Audit_Page1.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
							}
							else
							{
								Response.Redirect("METED/METED_Audit_Page1.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
							}
						}
					}
				}
				else
				{
					Response.Redirect("Home.aspx");
				}
			}
			else
			{
				Response.Redirect("Home.aspx");
			}
		}
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
	}
	protected void btnFewFld_Click(object sender, EventArgs e)
	{
        try
        {
            if (Request.QueryString["GT"] == "Vendor" && (Request.QueryString["Back"] == "DisplayJobSearchRecords" || Request.QueryString["Back"] == "Admin/Admin_Unfinalize"))
            {
                InsertVendorJob("update");
                lblDateMsg.Text = "Record Updated Successfully";
            }
            else
            {

                strJobNumber = Request.QueryString["Jobs"].ToString();
                string str_ScheduledDate = "";
                if (ddlContactResult.SelectedValue == "4")
                {
                    //lblScheduleDtae.Visible = true;
                    //txtScheduleDtae.Visible = true;
                    str_ScheduledDate = txtScheduleDtae.Text;
                }
                if (ddlContactResult.SelectedValue == "4" && (str_ScheduledDate == "" || txtScheduleDtae.Text.ToLower() == "enter schedule date"))
                {
                    //txtScheduleDtae.Text = "enter schedule date";
                    //Response.Write("<script>alert('You must select Scheduled Date first .');</script>");
                    lblMsg.Text = "You must select Scheduled Date first .";
                    pnlSuccessMsg_ModalPopupExtender.Show();
                }
                else if (ddlContactResult.SelectedValue == "11" && (txtRe_ScheduledDate.Text == "" || txtRe_ScheduledDate.Text.ToLower() == "enter re-schedule date"))
                {
                    //txtRe_ScheduledDate.Text = "enter re-schedule date";
                    //Response.Write("<script>alert('You must select Re-Scheduled Date first .');</script>");
                    lblMsg.Text = "You must select Re-Scheduled Date first .";
                    pnlSuccessMsg_ModalPopupExtender.Show();
                }
                else
                {
                    if (txtScheduleDtae.Text.ToLower() == "enter schedule dtae")
                    {
                        txtScheduleDtae.Text = "";
                        str_ScheduledDate = "";
                    }
                    if (txtRe_ScheduledDate.Text.ToLower() == "Enter Re-Schedule Dtae")
                    {
                        txtRe_ScheduledDate.Text = "";
                    }
                    str_ScheduledDate = txtScheduleDtae.Text;
                    string WarmOrWarmPlus = "";
                    if (rdo_Warm.Checked == true)
                    {
                        WarmOrWarmPlus = "Warm";
                    }
                    else if (rdo_WarmPlus.Checked == true)
                    {
                        WarmOrWarmPlus = "Warm Plus";
                    }

                    int i = 0;

                    i = objNewJob.UpdateChange(txtEnterSeheduling.Text, strJobNumber, txtDateCompleted.Text, txtReturnDate.Text, Convert.ToString(DDL_Auditor_Name.SelectedValue), Convert.ToInt32(DDl_UtilityCompany_1.SelectedValue), txt_GobackRecive.Text, txt_GobackReturned.Text, Convert.ToString(DDl_CrewCheif.SelectedValue));

                    //i = objNewJob.UpdateChangeWithJob(txtDateReceived.Text, txtDateCompleted.Text, txtReturnDate.Text, txtRe_ScheduledDate.Text, txtScheduleDtae.Text, txtEnterSeheduling.Text, txtAuthorName.Text, chkAct129.Checked, chkAct129II.Checked, chkBaseLoad.Checked, chkHighPriority.Checked, chkFullCost.Checked, WarmOrWarmPlus, txtFirstName.Text, txtLastName.Text, txtAccountNumber.Text, txtAddress_Mailing.Text, txtAddress_Service.Text, txtCity_Mailing.Text, txtCity_Service.Text, txtZipCode_Mailing.Text, txtZipCode_Service.Text, txtHomeBuilt.Text, txtPhone_Home.Text, txtPhone_Cell.Text, txtPhone_Work.Text, Convert.ToInt32(txtNumberOfOccupants.Text), strJobNumber);
                    InsertNewJob("update");

                    if (i == 1)
                    {
                        if (ddlContactType.SelectedValue != "0" && ddlContactPerson.SelectedValue != "0" && ddlContactResult.SelectedValue != "0")
                        {
                            objCAR.InsertJobContactAttempts(Request.QueryString["Jobs"].ToString(), txtDate_ContactAttempt.Text + " " + txtTime_ContactAttempt.Text, ddlContactType.SelectedValue, ddlContactPerson.SelectedValue, ddlContactResult.SelectedValue, txtDate_Result.Text);
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('You must select Date Properly .');</script>");
                    }
                }
                ShowContactAttempt();
                lblDateMsg.Text = "Record Updated Successfully";

                //foreach (AttachmentItem item in Attachments1.Items)
                //{
                //    for (int i = Attachments1.Items.Count - 1; i > -1; i--)
                //    {
                //        Attachments1.Items[i].Remove();
                //    }
                //}
                //Attachments1.Visible = false;
            }
        }
catch(Exception ex)
		{
            Response.Write("<script>alert('" + ex.Message + "');</script>");
		} 
	}
   
	protected void btn_AllDate_Click(object sender, EventArgs e)
	{
		try
		{
			//////////////////////// PPL  ////////////////////////
			//txtRe_ScheduledDate.Text, str_ScheduledDate,txt_AuditScheduledDate.Text,, JobStatus
			DataTable dtU = objNewJob.ShowJobByJobNumber_ByJobNumber(strJobNumber);
			string RescheduledDate = ""; string ScheduledDate = ""; string AuditScheduleDate = ""; string GoBackRecive = ""; string GoBackReturned = ""; string GoBackSchedule = "";
			RescheduledDate = Convert.ToString(dtU.Rows[0]["RescheduledDate"]);
			ScheduledDate = Convert.ToString(dtU.Rows[0]["DateScheduled"]);
			AuditScheduleDate = Convert.ToString(dtU.Rows[0]["AuditScheduleDate"]);
			GoBackRecive = Convert.ToString(dtU.Rows[0]["GoBackRecive"]);
			GoBackReturned = Convert.ToString(dtU.Rows[0]["GoBackReturne"]);
			GoBackSchedule = Convert.ToString(dtU.Rows[0]["GoBackSchedule"]);
			JobStatus = Convert.ToString(dtU.Rows[0]["Status"]);


			if (DDl_UtilityCompany_1.SelectedValue == "2")
			{
				if (DDL_AllDates.SelectedValue == "Audit Scheduled Date")
				{
					JobStatus = "Audit Scheduled";
					AuditScheduleDate = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Schedule Date")
				{
					JobStatus = "Work Scheduled";
					ScheduledDate = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Re Scheduled Date")
				{
					JobStatus = "Work Re-Scheduled";
					RescheduledDate = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Date Go Back Received")
				{
					JobStatus = "Go Back";
					GoBackRecive = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Date Go Back Scheduled")
				{
					JobStatus = "Go Back Scheduled";
					GoBackSchedule = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Date Go Back Returned")
				{
					GoBackReturned = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Select")
				{
					DataTable dt = objNewJob.getDateOfAudit(Convert.ToString(Request.QueryString["Jobs"]), Convert.ToString(Request.QueryString["UC"]));
					if (Convert.ToString(dt.Rows[0]["DateOfAudit"]) != "" && Convert.ToString(dt.Rows[0]["DateOfAudit"]) != "Audit Completed")
					{
						JobStatus = "Audit Completed";
					}

				}
			}
			////////////////////  METED  ///////////////////////////////////
			if (DDl_UtilityCompany_1.SelectedValue == "1")
			{
				if (DDL_AllDates.SelectedValue == "Audit Scheduled Date")
				{
					JobStatus = "Audit Scheduled";
					AuditScheduleDate = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Schedule Date")
				{
					JobStatus = "Work Scheduled";
					ScheduledDate = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Re Scheduled Date")
				{
					JobStatus = "Work Re-Scheduled";
					RescheduledDate = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Date Go Back Received")
				{
					JobStatus = "Go Back";
					GoBackRecive = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Date Go Back Scheduled")
				{
					JobStatus = "Go Back Scheduled";
					GoBackSchedule = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Date Go Back Returned")
				{
					GoBackReturned = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Select")
				{
					DataTable dt = objNewJob.getDateOfAudit(Convert.ToString(Request.QueryString["Jobs"]), Convert.ToString(Request.QueryString["UC"]));
					DataTable dt_ = objNewJob.getAuditCompleteDate(Convert.ToString(Request.QueryString["Jobs"]), Convert.ToString(Request.QueryString["UC"]));
					if (Convert.ToString(dt.Rows[0]["AuditDate"]) != "")
					{
						JobStatus = "Work Completed";
					}
					if (Convert.ToString(dt_.Rows[0]["DateAuditComplete"]) != "")
					{
						JobStatus = "Audit Completed";
					}
				}

			}
			////////////////////////////////////////////////////////////////
			////////////////////  BCOC,DCED  ///////////////////////////////
			if (DDl_UtilityCompany_1.SelectedValue == "3" || DDl_UtilityCompany_1.SelectedValue == "9")
			{
				if (DDL_AllDates.SelectedValue == "Schedule Date")
				{
					JobStatus = "Work Scheduled";
					ScheduledDate = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Re Scheduled Date")
				{
					JobStatus = "Work Re-Scheduled";
					RescheduledDate = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Date Go Back Received")
				{
					JobStatus = "Go Back";
					GoBackRecive = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Date Go Back Scheduled")
				{
					JobStatus = "Go Back Scheduled";
					GoBackSchedule = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Date Go Back Returned")
				{
					GoBackReturned = txt_AllDates.Text;
				}
			}
			////////////////////////////////////////////////////////////////
			//////////////////  Private Customer  //////////////////////////
			if (DDl_UtilityCompany_1.SelectedValue == "7")
			{
				if (DDL_AllDates.SelectedValue == "Schedule Date")
				{
					JobStatus = "Work Scheduled";
					ScheduledDate = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Re Scheduled Date")
				{
					JobStatus = "Work Re-Scheduled";
					RescheduledDate = txt_AllDates.Text;
				}
				if (DDL_AllDates.SelectedValue == "Date Go Back Returned")
				{
					GoBackReturned = txt_AllDates.Text;
				}
			}
			////////////////////////////////////////////////////////////////
			if (DDL_AllDates.SelectedValue == "Date Go Back Returned")
			{
				JobStatus = "Done";
				GoBackReturned = txt_AllDates.Text;
			}

			//objNewJob.insertStatusAndDate(Convert.ToString(Request.QueryString["Jobs"]), JobStatus, txt_AllDates.Text, RescheduledDate, ScheduledDate, AuditScheduleDate, GoBackRecive, GoBackReturned, GoBackSchedule);
			FillDataForUpdate();
			lblDateMsg.Text = "Date Update successfully.";
			txt_AllDates.Text = ""; DDL_AllDates.SelectedValue = "Select";
			UPpnl.Update();
		}
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
	}
	public void BindDDLAuditor()
	{
		DataTable dtDLL = new DataTable();
		dtDLL = ObjPPL.GetAuditorNameForPPLAudit_1();
		DDL_Auditor_Name.DataSource = dtDLL;
		DDL_Auditor_Name.DataValueField = "ID";
		DDL_Auditor_Name.DataTextField = "AuditorName";
		DDL_Auditor_Name.DataBind();
		DDL_Auditor_Name.Items.Insert(0, "Select");


		DDl_CrewCheif.DataSource = dtDLL;
		DDl_CrewCheif.DataValueField = "ID";
		DDl_CrewCheif.DataTextField = "AuditorName";
		DDl_CrewCheif.DataBind();
		DDl_CrewCheif.Items.Insert(0, "Select");
	}
	protected void LnkInvoice_Click(object sender, EventArgs e)
	{
		try
		{
			if (Convert.ToString(Request.QueryString["Jobs"]) != "" && Convert.ToString(Request.QueryString["UC"]) != "" && Convert.ToString(Request.QueryString["UC"]) != null)
			{
				string Utility = "";
				if (Convert.ToString(Request.QueryString["UC"]) == "PPL" || Convert.ToString(Request.QueryString["UC"]) == "PPL Zone 2" || Convert.ToString(Request.QueryString["UC"]) == "PPL Zone 1" || Convert.ToString(Request.QueryString["UC"]) == "PPL CACLV")
				{
					Utility = "2";
				}
				else if (Convert.ToString(Request.QueryString["UC"]) == "MET ED")
				{
					Utility = "1";
				}
				else if (Convert.ToString(Request.QueryString["UC"]) == "BCOC")
				{
					Utility = "9";
				}
				else if (Convert.ToString(Request.QueryString["UC"]) == "DCED")
				{
					Utility = "3";
				}
				else if (Convert.ToString(Request.QueryString["UC"]) == "UGI")
				{
					Utility = "4";
				}
				else if (Convert.ToString(Request.QueryString["UC"]) == "Private")
				{
					Utility = "7";
				}
				else
				{
					Response.Redirect("Home.aspx");
				}

				if (Convert.ToString(Request.QueryString["InvoiceNo"]) != null)
				{
					Response.Redirect("DisplayJobSearchRecords.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
				}
				else
				{
					DataTable dt_Invoice = objInvoice.SearchTotalInvoice(Convert.ToString(Request.QueryString["Jobs"]));
					//int invoice = Convert.ToInt32(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
					string IncoiceNo = Convert.ToString(dt_Invoice.Rows[0]["IncoiceNo"].ToString());
					if (IncoiceNo == "")
					{
						IncoiceNo = "1";
					}
					Response.Redirect("DisplayJobSearchRecords.aspx?InvoiceNo=" + IncoiceNo + "&Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&Utility=" + Utility);
				}
			}
			else if (Convert.ToString(Request.QueryString["GT"]) == "Vendor")
			{
				Response.Redirect("Vendor/VendorInvoice.aspx?Jobs=" + Convert.ToString(Request.QueryString["Jobs"]) + "&GT=Vendor&Back=DisplayJobSearchRecords");
			}
			else
			{
				Response.Redirect("Home.aspx");
			}
		}
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
	}
	//public void ShowFName()
	//{
	//    DataTable Dt_Fname = new DataTable();
	//    Dt_Fname = objNewJob.ShowFname();
	//    ViewState["name"] = Dt_Fname;
	//    ddl_fname.DataSource = Dt_Fname;
	//    ddl_fname.DataTextField = "FirstName";
	//    ddl_fname.DataValueField = "FirstName";      
	//    ddl_fname.DataBind();
	//    ddl_fname.Items.Insert(0, "Select FirstName");

	//}

	//protected void ddl_fname_SelectedIndexChanged(object sender, EventArgs e)
	//{

	//    DataTable Dt_Lname = new DataTable();
	//    Dt_Lname = objNewJob.ShowLname(ddl_fname.SelectedValue);
	//    ddl_LName.DataSource = Dt_Lname;
	//    ddl_LName.DataTextField = "LastName";
	//    ddl_LName.DataValueField = "ID";
	//    ddl_LName.DataBind();
	//    ddl_LName.Items.Insert(0,"Select LastName");

	//}
	//protected void ddl_LName_SelectedIndexChanged(object sender, EventArgs e)
	//{

	//}
	protected void DDL_AllDates_SelectedIndexChanged(object sender, EventArgs e)
	{
		lblMsg.Text = "";
	}

	void InsertMsg(string msg)
	{
		//ListBoxEvents.Items.Insert(0, msg);
		//ListBoxEvents.SelectedIndex = 0;
	}
	public int GetVisibleItemCount()
	{
		int count = 0;
        //foreach (AttachmentItem item in Attachments1.Items)
        //{
        //    if (item.Visible)
        //        count++;
        //}
		return count;
	}

	protected override void OnInit(EventArgs e)
	{
		//Attachments1.InsertButton.Style["display"] = "none";
	}

	protected void Uploader_FileUploaded(object sender, CuteWebUI.UploaderEventArgs args)
	{
		//Attachments1.Visible = true;
		using (System.IO.Stream stream = args.OpenStream())
		{
			//Attachments1.Upload(args.FileSize, Convert.ToString(args.FileName), stream);
			filename = args.FileName + "," + filename;
		}
	}
	string remove = "";
	protected void Attachments1_AttachmentRemoveClicked(object sender, AttachmentItemEventArgs args)
	{
		filename = "";
		using (System.IO.Stream stream = args.Item.OpenStream())
		{
			//Attachments1.Upload(args.Item.FileSize, Convert.ToString(args.Item.FileName), stream);
			filename = args.Item.FileName + "," + filename;
		}
	}
	protected void grdPdf_DeleteCommand(object source, DataListCommandEventArgs e)
	{
		ImageButton imgBtnDeletePdf = (ImageButton)e.Item.FindControl("imgBtnDeletePdf");
		HiddenField hdnAllPdf = (HiddenField)e.Item.FindControl("hdnAllPdf");
		string AllPdfName = Convert.ToString(hdnAllPdf.Value);
		string pdfFileName = Convert.ToString(imgBtnDeletePdf.ValidationGroup);
		string[] ArrAllPdfName = AllPdfName.Split(',');
		for (int i = 0; i < ArrAllPdfName.Length - 1; i++)
		{
			if (pdfFileName == Convert.ToString(ArrAllPdfName[i]))
			{
				ArrAllPdfName[i] = "";
				break;
			}
		}
		AllPdfName = "";
		for (int i = 0; i < ArrAllPdfName.Length - 1; i++)
		{
			if (Convert.ToString(ArrAllPdfName[i]) != "")
			{
				AllPdfName = AllPdfName + Convert.ToString(ArrAllPdfName[i]) + ",";
			}
		}
		objNewJob.UpdtaePdfNew(Convert.ToString(Request.QueryString["Jobs"]), AllPdfName);
		FillDataForUpdate();
	}
	protected void btnVendorContactAttempt_Click(object sender, EventArgs e)
	{
		try
		{
			InsertVendorContactAttempt();
			string objUserName = objSmUtil.GetCookie("UserId");
			strJobNumber = Request.QueryString["Jobs"].ToString();
			objNewJob.InsertJobComments(strJobNumber, txtCommentsSendAnd.Text, "", objUserName.ToString());
			showComments();
			ShowContactAttempt();
			txtCommentsSendAnd.Text = "";
			
            lblMsg.Visible = true;
			lblMsg.Text = "Comment Post Successfully";
			pnlSuccessMsg_ModalPopupExtender.Show();

		}
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
	}

	#region insert vendor contact attempt
	public void InsertVendorContactAttempt()
	{
		vendor1.InsertVendorContactAttempt(txtJobNumber.Text, txtDate_ContactAttempt.Text + " " + txtTime_ContactAttempt.Text, ddlContactType.SelectedItem.Text, ddlContactPerson.SelectedItem.Text, txtVendorAgentName.Text, txtVendorAgentId.Text);
		txtVendorAgentName.Text = string.Empty;
		txtVendorAgentId.Text = string.Empty;
		ddlContactType.SelectedValue = "0";
		ddlContactPerson.SelectedValue = "0";
	}
	#endregion

	protected void btnPrint_Click(object sender, EventArgs e)
	{

	}
}
