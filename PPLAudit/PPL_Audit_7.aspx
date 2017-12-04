<%@ Page Language="C#" MasterPageFile="~/PPLAudit/PPLMasterPage.master" AutoEventWireup="true"
    CodeFile="PPL_Audit_7.aspx.cs" Inherits="PPLAudit_PPL_Audit_7" Title="PPL Audit 7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- form section -->
    <div class="fontbold">
        <div id="DivPrint">
            <div style="margin-top: -10px; font-weight: bold;">
                <h3 align="left">
                    <u>Full Cost Section</u></h3>
                <div style="text-align: center; margin-top: -10px;">
                    <h4>
                        Full Cost Measures: Assessment Summary Form</h4>
                </div>
            </div>
            <table width="100%" border="1" style="border: 0 !important; border-spacing: 0;">
                <tr>
                    <td width="19%">
                        <h4>
                            Testing</h4>
                    </td>
                    <td width="6%">
                        <h4>
                            Yes</h4>
                    </td>
                    <td width="6%">
                        <h4>
                            No</h4>
                    </td>
                    <td width="69%">
                        <h4>
                            Explanation</h4>
                    </td>
                </tr>
                <tr>
                    <td>
                        Health & Safety/Combustion Testing
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkHealthAndSafetyCombustionCheckbox_Yes" runat="server" onclick="HealthAndSafetyCombustionCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkHealthAndSafetyCombustionCheckbox_No" runat="server" onclick="HealthAndSafetyCombustionCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtHealthAndSafetyCombustionComments" runat="server" Columns="54"
                            Style="border: none; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                            TextMode="MultiLine" MaxLength="256"></asp:TextBox>
                        <%--<textarea cols="54" style="border: none; width: 98%; font-family: Arial, Helvetica, sans-serif;">All electric heat. No combustion appliances in the home.</textarea>--%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Blower Door Depressurization
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkBlowerDoor_DepressurizationCheckbox_Yes" runat="server" onclick="BlowerDoor_DepressurizationCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkBlowerDoor_DepressurizationCheckbox_No" runat="server" onclick="BlowerDoor_DepressurizationCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtBlowerDoor_Depressurization_Comments" runat="server" Columns="54"
                            Style="border: none; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                            TextMode="MultiLine" MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Blower Door Pressurization (Contaminates)
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkBlowerDoor_Pressurization_Checkbox_Yes" runat="server" onclick="BlowerDoor_Pressurization_Checkbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkBlowerDoor_Pressurization_Checkbox_No" runat="server" onclick="BlowerDoor_Pressurization_Checkbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtBlowerDoor_Pressurization_Comments" runat="server" Columns="54"
                            Style="border: none; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                            TextMode="MultiLine" MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Zonal Pressure Diagnostics
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkZonalPressure_DiagnosticsCheckbox_Yes" runat="server" onclick="ZonalPressure_DiagnosticsCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkZonalPressure_DiagnosticsCheckbox_No" runat="server" onclick="ZonalPressure_DiagnosticsCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtZonalPressure_DiagnosticsComments" runat="server" Columns="54"
                            Rows="3" Style="border: none; width: 98%; font-family: Arial, Helvetica, sans-serif;"
                            TextMode="MultiLine" MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Ductwork Test
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkDuctworkTestCheckbox_Yes" runat="server" onclick="DuctworkTestCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkDuctworkTestCheckbox_No" runat="server" onclick="DuctworkTestCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtDuctworkTestComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Final Combustion Test
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkFinalCombustionTestCheckbox_Yes" runat="server" onclick="FinalCombustionTestCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkFinalCombustionTestCheckbox_No" runat="server" onclick="FinalCombustionTestCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtFinalCombustionTestComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4>
                            Measures (Listed by Priority)</h4>
                    </td>
                    <td>
                        <h4>
                            Yes</h4>
                    </td>
                    <td>
                        <h4>
                            No</h4>
                    </td>
                    <td>
                        <h4>
                            Explanation</h4>
                    </td>
                </tr>
                <tr>
                    <td>
                        Health & Safety
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkHealthAndSafetyCheckbox_Yes" runat="server" onclick="HealthAndSafetyCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkHealthAndSafetyCheckbox_No" runat="server" onclick="HealthAndSafetyCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtHealthAndSafetyComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Major Repairs (e.g. broken glass)
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkMajorRepairsCheckbox_Yes" runat="server" onclick="MajorRepairsCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkMajorRepairsCheckbox_No" runat="server" onclick="MajorRepairsCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtMajorRepairsComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Electric Heat Repairs
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkElectricHeatRepairsCheckbox_Yes" runat="server" onclick="ElectricHeatRepairsCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkElectricHeatRepairsCheckbox_No" runat="server" onclick="ElectricHeatRepairsCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtElectricHeatRepairsComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Attic Insulation
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkAtticInsulationCheckbox_Yes" runat="server" onclick="AtticInsulationCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkAtticInsulationCheckbox_No" runat="server" onclick="AtticInsulationCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAtticInsulationComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Seal Attic Bypasses & Chaseways
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkSealAtticBypassesCheckbox_Yes" runat="server" onclick="SealAtticBypassesCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkSealAtticBypassesCheckbox_No" runat="server" onclick="SealAtticBypassesCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtSealAtticBypassesComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Wall Insulation
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkWallInsulationCheckbox_Yes" runat="server" onclick="WallInsulationCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkWallInsulationCheckbox_No" runat="server" onclick="WallInsulationCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtWallInsulationComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Floor Insulation
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkFloorInsulationCheckbox_Yes" runat="server" onclick="FloorInsulationCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkFloorInsulationCheckbox_No" runat="server" onclick="FloorInsulationCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtFloorInsulationComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Windows & Door Measures
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkWindowAndDoorMeasuresCheckbox_Yes" runat="server" onclick="WindowAndDoorMeasuresCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkWindowAndDoorMeasuresCheckbox_No" runat="server" onclick="WindowAndDoorMeasuresCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtWindowAndDoorMeasuresComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Heating Measures
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkHeatingMeasuresCheckbox_Yes" runat="server" onclick="HeatingMeasuresCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkHeatingMeasuresCheckbox_No" runat="server" onclick="HeatingMeasuresCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtHeatingMeasuresComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Cooling Measures
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkCoolingMeasuresCheckbox_Yes" runat="server" onclick="CoolingMeasuresCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkCoolingMeasuresCheckbox_No" runat="server" onclick="CoolingMeasuresCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCoolingMeasuresComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Other
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkOtherMeasuresCheckbox_Yes" runat="server" onclick="OtherMeasuresCheckbox(this.id)" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="chkOtherMeasuresCheckbox_No" runat="server" onclick="OtherMeasuresCheckbox(this.id)" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtOtherMeasuresComments" runat="server" Columns="54" Style="border: none;
                            width: 98%; font-family: Arial, Helvetica, sans-serif;" TextMode="MultiLine"
                            MaxLength="256"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="top_links" id="TopBtnDiv" runat="server">
            <b><span id="spnFinal" runat="server" style="color: Red; font-size: medium;"></span>
            </b>
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="top_btn" />&nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                class="top_btn" />&nbsp;&nbsp;
            <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
        </div>
    </div>

    <script type="text/javascript">

        $(function() {
            document.getElementById('Page7').classList.add("ui-selected");
        });
        
    </script>

    <script type="text/javascript">
        function HealthAndSafetyCombustionCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkHealthAndSafetyCombustionCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkHealthAndSafetyCombustionCheckbox_No.ClientID %>').checked = false;
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


        function BlowerDoor_DepressurizationCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkBlowerDoor_DepressurizationCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkBlowerDoor_DepressurizationCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function BlowerDoor_Pressurization_Checkbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkBlowerDoor_Pressurization_Checkbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkBlowerDoor_Pressurization_Checkbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function ZonalPressure_DiagnosticsCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkZonalPressure_DiagnosticsCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkZonalPressure_DiagnosticsCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function DuctworkTestCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkDuctworkTestCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkDuctworkTestCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function FinalCombustionTestCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkFinalCombustionTestCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkFinalCombustionTestCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function HealthAndSafetyCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkHealthAndSafetyCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkHealthAndSafetyCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function MajorRepairsCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkMajorRepairsCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkMajorRepairsCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function ElectricHeatRepairsCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkElectricHeatRepairsCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkElectricHeatRepairsCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function AtticInsulationCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkAtticInsulationCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkAtticInsulationCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function SealAtticBypassesCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkSealAtticBypassesCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkSealAtticBypassesCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function WallInsulationCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkWallInsulationCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkWallInsulationCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function FloorInsulationCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkFloorInsulationCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkFloorInsulationCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function WindowAndDoorMeasuresCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkWindowAndDoorMeasuresCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkWindowAndDoorMeasuresCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function HeatingMeasuresCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkHeatingMeasuresCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkHeatingMeasuresCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function CoolingMeasuresCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkCoolingMeasuresCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkCoolingMeasuresCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function OtherMeasuresCheckbox(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chkOtherMeasuresCheckbox_Yes.ClientID %>').checked = false;
                document.getElementById('<%= chkOtherMeasuresCheckbox_No.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
    </script>

    <script type="text/javascript">
        document.getElementById("Page7").setAttribute("class", "ui-selected");   
    </script>

</asp:Content>
