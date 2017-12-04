<%@ Page Language="C#" MasterPageFile="~/PPLAudit/PPLMasterPage.master" AutoEventWireup="true"
    CodeFile="PPL_Audit_1.aspx.cs" Inherits="PPLAudit_PPL_Audit_1" Title="PPL_Audit_1 Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 319px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <%--<asp:ScriptManager ID="script" runat="server">
    </asp:ScriptManager>--%>
    <div class="top_links" runat="server" id="TopBtnDiv">
       <span id="spnFinal" runat="server" style="color: Red; font-size: medium; font-weight:bold;"></span><br />   
        <asp:Button ID="btnUpdate" runat="server" Text="Save" OnClick="btnUpdate_Click" class="top_btn" />&nbsp;&nbsp;
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click"
            class="top_btn" />&nbsp;&nbsp;
        <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
    </div>
    <div class="fontbold">
        <div id="DivPrint">
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        <h2>
                            To Be Completed By PPL:</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="5">
                            <tr>
                                <td>
                                    Name :
                                    <asp:TextBox runat="server" ID="txtName" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 72%;" ReadOnly="true"></asp:TextBox>
                                </td>
                                <td>
                                    Account :
                                    <asp:TextBox runat="server" ID="txtAccount" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 30%;" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address :
                                    <asp:TextBox runat="server" ID="txtAddress" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 300px; font-weight: normal; color: rgb(0, 0, 0);" ReadOnly="true"></asp:TextBox><br />
                                    <asp:TextBox runat="server" ID="txtAddress2" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 300px; font-weight: normal; color: rgb(0, 0, 0);" ReadOnly="true"></asp:TextBox>
                                    <br />
                                </td>
                                <td>
                                    Phone#(home):
                                    <asp:TextBox runat="server" ID="txtPhoneHome" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 30%;"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                        TargetControlID="txtPhoneHome" FilterType="Custom,Numbers" ValidChars="-">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                    <br />
                                    Phone#(other):
                                    <asp:TextBox runat="server" ID="txtPhoneOther" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 30%;"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                        TargetControlID="txtPhoneOther" FilterType="Custom,Numbers" ValidChars="-">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    County/Township :
                                    <asp:TextBox runat="server" ID="txtCountyTownship" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 30%;" ReadOnly="true"></asp:TextBox>
                                </td>
                                <td>
                                    Contractor :
                                    <asp:TextBox runat="server" ID="txtContractor" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 60%;" Width="170px" Text="Custom Weatherization,LLC"
                                        ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    Occupancy :
                                    <asp:CheckBox runat="server" ID="chkOccupancyHomeowner" Enabled="false" />
                                    Homeowner &nbsp; &nbsp;
                                    <asp:CheckBox runat="server" ID="chkOccupancyTenant" Enabled="false" />
                                    Tenant
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    Does rent/mortgage exceed income :
                                    <asp:CheckBox runat="server" ID="chkDoesRentMortgageExceedIncomeY" onclick="RentMortage(this.id)" />
                                    Yes &nbsp; &nbsp;
                                    <asp:CheckBox runat="server" ID="chkDoesRentMortgageExceedIncomeN" onclick="RentMortage(this.id)" />
                                    No
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    Landlord Approval :
                                    <asp:CheckBox runat="server" ID="chkLandlordApprovalY" onclick="LandlordApproval(this.id)" />
                                    Yes &nbsp; &nbsp;
                                    <asp:CheckBox runat="server" ID="chkLandlordApprovalN" onclick="LandlordApproval(this.id)" />
                                    No &nbsp; &nbsp;
                                    <asp:CheckBox runat="server" ID="chkLandlordApprovalNA" onclick="LandlordApproval(this.id)" />
                                    N/A
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    Original Job Type :
                                    <asp:CheckBox runat="server" ID="chkOriginalJobTypeBaseLoad" Enabled="false" />
                                    Baseload &nbsp; &nbsp;
                                    <asp:CheckBox runat="server" ID="chkOriginalJobTypeFullCost" Enabled="false" />
                                    Full Cost
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2>
                            Directions and Special Instructions:
                            <asp:TextBox runat="server" ID="txtDirectionNInstruction" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                font-weight: normal; color: rgb(0, 0, 0); width: 50%;"></asp:TextBox>
                        </h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="5">
                            <tr>
                                <td colspan="2">
                                    Date Assigned:
                                    <asp:TextBox runat="server" ID="txtDateAssigned" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 30%;" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    OnTrack Start Date :
                                    <asp:TextBox runat="server" ID="txtOntrackStartdate" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 30%;" MaxLength="10" Width="100px"
                                        AutoComplete="off"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="Calander" runat="server" TargetControlID="txtOntrackStartdate">
                                    </ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server"
                                        TargetControlID="txtOntrackStartdate" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td>
                                    OnTrack Payment Amount : <b>$</b>
                                    <asp:TextBox runat="server" ID="txtOntrackPayAmt" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        font-weight: normal; color: rgb(0, 0, 0); width: 30%;" ReadOnly="true" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    OnTrack Customer :
                                    <asp:CheckBox runat="server" ID="chkOnTrackCustomerY" Enabled="false" />
                                    Yes &nbsp; &nbsp;
                                    <asp:CheckBox runat="server" ID="chkOnTrackCustomerN" Enabled="false" />
                                    No
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="font-size: 18px">Seasonal Allowance for Shell Measures: </span>
                        <br />
                        <br />
                        <asp:TextBox runat="server" ID="txtSeasonalAllowanceKWH" Style="border: none; width: 50px;
                            font-weight: normal; color: Black;" Text="0" ReadOnly="true" Width="50px"></asp:TextBox>
                        KWH &nbsp; &nbsp; X &nbsp; &nbsp;
                        <asp:TextBox runat="server" ID="txtSeasonalAllowanceKWH2" Style="border: none; width: 50px;
                            font-weight: normal; color: Black;" Text="0.20" ReadOnly="true" Width="35px"></asp:TextBox>
                        Cents = $
                        <asp:TextBox runat="server" ID="txtSeasonalAllowanceCent" Style="border: none; width: 50px;
                            font-weight: normal; color: Black;" Text="0.00" ReadOnly="true" Width="55px"></asp:TextBox>
                        X &nbsp; &nbsp;
                        <asp:TextBox runat="server" ID="txtSeasonalAllowanceCent2" Style="border: none; width: 50px;
                            font-weight: normal; color: Black;" Text="1.0" ReadOnly="true" Width="30px"></asp:TextBox>
                        = &nbsp; &nbsp; $
                        <asp:TextBox runat="server" ID="txtSeasonalAllowanceCent3" Style="border: none; width: 50px;
                            font-weight: normal; color: Black;" Text="0.00" ReadOnly="true" Width="55px"></asp:TextBox>
                        + &nbsp; &nbsp; $<asp:TextBox runat="server" ID="txtSeasonalAllowanceCent4" Style="border: none;
                            width: 50px; font-weight: normal; color: Black;" Text="200" ReadOnly="true" Width="35px"></asp:TextBox>=
                        &nbsp; &nbsp; $<asp:TextBox runat="server" ID="txtSeasonalAllowanceCent5" Style="border: none;
                            width: 50px; font-weight: normal; color: Black;" Text="0.00" ReadOnly="true"
                            Width="55px"></asp:TextBox><br />
                        <br />
                        Repair Allowance (20% of seasonal) = &nbsp; &nbsp; $<asp:TextBox runat="server" ID="txtRepairAllowance"
                            Style="border: none; width: 50px; font-weight: normal; color: Black;" Text="0.00"
                            ReadOnly="true" MaxLength="9" Width="100px"></asp:TextBox>
                        &nbsp; &nbsp;Actual Allowance = $&nbsp; &nbsp;<asp:TextBox runat="server" ID="txtActualAllowance"
                            Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                            color: rgb(0, 0, 0); width: 30%;" Text="0.00" Width="100px"></asp:TextBox><ajaxToolkit:FilteredTextBoxExtender
                                ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtActualAllowance"
                                FilterType="Custom,Numbers" ValidChars=".">
                            </ajaxToolkit:FilteredTextBoxExtender>
                        <br />
                        <br />
                        Health & Safety Standard Allowance = &nbsp; &nbsp; $<asp:TextBox runat="server" ID="txtHelthSaftyAllowance"
                            Style="border: none; width: 50px; font-weight: normal; color: Black;" Text="250.00"
                            ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="5">
                            <tr>
                                <td colspan="3">
                                    <span style="font-size: 18px">Referred: </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="ChkDCEDWAP" />
                                    DCED WAP
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="chkReferredStateWeatherization" />
                                    CRISES
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="chkReferredGasUtilityWeatherization" />
                                    Gas Utility Wx
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="ChkCountyWx" />
                                    County Wx
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="ChkLIHEAP" />
                                    LIHEAP
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="ChkOnTrack" />
                                    On Track
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="ChkOperationHELP" />
                                    Operation HELP
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="ChkAct129EPowerWise" />
                                    Act129 E-Power Wise
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="ChkAct129ApplianceRebate" /><%--onclick="ReferredWeatherization(this.id)" --%>
                                    Act129 Appliance Rebate
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:CheckBox ID="ChkOtherReferred" runat="server" onclick="ReferredWeatherization(this.id)" />Other
                                    <asp:TextBox runat="server" ID="txtReferredComments" MaxLength="100" Style="border: none;
                                        border-bottom: solid 1px rgb(0, 0, 0); width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2>
                            To Be Completed by WRAP Contractor:</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="5">
                            <tr>
                                <td class="style1">
                                    Auditor:&nbsp;&nbsp;
                                    <asp:DropDownList runat="server" ID="DDLAuditor" Width="45%">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    Date Of Audit:
                                    <asp:TextBox runat="server" ID="txtDateOfAudit" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 65px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateOfAudit">
                                    </ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                        TargetControlID="txtDateOfAudit" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    Square Footage:
                                    <asp:TextBox runat="server" ID="txtSquareFootage" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                                        width: 200px; font-weight: normal; color: rgb(0, 0, 0);" onkeyup="javascript:this.value=Comma(this.value);"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                        TargetControlID="txtSquareFootage" FilterType="Custom,Numbers" ValidChars=","
                                        FilterMode="ValidChars">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                                <td>
                                Job Completed Date:
                                    <asp:TextBox runat="server" ID="txtDateJobComplete" ReadOnly="true" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 65px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDateJobComplete">
                                    </ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                        TargetControlID="txtDateJobComplete" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    If audit not completed, please indicate reason:
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table width="100%" border="0" cellspacing="5" cellpadding="5">
                                        <tr>
                                            <td>
                                                <asp:CheckBox runat="server" ID="chkAuditNotCompletedReasonMoved" onclick="AuditNotCompleted(this.id)" />
                                                Moved
                                            </td>
                                            <td>
                                                <asp:CheckBox runat="server" ID="chkAuditNotCompletedReasonNoResponse" onclick="AuditNotCompleted(this.id)" />
                                                No Response From Customer
                                            </td>
                                            <td>
                                                <asp:CheckBox runat="server" ID="chkAuditNotCompletedNoShow" onclick="AuditNotCompleted(this.id)" />
                                                No Show (Second Attempt)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30%;">
                                                <asp:CheckBox runat="server" ID="chkAuditNotCompletedSafetyHelth" onclick="AuditNotCompleted(this.id)" />
                                                Safety/Health Concerns
                                            </td>
                                            <td>
                                                <asp:CheckBox runat="server" ID="ChkContractorSafety" onclick="AuditNotCompleted(this.id)" />
                                                Contractor Safety
                                            </td>
                                            <td>
                                                <asp:CheckBox runat="server" ID="chkAuditNotCompletedOther" onclick="AuditNotCompleted(this.id)" />
                                                Other, Please Explain
                                                <asp:TextBox runat="server" ID="txtAuditNotCompletedOthere" Style="border: none;
                                                    border-bottom: solid 1px rgb(0, 0, 0); width: 160px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script type="text/javascript">

        $(function () {
            document.getElementById('Page1').classList.add("ui-selected");
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

        function RentMortage(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkDoesRentMortgageExceedIncomeN.ClientID %>').checked = false;
                document.getElementById('<%= chkDoesRentMortgageExceedIncomeY.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function LandlordApproval(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkLandlordApprovalY.ClientID %>').checked = false;
                document.getElementById('<%= chkLandlordApprovalN.ClientID %>').checked = false;
                document.getElementById('<%= chkLandlordApprovalNA.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function ReferredWeatherization(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= ChkDCEDWAP.ClientID %>').checked = false;
                document.getElementById('<%= chkReferredStateWeatherization.ClientID %>').checked = false;
                document.getElementById('<%= chkReferredGasUtilityWeatherization.ClientID %>').checked = false;
                document.getElementById('<%= ChkCountyWx.ClientID %>').checked = false;
                document.getElementById('<%= ChkLIHEAP.ClientID %>').checked = false;
                document.getElementById('<%= ChkOnTrack.ClientID %>').checked = false;
                document.getElementById('<%= ChkOperationHELP.ClientID %>').checked = false;
                document.getElementById('<%= ChkAct129EPowerWise.ClientID %>').checked = false;
                document.getElementById('<%= ChkAct129ApplianceRebate.ClientID %>').checked = false;
                document.getElementById('<%= ChkOtherReferred.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }

        function AuditNotCompleted(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkAuditNotCompletedReasonMoved.ClientID %>').checked = false;
                document.getElementById('<%= chkAuditNotCompletedReasonNoResponse.ClientID %>').checked = false;
                document.getElementById('<%= chkAuditNotCompletedNoShow.ClientID %>').checked = false;
                document.getElementById('<%= chkAuditNotCompletedSafetyHelth.ClientID %>').checked = false;
                document.getElementById('<%= chkAuditNotCompletedOther.ClientID %>').checked = false;
                document.getElementById('<%= ChkContractorSafety.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }





    </script>

    <script type="text/javascript">
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
            return x1 + x2;
        }
    </script>

    <script type="text/javascript">
        document.getElementById("Page1").setAttribute("class", "ui-selected");
    </script>

</asp:Content>
