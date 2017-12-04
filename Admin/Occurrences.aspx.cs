using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
public partial class Admin_Occurrences : System.Web.UI.Page
{
    Dc_Category objCat = new Dc_Category();
    dc_Admin objAdmin = new dc_Admin();
    dc_AddNewJob objNewJob = new dc_AddNewJob();
    smUtil objSm = new smUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {           
           FilDDlEmployee();
            BindOccurenceDetails();
            BindDDLManager();
            lblOccurenceDate.Text = DateTime.Now.ToShortDateString();           
        }       
    }

    public void BindOccurenceDetails()
    {
        string emplyeeId = "";
        if (Session["UserLogin1"] != null)
        {
            emplyeeId = Session["UserLogin1"].ToString();
            ddlListEmployee.Items.FindByValue(emplyeeId).Selected = true;
         
        }
        else
        {
            emplyeeId = ddlListEmployee.SelectedItem.Value.ToString();
          
          
        }
        DataTable dt1 = new DataTable();
        if (emplyeeId == "All")
        {
            dt1 = objCat.ViewOccurencesDetails();
        }
        else
        {
            dt1 = objCat.ViewSelctedEmployeeOcurDetails(emplyeeId);
        }
        Session["UserLogin1"] = null;
        grdOccurences.DataSource = dt1;
        grdOccurences.DataBind();    
    }

    public void BindDDLManager()
    {
        DataTable dtDLL = new DataTable();
        dtDLL = objCat.GetUserRegistrationNames();
        ddlSupervisorName.DataSource = dtDLL;
        ddlSupervisorName.DataValueField = "ID";
        ddlSupervisorName.DataTextField = "CWLogin";
        ddlSupervisorName.DataBind();
        ddlSupervisorName.Items.Insert(0, "Select Manager");
    }

    protected static bool SetVisibility(object Desc, int length)
    {

        return Desc.ToString().Length > length;
    }

    protected void ReadMoreLinkButton_Click(object sender, EventArgs e)
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
        string temp = descLabel.Text;
        descLabel.Text = descLabel.ToolTip;
        descLabel.ToolTip = temp;
    }


    protected static string Limit(object Desc, int length)
    {
        var descStr = Desc.ToString();
        if (descStr.Length > 45)
            return descStr.Substring(0, length);
        else
            return descStr;
    }
    public void FilDDlEmployee()
    {
        DataTable dt = objAdmin.EmpDropDownInUser();
        if (dt.Rows.Count > 0)
        {
            ddlEmployeeName.DataSource = dt;
            ddlEmployeeName.DataTextField = "Name";
            ddlEmployeeName.DataValueField = "ID";
            ddlEmployeeName.DataBind();
            ddlEmployeeName.Items.Insert(0, "Select Employee");

            ddlListEmployee.DataSource = dt;
            ddlListEmployee.DataTextField = "Name";
            ddlListEmployee.DataValueField = "ID";
            ddlListEmployee.DataBind();
            ddlListEmployee.Items.Insert(0, "All");

        }
        else
        {
            ddlEmployeeName.Items.Insert(0, "Select");
            ddlListEmployee.Items.Insert(0, "Select");
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        int size = 0;
        if (DropDownList1.SelectedItem.Text != "ALL")
        {
            grdOccurences.AllowPaging = true;
            size = int.Parse(DropDownList1.SelectedItem.Value.ToString());
            grdOccurences.PageSize = size;
            BindDDLManager();
        }
        BindOccurenceDetails();

    }
    public static DateTime AddBusinessDays(DateTime date, int days)
    {
        if (days < 0)
        {
            throw new ArgumentException("days cannot be negative", "days");
        }

        if (days == 0) return date;

        if (date.DayOfWeek == DayOfWeek.Saturday)
        {
            date = date.AddDays(2);
            days -= 1;
        }
        else if (date.DayOfWeek == DayOfWeek.Sunday)
        {
            date = date.AddDays(1);
            days -= 1;
        }

        date = date.AddDays(days / 5 * 7);
        int extraDays = days % 5;

        if ((int)date.DayOfWeek + extraDays > 5)
        {
            extraDays += 2;
        }

        return date.AddDays(extraDays);

    }
    public void btn_submit_Occurences_Click(object sender, EventArgs e)
    {
        try
        {

            //DateTime thirdworkingday=AddBusinessDays(DateTime.Now,3);
            DateTime thirdworkingday = AddBusinessDays(DateTime.Now, 3);

            bool msg = false;
            bool msg1 = false;
            // if (btnSubmitOccurences.Text == "Submit")
            //{
            bool value = false;
            if (rdbSign.SelectedValue == "0")
            {
                value = false;
            }
            else if (rdbSign.SelectedValue == "1")
            {
                value = true;
            }
            msg = objCat.Add_Occuerrences_Details(ddlEmployeeName.SelectedItem.Value, DateTime.Now.ToString(), txtNarrative.Text, ddlSupervisorName.SelectedItem.Value, ddlAction.SelectedItem.Text, value, "", thirdworkingday);//, txt_add.Text, txt_city.Text, txt_state.Text, txt_zip.Text

            msg1 = objCat.UpdateUserRegisterMangaer(ddlEmployeeName.SelectedItem.Value, ddlSupervisorName.SelectedItem.Text);
            int msgId = 0;
            DataSet ds2 = new DataSet();
            string obj = objSm.GetCookie("UserId");
            ds2 = GetData("select U1.ID as Recipient,U2.ID as Sender,UR.Email as Email,U1.CWLogin as ReceipientName,U2.CWLogin as SenderName from User_registration UR inner join Users U1 on U1.CWLogin=UR.Login inner join Users U2 on U2.CWLogin=UR.Manager where UR.Manager='" + ddlSupervisorName.SelectedItem.Text + "' and U1.ID='" + ddlEmployeeName.SelectedItem.Value + "'");
            msgId = objNewJob.InsertJobMessage(txtNarrative.Text);
            objNewJob.InsertJobMessageReadUnread2(Convert.ToInt32(ds2.Tables[0].Rows[0]["Sender"]), Convert.ToInt32(ds2.Tables[0].Rows[0]["Recipient"]), "0", msgId, "U", null, null, null, null, null, null, null, "OR", "");
            if (!DBNull.Value.Equals(ds2.Tables[0].Rows[0]["Email"]))
            {
                string body = "From:" + ddlSupervisorName.SelectedItem.Text + "\n" + "To:" + ds2.Tables[0].Rows[0]["ReceipientName"].ToString() + "\n" + txtNarrative.Text;
                objNewJob.SendEmail("Occurrence", body, ds2.Tables[0].Rows[0]["Email"].ToString(),null);
            }
            if (msg == true && msg1 == true)
            {
                Response.Write("<script>alert('Occurrence Details Submit Successfully.')</script>");
            }
            else
                Response.Write("<script>alert('Failed')</script>");
            BindOccurenceDetails();
            Clear();
            pnlOccurenceAdd.Visible = false;
            pnlOccurenceView.Visible = true;
            btnSubmitOccurences.Text = "Submit";
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

    protected void grdOccurences_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdOccurences.PageIndex = e.NewPageIndex;
        BindOccurenceDetails();
    }

    protected void ddlListEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {     
            BindOccurenceDetails();      
    }

    protected void grdOccurrence_RowDataBount(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Label lnknote = (Label)e.Row.FindControl("lblResponseStatus");
            //ImageButton lnkPdf = (ImageButton)e.Row.FindControl("lnk_Edit");
            //if (lnknote.Text == "True")
            //{
            //    lnkPdf.Visible = true;
            //}
            //else
            //{
            //    lnkPdf.Visible = false;
            //}

            Label lblNeedSign = (Label)e.Row.FindControl("NeedToSign");
            Label lblResponseStatus = (Label)e.Row.FindControl("lblResponseStatus");
           // LinkButton lbtnAccept = (LinkButton)e.Row.FindControl("lnkbtnAccept");
            ImageButton lnkPdf = (ImageButton)e.Row.FindControl("lnk_Edit");
            //if (lnknote.Text == "True")
            //{
            //    lnkPdf.Visible = true;
            //}
            //else
            //{
            //    lnkPdf.Visible = false;
            //}
            if (lblNeedSign.Text == "True" && (lblResponseStatus.Text == "False" || lblResponseStatus.Text == ""))
            {

             //   lbtnAccept.Visible = true;
                lnkPdf.Visible = false;
            }
            else
            {
                lnkPdf.Visible = true;
             //   lbtnAccept.Visible = false;

            }
        }
        
    }
    public void lbnOccurrenceOnClick(object sender, EventArgs e)
    {
        pnlOccurenceAdd.Visible = false;
        pnlOccurenceView.Visible = true;
        Clear();
    }

    public void lbtnAddOccurence_Click(object sender, EventArgs e)
    {
        pnlOccurenceAdd.Visible = true;
        pnlOccurenceView.Visible = false;
        Clear();  
        btnSubmitOccurences.Text = "Submit";
    }

    public void btn_occurences_cancel_Click(object sender, EventArgs e)
    {
        Clear();
        pnlOccurenceAdd.Visible = false;
        pnlOccurenceView.Visible = true;
    }

    public void Clear()
    {
       // txtResponse.Text="";
        txtNarrative.Text="";
        ddlAction.SelectedIndex = 0;
        ddlEmployeeName.SelectedIndex = 0;
        ddlSupervisorName.SelectedIndex = 0;
        rdbSign.SelectedIndex = 1;
      //  ddlAction.Items.Insert(0, "Select Action");     
    }
    protected void grdOccurences_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {       
        int Id = Convert.ToInt32(grdOccurences.DataKeys[e.RowIndex].Value.ToString());
        DownloadPDF(Id);      
    }

    //public void DownloadPdf()
    //{
    //    byte[] bPDF = null;

    //   MemoryStream ms = new MemoryStream();

    //    Response.ContentType = "application/pdf";
    //    Response.AddHeader("content-disposition", "attachment;filename=Panel.pdf");
    //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
    //    StringWriter sw = new StringWriter();
    //    HtmlTextWriter hw = new HtmlTextWriter(sw);
    //    string sss = hw.InnerWriter.ToString();
    //    pnlPrintOccurence.RenderControl(hw);

    //    TextReader sr = new StringReader(sw.ToString());

    //    Document pdfDoc = new Document(PageSize.A4, 25, 25, 25, 25);
    //    PdfWriter oPdfWriter = PdfWriter.GetInstance(pdfDoc, ms);
    //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
    //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
    //    pdfDoc.Open();
    //    htmlparser.StartDocument();

    //    htmlparser.Parse(sr);
    //    htmlparser.EndDocument();
    //    pdfDoc.Close();
    //    bPDF = ms.ToArray();
    //    Response.Write(bPDF);
    //    Response.End();
    //}



    public byte[] GetPDF(string pHTML)
    {
        byte[] bPDF = null;
        MemoryStream ms = new MemoryStream();
        TextReader txtReader = new StringReader(pHTML);
        Document doc = new Document(PageSize.A4, 25, 25, 25, 25);// 1: create object of a itextsharp document class
        PdfWriter oPdfWriter = PdfWriter.GetInstance(doc, ms); // 2: we create a itextsharp pdfwriter that listens to the document and directs a XML-stream to a file
        HTMLWorker htmlWorker = new HTMLWorker(doc); // 3: we create a worker parse the document
        doc.Open();// 4: we open document and start the worker on the document
        htmlWorker.StartDocument();
        htmlWorker.Parse(txtReader); // 5: parse the html into the document
        htmlWorker.EndDocument(); // 6: close the document and the worker
        htmlWorker.Close();
        doc.Close();
        bPDF = ms.ToArray();
        return bPDF;
    }

    public void DownloadPDF(int id)
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
          //  string HTMLContent = "<b><h3>                                             Custom Weatherization,LLC</h3></b> <h3><b>                                                   Occurrence Form</b></h3><br/><br/><b>Employee Name :</b>" + dt.Rows[0]["EmployeeName"].ToString() + "                                                                  <b>           Date:</b>" + Convert.ToDateTime(dt.Rows[0]["Date"]).ToShortDateString() + "<br/><br/><b>Narrative:</b><br/><u>" + dt.Rows[0]["Narrative"].ToString() + "</u><br/><br/><h3><b>                                                  For Administration Use Only</b></h3><br/><br/><b>Supervisor Assigned :</b>" + dt.Rows[0]["ManagerName"].ToString() + "<br/><br/><b>Action Taken :</b>" + dt.Rows[0]["ActionTaken"].ToString() + "<br/><br/><b>Signature of Employee :</b>" + sign + "             <b>Pin :</b>" + dt.Rows[0]["PassCode"].ToString() + "                     <b>Date Signed:</b>" + dt.Rows[0]["ResponseDate"].ToString() + " <br/><br/><b>Response :</b><br/><u>" + dt.Rows[0]["Response"].ToString()+"</u>";
            string HTMLContent = "<b><h3>                                             Custom Weatherization, LLC</h3></b> <h3><b>                                                      Occurrence Form</b></h3><br/><br/><b>Employee Name: </b>" + dt.Rows[0]["EmployeeName"].ToString() + "                                                                  <b>           Date: </b>" + Convert.ToDateTime(dt.Rows[0]["Date"]).ToShortDateString() + "<br/><br/><b>Narrative:</b><br/><u>" + dt.Rows[0]["Narrative"].ToString() + "</u><br/><br/><h3><b>                                            For Administration Use Only</b></h3><br/><br/><b>Supervisor Assigned: </b>" + dt.Rows[0]["ManagerName"].ToString() + "<br/><br/><b>Action Taken: </b>" + dt.Rows[0]["ActionTaken"].ToString() + "<br/><br/><b>Signature of Employee: </b>" + sign + "             <b>Pin: </b>" + dt.Rows[0]["PassCode"].ToString() + "                     <b>Date Signed: </b>" + dt.Rows[0]["ResponseDate"].ToString() + " <br/><br/><b>Response: </b><br/><u>" + dt.Rows[0]["Response"].ToString() + "</u>";
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + "PDFfile.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(GetPDF(HTMLContent));
            Response.End();
        }
    }
   
    protected void grdOccurences_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int DeleteId = Convert.ToInt32(grdOccurences.DataKeys[e.RowIndex].Value.ToString());
       objCat.Delete_Occuerrences_Details(DeleteId);
        BindOccurenceDetails();
    }
}
