<%@ Page Title="" Language="C#" MasterPageFile="~/PPLAudit/PPLMasterPage.master" AutoEventWireup="true" CodeFile="PPL_Inspection.aspx.cs" Inherits="PPLAudit_PPL_Inspection" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   

    <style type="text/css">
        .ajax__calendar_container TD{ padding:0px !important; font-size:11px !important;}
        .main_right
        {
            width:99% !important;
            }
            .top_links 
            {
                margin-left: 14.5% !important;
            }
        .fontbold table td {
            padding: 3px;
        }
        
        .auto-style2 {
            font-weight: bold;
        }

        .switch {
            position: relative;
            display: block;
            vertical-align: top;
            width: 60px;
            height: 23px;
            padding: 3px;
            margin: 0 10px 0px 0;
            background: linear-gradient(to bottom, #eeeeee, #FFFFFF 25px);
            background-image: -webkit-linear-gradient(top, #eeeeee, #FFFFFF 25px);
            border-radius: 18px;
            box-shadow: inset 0 -1px white, inset 0 1px 1px rgba(0, 0, 0, 0.05);
            cursor: pointer;
        }

        .switch-input {
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0;
        }

        .switch-label {
            position: relative;
            display: block;
            height: inherit;
            font-size: 10px;
            text-transform: uppercase;
            background: #eceeef;
            border-radius: inherit;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.12), inset 0 0 2px rgba(0, 0, 0, 0.15);
        }

            .switch-label:before, .switch-label:after {
                position: absolute;
                top: 50%;
                margin-top: -.5em;
                line-height: 1;
                -webkit-transition: inherit;
                -moz-transition: inherit;
                -o-transition: inherit;
                transition: inherit;
            }

            .switch-label:before {
                content: attr(data-off);
                right: 5px;
                color: #aaaaaa;
                text-shadow: 0 1px rgba(255, 255, 255, 0.5);
            }

            .switch-label:after {
                content: attr(data-on);
                left: 8px;
                color: #FFFFFF;
                text-shadow: 0 1px rgba(0, 0, 0, 0.2);
                opacity: 0;
            }

        .switch-input:checked ~ .switch-label {
            background: #3570a0;
            border-color: #3570a0;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), inset 0 0 3px rgba(0, 0, 0, 0.2);
        }

            .switch-input:checked ~ .switch-label:before {
                opacity: 0;
            }

            .switch-input:checked ~ .switch-label:after {
                opacity: 1;
            }

        .switch-handle {
            position: absolute;
            top: 4px;
            left: 4px;
            width: 22px;
            height: 20px;
            background: linear-gradient(to bottom, #FFFFFF 40%, #f0f0f0);
            background-image: -webkit-linear-gradient(top, #FFFFFF 40%, #f0f0f0);
            border-radius: 100%;
            box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
        }

            .switch-handle:before {
                content: "";
                position: absolute;
                top: 50%;
                left: 50%;
                margin: -6px 0 0 -6px;
                width: 12px;
                height: 12px;
                background: linear-gradient(to bottom, #eeeeee, #FFFFFF);
                background-image: -webkit-linear-gradient(top, #eeeeee, #FFFFFF);
                border-radius: 6px;
                box-shadow: inset 0 1px rgba(0, 0, 0, 0.02);
            }

        .switch-input:checked ~ .switch-handle {
            left: 40px;
            box-shadow: -1px 1px 5px rgba(0, 0, 0, 0.2);
        }

        /* Transition
========================== */
        .switch-label, .switch-handle {
            transition: All 0.3s ease;
            -webkit-transition: All 0.3s ease;
            -moz-transition: All 0.3s ease;
            -o-transition: All 0.3s ease;
        }
        .style1
        {
            font-weight: bold;
            width: 299px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <%--<asp:ScriptManager ID="script" runat="server">
    </asp:ScriptManager>--%>
    <div class="top_links" runat="server" id="TopBtnDiv">
        <span id="spnFinal" runat="server" style="color: Red; font-size: medium; font-weight: bold;"></span>
        <br />
        <asp:Button ID="btnUpdate" runat="server" Text="Save" OnClick="btnUpdate_Click" class="top_btn" />&nbsp;&nbsp;
        <%--<asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click" class="top_btn" />--%>
        <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
    </div>
    <div class="fontbold">
        <div id="DivPrint">

            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        <h2>Inspection Case</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="5">
                            <tr>
                                <td class="style1">Job :
                                    <asp:TextBox runat="server" ID="txtJob" Style="border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); border-left-style: none; border-left-color: inherit; border-left-width: medium; border-right-style: none; border-right-color: inherit; border-right-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;"
                                        ReadOnly="true" Width="30%"></asp:TextBox>
                                </td>
                                <td class="auto-style2">Job Name :
                                    <asp:TextBox runat="server" ID="txtJobName" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 70%;" ReadOnly="true"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="2">Inspector Name<asp:TextBox ID="txtInspectorName" runat="server" Width="300" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 30%;"></asp:TextBox>
                                </td>

                            </tr>


                            <tr>
                                <td colspan="2">
                                <table width="33%">
                                <tr>
                                <td class="style1">Are you able to complete inspection?
                                  
                                </td>
                                <td class="auto-style2">
                                  <label class="switch">
                                        <input class="switch-input" type="checkbox" id="toggle1" runat="server" />
                                        <span class="switch-label" data-on="Yes" data-off="No"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                </td>
                                </tr>
                                </table>
                                </td>

                            </tr>


                            <tr>
                                <td class="auto-style2" colspan="2">Inspection Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <%--<asp:TextBox runat="server" ID="txtDateOfInspection" 
                                        Style="border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0); border-left-style: none; border-left-color: inherit; border-left-width: medium; border-right-style: none; border-right-color: inherit; border-right-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium; margin-left: 0px;"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateOfInspection" CssClass="" >
                                    </ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtDateOfInspection" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxToolkit:FilteredTextBoxExtender>--%>
                                   <%-- <asp:TextBox runat="server" ID="txtDateOfInspection" MaxLength="10" AutoComplete="off"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateOfInspection" >
                                    </ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtDateOfInspection" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxToolkit:FilteredTextBoxExtender>--%>
                                    
                                    
                                    <asp:TextBox ID="txtDateOfInspection" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight:lighter; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateOfInspection">
                        </ajaxToolkit:CalendarExtender>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                            TargetControlID="txtDateOfInspection" FilterType="Custom,Numbers" ValidChars="/">
                        </ajaxToolkit:FilteredTextBoxExtender>
                                </td>

                            </tr>


                            <tr>
                              <td colspan="2">
                              <table width="38%">
                              <tr>
                                <td class="style1">Are there health and safety issues to report ? </td>
                                <td class="auto-style2">
                                <label class="switch">
                                        <input class="switch-input" type="checkbox" id="toggle2" runat="server" />
                                        <span class="switch-label" data-on="Yes" data-off="No"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                </td>
                                </tr></table></td>
    
                            </tr>


                            <tr>
                                <td class="auto-style2" colspan="2">&nbsp;Health and safety issues Explanation :<br />
                                    <asp:TextBox ID="txtHealthy" runat="server" TextMode="MultiLine" Width="99%" Height="60px"></asp:TextBox>
                                </td>

                            </tr>


                            <tr>
                                <td class="auto-style2" colspan="2">&nbsp;Inspector's Observations and Action requested :<br />
                                    <asp:TextBox ID="txtObservation" runat="server" TextMode="MultiLine" Width="99%" Height="60px"></asp:TextBox>
                                </td>

                            </tr>


                            <tr>
                                <td class="style1">Do you need to report any Missed Opportunities ?
                                   
                                </td>
                                 <td class="auto-style2">
                                 <label class="switch">
                                        <input class="switch-input" type="checkbox" id="toggle3" runat="server" />
                                        <span class="switch-label" data-on="Yes" data-off="No"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                 </td>
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">&nbsp;Missed Opportunities :<br />
                                    <asp:TextBox ID="txtMissed" runat="server" TextMode="MultiLine" Width="99%" Height="60px"></asp:TextBox>
                                </td>
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">Additional Comments :<br />
                                    <asp:TextBox ID="txtAdditionalComments1" runat="server" TextMode="MultiLine" Width="99%" Height="60px"></asp:TextBox>
                                </td>
                            </tr>





                            <tr>
                                <td class="style1">Did Customer Refuse Energy Education Session ?
                                   
                                </td>
                                 <td class="auto-style2">
          
                                    <label class="switch">
                                        <input class="switch-input" type="checkbox" id="toggle4" runat="server" />
                                        <span class="switch-label" data-on="Yes" data-off="No"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                 </td>
                                
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">Session Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:TextBox runat="server" ID="txtDateOfSession" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); width: 100px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtDateOfSession_CalendarExtender" runat="server" TargetControlID="txtDateOfSession" PopupPosition="BottomRight">
                                    </ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="txtDateOfSession_FilteredTextBoxExtender" runat="server"
                                        TargetControlID="txtDateOfSession" FilterType="Custom,Numbers" ValidChars="/">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </td>
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">Employment Status :
                                     <asp:RadioButtonList ID="RBLEmploymentStatus" runat="server" Width="401px">
                                         <asp:ListItem>Fulltime Employment(35 or more hours/week)</asp:ListItem>
                                         <asp:ListItem>Halftime Employment(34 or fewer hours/week)</asp:ListItem>
                                         <asp:ListItem>Unemployed worker (Currently not employed)</asp:ListItem>
                                         <asp:ListItem>Retired</asp:ListItem>
                                         <asp:ListItem>Homemaker</asp:ListItem>
                                         <asp:ListItem>Student</asp:ListItem>
                                         <asp:ListItem>Other</asp:ListItem>
                                     </asp:RadioButtonList>
                                </td>
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">Other :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:TextBox runat="server" ID="txtEmployeeOther" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 30%;"></asp:TextBox>
                                </td>
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">Number of Residents in the dwelling under 18?
                                    
                                    <asp:TextBox runat="server" ID="txtUnder18" Style="border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); border-left-style: none; border-left-color: inherit; border-left-width: medium; border-right-style: none; border-right-color: inherit; border-right-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;"
                                        Width="70px" ></asp:TextBox>
                                </td>
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">Annual house hold Income :
                                    <asp:TextBox runat="server" ID="txtAnnualIncome" Style="border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); border-left-style: none; border-left-color: inherit; border-left-width: medium; border-right-style: none; border-right-color: inherit; border-right-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;"
                                        Width="70px"></asp:TextBox>
                                </td>
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">Primary source of supplimental fuel ?<br />
                                    <asp:RadioButtonList ID="RBLPrimarySource" runat="server">
                                        <asp:ListItem>None</asp:ListItem>
                                        <asp:ListItem>Pellet Stove</asp:ListItem>
                                        <asp:ListItem>Electric Space Heater</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                        <asp:ListItem>Fuel oil/kerosene</asp:ListItem>
                                        <asp:ListItem>Utility gas</asp:ListItem>
                                        <asp:ListItem>Bottled Gas/Propane</asp:ListItem>
                                        <asp:ListItem Value="Electric">Electric</asp:ListItem>
                                        <asp:ListItem Value="Coal">Co</asp:ListItem>
                                        <asp:ListItem Value="City steam">City steam</asp:ListItem>
                                        <asp:ListItem>Wood</asp:ListItem>
                                        <asp:ListItem>Solar</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>





                            <tr>
                              <td>
                               <table>
                               <tr>
                                <td class="style1" >Is the Customer on On Track ?
                                    
                                </td>
                                <td class="auto-style2" >
                                <label class="switch">
                                        <input class="switch-input" type="checkbox" id="toggle5" runat="server" />
                                        <span class="switch-label" data-on="Yes" data-off="No"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                </td>
                                </tr>
                                </table>
                                </td>
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">What role do you remember agreeing to on the 'Action to Save' Form :<br />
                                    <asp:TextBox ID="txtActionToSave" runat="server" TextMode="MultiLine" Width="99%" Height="60px"></asp:TextBox>
                                </td>
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">How has your Electric bill changed since Weatherization ?<br />
                                    <asp:RadioButtonList ID="RBLElectricBillChanged" runat="server">
                                        <asp:ListItem>Increased</asp:ListItem>
                                        <asp:ListItem>decreased</asp:ListItem>
                                        <asp:ListItem>Same</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">Do you know how it has changed ?<br />
                                    <asp:CheckBoxList ID="CBLHowItHasChanged" runat="server" Width="401px">
                                        <asp:ListItem>Change due to WRAP measures</asp:ListItem>
                                        <asp:ListItem>Change in condition Area</asp:ListItem>
                                        <asp:ListItem>Change in main heat fuel source</asp:ListItem>
                                        <asp:ListItem>Change in occupancy , time spend in home</asp:ListItem>
                                        <asp:ListItem>Change in supplemental fuel use</asp:ListItem>
                                        <asp:ListItem>change related to appliences</asp:ListItem>
                                        <asp:ListItem>Change as result of energy education</asp:ListItem>
                                        <asp:ListItem>No explanation</asp:ListItem>
                                        <asp:ListItem>OnTrack customer</asp:ListItem>
                                        <asp:ListItem>Temporariliy disconnected </asp:ListItem>
                                        <asp:ListItem>Weather diffrence</asp:ListItem>
                                        <asp:ListItem>N/A</asp:ListItem>
                                    </asp:CheckBoxList>
                                </td>
                            </tr>





                            <tr>
                                <td class="auto-style2" colspan="2">What further steps you can take to lower your electric bill ?<br />
                                    <asp:TextBox ID="txtFurtherSteps" runat="server" TextMode="MultiLine" Width="99%" Height="60px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="2">Additional Comments :<br />
                                    <asp:TextBox ID="txtAdditionalComments2" runat="server" TextMode="MultiLine" Width="99%" Height="60px"></asp:TextBox>
                                </td>
                            </tr>


                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script type="text/javascript">
        document.getElementById("Page1").setAttribute("class", "ui-selected");
       
        function Finalize(){
       
         $('input[type=checkbox]').attr('disabled','true');
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
