<%@ Page Language="C#" MasterPageFile="~/NewMETED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page1.aspx.cs" Inherits="METED_METED_Audit_Page1" Title="METED Audit Page1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        h2
        {
            font-size: 20px;
            padding-left: 20px;
        }
        body
        {
            font-size: 13px;
        }
        input[type="radio"]
        {
            margin-left: 8px;
        }
    </style>
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
        <div align="center">
            <h2>
                WARM Program Audit Form</h2>
            <p>
                <strong>
                    <%--© --%>Copyright 2007, FirstEnergy Corporation<br />
                    Permission to copy must be granted through FirstEnergy Corporation Human Services
                    Dept<br />
                    <span id="Spn_RevisedDate" runat="server">Revised Date:
                        <%--1/13/15--%><%--2/24/15--%><%--7/30/15--%>11/01/16</span> </strong>
            </p>
        </div>
        <br />
        <div class="newtable">
            <!--newtable begin-->
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
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
                                <asp:ListItem Text="Multi-Family PLUS" Value="Multi Family Plus"></asp:ListItem>
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
                        <asp:TextBox ID="txt_City" runat="server" value="" Style="border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); border-left-style: none; border-left-color: inherit; border-left-width: medium; border-right-style: none; border-right-color: inherit; border-right-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" Width="100px"></asp:TextBox>
                        &nbsp;State
                        <asp:TextBox ID="txt_State" runat="server" value="" Style="border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); border-left-style: none; border-left-color: inherit; border-left-width: medium; border-right-style: none; border-right-color: inherit; border-right-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" Width="69px"></asp:TextBox>&nbsp;Zip Code
                        <asp:TextBox ID="txt_ZipCode" runat="server" value="" Style="border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); border-left-style: none; border-left-color: inherit; border-left-width: medium; border-right-style: none; border-right-color: inherit; border-right-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" Width="69px"></asp:TextBox>
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
                        <asp:CheckBox ID="chk_BaseloadJob" runat="server" Checked="true"/>
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
                        <asp:TextBox ID="txt_Seasonal" runat="server" value="" onkeyup="javascript:this.value=Comma(this.value);"
                            onblur="Comma(this.value);" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
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
                        <asp:DropDownList runat="server" ID="DDL_Auditor_Name" Width="18%">
                        </asp:DropDownList>
                        Audit Date
                        <asp:TextBox ID="txt_AuditDate" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_AuditDate">
                        </ajaxToolkit:CalendarExtender>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                            TargetControlID="txt_AuditDate" FilterType="Custom,Numbers" ValidChars="/">
                        </ajaxToolkit:FilteredTextBoxExtender>
                        Job Complete Date:
                        <asp:TextBox ID="txt_JobCompleteDate" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;" ReadOnly="true" ></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="Calander" runat="server" TargetControlID="txt_JobCompleteDate">
                        </ajaxToolkit:CalendarExtender>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server"
                            TargetControlID="txt_JobCompleteDate" FilterType="Custom,Numbers" ValidChars="/">
                        </ajaxToolkit:FilteredTextBoxExtender>
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
                            border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        State Weatherization $:
                        <asp:TextBox ID="txt_StateWeather" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);" onkeyup="javascript:this.value=Comma(this.value);"
                            onblur="Comma(this.value);"></asp:TextBox>
                    </td>
                    <td>
                        Winter Seasonal kWh:
                        <asp:TextBox ID="txt_WinterSeasonal" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
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
                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);" onkeyup="javascript:this.value=Comma(this.value);"
                            onblur="Comma(this.value);"></asp:TextBox>
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
                        <asp:TextBox ID="txt_OtherProgram" runat="server" value="" onkeyup="javascript:this.value=Comma(this.value);"
                            onblur="Comma(this.value);" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Landlord Name:
                        <asp:TextBox ID="txt_Landlord_Name" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        Landlord Phone:
                        <asp:TextBox ID="txt_Landlord_Phone" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
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
                                    <%-- <asp:RadioButton ID="rdo_PCAP_Qualification_Yes" runat="server" GroupName="CustomerPCAP" />Yes
                                    <asp:RadioButton ID="rdo_PCAP_Qualification_No" runat="server" GroupName="CustomerPCAP" />No--%>
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
                        <asp:TextBox ID="txt_Household_Income" runat="server" value="" onkeyup="javascript:this.value=Comma(this.value);"
                            onblur="Comma(this.value);" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        <small>PER YEAR</small>
                    </td>
                    <td align="right">
                        Date Verified:
                        <asp:TextBox ID="txt_Date_Verifi" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txt_Date_Verifi">
                        </ajaxToolkit:CalendarExtender>
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
                <!--New Part-->
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
                <!--End New Part-->
                <tr>
                    <td colspan="2" align="center">
                        <h4>
                            Refer to Procedures Manual for "Preparing for an Audit" Document
                            <br />
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
                        1.&nbsp;<span id="spn_memberpresent" runat="server" visible="false">Name of household
                            member present at audit:</span><span id="spn_Personpresent" runat="server" visible="false">Person
                                present at audit:</span>
                        <asp:TextBox ID="txt_PersonPresent" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        2.&nbsp;Relationship to customer:
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
                        3.&nbsp;Customer's Date of Birth:
                        <asp:TextBox ID="txt_Customer_DateOfBirth" runat="server" value="" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td colspan="2" style="width: 100%; text-align: left">
                        4.&nbsp;Ethnic Origin
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

    <script type="text/javascript">
        $(function() {
            document.getElementById('Page1').classList.add("ui-selected");
        });
    </script>

    <script type="text/javascript">
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
    </script>

    <!--newtable end-->
</asp:Content>
