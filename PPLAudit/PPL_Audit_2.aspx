<%@ Page Language="C#" MasterPageFile="~/PPLAudit/PPLMasterPage.master" AutoEventWireup="true"
    CodeFile="PPL_Audit_2.aspx.cs" Inherits="PPLAudit_PPL_Audit_2" Title="Audit Page 2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="fontbold">
        <div id="DivPrint">
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        <h2>
                            Client Interview:</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>
                            Ask customer to identify any of the following:</h3>
                        <br />
                        <b>Heating Systems (including unvented space heaters)</b>
                        <div class="line">
                        </div>
                        <asp:TextBox ID="txtHeatingSystemsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="100"
                            Width="800px"></asp:TextBox>
                        <asp:TextBox ID="txtHeatingSystemsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="100"
                            Width="800px"></asp:TextBox>
                        <br />
                        <br />
                        <b>Air Conditioning/Cooling Systems</b>
                        <div class="line">
                        </div>
                        <asp:TextBox ID="txtACSystemsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="100"
                            Width="800px"></asp:TextBox>
                        <asp:TextBox ID="txtACSystemsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="100"
                            Width="800px"></asp:TextBox>
                        <br />
                        <br />
                        <b>Drafts</b>
                        <div class="line">
                        </div>
                        <asp:TextBox ID="txtDraftsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="100"
                            Width="800px"></asp:TextBox>
                        <asp:TextBox ID="txtDraftsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="100"
                            Width="800px"></asp:TextBox>
                        <br />
                        <br />
                        <b>Excessively Cold Rooms</b>
                        <div class="line">
                        </div>
                        <asp:TextBox ID="txtColdRoomsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="100"
                            Width="800px"></asp:TextBox>
                        <asp:TextBox ID="txtColdRoomsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="100"
                            Width="800px"></asp:TextBox>
                        <br />
                        <br />
                        <b>Moisture Problems</b>
                        <div class="line">
                        </div>
                        <asp:TextBox ID="txtMoistureProblemsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="100"
                            Width="800px"></asp:TextBox>
                        <asp:TextBox ID="txtMoistureProblemsLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="100"
                            Width="800px"></asp:TextBox>
                        <br />
                        <br />
                        <b>Identify any special health needs or problems of the customer/family that could be
                            impacted by weatherization. (Disabilities, illness, allergies, sensitivities, etc.)</b>
                        <div class="line">
                        </div>
                        <asp:TextBox ID="txtSpecialNeedsLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="100"
                            Width="800px"></asp:TextBox>
                        <br />
                        <br />
                        <b>Other Notes</b>
                        <div class="line">
                        </div>
                        <asp:TextBox ID="txtOtherNotesLine1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="125"
                            Width="800px"></asp:TextBox>
                        <asp:TextBox ID="txtOtherNotesLine2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 98%; margin-top: 5px; font-weight: normal; color: rgb(0, 0, 0);" MaxLength="125"
                            Width="800px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>
                            After Weatherization is complete, do you expect the customer's usage to decrease?</h3>
                        <br />
                        <asp:RadioButton ID="rdoUsersIncreaseNo" runat="server" GroupName="rdoUser" Text="No"
                            onclick="Test(this);" />
                        <asp:RadioButton ID="rdoUsersIncreaseYES" runat="server" GroupName="rdoUser" Text="Yes"
                            onclick="Test(this);" />
                        <br />
                        <div id="courier" runat="server" style="display: none">
                            <br />
                            If No, please indicate the reason(s) :
                            <br />
                            <br />
                            <asp:CheckBox ID="chkWrapMessare" runat="server" />
                            Measures installed as part of WRAP will increase usage.
                            <br />
                            <br />
                            <asp:CheckBox ID="chkCustomerUsage" runat="server" />
                            Expected increase in customer's usage of electric heat (e.g. getting rid of kerosene
                            heater)
                            <br />
                            <br />
                            <asp:CheckBox ID="chkLivingSpace" runat="server" />
                            Expected increase in conditioned living space (e.g. adding rooms, finishing basement)
                            <br />
                            <br />
                            <asp:CheckBox ID="chkHouseholdOccupants" runat="server" />
                            Expected increase in household occupants
                            <br />
                            <br />
                            <asp:CheckBox ID="chkElectricAppliances" runat="server" />
                            Expected increase in electric appliances (e.g. adding a window air conditioner)
                            <br />
                            <br />
                            <asp:CheckBox ID="chkOtherIncrease" runat="server" />
                            Other. Please explain below.
                            <asp:TextBox ID="txtOtherIncreaseComments" runat="server" MaxLength="100" Style="border: none;
                                border-bottom: solid 1px rgb(0,0,0); width: 60%; font-weight: normal; color: rgb(0,0,0);"></asp:TextBox>
                            <br />
                            <br />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        Original Job Type: <u><i id="JobType" runat="server"></i></u>
                        <br />
                        Recommended Job Type:
                        <asp:CheckBox ID="chkBaseLoad" runat="server" onclick="RecommendedJobType(this.id)" />
                        BaseLoad
                        <asp:CheckBox ID="chkLowCost" runat="server" Visible="false" onclick="RecommendedJobType(this.id)" />
                        <%--Low Cost--%>
                        <asp:CheckBox ID="chkFullCost" runat="server" onclick="RecommendedJobType(this.id)" />
                        Full Cost
                        <br />
                        <br />
                        If different than Original Job Type, list reason below :
                        <asp:TextBox ID="txtDifferentReason" runat="server" MaxLength="100" Style="border: none;
                            border-bottom: solid 1px rgb(0,0,0); width: 1%; font-weight: normal; color: rgb(0,0,0);"
                            Width="1%" Visible="false"></asp:TextBox>
                        <asp:DropDownList ID="DDl_FullCotBaseLoad" runat="server" Style="display: none; width: 42%;
                            float: right; margin-top: -3px; margin-right: 20%;">
                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Home dosen't have more than 50% installed electric heat" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Home dosen't need full cost measures" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Full Cost measures intalled through other Wx program" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Health & Safety deferral" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="DDl_BaseloadFullcost" runat="server" Style="display: none;
                            width: 42%; float: right; margin-top: -3px; margin-right: 20%;">
                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Home has > 50% installed electric heat" Value="1"></asp:ListItem>
                            <asp:ListItem Text="De facto heat" Value="2"></asp:ListItem>
                            <asp:ListItem Text="High cooling usage" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2>
                            Additional Comments:</h2>
                        <asp:TextBox ID="txtAdditionalComment1" runat="server" Style="border: none; border-bottom: solid 1px rgb(0,0,0);
                            width: 100%; font-weight: normal; color: rgb(0,0,0);" MaxLength="100"></asp:TextBox><br />
                        <asp:TextBox ID="txtAdditionalComment2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0,0,0);
                            width: 100%; font-weight: normal; color: rgb(0,0,0);" MaxLength="100"></asp:TextBox><br />
                        <asp:TextBox ID="txtAdditionalComment3" runat="server" Style="border: none; border-bottom: solid 1px rgb(0,0,0);
                            width: 100%; font-weight: normal; color: rgb(0,0,0);" MaxLength="100"></asp:TextBox><br />
                        <asp:TextBox ID="txtAdditionalComment4" runat="server" Style="border: none; border-bottom: solid 1px rgb(0,0,0);
                            width: 100%; font-weight: normal; color: rgb(0,0,0);" MaxLength="100"></asp:TextBox><br />
                    </td>
                </tr>
                <tr style="display: none;">
                    <td>
                        <h2>
                            Job Status:</h2>
                        <br />
                        <asp:CheckBox ID="chkJobCompleted" runat="server" />
                        Job Completed
                        <br />
                        <br />
                        <asp:CheckBox ID="chkAdditionalMeasures" runat="server" />
                        Referred for Additional Measures Please enter reason(s) below.
                        <asp:TextBox ID="txtAdditionalMeasuresReason" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0,0,0); width: 60%; font-weight: normal; color: rgb(0,0,0);"
                            MaxLength="100"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="top_links" runat="server" id="TopBtnDiv">
            <b><span id="spnFinal" runat="server" style="color: Red; font-size: medium;"></span>
            </b>
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="top_btn" />
            &nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                class="top_btn" />&nbsp;&nbsp;
            <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
        </div>
    </div>

    <script language="JavaScript" type="text/javascript">

        $(function () {
            document.getElementById('Page2').classList.add("ui-selected");
        });

        /*<![CDATA[*/
        function Test(rad) {

            var rads = document.getElementsByName(rad.name);
            if (rads[1].checked == true) {
                document.getElementById('<%= courier.ClientID %>').style.display = 'none';
            }
            else {
                document.getElementById('<%= courier.ClientID %>').style.display = 'block';
            }

        }
        /*]]>*/

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

        function RecommendedJobType(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
                ShowDropdown(ID);
            }
            else {
                document.getElementById('<%= chkBaseLoad.ClientID %>').checked = false;
                document.getElementById('<%= chkFullCost.ClientID %>').checked = false;
                CheckBox.checked = true;
                ShowDropdown(ID);
            }
        }

        function ShowDropdown(chk) {
            var CheckBox = document.getElementById(chk);
            if (document.getElementById('<%= chkBaseLoad.ClientID %>').checked == true) {
                document.getElementById('<%= DDl_FullCotBaseLoad.ClientID %>').style.display = "block";
                document.getElementById('<%= DDl_BaseloadFullcost.ClientID %>').style.display = "none";
            }
            else if (document.getElementById('<%= chkFullCost.ClientID %>').checked == true) {
                document.getElementById('<%= DDl_BaseloadFullcost.ClientID %>').style.display = "block";
                document.getElementById('<%= DDl_FullCotBaseLoad.ClientID %>').style.display = "none";
            }
            else {
                document.getElementById('<%= DDl_BaseloadFullcost.ClientID %>').style.display = "none";
                document.getElementById('<%= DDl_FullCotBaseLoad.ClientID %>').style.display = "none";
            }
    }

    </script>

    <script type="text/javascript">
        document.getElementById("Page2").setAttribute("class", "ui-selected");
    </script>

</asp:Content>
