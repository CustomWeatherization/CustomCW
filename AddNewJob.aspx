<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewJob.aspx.cs" Inherits="AddNewJob"
    Title="Add Job" EnableEventValidation="false" %>

<%@ Register Assembly="ASPNetSpell" Namespace="ASPNetSpell" TagPrefix="ASPNetSpell" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" TagPrefix="CuteWebUI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

    <script type="text/javascript" src="Js/ajaxtooltip.js"></script>

    <script type="text/javascript" src="Js/jquery-1.2.2.pack.js"></script>

    <script src="Js/jquery.MultiFile.js" type="text/javascript"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Welcome to Cweather</title>
    <link href="css/default.css" rel="stylesheet" type="text/css" />
    <link href="images/favicon.ico" rel="icon" type="image/x-icon" />
    <%-- <script type="text/javascript">
        function DisableBackButton() {
            window.history.forward(1)
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function(evt) {
            if (evt.persisted) DisableBackButton()
        }
        window.onunload = function() { void (0) }
    </script>--%>

    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            //open popup
            $('.cd-popup-trigger').on('click', function (event) {
                event.preventDefault();
                $('.cd-popup').addClass('is-visible');
            });

            //close popup
            $('.cd-popup').on('click', function (event) {
                if ($(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup')) {
                    event.preventDefault();
                    $(this).removeClass('is-visible');
                }
            });
            //close popup when clicking the esc keyboard button
            $(document).keyup(function (event) {
                if (event.which == '27') {
                    $('.cd-popup').removeClass('is-visible');
                }
            });
        });
    </script>

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <script type="text/javascript">
        $(window).bind('beforeunload', function () { window.history.forward(1) });
    </script>

    <style type="text/css">
        .ajaxtooltip
        {
            position: absolute; /*leave this alone*/
            display: none; /*leave this alone*/
            width: 300px;
            left: 0; /*leave this alone*/
            top: 0; /*leave this alone*/
            background: lightyellow;
            border: 2px solid gray;
            border-width: 1px 2px 2px 1px;
            padding: 5px;
        }
    </style>
    <style type="text/css">
        .HideButton
        {
            display: none;
        }
        .BtnPrintHistory
        {
            background-color: #3570A0;
            border: 0 none;
            border-radius: 5px 5px 5px 5px;
            box-shadow: 0 0 5px #005396 inset;
            color: #FFFFFF;
            cursor: pointer;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 16px;
            font-weight: bold;
            margin: 15px 0;
            padding: 8px 25px;
            text-shadow: 1px 1px 0 #000000;
        }
        .panel
        {
            width: 300px; /*background-color: rgb(24, 21, 21);*/
            background-color: White;
            color: Black;
            border-color: Black;
            border: solid 2px;
            padding: 10px;
        }
        .BtnPop
        {
            background-color: #3570A0;
            border: 0 none;
            box-shadow: 0 0 5px #005396 inset;
            color: #FFFFFF;
            cursor: pointer;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 14px;
            font-weight: bold;
            margin: 8px 0;
            padding: 3px 15px;
            text-shadow: 1px 1px 0 #000000;
        }
        .input-class[placeholder]
        {
            line-height: 30px;
            font-size: 22px;
            width: 96%;
        }
        #txtCompanyName::-webkit-input-placeholder
        {
            color: black;
            text-decoration: bold;
            text-transform: uppercase;
            font-size: 30pt;
            text-align: center;
        }
        .formboxwidth
        {
            height: 280px;
        }
        .hoversize
        {
            position: relative;
        }
        .hoversize:hover div
        {
            display: block !important;
        }
        #DDl_Category
        {
            max-width: 180px;
        }
        .modal
        {
            position: absolute;
            z-index: 9999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }
        .center
        {
            z-index: 1500;
            margin: 300px auto;
            width: 0px;
            background-color: White;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }
        .center img
        {
            height: 250px;
            width: 250px;
        }
    </style>
    <style>
        .main_left1
        {
            /* height: 500px;*/
            float: left;
            width: 300px;
            margin-right: 0px;
            position: fixed;
        }
        .main_left1 ul
        {
            display: block;
            padding: 0;
        }
        .main_left1 ul li
        {
            list-style-type: none;
            display: block;
            border-bottom: solid 1px rgb(219, 219, 219);
            text-align: left;
            float: left;
            width: 84%;
        }
        .main_left1 ul li a
        {
            line-height: 28px;
            text-decoration: none;
            white-space: nowrap;
            background-color: #3570a0;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            cursor: pointer;
        }
        .main_left1 ul li a:hover
        {
            text-decoration: underline;
            color: rgb(65, 65, 65);
        }
        .top_icons ul li:hover > div
        {
            display: block !important;
        }
    </style>

    <script type="text/javascript" language="javascript" src="js/jquery-1.10.2.js"></script>

    <script type="text/javascript" language="javascript" src="js/jquery-ui.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div id="loading" runat="server" style="position: absolute; width: 100%; height: 360%;
        padding-top: 250px; background: rgba(0, 0, 0, 0.54); display: none; z-index: 999;
        text-align: center;">
        <img src="images/loading.gif" alt="Processing" style="margin-top: 100%;" />
    </div>
    <%--<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UPpnl">
                    <ProgressTemplate>
                        <div class="modal">
                            <div class="center">
                                <img alt="" src="images/loading.gif" />Please Wait....
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>--%>
    <asp:UpdatePanel ID="UPpnl" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hdnFName" runat="server" />
            <asp:HiddenField ID="hdnLName" runat="server" />
            <asp:HiddenField ID="hdnJobNo" runat="server" />
            <div class="fix_div">
                <!-- header -->
                <div class="header">
                    <div class="logo_div">
                        <a href="Home.aspx">
                            <img src="images/logo.jpg" /></a>
                    </div>
                    <div class="header_middiv">
                        Customer Service
                        <div class="">
                            <%if (Request.QueryString["Jobs"] != null)
                              { %>
                            <asp:Button ID="btnFewFld" runat="server" Text="Save" ValidationGroup="G" class="top_btn"
                                OnClick="btnFewFld_Click" Visible="false" OnClientClick="return ValidateDateGSave();" />
                            <asp:Button ID="btnUpdate" runat="server" Text="Save" ValidationGroup="G" class="top_btn"
                                OnClick="btnUpdate_Click" OnClientClick="return ValidateDateGSave();" />&nbsp;&nbsp;
                            <%--OnClientClick="return ValidateDateG();"--%>
                            <asp:Button ID="btnQuestionaire" runat="server" Text="Questionaire" class="top_btn"
                                OnClick="btnQuestionaire_Click" CausesValidation="false"/>&nbsp;&nbsp;
                            <asp:Button ID="btnPrint" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()"
                                OnClick="btnPrint_Click" />&nbsp;&nbsp;
                            <%}
                              else
                              { %>
                            <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="G" OnClick="txtSave_Click"
                                OnClientClick="return ValidateDateGSave();" class="top_btn" Style="height: 31px" />
                            &nbsp;&nbsp;
                            <%} %>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="txtCancel_Click"
                                CausesValidation="false" class="top_btn" />
                        </div>
                    </div>
                    <%--<div id="dialog" title="Event Calender">--%>
                    <div class="cd-popup" role="alert">
                        <div class="cd-popup-container">
                            <iframe src="Calendar.aspx" frameborder="0" width="1020px" height="760px"></iframe>
                            <a href="#0" class="cd-popup-close img-replace"></a>
                        </div>
                    </div>
                    <div class="head_right">
                        <div class="top_icons">
                            <ul>
                                <li>
                                    <asp:LinkButton ID="LnkBack" runat="server" CssClass="back" title="Back" OnClick="LnkBack_Click"
                                        Width="22px" Height="20px" CausesValidation="false"></asp:LinkButton></li>
                                <li><a class="cd-popup-trigger" href="javascript:void(0);">
                                    <img src="images/calendar-128.png" width="20px" />
                                </a></li>
                                <li>
                                    <asp:LinkButton ID="LnkHome" runat="server" CssClass="home" title="Home" OnClick="LnkHome_Click"
                                        CausesValidation="false"></asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="LnkAudit" runat="server" CssClass="audit" title="Audit" OnClick="LnkAudit_Click"></asp:LinkButton>
                                    <%if (Request.QueryString["JobNew"] == null)
                                      {%>
                                    <div class="main_left1" id="Quick_LinkPPL" style="display: none">
                                        <ul id="Ul1">
                                            <%if (Request.QueryString["UC"] == "PPL" || Request.QueryString["UC"] == "PPL Zone 1" || Request.QueryString["UC"] == "PPL Zone 2" || Request.QueryString["UC"] == "PPL CACLV")%>
                                            <%{%>
                                            <li id="Page1"><a href="PPLAudit/PPL_Audit_1.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                Demographic</a> </li>
                                            <li id="Page2"><a href="PPLAudit/PPL_Audit_2.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                Client Interview</a> </li>
                                            <li id="Page3"><a href="PPLAudit/PPL_Audit_3.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                Baseload Section</a> </li>
                                            <li id="Page4"><a href="PPLAudit/PPL_Audit_4.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                Refrigerator Testing</a> </li>
                                            <li id="Page5"><a href="PPLAudit/PPL_Audit_5.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                Low Cost Section</a> </li>
                                            <li id="Page6"><a href="PPLAudit/PPL_Audit_6.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                Water Heating</a> </li>
                                            <li id="Page7"><a href="PPLAudit/PPL_Audit_7.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                Full Cost Section</a> </li>
                                            <li id="Page8"><a href="PPLAudit/PPL_Audit_8.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                Blower Door</a> </li>
                                            <li id="Page9"><a href="PPLAudit/PPL_Audit_9.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                CAZ Pre</a> </li>
                                            <li id="Page9Post"><a href="PPLAudit/PPL_Audit_9Post.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                CAZ Post</a> </li>
                                            <li id="Page10"><a href="PPLAudit/PPL_Audit_10.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                Duct Testing</a> </li>
                                            <li id="PagePhoto"><a href="PPLAudit/PPL_Photo_Page_Manage.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2">
                                                Photos</a> </li>
                                            <%}%>
                                        </ul>
                                    </div>
                                    <div class="main_left1" id="Quick_LinkMETED" style="display: none">
                                        <ul id="Ul2">
                                            <%if (Request.QueryString["UC"] == "MET ED")%>
                                            <%{%>
                                            <li id="Li1"><a href="NewMETED/METED_Audit_Page1.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (1) Customer Info</a> </li>
                                            <li id="Li2"><a href="NewMETED/METED_Audit_Page2.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (2) Demographic</a> </li>
                                            <li id="Li3"><a href="NewMETED/METED_Audit_Page3.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (3) Customer Interview</a> </li>
                                            <li id="Li4"><a href="NewMETED/METED_Audit_Page4.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (4) CFL Standard Bulbs</a> </li>
                                            <li id="Li5"><a href="NewMETED/METED_Audit_Page5.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (5) LED Bulbs/ ACT 129</a> </li>
                                            <li id="Li6"><a href="NewMETED/METED_Audit_Page6.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (6) Refrigerators</a> </li>
                                            <li id="Li7"><a href="NewMETED/METED_Audit_Page7.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (7) Freezers</a> </li>
                                            <li id="Li8"><a href="NewMETED/METED_Audit_Page8.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (8) Washer and Dryer Assessment</a> </li>
                                            <li id="Li9"><a href="NewMETED/METED_Audit_Page9.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (9) Electric Water Heating Assessment</a> </li>
                                            <li id="Li10"><a href="NewMETED/METED_Audit_Page10.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (10) Heat Pump Water Heater</a> </li>
                                            <li id="Page11"><a href="NewMETED/METED_Audit_Page11.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (11) Cooling Assessment</a> </li>
                                            <li id="Page12"><a href="NewMETED/METED_Audit_Page12.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (12) Heating Assessment</a> </li>
                                            <li id="Page13"><a href="NewMETED/METED_Audit_Page13.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (13) Fossil Fuel Heating Assessment</a> </li>
                                            <li id="Page14"><a href="NewMETED/METED_Audit_Page14.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (14) Ductless Mini-Split Heat Pump</a> </li>
                                            <li id="Page15"><a href="NewMETED/METED_Audit_Page15.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (15) House Photos</a> </li>
                                            <li id="Page16"><a href="NewMETED/METED_Audit_Page16.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (16) Basement/Crawl/Belly</a> </li>
                                            <li id="Page17"><a href="NewMETED/METED_Audit_Page17.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (17) Attic Access</a> </li>
                                            <li id="Page18"><a href="NewMETED/METED_Audit_Page18.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (18) Air Leakage Testing</a> </li>
                                            <li id="Page19"><a href="NewMETED/METED_Audit_Page19.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (19) CAZ Testing 1</a> </li>
                                            <li id="Page20"><a href="NewMETED/METED_Audit_Page20.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (20) CAZ Testing 2</a> </li>
                                            <li id="Page21"><a href="NewMETED/METED_Audit_Page21.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (21) CAZ Testing 3</a> </li>
                                            <li id="Page22"><a href="NewMETED/METED_Audit_Page22.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (22) CAZ Testing 4</a> </li>
                                            <li id="Page23"><a href="NewMETED/METED_Audit_Page23.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (23) House Air Sealing</a> </li>
                                            <li id="Page24"><a href="NewMETED/METED_Audit_Page24.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (24) Measures Called & Refused</a> </li>
                                            <li id="Li11"><a href="NewMETED/METED_Photo_Page_Manage.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">
                                                (Photos)Other Photos</a> </li>
                                            <%}%>
                                        </ul>
                                    </div>
                                    <%}%>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LnkInvoice" runat="server" class="billing" title="Invoice" OnClick="LnkInvoice_Click"
                                        CausesValidation="false"></asp:LinkButton>
                                    <%if (Request.QueryString["JobNew"] == null)
                                      {%>
                                    <div class="main_left1" id="InvoiceMETED" style="display: none">
                                        <ul id="Ul3">
                                            <%if (Request.QueryString["UC"] == "MET ED")%>
                                            <%{%>
                                            <%if (dtInvoice.Rows.Count > 0 && !DBNull.Value.Equals(dtInvoice.Rows[0]["IncoiceNo"])) %>
                                            <%for (int i = 1; i <= Convert.ToInt32(dtInvoice.Rows[0]["IncoiceNo"]); i++)%>
                                            <%{%>
                                            <li id="Invoice<%=i%>"><a href="Invoice_Crystal.aspx?Back=dj&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1&InvoiceNo=<%=i%>">
                                                Invoice<%=i%></a> </li>
                                            <%}%>
                                            <%}%>
                                        </ul>
                                    </div>
                                    <div class="main_left1" id="InvoicePPL" style="display: none">
                                        <ul id="Ul4">
                                            <%if (Request.QueryString["UC"] == "PPL" || Request.QueryString["UC"] == "PPL Zone 1" || Request.QueryString["UC"] == "PPL Zone 2" || Request.QueryString["UC"] == "PPL CACLV")%>
                                            <%{%>
                                            <%if (dtInvoice.Rows.Count > 0 && !DBNull.Value.Equals(dtInvoice.Rows[0]["IncoiceNo"])) %>
                                            <%for (int i = 1; i <= Convert.ToInt32(dtInvoice.Rows[0]["IncoiceNo"]); i++)%>
                                            <%{%>
                                            <li id="Invoice<%=i%>"><a href="Invoice_Crystal.aspx?Back=dj&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=2&InvoiceNo=<%=i%>">
                                                Invoice<%=i%></a> </li>
                                            <%}%>
                                            <%}%>
                                        </ul>
                                    </div>
                                    <div class="main_left1" id="InvoiceDCED" style="display: none">
                                        <ul id="Ul5">
                                            <%if (Request.QueryString["UC"] == "DCED")%>
                                            <%{%>
                                            <%if (dtInvoice.Rows.Count > 0 && !DBNull.Value.Equals(dtInvoice.Rows[0]["IncoiceNo"])) %>
                                            <%for (int i = 1; i <= Convert.ToInt32(dtInvoice.Rows[0]["IncoiceNo"]); i++)%>
                                            <%{%>
                                            <li id="Invoice<%=i%>"><a href="Invoice_Crystal.aspx?Back=dj&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=3&InvoiceNo=<%=i%>">
                                                Invoice<%=i%></a> </li>
                                            <%}%>
                                            <%}%>
                                        </ul>
                                    </div>
                                    <div class="main_left1" id="InvoiceBCOC" style="display: none">
                                        <ul id="Ul6">
                                            <%if (Request.QueryString["UC"] == "BCOC")%>
                                            <%{%>
                                            <%if (dtInvoice.Rows.Count > 0 && !DBNull.Value.Equals(dtInvoice.Rows[0]["IncoiceNo"])) %>
                                            <%for (int i = 1; i <= Convert.ToInt32(dtInvoice.Rows[0]["IncoiceNo"]); i++)%>
                                            <%{%>
                                            <li id="Invoice<%=i%>"><a href="Invoice_Crystal.aspx?Back=dj&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=9&InvoiceNo=<%=i%>">
                                                Invoice<%=i%></a> </li>
                                            <%}%>
                                            <%}%>
                                        </ul>
                                    </div>
                                    <%}%>
                                </li>
                            </ul>
                        </div>
                        <div class="clear">
                        </div>
                        <br />
                        <div class="head_link">
                            <span id="hid_admin" runat="server"><a href="admin/Admin_Unfinalize.aspx">Administer
                                    Database</a> |</span>
                            <%--<a href="#">Logout</a>--%><asp:LinkButton ID="lnkLogin" runat="server" Text="Logout"
                                OnClick="lnkLogin_Click" CausesValidation="false"></asp:LinkButton>
                            <br />
                            Hello
                            <%=StrUserName%>
                        </div>
                    </div>
                </div>
                <!-- end header -->
                <div class="clear">
                </div>
                <!-- mid section1 -->
                <%--  <asp:ScriptManager ID="script" runat="server">
    </asp:ScriptManager>--%>
                <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </ajaxToolkit:ToolkitScriptManager>
                <div id="divPrint">
                    <%if (Request.QueryString["Jobs"] != null)
                      {%>
                    <h3>
                        Update <span id="spnUpJb" runat="server">Job</span><span id="spnUpVen" runat="server">Vendor</span>
                        <%=Request.QueryString["Jobs"].ToString()%>
                    </h3>
                    <%}
                      else
                      { %>
                    <h3>
                        Add New <span id="spnNewJob" runat="server">Jobs</span><span id="spnNewVendor" runat="server">Vendor</span>
                    </h3>
                    <%}%>
                    <asp:Label ID="lblDateMsg" runat="server" Style="color: Red; margin-left: 37%;"></asp:Label>
                    <div class="form_div">
                        <div class="section">
                            <input type="hidden" name="Language" value="0" id="hdnCheckbox">
                            <div style="margin-left: 26%;" id="DivDates" runat="server" visible="false">
                                <asp:DropDownList ID="DDL_AllDates" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_AllDates_SelectedIndexChanged">
                                    <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                    <asp:ListItem Text="Schedule Date" Value="Schedule Date"></asp:ListItem>
                                    <asp:ListItem Text="Re-Scheduled Date" Value="Re Scheduled Date"></asp:ListItem>
                                    <asp:ListItem Text="Audit Scheduled Date" Value="Audit Scheduled Date"></asp:ListItem>
                                    <asp:ListItem Text="Date Go Back Received" Value="Date Go Back Received"></asp:ListItem>
                                    <asp:ListItem Text="Date Go Back Scheduled" Value="Date Go Back Scheduled"></asp:ListItem>
                                    <asp:ListItem Text="Date Go Back Returned" Value="Date Go Back Returned"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfv_DDL_AllDates" runat="server" ValidationGroup="Date"
                                    ControlToValidate="DDL_AllDates" ErrorMessage="*" InitialValue="Select" Display="Dynamic"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txt_AllDates" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_txt_AllDates" runat="server" ValidationGroup="Date"
                                    ControlToValidate="txt_AllDates" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender9" runat="server" TargetControlID="txt_AllDates">
                                </ajaxToolkit:CalendarExtender>
                                <asp:Button ID="btn_AllDate" runat="server" Text="Save" ValidationGroup="Date" OnClick="btn_AllDate_Click"
                                    class="top_btn" />
                            </div>
                            <br />
                            <table width="100%" border="0" cellspacing="2" cellpadding="2">
                                <tr>
                                    <td style="width: 25%">
                                        <span id="job" runat="server">Job
                                                </span><span id="vendor" runat="server">Vendor
                                                </span>Number:
                                    </td>
                                    <td style="width: 25%">
                                        <span id="DateRcvd" runat="server">Date Received:</span><span id="net" runat="server">Net:</span>
                                    </td>
                                    <td style="width: 25%">
                                        <span id="dateGoBackReceive" runat="server">Date "Go Back" Received:</span><span
                                            id="duedate" runat="server">Due Date:</span><span id="SpnExt" runat="server">Ext:</span>
                                    </td>
                                    <td style="width: 25%">
                                        <span id="DateCmplt" runat="server">Date Completed:</span><span id="SendDte" runat="server">Send By Date:
                                                </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtJobNumber" runat="server" MaxLength="15"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtJobNumber"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDateReceived" runat="server" MaxLength="10" AutoComplete="off"></asp:TextBox>
                                        <asp:HiddenField ID="hdnTxtDateReceived" runat="server" />
                                        <ajaxToolkit:CalendarExtender ID="Calander" runat="server" TargetControlID="txtDateReceived">
                                        </ajaxToolkit:CalendarExtender>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server"
                                            TargetControlID="txtDateReceived" FilterType="Custom,Numbers" ValidChars="/">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDateReceived"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="DDl_Net" runat="server" Width="188px">
                                            <%--onselectedindexchanged="DDl_Net_SelectedIndexChanged" AutoPostBack="true"--%>
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Net 0" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Net 10" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Net 15" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Net 30" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Monthly" Value="5"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="G"
                                            ControlToValidate="DDl_Net" ErrorMessage="*" InitialValue="Select" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_GobackRecive" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txt_GobackRecive">
                                        </ajaxToolkit:CalendarExtender>
                                        <asp:TextBox ID="txtExt" runat="server" Width="170px" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDateCompleted" runat="server" MaxLength="10" AutoComplete="off"></asp:TextBox>
                                        <asp:HiddenField ID="hdntxtDateCompleted" runat="server" />
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateCompleted">
                                        </ajaxToolkit:CalendarExtender>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" runat="server"
                                            TargetControlID="txtDateCompleted" FilterType="Custom,Numbers" ValidChars="/">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <asp:DropDownList ID="DDl_SendByDate" runat="server" Width="188px">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="3 Days" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="5 Days" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="7 Days" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="10 Days" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="Date"
                                            ControlToValidate="DDl_SendByDate" ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator>
                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtReturnDate"
                            Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <%if (Request.QueryString["Jobs"] != null)
                                  { %>
                                <tr id="sch" runat="server">
                                    <td>
                                        <asp:Label ID="lblScheduleDtae" runat="server" Text="Schedule Date"></asp:Label>
                                    </td>
                                    <td>
                                        <%if (Request.QueryString["Jobs"] != null)
                                          {
                                              if (Convert.ToString(Request.QueryString["UC"]) == "PRIVATE CUSTOMER" || Convert.ToString(Request.QueryString["UC"]) == "Private")
                                              { %>
                                        Estimator Name:
                                        <%}
                                                        else
                                                        { %>
                                        <span id="spnAuditor" runat="server">Auditor Name:</span>
                                        <%}
                                                    } %>
                                    </td>
                                    <td>
                                        <span>Date "Go Back" Scheduled:</span>
                                    </td>
                                    <td>
                                        <span id="returndte" runat="server">Return Date:</span>
                                    </td>
                                </tr>
                                <tr id="schdt" runat="server">
                                    <td valign="top">
                                        <asp:TextBox ID="txtScheduleDtae" runat="server" MaxLength="9"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtScheduleDtae">
                                        </ajaxToolkit:CalendarExtender>
                                        <br />
                                        <br />
                                        Crew Chief:
                                        <asp:DropDownList runat="server" ID="DDl_CrewCheif" Width="79%">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <%if (Request.QueryString["Jobs"] != null)
                                          { %>
                                        <asp:TextBox ID="txtAuthorName" runat="server" MaxLength="20" Visible="false"></asp:TextBox>
                                        <asp:DropDownList runat="server" ID="DDL_Auditor_Name" Width="79%">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <% if (Convert.ToString(Request.QueryString["UC"]) == "PRIVATE CUSTOMER" || Convert.ToString(Request.QueryString["UC"]) == "Private")
                                           { %>
                                        Estimate Date:
                                        <%}
                                           else
                                           { %>
                                        <span id="spnAuditSchdt" runat="server">Audit Scheduled Date:</span><span id="spnInspectionSchdt"
                                            runat="server" visible="false">Inspection Scheduled Date:</span>
                                        <%}%>
                                        &nbsp;<asp:TextBox ID="txt_AuditScheduledDate" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txt_AuditScheduledDate">
                                        </ajaxToolkit:CalendarExtender>
                                        <%} %>
                                        <%--<textarea name="" cols="35" rows="2"></textarea>--%>
                                    </td>
                                    <td valign="top">
                                        <asp:TextBox ID="txt_GoBackSchedule" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="txt_GoBackSchedule">
                                        </ajaxToolkit:CalendarExtender>
                                        <br />
                                        <br />
                                        <span id="DtGoBackReturned" runat="server">Date "Go Back" Returned:</span>
                                        <br />
                                        <asp:TextBox ID="txt_GobackReturned" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="txt_GobackReturned">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td valign="top">
                                        <asp:TextBox ID="txtReturnDate" runat="server" MaxLength="10" AutoComplete="off"></asp:TextBox>
                                        <asp:HiddenField ID="hdnTxtReturnDate" runat="server" />
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtReturnDate">
                                        </ajaxToolkit:CalendarExtender>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" runat="server"
                                            TargetControlID="txtReturnDate" FilterType="Custom,Numbers" ValidChars="/">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <br />
                                        <asp:Label ID="bro" runat="server"></asp:Label>
                                        <br />
                                        <span>Re-Scheduled Date:</span>
                                        <br />
                                        <asp:TextBox ID="txtRe_ScheduledDate" runat="server" MaxLength="9"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtRe_ScheduledDate">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <span id="UtilityComp1" runat="server">Utility Company 1:</span><span id="Category"
                                            runat="server">Category:</span>
                                        <br />
                                    </td>
                                    <td>
                                        <span id="UtilityComp2" runat="server">Utility Company 2:</span><span id="Accno"
                                            runat="server">Account Number:
                                                </span>
                                    </td>
                                    <td>
                                        <span id="spn" runat="server" visible="false">Zone:</span><span id="spnPhone" runat="server">Office Number:</span>
                                        <%--<span id="SpnExt" runat="server" style="margin-left: 80px;">Ext:</span>--%>
                                    </td>
                                    <td>
                                        <%if (Convert.ToString(Request.QueryString["Back"]) != "Home")
                                          { %>
                                        <span id="spnSchInst" runat="server">Enter Scheduling Instructions below</span>
                                        <%} %>
                                        <span id="CntctPer" runat="Server">Contact Person:</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="DDl_UtilityCompany_1" runat="server" OnSelectedIndexChanged="DDl_UtilityCompany_1_SelectedIndexChanged"
                                            AutoPostBack="true" Style="color: Black;">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_UtilityCompany_1" runat="server" ControlToValidate="DDl_UtilityCompany_1"
                                            InitialValue="0" Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="DDl_Category" runat="server">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="210 PNC Credit Card" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="215 Home Depot Credit Card" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="220 Lowes Credit Card" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="225 Cat Fin LOC" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="236 Sub Contractor" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="280 M & T Bank" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="281 Nissan NV200" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="315 AES" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="500 Field Material" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="600 Rent Expense" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="617 Workman's Comp" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="625 Phone" Value="12"></asp:ListItem>
                                            <asp:ListItem Text="626 Utilities and Trash" Value="13"></asp:ListItem>
                                            <asp:ListItem Text="630 Insurance" Value="14"></asp:ListItem>
                                            <asp:ListItem Text="635 Advertising" Value="15"></asp:ListItem>
                                            <asp:ListItem Text="650 Permits and Licensing" Value="16"></asp:ListItem>
                                            <asp:ListItem Text="655 Repairs and Maintenance" Value="17"></asp:ListItem>
                                            <asp:ListItem Text="660 Office Expense" Value="18"></asp:ListItem>
                                            <asp:ListItem Text="665 Vehicle Expense" Value="19"></asp:ListItem>
                                            <asp:ListItem Text="680 Meals and Entertainment" Value="20"></asp:ListItem>
                                            <asp:ListItem Text="685 I.T." Value="21"></asp:ListItem>
                                            <asp:ListItem Text="690 Charitable Contribution" Value="22"></asp:ListItem>
                                            <asp:ListItem Text="691 Education and Training" Value="23"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="Date"
                                            ControlToValidate="DDl_Category" ErrorMessage="*" InitialValue="Select" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDL_UtilityCompany_2" runat="server" OnSelectedIndexChanged="DDL_UtilityCompany_2_SelectedIndexChanged"
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="txtAcc" runat="server" MaxLength="20" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="*"
                                            ControlToValidate="txtAcc" ValidationGroup="G" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDL_PplZone" runat="server" Visible="false">
                                            <asp:ListItem Text="Select Zone" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Zone 1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Zone 2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Zone CACLV" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="Hdn_PplZone" runat="server" />
                                        <asp:TextBox ID="txtPhone" runat="server" AutoComplete="off" MaxLength="12" onkeyup="mask(event,this);"
                                            onkeydown="mask(event,this)" Style="width: 170px;"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender31" runat="server"
                                            TargetControlID="txtPhone" FilterType="Numbers,Custom" ValidChars="-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="*"
                                            Display="Dynamic" ValidationExpression="^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{10})$"
                                            ControlToValidate="txtPhone" ValidationGroup="G"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtPhone"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>&nbsp;
                                        <%--<asp:TextBox ID="txtExt" runat="server" Width="50px" MaxLength="5"></asp:TextBox>--%>
                                    </td>
                                    <td rowspan="2">
                                        <!-- Multilene txt yha rakh--->
                                        <asp:TextBox ID="txtEnterSeheduling" runat="server" TextMode="MultiLine" Height="80px"
                                            Width="182px"></asp:TextBox>
                                        <asp:TextBox ID="txtCntctPer" runat="server" MaxLength="30" AutoComplete="off"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender32" runat="server"
                                            TargetControlID="txtCntctPer" FilterType="UppercaseLetters,LowercaseLetters,Custom"
                                            ValidChars=" ">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                                ControlToValidate="txtCntctPer" ValidationGroup="G"></asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="jobtype" runat="server">
                                        <h2>
                                            Job Type</h2>
                                    </td>
                                    <td colspan="2" id="Jbtp" runat="server">
                                        <asp:Panel ID="PanelJobTypePPL" runat="server">
                                            <asp:CheckBox ID="chkAct129" runat="server" Text="Act 129" onclick="ChkAct129(this.id);" />
                                            <asp:CheckBox ID="chkBaseLoad" Text="BaseLoad Only" runat="server" onclick="ChkOtherJobType(this.id);" />
                                            <asp:CheckBox ID="chkHighPriority" Text="High Priority" runat="server" />
                                            <asp:CheckBox ID="chkLowCost" Text=" Low Cost" runat="server" />
                                            <asp:CheckBox ID="chkFullCost" runat="server" Text="Full Cost" onclick="ChkOtherJobType(this.id);" />
                                            <br />
                                            <asp:CheckBox ID="chkAct129II" runat="server" Text=" Act 129 II" onclick="ChkAct129II(this.id);" />
                                            <asp:CheckBox ID="chkInspection" Text="Inspection" runat="server" />
                                            <asp:CheckBox ID="chkRemedial" Text="Remedial Education" runat="server" />
                                        </asp:Panel>
                                        <asp:Panel ID="PanelJobTypeMETED" runat="server" Visible="false">
                                            <asp:RadioButton ID="rdo_Warm" runat="server" GroupName="Warm" />Warm&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdo_WarmPlus" runat="server" GroupName="Warm" />Warm Plus</asp:Panel>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr id="lblFileupload" runat="server">
                                    <td>
                                        Upload Image:
                                    </td>
                                    <td>
                                        Upload PDF:
                                    </td>
                                    <td>
                                        Fax Number:
                                    </td>
                                    <td>
                                        Contact Phone Number:
                                    </td>
                                </tr>
                                <tr id="txtFileUpload" runat="server">
                                    <td valign="top">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <ajaxToolkit:AsyncFileUpload Width="220px" ID="AsyncFileUpload1" runat="server" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td valign="top">
                                        <div>
                                            <asp:Label ID="Label2" runat="server"></asp:Label>
                                            <%--<CuteWebUI:Uploader runat="server" ID="Uploader1" InsertText="Upload Multiple files Now"
                                                                MultipleFilesUpload="true" OnFileUploaded="Uploader_FileUploaded">
                                                                <ValidateOption AllowedFileExtensions="pdf" />
                                                            </CuteWebUI:Uploader>--%>
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <asp:Button ID="btnupload" runat="server" Text="Upload" OnClick="btnupload_Click" />
                                        </div>
                                        <div>
                                            <asp:GridView ID="GVPdfview" runat="server" AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="PDF name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDownload" Text="View" CommandArgument='<%# Eval("PDFName") %>'
                                                                runat="server" OnClick="DownloadFile"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <br />
                                        <asp:DataList ID="grdPdf" runat="server" CellSpacing="6" RepeatDirection="Horizontal"
                                            RepeatColumns="4" OnDeleteCommand="grdPdf_DeleteCommand">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdnAllPdf" runat="server" Value='<%#Eval("AllPdf")%>' />
                                                <img src="images/pdf-icon-trans.png" alt="<%#Eval("pdf")%>" width="30px" height="30px"
                                                    title="<%#Eval("pdf")%>" />
                                                <asp:ImageButton ID="imgBtnDeletePdf" runat="server" ImageUrl="images/ico_inactive.png"
                                                    ValidationGroup='<%#Eval("pdf")%>' class="deletepdf" OnClientClick="return Confirm_Approval_();"
                                                    CommandName="Delete" />
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                    <td valign="top">
                                        <asp:TextBox ID="txtFaxNo" runat="server" MaxLength="12" onkeyup="mask(event,this);"
                                            onkeydown="mask(event,this)"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender20" runat="server"
                                            TargetControlID="txtFaxNo" FilterType="Numbers,Custom" ValidChars="-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </td>
                                    <td valign="top">
                                        <asp:TextBox ID="txtCntctNum" runat="server" AutoComplete="off" MaxLength="12" onkeyup="mask(event,this);"
                                            onkeydown="mask(event,this)"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender33" runat="server"
                                            TargetControlID="txtCntctNum" FilterType="Numbers,Custom" ValidChars="-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                            ErrorMessage="*" Display="Dynamic" ValidationExpression="^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{10})$"
                                            ControlToValidate="txtCntctNum" ValidationGroup="G"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="clear">
                        </div>
                        <div class="section">
                            <table width="100%" border="0" cellspacing="2" cellpadding="2" id="tblDetails" runat="server">
                                <tr>
                                    <td width="33%">
                                        First Name:
                                    </td>
                                    <td width="33%">
                                        Last Name:
                                    </td>
                                    <td>
                                        Account:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="30"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender21" runat="server"
                                            TargetControlID="txtFirstName" FilterType="UppercaseLetters,LowercaseLetters,Custom"
                                            ValidChars=" ">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <asp:RequiredFieldValidator ID="rfv_txtFirstName" runat="server" ErrorMessage="*"
                                            ControlToValidate="txtFirstName" ValidationGroup="G" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLastName" runat="server" MaxLength="30"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender23" runat="server"
                                            TargetControlID="txtLastName" FilterType="UppercaseLetters,LowercaseLetters,Custom"
                                            ValidChars=" ">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <asp:RequiredFieldValidator ID="rfv_txtLastName" runat="server" ErrorMessage="*"
                                            ControlToValidate="txtLastName" ValidationGroup="G" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAccountNumber" runat="server" onkeyup="CheckAccount(event,this);"
                                            onkeydown="CheckAccount(event,this);"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" runat="server"
                                            TargetControlID="txtAccountNumber" FilterType="Custom,Numbers" ValidChars="-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <asp:RequiredFieldValidator ID="rfv_txtAccountNumber" runat="server" ErrorMessage="*"
                                            ControlToValidate="txtAccountNumber" ValidationGroup="G" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="2" cellpadding="2">
                                <tr>
                                    <td align="center">
                                        <asp:TextBox ID="txtCompanyName" runat="server" MaxLength="30" placeholder="Enter Company Name"
                                            Visible="false" CssClass="input-class" Style="text-align: center; font-size: xx-large;"></asp:TextBox>
                                        <asp:HiddenField ID="hdn_imgFileUpload" runat="server" />
                                        <img id="imgFileUpload" runat="server" visible="false" style="height: 85px;" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="clear">
                        </div>
                        <div class="section">
                            <div class="form_box2">
                                <h1>
                                    Mailing Address
                                </h1>
                                <div align="center">
                                    <asp:CheckBox ID="chkSetServiceToMailingAddress" runat="server" onclick="CheckedChangeAddress(this.id)" />
                                    <%if (Convert.ToString(Request.QueryString["GT"]) == "Vendor")
                                      { %>
                                    Set Mailing Address To Location Address
                                    <%}
                                      else
                                      {%>
                                    Set Service To Mailing Address
                                    <%} %>
                                </div>
                                <br />
                                <div class="sched">
                                    <ul>
                                        <li>
                                            <div class="lft-txt">
                                                Address:
                                            </div>
                                            <div class="rgt-txt">
                                                <asp:TextBox ID="txtAddress_Mailing" runat="server" TextMode="MultiLine" onkeyup="CheckedChangeAddressOnKeyUP()"
                                                    Width="100%"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtAddress_Mailing"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="lft-txt">
                                                City:
                                            </div>
                                            <div class="rgt-txt">
                                                <asp:TextBox ID="txtCity_Mailing" runat="server" onkeyup="CheckedChangeAddressOnKeyUP()"
                                                    MaxLength="25"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtCity_Mailing"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="fltrTxt_City_Mailing" runat="server" FilterType="Custom,LowercaseLetters,UppercaseLetters"
                                                    ValidChars=" " TargetControlID="txtCity_Mailing">
                                                </ajaxToolkit:FilteredTextBoxExtender>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="lft-txt">
                                                State:
                                            </div>
                                            <div class="rgt-txt">
                                                <asp:DropDownList ID="ddl_State_Mailing" runat="server" onchange="CheckedChangeAddressOnKeyUP()">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddl_State_Mailing"
                                                    InitialValue="Select State" Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="lft-txt">
                                                Zipcode:
                                            </div>
                                            <div class="rgt-txt">
                                                <asp:TextBox ID="txtZipCode_Mailing" runat="server" onkeyup="CheckedChangeAddressOnKeyUP()"
                                                    MaxLength="8"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtZipCode_Mailing"
                                                    Display="Dynamic" ForeColor="Red" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="lft-txt">
                                                <span id="spnEmailVendor" runat="server">Email Address: </span>
                                            </div>
                                            <div class="rgt-txt">
                                                <asp:TextBox ID="txtEmailVendor" runat="server"></asp:TextBox>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="lft-txt" id="county" runat="server">
                                                County:
                                            </div>
                                            <div class="rgt-txt">
                                                <asp:DropDownList ID="ddlCounty" runat="server">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlCounty"
                                                    InitialValue="0" ForeColor="Red" ErrorMessage="*" ValidationGroup="G" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <br />
                                                <br />
                                            </div>
                                        </li>
                                </div>
                            </div>
                            <div class="form_box2">
                                <h1 id="srvc" runat="server">
                                    Service Address</h1>
                                <br />
                                <br />
                                <div class="sched">
                                    <ul>
                                        <li>
                                            <div class="lft-txt">
                                                Address:
                                            </div>
                                            <div class="rgt-txt">
                                                <asp:TextBox ID="txtAddress_Service" runat="server" TextMode="MultiLine" Width="100%"
                                                    onkeyup="CheckedChangeAddressOnKeyUP()"></asp:TextBox>
                                                <asp:HiddenField ID="hdnAddress_Service" runat="server" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtAddress_Mailing"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="lft-txt">
                                                City:
                                            </div>
                                            <div class="rgt-txt">
                                                <asp:TextBox ID="txtCity_Service" runat="server" MaxLength="25" onkeyup="CheckedChangeAddressOnKeyUP()"></asp:TextBox>
                                                <asp:HiddenField ID="hdnCity_Service" runat="server" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtCity_Service"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="fltrTxt_City_Service" runat="server" FilterType="Custom,LowercaseLetters,UppercaseLetters"
                                                    ValidChars=" " TargetControlID="txtCity_Service">
                                                </ajaxToolkit:FilteredTextBoxExtender>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="lft-txt">
                                                State:
                                            </div>
                                            <div class="rgt-txt">
                                                <asp:DropDownList ID="ddl_State_Service" runat="server" onchange="CheckedChangeAddressOnKeyUP()">
                                                </asp:DropDownList>
                                                <asp:HiddenField ID="hdn_State_Service" runat="server" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddl_State_Service"
                                                    InitialValue="Select State" Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="lft-txt">
                                                Zipcode:
                                            </div>
                                            <div class="rgt-txt">
                                                <asp:TextBox ID="txtZipCode_Service" runat="server" MaxLength="8" onkeyup="CheckedChangeAddressOnKeyUP()"></asp:TextBox>
                                                <asp:HiddenField ID="hdnZipCode_Service" runat="server" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtZipCode_Service"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="clear">
                            </div>
                            <br />
                            <div class="form_box3" id="phones" runat="server">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <h2>
                                                Phones:</h2>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="39%">
                                            Phone# (home):
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPhone_Home" runat="server" MaxLength="12" onkeyup="mask(event,this);"
                                                onkeydown="mask(event,this)" Width="111%"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender25" runat="server"
                                                TargetControlID="txtPhone_Home" FilterType="Numbers,Custom" ValidChars="-">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPhone_Home"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server"
                                                ErrorMessage="Non valid phone number." Display="Dynamic" ValidationExpression="^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{10})$"
                                                ControlToValidate="txtPhone_Home" ValidationGroup="G"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <span class="smalltext">10 digits <strong>No other chars</strong></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Phone# (cell):
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPhone_Cell" runat="server" CssClass="smalltext" MaxLength="12"
                                                onkeyup="mask(event,this);" onkeydown="mask(event,this)" Width="111%"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender26" runat="server"
                                                TargetControlID="txtPhone_Cell" FilterType="Numbers,Custom" ValidChars="-">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator19" runat="server"
                                                ErrorMessage="Non valid phone number." Display="Dynamic" ValidationExpression="^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{10})$"
                                                ControlToValidate="txtPhone_Cell" ValidationGroup="G"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <span class="smalltext">home or cell required</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Phone#(work):
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPhone_Work" runat="server" MaxLength="12" onkeyup="mask(event,this);"
                                                onkeydown="mask(event,this)" Width="111%"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender27" runat="server"
                                                TargetControlID="txtPhone_Work" FilterType="Numbers,Custom" ValidChars="-">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator20" runat="server"
                                                ErrorMessage="Non valid phone number." Display="Dynamic" ValidationExpression="^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{10})$"
                                                ControlToValidate="txtPhone_Work" ValidationGroup="G"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <span class="smalltext">home or cell required</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="form_box4" id="noOfOccu" runat="server">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Email Address:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEmailId" runat="server" Width="111%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Number Of Occupants:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNumberOfOccupants" runat="server" MaxLength="4" Width="111%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtNumberOfOccupants"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server"
                                                TargetControlID="txtNumberOfOccupants" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNumberOfOccupants"
                                                ErrorMessage="Input is not valid." ValidationGroup="G" Display="Dynamic" ValidationExpression="^(?=.*[0-9])(?:[0-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Year Home Built:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtHomeBuilt" runat="server" MaxLength="4" Width="111%"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender24" runat="server"
                                                TargetControlID="txtHomeBuilt" FilterType="Numbers">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="G"
                                                Display="Dynamic" ControlToValidate="txtHomeBuilt" ErrorMessage="Only Numbers are allowed in this field please."
                                                ValidationExpression="^(?=.*[0-9])(?:[0-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                            <br />
                                            <span class="smalltext">Only Numbers in this field please</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div class="section" id="heating" runat="server">
                            <h1>
                                Heating &amp; WaterHeater &amp; Air Conditioning</h1>
                            <table width="100%" border="0" cellspacing="2" cellpadding="2">
                                <tr>
                                    <th width="25%">
                                        Heat Source:
                                    </th>
                                    <th width="25%">
                                        Heat Type:
                                    </th>
                                    <th width="25%">
                                        Water Heater Type:
                                    </th>
                                    <th>
                                        Air Conditioning:
                                    </th>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:CheckBoxList ID="chkLst_HeatSource" runat="server" RepeatDirection="Vertical">
                                            <asp:ListItem Value="4" Text="Bottled Gas"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="City Steam"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="Coal"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Electric"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Kerosene"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="Natural Gas"></asp:ListItem>
                                            <asp:ListItem Value="9" Text="Oil"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Solar"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Unknown"></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>
                                    <td valign="top">
                                        <asp:CheckBoxList ID="chklst_Heat_Type" runat="server" RepeatDirection="Vertical">
                                            <asp:ListItem Value="3" Text="Baseboard"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Ceiling"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="Floor Cable"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Heat Pump"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="Hot Water Boiler"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Space Heaters"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="Wall Heaters"></asp:ListItem>
                                            <asp:ListItem Value="9" Text="Warm Air Furnace"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Unknown"></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>
                                    <td valign="top">
                                        <asp:CheckBoxList ID="chklst_WaterHeaterType" runat="server" RepeatDirection="Vertical">
                                            <asp:ListItem Value="7" Text="City Steam"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="Coal"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Electric"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Natural Gas"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Oil"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Solar"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="Unknown"></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>
                                    <td valign="top">
                                        <asp:CheckBoxList ID="chkLst_Air_Conditioning" runat="server" RepeatDirection="Vertical">
                                            <asp:ListItem Value="1" Text="Central Air Unit"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Portable Unit"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Wall Unit"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Window Unit"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Unknown"></asp:ListItem>
                                        </asp:CheckBoxList>
                                        <br />
                                        Total Number of Units
                                        <br />
                                        <asp:TextBox ID="txt_TotalNumberOfUnit_AirConditioning" runat="server" MaxLength="2"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txt_TotalNumberOfUnit_AirConditioning"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server"
                                            TargetControlID="txt_TotalNumberOfUnit_AirConditioning" FilterType="Numbers"
                                            ValidChars="." FilterMode="ValidChars">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_TotalNumberOfUnit_AirConditioning"
                                            ErrorMessage="Input is not valid." ValidationGroup="G" Display="Dynamic" ValidationExpression="^(?=.*[0-9])(?:[0-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="clear">
                        </div>
                        <asp:Panel ID="pnlPPLShow" runat="server" Visible="false">
                            <div class="section">
                                <h1>
                                    PPL Seasonal Costs and Allowances</h1>
                                <table width="100%" border="0" cellspacing="2" cellpadding="2">
                                    <tr>
                                        <td width="25%">
                                            <strong>Yearly KWH </strong><br />
                                             <asp:TextBox ID="txtYearlyKWH_Hours" runat="server" MaxLength="7" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtYearlyKWH_Hours"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server"
                                                TargetControlID="txtYearlyKWH_Hours" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                        <td width="25%">
                                           <strong>Low1 KWH</strong><br />
                                            <asp:TextBox ID="txtLow1KWHHours" runat="server" MaxLength="20" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtLow1KWHHours"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                                TargetControlID="txtLow1KWHHours" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                        <td width="25%">
                                            <strong>Low2 KWH</strong><br />
                                            <asp:TextBox ID="txtLow2KWH_Hours" runat="server" MaxLength="20" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtLow2KWH_Hours"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                                TargetControlID="txtLow2KWH_Hours" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                        
                                        <td width="25%">
                                           
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                        <td>
                                            JuneKWH:
                                        </td>
                                        <td>
                                            July KWH:
                                        </td>
                                        <td>
                                            August KWH:
                                        </td>
                                        <td>
                                            September KWH:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtJuneKWH" runat="server" MaxLength="7" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtJuneKWH"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server"
                                                TargetControlID="txtJuneKWH" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtJuneKWH"
                                                ErrorMessage="Input is not valid." ValidationGroup="G" Display="Dynamic" ValidationExpression="^(?=.*[0-9])(?:[0-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtJulyKWH" runat="server" MaxLength="7" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtJulyKWH"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                                TargetControlID="txtJulyKWH" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtJulyKWH"
                                                ErrorMessage="Input is not valid." ValidationGroup="G" Display="Dynamic" ValidationExpression="^(?=.*[0-9])(?:[0-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAugustKWH" runat="server" MaxLength="7" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAugustKWH"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                                TargetControlID="txtAugustKWH" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtAugustKWH"
                                                ErrorMessage="Input is not valid." ValidationGroup="G" Display="Dynamic" ValidationExpression="^(?=.*[0-9])(?:[0-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSeptemberKWH" runat="server" MaxLength="7" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtSeptemberKWH"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                                TargetControlID="txtSeptemberKWH" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtSeptemberKWH"
                                                ErrorMessage="Input is not valid." ValidationGroup="G" Display="Dynamic" ValidationExpression="^(?=.*[0-9])(?:[0-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                            BaseLoad:
                                        </td>
                                        <td>
                                            TWinter Seasonal:
                                        </td>
                                        <td>
                                            TSummer Seasonal:
                                        </td>
                                        <td>
                                            Spending Allowance:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtBaseLoad" runat="server" MaxLength="20" ReadOnly="true"></asp:TextBox>
                                            <asp:HiddenField ID="hdnBaseLoad" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTWinterSeasonal" runat="server" MaxLength="20" ReadOnly="true"></asp:TextBox>
                                            <asp:HiddenField ID="hdnTWinterSeasonal" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTSummerSeasonal" runat="server" MaxLength="20" ReadOnly="true"></asp:TextBox>
                                            <asp:HiddenField ID="hdnTSummerSeasonal" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSpendingAllowance" runat="server" MaxLength="15" onkeyup="javascript:this.value=Comma(this.value);"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender28" runat="server"
                                                TargetControlID="txtSpendingAllowance" FilterType="Numbers,Custom" ValidChars="$,."
                                                FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            Shell Allowance:
                                        </td>
                                        <td>
                                            Repair Allowance:
                                        </td>
                                        <td>
                                            Health & Safety Allowance:
                                        </td>
                                        <td>
                                            Budget Allowance:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtShellallwnance" runat="server" MaxLength="20" ReadOnly="true"></asp:TextBox>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRepairAllowance" runat="server" MaxLength="20" ReadOnly="true"></asp:TextBox>
                                            <asp:HiddenField ID="HiddenField2" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtHealthAllowance" runat="server" MaxLength="20" ReadOnly="true"></asp:TextBox>
                                            <asp:HiddenField ID="HiddenField3" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBudgetAllowance" runat="server" MaxLength="25" ReadOnly="true"></asp:TextBox>
                                           <%-- <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender34" runat="server"
                                                TargetControlID="txtBudgetAllowance" FilterType="Numbers,Custom" ValidChars="$,."
                                                FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender> --%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="clear">
                            </div>
                            <div class="section">
                                <h1>
                                    PPL Proprietary Usage</h1>
                                <table width="100%" border="0" cellspacing="2" cellpadding="2">
                                    <tr>
                                        <td width="33%">
                                            On Track:
                                        </td>
                                        <td width="33%">
                                            On Track Amount:
                                        </td>
                                        <td width="33%">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdoYes_OnTrack" runat="server" GroupName="G" />Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdoNo_OnTrack" runat="server" GroupName="G" />No
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtOnTrackAmount" runat="server" MaxLength="7" onkeyup="GetDollerSign(this.id);"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                                TargetControlID="txtOnTrackAmount" FilterType="Numbers,Custom" ValidChars=".$"
                                                FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtOnTrackAmount"
                                                ErrorMessage="Input is not valid." ValidationGroup="G" Display="Dynamic" ValidationExpression="^(?=.*[0-9])(?:[0-9$]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdoTenant" runat="server" onclick="Test(this);" GroupName="O" />Tenant&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdoOwner" runat="server" GroupName="O" onclick="Test(this);" />Owner
                                        </td>
                                    </tr>
                                </table>
                                <div id="courier" runat="server" style="display: none">
                                    <table width="100%" border="0" cellspacing="2" cellpadding="2">
                                        <tr>
                                            <td colspan="3">
                                                <h2>
                                                    Landlord Information <strong>MUST</strong> be completed if you are a Tenant</h2>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Landlord Name:
                                            </td>
                                            <td>
                                                Landlord Phone (10 digits only):
                                            </td>
                                            <td>
                                                Email Or Fax:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtLandlordName" runat="server" MaxLength="20"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLandlordPhone" runat="server" MaxLength="12" onkeyup="mask(event,this);"
                                                    onkeydown="mask(event,this)"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLandlordEmailOrFax" runat="server" onkeyup="chekMailorFax(event,this);"
                                                    onkeydown="chekMailorFax(event,this)"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Address:
                                            </td>
                                            <td>
                                                City:
                                            </td>
                                            <td>
                                                State:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtLandlordAddress" runat="server" MaxLength="20"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLandlordCity" runat="server" MaxLength="20"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddl_State_PPLproprietary" runat="server">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddl_State_PPLproprietary"
                                                    InitialValue="Select State" Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                ZipCode:
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtLandlordZipCode" runat="server" MaxLength="20"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlMetEd" runat="server" Visible="false">
                            <div class="clear">
                            </div>
                            <div class="section">
                                <h1>
                                    MET ED Proprietary Usage</h1>
                                <table width="100%" border="0" cellspacing="2" cellpadding="2">
                                    <tr>
                                        <td width="25%">
                                            PCAP:
                                        </td>
                                        <td width="25%">
                                            PCAP Amount:
                                        </td>
                                        <td width="25%">
                                            TOD Customer:
                                        </td>
                                        <td>
                                            Last 4 SS#:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdoPCAP_Yes" runat="server" Text="Yes" GroupName="P" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdoPCAP_No" runat="server" Text="No" GroupName="P" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPCAP_Amount" runat="server" MaxLength="10" onkeyup="javascript:this.value=Comma(this.value);"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                                                TargetControlID="txtPCAP_Amount" FilterType="Custom,Numbers" ValidChars=".$,"
                                                FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdoTOD_Yes" runat="server" Text="Yes" GroupName="Tod" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdoTOD_No" runat="server" Text="No" GroupName="Tod" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLast_4_SS" runat="server" MaxLength="4"> </asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender29" runat="server"
                                                TargetControlID="txtLast_4_SS" FilterType="Numbers" FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Summer Seasonal Use:
                                        </td>
                                        <td>
                                            Winter Seasonal Use:
                                        </td>
                                        <td>
                                            Annual Base Use:
                                        </td>
                                        <td>
                                            Total Annual Use:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtSummer_SesonalUse" runat="server" MaxLength="7"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtSummer_SesonalUse"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server"
                                                TargetControlID="txtSummer_SesonalUse" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server"
                                                ControlToValidate="txtSummer_SesonalUse" ErrorMessage="Input is not valid." ValidationGroup="G"
                                                Display="Dynamic" ValidationExpression="^(?=.*[0-9])(?:[0-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtWinter_SesonalUse" runat="server" MaxLength="7"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtWinter_SesonalUse"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server"
                                                TargetControlID="txtWinter_SesonalUse" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
                                                ControlToValidate="txtWinter_SesonalUse" ErrorMessage="Input is not valid." ValidationGroup="G"
                                                Display="Dynamic" ValidationExpression="^(?=.*[0-9])(?:[0-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAnnualBaseUse" runat="server" MaxLength="7"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtAnnualBaseUse"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server"
                                                TargetControlID="txtAnnualBaseUse" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server"
                                                ControlToValidate="txtAnnualBaseUse" ErrorMessage="Input is not valid." ValidationGroup="G"
                                                Display="Dynamic" ValidationExpression="^(?=.*[0-9])(?:[0-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotalAnnualUse" runat="server" MaxLength="7"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtTotalAnnualUse"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server"
                                                TargetControlID="txtTotalAnnualUse" FilterType="Numbers" ValidChars="." FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server"
                                                ControlToValidate="txtTotalAnnualUse" ErrorMessage="Input is not valid." ValidationGroup="G"
                                                Display="Dynamic" ValidationExpression="^(?=.*[0-9])(?:[0-9]\d*\.?|0?\.)\d*$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td align="right">
                                            Seasonal spending allowance:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_SeasonalSpendingAllowance" runat="server" MaxLength="10" onkeyup="javascript:this.value=Comma(this.value);"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender30" runat="server"
                                                TargetControlID="txt_SeasonalSpendingAllowance" FilterType="Numbers,Custom" ValidChars=".$,"
                                                FilterMode="ValidChars">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:Panel>
                        <div class="clear">
                        </div>
                        <%if (Request.QueryString["Jobs"] != null)
                          { %>
                        <div class="section">
                            <h1 id="cntctAttempt" runat="server">
                                Custom Weatherization Contact Attempt(s) <a href="ContactAttemptsReport.aspx?Jobs=<%=Request.QueryString["Jobs"].ToString() %>">
                                    Contact Attempts Report </a>
                            </h1>
                            <h1 id="Vendornamecomm" runat="server">
                                Vendor Name Communication
                            </h1>
                            <table width="100%" border="0" cellspacing="2" cellpadding="2">
                                <tr>
                                    <td colspan="8">
                                        <h3>
                                            To Enter a new <span id="spnCntctattem" runat="server" style="color: Black">contact attempt</span>
                                            <span id="spncomm" runat="server" style="color: Black">communication</span>simply
                                            select from <span id="spn3drpbx" runat="server" style="color: Black">the 3 drop boxes below and the
                                                attempt will be saved when you save the JOB.</span><span id="spn2drpbx" runat="server"
                                                    style="color: Black">2 boxes and enter agents name and the result will be saved when you click save.</span>
                                            <br />
                                            <span>You must select from all 3.</span>
                                        </h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="12%">
                                        Date:
                                    </td>
                                    <td width="12%">
                                        Time:
                                    </td>
                                    <td width="19%">
                                        Contact Type:
                                    </td>
                                    <td width="20%">
                                        Contact Person:
                                    </td>
                                    <td width="20%">
                                        <span id="spnCntctres" runat="server">Contact Result:</span><span id="spnVendorAgent"
                                            runat="server">Vendor Agent Name</span>
                                    </td>
                                    <td width="20%">
                                        <span id="spnContactResuldate" runat="server">Contact Result Date:</span><span id="spnAgentId"
                                            runat="server">Vendor Agent ID</span>
                                    </td>
                                    <td colspan="2">
                                        <span id="spnReDate" runat="server" style="display: none;">Result Date:</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="txtDate_ContactAttempt" Width="85px"></asp:Label>
                                        <%-- <asp:TextBox ID="txtDate_ContactAttempt" runat="server" Width="85px"></asp:TextBox>--%>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="txtTime_ContactAttempt" Width="85px"></asp:Label>
                                        <%-- <asp:TextBox ID="txtTime_ContactAttempt" runat="server" Width="85px"></asp:TextBox>--%>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlContactType" runat="server">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_ddlContactType" runat="server" ControlToValidate="ddlContactType"
                                            InitialValue="0" Display="Dynamic" ErrorMessage="*" ValidationGroup="contctAtmpt"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlContactPerson" runat="server" onchange="SetColor();">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_ddlContactPerson" runat="server" ControlToValidate="ddlContactPerson"
                                            InitialValue="0" Display="Dynamic" ErrorMessage="*" ValidationGroup="contctAtmpt"></asp:RequiredFieldValidator>
                                        <asp:HiddenField ID="hiddencolor" runat="server" />
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlContactResult" runat="server" Width="180px" AutoPostBack="true"
                                            onchange="return ConfirmApproval();">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="txtVendorAgentName" runat="server" MaxLength="30" AutoComplete="off"
                                            Width="130px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="contctAtmpt" ID="rfv_txtVendorAgentName"
                                            runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtVendorAgentName"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                                            TargetControlID="txtVendorAgentName" FilterType="UppercaseLetters,LowercaseLetters,Custom"
                                            ValidChars=" ">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDate_Result" runat="server" Width="90%" Style="display: none;"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender10" runat="server" TargetControlID="txtDate_Result">
                                        </ajaxToolkit:CalendarExtender>
                                        <asp:DropDownList ID="ddltime" AppendDataBoundItems="true" Style="display: none;"
                                            onchange="return Confirm_Approval();" runat="server">
                                            <asp:ListItem Text="Select Time" Value="0" />
                                            <asp:ListItem Text="12:00 AM - 02:00 AM" Value="1" />
                                            <asp:ListItem Text="01:00 AM - 03:00 AM" Value="2" />
                                            <asp:ListItem Text="02:00 AM - 04:00 AM" Value="3" />
                                            <asp:ListItem Text="03:00 AM - 05:00 AM" Value="4" />
                                            <asp:ListItem Text="04:00 AM - 06:00 AM" Value="5" />
                                            <asp:ListItem Text="05:00 AM - 07:00 AM" Value="6" />
                                            <asp:ListItem Text="06:00 AM - 08:00 AM" Value="7" />
                                            <asp:ListItem Text="07:00 AM - 09:00 AM" Value="8" />
                                            <asp:ListItem Text="08:00 AM - 10:00 AM" Value="9" />
                                            <asp:ListItem Text="09:00 AM - 11:00 AM" Value="10" />
                                            <asp:ListItem Text="10:00 AM - 12:00 PM" Value="11" />
                                            <asp:ListItem Text="11:00 AM - 01:00 PM" Value="12" />
                                            <asp:ListItem Text="12:00 PM - 02:00 PM" Value="13" />
                                            <asp:ListItem Text="01:00 PM - 03:00 PM" Value="14" />
                                            <asp:ListItem Text="02:00 PM - 04:00 PM" Value="15" />
                                            <asp:ListItem Text="03:00 PM - 05:00 PM" Value="16" />
                                            <asp:ListItem Text="04:00 PM - 06:00 PM" Value="17" />
                                            <asp:ListItem Text="05:00 PM - 07:00 PM" Value="18" />
                                            <asp:ListItem Text="06:00 PM - 08:00 PM" Value="19" />
                                            <asp:ListItem Text="07:00 PM - 09:00 PM" Value="20" />
                                            <asp:ListItem Text="08:00 PM - 10:00 PM" Value="21" />
                                            <asp:ListItem Text="09:00 PM - 11:00 PM" Value="22" />
                                            <asp:ListItem Text="10:00 PM - 12:00 AM" Value="23" />
                                            <asp:ListItem Text="11:00 PM - 01:00 AM" Value="24" />
                                        </asp:DropDownList>
                                        <asp:TextBox ID="txtVendorAgentId" runat="server" MaxLength="30" AutoComplete="off"
                                            Width="130px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfv_txtDate_Result" runat="server" ErrorMessage="*"
                                            ValidationGroup="G" ControlToValidate="txtDate_Result" Enabled="false" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <%-- <asp:Button ID="btnVendorContactAttempt" Visible="false" runat="server" Style="font-size: 16px; color: #FFF; font-weight: bold; text-shadow: 1px 1px 0 #000; background-color: #3570a0; border-radius: 14px; border: 0; cursor: pointer; padding: 4px 9px;"
                                                 Text="+" ValidationGroup="contctAtmpt" OnClick="btnVendorContactAttempt_Click" />--%>
                                    </td>
                                </tr>
                                <% if (dtContactAttempts != null)
                                   {
                                       if (dtContactAttempts.Rows.Count > 0)
                                       {
                                           for (int i = dtContactAttempts.Rows.Count - 1; i >= 0; i--)
                                           //   for (int i = 0; i < dtContactAttempts.Rows.Count;i++ )
                                           { %>
                                <tr>
                                    <td>
                                        <%=Convert.ToDateTime(dtContactAttempts.Rows[i]["ContactDateTime"]).ToString("MM/dd/yyyy")%>
                                    </td>
                                    <td>
                                        <%=Convert.ToDateTime(dtContactAttempts.Rows[i]["ContactDateTime"]).ToString("hh:mm tt")%>
                                    </td>
                                    <td>
                                        <%=dtContactAttempts.Rows[i]["ContactType"].ToString()%>
                                    </td>
                                    <td>
                                        <%= Convert.ToString(dtContactAttempts.Rows[i]["ContactPerson"])%>
                                    </td>
                                    <td>
                                        <% if (Convert.ToString(Request.QueryString["GT"]) == "Vendor")
                                           {%>
                                        <%=dtContactAttempts.Rows[i]["VendorAgentName"].ToString()%>
                                        <%}
                                           else
                                           {
                                               if (Convert.ToString(dtContactAttempts.Rows[i]["ContactResult"]) == "Schedule Date")
                                               {%>
                                        Work Scheduled
                                        <%}
                                                       else if (Convert.ToString(dtContactAttempts.Rows[i]["ContactResult"]) == "Audit Schedule Date")
                                                       {%>
                                        Audit Scheduled
                                        <%}
                                                       else if (Convert.ToString(dtContactAttempts.Rows[i]["ContactResult"]) == "Date Go Back Scheduled")
                                                       {%>
                                        Go Back Scheduled
                                        <%}
                                                       else if (Convert.ToString(dtContactAttempts.Rows[i]["ContactResult"]) == "Re-Schedule Date")
                                                       {%>
                                        Work Re-Scheduled
                                        <%}
                                                       else
                                                       {%>
                                        <%=dtContactAttempts.Rows[i]["ContactResult"].ToString()%>
                                        <%}

                                                   }%>
                                    </td>
                                    <% if (Convert.ToString(Request.QueryString["GT"]) != "Vendor")
                                       {%>
                                    <td>
                                        <% if (!DBNull.Value.Equals(dtContactAttempts.Rows[i]["ContactResultDate"]))
                                           {%>
                                        <%=Convert.ToDateTime(dtContactAttempts.Rows[i]["ContactResultDate"]).ToString("MM/dd/yyyy")%>
                                        <% }%>
                                    </td>
                                    <%}%>
                                    </td>
                                    <td>
                                        <% if (Convert.ToString(Request.QueryString["GT"]) == "Vendor")
                                           {%>
                                        <%=dtContactAttempts.Rows[i]["VendorAgentId"].ToString()%>
                                        <%}%>
                                    </td>
                                </tr>
                                <%}
                                                }
                                            }%>
                                <%-- <asp:GridView ID="grdVendorContactAttempt" runat="server" 
                                        onrowdatabound="grdVendorContactAttempt_RowDataBound" BorderStyle="None" GridLines="None" CellPadding="10">
                                    </asp:GridView>--%>
                            </table>
                        </div>
                        <div class="clear">
                        </div>
                        <div class="section">
                            <h1>
                                Add a New Comment And/Or Send a message About this <span id="spnJob" runat="server">Job</span>
                                <span id="spnVendor" runat="server">Vendor</span>to Other Employee(s)
                            </h1>
                            <div align="center">
                                <asp:TextBox ID="txtCommentsSendAnd" runat="server" TextMode="multiline" Columns="150"
                                    Rows="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_txtCommentsSendAnd" ErrorMessage="*" runat="server"
                                    ControlToValidate="txtCommentsSendAnd" Display="Dynamic"></asp:RequiredFieldValidator>
                                <%-- <asp:Label ID="lblMsgComentSave" runat="server"></asp:Label>--%>
                            </div>
                            <div class="clear">
                            </div>
                            <div class="msg_box1">
                                <h2 style="text-align: center;">
                                    Save Note &amp; Send
                                    <br />
                                    Message</h2>
                                <div align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <strong>To:</strong>
                                            </td>
                                            <td align="center">
                                                <strong>Cc:</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:ListBox ID="lstEmployeeForSendSaveComments" SelectionMode="Multiple" runat="server">
                                                </asp:ListBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="lstEmployeeForSendSaveComments"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="CmntandSave"></asp:RequiredFieldValidator>
                                            </td>
                                            <td align="center">
                                                <asp:ListBox ID="lstEmployeeForSendSaveCommentsCC" SelectionMode="Multiple" runat="server">
                                                </asp:ListBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:Button ID="btnSaveAndSend" runat="server" Text="Save/Send Message" OnClientClick="return ConfirmSaveAndSend();"
                                        OnClick="btnSaveAndSend_Click" ValidationGroup="CmntandSave" />
                                </div>
                                <p>
                                    Enter note / hold control key then click to select employee(s) to send the note
                                    as a message.
                                </p>
                            </div>
                            <div class="msg_box2">
                                <h2 style="text-align: center;">
                                    Save Note</h2>
                                <div align="center">
                                    <asp:Button ID="btnSaveComments" runat="server" Text="Save Note Only" OnClientClick="return ConfirmSaveComments();"
                                        OnClick="BtnSaveComments_Click" />
                                    <asp:Button ID="btnSaveComments_" runat="server" Text="Save Note Only" ValidationGroup="contctAtmpt"
                                        OnClick="btnVendorContactAttempt_Click" />
                                </div>
                                <p>
                                    Enter note and click Save Note Only button. Note will be saved with <span id="spnjb"
                                        runat="server">job</span><span id="spnven" runat="server">vendor</span>
                                    and no message sent.
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div class="section" id="ConmtHis">
                            <h1>
                                Comments History</h1>
                            <div id="DivPrintHistory" align="center" style="height: 300px; overflow-y: scroll;">
                                <asp:DataList ID="dlComments" runat="server" Width="100%" OnItemDataBound="dlComments_ItemDataBound">
                                    <ItemTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <b style="font-size: 15px">
                                                        <asp:Label ID="lblUserLogin" runat="server" Text='<%#Eval("UserLogin")%>'></asp:Label>
                                                    </b>
                                                    <asp:Label ID="lblCCSi" runat="server" ForeColor="Red" Text="Cc" Visible="false"
                                                        class="hoversize">
                                                        <%--  <span id="divMsgCnt" runat="server" class="hoverdiv" >--%>
                                                        <div id="Span1" runat="server" class="hoverdiv">
                                                            <%--  <label><%#Eval("MessageFrom")%></label>--%>
                                                            <asp:Label ID="lblMessageFrom" runat="server" Text='<%#Eval("MessageFrom")%>'></asp:Label>
                                                            <label><%#Eval("MessageTo")%></label>
                                                            <label><%#Eval("MessageCC")%></label>
                                                        </div>
                                                    </asp:Label>
                                                    <%-- </span>--%>
                                                    <br />
                                                    <%#Eval("CommentDate")%><br />
                                                    ---------------------------------------------------
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                   <%-- <p style="white-space: pre-wrap;">--%>
                                                    <p style="">
                                                        <%#Eval("Comments")%></p>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
                <table width="100%">
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnPrintHistory" runat="server" Text="Print History" CssClass="BtnPrintHistory"
                                Visible="false" OnClientClick="Clickheretoprint()" />
                        </td>
                    </tr>
                </table>
                <div class="clear">
                </div>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" CssClass="HideButton" />
                <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" CssClass="HideButton" />
            </div>
            <asp:Panel ID="pnlSuccessMsg" runat="server" CssClass="panel">
                <p>
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </p>
                <div align="center">
                    <asp:Button ID="btnClose" runat="server" CausesValidation="false" CssClass="BtnPop"
                        Width="100px" Text="OK" OnClientClick="ClosePopup()" />
                </div>
            </asp:Panel>
            <asp:HiddenField ID="hdn_msg" runat="server"></asp:HiddenField>
            <ajaxToolkit:ModalPopupExtender ID="pnlSuccessMsg_ModalPopupExtender" runat="server"
                Enabled="True" BackgroundCssClass="modalPopup" TargetControlID="hdn_msg" PopupControlID="pnlSuccessMsg"
                BehaviorID="ModalJob">
            </ajaxToolkit:ModalPopupExtender>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
            <asp:PostBackTrigger ControlID="LnkBack" />
            <asp:PostBackTrigger ControlID="LnkInvoice" />
            <asp:PostBackTrigger ControlID="LnkHome" />
            <asp:PostBackTrigger ControlID="DDl_UtilityCompany_1" />
            <asp:PostBackTrigger ControlID="DDL_UtilityCompany_2" />
            <asp:PostBackTrigger ControlID="DDL_PplZone" />
            <asp:PostBackTrigger ControlID="btnFewFld" />
            <asp:PostBackTrigger ControlID="btnupload" />
        </Triggers>
    </asp:UpdatePanel>

    <script language="JavaScript" type="text/javascript">
                function ClosePopup() {
                    $find("ModalJob").hide();
                }
                function Test(rad) {
                    alert(rad);
                    var rads = document.getElementsByName(rad.name);
                    alert(rads);
                    if (rads[1].checked == true) {
                        document.getElementById('<%= courier.ClientID %>').style.display = 'none';
                    }
                    else {
                        document.getElementById('<%= courier.ClientID %>').style.display = 'block';
                    }
                 }
            
    </script>

    <script type="text/jscript">
            
            function SetCheckboxReadOnly(){
       
        
          $('#hdnCheckbox').val("1");
          
            var cells = $("#chkLst_HeatSource tbody tr td");
       inputs = cells.find('input[type="checkbox"]');
       for(var i=0;i<inputs.length;i++)
       {
       $("#chkLst_HeatSource_"+i).attr("disabled","disabled");
       }
       
        var cells1 = $("#chklst_Heat_Type tbody tr td");
       inputs1 = cells1.find('input[type="checkbox"]');
       for(var i=0;i<inputs1.length;i++)
       {
       $("#chklst_Heat_Type_"+i).attr("disabled","disabled");
       }
       
        var cells2 = $("#chklst_WaterHeaterType tbody tr td");
       inputs2 = cells2.find('input[type="checkbox"]');
       for(var i=0;i<inputs2.length;i++)
       {
       $("#chklst_WaterHeaterType_"+i).attr("disabled","disabled");
       }
       
       var cells3 = $("#chkLst_Air_Conditioning tbody tr td");
       inputs3 = cells3.find('input[type="checkbox"]');
       for(var i=0;i<inputs3.length;i++)
       {
       $("#chkLst_Air_Conditioning_"+i).attr("disabled","disabled");
       }       
     }
    </script>

    <script language="JavaScript" type="text/javascript">
                function Test(rad) {
                    var rads = document.getElementsByName(rad.name);
                    if (rads[1].checked == true) {
                        document.getElementById('<%= courier.ClientID %>').style.display = 'none';
                    }
                    else {
                        document.getElementById('<%= courier.ClientID %>').style.display = 'block';
                    }
                }              
    </script>

    <script type="text/javascript">
                function CalculateBaseLoad() {
debugger;
                    var YearlyKWH_Hours = document.getElementById('<%=txtYearlyKWH_Hours.ClientID %>').value;
                    YearlyKWH_Hours = parseInt(YearlyKWH_Hours);
                    if (isNaN(YearlyKWH_Hours))
                        YearlyKWH_Hours = 0;

                    //For multiply and add Base Load by Type On Low1 KWH Hours
                    var Low1KWHHours = document.getElementById('<%=txtLow1KWHHours.ClientID %>').value;
                    Low1KWHHours = parseInt(Low1KWHHours);
                    if (isNaN(Low1KWHHours))
                        Low1KWHHours = 0;



                    //For multiply and add Base Load by Type On Low2 KWH Hours 
                    var Low2KWH_Hours = document.getElementById('<%=txtLow2KWH_Hours.ClientID %>').value;
                    Low2KWH_Hours = parseInt(Low2KWH_Hours);
                    if (isNaN(Low2KWH_Hours))
                        Low2KWH_Hours = 0;
                    document.getElementById('<%=txtBaseLoad.ClientID %>').value = "";
                    document.getElementById('<%=txtBaseLoad.ClientID %>').value = ((Low2KWH_Hours * 1) + (Low1KWHHours * 1)) / 2 * 12;
                    document.getElementById('<%=hdnBaseLoad.ClientID %>').value = ((Low2KWH_Hours * 1) + (Low1KWHHours * 1)) / 2 * 12;
                    //console.log("Value Low2KWHHours Base=" + BaseLoad);
                    //console.log("Value Low2KWHHours=" + Low2KWH_Hours);

                    // Now Take the value from Base load 
                    var BaseLoad = document.getElementById('<%=txtBaseLoad.ClientID %>').value;
                    BaseLoad = parseInt(BaseLoad);
                    if (isNaN(BaseLoad))
                        BaseLoad = 0;
                    //  console.log("Value Base=" + BaseLoad);


                    // Now Minus the value from TwinterSeasonal
                    document.getElementById('<%=txtTWinterSeasonal.ClientID %>').value = (YearlyKWH_Hours * 1) - (BaseLoad * 1);
                    document.getElementById('<%=hdnTWinterSeasonal.ClientID %>').value = (YearlyKWH_Hours * 1) - (BaseLoad * 1);
                    var TWinterSeasonal = (YearlyKWH_Hours * 1) - (BaseLoad * 1);
                    TWinterSeasonal = parseInt(TWinterSeasonal);
                    if (isNaN(TWinterSeasonal))
                        TWinterSeasonal = 0;

                    var JuneKWH = document.getElementById('<%=txtJuneKWH.ClientID %>').value;
                    JuneKWH = parseInt(JuneKWH);
                    if (isNaN(JuneKWH))
                        JuneKWH = 0;

                    var JulyKWH = document.getElementById('<%=txtJulyKWH.ClientID %>').value;
                    JuneKWH = parseInt(JulyKWH);
                    if (isNaN(JulyKWH))
                        JulyKWH = 0;

                    var AugustKWH = document.getElementById('<%=txtAugustKWH.ClientID %>').value;
                    AugustKWH = parseInt(AugustKWH);
                    if (isNaN(AugustKWH))
                        AugustKWH = 0;

                    var SeptemberKWH = document.getElementById('<%=txtSeptemberKWH.ClientID %>').value;
                    SeptemberKWH = parseInt(SeptemberKWH);
                    if (isNaN(SeptemberKWH))
                        SeptemberKWH = 0;

                    document.getElementById('<%= txtTSummerSeasonal.ClientID %>').value = (JuneKWH * 1 + JulyKWH * 1 + AugustKWH * 1 + SeptemberKWH * 1) - ((Low1KWHHours * 1 + Low2KWH_Hours * 1) / 2 * 4);
                    document.getElementById('<%= hdnTSummerSeasonal.ClientID %>').value = (JuneKWH * 1 + JulyKWH * 1 + AugustKWH * 1 + SeptemberKWH * 1) - ((Low1KWHHours * 1 + Low2KWH_Hours * 1) / 2 * 4);
               
                var ShellAllowance = document.getElementById('<%=txtShellallwnance.ClientID %>').value;
                    ShellAllowance = parseInt(ShellAllowance);
                    if (isNaN(ShellAllowance))
                        ShellAllowance = 0;
                   ShellAllowance= (YearlyKWH_Hours*0.20*1.0+200).toFixed(2);
                    document.getElementById('<%= txtShellallwnance.ClientID %>').value ="$"+ShellAllowance;
                    
                      var RepairAllowance = document.getElementById('<%=txtRepairAllowance.ClientID %>').value;
                    RepairAllowance = parseInt(RepairAllowance);
                    if (isNaN(RepairAllowance))
                        RepairAllowance = 0;
                   RepairAllowance=(ShellAllowance*0.30).toFixed(2);
                    document.getElementById('<%= txtRepairAllowance.ClientID %>').value ="$"+RepairAllowance
                    
                      var HealthAllowance = document.getElementById('<%=txtHealthAllowance.ClientID %>').value;
                    HealthAllowance = parseInt(HealthAllowance);
                    if (isNaN(HealthAllowance))
                        HealthAllowance = 0;
                    HealthAllowance=(650).toFixed(2);
                    document.getElementById('<%= txtHealthAllowance.ClientID %>').value ="$"+HealthAllowance;
                    
                    var BudgetAllowance = document.getElementById('<%=txtBudgetAllowance.ClientID %>').value;
                    BudgetAllowance = parseInt(BudgetAllowance);
                    if (isNaN(BudgetAllowance))
                        BudgetAllowance = 0;
                   BudgetAllowance=(parseFloat(ShellAllowance)+parseFloat(RepairAllowance)+parseFloat(HealthAllowance)).toFixed(2);
                    document.getElementById('<%= txtBudgetAllowance.ClientID %>').value ="$"+BudgetAllowance;
                    

                }
    </script>

    <script type="text/javascript">
                //***********_____ SUDHANSHU ON 16 MAy 2013 For Date Field Validation _____**************//

                // Declaring valid date character, minimum year and maximum year
                var dtCh = "/";
                var now = new Date();
                var currentTime = new Date();
                var month = currentTime.getMonth() + 1;
                var day = currentTime.getDate();
                var year = currentTime.getFullYear();
                //        var Maxyear = currentTime.getFullYear() + 1;
                //        var minYear = year;
                //        var maxYear = Maxyear;
                currentTime = month + "/" + day + "/" + year;
                var SDate1 = "";
                var SDate2 = "";
                var SDate3 = "";
                var pos1;
                var pos2;
                var pos11;
                var pos12;
                function isInteger(s) {
                    var i;
                    for (i = 0; i < s.length; i++) {
                        // Check that current character is number.
                        var c = s.charAt(i);
                        if (((c < "0") || (c > "9"))) return false;
                    }
                    // All characters are numbers.
                    return true;
                }

                function stripCharsInBag(s, bag) {
                    var i;
                    var returnString = "";
                    // Search through string's characters one by one.
                    // If character is not in bag, append to returnString.
                    for (i = 0; i < s.length; i++) {
                        var c = s.charAt(i);
                        if (bag.indexOf(c) == -1) returnString += c;
                    }
                    return returnString;
                }
                function daysInFebruary(year) {

                    return (((year % 4 == 0) && ((!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28);
                }
                function DaysArray(n) {
                    for (var i = 1; i <= n; i++) {
                        this[i] = 31
                        if (i == 4 || i == 6 || i == 9 || i == 11) { this[i] = 30 }
                        if (i == 2) { this[i] = 29 }
                    }
                    return this;
                }
                function isDate(SDate) {
                    var daysInMonth = DaysArray(12);
                    pos1 = SDate.indexOf(dtCh);
                    pos2 = SDate.indexOf(dtCh, pos1 + 1);
                    var strMonth = SDate.substring(0, pos1);
                    var strDay = SDate.substring(pos1 + 1, pos2);
                    var strYear = SDate.substring(pos2 + 1);
                    strYr = strYear;
                    if (strDay.charAt(0) == "0" && strDay.length > 1) strDay = strDay.substring(1);
                    if (strMonth.charAt(0) == "0" && strMonth.length > 1) strMonth = strMonth.substring(1);
                    for (var i = 1; i <= 3; i++) {
                        if (strYr.charAt(0) == "0" && strYr.length > 1) strYr = strYr.substring(1);
                    }
                    month = parseInt(strMonth);
                    day = parseInt(strDay);
                    year = parseInt(strYr);
                    if (pos1 == -1 || pos2 == -1) {
                        alert("The date format should be : mm/dd/yyyy");
                        return false;
                    }
                    if (strMonth.length < 1 || month < 1 || month > 12) {
                        alert("Please enter a valid month");
                        return false;
                    }
                    if (strDay.length < 1 || day < 1 || day > 31 || (month == 2 && day > daysInFebruary(year)) || day > daysInMonth[month]) {
                        alert("Please enter a valid day");
                        return false;
                    }
                 }
                    if (SDate.indexOf(dtCh, pos2 + 1) != -1 || isInteger(stripCharsInBag(SDate, dtCh)) == false) {
                        alert("Please enter a valid date")
                        return false;
                    }
                    return true;
                }

                function ValidateDateG() {

                    var validated = Page_ClientValidate('G');
                    if (validated) {

                        SDate1 = document.getElementById('<%= txtDateReceived.ClientID %>').value;
                        SDate2 = document.getElementById('<%= txtDateCompleted.ClientID %>').value;
                        SDate3 = document.getElementById('<%= txtReturnDate.ClientID %>').value;

                        var dtCh = "/";

                        if (SDate1 == '') {
                            alert('Please fill Date Received!');
                            return false;
                        }

                        if (SDate2 == '') {
                            alert('Please fill Date Completed!');
                            return false;
                        }

                        if (SDate3 == '') {
                            alert('Please fill Return Date!');
                            return false;
                        }

                        if (SDate1 != '') {
                            if (!isDate(SDate1)) {
                                return false;
                            }
                        }

                        if (SDate2 != '') {
                            if (!isDate(SDate2)) {
                                return false;
                            }
                        }

                        if (SDate3 != '') {
                            if (!isDate(SDate3)) {
                                return false;
                            }
                        }

                        var startDate1 = new Date(SDate1);
                        var startDate2 = new Date(SDate2);
                        var startDate3 = new Date(SDate3);


                        var currentTime1 = new Date(currentTime);
              }

                        if (startDate1 > startDate2) {
                            if (!(startDate1 == startDate2)) {
                                alert('Date completed must be greater than or equal to date received.');
                                return false;
                            }
                        }

                        if (startDate2 > startDate3) {
                            if (!(startDate2 == startDate3)) {
                                alert('Return date must be greater than or equal to date completed.');
                                return false;
                            }
                        }
                    }
                }



                function ValidateDateGSave() {
                    debugger;
                    var validated = Page_ClientValidate('G');
                    if (validated) {
                        if (ChekedJobType()) {
                            SDate1 = document.getElementById('<%= txtDateReceived.ClientID %>').value;
                            SDate2 = document.getElementById('<%= txtDateCompleted.ClientID %>').value;
                            SDate3 = document.getElementById('<%= txtReturnDate.ClientID %>').value;

                            hdnSDate1 = document.getElementById('<%= txtDateReceived.ClientID %>').value;
                            hdnSDate2 = document.getElementById('<%= txtDateCompleted.ClientID %>').value;
                            hdnSDate3 = document.getElementById('<%= txtReturnDate.ClientID %>').value;

                            var dtCh = "/";

                            if (SDate1 == '') {
                                alert('Please fill Date Received!');
                                return false;
                            }

                            if (SDate1 != '') {
                                if (!isDate(SDate1)) {
                                    return false;
                                }
                            }

                            if (SDate2 != '') {
                                if (!isDate(SDate2)) {
                                    return false;
                                }
                            }

                            if (SDate3 != '') {
                                if (!isDate(SDate3)) {
                                    return false;
                                }
                            }


                            var startDate1 = new Date(SDate1);
                            var currentTime1 = new Date(currentTime);

                            if (SDate1 != '' && hdnSDate1 == '') {
                                if (currentTime1 > startDate1) {
                                    if (!(currentTime1 == startDate1)) {
                                        alert('Date received must be greater than or equal to today.');
                                        return false;
                                    }
                                }
                            }


                            var startDate2, startDate3;

                            if (SDate2 != '' && hdnSDate2 == '') {
                                var currentTime2 = new Date(currentTime);
                                startDate2 = new Date(SDate2);

                                if (currentTime2 > startDate2) {
                                    if (!(currentTime2 == startDate2)) {
                                        alert('Date completed must be greater than or equal to today.');
                                        return false;
                                    }
                                }

                                if (startDate1 > startDate2) {
                                    if (!(startDate1 == startDate2)) {
                                        alert('Date completed must be greater than or equal to date received.');
                                        return false;
                                    }
                                }
                            }

                            if (SDate3 != '' && hdnSDate3 == '') {
                                startDate3 = new Date(SDate3);
                                var currentTime3 = new Date(currentTime);

                                if (currentTime3 > startDate3) {

                                    if (!(currentTime3 == startDate3)) {
                                        alert('Return date must be greater than or equal to today.');
                                        return false;
                                    }
                                }

                                if (startDate2 > startDate3) {
                                    if (!(startDate2 == startDate3)) {
                                        alert('Return date must be greater than or equal to date completed.');
                                        return false;
                                    }
                                }
                            }

                        }
                        else {
                            return false;
                        }
                    }
                }

    </script>

    <script type="text/javascript">


                function Confirm_Approval() {
                debugger;
                    if (confirm('Are you sure, you want to save this Record?')) {
                        var id = document.getElementById('<%=Button2.ClientID %>').name;
                        __doPostBack(id, 'Button2_Click');
                    //   window.location.reload(true);
                       
                        
                    }
                    else { return false; }
                }


                function Confirm_Approval_() {
                    if (confirm('Are you sure you want to delete this PDF ?')) {
                    }
                    else { return false; }
                }


                function Loading_Hide() {
                debugger;
                    alert('hello');
                }

                function ConfirmApproval() {
                debugger;
                    var ddlReport = document.getElementById('<%=ddlContactResult.ClientID%>');
                    var Value = ddlReport.options[ddlReport.selectedIndex].value;
                    if (Value != 4 && Value != 11 && Value != 14 && Value != 15 && Value != 19) {
                        document.getElementById('<%=txtDate_Result.ClientID%>').style.display = 'none';
                        document.getElementById('<%=ddltime.ClientID%>').style.display = 'none';
                        document.getElementById('<%=spnReDate.ClientID%>').style.display = 'none';
                        ValidatorEnable(document.getElementById('<%=rfv_txtDate_Result.ClientID%>'), false);
                        if (confirm('Are you sure, you want to save this Record?')) {
                            var id = document.getElementById('<%=Button1.ClientID %>').name;
                            __doPostBack(id, 'Button1_Click');
                        }
                        else { return false; }
                    }
                    else {
                        document.getElementById('<%=txtDate_Result.ClientID%>').style.display = 'inline-block';
                        document.getElementById('<%=ddltime.ClientID%>').style.display = 'inline-block';
                        document.getElementById('<%=spnReDate.ClientID%>').style.display = 'inline-block';
                        ValidatorEnable(document.getElementById('<%=rfv_txtDate_Result.ClientID%>'), true);
                    }
                }




               <%-- function SetColor() {
                    var e = document.getElementById('<%=ddlContactPerson.ClientID%>');
                    var strUser = e.options[e.selectedIndex].va;
                }--%>

                function ConfirmSaveComments() {
                    if (confirm('Are you sure, you want to save this Record?')) {
                        return true;
                    }
                    else
                        return false;
                }

                function ConfirmSaveAndSend() {
                    if (confirm('Are you sure, you want to save this Record?')) {
                        return true;
                    }
                    else
                        return false;
                }

                function Comma(Num) {
                    Num += '';
                    Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
                    Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
                    x = Num.split('.');
                    x1 = x[0];
                    x2 = x.length > 1 ? '.' + x[1] : '';
                    var rgx = /(\d+)(\d{3})/;
                    while (rgx.test(x1))
                        x1 = x1.replace(rgx, '$1' + ',' + '$2');
                    x1 = "$" + x1;
                    var res = '';
                    if (x1 != '$$') {
                        var str = x1 + x2;
                        if (str.length > 2) {
                            res = str.substring(1, str.length);
                        }
                        else {
                            res = str;
                        }
                    }
                    else {
                        res = '';
                    }
                    if (res == '$') {
                        res = '';
                    }
                    return res;
                }
                function GetDollerSign(ElementID) {
                    var Input = document.getElementById(ElementID).value;
                    var newstr = Input.replace("$", "");
                    Input = "$" + newstr;
                    document.getElementById(ElementID).value = Input;
                }
                function GetDollerSignn(ElementID) {
                    var Input = document.getElementById(ElementID).value;
                    alert(Input);
                    Input = "$" + Input;
                    document.getElementById(ElementID).value = Input;
                }


                function mask(e, f) {
                    var len = f.value.length;
                    var key = whichKey(e);
                    if (key == 8) {
                        len = len - 1;

                    }
                    else if (key > 47 && key < 58 || key > 95 && key < 106) {
                        if (len == 3) f.value = f.value + '-'
                        else if (len == 7)
                            f.value = f.value + '-'
                        else f.value = f.value;
                    }
                    else {
                        f.value = f.value.replace(/[^0-9-]/, '')
                        f.value = f.value.replace('--', '-')
                    }
                }

                function whichKey(e) {
                    var code;
                    if (!e) var e = window.event;
                    if (e.keyCode) code = e.keyCode;
                    else if (e.which) code = e.which;
                    return code
                  
                }

    </script>

    <script type="text/javascript">
                //***********_____ SUDHANSHU ON 16 MAy 2013 For Copy Mailing Address to Service address _____**************//

                function CheckedChangeAddress(Check) {

                    var Checkbox = document.getElementById(Check);
                    if (Checkbox.checked == true) {
                        document.getElementById('<%= txtAddress_Service.ClientID %>').disabled = true;
                        document.getElementById('<%= txtCity_Service.ClientID %>').disabled = true;
                        document.getElementById('<%= txtZipCode_Service.ClientID %>').disabled = true;
                        document.getElementById('<%= ddl_State_Service.ClientID %>').disabled = true;
                        CheckedChangeAddressOnKeyUP()
                        }
                        else
                     {
                        document.getElementById('<%= txtAddress_Service.ClientID %>').value = '';
                        document.getElementById('<%= txtCity_Service.ClientID %>').value = '';
                        document.getElementById('<%= txtZipCode_Service.ClientID %>').value = '';
                        document.getElementById('<%= ddl_State_Service.ClientID %>').value = "0";
                        document.getElementById('<%= hdnAddress_Service.ClientID %>').value = document.getElementById('<%= txtAddress_Service.ClientID %>').value;
                        document.getElementById('<%= hdnCity_Service.ClientID %>').value = document.getElementById('<%= txtCity_Service.ClientID %>').value;


                        document.getElementById('<%= hdnZipCode_Service.ClientID %>').value = document.getElementById('<%= txtZipCode_Service.ClientID %>').value;


                        document.getElementById('<%= hdn_State_Service.ClientID %>').value = document.getElementById('<%= ddl_State_Service.ClientID %>').value;
                        document.getElementById('<%= txtAddress_Service.ClientID %>').disabled = false;
                        document.getElementById('<%= txtCity_Service.ClientID %>').disabled = false;
                        document.getElementById('<%= txtZipCode_Service.ClientID %>').disabled = false;
                        document.getElementById('<%= ddl_State_Service.ClientID %>').disabled = false;
                    }

                }

                function ChekedJobType() {
                    var chkAct129 = document.getElementById('<%= chkAct129.ClientID%>');
                    var chkBaseLoad = document.getElementById('<%= chkBaseLoad.ClientID%>');
                    var chkHighPriority = document.getElementById('<%= chkHighPriority.ClientID%>');
                    var chkLowCost = document.getElementById('<%= chkLowCost.ClientID%>');
                    var chkFullCost = document.getElementById('<%= chkFullCost.ClientID%>');
                    var chkAct129II = document.getElementById('<%= chkAct129II.ClientID%>');
                    var chkInspection = document.getElementById('<%= chkInspection.ClientID%>');
                    var chkRemedial = document.getElementById('<%= chkRemedial.ClientID%>');
                 
                    if (chkAct129.checked == false && chkInspection.checked == false && chkRemedial.checked == false && chkBaseLoad.checked == false && chkHighPriority.checked == false && chkLowCost.checked == false && chkFullCost.checked == false && chkAct129II.checked == false) {
                        alert('Please Select Atleast One Job Type');
                        return false;
                    }
                    else {
                        return true;
                    }
                }
                function CheckedChangeAddressOnKeyUP() {

                    var Checkbox = document.getElementById('<%= chkSetServiceToMailingAddress.ClientID %>');
                    if (Checkbox.checked == true) {
                        document.getElementById('<%= txtAddress_Service.ClientID %>').value = document.getElementById('<%= txtAddress_Mailing.ClientID %>').value;
                        document.getElementById('<%= hdnAddress_Service.ClientID %>').value = document.getElementById('<%= txtAddress_Mailing.ClientID %>').value;
                        document.getElementById('<%= txtCity_Service.ClientID %>').value = document.getElementById('<%= txtCity_Mailing.ClientID %>').value;
                        document.getElementById('<%= hdnCity_Service.ClientID %>').value = document.getElementById('<%= txtCity_Mailing.ClientID %>').value;
                        document.getElementById('<%= txtZipCode_Service.ClientID %>').value = document.getElementById('<%= txtZipCode_Mailing.ClientID %>').value;
                        document.getElementById('<%= hdnZipCode_Service.ClientID %>').value = document.getElementById('<%= txtZipCode_Mailing.ClientID %>').value;
                        document.getElementById('<%= ddl_State_Service.ClientID %>').value = document.getElementById('<%= ddl_State_Mailing.ClientID %>').value;
                        document.getElementById('<%= hdn_State_Service.ClientID %>').value = document.getElementById('<%= ddl_State_Mailing.ClientID %>').value;
                    }
                    else 
                    {
                        document.getElementById('<%= hdnAddress_Service.ClientID %>').value = document.getElementById('<%= txtAddress_Service.ClientID %>').value;
                        document.getElementById('<%= hdnCity_Service.ClientID %>').value = document.getElementById('<%= txtCity_Service.ClientID %>').value;
                        document.getElementById('<%= hdnZipCode_Service.ClientID %>').value = document.getElementById('<%= txtZipCode_Service.ClientID %>').value;
                        document.getElementById('<%= hdn_State_Service.ClientID %>').value = document.getElementById('<%= ddl_State_Service.ClientID %>').value;
                        document.getElementById('<%= txtAddress_Service.ClientID %>').disabled = false;
                        document.getElementById('<%= txtCity_Service.ClientID %>').disabled = false;
                        document.getElementById('<%= txtZipCode_Service.ClientID %>').disabled = false;
                        document.getElementById('<%= ddl_State_Service.ClientID %>').disabled = false;
                    }

                }

    </script>

    <script type="text/javascript">
                function MessageAndRedirectPage() {
                    alert("Job inserted successfully.");
                    window.location.href = "Home.aspx";
                }
    </script>

    <script language="JavaScript" type="text/javascript">
                function Clickheretoprint() {

                    var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
                    disp_setting += "scrollbars=yes,width=650px, height=600px, left=100, top=25";
                    var content_vlue = document.getElementById('DivPrintHistory').innerHTML;
                    var docprint = window.open("", "", disp_setting);
                    docprint.document.open();
                    docprint.document.write('<html><head><title>Custom Weatherization/ Comment History</title> ');
                    docprint.document.write('</head><body onLoad="self.print()"><center>');
                    docprint.document.write('<b><span>' + document.getElementById('<%= hdnFName.ClientID %>').value + '</span></b>  <b><span>' + document.getElementById('<%= hdnLName.ClientID %>').value + '</span></b> ');
                    docprint.document.write('<b><span>' + document.getElementById('<%= hdnJobNo.ClientID %>').value + '</span></b><br />');
                    docprint.document.write(content_vlue);
                    docprint.document.write('</center></body></html>');
                    docprint.document.close();
                    docprint.focus();
                }
    </script>

    <script language="JavaScript" type="text/javascript">
                function ClickHereToPrintFull() {


                    var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
                    disp_setting += "scrollbars=yes,width=650px, height=600px, left=100, top=25";
                    var content_vlue = document.getElementById('divPrint').innerHTML;
                    var docprint = window.open("", "", disp_setting);
                    docprint.document.open();
                    docprint.document.write('<html><head><title>Custom Weatherization</title> ');
                    docprint.document.write('</head><body onLoad="self.print()"><center>');
                    docprint.document.write(content_vlue);
                    docprint.document.write('</center></body></html>');
                    docprint.document.close();
                    docprint.focus();
                }
    </script>

    <script type="text/javascript">

                function chkInspection(ID) {
                    var CheckBox = document.getElementById(ID);
                    if (!CheckBox.checked) {
                        CheckBox.checked = false;
                    }
                    else {
                        document.getElementById('<%= chkAct129.ClientID %>').checked = false;
                        document.getElementById('<%= chkAct129II.ClientID %>').checked = false;
                        CheckBox.checked = true;
                    }
                 }
                function chkRemedial(ID) {
                    var CheckBox = document.getElementById(ID);
                    if (!CheckBox.checked) {
                        CheckBox.checked = false;
                    }
                    else {
                        document.getElementById('<%= chkAct129.ClientID %>').checked = false;
                        document.getElementById('<%= chkAct129II.ClientID %>').checked = false;
                        CheckBox.checked = true;
                    }
                }
                function ChkAct129(ID) {
                    var CheckBox = document.getElementById(ID);
                    if (!CheckBox.checked) {
                        CheckBox.checked = false;
                    }
                    else {
                        document.getElementById('<%= chkAct129.ClientID %>').checked = false;
                        document.getElementById('<%= chkAct129II.ClientID %>').checked = false;
                        CheckBox.checked = true;
                    }
                }
                function ChkAct129II(ID) {
                    var CheckBox = document.getElementById(ID);
                    if (!CheckBox.checked) {
                        CheckBox.checked = false;
                    }
                    else {
                        document.getElementById('<%= chkAct129.ClientID %>').checked = false;
                        if (document.getElementById('<%= chkBaseLoad.ClientID %>').checked == true && document.getElementById('<%= chkFullCost.ClientID %>').checked == true) {
                            document.getElementById('<%= chkBaseLoad.ClientID %>').checked = false;
                            document.getElementById('<%= chkFullCost.ClientID %>').checked = false;
                        }

                        <%--document.getElementById('<%= chkLowCost.ClientID %>').checked = false;
                        document.getElementById('<%= chkAct129II.ClientID %>').checked = false;--%>
                        CheckBox.checked = true;
                    }
                }
                function ChkOtherJobType(ID) {
                    var CheckBox = document.getElementById(ID);
                    if (!CheckBox.checked) {
                        CheckBox.checked = false;
                    }
                    else {
                        if (document.getElementById('<%= chkAct129II.ClientID %>').checked == true) {
                            document.getElementById('<%= chkBaseLoad.ClientID %>').checked = false;
                            document.getElementById('<%= chkFullCost.ClientID %>').checked = false;
                        }
                        CheckBox.checked = true;
                    }
                }
                function ChkOtherJobTypeFullCost(ID) {
                    var CheckBox = document.getElementById(ID);
                    if (!CheckBox.checked) {
                        CheckBox.checked = false;
                    }
                    else {
                        CheckBox.checked = false;
                        CheckBox.checked = true;
                    }
                }


                function chekMailorFax(e, f) {
                    var value = document.getElementById('<%= txtLandlordEmailOrFax.ClientID %>').value;
                    value = value.replace("-", "");
                    var len = value.length;


                    if (isNaN(value) == false) {

                        mask(e, f);

                    }
                    else {

                    }

                }
                function ChangeMaxLength() {
                    var txt = document.getElementById('<%=txtLandlordEmailOrFax.ClientID %>');
                    txt.maxLength = "2";
                }



                function CheckAccount(e, f) {
                    var DDL = document.getElementById('<%=DDl_UtilityCompany_1.ClientID %>');
                    var vela = DDL.options[DDL.selectedIndex].text;
                    if (vela != "MET ED") {
                        var len = f.value.length;
                        var key = whichKey(e);
                        if (key == 8) {
                            len = len - 1;
                        }
                        else if (key > 47 && key < 58 || key > 95 && key < 106) {
                            if (len == 5) {
                                f.value = f.value + '-';
                            }
                        }
                        else {
                            f.value = f.value.replace(/[^0-9-]/, '')
                        }
                    }
                }


                function CheckAccount_(e, f) {
                    var TxtAcc = document.getElementById('<%=txtAcc.ClientID %>').value;
                    if (TxtAcc != "") {
                        var len = f.value.length;
                        var key = whichKey(e);
                        if (key == 8) {
                            len = len - 1;
                        }
                        else if (key > 47 && key < 58 || key > 95 && key < 106) {
                            if (len == 5) {
                                f.value = f.value + '-';
                            }
                            else if (len > 11) {
                                f.value = (f.value).replace(/-/g, "");
                            }
                        }
                        else {
                            f.value = f.value.replace(/[^0-9-]/, '')
                        }
                    }
                }
                
//              jQuery(document).ready(function ($) {
//              debugger;
//                $('[id$="lblCCSi"]').next("span").css("display", "none");
//              $('[id$="lblCCSi"]').hover(function () {
//             
//              $(this).next("span").css("display", "block"); 
//              $(this).next("span").css("position", "relative"); 
//              $(this).next("span").css("width", "20px"); 
//       
//            }, 
//             function () {
//                $(this).next("span").css("display", "none"); 
//       
//                 });




                jQuery(document).ready(function ($) {
                
                
                               $("input[type='checkbox']").change(function() {
                                    
                                        if(this.checked) {
                                       
                                        var data=this;
                                        var value=$('#hdnCheckbox').val();
                                        if(value ==1)
                                        {
                                        data.checked=false;                                        
                                         $('#hdnCheckbox').val("0");
                                        
                                        }
                                        
                                    }
                                    else{
                                         var data=this;
                                        var value=$('#hdnCheckbox').val();
                                        if(value ==1)
                                        {
                                        data.checked=true;                                        
                                         $('#hdnCheckbox').val("0");
                                        
                                        }                                   
                                    }
                                    });
                    //open popup
                    $('.cd-popup-trigger').on('click', function (event) {
                        event.preventDefault();
                        $('.cd-popup').addClass('is-visible');
                    });

                    //close popup
                    $('.cd-popup').on('click', function (event) {
                        if ($(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup')) {
                            event.preventDefault();
                            $(this).removeClass('is-visible');
                        }
                    });
                    //close popup when clicking the esc keyboard button
                    $(document).keyup(function (event) {
                        if (event.which == '27') {
                            $('.cd-popup').removeClass('is-visible');
                        }
                    });
                });
    </script>

    <script type="text/javascript">
      
        
//     $("#Quick_LinkMETED,#Quick_LinkPPL").mouseleave(function(){
//        $("#Quick_LinkPPL").hide();
//         $("#Quick_LinkMETED").hide();
//    });

//        
//        $("#LnkAudit").hover(function () {
//           var UC=getParameterByName("UC")
//            if(UC=='PPL'|| UC=='PPL Zone 1'|| UC=='PPL Zone 2' || UC=='PPL CACLV')
//            {
//             $("#Quick_LinkPPL").show();
//            }
//            else
//            {
//             $("#Quick_LinkMETED").show();
//            }
//            }, 
//        function () {

//        });
        
//         $("#InvoicePPL,#InvoiceMETED,#InvoiceDCED,#InvoiceBCOC").mouseleave(function(){
//         $("#InvoicePPL").hide();
//         $("#InvoiceMETED").hide();
//         $("#InvoiceDCED").hide();
//         $("#InvoiceBCOC").hide();
//    });
//                $("#LnkInvoice").hover(function () {
//                
//             
//           var UC=getParameterByName("UC")
//         
//            if(UC=='PPL'|| UC=='PPL Zone 1'|| UC=='PPL Zone 2' || UC=='PPL CACLV')
//            {
//             $("#InvoicePPL").show();
//            }
//            else if(UC=='MET ED')
//            {
//             $("#InvoiceMETED").show();
//            }
//            else if(UC=='DCED')
//            {
//             $("#InvoiceDCED").show();
//            }else if(UC=='BCOC')
//            {
//            $("#InvoiceBCOC").show();
//            }
//            }, 
//        function () {

//        });



        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
    </script>

    <div class="clear">
    </div>
    <!-- footer -->
    <div class="footer" style="padding-bottom: 40px;">
    Custom Weatherization, LLC © 2013 Custom Weatherization, LLC © 2013
    </form>
</body>
</html>
