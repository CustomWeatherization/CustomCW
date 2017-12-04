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

public partial class METED_METED_Photo_Page_Manage : System.Web.UI.Page
{
    dcPPLAudit obj_dcPPLAudit = new dcPPLAudit();
    public DataTable dtimg = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dtimg = new DataTable();
            string jobnumber = Convert.ToString(Request.QueryString["Jobs"]);
            //string Utility=Convert.ToString(Request.QueryString[""]);
            if (jobnumber != null && jobnumber != "")
            {
                dtimg = obj_dcPPLAudit.GetPPL_PhotoPage(jobnumber, "METED");
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
    }
    [System.Web.Services.WebMethod]
    public static string GetCurrentTime(string title, string desc, string orderno, string jobno, string Inv)
    {
        int x = 0;
        string directory = HttpContext.Current.Server.MapPath("~/NewMETED/uploads");
        string targetPath = HttpContext.Current.Server.MapPath("~/NewMETED/Photo_Page_Images1");
        string[] myFile = Directory.GetFiles(directory);
        if (x == 0)
        {
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
                    x = obj_dcPPLAudit.InsertPPL_PhotoPage(jobno, fileName, title, desc, "", "", Convert.ToString(DateTime.Now), Convert.ToInt32(orderno), "METED");   // txt_Description_Line2.Text, txt_Description_Line3.Text,
                }
            }
        }
        return "METED_Photo_Page_Manage.aspx?InvoiceNo=" + Inv + "&Jobs=" + jobno + "&Utility=1";
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

                        string filepath = Server.MapPath(@"~\NewMETED\Photo_Page_Images1\" + filename);

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
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
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
                    uploadfile.SaveAs(Server.MapPath("../NewMETED/Photo_Page_Images1/" + DateTime.Now.ToString().Replace(" ", "_").Replace("/", "_").Replace(":", "_").Replace(",", "_") + fileName));
                    int x = obj_dcPPLAudit.InsertPPL_PhotoPage(JobNum, Convert.ToString(DateTime.Now.ToString().Replace(" ", "_").Replace("/", "_").Replace(":", "_").Replace(",", "_") + fileName), txt_title.Text, txt_Description_Line1.Text, "", "", Convert.ToString(DateTime.Now), Convert.ToInt32(order), "PPL");   // txt_Description_Line2.Text, txt_Description_Line3.Text,
                    BindData(JobNum);
                }
                else
                {
                    int x = obj_dcPPLAudit.InsertPPL_PhotoPage(JobNum, "", txt_title.Text, txt_Description_Line1.Text, "", "", Convert.ToString(DateTime.Now), Convert.ToInt32(order), "PPL");   // txt_Description_Line2.Text, txt_Description_Line3.Text,
                    BindData(JobNum);
                }
            }
        }
        clear();
        //string order = "";
        //if (fileUP_Image.HasFile)
        //{
        //    string FileExtension = Path.GetExtension(fileUP_Image.PostedFile.FileName).ToString().ToLower();
        //    if (FileExtension == ".jpeg" || FileExtension == ".gif" || FileExtension == ".png" || FileExtension == ".jpg")
        //    {
        //        if (Convert.ToString(txt_Order.Text) == "")
        //        {
        //            order = "0";
        //        }
        //        else
        //        {
        //            order = txt_Order.Text;
        //        }
        //        string JobNum = Request.QueryString["Jobs"].ToString();
        //        int i = obj_dcPPLAudit.InsertPPL_PhotoPage(JobNum, Convert.ToString(DateTime.Now.ToString().Replace(" ", "_").Replace("/", "_").Replace(":", "_").Replace(",", "_") + fileUP_Image.FileName), txt_title.Text, txt_Description_Line1.Text, "", "", Convert.ToString(DateTime.Now), Convert.ToInt32(order),"METED");   // txt_Description_Line2.Text, txt_Description_Line3.Text,
        //        fileUP_Image.SaveAs(Server.MapPath("../METED/Photo_Page_Images1/" + DateTime.Now.ToString().Replace(" ", "_").Replace("/", "_").Replace(":", "_").Replace(",", "_") + fileUP_Image.FileName));
        //        BindData(JobNum);
        //        clear();

        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('Please Select Image File');</script>");
        //    }
        //}
        //else
        //{
        //    Response.Write("<script>alert('Please Select any Image');</script>");
        //}
    }
    public void BindData(string jobNum)
    {
        DataTable dt = obj_dcPPLAudit.GetPPL_PhotoPage(jobNum, "METED");
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
            DropDownList ddl_U_ImageFor = (DropDownList)grd_Image.Rows[e.RowIndex].FindControl("ddl_G_ImageFor");

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
                    FileUP_U_Image.SaveAs(Server.MapPath("../NewMETED/Photo_Page_Images1/" + DateTime.Now.ToString().Replace(" ", "_").Replace("/", "_").Replace(":", "_").Replace(",", "_") + FileUP_U_Image.FileName));

                    string JobNum = Request.QueryString["Jobs"].ToString();
                    int i = obj_dcPPLAudit.UpdatePPL_PhotoPage(id, JobNum, Image, txt_U_Title.Text, txt_U_Description1.Text, "", "", Convert.ToInt32(OrderNo),ddl_U_ImageFor.SelectedValue);   //   txt_U_Description2.Text, txt_U_Description3.Text,
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
                int i = obj_dcPPLAudit.UpdatePPL_PhotoPage(id, JobNum, Image, txt_U_Title.Text, txt_U_Description1.Text, "", "", Convert.ToInt32(OrderNo),ddl_U_ImageFor.SelectedValue);      //   txt_U_Description2.Text, txt_U_Description3.Text,
                grd_Image.EditIndex = -1;
                BindData(JobNum);
            }

        }
        catch
        {


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
                            string filepath = Server.MapPath(@"~\NewMETED\Photo_Page_Images1\" + filename);
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
                            string filepath = Server.MapPath(@"~\NewMETED\Photo_Page_Images1\" + filename);
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
            string[] strpath = { };
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
            string[] strpath = { };
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
