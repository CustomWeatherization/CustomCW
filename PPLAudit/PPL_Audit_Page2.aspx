<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PPL_Audit_Page2.aspx.cs" Inherits="PPLAudit_PPL_Audit_Page2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Custom Weatherization/ PPL Audit Page</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="scrptmngr" runat="server"></ajaxToolkit:ToolkitScriptManager>
        <div id="fix_div">
            <a href="#" onclick="javascript:Clickheretoprint();" style="padding: 7px 257px 7px 10px; text-decoration: none;">
                <input type="button" value="PRINT AUDIT" style="padding: 7px 10px; border: none; background-color: #3570a0; border-radius: 5px; color: #ffffff; cursor: pointer; margin-left: 44%;" />
            </a>
            <br />
            <br />
            <div style="margin: 0 auto; width: 1000px; font-size: 14px; position: relative;"
                id="DivPrint" runat="server">
                <!--Page 1 Start -->
                <div style="page-break-after: always;">
                    <table width="940px" style="margin: 0 auto;" border="1" cellspacing="0" cellpadding="5">
                        <tr>
                            <td>
                                <h3><span style="float: left">WRAP Assessment Form</span></h3>
                                <span style="float: right">PPL Electric Utilities</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h1 style="font-size: 50px;">OVERVIEW</h1>
                            </td>
                        </tr>
                        <!--End of Row 1-->
                        <tr>
                            <td>
                                <table width="100%" border="0">
                                    <tr>
                                        <td><b>Case #</b>&nbsp;<span id="SpnJobNumber" style="text-decoration: none; font-size: 20px;" runat="server">Number</span> </td>
                                        <td><b>Name of Auditor</b> &nbsp;<span id="SpnAuditorName" style="text-decoration: none; font-size: 20px;" runat="server">Auditor Name</span></td>
                                        <td><b>Date of Audit</b> &nbsp;<span id="SpnAuditDate" style="text-decoration: none; font-size: 20px;" runat="server">Audit Date</span></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <!--End of Row 2-->
                        <%--<tr>
    	<td>Required Fields*</td>
    </tr>--%>
                        <tr>
                            <td>
                                <table width="100%" border="0">
                                    <tr>
                                        <td style="vertical-align: text-top;" rowspan="6"><b>1. Can the audit be completed?</b></td>
                                        <td style="vertical-align: text-top" rowspan="6"><%--<input type="checkbox"/>--%><asp:CheckBox ID="ChkAuditCompleteYes" runat="server" />
                                            Yes</td>
                                        <td rowspan="23" style="width: 0; border-right: 1px solid black;">
                                            <%--<div style="width: 0; border: 1px solid black; height: 832px"></div>--%>
                                        </td>
                                        <td colspan="2">No<asp:CheckBox ID="ChkAuditCompleteNo" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <br />
                                            <br />
                                            (If no, please select one)<br/></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="ChkAuditCompleteMoved" runat="server" />Moved</td>
                                        <td>
                                            <asp:CheckBox ID="ChkAuditCompleteNoReason" runat="server" />No Response</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="ChkAuditCompleteNoshowField" runat="server" />No Show in Field</td>
                                        <td>
                                            <asp:CheckBox ID="ChkAuditCompleteContractorSafety" runat="server" />Contractor Safety</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CheckBox ID="ChkHealthSafety" runat="server" />Health & Safety(must also complete Health & Safety Findings Form)</td>

                                    </tr>
                                    <tr>
                                        <td colspan="2"><i>Health & Safety reason</i><span style="color: red;"> *</span>&nbsp;->&nbsp;<input id="txtHealthSafety" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 30%;" type="text" />
                                        </td>

                                    </tr>
                                    <tr>
                                        <td colspan="2"><br/>&nbsp;</td>

                                    </tr>
                                    <tr>
                                        <td style="vertical-align: text-top;">
                                            <b>2. Are combustion devices present in the home?<br />
                                            </b><br />
                                        </td>
                                        <td style="vertical-align: text-top;">

                                            <%--<input type="checkbox" />--%><asp:CheckBox ID="ChkCombustionDeviceYes" runat="server" />
                                            Yes</td>

                                        <td style="vertical-align: text-top;" colspan="2">No<%--<input type="checkbox" />--%><asp:CheckBox ID="ChkCombustionDeviceNo" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td></br>&nbsp;</td>
                                        <td>&nbsp;</td>

                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: text-top;" rowspan="12"><b>3. Will the job type remain the same?</b></td>
                                        <td style="vertical-align: text-top;" rowspan="12">
                                            <asp:CheckBox ID="ChkJobRemainYes" runat="server" />
                                            Yes</td>

                                        <td colspan="2">No<asp:CheckBox ID="ChkJobRemainNo" runat="server" /></td>

                                    </tr>
                                    <tr>


                                        <td colspan="2">
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <asp:CheckBox ID="ChkFullCostBaseload" runat="server" />
                                            Job type is currently <b>Full Cost</b>; should be <b>Baseload</b>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<b><i>reason</i><span style="color: red;"> *</span>&nbsp;->&nbsp;</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:CheckBox ID="ChkElectricHeat" runat="server" />
                                            Home doesn't have more than 50% installed electric heat</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:CheckBox ID="ChkFullCostMeasure" runat="server" />
                                            Home doesn't need Full Cost measures</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:CheckBox ID="ChkWxProgram" runat="server" />Full Cost measures installed through other Wx program</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:CheckBox ID="ChkHealthSafetyDeferral" runat="server" />Health and Safety deferral</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <asp:CheckBox ID="ChkBaseloadFullcost" runat="server" />
                                            Job type is currently <b>Baseload</b>; should be <b>Full Cost</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<b><i>reason</i><span style="color: red;"> *</span>&nbsp;->&nbsp;</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:CheckBox ID="Chk50ElectricHeat" runat="server" />
                                            Home has > 50% installed electric heat</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:CheckBox ID="ChkFactoHeat" runat="server" />
                                            De facto heat</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="width: 55%;">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:CheckBox ID="ChkHighCooling" runat="server" />High cooling usage 
                                        <br />
                                            <br /><br />
                                            <p style="color: blue;">
                                                <b>Think this job is Low Cost?</b> Continue completing the assessment from even if you think
                                            this job should be changed to a Low Cost job type. More details will be covered in the
                                            water heating section.
                                            </p>
                                            <br />
                                            <br />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <br />
                                            <br />
                                            <b>4. Has the water heating section been completed?</b></td>
                                        <td>
                                            <br />
                                            <br />
                                            <asp:CheckBox ID="ChkHeatingCompleteYes" runat="server" />Yes</td>

                                        <td rowspan="2" colspan="2" style="vertical-align: text-top">
                                            <br />
                                            <br />
                                            No<asp:CheckBox ID="ChkHeatingCompleteNo" runat="server" /></td>

                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CheckBox ID="ChkLowCostFullCost" runat="server" />Job type is now <b>Low Cost</b> ; should be <b>Full Cost</b> </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--Page 1 Ends -->
                <br />
                <!--Page 2 Start -->
                <div style="page-break-after: always;">
                    <table width="940px" style="margin: 0 auto;" border="1" cellspacing="0" cellpadding="3">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="3" cellspacing="0">
                                    <tr>
                                        <td style="width: 3%;" valign="top">5.</td>
                                        <td style="width: 27%;" valign="top">
                                            <h4 style="margin: 0;">List reasons for electric usage:</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <table width="100%" border="0" cellpadding="10" cellspacing="0">
                                                <tr>
                                                    <td style="border-bottom: 1px solid #1a1a1a; border-right: 1px solid #1a1a1a; width: 5%;">#1</td>
                                                    <td style="border-bottom: 1px solid #1a1a1a;">
                                                        <input id="txtListReason1" runat="server" style="border: none; color: Black; font-weight: normal; width: 100%;" /></td>
                                                </tr>
                                                <tr>
                                                    <td style="border-bottom: 1px solid #1a1a1a; border-right: 1px solid #1a1a1a; width: 5%;">#2</td>
                                                    <td style="border-bottom: 1px solid #1a1a1a;">
                                                        <input id="txtListReason2" runat="server" type="text" style="border: none; color: Black; font-weight: normal; width: 100%;" /></td>
                                                </tr>
                                                <tr>
                                                    <td style="border-bottom: 1px solid #1a1a1a; border-right: 1px solid #1a1a1a; width: 5%;">#3</td>
                                                    <td style="border-bottom: 1px solid #1a1a1a;">
                                                        <input id="txtListReason3" runat="server" type="text" style="border: none; color: Black; font-weight: normal; width: 100%;" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 3%;" valign="top">6.</td>
                                        <td style="width: 27%;" valign="top">
                                            <h4 style="margin: 0;">What is the approximate heated square footage of the home?<span style="color: red;"> *</span></h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <input type="text" id="txtHeastedSquare" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 60%;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 3%;" valign="top">7.</td>
                                        <td style="width: 27%;" valign="top">
                                            <h4 style="margin: 0;">Is job done in conjunction with another Wx program?</h4>
                                            <p>Type of weatherization program:<span style="color: red;"> *</span></p>
                                            <ul style="list-style: none;">
                                                <li>
                                                    <input type="checkbox" />&nbsp; DCED WAP</li>
                                                <li>
                                                    <input type="checkbox" />&nbsp; CRISES</li>
                                                <li>
                                                    <input type="checkbox" />&nbsp; Gas Utility Wx</li>
                                                <li>
                                                    <input type="checkbox" />&nbsp; County Wx</li>
                                            </ul>

                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <table width="100%" border="0" cellpadding="8" cellspacing="0">
                                                <tr>
                                                    <td style="border-top: 1px solid #1a1a1a; border-right: 1px solid #1a1a1a; width: 13%;">
                                                        <input type="checkbox" />Yes
                                                    </td>
                                                    <td style="border-top: 1px solid #1a1a1a;">No<input type="checkbox" checked="checked" /></td>
                                                </tr>
                                                <tr>
                                                    <td style="border-right: 1px solid #1a1a1a; width: 13%;">&nbsp; </td>
                                                    <td>&nbsp; </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-right: 1px solid #1a1a1a; width: 13%;">&nbsp; </td>
                                                    <td>&nbsp; </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-right: 1px solid #1a1a1a; width: 13%;">&nbsp; </td>
                                                    <td>&nbsp; </td>
                                                </tr>

                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 3%;" valign="top">8.</td>
                                        <td style="width: 27%;" valign="top">
                                            <h4 style="margin: 0;">Name of weatherization contractor company</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <input type="text" value="                     Custom Weatherizaton, LLC" id="txtCompanyName" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 60%;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 3%;" valign="top">9.</td>
                                        <td style="width: 27%;" valign="top">
                                            <h4 style="margin: 0;">Projected or completed weatherization date</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <input type="text" id="txtCompleteDate" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 60%;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 3%;" valign="top">10.</td>
                                        <td style="width: 27%;" valign="top">
                                            <h4 style="margin: 0;">Referrals to other programs</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top">
                                                        <ul style="list-style: none; padding: 0; margin: 0;">
                                                            <li>
                                                                <input type="checkbox" id="ChkDcedWap" runat="server" />&nbsp; DCED WAP</li>
                                                            <li>
                                                                <input type="checkbox" id="ChkCountryWx" runat="server" />&nbsp; County Wx</li>
                                                            <li>
                                                                <input type="checkbox" id="ChkOperationHELP" runat="server" />&nbsp; Operation HELP</li>
                                                        </ul>
                                                    </td>
                                                    <td valign="top">
                                                        <ul style="list-style: none; padding: 0; margin: 0;">
                                                            <li>
                                                                <input type="checkbox" id="ChkCRISES" runat="server" />&nbsp; CRISES</li>
                                                            <li>
                                                                <input type="checkbox" id="ChkLIHEAP" runat="server" />&nbsp; LIHEAP</li>
                                                            <li>
                                                                <input type="checkbox" id="ChkAct129Epower" runat="server" />&nbsp; Act 129
                                                            <br />
                                                                E-PowerWise</li>
                                                        </ul>
                                                    </td>
                                                    <td valign="top">
                                                        <ul style="list-style: none; padding: 0; margin: 0;">
                                                            <li>
                                                                <input type="checkbox" id="ChkUtilityWx" runat="server" />&nbsp; Gas Utility Wx</li>
                                                            <li>
                                                                <input type="checkbox" id="ChkOnTrack" runat="server" />&nbsp; OnTrack</li>
                                                            <li>
                                                                <input type="checkbox" id="ChkAct129Rebate" runat="server" />&nbsp; Act 129
                                                            <br />
                                                                Appliance Rebate</li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <input type="checkbox" id="ChkOtherList" runat="server" />&nbsp; Other list&nbsp;<input type="text" id="txtOtherList" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 50%;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 3%;" valign="top">11.</td>
                                        <td style="width: 27%;" valign="top">
                                            <h4 style="margin: 0;">Referrals to pilot programs</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top">
                                                        <input type="checkbox" />&nbsp; Pilot#1
                                                    </td>
                                                    <td valign="top">
                                                        <input type="checkbox" />&nbsp; Pilot#2
                                                    </td>
                                                    <td valign="top">
                                                        <input type="checkbox" />&nbsp; Pilot#3
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 3%;" valign="top">12.</td>
                                        <td style="width: 27%;" valign="top">
                                            <h4 style="margin: 0;">After weatherization work is complete, do you expect customer's usage to decrease</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <table width="100%" border="0" cellpadding="8" cellspacing="0">
                                                <tr>
                                                    <td style="width: 13%;">
                                                        <input type="checkbox" id="rdoUsersIncreaseYES" runat="server" />&nbsp; Yes</td>
                                                    <td style="border-left: 1px solid #1a1a1a;">
                                                        <input type="checkbox" id="rdoUsersIncreaseNo" runat="server" />&nbsp; No</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td style="border-left: 1px solid #1a1a1a;">
                                                        <h5 style="margin: 0; font-size: 12px;"><i>If no, select a reason</i> <span style="color: red;">*</span>
                                                            <ul style="list-style: none; padding: 0; margin: 0;">
                                                                <li>
                                                                    <input type="checkbox" id="chkWrapMessare" runat="server" />&nbsp; Measures installed as part of WARP will increase usage</li>
                                                                <li>
                                                                    <input type="checkbox" id="chkCustomerUsage" runat="server" />&nbsp; Expected increase in customer's usage of electric heat (eg. getting rid of kerosene heater) </li>
                                                                <li>
                                                                    <input type="checkbox" id="chkLivingSpace" runat="server" />&nbsp; Expected increase in conditioned living space (eg. adding rooms, finishing basement)</li>
                                                                <li>
                                                                    <input type="checkbox" id="chkHouseholdOccupants" runat="server" />&nbsp; Expected increase in household occupants</li>
                                                                <li>
                                                                    <input type="checkbox" id="chkElectricAppliances" runat="server" />&nbsp; Expected increase in electric appliances (eg. adding a window air conditioner)</li>
                                                                <li>
                                                                    <input type="checkbox" id="chkOtherIncrease" runat="server" />&nbsp; Other <i><b>reason</b></i><span style="color: red;">*</span><asp:TextBox ID="txtOtherIncreaseComments" runat="server" MaxLength="100" Style="border: none; border-bottom: solid 1px rgb(0,0,0); width: 40%; font-weight: normal; color: rgb(0,0,0);"></asp:TextBox>
                                                                </li>
                                                            </ul>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 3%;" valign="top">13.</td>
                                        <td style="width: 27%;" valign="top">
                                            <h4 style="margin: 0;">Additional Comments</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <input type="text" id="txtAdditionalComment1" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 100%;" />
                                            <br />
                                            <input type="text" id="txtAdditionalComment2" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 100%;" />
                                            <br />
                                            <input type="text" id="txtAdditionalComment3" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 100%;" />
                                            <br />
                                            <input type="text" id="txtAdditionalComment4" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 100%;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--Page 2 Ends -->
                <br />
                <!--Page 3 Start -->
                <div style="page-break-after: always;">
                    <table cellpadding="0" cellspacing="10" width="940px" style="margin: 0 auto; border: 1px solid #1a1a1a;">
                        <tr>
                            <td colspan="2">
                                <h1 style="font-size: 50px;"><br />Customer Interview</h1>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <h3>Ask the customer to identify any of the following<br /></h3>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <br />
                                <h4 style="margin: 0;">1</h4>
                            </td>
                            <td>
                                <br />
                                <h4 style="margin: 0;">Heating Systems</h4>
                                <p style="padding: 0; margin: 0;">including unvented space heaters</p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtHeatingSystemsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="100"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtHeatingSystemsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="100"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <br />
                                <br />
                                <h4 style="margin: 0;">2</h4>
                            </td>
                            <td>
                                <br />
                                <br />
                                <h4 style="margin: 0;">Air Conditioning / Cooling Systems</h4>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtACSystemsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="100"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtACSystemsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="100"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <br />
                                <br />
                                <h4 style="margin: 0;">3</h4>
                            </td>
                            <td>
                                <br />
                                <br />
                                <h4 style="margin: 0;">Drafts</h4>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtDraftsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="100"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtDraftsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="100"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <br />
                                <br />
                                <h4 style="margin: 0;">4</h4>
                            </td>
                            <td>
                                <br />
                                <br />
                                <h4 style="margin: 0;">Excessively Cold Rooms</h4>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtColdRoomsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="100"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtColdRoomsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="100"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <br />
                                <br />
                                <h4 style="margin: 0;">5</h4>
                            </td>
                            <td>
                                <br />
                                <br />
                                <h4 style="margin: 0;">Moisture Problems</h4>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtMoistureProblemsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="100"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtMoistureProblemsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="100"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <br />
                                <br />
                                <h4 style="margin: 0;">6</h4>
                            </td>
                            <td>
                                <br />
                                <br />
                                <h4 style="margin: 0;">Special Health Needs or Problems of Customers that Could be Impacted by Weatherization</h4>
                                <p style="padding: 0; margin: 0;">Disabilities, illness, allergies, sensitivities, etc</p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtSpecialNeedsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="100"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <%-- <tr>
                            <td colspan="2">
                                <input type="text" style="width: 99%; border: 0 none; border-bottom: 1px solid #1a1a1a;" /></td>
                        </tr>--%>
                        <tr>
                            <td valign="top">
                                <br />
                                <br />
                                <h4 style="margin: 0;">7</h4>
                            </td>
                            <td>
                                <br />
                                <br />
                                <h4 style="margin: 0;">Other Notes</h4>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtOtherNotesLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="125"
                                    Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtOtherNotesLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);"
                                    MaxLength="125"
                                    Width="800px"></asp:TextBox><br /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                    </table>
                </div>
                <!--Page 3 End -->
                <br />
                <!--Page 4 Start-->
                <div style="page-break-after: always;">
                    <table cellpadding="0" cellspacing="10" width="940px" style="margin: 0 auto; border: 1px solid #1a1a1a;">
                        <tr>
                            <td colspan="2">
                                <br />
                                <h1 style="font-size: 50px;">Lighting</h1>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">1</h4>
                                        </td>
                                        <td style="width: 70%;">
                                            <h4 style="margin: 0;">Are LEDs recommended<span style="color: red;">*</span></h4>
                                        </td>
                                        <td style="width: 20%;">
                                            <input type="checkbox" id="ChkLEDRecommendedYes" runat="server" />
                                            &nbsp;Yes</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <p>Total LEDs recommended:</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Brand#1<span style="color: red;">*</span>&nbsp;
              <input id="txtLedBrnad1" runat="server" type="text" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 80%;" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Supplier#1<span style="color: red;">*</span>&nbsp;
              <input id="txtLedSupplier1" runat="server" type="text" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 77%;" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Brand#2&nbsp;
              <input id="txtLedBrnad2" runat="server" type="text" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 82%;" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Supplier#2&nbsp;
              <input id="txtLedSupplier2" runat="server" type="text" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 79%;" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>No&nbsp;<input type="checkbox" id="ChkLEDRecommendedNo" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>
                                                <i><b>If no, select a reason <span style="color: red;">*</span>
                                            &nbsp;->&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li>
                                                    <input type="checkbox" id="ChkInstalledCustomer" runat="server" />
                                                    &nbsp;CFLs installed by customer</li>
                                                <li>
                                                    <input type="checkbox" id="ChkInstalledOther" runat="server" />
                                                    &nbsp;CFLs installed by other weatherization program</li>
                                                <li>
                                                    <input type="checkbox" id="ChkCustomerRefuse" runat="server" />
                                                    &nbsp;Customer refused</li>
                                                <li>
                                                    <input type="checkbox" id="ChkOtherReason" runat="server" />
                                                    &nbsp;Other&nbsp;&nbsp;<b><i>reason</i></b><span style="color: red;">*</span><input id="txtOtherReason" runat="server" type="text" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 60%;" />
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br />
                                <br />
                                <h1 style="font-size: 50px;">Appliances</h1>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">1</h4>
                                        </td>
                                        <td style="width: 70%;">
                                            <h4 style="margin: 0;">Primary refrigerator assessment<span style="color: red;">*</span></h4>
                                        </td>
                                        <td style="width: 20%;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li>
                                                    <input type="checkbox" id="ChkPriRefrigeratorMonitor" runat="server" />
                                                    &nbsp;Yes - Monitored(<span style="color: red;">*</span>must complete refrigerator testing data from) </li>
                                                <li>
                                                    <input type="checkbox" id="ChkPriRefrigeratorDB" runat="server" />
                                                    &nbsp;Yes - Database</li>
                                                <li>
                                                    <input type="checkbox" id="ChkPriRefrigeratorOld5" runat="server" />
                                                    &nbsp;No - Refrigerator less then 5 years old</li>
                                                <li>
                                                    <input type="checkbox" id="ChkPriRefrigeratorLL" runat="server" />
                                                    &nbsp;No - Landlord refused</li>
                                                <li>
                                                    <input type="checkbox" id="ChkPriRefrigeratorCutomer" runat="server" />
                                                    &nbsp;No - Customer refused</li>
                                                <li>
                                                    <input type="checkbox" id="ChkPriRefrigeratorAssessed" runat="server" />
                                                    &nbsp;No - Refrigerator assessed through other weatherization program</li>
                                                <li>
                                                    <input type="checkbox" id="ChkPriRefrigeratorWARP" runat="server" />
                                                    &nbsp;No - WARP work deferred</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;" valign="top">
                                            <h4 style="margin: 0;">1a</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <h4 style="margin: 0;">Does the primary refrigerator qualify for a replacement?<span style="color: red;">*</span></h4>
                                        </td>
                                        <td style="width: 20%;" valign="top">
                                            <input type="checkbox" id="chk_RefrigeratorReplace_Yes" runat="server" />
                                            &nbsp;Yes</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>No&nbsp;<input type="checkbox" id="chk_RefrigeratorReplace_No" runat="server" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">2</h4>
                                        </td>
                                        <td style="width: 70%;">
                                            <h4 style="margin: 0;">Secondary refrigerator assessment<span style="color: red;">*</span></h4>
                                        </td>
                                        <td style="width: 20%;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li>
                                                    <input type="checkbox" id="ChkSecRefrigeratorMonitor" runat="server" />
                                                    &nbsp;Yes - Monitored(<span style="color: red;">*</span>must complete refrigerator testing data from) </li>
                                                <li>
                                                    <input type="checkbox" id="ChkSecRefrigeratorDB" runat="server" />
                                                    &nbsp;Yes - Database</li>
                                                <li>
                                                    <input type="checkbox" id="ChkSecRefrigeratorOld5" runat="server" />
                                                    &nbsp;No - Refrigerator less then 5 years old</li>
                                                <li>
                                                    <input type="checkbox" id="ChkSecRefrigeratorLL" runat="server" />
                                                    &nbsp;No - Landlord refused</li>
                                                <li>
                                                    <input type="checkbox" id="ChkSecRefrigeratorCutomer" runat="server" />
                                                    &nbsp;No - Customer refused</li>
                                                <li>
                                                    <input type="checkbox" id="ChkSecRefrigeratorAssessed" runat="server" />
                                                    &nbsp;No - Refrigerator assessed through other weatherization program</li>
                                                <li>
                                                    <input type="checkbox" id="ChkSecRefrigeratorWARP" runat="server" />
                                                    &nbsp;No - WARP work deferred</li>
                                                <li>
                                                    <input type="checkbox" id="ChkSecRefrigeratorNA" runat="server" />
                                                    &nbsp;NA</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;" valign="top">
                                            <h4 style="margin: 0;">2a</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <h4 style="margin: 0;">Does the secondary refrigerator qualify for a replacement?<span style="color: red;">*</span></h4>
                                        </td>
                                        <td style="width: 20%;" valign="top">
                                            <input type="checkbox" id="chk_Second_RefrigeratorReplace_Yes" runat="server" />
                                            &nbsp;Yes</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td><%--<span style="border-right: 1px solid #1a1a1a; display: inline-block; margin-right: 10px; padding-right: 10px;"></span>--%><%--<span style="display: inline-block"><input type="checkbox" />
                                            &nbsp;NA</span>--%>
                                            No &nbsp;<input type="checkbox" id="chk_Second_RefrigeratorReplace_No" runat="server" /><span style="color: black"> | </span>NA&nbsp;<input type="checkbox" />
                                        </td>

                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--Page 4 End-->
                <br />
                <!--Page 5 Strat-->
                <div style="border: 1px solid #000000; width: 940px; margin: 0 auto; page-break-after: always; position: relative;">
                    <br />
                    <div style="font-weight: normal;">
                        <h2>BASELOAD SECTION:</h2>
                         <b>Summary of Baseload Audit Work: C=Completed R=Referred N/A= Not Applicable NR=Not Recommended</b>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="50%">
                                            <table width="100%" border="0" cellspacing="3" cellpadding="3">
                                                <tr>
                                                    <td>Refrigerator Tested
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorTested_C" runat="server" Text="C" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorTested_R" runat="server" Text="R" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorTested_NA" runat="server" Text="N/A" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorTested_NR" runat="server" Text="N/R" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Refrigerator Tested (Sec.)
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorTestedSec_C" runat="server" Text="C" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorTestedSec_R" runat="server" Text="R" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorTestedSec_NA" runat="server" Text="N/A" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorTestedSec_NR" runat="server" Text="N/R" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Freezer Tested
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkFreezerTested_C" runat="server" Text="C" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkFreezerTested_R" runat="server" Text="R" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkFreezerTested_NA" runat="server" Text="N/A" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkFreezerTested_NR" runat="server" Text="N/R" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Refrigerator Coils Cleaned
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorCoilsCleaned_C" runat="server" Text="C" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorCoilsCleaned_R" runat="server" Text="R" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorCoilsCleaned_NA" runat="server" Text="N/A" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkRefrigeratorCoilsCleaned_NR" runat="server" Text="N/R" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>AC Filter Changed
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACFilterChanged_C" runat="server" Text="C" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACFilterChanged_R" runat="server" Text="R" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACFilterChanged_NA" runat="server" Text="N/A" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACFilterChanged_NR" runat="server" Text="N/R" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>AC Filter Cleaned
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACFilterCleaned_C" runat="server" Text="C" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACFilterCleaned_R" runat="server" Text="R" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACFilterCleaned_NA" runat="server" Text="N/A" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACFilterCleaned_NR" runat="server" Text="N/R" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>AC(s) Replaced
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACReplaced_C" runat="server" Text="C" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACReplaced_R" runat="server" Text="R" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACReplaced_NA" runat="server" Text="N/A" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkACReplaced_NR" runat="server" Text="N/R" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5">AC Location(s)
                                                        <asp:TextBox ID="txtAcLoaction" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 75%; font-weight: normal; color: Black;"
                                                            MaxLength="128"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="50%">
                                            <table width="100%" border="0" cellspacing="2" cellpadding="3">
                                                <tr>
                                                    <td>Dryer Vent Measures
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkDryerVentMeasures_C" runat="server" Text="C" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkDryerVentMeasures_R" runat="server" Text="R" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkDryerVentMeasures_NA" runat="server" Text="N/A" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">Describe:
                                                        <asp:TextBox ID="txtDryerVentMeauresDescribe" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 80%; font-weight: normal; color: Black;"
                                                            MaxLength="128"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Heating Filter Changed
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkHeatingFilterChanged_C" runat="server" Text="C" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkHeatingFilterChanged_R" runat="server" Text="R" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkHeatingFilterChanged_NA" runat="server" Text="N/A" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Heating Filter Cleaned
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkHeatingFilterCleaned_C" runat="server" Text="C" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkHeatingFilterCleaned_R" runat="server" Text="R" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkHeatingFilterCleaned_NA" runat="server" Text="N/A" />
                                                    </td>
                                                </tr>
                                                <tr style="display: none;">
                                                    <td>Heating Filter Cleaned
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkHeatingFilterCleaned2_C" runat="server" Text="C" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkHeatingFilterCleaned2_R" runat="server" Text="R" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkHeatingFilterCleaned2_NA" runat="server" Text="N/A" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">Power Strip #&nbsp;&nbsp;&nbsp;
                                                        <asp:TextBox ID="txtComfortMeasuresInstalledCommentsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 72%; font-weight: normal; color: Black;"
                                                            MaxLength="128"></asp:TextBox><br />
                                                        CO Detector #&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtComfortMeasuresInstalledCommentsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 72%; margin-top: 5px; font-weight: normal; color: Black;"
                                                            MaxLength="128"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">Other:
                                                        <asp:TextBox ID="txtOtherComments" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 89%; font-weight: normal; color: Black;"
                                                            MaxLength="128"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                        <br />
                        <h3>LIGHTING ASSESSMENT (Replace incandescent bulbs used an average of 1 hours per day.)
                        </h3>
                        <table width="100%" border="1" cellspacing="0" cellpadding="2">
                            <tr>
                                <td width="20%" align="center">Location
                                </td>
                                <td width="4%"><%--Speciality--%> Supplier
                                </td>
                                <td align="center" width="4%">#LED Installed
                                </td>
                                <td width="6%" align="center">LED Wattage
                                </td>
                                <td width="15%" align="center">LED LightBulb Brand
                                </td>
                                <td align="center" width="56%">Comments
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>1. Living Room</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="chkLiving" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtLiving" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtLivingRoom_CFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtLivingRoom_CFLS" runat="server"
                                        FilterType="Numbers" TargetControlID="txtLivingRoom_CFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtLivingRoom_CFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtLivingRoom_LightBulbsBrand" runat="server" Style="border: none; text-align: center; width: 100px; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtLiving_Room_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>2. Family Room</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="chkFamilyroom" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtFamilyroom" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtFamilyRoomCFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtFamilyRoomCFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtFamilyRoomCFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtFamilyRoomCFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtFamilyRoomLightBulbBrand" runat="server" Style="border: none; text-align: center; width: 100px; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFamilyRoomComments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>3. Kitchen</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="ChkKitchen" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtKitchen" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtKitchenCFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtKitchenCFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtKitchenCFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtKitchenCFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtKitchenLightBulbBrand" runat="server" Style="border: none; width: 100px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtKitchen_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>4. Dining Room</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="chkDining" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtDining" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtDiningRoomCFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtDiningRoomCFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtDiningRoomCFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtDiningRoomCFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtDiningRoomLightBulbBrand" runat="server" Style="border: none; text-align: center; width: 100px; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDiningRoom_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>5. Bedroom 1</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="Chkbedroom" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtbedroom" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBedroom_1_CFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtBedroom_1_CFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtBedroom_1_CFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBedroom_1_CFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBedroom_1_LightBulbBrand" runat="server" Style="border: none; text-align: center; width: 100px; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBedroom_1_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>6. Bedroom 2</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="chkbedRoom2" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtbedRoom2" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBedroom_2_CFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtBedroom_2_CFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtBedroom_2_CFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBedroom_2_CFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBedroom_2_LightBulbBrand" runat="server" Style="border: none; text-align: center; width: 100px; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBedroom_2_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>7. Bedroom 3</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="chkbedroom3" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtbedroom3" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBedRoom_3_CFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtBedRoom_3_CFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtBedRoom_3_CFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBedRoom_3_CFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBedRoom_3_LightBulbBrand" runat="server" Style="border: none; text-align: center; width: 100px; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBedRoom_3_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>8. Bath 1</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="chkbath1" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtbath1" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBath_1_CFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtBath_1_CFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtBath_1_CFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBath_1_CFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBath_1_LightBulbBrand" runat="server" Style="border: none; width: 100px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBath_1_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>9. Bath 2</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="chkBath2" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtBath2" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBath_2_CFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtBath_2_CFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtBath_2_CFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBath_2_CFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtBath_2_LightBulbBrand" runat="server" Style="border: none; width: 100px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBath_2_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>10. Hallway</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="chkHallway" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtHallway" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtHallwayCFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtHallwayCFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtHallwayCFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtHallwayCFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtHallwayLightBulbBrand" runat="server" Style="border: none; width: 100px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtHallway_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>11. Outdoors</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="chkOutdoors" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtOutdoors" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtOutDoorCFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtOutDoorCFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtOutDoorCFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtOutDoorCFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtOutDoorLightBulbBrand" runat="server" Style="border: none; width: 100px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOutDoor_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>12. Other</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="chkother" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtother" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtOtherCFLS" runat="server" Style="border: none; width: 50px; font-weight: normal; text-align: center; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtOtherCFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtOtherCFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtOtherCFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtOtherLightBulbBrand" runat="server" Style="border: none; width: 100px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOther_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>13.Spare(Max2)</span>
                                </td>
                                <td align="center">
                                    <asp:CheckBox ID="chkspare" runat="server" Visible="false" />
                                    <asp:TextBox ID="txtspare" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtSpareMax2CFLS" runat="server" Style="border: none; width: 50px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="5" onkeyup="CalculateBaseLoad()"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="Fltr_txtSpareMax2CFLS" runat="server" FilterType="Numbers"
                                        TargetControlID="txtSpareMax2CFLS">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtSpareMax2CFLSWattage" runat="server" Style="border: none; width: 60px; text-align: center; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtSpareMax2LightBulbBrand" runat="server" Style="border: none; text-align: center; width: 100px; font-weight: normal; color: Black;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSapreMax2_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Total Bulbs
                                </td>
                                <td></td>
                                <td align="center">
                                    <asp:Label ID="txtTotalCFLS" runat="server" Style="text-align: center;"></asp:Label>
                                    <asp:HiddenField ID="hdntotal" runat="server" />
                                    <%--<asp:TextBox ID="txtTotalCFLS" runat="server" style="border:none; width:50px; font-weight:normal; color: Black;" MaxLength="5" Enabled="false"></asp:TextBox>--%>
                                </td>
                                <td></td>
                                <td></td>
                                <td>
                                    <asp:TextBox ID="txtTotalBulbs_Comments" runat="server" Style="border: none; width: 100%; font-weight: normal;"
                                        MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <strong>If no, select a reason</strong>
                        <asp:DropDownList ID="DDL_Reason" runat="server">
                            <asp:ListItem Text="Select Reason" Value="0"></asp:ListItem>
                            <asp:ListItem Text="CFLs installed by customer" Value="1"></asp:ListItem>
                            <asp:ListItem Text="CFLs installed by other weatherization program" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Customer refused" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <h2>Waterbed mattress Replacement (Sizes are inside frame dimensions)</h2>
                        <table width="100%" border="1" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkKing" runat="server" Text="King" />
                                    (70" X 82")
                                            <br />
                                    <asp:CheckBox ID="chkQueen" runat="server" Text="Queen" />
                                    (58" X 82")
                                            <br />
                                    <asp:CheckBox ID="chkSuperSingle" runat="server" Text="Super Single" />
                                    (46" X 82")
                                            <br />
                                    Describe insulated mattress pads requested on line below:
                                            <asp:TextBox ID="txtPads_RequestedReason" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 97%; font-weight: normal; color: Black;"
                                                MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <h2>List main Reasons for Electric Usage:</h2>
                        <table width="100%" border="1" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>1)&nbsp;
                                                <asp:TextBox ID="txtElectric_Usage_CommentsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 97%; margin-top: 5px; font-weight: normal; color: Black;"
                                                    MaxLength="128"></asp:TextBox>
                                    2)&nbsp;
                                                <asp:TextBox ID="txtElectric_Usage_CommentsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 97%; margin-top: 5px; font-weight: normal; color: Black;"
                                                    MaxLength="128"></asp:TextBox>
                                    3)&nbsp;
                                                <asp:TextBox ID="txtElectric_Usage_CommentsLine3" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 97%; margin-top: 5px; font-weight: normal; color: Black;"
                                                    MaxLength="128"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!--Page 5 End-->
                <br />
                <!--Page 6 Start-->
                <div style="page-break-after: always;">
                    <table cellpadding="0" cellspacing="10" width="940px" style="margin: 0 auto; border: 1px solid #1a1a1a;">
                        <tr>
                            <td colspan="2"><br />
                                <h1 style="font-size: 50px;">Water Heater</h1>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;" valign="top">
                                            <h4 style="margin: 0;">1</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <h4 style="margin: 0;">Is the water heater accessible<span style="color: red;">*</span></h4>
                                        </td>
                                        <td style="width: 20%;" valign="top">
                                            <input type="checkbox" id="ChkAccessibleYes" runat="server" />
                                            &nbsp;Yes</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ChkAccessibleNo" runat="server" />
                                            &nbsp;No (if no, stop here)</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">2</h4>
                                        </td>
                                        <td style="width: 75%;">
                                            <h4 style="margin: 0;">What type of water heating fuel is used?<span style="color: red;">*</span></h4>
                                        </td>
                                        <td style="width: 20%;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li>
                                                    <input type="checkbox" id="ChkElectricType" runat="server" />
                                                    &nbsp;Electric</li>
                                                <li>
                                                    <input type="checkbox" id="ChkNaturalGasType" runat="server" />
                                                    &nbsp;Natural Gas</li>
                                                <li>
                                                    <input type="checkbox" id="ChkPropaneType" runat="server" />
                                                    &nbsp;Propane</li>
                                                <li>
                                                    <input type="checkbox" id="ChkOilType" runat="server" />
                                                    &nbsp;Oil</li>
                                                <li>
                                                    <input type="checkbox" id="ChkSolarType" runat="server" />
                                                    &nbsp;Solar</li>
                                                <li>&nbsp;</li>
                                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: blue;">If electric is selected, continue to question 2a</span><span style="color: red;">*</span></li>
                                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: blue;">If anything other than electric is selected, stop here<br /></span></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;" valign="top">
                                            <h4 style="margin: 0;">2a</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <h4 style="margin: 0;">Is the water heater more than 6 years old?<span style="color: red;">*</span></h4>
                                        </td>
                                        <td style="width: 20%;" valign="top">
                                            <input type="checkbox" id="chkAgeOfWater7YearYes" runat="server" />
                                            &nbsp;Yes</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="chkAgeOfWater7YearNo" runat="server" />
                                            &nbsp;No</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;" valign="top">
                                            <h4 style="margin: 0;">2b</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <h4 style="margin: 0;">Is the water heater leaking or corroded?<span style="color: red;">*</span></h4>
                                        </td>
                                        <td style="width: 20%;" valign="top">
                                            <input type="checkbox" id="ConditionOfWaterHeaterLeakingOrCorroded" runat="server" />
                                            &nbsp;Yes</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ConditionOfWaterHeaterLeakingOrCorrodedNo" runat="server" />
                                            &nbsp;No</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;" valign="top">
                                            <h4 style="margin: 0;">2c</h4>
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <h4 style="margin: 0;">Does the water heater have a faulty thermostat or bad element?<span style="color: red;">*</span></h4>
                                        </td>
                                        <td style="width: 20%;" valign="top">
                                            <input type="checkbox" id="ConditionOfWaterHeaterBadThermostate" runat="server" />
                                            &nbsp;Yes</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ConditionOfWaterHeaterBadElementNo" runat="server" />
                                            &nbsp;No</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;" valign="top">&nbsp;</td>
                                        <td style="width: 70%;" valign="top"><span style="color: blue;">If you answered No to questions 2a, 2b and 2c, continue to ONLY answer question 3 (skip questions 4-5)</span></td>
                                        <td style="width: 20%;" valign="top">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">3</h4>
                                        </td>
                                        <td style="width: 70%;">
                                            <h4 style="margin: 0;">Does the home need any of the following?<span style="color: red;">*</span></h4>
                                        </td>
                                        <td style="width: 20%;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li><span style="color: gray;">(check all that apply)</li>
                                                <li>
                                                    <input type="checkbox" id="chkAerators_Yes" runat="server" />
                                                    &nbsp;Faucet aerator </li>
                                                <li>
                                                    <input type="checkbox" id="ChkFaucetRepair_Yes" runat="server" />
                                                    &nbsp;Faucet repair/replacement</li>
                                                <li>
                                                    <input type="checkbox" id="chkLowFlowShowerHeads_Yes" runat="server" />
                                                    &nbsp;Low flow showerhead</li>
                                                <li>
                                                    <input type="checkbox" id="chkWaterPipeInsulation_Yes" runat="server" />
                                                    &nbsp;Water pipe insulation</li>
                                                <li>
                                                    <input type="checkbox" id="chkWaterHeaterRepair_Yes" runat="server" />
                                                    &nbsp;Plumbing repair</li>
                                                <li>
                                                    <input type="checkbox" id="chkRepairWaterLeaks_Yes" runat="server" />
                                                    &nbsp;Test/replace element</li>
                                                <li>
                                                    <input type="checkbox" id="chkSolarWater_Yes" runat="server" />
                                                    &nbsp;Water heater jacket</li>
                                                <li>
                                                    <input type="checkbox" id="chkNone" runat="server" />
                                                    &nbsp;None of the above</li>
                                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: blue;">If any of the above are selected and job type is currently Baseload, the job type needs to be changed to Low Cost<br /></span></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">4</h4>
                                        </td>
                                        <td style="width: 70%;">
                                            <h4 style="margin: 0;">Which of the following applies?</h4>
                                        </td>
                                        <td style="width: 20%;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li><span style="color: gray;">(check all that apply)</li>
                                                <li>
                                                    <input type="checkbox" id="chkAtLeast2OccupantY" runat="server" />
                                                    &nbsp;Ambient air temperature of water heater is more than 44&deg; </li>
                                                <li>
                                                    <input type="checkbox" id="chk_IsBasement_yes" runat="server" />
                                                    &nbsp;There is adequate space for a heat pump water heater (HPWH)</li>
                                                <li>
                                                    <input type="checkbox" id="chk_CleanHPWHFilter_yes" runat="server" />
                                                    &nbsp;Area near water heater has condensate drain/contractor can add condensate pump </li>
                                                <li>
                                                    <input type="checkbox" id="chk_CondensateLineHPWHY" runat="server" />
                                                    &nbsp;The home has good plumbing/electrical systems</li>
                                                <li>
                                                    <input type="checkbox" id="chk_HPWH10by10by84Y" runat="server" />
                                                    &nbsp;The customer is able and willing to change HPWH filter and settings</li>
                                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: blue;">If none 1, 2, 3 or 4 of the options above are selected, continue to question 4a. If all 5 are selected, continue to question 4b.,<br /><br /></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--Page 6 End-->
                <!--Page 7 Start-->
                <br />
                <div style="page-break-after: always;">
                    <table cellpadding="0" cellspacing="10" width="940px" style="margin: 0 auto; border: 1px solid #1a1a1a;">
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;" valign="top">
                                            <br />
                                            <br />
                                            <h4 style="margin: 0;">4a</h4>
                                            <br />
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <br />
                                            <br />
                                            <h4 style="margin: 0;">Is standard water heater recommended?<span style="color: red;">*</span></h4>
                                            <br />
                                        </td>
                                        <td style="width: 20%;" valign="top">
                                            <br />
                                            <br />
                                            <input type="checkbox" id="chkRecommendWaterHeaterReplacement_Yes" runat="server" />
                                            &nbsp;Yes</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <br />
                                            <br />
                                            <input type="checkbox" id="chkRecommendWaterHeaterReplacement_No" runat="server" />
                                            &nbsp;No</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">&nbsp;</h4>
                                        </td>
                                        <td style="width: 70%;"><span style="color: blue;">If yes, does the water heater need the following?</span></td>
                                        <td style="width: 20%;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li><span style="color: gray;">(check all that apply)</li>
                                                <li>
                                                    <input type="checkbox" id="chkExpansionTank_Yes" runat="server" />
                                                    &nbsp;Expansion tank</li>
                                                <li>
                                                    <input type="checkbox" id="chkDoesHeaterHaveCheckValve_Yes" runat="server" />
                                                    &nbsp;Check valve (municipal water only)</li>
                                                <li>
                                                    <input type="checkbox" id="chkThirtyAmpBreaker_Yes" runat="server" />
                                                    &nbsp;30 amp breaker</li>
                                                <li>
                                                    <input type="checkbox" id="chkTenTwoWire_Yes" runat="server" />
                                                    &nbsp;10/2 wire</li>
                                                <li>
                                                    <input type="checkbox" id="chkOther_Yes" runat="server" />
                                                    &nbsp;Other&nbsp;<input type="text" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 70%;" /></li>
                                                <%--<li>&nbsp;</li>--%>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">&nbsp;</h4>
                                        </td>
                                        <td style="width: 70%;"><span style="color: blue;">If no, what is the reason for the standard water heater not recommended?</span></td>
                                        <td style="width: 20%;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li>&nbsp;</li>
                                                <li>
                                                    <input type="text" id="txtReasonNotRecommending" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 100%;" /></li>

                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;" valign="top">
                                            <br />
                                            <br />
                                            <h4 style="margin: 0;">4b</h4>
                                            <br />
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <br />
                                            <br />
                                            <h4 style="margin: 0;">Is a heat pump water heater recommended?<span style="color: red;">*</span></h4>
                                            <br />
                                        </td>
                                        <td style="width: 20%;" valign="top">
                                            <br />
                                            <br />
                                            <input type="checkbox" id="chk_RecommendHPWHY" runat="server" />
                                            &nbsp;Yes</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <br />
                                            <br />
                                            <input type="checkbox" id="chk_RecommendHPWHN" runat="server" />
                                            &nbsp;No</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">&nbsp;</h4>
                                        </td>
                                        <td style="width: 70%;"><span style="color: blue;">If yes, does the heat pump water heater need the following?</span></td>
                                        <td style="width: 20%;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li><span style="color: gray;">(check all that apply)</li>
                                                <li>
                                                    <input type="checkbox" id="chk_CondensatePump" runat="server" />
                                                    &nbsp;Condensate pump</li>
                                                <li>
                                                    <input type="checkbox" id="chk_10_2wire_yes" runat="server" />
                                                    &nbsp;Expansion tank</li>
                                                <li>
                                                    <input type="checkbox" id="chk_AmpBreaker_yes" runat="server" />
                                                    &nbsp;30 amp breaker</li>
                                                <li>
                                                    <input type="checkbox" id="chk_AmpBreaker_no" runat="server" />
                                                    &nbsp;10/2 wire</li>
                                                <li>
                                                    <input type="checkbox" id="chk_10_2wire_no" runat="server" />
                                                    &nbsp;Other&nbsp;<input type="text" id="txtHeatPumpWaterHeaterComment" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 70%;" />
                                                </li>

                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">&nbsp;</h4>
                                        </td>
                                        <td style="width: 70%;"><span style="color: blue;">If no, what is the reason for the heat pump water heater not recommended?</span></td>
                                        <td style="width: 20%;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li>&nbsp;</li>
                                                <li>
                                                    <input type="text" id="txtRecommendHPWH_reasonItem" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 100%;" /></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;" valign="top">
                                            <br />
                                            <br />
                                            <h4 style="margin: 0;">5</h4>
                                            <br />
                                        </td>
                                        <td style="width: 70%;" valign="top">
                                            <br />
                                            <br />
                                            <h4 style="margin: 0;">If heat pump water heater is not recommended, should the standard water heater be recommended?<span style="color: red;">*</span></h4>
                                            <br />
                                        </td>
                                        <td style="width: 20%;" valign="top">
                                            <br />
                                            <br />
                                            <input type="checkbox" id="chkRecommendWaterHeaterReplacement_Yes2" runat="server" />
                                            &nbsp;Yes</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <br />
                                            <br />
                                            <input type="checkbox" id="chkRecommendWaterHeaterReplacement_No2" runat="server" />
                                            &nbsp;No</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">&nbsp;</h4>
                                        </td>
                                        <td style="width: 70%;"><span style="color: blue;">If yes, does the water heater need the following?</span></td>
                                        <td style="width: 20%;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li><span style="color: gray;">(check all that apply)</li>
                                                <li>
                                                    <input type="checkbox" id="chkExpansionTank_Yes2" runat="server" />
                                                    &nbsp;Expansion tank</li>
                                                <li>
                                                    <input type="checkbox" id="chkDoesHeaterHaveCheckValve_Yes2" runat="server" />
                                                    &nbsp;Check valve (municipal water only)</li>
                                                <li>
                                                    <input type="checkbox" id="chkThirtyAmpBreaker_Yes2" runat="server" />
                                                    &nbsp;30 amp breaker</li>
                                                <li>
                                                    <input type="checkbox" id="chkTenTwoWire_Yes2" runat="server" />
                                                    &nbsp;10/2 wire</li>
                                                <li>
                                                    <input type="checkbox" />
                                                    &nbsp;Other&nbsp;<input type="text" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 70%;" />
                                                </li>

                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; border-right: 1px solid #1a1a1a;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td style="width: 10%;">
                                            <h4 style="margin: 0;">&nbsp;</h4>
                                        </td>
                                        <td style="width: 70%;"><span style="color: blue;">If no, what is the reason for the standard water heater not recommended?</span></td>
                                        <td style="width: 20%;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%;" valign="top">
                                <table cellpadding="0" cellspacing="10" width="100%">
                                    <tr>
                                        <td>
                                            <ul style="list-style: none; margin: 0; padding: 0;">
                                                <li>&nbsp;</li>
                                                <li>
                                                    <input type="text" id="txtReasonNotRecommending2" runat="server" style="border: none; border-bottom: solid 1px rgb(219, 219, 219); color: Black; font-weight: normal; width: 100%;" /></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br />
                                <br />
                                <h4 style="margin: 0;">Additional Comments</h4>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text" style="border: 0 none; border-bottom: 1px solid #1a1a1a; width: 100%;" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text" style="border: 0 none; border-bottom: 1px solid #1a1a1a; width: 100%;" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                    </table>
                </div>
                <!--Page 7 End-->
                <!--Page 8 Start-->
                <br />
                <div style="border: 1px solid #000000; width: 940px; margin: 0 auto; page-break-after: always; position: relative;">
                    <div style="font-weight: normal;">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <h2>
                                        <u>EXISTING REFRIGERATOR TESTING DATA</u></h2>
                                </td>
                            </tr>
                            <tr>
                                <td>Refrigerator Tested :
                                            <asp:CheckBox ID="chk_RefrigeratorTest_Yes" runat="server" Visible="false" />
                                    <%--Yes --%>
                                    <asp:CheckBox ID="chk_RefrigeratorTest_No" runat="server" Visible="false" />
                                    <%--  No  If No, reason:--%>
                                    <asp:DropDownList ID="DDL_REFRIGERATOR_reason" runat="server">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Yes-Monitored" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Yes-Database" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="No-Refrigerator less than 5 years old" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="No-Landlord refused" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No-Customer refused" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="No-Refrigerator assessed through other weatherization program" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="No-WRAP work deferred" Value="7"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="txt_RefrigeratorTest_Reason" runat="server" Visible="false" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>

                                </td>
                            </tr>
                        </table>
                        <p>
                            <b>KWH Guidelines for Replacement: In order to meet the daily minumum guidelines
                                    for replacement, the KWH's must reach the KW/Hour Minimum listed below byt he end
                                    of one hour of monitoring. If at any time during the first hour of monitoring the
                                    Brultech reaches the KW/Hour Minimum, the tester will know that the refrigerator
                                    is likely to qualify for replacement.</b>
                        </p>
                        <table width="100%" border="0" cellspacing="0" cellpadding="5" style="border-collapse: collapse; margin-bottom: 20px; border: 1px solid #ADADAD;">
                            <tr>
                                <th style="border: 1px solid #ADADAD; color: #000; text-align: center;">Size
                                </th>
                                <th style="border: 1px solid #ADADAD; color: #000; text-align: center;">Daily Minimum
                                </th>
                                <th style="border: 1px solid #ADADAD; color: #000; text-align: left; width: 10px;">&nbsp;
                                </th>
                                <th style="border: 1px solid #ADADAD; color: #000; text-align: center;">KW/Hour Minimum
                                </th>
                                <th style="border: 1px solid #ADADAD; color: #000; text-align: center;">Replacement Guideline
                                </th>
                            </tr>
                            <tr>
                                <td>15 cu. ft. or less
                                </td>
                                <td>2.78 K W H / day
                                </td>
                                <td>=
                                </td>
                                <td>.116 K W H
                                </td>
                                <td>14 cu. ft.
                                </td>
                            </tr>
                            <tr>
                                <td>16 - 19 cu. ft.
                                </td>
                                <td>3.48 K W H / day
                                </td>
                                <td>=
                                </td>
                                <td>.145 K W H
                                </td>
                                <td>18 cu. ft.
                                </td>
                            </tr>
                            <tr>
                                <td>20 - 24 cu. ft.
                                </td>
                                <td>3.65 K W H / day
                                </td>
                                <td>=
                                </td>
                                <td>152 K W H
                                </td>
                                <td>20 cu. ft.
                                </td>
                            </tr>
                            <tr>
                                <td>25 cu. ft. side-by-side
                                </td>
                                <td>3.65 K W H / day
                                </td>
                                <td>=
                                </td>
                                <td>221 K W H
                                </td>
                                <td>20-25 cu. ft.
                                </td>
                            </tr>
                            <tr>
                                <td>or larger
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                        <p style="font-size: 18px;">
                            <u><b>To get KW / Hour test result:</b></u>
                        </p>
                        <p>
                           <b> Divide total KWH's recorded by the monitor, by the number of minutes that the monitor
                                    has been on. Your answer will be the number of KWH's consumed per minute. Multiply
                                    this by 60 minutes to get the KWH's used for one hour.</b>
                        </p>
                        <!-- inv_table end -->
                        <p>
                            <b>This is shown by the formula below:</b>
                        </p>

                        <table width="100%" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="left" valign="middle" style="border-bottom: 1px solid #666">Total KWH's recorded by monitor
                                </td>
                                <td rowspan="2" align="left" valign="middle">= KWH's per minute x 60 minutes = KWH's per one
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="middle">Number of minutes monitored
                                </td>
                            </tr>
                        </table>
                        <br />
                        <p style="font-size: 18px;">
                            <u><b>Or, use the factors below To get KW / Hour test result:</b></u>
                        </p>
                        <table width="100%" border="0" cellspacing="0" cellpadding="5" style="border-collapse: collapse; margin-bottom: 20px; border: 1px solid #ADADAD;">
                            <tr>
                                <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">If monitoring time is:
                                </th>
                                <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">Multiply KWH's from monitor by:
                                </th>
                                <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">If monitoring time is:
                                </th>
                                <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">Multiply KWH's from monitor by:
                                </th>
                                <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">If monitoring time is:
                                </th>
                                <th style="border: 1px solid #ADADAD; color: #000; text-align: left;">Multiply KWH's from monitor by:
                                </th>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #ADADAD;">65 minutes
                                </td>
                                <td style="border: 1px solid #ADADAD;">.9231
                                </td>
                                <td style="border: 1px solid #ADADAD;">95 minutes
                                </td>
                                <td style="border: 1px solid #ADADAD;">.6316
                                </td>
                                <td style="border: 1px solid #ADADAD;">125 minutes
                                </td>
                                <td style="border: 1px solid #ADADAD;">.48
                                </td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #ADADAD;">75 minutes
                                </td>
                                <td style="border: 1px solid #ADADAD;">.80
                                </td>
                                <td style="border: 1px solid #ADADAD;">105 minutes
                                </td>
                                <td style="border: 1px solid #ADADAD;">.5714
                                </td>
                                <td style="border: 1px solid #ADADAD;">135 minutes
                                </td>
                                <td style="border: 1px solid #ADADAD;">.4444
                                </td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #ADADAD;">90 minutes
                                </td>
                                <td style="border: 1px solid #ADADAD;">.6667
                                </td>
                                <td style="border: 1px solid #ADADAD;">120 minutes
                                </td>
                                <td style="border: 1px solid #ADADAD;">.50
                                </td>
                                <td style="border: 1px solid #ADADAD;">150 minutes
                                </td>
                                <td style="border: 1px solid #ADADAD;">.40
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>Primary Refrigerator: &nbsp; Height
                                            <asp:TextBox ID="txt_PrimaryRefrigerator_Height" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"
                                                Width="20%"></asp:TextBox>
                                    &nbsp; Width
                                            <asp:TextBox ID="txt_PrimaryRefrigerator_Width" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"
                                                Width="20%"></asp:TextBox>
                                    &nbsp; Depth
                                            <asp:TextBox ID="txt_PrimaryRefrigerator_Depth" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"
                                                Width="20%"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <p>
                        </p>
                        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-bottom: 20px; border-collapse: collapse; margin-bottom: 20px; border: 1px solid #ADADAD;">
                            <tr>
                                <td style="border: 1px solid #ADADAD;">Start Time: &nbsp;
                                            <asp:TextBox ID="txt_StartTime" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">End Time: &nbsp;
                                            <asp:TextBox ID="txt_EndTime" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">Total Time Monitored: &nbsp;
                                            <asp:TextBox ID="txt_TotalMonitored" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #ADADAD;">Refrigerator Temp: &nbsp;
                                            <asp:TextBox ID="txt_RefrigeratorTemp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">Freezer Temp: &nbsp;
                                            <asp:TextBox ID="txt_FreezerTemp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">Ambient Room Temp: &nbsp;
                                            <asp:TextBox ID="txt_RoomTemp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-bottom: 20px; position: relative; border-collapse: collapse; margin-bottom: 20px; border: 1px solid #ADADAD; top: -21px">
                            <tr>
                                <td colspan="2" style="border: 1px solid #ADADAD;">Peak Wattage While Running: &nbsp;
                                            <asp:TextBox ID="txt_PeakWattageRunning" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td colspan="2" style="border: 1px solid #ADADAD;">Total KWH Monitored: &nbsp;
                                            <asp:TextBox ID="txt_TotalKWH" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #ADADAD;">KWH/1 Hour: &nbsp;
                                            <asp:TextBox ID="txt_KWH_1_Hour" runat="server" Style="border: none; width: 115px; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">KWH/24 Hours: &nbsp;
                                            <asp:TextBox ID="txt_KWH_24_Hour" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">KWH/Month: &nbsp;
                                            <asp:TextBox ID="txt_KWH_Month" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">$/Month: &nbsp;
                                            <asp:TextBox ID="txt_Month" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="4">&nbsp; &nbsp; Is this refrigerator eligible for replacement?
                                            <asp:CheckBox ID="chk_RefrigeratorReplace__Yes" runat="server" />
                                    Yes &nbsp; &nbsp;
                                            <asp:CheckBox ID="chk_RefrigeratorReplace__No" runat="server" />
                                    No &nbsp; &nbsp;
                                </td>
                            </tr>
                        </table>
                        <%--  <p>
                                </p>
                                <br />--%><table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left" colspan="4"><b>Secondary refrigerator assessment</b>
                                            &nbsp; &nbsp;
                        <asp:DropDownList ID="DDL_RefrigeratorAssessment" runat="server">
                            <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Yes-Monitored"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Yes-Database"></asp:ListItem>
                            <asp:ListItem Value="3" Text="No-Refrigerator les thst 5 years old"></asp:ListItem>
                            <asp:ListItem Value="4" Text="No-Landlord refused"></asp:ListItem>
                            <asp:ListItem Value="5" Text="No-Customer refused"></asp:ListItem>
                            <asp:ListItem Value="6" Text="No-Refrigerator assessed through other weatherization program"></asp:ListItem>
                            <asp:ListItem Value="7" Text="No-WRAP Work deferred"></asp:ListItem>
                            <asp:ListItem Value="8" Text="N/A"></asp:ListItem>
                        </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="4">
                                            <asp:CheckBox ID="chk_SecondRefrigerator" runat="server" />
                                            Second Refrigerator
                                            <asp:CheckBox ID="chk_SecondFreezer" runat="server" />
                                            &nbsp; &nbsp;Second Freezer &nbsp; &nbsp; Height &nbsp;
                                            <asp:TextBox ID="txt_SecondRefrigerator_Height" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                            &nbsp; &nbsp; Width &nbsp;
                                            <asp:TextBox ID="txt_SecondRefrigerator_Width" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                            &nbsp; &nbsp; Depth &nbsp;
                                            <asp:TextBox ID="txt_SecondRefrigerator_Depth" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 120px; font-weight: normal;"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                        <p>
                        </p>
                        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-bottom: 20px; border-collapse: collapse; margin-bottom: 20px; border: 1px solid #ADADAD;">
                            <tr>
                                <td style="border: 1px solid #ADADAD;">Start Time: &nbsp;
                                            <asp:TextBox ID="txt_SecondRefrigerator_StartTime" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">End Time: &nbsp;
                                            <asp:TextBox ID="txt_SecondRefrigerator_EndTime" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">Total Time Monitored: &nbsp;
                                            <asp:TextBox ID="txt_SecondRefrigerator_TotalMoniter" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #ADADAD;">Refrigerator Temp: &nbsp;
                                            <asp:TextBox ID="txt_SecondRefrigerator_Temp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">Freezer Temp: &nbsp;
                                            <asp:TextBox ID="txt_SecondFreezer_Temp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">Ambient Room Temp: &nbsp;
                                            <asp:TextBox ID="txt_SecondRoom_Temp" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-bottom: 20px; position: relative; border-collapse: collapse; margin-bottom: 20px; border: 1px solid #ADADAD; top: -21px">
                            <tr>
                                <td colspan="2">Peak Wattage While Running: &nbsp;
                                            <asp:TextBox ID="txt_Second_PeakWattageRunning" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td colspan="2">Total KWH Monitored: &nbsp;
                                            <asp:TextBox ID="txt_Second_KWH_Moniter" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #ADADAD;">KWH/1 Hour: &nbsp;
                                            <asp:TextBox ID="txt_Second_KWH_1_Hour" runat="server" Style="border: none; width: 115px; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">KWH/24 Hours: &nbsp;
                                            <asp:TextBox ID="txt_Second_KWH_24_Hour" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">KWH/Month: &nbsp;
                                            <asp:TextBox ID="txt_Second_KWH_Month" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                                <td style="border: 1px solid #ADADAD;">$/Month: &nbsp;
                                            <asp:TextBox ID="txt_Second_Month" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="4">&nbsp; &nbsp; Is this refrigerator eligible for replacement?
                                            <asp:CheckBox ID="chk_Second_RefrigeratorReplace__Yes" runat="server" />
                                    Yes &nbsp; &nbsp;
                                            <asp:CheckBox ID="chk_Second_RefrigeratorReplace__No" runat="server" />
                                    No &nbsp; &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!--Page 8 End-->
                <!--Page 9 Start-->
                <br />
                <div style="border: 1px solid #000000; width: 940px; margin: 0 auto; page-break-after: always; position: relative;">
                    <div>
                        <h2>
                            <u>Full Cost Section</u></h2>
                        <div style="text-align: center;">
                            <h4>Full Cost Measures: Assessment Summary Form</h4>
                        </div>
                    </div>
                    <table width="100%" border="1" cellpadding="8" style="border: 0 !important; border-spacing: 0;"
                        cellspacing="7">
                        <tr>
                            <td width="19%">
                                <h4>Testing</h4>
                            </td>
                            <td width="6%">
                                <h4>Yes</h4>
                            </td>
                            <td width="6%">
                                <h4>No</h4>
                            </td>
                            <td width="69%">
                                <h4>Explanation</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>Health & Safety/Combustion Testing
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkHealthAndSafetyCombustionCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkHealthAndSafetyCombustionCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtHealthAndSafetyCombustionComments" runat="server" Columns="54"
                                    Style="border: none; width: 98%; font-family: Arial, Helvetica, sans-serif; overflow: hidden;"
                                    TextMode="MultiLine" MaxLength="256"></asp:TextBox>
                                <%--<textarea cols="54" style="border: none; width: 98%; font-family: Arial, Helvetica, sans-serif;">All electric heat. No combustion appliances in the home.</textarea>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>Blower Door Depressurization
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkBlowerDoor_DepressurizationCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkBlowerDoor_DepressurizationCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtBlowerDoor_Depressurization_Comments" runat="server" Columns="54"
                                    Style="border: none; width: 98%; font-family: Arial, Helvetica, sans-serif; overflow: hidden;"
                                    TextMode="MultiLine" MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Blower Door Pressurization (Contaminates)
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkBlowerDoor_Pressurization_Checkbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkBlowerDoor_Pressurization_Checkbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtBlowerDoor_Pressurization_Comments" runat="server" Columns="54"
                                    Style="border: none; width: 98%; font-family: Arial, Helvetica, sans-serif; overflow: hidden;"
                                    TextMode="MultiLine" MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Zonal Pressure Diagnostics
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkZonalPressure_DiagnosticsCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkZonalPressure_DiagnosticsCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtZonalPressure_DiagnosticsComments" runat="server" Columns="54"
                                    Style="border: none; width: 98%; font-family: Arial, Helvetica, sans-serif; overflow: hidden;"
                                    TextMode="MultiLine" MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Ductwork Test
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkDuctworkTestCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkDuctworkTestCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtDuctworkTestComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Final Combustion Test
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkFinalCombustionTestCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkFinalCombustionTestCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtFinalCombustionTestComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>Measures (Listed by Priority)</h4>
                            </td>
                            <td>
                                <h4>Yes</h4>
                            </td>
                            <td>
                                <h4>No</h4>
                            </td>
                            <td>
                                <h4>Explanation</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>Health & Safety
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkHealthAndSafetyCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkHealthAndSafetyCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtHealthAndSafetyComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Major Repairs (e.g. broken glass)
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkMajorRepairsCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkMajorRepairsCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtMajorRepairsComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Electric Heat Repairs
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkElectricHeatRepairsCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkElectricHeatRepairsCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtElectricHeatRepairsComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Attic Insulation
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkAtticInsulationCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkAtticInsulationCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtAtticInsulationComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Seal Attic Bypasses & Chaseways
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkSealAtticBypassesCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkSealAtticBypassesCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtSealAtticBypassesComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Wall Insulation
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkWallInsulationCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkWallInsulationCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtWallInsulationComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Floor Insulation
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkFloorInsulationCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkFloorInsulationCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtFloorInsulationComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Windows & Door Measures
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkWindowAndDoorMeasuresCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkWindowAndDoorMeasuresCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtWindowAndDoorMeasuresComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Heating Measures
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkHeatingMeasuresCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkHeatingMeasuresCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtHeatingMeasuresComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Cooling Measures
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkCoolingMeasuresCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkCoolingMeasuresCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtCoolingMeasuresComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Other
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkOtherMeasuresCheckbox_Yes" runat="server" />
                            </td>
                            <td align="center">
                                <asp:CheckBox ID="chkOtherMeasuresCheckbox_No" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtOtherMeasuresComments" runat="server" Columns="54" Style="border: none; overflow: hidden; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                                    TextMode="MultiLine"
                                    MaxLength="256"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--Page 9 End-->
                <!--Page 10 Start-->
                <br />
                <div style="border: 1px solid #000000; width: 940px; margin: 0 auto; page-break-after: always;">
                    <h2>Blower Door Testing Information Form</h2>
                    <br />
                    <table width="100%" cellspacing="0" cellpadding="3" border="1">
                        <tr>
                            <td>Target MVG:
                                        <asp:TextBox ID="txtTargetMVG" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 30%;"
                                            MaxLength="50"></asp:TextBox>
                            </td>
                            <td>CFM 50
                            </td>
                            <td>Temperature
                            </td>
                        </tr>
                        <tr>
                            <td>Pre-weatherization reading:
                                        <asp:TextBox ID="txtPreweatherizationreadingBDO" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 30%;"
                                            MaxLength="50"></asp:TextBox>
                            </td>
                            <td>CFM 50, basement door open
                            </td>
                            <td>Indoor
                                        <asp:TextBox ID="txtIndoorTemperature" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 30%;"
                                            MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Pre-weatherization reading:
                                        <asp:TextBox ID="txtPreweatherizationreadingBDClosed" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 30%;"
                                            MaxLength="50"></asp:TextBox>
                            </td>
                            <td>CFM 50, basement door open
                            </td>
                            <td>Outdoor<asp:TextBox ID="txtOutdoorTemperature" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 30%;"
                                MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Post-weatherization reading:
                                        <asp:TextBox ID="txtPostweatherizationreading" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 30%;"
                                            MaxLength="50"></asp:TextBox>
                            </td>
                            <td colspan="2">CFM 50 basement
                                        <asp:CheckBox ID="chkPostweatherizationreadingOpenOrClosedCheckbox_Open" runat="server" />
                                Open &nbsp; &nbsp;
                                        <asp:CheckBox ID="chkPostweatherizationreadingOpenOrClosedCheckbox_Close" runat="server" />
                                Close
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">Total Reduction:
                                        <asp:TextBox ID="txtTotalReduction" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 30%;"
                                            MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <h4>*5 Point Test Optional Method</h4>
                    <p>
                        <span><b>Notes: </b></span><b>Consider areas that are heated and used daily as intentionally
                                heated and should be inside the thermal (insulation) and pressure (air sealed) area.
                                The thermal and pressure boundaries must be at the same place. When testing, use
                                house to outside (H/OO pressures near 50 Pa if possible. Use same gauge for all
                                tests. The ceiling leakage Ratio is the (House/Zone divided by the House/Outside)
                                times 100%. 90% or better passes. If the ratio is less than 90% (.9), the home must
                                receive air sealing treatment for both bypasses and convective loops. A zone is
                                any area that might be connected to the house and you want to determine if there
                                are leaks to the outside or leaks to the house. Ducts that are considered zones
                                should be tested using the Duct Testing, Repair and Sealing Sheet. If the ceilings
                                and rood deck are on a common rafter, such as flat roofs or cathedral ceilings,
                                there is no attic and therefore no attic pressure tests need to be taken. "Outside"
                                means out of the entire structure.</b>
                    </p>
                    <br />
                    <table width="100%" border="1" cellspacing="0" cellpadding="7">
                        <tr>
                            <td colspan="7" align="center">
                                <h3>PRESSURES</h3>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">&nbsp;
                            </td>
                            <td colspan="2" align="center">What was blower door test set at? House/Outside
                            </td>
                            <td align="center">House/Zone
                            </td>
                            <td>&nbsp;
                            </td>
                            <td align="center">Zone/Outside
                            </td>
                            <td>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>ZONES</span>
                            </td>
                            <td align="center">
                                <span>Pre-Treat</span>
                            </td>
                            <td align="center">
                                <span>Final</span>
                            </td>
                            <td align="center">
                                <span>Pre-Treat</span>
                            </td>
                            <td align="center">
                                <span>Final</span>
                            </td>
                            <td align="center">
                                <span>Pre-Treat</span>
                            </td>
                            <td align="center">
                                <span>Final</span>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <span>Example: Attic</span>
                            </td>
                            <td align="center">-50
                            </td>
                            <td align="center">-50
                            </td>
                            <td align="center">-40
                            </td>
                            <td align="center">-50
                            </td>
                            <td align="center" width="100px;">-10 (attic is connected to the house and needs to be separated by air sealing the
                                        attic floor)
                            </td>
                            <td align="center">0
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Basement</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtBasement_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                    TargetControlID="txtBasement_BlowerDoorPretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtBasement_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server"
                                    TargetControlID="txtBasement_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBasementHouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                                    TargetControlID="txtBasementHouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBasementHouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                                    TargetControlID="txtBasementHouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBasementZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server"
                                    TargetControlID="txtBasementZoneOutsidePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBasementZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server"
                                    TargetControlID="txtBasementZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Vented Crawlspace</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtVentedCrawlSpace_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server"
                                    TargetControlID="txtVentedCrawlSpace_BlowerDoorPretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtVentedCrawlSpace_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server"
                                    TargetControlID="txtVentedCrawlSpace_BlowerDoorFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtVentedCrawlSpaceHouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server"
                                    TargetControlID="txtVentedCrawlSpaceHouseZonePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtVentedCrawlSpaceHouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server"
                                    TargetControlID="txtVentedCrawlSpaceHouseZoneFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtVentedCrawlSpaceZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server"
                                    TargetControlID="txtVentedCrawlSpaceZoneOutsidePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtVentedCrawlSpaceZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" runat="server"
                                    TargetControlID="txtVentedCrawlSpaceZoneOutsideFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Attic A</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtAttic_A_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" runat="server"
                                    TargetControlID="txtAttic_A_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtAttic_A_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender20" runat="server"
                                    TargetControlID="txtAttic_A_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAttic_A_HouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender21" runat="server"
                                    TargetControlID="txtAttic_A_HouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAttic_A_HouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" runat="server"
                                    TargetControlID="txtAttic_A_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAttic_A_ZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender23" runat="server"
                                    TargetControlID="txtAttic_A_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAttic_A_ZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender24" runat="server"
                                    TargetControlID="txtAttic_A_ZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Attic B</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtAttic_B_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender25" runat="server"
                                    TargetControlID="txtAttic_B_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtAttic_B_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender26" runat="server"
                                    TargetControlID="txtAttic_B_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAttic_B_HouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender27" runat="server"
                                    TargetControlID="txtAttic_B_HouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAttic_B_HouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender28" runat="server"
                                    TargetControlID="txtAttic_B_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAttic_B_ZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender29" runat="server"
                                    TargetControlID="txtAttic_B_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAttic_B_ZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender30" runat="server"
                                    TargetControlID="txtAttic_B_ZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Kneewall A</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtKneewall_A_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender31" runat="server"
                                    TargetControlID="txtKneewall_A_BlowerDoorPretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtKneewall_A_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender32" runat="server"
                                    TargetControlID="txtKneewall_A_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtKneewall_A_HouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender33" runat="server"
                                    TargetControlID="txtKneewall_A_HouseZonePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtKneewall_A_HouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender34" runat="server"
                                    TargetControlID="txtKneewall_A_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtKneewall_A_ZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender35" runat="server"
                                    TargetControlID="txtKneewall_A_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtKneewall_A_ZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender36" runat="server"
                                    TargetControlID="txtKneewall_A_ZoneOutsideFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Kneewall B</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtKneewall_B_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender37" runat="server"
                                    TargetControlID="txtKneewall_B_BlowerDoorPretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtKneewall_B_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender38" runat="server"
                                    TargetControlID="txtKneewall_B_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtKneewall_B_HouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender39" runat="server"
                                    TargetControlID="txtKneewall_B_HouseZonePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtKneewall_B_HouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender40" runat="server"
                                    TargetControlID="txtKneewall_B_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtKneewall_B_ZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender41" runat="server"
                                    TargetControlID="txtKneewall_B_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtKneewall_B_ZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server"
                                    TargetControlID="txtKneewall_B_ZoneOutsideFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Garage</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtGarage_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender43" runat="server"
                                    TargetControlID="txtGarage_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtGarage_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender44" runat="server"
                                    TargetControlID="txtGarage_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGarageHouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender45" runat="server"
                                    TargetControlID="txtGarageHouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGarageHouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender46" runat="server"
                                    TargetControlID="txtGarageHouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGarageZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender47" runat="server"
                                    TargetControlID="txtGarageZoneOutsidePretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGarageZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender48" runat="server"
                                    TargetControlID="txtGarageZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Garage Attic</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtGarage_Attic_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender49" runat="server"
                                    TargetControlID="txtGarage_Attic_BlowerDoorPretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtGarage_AtticBlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender50" runat="server"
                                    TargetControlID="txtGarage_AtticBlowerDoorFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGarage_AtticHouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender51" runat="server"
                                    TargetControlID="txtGarage_AtticHouseZonePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGarage_AtticHouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender52" runat="server"
                                    TargetControlID="txtGarage_AtticHouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGarage_AtticZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender53" runat="server"
                                    TargetControlID="txtGarage_AtticZoneOutsidePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGarage_AtticZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender54" runat="server"
                                    TargetControlID="txtGarage_AtticZoneOutsideFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Cantilever Overhang</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtCantilever_Overhang_1_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender55" runat="server"
                                    TargetControlID="txtCantilever_Overhang_1_BlowerDoorPretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtCantilever_Overhang_1_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender56" runat="server"
                                    TargetControlID="txtCantilever_Overhang_1_BlowerDoorFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCantilever_Overhang_1_HouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender57" runat="server"
                                    TargetControlID="txtCantilever_Overhang_1_HouseZonePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCantilever_Overhang_1_HouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender52P8" runat="server"
                                    TargetControlID="txtCantilever_Overhang_1_HouseZoneFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCantilever_Overhang_1_ZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender53P8" runat="server"
                                    TargetControlID="txtCantilever_Overhang_1_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCantilever_Overhang_1_ZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender54P8" runat="server"
                                    TargetControlID="txtCantilever_Overhang_1_ZoneOutsideFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Cantilever Overhang</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtCantilever_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender55P8" runat="server"
                                    TargetControlID="txtCantilever_BlowerDoorPretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtCantilever_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender56P8" runat="server"
                                    TargetControlID="txtCantilever_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCantilever_Overhang_2_HouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender57P8" runat="server"
                                    TargetControlID="txtCantilever_Overhang_2_HouseZonePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCantilever_Overhang_2_HouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender58" runat="server"
                                    TargetControlID="txtCantilever_Overhang_2_HouseZoneFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCantilever_Overhang_2_ZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender59" runat="server"
                                    TargetControlID="txtCantilever_Overhang_2_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCantilever_Overhang_2_ZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender60" runat="server"
                                    TargetControlID="txtCantilever_Overhang_2_ZoneOutsideFinal" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Other</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtOther1_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender61" runat="server"
                                    TargetControlID="txtOther1_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtOther1_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender62" runat="server"
                                    TargetControlID="txtOther1_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther1HouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender63" runat="server"
                                    TargetControlID="txtOther1HouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther1HouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender64" runat="server"
                                    TargetControlID="txtOther1HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther1ZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender65" runat="server"
                                    TargetControlID="txtOther1ZoneOutsidePretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther1ZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender66" runat="server"
                                    TargetControlID="txtOther1ZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Other</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtOther_2_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender67" runat="server"
                                    TargetControlID="txtOther_2_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtOther_2_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender68" runat="server"
                                    TargetControlID="txtOther_2_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther_2_HouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender69" runat="server"
                                    TargetControlID="txtOther_2_HouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther_2_HouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender70" runat="server"
                                    TargetControlID="txtOther_2_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther_2_ZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender71" runat="server"
                                    TargetControlID="txtOther_2_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther_2_ZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender72" runat="server"
                                    TargetControlID="txtOther_2_ZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Other</span>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtOther_3_BlowerDoorPretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender73" runat="server"
                                    TargetControlID="txtOther_3_BlowerDoorPretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtOther_3_BlowerDoorFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender74" runat="server"
                                    TargetControlID="txtOther_3_BlowerDoorFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther_3_HouseZonePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender75" runat="server"
                                    TargetControlID="txtOther_3_HouseZonePretreat" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther_3_HouseZoneFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender76" runat="server"
                                    TargetControlID="txtOther_3_HouseZoneFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther_3_ZoneOutsidePretreat" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender77" runat="server"
                                    TargetControlID="txtOther_3_ZoneOutsidePretreat" FilterType="Custom,Numbers"
                                    ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOther_3_ZoneOutsideFinal" runat="server" Style="border-bottom: white; text-align: center; border-left: white; font-family: arial; font-size: 14px; vertical-align: top; border-top: white; border-right: white;"
                                    size="7" MaxLength="7"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender78" runat="server"
                                    TargetControlID="txtOther_3_ZoneOutsideFinal" FilterType="Custom,Numbers" ValidChars="-">
                                </ajaxToolkit:FilteredTextBoxExtender>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--Page 10 End-->
                <div style="border: 1px solid #000000; width: 940px; margin: 0 auto; page-break-after: always;">
                    <!-- Page 8 END -->
                    <!-- Page 9 Start -->
                    <b style="font-size: 20px; font-weight: bolder;">Combustion Appliances Pre-Test
                    </b>
                    <table width="100%" border="1" cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="2">
                                <b style="font-size: 13px; font-weight: bolder;">Are there any combustion appliances
                                            in the home?
                                            <asp:CheckBox ID="CombustionAppliancesHomeY" runat="server" Text=" Y" />
                                    <asp:CheckBox ID="CombustionAppliancesHomeN" runat="server" Text=" N" />
                                </b>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">If yes, Combustible Equipment Safety Testing must have been done by the contractor
                                        if any air sealing was done. Are there any <span>UNVENTED</span>combustion heating
                                        applicances?
                                        <asp:CheckBox ID="CombustibleEquipmentSafetyTestingY" runat="server" Text=" Y" />
                                <asp:CheckBox ID="CombustibleEquipmentSafetyTestingN" runat="server" Text=" N" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <strong>If yes, no air sealing may be performed that tightens structure below 3000 CFM-50Pa,
                                            & Wx release form signed.</strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Step 1:</span>Record the outside temperature and zero the analyzer.
                            </td>
                            <td>
                                <span>Step 7:</span>Turn on the water heater first.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Step 2:</span>Record house ambient CO & CO in CAZ-nothing is on.
                            </td>
                            <td>
                                <span>Step 8:</span>Check for spillage.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Step 3:</span>Look for signs of roll out of back drafting-nothing is on.
                            </td>
                            <td>
                                <span>Step 9:</span>Measure undiluted Co.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Step 4:</span>Perform a gas leak test.
                            </td>
                            <td>
                                <span>Step 10:</span>Record if the draft was established at one minute.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Step 5:</span>Drill hole for the draft measurement.
                            </td>
                            <td>
                                <span>Step 11:</span>Repeat spillage, CO & draft test for boiler or furnace.
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <span>Step 6:</span>Start the worst case depressurization test procedure - appliances
                                        off; measure base pressure; pressure in the CAZ under worst case condition; <strong>THEN</strong>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">Outdoor Temperature
                                        <asp:TextBox ID="txt_OutdoorTemperature" runat="server" Style="border: none; font-weight: normal; color: Black; width: 10%; border-bottom: 1px #ccc solid;"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" cellspacing="0" cellpadding="0" border="1px">
                        <tbody>
                            <tr style="border: 1px solid #ADADAD;">
                                <td align="center" valign="bottom" style="border: 1px solid #ADADAD;">
                                    <b>Appliances</b><%--<br />--%>
                                    <%-- <br />--%>
                                </td>
                                <td colspan="2" align="center" style="font-size: 9; border: 1px solid #ADADAD;">
                                    <b>CO</b>
                                    <%-- <br />
                                            <br />--%>
                                </td>
                                <td colspan="2" align="center" style="font-size: 9; border: 1px solid #ADADAD;">
                                    <b>Backdraft
                                                <%-- <br />--%>
                                                Y/N</b>
                                </td>
                                <td colspan="2" align="center" style="font-size: 9; border: 1px solid #ADADAD;">
                                    <b>Draft (1 min.)
                                                <%-- <br />--%>
                                                Established Y/N</b>
                                </td>
                                <td colspan="2" align="center" style="font-size: 9; border: 1px solid #ADADAD;">
                                    <b>Draft Pressure<%--<br />--%>
                                                Pa. </b>
                                </td>
                                <td colspan="2" align="center" style="font-size: 9; border: 1px solid #ADADAD;">
                                    <b>Draft Pass
                                                <%--<br />--%>
                                                Y/N</b>
                                </td>
                                <td align="center" style="font-size: 9; border: 1px solid #ADADAD;">
                                    <b>Undil.<%--<br />--%>
                                                CO Flue </b>
                                </td>
                                <td align="center" style="font-size: 9; border: 1px solid #ADADAD;">
                                    <b>Gas Leak Det.
                                                <%--<br />--%>
                                                Y/N/NA</b>
                                </td>
                                <td align="center" style="font-size: 9; border: 1px solid #ADADAD;">
                                    <b>Percent<%--<br />--%>
                                                Eff.</b>
                                </td>
                            </tr>
                            <tr style="border: 1px solid #ADADAD;">
                                <td>
                                    <span></span>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">AMB
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">CAZ
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">W/C
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">NAT
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">W/C
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">NAT
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">W/C
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">NAT
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">W/C
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">NAT
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;"></td>
                                <td align="center" style="border: 1px solid #ADADAD;"></td>
                                <td align="center" style="border: 1px solid #ADADAD;"></td>
                            </tr>
                            <tr style="border: 1px solid #ADADAD;">
                                <td align="left" style="border: 1px solid #ADADAD;">Water Heater
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_CO_AMB" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_CO_CAZ" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_BackDraft_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_BackDraft_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_DarftEstablished_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_DarftEstablished_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_DarftPressure_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_DarftPressure_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_DarftPass_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_DarftPass_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_UndilCOFlue" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_GasLeackDet" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_WaterHeater_PrecentEff" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="border: 1px solid #ADADAD;">
                                <td align="left" style="border: 1px solid #ADADAD;">Furnace Boiler
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_CO_AMB" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_CO_CAZ" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_BackDraft_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_BackDraft_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DraftEstablished_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DraftEstablished_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DarftPressure_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DarftPressure_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DarftPass_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DarftPass_NA" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_UndilCOFlue" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_GasLeackDet" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center" style="border: 1px solid #ADADAD;">
                                    <asp:TextBox ID="txt_FurnaceBoiler_PrecentEff" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="border: 1px solid #ADADAD;">
                                <td align="left" style="border: 1px solid #ADADAD;">Other
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_CO_AMB" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_CO_CAZ" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_BackDraft_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_BackDraft_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftEstablished_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftEstablished_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftPressure_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftPressure_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftPass_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftPass_NA" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_UndilCOFlue" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_GasLeackDet" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_PrecentEff" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">Other
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_CO_AMB" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_CO_CAZ" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_BackDraft_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_BackDraft_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftEstablished_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftEstablished_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftPressure_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftPressure_NAT" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftPass_WC" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftPass_NA" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_UndilCOFlue" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_GasLeackDet" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_PrecentEff" runat="server" Style="border: none; font-weight: normal; color: Black; width: 100%;"></asp:TextBox>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table width="100%" cellspacing="0" cellpadding="0" border="1px">
                        <tbody>
                            <tr>
                                <td align="center" width="50%">Stove and Oven CO
                                </td>
                                <td align="center">Check Appliances at Worst Case Test
                                </td>
                            </tr>
                            <tr>
                                <td align="center">Rear Left Burner&nbsp;
                                            <asp:TextBox ID="txt_RearLeftBurner" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 15%;"></asp:TextBox><asp:RadioButton ID="rdo_RearLeftBurner1"
                                                runat="server" />&nbsp;&nbsp;<asp:RadioButton ID="rdo_RearLeftBurner2" runat="server" />Rear
                                            Right Burner
                                            <asp:TextBox ID="txt_RearRightBurner" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 15%;"></asp:TextBox>
                                </td>
                                <td>&nbsp;&nbsp; Dryer
                                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestDryerY" runat="server" Text=" Y" />
                                    <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestDryerN" runat="server" Text=" N" />&nbsp;&nbsp;Whole
                                            House Fan
                                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestWholeHouseFanY" runat="server"
                                                Text=" Y" />
                                    <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestWholeHouseFanN" runat="server"
                                        Text=" N" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">Front Left Burner
                                            <asp:TextBox ID="txt_FrontLeftBurner" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 15%;"></asp:TextBox>
                                    <asp:RadioButton ID="rdo_FrontLeftBurner1" runat="server" />
                                    <asp:RadioButton ID="rdo_FrontLeftBurner2" runat="server" />Front Right Burner<asp:TextBox
                                        ID="txt_FrontRightBurner" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 15%;"></asp:TextBox>
                                </td>
                                <td>&nbsp;&nbsp; BathFan
                                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestBathFanY" runat="server" Text=" Y" />
                                    <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestBathFanN" runat="server" Text=" N" />&nbsp;&nbsp;
                                            Kitchen Fan
                                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestKitchenFanY" runat="server" Text=" Y" />
                                    <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestKitchenFanN" runat="server" Text=" N" />
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <center>
                                                    <b>Oven CO Data</b></center>
                                    CO Ambient
                                            <asp:TextBox ID="txt_OvenCODataCOAmbient" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 15%;"></asp:TextBox>
                                    CO At oven vent
                                            <asp:TextBox ID="txt_OvenCODataCOAtOvenVent" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 15%;"></asp:TextBox>
                                </td>
                                <td>
                                    <b>HVAC Air Handler
                                                <asp:CheckBox ID="chk_HVACAirHandlerY" runat="server" Text=" Y" />
                                        <asp:CheckBox ID="chk_HVACAirHandlerN" runat="server" Text=" N" />
                                    </b>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table width="100%" cellspacing="0" cellpadding="0" border="1px">
                        <tbody>
                            <tr align="left">
                                <td>
                                    <b style="font-size: 14px; font-weight: bolder; text-align: center;">CAZ WC/D <b
                                        style="padding-left: 40px;"></b>Nat:
                                                <asp:TextBox ID="txt_CAZNat" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 12%;"></asp:TextBox>
                                        W/C:
                                                <asp:TextBox ID="txt_CAZWC" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 12%;"></asp:TextBox>
                                        Diff:
                                                <asp:TextBox ID="txt_CAZDiff" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 12%;"></asp:TextBox>
                                        Pass:
                                                <asp:TextBox ID="txt_CAZPass" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 12%;"></asp:TextBox>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td>CO alarms installed in these locations:
                                            <asp:TextBox ID="txt_COAlarmsInstalledLocations" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: Black; width: 25%;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b style="font-size: 14px; font-weight: bolder; text-align: center;">Emergency Situation:
                                                Gas company called to fix gas leak or other.
                                                <asp:CheckBox ID="chk_EmergencySituationGasCompanyCalledY" runat="server" Text=" Y" />
                                        <asp:CheckBox ID="chk_EmergencySituationGasCompanyCalledN" runat="server" Text=" N" />
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b style="font-size: 14px; font-weight: bolder; text-align: center;">Work cannot continue
                                                due to one or more failed test over Action Level
                                                <asp:CheckBox ID="chk_WorkCannotContinueToActionLevelY" runat="server" Text=" Y" />
                                        <asp:CheckBox ID="chk_WorkCannotContinueToActionLevelN" runat="server" Text=" N" />
                                    </b>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td colspan="2">
                                <strong>AMB=Ambient</strong>
                            </td>
                            <td colspan="2">
                                <strong>CAZ=Cumbustible Appliance Zone</strong>
                            </td>
                            <td>
                                <strong>W/C=Worst Case</strong>
                            </td>
                            <td colspan="2">
                                <strong>NAT=Natural Pa.=Pascals EFF=Efficiency Diff=Difference</strong>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table width="100%" cellspacing="0" cellpadding="0" border="1" style="text-align: center;">
                        <tr>
                            <td>
                                <strong>CO Test Results</strong>
                            </td>
                            <td>
                                <strong>And / Or</strong>
                            </td>
                            <td>
                                <strong>Spillage & Draft Test Results</strong>
                            </td>
                            <td>
                                <strong>Retrofit Action</strong>
                            </td>
                            <td style="width: 1px; padding: 0; background: black;" rowspan="8"></td>
                            <td>
                                <strong>CAZ Depressurization Limits: Venting Conditions</strong>
                            </td>
                            <td>
                                <strong>Limit (Pa.)</strong>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 14px;">0-25 PPM
                            </td>
                            <td align="center" style="font-size: 14px;">And
                            </td>
                            <td align="center" style="font-size: 14px;">Passes
                            </td>
                            <td align="center" style="font-size: 14px;">Proceed with work
                            </td>
                            <td align="center" style="font-size: 14px;">Orphan natural draft water heater (including outside chimney)
                            </td>
                            <td align="center" style="font-size: 14px;">-2
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 14px;">26-100 PPM
                            </td>
                            <td align="center" style="font-size: 14px;">And
                            </td>
                            <td align="center" style="font-size: 14px;">Passes
                            </td>
                            <td align="center" style="font-size: 14px;">Recommend that CO problem be fixed
                            </td>
                            <td align="center" style="font-size: 14px;">Natural draft boiler or furnace commonly vented with water heater
                            </td>
                            <td align="center" style="font-size: 14px;">-3
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 14px;">26-100 PPM
                            </td>
                            <td align="center" style="font-size: 14px;">And
                            </td>
                            <td align="center" style="font-size: 14px;">Fails at worst case only
                            </td>
                            <td align="center" style="font-size: 14px;">Recommend a service call for the appliance and/or repairs to the home to correct
                                        the problem
                            </td>
                            <td align="center" style="font-size: 14px;">Natural draft boiler or furnace with damper commonly vented with water heater
                            </td>
                            <td align="center" style="font-size: 14px;">-5
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 14px;">100-400 PPM
                            </td>
                            <td align="center" style="font-size: 14px;">Or
                            </td>
                            <td align="center" style="font-size: 14px;">Fails under natural conditions
                            </td>
                            <td align="center" style="font-size: 14px;">Stop work; work may not proceed until the system is serviced and the problem is
                                        corrected
                            </td>
                            <td align="center" style="font-size: 14px;">Individual natural draft boiler or furnace
                            </td>
                            <td align="center" style="font-size: 14px;">-5
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 14px;">>400 PPM
                            </td>
                            <td align="center" style="font-size: 14px;">And
                            </td>
                            <td align="center" style="font-size: 14px;">Passes
                            </td>
                            <td align="center" style="font-size: 14px;">Stop work; work may not proceed until the system is serviced and the problem is
                                        corrected
                            </td>
                            <td align="center" style="font-size: 14px;">Individual natural draft boiler or furnace commonly vented with water heater
                            </td>
                            <td align="center" style="font-size: 14px;">-5
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 14px;">>400 PPM
                            </td>
                            <td align="center" style="font-size: 14px;">And
                            </td>
                            <td align="center" style="font-size: 14px;">Fails under any condition
                            </td>
                            <td align="center" style="font-size: 14px;">Emergency: Shut off fuel to the appliances and have the homeowner call for service
                                        immediately
                            </td>
                            <td align="center" style="font-size: 14px;">Power vented or induce draft boiler or furnace alone , or fan assisted DWH alone
                            </td>
                            <td align="center" style="font-size: 14px;">-15
                            </td>
                        </tr>
                        <tr>
                            <td align="center"></td>
                            <td align="center"></td>
                            <td align="center"></td>
                            <td align="center"></td>
                            <td align="center" style="font-size: 14px;">Chimney-top draft induce; exhaust type or equivalent; high static pressure flame
                                        renention head oil burner; Direct vented appliances; Sealed combustion appliances
                            </td>
                            <td align="center" style="font-size: 14px;">-50
                            </td>
                        </tr>
                    </table>
                    <div style="text-align: center;">
                        <b style="font-size: 16px; font-weight: bolder; text-align: center;">Minimum Worst Case
                                    Draft, Acceptable Ranges</b><br />
                        <b style="font-size: 16px; font-weight: bolder; text-align: center;">Outdoor Temperature(F)
                        </b>
                    </div>
                    <table width="100%" cellspacing="0" cellpadding="0" border="1">
                        <tr>
                            <td align="center">
                                <strong>Appliances</strong>
                            </td>
                            <td align="center">
                                <strong><10</strong>
                            </td>
                            <td align="center">
                                <strong>20</strong>
                            </td>
                            <td align="center">
                                <strong>30</strong>
                            </td>
                            <td align="center">
                                <strong>40</strong>
                            </td>
                            <td align="center">
                                <strong>50</strong>
                            </td>
                            <td align="center">
                                <strong>60</strong>
                            </td>
                            <td align="center">
                                <strong>70</strong>
                            </td>
                            <td align="center">
                                <strong>80</strong>
                            </td>
                            <td align="center">
                                <strong>>90</strong>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <strong>Gas-Fired furnace boiler or water heater w/ atmospheric chimney</strong>
                            </td>
                            <td align="center">-2.5 Pa. -0.01 IWC
                            </td>
                            <td align="center">-2.00 Pa. -0.009 IWC
                            </td>
                            <td align="center">-2.00 Pa. -0.008 IWC
                            </td>
                            <td align="center">-1.75 Pa. -0.007 IWC
                            </td>
                            <td align="center">-1.50 Pa. -0.006 IWC
                            </td>
                            <td align="center">-1.25 Pa. -0.005 IWC
                            </td>
                            <td align="center">-1.00 Pa. -0.004 IWC
                            </td>
                            <td align="center">-0.75 Pa. -0.003 IWC
                            </td>
                            <td align="center">-0.50 Pa. -0.002 IWC
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <strong>Oil-Fired furnace boiler or water heater w/ atmospheric chimney</strong>
                            </td>
                            <td align="center">-15 Pa. -0.06 IWC
                            </td>
                            <td align="center">-13 Pa. -0.053 IWC
                            </td>
                            <td align="center"></td>
                            <td align="center">-11 Pa. -0.045 IWC
                            </td>
                            <td align="center"></td>
                            <td align="center"></td>
                            <td align="center">-9 Pa. -0.039 IWC
                            </td>
                            <td align="center"></td>
                            <td align="center">-7 Pa. -0.03 IWC
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- Page 9 END -->
                <!-- Page 9 Post Start -->
                <%--<table><tr><td><div style="page-break-after:always"></div></td></tr></table>--%>
                <div style="border: 1px solid #000000; width: 940px; margin: 0 auto; page-break-after: always; position: relative;">
                    <div id="ViewIMG" runat="server" visible="true" style="position: absolute; margin: 10% auto;">
                    </div>
                    <b style="font-size: 20px; font-weight: bolder; text-align: center;">Combustion Appliances
                                Post-Test</b>
                    <table width="100%" border="1" cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="2">
                                <b style="font-size: 16px; font-weight: bolder; text-align: center;">Are there any combustion
                                            appliances in the home?
                                            <asp:CheckBox ID="CombustionAppliancesHomeY_P" runat="server" Text=" Y" />
                                    <asp:CheckBox ID="CombustionAppliancesHomeN_P" runat="server" Text=" N" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">If yes, Combustible Equipment Safety Testing must have been done by the contractor
                                        if any air sealing was done. Are there any <span>UNVENTED</span>combustion heating
                                        applicances?
                                        <asp:CheckBox ID="CombustibleEquipmentSafetyTestingY_P" runat="server" Text=" Y" />
                                <asp:CheckBox ID="CombustibleEquipmentSafetyTestingN_P" runat="server" Text=" N" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <strong>If yes, no air sealing may be performed that tightens structure below 3000 CFM-50Pa,
                                            & Wx release form signed.</strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Step 1:</span>Record the outside temperature and zero the analyzer.
                            </td>
                            <td>
                                <span>Step 7:</span>Turn on the water heater first.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Step 2:</span>Record house ambient CO & CO in CAZ-nothing is on.
                            </td>
                            <td>
                                <span>Step 8:</span>Check for spillage.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Step 3:</span>Look for signs of roll out of back drafting-nothing is on.
                            </td>
                            <td>
                                <span>Step 9:</span>Measure undiluted Co.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Step 4:</span>Perform a gas leak test.
                            </td>
                            <td>
                                <span>Step 10:</span>Record if the draft was established at one minute.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Step 5:</span>Drill hole for the draft measurement.
                            </td>
                            <td>
                                <span>Step 11:</span>Repeat spillage, CO & draft test for boiler or furnace.
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <span>Step 6:</span>Start the worst case depressurization test procedure - appliances
                                        off; measure base pressure; pressure in the CAZ under worst case condition; <strong>THEN</strong>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">Outdoor Temperature
                                        <asp:TextBox ID="txt_OutdoorTemperature_P" runat="server" Style="width: 10%; border-bottom: 1px #ccc solid; border-top: none; border-left: none; border-right: none; font-weight: normal; color: Black;"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" cellspacing="0" cellpadding="1" border="1px">
                        <tbody>
                            <tr>
                                <td align="center" valign="bottom">
                                    <b>Appliances</b><%--<br />
                                            <br />--%>
                                </td>
                                <td colspan="2" align="center" style="font-size: 9">
                                    <b>CO</b>
                                    <%--<br />--%>
                                            &nbsp;
                                </td>
                                <td colspan="2" align="center" style="font-size: 9">
                                    <b>Backdraft
                                                <%-- <br />--%>
                                                Y/N</b>
                                </td>
                                <td colspan="2" align="center" style="font-size: 9">
                                    <b>Draft (1 min.)<%--<br />--%>
                                                Established Y/N</b>
                                </td>
                                <td colspan="2" align="center" style="font-size: 9">
                                    <b>Draft Pressure
                                                <%-- <br />--%>
                                                Pa. </b>
                                </td>
                                <td colspan="2" align="center" style="font-size: 9">
                                    <b>Draft Pass<%--<br />--%>
                                                Y/N</b>
                                </td>
                                <td align="center" style="font-size: 9">
                                    <b>Undil.<%--<br />--%>
                                                CO Flue </b>
                                </td>
                                <td align="center" style="font-size: 9">
                                    <b>Gas Leak<%--<br />--%>
                                                Det. Y/N/NA</b>
                                </td>
                                <td align="center" style="font-size: 9">
                                    <b>Percent
                                                <%--<br />--%>
                                                Eff.</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span></span>
                                </td>
                                <td align="center">AMB
                                </td>
                                <td align="center">CAZ
                                </td>
                                <td align="center">W/C
                                </td>
                                <td align="center">NAT
                                </td>
                                <td align="center">W/C
                                </td>
                                <td align="center">NAT
                                </td>
                                <td align="center">W/C
                                </td>
                                <td align="center">NAT
                                </td>
                                <td align="center">W/C
                                </td>
                                <td align="center">NAT
                                </td>
                                <td align="center"></td>
                                <td align="center"></td>
                                <td align="center"></td>
                            </tr>
                            <tr>
                                <td align="left">Water Heater
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_CO_AMB_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_CO_CAZ_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_BackDraft_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_BackDraft_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_DarftEstablished_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_DarftEstablished_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_DarftPressure_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_DarftPressure_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_DarftPass_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_DarftPass_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_UndilCOFlue_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_GasLeackDet_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_WaterHeater_PrecentEff_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">Furnace Boiler
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_CO_AMB_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_CO_CAZ_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_BackDraft_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_BackDraft_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DraftEstablished_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DraftEstablished_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DarftPressure_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DarftPressure_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DarftPass_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_DarftPass_NA_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_UndilCOFlue_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_GasLeackDet_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_FurnaceBoiler_PrecentEff_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">Outher
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_CO_AMB_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_CO_CAZ_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_BackDraft_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_BackDraft_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftEstablished_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftEstablished_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftPressure_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftPressure_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftPass_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_DarftPass_NA_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_UndilCOFlue_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_GasLeackDet_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher1_PrecentEff_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">Outher
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_CO_AMB_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_CO_CAZ_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_BackDraft_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_BackDraft_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftEstablished_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftEstablished_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftPressure_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftPressure_NAT_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftPass_WC_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_DarftPass_NA_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_UndilCOFlue_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_GasLeackDet_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Outher2_PrecentEff_P" runat="server" Style="border: none; font-weight: normal; color: black; width: 100%;"></asp:TextBox>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table width="100%" cellspacing="0" cellpadding="0" border="1px">
                        <tbody>
                            <tr>
                                <td align="center" width="50%">Stove and Oven CO
                                </td>
                                <td align="center">Check Appliances at Worst Case Test
                                </td>
                            </tr>
                            <tr>
                                <td align="center">Rear Left Burner&nbsp;
                                            <asp:TextBox ID="txt_RearLeftBurner_P" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: black; width: 15%;"></asp:TextBox><asp:RadioButton ID="rdo_RearLeftBurner1_P"
                                                runat="server" />&nbsp;&nbsp;<asp:RadioButton ID="rdo_RearLeftBurner2_P" runat="server" />Rear
                                            Right Burner
                                            <asp:TextBox ID="txt_RearRightBurner_P" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: black; width: 15%;"></asp:TextBox>
                                </td>
                                <td>&nbsp;&nbsp; Dryer
                                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestDryerY_P" runat="server" Text=" Y" />
                                    <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestDryerN_P" runat="server" Text=" N" />&nbsp;&nbsp;Whole
                                            House Fan
                                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestWholeHouseFanY_P" runat="server"
                                                Text=" Y" />
                                    <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestWholeHouseFanN_P" runat="server"
                                        Text=" N" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">Front Left Burner
                                            <asp:TextBox ID="txt_FrontLeftBurner_P" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: black; width: 15%;"></asp:TextBox>
                                    <asp:RadioButton ID="rdo_FrontLeftBurner1_P" runat="server" />
                                    <asp:RadioButton ID="rdo_FrontLeftBurner2_P" runat="server" />Front Right Burner<asp:TextBox
                                        ID="txt_FrontRightBurner_P" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: black; width: 15%;"></asp:TextBox>
                                </td>
                                <td>&nbsp;&nbsp; BathFan
                                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestBathFanY_P" runat="server" Text=" Y" />
                                    <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestBathFanN_P" runat="server" Text=" N" />&nbsp;&nbsp;
                                            Kitchen Fan
                                            <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestKitchenFanY_P" runat="server" Text=" Y" />
                                    <asp:CheckBox ID="chk_CheckAppliancesWorstCaseTestKitchenFanN_P" runat="server" Text=" N" />
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <center>
                                                    <b>Oven CO Data</b></center>
                                    CO Ambient
                                            <asp:TextBox ID="txt_OvenCODataCOAmbient_P" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: black; width: 15%;"></asp:TextBox>
                                    CO At oven vent
                                            <asp:TextBox ID="txt_OvenCODataCOAtOvenVent_P" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: black; width: 15%;"></asp:TextBox>
                                </td>
                                <td>
                                    <b style="font-size: 16px; font-weight: bolder; text-align: center;">HVAC Air Handler
                                                <asp:CheckBox ID="chk_HVACAirHandlerY_P" runat="server" Text=" Y" />
                                        <asp:CheckBox ID="chk_HVACAirHandlerN_P" runat="server" Text=" N" />
                                    </b>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table width="100%" cellspacing="0" cellpadding="0" border="1px">
                        <tbody>
                            <tr align="left">
                                <td>
                                    <b style="font-size: 16px; font-weight: bolder; text-align: center;">CAZ WC/D <span
                                        style="padding-left: 40px;">Nat:</span>
                                        <asp:TextBox ID="txt_CAZNat_P" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: black; width: 12%;"></asp:TextBox>
                                        W/C:
                                                <asp:TextBox ID="txt_CAZWC_P" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: black; width: 12%;"></asp:TextBox>
                                        Diff:
                                                <asp:TextBox ID="txt_CAZDiff_P" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: black; width: 12%;"></asp:TextBox>
                                        Pass:
                                                <asp:TextBox ID="txt_CAZPass_P" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: black; width: 12%;"></asp:TextBox>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td>CO alarms installed in these locations:
                                            <asp:TextBox ID="txt_COAlarmsInstalledLocations_P" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); font-weight: normal; color: black; width: 25%;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b style="font-size: 16px; font-weight: bolder; text-align: center;">Emergency Situation:
                                                Gas company called to fix gas leak or other.
                                                <asp:CheckBox ID="chk_EmergencySituationGasCompanyCalledY_P" runat="server" Text=" Y" />
                                        <asp:CheckBox ID="chk_EmergencySituationGasCompanyCalledN_P" runat="server" Text=" N" />
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b style="font-size: 16px; font-weight: bolder; text-align: center;">Work cannot continue
                                                due to one or more failed test over Action Level
                                                <asp:CheckBox ID="chk_WorkCannotContinueToActionLevelY_P" runat="server" Text=" Y" />
                                        <asp:CheckBox ID="chk_WorkCannotContinueToActionLevelN_P" runat="server" Text=" N" />
                                    </b>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td colspan="2">
                                <strong>AMB=Ambient</strong>
                            </td>
                            <td colspan="2">
                                <strong>CAZ=Cumbustible Appliance </strong>
                                <br />
                                <strong>Zone</strong>
                            </td>
                            <td>
                                <strong>W/C=Worst</strong><br />
                                <strong>Case</strong>
                            </td>
                            <td colspan="2">
                                <strong>NAT=Natural Pa.=Pascals EFF=Efficiency Diff=Difference</strong>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" cellspacing="0" cellpadding="0" border="1" style="text-align: center;">
                        <tr>
                            <td>
                                <strong>CO Test Results</strong>
                            </td>
                            <td>
                                <strong>And / Or</strong>
                            </td>
                            <td>
                                <strong>Spillage & Draft Test Results</strong>
                            </td>
                            <td>
                                <strong>Retrofit Action</strong>
                            </td>
                            <td style="width: 1px; padding: 0; background: black;" rowspan="8"></td>
                            <td>
                                <strong>CAZ Depressurization Limits: Venting Conditions</strong>
                            </td>
                            <td>
                                <strong>Limit (Pa.)</strong>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 13px;">0-25 PPM
                            </td>
                            <td align="center" style="font-size: 13px;">And
                            </td>
                            <td align="center" style="font-size: 13px;">Passes
                            </td>
                            <td align="center" style="font-size: 13px;">Proceed with work
                            </td>
                            <td align="center" style="font-size: 13px;">Orphan natural draft water heater (including outside chimney)
                            </td>
                            <td align="center" style="font-size: 13px;">-2
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 13px;">26-100 PPM
                            </td>
                            <td align="center" style="font-size: 13px;">And
                            </td>
                            <td align="center" style="font-size: 13px;">Passes
                            </td>
                            <td align="center" style="font-size: 13px;">Recommend that CO problem be fixed
                            </td>
                            <td align="center" style="font-size: 13px;">Natural draft boiler or furnace commonly vented with water heater
                            </td>
                            <td align="center" style="font-size: 13px;">-3
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 13px;">26-100 PPM
                            </td>
                            <td align="center" style="font-size: 13px;">And
                            </td>
                            <td align="center" style="font-size: 13px;">Fails at worst case only
                            </td>
                            <td align="center" style="font-size: 13px;">Recommend a service call for the appliance and/or repairs to the home to correct
                                        the problem
                            </td>
                            <td align="center" style="font-size: 13px;">Natural draft boiler or furnace with damper commonly vented with water heater
                            </td>
                            <td align="center" style="font-size: 13px;">-5
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 13px;">100-400 PPM
                            </td>
                            <td align="center" style="font-size: 13px;">Or
                            </td>
                            <td align="center" style="font-size: 13px;">Fails under natural conditions
                            </td>
                            <td align="center" style="font-size: 13px;">Stop work; work may not proceed until the system is serviced and the problem is
                                        corrected
                            </td>
                            <td align="center" style="font-size: 13px;">Individual natural draft boiler or furnace
                            </td>
                            <td align="center" style="font-size: 13px;">-5
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 13px;">>400 PPM
                            </td>
                            <td align="center" style="font-size: 13px;">And
                            </td>
                            <td align="center" style="font-size: 13px;">Passes
                            </td>
                            <td align="center" style="font-size: 13px;">Stop work; work may not proceed until the system is serviced and the problem is
                                        corrected
                            </td>
                            <td align="center" style="font-size: 13px;">Individual natural draft boiler or furnace commonly vented with water heater
                            </td>
                            <td align="center" style="font-size: 13px;">-5
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 13px;">>400 PPM
                            </td>
                            <td align="center" style="font-size: 13px;">And
                            </td>
                            <td align="center" style="font-size: 13px;">Fails under any condition
                            </td>
                            <td align="center" style="font-size: 13px;">Emergency: Shut off fuel to the appliances and have the homeowner call for service
                                        immediately
                            </td>
                            <td align="center" style="font-size: 13px;">Power vented or induce draft boiler or furnace alone , or fan assisted DWH alone
                            </td>
                            <td align="center" style="font-size: 13px;">-15
                            </td>
                        </tr>
                        <tr>
                            <td align="center"></td>
                            <td align="center"></td>
                            <td align="center"></td>
                            <td align="center"></td>
                            <td align="center" style="font-size: 13px;">Chimney-top draft induce; exhaust type or equivalent; high static pressure flame
                                        renention head oil burner; Direct vented appliances; Sealed combustion appliances
                            </td>
                            <td align="center" style="font-size: 13px;">-50
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div style="text-align: center;">
                        <b style="font-size: 20px; font-weight: bolder; text-align: center;">Minimum Worst Case
                                    Draft, Acceptable Ranges</b><br />
                        <b style="font-size: 20px; font-weight: bolder; text-align: center;">Outdoor Temperature(F)</b>
                    </div>
                    <table width="100%" cellspacing="0" cellpadding="0" border="1">
                        <tr>
                            <td align="center">
                                <strong>Appliances</strong>
                            </td>
                            <td align="center">
                                <strong><10</strong>
                            </td>
                            <td align="center">
                                <strong>20</strong>
                            </td>
                            <td align="center">
                                <strong>30</strong>
                            </td>
                            <td align="center">
                                <strong>40</strong>
                            </td>
                            <td align="center">
                                <strong>50</strong>
                            </td>
                            <td align="center">
                                <strong>60</strong>
                            </td>
                            <td align="center">
                                <strong>70</strong>
                            </td>
                            <td align="center">
                                <strong>80</strong>
                            </td>
                            <td align="center">
                                <strong>>90</strong>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <strong>Gas-Fired furnace boiler or water heater w/ atmospheric chimney</strong>
                            </td>
                            <td align="center">-2.5 Pa. -0.01 IWC
                            </td>
                            <td align="center">-2.00 Pa. -0.009 IWC
                            </td>
                            <td align="center">-2.00 Pa. -0.008 IWC
                            </td>
                            <td align="center">-1.75 Pa. -0.007 IWC
                            </td>
                            <td align="center">-1.50 Pa. -0.006 IWC
                            </td>
                            <td align="center">-1.25 Pa. -0.005 IWC
                            </td>
                            <td align="center">-1.00 Pa. -0.004 IWC
                            </td>
                            <td align="center">-0.75 Pa. -0.003 IWC
                            </td>
                            <td align="center">-0.50 Pa. -0.002 IWC
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <strong>Oil-Fired furnace boiler or water heater w/ atmospheric chimney</strong>
                            </td>
                            <td align="center">-15 Pa. -0.06 IWC
                            </td>
                            <td align="center">-13 Pa. -0.053 IWC
                            </td>
                            <td align="center"></td>
                            <td align="center">-11 Pa. -0.045 IWC
                            </td>
                            <td align="center"></td>
                            <td align="center"></td>
                            <td align="center">-9 Pa. -0.039 IWC
                            </td>
                            <td align="center"></td>
                            <td align="center">-7 Pa. -0.03 IWC
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- Page 9 Post End -->
                <!-- Page 10 Start -->
                <%--<table><tr><td><div style="page-break-after:always"></div></td></tr></table>--%>
                <div style="border: 1px solid #000000; width: 940px; margin: 0 auto; position: relative;">
                    <%--  <h1 style="font-size: 48px; color: #ff0000; text-align: center; padding: 10px 0;">
                                Select System Type FIRST</h1>--%>
                    <h2 align="center">DUCT TESTING, REPAIR & SEALING FORM</h2>
                    <div style="width: 100%; height: auto;">
                        <!--newtable begin-->
                        <table width="100%" border="1" cellspacing="0" cellpadding="5">
                            <tr>
                                <td width="100px">&nbsp; <strong><u>System Type </u></strong>
                                </td>
                                <td>
                                    <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                        <tr>
                                            <td>Heat Pump:
                                                        <asp:CheckBox ID="Chk_SystemType_HeatPump" runat="server" />
                                            </td>
                                            <td>Central Air Only
                                                        <asp:CheckBox ID="Chk_SystemType_CentralAirOnly" runat="server" />
                                            </td>
                                            <td>Elec. Furnace
                                                        <asp:CheckBox ID="Chk_SystemType_ElecFurnace" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">Other
                                                        <asp:CheckBox ID="Chk_SystemType_Other" runat="server" />
                                                <asp:TextBox ID="txt_SystemType_OtherDesc" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 78%; font-weight: normal; color: Black;"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                        <tr>
                                            <td>
                                                <u><strong>Supply Duct Locations</strong></u>
                                            </td>
                                            <td>Basement / Walls
                                                        <br />
                                                <asp:TextBox ID="txt_SupplyDuctLocation_BasementWalls" runat="server" Style="width: 80px; text-align: center; border: none; border-bottom: solid 1px rgb(219, 219, 219);"></asp:TextBox>
                                            </td>
                                            <td>Attic
                                                        <br />
                                                <asp:TextBox ID="txt_SupplyDuctLocation_Attic" runat="server" Style="width: 80px; text-align: center; border: none; border-bottom: solid 1px rgb(219, 219, 219);"></asp:TextBox>
                                            </td>
                                            <td>Garage
                                                        <br />
                                                <asp:TextBox ID="txt_SupplyDuctLocation_Garage" runat="server" Style="width: 80px; text-align: center; border: none; border-bottom: solid 1px rgb(219, 219, 219);"></asp:TextBox>
                                            </td>
                                            <td>Vented Crawl
                                                        <br />
                                                <asp:TextBox ID="txt_SupplyDuctLocation_VentedCrawl" runat="server" Style="width: 80px; text-align: center; border: none; border-bottom: solid 1px rgb(219, 219, 219);"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" height="45">&nbsp; <u><strong>Air Handler Location</strong> </u>
                                    <asp:TextBox ID="txt_AirHandlerLocation" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219); width: 60%; font-weight: normal; color: Black;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                        <tr>
                                            <td>
                                                <u><strong>Duct Materials</strong></u>
                                            </td>
                                            <td>Metal
                                                        <asp:CheckBox ID="chk_DuctMaterials_Metal" runat="server" />
                                            </td>
                                            <td>Duct Board
                                                        <asp:CheckBox ID="chk_DuctMaterials_DuctBoard" runat="server" />
                                            </td>
                                            <td>Flex
                                                        <asp:CheckBox ID="chk_DuctMaterials_Flex" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                        <tr>
                                            <td>&nbsp; <u><strong>Filter Locations</strong></u>
                                            </td>
                                            <td>In Cabinet
                                                        <asp:CheckBox ID="chk_FilterLocations_InCabinet" runat="server" />
                                            </td>
                                            <td>Ext. Slot
                                                        <asp:CheckBox ID="chk_FilterLocations_ExtSlot" runat="server" />
                                            </td>
                                            <td align="right">
                                                <u><strong>Return Register Slot Covered</strong></u>
                                                <asp:CheckBox ID="chk_FilterLocations_ReturnRegisterSlotCoveredY" runat="server" />
                                                Yes
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chk_FilterLocations_ReturnRegisterSlotCoveredN" runat="server" />
                                                No
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" height="40">&nbsp; <strong><u>Situation I:</u> Ducts are all in basement or walls and there is a
                                                single or no return register</strong>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <ul>
                                        <li>Re-connect accessible disconnected ducts</li>
                                        <li>Support sagging ducts with wire or strap</li>
                                        <li>Run the air handler fan and seal <i><b>large</b></i> supply and return leaks</li>
                                        <li>If there is no return, either create one or vent basement to living space</li>
                                    </ul>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" height="40">&nbsp; <strong><u>Situation II:</u> Ducts are all in basement or walls and there are
                                                multiple return registers</strong>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <ul>
                                        <li>Open basement door and depressurize house to 25 Pascals</li>
                                        <li>Pressure pan all return registers and enter pressures in table</li>
                                        <li>For all registers with pressure &gt; 1 Pascal, seal accessible leaks between the
                                                    building cavity containing the register and exterior zones. To locate leaks, run
                                                    the air handler fan and use smoke</li>
                                        <li>Enter final pressure pan reading in table</li>
                                        <li>Do <i><b>NOT</b></i> seal leaks in basement returns unless they are big enough to
                                                    depressurize the basement at least 2 Pascals with the air handler fan</li>
                                    </ul>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" height="40">&nbsp; <strong><u>Situation III:</u> There is duct work in exterior zones</strong>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <ul>
                                        <li>If there is ductwork in the basement, open the basement door</li>
                                        <li>Depressurize house to 25 Pascals abd oressure pan all supply and return registers.
                                                    Enter the pressure in the table</li>
                                        <li>Seal leaks between ducts/building cavities and exterior zones until all pressure
                                                    pan readings are below 1 Pascal or no further sealing is practical. If leakage is
                                                    sever, some drywall demolition/replacement may be justified</li>
                                        <li>Enter pressure pan readings in table</li>
                                    </ul>
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <div class="botom_tab">
                            <table width="100%" border="1" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>Register Number
                                    </td>
                                    <td>#1
                                    </td>
                                    <td>#2
                                    </td>
                                    <td>#3
                                    </td>
                                    <td>#4
                                    </td>
                                    <td>#5
                                    </td>
                                    <td>#6
                                    </td>
                                    <td>#7
                                    </td>
                                    <td>#8
                                    </td>
                                </tr>
                                <tr>
                                    <td>Room
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegisterNoRoom1" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegisterNoRoom2" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegisterNoRoom3" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegisterNoRoom4" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegisterNoRoom5" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegisterNoRoom6" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegisterNoRoom7" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegisterNoRoom8" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Read
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="51">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="51">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="51">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="51">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="52">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="52">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="52">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="52">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Supply
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_1" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_1" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_2" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_2" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_3" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_3" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_4" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_4" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_5" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_5" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_6" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_6" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_7" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_7" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_8" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_8" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Return
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_1" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_1" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_2" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_2" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_3" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_3" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_4" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_4" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_5" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_5" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_6" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_6" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_7" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_7" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_8" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_8" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Register Number
                                    </td>
                                    <td>#9
                                    </td>
                                    <td>#10
                                    </td>
                                    <td>#11
                                    </td>
                                    <td>#12
                                    </td>
                                    <td>#13
                                    </td>
                                    <td>#14
                                    </td>
                                    <td>#15
                                    </td>
                                    <td>#16
                                    </td>
                                </tr>
                                <tr>
                                    <td>Room
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegNo_Room9" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegNo_Room10" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegNo_Room11" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegNo_Room12" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegNo_Room13" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegNo_Room14" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegNo_Room15" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RegNo_Room16" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Read
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="51">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="51">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="51">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="51">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="52">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="52">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="52">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="52">Pre
                                                </td>
                                                <td>Post
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Supply
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_9" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_9" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_10" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_10" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_11" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_11" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_12" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_12" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_13" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_13" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_14" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_14" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_15" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_15" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Pre_16" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Supply_Post_16" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Return
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_9" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_9" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_10" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_10" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_11" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_11" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_12" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_12" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_13" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_13" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_14" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_14" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_15" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_15" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Pre_16" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_RegNo_Return_Post_16" runat="server" Style="border: none; width: 43px; font-weight: normal; color: Black;"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <strong><u>Note:</u> Number registers by floor going away from Air Handler Unit (AHU).
                                        Register # will always be the one closest to AHU.</strong>
                            <br />
                        </div>
                    </div>
                </div>
           
            
                                            <%if (dtPhoto.Rows.Count > 0)
                                  { %>
                           
                            <div style="font-weight: bold;">
                                <div style="clear: left;">
                                </div>
                                <!-- form section -->
                                <div style="border: 1px solid #B3B3B3; width: 940px; margin: 0 auto; position: relative;">
                                    <table border="0" cellpadding="2px" style="margin: 0 auto; width: 100%;">
                                        <%for (int i = 0; i < dtPhoto.Rows.Count; i++)
                                          {%>
                                        <% if (i % 2 == 0)
                                           { %>
                                        <tr>
                                            <td>
                                                <div style="float: left; width: 450px; min-height: 300px; margin: 3px;">
                                                    <div style="font-size: 16px; color: Black; font-family: 'HelveticaNeueBlackItalic'; margin: 8px 0px;">
                                                        <%= Convert.ToString(dtPhoto.Rows[i]["PhotoTitle"])%>
                                                    </div>
                                                    <div style="float: left; padding: 2%; width: 350px; border: 1px dotted #CCC;">
                                                        <img src="../PPLAudit/Photo_Page_Images/<%=Convert.ToString(dtPhoto.Rows[i]["PhotoName"])%>"
                                                            width="350px" height="215px" alt="" />
                                                    </div>
                                                    <div id="desc" style="font-size: 11px; color: #4B4B4B; text-align: justify; line-height: 22px; width: 440px; float: left; margin-top: 10px; padding-left: 3%; padding-right: 3%;">
                                                        <%--background: url('../images/line.png')repeat-y;--%>
                                                        <img src="../images/pen.png" width="20px" height="20px" alt="" /><%=Convert.ToString(dtPhoto.Rows[i]["PhotoDescription1"])%><%= Convert.ToString(dtPhoto.Rows[i]["PhotoDescription2"])%>
                                                        <%=Convert.ToString(dtPhoto.Rows[i]["PhotoDescription3"])%>
                                                    </div>
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
                                                    <div id="Div2" style="font-size: 16px; color: Black; font-family: 'HelveticaNeueBlackItalic'; margin: 8px 0px;">
                                                        <%= Convert.ToString(dtPhoto.Rows[i]["PhotoTitle"])%>
                                                    </div>
                                                    <div style="float: left; padding: 2%; width: 350px; border: 1px dotted #CCC;">
                                                        <img src="../PPLAudit/Photo_Page_Images/<%=Convert.ToString(dtPhoto.Rows[i]["PhotoName"])%>"
                                                            width="350px" height="215px" alt="" />
                                                    </div>
                                                    <div style="font-size: 11px; color: #4B4B4B; text-align: justify; line-height: 22px; width: 440px; float: left; margin-top: 10px; padding-left: 3%; padding-right: 3%;">
                                                        <%--background: url('../images/line.png')repeat-y;--%>
                                                        <img src="../images/pen.png" width="20px" height="20px" alt="" /><%=Convert.ToString(dtPhoto.Rows[i]["PhotoDescription1"])%><%= Convert.ToString(dtPhoto.Rows[i]["PhotoDescription2"])%>
                                                        <%=Convert.ToString(dtPhoto.Rows[i]["PhotoDescription3"])%>
                                                    </div>
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
                                            <td></td>
                                        </tr>
                                        <%} %>
                                    </table>
                                    <!-- end form section -->
                                    <div style="border-top: 1px solid #cfcfcf; font-size: 14px; color: #717171; padding: 5px 0; text-align: center; width: 908px; margin: 0 auto; position: relative;">
                                        Custom Weatherization, LLC Â© 2013
                                    </div>
                                </div>
                                <!-- Photo Page End-->
                                <% } %>
                                <%
                                  else
                                  { 
                                %>
                                <div style="border-top: 1px solid #cfcfcf; font-size: 14px; color: #717171; padding: 5px 0; text-align: center; width: 940px; margin: 0 auto; position: relative;">
                                    Custom Weatherization, LLC Â© 2013
                                </div>
                            </div>
                            <%
                                  }
                            %>
            
            
             </div>
            
        </div>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#fix_div input[type=text]').attr("readonly", "readonly");
            //            $('#fix_div input[type=radio]').attr("disabled", "disabled");
            //            $('#fix_div input[type=checkbox]').attr("disabled", "disabled");
            $('#fix_div input[type="text"], textarea').attr('readonly', 'readonly');
        });
    </script>

    <script type="text/javascript">
        // This jQuery code makes all check boxes read-only
        $(':checkbox').click(function () {
            return false;
        });
    </script>

    <script type="text/javascript">
        // This jQuery code makes all radio button read-only
        $(':radio').click(function () {
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
            docprint.document.write('<html><head><title>Custom Weatherization/ PPL Audit Page</title> ');
            docprint.document.write('</head><body onLoad="self.print()"><center>');
            docprint.document.write(content_vlue);
            docprint.document.write('</center></body></html>');
            docprint.document.close();
            docprint.focus();
        }
    </script>
</body>
</html>
