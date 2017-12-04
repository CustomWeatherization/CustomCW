<%@ Page Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true"
    EnableEventValidation="false" CodeFile="DisplayJobSearchRecords.aspx.cs" Inherits="DisplayJobSearchRecords"
    Title="Job Search Records" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .cover-bg
        {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #000;
        }
        .jobssearch
        {
            position: relative;
        }
        .HideButton
        {
            display: none;
        }
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=50);
            opacity: 0.7;
        }
        .pnlBackGround
        {
            position: fixed;
            top: 10%;
            left: 10px;
            width: 300px;
            height: 135px;
            text-align: center;
            background-color: White;
            border: solid 3px black;
            margin-left: 655px;
            margin-top: 180px;
        }
        table#ctl00_ContentPlaceHolder1_DTLimages
        {
            
            }
        table#ctl00_ContentPlaceHolder1_Panel1
        {
            position: absolute;
            top: 95px;
            width: 225px;
            left: 375px;
            position: absolute;
            background-color: rgb(230, 230, 237);
            border: solid 3px black;
        }
        .auto-style1 {
            height: 71px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <%-- <asp:ScriptManager ID="scrpt" runat="server">
    </asp:ScriptManager>--%>
    <div class="jobssearch">
        <h1>
            Search Results</h1>
        <asp:UpdatePanel ID="up_pnl_msg" runat="server">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblMsg" runat="server" Text="" Style="color: Red; font-size: 25px;" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="PPLSearch" runat="server">
            <tr>
                <td width="20%">
                    <%if (dtJobSearch.Rows.Count > 0)
                      { %>
                    <h3>
                        <%=dtJobSearch.Rows[0]["FirstName"].ToString()%>
                        <%=dtJobSearch.Rows[0]["LastName"].ToString()%></h3>
                    <p>
                        <%--<h5>Service Address:</h5> <%=dtJobSearch.Rows[0]["ServiceAddress1"].ToString()%>, <%=dtJobSearch.Rows[0]["ServiceCity"].ToString()%> <br /> 
           <%=dtJobSearch.Rows[0]["ServiceStateNAme"].ToString()%>, <%=dtJobSearch.Rows[0]["ServiceZipCode"].ToString()%> <br />
      <h5>Mailing Address:</h5>--%>
                        <%=dtJobSearch.Rows[0]["MailingAddress1"].ToString()%><br />
                        <%=dtJobSearch.Rows[0]["MailingCity"].ToString()%>,<%=dtJobSearch.Rows[0]["MailingStateName"].ToString()%>,
                        <%=dtJobSearch.Rows[0]["MailingZipCode"].ToString()%>
                        <br />
                        <br />
                        <%if (dtJobSearch.Rows[0]["HomePhone"].ToString() != "0")
                          { %>
                        Phone(h)
                        <%=dtJobSearch.Rows[0]["HomePhone"].ToString()%>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["WorkPhone"].ToString() != "0")
                          { %>
                        Phone(w)
                        <%=dtJobSearch.Rows[0]["WorkPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["CellPhone"].ToString() != "0")
                          { %>
                        Phone(c)
                        <%=dtJobSearch.Rows[0]["CellPhone"].ToString() %>
                        <br />
                        <%} %>
                    </p>
                    <h5>
                        JOB NUMBER:
                        <%=dtJobSearch.Rows[0]["JobNumber"].ToString()%></h5>
                    <%} %>
                </td>
                <td width="15%" align="center">
                    <%--<h2>
                        PPL</h2>--%>
                    <img src="images/new_logo.png" width="125px" height="50px" alt="" />
                </td>
                <td width="20%" align="center">
                    <h4>
                        PPL Invoice Menu</h4>
                    Make a selection in the drop down box.<br />
                    <asp:Button ID="btnGenarateInvoice" runat="server" class="btn_all" OnClick="btnGenarateInvoice_Click"
                        Visible="false" Text="Generate Invoice" />
                    <asp:DropDownList ID="DDL_Invoice" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_Invoice_SelectedIndexChanged"
                        Visible="false">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlPPLinvoiceMenu" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPPLinvoiceMenu_SelectedIndexChanged"
                        Visible="false">
                        <asp:ListItem Value="0" Text="Select Invoice"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Pg.1 - Finalized"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Pg.2 - Finalized"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Pg.3 - Finalized"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Pg.4 - Finalized"></asp:ListItem>
                        <asp:ListItem Value="5" Text="Pg.5 - Finalized"></asp:ListItem>
                        <asp:ListItem Value="6" Text="Print PPL Invoice"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlPPLinvoiceMenu2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPPLinvoiceMenu2_SelectedIndexChanged"
                        Visible="false">
                        <asp:ListItem Value="0" Text="Select Invoice"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Pg.1 - Not Finalized"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Pg.2 - Not Finalized"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Pg.3 - Not Finalized"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Pg.4 - Not Finalized"></asp:ListItem>
                        <asp:ListItem Value="5" Text="Pg.5 - Not Finalized"></asp:ListItem>
                        <asp:ListItem Value="6" Text="Print PPL Invoice"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlAct129IIPPLinvoiceMenu" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlAct129IIPPLinvoiceMenu_SelectedIndexChanged" Visible="false">
                        <asp:ListItem Value="0" Text="Select Invoice"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Pg.1 - Finalized"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Pg.2 - Finalized"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Pg.3 - Finalized"></asp:ListItem>
                        <asp:ListItem Value="6" Text="Print PPL Invoice"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlAct129IIPPLinvoiceMenu2" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlAct129IIPPLinvoiceMenu2_SelectedIndexChanged" Visible="false">
                        <asp:ListItem Value="0" Text="Select Invoice"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Pg.1 - Not Finalized"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Pg.2 - Not Finalized"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Pg.3 - Not Finalized"></asp:ListItem>
                        <asp:ListItem Value="6" Text="Print PPL Invoice"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<select name="">
        <option></option>
        <option value="">Pg.1 - Not Finalized</option> 
        <option value="">Pg.2 - Not Finalized</option>
        <option value="">Pg.3 - Not Finalized</option>
        <option value="">Pg.4 - Not Finalized</option>
        <option value="">Pg.5 - Not Finalized</option>
        <option value="">Print PPL Invoice</option>
        </select>--%>
                    <h4>
                        PPL Paper Work</h4>
                    <select name="">
                        <option></option>
                        <option value="">Refrigerator Data/Order Form</option>
                        <option value="">Customer Completion</option>
                        <option value="">Wrap Partnership Agreement</option>
                        <option value="">Actions To Save</option>
                    </select>
                </td>
                <td align="center">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"
                        class="btn_all" />
                    <asp:Button ID="btnAudit" runat="server" Text="Audit" OnClick="btnAudit_Click" class="btn_all" />
                    <asp:Button ID="btnPrintAudit" runat="server" Text="Print Audit" class="btn_all"
                        OnClick="btnPrintAudit_Click" />
                    <input type="button" id="Button4" value="Submit For Payment" class="btn_all" onclick="showDiv();" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="METEDSearch" runat="server">
            <tr>
                <td width="20%">
                    <%if (dtJobSearch.Rows.Count > 0)
                      { %>
                    <h3>
                        <%=dtJobSearch.Rows[0]["FirstName"].ToString()%>
                        <%=dtJobSearch.Rows[0]["LastName"].ToString()%></h3>
                    <p>
                        <%=dtJobSearch.Rows[0]["ServiceAddress1"].ToString()%><br />
                        <%=dtJobSearch.Rows[0]["ServiceCity"].ToString()%>, PA
                        <%=dtJobSearch.Rows[0]["ServiceZipCode"].ToString()%>
                        <br />
                        <%if (dtJobSearch.Rows[0]["HomePhone"].ToString() != "0")
                          { %>
                        Phone(h)
                        <%=dtJobSearch.Rows[0]["HomePhone"].ToString()%>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["WorkPhone"].ToString() != "0")
                          { %>
                        Phone(s)
                        <%=dtJobSearch.Rows[0]["WorkPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["CellPhone"].ToString() != "0")
                          { %>
                        Phone(c)
                        <%=dtJobSearch.Rows[0]["CellPhone"].ToString() %>
                        <br />
                        <%} %>
                    </p>
                    <h5>
                        JOB NUMBER:
                        <%=dtJobSearch.Rows[0]["JobNumber"].ToString()%></h5>
                    <%} %>
                </td>
                <td width="15%">
                    <%--<h2>
                        METED</h2>--%>
                    <img src="images/meted_logo.png" width="125px" height="50px" alt="" />
                </td>
                <td width="20%" align="center">
                    <h4>
                        METED Invoice Menu</h4>
                    Make a selection in the drop down box.<br />
                    <asp:Button ID="BtnMetedInvoice" runat="server" class="btn_all" Text="Generate Invoice"
                        OnClick="BtnMetedInvoice_Click" />
                    <asp:DropDownList ID="DDL_MetedInvoice" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_MetedInvoice_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DDL_METEDPrintInvoice" runat="server" AutoPostBack="true" Visible="false"
                        OnSelectedIndexChanged="DDL_METEDPrintInvoice_SelectedIndexChanged">
                        <asp:ListItem Value="0" Text="Select Invoice"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Pg.1 - 1 of 20 Lines left Finalized "></asp:ListItem>
                        <asp:ListItem Value="2" Text="Print Invoice"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<select name="">
        <option></option>
        <option value="">Pg.1 - Not Finalized</option> 
        <option value="">Pg.2 - Not Finalized</option>
        <option value="">Pg.3 - Not Finalized</option>
        <option value="">Pg.4 - Not Finalized</option>
        <option value="">Pg.5 - Not Finalized</option>
        <option value="">Print PPL Invoice</option>
        </select>--%>
                    <h4>
                        METED Paper Work</h4>
                    <select name="">
                        <option></option>
                        <option value=" ">Our Savings Strategy</option>
                        <option value=" ">WARM Program Application</option>
                        <option value=" ">Blower Door Disclaimer</option>
                        <option value=" ">Our Partnership Agreement</option>
                        <option value=" ">Weatherization Release</option>
                    </select>
                </td>
                <td align="right">
                    <asp:Button ID="btnUpdateMETED" runat="server" Text="Update" OnClick="btnUpdate_Click"
                        class="btn_all" />
                    <asp:Button ID="btnAuditMETED" runat="server" Text="Audit" class="btn_all" OnClick="btnAuditMETED_Click" />
                    <asp:Button ID="btnPrintAuditMETED" runat="server" Text="Print Audit" class="btn_all"
                        OnClick="btnPrintAuditMETED_Click" />
                    <input type="button" id="Button3" value="Submit For Payment" class="btn_all" onclick="showDiv();" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="PrivateTBL" runat="server"
            visible="false">
            <tr>
                <td width="20%">
                    <%if (dtJobSearch.Rows.Count > 0)
                      { %>
                    <h3>
                        <%=dtJobSearch.Rows[0]["FirstName"].ToString()%>
                        <%=dtJobSearch.Rows[0]["LastName"].ToString()%></h3>
                    <p>
                        <%=dtJobSearch.Rows[0]["ServiceAddress1"].ToString()%><br />
                        <%=dtJobSearch.Rows[0]["ServiceCity"].ToString()%>, PA
                        <%=dtJobSearch.Rows[0]["ServiceZipCode"].ToString()%>
                        <br />
                        <%if (dtJobSearch.Rows[0]["HomePhone"].ToString() != "0")
                          { %>
                        Phone(h)
                        <%=dtJobSearch.Rows[0]["HomePhone"].ToString()%>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["WorkPhone"].ToString() != "0")
                          { %>
                        Phone(s)
                        <%=dtJobSearch.Rows[0]["WorkPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["CellPhone"].ToString() != "0")
                          { %>
                        Phone(c)
                        <%=dtJobSearch.Rows[0]["CellPhone"].ToString() %>
                        <br />
                        <%} %>
                    </p>
                    <h5>
                        JOB NUMBER:
                        <%=dtJobSearch.Rows[0]["JobNumber"].ToString()%></h5>
                    <%} %>
                </td>
                <td width="20%">
                    <%--<h2>
                        Private Customer</h2>--%>
                    <img src="images/CW_Logotest.gif" width="125px" height="50px" alt="" />
                </td>
                <td width="20%">
                    <asp:Button ID="btnEstimate" runat="server" Text="Generate Estimate" class="btn_all"
                        OnClick="btnEstimate_Click" />
                    <asp:DropDownList ID="DDL_PrivateJob" runat="server" OnSelectedIndexChanged="DDL_PrivateJob_SelectedIndexChanged"
                        AutoPostBack="true">
                        <%--onChange='DivEstimateShowHide();'--%>
                    </asp:DropDownList>
                    <div id="DivEstimate" runat="server">
                        <asp:RadioButton ID="rdoDefaultEstimate" runat="server" Text="Default Estimate" GroupName="Estimate"
                            AutoPostBack="true" OnCheckedChanged="rdoDefaultEstimate_CheckedChanged" /><br />
                        <asp:RadioButton ID="rdoStandardEstimate" runat="server" Text="Standard Estimate"
                            AutoPostBack="true" GroupName="Estimate" OnCheckedChanged="rdoStandardEstimate_CheckedChanged" />
                    </div>
                </td>
                <td align="right">
                    <asp:Button ID="BtnPrivateJob" runat="server" Text="Update" OnClick="btnUpdate_Click"
                        class="btn_all" />
                    <input type="button" id="Button2" value="Submit For Payment" class="btn_all" onclick="showDiv();" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="Table1" runat="server"
            visible="false">
            <tr>
                <td width="20%">
                    <%if (dtJobSearch.Rows.Count > 0)
                      { %>
                    <h3>
                        <%=dtJobSearch.Rows[0]["FirstName"].ToString()%>
                        <%=dtJobSearch.Rows[0]["LastName"].ToString()%></h3>
                    <p>
                        <%=dtJobSearch.Rows[0]["ServiceAddress1"].ToString()%><br />
                        <%=dtJobSearch.Rows[0]["ServiceCity"].ToString()%>, PA
                        <%=dtJobSearch.Rows[0]["ServiceZipCode"].ToString()%>
                        <br />
                        <%if (dtJobSearch.Rows[0]["HomePhone"].ToString() != "0")
                          { %>
                        Phone(h)
                        <%=dtJobSearch.Rows[0]["HomePhone"].ToString()%>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["WorkPhone"].ToString() != "0")
                          { %>
                        Phone(s)
                        <%=dtJobSearch.Rows[0]["WorkPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["CellPhone"].ToString() != "0")
                          { %>
                        Phone(c)
                        <%=dtJobSearch.Rows[0]["CellPhone"].ToString() %>
                        <br />
                        <%} %>
                    </p>
                    <h5>
                        JOB NUMBER:
                        <%=dtJobSearch.Rows[0]["JobNumber"].ToString()%></h5>
                    <%} %>
                </td>
                <td width="15%">
                    <%--<h2>
                        METED</h2>--%>
                </td>
                <td width="20%">
                </td>
                <td align="right">
                    <asp:Button ID="BtnOtherUtility" runat="server" Text="Update" OnClick="btnUpdate_Click"
                        class="btn_all" />
                    <input type="button" id="Button1" value="Submit For Payment" class="btn_all" onclick="showDiv();" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="TblDCED" runat="server">
            <tr>
                <td width="20%">
                    <%if (dtJobSearch.Rows.Count > 0)
                      { %>
                    <h3>
                        <%=dtJobSearch.Rows[0]["FirstName"].ToString()%>
                        <%=dtJobSearch.Rows[0]["LastName"].ToString()%></h3>
                    <p>
                        <%=dtJobSearch.Rows[0]["ServiceAddress1"].ToString()%><br />
                        <%=dtJobSearch.Rows[0]["ServiceCity"].ToString()%>, PA
                        <%=dtJobSearch.Rows[0]["ServiceZipCode"].ToString()%>
                        <br />
                        <%if (dtJobSearch.Rows[0]["HomePhone"].ToString() != "0")
                          { %>
                        Phone(h)
                        <%=dtJobSearch.Rows[0]["HomePhone"].ToString()%>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["WorkPhone"].ToString() != "0")
                          { %>
                        Phone(s)
                        <%=dtJobSearch.Rows[0]["WorkPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["CellPhone"].ToString() != "0")
                          { %>
                        Phone(c)
                        <%=dtJobSearch.Rows[0]["CellPhone"].ToString() %>
                        <br />
                        <%} %>
                    </p>
                    <h5>
                        JOB NUMBER:
                        <%=dtJobSearch.Rows[0]["JobNumber"].ToString()%></h5>
                    <%} %>
                </td>
                <td width="20%">
                    <h2 style="margin-left: 35%;">
                        DCED</h2>
                    <%-- <img src="images/CW_Logotest.gif" width="125px" height="50px" alt="" />--%>
                </td>
                <td width="20%">
                    <h4>
                        DCED Invoice Menu</h4>
                    Make a selection in the drop down box.<br />
                    <asp:Button ID="BtnDCED" runat="server" Text="Generate Estimate" class="btn_all"
                        OnClick="BtnDCED_Click" />
                    <asp:DropDownList ID="Dll_DCED" runat="server" OnSelectedIndexChanged="Dll_DCED_SelectedIndexChanged"
                        AutoPostBack="true">
                        <%--onChange='DivEstimateShowHide();'--%>
                    </asp:DropDownList>
                </td>
                <td align="right">
                    <asp:Button ID="Button6" runat="server" Text="Update" OnClick="btnUpdate_Click" class="btn_all" />
                    <input type="button" id="Button7" value="Submit For Payment" class="btn_all" onclick="showDiv();" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tblUGI" runat="server">
            <tr>
                <td width="20%">
                    <%if (dtJobSearch.Rows.Count > 0)
                      { %>
                    <h3>
                        <%=dtJobSearch.Rows[0]["FirstName"].ToString()%>
                        <%=dtJobSearch.Rows[0]["LastName"].ToString()%></h3>
                    <p>
                        <%=dtJobSearch.Rows[0]["ServiceAddress1"].ToString()%><br />
                        <%=dtJobSearch.Rows[0]["ServiceCity"].ToString()%>, PA
                        <%=dtJobSearch.Rows[0]["ServiceZipCode"].ToString()%>
                        <br />
                        <%if (dtJobSearch.Rows[0]["HomePhone"].ToString() != "0")
                          { %>
                        Phone(h)
                        <%=dtJobSearch.Rows[0]["HomePhone"].ToString()%>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["WorkPhone"].ToString() != "0")
                          { %>
                        Phone(s)
                        <%=dtJobSearch.Rows[0]["WorkPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["CellPhone"].ToString() != "0")
                          { %>
                        Phone(c)
                        <%=dtJobSearch.Rows[0]["CellPhone"].ToString() %>
                        <br />
                        <%} %>
                    </p>
                    <h5>
                        JOB NUMBER:
                        <%=dtJobSearch.Rows[0]["JobNumber"].ToString()%></h5>
                    <%} %>
                </td>
                <td width="20%">
                    <h2 style="margin-left: 35%;">
                        UGI</h2>
                </td>
                <td width="20%">
                    <h4>
                        UGI Invoice Menu</h4>
                    Make a selection in the drop down box.<br />
                    <asp:Button ID="BtnUGI" runat="server" Text="Generate Estimate" class="btn_all" OnClick="BtnUGI_Click" />
                    <asp:DropDownList ID="Dll_UGI" runat="server" OnSelectedIndexChanged="Dll_UGI_SelectedIndexChanged"
                        AutoPostBack="true">
                        <%--onChange='DivEstimateShowHide();'--%>
                    </asp:DropDownList>
                </td>
                <td align="right">
                    <asp:Button ID="Button9" runat="server" Text="Update" OnClick="btnUpdate_Click" class="btn_all" />
                    <input type="button" id="Button10" value="Submit For Payment" class="btn_all" onclick="showDiv();" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tblARRA" runat="server">
            <tr>
                <td width="20%">
                    <%if (dtJobSearch.Rows.Count > 0)
                      { %>
                    <h3>
                        <%=dtJobSearch.Rows[0]["FirstName"].ToString()%>
                        <%=dtJobSearch.Rows[0]["LastName"].ToString()%></h3>
                    <p>
                        <%=dtJobSearch.Rows[0]["ServiceAddress1"].ToString()%><br />
                        <%=dtJobSearch.Rows[0]["ServiceCity"].ToString()%>, PA
                        <%=dtJobSearch.Rows[0]["ServiceZipCode"].ToString()%>
                        <br />
                        <%if (dtJobSearch.Rows[0]["HomePhone"].ToString() != "0")
                          { %>
                        Phone(h)
                        <%=dtJobSearch.Rows[0]["HomePhone"].ToString()%>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["WorkPhone"].ToString() != "0")
                          { %>
                        Phone(s)
                        <%=dtJobSearch.Rows[0]["WorkPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["CellPhone"].ToString() != "0")
                          { %>
                        Phone(c)
                        <%=dtJobSearch.Rows[0]["CellPhone"].ToString() %>
                        <br />
                        <%} %>
                    </p>
                    <h5>
                        JOB NUMBER:
                        <%=dtJobSearch.Rows[0]["JobNumber"].ToString()%></h5>
                    <%} %>
                </td>
                <td width="20%">
                    <h2>
                        ARRA</h2>
                    <%-- <img src="images/CW_Logotest.gif" width="125px" height="50px" alt="" />--%>
                </td>
                <td width="20%">
                    <h4>
                        ARRA Invoice Menu</h4>
                    Make a selection in the drop down box.<br />
                    <asp:Button ID="Button11" runat="server" Text="Generate Estimate" class="btn_all"
                        OnClick="btnEstimate_Click" />
                    <asp:DropDownList ID="DropDownList3" runat="server" OnSelectedIndexChanged="DDL_PrivateJob_SelectedIndexChanged"
                        AutoPostBack="true">
                        <%--onChange='DivEstimateShowHide();'--%>
                    </asp:DropDownList>
                </td>
                <td align="right">
                    <asp:Button ID="Button12" runat="server" Text="Update" OnClick="btnUpdate_Click"
                        class="btn_all" />
                    <input type="button" id="Button13" value="Submit For Payment" class="btn_all" onclick="showDiv();" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tblCADCOM" runat="server">
            <tr>
                <td width="20%">
                    <%if (dtJobSearch.Rows.Count > 0)
                      { %>
                    <h3>
                        <%=dtJobSearch.Rows[0]["FirstName"].ToString()%>
                        <%=dtJobSearch.Rows[0]["LastName"].ToString()%></h3>
                    <p>
                        <%=dtJobSearch.Rows[0]["ServiceAddress1"].ToString()%><br />
                        <%=dtJobSearch.Rows[0]["ServiceCity"].ToString()%>, PA
                        <%=dtJobSearch.Rows[0]["ServiceZipCode"].ToString()%>
                        <br />
                        <%if (dtJobSearch.Rows[0]["HomePhone"].ToString() != "0")
                          { %>
                        Phone(h)
                        <%=dtJobSearch.Rows[0]["HomePhone"].ToString()%>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["WorkPhone"].ToString() != "0")
                          { %>
                        Phone(s)
                        <%=dtJobSearch.Rows[0]["WorkPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["CellPhone"].ToString() != "0")
                          { %>
                        Phone(c)
                        <%=dtJobSearch.Rows[0]["CellPhone"].ToString() %>
                        <br />
                        <%} %>
                    </p>
                    <h5>
                        JOB NUMBER:
                        <%=dtJobSearch.Rows[0]["JobNumber"].ToString()%></h5>
                    <%} %>
                </td>
                <td width="20%">
                    <h2>
                        CADCOM</h2>
                    <%-- <img src="images/CW_Logotest.gif" width="125px" height="50px" alt="" />--%>
                </td>
                <td width="20%">
                    <h4>
                        CADCOM Invoice Menu</h4>
                    Make a selection in the drop down box.<br />
                    <asp:Button ID="Button14" runat="server" Text="Generate Estimate" class="btn_all"
                        OnClick="btnEstimate_Click" />
                    <asp:DropDownList ID="DropDownList4" runat="server" OnSelectedIndexChanged="DDL_PrivateJob_SelectedIndexChanged"
                        AutoPostBack="true">
                        <%--onChange='DivEstimateShowHide();'--%>
                    </asp:DropDownList>
                </td>
                <td align="right">
                    <asp:Button ID="Button15" runat="server" Text="Update" OnClick="btnUpdate_Click"
                        class="btn_all" />
                    <input type="button" id="Button16" value="Submit For Payment" class="btn_all" onclick="showDiv();" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tblWAP" runat="server">
            <tr>
                <td width="20%">
                    <%if (dtJobSearch.Rows.Count > 0)
                      { %>
                    <h3>
                        <%=dtJobSearch.Rows[0]["FirstName"].ToString()%>
                        <%=dtJobSearch.Rows[0]["LastName"].ToString()%></h3>
                    <p>
                        <%=dtJobSearch.Rows[0]["ServiceAddress1"].ToString()%><br />
                        <%=dtJobSearch.Rows[0]["ServiceCity"].ToString()%>, PA
                        <%=dtJobSearch.Rows[0]["ServiceZipCode"].ToString()%>
                        <br />
                        <%if (dtJobSearch.Rows[0]["HomePhone"].ToString() != "0")
                          { %>
                        Phone(h)
                        <%=dtJobSearch.Rows[0]["HomePhone"].ToString()%>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["WorkPhone"].ToString() != "0")
                          { %>
                        Phone(s)
                        <%=dtJobSearch.Rows[0]["WorkPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["CellPhone"].ToString() != "0")
                          { %>
                        Phone(c)
                        <%=dtJobSearch.Rows[0]["CellPhone"].ToString() %>
                        <br />
                        <%} %>
                    </p>
                    <h5>
                        JOB NUMBER:
                        <%=dtJobSearch.Rows[0]["JobNumber"].ToString()%></h5>
                    <%} %>
                </td>
                <td width="20%">
                    <h2>
                        WAP</h2>
                    <%-- <img src="images/CW_Logotest.gif" width="125px" height="50px" alt="" />--%>
                </td>
                <td width="20%">
                    <h4>
                        WAP Invoice Menu</h4>
                    Make a selection in the drop down box.<br />
                    <asp:Button ID="Button22" runat="server" Text="Generate Estimate" class="btn_all"
                        OnClick="btnEstimate_Click" />
                    <asp:DropDownList ID="DropDownList7" runat="server" OnSelectedIndexChanged="DDL_PrivateJob_SelectedIndexChanged"
                        AutoPostBack="true">
                        <%--onChange='DivEstimateShowHide();'--%>
                    </asp:DropDownList>
                </td>
                <td align="right">
                    <asp:Button ID="Button23" runat="server" Text="Update" OnClick="btnUpdate_Click"
                        class="btn_all" />
                    <input type="button" id="Button24" value="Submit For Payment" class="btn_all" onclick="showDiv();" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tblBCOC" runat="server">
            <tr>
                <td width="20%">
                    <%if (dtJobSearch.Rows.Count > 0)
                      { %>
                    <h3>
                        <%=dtJobSearch.Rows[0]["FirstName"].ToString()%>
                        <%=dtJobSearch.Rows[0]["LastName"].ToString()%></h3>
                    <p>
                        <%=dtJobSearch.Rows[0]["ServiceAddress1"].ToString()%><br />
                        <%=dtJobSearch.Rows[0]["ServiceCity"].ToString()%>, PA
                        <%=dtJobSearch.Rows[0]["ServiceZipCode"].ToString()%>
                        <br />
                        <%if (dtJobSearch.Rows[0]["HomePhone"].ToString() != "0")
                          { %>
                        Phone(h)
                        <%=dtJobSearch.Rows[0]["HomePhone"].ToString()%>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["WorkPhone"].ToString() != "0")
                          { %>
                        Phone(s)
                        <%=dtJobSearch.Rows[0]["WorkPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["CellPhone"].ToString() != "0")
                          { %>
                        Phone(c)
                        <%=dtJobSearch.Rows[0]["CellPhone"].ToString() %>
                        <br />
                        <%} %>
                    </p>
                    <h5>
                        JOB NUMBER:
                        <%=dtJobSearch.Rows[0]["JobNumber"].ToString()%></h5>
                    <%} %>
                </td>
                <td width="20%">
                    <h2 style="margin-left: 40%;">
                        BCOC</h2>
                    <%-- <img src="images/CW_Logotest.gif" width="125px" height="50px" alt="" />--%>
                </td>
                <td width="20%">
                    <h4>
                        BCOC Invoice Menu</h4>
                    Make a selection in the drop down box.<br />
                    <asp:Button ID="BtnBcoc" runat="server" Text="Generate Estimate" class="btn_all"
                        OnClick="BtnBcoc_Click" />
                    <asp:DropDownList ID="Dll_Bcoc" runat="server" OnSelectedIndexChanged="Dll_Bcoc_SelectedIndexChanged"
                        AutoPostBack="true">
                        <%--onChange='DivEstimateShowHide();'--%>
                    </asp:DropDownList>
                </td>
                <td align="right">
                    <asp:Button ID="Button18" runat="server" Text="Update" OnClick="btnUpdate_Click"
                        class="btn_all" />
                    <input type="button" id="Button19" value="Submit For Payment" class="btn_all" onclick="showDiv();" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tblVendor" runat="server"
            visible="false">
            <tr>
                <td width="20%">
                    <%if (dtJobSearch.Rows.Count > 0)
                      { %>
                    <h3>
                        <%=dtJobSearch.Rows[0]["FirstName"].ToString()%>
                        <%=dtJobSearch.Rows[0]["LastName"].ToString()%></h3>
                    <p>
                        <%=dtJobSearch.Rows[0]["ServiceAddress1"].ToString()%><br />
                        <%=dtJobSearch.Rows[0]["ServiceCity"].ToString()%>, PA
                        <%=dtJobSearch.Rows[0]["ServiceZipCode"].ToString()%>
                        <br />
                        <%if (dtJobSearch.Rows[0]["CellPhone"].ToString() != "")
                          { %>
                        Phone(O)
                        <%=dtJobSearch.Rows[0]["CellPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["HomePhone"].ToString() != "")
                          { %>
                        Phone(C)
                        <%=dtJobSearch.Rows[0]["HomePhone"].ToString()%>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["WorkPhone"].ToString() != "")
                          { %>
                        Phone(F)
                        <%=dtJobSearch.Rows[0]["WorkPhone"].ToString() %>
                        <br />
                        <%} %>
                        <%if (dtJobSearch.Rows[0]["Email"].ToString() != "")
                          { %>
                        Email:&nbsp;
                        <%=dtJobSearch.Rows[0]["Email"].ToString() %>
                        <br />
                        <%} %>
                    </p>
                    <h5>
                        JOB NUMBER:
                        <%=dtJobSearch.Rows[0]["JobNumber"].ToString()%></h5>
                    <%} %>
                </td>
                <td width="70%" colspan="2">
                    <h2 style="margin-left: 40%;">
                        <img src="VendorImage/<%=dtJobSearch.Rows[0]["VendorImgPath"].ToString()%>" width="40%"
                            height="30%" alt="" /></h2>
                    <%-- <img src="images/CW_Logotest.gif" width="125px" height="50px" alt="" />--%>
                </td>
              
                <td align="right">
                    <asp:Button ID="BtnVendor" runat="server" Text="Update" class="btn_all" OnClick="BtnVendor_Click" />
                    <br />
                    <asp:Button ID="btnPaymentVendor" runat="server" Text="Payment" class="btn_all" OnClick="btnPaymentVendor_Click" /><br />
                    <asp:DropDownList ID="DDlAllPDF" runat="server" Width="100%" onchange="return Confirm_Approval();">
                    </asp:DropDownList>
                    <asp:Button ID="Button5" runat="server" Text="Button" OnClick="Button5_Click" CssClass="HideButton" />
                    <%--<input type="button" id="Button17" value="Submit OnClick="BtnVendor_Click" For Payment" class="btn_all" onclick="showDiv();" />--%>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpPnl" runat="server">
            <ContentTemplate>
                <asp:Panel ID="P1" runat="server" DefaultButton="btn_Update" Style="display: none">
                    <table id="Table3" runat="server" backcolor="#E6E6ED" cssclass="pnlBackGround 2-popup cover-bg"
                        width="225px" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%;
                        background: rgba(0, 0, 0, 0.33); padding-left: 4px; z-index: 9999; padding-left: 4px;
                        display: none">
                        <tr>
                            <td>
                                <table id="Table4" runat="server" backcolor="#E6E6ED" cssclass="pnlBackGround 2-popup"
                                    width="225px" style="padding-left: 4px; position: absolute; left: 43%; background: #fff;
                                    border: 2px solid #000; top: 25%;">
                                    <tr>
                                        <td align="center">
                                            <b>Passcode:</b>&nbsp;&nbsp;<asp:TextBox ID="txt_pwd" runat="server" MaxLength="4"
                                                Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                                                color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Button ID="btn_Update" runat="server" Text="Ok" OnClick="btn_Update_Click" />
                                            <asp:Button ID="btn_Cancel" runat="server" Text="Close" class="top_btn" OnClick="btn_Cancel_Click" /><br />
                                            <asp:Label ID="lblErMsg" runat="server" Style="color: Red;"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <!-- -->
                <asp:Panel ID="P2" runat="server" DefaultButton="BtnPay">
                    <table id="Panel1" runat="server" backcolor="#E6E6ED" cssclass="pnlBackGround 2-popup cover-bg"
                        width="225px" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%;
                        background: rgba(0, 0, 0, 0.33); padding-left: 4px; z-index: 9999; padding-left: 4px;"
                        visible="false">
                        <tr>
                            <td>
                                <table id="Table2" runat="server" backcolor="#E6E6ED" cssclass="pnlBackGround 2-popup"
                                    width="225px" style="padding-left: 4px; position: absolute; left: 43%; background: #fff;
                                    border: 2px solid #000; top: 25%;">
                                    <tr>
                                        <td align="center">
                                            <asp:RadioButton ID="rdoInvoice" runat="server" GroupName="A" AutoPostBack="true"
                                                OnCheckedChanged="rdoInvoice_CheckedChanged" />&nbsp;<b>Invoice:</b> &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdoAudit" GroupName="A" runat="server" AutoPostBack="true" OnCheckedChanged="rdoAudit_CheckedChanged" />&nbsp;<b>Audit:</b>
                                        </td>
                                    </tr>
                                    <tr id="trInv" runat="server" visible="false">
                                        <td align="center">
                                            <b>Invoice:</b>&nbsp;&nbsp;<asp:DropDownList ID="Ddl_Inv" runat="server" Width="58px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr id="trQ" runat="server" visible="false">
                                        <td align="center">
                                            <b>
                                                <%--Was water heater is intalled?--%><asp:HiddenField ID="hdnExtraMesr" runat="server" />
                                                <asp:Label ID="lblQuesMesr" runat="server"></asp:Label>
                                            </b>
                                            <br />
                                            <asp:RadioButton ID="rdoYes" runat="server" GroupName="Que" />Yes&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdoNo" runat="server" GroupName="Que" Checked="true" />No
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="auto-style1">
                                            <asp:Button ID="BtnPay" runat="server" Text="Pay" OnClick="BtnPay_Click" />
                                            <asp:Button ID="btn_CancelP2" runat="server" Text="Close" class="top_btn" OnClick="btn_CancelP2_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        <!-- -->
        <%--</ContentTemplate>
        <triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnPayment" />
            </triggers>
        </asp:UpdatePanel>--%>
        <%--<asp:Button ID="btnShowPopup" runat="server" Style="display: none" OnClick="btnShowPopup_Click1" />--%>
    </div>
    <div class="clear">
    </div>
    <div class="btmbutton">
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
            class="btn_all" />
    </div>

    <script type="text/javascript">
        function showDiv() {
        debugger;
            document.getElementById('<%=P1.ClientID%>').style.display = 'block';
            document.getElementById('<%=Table3.ClientID%>').style.display = 'block';    
            document.getElementById('<%=txt_pwd.ClientID%>').value = '';
            document.getElementById('<%=lblErMsg.ClientID%>').innerHTML = '';
            
            getfocus();
        }
        function getfocus() {
            document.getElementById('<%=btn_Update.ClientID%>').focus();
        }
        function Confirm_Approval() {
                    if (confirm('Are you sure, you want to Download this PDF?')) {
                        var id = document.getElementById('<%=Button5.ClientID %>').name;
                        //alert(id);
                        __doPostBack(id, 'Button5_Click');
                    }
                    else { return false; }
                }
    </script>

</asp:Content>
