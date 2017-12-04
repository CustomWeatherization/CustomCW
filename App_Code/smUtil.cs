using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Runtime.Remoting.Contexts;
//using Org.BouncyCastle.Utilities;

/// <summary>
/// Summary description for smUtil
/// </summary>
public class smUtil
{
	public smUtil()
	{
		//
		// TODO: Add constructor logic here
		//
	}
 #region " Session Management "

        public string RequestVariable(string Variable, TextBox VariableASPX)
          {
	          string functionReturnValue = null;
	          //Seting variable to querystring, htmlform, aspform, or cookie 
	          if (HttpContext.Current.Request.QueryString[Variable] != null) {
		                   functionReturnValue = HttpContext.Current.Request.QueryString[Variable].ToString();
	                    } else if ((HttpContext.Current.Request.Form[Variable].ToString().Length) > 0) {
		                  functionReturnValue = HttpContext.Current.Request.Form[Variable];
	                         } else if (VariableASPX.Text.Trim().Length > 0) {
		                            functionReturnValue = VariableASPX.Text.Trim();
	                            } else if (GetSession(Variable) != null) {
		                                 functionReturnValue = GetSession(Variable);
	                               } else if (HttpContext.Current.Request.Cookies[Variable] != null) {
		                              functionReturnValue =HttpContext.Current.Request.Cookies[Variable].Value.ToString();
	                             } else {
		                                   functionReturnValue = string.Empty;
	                                    }
	             return functionReturnValue;
        }

    public string RequestVariable(string Variable)
{
	string functionReturnValue = null;
	//Seting variable to querystring, htmlform, or cookie
	if (HttpContext.Current.Request.QueryString[Variable] != null) {
		functionReturnValue = HttpContext.Current.Request.QueryString[Variable].ToString();
	} else if ((HttpContext.Current.Request[Variable]).ToString().Length  > 0) {
		functionReturnValue =HttpContext.Current.Request.Form[Variable];
	} else if (GetSession(Variable) != null) {
		functionReturnValue = GetSession(Variable);
	} else if (HttpContext.Current.Request.Cookies[Variable] != null) {
		functionReturnValue = HttpContext.Current.Request.Cookies[Variable].Value.ToString();
	} else {
		functionReturnValue = string.Empty;
	}
	return functionReturnValue;
}

    public string RequestVariable(string Variable, DropDownList VariableASPX)
{
	string functionReturnValue = null;
	//Seting variable to querystring, htmlform, aspform, or cookie
	if (HttpContext.Current.Request.QueryString[Variable] != null) {
		functionReturnValue =HttpContext.Current.Request.QueryString[Variable].ToString();
	} else if ((HttpContext.Current.Request.Form[Variable]).ToString().Length > 0) {
		functionReturnValue = HttpContext.Current.Request.Form[Variable];
	} else if ((VariableASPX.SelectedValue).ToString().Length > 0) {
		functionReturnValue = VariableASPX.SelectedValue.ToString();
	} else if (GetSession(Variable) != null) {
		functionReturnValue = GetSession(Variable);
	} else if (HttpContext.Current.Request.Cookies[Variable] != null) {
		functionReturnValue = HttpContext.Current.Request.Cookies[Variable].Value.ToString();
	} else {
		functionReturnValue = string.Empty;
	}
	return functionReturnValue;
}

    public void SetVariable(string cName, string cValue)
    {
        int Expires = 365;
        SetSession(cName, cValue);
        SetCookie(cName, cValue);
    }

    public void DeleteVariable(string cName)
    {
        DeleteSession(cName);
        DeleteCookie(cName);
    }

    public void SetCookie(string cName, string cValue)
    {
        int Expires = 365;
        HttpCookie aCookie = new HttpCookie(cName);
        aCookie.Value = cValue;
        aCookie.Expires = DateTime.Now.AddDays(Expires);
        HttpContext.Current.Response.Cookies.Add(aCookie);
    }

    public string GetCookie(string cName)
    {
        string functionReturnValue = "";
        if ((HttpContext.Current.Request.Cookies[cName] != null))
        {
            //GetCookie = Server.HtmlEncode(Request.Cookies(cName).Value)
            HttpCookie aCookie = HttpContext.Current.Request.Cookies[cName];
            functionReturnValue = HttpContext.Current.Server.HtmlEncode(aCookie.Value);
        }
        else
        {
            return "";
        }
        return functionReturnValue;
    }

    public void DeleteCookie(string cName)
    {
        HttpCookie aCookie = new HttpCookie(cName);
        aCookie.Expires = DateTime.Now.AddDays(-1);
        HttpContext.Current.Response.Cookies.Add(aCookie);
    }

