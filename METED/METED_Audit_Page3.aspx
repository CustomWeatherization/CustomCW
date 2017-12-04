<%@ Page Language="C#" MasterPageFile="~/METED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page3.aspx.cs" Inherits="METED_METED_Audit_Page3" Title="METED Audit Page3" %>

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
            margin-left: 10px;
        }
        input[type="checkbox"]
        {
            margin: 0 0 10px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- form section -->
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
        <div class="newtable">
            <!--newtable begin-->
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
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
                        <asp:TextBox ID="txt_AreaDifficult" runat="server" Style="width: 96%; height: 130px;"
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
                        <asp:TextBox ID="txt_ApplicationProb" runat="server" Style="width: 96%; height: 130px;"
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
                        <asp:TextBox ID="txt_HighestEnergy" runat="server" Style="width: 96%; height: 80px;"
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
                        <asp:TextBox ID="txt_Expalain_HealthIssues1" runat="server" Style="width: 96%; height: 80px;"
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
        </div>
    </div>
    <!--newtable end-->

    <script type="text/javascript">
    
     $(function() {
            document.getElementById('Page3').classList.add("ui-selected");
        });
    
        function ChkBox_combustionAppliances(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_combustionAppliances_Yes.ClientID %>').checked = false;
                document.getElementById('<%=chk_combustionAppliances_No.ClientID %>').checked = false;
                document.getElementById('<%=chk_combustionAppliances_Null.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ChkBox_HealthIssues(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_HealthIssues_Yes.ClientID %>').checked = false;
                document.getElementById('<%=chk_HealthIssues_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        
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
