<%@ Page Language="C#" MasterPageFile="~/METED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page22.aspx.cs" Inherits="METED_METED_Audit_Page22" Title="METED_Audit_Page22" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="top_links" runat="server" id="TopBtnDiv">
        <b><span id="spnFinal" runat="server" style="color: Red; font-size: medium;"></span>
        </b>
        <br />
        <asp:Button ID="btnUpdate" runat="server" Text="Save" class="top_btn" OnClick="btnUpdate_Click" />&nbsp;&nbsp;
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" class="top_btn" OnClick="btn_cancel_Click" />&nbsp;&nbsp;
        <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
        <%--OnClientClick="ClickHereToPrintFull()"--%>
    </div>
    <div id="DivPrint">
        <!--main_right begin-->
        <p style="text-align: center; padding-bottom: 0; font-size: 16px">
            <strong>To assist all the inspectors and evaluators, please list:</strong></p>
        <div class="newtable" style="border: 1px solid #000; height: auto;">
            <table width="100%" border="1" height="500px" style="text-align: center;">
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
                            width: 97%;"></asp:TextBox>
                        <%-- <textarea name="" cols="" rows="" style="height: 60px; width: 97%;"></textarea>--%>
                    </td>
                </tr>
            </table>
        </div>
        <div class="margindiv">
            <p style="text-align: center;">
                <strong>Measure(s) called for and refused by customer:</strong></p>
            <table width="100%" height="250px" border="1" style="text-align: center">
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
                    This Audit form</br>
                    <asp:CheckBox ID="Chk_SeasonalForm" runat="server" />
                    Seasonal Allowance Calculation form</br>
                    <asp:CheckBox ID="Chk_OurAgreement" runat="server" />Our Partnership Agreement</br>
                    <asp:CheckBox ID="Chk_OurStrategy" runat="server" />
                    Our Savings Strategy</br>
                    <asp:CheckBox ID="Chk_CustomerKwh" runat="server" />
                    Customer Details from FE Human Services Web Site Only send the kWh</br>
                    <asp:CheckBox ID="Chk_AccountKWHWebsite" runat="server" />Account kWh usage from
                    FE Human Services Web Site</br>
                    <asp:CheckBox ID="Chk_RT" runat="server" />
                    RT Vs Rs Spreadsheet
                    <asp:CheckBox ID="Chk_RTNA" runat="server" />
                    N/A </br>
                    <asp:CheckBox ID="Chk_ReceiptsInformation" runat="server" />
                    Receipts for items over $500 - FE needs this information
                    <asp:CheckBox ID="Chk_ReceiptsInfoNA" runat="server" />
                    N/A
                </div>
                <div id="two" style="width: 48%; float: left;">
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
                    AC Checklist for contractor<br />
                    <asp:CheckBox ID="Chk_AccountsWebsite" runat="server" /><%--Sears Appliance Fax Form--%>Lowe's
                    Appliance POD Form (WARM LIURP only-in applicable service areas)<%--(Met-Ed, Penn Power and West Penn Power WARM Only)--%>
                    <%--<asp:CheckBox ID="Chk_SearsAppliance" runat="server" />
                    Sears Appliance Fax Form (Met-Ed, Penn Power and West Penn Power WARM Only)--%>
                </div>
                <%-- <input name="" type="checkbox" value="" />WARM3 Invoice</br>
                <input name="" type="checkbox" value="" />This Audit form</br>--%>
                <%--  <input name="" type="checkbox" value="" />Seasonal Allowance Calculation form</br>
                <input name="" type="checkbox" value="" />Our Partnership Agreement</br>--%>
                <%-- <input name="" type="checkbox" value="" />Our Saving Strategy</br>
                <input name="" type="checkbox" value="" />Customer detail from FE human services
                website pnly send the KWH</br>--%>
                <%--<input name="" type="checkbox" value="" />Account kWh usage from FE human services
                website</br>
                <input name="" type="checkbox" value="" />RT Vs Rs Spreadsheet
                <input name="" type="checkbox" value="" />N/A</br>
                <input name="" type="checkbox" value="" />Receipts for items )over $500 FE need
                this information
                <input name="" type="checkbox" value="" />N/A
            </div>
            <div id="two">
                <input name="" type="checkbox" value="" />Photo of worked performed this is Now
                inaccesible
                <input name="" type="checkbox" value="" />N/A</br>
                <input name="" type="checkbox" value="" />Weatherization Release from when unvented
                combution appliance are present<input name="" type="checkbox" value="" />N/A</br>
                <input name="" type="checkbox" value="" />Copy of "Air Tight Home" handout by Customer
                <input name="" type="checkbox" value="" />N/A</br>
                <input name="" type="checkbox" value="" />Copy of Customer measure payback worksheet
                <input name="" type="checkbox" value="" />N/A</br>
                <input name="" type="checkbox" value="" />Copy of H&S condition and finding form
                <input name="" type="checkbox" value="" />N/A</br>
                <input name="" type="checkbox" value="" />Referral to other program<input name=""
                    type="checkbox" value="" />N/A</br>
                <input name="" type="checkbox" value="" />Account kWh usage from FE human services
                website</br>
                <input name="" type="checkbox" value="" />Heat Pup Checklist for Contrator </br>
                <input name="" type="checkbox" value="" />
                AC Checklist for Contrator
            </div>--%>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(function() {
            document.getElementById('Page22').classList.add("ui-selected");
        });

        function ClickHereToPrintFull() {


            var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
            disp_setting += "scrollbars=yes,width=650px, height=600px, left=100, top=25";
            var content_vlue = document.getElementById('DivPrint').innerHTML;
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

    <!--main_right end-->
</asp:Content>
