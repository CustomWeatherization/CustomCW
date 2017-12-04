<%@ Page Language="C#" MasterPageFile="~/NewMETED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page18.aspx.cs" Inherits="METED_METED_Audit_Page16" Title="METED_Audit_Page16" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #div1 {
            float: left;
            width: 220px;
        }

        .auto-style1 {
            width: 30%;
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
        <!--main_right begin-->
        <p style="text-align: center; padding-bottom: 0; font-size: 16px">
            <strong>Air Leakage Testing</strong>
        </p>
        <p>
            <strong>Step:1</strong> Multiply # of occupants x 15 CFM=CFM needed for people(P)
            Number of Occupants:<asp:TextBox ID="txt_NumberOccupants" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 50px;"
                onkeyup="CalculateOccupant()"></asp:TextBox>
            x 15 CFM=<asp:TextBox ID="txt_TotalCFM" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 50px;"></asp:TextBox>
            Total CFM for people(P)
        </p>
        <p>
            <strong>Step:2</strong> Multiply the building volume x.35 ACH. Then divide by 60
            minutes to get CFM Natural for the Building (B)
        </p>
        <div class="newtable" style="border: 1px solid #000; height: auto;">
            <table width="100%" border="1" style="text-align: left; border: solid #CCC;">
                <tr style="text-align: center;">
                    <td>Floor (1st,2nd,etc)
                    </td>
                    <td>Width x
                    </td>
                    <td>Length x
                    </td>
                    <td>=Area (sq ft)
                    </td>
                    <td>x Ceiling Height
                    </td>
                    <td>=Volume
                    </td>
                    <td>x.35 ACH
                    </td>
                    <td>Divide by 60 mins
                    </td>
                    <td>=CFM N B
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line1_Floor" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_width" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine1_Area()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_length" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine1_Area()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_Area" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_CellHeight" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine1_Volume()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_Volume" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_Ach" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_Devide" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line1_CFM" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line2_Floor" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_width" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine2_Area()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_length" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine2_Area()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_Area" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_CellHeight" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine2_Volume()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_Volume" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_Ach" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_Devide" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line2_CFM" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line3_Floor" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_width" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine3_Area()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_length" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine3_Area()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_Area" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_CellHeight" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine3_Volume()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_Volume" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_Ach" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_Devide" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line3_CFM" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line4_Floor" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_width" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine4_Area()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_length" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine4_Area()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_Area" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_CellHeight" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                            onkeyup="CalculateLine4_Volume()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_Volume" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_Ach" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_Devide" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line4_CFM" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;
                    </td>
                    <td>&nbsp;
                    </td>
                    <td>&nbsp;
                    </td>
                    <td>&nbsp;
                    </td>
                    <td>&nbsp;
                    </td>
                    <td>&nbsp;
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line5_Ach" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                    <td style="text-align: right;">Answer B:
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line5_CFM" runat="server" Text="0" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div>
                <br />
                Number of Stories above Grade:
                <asp:DropDownList ID="DDL_storyGrade" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 180px;"
                    onchange="fillAllAutomaticField();">
                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                    <asp:ListItem Text="1 Story use 19 for N factor" Value="1"></asp:ListItem>
                    <asp:ListItem Text="1.5 Story use 16.8 for N factor" Value="2"></asp:ListItem>
                    <asp:ListItem Text="2 Story use 15.4 for N factor" Value="3"></asp:ListItem>
                    <asp:ListItem Text="2.5 Story use 14.4 for N factor" Value="4"></asp:ListItem>
                    <asp:ListItem Text="3 Story use 13.7 for N factor" Value="5"></asp:ListItem>
                </asp:DropDownList>
                Enter P or B(larger # of the 2):<asp:TextBox ID="txt_EnterPorB" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 30px;"></asp:TextBox>
                4. Multiply by height corrected N Factor:<asp:TextBox ID="txt_CorrectedFactor" runat="server"
                    Width="88px" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 27px;"></asp:TextBox>
                <br />
                <br />
            </div>
            <div>
                <div class="margindiv">
                    <table width="200" border="1" style="border: solid 1px #999; text-align: center; float: left;">
                        <tr>
                            <td width="148">Number of Stories above grade
                            </td>
                            <td width="95">N Factor
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_story_1" runat="server" Text="1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_Nfactor_19" runat="server" Text="19"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_story_1_5" runat="server" Text="1.5"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_Nfactor_16_8" runat="server" Text="16.8"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_story_2" runat="server" Text="2"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_Nfactor_15_4" runat="server" Text="15.4"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_story_2_5" runat="server" Text="2.5"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_Nfactor_14_4" runat="server" Text="14.4"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_story_3" runat="server" Text="3"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_Nfactor_13_7" runat="server" Text="13.7"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    </br>
                    <div class="tableone" style="float: left; width: 147px;">
                        <p style="float: left; margin: right 8px;">
                            N Factor (online</br> completion)
                        </p>
                        <asp:TextBox ID="txt_FactorOnline" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 45px; margin-top: 20px;"></asp:TextBox>
                    </div>
                    <div class="tableone" style="width: 234px; float: left;">
                        <b>Use drop-down above for online form </br> completion. Use table to left for paper
                            </br> completion. For paper complete Steps 3 and 4 above:</b>
                    </div>
                    <div class="tableone" align="right" style="float: left; width: 197px; margin-top: 0;">
                        <strong>Step 5.</strong> Answer<asp:TextBox ID="txt_Answer" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        <p>
                            Above Number is your target BAS</br> Multiple Above Number by .70.
                        </p>
                    </div>
                    <p style="margin-left: 5px; width: 62%; float: right; margin-top: 0; line-height: 30px;">
                        <strong>Step 6.</strong> Air sealing below this number means you MUST install mechanical
                        ventilation.
                        <asp:TextBox ID="txt_InstallVentilation" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 60px; float: right;"></asp:TextBox>
                    </p>
                </div>
                <div class="clear">
                </div>
                <div class="margindiv" style="float: left; width: 100%; border: 1px solid #000">
                    <div class="left" style="float: left; margin-right: 15px; margin-top: 10px;">
                        Target BAS
                        <asp:TextBox ID="txt_TargetBAS" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>CFM 50
                        <div class="clear">
                        </div>
                        Blower door Location pre-treatment
                        <asp:TextBox ID="txt_LocationPreTretment" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        <div class="clear">
                        </div>
                        Blower door Location post-treatment
                        <asp:TextBox ID="txt_LocationProTretment" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        <div class="clear">
                        </div>
                        <p style="vertical-align: middle; float: left; padding: 7px 6px;">
                            Other notes:
                        </p>
                        <asp:TextBox ID="txt_OtherNote" runat="server" TextMode="MultiLine" Style="height: 60px; width: 70%; margin-top: 5px;"></asp:TextBox>
                    </div>
                    <div class="right" style="float: left; width: 60%;">
                        <p>
                            Check all that apply
                        </p>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>Pre-treatment test result
                                    <asp:TextBox ID="txt_PreTretmentResult" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                </td>
                                <td>CFM 50,Basement door:<asp:RadioButton ID="rdo_BasemetDoorOpen" runat="server" GroupName="BasemetDoor" />
                                    Open<asp:RadioButton ID="rdo_BasemetDoorClose" runat="server" GroupName="BasemetDoor" />Close</br>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="right">Attic door:<asp:RadioButton ID="rdo_AtticDoorOpen" runat="server" GroupName="AtticDoor" />
                                    Open<asp:RadioButton ID="rdo_AtticDoor_Close" runat="server" GroupName="AtticDoor" />Close
                                </td>
                            </tr>
                            <tr>
                                <td>Other Door
                                    <asp:TextBox ID="txt_OtherDoor" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:RadioButton ID="rdo_OtherDoor_Open" runat="server" GroupName="OtherDoor" />
                                    Open<asp:RadioButton ID="rdo_OtherDoor_Close" runat="server" GroupName="OtherDoor" />Close
                                </td>
                            </tr>
                            <tr>
                                <td>Post-treatment test result
                                    <asp:TextBox ID="txt_PostTretment_Result" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                </td>
                                <td>CFM 50,Basement door:
                                    <asp:RadioButton ID="rdo_BasemetDoor2_Open" runat="server" GroupName="BasemetDoor2" />
                                    Open<asp:RadioButton ID="rdo_BasemetDoor2_Close" runat="server" GroupName="BasemetDoor2" />Close
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="right">Attic door:
                                    <asp:RadioButton ID="rdo_AtticDoor2_Open" runat="server" GroupName="AtticDoor2" />
                                    Open<asp:RadioButton ID="rdo_AtticDoor2_Close" runat="server" GroupName="AtticDoor2" />Close
                                </td>
                            </tr>
                            <tr>
                                <td>Other Door
                                    <asp:TextBox ID="txt_OtherDoor2" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:RadioButton ID="rdo_OtherDoor2_Open" runat="server" GroupName="OtherDoor2" />
                                    Open<asp:RadioButton ID="rdo_OtherDoor2_Close" runat="server" GroupName="OtherDoor2" />Close
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="clear">
                </div>
                <p style="padding: 2px 6px; float: left; font-style: italic">
                    If unvented combustion appliances exist, don't air seal the home below 0.5 ACH
                        CFM 50; however, always air seal the attic from the living space regardless of BAS
                        or existing CFM 50. Follow ASHRAE 62.89 and the Air Sealing Procedure in the WARM
                        Manual.
                </p>
                <div class="newtable">
                    <table width="100%" border="1" style="border: solid 1px #999999;">
                        <tr>
                            <td width="30%">&nbsp;
                            </td>
                            <td width="70%">Pressures
                                <table width="100%" border="1">
                                    <tr>
                                        <td>Thermal Boundary: In or Out?
                                        </td>
                                        <td>What was blower door set at?
                                        </td>
                                        <td>House/Zone
                                        </td>
                                        <td>Zone/Outside
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <table width="100%" border="1" style="border: solid 1px #999999;">
                            <tr style="text-align: center;">
                                <td class="auto-style1">Zones
                                </td>
                                <td width="5%">In
                                </td>
                                <td width="5%">Out
                                </td>
                                <td width="10%">Pre-Treat
                                </td>
                                <td width="10%">Final
                                </td>
                                <td width="10%">Pre-Treat
                                </td>
                                <td width="10%">Final
                                </td>
                                <td width="10%">Pre-Treat
                                </td>
                                <td width="10%">Final
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td class="auto-style1">Attic
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_Attic_In" runat="server" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_Attic_Out" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Attic_Blower_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"
                                        Height="16px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Attic_Blower_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Attic_House_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Attic_House_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Attic_Outside_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Attic_Outside_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td class="auto-style1">Basement
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_Basement_In" runat="server" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_Basement_Out" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Basement_Bolower_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Basement_Bolower_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Basement_House_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Basement_House_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Basement_Outside_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Basement_Outside_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td class="auto-style1">Vented Crawl
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_VentedCrawl_In" runat="server" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_VentedCrawl_Out" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_VentedCrawl_Blower_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_VentedCrawl_Blower_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_VentedCrawl_House_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_VentedCrawl_House_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_VentedCrawl_Outside_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_VentedCrawl_Outside_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td class="auto-style1">Attic A
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_AtticA_In" runat="server" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_AtticA_Out" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticA_Blower_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticA_Blower_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticA_House_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticA_House_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticA_Outside_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticA_Outside_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td class="auto-style1">Attic B
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_AtticB_In" runat="server" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_AtticB_Out" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticB_Blower_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticB_Blower_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticB_House_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticB_House_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticB_Outside_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AtticB_Outside_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td class="auto-style1">Kneewall A
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_KneewallA_In" runat="server" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_KneewallA_Out" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallA_Blower_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallA_Blower_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallA_House_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallA_House_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallA_Outside_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallA_Outside_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td class="auto-style1">Kneewall B
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_KneewallB_In" runat="server" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_KneewallB_Out" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallB_Blower_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallB_Blower_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallB_House_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallB_House_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallB_Outside_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_KneewallB_Outside_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td class="auto-style1">Cantilever Overhang
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_CantileverOverhang_In" runat="server" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_CantileverOverhang_Out" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CantileverOverhang_Blower_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CantileverOverhang_Blower_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CantileverOverhang_House_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CantileverOverhang_House_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CantileverOverhang_Outside_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CantileverOverhang_Outside_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>


                            </tr>
                            <tr style="text-align: center;">
                                <td class="auto-style1">Garage Attic
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_GarageAttic_In" runat="server" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_GarageAttic_Out" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_GarageAttic_Blower_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_GarageAttic_Blower_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_GarageAttic_House_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_GarageAttic_House_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_GarageAttic_Outside_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_GarageAttic_Outside_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td class="auto-style1">Garage
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_Garage_In" runat="server" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="Chk_Garage_Out" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Garage_Blower_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Garage_Blower_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Garage_House_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Garage_House_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Garage_Outside_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Garage_Outside_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                </td>
                            </tr>
                            <table width="100%" border="1" style="border: solid 1px #999999;">
                                <tr style="text-align: center;">
                                    <td class="auto-style1">Garage door Close/Open Testing</td>
                                    <td colspan="2" width="10.4%">CFM 50 OPEN</td>
                                    <td colspan="2">CFM 50 OPEN</td>
                                    <td colspan="2">CFM 50 DIFFERENCE</td>
                                    <td colspan="2">%Diff(CFM 50 diff/CFM 50CL)*100</td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td class="auto-style1">(Section 4-69)Value(Pre/Post)</td>
                                    <td>
                                        <asp:TextBox ID="txt_CFM50OPEN_In" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                      <%--  <asp:CheckBox ID="Chk_Other2_In" runat="server" />--%>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_CFM50OPEN_Out" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                       <%-- <asp:CheckBox ID="Chk_Other2_Out" runat="server" />--%>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other2_Blower_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other2_Blower_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other2_House_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other2_House_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other2_Outside_Pre" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Other2_Outside_Final" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </table>
                    </table>
                    <p style="padding: 2px 0;">
                        Pressure Pan Test Results (test at -25 Pascals) Duct leaks or disconnects observed?
                        Yes
                        <asp:RadioButton ID="rdo_DustObsver_Yes" runat="server" GroupName="DustObsver" />
                        No<asp:RadioButton ID="rdo_DustObsver_No" runat="server" GroupName="DustObsver" />
                        Existing Duct Materials:<asp:CheckBox ID="Chk_Matrial_Metal" runat="server" />
                        Metal<asp:CheckBox ID="Chk_Matrial_Ductbord" runat="server" />
                        Ductboard<asp:CheckBox ID="Chk_Matrial_Flex" runat="server" />
                        Flex
                    </p>
                    <p align="center">
                        System Type:
                        <asp:CheckBox ID="Chk_System_HeatPump" runat="server" />Heat Pump
                        <asp:CheckBox ID="Chk_CentralAir" runat="server" />Central Air Only
                        <asp:CheckBox ID="Chk_ElectricFurnuase" runat="server" />Electric Furnace
                        <asp:CheckBox ID="Chk_Other" runat="server" />Other<asp:TextBox ID="txt_SystemType_Other"
                            runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                    </p>
                </div>
                <table width="100%" border="1" style="margin-top: 0; text-align: center;">
                    <tr>
                        <td>Register
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
                            <asp:TextBox ID="txt_Room1" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Room2" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Room3" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Room4" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Room5" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Room6" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Room7" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Room8" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Reading
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>&nbsp;Post
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>&nbsp;Post
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>&nbsp;Post
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>&nbsp;Post
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>&nbsp;Post
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>&nbsp;Post
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>&nbsp;Post
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">Pre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>&nbsp;Post
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>Supply
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Supply_pre1" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Supply_pro1" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Supply_pre2" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Supply_pro2" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Supply_pre3" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Supply_pro3" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Supply_pre4" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Supply_pro4" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Supply_pre5" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Supply_pro5" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Supply_pre6" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Supply_pro6" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Supply_pre7" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Supply_pro7" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Supply_pre8" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Supply_pro8" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>Return
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Return_pre1" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Return_pro1" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Return_pre2" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Return_pro2" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Return_pre3" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Return_pro3" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Return_pre4" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Return_pro4" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Return_pre5" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Return_pro5" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Return_pre6" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Return_pro6" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Return_pre7" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Return_pro7" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="border-right: 1px solid black;">&nbsp;
                                        <asp:TextBox ID="txt_Return_pre8" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Return_pro8" runat="server" Style="border: 0; width: 100%; height: 13px; font-size: 12px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 6px;">
                    <tr>
                        <td valign="top" style="width: 10%;">
                            <p style="vertical-align: middle; float: left; display: none; padding: 7px 6px;">
                                Comment:
                            </p>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Comment" runat="server" TextMode="MultiLine" Visible="false"
                                Style="height: 60px; width: 97%;"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <p style="padding: 3px 7px;">
                    <u>Note:</u><i>Number registers by floor going away from Air Handler Unit (AHU). Register
                        #1 will always be the one closest to AHU.</i>
                </p>
            </div>
            <!--main_right end-->
            <div class="clear">
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            document.getElementById('Page18').classList.add("ui-selected");
        });

        function CalculateOccupant() {
            //For Multiply the Values and assign it to Total Coulmn
            var NoOFoccupant = document.getElementById('<%=txt_NumberOccupants.ClientID %>').value;
            if (isNaN(NoOFoccupant)) {
                NoOFoccupant = 0;
                alert('Please enter valid Occupants.');
            }
            else {
                NoOFoccupant = parseFloat(NoOFoccupant) * 15;
                //NoOFoccupant = NoOFoccupant.toFixed(2);
                if (isNaN(NoOFoccupant)) {
                    document.getElementById('<%=txt_TotalCFM.ClientID %>').value = 0;
                    CheckEnterPorB();
                }
                else {
                    document.getElementById('<%=txt_TotalCFM.ClientID %>').value = NoOFoccupant;
                    CheckEnterPorB();
                }
            }
        }

        //////////////////////////////////////////////////////////////////////////////////////////////////////////


        function CalculateLine1_Area() {
            var width = document.getElementById('<%=txt_Line1_width.ClientID %>').value;
            var length = document.getElementById('<%=txt_Line1_length.ClientID %>').value;
            var Area = document.getElementById('<%=txt_Line1_Area.ClientID %>').value;
            Area = parseFloat(width) * parseFloat(length);
            Area = Area.toFixed(2);
            if (isNaN(Area)) {
                document.getElementById('<%=txt_Line1_Area.ClientID %>').value = 0;
            }
            else {
                document.getElementById('<%=txt_Line1_Area.ClientID %>').value = Area;
            }
            CalculateLine1_Volume();
        }

        function CalculateLine1_Volume() {
            var Area = document.getElementById('<%=txt_Line1_Area.ClientID %>').value;
            var CellHeight = document.getElementById('<%=txt_Line1_CellHeight.ClientID %>').value;
            if (Area == "") {
                Area = "0";
            }
            if (CellHeight == "") {
                CellHeight = "0";
            }
            CellHeight = parseFloat(Area) * parseFloat(CellHeight);
            CellHeight = CellHeight.toFixed(2);
            if (isNaN(CellHeight)) {
                document.getElementById('<%=txt_Line1_Volume.ClientID %>').value = 0;
                document.getElementById('<%=txt_Line1_Ach.ClientID %>').value = 0;
                document.getElementById('<%=txt_Line1_CFM.ClientID %>').value = 0;
                AddAllCFMandACH();
                CheckEnterPorB();
            }
            else {
                document.getElementById('<%=txt_Line1_Volume.ClientID %>').value = CellHeight;
                var Volume = document.getElementById('<%=txt_Line1_Volume.ClientID %>').value;
                var Ach = document.getElementById('<%=txt_Line1_Ach.ClientID %>').value;
                Ach = parseFloat(Volume) * 0.35;
                Ach = Ach.toFixed(2);
                document.getElementById('<%=txt_Line1_Ach.ClientID %>').value = Ach;
                var CFM = document.getElementById('<%=txt_Line1_CFM.ClientID %>').value;

                CFM = parseFloat(Ach) / 60;
                CFM = CFM.toFixed(2);
                document.getElementById('<%=txt_Line1_CFM.ClientID %>').value = CFM;

                AddAllCFMandACH();
                CheckEnterPorB();
            }
        }


        //////////////////////////////////////////////////////////////////////////////////////////////////////////

        function CalculateLine2_Area() {
            var width = document.getElementById('<%=txt_Line2_width.ClientID %>').value;
            var length = document.getElementById('<%=txt_Line2_length.ClientID %>').value;
            var Area = document.getElementById('<%=txt_Line2_Area.ClientID %>').value;
            Area = parseFloat(width) * parseFloat(length);
            Area = Area.toFixed(2);
            if (isNaN(Area)) {
                document.getElementById('<%=txt_Line2_Area.ClientID %>').value = 0;
            }
            else {
                document.getElementById('<%=txt_Line2_Area.ClientID %>').value = Area;
            }
            CalculateLine2_Volume();
        }

        function CalculateLine2_Volume() {
            var Area = document.getElementById('<%=txt_Line2_Area.ClientID %>').value;
            var CellHeight = document.getElementById('<%=txt_Line2_CellHeight.ClientID %>').value;
            if (Area == "") {
                Area = "0";
            }
            if (CellHeight == "") {
                CellHeight = "0";
            }
            CellHeight = parseFloat(Area) * parseFloat(CellHeight);
            CellHeight = CellHeight.toFixed(2);
            if (isNaN(CellHeight)) {
                document.getElementById('<%=txt_Line2_Volume.ClientID %>').value = 0;
                document.getElementById('<%=txt_Line2_Ach.ClientID %>').value = 0;
                document.getElementById('<%=txt_Line2_CFM.ClientID %>').value = 0;
                AddAllCFMandACH();
                CheckEnterPorB();
            }
            else {
                document.getElementById('<%=txt_Line2_Volume.ClientID %>').value = CellHeight;
                var Volume = document.getElementById('<%=txt_Line2_Volume.ClientID %>').value;
                var Ach = document.getElementById('<%=txt_Line2_Ach.ClientID %>').value;
                Ach = parseFloat(Volume) * 0.35;
                Ach = Ach.toFixed(2);
                document.getElementById('<%=txt_Line2_Ach.ClientID %>').value = Ach;
                var CFM = document.getElementById('<%=txt_Line2_CFM.ClientID %>').value;
                CFM = parseFloat(Ach) / 60;
                CFM = CFM.toFixed(2);
                document.getElementById('<%=txt_Line2_CFM.ClientID %>').value = CFM;
                AddAllCFMandACH();
                CheckEnterPorB();
            }
        }


        //////////////////////////////////////////////////////////////////////////////////////////////////////////

        function CalculateLine3_Area() {
            var width = document.getElementById('<%=txt_Line3_width.ClientID %>').value;
            var length = document.getElementById('<%=txt_Line3_length.ClientID %>').value;
            var Area = document.getElementById('<%=txt_Line3_Area.ClientID %>').value;
            Area = parseFloat(width) * parseFloat(length);
            Area = Area.toFixed(2);
            if (isNaN(Area)) {
                document.getElementById('<%=txt_Line3_Area.ClientID %>').value = 0;
            }
            else {
                document.getElementById('<%=txt_Line3_Area.ClientID %>').value = Area;
            }
            CalculateLine3_Volume();
        }

        function CalculateLine3_Volume() {
            var Area = document.getElementById('<%=txt_Line3_Area.ClientID %>').value;
            var CellHeight = document.getElementById('<%=txt_Line3_CellHeight.ClientID %>').value;
            if (Area == "") {
                Area = "0";
            }
            if (CellHeight == "") {
                CellHeight = "0";
            }
            CellHeight = parseFloat(Area) * parseFloat(CellHeight);
            CellHeight = CellHeight.toFixed(2);
            if (isNaN(CellHeight)) {
                document.getElementById('<%=txt_Line3_Volume.ClientID %>').value = 0;
                document.getElementById('<%=txt_Line3_Ach.ClientID %>').value = 0;
                document.getElementById('<%=txt_Line3_CFM.ClientID %>').value = 0;
                AddAllCFMandACH();
                CheckEnterPorB();
            }
            else {
                document.getElementById('<%=txt_Line3_Volume.ClientID %>').value = CellHeight;
                var Volume = document.getElementById('<%=txt_Line3_Volume.ClientID %>').value;
                var Ach = document.getElementById('<%=txt_Line3_Ach.ClientID %>').value;
                Ach = parseFloat(Volume) * 0.35;
                Ach = Ach.toFixed(2);
                document.getElementById('<%=txt_Line3_Ach.ClientID %>').value = Ach;
                var CFM = document.getElementById('<%=txt_Line3_CFM.ClientID %>').value;
                CFM = parseFloat(Ach) / 60;
                CFM = CFM.toFixed(2);
                document.getElementById('<%=txt_Line3_CFM.ClientID %>').value = CFM;
                AddAllCFMandACH();
                CheckEnterPorB();
            }
        }


        //////////////////////////////////////////////////////////////////////////////////////////////////////////

        function CalculateLine4_Area() {
            var width = document.getElementById('<%=txt_Line4_width.ClientID %>').value;
            var length = document.getElementById('<%=txt_Line4_length.ClientID %>').value;
            var Area = document.getElementById('<%=txt_Line4_Area.ClientID %>').value;
            Area = parseFloat(width) * parseFloat(length);
            Area = Area.toFixed(2);
            if (isNaN(Area)) {
                document.getElementById('<%=txt_Line4_Area.ClientID %>').value = 0;
            }
            else {
                document.getElementById('<%=txt_Line4_Area.ClientID %>').value = Area;
            }
            CalculateLine4_Volume();
        }

        function CalculateLine4_Volume() {
            var Area = document.getElementById('<%=txt_Line4_Area.ClientID %>').value;
            var CellHeight = document.getElementById('<%=txt_Line4_CellHeight.ClientID %>').value;
            if (Area == "") {
                Area = "0";
            }
            if (CellHeight == "") {
                CellHeight = "0";
            }
            CellHeight = parseFloat(Area) * parseFloat(CellHeight);
            CellHeight = CellHeight.toFixed(2);
            if (isNaN(CellHeight)) {
                document.getElementById('<%=txt_Line4_Volume.ClientID %>').value = 0;
                document.getElementById('<%=txt_Line4_Ach.ClientID %>').value = 0;
                document.getElementById('<%=txt_Line4_CFM.ClientID %>').value = 0;
                AddAllCFMandACH();
                CheckEnterPorB();
            }
            else {
                document.getElementById('<%=txt_Line4_Volume.ClientID %>').value = CellHeight;
                var Volume = document.getElementById('<%=txt_Line4_Volume.ClientID %>').value;
                var Ach = document.getElementById('<%=txt_Line4_Ach.ClientID %>').value;
                Ach = parseFloat(Volume) * 0.35;
                Ach = Ach.toFixed(2);
                document.getElementById('<%=txt_Line4_Ach.ClientID %>').value = Ach;
                var CFM = document.getElementById('<%=txt_Line4_CFM.ClientID %>').value;
                CFM = parseFloat(Ach) / 60;
                CFM = CFM.toFixed(2);
                document.getElementById('<%=txt_Line4_CFM.ClientID %>').value = CFM;
                AddAllCFMandACH();
                CheckEnterPorB();
            }
        }


        //////////////////////////////////////////////////////////////////////////////////////////////////////////

        function CheckEnterPorB() {
            var TotalCFM = '0';
            var Line5CFM = '0';
            TotalCFM = document.getElementById('<%=txt_TotalCFM.ClientID %>').value;
            Line5CFM = document.getElementById('<%=txt_Line5_CFM.ClientID %>').value;
            if (TotalCFM == '') {
                TotalCFM = 0;
            }
            if (Line5CFM == '') {
                Line5CFM = 0;
            }
            if (parseFloat(TotalCFM) > parseFloat(Line5CFM)) {
                document.getElementById('<%=txt_EnterPorB.ClientID %>').value = TotalCFM;
            }
            else if (parseFloat(TotalCFM) < parseFloat(Line5CFM)) {
                document.getElementById('<%=txt_EnterPorB.ClientID %>').value = Line5CFM;
            }
            else {
                document.getElementById('<%=txt_EnterPorB.ClientID %>').value = 0;
            }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////

    function AddAllCFMandACH() {
        var Ach1 = document.getElementById('<%=txt_Line1_Ach.ClientID %>').value;
            if (Ach1 == "") {
                Ach1 = "0";
            }
            var Ach2 = document.getElementById('<%=txt_Line2_Ach.ClientID %>').value;
            if (Ach2 == "") {
                Ach2 = "0";
            }

            var Ach3 = document.getElementById('<%=txt_Line3_Ach.ClientID %>').value;
            if (Ach3 == "") {
                Ach3 = "0";
            }
            var Ach4 = document.getElementById('<%=txt_Line4_Ach.ClientID %>').value;
            if (Ach4 == "") {
                Ach4 = "0";
            }
            var TotalAch = parseFloat(Ach1) + parseFloat(Ach2) + parseFloat(Ach3) + parseFloat(Ach4);
            document.getElementById('<%=txt_Line5_Ach.ClientID %>').value = TotalAch.toFixed(2);


            var CFM1 = document.getElementById('<%=txt_Line1_CFM.ClientID %>').value;
            if (CFM1 == "") {
                CFM1 = "0";
            }
            var CFM2 = document.getElementById('<%=txt_Line2_CFM.ClientID %>').value;
            if (CFM2 == "") {
                CFM2 = "0";
            }
            var CFM3 = document.getElementById('<%=txt_Line3_CFM.ClientID %>').value;
            if (CFM3 == "") {
                CFM3 = "0";
            }
            var CFM4 = document.getElementById('<%=txt_Line4_CFM.ClientID %>').value;
            if (CFM4 == "") {
                CFM4 = "0";
            }
            var TotalCFM = parseFloat(CFM1) + parseFloat(CFM2) + parseFloat(CFM3) + parseFloat(CFM4);
            document.getElementById('<%=txt_Line5_CFM.ClientID %>').value = TotalCFM.toFixed(2);
            fillAllAutomaticField();
        }

        //////////////////////////////////////////////////////////////////////////////////////////////////////////

        function fillAllAutomaticField() {
            if (document.getElementById('<%=DDL_storyGrade.ClientID %>').selectedIndex == "1") {
                var NFactor = document.getElementById('<%=lbl_Nfactor_19.ClientID %>').innerHTML;
                CalculateAllAutomaticField(NFactor);
            }
            else if (document.getElementById('<%=DDL_storyGrade.ClientID %>').selectedIndex == "2") {
                var NFactor = document.getElementById('<%=lbl_Nfactor_16_8.ClientID %>').innerHTML;
                CalculateAllAutomaticField(NFactor);
            }
            else if (document.getElementById('<%=DDL_storyGrade.ClientID %>').selectedIndex == "3") {
                var NFactor = document.getElementById('<%=lbl_Nfactor_15_4.ClientID %>').innerHTML;
                CalculateAllAutomaticField(NFactor);
            }
            else if (document.getElementById('<%=DDL_storyGrade.ClientID %>').selectedIndex == "4") {
                var NFactor = document.getElementById('<%=lbl_Nfactor_14_4.ClientID %>').innerHTML;
                CalculateAllAutomaticField(NFactor);
            }
            else if (document.getElementById('<%=DDL_storyGrade.ClientID %>').selectedIndex == "5") {
                var NFactor = document.getElementById('<%=lbl_Nfactor_13_7.ClientID %>').innerHTML;
                CalculateAllAutomaticField(NFactor);
            }
            else {
                CalculateAllAutomaticField(0);
            }
}

function CalculateAllAutomaticField(NFacor) {
    document.getElementById('<%=txt_FactorOnline.ClientID %>').value = NFacor;
            document.getElementById('<%=txt_CorrectedFactor.ClientID %>').value = NFacor;
            var EnterPorB = document.getElementById('<%=txt_EnterPorB.ClientID %>').value;
            if (EnterPorB == '') {
                EnterPorB = '0';
            }
            document.getElementById('<%=txt_Answer.ClientID %>').value = (parseFloat(EnterPorB) * parseFloat(NFacor)).toFixed(2);
            var Answer = document.getElementById('<%=txt_Answer.ClientID %>').value;
            document.getElementById('<%=txt_TargetBAS.ClientID %>').value = Answer;
            document.getElementById('<%=txt_InstallVentilation.ClientID %>').value = (parseFloat(Answer) * parseFloat('0.70')).toFixed(2);
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////

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
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
    </script>

    
    <!--main div end-->
</asp:Content>
