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
using System.IO;
using Ionic.Zip;
using System.Drawing.Printing;
using System.Drawing;

public partial class PPLAudit_PPL_Photo_Page_Manage : System.Web.UI.Page
{
    dcPPLAudit obj_dcPPLAudit = new dcPPLAudit();
    dcPPLAudit obj_dcPPLAudit1 = new dcPPLAudit();
    public DataTable dtimg = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

        //System.Web.UI.HtmlControls.HtmlGenericControl currdiv = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("Quick_Link");
        //currdiv.Style.Add("display", "none");
        //System.Web.UI.HtmlControls.HtmlGenericControl curdiv = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("Main_right");
        //curdiv.Style.Add("Width", "99%");

        if (!IsPostBack)
        {
            dtimg = new DataTable();
            string jobnumber = Convert.ToString(Request.QueryString["Jobs"]);
            //string Utility=Convert.ToString(Request.QueryString[""]);
            if (jobnumber != null && jobnumber != "")
            {
                dtimg = obj_dcPPLAudit1.GetPPL_PhotoPage(jobnumber, "PPL");
            }
            if (dtimg.Rows.Count > 0)
            {
                DTLimages.DataSource = dtimg;
                DTLimages.DataBind();
            }
            if (Request.QueryString["Jobs"] != null)
            {
                if (Request.QueryString["Jobs"].ToString() != "")
                {
                    string JobNum = Request.QueryString["Jobs"].ToString();
                    hdnJob.Value = JobNum;
                    hdnInv.Value = Request.QueryString["InvoiceNo"].ToString();
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
            spnFinal.InnerHtml = "Audit Finalize";
        }
    }
    [System.Web.Services.WebMethod]
    public static string GetCurrentTime(string title, string desc, string orderno, string jobno, string Inv)
    {
        int x = 0;
        string directory = HttpContext.Current.Server.MapPath("~/PPLAudit/uploads");
        string targetPath = HttpContext.Current.Server.MapPath("~/PPLAudit/Photo_Page_Images");
        string[] myFile = Directory.GetFiles(directory);
        foreach (string s in myFile)
        {
            // Use static Path methods to extract only the file name from the path.
            string fileName = System.IO.Path.GetFileName(s);
            if (fileName != "Thumbs.db")
            {
                string sourceFile = directory + "\\" + fileName;
                string destinationFile = targetPath + "\\" + fileName;
                System.IO.File.Move(sourceFile, destinationFile);
                dcPPLAudit obj_dcPPLAudit = new dcPPLAudit();
                if (Convert.ToString(orderno) == "")
                {
                    orderno = "0";
                }
                x = obj_dcPPLAudit.InsertPPL_PhotoPage(jobno, fileName, title, desc, "", "", Convert.ToString(DateTime.Now), Convert.ToInt32(orderno), "PPL");   // txt_Description_Line2.Text, txt_Description_Line3.Text,
            }
        }
        return "PPL_Photo_Page_Manage.aspx?InvoiceNo=" + Inv + "&Jobs=" + jobno + "&Utility=2";
    }


    //protected void btnDAll_Click(object sender, EventArgs e)
    //{
    //    string jobnum = Convert.ToString(Request.QueryString["Jobs"]);
    //    DataTable dt = obj_dcPPLAudit.SelectPPLPhotoPageTop24_Change(jobnum);
    //    try
    //    {
    //        if (dt.Rows.Count > 0)
    //        {

    //            using (ZipFile zip = new ZipFile())
    //            {
    //                zip.AlternateEncodingUsage = ZipOption.AsNecessary;
    //                zip.AddDirectoryByName("Files");
    //                for (int i = 0; i < dt.Rows.Count; i++)
    //                {
    //                    string filename = Convert.ToString(dt.Rows[i]["PhotoName"]);
    //                    string filepath = Server.MapPath(@"~\PPLAudit\Photo_Page_Images\" + filename);
    //                    zip.AddFile(filepath, "Files");
    //                }

    //                Response.Clear();
    //                Response.BufferOutput = false;
    //                string zipName = String.Format("Jobnumber-" + jobnum + "_Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
    //                Response.ContentType = "application/zip";
    //                Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
    //                zip.Save(Response.OutputStream);
    //                Response.End();
    //            }


    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(ex.Message);

    //    }

    //}

    //protected void btnDSelected_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        using (ZipFile zip = new ZipFile())
    //        {

    //            zip.AlternateEncodingUsage = ZipOption.AsNecessary;
    //            zip.AddDirectoryByName("Files");
    //            foreach (DataListItem item in DTLimages.Items)
    //            {
    //                CheckBox CBimg = (CheckBox)item.FindControl("CBimg");

    //                if (CBimg.Checked == true)
    //                {
    //                    string filename = CBimg.Text;
    //                    string filepath = Server.MapPath(@"~\PPLAudit\Photo_Page_Images\" + filename);
    //                    zip.AddFile(filepath, "Files");
    //                }
    //            }

    //            Response.Clear();
    //            Response.BufferOutput = false;
    //            string zipName = String.Format("Jobnumber-" + Convert.ToString(Request.QueryString["Jobs"]) + "_Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
    //            Response.ContentType = "application/zip";
    //            Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
    //            zip.Save(Response.OutputStream);
    //            Response.End();
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(ex.Message);

    //    }
    //}




    protected void btn_DownloadallPopUp_Click(object sender, EventArgs e)
    {

        string jobnum = Convert.ToString(Request.QueryString["Jobs"]);
        DataTable dt = obj_dcPPLAudit.SelectPPLPhotoPageTop24_Change(jobnum);
        try
        {
            if (dt.Rows.Count > 0)
            {

                using (ZipFile zip = new ZipFile())
                {
                    zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                    zip.AddDirectoryByName("Files");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string filename = Convert.ToString(dt.Rows[i]["PhotoName"]);

                        string filepath = Server.MapPath(@"~\PPLAudit\Photo_Page_Images\" + filename);

                        zip.AddFile(filepath, "Files");
                    }

                    Response.Clear();
                    Response.BufferOutput = false;
                    string zipName = String.Format("Jobnumber-" + jobnum + "_Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                    Response.ContentType = "application/zip";
                    Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
                    zip.Save(Response.OutputStream);
                    Response.End();
                }


            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);

        }
    }
    


    protected void btn_Downloadall_Click(object sender, EventArgs e)
    {
        string jobnum = Convert.ToString(Request.QueryString["Jobs"]);
        DataTable dt = obj_dcPPLAudit.SelectPPLPhotoPageTop24_Change(jobnum);
        try
        {
            if (dt.Rows.Count > 0)
            {

                using (ZipFile zip = new ZipFile())
                {
                    zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                    zip.AddDirectoryByName("Files");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string filename = Convert.ToString(dt.Rows[i]["PhotoName"]);

                        string filepath = Server.MapPath(@"~\PPLAudit\Photo_Page_Images\" + filename);

                        zip.AddFile(filepath, "Files");
                    }

                    Response.Clear();
                    Response.BufferOutput = false;
                    string zipName = String.Format("Jobnumber-" + jobnum + "_Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                    Response.ContentType = "application/zip";
                    Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
                    zip.Save(Response.OutputStream);
                    Response.End();
                }


            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);

        }


    }
    private void DownloadFile(string filename)
    {



        //string filename = Convert.ToString(dt.Rows[i]["PhotoName"]);
        string filePath = Server.MapPath(@"~\PPLAudit\Photo_Page_Images\" + filename);

        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {

        //try
        //{
        //    // Get the HttpFileCollection
        //    HttpFileCollection hfc = Request.Files;
        //    for (int i = 0; i < hfc.Count; i++)
        //    {
        //        HttpPostedFile hpf = hfc[i];
        //        if (hpf.ContentLength > 0)
        //        {
        //            hpf.SaveAs(Server.MapPath("MyFiles") + "\\" +
        //              Path.GetFileName(hpf.FileName));
        //        }
        //    }
        //}
        //catch (Exception ex)
        //{
        //    // Handle your exception here
        //}





        //if (Request.Files != null)
        //{
        //    foreach (string file in Request.Files)
        //    {
        //        var uploadedFile = Request.Files[file];
        //        if (uploadedFile.ContentLength > 0)
        //        {
        //            var appData = Server.MapPath("~/Photo_Page_Images/");
        //            var fileName = Path.GetFileName(uploadedFile.FileName);
        //            uploadedFile.SaveAs(Path.Combine(appData, fileName));
        //        }
        //    }
        //}




        string order = "";
        HttpFileCollection fileCollection = Request.Files;
        for (int i = 0; i < fileCollection.Count; i++)
        {
            HttpPostedFile uploadfile = fileCollection[i];
            string fileName = Path.GetFileName(uploadfile.FileName);
            if (uploadfile.ContentLength > 0)
            {
                string FileExtension = Path.GetExtension(uploadfile.FileName).ToString().ToLower();
                if (Convert.ToString(txt_Order.Text) == "")
                {
                    order = "0";
                }
                else
                {
                    order = txt_Order.Text;
                }
                string JobNum = Request.QueryString["Jobs"].ToString();
                if (FileExtension == ".jpeg" || FileExtension == ".gif" || FileExtension == ".png" || FileExtension == ".jpg")
                {
                    //uploadfile.SaveAs(Server.MapPath("../PPLAudit/Photo_Page_Images/" + DateTime.Now.ToString().Replace(" ", "_").Replace("/", "_").Replace(":", "_").Replace(",", "_") + fileName));
                    //int x = obj_dcPPLAudit.InsertPPL_PhotoPage(JobNum, Convert.ToString(DateTime.Now.ToString().Replace(" ", "_").Replace("/", "_").Replace(":", "_").Replace(",", "_") + fileName), txt_title.Text, txt_Description_Line1.Text, "", "", Convert.ToString(DateTime.Now), Convert.ToInt32(order), "PPL");   // txt_Description_Line2.Text, txt_Description_Line3.Text,
                    //BindData(JobNum);
                }
                else
                {
                    //int x = obj_dcPPLAudit.InsertPPL_PhotoPage(JobNum, "", txt_title.Text, txt_Description_Line1.Text, "", "", Convert.ToString(DateTime.Now), Convert.ToInt32(order), "PPL");   // txt_Description_Line2.Text, txt_Description_Line3.Text,
                    //BindData(JobNum);
                }
            }
        }
        clear();
    }

    protected void ButtonDelete_Click(object sender, EventArgs e)
    {
        //string queryString = "PPL_ImagesPopup.aspx?Jobs=" + Convert.ToString(Request.QueryString["Jobs"]);
        //string newWin = "window.open('" + queryString + "');";
        //ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);

        //Response.Redirect("PPL_ImagesPopup.aspx?Jobs=" + Convert.ToString(Request.QueryString["Jobs"]));

    }
    public void BindData(string jobNum)
    {
        DataTable dt = obj_dcPPLAudit.GetPPL_PhotoPage(jobNum, "PPL");
        grd_Image.DataSource = dt;
        grd_Image.DataBind();
    }
    public void clear()
    {
        txt_Description_Line1.Text = txt_Order.Text = txt_title.Text = "";    //txt_Description_Line2.Text = txt_Description_Line3.Text
    }
    protected void grd_Image_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string Image = "";
            string OrderNo = "";
            int id = Convert.ToInt32(grd_Image.DataKeys[e.RowIndex].Values[0].ToString());
            Image = Convert.ToString(grd_Image.DataKeys[e.RowIndex].Values[1].ToString());
            TextBox txt_U_Title = (TextBox)grd_Image.Rows[e.RowIndex].FindControl("txt_G_Title");
            TextBox txt_U_Description1 = (TextBox)grd_Image.Rows[e.RowIndex].FindControl("txt_G_Description1");
            //TextBox txt_U_Description2 = (TextBox)grd_Image.Rows[e.RowIndex].FindControl("txt_G_Description2");
            //TextBox txt_U_Description3 = (TextBox)grd_Image.Rows[e.RowIndex].FindControl("txt_G_Description3");
            TextBox txt_U_OrderNo = (TextBox)grd_Image.Rows[e.RowIndex].FindControl("txt_G_OrderNo");

            if (txt_U_OrderNo.Text == "")
            {
                OrderNo = "0";
            }
            else
            {
                OrderNo = txt_U_OrderNo.Text;
            }

            FileUpload FileUP_U_Image = (FileUpload)grd_Image.Rows[e.RowIndex].FindControl("FileUP_G_Image");
            if (FileUP_U_Image.HasFile)
            {
                string FileExtension = Path.GetExtension(FileUP_U_Image.PostedFile.FileName).ToString().ToLower();
                if (FileExtension == ".jpeg" || FileExtension == ".gif" || FileExtension == ".png" || FileExtension == ".jpg")
                {
                    Image = DateTime.Now.ToString().Replace(" ", "_").Replace("/", "_").Replace(":", "_").Replace(",", "_") + FileUP_U_Image.FileName;
                    FileUP_U_Image.SaveAs(Server.MapPath("../PPLAudit/Photo_Page_Images/" + DateTime.Now.ToString().Replace(" ", "_").Replace("/", "_").Replace(":", "_").Replace(",", "_") + FileUP_U_Image.FileName));

                    string JobNum = Request.QueryString["Jobs"].ToString();
                    int i = obj_dcPPLAudit.UpdatePPL_PhotoPage(id, JobNum, Image, txt_U_Title.Text, txt_U_Description1.Text, "", "", Convert.ToInt32(OrderNo), string.Empty);   //   txt_U_Description2.Text, txt_U_Description3.Text,
                    grd_Image.EditIndex = -1;
                    BindData(JobNum);
                }
                else
                {
                    Response.Write("<script>alert('Please Select Image File');</script>");
                }
            }
            else
            {
                string JobNum = Request.QueryString["Jobs"].ToString();
                int i = obj_dcPPLAudit.UpdatePPL_PhotoPage(id, JobNum, Image, txt_U_Title.Text, txt_U_Description1.Text, "", "", Convert.ToInt32(OrderNo), string.Empty);      //   txt_U_Description2.Text, txt_U_Description3.Text,
                grd_Image.EditIndex = -1;
                BindData(JobNum);
            }

        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('"+ex.Message+"');</script>");

        }

    }
    protected void grd_Image_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string JobNum = Request.QueryString["Jobs"].ToString();
        grd_Image.EditIndex = e.NewEditIndex;
        BindData(JobNum);
    }
    protected void grd_Image_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(grd_Image.DataKeys[e.RowIndex].Value.ToString());
        string JobNum = Request.QueryString["Jobs"].ToString();
        obj_dcPPLAudit.DeletePPL_PhotoPage(id);
        BindData(JobNum);
    }
    protected void grd_Image_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        string JobNum = Request.QueryString["Jobs"].ToString();
        grd_Image.EditIndex = -1;
        BindData(JobNum);
    }
    protected void lnkBtn_back_Click(object sender, EventArgs e)
    {
        string JobNum = Request.QueryString["Jobs"].ToString();
        string Utility = Request.QueryString["Utility"].ToString();
        Response.Redirect("../DisplayJobSearchRecords.aspx?InvoiceNo=" + Request.QueryString["InvoiceNo"].ToString() + "&Jobs=" + JobNum + "&Utility=" + Utility);
    }
    protected void grd_Image_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string JobNum = Request.QueryString["Jobs"].ToString();
        grd_Image.PageIndex = e.NewPageIndex;
        BindData(JobNum);

    }

    //protected void File_Upload(object sender, AjaxFileUploadEventArgs e)
    //{
    //    string filename = e.FileName;
    //    string strDestPath = Server.MapPath("~/Documents/");
    //    AjaxFileUpload1.SaveAs(@strDestPath + filename);
    //}



    protected void DTLimages_ItemCommand1(object source, DataListCommandEventArgs e)
    {

        if (e.CommandName == "btnDSelected")
        {
            try
            {
                using (ZipFile zip = new ZipFile())
                {

                    zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                    zip.AddDirectoryByName("Files");
                    foreach (DataListItem item in DTLimages.Items)
                    {
                        CheckBox CBimg = (CheckBox)item.FindControl("CBimg");

                        if (CBimg.Checked == true)
                        {
                            string filename = CBimg.Text;
                            string filepath = Server.MapPath(@"~\PPLAudit\Photo_Page_Images\" + filename);
                            zip.AddFile(filepath, "Files");
                        }
                    }

                    Response.Clear();
                    Response.BufferOutput = false;
                    string zipName = String.Format("Jobnumber-" + Convert.ToString(Request.QueryString["Jobs"]) + "_Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                    Response.ContentType = "application/zip";
                    Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
                    zip.Save(Response.OutputStream);
                    //Response.End();
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

            }

        }
        else if (e.CommandName == "btnDAll")
        {
            string jobnum = Convert.ToString(Request.QueryString["Jobs"]);
            DataTable dt = obj_dcPPLAudit.SelectPPLPhotoPageTop24_Change(jobnum);
            try
            {
                if (dt.Rows.Count > 0)
                {

                    using (ZipFile zip = new ZipFile())
                    {
                        zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                        zip.AddDirectoryByName("Files");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            string filename = Convert.ToString(dt.Rows[i]["PhotoName"]);
                            string filepath = Server.MapPath(@"~\PPLAudit\Photo_Page_Images\" + filename);
                            zip.AddFile(filepath, "Files");
                        }

                        Response.Clear();
                        Response.BufferOutput = false;
                        string zipName = String.Format("Jobnumber-" + jobnum + "_Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                        Response.ContentType = "application/zip";
                        Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
                        zip.Save(Response.OutputStream);
                        //Response.End();
                        HttpContext.Current.ApplicationInstance.CompleteRequest();
                    }


                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

            }
        }
        else if (e.CommandName == "btnCancle")
        {
            P1.Style.Add("display", "none");
        }
        else if (e.CommandName == "btnPrint")
        {
            ArrayList theList = new ArrayList();
            string[] strpath={};
            //string srt="swapnil";
           
            foreach (DataListItem item in DTLimages.Items)
            {

                CheckBox CBimg = (CheckBox)item.FindControl("CBimg");

                if (CBimg.Checked == true)
                {
                    string filename = CBimg.Text;

                    theList.Add(filename);
                    strpath = theList.Cast<string>().ToArray();


                }
            }
            string result = string.Join(",", strpath);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "paramFN1", "MyFunction('" + result + "');", true);
            //JavaScriptSerializer objSerializer = new JavaScriptSerializer();
            //Response.Write(objSerializer.Serialize(s));
           
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction('" + strpath + "')", true);
        }
        else if (e.CommandName == "btnPrintall")
        {
            ArrayList theList = new ArrayList();
            string[] strpath={};
            string jobnum = Convert.ToString(Request.QueryString["Jobs"]);
            DataTable dt = obj_dcPPLAudit.SelectPPLPhotoPageTop24_Change(jobnum);
            try
            {
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string filename = Convert.ToString(dt.Rows[i]["PhotoName"]);
                        theList.Add(filename);
                        strpath = theList.Cast<string>().ToArray();
                    }
                    
                }
                string result = string.Join(",", strpath);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "paramFN1", "MyFunction('" + result + "');", true);
            }
            catch (Exception ex)
            {
 
            }
 
        }
    }

}