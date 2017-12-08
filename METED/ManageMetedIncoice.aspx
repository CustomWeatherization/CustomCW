<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageMetedIncoice.aspx.cs"
    Inherits="METED_ManageMetedIncoice" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>METED Invoice</title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>

    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <script type="text/javascript" src="../Js/jquery-1.2.2.pack.js"></script>

    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
    .main_left1{height: 500px;
float: left;
width: 300px;
margin-right: 0px;
position: fixed;}
.main_left1 ul{display:block; padding:0;}
.main_left1 ul li{list-style-type: none;
display: block;
border-bottom: solid 1px rgb(219, 219, 219);
text-align: left;
float: left;
width: 84%;}
.main_left1 ul li a{line-height:28px; text-decoration:none; white-space:nowrap; background-color: #3570a0; font-family:Arial, Helvetica, sans-serif; font-size:13px; cursor:pointer;}
.main_left1 ul li a:hover{text-decoration:underline; color:rgb(65, 65, 65);}

    </style>
    <style type="text/css">
        #lnkBtnBack
        {
            height:20px;
            width:20px;
            }
        #feedback
        {
            font-size: 12px;
        }
        #selectable .ui-selecting
        {
            background: rgb(126, 126, 126);
            padding-left: 10px;
        }
        #selectable .ui-selected
        {
            background: rgb(126, 126, 126);
            color: white;
            padding-left: 10px;
        }
        #selectable .ui-selected a
        {
            color: white;
        }
        #selectable li:active
        {
            background: rgb(126, 126, 126);
            color: white;
            padding-left: 10px;
        }
        .Act__Menu
        {
            background: rgb(126, 126, 126);
            color: White;
            padding-left: 10px;
        }
        .Act__Menu a
        {
            color: #fff !important;
        }
        #div
        {
            display: none;
        }
        #Div
        {
            float: left;
            border: 3px solid #DEB887;
            border-radius: 5px;
            padding: 15px;
            width: 950px;
        }
        #Btn_back
        {
            display: none;
        }
        .wrapper
        {
            margin: 0 auto;
            width: 990px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
        }
        .line
        {
            width: 100%;
            float: left;
            height: 1px;
            background: #000;
            margin-top: 20px;
        }
        .full-left
        {
            width: 100%;
            float: left;
        }
        .blue
        {
            background: #009;
        }
        .wrapper-box
        {
            float: left;
            border: 3px solid #deb887;
            border-radius: 5px;
            padding: 15px;
        }
        .nm
        {
            width: auto !important;
            padding-right: 5px;
        }
        .tab-secion table tr td
        {
            width: 23%;
            text-align: left;
        }
        
         .main_left1
    {
    /* height: 500px;*/
float: left;
width: 300px;
margin-right: 0px;
position: fixed;}
.main_left1 ul{display:block; padding:0;}
.main_left1 ul li{list-style-type: none;
display: block;
border-bottom: solid 1px rgb(219, 219, 219);
text-align: left;
float: left;
width: 84%;}
.main_left1 ul li a{line-height:28px; text-decoration:none; white-space:nowrap; background-color: #3570a0; font-family:Arial, Helvetica, sans-serif; font-size:13px; cursor:pointer;}
.main_left1 ul li a:hover{text-decoration:underline; color:rgb(65, 65, 65);}

 .top_icons ul li:hover > div{ display:block !important;}
    </style>
 
    <script type="text/javascript">
        $(window).load(function() {
            var taste = '#' + localStorage.getItem('SetMenu');

            $('#' + localStorage.getItem('SetMenu')).addClass("Act__Menu");
        })
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div>
        <div class="fix_div">
            <!-- header -->
            <div class="header">
                <div class="logo_div">
                    <a href="../Home.aspx">
                        <img src="../images/logo.jpg" /></a></div>
                <div class="header_middiv">
                    Customer Service
                    <br />
                    <asp:Button ID="btn_Print" runat="server" Text="Build Report" class="top_btn" OnClick="btn_Print_Click" />
                    <%--  <asp:Button ID="Button1" runat="server" Text="View" class="top_btn" />--%>
                    <asp:Button ID="Btn_View" runat="server" Text="View" class="top_btn" OnClick="Btn_View_Click" />
                    <asp:Button ID="btn_SaveNormal" runat="server" Text="Save" class="top_btn" OnClick="btn_SaveNormal_Click" />
                    <asp:Button ID="Btn_back123" runat="server" Text="Back" class="top_btn" Visible="false"
                        OnClientClick="HideInvoice()" OnClick="Btn_back123_Click" />
                    <%--<br />
                    <asp:CheckBox ID="chk_SubmitDate" runat="server" /><span style="font-size: 12px;"> Change
                        Submit Date</span>
                    OnClick="btn_Print_Click" --%>
                </div>
                <div class="head_right">
                    <div class="top_icons">
                        <ul>
                            <li>
                                <%--<a href="../DisplayJobSearchRecords.aspx?InvoiceNo=<%=Request.QueryString["InvoiceNo"].ToString()%>&Jobs=<%=Request.QueryString["jobs"].ToString()%>&Utility=<%=Request.QueryString["Utility"].ToString()%>"
                                class="back" title="Back"></a>--%>
                                <asp:LinkButton ID="lnkBtnBack" runat="server" class="back" title="Back" OnClick="lnkBtnBack_Click"></asp:LinkButton>
                            </li>
                            <li><a href="../Home.aspx" class="home" title="Home"></a></li>
                            <%--<li><a href="METED_Audit_Page1.aspx?InvoiceNo=<%=Request.QueryString["InvoiceNo"].ToString()%>&Jobs=<%=Request.QueryString["jobs"].ToString()%>&Utility=<%=Request.QueryString["Utility"].ToString()%>"
                                class="audit" title="Audit"></a></li>--%>
                                <li> <asp:LinkButton ID="lnkAudit" runat="server" class="audit" title="Audit" OnClick="lnkAudit_Click" ></asp:LinkButton>

                                <div class="main_left1" id="Quick_LinkMETED" style="display:none" >
                                            <ul id="Ul2">                          
                            <li id="Li1"> <a href="../NewMETED/METED_Audit_Page1.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(1) Customer Info</a> </li>
                            <li id="Li2"> <a href="../NewMETED/METED_Audit_Page2.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(2) Demographic</a> </li>
                            <li id="Li3"> <a href="../NewMETED/METED_Audit_Page3.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(3) Customer Interview</a> </li>
                            <li id="Li4"> <a href="../NewMETED/METED_Audit_Page4.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(4) CFL Standard Bulbs</a> </li>
                            <li id="Li5"> <a href="../NewMETED/METED_Audit_Page5.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(5) LED Bulbs/ ACT 129</a> </li>
                            <li id="Li6"> <a href="../NewMETED/METED_Audit_Page6.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(6) Refrigerators</a> </li>
                            <li id="Li7"> <a href="../NewMETED/METED_Audit_Page7.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(7) Freezers</a> </li>
                            <li id="Li8"> <a href="../NewMETED/METED_Audit_Page8.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(8) Washer and Dryer Assessment</a> </li>
                            <li id="Li9"> <a href="../NewMETED/METED_Audit_Page9.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(9) Electric Water Heating Assessment</a> </li>
                            <li id="Li10"><a href="../NewMETED/METED_Audit_Page10.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(10) Heat Pump Water Heater</a> </li>
                            <li id="Page11"><a href="../NewMETED/METED_Audit_Page11.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(11) Cooling Assessment</a> </li>
                            <li id="Page12"><a href="../NewMETED/METED_Audit_Page12.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(12) Heating Assessment</a> </li>
                            <li id="Page13"><a href="../NewMETED/METED_Audit_Page13.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(13) Fossil Fuel Heating Assessment</a> </li>
                            <li id="Page14"><a href="../NewMETED/METED_Audit_Page14.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(14) Ductless Mini-Split Heat Pump</a> </li>
                            <li id="Page15"><a href="../NewMETED/METED_Audit_Page15.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(15) House Photos</a> </li>
                            <li id="Page16"><a href="../NewMETED/METED_Audit_Page16.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(16) Basement/Crawl/Belly</a> </li>
                            <li id="Page17"><a href="../NewMETED/METED_Audit_Page17.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(17) Attic Access</a> </li>
                            <li id="Page18"><a href="../NewMETED/METED_Audit_Page18.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(18) Air Leakage Testing</a> </li>
                            <li id="Page19"><a href="../NewMETED/METED_Audit_Page19.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(19) CAZ Testing 1</a> </li>
                            <li id="Page20"><a href="../NewMETED/METED_Audit_Page20.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(20) CAZ Testing 2</a> </li>
                            <li id="Page21"><a href="../NewMETED/METED_Audit_Page21.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(21) CAZ Testing 3</a> </li>
                            <li id="Page22"><a href="../NewMETED/METED_Audit_Page22.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(22) CAZ Testing 4</a> </li>
                            <li id="Page23"><a href="../NewMETED/METED_Audit_Page23.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(23) House Air Sealing</a> </li>
                            <li id="Page24"><a href="../NewMETED/METED_Audit_Page24.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(24) Measures Called & Refused</a> </li>
                            <li id="Li11"><a href="../NewMETED/METED_Photo_Page_Manage.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(Photos)Other Photos</a> </li>
                            
                        </ul> </div>
                      <%-- <div class="main_left1" id="Quick_LinkMETED" style="display:none" >
                                            <ul id="Ul2">                          
                            <li id="Li1"> <a href="METED_Audit_Page1.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(1) Customer Info</a> </li>
                            <li id="Li2"> <a href="METED_Audit_Page2.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(2) Demographic</a> </li>
                            <li id="Li3"> <a href="METED_Audit_Page3.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(3) Customer Interview</a> </li>
                            <li id="Li4"> <a href="METED_Audit_Page4.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(4) CFL Standard Bulbs</a> </li>
                            <li id="Li5"> <a href="METED_Audit_Page5.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(5) LED Bulbs/ ACT 129</a> </li>
                            <li id="Li6"> <a href="METED_Audit_Page6.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(6) Refrigerators</a> </li>
                            <li id="Li7"> <a href="METED_Audit_Page7.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(7) Freezers</a> </li>
                            <li id="Li8"> <a href="METED_Audit_Page8.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(8) Washer and Dryer Assessment</a> </li>
                            <li id="Li9"> <a href="METED_Audit_Page9.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(9) Electric Water Heating Assessment</a> </li>
                            <li id="Li10"><a href="METED_Audit_Page10.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(10) Heat Pump Water Heater</a> </li>
                            <li id="Page11"><a href="METED_Audit_Page11.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(11) Cooling Assessment</a> </li>
                            <li id="Page12"><a href="METED_Audit_Page12.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(12) Heating Assessment</a> </li>
                            <li id="Page13"><a href="METED_Audit_Page13.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(13) Fossil Fuel Heating Assessment</a> </li>
                            <li id="Page14"><a href="METED_Audit_Page14.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(14) Ductless Mini-Split Heat Pump</a> </li>
                            <li id="Page15"><a href="METED_Audit_Page15.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(15) House Photos</a> </li>
                            <li id="Page16"><a href="METED_Audit_Page16.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(16) Basement/Crawl/Belly</a> </li>
                            <li id="Page17"><a href="METED_Audit_Page17.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(17) Attic Access</a> </li>
                            <li id="Page18"><a href="METED_Audit_Page18.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(18) Air Leakage Testing</a> </li>
                            <li id="Page19"><a href="METED_Audit_Page19.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(19) CAZ Testing 1</a> </li>
                            <li id="Page20"><a href="METED_Audit_Page20.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(20) CAZ Testing 2</a> </li>
                            <li id="Page21"><a href="METED_Audit_Page21.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(21) CAZ Testing 3</a> </li>
                            <li id="Page22"><a href="METED_Audit_Page22.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(22) CAZ Testing 4</a> </li>
                            <li id="Page23"><a href="METED_Audit_Page23.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(23) House Air Sealing</a> </li>
                            <li id="Page24"><a href="METED_Audit_Page24.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(24) Measures Called & Refused</a> </li>
                            <li id="Li11"><a href="METED_Photo_Page_Manage.aspx?InvoiceNo=1&Jobs=<%=Request.QueryString["Jobs"].ToString()%>&Utility=1">(Photos)Other Photos</a> </li>
                            
                        </ul> </div>--%>
                             
                                </li>
                        </ul>
                    </div>
                    <div class="clear">
                    </div>
                    <br />
                    <div class="head_link">
                        <span id="hed_link" runat="server"><a href="../admin/Admin_Login.aspx">Administer Database</a>
                            |</span>
                        <asp:LinkButton ID="lnkLogin" runat="server" Text="Logout"></asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="te" id="mainformat" runat="server">
                <div class="main_left" id="Quick_Link" style="margin-top: 8px;">
                    <h2>
                        Category</h2>
                    <ul id="selectable">
                        <asp:Repeater ID="rptr" runat="server" OnItemCommand="rptr_ItemCommand">
                            <ItemTemplate>
                                <li id='<%#Eval("CatID") %>' onclick="activeMenu(this.id);">
                                    <asp:LinkButton ID="lnkCategory" runat="server" CommandArgument='<%#Eval("CatID") %>'
                                        Text='<%#Eval("Category") %>'></asp:LinkButton></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <div class="main_right" style="min-height: 550px;">
                    <table class="t-border" width="100%">
                        <tr>
                            <td>
                                <b>Customer Name:</b>
                                <asp:Literal ID="lbl_name" runat="server"></asp:Literal>
                            </td>
                            <td>
                                <b>Job Number:</b>
                                <asp:Literal ID="lbl_jobno" runat="server"></asp:Literal>
                            </td>
                            <td>
                                <b>Phone:</b>
                                <asp:Literal ID="lbl_phone" runat="server"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Date Audit Completed:</b>
                                <asp:Literal ID="lblAuditCompleted" runat="server"></asp:Literal>
                                <br />
                                <b>Set Date:</b>
                                <asp:TextBox ID="txtAuditCompleted" runat="server" MaxLength="9"></asp:TextBox>
                                <asp:Button ID="btnUpdateAuditDate" runat="server" OnClick="btnUpdateAuditDate_Click"
                                    Text="OK" />
                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtAuditCompleted">
                                </asp:CalendarExtender>
                            </td>
                            <td>
                                <b>Date work Completed:</b>
                                <asp:Literal ID="lblCompletedDate" runat="server"></asp:Literal>
                            </td>
                            <td>
                                <b>Set Date:</b>
                                <asp:TextBox ID="txtSetDate" runat="server" MaxLength="9"></asp:TextBox>
                                <asp:Button ID="btnUpdateDate" runat="server" OnClick="btnUpdateDate_Click" Text="OK" />
                                <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtSetDate">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table align="center">
                        <tr>
                            <td colspan="3" align="center">
                                <asp:RadioButton ID="rdo_Standard" runat="server" Visible="false" GroupName="RowType"
                                    Checked="true" onclick="Test(this);" /><%--<strong>Standard</strong>&nbsp;&nbsp;--%><asp:RadioButton
                                        ID="rdo_Custom" runat="server" GroupName="RowType" Visible="false" onclick="Test(this);" /><%--<strong>Custom</strong>--%>
                                <asp:HiddenField ID="hdnLbrRate" runat="server" />
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Item: </strong>
                            </td>
                            <td>
                                <asp:DropDownList ID="DDl_MEASURE_DESCRIPTION" runat="server" Style="border: 1px solid #ccc;
                                    font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                                    padding: 8px; margin: 0; width: 318px;" AutoPostBack="true" OnSelectedIndexChanged="DDl_MEASURE_DESCRIPTION_SelectedIndexChanged">
                                </asp:DropDownList>
                                <%-- <asp:RequiredFieldValidator ID="RFV_DDl_MEASURE_DESCRIPTION" runat="server" ErrorMessage="*"
                                Display="Dynamic" InitialValue="Select" ControlToValidate="DDl_MEASURE_DESCRIPTION"
                                ValidationGroup="rfv"></asp:RequiredFieldValidator>--%>
                                <asp:TextBox ID="txt_MEASURE_DESCRIPTION" runat="server" Style="border: 1px solid #ccc;
                                    font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                                    padding: 8px; margin: 0; width: 318px; display: none;"></asp:TextBox>
                            </td>
                            <td>
                                <strong>QTY:</strong>
                                <asp:TextBox ID="txt_Qty" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 70px;"
                                    MaxLength="40" onkeyup="CalculateTotal();"></asp:TextBox>
                                <asp:RequiredFieldValidator Style="color: red; font-size: 24px;" ID="rfv_txt_Qty"
                                    runat="server" ErrorMessage="*" ControlToValidate="txt_Qty" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr id="trEdirLocation" runat="server" visible="false">
                            <td colspan="3">
                                <table>
                                    <tr>
                                        <td colspan="4">
                                            <strong>Description: </strong>&nbsp;<asp:TextBox ID="txtEditDescription" runat="server"
                                                Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                                                color: black; border-radius: 5px; padding: 8px; margin: 0; width: 50%;" MaxLength="500"></asp:TextBox>&nbsp;&nbsp;&nbsp;<strong>Code:</strong>
                                            <asp:TextBox ID="txtCode" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 65px;"
                                                MaxLength="500" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Location: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditLocation" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40"></asp:TextBox>
                                            <asp:RequiredFieldValidator Style="color: red; font-size: 24px;" ID="rfv_txtEditLocation"
                                                runat="server" ControlToValidate="txtEditLocation" ErrorMessage="*" ValidationGroup="rfv"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <strong>Cost: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditCost" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" onblur="Currency_Format(this.id);" onkeyup="CalculateMaterial();"></asp:TextBox>
                                            <asp:RequiredFieldValidator Style="color: red; font-size: 24px;" ID="rfv_txtEditCost"
                                                runat="server" ControlToValidate="txtEditCost" ErrorMessage="*" ValidationGroup="rfv"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Labor Rate:</strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_LaborRate" runat="server" Enabled="false" Style="border: 1px solid #ccc;
                                                font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                                                padding: 8px; margin: 0; width: 70px;" MaxLength="40"></asp:TextBox>
                                        </td>
                                        <td>
                                            <strong>THW: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditTHW" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" onkeyup="CalculateLabor();"></asp:TextBox>
                                            <asp:RequiredFieldValidator Style="color: red; font-size: 24px;" ID="rfv_txtEditTHW"
                                                runat="server" ControlToValidate="txtEditTHW" ErrorMessage="*" ValidationGroup="rfv"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>T/W: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditTW" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" onkeyup="CalculateLabor();"></asp:TextBox>
                                            <asp:RequiredFieldValidator Style="color: red; font-size: 24px;" ID="rfv_txtEditTW"
                                                runat="server" ControlToValidate="txtEditTW" ErrorMessage="*" ValidationGroup="rfv"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <strong>Labor: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditLabor" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" onblur="Currency_Format(this.id);" onkeyup="CalculateMaterial();"></asp:TextBox>
                                            <asp:RequiredFieldValidator Style="color: red; font-size: 24px;" ID="rfv_txtEditLabor"
                                                runat="server" ControlToValidate="txtEditLabor" ErrorMessage="*" ValidationGroup="rfv"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Material: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditMaterial" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" onblur="Currency_Format(this.id);" onkeyup="CalculateMaterial();"></asp:TextBox>
                                            <asp:RequiredFieldValidator Style="color: red; font-size: 24px;" ID="rfv_txtEditMaterial"
                                                runat="server" ControlToValidate="txtEditMaterial" ErrorMessage="*" ValidationGroup="rfv"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <strong>Total: </strong>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditTotal" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                MaxLength="40" onblur="Currency_Format(this.id);"></asp:TextBox><%--onkeyup="CalculateTotalEdit();"--%>
                                            <asp:HiddenField ID="hdntxtEditTotal" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <div id="courier" runat="server" style="display: none">
                        <table align="center">
                            <tr>
                                <td colspan="2">
                                    <table width="100%">
                                        <tr>
                                            <td colspan="4">
                                                <strong>Description: </strong>&nbsp;<asp:TextBox ID="txt_Discription" runat="server"
                                                    Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                                                    color: black; border-radius: 5px; padding: 8px; margin: 0; width: 75%;" MaxLength="500"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>Code: </strong>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Liurp" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                    MaxLength="40" onkeyup="CalculateLineCode()"></asp:TextBox>
                                            </td>
                                            <td>
                                                <strong>Location: </strong>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Location" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                    MaxLength="40" onkeyup="CalculateLineCode()"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>Cost: </strong>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Cost" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                    MaxLength="40" onkeyup="Calculation();"></asp:TextBox>
                                            </td>
                                            <td>
                                                <strong>Labor: </strong>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Labor" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                    MaxLength="40" onkeyup="CalculateTotal();"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>Material: </strong>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Material" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                    MaxLength="40" onkeyup="CalculateTotal();"></asp:TextBox>
                                                <%--<asp:HiddenField ID="hdn_txt_MinLaborRate" runat="server" />
                                                <asp:HiddenField ID="hdn_txt_MaxLaborRate" runat="server" />--%>
                                            </td>
                                            <td>
                                                <strong>Total: </strong>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Total" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                                                    font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 150px;"
                                                    MaxLength="40"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <table align="center">
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="btnSave" runat="server" Text="Add Row" class="top_btn" Style="margin-left: 70px;"
                                    ValidationGroup="rfv" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="top_btn" OnClick="btnCancel_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <div class="rounded_corners" style="width: 100%;">
                        <asp:GridView ID="grdContainOfInvoice" runat="server" Width="100%" DataKeyNames="InvoiceRowId"
                            EmptyDataText="No Record !!" AutoGenerateColumns="false" HeaderStyle-BackColor="#3AC0F2"
                            HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                            RowStyle-ForeColor="#3A3A3A" OnRowDeleting="grdContainOfInvoice_RowDeleting"
                            OnRowUpdating="grdContainOfInvoice_RowUpdating">
                            <%--OnRowDeleting="grdContainOfInvoice_RowDeleting"
                            OnRowUpdating="grdContainOfInvoice_RowUpdating"--%>
                            <%--OnRowUpdating="grdContainOfInvoice_RowUpdating"
            OnRowDeleting="grdContainOfInvoice_RowDeleting"
            OnRowCancelingEdit="grdContainOfInvoice_RowCancelingEdit" OnRowEditing="grdContainOfInvoice_RowEditing"
            OnPageIndexChanging="grdContainOfInvoice_PageIndexChanging"
            AllowPaging="true"
            PageSize="10"--%>
                            <Columns>
                                <asp:TemplateField HeaderText="Category">
                                    <ItemTemplate>
                                        <%#Eval("Category")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <%#Eval("Location")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Code">
                                    <ItemTemplate>
                                        <%#Eval("LiurpCode")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item">
                                    <ItemTemplate>
                                        <%#Eval("SubCategory")%>
                                        <asp:HiddenField ID="hdnSubCatId" runat="server" Value='<%#Eval("SubCatId")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <%#Eval("Rad_btn")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cost">
                                    <ItemTemplate>
                                        <%#Eval("Unit")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="THW">
                                    <ItemTemplate>
                                        <%#Eval("THW")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="T/W">
                                    <ItemTemplate>
                                        <%#Eval("TMC")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Labor">
                                    <ItemTemplate>
                                        <%#Eval("LaborRate")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Material">
                                    <ItemTemplate>
                                        <%#Eval("CostPerUnit")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="QTY">
                                    <ItemTemplate>
                                        <%#Eval("QTY")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <%#Eval("Total")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_Edit" runat="server" Text="Edit" CommandName="Update"></asp:LinkButton>
                                        <asp:LinkButton ID="lnk_Delete" runat="server" Text="Delete" CommandName="Delete"
                                            OnClientClick="return confirm('Are you sure you want to delete this Record?');"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <%-- --%>
            <div class="wrapper" id="Div" runat="server" visible="false">
                <div class="left-section tab-secion">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="120px" class="nm">
                                <strong>Customer Name:</strong>
                            </td>
                            <td>
                                <asp:Label ID="lbl_name1" runat="server"></asp:Label>
                            </td>
                            <td width="120px" class="nm">
                                <strong>Job Number:</strong>
                            </td>
                            <td>
                                <asp:Label ID="lbl_jobno1" runat="server"></asp:Label>
                            </td>
                            <td width="120px" class="nm">
                                <strong>Phone Number:</strong>
                            </td>
                            <td>
                                <asp:Label ID="lbl_phone1" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <%--  <div class="left-section" style="margin-right: 40px;">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            
                        </tr>
                        <tr>
                            
                        </tr>
                    </table>
                </div>
                <div class="left-section">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="120px">
                                <strong>Completed Date</strong>
                            </td>
                            <td>
                                45-58-9246
                            </td>
                        </tr>
                        <tr>
                            <td width="120px">
                                <strong>Submited Date</strong>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="left-section">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <input type="radio" />
                            </td>
                            <td>
                                <strong>Warm</strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" />
                            </td>
                            <td>
                                <strong>WarmPlus</strong>
                            </td>
                        </tr>
                    </table>
                </div>--%>
                <%  
                    uniqueCols = dt_ShowDemoInvoice.DefaultView.ToTable(true, "catId");
                    for (int i = 0; i < uniqueCols.Rows.Count; i++)
                    {
                        CatId = Convert.ToInt32(uniqueCols.Rows[i]["catId"]);
                        dt_1 = abc();%>
                <div class="line">
                </div>
                <h3 style="width: 100%; float: left;">
                    <%=dt_1.Rows[0]["Category"]%>
                </h3>
                <div class="line" style="margin-top: 0; margin-bottom: 15px; background: Blue;">
                </div>
                <table cellpadding="5" cellspacing="0" class="full-left">
                    <tr>
                        <td width="80px">
                            <strong>Code</strong>
                        </td>
                        <td width="80px">
                            <strong>QTY</strong>
                        </td>
                        <td width="350px">
                            <strong>Item</strong>
                        </td>
                        <td width="350px">
                            <strong>Measure Description</strong>
                        </td>
                        <td width="80px">
                            <strong>THW</strong>
                        </td>
                        <td width="80px">
                            <strong>T/W</strong>
                        </td>
                        <td width="150px">
                            <strong>Location</strong>
                        </td>
                        <td width="80px">
                            <strong>Cost</strong>
                        </td>
                        <td width="80px">
                            <strong>Labor</strong>
                        </td>
                        <td width="80px">
                            <strong>Material</strong>
                        </td>
                        <td width="80px">
                            <strong>Total</strong>
                        </td>
                    </tr>
                    <%for (int j = 0; j < dt_1.Rows.Count; j++)
                      {
                          if (Convert.ToString(dt_1.Rows[j]["Fnl_Total"]) != "")
                          {
                              FinalTotal = Convert.ToDecimal(string.Format("{0:C}", dt_1.Rows[j]["Fnl_Total"]));
                          }
                    %>
                    <tr>
                        <td width="80px">
                            <%if (dt_1.Rows[j]["LiurpCode"].ToString() == "")
                              {%>
                            -
                            <%}
                              else
                              {%>
                            <%=dt_1.Rows[j]["LiurpCode"]%>
                            <%}%>
                        </td>
                        <td width="80px">
                            <%if (dt_1.Rows[j]["QTY"].ToString() == "")
                              {%>
                            -
                            <%}
                              else
                              {%>
                            <%=dt_1.Rows[j]["QTY"]%>
                            <%}%>
                        </td>
                        <td width="350px">
                            <%if (dt_1.Rows[j]["SubCategory"].ToString() == "")
                              {%>
                            -
                            <%}
                              else
                              {%>
                            <%=dt_1.Rows[j]["SubCategory"]%>
                            <%}%>
                        </td>
                        <td width="350px">
                            <%if (dt_1.Rows[j]["Rad_btn"].ToString() == "")
                              {%>
                            -
                            <%}
                              else
                              {%>
                            <%=dt_1.Rows[j]["Rad_btn"]%>
                            <%}%>
                        </td>
                        <td>
                            <%if (dt_1.Rows[j]["THW"].ToString() == "" || dt_1.Rows[j]["THW"].ToString() == "0.00" || dt_1.Rows[j]["THW"].ToString() == "0")
                              {%>
                            -
                            <%}
                              else
                              {%>
                            $<%=dt_1.Rows[j]["THW"]%>
                            <%}%>
                        </td>
                        <td>
                            <%if (dt_1.Rows[j]["TMC"].ToString() == "" || dt_1.Rows[j]["TMC"].ToString() == "0.00" || dt_1.Rows[j]["TMC"].ToString() == "0")
                              {%>
                            -
                            <%}
                              else
                              {%>
                            <%=dt_1.Rows[j]["TMC"]%>
                            <%}%>
                        </td>
                        <td width="150px">
                            <%if (dt_1.Rows[j]["Location"].ToString() == "")
                              {%>
                            -
                            <%}
                              else
                              {%>
                            <%=dt_1.Rows[j]["Location"]%>
                            <%}%>
                        </td>
                        <td width="80px">
                            <%if (dt_1.Rows[j]["Unit"].ToString() == "")
                              {%>
                            $0.00
                            <%}
                              else
                              {%>
                            <%=dt_1.Rows[j]["Unit"]%>
                            <%}%>
                        </td>
                        <td width="80px">
                            <%if (dt_1.Rows[j]["LaborRate"].ToString() == "" || dt_1.Rows[j]["LaborRate"].ToString() == "0.00")
                              {%>
                            -
                            <%}
                              else
                              {%>
                            $<%=dt_1.Rows[j]["LaborRate"]%>
                            <%}%>
                        </td>
                        <td width="80px">
                            <%if (dt_1.Rows[j]["CostPerUnit"].ToString() == "" || dt_1.Rows[j]["CostPerUnit"].ToString() == "0.00" || dt_1.Rows[j]["CostPerUnit"].ToString() == "0")
                              {%>
                            -
                            <%}
                              else
                              {%>
                            $<%=dt_1.Rows[j]["CostPerUnit"]%>
                            <%}%>
                        </td>
                        <td width="80px">
                            <%if (dt_1.Rows[j]["Total"].ToString() == "")
                              {%>
                            $0.00
                            <%}
                              else
                              {%>
                            $<%=dt_1.Rows[j]["Total"]%>
                            <%}%>
                        </td>
                    </tr>
                    <%  } %>
                </table>
                <%       }
                %>
                <div class="line" style="margin-top: 0; margin-bottom: 15px;">
                </div>
                <strong style="float: right;">Invoice Total :&nbsp;&nbsp;&nbsp;
                    <%= string.Format("{0:C}", FinalTotal)%></strong>
                <div class="line" style="margin-top: 0; margin-bottom: 15px;">
                </div>
            </div>
            <%-- --%>
        </div>
    </div>
    <asp:Panel ID="pnl_maker" runat="server" BackColor="#E6E6ED" Width="378px" Style="display: none;
        border: 1px solid #B4B2B2; padding-left: 15px;">
        <h4 style="text-align: center; margin: 10px 0 0;">
            Select Submitted Date
        </h4>
        <table width="98%" align="Center" cellspacing="4" cellpadding="4">
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:TextBox ID="txt_cal" runat="server" Style="padding-left: 6px; margin-top: 15px;
                        width: 220px; height: 23px;"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_cal"
                        Format="MM/dd/yyyy">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 50px;">
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" class="top_btn" Style="margin: 0;"
                        OnClick="btn_submit_Click" />
                </td>
                <td>
                    <asp:Button ID="btn_Cancel" runat="server" Text="Close" class="top_btn" OnClick="btn_Cancel_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Button ID="btnShowPopup" runat="server" Style="display: none" OnClick="btnShowPopup_Click1" />
    <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnl_maker"
        TargetControlID="btnShowPopup" BackgroundCssClass="modalBackground" X="520" Y="200">
    </asp:ModalPopupExtender>
    </div> </div>

    <script type="text/javascript">

        function HideInvoice() {
            document.getElementById('<%=Btn_back123.ClientID %>').style.display = "none";
            document.getElementById('Div').style.display = "none";
            document.getElementById('mainformat').style.display = "block";
        }
    </script>

    <%--<script type="text/javascript">
        function Calculation() {
            var Cost = document.getElementById('<%=txt_Cost.ClientID %>').value;

            if (isNaN(Cost)) {
                if (Cost == '.') {
                    Calculate();
                    CalculateTotal();
                }
                else {
                    document.getElementById('<%=txt_Cost.ClientID %>').value = '';
                    alert('Only Digit is allow');
                }
            }
            else {
                Calculate();
                CalculateTotal();
            }
        }

        function Calculate() {
            var Cost = document.getElementById('<%=txt_Cost.ClientID %>').value;
            var Labor = document.getElementById('<%=txt_Labor.ClientID %>').value;
            var Material = document.getElementById('<%=txt_Material.ClientID %>').value;
            if (Cost == '' || Cost == '.') {
                0
                Cost = '0.00';
            }

            if (Labor == '') {
                Labor = '0.00';
            }

            if (Material == '') {
                Material = '0.00';
            }

            Cost = parseFloat(Cost); Labor = parseFloat(Labor); Material = parseFloat(Material);
            Labor = parseFloat((parseFloat(Cost) * 60) / 100).toFixed(2);
            Material = parseFloat((parseFloat(Cost) * 40) / 100).toFixed(2);
            document.getElementById('<%=txt_Labor.ClientID %>').value = Labor;
            document.getElementById('<%=txt_Material.ClientID %>').value = Material;
        }



        function CalculateTotal() {
            var Labor = document.getElementById('<%=txt_Labor.ClientID %>').value;
            var Material = document.getElementById('<%=txt_Material.ClientID %>').value;
            var Qty = document.getElementById('<%=txt_Qty.ClientID %>').value;
            if (Labor == '') {
                Labor = '0.00';
            }
            if (Material == '') {
                Material = '0.00';
            }
            if (Qty == '') {
                Qty = '0.00';
            }
            var total = parseFloat(Labor) + parseFloat(Material);
            total = parseFloat(total) * parseFloat(Qty);
            total = "$" + total.toFixed(2);
            document.getElementById('<%=txt_Total.ClientID %>').value = total;
        }
    
    </script>--%>
    <%--<script type="text/javascript">
        function CalculationEdit() {
            var Cost = document.getElementById('<%=txtEditCost.ClientID %>').value;
            var Qty = document.getElementById('<%=txt_Qty.ClientID %>').value;
            if (Qty == '') {
                document.getElementById('<%=txt_Qty.ClientID %>').value = '1';
            }
            if (isNaN(Cost)) {
                if (Cost == '.') {
                    Calculate();
                    CalculateTotal();
                }
                else {
                    document.getElementById('<%=txtEditCost.ClientID %>').value = '';
                    alert('Only Digit is allow');
                }
            }
            else {
                CalculateEdit();
                CalculateTotalEdit();
            }
        }

        function CalculateEdit() {
            var Cost = document.getElementById('<%=txtEditCost.ClientID %>').value;
            var Labor = document.getElementById('<%=txtEditLabor.ClientID %>').value;
            var Material = document.getElementById('<%=txtEditMaterial.ClientID %>').value;
            var FnlQTY = document.getElementById('<%=txt_Qty.ClientID %>').value;
            if (Cost == '' || Cost == '.') {
                Cost = '0.00';
            }

            if (Labor == '') {
                Labor = '0.00';
            }

            if (Material == '') {
                Material = '0.00';
            }
            if (FnlQTY == '') {
                FnlTotal = '0';
            }

            Cost = parseFloat(Cost); Labor = parseFloat(Labor); Material = parseFloat(Material); FnlQTY = parseFloat(FnlQTY);
            var fnlTotal = document.getElementById('<%=txtEditTotal.ClientID %>').value;
            if (fnlTotal == '') {
                FnlTotal = '1';
            }
            FnlTotal = parseFloat(parseFloat(Cost) * parseFloat(FnlQTY)).toFixed(2); ;
            document.getElementById('<%=txtEditTotal.ClientID %>').value = FnlTotal;
            Labor = parseFloat((parseFloat(FnlTotal) * 60) / 100).toFixed(2);
            Material = parseFloat((parseFloat(FnlTotal) * 40) / 100).toFixed(2);
            document.getElementById('<%=txtEditLabor.ClientID %>').value = Labor;
            document.getElementById('<%=txtEditMaterial.ClientID %>').value = Material;
        }



        function CalculateEditLabor() {
            var Labor = document.getElementById('<%=txtEditLabor.ClientID %>').value;
            var Material = document.getElementById('<%=txtEditMaterial.ClientID %>').value;
            var Total = document.getElementById('<%=txtEditTotal.ClientID %>').value;
            if (Labor == '') {
                Labor = '0.00';
            }
            if (Material == '') {
                Material = '0.00';
            }
            if (Total == '') {
                Total = '0.00';
            }
            Material = parseFloat(Total) - parseFloat(Labor);
            document.getElementById('<%=txtEditMaterial.ClientID %>').value = Material.toFixed(2);

        }
        function CalculateEditMaterial() {
            var Labor = document.getElementById('<%=txtEditLabor.ClientID %>').value;
            var Material = document.getElementById('<%=txtEditMaterial.ClientID %>').value;
            var Total = document.getElementById('<%=txtEditTotal.ClientID %>').value;
            if (Labor == '') {
                Labor = '0.00';
            }
            if (Material == '') {
                Material = '0.00';
            }
            if (Total == '') {
                Total = '0.00';
            }
            Labor = parseFloat(Total) - parseFloat(Material);
            document.getElementById('<%=txtEditLabor.ClientID %>').value = Labor.toFixed(2);
        }
    
    </script>--%>

    <script type="text/javascript">

        function CalculateMaterial() {
            var cost = document.getElementById('<%=txtEditCost.ClientID %>').value;
            cost = cost.replace(/,/g, "");
            var labor = document.getElementById('<%=txtEditLabor.ClientID %>').value;
            labor = labor.replace(/,/g, "");
            if (cost == '') {
                cost = '0';
            }
            if (labor == '') {
                labor = '0';
            }
            var material = parseFloat(cost) - parseFloat(labor);
            document.getElementById('<%=txtEditMaterial.ClientID %>').value = material.toFixed(2);
            CalculateTotal();
        }


        function CalculateTotal() {
            var labor = document.getElementById('<%=txtEditLabor.ClientID %>').value;
            labor = labor.replace(/,/g, "");
            var material = document.getElementById('<%=txtEditMaterial.ClientID %>').value;
            material = material.replace(/,/g, "");
            var qty = document.getElementById('<%=txt_Qty.ClientID %>').value;
            qty = qty.replace(/,/g, "");
            if (labor == '' || labor == '-') {
                labor = '0';
            }
            if (material == '' || material == '-') {                
                material = '0';
            }
            if (qty == '') {
                qty = '0';
            }
            var total = parseFloat(labor) + parseFloat(material);
            total = parseFloat(qty) * parseFloat(total);            
           
            if(material == '0' && labor == '0')
            {   
                total = parseFloat(qty) * parseFloat(document.getElementById('<%=txtEditCost.ClientID %>').value);
            }
           
            document.getElementById('<%=txtEditTotal.ClientID %>').value = total.toFixed(2);
            document.getElementById('<%= hdntxtEditTotal.ClientID %>').value = total.toFixed(2);
        }

        function CalculateLabor() {
            var THW = document.getElementById('<%=txtEditTHW.ClientID %>').value;
            THW = THW.replace(/,/g, "");
            var TW = document.getElementById('<%=txtEditTW.ClientID %>').value;
            TW = TW.replace(/,/g, "");
            var LaborRate = document.getElementById('<%=txt_LaborRate.ClientID %>').value;
            LaborRate = LaborRate.replace(/,/g, "");
            if (THW == '') {
                THW = '0';
            }
            if (TW == '') {
                TW = '0';
            }
            if (LaborRate == '') {
                LaborRate = '0';
            }
            var labor = parseFloat(THW) * parseFloat(TW) * parseFloat(LaborRate);
            document.getElementById('<%=txtEditLabor.ClientID %>').value = labor.toFixed(2);
            CalculateMaterial(); CalculateTotal();
        }
    </script>

    <script type="text/javascript">
        function Test(rad) {
            var rads = document.getElementsByName(rad.name);
            if (rads[1].checked == false) {
                document.getElementById('<%= courier.ClientID %>').style.display = 'none';
                document.getElementById('<%= txt_MEASURE_DESCRIPTION.ClientID %>').style.display = 'none';
                document.getElementById('<%= DDl_MEASURE_DESCRIPTION.ClientID %>').style.display = 'block';
            }
            else {
                document.getElementById('<%= courier.ClientID %>').style.display = 'block';
                document.getElementById('<%= txt_MEASURE_DESCRIPTION.ClientID %>').style.display = 'block';
                document.getElementById('<%= DDl_MEASURE_DESCRIPTION.ClientID %>').style.display = 'none';
            }
        }

        function activeMenu(Id) {
            localStorage.setItem('SetMenu', Id);
        }
        
        
    </script>

    <script type="text/javascript">
        function CurrencyFormat(number) {
            var decimalplaces = 2;
            var decimalcharacter = ".";
            var thousandseparater = "";
            number = parseFloat(number);
            var sign = number < 0 ? "-" : "";
            var formatted = new String(number.toFixed(decimalplaces));
            if (decimalcharacter.length && decimalcharacter != ".") { formatted = formatted.replace(/\./, decimalcharacter); }
            var integer = "";
            var fraction = "";
            var strnumber = new String(formatted);
            var dotpos = decimalcharacter.length ? strnumber.indexOf(decimalcharacter) : -1;
            if (dotpos > -1) {
                if (dotpos) { integer = strnumber.substr(0, dotpos); }
                fraction = strnumber.substr(dotpos + 1);
            }
            else { integer = strnumber; }
            if (integer) { integer = String(Math.abs(integer)); }
            while (fraction.length < decimalplaces) { fraction += "0"; }
            temparray = new Array();
            while (integer.length > 3) {
                temparray.unshift(integer.substr(-3));
                integer = integer.substr(0, integer.length - 3);
            }
            temparray.unshift(integer);
            integer = temparray.join(thousandseparater);
            return sign + integer + decimalcharacter + fraction;
        }
    </script>

    <script type="text/javascript">
        function Currency_Format(ID) {
            var cost = document.getElementById(ID).value;
            var amt = CurrencyFormat(cost);
            document.getElementById(ID).value = amt;
        }
//$(document).ready(function () {

//        $("#lnkAudit").hover(function () {
//        $("#Quick_LinkMETED").show();
//          
//            }, 
//        function () {
//        //$("#Quick_LinkMETED").show();
//        });
//        
//        
//        $("#Quick_LinkMETED").hover(function () {
//        $("#Quick_LinkMETED").show();
//        }, 
//        function () {
//        $("#Quick_LinkMETED").hide();
//        });
//         });
//        

    </script>

    </form>
</body>
</html>
