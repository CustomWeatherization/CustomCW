<%@ Page Language="C#" AutoEventWireup="true" CodeFile="METED_Audit_Print.aspx.cs"
    Inherits="METED_METED_Audit_Print" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Custom Weatherization/ METED Audit Page</title>
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <link href="../css/PrintStyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <ajaxtoolkit:ToolkitScriptManager ID="scriptmanager" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>
    <div id="fix_div" style="font-size: 14px; font-weight: normal; position: relative;">
        <div style="width: 100%; padding: 15px 0px;" align="right">
            <input type="button" value="BACK" onclick="javascript:window.location='../DisplayJobSearchRecords.aspx?InvoiceNo=<%=Request.QueryString["InvoiceNo"].ToString()%>&Jobs=<%= Convert.ToString(Request.QueryString["Jobs"])  %>&Utility=<%= Convert.ToString(Request.QueryString["Utility"]) %>'"
                style="padding: 7px 10px; border: none; background-color: #3570a0; border-radius: 5px;
                color: #ffffff; cursor: pointer; margin-left: 15px;" />
            <a href="#" onclick="javascript:Clickheretoprint();" style="padding: 7px 257px 7px 10px;
                text-decoration: none;">
                <input type="button" value="PRINT AUDIT" style="padding: 7px 10px; border: none;
                    background-color: #3570a0; border-radius: 5px; color: #ffffff; cursor: pointer;
                    margin-left: 15px;" />
            </a>
        </div>
        <div style="margin: 0 auto; width: 1000px; font-size: 14px; position: relative;"
            id="DivPrint" runat="server">
            <!-- header -->
            <!-- end header -->
            <div style="border: 1px solid #B3B3B3; padding: 15px; width: 960px; margin: 0 auto">
            <br />
                <center>
                    <a href="JAVASCRIPT:goBack();" style="border: 0; text-decoration: none;">
                        <img src="../images/AWebBaseAuditMETED.png" alt="" width="920" height="120" style="border: 0;"/>
                    </a>
                </center>
                <br />
                <center>
                    <img src="../images/CWLogotest.gif" alt="" /></center>
                <br /><br />
                <center style="margin: 5px; font-size: 19px;">
                    <span style="color: Red; font-size: 36px; font-weight: bolder;"><u><i>Insulate Today
                        For A Comfortable Tomorrow</i></u></span></center>
                <center>
                    <img src="../images/WeatherPic1.jpg" alt="" width="90%" height="380" /></center>
                <br />
                <br />
                <br />
               
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px;">
                    <tr>
                        <td width="50%" align="left" style="color: Black; font-size: 25px; text-decoration: None;">
                            2045 Willow Park Rd.
                            <br />
                            Bethlehem, Pa. 18020
                            <br />
                            610-861-5290 (O)
                            <br />
                            610-861-5289 (F)
                            <br />
                            www.TruEnergySaver.com
                            <br />
                        </td>
                        <td width="25%" align="center" style="vertical-align: bottom;">
                            <img src="../images/EPALeadSafeLogo.gif" alt="" style="vertical-align: bottom;" />
                        </td>
                        <td width="25%" valign="middle" align="center" style="font-weight: bold; font-size: 17px;">
                            Web Audit Conducted<br />
                            by a BPI Certified<br />
                            Professional
                            <img src="../images/BPILogo.gif" width="185" height="230" alt="" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 17px;">
                            CEO - Mr. Otis McNeil (Founder)
                            <br />
                            COO - Mr. Robert Moux
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <i style="font-weight: bold; font-size: 15px;">Web-based Audit/Weatherization System
                                programmed by Custom Weatherization, LLC</i>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
           
          
            <br />
            <%--Page 1 start--%>
            <div style="width: 100%; height: auto; text-align: left; font-weight: normal;">
                <div style="width: 940px; margin: 0 auto; position: relative;">
                    <!-- Page 1 Start -->
                    <br />
                    <div style="border: 1px solid #000000;">
                        <div align="center">
                            <h2>
                                WARM Program Audit Form</h2>
                            <p>
                                <strong>Copyright 2007, FirstEnergy Corporation</br><br /> Permission to copy must be granted
                                    through FirstEnergy Corporation Human Services Dept<br /><br /><span id="Spn_RevisedDate" runat="server">Revised Date: <%--1/13/15--%><%--2/24/15--%><%--7/30/2015--%>12/01/15</span> </strong></p>
                        </div>
                        <div class="newtable">
                            <!--newtable begin-->
                            <table width="100%" border="0" cellspacing="0" cellpadding="2">
                                <tr>
                                    <td width="50%">
                                        <h4>
                                            Customer Info:</h4>
                                    </td>
                                    <td>
                                        <h4>
                                            Check all that apply:</h4>
                                        <div>
                                            <asp:RadioButtonList ID="rdoListWarm" runat="server" RepeatDirection="Vertical" Style="margin-top: -66px;
                                                margin-left: 198px;">
                                                <asp:ListItem Text="Warm" Value="Warm"></asp:ListItem>
                                                <asp:ListItem Text="Warm Plus" Value="Warm Plus"></asp:ListItem>
                                                <asp:ListItem Text="Multi-Family Plus" Value="Multi Family Plus"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Name:
                                        <asp:TextBox ID="txt_Name" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 81%; font-weight: normal; color: rgb(0, 0, 0);"> </asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_ElectricHeatJob" runat="server" Text="" />
                                        Installed electric heat job
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Address:
                                        <asp:TextBox ID="txt_Address" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 78%; font-weight: normal; color: rgb(0, 0, 0);"> </asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_AcJob" runat="server" />
                                        AC job (at least 2,000 kWh summer seasonal use to qualify for roof coat/window film,
                                        new AC units or shell measures with full audit required)
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        City:
                                        <asp:TextBox ID="txt_City" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 266px;"></asp:TextBox>
                                        State
                                        <asp:TextBox ID="txt_State" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 80px;"></asp:TextBox><br />
                                        Zip Code
                                        <asp:TextBox ID="txt_ZipCode" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 80px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_DefactoHeatJob" runat="server" />
                                        De facto/supplemental heat jobs (electric heat in lieu of or in addition to primary
                                        heat source; winter seasonal use of at least 2,000 kWh with full audit required.)
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Account Number:
                                        <asp:TextBox ID="txt_AccountNo" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_WaterHeatJob" runat="server" />
                                        Water Heat Job
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email:
                                        <asp:TextBox ID="txt_Email" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 78%; font-weight: normal; color: rgb(0, 0, 0);"> </asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_BaseloadJob" runat="server" />
                                        Baseload Job
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Phone Number:
                                        <asp:TextBox ID="txt_PhoneNo" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Default" runat="server" />
                                        Used Default
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Work Number:
                                        <asp:TextBox ID="txt_WorkNo" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                    <td>
                                        Seasonal spending allowance:
                                        <asp:TextBox ID="txt_Seasonal" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Other Number:
                                        <asp:TextBox ID="txt_OtherNo" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="padding-left: 5px;">
                                        Auditor Name:
                                        <asp:TextBox ID="txt_Auditor_Name" runat="server" value="" Style="border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 15%; height: 19px; border-left-style: none;
                                            border-left-color: inherit; border-left-width: medium; border-right-style: none;
                                            border-right-color: inherit; border-right-width: medium; border-top-style: none;
                                            border-top-color: inherit; border-top-width: medium;"></asp:TextBox>
                                        Audit Date
                                        <asp:TextBox ID="txt_AuditDate" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        <%-- <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_AuditDate">
                                        </ajaxtoolkit:CalendarExtender>--%>
                                        <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                            TargetControlID="txt_AuditDate" FilterType="Custom,Numbers" ValidChars="/">
                                        </ajaxtoolkit:FilteredTextBoxExtender>
                                        Job Complete Date:
                                        <asp:TextBox ID="txt_JobCompleteDate" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                        <ajaxtoolkit:CalendarExtender ID="Calander" runat="server" TargetControlID="txt_JobCompleteDate">
                                        </ajaxtoolkit:CalendarExtender>
                                        <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server"
                                            TargetControlID="txt_JobCompleteDate" FilterType="Custom,Numbers" ValidChars="/">
                                        </ajaxtoolkit:FilteredTextBoxExtender>
                                        Baseload kWh:
                                        <asp:TextBox ID="txt_Baseload" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Coordinate with State Weatherization:
                                        <asp:RadioButton ID="rdo_CordinateState_Yes" runat="server" GroupName="State" />Yes
                                        <asp:RadioButton ID="rdo_CordinateState_No" runat="server" GroupName="State" />No
                                    </td>
                                    <td>
                                        Summer Seasonal Use:
                                        <asp:TextBox ID="txt_SummerSeasonal" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal;
                                            color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        State Weatherization $:
                                        <asp:TextBox ID="txt_StateWeather" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                    <td>
                                        Winter Seasonal kWh:
                                        <asp:TextBox ID="txt_WinterSeasonal" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal;
                                            color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Coordinate with Gas Utility Program?
                                        <asp:RadioButton ID="rdo_CordinateGas_Yes" runat="server" GroupName="Gas" />Yes
                                        <asp:RadioButton ID="rdo_CordinateGas_No" runat="server" GroupName="Gas" />No
                                    </td>
                                    <td>
                                        When seasonal allowance cannot be used (customer does not have 6 bills based on
                                        actual meter readings within a year), use default spending guidelines effective
                                       <span id="spn_EffectiveDate1" runat="server" visible="false">06/01/2012</span><span
                            id="spn_EffectiveDate2" runat="server" visible="false">01/15/2015</span>.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Gas Utility $:
                                        <asp:TextBox ID="txt_GasUtility" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                    <td>
                                        <strong>Please note: Costs associated with any health and safety issues may not exceed
                            <%--30%--%>50% of the
                            <%--total job cost and are not part of the --%>seasonal spending allowance.</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Referred to State or other programs?
                                        <asp:RadioButton ID="rdo_referedState_Yes" runat="server" GroupName="Refered" />Yes
                                        <asp:RadioButton ID="rdo_referedState_No" runat="server" GroupName="Refered" />No
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Other Program $:
                                        <asp:TextBox ID="txt_OtherProgram" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Landlord Name:
                                        <asp:TextBox ID="txt_Landlord_Name" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal;
                                            color: rgb(0, 0, 0);"></asp:TextBox>
                                        Landlord Phone:
                                        <asp:TextBox ID="txt_Landlord_Phone" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal;
                                            color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Directions:
                                        <asp:TextBox ID="txt_Direction1" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 83%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        <asp:TextBox ID="txt_Direction2" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 94%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        <asp:TextBox ID="txt_Direction3" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 94%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td colspan="2">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    Customer qualifies under PCAP?
                                                    <asp:RadioButton ID="rdo_PCAP_6Month_Yes" runat="server" GroupName="Customer" />Yes
                                                    <asp:RadioButton ID="rdo_PCAP_6Month__No" runat="server" GroupName="Customer" />No
                                                    <br />
                                                    Customer enrolled within 12 months
                                                    
                                                </td>
                                                <td>
                                                    Eligibility Verification:
                                                    <asp:RadioButton ID="rdo_Eligibility_Yes" runat="server" GroupName="Eligibility" />Yes
                                                    <asp:RadioButton ID="rdo_Eligibility_No" runat="server" GroupName="Eligibility" />No
                                                </td>
                                                <td align="right">
                                                    Verified By:
                                                    <asp:TextBox ID="txt_Verified" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Household Income $:
                                        <asp:TextBox ID="txt_Household_Income" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal;
                                            color: rgb(0, 0, 0);"></asp:TextBox>
                                        <small>PER YEAR</small>
                                    </td>
                                    <td align="right">
                                        Date Verified:
                                        <asp:TextBox ID="txt_Date_Verifi" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="width: 100%; text-align: left">
                                        <strong>Primary Source
                                            <br />
                                            Of Income:</strong>
                                        <asp:RadioButton ID="rdo_Employment" runat="server" GroupName="Income" />
                                        1.Employment
                                        <asp:RadioButton ID="rdo_Public_Assist" runat="server" GroupName="Income" />
                                        2.Public Assist
                                        <asp:RadioButton ID="rdo_Pension" runat="server" GroupName="Income" />
                                        3.Pension/Retirement
                                        <asp:RadioButton ID="rdo_UnEmployment" runat="server" GroupName="Income" />
                                        4.Unemployment
                                        <asp:RadioButton ID="rdo_Disability" runat="server" GroupName="Income" />
                                        5.Disability
                                        <asp:RadioButton ID="rdo_Other" runat="server" GroupName="Income" />
                                        99.Other
                                        <asp:TextBox ID="txt_Other_Income" runat="server" value="" Style="border-bottom: solid 1px rgb(0, 0, 0);
                                            -webkit-border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 8%; height: 19px; border-left-style: none; border-left-color: inherit;
                                            border-left-width: medium; border-right-style: none; border-right-color: inherit;
                                            border-right-width: medium; border-top-style: none; border-top-color: inherit;
                                            border-top-width: medium;"></asp:TextBox>
                                    </td>
                                </tr>
                                 <tr id="tr_HouseholdEmployment" runat="server">
                    <td colspan="2" style="width: 100%; text-align: left">
                        <strong>Head of household employment status: </strong>
                        <asp:RadioButton ID="rdo_fulltimeEmploye" runat="server" GroupName="HouseholdEmployment" />
                        1.Full-Time Employment(35 or more hours per week)
                        <asp:RadioButton ID="rdo_partTime" runat="server" GroupName="HouseholdEmployment" />
                        2.Part-Time Employment(34 or fewer hours per week)
                        <asp:RadioButton ID="rdo_Unemploye" runat="server" GroupName="HouseholdEmployment" />
                        3.Unemployed Worker
                        <asp:RadioButton ID="rdo_Retired" runat="server" GroupName="HouseholdEmployment" />
                        4.Retired
                        <asp:RadioButton ID="rdo_Homemaker" runat="server" GroupName="HouseholdEmployment" />
                        5.Homemaker
                        <asp:RadioButton ID="rdo_Student" runat="server" GroupName="HouseholdEmployment" />
                        6.Student
                        <asp:RadioButton ID="rdo_HouseholdEmployment_other" runat="server" GroupName="HouseholdEmployment" />
                        99.Other
                        <asp:TextBox ID="txt_HouseholdEmployment_other" runat="server" value="" Style="border-bottom: solid 1px rgb(0, 0, 0);
                            -webkit-border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 8%; height: 19px; border-left-style: none; border-left-color: inherit;
                            border-left-width: medium; border-right-style: none; border-right-color: inherit;
                            border-right-width: medium; border-top-style: none; border-top-color: inherit;
                            border-top-width: medium;"></asp:TextBox>
                    </td>
                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                  
                                        <h4>
                                            Refer to Procedures Manual for "Preparing for an Audit" Document
                                            <br /><br />
                                            (REMINDER: Plug in refrigerator monitoring devices)</h4>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <h4>
                                            Demographic/Dwelling Information required by the PUC & entered in WARM3 by contractors:</h4>
                                    </td>
                                </tr>
                              
                                <tr>
                                    <td colspan="2">
                                        1.&nbsp;<span id="spn_memberpresent" runat="server" visible="false">Name of household member
                            present at audit:</span><span id="spn_Personpresent" runat="server" visible="false">Person
                                present at audit:</span>
                                        <asp:TextBox ID="txt_PersonPresent" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal;
                                            color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        2. Relationship to customer:
                                        <asp:RadioButton ID="rdo_Self" runat="server" GroupName="Relationship" />
                                        0.Self
                                        <asp:RadioButton ID="rdo_Spouse" runat="server" GroupName="Relationship" />
                                        1.Spouse
                                        <asp:RadioButton ID="rdo_Sibling" runat="server" GroupName="Relationship" />
                                        2.Sibling
                                        <asp:RadioButton ID="rdo_Parent" runat="server" GroupName="Relationship" />
                                        3.Parent
                                        <asp:RadioButton ID="rdo_Relative" runat="server" GroupName="Relationship" />
                                        4.Relative
                                        <asp:RadioButton ID="rdo_NonRelative" runat="server" GroupName="Relationship" />
                                        5.Non-Relative
                                        <asp:RadioButton ID="rdo_Other_Relationship" runat="server" GroupName="Relationship" />
                                        6.Other
                                        <asp:TextBox ID="txt_Other_Relationship" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 80px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        3. Customer's Date of Birth:
                                        <asp:TextBox ID="txt_Customer_DateOfBirth" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal;
                                            color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2" style="width: 100%; text-align: left">
                                        4. Ethnic Origin
                                        <asp:RadioButton ID="rdo_Caucasian" runat="server" GroupName="Ethnic" />
                                        1.Caucasian/White
                                        <asp:RadioButton ID="rdo_African" runat="server" GroupName="Ethnic" />
                                        2.African American
                                        <asp:RadioButton ID="rdo_Hispanic" runat="server" GroupName="Ethnic" />
                                        3.Hispanic
                                        <asp:RadioButton ID="rdo_Asian" runat="server" GroupName="Ethnic" />
                                        4.Asian/Pacific Is
                                        <asp:RadioButton ID="rdo_Native_American" runat="server" GroupName="Ethnic" />
                                        5.Native American
                                        <asp:RadioButton ID="rdo_Multi_Racial" runat="server" GroupName="Ethnic" />
                                        99.Multi-Racial
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        5. Number of Occupants:<asp:TextBox ID="txt_Occupants" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>Number of Handicapped Occupants:<asp:TextBox ID="txt_Handicapped_Occupants"
                                                runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <%--   <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btn_update" runat="server" Text="Save" CssClass="btn_all" OnClick="btn_update_Click" />
                </td>
            </tr>--%>
                            </table>
                        </div>
                    </div>
                    <%--Page 1 End--%>
                    <%--Page 2 start--%>

                    <div style="page-break-before: always; page-break-after: always; border: 1px solid #000000;
                        width: 940px; margin: 0 auto; position: relative;">
                        <div class="newtable">
                            <!--newtable begin-->
                         
                           <table width="100%" border="0" cellspacing="0" cellpadding="7">
                                <tr>
                                    <td>
                                        6. Age of Occupants: Under Age 19:
                                        <asp:TextBox ID="txt_Occupants_under19" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 80px;"></asp:TextBox>
                                        Ages 19 to 62:
                                        <asp:TextBox ID="txt_Occupants_19_to_62" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 80px;"></asp:TextBox>
                                        Over 62:
                                        <asp:TextBox ID="txt_Occupants_Over62" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 80px;"></asp:TextBox>
                                    </td>
                                </tr>
                              
                                <tr>
                                    <td>
                                        7. Occupancy Type:
                                        <asp:RadioButton ID="rdo_Occupancy_Own" runat="server" GroupName="OccupancyType" />
                                        1. Own
                                        <asp:RadioButton ID="rdo_Occupancy_Rent" runat="server" GroupName="OccupancyType" />
                                        2. Rent
                                        <asp:RadioButton ID="rdo_Occupancy_Other" runat="server" GroupName="OccupancyType" />
                                        99. Other
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                            <tr>
                                                <td>
                                                    8. Structure Type:
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="chk_Structure_Story" runat="server" onclick="ChkBox_Structure(this.id)" />
                                                    1. 1-1/2 Story or 2 Story
                                                    <asp:CheckBox ID="chk_Structure_Ranch" runat="server" onclick="ChkBox_Structure(this.id)" />
                                                    2. Ranch
                                                    <asp:CheckBox ID="chk_Structure_Blevel" runat="server" onclick="ChkBox_Structure(this.id)" />
                                                    3. Bi-level
                                                    <asp:CheckBox ID="chk_Structure_Mobile" runat="server" onclick="ChkBox_Structure(this.id)" />
                                                    4. Mobile Home
                                                    <asp:CheckBox ID="chk_Structure_RowInside" runat="server" onclick="ChkBox_Structure(this.id)" />
                                                    5. Row House (inside)
                                                    <br />
                                                    <asp:CheckBox ID="chk_Structure_RowOutside" runat="server" onclick="ChkBox_Structure(this.id)" />
                                                    6. Row House (outside)
                                                    <asp:CheckBox ID="chk_Structure_Duplex" runat="server" onclick="ChkBox_Structure(this.id)" />
                                                    7. Duplex
                                                    <asp:CheckBox ID="chk_Structure_Multi" runat="server" onclick="ChkBox_Structure(this.id)" />
                                                    8. Multi Family
                                                    <asp:CheckBox ID="chk_Structure_Other" runat="server" onclick="ChkBox_Structure(this.id)" />
                                                    99. Other
                                                    <asp:TextBox ID="txt_Structure_Other" runat="server" value="" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                                        width: 80px;"></asp:TextBox>
                                                        <br />
                                                        <asp:CheckBox ID="chk_Structure_Modular" runat="server" onclick="ChkBox_Structure(this.id)" />
                                    10. Manufactured, Modular Housing
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="tr_CunstructionType" runat="server">
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 17%" valign="top">
                                    9. Construction Type:
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdo_Cunstruction_Block" runat="server" GroupName="CunstructionType" />
                                    1.Block,concrete or log home with slab foundation and open joist attic
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodKnee" runat="server" GroupName="CunstructionType" />
                                    2.Wood frame home with full basement and knee wall attic
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodFull" runat="server" GroupName="CunstructionType" />
                                    3.Wood frame home with full basement and open joist attic
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodSpace" runat="server" GroupName="CunstructionType" />
                                    4.Wood frame home with combination crawl space/basement,open joist attic
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodCrawl" runat="server" GroupName="CunstructionType" />
                                    5.Wood frame home with crawl space and open joist attic<br />
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodPost" runat="server" GroupName="CunstructionType" />
                                    6.Wood frame home with post foundation and open joist attic
                                    <asp:RadioButton ID="rdo_Cunstruction_Mobile" runat="server" GroupName="CunstructionType" />
                                    7.Mobile home with post foundation
                                    <asp:RadioButton ID="rdo_Cunstruction_WoodSlab" runat="server" GroupName="CunstructionType" />
                                    8.Wood frame home with slab foundation and open joist attic
                                    <asp:RadioButton ID="rdo_Cunstruction_Other" runat="server" GroupName="CunstructionType" />
                                    99.Other
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                                <tr>
                                    <td>
                                        9 A. Year Constructed:
                                        <asp:TextBox ID="txt_YearConstructed" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                              
                                <tr>
                                    <td>
                                        10. Size of Electrically Heated Area:
                                        <asp:TextBox ID="txt_ElectricallyHeatedArea" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                        sq. ft.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="8">
                                            <tr>
                                                <td>
                                                    11. Type of Air Conditioning:
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="chk_AirConditioning_Central" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                    1. Central System
                                    <asp:CheckBox ID="chk_AirConditioning_HeatPump" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                    2. Heat Pump
                                    <asp:CheckBox ID="chk_AirConditioning_WindowUnits" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                    3. Window Units
                                    <asp:CheckBox ID="chk_AirConditioning_WallUnits" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                    4. Wall Units
                                    <asp:CheckBox ID="chk_AirConditioning_None" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                    5. None
                                                    <br />
                                                    <asp:CheckBox ID="chk_AirConditioning_Other" runat="server" onclick="ChkBox_AirConditioning(this.id)" />
                                                    99. Other
                                                    <asp:TextBox ID="txt_AirConditioning_Other" runat="server" value="" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                                        width: 80px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                              
                                <tr>
                                    <td>
                                        12. Number of Window or Wall AC Units:
                                        <asp:TextBox ID="txt_WindoworWall" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <br /> 
                                <tr>
                                    <td>
                                        13. Number of Rooms Routinely Air Conditioned:
                                        <asp:TextBox ID="txt_Rooms" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <br />
                                <tr>
                                    <td>
                                        14. Size of Area Cooled:
                                        <asp:TextBox ID="txt_AreaCooled" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        sq. ft.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="8">
                                            <tr>
                                                <td style="width: 22%;" valign="top">
                                                    15. Primary Heating Source:
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Electric" runat="server" GroupName="PrimaryHeatingSource" />
                                                    1. Electric
                                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_UtilityGas" runat="server" GroupName="PrimaryHeatingSource" />
                                                    2. Utility Gas
                                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_FuelOil" runat="server" GroupName="PrimaryHeatingSource" />
                                                    3. Fuel Oil
                                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Wood" runat="server" GroupName="PrimaryHeatingSource" />
                                                    4. Wood
                                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Coal" runat="server" GroupName="PrimaryHeatingSource" />
                                                    5. Coal
                                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Solar" runat="server" GroupName="PrimaryHeatingSource" />
                                                    6. Solar
                                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_CitySteam" runat="server" GroupName="PrimaryHeatingSource" />
                                                    7. City Steam
                                                    <br />
                                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_BottelGas" runat="server" GroupName="PrimaryHeatingSource" />
                                                    8. Bottled Gas/ Propane
                                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Kerosene" runat="server" GroupName="PrimaryHeatingSource" />
                                                    9. Kerosene
                                                    <asp:RadioButton ID="rdo_PrimaryHeatingSource_Other" runat="server" GroupName="PrimaryHeatingSource" />
                                                    99. Other (please describe)
                                                    <asp:TextBox ID="txt_PrimaryHeatingSource_Other" runat="server" value="" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                                        width: 90px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="8">
                                            <tr>
                                                <td style="width: 22%;" valign="top">
                                                    16. Type of Heating System:
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricBaseboard" runat="server" GroupName="HeatingSystem" />
                                                    1 Electric Baseboard
                                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricHeatPump" runat="server" GroupName="HeatingSystem" />
                                                    2. Electric Heat Pump
                                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricBoiler" runat="server" GroupName="HeatingSystem" />
                                                    3. Electric Boiler
                                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricFurnace" runat="server" GroupName="HeatingSystem" />
                                                    4. Electric Furnace
                                                    <br />
                                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricRadiant" runat="server" GroupName="HeatingSystem" />
                                                    5. Electric Radiant
                                                    <asp:RadioButton ID="rdo_HeatingSystem_ElectricWallBlowers" runat="server" GroupName="HeatingSystem" />
                                                    6. Electric Wall Blowers
                                                    <asp:RadioButton ID="rdo_HeatingSystem_GasFurnace" runat="server" GroupName="HeatingSystem" />
                                                    7. Gas Furnace
                                                    <asp:RadioButton ID="rdo_HeatingSystem_Gas_Boiler" runat="server" GroupName="HeatingSystem" />
                                                    8. Gas Boiler
                                                    <asp:RadioButton ID="rdo_HeatingSystem_OilFurnace" runat="server" GroupName="HeatingSystem" />
                                                    9. Oil Furnace
                                                    <br />
                                                    <asp:RadioButton ID="rdo_HeatingSystem_OilBoiler" runat="server" GroupName="HeatingSystem" />
                                                    10. Oil Boiler
                                                    <asp:RadioButton ID="rdo_HeatingSystem_Other" runat="server" GroupName="HeatingSystem" />
                                                    99. Other (please describe)
                                                    <asp:TextBox ID="txt_HeatingSystem_Other" runat="server" value="" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                                        width: 90px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="8">
                                            <tr>
                                                <td style="width: 35%;" valign="top">
                                                    17. What is the <u>Main</u> Source of Supplemental Heat?
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rdo_SupplementalHeat_None" runat="server" GroupName="SupplementalHeat" />
                                                    00. None
                                                    <asp:RadioButton ID="rdo_SupplementalHeat_FuelOil" runat="server" GroupName="SupplementalHeat" />
                                                    1. Fuel Oil/Kerosene
                                                    <asp:RadioButton ID="rdo_SupplementalHeat_UtilityGas" runat="server" GroupName="SupplementalHeat" />
                                                    2. Utility Gas
                                                    <asp:RadioButton ID="rdo_SupplementalHeat_BottleGas" runat="server" GroupName="SupplementalHeat" />
                                                    3. Bottled Gas/Propane
                                                    <br />
                                                    <asp:RadioButton ID="rdo_SupplementalHeat_Electricity" runat="server" GroupName="SupplementalHeat" />
                                                    4. Electricity
                                                    <asp:RadioButton ID="rdo_SupplementalHeat_Coal" runat="server" GroupName="SupplementalHeat" />
                                                    5. Coal
                                                    <asp:RadioButton ID="rdo_SupplementalHeat_CitySteam" runat="server" GroupName="SupplementalHeat" />
                                                    6. City Steam
                                                    <asp:RadioButton ID="rdo_SupplementalHeat_Wood" runat="server" GroupName="SupplementalHeat" />
                                                    7. Wood
                                                    <asp:RadioButton ID="rdo_SupplementalHeat_Solar" runat="server" GroupName="SupplementalHeat" />
                                                    8. Solar
                                                    <br />
                                                    <asp:RadioButton ID="rdo_SupplementalHeat_PelletStove" runat="server" GroupName="SupplementalHeat" />
                                    <span id="spn_PelletStove" runat="server">9. Pellet Stove</span>
                                    <asp:RadioButton ID="rdo_SupplementalHeat_SpaceHeater" runat="server" GroupName="SupplementalHeat" />
                                     <span id="spn_SpaceHeater" runat="server">10. Electric Space Heater
                                        <br />
                                    </span>
                                                    <asp:RadioButton ID="rdo_SupplementalHeat_Other" runat="server" GroupName="SupplementalHeat" />
                                                    99. Other (please describe)
                                                    <asp:TextBox ID="txt_SupplementalHeat_Other" runat="server" value="" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                                        width: 90px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        18. What is the Contribution of the <u>Main</u> Supplemental Heat Source to the Total Household
                                        Heating?
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="rdo_HouseholdHeating_TotallyHeated" runat="server" GroupName="ContributionSupplementalHeat" />
                                        1. Totally heated by suppl source
                                        <asp:RadioButton ID="rdo_HouseholdHeating_MostHtg" runat="server" GroupName="ContributionSupplementalHeat" />
                                        2. Most htg (at least half) from suppl source
                                        <asp:RadioButton ID="rdo_HouseholdHeating_LessThanHalf" runat="server" GroupName="ContributionSupplementalHeat" />
                                        3. Less than half of htg from suppl source
                                        <br />
                                        <asp:RadioButton ID="rdo_HouseholdHeating_SupplementalHeatSeldom" runat="server"
                                            GroupName="ContributionSupplementalHeat" />
                                        4. Supplemental heat seldom used
                                        <asp:RadioButton ID="rdo_HouseholdHeating_SupplHeat" runat="server" GroupName="ContributionSupplementalHeat" />
                                        5. Suppl heat is present but never used
                                        <asp:RadioButton ID="rdo_HouseholdHeating_NotSupplementalHeat" runat="server" GroupName="ContributionSupplementalHeat" />
                                        6. Supplemental heat is not present
                                        <br />
                                        <asp:RadioButton ID="rdo_HouseholdHeating_other" runat="server" GroupName="ContributionSupplementalHeat" />
                                        99. Other 
                                        <asp:TextBox ID="txt_HouseholdHeating_Other" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 330px;"></asp:TextBox>
                                        Location:
                                        <asp:TextBox ID="txt_Location" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 25%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr id="tr_electricSpaceHeater" runat="server">
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 40%;" valign="top">
                                    18 A. Why are they using the electric space heater?
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_SpaceHeater_NoHeat" runat="server" onclick="ChkBox_electricSpaceHeater(this.id)" />
                                    &nbsp;No Heat
                                    <asp:CheckBox ID="chk_SpaceHeater_notWork" runat="server" onclick="ChkBox_electricSpaceHeater(this.id)" />
                                    &nbsp;Heating System does not work
                                    <asp:CheckBox ID="chk_SpaceHeater_AdditionalHeat" runat="server" onclick="ChkBox_electricSpaceHeater(this.id)" />
                                    &nbsp;Using as Additional Heat
                                    <asp:CheckBox ID="chk_SpaceHeater_Other" runat="server" onclick="ChkBox_electricSpaceHeater(this.id)" />
                                    &nbsp;Other
                                    <asp:TextBox ID="txt_SpaceHeater_Other" runat="server" value="" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 80px;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr> <br />
                                <tr>
                                    <td>
                                        19. How many unblocked fireplaces are present in the customer's dwelling?<asp:TextBox
                                            ID="txt_unblockedFireplaces" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>(Enter
                                        actual number; enter "0" if none.)
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        20. Water Heater Fuel Type:
                                        <asp:RadioButton ID="rdo_FuelType_Electric" runat="server" GroupName="FuelType" />
                                        1. Electric
                                        <asp:RadioButton ID="rdo_FuelType_FuelOil" runat="server" GroupName="FuelType" />
                                        2. Fuel Oil
                                        <asp:RadioButton ID="rdo_FuelType_UtilityGas" runat="server" GroupName="FuelType" />
                                        3. Utility Gas
                                        <asp:RadioButton ID="rdo_FuelType_BottelGas" runat="server" GroupName="FuelType" />
                                        4. Bottled Gas/Propane
                                        <asp:RadioButton ID="rdo_FuelType_Other" runat="server" GroupName="FuelType" />
                                        99. Other
                                        <asp:TextBox ID="txt_FuelType_Other" runat="server" value="" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        21. Dryer Type:
                                        <asp:CheckBox ID="chk_Electric" runat="server" onclick="ChkBox_DrayerType(this.id)" />
                                        Electric
                                        <asp:CheckBox ID="chk_Gas" runat="server" onclick="ChkBox_DrayerType(this.id)" />
                                        Gas
                                    </td>
                                </tr>
                                <tr>
                                    <dt>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="8" style="margin: 10px 0;">
                                            <td valign="top" style="width: 10%;">
                                                <p style="vertical-align: middle; float: left; padding-left: 4px;">
                                                    Comment:</p>
                                                <asp:TextBox ID="txt_Comments" runat="server" Rows="5" Columns="90" TextMode="MultiLine"></asp:TextBox>
                                </tr>
                            </table>
                        </div>
                    </div>
                     <br /><br />
                    <%--Page 2 End--%>
                    <%--Page 3 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <div class="newtable">
                            <!--newtable begin-->
                            <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                <tr>
                                    <td>
                                        <strong>Customer Interview</strong> (Introduce the Partnership Concept)
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Describe areas in your home that are difficult to heat or cool and in which season.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_AreaDifficult" runat="server" Style="width: 96%; height: 180px; overflow:auto;"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td>
                                        Describe any appliance problems in your home (including water heater) that we need
                                        to be aware of. Are there electrical, plumbing, roofing, or moisture problems? If
                                        so, describe.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_ApplicationProb" runat="server" Style="width: 96%; height: 180px; overflow:auto;"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Do you ever use unvented combustion appliances to heat your home in the winter?
                                        <asp:CheckBox ID="chk_combustionAppliances_Yes" runat="server" onclick="ChkBox_combustionAppliances(this.id)" />
                                        Yes
                                        <asp:CheckBox ID="chk_combustionAppliances_No" runat="server" onclick="ChkBox_combustionAppliances(this.id)" />
                                        No
                                        <asp:CheckBox ID="chk_combustionAppliances_Null" runat="server" onclick="ChkBox_combustionAppliances(this.id)" />
                                        N/A
                                        <br />
                                        <i>If so, see the Weatherization Release procedure.</i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        What do you believe are the highest energy users in your home?
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_HighestEnergy" runat="server" Style="width: 96%; height: 100px; overflow:auto;"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Does anyone living in your home have any respiratory, allergy, or other health issues
                                        that we should be aware of?
                                        <asp:CheckBox ID="chk_HealthIssues_Yes" runat="server" onclick="ChkBox_HealthIssues(this.id)" />
                                        Yes
                                        <asp:CheckBox ID="chk_HealthIssues_No" runat="server" onclick="ChkBox_HealthIssues(this.id)" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        If yes, please explain:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Expalain_HealthIssues1" runat="server" Style="width: 96%; height: 100px;"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td>
                                        Are you aware of any building materials, such as caulk, foam, insulation, etc, that
                                        could cause anyone living in your home to have a health issue?
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_HealthIssue2" runat="server" Style="width: 96%; height: 80px;"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <!--Ye Nya Hai-->
                            
                     <p style="text-align: center;">
                <b>LED Night Lights - Smart Power Strips - Furnace Whistles - CO Alarms </b>
            </p>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="75%" style="border-right: 1px Solid; border-bottom: 1px Solid;">
                        <%--border: 1px Solid; --%>
                        <br />
                        Installed Furnace Filter Whistle?
                        <asp:RadioButton ID="rdo_FilterWhistle_Yes" runat="server" GroupName="FilterWhistle" />
                        Yes
                        <asp:RadioButton ID="rdo_FilterWhistle_No" runat="server" GroupName="FilterWhistle" />
                        No
                        <br />
                        <table width="100%" border="1px Solid" cellspacing="0" cellpadding="5">
                            <tr>
                                <td>
                                    <strong>LED Night Lights:</strong><asp:TextBox ID="txt_LedNightLight" runat="server"
                                        Style="width: 80px; text-align: center; border: none; border-bottom: solid 1px rgb(0, 0, 0);"></asp:TextBox>(No
                                    install limit, no warranty)
                                    <br />
                                    Location:
                                    <asp:TextBox ID="txt_LedNightLight_Location1" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 62%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txt_LedNightLight_Location2" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txt_LedNightLight_Location3" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><br />
                                    <asp:TextBox ID="txt_LedNightLight_Location4" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td>
                                    <strong>Smart Power Strip:</strong>
                                    <asp:TextBox ID="txt_SmartPowerStrip" runat="server" Style="width: 80px; text-align: center;
                                        border: none; border-bottom: solid 1px rgb(0, 0, 0);"></asp:TextBox>
                                    Up to 4/household SPS
                                    <%--Installation required by auditor or crew.--%>
                                    <br />
                                    Location:
                                    <asp:TextBox ID="txt_SmartPower_Location1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 27%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <asp:RadioButton ID="rdo_Line1_6_9_Outlet" runat="server" GroupName="Line1SmartPower" />
                                    6-9 Outlet
                                    <asp:RadioButton ID="rdo_Line1_10_Outlet" runat="server" GroupName="Line1SmartPower" />
                                    10+ Outlet
                                    <br />
                                    <asp:TextBox ID="txt_SmartPower_Location2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <asp:RadioButton ID="rdo_Line2_6_9_Outlet" runat="server" GroupName="Line2SmartPower" />
                                    6-9 Outlet
                                    <asp:RadioButton ID="rdo_Line2_10_Outlet" runat="server" GroupName="Line2SmartPower" />
                                    10+ Outlet
                                    <br />
                                    <asp:TextBox ID="txt_SmartPower_Location3" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <asp:RadioButton ID="rdo_Line3_6_9_Outlet" runat="server" GroupName="Line3SmartPower" />
                                    6-9 Outlet
                                    <asp:RadioButton ID="rdo_Line3_10_Outlet" runat="server" GroupName="Line3SmartPower" />
                                    10+ Outlet
                                    <br />
                                    <asp:TextBox ID="txt_SmartPower_Location4" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <asp:RadioButton ID="rdo_Line4_6_9_Outlet" runat="server" GroupName="Line4SmartPower" />
                                    6-9 Outlet
                                    <asp:RadioButton ID="rdo_Line4_10_Outlet" runat="server" GroupName="Line4SmartPower" />
                                    10+ Outlet
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="border: 0 !important;" valign="top">
                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <th align="center">
                                    CO Alarms
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    # of Existing Alarms less
                                    <br />
                                    than 5 years old:
                                    <asp:TextBox ID="txt_ExistingAlarms" runat="server" Style="width: 80px; text-align: center;
                                        border: none; border-bottom: solid 1px rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Total NEW Alarms installed #
                                    <asp:TextBox ID="txt_NewAlarms" runat="server" Style="width: 80px; text-align: center;
                                        border: none; border-bottom: solid 1px rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Location of new:
                                    <asp:TextBox ID="txt_COAlarms_Location1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txt_COAlarms_Location2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txt_COAlarms_Location3" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><br />
                                    <asp:TextBox ID="txt_COAlarms_Location4" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><br />
                                    <asp:TextBox ID="txt_COAlarms_Location5" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
                            
                            <!--New End-->
                        </div>
                    </div>
                  <br /><br />
                    <%--Page 3 End--%>
                    <%--Page 4 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <div align="center">
                         <h3>
               WARM Program Lighting - Smart Power Strips - Furnace Whistles - CO Alarms - LED
                Night Lights</h3>
                <br />
                            <%--WARM Lighting and Smart Power Strip Installations</div>
                        <strong><u>LIURP WARM Bulbs</u></strong> are warranted for one year. They are to
                        be installed in lights used an average of 2 hours or more in a 24 hour period year
                        round - Maximum 12 for Met-Ed, Penelec, and Penn Power.
                        <br />--%>
                         Act 129 Bulbs are non-warranted CFLs. Install these bulbs in lights that are used
            an average of one (1) hour or more per day. Your goal is to install as many CFLs
            as possible in each customer's home.
                        
                        <br />
                        <%--<strong><u>Act 129 Bulbs</u></strong> are non-warranted CFLs. They are to be installed
                        in addition to the 12 CFLs covered under LIURP WARM. Install these bulbs in lights
                        that are on greater than 1 hour per day and less than 2 hours per day. Install specialty
                        CFLs in lights that are on greater than 2 hours per day. Your goal for Act 129 installations
                        is, whenever possible, to install at least 2 Act 129 bulbs/households, an <strong><u>
                            average</u></strong> of 4 per household - maximum 12 for Met-Ed, Penelec, and
                        Penn Power. For WPP a maximum of 24 bulbs can be installed using the Act 129 parameters;
                        however, your goal is to install as many CFLs as possible. Use a permanent marker
                        to mark Act 129 bulbs with NW (no warranty).--%>
                        <!-- form section -->
                        <div class="newtable">
                            <!--newtable begin-->
                              <div align="center">
                    <b>Note: All measures are required to be installed by the contractor.</b></div>
                            <h4 align="center" style="margin-top: 4px;margin-bottom: 4px;">
                                Standard Bulbs</h4><br />
                            <table width="100%" border="1" cellspacing="3" cellpadding="1">
                                <tr>
                                    <td width="100" colspan="2" >
                                       <%-- LIURP or --%>Act 129
                                    </td>
                                    <td width="52" style="border: 0 !important;">
                                    </td>
                                    <td width="162" colspan="4" >
                                        CFL Replacement Wattage
                                    </td>
                                    <td width="238" colspan="7" >
                                        Location
                                    </td>
                                    <td width="335" style="border: 0 !important;">
                                    </td>
                                </tr>
                                <tr>
                                   <%-- <th>
                                        <%--LIUR
                                    </th>--%>
                                    <th>
                                        Act 129
                                    </th>
                                    <th>
                                        # Install
                                    </th>
                                    <th>
                                        9-13
                                    </th>
                                    <th>
                                        14-16
                                    </th>
                                    <th>
                                        17-20
                                    </th>
                                    <th>
                                        21-25
                                    </th>
                                    <th>
                                        LR
                                    </th>
                                    <th>
                                        DR
                                    </th>
                                    <th>
                                        Kitch
                                    </th>
                                    <th>
                                        BR
                                    </th>
                                    <th>
                                        Bath
                                    </th>
                                    <th>
                                        Hall
                                    </th>
                                    <th>
                                        Other
                                    </th>
                                    <th>
                                        Location Specifics
                                        <br />
                                        (ie 2nd fl, rear, table lamp)
                                    </th>
                                    <th>
                                        WARM Measure Code
                                    </th>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line1_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CFL_9_13" runat="server" onclick="ReplaceWatage1(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CFL_14_16" runat="server" onclick="ReplaceWatage1(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CFL_17_20" runat="server" onclick="ReplaceWatage1(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CFL_21_25" runat="server" onclick="ReplaceWatage1(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CFL_LR" runat="server" onclick="Location1(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CFL_DR" runat="server" onclick="Location1(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CFL_Kitch" runat="server" onclick="Location1(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CFL_BR" runat="server" onclick="Location1(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CFL_Bath" runat="server" onclick="Location1(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CFL_Hall" runat="server" onclick="Location1(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CFL_Other" runat="server" onclick="Location1(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line2_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CFL_9_13" runat="server" onclick="ReplaceWatage2(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CFL_14_16" runat="server" onclick="ReplaceWatage2(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CFL_17_20" runat="server" onclick="ReplaceWatage2(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CFL_21_25" runat="server" onclick="ReplaceWatage2(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CFL_LR" runat="server" onclick="Location2(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CFL_DR" runat="server" onclick="Location2(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CFL_Kitch" runat="server" onclick="Location2(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CFL_BR" runat="server" onclick="Location2(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CFL_Bath" runat="server" onclick="Location2(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CFL_Hall" runat="server" onclick="Location2(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CFL_Other" runat="server" onclick="Location2(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line3_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CFL_9_13" runat="server" onclick="ReplaceWatage3(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CFL_14_16" runat="server" onclick="ReplaceWatage3(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CFL_17_20" runat="server" onclick="ReplaceWatage3(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CFL_21_25" runat="server" onclick="ReplaceWatage3(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CFL_LR" runat="server" onclick="Location3(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CFL_DR" runat="server" onclick="Location3(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CFL_Kitch" runat="server" onclick="Location3(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CFL_BR" runat="server" onclick="Location3(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CFL_Bath" runat="server" onclick="Location3(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CFL_Hall" runat="server" onclick="Location3(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CFL_Other" runat="server" onclick="Location3(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line4_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CFL_9_13" runat="server" onclick="ReplaceWatage4(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CFL_14_16" runat="server" onclick="ReplaceWatage4(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CFL_17_20" runat="server" onclick="ReplaceWatage4(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CFL_21_25" runat="server" onclick="ReplaceWatage4(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CFL_LR" runat="server" onclick="Location4(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CFL_DR" runat="server" onclick="Location4(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CFL_Kitch" runat="server" onclick="Location4(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CFL_BR" runat="server" onclick="Location4(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CFL_Bath" runat="server" onclick="Location4(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CFL_Hall" runat="server" onclick="Location4(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CFL_Other" runat="server" onclick="Location4(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line5_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CFL_9_13" runat="server" onclick="ReplaceWatage5(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CFL_14_16" runat="server" onclick="ReplaceWatage5(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CFL_17_20" runat="server" onclick="ReplaceWatage5(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CFL_21_25" runat="server" onclick="ReplaceWatage5(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CFL_LR" runat="server" onclick="Location5(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CFL_DR" runat="server" onclick="Location5(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CFL_Kitch" runat="server" onclick="Location5(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CFL_BR" runat="server" onclick="Location5(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CFL_Bath" runat="server" onclick="Location5(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CFL_Hall" runat="server" onclick="Location5(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CFL_Other" runat="server" onclick="Location5(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line6_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line6_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_CFL_9_13" runat="server" onclick="ReplaceWatage6(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_CFL_14_16" runat="server" onclick="ReplaceWatage6(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_CFL_17_20" runat="server" onclick="ReplaceWatage6(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_CFL_21_25" runat="server" onclick="ReplaceWatage6(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_CFL_LR" runat="server" onclick="Location6(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_CFL_DR" runat="server" onclick="Location6(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_CFL_Kitch" runat="server" onclick="Location6(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_CFL_BR" runat="server" onclick="Location6(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_CFL_Bath" runat="server" onclick="Location6(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_CFL_Hall" runat="server" onclick="Location6(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line6_CFL_Other" runat="server" onclick="Location6(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line6_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line6_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line7_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line7_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_CFL_9_13" runat="server" onclick="ReplaceWatage7(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_CFL_14_16" runat="server" onclick="ReplaceWatage7(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_CFL_17_20" runat="server" onclick="ReplaceWatage7(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_CFL_21_25" runat="server" onclick="ReplaceWatage7(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_CFL_LR" runat="server" onclick="Location7(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_CFL_DR" runat="server" onclick="Location7(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_CFL_Kitch" runat="server" onclick="Location7(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_CFL_BR" runat="server" onclick="Location7(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_CFL_Bath" runat="server" onclick="Location7(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_CFL_Hall" runat="server" onclick="Location7(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line7_CFL_Other" runat="server" onclick="Location7(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line7_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line7_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line8_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line8_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_CFL_9_13" runat="server" onclick="ReplaceWatage8(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_CFL_14_16" runat="server" onclick="ReplaceWatage8(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_CFL_17_20" runat="server" onclick="ReplaceWatage8(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_CFL_21_25" runat="server" onclick="ReplaceWatage8(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_CFL_LR" runat="server" onclick="Location8(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_CFL_DR" runat="server" onclick="Location8(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_CFL_Kitch" runat="server" onclick="Location8(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_CFL_BR" runat="server" onclick="Location8(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_CFL_Bath" runat="server" onclick="Location8(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_CFL_Hall" runat="server" onclick="Location8(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line8_CFL_Other" runat="server" onclick="Location8(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line8_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line8_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line9_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line9_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_CFL_9_13" runat="server" onclick="ReplaceWatage9(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_CFL_14_16" runat="server" onclick="ReplaceWatage9(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_CFL_17_20" runat="server" onclick="ReplaceWatage9(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_CFL_21_25" runat="server" onclick="ReplaceWatage9(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_CFL_LR" runat="server" onclick="Location9(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_CFL_DR" runat="server" onclick="Location9(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_CFL_Kitch" runat="server" onclick="Location9(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_CFL_BR" runat="server" onclick="Location9(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_CFL_Bath" runat="server" onclick="Location9(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_CFL_Hall" runat="server" onclick="Location9(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line9_CFL_Other" runat="server" onclick="Location9(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line9_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line9_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line10_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_CFL_9_13" runat="server" onclick="ReplaceWatage10(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_CFL_14_16" runat="server" onclick="ReplaceWatage10(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_CFL_17_20" runat="server" onclick="ReplaceWatage10(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_CFL_21_25" runat="server" onclick="ReplaceWatage10(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_CFL_LR" runat="server" onclick="Location10(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_CFL_DR" runat="server" onclick="Location10(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_CFL_Kitch" runat="server" onclick="Location10(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_CFL_BR" runat="server" onclick="Location10(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_CFL_Bath" runat="server" onclick="Location10(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_CFL_Hall" runat="server" onclick="Location10(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line10_CFL_Other" runat="server" onclick="Location10(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line10_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line11_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_CFL_9_13" runat="server" onclick="ReplaceWatage11(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_CFL_14_16" runat="server" onclick="ReplaceWatage11(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_CFL_17_20" runat="server" onclick="ReplaceWatage11(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_CFL_21_25" runat="server" onclick="ReplaceWatage11(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_CFL_LR" runat="server" onclick="Location11(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_CFL_DR" runat="server" onclick="Location11(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_CFL_Kitch" runat="server" onclick="Location11(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_CFL_BR" runat="server" onclick="Location11(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_CFL_Bath" runat="server" onclick="Location11(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_CFL_Hall" runat="server" onclick="Location11(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line11_CFL_Other" runat="server" onclick="Location11(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line11_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line12_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line12_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddStandardBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_CFL_9_13" runat="server" onclick="ReplaceWatage12(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_CFL_14_16" runat="server" onclick="ReplaceWatage12(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_CFL_17_20" runat="server" onclick="ReplaceWatage12(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_CFL_21_25" runat="server" onclick="ReplaceWatage12(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_CFL_LR" runat="server" onclick="Location12(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_CFL_DR" runat="server" onclick="Location12(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_CFL_Kitch" runat="server" onclick="Location12(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_CFL_BR" runat="server" onclick="Location12(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_CFL_Bath" runat="server" onclick="Location12(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_CFL_Hall" runat="server" onclick="Location12(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line12_CFL_Other" runat="server" onclick="Location12(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line12_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line12_WarmCode" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                           <br /> Number of Standard Bulbs Installed:
                            <asp:TextBox ID="txt_Standard_Bullbs" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                            <h4 align="center" style="margin-top: 0px;margin-bottom: 5px;">
                                <br />Specialty Bulbs</h4><br />
                            <table width="100%" border="1" cellspacing="4" cellpadding="1">
                                <tr>
                                    <td width="100" colspan="2" >
                                       <%-- LIURP or --%>Act 129
                                    </td>
                                    <td width="52" style="border: 0 !important">
                                    </td>
                                    <td width="70" colspan="2" >
                                        Bulb Type*
                                    </td>
                                    <td width="162" colspan="4" >
                                        CFL Replacement Wattage
                                    </td>
                                    <td width="250" colspan="7" >
                                        Location
                                    </td>
                                    <td width="235" style="border: 0 !important">
                                    </td>
                                </tr>
                                <tr>
                                    <%--<th>
                                        LIURP
                                    </th>--%>
                                    <th>
                                        Act 129
                                    </th>
                                    <th>
                                        # Install
                                    </th>
                                    <th>
                                        SB
                                    </th>
                                    <th>
                                        R/F
                                    </th>
                                    <th>
                                        2-9
                                    </th>
                                    <th>
                                        10-13
                                    </th>
                                    <th>
                                        14-16
                                    </th>
                                    <th>
                                        17-20
                                    </th>
                                    <th>
                                        21-25
                                    </th>
                                    <th>
                                        LR
                                    </th>
                                    <th>
                                        DR
                                    </th>
                                    <th>
                                        Kitch
                                    </th>
                                    <th>
                                        BR
                                    </th>
                                    <th>
                                        Bath
                                    </th>
                                    <th>
                                        Hall
                                    </th>
                                    <th>
                                        Other
                                    </th>
                                    <th>
                                        Location Specifics
                                        <br />
                                        (ie 2nd Fl, rear, table lamp)
                                    </th>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line13_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line13_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddSpecialBulb()" onkeydown="AddSpecialBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_SB" runat="server" onclick="BulbType13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_RF" runat="server" onclick="BulbType13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_2_9" runat="server" onclick="ReplaceWatage13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_10_13" runat="server" onclick="ReplaceWatage13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_14_16" runat="server" onclick="ReplaceWatage13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_17_20" runat="server" onclick="ReplaceWatage13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_21_25" runat="server" onclick="ReplaceWatage13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_LR" runat="server" onclick="Location13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_DR" runat="server" onclick="Location13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_Kitch" runat="server" onclick="Location13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_BR" runat="server" onclick="Location13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_Bath" runat="server" onclick="Location13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_Hall" runat="server" onclick="Location13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line13_CFL_Other" runat="server" onclick="Location13(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line13_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line14_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line14_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddSpecialBulb()" onkeydown="AddSpecialBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_SB" runat="server" onclick="BulbType14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_RF" runat="server" onclick="BulbType14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_2_9" runat="server" onclick="ReplaceWatage14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_10_13" runat="server" onclick="ReplaceWatage14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_14_16" runat="server" onclick="ReplaceWatage14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_17_20" runat="server" onclick="ReplaceWatage14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_21_25" runat="server" onclick="ReplaceWatage14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_LR" runat="server" onclick="Location14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_DR" runat="server" onclick="Location14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_Kitch" runat="server" onclick="Location14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_BR" runat="server" onclick="Location14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_Bath" runat="server" onclick="Location14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_Hall" runat="server" onclick="Location14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line14_CFL_Other" runat="server" onclick="Location14(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line14_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line15_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line15_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddSpecialBulb()" onkeydown="AddSpecialBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_SB" runat="server" onclick="BulbType15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_RF" runat="server" onclick="BulbType15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_2_9" runat="server" onclick="ReplaceWatage15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_10_13" runat="server" onclick="ReplaceWatage15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_14_16" runat="server" onclick="ReplaceWatage15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_17_20" runat="server" onclick="ReplaceWatage15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_21_25" runat="server" onclick="ReplaceWatage15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_LR" runat="server" onclick="Location15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_DR" runat="server" onclick="Location15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_Kitch" runat="server" onclick="Location15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_BR" runat="server" onclick="Location15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_Bath" runat="server" onclick="Location15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_Hall" runat="server" onclick="Location15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line15_CFL_Other" runat="server" onclick="Location15(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line15_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line16_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddSpecialBulb()" onkeydown="AddSpecialBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_SB" runat="server" onclick="BulbType16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_RF" runat="server" onclick="BulbType16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_2_9" runat="server" onclick="ReplaceWatage16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_10_13" runat="server" onclick="ReplaceWatage16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_14_16" runat="server" onclick="ReplaceWatage16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_17_20" runat="server" onclick="ReplaceWatage16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_21_25" runat="server" onclick="ReplaceWatage16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_LR" runat="server" onclick="Location16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_DR" runat="server" onclick="Location16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_Kitch" runat="server" onclick="Location16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_BR" runat="server" onclick="Location16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_Bath" runat="server" onclick="Location16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_Hall" runat="server" onclick="Location16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line16_CFL_Other" runat="server" onclick="Location16(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line16_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line17_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddSpecialBulb()" onkeydown="AddSpecialBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_SB" runat="server" onclick="BulbType17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_RF" runat="server" onclick="BulbType17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_2_9" runat="server" onclick="ReplaceWatage17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_10_13" runat="server" onclick="ReplaceWatage17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_14_16" runat="server" onclick="ReplaceWatage17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_17_20" runat="server" onclick="ReplaceWatage17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_21_25" runat="server" onclick="ReplaceWatage17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_LR" runat="server" onclick="Location17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_DR" runat="server" onclick="Location17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_Kitch" runat="server" onclick="Location17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_BR" runat="server" onclick="Location17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_Bath" runat="server" onclick="Location17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_Hall" runat="server" onclick="Location17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line17_CFL_Other" runat="server" onclick="Location17(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line17_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="display: none;">
                                        <asp:CheckBox ID="chk_Line18_LIURP" runat="server" Visible="false"/>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_Act129" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_Install" runat="server" Style="width: 50px; border: none;"
                                            onkeyup="AddSpecialBulb()" onkeydown="AddSpecialBulb()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_SB" runat="server" onclick="BulbType18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_RF" runat="server" onclick="BulbType18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_2_9" runat="server" onclick="ReplaceWatage18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_10_13" runat="server" onclick="ReplaceWatage18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_14_16" runat="server" onclick="ReplaceWatage18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_17_20" runat="server" onclick="ReplaceWatage18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_21_25" runat="server" onclick="ReplaceWatage18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_LR" runat="server" onclick="Location18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_DR" runat="server" onclick="Location18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_Kitch" runat="server" onclick="Location18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_BR" runat="server" onclick="Location18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_Bath" runat="server" onclick="Location18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_Hall" runat="server" onclick="Location18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line18_CFL_Other" runat="server" onclick="Location18(this.id)" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line18_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="100%" style="border: 0 !important;">
                            <br />
                            Number of Specialty Bulbs Installed:
                            <asp:TextBox ID="txt_SpecialtyBulbs" runat="server" Style="width: 30px; text-align: center;
                                border: none; border-bottom: solid 1px rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;
                            Number of Recessed and/or Flood Bulbs installed:
                            <asp:TextBox ID="txt_RecessedFlood" runat="server" Style="width: 30px; text-align: center;
                                border: none; border-bottom: solid 1px rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;
                            <%--<asp:RadioButton ID="rdo_FilterWhistle_Yes" runat="server" GroupName="FilterWhistle" />
                            Yes
                            <asp:RadioButton ID="rdo_FilterWhistle_No" runat="server" GroupName="FilterWhistle" />
                            No--%>
                            <%-- <br />
                            <br />--%>
                            <%--<strong>*Bulb type: Note the following - SB for General Specialty, R/F for Recessed
                                and/or Flood</strong><br />--%>
                            <%--<br />--%>
                            Number of Torchiers Installed:<asp:TextBox ID="txtTorchInstall" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 30px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><%--&nbsp;&nbsp;Number
                            of Other Speciality Bulbs Installed:--%><asp:TextBox ID="txtSpcltyBulbInstall" runat="server"
                                Visible="false" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 30px;
                                font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><br />
                            <br />
                            <!--table 1-->
                        </td>
                        <td style="border: 0 !important;" valign="top">
                            <!--table 2-->
                        </td>
                    </tr>
                </table>
                <p style="text-align: center">
                    <b><u>LED Bulbs </u></b>
                </p>
                <div class="newtable">
                <table cellpadding="0" cellspacing="1" border="1" >
                    <tr>
                        <td style="width: 40px">
                            <b>Total</b>
                        </td>
                        <td style="width: 40px">
                            <b>6-8 Standard</b>
                        </td>
                        <td style="width: 40px">
                            <b>9-13 Standard</b>
                        </td>
                        <td style="width: 40px">
                            <b>2.3 Globe</b>
                        </td>
                        <td style="width: 80px">
                            <b>3.5 Med-Base Torpedo</b>
                        </td>
                        <td style="width: 40px">
                            <b>3.7 - 4.8 Candelabra</b>
                        </td>
                        <td style="width: 40px">
                            <b>8 Flood</b>
                        </td>
                        <td style="width: 40px">
                            <b>13 - 14 Flood</b>
                        </td>
                        <td style="width: 40px">
                            <b>17 Flood</b>
                        </td>
                        <td>
                            <b>Location</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txt_Line1_Total" runat="server" Style="width: 100%; border: none;"
                                onkeyup="AddLedBulbs()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line1_68Standard" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line1_913Standard" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line1_23Globe" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line1_35MidBase" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line1_Candelabra" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line1_8Flood" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line1_13Flood" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line1_17Flood" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line1_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txt_Line2_Total" runat="server" Style="width: 100%; border: none;"
                                onkeyup="AddLedBulbs()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line2_68Standard" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line2_913Standard" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line2_23Globe" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line2_35MedBase" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line2_Candelabra" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line2_8Flood" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line2_13Flood" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line2_17Flood" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line2_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txt_Line3_Total" runat="server" Style="width: 100%; border: none;"
                                onkeyup="AddLedBulbs()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line3_68Standard" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line3_913Standard" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line3_23Globe" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line3_35MedBase" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line3_Candelabra" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line3_8Flood" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line3_13Flood" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line3_17Flood" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line3_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txt_Line4_Total" runat="server" Style="width: 100%; border: none;"
                                onkeyup="AddLedBulbs()"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line4_68Standard" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line4_913Standard" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line4_23Globe" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line4_35MedBase" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line4_Candelabra" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line4_8Flood" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line4_13Flood" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="Chk_Line4_17Flood" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Line4_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                Number of LED Bulbs Installed:<asp:TextBox ID="txt_TotalLedInstallBulb" runat="server"
                    Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 40px; text-align: center;
                    font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        </div>
                        </div> 
                    </div>
                    </div>
                  <br /><br />
                    <%--Page 4 End--%>
                    <%--Page 5 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                          
                        <div class="newtable">
                            <!--newtable begin-->
                            <h4 align="center">
                                Refrigerators<%--/Freezers--%></h4>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: -18px;padding:0px 15px">
                               <tr>
                    <td>
                        <span id="spn_freezersUsed" runat="server">Number of freezers used:</span><asp:TextBox
                            ID="txt_FreezersUsed" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 55px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr align="right">
                    <td>
                        Number of refrigerators used:<asp:TextBox ID="txt_RefrigeratorsUsed" runat="server"
                            Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 55px; font-weight: normal;
                            color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                               <%-- <tr align="right">
                                    
                                </tr>--%>
                            </table>
                            <p>
                                Test all units five years or older. If any unit was not tested, please use a web-based
                                database to determine annual usage.</p>
                           
                            <p>
                                <b>Existing Refrigerator and Freezer Testing Data</b></p>
                            <p>
                                kWh Guidelines for Replacement: Test units for as long as possible but factor the
                                test results back to a one hour reading. In order to meet the daily minimum guidelines
                                for replacement the kWh must reach the kWh/Hour Minimum listed below by the end
                                of one hour of monitoring. If at any time during the first hour of monitoring the
                                Brultech reaches the kWh/Hour Minimum, the tester will indicate that the refrigerator
                                is likely to qualify for replacement.</p>
                            <p>
                                
                                <p>
                                <b>To get KW/Hour test results:</b>
                                    Divide total kWh recorded by the monitor, by the number of minutes that the monitor
                                    has been on. Your answer will be the number of kWhs consumed per minute. Multiply
                                    this by 60 minutes to get the kWh usage for one hour. This is shown by the formula
                                    below. (Refer to chart on page 4-54 of the Policy and Procedures Manual)</p>
                                <p>
                    <span style="padding-left: 178px;"><u>Total kWhs recorded by monitor</u> = kWhs per
                        minute x 60 minutes = kWh per one hour</span>
                    <br />
                    <span style="padding-left: 182px;">Number of minutes monitored</span>
                </p>
                                <p align="center">
                                    <table width="50%" border="1" cellspacing="0" cellpadding="0" style="margin: 0 auto; margin-top:-10px;">
                                        <tr>
                                            <td align="center">
                                                <b>Refrigerator Size</b>
                                            </td>
                                            <td align="center">
                                                <b>kWh/Hour Minimum</b>
                                            </td>
                                            <td align="center">
                                                <b>Replacement Guideline</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                15 cu ft or less
                                            </td>
                                            <td align="center">
                                                .<%--104--%>08 kWh
                                            </td>
                                            <td align="center">
                                                15 cu ft
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                16 - 19 cu ft
                                            </td>
                                            <td align="center">
                                                .<%--130--%>10 kWh
                                            </td>
                                            <td align="center">
                                                17 or 18 cu ft
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                20 - 21 cu ft
                                            </td>
                                            <td align="center">
                                                .<%--140--%>11 kWh
                                            </td>
                                            <td align="center">
                                                21 cu ft
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                22 cu ft or larger
                                            </td>
                                            <td align="center">
                                                .<%--200--%>12 kWh
                                            </td>
                                            <td align="center">
                                                20 - 25 cu ft
                                            </td>
                                        </tr>
                                    </table>
                                    <p align="center">
                                        <b>
                                            
                                            Ambient Air Temperature Immediately Surrounding the Refrigerator during Testing
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                        
                                        
                                        </b>
                                    </p>
                                    <table width="50%" border="1" cellspacing="0" cellpadding="2" style="margin: 0 auto;
                                        margin-top: -10px;">
                                        <tr>
                                            <td align="center">
                                                5 degrees (or more) hotter than average
                                            </td>
                                            <td align="center">
                                                0.88 factor
                                            </td>
                                            <td rowspan="3">
                                                *If not known by customer,<br />
                                                use 70 degrees F
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                Average annual temperature for room*
                                            </td>
                                            <td align="center">
                                                1.00 Factor
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                5 degrees (or more) cooler than average
                                            </td>
                                            <td align="center">
                                                1.13 factor
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="tab" style="border: 1px solid #000; padding: 3px; margin-top: 5px;">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <b>Primary refrigerator:</b>
                                                </td>
                                                <td>
                                                    Location:<asp:TextBox ID="txt_PriRefrigerator_Location" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                                <td align="left">
                                                    Calculated Estimated Operating
                                                    <br />
                                                    Cost/Month. (Optional Info): $:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_PriRefrigerator_OperatingCost" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 55px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    Make:<asp:TextBox ID="txt_PriRefrigerator_Make" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    Model:<asp:TextBox ID="txt_PriRefrigerator_Model" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    Year:<asp:TextBox ID="txt_PriRefrigerator_Year" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    Size:<asp:TextBox ID="txt_PriRefrigerator_Size" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 40px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                        &nbsp;&nbsp;Type:
                                    <asp:CheckBox ID="Chk_PriRefrigerator_TopMount" runat="server" Text="Top Mount" onclick="PriRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_PriRefrigerator_BottomMount" runat="server" Text="Bottom Mount"
                                        onclick="PriRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_PriRefrigerator_SxS" runat="server" Text="SxS" onclick="PriRefrigeratorType(this.id)" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    Start Time:<asp:TextBox ID="txt_PriRefrigerator_StartTime" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    End Time:<asp:TextBox ID="txt_PriRefrigerator_EndTime" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td colspan="2">--%>&nbsp;&nbsp;
                                                    Total Time Monitored:<asp:TextBox ID="txt_PriRefrigerator_TotalTime" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 140px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                        &nbsp;&nbsp; Ice Maker?
                                    <asp:CheckBox ID="Chk_PriRefrigerator_IceMaker_Yes" runat="server" Text="Yes" onclick="PriRefrigerator_IceMaker(this.id)" />
                                    <asp:CheckBox ID="Chk_PriRefrigerator_IceMaker_No" runat="server" Text="No" onclick="PriRefrigerator_IceMaker(this.id)" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    kWh Monitor Reading:<asp:TextBox ID="txt_PriRefrigerator_Monitor" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                                <td>
                                                    kWh conversion at one hour:<asp:TextBox ID="txt_PriRefrigerator_Conversion" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    Is this unit eligible for </br>replacement?<asp:RadioButton ID="rdo_PriRefrigerator_Replacement_Yes"
                                                        runat="server" GroupName="PriRefrigerator_Replacement" />YES<asp:RadioButton ID="rdo_PriRefrigerator_Replacement_No"
                                                            runat="server" GroupName="PriRefrigerator_Replacement" />NO
                                                </td>
                                                <td>
                                                    Temperature inside fresh food:<asp:TextBox ID="txt_PriRefrigerator_TemperatureFood"
                                                        runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px;
                                                        font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Room Temperature:<asp:TextBox
                                                            ID="txt_PriRefrigerator_TemperatureRoom" runat="server" Style="border: none;
                                                            border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Temperature
                                                    inside freezer:<asp:TextBox ID="txt_PriRefrigerator_TemperatureFrezer" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chk_PriRefrigerator_DatabaseUsed" runat="server" />
                                                    Database Used? Replacement Size:
                                                    <asp:TextBox ID="txt_PriRefrigerator_ReplaceSize" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                    <asp:CheckBox ID="chk_PriRefrigerator_NotTest" runat="server" />
                                                    Did not test because
                                                    <asp:RadioButton ID="rdo_PriRefrigerator_NotTst_NotMove" runat="server" GroupName="PriRefrigerator_NotTst" />
                                                    Could not move
                                                    <asp:RadioButton ID="rdo_PriRefrigerator_NotTst_5Yr_Old" runat="server" GroupName="PriRefrigerator_NotTst" /><
                                                    5 years old
                                                    <asp:RadioButton ID="rdo_PriRefrigerator_NotTst_CustomerRefuse" runat="server" GroupName="PriRefrigerator_NotTst" />
                                                    Customer Refused new unit
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="tab" style="border: 1px solid #000; padding: 3px; margin-top: 5px;">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <b>Secondary Refrigerator:</b>
                                                </td>
                                                <td>
                                                    Location:<asp:TextBox ID="txt_SecoRefrigerator_Location" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                                <td align="left">
                                                    Calculated Estimated Operating </br>Cost/Month. (Optional Info): $:<asp:TextBox ID="txt_SecoRefrigerator_OperatingCost"
                                                        runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 55px;
                                                        font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" >
                                                    Make:<asp:TextBox ID="txt_SecoRefrigerator_Make" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    Model:<asp:TextBox ID="txt_SecoRefrigerator_Model" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    Year:<asp:TextBox ID="txt_SecoRefrigerator_Year" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    Size:<asp:TextBox ID="txt_SecoRefrigerator_Size" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 40px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                        &nbsp;&nbsp;Type:
                                    <asp:CheckBox ID="Chk_SecoRefrigerator_TopMount" runat="server" Text="Top Mount"
                                        onclick="SecRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_SecoRefrigerator_BottomMount" runat="server" Text="Bottom Mount"
                                        onclick="SecRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_SecoRefrigerator_SxS" runat="server" Text="SxS" onclick="SecRefrigeratorType(this.id)" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    Start Time:<asp:TextBox ID="txt_SecoRefrigerator_StartTime" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    End Time:<asp:TextBox ID="txt_SecoRefrigerator_EndTime" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td colspan="2">--%>&nbsp;&nbsp;
                                                    Total Time Monitored:<asp:TextBox ID="txt_SecoRefrigerator_TotalTime" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 140px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                        &nbsp;&nbsp; Ice Maker?
                                    <asp:CheckBox ID="Chk_SecoRefrigerator_IceMaker_Yes" runat="server" Text="Yes" onclick="SecRefrigerator_IceMaker(this.id)" />
                                    <asp:CheckBox ID="Chk_SecoRefrigerator_IceMaker_No" runat="server" Text="No" onclick="SecRefrigerator_IceMaker(this.id)" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    kWh Monitor Reading:<asp:TextBox ID="txt_SecoRefrigerator_Monitor" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                                <td>
                                                    kWh conversion at one hour:<asp:TextBox ID="txt_SecoRefrigerator_Conversion" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    Is this unit eligible </br> for replacement?<asp:RadioButton ID="rdo_SecoRefrigerator_Replacement_Yes"
                                                        runat="server" GroupName="SecoRefrigerator_Replacement" />YES<asp:RadioButton ID="rdo_SecoRefrigerator_Replacement_No"
                                                            runat="server" GroupName="SecoRefrigerator_Replacement" />NO
                                                </td>
                                                <td>
                                                    Temperature inside fresh food:<asp:TextBox ID="txt_SecoRefrigerator_TemperatureFood"
                                                        runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px;
                                                        font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Room Temperature:<asp:TextBox
                                                            ID="txt_SecoRefrigerator_TemperatureRoom" runat="server" Style="border: none;
                                                            border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Temperature
                                                    inside freezer:<asp:TextBox ID="txt_SecoRefrigerator_TemperatureFrezer" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chk_SecoRefrigerator_DatabaseUsed" runat="server" />
                                                    Database Used? Replacement Size
                                                    <asp:TextBox ID="txt_SecoRefrigerator_ReplacementSize" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                    <asp:CheckBox ID="chk_SecoRefrigerator_NotTest" runat="server" />
                                                    Did not test because
                                                    <asp:RadioButton ID="rdo_SecoRefrigerator_NotTest_NotMove" runat="server" GroupName="SecoRefrigerator_NotTest_Replacement" />
                                                    Could not move
                                                    <asp:RadioButton ID="rdo_SecoRefrigerator_NotTest_5Yr_Old" runat="server" GroupName="SecoRefrigerator_NotTest_Replacement" /><
                                                    5 years old
                                                    <asp:RadioButton ID="rdo_SecoRefrigerator_NotTest_CustomerRefuse" runat="server"
                                                        GroupName="SecoRefrigerator_NotTest_Replacement" />
                                                    Customer Refused new unit
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="tab" style="border: 1px solid #000; padding: 3px; margin-top: 5px;">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <b>Additional Refrigerator:</b>
                                                </td>
                                                <td>
                                                    Location:<asp:TextBox ID="txt_AddRefrigerator_Location" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                                <td align="left">
                                                    Calculated Estimated Operating </br>Cost/Month. (Optional Info): $:<asp:TextBox ID="txt_AddRefrigerator_OperatingCost"
                                                        runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 55px;
                                                        font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    Make:<asp:TextBox ID="txt_AddRefrigerator_Make" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    Model:<asp:TextBox ID="txt_AddRefrigerator_Model" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    Year:<asp:TextBox ID="txt_AddRefrigerator_Year" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    Size:<asp:TextBox ID="txt_AddRefrigerator_Size" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 40px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                        &nbsp;&nbsp;Type:
                                    <asp:CheckBox ID="Chk_AddRefrigerator_TopMount" runat="server" Text="Top Mount" onclick="AddRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_AddRefrigerator_BottomMount" runat="server" Text="Bottom Mount"
                                        onclick="AddRefrigeratorType(this.id)" />
                                    <asp:CheckBox ID="Chk_AddRefrigerator_SxS" runat="server" Text="SxS" onclick="AddRefrigeratorType(this.id)" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    Start Time:<asp:TextBox ID="txt_AddRefrigerator_StartTime" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td>--%>&nbsp;&nbsp;
                                                    End Time:<asp:TextBox ID="txt_AddRefrigerator_EndTime" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                <%--</td>
                                                <td colspan="2">--%>&nbsp;&nbsp;
                                                    Total Time Monitored:<asp:TextBox ID="txt_AddRefrigerator_TotalTime" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 140px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                        &nbsp;&nbsp; Ice Maker?
                                    <asp:CheckBox ID="Chk_AddRefrigerator_IceMaker_Yes" runat="server" Text="Yes" onclick="AddRefrigerator_IceMaker(this.id)" />
                                    <asp:CheckBox ID="Chk_AddRefrigerator_IceMaker_No" runat="server" Text="No" onclick="AddRefrigerator_IceMaker(this.id)" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    kWh Monitor Reading:<asp:TextBox ID="txt_AddRefrigerator_Monitor" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                                <td>
                                                    kWh conversion at one hour:<asp:TextBox ID="txt_AddRefrigerator_Conversion" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    Is this unit eligible</br> for replacement?<asp:RadioButton ID="rdo_AddRefrigerator_Replacement_Yes"
                                                        runat="server" GroupName="AddRefrigerator_Replacement" />YES<asp:RadioButton ID="rdo_AddRefrigerator_Replacement_No"
                                                            runat="server" GroupName="AddRefrigerator_Replacement" />NO
                                                </td>
                                                <td>
                                                    Temperature inside fresh food:<asp:TextBox ID="txt_AddRefrigerator_TemperatureFood"
                                                        runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px;
                                                        font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Room Temperature:<asp:TextBox
                                                            ID="txt_AddRefrigerator_TemperatureRoom" runat="server" Style="border: none;
                                                            border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>Temperature
                                                    inside freezer:<asp:TextBox ID="txt_AddRefrigerator_TemperatureFrezer" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chk_AddRefrigerator_DatabaseUsed" runat="server" />Database used?
                                                    Replacement size
                                                    <asp:TextBox ID="txt_AddRefrigerator_ReplacementSize" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);"
                                                        Width="50px"></asp:TextBox>
                                                    <asp:CheckBox ID="chk_AddRefrigerator_NotTest" runat="server" />
                                                    Did not test because
                                                    <asp:RadioButton ID="rdo_AddRefrigerator_NotTest_NotMove" runat="server" GroupName="AddRefrigerator_NotTest" />
                                                    Could not move
                                                    <asp:RadioButton ID="rdo_AddRefrigerator_NotTest_5Yr_Old" runat="server" GroupName="AddRefrigerator_NotTest" />
                                                    < 5years old
                                                    <asp:RadioButton ID="rdo_AddRefrigerator_NotTest_CustomerRefuse" runat="server" GroupName="AddRefrigerator_NotTest" />
                                                    Customer Refused new unit
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                        </div>
                        <b>If space is needed for additional refrigerators, please use comment section on next
                            page.</b>
                    </div>
                    <br />
                    <br />
                    <%--Page 5 End--%>
                    <%--Page 6 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <div class="newtable">
                            <h4 align="center">
                                Freezers</h4>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr align="right" id="tr_freezersUsed" runat="server">
                                    <td>
                                        Number of freezers used:<asp:TextBox ID="txt_FreezersUsed6" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 55px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table width="80%" border="1" cellspacing="0" cellpadding="5" style="margin: 0 auto;">
                                <tr>
                                    <td align="center">
                                        <b>Existing Freezer Type</b>
                                    </td>
                                    <td align="center">
                                        <b>Existing Freezer Size</b>
                                    </td>
                                    <td align="center">
                                        <b>If existing one hour of use is:</b>
                                    </td>
                                    <td align="center">
                                        <b>Then</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Chest
                                    </td>
                                    <td align="center">
                                        Less than 8 cf
                                    </td>
                                    <td align="center">
                                        Greater than .064 kWh
                                    </td>
                                    <td align="center">
                                        Replace existing unit
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Chest
                                    </td>
                                    <td align="center">
                                        8.1 to 12.9 cf
                                    </td>
                                    <td align="center">
                                        Greater than .084 kWh
                                    </td>
                                    <td align="center">
                                        Replace existing unit
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Chest
                                    </td>
                                    <td align="center">
                                        13 to 15.5 cf
                                    </td>
                                    <td align="center">
                                        Greater than .103 kWh
                                    </td>
                                    <td align="center">
                                        Replace existing unit
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Chest
                                    </td>
                                    <td align="center">
                                        15.6 cf or larger
                                    </td>
                                    <td align="center">
                                        Greater than .154 kWh
                                    </td>
                                    <td align="center">
                                        Replace existing unit
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Upright
                                    </td>
                                    <td align="center">
                                        Less than 10 cf
                                    </td>
                                    <td align="center">
                                        Greater than .074 kWh
                                    </td>
                                    <td align="center">
                                        Replace existing unit
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Upright
                                    </td>
                                    <td align="center">
                                        10.1 to 12.9 cf
                                    </td>
                                    <td align="center">
                                        Greater than .103 kWh
                                    </td>
                                    <td align="center">
                                        Replace existing unit
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Upright
                                    </td>
                                    <td align="center">
                                        13 to 15.5 cf
                                    </td>
                                    <td align="center">
                                        Greater than .123 kWh
                                    </td>
                                    <td align="center">
                                        Replace existing unit
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Upright
                                    </td>
                                    <td align="center">
                                        15.6 or larger
                                    </td>
                                    <td align="center">
                                        Greater than .154 kWh
                                    </td>
                                    <td align="center">
                                        Replace existing unit
                                    </td>
                                </tr>
                            </table>
                            <div class="tab" style="border: 1px solid #000; padding: 10px; margin-top: 20px;">
                                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <b>Primary Freezer:</b>
                                        </td>
                                        <td>
                                            Location:<asp:TextBox ID="txt_PriFrezer_Location" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            Calculated Estimated Operating<br />
                                            Cost/Month. (Optional Info): $:<asp:TextBox ID="txt_PriFrezer_OperatingCost" runat="server"
                                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 55px; font-weight: normal;
                                                color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            Make:<asp:TextBox ID="txt_PriFrezer_Make" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <%--</td>
                                            <td>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Model:<asp:TextBox ID="txt_PriFrezer_Model"
                                                runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px;
                                                font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <%--   </td>
                                            <td>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Year:<asp:TextBox ID="txt_PriFrezer_Year"
                                                runat="server" Width="50px" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <%--  </td>
                                            <td>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size:<asp:TextBox ID="txt_PriFrezer_Size"
                                                runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px;
                                                font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdoPrimaryUpright" runat="server" Text="Upright" GroupName="PrimaryUpright" />&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdoPrimaryChest" runat="server" Text="Chest" GroupName="PrimaryUpright" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            Start Time:<asp:TextBox ID="txt_PriFrezer_StartTime" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        <%--</td>
                                        <td>--%>
                                            End Time:<asp:TextBox ID="txt_PriFrezer_EndTime" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        <%--</td>
                                        <td colspan="2">--%>
                                            Total Time Monitored:<asp:TextBox ID="txt_PriFrezer_TotalTime" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 140px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                Frost Free?
                            <asp:CheckBox ID="chk_PriFrezer_FrostFree_Yes" runat="server" Text="Yes" onclick="PriFrezer_FrostFree(this.id)" />
                            <asp:CheckBox ID="chk_PriFrezer_FrostFree_No" runat="server" Text="No" onclick="PriFrezer_FrostFree(this.id)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            kWh Monitor Reading:<asp:TextBox ID="txt_PriFrezer_Monitor" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                        <td>
                                            kWh conversion at one hour:<asp:TextBox ID="txt_PriFrezer_Conversion" runat="server"
                                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                                color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="padding: 9px 0;">
                                            Is this unit eligible
                                            <br />
                                            for replacement?<asp:RadioButton ID="rdo_PriFrezer_Replacement_Yes" runat="server"
                                                GroupName="PriFrezer_Replacement" />YES<asp:RadioButton ID="rdo_PriFrezer_Replacement_No"
                                                    runat="server" GroupName="PriFrezer_Replacement" />NO
                                        </td>
                                        <td style="padding: 9px 0;">
                                            <%--Temperature inside fresh food:--%><asp:TextBox ID="txt_PriFrezer_TemperatureFood"
                                                runat="server" Visible="false" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            Room Temperature:<asp:TextBox ID="txt_PriFrezer_TemperatureRoom" runat="server" Width="50px"
                                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                                color: rgb(0, 0, 0);"></asp:TextBox>
                                            Temperature inside freezer:<asp:TextBox ID="txt_PriFrezer_TemperatureFrezer" runat="server"
                                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                                color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chk_PriFrezer_DatabseUsed" runat="server" />
                                            Database Used? Replacement Size:
                                            <asp:TextBox ID="txt_PriFrezer_ReplacementSize" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <asp:CheckBox ID="chk_PriFrezer_NotTst" runat="server" />
                                            Did not test because
                                            <asp:RadioButton ID="rdo_PriFrezer_NotTst_NotMove" runat="server" GroupName="PriFrezer_NotTst" />
                                            Could not move
                                            <asp:RadioButton ID="rdo_PriFrezer_NotTst_5Yr_Old" runat="server" GroupName="PriFrezer_NotTst" /><
                                            5 years old
                                            <asp:RadioButton ID="rdo_PriFrezer_NotTst_CustomerRefuse" runat="server" GroupName="PriFrezer_NotTst" />
                                            Customer Refused new unit
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="tab" style="border: 1px solid #000; padding: 10px; margin-top: 20px;">
                                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <b>Secondary Freezer:</b>
                                        </td>
                                        <td>
                                            Location:<asp:TextBox ID="txt_SecoFrezer_Location" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            Calculated Estimated Operating<br />
                                            Cost/Month. (Optional Info): $:<asp:TextBox ID="txt_SecoFrezer_OperatingCost" runat="server"
                                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 55px; font-weight: normal;
                                                color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            Make:<asp:TextBox ID="txt_SecoFrezer_Make" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <%--</td>
                                            <td>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Model:<asp:TextBox ID="txt_SecoFrezer_Model"
                                                runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px;
                                                font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <%--</td>
                                            <td>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Year:<asp:TextBox ID="txt_SecoFrezer_year"
                                                runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px;
                                                font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <%--</td>
                                            <td>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size:<asp:TextBox ID="txt_SecoFrezer_Size"
                                                runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px;
                                                font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdo_SecondryUpright" runat="server" Text="Upright" GroupName="SecondryUpright" />&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdoSecondryChest" runat="server" Text="Chest" GroupName="SecondryUpright" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            Start Time:<asp:TextBox ID="txt_SecoFrezer_StartTime" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        <%--</td>
                                        <td>--%>
                                            End Time:<asp:TextBox ID="txt_SecoFrezer_EndTime" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        <%--</td>
                                        <td colspan="2">--%>
                                            Total Time Monitored:<asp:TextBox ID="txt_SecoFrezer_TotalTime" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 140px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                Frost Free?
                            <asp:CheckBox ID="Chk_SecoFrezer_FrostFree_Yes" runat="server" Text="Yes" onclick="SecoFrezer_FrostFree(this.id)" />
                            <asp:CheckBox ID="Chk_SecoFrezer_FrostFree_No" runat="server" Text="No" onclick="SecoFrezer_FrostFree(this.id)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            kWh Monitor Reading:<asp:TextBox ID="txt_SecoFrezer_Monitor" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                        <td>
                                            kWh conversion at one hour:<asp:TextBox ID="txt_SecoFrezer_Conversion" runat="server"
                                                Width="100px" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px;
                                                font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="padding: 9px 0;">
                                            Is this unit eligible
                                            <br />
                                            for replacement?<asp:RadioButton ID="rdo_SecoFrezer_Replacement_Yes" runat="server"
                                                GroupName="SecoFrezer_Replacement" />YES<asp:RadioButton ID="rdo_SecoFrezer_Replacement_No"
                                                    runat="server" GroupName="SecoFrezer_Replacement" />NO
                                        </td>
                                        <td style="padding: 9px 0;">
                                            <!-- Temperature inside</b> fresh food: -->
                                            <asp:TextBox ID="txt_SecoFrezer_TemperactureFood" runat="server" Visible="false"
                                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                                color: rgb(0, 0, 0);"></asp:TextBox>
                                            Room Temperature:<asp:TextBox ID="txt_SecoFrezer_TemperactureRoom" runat="server"
                                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                                color: rgb(0, 0, 0);"></asp:TextBox>
                                            Temperature inside freezer:<asp:TextBox ID="txt_SecoFrezer_TemperactureFrezer" runat="server"
                                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                                color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chk_SecoFrezer_DatabseUsed" runat="server" />
                                            Database Used? Replacement Size:
                                            <asp:TextBox ID="txt_SecoFrezer_ReplacementSize" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <asp:CheckBox ID="chk_SecoFrezer_NotTst" runat="server" />
                                            Did not test because:
                                            <asp:RadioButton ID="rdo_SecoFrezer_NotTst_NotMove" runat="server" GroupName="SecoFrezer_NotTst" />
                                            Could not move
                                            <asp:RadioButton ID="rdo_SecoFrezer_NotTst_5Yr_Old" runat="server" GroupName="SecoFrezer_NotTst" /><
                                            5 years old
                                            <asp:RadioButton ID="rdo_SecoFrezer_NotTst_CustomerRefuse" runat="server" GroupName="SecoFrezer_NotTst" />
                                            Customer Refused new unit
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="tab" style="border: 1px solid #000; padding: 10px; margin-top: 20px;">
                                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <b>Additional Freezer:</b>
                                        </td>
                                        <td>
                                            Location:<asp:TextBox ID="txt_AddFrezer_Location" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            Calculated Estimated Operating</br> Cost/Month. (Optional Info): $:<asp:TextBox ID="txt_AddFrezer_OperatingCost"
                                                runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 55px;
                                                font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            Make:<asp:TextBox ID="txt_AddFrezer_Make" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <%--</td>
                                            <td>--%>
                                            Model:<asp:TextBox ID="txt_AddFrezer_Model" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <%--</td>
                                            <td>--%>
                                            Year:<asp:TextBox ID="txt_AddFrezer_Year" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <%--</td>
                                            <td>--%>
                                            Size:<asp:TextBox ID="txt_AddFrezer_Size" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdoAdditionalUpright" runat="server" Text="Upright" GroupName="AdditionalUpright" />&nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdoAdditionalChest" runat="server" Text="Chest" GroupName="AdditionalUpright" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            Start Time:<asp:TextBox ID="txt_AddFrezer_StartTime" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        <%--</td>
                                        <td>--%>
                                            End Time:<asp:TextBox ID="txt_AddFrezer_EndTime" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        <%--</td>
                                        <td colspan="2">--%>
                                            Total Time Monitored:<asp:TextBox ID="txt_AddFrezer_TotalTime" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 140px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                Frost Free?
                            <asp:CheckBox ID="Chk_AddFrezer_FrostFree_Yes" runat="server" Text="Yes" onclick="AddFrezer_FrostFree(this.id)" />
                            <asp:CheckBox ID="Chk_AddFrezer_FrostFree_No" runat="server" Text="No" onclick="AddFrezer_FrostFree(this.id)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            kWh Monitor Reading:<asp:TextBox ID="txt_AddFrezer_Monitor" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                        <td>
                                            kWh conversion at one hour:<asp:TextBox ID="txt_AddFrezer_Conversion" runat="server"
                                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal;
                                                color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="padding: 9px 0;">
                                            Is this unit eligible</br> for replacement?<asp:RadioButton ID="rdo_AddFrezer_Replacement_Yes"
                                                runat="server" GroupName="AddFrezer_Replacement" />YES<asp:RadioButton ID="rdo_AddFrezer_Replacement_No"
                                                    runat="server" GroupName="AddFrezer_Replacement" />NO
                                        </td>
                                        <td style="padding: 9px 0;">
                                            <%--Temperature inside fresh food:--%><asp:TextBox ID="txt_AddFrezer_TemperatureFood"
                                                runat="server" Visible="false" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            Room Temperature:<asp:TextBox ID="txt_AddFrezer_TemperatureRoom" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            Temperature inside freezer:<asp:TextBox ID="txt_AddFrezer_TemperatureFrezer" runat="server"
                                                Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal;
                                                color: rgb(0, 0, 0);"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chk_AddFrezer_DatabseUsed" runat="server" />
                                            Database Used? Replacement Size:
                                            <asp:TextBox ID="txt_AddFrezer_ReplacementSize" runat="server" Style="border: none;
                                                border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            <asp:CheckBox ID="chk_AddFrezer_NotTst" runat="server" />
                                            Did not test because
                                            <asp:RadioButton ID="rdo_AddFrezer_NotTst_NotMove" runat="server" GroupName="AddFrezer_NotTst" />
                                            Could not move
                                            <asp:RadioButton ID="rdo_AddFrezer_NotTst_5Yr_Old" runat="server" GroupName="AddFrezer_NotTst" />
                                            < 5 years old
                                            <asp:RadioButton ID="rdo_AddFrezer_NotTst_CustomerRefuse" runat="server" GroupName="AddFrezer_NotTst" />
                                            Customer Refused new unit
                                        </td>
                                    </tr>
                                </table>
                                 <br />
                                    <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                     <tr>
                                            
                                            <td width="20%">
                                                 Comments:<br />
                                    Utilize this space to<br />
                                    indicate readings for<br />
                                    additional<br />
                                    refrigerators/freezers<br />
                                    monitored in the<br />
                                    home.

                                            </td>
                                            <td width="79%">
                                                <asp:TextBox ID="txt_Refrigerators_Freezers" runat="server" TextMode="MultiLine"
                                        Width="100%" Height="80px"></asp:TextBox>
                                            </td>
                                        </tr>
                                   </table>

                            </div>
                            <%--<p style="float: left; width: 15% !important;">
                                Comments:<br />
                                Utilize this space to<br />
                                indicate readings for<br />
                                additional<br />
                                refrigerators/freezers<br />
                                monitored in the<br />
                                home.</p>
                            <p style="float: right; width: 85% !important;">
                                <asp:TextBox ID="txt_Refrigerators_Freezers" runat="server" TextMode="MultiLine"
                                    Width="97%" Height="180px"></asp:TextBox>
                            </p>--%>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <%--Page 6 End--%>

                    <%--Page 7 start--%>
                    
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin-top: -19px;
                        position: relative;">
                        <p align="left">
                            <b>Washer and Dryer Assessment</b>
                        </p>
                        <div class="tab" style="border: 1px solid #000; float: left; width: 100%; margin-bottom: 20px;
                            border-top: 0px;">
                            <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        Number of washer loads per week: &nbsp;
                                        <asp:TextBox ID="txt_WasherLoadWeek" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    </td>
                                    <td>
                                        Water Heater Type: &nbsp;
                                        <asp:RadioButton ID="rdo_WaterHeater_Electric" runat="server" GroupName="WaterHeater" />
                                        Electric &nbsp;
                                        <asp:RadioButton ID="rdo_WaterHeater_Gas" runat="server" GroupName="WaterHeater" />
                                        Gas
                                    </td>
                                </tr>
                            </table>
                            <table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
                                <tr style="margin-top: 5px;">
                                    <td>
                                        What temperature settings do you currently use?
                                        <asp:CheckBox ID="chk_HotWash" runat="server" onclick="ChkBox_TempratureSetting(this.id)" />
                                        Hot Wash/Cold Rinse
                                        <asp:CheckBox ID="chk_WarmWash" runat="server" onclick="ChkBox_TempratureSetting(this.id)" />
                                        Warm Wash/Cold Rinse
                                        <asp:CheckBox ID="chk_ColdWash" runat="server" onclick="ChkBox_TempratureSetting(this.id)" />
                                        Cold Wash/Cold Rinse
                                        <asp:CheckBox ID="chk_OtherWash" runat="server" onclick="ChkBox_TempratureSetting(this.id)" />
                                        Other
                                        <asp:TextBox ID="txt_Temperature_Other" Visible="false" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            font-size: 11px; text-align: left; -webkit-width: 20%; !important; -moz-width: 35%;
                                            !important; width: 10%; !important; width: 10%; !important; width: 10%; !important;"></asp:TextBox><%--Width="40px"--%>
                                    </td>
                                </tr>
                            </table>
                            <div style="width: 100%;">
                                <p style="float: left; width: 15% !important;">
                                    &nbsp; Washer comments (if water heater is electric) &nbsp; &nbsp;
                                    <p style="float: right; width: 85% !important;">
                                        &nbsp; &nbsp;
                                        <asp:TextBox ID="txt_WasherComment" runat="server" TextMode="MultiLine" Width="93%"
                                            Height="50px"></asp:TextBox>
                                    </p>
                                </p>
                            </div>
                            <br />
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        Number of electric dryer loads per week: &nbsp;
                                        <asp:TextBox ID="txt_ElectricDrayerLoadWeek" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        How long does it take to dry a load?
                                        <asp:TextBox ID="txt_DryALoad" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        Dryer Type:
                                        <asp:RadioButton ID="rdo_DryerType_Electic" runat="server" GroupName="DryerType" />
                                        Electic
                                        <asp:RadioButton ID="rdo_DryerType_Gas" runat="server" GroupName="DryerType" />
                                        Gas H&S Only
                                    </td>
                                </tr>
                                <br />
                                <tr>
                                    <td>
                                        &nbsp; Is dryer vented properly? &nbsp;
                                        <asp:RadioButton ID="rdo_DryerVented_Yes" runat="server" GroupName="DryerVented" />
                                        &nbsp; Yes &nbsp;
                                        <asp:RadioButton ID="rdo_DryerVented_No" runat="server" GroupName="DryerVented" />
                                        &nbsp; No
                                    </td>
                                    &nbsp; &nbsp;&nbsp;
                                </tr>
                            </table>
                            <br />
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        &nbsp; <strong>Dryer venting details:</strong> Venting location &nbsp;
                                        <asp:TextBox ID="txt_DryerVenting_Location" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;Venting done for H&S?&nbsp;&nbsp;<asp:RadioButton ID="rdo_VentinYes"
                                            GroupName="Venting" runat="server" />Yes&nbsp;<asp:RadioButton ID="rdo_VentinNo"
                                                runat="server" GroupName="Venting" />No
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        &nbsp;
                                        <asp:RadioButton ID="rdo_MakeNewHole" runat="server" GroupName="make" />
                                        Make a new hole &nbsp;
                                        <asp:RadioButton ID="rdo_DryerUseExistingHole" runat="server" GroupName="make" />
                                        Vent the dryer out using an existing hole &nbsp; &nbsp; &nbsp; Approx # of feet
                                        <asp:TextBox ID="txt_ExistingHole_Feet" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        # of elbows:
                                        <asp:TextBox ID="txt_ExistingHole_Elbows" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                        <asp:CheckBox ID="chk_NewVentCap" runat="server" />
                                        &nbsp; Add new vent cap/hood
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <br />
                                        &nbsp; <strong>Semi-Rigid Aluminum Flex used. Why?</strong> &nbsp;
                                        <asp:TextBox ID="txt_AluminumFlexUsed" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 500px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                                <tr>
                                    <td>
                                        &nbsp; Would a clothesline be cost effective?&nbsp;
                                        <asp:RadioButton ID="rdo_ClothesCostEffect_Yes" runat="server" GroupName="ClothesCostEffect" />
                                        Yes &nbsp;
                                        <asp:RadioButton ID="rdo_ClothesCostEffect_No" runat="server" GroupName="ClothesCostEffect" />
                                        No &nbsp; Is one being installed? &nbsp;
                                        <asp:RadioButton ID="rdo_BeingInstall_Yes" runat="server" GroupName="BeingInstall" />
                                        Yes &nbsp;
                                        <asp:RadioButton ID="rdo_BeingInstall_No" runat="server" GroupName="BeingInstall" />
                                        No
                                    </td>
                                </tr>
                            </table>
                            <div style="width: 100%;">
                                <p style="float: left; width: 15% !important;">
                                    &nbsp; Other drying issues: &nbsp; &nbsp;
                                </p>
                                <p style="float: left; width: 85% !important;">
                                    &nbsp; &nbsp;
                                    <asp:TextBox ID="txt_OtherDryIssue" runat="server" TextMode="MultiLine" Width="93%"
                                        Height="50px"></asp:TextBox>
                                </p>
                            </div>
                        </div>
                        <br />
                        <p align="left">
                            <b>Fossil Fuel Heating Systems
                                <%--and General AC Maintenance--%></b>
                        </p>
                        <div class="tab" style="border: 1px solid #000; float: left; width: 100%;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                                <tr>
                                    <td style="width: 73%;">
                                        New filter(s) installed in the heating system? &nbsp;
                                        <asp:RadioButton ID="rdo_NewFilterInstal1_Yes" runat="server" GroupName="NewFilterInstal1"
                                            Style="margin: -10px;" />
                                        &nbsp; Yes &nbsp;
                                        <asp:RadioButton ID="rdo_NewFilterInstal1_No" runat="server" GroupName="NewFilterInstal1"
                                            Style="margin: -10px;" />
                                        &nbsp; No &nbsp; Number installed:
                                        <asp:TextBox ID="txt_NumberNewFilterInstal1" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                    <td rowspan="2" valign="top">
                                        Filter Dimensions: &nbsp;
                                        <asp:TextBox ID="txt_FilterDimensions1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;Filter(s) to be cleaned in the heating system? &nbsp;
                                        <asp:RadioButton ID="rdo_NewFilterInstal2_Yes" runat="server" GroupName="NewFilterInstal2"
                                            Style="margin: -10px;" />
                                        &nbsp; Yes &nbsp;
                                        <asp:RadioButton ID="rdo_NewFilterInstal2_No" runat="server" GroupName="NewFilterInstal2"
                                            Style="margin: -10px;" />
                                        &nbsp; No &nbsp; Number cleaned:
                                        <asp:TextBox ID="txt_NumberNewFilterInstal2" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr id="tr_InstallCentralAC" runat="server">
                                    <td style="width: 73%;">
                                        &nbsp;New filter(s) installed in the central/window AC(s)? &nbsp;
                                        <asp:RadioButton ID="rdo_NewFilterACInstal_Yes" runat="server" GroupName="NewFilterACInstal"
                                            Style="margin: -10px;" />
                                        &nbsp; Yes &nbsp;
                                        <asp:RadioButton ID="rdo_NewFilterACInstal_No" runat="server" GroupName="NewFilterACInstal"
                                            Style="margin: -10px;" />
                                        &nbsp; No &nbsp; Number installed:
                                        <asp:TextBox ID="txt_NumberNewFilterACInstal" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                    <td rowspan="2" valign="top">
                                        Filter Dimensions: &nbsp;
                                        <asp:TextBox ID="txt_FilterDimensions2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr id="tr_CentralWindowAC" runat="server">
                                    <td>
                                        &nbsp;Filter(s) to be cleaned in the central/window AC(s)? &nbsp;
                                        <asp:RadioButton ID="rdo_NewFilterInstal3_Yes" runat="server" GroupName="NewFilterInstal3"
                                            Style="margin: -10px;" />
                                        &nbsp; Yes &nbsp;
                                        <asp:RadioButton ID="rdo_NewFilterInstal3_No" runat="server" GroupName="NewFilterInstal3"
                                            Style="margin: -10px;" />
                                        &nbsp; No &nbsp; Number cleaned:
                                        <asp:TextBox ID="txt_NumberNewFilterInstal3" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;Is filter slot covered? &nbsp;
                                        <asp:RadioButton ID="rdo_slotCovered_yes" runat="server" GroupName="slotCovered"
                                            Style="margin: -10px;" />
                                        &nbsp; Yes &nbsp;
                                        <asp:RadioButton ID="rdo_slotCovered_no" runat="server" GroupName="slotCovered" Style="margin: -10px;" />
                                        &nbsp; No &nbsp;
                                        <asp:RadioButton ID="rdo_slotCovered_na" runat="server" GroupName="slotCovered" Style="margin: -10px;" />
                                        &nbsp; N/A &nbsp; if no, install cover.
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                        </div>
                        <br />
                        <br />
                        <p align="left">
                            <b>Other</b>
                        </p>
                        <div class="tab" style="border: 1px solid #000; width: 100%;">
                            <br />
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                                <tr>
                                    <td>
                                        &nbsp; Well Pump used?
                                        <asp:RadioButton ID="rdo_WellPumpUsed_Yes" runat="server" GroupName="WellPumpUsed" />
                                        Yes
                                        <asp:RadioButton ID="rdo_WellPumpUsed_No" runat="server" GroupName="WellPumpUsed" />
                                        No Water leaks?
                                        <asp:RadioButton ID="rdo_WaterLeaks_Yes" runat="server" GroupName="WaterLeaks" />
                                        Yes
                                        <asp:RadioButton ID="rdo_WaterLeaks_No" runat="server" GroupName="WaterLeaks" />
                                        No &nbsp; Dehumidifier used?
                                        <asp:RadioButton ID="rdo_DehumidifierUsed_Yes" runat="server" GroupName="DehumidifierUsed" />
                                        Yes
                                        <asp:RadioButton ID="rdo_DehumidifierUsed_No" runat="server" GroupName="DehumidifierUsed" />
                                        No &nbsp; Pool pump used?
                                        <asp:RadioButton ID="rdo_PoolPumpUsed_Yes" runat="server" GroupName="PoolPumpUsed" />
                                        Yes
                                        <asp:RadioButton ID="rdo_PoolPumpUsed_No" runat="server" GroupName="PoolPumpUsed" />
                                        No &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp; Septic system grinders? &nbsp;
                                        <asp:RadioButton ID="rdo_SepticSystemGrinders_Yes" runat="server" GroupName="SepticSystemGrinders" />
                                        Yes &nbsp;
                                        <asp:RadioButton ID="rdo_SepticSystemGrinders_No" runat="server" GroupName="SepticSystemGrinders" />
                                        No &nbsp; Are you willing to replace waterbed(s)? &nbsp;
                                        <asp:RadioButton ID="rdo_ReplaceWaterbed_Yes" runat="server" GroupName="ReplaceWaterbed" />
                                        Yes &nbsp;
                                        <asp:RadioButton ID="rdo_ReplaceWaterbed_No" runat="server" GroupName="ReplaceWaterbed" />
                                        No &nbsp;
                                        <asp:RadioButton ID="rdo_ReplaceWaterbed_NA" runat="server" GroupName="ReplaceWaterbed" />
                                        N/A &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp; Replacement Size: &nbsp;
                                        <asp:RadioButton ID="rdo_Replacement_SuperSingle" runat="server" GroupName="Replacement" />
                                        Super Single (46" x 82") &nbsp;
                                        <asp:RadioButton ID="rdo_Replacement_Queen" runat="server" GroupName="Replacement" />
                                        Queen (58" x 82") &nbsp;
                                        <asp:RadioButton ID="rdo_Replacement_King" runat="server" GroupName="Replacement" />
                                        King (70" x 82")
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <div style="width: 100%;">
                                <p style="float: left; width: 25% !important;">
                                    Other issues or comments such as moisture, ventilation, electric space heater, or
                                    unvented combustion issues: &nbsp; &nbsp;
                                </p>
                                <p style="float: left; width: 75% !important;">
                                    <asp:TextBox ID="txt_MoistureVentilationElectricComment" runat="server" TextMode="MultiLine"
                                        Width="93%" Height="100px"></asp:TextBox>
                                </p>
                            </div>
                        </div>
                        <div style="width: 100%;">
                            <p style="float: left; width: 20% !important;">
                                Comments:&nbsp; &nbsp;
                            </p>
                            <p style="float: left; width: 80% !important;">
                                <asp:TextBox ID="txt_Comment" runat="server" TextMode="MultiLine" Width="95%" Height="100px"></asp:TextBox>
                            </p>
                        </div>
                    </div>
                    <br />
                    <br />
                    <%--Page 7 End--%>
                    <%--Page 8 start--%>
                    <div style="page-break-after: always; border: 1px solid #000; width: 940px; margin: -20px 0 0 0;
                        position: relative;">
                        <br />
                        <br />
                        <p class="text_styleA" style="width: 100%;">
            <b class="text_styleA">Electric Water Heating Assessment</b></p>
                        <p class="text_styleA" style="width: 100%; display:none; font-size: 14px;">
                            <b class="text_styleA">Electric Water Heating Assessment</b> <%--Water Heater FuelType:--%>
                            <asp:RadioButton ID="rdo_WaterHeaterFuel_Electric" runat="server" GroupName="WaterHeaterFuel" />
                            1. Electric
                            <asp:RadioButton ID="rdo_WaterHeaterFuel_FuelOil" runat="server" GroupName="WaterHeaterFuel" />
                            2. Fuel Oil
                            <asp:RadioButton ID="rdo_WaterHeaterFuel_UtilityGas" runat="server" GroupName="WaterHeaterFuel" />
                            3. Utility Gas
                            <asp:RadioButton ID="rdo_WaterHeaterFuel_BottledGas" runat="server" GroupName="WaterHeaterFuel" />
                            4. Bottled Gas/Propane
                            <asp:RadioButton ID="rdo_WaterHeaterFuel_Other" runat="server" GroupName="WaterHeaterFuel" />
                            99. Other
                            <asp:TextBox ID="txt_WaterHeaterFuel_Other" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); font-size: 14px; text-align: left;
                                -webkit-width: 5%; !important; -moz-width: 25%; !important; width: 5%; !important;
                                width: 5%; !important; width: 5%; !important;" runat="server"></asp:TextBox>
                            <br />
                        </p>
                        <br />
                        <div class="tab" style="border: 1px solid #000; float: left; width: 99%; margin-top: 0px;
                            margin-bottom: 20px;">
                            <div style="width: 100%; float: left;">
                                <p style="float: left; width: 20% !important;">
                                    Document water heating issues here, such as family runs out of hot water, tank rusted:
                                </p>
                                <p style="float: right; width: 80% !important;">
                                    <asp:TextBox ID="txt_WaterHeatingIssues_Comment" runat="server" Height="100px" Width="97%"
                                        TextMode="MultiLine"></asp:TextBox>
                                </p>
                                <br />
                                <br />
                                <br />
                            </div>
                            <table width="55%" border="0" cellspacing="1" cellpadding="1" align="left">
                                <tr>
                                    <td colspan="2">
                                        Is the water heater leaking?
                                        <asp:RadioButton ID="rdo_WaterHeaterLeak_Yes" runat="server" GroupName="WaterHeaterLeak" />
                                        Yes
                                        <asp:RadioButton ID="rdo_WaterHeaterLeak_No" runat="server" GroupName="WaterHeaterLeak" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Is the water heater rusted/corroded?
                                        <asp:RadioButton ID="rdo_WaterHeaterRusted_Yes" runat="server" GroupName="WaterHeaterRusted" />
                                        Yes
                                        <asp:RadioButton ID="rdo_WaterHeaterRusted_No" runat="server" GroupName="WaterHeaterRusted" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Are the element(s) bad?
                                        <asp:RadioButton ID="rdo_ElementBad_Yes" runat="server" GroupName="ElementBad" />
                                        Yes
                                        <asp:RadioButton ID="rdo_ElementBad_No" runat="server" GroupName="ElementBad" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Is the unit rated R8 or less?
                                        <asp:RadioButton ID="rdo_UnitRated_Yes" runat="server" GroupName="UnitRated" />
                                        Yes
                                        <asp:RadioButton ID="rdo_UnitRated_No" runat="server" GroupName="UnitRated" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 60%;">
                                        Will water heater be replaced?<asp:RadioButton ID="rdo_WaterHeaterReplace_Yes" runat="server"
                                            GroupName="WaterHeaterReplace" />
                                        Yes
                                        <asp:RadioButton ID="rdo_WaterHeaterReplace_No" runat="server" GroupName="WaterHeaterReplace" />
                                        No
                                    </td>
                                    <td>
                                        Energy Factor:<asp:TextBox ID="txtEnergyFctr" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            font-size: 11px; text-align: left; -webkit-width: 43%; !important; -moz-width: 43%;
                                            !important; width: 43%; !important; width: 43%; !important; width: 43%; !important;"></asp:TextBox><%--Width="50px"--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;">
                                        Existing Water Heater size:&nbsp;
                                        <asp:TextBox ID="txt_ExistingWaterHeaterSize" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            font-size: 11px; text-align: left; -webkit-width: 80px; !important; -moz-width: 80px;
                                            !important; width: 80px; !important; width: 80px; !important; width: 80px; !important;"></asp:TextBox><%--Width="50px"--%>
                                    </td>
                                    <td style="text-align: left;">
                                        Replacement size:
                                        <asp:TextBox ID="txt_WaterHeaterReplaceSize" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            font-size: 11px; text-align: left; -webkit-width: 30%; !important; -moz-width: 30%;
                                            !important; width: 30%; !important; width: 30%; !important; width: 30%; !important;"></asp:TextBox><%--Width="50px"--%>
                                    </td>
                                </tr>
                            </table>
                            <table width="40%" border="1" cellspacing="0" cellpadding="0" align="right" style="margin-right: 11px;">
                                <tr>
                                    <td style="width: 60%;">
                                        Are you going to:
                                        <br />
                                    </td>
                                    <td style="width: 15%;">
                                        Yes
                                        <br />
                                    </td>
                                    <td style="width: 15%;">
                                        No
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Replace or add expansion tank:
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_AddExpansionTank_Yes" runat="server" onclick="ChkBox_ExpansionTank(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_AddExpansionTank_No" runat="server" onclick="ChkBox_ExpansionTank(this.id)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Replace Element(s):
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_ReplaceElemnt_Yes" runat="server" onclick="ChkBox_ReplaceElemnt(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_ReplaceElemnt_No" runat="server" onclick="ChkBox_ReplaceElemnt(this.id)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Replace Thermostats:
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_ReplaceThermostats_Yes" runat="server" onclick="ChkBox_ReplaceThermostats(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_ReplaceThermostats_No" runat="server" onclick="ChkBox_ReplaceThermostats(this.id)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Flush Tank?
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_FlushTank_Yes" runat="server" onclick="ChkBox_FlushTank(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_FlushTank_No" runat="server" onclick="ChkBox_FlushTank(this.id)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Add/replace pressure relief valve
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_PressureReliefValve_Yes" runat="server" onclick="CheckBox_PressureReliefValve(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_PressureReliefValve_No" runat="server" onclick="CheckBox_PressureReliefValve(this.id)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Add/replace pressure relief pipe
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_PressureReliefPipe_Yes" runat="server" onclick="ChkBox_PressureReliefPipe(this.id)" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_PressureReliefPipe_No" runat="server" onclick="ChkBox_PressureReliefPipe(this.id)" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table width="100%" border="0" cellspacing="2" cellpadding="2" align="right" style="margin-top: 10px;">
                                <tr>
                                    <td>
                                        Did you change the temperature?
                                        <asp:RadioButton ID="rdo_ChangeTemperature_Yes" runat="server" GroupName="ChangeTemperature" />
                                        Yes
                                        <asp:RadioButton ID="rdo_ChangeTemperature_No" runat="server" GroupName="ChangeTemperature" />
                                        No &nbsp; &nbsp; If yes, set both elements to the same temperature.
                                    </td>
                                </tr>
                                <br />
                                <tr>
                                    <td>
                                        Test location:
                                        <asp:TextBox ID="txt_TstLocation" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 200px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        Existing Temp:
                                        <asp:TextBox ID="txt_ExistingTemp" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        Adjusted Temp:
                                        <asp:TextBox ID="txt_AdjustTemp" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>&nbsp;&nbsp;(No
                                        lower than 125 degrees F)
                                    </td>
                                </tr>
                                <br />
                                <br />
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    Are you wrapping water pipes?
                                                    <asp:RadioButton ID="rdo_WrappingWaterPipe_Yes" runat="server" GroupName="WrappingWaterPipe" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_WrappingWaterPipe_No" runat="server" GroupName="WrappingWaterPipe" />
                                                    No
                                                </td>
                                                <td>
                                                    If so, # of linear ft for hot water:
                                                    <asp:TextBox ID="txt_Linear_FT" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                    <asp:RadioButton ID="rdoHot1_2" runat="server" GroupName="HotWater" />1/2"<asp:RadioButton
                                                        ID="rdoHot3_4" runat="server" GroupName="HotWater" />3/4" Location
                                                    <asp:TextBox ID="page8_txt_Location" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                        width: 23%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    If so, # of linear ft for cold water:
                                                    <asp:TextBox ID="txt_Linear_ColdFt" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                    <asp:RadioButton ID="rdoCold1_2" runat="server" GroupName="ColdWater" />1/2"<asp:RadioButton
                                                        ID="rdoCold3_4" runat="server" GroupName="ColdWater" />3/4" Location
                                                    <asp:TextBox ID="txtLocationColdFT" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                        width: 23%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <br />
                                <tr>
                                    <td>
                                        Comments:
                                        <asp:TextBox ID="page8_txt_Comments" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <br />
                                <tr>
                                    <td>
                                        Are there any other hot water leaks?
                                        <asp:RadioButton ID="rdo_HotWaterLeaks_Yes" runat="server" GroupName="HotWaterLeaks" />
                                        Yes
                                        <asp:RadioButton ID="rdo_HotWaterLeaks_No" runat="server" GroupName="HotWaterLeaks" />
                                        No If yes, where?
                                        <asp:TextBox ID="txt_HotWaterLeaksYes_Comment" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 38%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <br />
                                <tr>
                                    <td>
                                        Are you going to repair leaks?
                                        <asp:RadioButton ID="rdo_RepairLeaks_Yes" runat="server" GroupName="RepairLeaks" />
                                        Yes
                                        <asp:RadioButton ID="rdo_RepairLeaks_No" runat="server" GroupName="RepairLeaks" />
                                        No If yes, where?
                                        <asp:TextBox ID="txt_RepairLeaks_Yes_Comment" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 42%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!--newtable end-->
                        <%-- <div class="clear">
                        </div>--%>
                        <table width="100%" border="0" cellspacing="2" cellpadding="2" align="left" style="margin-top: 7px;">
                            <tr>
                                <td align="left">
                                    <strong>Faucet Aerators & Shower heads</strong>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    Are you installing faucet aerators?<asp:RadioButton ID="rdoInstalFaucetYes" runat="server"
                                        GroupName="Faucet" />Yes<asp:RadioButton ID="rdoInstalFaucetNo" runat="server" GroupName="Faucet" />No
                                </td>
                                <td align="left">
                                    If so, which?
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    Bath Aerator
                                </td>
                                <td width="20%">
                                    # installed?<asp:TextBox ID="txtBathAerator" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td width="30%">
                                    Location:<asp:TextBox ID="txtBathLocation" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    Kitchen Aerator
                                </td>
                                <td>
                                    # installed?<asp:TextBox ID="txtKitchenAerator" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td width="30%">
                                    Location:<asp:TextBox ID="txtKitchenLocation" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td width="40%">
                                    Are you installing a shower head?
                                    <asp:RadioButton ID="rdoInstalShowerYes" runat="server" GroupName="Shower" />Yes<asp:RadioButton
                                        ID="rdoInstalShowerNo" runat="server" GroupName="Shower" />No
                                </td>
                                <td>
                                    If so, which?
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    with swivel head
                                </td>
                                <td>
                                    # installed?<asp:TextBox ID="txtSwivel" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td width="30%">
                                    Location:<asp:TextBox ID="txtSwivelLocation" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    with shutoff
                                </td>
                                <td>
                                    # installed?<asp:TextBox ID="txtShutoff" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td width="30%">
                                    Location:<asp:TextBox ID="txtShutoffLocation" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    with out shutoff
                                </td>
                                <td>
                                    # installed?<asp:TextBox ID="txtWOshutoff" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td width="30%">
                                    Location:<asp:TextBox ID="txtWOshutoffLocation" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    handheld
                                </td>
                                <td>
                                    # installed?<asp:TextBox ID="txtHandheld" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 50px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                                <td width="30%">
                                    Location:<asp:TextBox ID="txtHandheldLocation" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 150px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td colspan="4">
                                    Would a GFX System work? Shower is used at least 15 minutes per day;basement drain
                                    stack servicing the most used shower is exposed;at least 34" of vertical height
                                    available on the drain stack;drain pipe is at least 3" in diameter:<asp:RadioButton
                                        ID="rdoGFXsystemYes" runat="server" GroupName="GFXsystem" />Yes<asp:RadioButton ID="rdoGFXsystemNo"
                                            runat="server" GroupName="GFXsystem" />No<br />
                                    <div align="left" style="font-size: 0.9em;">
                                        If yes,how far is the drain pipe from the cold water supply?<asp:TextBox ID="txtColdWatrSupply"
                                            runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                            color: rgb(0, 0, 0); font-size: 11px; text-align: left; -webkit-width: 6%; !important;
                                            -moz-width: 6%; !important; width: 3%; !important; width: 6%; !important; width: 6%;
                                            !important;"></asp:TextBox><%--Width="20px"--%>
                                        How far is the drain pipe from the water heater?<asp:TextBox ID="txtWaterHeater"
                                            runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 20px;
                                            font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>&nbsp;Installing GFX?<asp:RadioButton
                                                ID="rdoInstallGFXyes" runat="server" GroupName="InstallGFX" />Yes<asp:RadioButton
                                                    ID="rdoInstallGFXno" runat="server" GroupName="InstallGFX" />No
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="clear">
                        </div>
                        <table width="100%" border="0" cellspacing="0">
                            <tr>
                                <td style="display: none;">
                                    Is customer on the time-of-day (TOD) rate?
                                    <asp:RadioButton ID="rdo_Customer_TOD_Yes" runat="server" GroupName="Customer_TOD" />
                                    Yes
                                    <asp:RadioButton ID="rdo_Customer_TOD_No" runat="server" GroupName="Customer_TOD" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td style="display: none;">
                                    If yes, is customer saving on this rate?
                                    <asp:RadioButton ID="rdo_CustomerSavingRate_Yes" runat="server" GroupName="CustomerSavingRate" />
                                    Yes
                                    <asp:RadioButton ID="rdo_CustomerSavingRate_No" runat="server" GroupName="CustomerSavingRate" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td style="display: none;">
                                    Does customer's lifestyle suit the rate change?
                                    <br />
                                    (Use Human Services Web Site rate comparison tool.)
                                    <asp:RadioButton ID="rdo_CustomerSuitRateChange_Yes" runat="server" GroupName="CustomerSuitRateChange" />
                                    Yes
                                    <asp:RadioButton ID="rdo_CustomerSuitRateChange_No" runat="server" GroupName="CustomerSuitRateChange" />
                                    No
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td>
                                    Is customer going to switch to the TOD rate?
                                    <asp:RadioButton ID="rdo_CustomerSwitchTOD_Yes" runat="server" GroupName="CustomerSwitchTOD" />
                                    Yes
                                    <asp:RadioButton ID="rdo_CustomerSwitchTOD_No" runat="server" GroupName="CustomerSwitchTOD" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Does the customer have a water heater timer?
                                    <asp:RadioButton ID="rdo_Customer_WaterHeaterTimer_Yes" runat="server" GroupName="Customer_WaterHeaterTimer" />
                                    Yes
                                    <asp:RadioButton ID="rdo_Customer_WaterHeaterTimer_No" runat="server" GroupName="Customer_WaterHeaterTimer" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    if yes, are you recommending removal
                    <asp:CheckBox ID="rdo_TimerInstalled_Yes" runat="server" onclick="ChkBox_TimerInstalled(this.id)" />
                    Yes
                    <asp:CheckBox ID="rdo_TimerInstalled_No" runat="server" onclick="ChkBox_TimerInstalled(this.id)" />
                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                                        <tr>
                                            <td valign="top" style="width: 15%;">
                                                Comments: &nbsp; &nbsp;
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_comment1" runat="server" Width="97%" Height="150px" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <%-- <div class="clear">
                        </div>--%>
                    <%--Page 8 End--%>
                    <%--Page 9 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <p>
                            <strong>Heat Pump Water Heater(HPWH)</strong>Once "No" is an answer to any question
                            or if the customer's home is for sale, stop answering questions in this section
                            and proceed to the Cooling Assessment.
                        </p>
                        <table width="100%" border="0" cellspacing="6" cellpadding="15">
                            <tr>
                                <td style="float: left; margin-left: -10px;">
                                    Is the customer a candidate(currently has an electric resistance water heater) for
                                    a Heat Pump Water Heater (HPWH)?
                                    <%-- <input id="ctl00_ContentPlaceHolder1_rdo_ThermostatAccurate_Yes" type="radio" name="ctl00$ContentPlaceHolder1$ThermostatAccurate"
                        value="rdo_ThermostatAccurate_Yes" />--%><asp:RadioButton ID="rdo_WaterHeaterHPWH_Yes"
                            runat="server" GroupName="WaterHeaterHPWH" />
                                    Yes
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_ThermostatAccurate_No" type="radio" name="ctl00$ContentPlaceHolder1$ThermostatAccurate"
                        value="rdo_ThermostatAccurate_No" />--%><asp:RadioButton ID="rdo_WaterHeaterHPWH_No"
                            runat="server" GroupName="WaterHeaterHPWH" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td style="float: left; margin-left: -10px;">
                                    Homeowner? &nbsp; &nbsp;
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_FilterSlotCovered_Yes" type="radio" name="ctl00$ContentPlaceHolder1$FilterSlotCovered"
                        value="rdo_FilterSlotCovered_Yes" />--%><asp:RadioButton ID="rdo_Homeowners_Yes"
                            runat="server" GroupName="Homeowners" />
                                    Yes
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_FilterSlotCovered_No" type="radio" name="ctl00$ContentPlaceHolder1$FilterSlotCovered"
                        value="rdo_FilterSlotCovered_No" />--%><asp:RadioButton ID="rdo_Homeowners_No" runat="server"
                            GroupName="Homeowners" />
                                    No &nbsp; &nbsp; &nbsp; &nbsp;Are there two or more occupants,but less than six?
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_InspectAcoil_Yes" type="radio" name="ctl00$ContentPlaceHolder1$InspectAcoil"
                        value="rdo_InspectAcoil_Yes" />--%><asp:RadioButton ID="rdo_LessThenSix_Yes" runat="server"
                            GroupName="LessThenSix" />
                                    Yes
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_InspectAcoil_No" type="radio" name="ctl00$ContentPlaceHolder1$InspectAcoil"
                        value="rdo_InspectAcoil_No" />--%><asp:RadioButton ID="rdo_LessThenSix_No" runat="server"
                            GroupName="LessThenSix" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Does the home have a basement area,where the HPWH would be located,that is at least
                                    45 degrees year round with no dirt floor ?
                                    <%--   <input id="ctl00_ContentPlaceHolder1_rdo_CleaningRecommended_Yes" type="radio" name="ctl00$ContentPlaceHolder1$CleaningRecommended"
                        value="rdo_CleaningRecommended_Yes" />--%><asp:RadioButton ID="rdo_NoDirtFloor_Yes"
                            runat="server" GroupName="NoDirtFloor" />
                                    Yes
                                    <%-- <input id="ctl00_ContentPlaceHolder1_rdo_CleaningRecommended_No" type="radio" name="ctl00$ContentPlaceHolder1$CleaningRecommended"
                        value="rdo_CleaningRecommended_No" />--%><asp:RadioButton ID="rdo_NoDirtFloor_No"
                            runat="server" GroupName="NoDirtFloor" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="10">
                                        <tr>
                                            <td>
                                                Can you install the HPWH in an unconfined space that is at least 10' by 10' by 7'
                                                and is there room to remove and replace the filter ? <span style="margin: -1px;">
                                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_NewfilterInstall_Yes" type="radio" name="ctl00$ContentPlaceHolder1$NewfilterInstall" value="rdo_NewfilterInstall_Yes" />--%><asp:RadioButton
                                                        ID="rdo_ReplaceTheFilter_Yes" runat="server" GroupName="ReplaceTheFilter" /></span>Yes
                                                <span style="margin: -1px;">
                                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_NewfilterInstall_No" type="radio" name="ctl00$ContentPlaceHolder1$NewfilterInstall" value="rdo_NewfilterInstall_No" />--%><asp:RadioButton
                                                        ID="rdo_ReplaceTheFilter_No" runat="server" GroupName="ReplaceTheFilter" /></span>No
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Is there adequate space to bring the HPWH into the home, down the stairs, along
                                    railings, etc.?
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_Yes" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_Yes" />--%><asp:RadioButton ID="rdo_StairsAlongRailing_Yes"
                            runat="server" GroupName="StairsAlongRailing" />
                                    Yes
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_No" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_No" />--%><asp:RadioButton ID="rdo_StairsAlongRailing_No"
                            runat="server" GroupName="StairsAlongRailing" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Can you install the HPWH near an existing drain or line/pump that is no higher than
                                    3" above the floor or can you run the condensate line from the HPWH to the existing
                                    drain ?
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_Yes" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_Yes" />--%><asp:RadioButton ID="rdo_ExistingDrain_Yes" runat="server"
                            GroupName="ExistingDrain" />
                                    Yes
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_No" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_No" />--%><asp:RadioButton ID="rdo_ExistingDrain_No" runat="server"
                            GroupName="ExistingDrain" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Are the home's plumbing and electrical systems in good shape ?
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_Yes" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_Yes" />--%><asp:RadioButton ID="rdo_GoodShape_Yes" runat="server"
                            GroupName="GoodShape" />
                                    Yes
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_No" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_No" />--%><asp:RadioButton ID="rdo_GoodShape_No" runat="server"
                            GroupName="GoodShape" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Is the customer willing and able to adjust the HPWH panel or maintain consistent
                                    usage habits?
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_Yes" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_Yes" />--%><asp:RadioButton ID="rdo_UsageHabits_Yes" runat="server"
                            GroupName="UsageHabits" />
                                    Yes
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_No" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_No" />--%><asp:RadioButton ID="rdo_UsageHabits_No" runat="server"
                            GroupName="UsageHabits" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Does the customer understand there is noise and cold air output associated with
                                    a HPWH ?
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_Yes" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_Yes" />--%><asp:RadioButton ID="rdo_AssociatedWithHPWH_Yes"
                            runat="server" GroupName="AssociatedWithHPWH" />
                                    Yes
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_No" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_No" />--%><asp:RadioButton ID="rdo_AssociatedWithHPWH_No"
                            runat="server" GroupName="AssociatedWithHPWH" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Does the customer agree to the installation of the system and to regularly clean
                                    the HPWH filter?
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_Yes" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_Yes" />--%><asp:RadioButton ID="rdo_CleanHPWHFilter_Yes"
                            runat="server" GroupName="CleanHPWHFilter" />
                                    Yes
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_No" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_No" />--%><asp:RadioButton ID="rdo_CleanHPWHFilter_No" runat="server"
                            GroupName="CleanHPWHFilter" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Is a HPWH recommended, and will it be installed ?
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_Yes" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_Yes" />--%><asp:RadioButton ID="rdo_HPWHBeInstalled_Yes"
                            runat="server" GroupName="HPWHBeInstalled" />
                                    Yes
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_No" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_No" />--%><asp:RadioButton ID="rdo_HPWHBeInstalled_No" runat="server"
                            GroupName="HPWHBeInstalled" />
                                    No &nbsp; &nbsp; Size:
                                    <%--<input id="ctl00_ContentPlaceHolder1_rdo_CoilsCleaned_No" type="radio" name="ctl00$ContentPlaceHolder1$CoilsCleaned"
                        value="rdo_CoilsCleaned_No" />--%>
                                    <asp:RadioButton ID="rdo_HPWHsize" runat="server" GroupName="HPWHsize" />
                                    40-50 Gallon
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="12" style="margin-top: 10px;">
                                        <tr>
                                            <td valign="top" style="width: 10%;">
                                                Comments: &nbsp; &nbsp;
                                            </td>
                                            <td>
                                                <%--<textarea name="" cols="" rows="" style="height: 150px; width: 97%;"></textarea>--%>
                                                <asp:TextBox ID="page9_txt_Comment" runat="server" TextMode="MultiLine" Style="height: 150px;
                                                    width: 97%;"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="margindiv">
                            <p>
                                The WARM Program auditor has explained to me how a heat pump water heater operates
                                and how it can help reduce my electric usage. The auditor has also provided me with
                                instructions on how to maintain the water heater to ensure its efficient operation.
                                I agree to the installation of the heat pump water heater and I or another member
                                of my household agrees to perform required water heater maintenance that includes
                                regularly changing the filter and periodically checking to make sure the unit is
                                draining properly.</p>
                            <table border="0" width="100%">
                                <tr>
                                    <td>
                                        <strong>Signature </strong>
                                        <%--<input name="" type="text" id="" class="txt_city" />--%><asp:TextBox ID="txt_Signature"
                                            Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                            color: rgb(0, 0, 0); width: 400px;" runat="server"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <strong>Date</strong>
                                        <%--<input name="" type="text" id="" class="txt_city" />--%><asp:TextBox ID="txt_Date"
                                            Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                            color: rgb(0, 0, 0); width: 90px;" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <br />
                    <br />
                    <%--Page 9 End--%>
                    <%--Page 10 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <table border="0" cellpadding="10" cellspacing="10" width="100%">
                            <tr>
                                <td>
                                    <strong>Cooling Assessment</strong>
                                    <br />
                                </td>
                                <td>
                                    <span class="span1">Summer Seasonal Use:</span>
                                    <asp:TextBox ID="txt_SummerSeasonalUse" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                    <strong>kWh</strong>
                                </td>
                            </tr>
                        </table>
                        <div style="border: 1px solid #000; width: 100%; border-top: 0px;">
                            <strong style="padding-left: 1px; padding-top: 1px;">Cooling Load Reduction Measures</strong>
                            Summer Seasonal use of 2,000 kWh or more qualifies for roof coat/window film, ACs
                            and/or shell measures <strong style="padding-left: 1px;">if related to cooling.</strong>
                            <br />
                            <div class="text_only" style="font-size: 16.6px;">
                                <strong>Window Film:</strong>Are there any windows on the west,south and east that
                                are not shaded in the summer during the hours of 9AM and 4PM?&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RadioButton ID="rdo_WindowFilm_Yes" runat="server" GroupName="WindowFilm" />
                                Yes
                                <asp:RadioButton ID="rdo_WindowFilm_No" runat="server" GroupName="WindowFilm" />
                                No</div>
                            <br />
                            Approximate total sq. footage of window film needed:
                            <asp:TextBox ID="txt_WindowFilmNeeded" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 10%;"></asp:TextBox>
                            # and location of west facing windows to receive film:
                            <asp:TextBox ID="txt_West_ReceiveFilm" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 10%;"></asp:TextBox>
                            <br />
                            # and location of south facing windows to receive film:
                            <asp:TextBox ID="txt_South_ReceiveFilm" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 10%;"></asp:TextBox>
                            # and location of east facing windows to receive film:
                            <asp:TextBox ID="txt_East_ReceiveFilm" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 10%;"></asp:TextBox>
                            <br />
                            <div class="text_only" style="font-size: 16.6px;">
                                <strong>Reflective Roof Coating:</strong> Is there any roof area that faces south
                                and receives sun all day in the summer and is metal or roll roof material?
                                <asp:RadioButton ID="rdo_RoofCoating_Roofmaterial_Yes" runat="server" GroupName="RoofCoating" />
                                Yes
                                <asp:RadioButton ID="rdo_RoofCoating_Roofmaterial_No" runat="server" GroupName="RoofCoating" />
                                No</div>
                            <br />
                            Install roof coat?
                            <asp:RadioButton ID="rdo_InstallRoofCoat_Yes" runat="server" GroupName="InstallRoofCoat" />
                            Yes
                            <asp:RadioButton ID="rdo_InstallRoofCoat_No" runat="server" GroupName="InstallRoofCoat" />
                            No &nbsp; &nbsp; Approx sq. footage of roof, times 2 for 2 coats:
                            <asp:TextBox ID="txt_FootageOfRoof" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                            <br />
                            Are there other steps to reduce A/C use i.e., AC timers, Fans, Screens?
                            <asp:RadioButton ID="rdo_ReduceACUse_Yes" runat="server" GroupName="ReduceACUse" />
                            Yes
                            <asp:RadioButton ID="rdo_ReduceACUse_No" runat="server" GroupName="ReduceACUse" />
                            No &nbsp; &nbsp; Will install:
                            <asp:TextBox ID="txt_Will_Install" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 220px"></asp:TextBox>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                                <tr>
                                    <td valign="top" style="width: 15%;">
                                        Comments: &nbsp; &nbsp;
                                    </td>
                                    <td>
                                        <asp:TextBox ID="page10_txt_comment" runat="server" Width="97%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!--newtable end-->
                        <div style="border: 1px solid #000; width: 100%;">
                            <strong>Room AC units:</strong> Is the EER on the existing room AC 6 or lower as
                            labeled, calculated or metered? If so, it can be replaced with an Energy Star rated
                            unit, but the Summer Seasonal Use (kWh) must be 2,000 or more to replace 1 unit
                            and 2,500 to replace 2 units and 3,000 to replace 3 units.
                        </div>
                        <div style="border: 1px solid #000; width: 100%;">
                            <table width="100%" border="1" cellspacing="3" cellpadding="3" align="center">
                                <tr>
                                    <th>
                                        Unit Watts
                                    </th>
                                    <th>
                                        EER = <u>BTU/hr Watts</u>
                                    </th>
                                    <th>
                                        Replace AC?
                                    </th>
                                    <th>
                                        Current Size BTU/hr
                                    </th>
                                    <th>
                                        Current Location
                                    </th>
                                    <th>
                                        New Size BTU/hr
                                    </th>
                                    <th>
                                        Installed Location
                                    </th>
                                    <th>
                                        Replace Filter?
                                    </th>
                                    <th>
                                        Clean Filter?
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_UnitWatts" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_EER" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_ReplaceAC" runat="server" />
                                        Yes
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_CurrentSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_CurrentLocation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_NewSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_Install_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_ReplaceFilter" runat="server" />
                                        Yes
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line1_CleanFilter" runat="server" />
                                        Yes
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_UnitWatts" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_EER" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_ReplaceAC" runat="server" />
                                        Yes
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_CurrentSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_CurrentLocation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_NewSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_Install_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_ReplaceFilter" runat="server" />
                                        Yes
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line2_CleanFilter" runat="server" />
                                        Yes
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_UnitWatts" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_EER" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_ReplaceAC" runat="server" />
                                        Yes
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_CurrentSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_CurrentLocation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_NewSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_Install_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_ReplaceFilter" runat="server" />
                                        Yes
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line3_CleanFilter" runat="server" />
                                        Yes
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_UnitWatts" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_EER" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_ReplaceAC" runat="server" />
                                        Yes
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_CurrentSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_CurrentLocation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_NewSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_Install_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_ReplaceFilter" runat="server" />
                                        Yes
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line4_CleanFilter" runat="server" />
                                        Yes
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_UnitWatts" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_EER" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_ReplaceAC" runat="server" />
                                        Yes
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_CurrentSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_CurrentLocation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_NewSize_BTU" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_Install_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_ReplaceFilter" runat="server" />
                                        Yes
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_Line5_CleanFilter" runat="server" />
                                        Yes
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                <tr>
                                    <td width="20%">
                                        What are the customer's window AC thermostat use habits?
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_CustomerWindowACThermostat_Comment" runat="server" TextMode="MultiLine"
                                            Width="100%" Height="50px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            Total number of AC units to be replaced?
                            <asp:TextBox ID="txt_AC_ReplaceUnit" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 90px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <!--New Task-->
                            <span id="tr_NewestACUnit" runat="server">Manufactured year for newest room AC unit
                                present(only if insulation is installed):
                                <asp:TextBox ID="txt_NewestACUnit" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 46px;"></asp:TextBox>
                            </span>
                            <!--End Task-->
                        </div>
                        <div style="border: 1px solid #000; width: 100%; margin: 10px 0;">
                            <strong>Central AC:</strong> Replacement determined by kWh use and the SEER (age
                            and efficiency) of the existing unit. Replace SEER 8 or less with SEER 13 or higher.
                            Replacement requires FirstEnergy approval. <b>Please note:</b> Customer must have
                            at least 3,000 kWh of summer use in order to qualify for replacement.
                            <br />
                            What are customer's AC thermostat use habits?
                            <asp:TextBox ID="txt_CustomerACThermostatUse" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 60%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <br />
                            Is the thermostat accurate?
                            <asp:RadioButton ID="rdo_ThermostatAccurate_Yes" runat="server" GroupName="ThermostatAccurate" />
                            Yes
                            <asp:RadioButton ID="rdo_ThermostatAccurate_No" runat="server" GroupName="ThermostatAccurate" />
                            No
                            <asp:RadioButton ID="rdo_ThermostatAccurate_IfNot" runat="server" GroupName="ThermostatAccurate" />
                            If not, why?
                            <asp:TextBox ID="txt_ThermostatAccurate_IfNot" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 54%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <br />
                            Do you recommend replacement of thermostat?
                            <asp:RadioButton ID="rdo_ReplacementThermostat_Yes" runat="server" GroupName="ReplacementThermostat" />
                            Yes
                            <asp:RadioButton ID="rdo_ReplacementThermostat_No" runat="server" GroupName="ReplacementThermostat" />
                            No
                            <br />
                            Is filter slot covered?
                            <asp:RadioButton ID="rdo_filterSlotCovered_Yes" runat="server" GroupName="filterSlotCovered" />
                            Yes
                            <asp:RadioButton ID="rdo_filterSlotCovered_No" runat="server" GroupName="filterSlotCovered" />
                            No
                            <asp:RadioButton ID="rdo_filterSlotCovered_NA" runat="server" GroupName="filterSlotCovered" />
                            N/A &nbsp; &nbsp; If no, install cover. &nbsp; &nbsp; Location of A-coil?
                            <asp:RadioButton ID="rdo_LocationAcoil_Inside" runat="server" GroupName="LocationAcoil" />
                            Inside
                            <asp:RadioButton ID="rdo_LocationAcoil_Outside" runat="server" GroupName="LocationAcoil" />
                            Outside
                            <br />
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 25%;">
                                        Can you visually inspect the A-coil?
                                    </td>
                                    <td style="width: 11%;">
                                        <asp:RadioButton ID="rdo_InspectAcoil_Yes" runat="server" GroupName="InspectAcoil"
                                            Style="margin: -5px;" />
                                        Yes
                                        <asp:RadioButton ID="rdo_InspectAcoil_No" runat="server" GroupName="InspectAcoil"
                                            Style="margin: -5px;" />
                                        No
                                    </td>
                                    <td style="width: 15%;">
                                        If yes, is cleaning<br />
                                        recommended?
                                    </td>
                                    <td style="width: 11%;">
                                        <asp:RadioButton ID="rdo_CleaningRecommended_Yes" runat="server" GroupName="CleaningRecommended"
                                            Style="margin: -5px;" />
                                        Yes
                                        <asp:RadioButton ID="rdo_CleaningRecommended_No" runat="server" GroupName="CleaningRecommended"
                                            Style="margin: -5px;" />
                                        No
                                    </td>
                                    <td style="width: 13%;">
                                        If yes, cleaning<br />
                                        performed by:
                                    </td>
                                    <td style="width: 25%;">
                                        <asp:RadioButton ID="rdo_CleaningPerformedBy_Auditor" runat="server" GroupName="CleaningPerformedBy"
                                            Style="margin: -5px;" />
                                        Auditor
                                        <asp:RadioButton ID="rdo_CleaningPerformedBy_3rd_Party" runat="server" GroupName="CleaningPerformedBy"
                                            Style="margin: -5px;" />
                                        3rd Party Contractor
                                    </td>
                                </tr>
                                <%-- <tr>
                                    <td colspan="6" height="20">
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td colspan="2">
                                        If visually unable to inspect A-coil, does usage
                                        <br />
                                        warrant 3rd party clean and tune?
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rdo_Acoil_3rd_PartyClean_Yes" runat="server" GroupName="Acoil_3rd_PartyClean" />
                                        Yes
                                        <asp:RadioButton ID="rdo_Acoil_3rd_PartyClean_No" runat="server" GroupName="Acoil_3rd_PartyClean" />
                                        No
                                    </td>
                                    <td>
                                        If yes, was 3rd party contractor contacted?
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rdo_3rd_PartyContractor_Yes" runat="server" GroupName="3rd_PartyContractor" />
                                        Yes
                                        <asp:RadioButton ID="rdo_3rd_PartyContractor_No" runat="server" GroupName="3rd_PartyContractor" />
                                        No
                                    </td>
                                    <td>
                                        Clean/Tune?
                                        <asp:RadioButton ID="rdo_CleanTune_Yes" runat="server" GroupName="CleanTune" />
                                        Yes
                                        <asp:RadioButton ID="rdo_CleanTune_No" runat="server" GroupName="CleanTune" />
                                        No
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td colspan="6" height="20">
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td colspan="6">
                                        If clean and tune recommended, why?
                                        <asp:TextBox ID="txt_CleanTuneRecommended" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 71%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <%-- <tr>
                                    <td colspan="6" height="20">
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td colspan="6">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td style="width: 40%;">
                                                    New filter(s) installed in the system?<asp:RadioButton ID="rdo_NewFilterInstall_Yes"
                                                        runat="server" GroupName="NewFilterInstall" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_NewFilterInstall_No" runat="server" GroupName="NewFilterInstall" />
                                                    No
                                                </td>
                                                <td style="width: 15%;">
                                                    Number Installed:
                                                </td>
                                                <td style="width: 6%;">
                                                    <asp:TextBox ID="txt_NumberInstall" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                        font-weight: normal; color: rgb(0, 0, 0); width: 80%;"></asp:TextBox>
                                                </td>
                                                <td style="width: 15%;">
                                                    Filter Dimensions:
                                                </td>
                                                <td style="width: 13%;">
                                                    <asp:TextBox ID="txt_FilterDimension" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                        font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                                </td>
                                                <td style="width: 13%;">
                                                    <%--  Number Cleaned:--%>
                                                </td>
                                                <td style="width: 15%;">
                                                    <%--<asp:TextBox ID="txt_NumberClean" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                        font-weight: normal; color: rgb(0, 0, 0); width: 95%;"></asp:TextBox>--%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" height="40" align="center">
                                        Filter(s) to be cleaned in the system? &nbsp;<asp:RadioButton ID="rdo_FilterClean_Yes"
                                            runat="server" GroupName="FilterClean" />
                                        Yes
                                        <asp:RadioButton ID="rdo_FilterClean_No" runat="server" GroupName="FilterClean" />
                                        No&nbsp;&nbsp;&nbsp; Number Cleaned:
                                        <asp:TextBox ID="txt_NumberClean" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 15%;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" height="40">
                                        Coils to be cleaned?
                                        <asp:RadioButton ID="rdo_CoilClean_Yes" runat="server" GroupName="CoilClean" />
                                        Yes
                                        <asp:RadioButton ID="rdo_CoilClean_No" runat="server" GroupName="CoilClean" />
                                        No &nbsp; &nbsp; C/A unit to be replaced?
                                        <asp:RadioButton ID="rdo_CA_UnitReplace_Yes" runat="server" GroupName="CA_UnitReplace" />
                                        Yes
                                        <asp:RadioButton ID="rdo_CA_UnitReplace_No" runat="server" GroupName="CA_UnitReplace" />
                                        No &nbsp; &nbsp; Size of Unit:
                                        <asp:TextBox ID="txt_SizeUnit" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <strong>Duct work Sealing and/or Duct Installation: Are there obvious duct leaks in
                                            any duct work that is outside the thermal boundary?</strong>
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButton ID="rdo_DuctWork_Yes" runat="server" GroupName="DuctWork" />
                                        Yes
                                        <asp:RadioButton ID="rdo_DuctWork_No" runat="server" GroupName="DuctWork" />
                                        No &nbsp; &nbsp; Location:<asp:TextBox ID="txt_DuctWork_Location" runat="server"
                                            Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                            color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" height="40">
                                        <table>
                                            <tr>
                                                <td>
                                                    Insulation to be installed?
                                                    <asp:RadioButton ID="rdo_InsulationInstall_Yes" runat="server" GroupName="InsulationInstall" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_InsulationInstall_No" runat="server" GroupName="InsulationInstall" />
                                                    No &nbsp; &nbsp; Sealing to be completed?
                                                    <asp:RadioButton ID="rdo_SealingCompleted_Yes" runat="server" GroupName="SealingCompleted" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_SealingCompleted_No" runat="server" GroupName="SealingCompleted" />
                                                    No
                                                </td>
                                                <td id="td_CentralACUnit" runat="server">
                                                    Manufactured year for central AC unit present
                                                    <br />
                                                    (only if insulation is installed):
                                                    <asp:TextBox ID="txt_CentralACUnit" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                        font-weight: normal; color: rgb(0, 0, 0); width: 50px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 10px 0;">
                                            <tr>
                                                <td valign="top" style="width: 10%;">
                                                    <p style="vertical-align: middle; float: left; padding-left: 4px;">
                                                        Comments:</p>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_comment2" runat="server" Width="97%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <br />
                    <br />
                    <%--Page 10 End--%>
                    <%--Page 11 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <strong>Heat Pump:</strong> Replacement determined by kWh use and the HSPF (age
                        and efficiency) of the existing unit. Replace HSPF 9 or less with HSPF 13 or higher.
                        Replacement requires FirstEnergy approval. <strong>Please note:</strong> Customer
                        must have at least 4,500 kWh of seasonal use in order to qualify for replacement.
                        <table width="100%" border="0" cellspacing="5" cellpadding="3">
                            <tr>
                                <td>
                                    Customers' heat pump is used for?&nbsp;<asp:RadioButton ID="rdoCusHeat" runat="server"
                                        GroupName="CusHeatPump" />Heat &nbsp;<asp:RadioButton ID="rdoCusAc" runat="server"
                                            GroupName="CusHeatPump" />A/C &nbsp;<asp:RadioButton ID="rdoCusNa" runat="server"
                                                GroupName="CusHeatPump" />N/A &nbsp;<asp:RadioButton ID="rdoCusOther" runat="server"
                                                    GroupName="CusHeatPump" />Other &nbsp;<asp:TextBox ID="txtCusOther" runat="server"
                                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 40%; font-weight: normal;
                                                        color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    What are customer's Heat Pump thermostat use habits?
                                    <asp:TextBox ID="txt_customerHeatPumpThermostatUse" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 57%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Is the thermostat accurate?
                                    <asp:RadioButton ID="page11_rdo_ThermostatAccurate_Yes" runat="server" GroupName="ThermostatAccurate11" />
                                    Yes
                                    <asp:RadioButton ID="page11_rdo_ThermostatAccurate_No" runat="server" GroupName="ThermostatAccurate11" />
                                    No
                                    <asp:RadioButton ID="page11_rdo_ThermostatAccurate_IfNot" runat="server" GroupName="ThermostatAccurate11" />
                                    If not,why?
                                    <asp:TextBox ID="page11_txt_ThermostatAccurate_IfNot" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Is filter slot covered?
                                    <asp:RadioButton ID="page11_rdo_FilterSlotCovered_Yes" runat="server" GroupName="FilterSlotCovered11" />
                                    Yes
                                    <asp:RadioButton ID="page11_rdo_FilterSlotCovered_No" runat="server" GroupName="FilterSlotCovered11" />
                                    No &nbsp; &nbsp; If no, install cover. &nbsp; &nbsp; Can you visually inspect the
                                    A-coil?
                                    <asp:RadioButton ID="page11_rdo_InspectAcoil_Yes" runat="server" GroupName="InspectAcoil11" />
                                    Yes
                                    <asp:RadioButton ID="page11_rdo_InspectAcoil_No" runat="server" GroupName="InspectAcoil11" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    If yes, is cleaning recommended?
                                    <asp:RadioButton ID="page11_rdo_CleaningRecommended_Yes" runat="server" GroupName="CleaningRecommended11" />
                                    Yes
                                    <asp:RadioButton ID="page11_rdo_CleaningRecommended_No" runat="server" GroupName="CleaningRecommended11" />
                                    No &nbsp; &nbsp; If yes, cleaning performed by:
                                    <asp:RadioButton ID="page11_rdo_CleaningPerformedBy_Auditor" runat="server" GroupName="CleaningPerformedBy11" />
                                    Auditor
                                    <asp:RadioButton ID="page11_rdo_CleaningPerformedBy_3rd_Party" runat="server" GroupName="CleaningPerformedBy11" />
                                    3rd Party Contractor
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>
                                                If visually unable to inspect A-coil, does
                                                <br />
                                                usage warrant 3rd party clean and tune?
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="page11_rdo_Acoil_3rd_PartyClean_Yes" runat="server" GroupName="Acoil_3rd_PartyClean_Yes11" />
                                                Yes
                                                <asp:RadioButton ID="page11_rdo_Acoil_3rd_PartyClean_No" runat="server" GroupName="Acoil_3rd_PartyClean_Yes11" />
                                                No &nbsp; &nbsp; If yes, was 3rd party contacted?
                                                <asp:RadioButton ID="page11_rdo_3rdPartyContacted_Yes" runat="server" GroupName="3rdPartyContacted11" />
                                                Yes
                                                <asp:RadioButton ID="page11_rdo_3rdPartyContacted_No" runat="server" GroupName="3rdPartyContacted11" />
                                                No &nbsp; &nbsp; Clean/Tune?
                                                <asp:RadioButton ID="page11_rdo_CleanTune_Yes" runat="server" GroupName="CleanTune11" />
                                                Yes
                                                <asp:RadioButton ID="page11_rdo_CleanTune_No" runat="server" GroupName="CleanTune11" />
                                                No
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    If clean and tune recommended, why?
                                    <asp:TextBox ID="page11_paftxt_CleanTuneRecommended" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 62%; font-weight: normal; color: rgb(0, 0, 0);
                                        width: 70%;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>
                                                New filter(s) installed in the system?
                                                <asp:RadioButton ID="page11_rdo_NewfilterInstall_Yes" runat="server" GroupName="NewfilterInstall11"
                                                    Style="margin: -5px;" />
                                                Yes
                                                <asp:RadioButton ID="page11_rdo_NewfilterInstall_No" runat="server" GroupName="NewfilterInstall11"
                                                    Style="margin: -5px;" />
                                                No
                                            </td>
                                            <td style="width: 13%">
                                                Number Installed:
                                            </td>
                                            <td style="width: 6%">
                                                <asp:TextBox ID="page11_txt_NumberInstall" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                    font-weight: normal; color: rgb(0, 0, 0); width: 90%;"></asp:TextBox>
                                            </td>
                                            <td style="width: 12%">
                                                Filter(s) to be cleaned in the system?
                                            </td>
                                            <td style="width: 11%">
                                                <asp:RadioButton ID="rdo_FilterCleaned_Yes" runat="server" GroupName="FilterCleaned"
                                                    Style="margin: -5px;" />
                                                Yes
                                                <asp:RadioButton ID="rdo_FilterCleaned_No" runat="server" GroupName="FilterCleaned"
                                                    Style="margin: -5px;" />
                                                No
                                            </td>
                                            <td style="width: 14%">
                                                Number Cleaned:
                                            </td>
                                            <td style="width: 5%">
                                                <asp:TextBox ID="txt_NumberCleaned" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                    font-weight: normal; color: rgb(0, 0, 0); width: 90%;"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Coils to be cleaned?
                                    <asp:RadioButton ID="rdo_CoilsCleaned_Yes" runat="server" GroupName="CoilsCleaned" />
                                    Yes
                                    <asp:RadioButton ID="rdo_CoilsCleaned_No" runat="server" GroupName="CoilsCleaned" />
                                    No &nbsp; &nbsp; Heat Pump to be replaced?
                                    <asp:RadioButton ID="rdo_HeatPumpReplaced_Yes" runat="server" GroupName="HeatPumpReplaced" />
                                    Yes
                                    <asp:RadioButton ID="rdo_HeatPumpReplaced_No" runat="server" GroupName="HeatPumpReplaced" />
                                    No &nbsp; &nbsp; Size of Unit:<asp:TextBox ID="page11_txt_SizeUnit" runat="server"
                                        Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                        color: rgb(0, 0, 0); width: 90px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="90%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td style="width: 45%;">
                                                <strong>Duct work Sealing and/or Duct Installation: Are there obvious duct leaks in
                                                    any duct work that is outside the thermal boundary? </strong>
                                            </td>
                                            <td style="width: 20%;">
                                                <asp:RadioButton ID="page11_rdo_DuctWork_Yes" runat="server" GroupName="DuctWork11" />
                                                Yes
                                                <asp:RadioButton ID="page11_rdo_DuctWork_No" runat="server" GroupName="DuctWork11" />
                                                No
                                            </td>
                                            <td style="width: 20%;">
                                                Location:
                                                <asp:TextBox ID="txt_DuctWorkLocation" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                    font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td style="width: 30%;">
                                                Insulation to be installed?
                                                <asp:RadioButton ID="page11_rdo_InsulationInstall_Yes" runat="server" GroupName="InsulationInstalled11" />
                                                Yes
                                                <asp:RadioButton ID="page11_rdo_InsulationInstall_No" runat="server" GroupName="InsulationInstalled11" />
                                                No
                                            </td>
                                            <td style="width: 30%;">
                                                Sealing to be completed?
                                                <asp:RadioButton ID="rdo_SealingComplete_Yes" runat="server" GroupName="SealingComplete" />
                                                Yes
                                                <asp:RadioButton ID="rdo_SealingComplete_No" runat="server" GroupName="SealingComplete" />
                                                No
                                            </td>
                                            <td style="width: 18%;">
                                                <strong>Heat pump energy education pamphlet provided to customer?</strong>
                                            </td>
                                            <td style="width: 14%;">
                                                <asp:RadioButton ID="rdo_PumpPamphletProvide_Yes" runat="server" GroupName="PumpPamphletProvide" />
                                                Yes
                                                <asp:RadioButton ID="rdo_PumpPamphletProvide_No" runat="server" GroupName="PumpPamphletProvide" />
                                                No
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                                        <tr>
                                            <td valign="top" style="width: 10%;">
                                                Comments: &nbsp; &nbsp;
                                            </td>
                                            <td>
                                                <asp:TextBox ID="page11_txt_Comment" TextMode="MultiLine" runat="server" Height="50px"
                                                    Width="97%"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td style="width: 28%;">
                                                <strong>Electric Heat:</strong> Type of Heating System:
                                            </td>
                                            <td style="width: 19%;">
                                                <asp:RadioButton ID="rdo_TypeHeating_ElectricBaseboard" runat="server" GroupName="TypeHeating"
                                                    Style="margin: -5px;" />
                                                1 Electric Baseboard
                                            </td>
                                            <td style="width: 20%;">
                                                <asp:RadioButton ID="rdo_TypeHeating_ElectricHeatPump" Visible="false" runat="server"
                                                    GroupName="TypeHeating" Style="margin: -5px;" />
                                                <%--2. Electric Heat Pump--%>
                                                <asp:RadioButton ID="rdo_TypeHeating_ElectricBoiler" runat="server" GroupName="TypeHeating"
                                                    Style="margin: -5px;" />
                                                2. Electric Boiler
                                            </td>
                                            <td style="width: 16%;">
                                                <asp:RadioButton ID="rdo_TypeHeating_ElectricFurnace" runat="server" GroupName="TypeHeating"
                                                    Style="margin: -5px;" />
                                                3. Electric Furnace
                                            </td>
                                            <td style="width: 20%;">
                                                <asp:RadioButton ID="rdo_TypeHeating_ElectricRadiant" runat="server" GroupName="TypeHeating"
                                                    Style="margin: -5px;" />
                                                4. Electric Radiant
                                            </td>
                                        </tr>
                                        <tr>
                                            <%--                                            <td>
                                            </td>--%>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdo_TypeHeating_ElectricWallBlowers" runat="server" GroupName="TypeHeating"
                                                    Style="margin: -5px;" />
                                                5. Electric Wall Blowers
                                            </td>
                                            <td colspan="3">
                                                <asp:RadioButton ID="rdo_TypeHeating_Other" runat="server" GroupName="TypeHeating"
                                                    Style="margin: -5px;" />
                                                99. Other(Please describe)
                                                <asp:TextBox ID="txt_TypeHeating_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                    font-weight: normal; color: rgb(0, 0, 0); width: 220px;"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div style="border: 1px solid #000; width: 100%;">
                            What are customer's Electric Heat thermostat use habits?
                            <asp:TextBox ID="txt_ElectricHeatThermostatUse" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 62%; font-weight: normal; color: rgb(0, 0, 0);
                                width: 57%;" Width="57%"></asp:TextBox>
                            <br />
                            <br />
                            Is the thermostat(s) accurate?
                            <asp:RadioButton ID="rdo_ThermostatAccurate2_Yes" runat="server" GroupName="ThermostatAccurate2" />
                            Yes
                            <asp:RadioButton ID="rdo_ThermostatAccurate2_No" runat="server" GroupName="ThermostatAccurate2" />
                            No
                            <asp:RadioButton ID="rdo_ThermostatAccurate2_IfNot" runat="server" GroupName="ThermostatAccurate2" />If
                            not, why?
                            <asp:TextBox ID="txt_ThermostatAccurate" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 52%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <br />
                            <br />
                            Do you recommend replacement of thermostats?
                            <asp:RadioButton ID="page11_rdo_ReplacementThermostat_Yes" runat="server" GroupName="ReplacementThermostats11" />
                            Yes
                            <asp:RadioButton ID="page11_rdo_ReplacementThermostat_No" runat="server" GroupName="ReplacementThermostats11" />
                            No &nbsp; &nbsp; Explain Details:
                            <asp:TextBox ID="txt_ReplacementThermostats_Details" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 37%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <br />
                            <br />
                            Is filter slot covered?
                            <asp:RadioButton ID="rdo_FilterSlotCovere_Yes" runat="server" GroupName="FilterSlotCovere" />
                            Yes
                            <asp:RadioButton ID="rdo_FilterSlotCovere_No" runat="server" GroupName="FilterSlotCovere" />
                            No &nbsp; &nbsp; If no, install cover. &nbsp; &nbsp; Provide Locations of Thermostats:<asp:TextBox
                                ID="txt_LocationsThermostat" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 30%; font-weight: normal; color: rgb(0, 0, 0);" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            Clean/Tune?
                            <asp:RadioButton ID="rdo_CleanTune2_Yes" runat="server" GroupName="CleanTune2" />
                            Yes
                            <asp:RadioButton ID="rdo_CleanTune2_No" runat="server" GroupName="CleanTune2" />
                            No
                            <br />
                            <br />
                            If clean and tune recommended, why?
                            <asp:TextBox ID="txt_CleanTuneRecommended2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                width: 62%; font-weight: normal; color: rgb(0, 0, 0); width: 71%;"></asp:TextBox>
                            <br />
                            <br />
                            New filter(s) installed in the system?
                            <asp:RadioButton ID="rdo_FilterInstalled_Yes" runat="server" GroupName="FilterInstalled" />
                            Yes
                            <asp:RadioButton ID="rdo_FilterInstalled_No" runat="server" GroupName="FilterInstalled" />
                            No &nbsp; &nbsp; Number Installed:
                            <asp:TextBox ID="txt_NumberInstall2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                            <br />
                            <br />
                            Filter(s) to be cleaned in the system?
                            <asp:RadioButton ID="page11_rdo_FilterClean_Yes" runat="server" GroupName="FilterClean11" />
                            Yes
                            <asp:RadioButton ID="page11_rdo_FilterClean_No" runat="server" GroupName="FilterClean11" />
                            No &nbsp; &nbsp; Number Cleaned:
                            <asp:TextBox ID="page11_txt_NumberClean" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                            <br />
                            <br />
                            Electric heater to be replaced?
                            <asp:RadioButton ID="rdo_ElectricHeaterReplaced_Yes" runat="server" GroupName="ElectricHeaterReplaced" />
                            Yes
                            <asp:RadioButton ID="rdo_ElectricHeaterReplaced_No" runat="server" GroupName="ElectricHeaterReplaced" />
                            No &nbsp; &nbsp; Size of Unit:
                            <asp:TextBox ID="txt_ElectricHeaterReplaced_SizeUnit" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                width: 90px;"></asp:TextBox>
                            <br />
                            <br />
                            Any electric heating system repairs?
                            <asp:RadioButton ID="rdo_ElectricHeatRepair_Yes" runat="server" GroupName="ElectricHeatRepair" />
                            Yes
                            <asp:RadioButton ID="rdo_ElectricHeatRepair_No" runat="server" GroupName="ElectricHeatRepair" />
                            No &nbsp; &nbsp; Explain Details:
                            <asp:TextBox ID="txt_ElectricHeatRepair_Detail" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <br />
                            <br />
                            Does family use electric space heaters INSTEAD of or in addition to their primary
                            heat source?
                            <asp:RadioButton ID="rdo_PriHeatSource_Yes" runat="server" GroupName="PriHeatSource1" />
                            Yes
                            <asp:RadioButton ID="rdo_PriHeatSource_No" runat="server" GroupName="PriHeatSource1" />
                            No &nbsp; &nbsp; Location:
                            <asp:TextBox ID="txt_PriHeatSourceLocation" runat="server" Style="width: 10%; text-align: center;
                                border: none; border-bottom: solid 1px rgb(0, 0, 0); padding-bottom: 5px; font-weight: bold;
                                font-size: 12px; color: #666666;"></asp:TextBox><%--width="250px"--%>
                            <br />
                            <br />
                            If PCAP customer answers yes, good opportunity to explain his/her program responsibilities
                            <br />
                            <br />
                            <strong>Duct work Sealing and/or Duct Installation: Are there obvious duct leaks in
                                any duct work that is outside the thermal boundary?</strong><br />
                            <asp:RadioButton ID="rdo_DuctWork2_Yes" runat="server" GroupName="DuctWork2" />
                            Yes
                            <asp:RadioButton ID="rdo_DuctWork2_No" runat="server" GroupName="DuctWork2" />
                            No Location:
                            <asp:TextBox ID="txt_DuctWork2Location" runat="server" Style="width: 13%; text-align: center;
                                border: none; border-bottom: solid 1px rgb(0, 0, 0); padding-bottom: 5px; font-weight: bold;
                                font-size: 12px; color: #666666;" Width="13%"></asp:TextBox><%--width="250px"--%>
                            Insulation to be installed?
                            <asp:RadioButton ID="rdo_InsulationInstal2_Yes" runat="server" GroupName="InsulationInstal2" />
                            Yes
                            <asp:RadioButton ID="rdo_InsulationInstal2_No" runat="server" GroupName="InsulationInstal2" />
                            No &nbsp; &nbsp; Sealing to be completed?
                            <asp:RadioButton ID="rdo_SealingComplete2_Yes" runat="server" GroupName="SealingComplete2" />
                            Yes
                            <asp:RadioButton ID="rdo_SealingComplete2_No" runat="server" GroupName="SealingComplete2" />
                            No
                            <br />
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 10px 0;">
                                <tr>
                                    <td valign="top" style="width: 10%;">
                                        Comments: &nbsp; &nbsp;
                                    </td>
                                    <td>
                                        <asp:TextBox ID="page11_txt_Comment2" runat="server" Height="50px" Width="97%" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <%--Page 11 End--%>
                    <%--Page 12 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <div style="border: 1px solid #000; width: 100%;">
                            <table width="100%" border="0" cellspacing="6" cellpadding="6">
                                <tr>
                                    <td valign="top">
                                        <b>Fossil Fuel Heating Assessment</b>
                                    </td>
                                    <td>
                                        <span style="font-size: 16px;">Primary Heating Source:</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Add additional
                                            <br />
                                            duct run?</strong>
                                        <asp:RadioButton ID="rdo_AddDuctRun_Yes" runat="server" GroupName="AddDuctRun" />
                                        Yes
                                        <asp:RadioButton ID="rdo_AddDuctRun_No" runat="server" GroupName="AddDuctRun" />
                                        No
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rdo_PriHeatSource_UtilityGas" runat="server" GroupName="PriHeatSource" />
                                        1. Utility Gas
                                        <asp:RadioButton ID="rdo_PriHeatSource_FuelOil" runat="server" GroupName="PriHeatSource" />
                                        2. Fuel Oil
                                        <asp:RadioButton ID="rdo_PriHeatSource_Wood" runat="server" GroupName="PriHeatSource" />
                                        3. Wood
                                        <asp:RadioButton ID="rdo_PriHeatSource_Coal" runat="server" GroupName="PriHeatSource" />
                                        4. Coal
                                        <asp:RadioButton ID="rdo_PriHeatSource_Solar" runat="server" GroupName="PriHeatSource" />
                                        5. Solar
                                        <br />
                                        <asp:RadioButton ID="rdo_PriHeatSource_CitySteam" runat="server" GroupName="PriHeatSource" />
                                        6. City Steam
                                        <asp:RadioButton ID="rdo_PriHeatSource_BottleGas" runat="server" GroupName="PriHeatSource" />
                                        7. Bottled Gas/ Propane
                                        <asp:RadioButton ID="rdo_PriHeatSource_Kerosene" runat="server" GroupName="PriHeatSource" />
                                        8. Kerosene
                                        <asp:RadioButton ID="rdo_PriHeatSource_Other" runat="server" GroupName="PriHeatSource" />
                                        99. Other (please describe)
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td>
                                    </td>
                                    <td>
                                       
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td colspan="2">
                                        Would minor retrofitting reduce the need for supplemental electric space heating?
                                        <asp:RadioButton ID="rdo_ElectricSpaceHeat_Yes" runat="server" GroupName="ElectricSpaceHeat" />
                                        Yes
                                        <asp:RadioButton ID="rdo_ElectricSpaceHeat_No" runat="server" GroupName="ElectricSpaceHeat" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                                            <tr>
                                                <td valign="top" style="width: 12%;">
                                                    List measures installed
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_ListMeasureInstall" runat="server" Height="100px" Width="97%"
                                                        TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="border: 1px solid #000; width: 100%; margin-top: 10px;">
                            <strong>Structure Assessment</strong>
                            <br />
                            A blower door test must be conducted if: the home has installed electric heat, AC
                            is present with summer seasonal use of at least 2000 kWh, or electric space heaters
                            are present with winter seasonal use of at least 2000 kWh. Use the <i><b>Blower Door
                                Testing Information Sheet</b></i> to document the <i><b>Building Airflow Standard</b></i>
                            (BAS), and the testing results.
                            <table width="100%" border="0" cellspacing="3" cellpadding="5">
                                <tr>
                                    <td valign="top">
                                        If blower door test is not being completed, why?
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txt_BlowerDoorTet_NotComplete" runat="server" Width="97%" Height="50px"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        If the blower door test indicates air sealing is to be performed, indicate location
                                        of air leaks.
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%;">
                                        Location of air leaks:
                                    </td>
                                    <td style="width: 25%;">
                                        <asp:TextBox ID="txt_Location_1_AirLeaks" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 50%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        <%--Width="270px%"--%>
                                    </td>
                                    <td style="width: 20%;">
                                        Location of air leaks:
                                    </td>
                                    <td style="width: 25%;">
                                        <asp:TextBox ID="txt_Location_2_AirLeaks" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 50%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><%--Width="270px%"--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%;">
                                        Location of air leaks:
                                    </td>
                                    <td style="width: 25%;">
                                        <asp:TextBox ID="txt_Location_3_AirLeaks" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 50%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><%--Width="270px%"--%>
                                    </td>
                                    <td style="width: 20%;">
                                        Location of air leaks:
                                    </td>
                                    <td style="width: 25%;">
                                        <asp:TextBox ID="txt_Location_4_AirLeaks" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 50%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><%--Width="270px%"--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        Live Knob & Tube?
                                        <asp:RadioButton ID="rdo_LiveKnobTube_Yes" runat="server" GroupName="LiveKnobTube" />
                                        Yes
                                        <asp:RadioButton ID="rdo_LiveKnobTube_No" runat="server" GroupName="LiveKnobTube" />
                                        No &nbsp; &nbsp; Location:
                                        <asp:TextBox ID="txt_LiveKnobTube_Location" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 270px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        &nbsp; &nbsp; Abatement:
                                        <asp:RadioButton ID="rdo_Abatement_Yes" runat="server" GroupName="Abatement" />
                                        Yes
                                        <asp:RadioButton ID="rdo_Abatement_No" runat="server" GroupName="Abatement" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        Evidence of Mold?
                                        <asp:RadioButton ID="rdo_EvidenceMold_Yes" runat="server" GroupName="EvidenceMold" />
                                        Yes
                                        <asp:RadioButton ID="rdo_EvidenceMold_No" runat="server" GroupName="EvidenceMold" />
                                        No &nbsp; &nbsp; Evidence of moisture, water?
                                        <asp:RadioButton ID="rdo_EvidenceMoisture_Yes" runat="server" GroupName="EvidenceMoisture" />
                                        Yes
                                        <asp:RadioButton ID="rdo_EvidenceMoisture_No" runat="server" GroupName="EvidenceMoisture" />
                                        No &nbsp; &nbsp; Location:
                                        <asp:TextBox ID="txt_EvidenceMoisture_Location" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 27%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Document any structural problems such as roof leaks, poor drainage, etc, here.
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txt_AnyStructuralProb" runat="server" Width="97%" Height="100px"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="border: 1px solid #000; width: 100%;">
                            <strong>Mechanical Ventilation</strong>
                            <table width="100%" border="0" cellspacing="1" cellpadding="5">
                                <tr>
                                    <td>
                                        <strong>Kitchen:</strong>
                                    </td>
                                    <td>
                                        Existing:
                                        <asp:RadioButton ID="rdo_Kitchen_Existing_Yes" runat="server" GroupName="Kitchen_Existing" />
                                        Yes
                                        <asp:RadioButton ID="rdo_Kitchen_Existing_No" runat="server" GroupName="Kitchen_Existing" />
                                        No Measured Fan Flow
                                        <asp:TextBox ID="txt_Kitchen_MeasuredFanFlow" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 80px;"></asp:TextBox>
                                        CFM Add
                                        <asp:RadioButton ID="rdo_Kitchen_CFM_Yes" runat="server" GroupName="Kitchen_CFM" />
                                        Yes
                                        <asp:RadioButton ID="rdo_Kitchen_CFM_No" runat="server" GroupName="Kitchen_CFM" />
                                        No
                                        <asp:CheckBox ID="chk_Kitchen_VentRecirculates" runat="server" />
                                        Vents out Recirculates
                                        <asp:TextBox ID="txt_Kitchen_VentRecirculates" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 80px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Comments:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Kitchen_Comment" runat="server" Width="95%" Height="100px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>1st Floor Bathrooms:</strong> Existing:
                                        <asp:RadioButton ID="rdo_1stFloorBathrooms_Exist_Yes" runat="server" GroupName="1stFloorBathrooms_Exist" />
                                        Yes
                                        <asp:RadioButton ID="rdo_1stFloorBathrooms_Exist_No" runat="server" GroupName="1stFloorBathrooms_Exist" />
                                        No &nbsp; &nbsp; Measured Fan Flow<asp:TextBox ID="txt_1stFloorBathrooms_MeasuredFanFlow"
                                            runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                            color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        &nbsp; &nbsp; CFM Add:
                                        <asp:RadioButton ID="rdo_1stFloorBathrooms_CFM_Yes" runat="server" GroupName="1stFloorBathrooms_CFM" />
                                        Yes
                                        <asp:RadioButton ID="rdo_1stFloorBathrooms_CFM_No" runat="server" GroupName="1stFloorBathrooms_CFM" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    Light in
                                                    <br />
                                                    existing:
                                                    <asp:RadioButton ID="rdo_1stFloorBathrooms_LightExist_Yes" runat="server" GroupName="1stFloorBathrooms_LightExist" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_1stFloorBathrooms_LightExist_No" runat="server" GroupName="1stFloorBathrooms_LightExist" />
                                                    No
                                                </td>
                                                <td>
                                                    Replacement<br />
                                                    requires light:
                                                    <asp:RadioButton ID="rdo_1stFloorBathrooms_ReplaceLight_Yes" runat="server" GroupName="1stFloorBathrooms_ReplaceLight" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_1stFloorBathrooms_ReplaceLight_No" runat="server" GroupName="1stFloorBathrooms_ReplaceLight" />
                                                    No
                                                </td>
                                                <td>
                                                    Is the fan on<br />
                                                    its own switch?
                                                    <asp:RadioButton ID="rdo_1stFloorBathrooms_FanOwnSwitch_Yes" runat="server" GroupName="1stFloorBathrooms_FanOwnSwitch" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_1stFloorBathrooms_FanOwnSwitch_No" runat="server" GroupName="1stFloorBathrooms_FanOwnSwitch" />
                                                    No
                                                </td>
                                                <td>
                                                    Is fan on<br />
                                                    shared switch?
                                                    <asp:RadioButton ID="rdo_1stFloorBathrooms_FanShareSwitch_Yes" runat="server" GroupName="1stFloorBathrooms_FanShareSwitch" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_1stFloorBathrooms_FanShareSwitch_No" runat="server" GroupName="1stFloorBathrooms_FanShareSwitch" />
                                                    No
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Comments:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_1stFloorBathrooms_Comment" runat="server" Width="95%" Height="100px"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>2nd Floor Bathrooms:</strong> Existing:
                                        <asp:RadioButton ID="rdo_2ndFloorBathrooms_Exist_Yes" runat="server" GroupName="2ndFloorBathrooms_Exist" />
                                        Yes
                                        <asp:RadioButton ID="rdo_2ndFloorBathrooms_Exist_No" runat="server" GroupName="2ndFloorBathrooms_Exist" />
                                        No &nbsp; &nbsp; Measured Fan Flow<asp:TextBox ID="txt_2ndFloorBathrooms_MeasuredFanFlow"
                                            runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                            color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        &nbsp; &nbsp; CFM Add:
                                        <asp:RadioButton ID="rdo_2ndFloorBathrooms_CFM_Yes" runat="server" GroupName="2ndFloorBathrooms_CFM" />
                                        Yes
                                        <asp:RadioButton ID="rdo_2ndFloorBathrooms_CFM_No" runat="server" GroupName="2ndFloorBathrooms_CFM" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    Light in
                                                    <br />
                                                    existing:
                                                    <asp:RadioButton ID="rdo_2ndFloorBathrooms_LightExist_Yes" runat="server" GroupName="2ndFloorBathrooms_LightExist" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_2ndFloorBathrooms_LightExist_No" runat="server" GroupName="2ndFloorBathrooms_LightExist" />
                                                    No
                                                </td>
                                                <td>
                                                    Replacement<br />
                                                    requires light:
                                                    <asp:RadioButton ID="rdo_2ndFloorBathrooms_ReplaceLight_Yes" runat="server" GroupName="2ndFloorBathrooms_ReplaceLight" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_2ndFloorBathrooms_ReplaceLight_No" runat="server" GroupName="2ndFloorBathrooms_ReplaceLight" />
                                                    No
                                                </td>
                                                <td>
                                                    Is the fan on
                                                    <br />
                                                    its own switch?
                                                    <asp:RadioButton ID="rdo_2ndFloorBathrooms_FanOwnSwitch_Yes" runat="server" GroupName="2ndFloorBathrooms_FanOwnSwitch" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_2ndFloorBathrooms_FanOwnSwitch_No" runat="server" GroupName="2ndFloorBathrooms_FanOwnSwitch" />
                                                    No
                                                </td>
                                                <td>
                                                    Is fan on
                                                    <br />
                                                    shared switch?
                                                    <asp:RadioButton ID="rdo_2ndFloorBathrooms_FanShareSwitch_Yes" runat="server" GroupName="2ndFloorBathrooms_FanShareSwitch" />
                                                    Yes
                                                    <asp:RadioButton ID="rdo_2ndFloorBathrooms_FanShareSwitch_No" runat="server" GroupName="2ndFloorBathrooms_FanShareSwitch" />
                                                    No
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Comments:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_2ndFloorBathrooms_Comment" runat="server" Width="95%" Height="100px"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>If adding a fan:</strong>
                                    </td>
                                    <td>
                                        Ceiling:
                                        <asp:RadioButton ID="rdo_AddFan_Ceiling_Yes" runat="server" GroupName="AddFan_Ceiling" />
                                        Yes
                                        <asp:RadioButton ID="rdo_AddFan_Ceiling_No" runat="server" GroupName="AddFan_Ceiling" />
                                        No &nbsp; &nbsp; Size:<asp:TextBox ID="txt_AddFan_Ceiling_Size" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;Location:<asp:TextBox ID="txt_Ceiling_Location1" runat="server"
                                            Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                            color: rgb(0, 0, 0); width: 170px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        Wall:
                                        <asp:RadioButton ID="rdo_AddFan_Wall_Yes" runat="server" GroupName="AddFan_Wall" />
                                        Yes
                                        <asp:RadioButton ID="rdo_AddFan_Wall_No" runat="server" GroupName="AddFan_Wall" />
                                        No &nbsp; &nbsp; Size:<asp:TextBox ID="txt_AddFan_Wall_Size" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;Location:<asp:TextBox ID="txt_Wall_Location" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 170px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <%--Page 12 End--%>
                    <%--Page 13 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <table border="1px" width="100%" cellpadding="7" cellspacing="15">
                            <tr>
                                <td style="width: 50%; height: 400px; vertical-align: top;">
                                    <strong>Attic</strong>
                                </td>
                                <td style="width: 50%; height: 400px; vertical-align: top;">
                                    <strong>2nd Fl</strong>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%; height: 400px; vertical-align: top;">
                                    <strong>Basement</strong>
                                </td>
                                <td style="width: 50%; height: 400px; vertical-align: top;">
                                    <strong>1st Fl</strong>
                                </td>
                            </tr>
                        </table>
                        <!--   <div style="border: 1px solid #000; width: 100%; height: auto;">
                            <div style="border-right: 1px solid #000; border-bottom: 1px solid #000; width: 50%;
                                float: left; min-height: 400px;">
                                <strong>Attic</strong></div>
                            <div style="width: 49%; float: left;border-right: 1px solid #000;
border-bottom: 1px solid #000;">
                                <strong>2nd Fl</strong></div>
                            <div class="clear">
                            </div>
                        </div>
                        <div style="border: 1px solid #000; width: 100%; height: auto; margin-bottom: 20px;">
                            <div style="border-right: 1px solid #000; width: 50%; float: left; min-height: 400px;border-right: 1px solid #000;
border-bottom: 1px solid #000;">
                                <strong>Basement</strong></div>
                            <div style="width: 49%; float: left;border-right: 1px solid #000;min-height: 400px;
border-bottom: 1px solid #000;">
                                <strong>1st Fl</strong></div>
                            <div class="clear">
                            </div>
                        </div> -->
                        <table width="100%" border="0" cellspacing="15" cellpadding="15">
                            <tr>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">A</span>
                                </td>
                                <td>
                                    Access
                                </td>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">V</span>
                                </td>
                                <td>
                                    Ventilation
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">H</span>
                                </td>
                                <td>
                                    Recessed heat producing device
                                </td>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 7px; border-radius: 50px;">01</span>
                                </td>
                                <td>
                                    Other
                                    <asp:TextBox ID="txt_Line1_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">D</span>
                                </td>
                                <td>
                                    Dropped soffit/ceiling/bulkhead
                                </td>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 7px; border-radius: 50px;">02</span>
                                </td>
                                <td>
                                    Other
                                    <asp:TextBox ID="txt_Line2_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 13px; border-radius: 50px;">I</span>
                                </td>
                                <td>
                                    Existing insulation
                                </td>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 7px; border-radius: 50px;">03</span>
                                </td>
                                <td>
                                    Other
                                    <asp:TextBox ID="txt_Line3_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">S</span>
                                </td>
                                <td>
                                    Stored Items
                                </td>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 7px; border-radius: 50px;">04</span>
                                </td>
                                <td>
                                    Other
                                    <asp:TextBox ID="txt_Line4_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">F</span>
                                </td>
                                <td>
                                    Floor
                                </td>
                                <td>
                                    <span style="border: solid 1px #000; padding: 5px 7px; border-radius: 50px;">05</span>
                                </td>
                                <td>
                                    Other
                                    <asp:TextBox ID="txt_Line15_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <%--Page 13 End--%>
                    <%--Page 14 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <strong>Basement/Crawl Spaces/Mobile Home Belly</strong>
                        <br />
                        <div class="newtable" style="border: 1px solid #000; height: auto;">
                            <strong>Basement Air Sealing:</strong>
                            <br />
                            <asp:CheckBox ID="chk_BasementAirSealing_Perimeter" runat="server" onclick="ChkBox_BasementAirSealing(this.id)" />
                            Perimeter (doors, windows, rim joist, walls)
                            <asp:CheckBox ID="chk_BasementAirSealing_Ceiling" runat="server" onclick="ChkBox_BasementAirSealing(this.id)" />
                            Ceiling
                            <asp:CheckBox ID="chk_BasementAirSealing_Ducts" runat="server" onclick="ChkBox_BasementAirSealing(this.id)" />
                            Ducts
                            <asp:CheckBox ID="chk_BasementAirSealing_Other" runat="server" onclick="ChkBox_BasementAirSealing(this.id)" />
                            Other
                            <asp:TextBox ID="txt_BasementAirSealing_Other" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                            <br />
                            Decide if the basement and/or crawl space is inside/outside the thermal and pressure
                            boundaries. Then decide if air sealing/insulation should be at the basement and/or
                            crawl space perimeter or at ceiling.
                            <br />
                            <strong>Insulation:</strong>
                            <table width="100%" border="1" cellspacing="3" cellpadding="3">
                                <tr>
                                    <td align="center">
                                        Area
                                    </td>
                                    <td align="center">
                                        Location
                                    </td>
                                    <td align="center">
                                        Sq Ft
                                    </td>
                                    <td align="center">
                                        Existing Effective R Value
                                    </td>
                                    <td align="center">
                                        Add R
                                    </td>
                                    <td align="center">
                                        New Insulation Type
                                    </td>
                                    <td align="center">
                                        Comments (such as joists running lengthwise or widthwise - 16" or 24" joist bay
                                        size)
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" width="12%">
                                        Floor/Crawl Space
                                    </td>
                                    <td width="14%">
                                        <asp:TextBox ID="txt_FloorCrawlSpace_Location" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td width="7%">
                                        <asp:TextBox ID="txt_FloorCrawlSpace_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td width="14%">
                                        <asp:TextBox ID="txt_FloorCrawlSpace_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td width="7%">
                                        <asp:TextBox ID="txt_FloorCrawlSpace_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td width="15%">
                                        <asp:TextBox ID="txt_FloorCrawlSpace_Insulation" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FloorCrawlSpace_Comment" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Perimeter
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Perimeter_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Perimeter_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Perimeter_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Perimeter_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Perimeter_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Perimeter_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Other
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Belly
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Belly_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Belly_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Belly_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Belly_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Belly_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Belly_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            Install ground cover:
                            <asp:RadioButton ID="rdo_GroundCover_Yes" runat="server" GroupName="GroundCover" />
                            Yes
                            <asp:RadioButton ID="rdo_GroundCover_No" runat="server" GroupName="GroundCover" />
                            No &nbsp; &nbsp; If so, sq ft installed:<asp:TextBox ID="txt_GroundCover_SqFt_Instal"
                                runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                            <br />
                            <br />
                        </div>
                        <strong>Are there any kneewalls?</strong>
                        <asp:RadioButton ID="rdo_AnyKneewall_Yes" runat="server" GroupName="AnyKneewall" />
                        Yes
                        <asp:RadioButton ID="rdo_AnyKneewall_No" runat="server" GroupName="AnyKneewall" />
                        No &nbsp; &nbsp; <strong>Are they air sealed or blocked at the joist bays?</strong>
                        <asp:RadioButton ID="rdo_JoistBays_Yes" runat="server" GroupName="JoistBays" />
                        Yes
                        <asp:RadioButton ID="rdo_JoistBays_No" runat="server" GroupName="JoistBays" />
                        No &nbsp; &nbsp; <strong>If not, please block them!</strong>
                        <br />
                        <strong>Insulation:</strong>
                        <asp:CheckBox ID="chk_Insulation_Heating" runat="server" onclick="ChkBox_Insulation(this.id)" />
                        Heating
                        <asp:CheckBox ID="chk_Insulation_Cooling" runat="server" onclick="ChkBox_Insulation(this.id)" />
                        Cooling
                        <div class="newtable">
                            <table width="100%" border="1" cellspacing="2" cellpadding="2">
                                <tr>
                                    <td align="center">
                                        Area
                                    </td>
                                    <td align="center">
                                        Location
                                    </td>
                                    <td align="center">
                                        Sq Ft
                                    </td>
                                    <td align="center">
                                        Existing Effective R Value
                                    </td>
                                    <td align="center">
                                        Add R
                                    </td>
                                    <td align="center">
                                        New Insulation Type
                                    </td>
                                    <td align="center">
                                        Comments
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" width="12%">
                                        Unfloored Attic 1
                                    </td>
                                    <td width="14%">
                                        <asp:TextBox ID="txt_UnflooredAttic1_Location" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td width="7%">
                                        <asp:TextBox ID="txt_UnflooredAttic1_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td width="15%">
                                        <asp:TextBox ID="txt_UnflooredAttic1_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td width="7%">
                                        <asp:TextBox ID="txt_UnflooredAttic1_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td width="14%">
                                        <asp:TextBox ID="txt_UnflooredAttic1_Insulation" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic1_Comment" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Unfloored Attic 2
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic2_Location" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic2_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic2_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic2_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic2_Insulation" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic2_Comment" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Unfloored Attic 3
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic3_Location" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic3_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic3_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic3_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic3_Insulation" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UnflooredAttic3_Comment" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Floored Attic 1
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic1_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic1_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic1_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic1_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic1_Insulation" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic1_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Floored Attic 2
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic2_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic2_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic2_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic2_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic2_Insulation" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FlooredAttic2_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Cathedral
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Cathedral_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Cathedral_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Cathedral_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Cathedral_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Cathedral_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Cathedral_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Finished Attic
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FinishedAttic_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FinishedAttic_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FinishedAttic_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FinishedAttic_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FinishedAttic_Insulation" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FinishedAttic_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Kneewall Floored
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallFloored_Location" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallFloored_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallFloored_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallFloored_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallFloored_Insulation" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallFloored_Comment" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Kneewall Unfloored
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallUnfloored_Location" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallUnfloored_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallUnfloored_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallUnfloored_Add_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallUnfloored_Insulation" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_KneewallUnfloored_Comment" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Slopes
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Slope_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Slope_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Slope_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Slope_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Slope_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Slope_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Vertical Kneewall
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall_Location" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall_Insulation" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall_Comment" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Vertical Kneewall
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall2_Location" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall2_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall2_ExistEffect_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall2_Add_R" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall2_Insulation" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_VerticalKneewall2_Comment" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Area1" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area1_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area1_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area1_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area1_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area1_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area1_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Area2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area2_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area2_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area2_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area2_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area2_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area2_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Area3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area3_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area3_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area3_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area3_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area3_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Area3_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <p>
                                <strong>Attic Ventilation</strong></p>
                            <table width="100%" border="1" cellspacing="1" cellpadding="2">
                                <tr>
                                    <td align="center">
                                        Ventilation Type
                                    </td>
                                    <td align="center">
                                        Proposed Additional Ventilation
                                    </td>
                                    <td align="center">
                                        Location
                                    </td>
                                    <td align="center">
                                        Comments
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" width="25%">
                                        Roof Vent
                                    </td>
                                    <td width="25%">
                                        <asp:TextBox ID="txt_RoofVent_PropeseAddVent" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td width="25%">
                                        <asp:TextBox ID="txt_RoofVent_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RoofVent_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Gable Vent
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_GableVent_PropeseAddVent" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_GableVent_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_GableVent_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Soffit Vent
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_SoffitVent_ProposeAddVent" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_SoffitVent_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_SoffitVent_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Ridge Vent
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RidgeVent_ProposeAddVent" runat="server" Style="width: 100%;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RidgeVent_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RidgeVent_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td valign="top" style="width: 10%;">
                                    Comments: &nbsp; &nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txt14_Comment" runat="server" Height="60px" Width="97%" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <%--Page 14 End--%>
                    <%--Page 15 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <div class="newtable" style="border: 1px solid #000; height: auto;">
                            <table width="100%" border="0" cellspacing="1" cellpadding="1">
                                <tr>
                                    <td colspan="2">
                                        <strong>Attic Access:</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        Horizontal attic access - insulate to at least equivalent R value of surrounding
                                        surfaces
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rdo_HorizontalAttic_AlreadyDone" runat="server" GroupName="HorizontalAttic" />
                                        Already done
                                        <asp:RadioButton ID="rdo_HorizontalAttic_WillDo" runat="server" GroupName="HorizontalAttic" />
                                        Will do &nbsp; &nbsp; Location:
                                        <asp:TextBox ID="txt_HorizontalAttic_Location" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                        Weather Stripping
                                        <asp:RadioButton ID="rdo_HorizontalAttic_WeatherStripping_Exist" runat="server" GroupName="HorizontalAttic_WeatherStripping" />
                                        Existing
                                        <asp:RadioButton ID="rdo_HorizontalAttic_WeatherStripping_add" runat="server" GroupName="HorizontalAttic_WeatherStripping" />
                                        Add
                                        <br />
                                        # of accesses existing:<asp:TextBox ID="txt_HorizontalAttic_AccesExist" runat="server"
                                            Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                            color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        &nbsp; &nbsp; # of accesses to be added:<asp:TextBox ID="txt_HorizontalAttic_AccesAdd"
                                            runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                            color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Vertical openings - insulate to equivalent R value of surrounding surfaces
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rdo_VerticalOpening_AlreadyDone" runat="server" GroupName="VerticalOpening" />
                                        Already done
                                        <asp:RadioButton ID="rdo_VerticalOpening_WillDo" runat="server" GroupName="VerticalOpening" />
                                        Will do &nbsp; &nbsp; Location:
                                        <asp:TextBox ID="txt_VerticalOpening_Location" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                        Weather Stripping
                                        <asp:RadioButton ID="rdo_VerticalOpening_WeatherStripping_Exist" runat="server" GroupName="VerticalOpening_WeatherStripping" />
                                        Existing
                                        <asp:RadioButton ID="rdo_VerticalOpening_WeatherStripping_Add" runat="server" GroupName="VerticalOpening_WeatherStripping" />
                                        Add
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Pull down stairs - insulate to at least equivalent R value of surrounding surfaces
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rdo_PullDownStairs_AlreadyDone" runat="server" GroupName="PullDownStairs" />
                                        Already done
                                        <asp:RadioButton ID="rdo_PullDownStairs_WillDo" runat="server" GroupName="PullDownStairs" />
                                        Will do &nbsp; &nbsp; Location:
                                        <asp:TextBox ID="txt_PullDownStairs_Location" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                        Weather Stripping
                                        <asp:RadioButton ID="rdo_PullDownStairs_WeatherStripping_Exist" runat="server" GroupName="PullDownStairs_WeatherStripping" />
                                        Existing
                                        <asp:RadioButton ID="rdo_PullDownStairs_WeatherStripping_Add" runat="server" GroupName="PullDownStairs_WeatherStripping" />
                                        Add
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i>Be sure to dam the access if it will remain operable.</i>
                                    </td>
                                    <td>
                                        Recommended?
                                        <asp:RadioButton ID="rdo_Recommended_Yes" runat="server" GroupName="Recommended" />
                                        Yes
                                        <asp:RadioButton ID="rdo_Recommended_No" runat="server" GroupName="Recommended" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Heat Producing Fixtures</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Are there recessed heat producing fixtures:
                                        <asp:RadioButton ID="rdo_RecessedHeatProducingFixtures_Yes" runat="server" GroupName="RecessedHeatProducingFixtures" />
                                        Yes
                                        <asp:RadioButton ID="rdo_RecessedHeatProducingFixtures_No" runat="server" GroupName="RecessedHeatProducingFixtures" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        How many recessed fixtures are there?
                                        <asp:TextBox ID="txt_ManyRecessedFixtures" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        # of lights
                                        <asp:TextBox ID="txt_RecessedFixtures_Light" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                        # of fans
                                        <asp:TextBox ID="txt_RecessedFixtures_Fans" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        # other
                                        <asp:TextBox ID="txt_RecessedFixtures_Other" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>If you are going to insulate the attic floor or air seal the fixtures, please
                                            continue.</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        How many are IC rated?
                                        <asp:TextBox ID="txt_IC_Rated" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        How many are non-IC rated?
                                        <asp:TextBox ID="txt_Non_IC_Rated" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        How many have an unknown rating?
                                        <asp:TextBox ID="txt_Unknown_IC_Rated" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        How many will be dammed to protect them from insulation?<asp:TextBox ID="txt_Protect_Insulation"
                                            runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                            color: rgb(0, 0, 0); width: 80px;"></asp:TextBox>
                                        How many will be air sealed either with sealed dams or with air tight inserts?<asp:TextBox
                                            ID="txt_AirSealed" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 80px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Will customer allow recessed light(s) to be changed out?
                                        <asp:RadioButton ID="rdo_RecessedLightChange_Yes" runat="server" GroupName="RecessedLightChange" />
                                        Yes
                                        <asp:RadioButton ID="rdo_RecessedLightChange_No" runat="server" GroupName="RecessedLightChange" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        How many will be replaced with either air tight, IC rated recessed fixtures, or
                                        surface mounted fixtures?
                                        <asp:TextBox ID="txt_Replace_AirTightICRatedRecessedFixtures" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        How many are under the floored attic and protected with metal dam blocking or fiberglass
                                        batt blocking?
                                        <asp:TextBox ID="txt_HorizontalAttic_DamBlock" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <i>When complete, the recessed fixtures must not leak air into the attic and dams must
                                            be able to be seen from the attic unless they are under the attic floor.</i>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Be sure to dam any chimney flues. Recommended?
                                        <asp:RadioButton ID="rdo_DamChimneyFlues_Yes" runat="server" GroupName="DamChimneyFlues" />
                                        Yes
                                        <asp:RadioButton ID="rdo_DamChimneyFlues_No" runat="server" GroupName="DamChimneyFlues" />
                                        No &nbsp; &nbsp; # of chimneys:
                                        <asp:TextBox ID="txt_DamChimneyFlues" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 80px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="newtable" style="border: 1px solid #000; height: auto; margin-top: 3px;">
                            <table width="100%" border="0" cellspacing="1" cellpadding="1">
                                <tr>
                                    <td>
                                        <strong>Cantilever Overhangs</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Are there cantilever overhangs?
                                        <asp:RadioButton ID="rdo_CantileverOverhangs_Yes" runat="server" GroupName="CantileverOverhangs" />
                                        Yes
                                        <asp:RadioButton ID="rdo_CantileverOverhangs_No" runat="server" GroupName="CantileverOverhangs" />
                                        No &nbsp; &nbsp; Is the underside blocked with an impermeable air barrier?
                                        <asp:RadioButton ID="rdo_ImpermeableAirBarrier_Yes" runat="server" GroupName="ImpermeableAirBarrier" />
                                        Yes
                                        <asp:RadioButton ID="rdo_ImpermeableAirBarrier_No" runat="server" GroupName="ImpermeableAirBarrier" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Are floor joists bays blocked?
                                        <asp:RadioButton ID="rdo_JoistsBaysBlocke_Yes" runat="server" GroupName="JoistsBaysBlocke" />
                                        Yes
                                        <asp:RadioButton ID="rdo_JoistsBaysBlocke_No" runat="server" GroupName="JoistsBaysBlocke" />
                                        No &nbsp; &nbsp; If no, please block these joist bays and insulate.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="1" cellspacing="0" cellpadding="3">
                                            <tr>
                                                <td align="center" width="15%">
                                                    Area
                                                </td>
                                                <td align="center" width="15%">
                                                    Location
                                                </td>
                                                <td align="center">
                                                    Sq Ft
                                                </td>
                                                <td align="center" width="15%">
                                                    Existing Effective R Value
                                                </td>
                                                <td align="center">
                                                    Add R
                                                </td>
                                                <td align="center" width="15%">
                                                    New Insulation Type
                                                </td>
                                                <td align="center" width="30%">
                                                    Comments
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    Cantilever
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever1_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever1_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever1_ExistEffect_R" runat="server" Style="width: 100%;
                                                        border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever1_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever1_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever1_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    Cantilever
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever2_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever2_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever2_ExistEffect_R" runat="server" Style="width: 100%;
                                                        border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever2_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever2_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_Cantilever2_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    Bay Window
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_BayWindow_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_BayWindow_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_BayWindow_ExistEffect_R" runat="server" Style="width: 100%;
                                                        border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_BayWindow_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_BayWindow_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_BayWindow_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="newtable" style="border: 1px solid #000; height: auto;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="1">
                                <tr>
                                    <td>
                                        <strong>Side walls</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Siding Type:
                                        <asp:CheckBox ID="chk_Siding_Wood" runat="server" />
                                        Wood
                                        <asp:CheckBox ID="chk_Siding_Asphalt" runat="server" />
                                        Asphalt
                                        <asp:CheckBox ID="chk_Siding_Stucco" runat="server" />
                                        Stucco
                                        <asp:CheckBox ID="chk_Siding_Aluminum" runat="server" />
                                        Aluminum
                                        <asp:CheckBox ID="chk_Siding_Vinyl" runat="server" />
                                        Vinyl
                                        <asp:CheckBox ID="chk_Siding_Brick" runat="server" />
                                        Brick &nbsp; &nbsp; Other
                                        <asp:TextBox ID="txt_Siding_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Interior Wall Material:
                                        <asp:TextBox ID="txt_InteriorWallMaterial" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 79%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Can side walls be insulated?
                                        <asp:RadioButton ID="rdo_SideWallInsulated_Yes" runat="server" GroupName="SideWallInsulated" />
                                        Yes
                                        <asp:RadioButton ID="rdo_SideWallInsulated_No" runat="server" GroupName="SideWallInsulated" />
                                        No &nbsp; &nbsp; If not, why?
                                        <asp:TextBox ID="txt_SideWallInsulated_IfNot" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        If yes, list the facing direction of the side walls you want to insulate &nbsp;
                                        North
                                        <asp:TextBox ID="txt_FaceDirection_Wall_North" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 40px;"></asp:TextBox>
                                        sq ft &nbsp; South
                                        <asp:TextBox ID="txt_FaceDirection_Wall_South" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 40px;"></asp:TextBox>
                                        sq ft &nbsp; East
                                        <asp:TextBox ID="txt_FaceDirection_Wall_East" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 40px;"></asp:TextBox>
                                        sq ft &nbsp; West
                                        <asp:TextBox ID="txt_FaceDirection_Wall_West" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 40px;"></asp:TextBox>
                                        &nbsp; sq ft
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="27%" valign="top">
                                                    Document side wall issues such as weak
                                                    <br />
                                                    walls, open cavities, electrical issues, etc:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_SideWallIssue" runat="server" Height="50px" Width="100%" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="newtable" style="border: 1px solid #000; height: auto;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td>
                                        <strong>Other Zones such as attached garage</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Insulation:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                            <tr>
                                                <td width="15%" align="center">
                                                    Area
                                                </td>
                                                <td align="center">
                                                    Sq Ft
                                                </td>
                                                <td width="15%" align="center">
                                                    Existing Effective R Value
                                                </td>
                                                <td align="center">
                                                    Add R
                                                </td>
                                                <td width="15%" align="center">
                                                    New Insulation Type
                                                </td>
                                                <td width="40%" align="center">
                                                    Comments
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    Garage Ceiling
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_GarageCeiling_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_GarageCeiling_ExistEffect_R" runat="server" Style="width: 100%;
                                                        border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_GarageCeiling_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_GarageCeiling_Insulation" runat="server" Style="width: 100%;
                                                        border: none;"></asp:TextBox>
                                                </td>
                                                <td align="center">
                                                    <asp:TextBox ID="txt_GarageCeiling_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Is garage isolated from thermal envelope?
                                        <asp:RadioButton ID="rdo_GarageIsolatedThermal_Envelope_Yes" runat="server" GroupName="GarageIsolatedThermal_Envelope" />
                                        Yes
                                        <asp:RadioButton ID="rdo_GarageIsolatedThermal_Envelope_No" runat="server" GroupName="GarageIsolatedThermal_Envelope" />
                                        No &nbsp; &nbsp; If no, air seal &nbsp; &nbsp; Health and Safety?
                                        <asp:RadioButton ID="rdo_HealthSafety_Yes" runat="server" GroupName="HealthSafety" />
                                        Yes
                                        <asp:RadioButton ID="rdo_HealthSafety_No" runat="server" GroupName="HealthSafety" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="20%">
                                                    Other Zones outside Thermal and Pressure Boundaries, ie porches, bay windows
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_ZonesOutsideThermal" runat="server" TextMode="MultiLine" Height="50px"
                                                        Width="100%"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <%--Page 15 End--%>
                    <%--Page 16 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <!--main_right begin-->
                        <p style="margin-top: 1px; text-align: center; padding-bottom: 0; font-size: 16px">
                            <strong>Air Leakage Testing</strong>
                        </p>
                        <p style="margin-top: -17px;">
                            <strong>Step:1</strong> Multiply # of occupants x 15 CFM=CFM needed for people(P)
                            Number of Occupants:<asp:TextBox ID="txt_NumberOccupants" runat="server" Style="border: none;
                                border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                width: 30px;" onkeyup="CalculateOccupant()"></asp:TextBox>
                            x 15 CFM=<asp:TextBox ID="txt_TotalCFM" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 50px;"></asp:TextBox>
                            Total CFM for people(P)
                            <br />
                            <strong>Step:2</strong> Multiply the building volume x.35 ACH.Then divide by 60
                            minutes to get CFM Natural for the Building (B)
                        </p>
                        <%--<p>
            </p>--%>
                        <div class="newtable" style="border: 1px solid #000; height: auto; margin-top: -15px;">
                            <table width="100%" border="1" style="text-align: left; border: solid #CCC;" cellpadding="3"
                                cellspacing="2">
                                <tr style="text-align: center;">
                                    <td>
                                        Floor (1st,2nd,etc)
                                    </td>
                                    <td>
                                        Width x
                                    </td>
                                    <td>
                                        Length x
                                    </td>
                                    <td>
                                        =Area (sq ft)
                                    </td>
                                    <td>
                                        x Ceiling Height
                                    </td>
                                    <td>
                                        =Volume
                                    </td>
                                    <td>
                                        x.35 ACH
                                    </td>
                                    <td>
                                        Divide by 60 mins
                                    </td>
                                    <td>
                                        =CFM N B
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_Floor" runat="server" Style="border: 0; width: 100%; height: 13px;
                                            font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_width" runat="server" Style="border: 0; width: 100%; height: 13px;
                                            font-size: 12px;" onkeyup="CalculateLine1_Area()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_length" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;" onkeyup="CalculateLine1_Area()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_Area" runat="server" Style="border: 0; width: 100%; height: 13px;
                                            font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_CellHeight" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;" onkeyup="CalculateLine1_Volume()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_Volume" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_Ach" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_Devide" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line1_CFM" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_Floor" runat="server" Style="border: 0; width: 100%; height: 13px;
                                            font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_width" runat="server" Style="border: 0; width: 100%; height: 13px;
                                            font-size: 12px;" onkeyup="CalculateLine2_Area()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_length" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;" onkeyup="CalculateLine2_Area()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_Area" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_CellHeight" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;" onkeyup="CalculateLine2_Volume()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_Volume" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_Ach" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_Devide" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line2_CFM" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_Floor" runat="server" Style="border: 0; width: 100%; height: 13px;
                                            font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_width" runat="server" Style="border: 0; width: 100%; height: 13px;
                                            font-size: 12px;" onkeyup="CalculateLine3_Area()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_length" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;" onkeyup="CalculateLine3_Area()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_Area" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_CellHeight" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;" onkeyup="CalculateLine3_Volume()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_Volume" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_Ach" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_Devide" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line3_CFM" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_Floor" runat="server" Style="border: 0; width: 100%; height: 13px;
                                            font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_width" runat="server" Style="border: 0; width: 100%; height: 13px;
                                            font-size: 12px;" onkeyup="CalculateLine4_Area()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_length" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;" onkeyup="CalculateLine4_Area()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_Area" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_CellHeight" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;" onkeyup="CalculateLine4_Volume()"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_Volume" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_Ach" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_Devide" runat="server" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line4_CFM" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
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
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_Ach" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right;">
                                        Answer B:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Line5_CFM" runat="server" Text="0" Style="border: 0; width: 100%;
                                            height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <div style="font-size: 13px;">
                                Number Of Stories Above Grade
                                <asp:DropDownList ID="DDL_storyGrade" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                    font-weight: normal; color: rgb(0, 0, 0); width: 200px;" onchange="fillAllAutomaticField();">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1 Story use 19 for N factor" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="1.5 Story use 16.8 for N factor" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="2 Story use 15.4 for N factor" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="2.5 Story use 14.4 for N factor" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="3 Story use 13.7 for N factor" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                                Enter P or B(larger # of the 2):<asp:TextBox ID="txt_EnterPorB" runat="server" Style="border: none;
                                    border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                    width: 40px;"></asp:TextBox>
                                4. Multiply by height corrected N Factor:<asp:TextBox ID="txt_CorrectedFactor" runat="server"
                                    Width="88px" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                    color: rgb(0, 0, 0); width: 35px;"></asp:TextBox>
                            </div>
                            <div>
                                <div class="margindiv">
                                    <table width="200" border="1" style="border: solid 1px #999; text-align: center;
                                        float: left;">
                                        <tr>
                                            <td width="148">
                                                Number of Stories above grade
                                            </td>
                                            <td width="95">
                                                N Factor
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lbl_story_1" runat="server" Text="1"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_Nfactor_19" runat="server" Text="19"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lbl_story_1_5" runat="server" Text="1.5"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_Nfactor_16_8" runat="server" Text="16.8"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lbl_story_2" runat="server" Text="2"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_Nfactor_15_4" runat="server" Text="15.4"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lbl_story_2_5" runat="server" Text="2.5"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_Nfactor_14_4" runat="server" Text="14.4"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lbl_story_3" runat="server" Text="3"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_Nfactor_13_7" runat="server" Text="13.7"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="tableone" style="float: left; width: 200px;">
                                        <p style="float: left; margin: right 8px;">
                                            N Factor <i><b>(online</br> completion)</b> </i>
                                        </p>
                                        <asp:TextBox ID="txt_FactorOnline" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 84px; margin-top: 20px;"></asp:TextBox>
                                    </div>
                                    <div class="tableone" style="width: 190px; float: left; font-weight: normal; font-size: 12px;">
                                        <b>Use drop-down above for online form completion. Use table to left for paper completion.
                                            For paper complete Steps 3 and 4 above:</b>
                                    </div>
                                    <div class="tableone" align="right" style="float: left; width: 245px;">
                                        <strong>Step 5.</strong> Answer<asp:TextBox ID="txt_Answer" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 90px;"></asp:TextBox>
                                        <p>
                                            Above Number is your target BAS</br> Multiple Above Number by .70.
                                        </p>
                                    </div>
                                    <p style="margin-left: 5px; width: 65%; float: right;">
                                        <strong>Step 6.</strong> Air sealing below this number means you MUST install mechanical
                                        ventilation.
                                        <asp:TextBox ID="txt_InstallVentilation" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 60px; float: right;"></asp:TextBox>
                                    </p>
                                </div>
                                <div class="clear">
                                </div>
                                <div class="margindiv" style="float: left; width: 100%; border: 1px solid #000">
                                    <div class="left" style="float: left; margin-right: 15px; margin-top: 10px;">
                                        Target BAS
                                        <asp:TextBox ID="txt_TargetBAS" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>CFM 50
                                        <div class="clear">
                                        </div>
                                        Blower door Location pre-treatment
                                        <asp:TextBox ID="txt_LocationPreTretment" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        <div class="clear">
                                        </div>
                                        Blower door Location post-treatment
                                        <asp:TextBox ID="txt_LocationProTretment" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        <div class="clear">
                                        </div>
                                        <p style="vertical-align: middle; float: left; padding: 7px 6px;">
                                            Other notes:</p>
                                        <asp:TextBox ID="txt_OtherNote" runat="server" TextMode="MultiLine" Style="height: 60px;
                                            width: 70%; margin-top: 5px;"></asp:TextBox>
                                    </div>
                                    <div class="right" style="float: left; width: 60%;">
                                        <p>
                                            Check all that apply</p>
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    Pre-treatment test result
                                                    <asp:TextBox ID="txt_PreTretmentResult" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                        font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    CFM 50,Basement door:<asp:RadioButton ID="rdo_BasemetDoorOpen" runat="server" GroupName="BasemetDoor" />
                                                    Open<asp:RadioButton ID="rdo_BasemetDoorClose" runat="server" GroupName="BasemetDoor" />Close</br>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td align="right">
                                                    Attic door:<asp:RadioButton ID="rdo_AtticDoorOpen" runat="server" GroupName="AtticDoor" />
                                                    Open<asp:RadioButton ID="rdo_AtticDoor_Close" runat="server" GroupName="AtticDoor" />Close
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Other Door
                                                    <asp:TextBox ID="txt_OtherDoor" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                        font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                                </td>
                                                <td align="right">
                                                    <asp:RadioButton ID="rdo_OtherDoor_Open" runat="server" GroupName="OtherDoor" />
                                                    Open<asp:RadioButton ID="rdo_OtherDoor_Close" runat="server" GroupName="OtherDoor" />Close
                                                    <tr>
                                                        <td>
                                                            Post-treatment test result
                                                            <asp:TextBox ID="txt_PostTretment_Result" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            CFM 50,Basement door:
                                                            <asp:RadioButton ID="rdo_BasemetDoor2_Open" runat="server" GroupName="BasemetDoor2" />
                                                            Open<asp:RadioButton ID="rdo_BasemetDoor2_Close" runat="server" GroupName="BasemetDoor2" />Close
                                                            </br>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td align="right">
                                                            Attic door:
                                                            <asp:RadioButton ID="rdo_AtticDoor2_Open" runat="server" GroupName="AtticDoor2" />
                                                            Open<asp:RadioButton ID="rdo_AtticDoor2_Close" runat="server" GroupName="AtticDoor2" />
                                                        Close
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Other Door
                                                            <asp:TextBox ID="txt_OtherDoor2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                                        </td>
                                                        <td align="right">
                                                            <asp:RadioButton ID="rdo_OtherDoor2_Open" runat="server" GroupName="OtherDoor2" />
                                                            Open<asp:RadioButton ID="rdo_OtherDoor2_Close" runat="server" GroupName="OtherDoor2" />Close
                                                        </td>
                                                    </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="clear">
                                </div>
                                <p style="padding: 3px 7px; float: left;">
                                    <strong>If unvented combustion appliances exist, don't air seal the home below 3000
                                        CFM 50; however, always air seal the attic from the living space regardless of BAS
                                        or existing CFM 50. Follow ASHRAE 62.89 and the Air Sealing Procedure in the WARM
                                        Manual.</strong></p>
                                <div class="newtable" style="font-size: 10px;">
                                    <table width="98%" cellpadding="2" cellspacing="0" style="border: solid 1px #999999;">
                                        <tr>
                                            <td width="30%">
                                                &nbsp;
                                            </td>
                                            <td width="70%">
                                                Pressures
                                                <table width="100%" border="1" cellpadding="1" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            Thermal Boundary: In or Out?
                                                        </td>
                                                        <td>
                                                            What was blower door set at?
                                                        </td>
                                                        <td>
                                                            House/Zone
                                                        </td>
                                                        <td>
                                                            Zone/Outside
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <table width="100%" cellpadding="1" cellspacing="2" border="1" style="border: solid 1px #999999;">
                                            <tr style="text-align: center;">
                                                <td width="30%">
                                                    Zones
                                                </td>
                                                <td width="5%">
                                                    In
                                                </td>
                                                <td width="5%">
                                                    Out
                                                </td>
                                                <td width="10%">
                                                    Pre-Treat
                                                </td>
                                                <td width="10%">
                                                    Final
                                                </td>
                                                <td width="10%">
                                                    Pre-Treat
                                                </td>
                                                <td width="10%">
                                                    Final
                                                </td>
                                                <td width="10%">
                                                    Pre-Treat
                                                </td>
                                                <td width="10%">
                                                    Final
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Attic
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_Attic_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_Attic_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Attic_Blower_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;" Height="16px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Attic_Blower_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Attic_House_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Attic_House_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Attic_Outside_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Attic_Outside_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Basement
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_Basement_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_Basement_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Basement_Bolower_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Basement_Bolower_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Basement_House_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Basement_House_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Basement_Outside_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Basement_Outside_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Vented Crawl
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_VentedCrawl_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_VentedCrawl_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_VentedCrawl_Blower_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_VentedCrawl_Blower_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_VentedCrawl_House_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_VentedCrawl_House_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_VentedCrawl_Outside_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_VentedCrawl_Outside_Final" runat="server" Style="border: 0;
                                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Attic A
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_AtticA_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_AtticA_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticA_Blower_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticA_Blower_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticA_House_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticA_House_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticA_Outside_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticA_Outside_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Attic B
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_AtticB_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_AtticB_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticB_Blower_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticB_Blower_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticB_House_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticB_House_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticB_Outside_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_AtticB_Outside_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Kneewall A
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_KneewallA_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_KneewallA_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallA_Blower_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallA_Blower_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallA_House_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallA_House_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallA_Outside_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallA_Outside_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Kneewall B
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_KneewallB_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_KneewallB_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallB_Blower_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallB_Blower_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallB_House_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallB_House_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallB_Outside_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_KneewallB_Outside_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Garage
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_Garage_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_Garage_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Garage_Blower_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Garage_Blower_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Garage_House_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Garage_House_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Garage_Outside_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Garage_Outside_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Garage Attic
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_GarageAttic_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_GarageAttic_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_GarageAttic_Blower_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_GarageAttic_Blower_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_GarageAttic_House_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_GarageAttic_House_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_GarageAttic_Outside_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_GarageAttic_Outside_Final" runat="server" Style="border: 0;
                                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Cantilever Overhang
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_CantileverOverhang_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_CantileverOverhang_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_CantileverOverhang_Blower_Pre" runat="server" Style="border: 0;
                                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_CantileverOverhang_Blower_Final" runat="server" Style="border: 0;
                                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_CantileverOverhang_House_Pre" runat="server" Style="border: 0;
                                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_CantileverOverhang_House_Final" runat="server" Style="border: 0;
                                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_CantileverOverhang_Outside_Pre" runat="server" Style="border: 0;
                                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_CantileverOverhang_Outside_Final" runat="server" Style="border: 0;
                                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Other
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_Other_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_Other_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other1_Blower_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other1_Blower_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other1_House_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other1_House_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other1_Outside_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other1_Outside_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>
                                                    Other
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_Other2_In" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="Chk_Other2_Out" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other2_Blower_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other2_Blower_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other2_House_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other2_House_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other2_Outside_Pre" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Other2_Outside_Final" runat="server" Style="border: 0; width: 100%;
                                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </table>
                                    <p style="padding: 2px 0; font-size: 13px; margin-top: -2px;">
                                        Pressure Pan Test Results (test at -25 Pascals)Duct leaks or disconnects observed?
                                        Yes
                                        <asp:RadioButton ID="rdo_DustObsver_Yes" runat="server" GroupName="DustObsver" />
                                        No<asp:RadioButton ID="rdo_DustObsver_No" runat="server" GroupName="DustObsver" />
                                        Existing Duct Materials:<asp:CheckBox ID="Chk_Matrial_Metal" runat="server" />
                                        Metal<asp:CheckBox ID="Chk_Matrial_Ductbord" runat="server" />
                                        Ductboard<asp:CheckBox ID="Chk_Matrial_Flex" runat="server" />
                                        Flex</p>
                                    <p align="center" style="margin-top: -16px;">
                                        System Type:
                                        <asp:CheckBox ID="Chk_System_HeatPump" runat="server" />Heat Pump
                                        <asp:CheckBox ID="Chk_CentralAir" runat="server" />Central Air Only
                                        <asp:CheckBox ID="Chk_ElectricFurnuase" runat="server" />Electric Furnace
                                        <asp:CheckBox ID="Chk_Other" runat="server" />Other<asp:TextBox ID="txt_SystemType_Other"
                                            runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                                            color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                    </p>
                                </div>
                                <div style="margin-top: -10px;">
                                    <table width="100%" border="1" style="margin-top: 0; text-align: center; font-size: 9px;">
                                        <tr>
                                            <td>
                                                Register
                                            </td>
                                            <td>
                                                #1
                                            </td>
                                            <td>
                                                #2
                                            </td>
                                            <td>
                                                #3
                                            </td>
                                            <td>
                                                #4
                                            </td>
                                            <td>
                                                #5
                                            </td>
                                            <td>
                                                #6
                                            </td>
                                            <td>
                                                #7
                                            </td>
                                            <td>
                                                #8
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Room
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Room1" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                    font-size: 12px;"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Room2" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                    font-size: 12px;"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Room3" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                    font-size: 12px;"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Room4" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                    font-size: 12px;"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Room5" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                    font-size: 12px;"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Room6" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                    font-size: 12px;"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Room7" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                    font-size: 12px;"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_Room8" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                    font-size: 12px;"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Reading
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;Post
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;Post
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;Post
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;Post
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;Post
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;Post
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;Post
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;Post
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Supply
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Supply_pre1" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Supply_pro1" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Supply_pre2" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Supply_pro2" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Supply_pre3" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Supply_pro3" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Supply_pre4" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Supply_pro4" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Supply_pre5" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Supply_pro5" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Supply_pre6" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Supply_pro6" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Supply_pre7" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Supply_pro7" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Supply_pre8" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Supply_pro8" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Return
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Return_pre1" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Return_pro1" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Return_pre2" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Return_pro2" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Return_pre3" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Return_pro3" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Return_pre4" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Return_pro4" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Return_pre5" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Return_pro5" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Return_pre6" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Return_pro6" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Return_pre7" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Return_pro7" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="border-right: 1px solid black;">
                                                            &nbsp;
                                                            <asp:TextBox ID="txt_Return_pre8" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Return_pro8" runat="server" Style="border: 0; width: 100%; height: 13px;
                                                                font-size: 12px;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 6px;">
                                    <tr>
                                        <td valign="top" style="width: 10%;">
                                            <p style="vertical-align: middle; float: left; padding: 7px 6px; display: none;">
                                                Comment:</p>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt16_Comment" runat="server" TextMode="MultiLine" Visible="false"
                                                Style="height: 60px; width: 97%;"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <p style="padding: 3px 7px; margin-top: -3px; margin-bottom: 0px;">
                                    <strong>Note:</strong><i> Number registers by floor going away from Air Handler Unit
                                        (AHU). Register #1 will always be the one closest to AHU.</i></p>
                            </div>
                            <!--main_right end-->
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                    <%--Page 16 End--%>
                    <%--Page 17 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <div class="newtable">
                            <table width="100%" border="0" cellspacing="3" cellpadding="2">
                                <tr>
                                    <td colspan="3" align="left" style="text-align: left">
                                        Copy this page for as many tests that are needed. Typically, there should be two
                                        of this form, one for pre-work testing and one for post-work testing.
                                    </td>
                                </tr>
                                <tr>
                                    <td width="27%" style="text-align: left">
                                        <%--<asp:RadioButton ID="rdo_PreTest" runat="server" GroupName="tes_ting" />--%>
                                        <asp:CheckBox ID="rdo_PreTest" runat="server" />
                                        Pre-test
                                    </td>
                                    <td width="27%">
                                        <%--<asp:RadioButton ID="rdo_PostTest" runat="server" GroupName="tes_ting" />--%>
                                        <asp:CheckBox ID="rdo_PostTest" runat="server" />
                                        Post-Test
                                    </td>
                                    <td width="90%">
                                        Tech Name
                                        <asp:TextBox ID="txt_TechName1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 250px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%--<asp:RadioButton ID="rdo_Auditor" runat="server" GroupName="testing" />--%>
                                        <asp:CheckBox ID="rdo_Auditor" runat="server" />
                                        Auditor
                                    </td>
                                    <td>
                                        <%--<asp:RadioButton ID="rdo_Crew" runat="server" GroupName="testing" />--%>
                                        <asp:CheckBox ID="rdo_Crew" runat="server" />
                                        Crew
                                        <asp:TextBox ID="txt_Crew" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 150px; font-weight: normal; color: rgb(0, 0, 0); width: 120px; !important;
                                            width: 120px; !important; width: 120px; !important;"></asp:TextBox>
                                    </td>
                                    <td>
                                        Test Date:
                                        <asp:TextBox ID="txt_TestDate" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 250px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        <ajaxtoolkit:CalendarExtender ID="page17_CalendarExtender1" runat="server" TargetControlID="txt_TestDate"
                                            OnClientDateSelectionChanged="checkDate">
                                        </ajaxtoolkit:CalendarExtender>
                                        <ajaxtoolkit:FilteredTextBoxExtender ID="page17_FilteredTextBoxExtender1" runat="server"
                                            TargetControlID="txt_TestDate" FilterType="Custom,Numbers" ValidChars="/">
                                        </ajaxtoolkit:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <br />
                                <tr>
                                    <td colspan="3">
                                        <strong>Combustion Safety Testing</strong> Are there Combustion Appliances?
                                        <asp:RadioButton ID="rdo_CombustionAppliances_Yes" runat="server" GroupName="test" />
                                        Yes
                                        <asp:RadioButton ID="rdo_CombustionAppliances_No" runat="server" GroupName="test" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        Combustion Equipment Safety Tests must be performed if any air sealing will be done
                                        or is done. If post-treatment blower door test is lower than the pre-treatment test,
                                        the chart below MUST be completed. Refer to the Procedure Manual for complete testing
                                        procedure.
                                    </td>
                                </tr>
                            </table>
                            <div class="newtable" style="border: 1px solid #000; padding: 2px; height: auto;">
                                Are there any <u>unvented</u> combustion heating appliances?
                                <asp:RadioButton ID="rdo_UnventedCombustionHeatingApp_Y" runat="server" GroupName="tester" />
                                Yes
                                <asp:RadioButton ID="rdo_UnventedCombustionHeatingApp_N" runat="server" GroupName="tester" />
                                No
                                <table width="100%" border="1" cellspacing="2" cellpadding="1">
                                    <tr>
                                        <td align="center">
                                        </td>
                                        <td align="center" colspan="2">
                                            CO Initial Reading
                                        </td>
                                        <td align="center" colspan="2">
                                            CO After<br />
                                            5-10
                                            <br />
                                            Min
                                        </td>
                                        <td align="center">
                                            Gas<br />
                                            Leak<br />
                                            Det Y/N
                                        </td>
                                        <td align="center">
                                            Flame<br />
                                            Rollout<br />
                                            Y/N
                                        </td>
                                        <td align="center" colspan="2">
                                            Spillage Y/N
                                        </td>
                                        <td align="center" colspan="2">
                                            Spillage after<br />
                                            1 min Y/N
                                        </td>
                                        <td align="center" colspan="2">
                                            Draft Pressure PA
                                        </td>
                                        <td align="center" colspan="2">
                                            Draft Pass Y/N
                                        </td>
                                        <td align="center" colspan="2">
                                            CO Flue
                                        </td>
                                        <td align="center" colspan="2">
                                            CO Pass Y/N
                                        </td>
                                        <td colspan="3" align="center">
                                            Optional
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            Appliance
                                        </td>
                                        <td align="center">
                                            AMB
                                        </td>
                                        <td align="center">
                                            CAZ
                                        </td>
                                        <td align="center">
                                            AMB
                                        </td>
                                        <td align="center">
                                            CAZ
                                        </td>
                                        <td align="center">
                                        </td>
                                        <td align="center">
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td align="center">
                                            NAT
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td align="center">
                                            NAT
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td>
                                            NAT
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td>
                                            NAT
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td>
                                            NAT
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td>
                                            NAT
                                        </td>
                                        <td>
                                            Stack Temp
                                        </td>
                                        <td>
                                            O2
                                        </td>
                                        <td>
                                            Eff.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            Water Heater
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_WaterHeater_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_WaterHeater_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_After_WaterHeater_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_After_WaterHeater_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_GasLeak_WaterHeater" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Flame_WaterHeater" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_WaterHeater_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_WaterHeater_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_WaterHeater_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_WaterHeater_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_WaterHeater_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_WaterHeater_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_WaterHeater_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_WaterHeater_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_WaterHeater_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_WaterHeater_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_WaterHeater_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_WaterHeater_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_WaterHeater_StackTemp" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_WaterHeater_O2" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_WaterHeater_Eff" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            Furnace/Boiler
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_FurnaceBoil_AMB" runat="server" Style="width: 20px; border: none;"
                                                Height="18px"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_FurnaceBoil_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoAfter_FurnaceBoil_AMB" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoAfter_FurnaceBoil_CAZ" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_GasLeak_FurnaceBoil" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Flame_FurnaceBoil" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_FurnaceBoil_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_FurnaceBoil_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_FurnaceBoil_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_FurnaceBoil_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_FurnaceBoil_Stack" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_FurnaceBoil_O2" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_FurnaceBoil_Eff" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            Gas Range
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_GasRange_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_GasRange_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoAfter_GasRange_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoAfter_GasRange_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_GasLeak_GasRange" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Flame_GasRange" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_GasRange_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_GasRange_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_GasRange_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_GasRange_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_GasRange_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_GasRange_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_GasRange_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_GasRange_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_GasRange_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_GasRange_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_GasRange_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_GasRange_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_GasRange_Stack" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_GasRange_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_GasRange_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            Other
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_Other_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_Other_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoAfter_Other_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoAfter_Other_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_GasLeak_Other" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Flame_Other" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_Other_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_Other_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_Other_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_Other_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_Other_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_Other_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_Other_Stack" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_Other_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_Other_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Col1Cat" runat="server" Style="width: 70px; border: none; font-size: 11px;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_Col1Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_Col1Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoAfter_Col1Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoAfter_Col1Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_GasLeak_Col1Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Flame_Col1Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_Col1Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_Col1Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_Col1Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_Col1Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_Col1Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_Col1Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_Col1Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_Col1Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_Col1Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_Col1Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_Col1Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_Col1Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_Col1Cat_Stack" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_Col1Cat_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_Col1Cat_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Col2Cat" runat="server" Style="width: 70px; border: none; font-size: 11px;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_Col2Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Co_Col2Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoAfter_Col2Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoAfter_Col2Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_GasLeak_Col2Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Flame_Col2Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_Col2Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Spillage_Col2Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_Col2Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_SpillageAfter_Col2Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_Col2Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPress_Col2Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_Col2Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_DraftPass_Col2Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_Col2Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoFuel_Col2Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_Col2Cat_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_CoPass_Col2Cat_NAT" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_Col2Cat_Stack" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_Col2Cat_O2" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txt_Optional_Col2Cat_Eff" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                    <tr>
                                        <td width="33%">
                                            <div class="newtable" style="border: 1px solid #000; padding: 5px; height: auto;">
                                                <strong>Burners:</strong>
                                                <br />
                                                Write in CO ppm for
                                                <br />
                                                each burner:<br />
                                                <strong>Oven</strong>
                                                <br />
                                                If CO at oven vent is 100 ppm or more, install CO alarm and recommend service. No
                                                air sealing is allowed until CO level drops below 100 ppm.
                                                <p>
                                                    <strong>Oven:</strong></p>
                                                CO Ambient:
                                                <asp:TextBox ID="txt_COAmbient" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                    font-weight: normal; color: rgb(0, 0, 0); width: 60px;"></asp:TextBox>
                                                <br />
                                                <br />
                                                CO at oven vent:
                                                <asp:TextBox ID="txt_CO_Oven_Vent" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                    font-weight: normal; color: rgb(0, 0, 0); width: 60px;"></asp:TextBox>
                                            </div>
                                        </td>
                                        <td>
                                            <table border="0" width="100%">
                                                <tr>
                                                    <td width="33%" align="top" style="vertical-align: 0; width: 262px; margin: 45px 0px 0px 70px;
                                                        float: left;">
                                                        <div class="newtable" style="border: 1px solid #000; padding: 5px; height: auto;
                                                            width: 70%">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="7">
                                                                <tr>
                                                                    <td>
                                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                            <asp:TextBox ID="txt_CoNotes1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                    </td>
                                                                    <td>
                                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                            <asp:TextBox ID="txt_CoNotes2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                            <asp:TextBox ID="txt_CoNotes3" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                    </td>
                                                                    <td>
                                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                            <asp:TextBox ID="txt_CoNotes4" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div style="float: right; margin-top: -82px;" class="">
                                                            Notes:</div>
                                                    </td>
                                                    <td align="right" valign="top" style="float: right; width: 160px; text-align: center;">
                                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td colspan="9" align="center">
                                                                   <asp:TextBox ID="txt_Note1_17" runat="server" TextMode="MultiLine" Style="background: #eaeaea;
                                                        padding: 4px; height: 120px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="100%">
                                                        <div style="float: left; margin-top: 15px;">
                                                            Notes:
                                                        </div>
                                                        <asp:TextBox ID="txt_CoNotes" runat="server" Style="border: solid 1px #000; padding: 5px;
                                                            width: 88%; height: 46px;" TextMode="MultiLine"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <br />
                                    <br />
                                    <tr>
                                        <td colspan="3" align="center" style="font-size: 11px;">
                                            <u>AMB = Ambient, CAZ = Combustion Appliance Zone, Det = Detected, W/C = Worst Case
                                                Conditions, NAT = Natural, Temp = Temperature, Eff = Efficiency</u>
                                            <br />
                                            Pa = Pascal, IWC = Inches of Water Column: 50 Pa. = .2 IWC, 25 Pa. = .1 IWC, 1 Pa.
                                            = 0.00401 IWC
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <h4 align="center">
                                BPI Minimum Acceptable Draft Test Reading at Outdoor Air Temperature Ranges</h4>
                            <table width="80%" border="1" cellspacing="0" cellpadding="10" align="center">
                                <tr>
                                    <td align="center">
                                        Degrees F
                                    </td>
                                    <td align="center">
                                        <19
                                    </td>
                                    <td align="center">
                                        20s
                                    </td>
                                    <td align="center">
                                        30s
                                    </td>
                                    <td align="center">
                                        40s
                                    </td>
                                    <td align="center">
                                        50s
                                    </td>
                                    <td align="center">
                                        60s
                                    </td>
                                    <td align="center">
                                        70s
                                    </td>
                                    <td align="center">
                                        80s
                                    </td>
                                    <td align="center">
                                        >90
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Pascals (Pa)
                                    </td>
                                    <td align="center">
                                        -2.5*
                                    </td>
                                    <td align="center">
                                        -2.25*
                                    </td>
                                    <td align="center">
                                        -2*
                                    </td>
                                    <td align="center">
                                        -1.75*
                                    </td>
                                    <td align="center">
                                        -1.5*
                                    </td>
                                    <td align="center">
                                        -1.25*
                                    </td>
                                    <td align="center">
                                        -1*
                                    </td>
                                    <td align="center">
                                        -.75*
                                    </td>
                                    <td align="center">
                                        -0.5*
                                    </td>
                                </tr>
                            </table>
                            <table width="80%" border="0" cellspacing="0" cellpadding="10" align="center">
                                <tr>
                                    <td>
                                        * Actual equation is (T_out/40)-2.75
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td>
                                        Outdoor Temperature:
                                        <asp:TextBox ID="txt_OutdoorTemperature" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                        <br />
                                        <br />
                                        CAZ Worse Case Depressurization: Natural:
                                        <asp:TextBox ID="txt_CAZDepressurization_Natural" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 50px;"></asp:TextBox>
                                        WC:
                                        <asp:TextBox ID="txt_CAZDepressurization_WC" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 80px;"></asp:TextBox>
                                        Diff:
                                        <asp:TextBox ID="txt_CAZDepressurization_Diff" runat="server" Style="border: none;
                                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                            width: 50px;"></asp:TextBox>
                                        <br />
                                        <br />
                                        Pass?
                                        <asp:RadioButton ID="rdo_CAZPass_Yes" runat="server" GroupName="testgroup" />Yes
                                        <asp:RadioButton ID="rdo_CAZPass_No" runat="server" GroupName="testgroup" />No
                                        <br />
                                        <br />
                                        <asp:CheckBox ID="chk_Emergency_GasCompanyCalled" runat="server" />
                                        Emergency situation. Gas company called to fix gas leak or other.<br />
                                        <br />
                                        <asp:CheckBox ID="chk_WorkCannot_MoreFailedTests" runat="server" />
                                        Work cannot continue due to one or more failed tests over Action Level.
                                    </td>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td colspan="2">
                                                    Select Appliances on At Worst Case Test:
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="45%">
                                                    <asp:CheckBox ID="chk_Appliances_WorstCase_Dryer" runat="server" />
                                                    Dryer
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="chk_Appliances_WorstCase_WholeHouseFan" runat="server" />
                                                    Whole House Fan
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chk_Appliances_WorstCase_BathFan" runat="server" />
                                                    Bath Fan
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="chk_Appliances_WorstCase_HVACAirHandler" runat="server" />
                                                    HVAC Air Handler
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chk_Appliances_WorstCase_KitchenFan" runat="server" />
                                                    Kitchen Fan
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="chk_Appliances_WorstCase_Other" runat="server" />
                                                    <asp:TextBox ID="txt_Appliances_WorstCase_Other" runat="server" Style="border: none;
                                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                                        width: 90px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chk_Appliances_WorstCase_AtticFan" runat="server" />
                                                    Attic Fan
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" valign="top">
                                        <p style="vertical-align: middle; float: left; padding-right: 5px;">
                                            Notes:</p>
                                        <asp:TextBox ID="txt_FinalNotes" runat="server" Style="width: 90%; height: 50px;"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <%--Page 17 End--%>
                    <%--Page 18 start--%>
                    <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                        position: relative;">
                        <div class="newtable">
                            <table width="100%" border="0" cellspacing="3" cellpadding="2">
                                <tr>
                                    <td colspan="3">
                                        Copy this page for as many tests that are needed. Typically, there should be two
                                        of this form, one for pre-work testing and one for post-work testing.
                                    </td>
                                </tr>
                                <tr>
                                    <td width="27%" style="text-align: left">
                                        <%--<asp:RadioButton ID="page18_rdo_PreTest" runat="server" GroupName="testing18" />--%>
                                        <asp:CheckBox ID="page18_rdo_PreTest" runat="server" />
                                        Pre-test
                                    </td>
                                    <td width="27%">
                                        <%--<asp:RadioButton ID="page18_rdo_PostTest" runat="server" GroupName="testing18" />--%>
                                        <asp:CheckBox ID="page18_rdo_PostTest" runat="server" />
                                        Post-Test
                                    </td>
                                    <td width="90%">
                                        Tech Name
                                        <asp:TextBox ID="page18_txt_TechName" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 250px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%--<asp:RadioButton ID="page18_rdo_Auditor" runat="server" GroupName="testing18_1" />--%>
                                        <asp:CheckBox runat="server" ID="page18_rdo_Auditor" />
                                        Auditor
                                    </td>
                                    <td>
                                        <%--<asp:RadioButton ID="page18_rdo_Crew" runat="server" GroupName="testing18_1" />--%>
                                        <asp:CheckBox ID="page18_rdo_Crew" runat="server" />
                                        Crew
                                        <asp:TextBox ID="page18_txt_Crew" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 150px; font-weight: normal; color: rgb(0, 0, 0); width: 120px; !important;
                                            width: 120px; !important; width: 120px; !important;"></asp:TextBox>
                                    </td>
                                    <td>
                                        Test Date:
                                        <asp:TextBox ID="page18_txt_TestDate" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                            width: 250px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                        <ajaxtoolkit:CalendarExtender ID="page18_CalendarExtender1" runat="server" TargetControlID="txt_TestDate"
                                            OnClientDateSelectionChanged="checkDate">
                                        </ajaxtoolkit:CalendarExtender>
                                        <ajaxtoolkit:FilteredTextBoxExtender ID="page18_FilteredTextBoxExtender1" runat="server"
                                            TargetControlID="txt_TestDate" FilterType="Custom,Numbers" ValidChars="/">
                                        </ajaxtoolkit:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <br />
                                <tr>
                                    <td colspan="3">
                                        <strong>Combustion Safety Testing</strong> Are there Combustion Appliances?
                                        <asp:RadioButton ID="page18_rdo_CombustionAppliances_Yes" runat="server" GroupName="test18" />
                                        Yes
                                        <asp:RadioButton ID="page18_rdo_CombustionAppliances_No" runat="server" GroupName="test18" />
                                        No
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        Combustion Equipment Safety Tests must be performed if any air sealing will be done
                                        or is done. If post-treatment blower door test is lower than the pre-treatment test,
                                        the chart below MUST be completed. Refer to the Procedure Manual for complete testing
                                        procedure.
                                    </td>
                                </tr>
                            </table>
                            <div class="newtable" style="border: 1px solid #000; padding: 2px; height: auto;">
                                Are there any <u>unvented</u> combustion heating appliances?
                                <asp:RadioButton ID="page18_rdo_UnventedCombustionHeatingApp_Y" runat="server" GroupName="tester18" />
                                Yes
                                <asp:RadioButton ID="page18_rdo_UnventedCombustionHeatingApp_N" runat="server" GroupName="tester18" />
                                No
                                <table width="100%" border="1" cellspacing="2" cellpadding="1">
                                    <tr>
                                        <td align="center">
                                        </td>
                                        <td align="center" colspan="2">
                                            CO Initial Reading
                                        </td>
                                        <td align="center" colspan="2">
                                            CO After<br />
                                            5-10
                                            <br />
                                            Min
                                        </td>
                                        <td align="center">
                                            Gas<br />
                                            Leak<br />
                                            Det Y/N
                                        </td>
                                        <td align="center">
                                            Flame<br />
                                            Rollout<br />
                                            Y/N
                                        </td>
                                        <td align="center" colspan="2">
                                            Spillage Y/N
                                        </td>
                                        <td align="center" colspan="2">
                                            Spillage after<br />
                                            1 min Y/N
                                        </td>
                                        <td align="center" colspan="2">
                                            Draft Pressure PA
                                        </td>
                                        <td align="center" colspan="2">
                                            Draft Pass Y/N
                                        </td>
                                        <td align="center" colspan="2">
                                            CO Flue
                                        </td>
                                        <td align="center" colspan="2">
                                            CO Pass Y/N
                                        </td>
                                          <td colspan="3" align="center">
                            Optional
                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            Appliance
                                        </td>
                                        <td align="center">
                                            AMB
                                        </td>
                                        <td align="center">
                                            CAZ
                                        </td>
                                        <td align="center">
                                            AMB
                                        </td>
                                        <td align="center">
                                            CAZ
                                        </td>
                                        <td align="center">
                                        </td>
                                        <td align="center">
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td align="center">
                                            NAT
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td align="center">
                                            NAT
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td>
                                            NAT
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td>
                                            NAT
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td>
                                            NAT
                                        </td>
                                        <td align="center">
                                            W/C
                                        </td>
                                        <td>
                                            NAT
                                        </td>
                                          <td>
                            Stack Temp
                        </td>
                        <td>
                            O2
                        </td>
                        <td>
                            Eff.
                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            Water Heater
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_WaterHeater_AMB" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_WaterHeater_CAZ" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_After_WaterHeater_AMB" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_After_WaterHeater_CAZ" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_GasLeak_WaterHeater" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Flame_WaterHeater" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_WaterHeater_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_WaterHeater_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_WaterHeater_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_WaterHeater_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_WaterHeater_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_WaterHeater_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_WaterHeater_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_WaterHeater_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_WaterHeater_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_WaterHeater_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_WaterHeater_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_WaterHeater_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                           <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_WaterHeater_StackTemp" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_WaterHeater_O2" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_WaterHeater_Eff" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            Furnace/Boiler
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_FurnaceBoil_AMB" runat="server" Style="width: 20px;
                                                border: none;" Height="18px"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_FurnaceBoil_CAZ" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoAfter_FurnaceBoil_AMB" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoAfter_FurnaceBoil_CAZ" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_GasLeak_FurnaceBoil" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Flame_FurnaceBoil" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                         <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_FurnaceBoil_Stack" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_FurnaceBoil_O2" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_FurnaceBoil_Eff" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            Gas Range
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_GasRange_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_GasRange_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoAfter_GasRange_AMB" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoAfter_GasRange_CAZ" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_GasLeak_GasRange" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Flame_GasRange" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_GasRange_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_GasRange_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_GasRange_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_GasRange_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_GasRange_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_GasRange_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_GasRange_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_GasRange_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_GasRange_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_GasRange_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_GasRange_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_GasRange_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_GasRange_Stack" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_GasRange_O2" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_GasRange_Eff" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            Other
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_Other_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_Other_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoAfter_Other_AMB" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoAfter_Other_CAZ" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_GasLeak_Other" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Flame_Other" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_Other_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_Other_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_Other_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_Other_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_Other_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_Other_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_Other_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_Other_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_Other_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_Other_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                         <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_Other_Stack" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_Other_O2" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_Other_Eff" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Col1Cat" runat="server" Style="width: 70px; border: none;
                                                font-size: 11px;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_Col1Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_Col1Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoAfter_Col1Cat_AMB" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoAfter_Col1Cat_CAZ" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_GasLeak_Col1Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Flame_Col1Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_Col1Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_Col1Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_Col1Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_Col1Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_Col1Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_Col1Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_Col1Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_Col1Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_Col1Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_Col1Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_Col1Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_Col1Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>                                                
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_Col1Cat_Stack" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_Col1Cat_O2" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_Col1Cat_Eff" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Col2Cat" runat="server" Style="width: 70px; border: none;
                                                font-size: 11px;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_Col2Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Co_Col2Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoAfter_Col2Cat_AMB" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoAfter_Col2Cat_CAZ" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_GasLeak_Col2Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Flame_Col2Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_Col2Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Spillage_Col2Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_Col2Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_SpillageAfter_Col2Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_Col2Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPress_Col2Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_Col2Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_DraftPass_Col2Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_Col2Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoFuel_Col2Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_Col2Cat_WC" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_CoPass_Col2Cat_NAT" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                         <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_Col2Cat_Stack" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_Col2Cat_O2" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="page18_txt_Optional_Col2Cat_Eff" runat="server" Style="width: 20px;
                                                border: none;"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                    <tr>
                                        <td width="33%" style="vertical-align: 0;">
                                            <div class="newtable" style="border: 1px solid #000; padding: 5px; height: auto;">
                                                <strong>Burners:</strong>
                                                <br />
                                                Write in CO ppm for
                                                <br />
                                                each burner:<br />
                                                <strong>Oven</strong>
                                                <br />
                                                If CO at oven vent is 100 ppm or more, install CO alarm and recommend service. No
                                                air sealing is allowed until CO level drops below 100 ppm.
                                                <p>
                                                    <strong>Oven:</strong></p>
                                                CO Ambient:
                                                <asp:TextBox ID="page18_txt_COAmbient" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                    font-weight: normal; color: rgb(0, 0, 0); width: 60px;"></asp:TextBox>
                                                <br />
                                                <br />
                                                CO at oven vent:
                                                <asp:TextBox ID="page18_txt_CO_Oven_Vent" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                    font-weight: normal; color: rgb(0, 0, 0); width: 60px;"></asp:TextBox>
                                            </div>
                                        </td>
                                        <td>
                                            <table border="0" width="100%">
                                                <tr>
                                                    <td width="33%" align="top" style="vertical-align: 0; width: 262px; margin: 0px 0px 0px 75px;
                                                        float: left;">
                                                        <div class="newtable" style="border: 1px solid #000; padding: 5px; height: auto;
                                                            width: 70%">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="10">
                                                                <tr>
                                                                    <td>
                                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                            <asp:TextBox ID="page18_txt_CoNotes1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                    </td>
                                                                    <td>
                                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                            <asp:TextBox ID="page18_txt_CoNotes2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                            <asp:TextBox ID="page18_txt_CoNotes3" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                    </td>
                                                                    <td>
                                                                        <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                            <asp:TextBox ID="page18_txt_CoNotes4" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                                font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                    </td>
                                                    </td>
                                                </tr>
                                            </table>
                            </div>
                             <div style="float: right; margin-top: -82px;" class="">
                                            Notes:</div>
                            </td>
                            <td align="right" valign="top" style="float: right; width: 160px; text-align: center;">
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center" colspan="3">
                                          <asp:TextBox ID="txt_Note1_18" runat="server" TextMode="MultiLine" Style="background: #eaeaea;
                                                        padding: 4px; height: 120px;"></asp:TextBox>
                                        </td>
                                    </tr>
                                 
                                </table>
                            </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="100%">
                                    <div style="float: left; margin-top: 15px;">
                                        Notes:
                                    </div>
                                    <asp:TextBox ID="page18_txt_CoNotes" runat="server" Style="border: solid 1px #000;
                                        padding: 5px; width: 88%; height: 46px;" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            </table> </td> </tr>
                            <tr>
                                <td colspan="3" align="center" style="font-size: 11px;">
                                    <u>AMB = Ambient, CAZ = Combustion Appliance Zone, Det = Detected, W/C = Worst Case
                                        Conditions, NAT = Natural, Temp = Temperature, Eff = Efficiency</u>
                                    <br />
                                    Pa = Pascal, IWC = Inches of Water Column: 50 Pa. = .2 IWC, 25 Pa. = .1 IWC, 1 Pa.
                                    = 0.00401 IWC
                                </td>
                            </tr>
                            </table>
                        </div>
                        <h4 align="center">
                            BPI Minimum Acceptable Draft Test Reading at Outdoor Air Temperature Ranges</h4>
                        <table width="80%" border="1" cellspacing="0" cellpadding="10" align="center">
                            <tr>
                                <td align="center">
                                    Degrees F
                                </td>
                                <td align="center">
                                    <19
                                </td>
                                <td align="center">
                                    20s
                                </td>
                                <td align="center">
                                    30s
                                </td>
                                <td align="center">
                                    40s
                                </td>
                                <td align="center">
                                    50s
                                </td>
                                <td align="center">
                                    60s
                                </td>
                                <td align="center">
                                    70s
                                </td>
                                <td align="center">
                                    80s
                                </td>
                                <td align="center">
                                    >90
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    Pascals (Pa)
                                </td>
                                <td align="center">
                                    -2.5*
                                </td>
                                <td align="center">
                                    -2.25*
                                </td>
                                <td align="center">
                                    -2*
                                </td>
                                <td align="center">
                                    -1.75*
                                </td>
                                <td align="center">
                                    -1.5*
                                </td>
                                <td align="center">
                                    -1.25*
                                </td>
                                <td align="center">
                                    -1*
                                </td>
                                <td align="center">
                                    -.75*
                                </td>
                                <td align="center">
                                    -0.5*
                                </td>
                            </tr>
                        </table>
                        <table width="80%" border="0" cellspacing="0" cellpadding="10" align="center">
                            <tr>
                                <td>
                                    * Actual equation is (T_out/40)-2.75
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td>
                                    Outdoor Temperature:
                                    <asp:TextBox ID="page18_txt_OutdoorTemperature" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                    <br />
                                    <br />
                                    CAZ Worse Case Depressurization: Natural:
                                    <asp:TextBox ID="page18_txt_CAZDepressurization_Natural" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                    WC:
                                    <asp:TextBox ID="page18_txt_CAZDepressurization_WC" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                    Diff:
                                    <asp:TextBox ID="page18_txt_CAZDepressurization_Diff" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 80px;"></asp:TextBox>
                                    <br />
                                    <br />
                                    Pass?
                                    <asp:RadioButton ID="page18_rdo_CAZPass_Yes" runat="server" GroupName="YesorNO18" />Yes
                                    <asp:RadioButton ID="page18_rdo_CAZPass_No" runat="server" GroupName="YesorNO18" />No
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="page18_chk_Emergency_GasCompanyCalled" runat="server" />
                                    Emergency situation. Gas company called to fix gas leak or other.<br />
                                    <br />
                                    <asp:CheckBox ID="page18_chk_WorkCannot_MoreFailedTests" runat="server" />
                                    Work cannot continue due to one or more failed tests over Action Level.
                                </td>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td colspan="2">
                                                Select Appliances on At Worst Case Test:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="45%">
                                                <asp:CheckBox ID="page18_chk_Appliances_WorstCase_Dryer" runat="server" />
                                                Dryer
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="page18_chk_Appliances_WorstCase_WholeHouseFan" runat="server" />
                                                Whole House Fan
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="page18_chk_Appliances_WorstCase_BathFan" runat="server" />
                                                Bath Fan
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="page18_chk_Appliances_WorstCase_HVACAirHandler" runat="server" />
                                                HVAC Air Handler
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="page18_chk_Appliances_WorstCase_KitchenFan" runat="server" />
                                                Kitchen Fan
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="page18_chk_Appliances_WorstCase_Other" runat="server" />
                                                <asp:TextBox ID="page18_txt_Appliances_WorstCase_Other" runat="server" Style="border: none;
                                                    border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                                    width: 90px;"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="page18_chk_Appliances_WorstCase_AtticFan" runat="server" />
                                                Attic Fan
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" valign="top">
                                    <p style="vertical-align: middle; float: left; padding-right: 5px;">
                                        Notes:</p>
                                    <asp:TextBox ID="page18_txt_FinalNotes" runat="server" Style="width: 90%; height: 50px;"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <%--Page 18 End--%>
                <%--Page 19 start--%>
                <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                    position: relative;">
                    <div class="newtable">
                        <table width="100%" border="0" cellspacing="3" cellpadding="2">
                            <tr>
                                <td colspan="3" align="left" style="text-align: left">
                                    Copy this page for as many tests that are needed. Typically, there should be two
                                    of this f0orm, one for pre-work testing and one for post-work testing.
                                </td>
                            </tr>
                            <tr>
                                <td width="27%" style="text-align: left">
                                    <%--  <asp:RadioButton ID="page19_rdo_PreTest" runat="server" GroupName="testing19" />--%>
                                    <asp:CheckBox ID="page19_rdo_PreTest" runat="server" />
                                    Pre-test
                                </td>
                                <td width="27%">
                                    <%--<asp:RadioButton ID="page19_rdo_PostTest" runat="server" GroupName="testing19" />--%>
                                    <asp:CheckBox ID="page19_rdo_PostTest" runat="server" />
                                    Post-Test
                                </td>
                                <td width="90%">
                                    Tech Name
                                    <asp:TextBox ID="page19_txt_TechName" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 270px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%--<asp:RadioButton ID="page19_rdo_Auditor" runat="server" GroupName="testing19_1" />--%>
                                    <asp:CheckBox ID="page19_rdo_Auditor" runat="server" />
                                    Auditor
                                </td>
                                <td>
                                    <%--<asp:RadioButton ID="page19_rdo_Crew" runat="server" GroupName="testing19_1" />--%>
                                    <asp:CheckBox ID="page19_rdo_Crew" runat="server" />
                                    Crew
                                    <asp:TextBox ID="page19_txt_Crew" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 150px; font-weight: normal; color: rgb(0, 0, 0); width: 120px; !important;
                                        /* target ie8 & ie9 only */width: 120px; !important; /* ie 6 */width: 120px;
                                        !important; /* ie 8-9 */"></asp:TextBox>
                                </td>
                                <td>
                                    Test Date:
                                    <asp:TextBox ID="page19_txt_TestDate" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 270px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <ajaxtoolkit:CalendarExtender ID="page19_CalendarExtender1" runat="server" TargetControlID="txt_TestDate"
                                        OnClientDateSelectionChanged="checkDate">
                                    </ajaxtoolkit:CalendarExtender>
                                    <ajaxtoolkit:FilteredTextBoxExtender ID="page19_FilteredTextBoxExtender1" runat="server"
                                        TargetControlID="txt_TestDate" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxtoolkit:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td colspan="3">
                                    <strong>Combustion Safety Testing</strong> Are there Combustion Appliances?
                                    <asp:RadioButton ID="page19_rdo_CombustionAppliances_Yes" runat="server" GroupName="tester19" />
                                    Yes
                                    <asp:RadioButton ID="page19_rdo_CombustionAppliances_No" runat="server" GroupName="tester19" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    Combustion Equipment Safety Tests must be performed if any air sealing will be done
                                    or is done. If post-treatment blower door test is lower than the pre-treatment test,
                                    the chart below MUST be completed. Refer to the Procedure Manual for complete testing
                                    procedure.
                                </td>
                            </tr>
                        </table>
                        <div class="newtable" style="border: 1px solid #000; padding: 2px; height: auto;">
                            Are there any <u>unvented</u> combustion heating appliances?
                            <asp:RadioButton ID="page19_rdo_UnventedCombustionHeatingApp_Y" runat="server" GroupName="test19" />
                            Yes
                            <asp:RadioButton ID="page19_rdo_UnventedCombustionHeatingApp_N" runat="server" GroupName="test19" />
                            No
                            <table width="100%" border="1" cellspacing="2" cellpadding="1">
                                <tr>
                                    <td align="center">
                                    </td>
                                    <td align="center" colspan="2">
                                        CO Initial Reading
                                    </td>
                                    <td align="center" colspan="2">
                                        CO After<br />
                                        5-10
                                        <br />
                                        Min
                                    </td>
                                    <td align="center">
                                        Gas<br />
                                        Leak<br />
                                        Det Y/N
                                    </td>
                                    <td align="center">
                                        Flame<br />
                                        Rollout<br />
                                        Y/N
                                    </td>
                                    <td align="center" colspan="2">
                                        Spillage Y/N
                                    </td>
                                    <td align="center" colspan="2">
                                        Spillage after<br />
                                        1 min Y/N
                                    </td>
                                    <td align="center" colspan="2">
                                        Draft Pressure PA
                                    </td>
                                    <td align="center" colspan="2">
                                        Draft Pass Y/N
                                    </td>
                                    <td align="center" colspan="2">
                                        CO Flue
                                    </td>
                                    <td align="center" colspan="2">
                                        CO Pass Y/N
                                    </td>
                                      <td colspan="3" align="center">
                            Optional
                        </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Appliance
                                    </td>
                                    <td align="center">
                                        AMB
                                    </td>
                                    <td align="center">
                                        CAZ
                                    </td>
                                    <td align="center">
                                        AMB
                                    </td>
                                    <td align="center">
                                        CAZ
                                    </td>
                                    <td align="center">
                                    </td>
                                    <td align="center">
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td align="center">
                                        NAT
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td align="center">
                                        NAT
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td>
                                        NAT
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td>
                                        NAT
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td>
                                        NAT
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td>
                                        NAT
                                    </td>
                                       <td>
                            Stack Temp
                        </td>
                        <td>
                            O2
                        </td>
                        <td>
                            Eff.
                        </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Water Heater
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_WaterHeater_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_WaterHeater_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_After_WaterHeater_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_After_WaterHeater_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_GasLeak_WaterHeater" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Flame_WaterHeater" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                      <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_WaterHeater_StackTemp" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_WaterHeater_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_WaterHeater_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Furnace/Boiler
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_FurnaceBoil_AMB" runat="server" Style="width: 20px;
                                            border: none;" Height="18px"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_FurnaceBoil_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoAfter_FurnaceBoil_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoAfter_FurnaceBoil_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_GasLeak_FurnaceBoil" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Flame_FurnaceBoil" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_FurnaceBoil_Stack" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_FurnaceBoil_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_FurnaceBoil_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Gas Range
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_GasRange_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_GasRange_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoAfter_GasRange_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoAfter_GasRange_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_GasLeak_GasRange" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Flame_GasRange" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                     <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_GasRange_Stack" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_GasRange_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_GasRange_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Other
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_Other_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_Other_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoAfter_Other_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoAfter_Other_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_GasLeak_Other" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Flame_Other" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_Other_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_Other_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_Other_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_Other_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_Other_Stack" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_Other_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_Other_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Col1Cat" runat="server" Style="width: 70px; border: none;
                                            font-size: 11px;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_Col1Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_Col1Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoAfter_Col1Cat_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoAfter_Col1Cat_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_GasLeak_Col1Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Flame_Col1Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>                                            
                                    </td>
                                       <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_Col1Cat_Stack" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_Col1Cat_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_Col1Cat_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Col2Cat" runat="server" Style="width: 70px; border: none;
                                            font-size: 11px;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_Col2Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Co_Col2Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoAfter_Col2Cat_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoAfter_Col2Cat_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_GasLeak_Col2Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Flame_Col2Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_Spillage_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_SpillageAfter_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPress_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_DraftPass_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoFuel_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page19_txt_CoPass_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_Col2Cat_Stack" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_Col2Cat_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page19_txt_Optional_Col2Cat_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                <tr>
                                    <td width="33%" style="vertical-align: 0;">
                                        <div class="newtable" style="border: 1px solid #000; padding: 5px; height: auto;">
                                            <strong>Burners:</strong>
                                            <br />
                                            Write in CO ppm for
                                            <br />
                                            each burner:<br />
                                            <strong>Oven</strong>
                                            <br />
                                            If CO at oven vent is 100 ppm or more, install CO alarm and recommend service. No
                                            air sealing is allowed until CO level drops below 100 ppm.
                                            <p>
                                                <strong>Oven:</strong></p>
                                            CO Ambient:
                                            <asp:TextBox ID="page19_txt_COAmbient" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                font-weight: normal; color: rgb(0, 0, 0); width: 60px;"></asp:TextBox>
                                            <br />
                                            <br />
                                            CO at oven vent:
                                            <asp:TextBox ID="page19_txt_CO_Oven_Vent" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                font-weight: normal; color: rgb(0, 0, 0); width: 60px;"></asp:TextBox>
                                        </div>
                                    </td>
                                    <td>
                                        <table border="0" width="100%">
                                            <tr>
                                                <td width="33%" align="top" style="vertical-align: 0; width: 262px; margin: 0px 0px 0px 75px;
                                                    float: left;">
                                                    <div class="newtable" style="border: 1px solid #000; padding: 5px; height: auto;
                                                        width: 70%">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="10">
                                                            <tr>
                                                                <td>
                                                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                        <asp:TextBox ID="page19_txt_CoNotes1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                            font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                </td>
                                                                <td>
                                                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                        <asp:TextBox ID="page19_txt_CoNotes2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                            font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                        <asp:TextBox ID="page19_txt_CoNotes3" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                            font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                </td>
                                                                <td>
                                                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                        <asp:TextBox ID="page19_txt_CoNotes4" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                            font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                        <div style="float: right; margin-top: -82px;" class="">
                                            Notes:</div>
                                                </td>
                                                <td align="right" valign="top" style="float: right; width: 160px; text-align: center;">
                                                    <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="center" colspan="3">
                                                                 <asp:TextBox ID="txt_Note1_19" runat="server" TextMode="MultiLine" Style="background: #eaeaea;
                                                        padding: 4px; height: 120px;"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="100%">
                                                    <div style="float: left; margin-top: 15px;">
                                                        Notes:
                                                    </div>
                                                    <asp:TextBox ID="page19_txt_CoNotes" runat="server" Style="border: solid 1px #000;
                                                        padding: 5px; width: 88%; height: 46px;" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <br />
                                <tr>
                                    <td colspan="3" align="center" style="font-size: 11px;">
                                        <u>AMB = Ambient, CAZ = Combustion Appliance Zone, Det = Detected, W/C = Worst Case
                                            Conditions, NAT = Natural, Temp = Temperature, Eff = Efficiency</u>
                                        <br />
                                        Pa = Pascal, IWC = Inches of Water Column: 50 Pa. = .2 IWC, 25 Pa. = .1 IWC, 1 Pa.
                                        = 0.00401 IWC
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <h4 align="center">
                            BPI Minimum Acceptable Draft Test Reading at Outdoor Air Temperature Ranges</h4>
                        <table width="80%" border="1" cellspacing="0" cellpadding="10" align="center">
                            <tr>
                                <td align="center">
                                    Degrees F
                                </td>
                                <td align="center">
                                    <19
                                </td>
                                <td align="center">
                                    20s
                                </td>
                                <td align="center">
                                    30s
                                </td>
                                <td align="center">
                                    40s
                                </td>
                                <td align="center">
                                    50s
                                </td>
                                <td align="center">
                                    60s
                                </td>
                                <td align="center">
                                    70s
                                </td>
                                <td align="center">
                                    80s
                                </td>
                                <td align="center">
                                    >90
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    Pascals (Pa)
                                </td>
                                <td align="center">
                                    -2.5*
                                </td>
                                <td align="center">
                                    -2.25*
                                </td>
                                <td align="center">
                                    -2*
                                </td>
                                <td align="center">
                                    -1.75*
                                </td>
                                <td align="center">
                                    -1.5*
                                </td>
                                <td align="center">
                                    -1.25*
                                </td>
                                <td align="center">
                                    -1*
                                </td>
                                <td align="center">
                                    -.75*
                                </td>
                                <td align="center">
                                    -0.5*
                                </td>
                            </tr>
                        </table>
                        <table width="80%" border="0" cellspacing="0" cellpadding="10" align="center">
                            <tr>
                                <td>
                                    * Actual equation is (T_out/40)-2.75
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td>
                                    Outdoor Temperature:
                                    <asp:TextBox ID="page19_txt_OutdoorTemperature" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                    <br />
                                    <br />
                                    CAZ Worse Case Depressurization: Natural:
                                    <asp:TextBox ID="page19_txt_CAZDepressurization_Natural" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                    WC:
                                    <asp:TextBox ID="page19_txt_CAZDepressurization_WC" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                    Diff:
                                    <asp:TextBox ID="page19_txt_CAZDepressurization_Diff" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                    <br />
                                    <br />
                                    Pass?
                                    <asp:RadioButton ID="page19_rdo_CAZPass_Yes" runat="server" GroupName="YesorNo19" />Yes
                                    <asp:RadioButton ID="page19_rdo_CAZPass_No" runat="server" GroupName="YesorNo19" />No
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="page19_chk_Emergency_GasCompanyCalled" runat="server" />
                                    Emergency situation. Gas company called to fix gas leak or other.<br />
                                    <br />
                                    <asp:CheckBox ID="page19_chk_WorkCannot_MoreFailedTests" runat="server" />
                                    Work cannot continue due to one or more failed tests over Action Level.
                                </td>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td colspan="2">
                                                Select Appliances on At Worst Case Test:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="45%">
                                                <asp:CheckBox ID="page19_chk_Appliances_WorstCase_Dryer" runat="server" />
                                                Dryer
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="page19_chk_Appliances_WorstCase_WholeHouseFan" runat="server" />
                                                Whole House Fan
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="page19_chk_Appliances_WorstCase_BathFan" runat="server" />
                                                Bath Fan
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="page19_chk_Appliances_WorstCase_HVACAirHandler" runat="server" />
                                                HVAC Air Handler
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="page19_chk_Appliances_WorstCase_KitchenFan" runat="server" />
                                                Kitchen Fan
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="page19_chk_Appliances_WorstCase_Other" runat="server" />
                                                <asp:TextBox ID="page19_txt_Appliances_WorstCase_Other" runat="server" Style="border: none;
                                                    border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                                    width: 90px;"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="page19_chk_Appliances_WorstCase_AtticFan" runat="server" />
                                                Attic Fan
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" valign="top">
                                    Notes:
                                    <asp:TextBox ID="page19_txt_FinalNotes" runat="server" Style="width: 90%; height: 50px;"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <%--Page 19 End--%>
                <%--Page 20 start--%>
                <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                    position: relative;">
                    <div class="newtable">
                        <table width="100%" border="0" cellspacing="3" cellpadding="2">
                            <tr>
                                <td colspan="3" align="left" style="text-align: left">
                                    Copy this page for as many tests that are needed. Typically, there should be two
                                    of this form, one for pre-work testing and one for post-work testing.
                                </td>
                            </tr>
                            <tr>
                                <td width="27%" style="text-align: left">
                                    <%--<asp:RadioButton ID="page20_rdo_PreTest" runat="server" GroupName="testing20" />--%>
                                    <asp:CheckBox ID="page20_rdo_PreTest" runat="server" />
                                    Pre-test
                                </td>
                                <td width="27%">
                                    <%--<asp:RadioButton ID="page20_rdo_PostTest" runat="server" GroupName="testing20" />--%>
                                    <asp:CheckBox ID="page20_rdo_PostTest" runat="server" />
                                    Post-Test
                                </td>
                                <td width="90%">
                                    Tech Name
                                    <asp:TextBox ID="page20_txt_TechName" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 270px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%--<asp:RadioButton ID="page20_rdo_Auditor" runat="server" GroupName="testing20_1" />--%>
                                    <asp:CheckBox ID="page20_rdo_Auditor" runat="server" />
                                    Auditor
                                </td>
                                <td>
                                    <%--<asp:RadioButton ID="page20_rdo_Crew" runat="server" GroupName="testing20_1" />--%>
                                    <asp:CheckBox ID="page20_rdo_Crew" runat="server" />
                                    Crew
                                    <asp:TextBox ID="page20_txt_Crew" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 150px; font-weight: normal; color: rgb(0, 0, 0); width: 120px; !important;
                                        /* target ie8 & ie9 only */width: 120px; !important; /* ie 6 */width: 120px;
                                        !important; /* ie 8-9 */"></asp:TextBox>
                                </td>
                                <td>
                                    Test Date:
                                    <asp:TextBox ID="page20_txt_TestDate" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 270px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <ajaxtoolkit:CalendarExtender ID="page20_CalendarExtender1" runat="server" TargetControlID="txt_TestDate"
                                        OnClientDateSelectionChanged="checkDate">
                                    </ajaxtoolkit:CalendarExtender>
                                    <ajaxtoolkit:FilteredTextBoxExtender ID="page20_FilteredTextBoxExtender1" runat="server"
                                        TargetControlID="txt_TestDate" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxtoolkit:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td colspan="3">
                                    <strong>Combustion Safety Testing</strong> Are there Combustion Appliances?
                                    <asp:RadioButton ID="page20_rdo_CombustionAppliances_Yes" runat="server" GroupName="tester20" />
                                    Yes
                                    <asp:RadioButton ID="page20_rdo_CombustionAppliances_No" runat="server" GroupName="tester20" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    Combustion Equipment Safety Tests must be performed if any air sealing will be done
                                    or is done. If post-treatment blower door test is lower than the pre-treatment test,
                                    the chart below MUST be completed. Refer to the Procedure Manual for complete testing
                                    procedure.
                                </td>
                            </tr>
                        </table>
                        <div class="newtable" style="border: 1px solid #000; padding: 2px; height: auto;">
                            Are there any <u>unvented</u> combustion heating appliances?
                            <asp:RadioButton ID="page20_rdo_UnventedCombustionHeatingApp_Y" runat="server" GroupName="test20" />
                            Yes
                            <asp:RadioButton ID="page20_rdo_UnventedCombustionHeatingApp_N" runat="server" GroupName="test20" />
                            No
                            <table width="100%" border="1" cellspacing="2" cellpadding="1">
                                <tr>
                                    <td align="center">
                                    </td>
                                    <td align="center" colspan="2">
                                        CO Initial Reading
                                    </td>
                                    <td align="center" colspan="2">
                                        CO After<br />
                                        5-10
                                        <br />
                                        Min
                                    </td>
                                    <td align="center">
                                        Gas<br />
                                        Leak<br />
                                        Det Y/N
                                    </td>
                                    <td align="center">
                                        Flame<br />
                                        Rollout<br />
                                        Y/N
                                    </td>
                                    <td align="center" colspan="2">
                                        Spillage Y/N
                                    </td>
                                    <td align="center" colspan="2">
                                        Spillage after<br />
                                        1 min Y/N
                                    </td>
                                    <td align="center" colspan="2">
                                        Draft Pressure PA
                                    </td>
                                    <td align="center" colspan="2">
                                        Draft Pass Y/N
                                    </td>
                                    <td align="center" colspan="2">
                                        CO Flue
                                    </td>
                                    <td align="center" colspan="2">
                                        CO Pass Y/N
                                    </td>
                                     <td colspan="3" align="center">
                            Optional
                        </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Appliance
                                    </td>
                                    <td align="center">
                                        AMB
                                    </td>
                                    <td align="center">
                                        CAZ
                                    </td>
                                    <td align="center">
                                        AMB
                                    </td>
                                    <td align="center">
                                        CAZ
                                    </td>
                                    <td align="center">
                                    </td>
                                    <td align="center">
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td align="center">
                                        NAT
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td align="center">
                                        NAT
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td>
                                        NAT
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td>
                                        NAT
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td>
                                        NAT
                                    </td>
                                    <td align="center">
                                        W/C
                                    </td>
                                    <td>
                                        NAT
                                    </td>
                                     <td align="center">
                                                                Stack Temp
                                                            </td>
                                                            <td>
                                                                O2
                                                            </td>
                                                            <td>
                                                                Eff.
                                                            </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Water Heater
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_WaterHeater_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_WaterHeater_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_After_WaterHeater_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_After_WaterHeater_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_GasLeak_WaterHeater" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Flame_WaterHeater" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_WaterHeater_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_WaterHeater_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_WaterHeater_StackTemp" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_WaterHeater_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_WaterHeater_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Furnace/Boiler
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_FurnaceBoil_AMB" runat="server" Style="width: 20px;
                                            border: none;" Height="18px"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_FurnaceBoil_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoAfter_FurnaceBoil_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoAfter_FurnaceBoil_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_GasLeak_FurnaceBoil" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Flame_FurnaceBoil" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_FurnaceBoil_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_FurnaceBoil_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                       <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_FurnaceBoil_Stack" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_FurnaceBoil_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_FurnaceBoil_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Gas Range
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_GasRange_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_GasRange_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoAfter_GasRange_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoAfter_GasRange_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_GasLeak_GasRange" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Flame_GasRange" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_GasRange_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_GasRange_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                     <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_GasRange_Stack" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_GasRange_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_GasRange_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Other
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_Other_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_Other_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoAfter_Other_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoAfter_Other_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_GasLeak_Other" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Flame_Other" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_Other_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_Other_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_Other_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_Other_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_Other_WC" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_Other_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>                                            
                                    </td>
                                     <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_Other_Stack" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_Other_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_Other_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Col1Cat" runat="server" Style="width: 70px; border: none;
                                            font-size: 11px;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_Col1Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_Col1Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoAfter_Col1Cat_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoAfter_Col1Cat_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_GasLeak_Col1Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Flame_Col1Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_Col1Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_Col1Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                       <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_Col1Cat_Stack" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_Col1Cat_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_Col1Cat_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Col2Cat" runat="server" Style="width: 70px; border: none;
                                            font-size: 11px;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_Col2Cat_AMB" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Co_Col2Cat_CAZ" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoAfter_Col2Cat_AMB" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoAfter_Col2Cat_CAZ" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_GasLeak_Col2Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Flame_Col2Cat" runat="server" Style="width: 20px; border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_Spillage_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_SpillageAfter_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPress_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_DraftPass_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoFuel_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_Col2Cat_WC" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="page20_txt_CoPass_Col2Cat_NAT" runat="server" Style="width: 20px;
                                            border: none;"></asp:TextBox>
                                    </td>
                                    <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_Col2Cat_Stack" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_Col2Cat_O2" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                                            <td align="center">
                                                                <asp:TextBox ID="page20_txt_Optional_Col2Cat_Eff" runat="server" Style="width: 20px;
                                                                    border: none;"></asp:TextBox>
                                                            </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                <tr>
                                    <td width="33%" style="vertical-align: 0;">
                                        <div class="newtable" style="border: 1px solid #000; padding: 5px; height: auto;">
                                            <strong>Burners:</strong>
                                            <br />
                                            Write in CO ppm for
                                            <br />
                                            each burner:<br />
                                            <strong>Oven</strong>
                                            <br />
                                            If CO at oven vent is 100 ppm or more, install CO alarm and recommend service. No
                                            air sealing is allowed until CO level drops below 100 ppm.
                                            <p>
                                                <strong>Oven:</strong></p>
                                            CO Ambient:
                                            <asp:TextBox ID="page20_txt_COAmbient" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                font-weight: normal; color: rgb(0, 0, 0); width: 60px;"></asp:TextBox>
                                            <br />
                                            <br />
                                            CO at oven vent:
                                            <asp:TextBox ID="page20_txt_CO_Oven_Vent" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                font-weight: normal; color: rgb(0, 0, 0); width: 60px;"></asp:TextBox>
                                        </div>
                                    </td>
                                    <td>
                                        <table border="0" width="100%">
                                            <tr>
                                                <td width="33%" align="top" style="vertical-align: 0; width: 262px; margin: 0px 0px 0px 75px;
                                                    float: left;">
                                                    <div class="newtable" style="border: 1px solid #000; padding: 5px; height: auto;
                                                        width: 70%">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                                            <tr>
                                                                <td>
                                                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                        <asp:TextBox ID="page20_txt_CoNotes1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                            font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                </td>
                                                                <td>
                                                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                        <asp:TextBox ID="page20_txt_CoNotes2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                            font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                        <asp:TextBox ID="page20_txt_CoNotes3" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                            font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                </td>
                                                                <td>
                                                                    <span style="border: solid 1px #000; padding: 5px 10px; border-radius: 50px;">
                                                                        <asp:TextBox ID="page20_txt_CoNotes4" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                                                            font-weight: normal; color: rgb(0, 0, 0); width: 53px;"></asp:TextBox></span>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                        <div style="float: right; margin-top: -82px;" class="">
                                            Notes:</div>
                                                </td>
                                                <td align="right" valign="top" style="float: right; width: 160px; text-align: center;">
                                                    <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="center" colspan="3">
                                                                <asp:TextBox ID="txt_Note1_20" runat="server" TextMode="MultiLine" Style="background: #eaeaea;
                                                        padding: 4px; height: 120px;"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                  
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="100%">
                                                    <div style="float: left; margin-top: 15px;">
                                                        Notes:
                                                    </div>
                                                    <asp:TextBox ID="page20_txt_CoNotes" runat="server" Style="border: solid 1px #000;
                                                        padding: 5px; width: 88%; height: 46px;" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <br />
                                <tr>
                                    <td colspan="3" align="center" style="font-size: 11px;">
                                        <u>AMB = Ambient, CAZ = Combustion Appliance Zone, Det = Detected, W/C = Worst Case
                                            Conditions, NAT = Natural, Temp = Temperature, Eff = Efficiency</u>
                                        <br />
                                        Pa = Pascal, IWC = Inches of Water Column: 50 Pa. = .2 IWC, 25 Pa. = .1 IWC, 1 Pa.
                                        = 0.00401 IWC
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <h4 align="center">
                            BPI Minimum Acceptable Draft Test Reading at Outdoor Air Temperature Ranges</h4>
                        <table width="80%" border="1" cellspacing="0" cellpadding="10" align="center">
                            <tr>
                                <td align="center">
                                    Degrees F
                                </td>
                                <td align="center">
                                    <19
                                </td>
                                <td align="center">
                                    20s
                                </td>
                                <td align="center">
                                    30s
                                </td>
                                <td align="center">
                                    40s
                                </td>
                                <td align="center">
                                    50s
                                </td>
                                <td align="center">
                                    60s
                                </td>
                                <td align="center">
                                    70s
                                </td>
                                <td align="center">
                                    80s
                                </td>
                                <td align="center">
                                    >90
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    Pascals (Pa)
                                </td>
                                <td align="center">
                                    -2.5*
                                </td>
                                <td align="center">
                                    -2.25*
                                </td>
                                <td align="center">
                                    -2*
                                </td>
                                <td align="center">
                                    -1.75*
                                </td>
                                <td align="center">
                                    -1.5*
                                </td>
                                <td align="center">
                                    -1.25*
                                </td>
                                <td align="center">
                                    -1*
                                </td>
                                <td align="center">
                                    -.75*
                                </td>
                                <td align="center">
                                    -0.5*
                                </td>
                            </tr>
                        </table>
                        <table width="80%" border="0" cellspacing="0" cellpadding="10" align="center">
                            <tr>
                                <td>
                                    * Actual equation is (T_out/40)-2.75
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td>
                                    Outdoor Temperature:
                                    <asp:TextBox ID="page20_txt_OutdoorTemperature" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                    <br />
                                    <br />
                                    CAZ Worse Case Depressurization: Natural:
                                    <asp:TextBox ID="page20_txt_CAZDepressurization_Natural" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                    WC:
                                    <asp:TextBox ID="page20_txt_CAZDepressurization_WC" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                    Diff:
                                    <asp:TextBox ID="page20_txt_CAZDepressurization_Diff" runat="server" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                        width: 90px;"></asp:TextBox>
                                    <br />
                                    <br />
                                    Pass?
                                    <asp:RadioButton ID="page20_rdo_CAZPass_Yes" runat="server" GroupName="YesorNO20" />Yes
                                    <asp:RadioButton ID="page20_rdo_CAZPass_No" runat="server" GroupName="YesorNO20" />No
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="page20_chk_Emergency_GasCompanyCalled" runat="server" />
                                    Emergency situation. Gas company called to fix gas leak or other.<br />
                                    <br />
                                    <asp:CheckBox ID="page20_chk_WorkCannot_MoreFailedTests" runat="server" />
                                    Work cannot continue due to one or more failed tests over Action Level.
                                </td>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td colspan="2">
                                                Select Appliances on At Worst Case Test:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="45%">
                                                <asp:CheckBox ID="page20_chk_Appliances_WorstCase_Dryer" runat="server" />
                                                Dryer
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="page20_chk_Appliances_WorstCase_WholeHouseFan" runat="server" />
                                                Whole House Fan
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="page20_chk_Appliances_WorstCase_BathFan" runat="server" />
                                                Bath Fan
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="page20_chk_Appliances_WorstCase_HVACAirHandler" runat="server" />
                                                HVAC Air Handler
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="page20_chk_Appliances_WorstCase_KitchenFan" runat="server" />
                                                Kitchen Fan
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="page20_chk_Appliances_WorstCase_Other" runat="server" />
                                                <asp:TextBox ID="page20_txt_Appliances_WorstCase_Other" runat="server" Style="border: none;
                                                    border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                                                    width: 90px;"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="page20_chk_Appliances_WorstCase_AtticFan" runat="server" />
                                                Attic Fan
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" valign="top">
                                    Notes:
                                    <asp:TextBox ID="page20_txt_FinalNotes" runat="server" Style="width: 90%; height: 50px;"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <%--Page 20 End--%>
                <%--Page 21 start--%>
                <div style="page-break-after: always; border: 1px solid #000000; width: 940px; margin: 0 auto;
                    position: relative;">
                    <h3>
                        House Air Sealing</h3>
                    <div class="newtable">
                        <table width="100%" border="1" cellspacing="2" cellpadding="2">
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    UI/Lin. Ft/#
                                </td>
                                <td align="center">
                                    Location(s)
                                </td>
                                <td align="center">
                                    Materials
                                </td>
                                <td align="center">
                                    Labor Hrs
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" align="center">
                                    <h3>
                                        Doors:</h3>
                                </td>
                                <td width="10%">
                                </td>
                                <td width="10%">
                                    <asp:TextBox ID="txt_Door_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td width="25%">
                                    <asp:TextBox ID="txt_Door_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td width="25%">
                                    <asp:TextBox ID="txt_Door_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Door_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_DoorReplace" runat="server" />
                                    Replace
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_DoorReplace_Repair" runat="server" />
                                    Repair
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorReplace_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorReplace_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorReplace_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorReplace_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_DoorWeatherstrip" runat="server" />
                                    Weatherstrip
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorWeatherstrip_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorWeatherstrip_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorWeatherstrip_Location" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorWeatherstrip_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorWeatherstrip_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_DoorSweep" runat="server" />
                                    Sweep(s)
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorSweep_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorSweep_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorSweep_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorSweep_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorSweep_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_DoorThreshold" runat="server" />
                                    Threshold(s)
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorThreshold_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorThreshold_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorThreshold_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorThreshold_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorThreshold_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_DoorSealing" runat="server" />
                                    Sealing
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorSealing_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorSealing_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorSealing_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorSealing_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_DoorSealing_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <h3>
                                        Windows:</h3>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Windows_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Windows_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Windows_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Windows_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_WindowsReplace" runat="server" />
                                    Replace
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_WindowsReplace_Repair" runat="server" />
                                    Repair
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReplace_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReplace_Location" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReplace_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReplace_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_WindowsReplace_BrokenGlass" runat="server" />
                                    Replace broken glass
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReplace_BrokenGlass_Blank" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReplace_BrokenGlass_UI" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReplace_BrokenGlass_Location" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReplace_BrokenGlass_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReplace_BrokenGlass_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_WindowsReglaze" runat="server" />
                                    Reglaze
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReglaze_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReglaze_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReglaze_Location" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReglaze_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsReglaze_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_WindowsWeatherstrip" runat="server" />
                                    Weatherstrip
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsWeatherstrip_Blank" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsWeatherstrip_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsWeatherstrip_Location" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsWeatherstrip_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsWeatherstrip_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_WindowsSashLock" runat="server" />
                                    Sash lock(s)
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsSashLock_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsSashLock_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsSashLock_Location" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsSashLock_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsSashLock_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_WindowsSealing" runat="server" />
                                    Sealing
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsSealing_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsSealing_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsSealing_Location" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsSealing_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_WindowsSealing_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <h3>
                                        Other:</h3>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Other_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="page21_txt_Other_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Other_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Other_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_OtherDryerOtherVents" runat="server" />
                                    Dryer/Other Vents
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherDryerOtherVents_Blank" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherDryerOtherVents_UI" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherDryerOtherVents_Location" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherDryerOtherVents_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherDryerOtherVents_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_OtherFireplace" runat="server" />
                                    Fireplace
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherFireplace_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherFireplace_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherFireplace_Location" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherFireplace_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherFireplace_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_OtherPlumbing" runat="server" />
                                    Plumbing
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherPlumbing_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherPlumbing_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherPlumbing_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherPlumbing_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherPlumbing_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_OtherElectrical" runat="server" />
                                    Electrical
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherElectrical_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherElectrical_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherElectrical_Location" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherElectrical_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherElectrical_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_OtherWall" runat="server" />
                                    Walls
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherWall_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherWall_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherWall_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherWall_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherWall_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_OtherStairs" runat="server" />
                                    Stairs
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherStairs_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherStairs_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherStairs_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherStairs_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherStairs_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_OtherOther" runat="server" />
                                    Other
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherOther_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherOther_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherOther_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherOther_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherOther_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <b>Attics</b> Indicate areas where air sealing is needed and/or performed:
                        <table width="100%" border="1" cellspacing="5" cellpadding="2">
                            <tr>
                                <td align="center" width="35%">
                                    Air Sealing Measures:
                                </td>
                                <td align="center" width="50%">
                                    Materials
                                </td>
                                <td>
                                    Labor hrs Optional
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AirSealing_TopPlates" runat="server" />
                                    Top Plates
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_TopPlates_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_TopPlates_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AirSealing_Plumbing" runat="server" />
                                    Plumbing Penetrations
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_Plumbing_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_Plumbing_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AirSealing_Electrical" runat="server" />
                                    Electrical Penetrations
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_Electrical_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_Electrical_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AirSealing_DropCeiling" runat="server" />
                                    Dropped Ceilings
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_DropCeiling_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_DropCeiling_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AirSealing_BulkheadSoffits" runat="server" />
                                    Bulkhead soffits
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_BulkheadSoffits_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_BulkheadSoffits_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AirSealing_RecessedFixtures" runat="server" />
                                    Recessed fixtures
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_RecessedFixtures_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_RecessedFixtures_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AirSealing_Access" runat="server" />
                                    Access
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_Access_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_Access_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AirSealing_Ducts" runat="server" />
                                    Ducts
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_Ducts_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_Ducts_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AirSealing_AcHtg" runat="server" />
                                    AC or htg system air handler
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_AcHtg_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_AcHtg_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AirSealing_OpenChaseways" runat="server" />
                                    Open Chaseways
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_OpenChaseways_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_OpenChaseways_LaborHr" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_AirSealing_Other" runat="server" />
                                    Other
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_Other_Material" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AirSealing_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td valign="top" width="10%">
                                    Notes:
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="txt21_Comment" Height="50px" Width="97%" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <%--Page 21 End--%>
                <%--Page 22 start--%>
                <div style="border: 1px solid #000000; width: 940px; margin: 0 auto; position: relative;">
                    <!--main_right begin-->
                    <p style="text-align: center; padding-bottom: 0; font-size: 16px">
                        <strong>To assist all the inspectors and evaluators, please list:</strong></p>
                    <br />
                    <div class="newtable" style="border: 1px solid #000; height: auto;">
                        <table width="100%" border="1" cellpadding="4" cellspacing="15" style="text-align: center;">
                            <tr>
                                <td width="33%">
                                    Measures called for on this audit form but not installed
                                </td>
                                <td width="38%">
                                    Measures called for and installed on behalf of
                                    <br />
                                    another program (WAP, ARRA, Gas Company, Local) and not on the invoice to FirstEnergy
                                </td>
                                <td width="38%">
                                    Measures not called for by the auditor but installed by a measures crew or subcontractor
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasureInstalledLine1" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeasureFirstenergyLine1" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeaasureSubcontractorLine1" runat="server" Style="border: 0;
                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasureInstalledLine2" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeasureFirstenergyLine2" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeaasureSubcontractorLine2" runat="server" Style="border: 0;
                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasureInstalledLine3" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeasureFirstenergyLine3" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeaasureSubcontractorLine3" runat="server" Style="border: 0;
                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasureInstalledLine4" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeasureFirstenergyLine4" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeaasureSubcontractorLine4" runat="server" Style="border: 0;
                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasureInstalledLine5" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeasureFirstenergyLine5" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeaasureSubcontractorLine5" runat="server" Style="border: 0;
                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasureInstalledLine6" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeasureFirstenergyLine6" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeaasureSubcontractorLine6" runat="server" Style="border: 0;
                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasureInstalledLine7" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeasureFirstenergyLine7" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeaasureSubcontractorLine7" runat="server" Style="border: 0;
                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasureInstalledLine8" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeasureFirstenergyLine8" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeaasureSubcontractorLine8" runat="server" Style="border: 0;
                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasureInstalledLine9" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeasureFirstenergyLine9" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeaasureSubcontractorLine9" runat="server" Style="border: 0;
                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasureInstalledLine10" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeasureFirstenergyLine10" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_MeaasureSubcontractorLine10" runat="server" Style="border: 0;
                                        width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="margindiv">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 6px;">
                            <tr>
                                <td valign="top" style="width: 10%;">
                                    <p style="vertical-align: middle; float: left; padding: 5px 9px;">
                                        Other Notes To Inspectors and Evaluators:</p>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_OtherInsandEvaluators" runat="server" TextMode="MultiLine" Style="height: 60px;
                                        width: 97%; overflow: auto;"></asp:TextBox>
                                    <%-- <textarea name="" cols="" rows="" style="height: 60px; width: 97%;"></textarea>--%>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="margindiv">
                        <p style="text-align: center;">
                            <strong>Measure(s) called for and refused by customer:</strong></p>
                        <table width="100%" height="250px" border="1" style="text-align: center" cellpadding="3"
                            cellspacing="15">
                            <tr>
                                <td>
                                    <strong>Measure called for and refused</strong>
                                </td>
                                <td>
                                    <strong>Customer Signature/Date</strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasuresRefusedLine1" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CustomerSignDateLine1" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasuresRefusedLine2" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CustomerSignDateLine2" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasuresRefusedLine3" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CustomerSignDateLine3" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_MeasuresRefusedLine4" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CustomerSignDateLine4" runat="server" Style="border: 0; width: 100%;
                                        height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <p style="padding: 3px 3px;">
                        <strong>All the following forms must be attached to the job in WARM3 to qualify for
                            invoice approval:</strong></p>
                    <div>
                        <div class="tablediv">
                            <div id="one" style="width: 50%; float: left;">
                                <asp:CheckBox ID="Chk_WarmInvoice" runat="server" />
                                WARM3 Invoice</br>
                                <asp:CheckBox ID="Chk_ThisAuditForm" runat="server" />
                                This audit form</br>
                                <asp:CheckBox ID="Chk_SeasonalForm" runat="server" />
                                Seasonal Allowance Calculation Form</br>
                                <asp:CheckBox ID="Chk_OurAgreement" runat="server" />Our Partnership Agreement</br>
                                <asp:CheckBox ID="Chk_OurStrategy" runat="server" />
                                Our Savings Strategy</br>
                                <asp:CheckBox ID="Chk_CustomerKwh" runat="server" />
                                Customer Details from FE Human Services Web Site Only send the kWh</br>
                                <asp:CheckBox ID="Chk_AccountKWHWebsite" runat="server" />Account kWh usage from
                                FE Human Services Web Site</br>
                                <asp:CheckBox ID="Chk_RT" runat="server" />
                                RT vs RS Spreadsheet
                                <asp:CheckBox ID="Chk_RTNA" runat="server" />
                                N/A</br>
                                <asp:CheckBox ID="Chk_ReceiptsInformation" runat="server" />
                                Receipts for items over $500 - FE needs this information
                                <asp:CheckBox ID="Chk_ReceiptsInfoNA" runat="server" />
                                N/A
                            </div>
                            <div id="two" style="width: 48%; float: left; margin-bottom: 26px;">
                                <asp:CheckBox ID="Chk_PhotoInaccesible" runat="server" />
                                Photos of work performed that is now inaccessible
                                <asp:CheckBox ID="Chk_PhotoInaccesibleNA" runat="server" />N/A</br>
                                <asp:CheckBox ID="Chk_WeatherizationPresent" runat="server" />
                                Weatherization Release Form when <i>unvented</i> combustion appliances are present
                                <asp:CheckBox ID="Chk_WeatherizationPresentNA" runat="server" />N/A</br>
                                <asp:CheckBox ID="Chk_CopyAirCustomer" runat="server" />
                                Copy of "Air Tight Home" handout signed by customer
                                <asp:CheckBox ID="Chk_CopyAirCustomerNA" runat="server" />
                                N/A</br>
                                <asp:CheckBox ID="Chk_CopyCustomerWorksheet" runat="server" />
                                Copy of Custom Measure Payback Worksheet
                                <asp:CheckBox ID="Chk_CopyCustomerWorksheetNA" runat="server" />
                                N/A</br>
                                <asp:CheckBox ID="Chk_CopyHSForm" runat="server" />Copy of H&S Conditions and Findings
                                Form
                                <asp:CheckBox ID="Chk_CopyHSFormNA" runat="server" />
                                N/A</br>
                                <asp:CheckBox ID="Chk_ReferralProgram" runat="server" />
                                Information regarding referrals to other programs
                                <asp:CheckBox ID="Chk_ReferralProgramNA" runat="server" />
                                N/A</br>
                                <asp:CheckBox ID="Chk_HeatContractor" runat="server" />
                                Heat Pump Checklist for contractor </br>
                                <asp:CheckBox ID="Chk_ACContrator" runat="server" />
                                AC Checklist for contractor</br>
                                <asp:CheckBox ID="Chk_AccountsWebsite" runat="server" /><%--Sears Appliance Fax Form--%>Lowe's
                    Appliance POD Form (WARM LIURP only-in applicable service areas)
                                <%--<asp:CheckBox ID="Chk_SearsAppliance" runat="server" />
                    Sears Appliance Fax Form (Met-Ed, Penn Power and West Penn Power WARM Only)--%>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </div>
                <%--Page 22 End--%>
                <%--start tanveer--%>
                <!-- Photo Page Start -->
                <%if (dtPhoto.Rows.Count > 0)
                              { %>
            </div>
            <div style="font-weight: bold;">
                <div style="clear: left;">
                </div>
                <!-- form section -->
                <div style="border: 1px solid #B3B3B3; width: 940px; margin:50px auto; position: relative;">
                    <table border="0" cellpadding="2px" style="margin: 0 auto; width: 100%;">
                        <%for (int i = 0; i <= dtPhoto.Rows.Count - 1; i++)
                                      {%>
                        <% if (i % 2 == 0)
                                       { %>
                        <tr>
                            <td>
                                <div style="float: left; width: 450px; min-height: 300px; margin: 3px;">
                                    <div style="font-size: 16px; color: Black; font-family: 'HelveticaNeueBlackItalic';
                                        margin: 8px 0px;">
                                        <%= Convert.ToString(dtPhoto.Rows[i]["PhotoTitle"])%>
                                    </div>
                                    <div style="float: left; padding: 2%; width: 280px; border: 1px dotted #CCC;">
                                        <img src="../METED/Photo_Page_Images1/<%=Convert.ToString(dtPhoto.Rows[i]["PhotoName"])%>"
                                            width="280px" height="215px" alt="" />
                                    </div>
                                    <div id="desc" style="font-size: 11px; color: #4B4B4B; text-align: justify; line-height: 22px;
                                        width: 440px; float: left; margin-top: 10px; padding-left: 3%; padding-right: 3%;">
                                        <%--background: url('../images/line.png')repeat-y;--%>
                                        <img src="../images/pen.png" width="20px" height="20px" alt="" /><%=Convert.ToString(dtPhoto.Rows[i]["PhotoDescription1"])%><%= Convert.ToString(dtPhoto.Rows[i]["PhotoDescription2"])%>
                                        <%=Convert.ToString(dtPhoto.Rows[i]["PhotoDescription3"])%></div>
                                </div>
                                <div style="clear: left;">
                                </div>
                                <br />
                                <br />
                                <br />
                            </td>
                            <%}
                                       else
                                       {%>
                            <td>
                                <div style="float: left; width: 450px; min-height: 300px; margin: 3px;">
                                    <div id="Div2" style="font-size: 16px; color: Black; font-family: 'HelveticaNeueBlackItalic';
                                        margin: 8px 0px;">
                                        <%= Convert.ToString(dtPhoto.Rows[i]["PhotoTitle"])%>
                                    </div>
                                    <div style="float: left; padding: 2%; width: 280px; border: 1px dotted #CCC;">
                                        <img src="../METED/Photo_Page_Images1/<%=Convert.ToString(dtPhoto.Rows[i]["PhotoName"])%>"
                                            width="280px" height="215px" alt="" />
                                    </div>
                                    <div style="font-size: 11px; color: #4B4B4B; text-align: justify; line-height: 22px;
                                        width: 440px; float: left; margin-top: 10px; padding-left: 3%; padding-right: 3%;">
                                        <%--background: url('../images/line.png')repeat-y;--%>
                                        <img src="../images/pen.png" width="20px" height="20px" alt="" /><%=Convert.ToString(dtPhoto.Rows[i]["PhotoDescription1"])%><%= Convert.ToString(dtPhoto.Rows[i]["PhotoDescription2"])%>
                                        <%=Convert.ToString(dtPhoto.Rows[i]["PhotoDescription3"])%></div>
                                </div>
                                <div style="clear: left;">
                                </div>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <%
                                } %>
                        <% if ((i % 5 == 0) && ((dtPhoto.Rows.Count / 6) > 0) && (i != 0))
                                         {
                        %>
                        </tr>
                    </table>
                </div>
                <div style="border: 1px solid #B3B3B3; page-break-before: always; width: 940px; margin: 0 auto; position: relative;">
                    <table border="0" cellpadding="2px;" style="margin: 0 auto; width: 100%;">
                        <%
                                }
                        %>
                        <% } %>
                        <% if ((dtPhoto.Rows.Count - 1) % 2 == 0)
                                       { %>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <%} %>
                    </table>
                    <!-- end form section -->
                    <div style="border-top: 1px solid #cfcfcf; font-size: 14px; color: #717171; padding: 5px 0;
                        text-align: center; width: 908px; margin: 0 auto; position: relative;">
                        Custom Weatherization, LLC Â© 2013</div>
                </div>
                <!-- Photo Page End-->
                <% } %>
                <%
                                else
                                { 
                %>
                <br />
                <div style="border-top: 1px solid #cfcfcf; font-size: 14px; color: #717171; padding: 5px 0;
                    text-align: center; width: 940px; margin: 0 auto; position: relative;">
                    Custom Weatherization, LLC © 2013</div>
            </div>
            <%
                                }
            %>
            <%--end of tanveer--%>
        </div>
    </div>
    </div> </div>
    </form>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#fix_div input[type=text]').attr("readonly", "readonly");
            //            $('#fix_div input[type=radio]').attr("disabled", "disabled");
            //            $('#fix_div input[type=checkbox]').attr("disabled", "disabled");
           // document.getElementById('<%=txt_Seasonal.ClientID %>').readOnly = false;
           // document.getElementById('<%=txt_ZipCode.ClientID %>').readOnly = false;
           // document.getElementById('<%=txt_State.ClientID %>').readOnly = false;
            //
        });
    </script>

    <script type="text/javascript">
        // This jQuery code makes all check boxes read-only
        $(':checkbox').click(function() {
            return false;
        });       
    </script>

    <script type="text/javascript">
        // This jQuery code makes all radio button read-only
        $(':radio').click(function() {
            return false;
        });
    </script>

    <script language="JavaScript" type="text/javascript">
        function Clickheretoprint() {
            // document.getElementById("divClientInter").style.pageBreakAfter = "always";
            //document.getElementById("divToBeComplated").style.pageBreakAfter = "always";

            var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
            disp_setting += "scrollbars=yes,width=650px, height=600px, left=100, top=25";
            var content_vlue = document.getElementById('<%=DivPrint.ClientID %>').innerHTML;
            var docprint = window.open("", "", disp_setting);
            docprint.document.open();
            docprint.document.write('<html><head><title>Custom Weatherization/ METED Audit Page</title>');
            docprint.document.write('</head><body onLoad="self.print()"><center>');
            docprint.document.write(content_vlue);
            docprint.document.write('</center></body></html>');
            docprint.document.close();
            docprint.focus();
        }    
    </script>

</body>
</html>
