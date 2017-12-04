<%@ Page Title="" Language="C#" MasterPageFile="~/NewMETED/METED_Audit_MasterPage.master" AutoEventWireup="true" CodeFile="METED_Audit_Page14.aspx.cs" Inherits="NewMETED_METED_Audit_NewPage14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Welcome to Cweather</title>
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
 
        body
        {
            font-size: 13px;
        }
        input[type="radio"]
        {
            margin-left: 5px;
        }
        input[type="checkbox"]
        {
            margin: 0 0 10px 5px;
        }
        .top-heading {
        margin:3% 2% 5% 1% ;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="top_links" runat="server" id="TopBtnDiv">
        <b><span id="spnFinal" runat="server" style="color: Red; font-size: medium;"></span>
        </b>
        <br />
        <asp:Button ID="btnUpdate" runat="server" Text="Save" class="top_btn" OnClick="btnUpdate_Click" />&nbsp;&nbsp;
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" class="top_btn" OnClick="btn_cancel_Click"/>&nbsp;&nbsp;
        <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
        <%--OnClientClick="ClickHereToPrintFull()"--%>
    </div>
    <div id="DivPrint">
        <div class="newtable" style="border: 1px solid #000; height: auto; padding:15px; width: 95.5%;">
            <div class="top-heading">
                <strong>Ductless Mini-Split Heat Pump</strong> - Replacement requires FirstEnergy approval. To qualify for installation, the customer must have at least 15,000 kWh of total seasonal use and either installed electric baseboard heat, an electric furnace or electric thermal storage units as their primary heat source.<strong> If any question is answered with a "No", proceed to the next section of the audit.</strong> 
            </div> 
            
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td width="70%">
                        Is the customer a homeowner and the home is not for sale?
                      </td>
                    
                    <td width="15%">
                        <asp:RadioButtonList ID="RBL_HomeownerNotforsale" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                      
                    </td>
                </tr>
                <tr>
                    <td>
                        Does the customer currently use electric baseboard heat, an electric furnace or electric thermal storage heat units?
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RBL_ElectricUnits" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                        
                    </td>
                </tr>
                 <tr>
                    <td>
                       Does the customer understand that the heat coming from a mini-split heat pump may feel different than their current heating and is receptive to the change?
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RBL_HeatComing" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Does the customer understand that there could be weather conditions when the mini-split may not satisfy their heating needs and it should be turned off?
                    </td>
                    <td>
                         <asp:RadioButtonList ID="RBL_WeatherConditions" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Can the existing heat be used as a backup in conditions where the mini-split system will not function efficiently (extreme cold, blowing and drifting snow, etc.)?
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RBL_ExistingHeat" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Is the home's electric wiring in good condition and does the panel have room for an additional breaker?
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RBL_ElectricWiring" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Does the floor plan of the heating areas being considered allow a sufficient flow of heat to satisfy the customer's comfort needs?
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RBL_HeatingAreas" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Is there sufficient space to mount indoor components and to allow air to circulate to and from the units?
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RBL_SufficientSpace" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td>
                       Is there adequate space to install the outdoor unit in an area where it is not near sources of heat, steam or flammable gas?
                    </td>
                    <td>
                         <asp:RadioButtonList ID="RBL_AdequateSpace" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Is the customer capable of efficiently using the remote control for the unit?
                    </td>
                    <td>
                       <asp:RadioButtonList ID="RBL_RemoteControl" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Is the customer willing/capable of cleaning the interior removable filters on a monthly basis and keeping the outdoor compressor free from yard debris/leaves, snow, etc.?
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RBL_CleaningInterior" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Do you, as the auditor, firmly believe that the installation of a mini-split system will lower the customer's electric heat kWh consumption?
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RBL_AuditorBelieve" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                 
            </table>
            <div style="margin:90px 100%">
            </div>
            <div class="top-heading">
                The WARM Program auditor has explained to me how the ductless mini-split heater operates and how it can help reduce my electric usage. The auditor has also provided me with instructions on how to maintain the ductless mini-split to ensure its efficient operation. I agree to the installation of the ductless mini-split heater and I or another member of my household agrees to perform required maintenance that includes regularly changing the filters and periodically checking to make sure the outdoor compressor is free from yard debris and/or snow.
            </div>
            <div class="top-heading">
                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr>
                        <td width="70%">
                        <strong style="font-size:larger">Signature</strong>_______________________________________________________ 
                        </td>
                        <td width="30%"><strong>Date</strong>
                            <asp:TextBox ID="txt_AuditDate" runat="server" value="" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_AuditDate">
                        </ajaxToolkit:CalendarExtender>
                        <%--<ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                            TargetControlID="txt_AuditDate" FilterType="Custom,Numbers" ValidChars="/">
                        </ajaxToolkit:FilteredTextBoxExtender>--%>
                        </td>
                    </tr>
                </table>
            </div>
            
        </div>
    </div>

    <script type="text/javascript">
   

        $(function() {
            document.getElementById('Page14').classList.add("ui-selected");
        });

        function ClickHereToPrintFull() {


            var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
            disp_setting += "scrollbars=yes,width=860px, height=600px, left=50, top=25, padding=15";
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
