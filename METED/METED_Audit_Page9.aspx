<%@ Page Language="C#" MasterPageFile="~/METED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page9.aspx.cs" Inherits="METED_METED_Audit_Page9" Title="METED_Audit_Page9" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            font-size: 13px;
        }
        input[type="radio"]
        {
            margin-left: 10px;
        }
        input[type="checkbox"]
        {
            margin: 0 0 10px 10px;
        }
    </style>
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        //<![CDATA[
        var theForm = document.forms['aspnetForm'];
        if (!theForm) {
            theForm = document.aspnetForm;
        }
        function __doPostBack(eventTarget, eventArgument) {
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                theForm.__EVENTTARGET.value = eventTarget;
                theForm.__EVENTARGUMENT.value = eventArgument;
                theForm.submit();
            }
        }
        //]]>
    </script>

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
        <p>
            <strong>Heat Pump Water Heater(HPWH)</strong>Once "No" is an answer to any question
            or if the customer's home is for sale, stop answering questions in this section
            and proceed to the Cooling Assessment.
        </p>
        <table width="100%" border="0" cellspacing="0" cellpadding="5">
            <tr>
                <td>
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
                <td>
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
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                    Is there adequate space to bring the HPWH into the home,down the stairs,along railing
                    etc.?
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
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                        <tr>
                            <td valign="top" style="width: 10%;">
                                Comments: &nbsp; &nbsp;
                            </td>
                            <td>
                                <%--<textarea name="" cols="" rows="" style="height: 150px; width: 97%;"></textarea>--%>
                                <asp:TextBox ID="txt_Comment" runat="server" TextMode="MultiLine" Style="height: 150px;
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
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_Date">
                        </ajaxToolkit:CalendarExtender>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script type="text/javascript">
        $(function() {
            document.getElementById('Page9').classList.add("ui-selected");
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

</asp:Content>