    public void SetSession(string cName, string cValue)
    {
        HttpContext.Current.Session[cName] = cValue;
    }

    public string GetSession(string cName)
    {
        return HttpContext.Current.Session[cName].ToString();
    }

    public void DeleteSession(string cName)
    {
        HttpContext.Current.Session[cName] = null;

    }

#endregion

//#region " File Utilities "

//public object FolderCreation(string Path, string FolderName)
//{
//    object fso = null;
//    fso = Server.CreateObject("Scripting.FileSystemObject");

//    try {
//        if (fso.FolderExists(Path + FolderName) == false) {
//            fso.CreateFolder(Path + FolderName);
//        }

//        return true;
//    } catch (Exception ex) {
//        return false;
//    }

//}

//#endregion

    #region " Utilities "
    public bool SendEmail(string emailTo, string emailFrom, string subject, string mailInfo)
    {
	    System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
	    mailMessage.From = new System.Net.Mail.MailAddress(emailFrom);
	    mailMessage.To.Add(new System.Net.Mail.MailAddress(emailTo));
	    mailMessage.IsBodyHtml = true;
	    mailMessage.Subject = subject;
	    mailMessage.Body = mailInfo.ToString();
	    System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient();
	    smtpClient.Host = "s2smtpout.secureserver.net";
	    try {
		    smtpClient.Send(mailMessage);
		    return true;
	    } catch (System.Net.Mail.SmtpException smtpExc) {
		    //Log error information on which email failed.
		    return false;
	    } catch (Exception ex) {
		    //Log general errors
		    return false;
	    }
    }

        public object FixApostrophe(string Text)
    {
	    return Text.Replace("'", "''");
    }

    //public object stripHTML(strHTML)
    //{
    //    object functionReturnValue = null;
    //    //Strips the HTML tags from strHTML using split and join

    //    //Ensure that strHTML contains something
    //    if (Strings.Len(strHTML) == 0) {
    //        functionReturnValue = strHTML;
    //        return functionReturnValue;
    //    }

    //    dynamic arysplit = null;
    //    dynamic i = null;
    //    dynamic j = null;
    //    dynamic strOutput = null;

    //    arysplit = Strings.Split(strHTML, "<");

    //    //Assuming strHTML is nonempty, we want to start iterating
    //    //from the 2nd array postition
    //    if (Strings.Len(arysplit(0)) > 0)
    //        j = 1;
    //    else
    //        j = 0;

    //    //Loop through each instance of the array
    //    for (i = j; i <= Information.UBound(arysplit); i++) {
    //        //Do we find a matching > sign?
    //        if (Strings.InStr(arysplit(i), ">")) {
    //            //If so, snip out all the text between the start of the string
    //            //and the > sign
    //            arysplit(i) = Strings.Mid(arysplit(i), Strings.InStr(arysplit(i), ">") + 1);
    //        } else {
    //            //Ah, the < was was nonmatching
    //            arysplit(i) = "<" + arysplit(i);
    //        }
    //    }

    //    //Rejoin the array into a single string
    //    strOutput = Strings.Join(arysplit, "");

    //    //Snip out the first <
    //    strOutput = Strings.Mid(strOutput, 2 - j);

    //    //Convert < and > to &lt; and &gt;
    //    strOutput = Strings.Replace(strOutput, ">", "&gt;");
    //    strOutput = Strings.Replace(strOutput, "<", "&lt;");

    //    functionReturnValue = strOutput;
    //    return functionReturnValue;
    //}

    //public string CutStringShort(string Text, int TextLength)
    //{
    //    string functionReturnValue = null;
    //    if (Text.ToString().Length > TextLength) {
    //        functionReturnValue =(Text, TextLength).ToString().PadLeft + "...";
    //    } else {
    //        functionReturnValue = Text;
    //    }
    //    return functionReturnValue;
    //}

    public bool IsNull(string Text)
    {
	    if (Text == null) {
		    return true;
	    } else if (Text == null) {
		    return true;
	    } else if (string.IsNullOrEmpty(Text.Trim())) {
		    return true;
	    } else if (Text == string.Empty) {
		    return true;
	    } else if (object.ReferenceEquals(Text, string.Empty)) {
		    return true;
            
	    } else if ((Text.Trim().ToString().Length ) < 1) {
		    return true;
	    } else {
		    return false;
	    }
    }

    //public object RemoveQuotes(string Text)
    //{
    //    Text = Text.Replace(Strings.Chr(39), "");
    //    Text = Text.Replace(Strings.Chr(34), "");
    //    Text = Text.Replace("'", "");

    //    return Text;
    //}

    #endregion
}
