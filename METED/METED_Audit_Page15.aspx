<%@ Page Language="C#" MasterPageFile="~/METED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page15.aspx.cs" Inherits="METED_METED_Audit_Page15" Title="METED_Audit_Page15" %>

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
        <div class="newtable" style="border: 1px solid #000; height: auto;">
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td colspan="2">
                        <strong>Attic Access:</strong>
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Horizontal attic access - insulate to at least equivalent R value of surrounding
                        surfaces
                    </td>
                    <td>
                        <asp:RadioButton ID="rdo_HorizontalAttic_AlreadyDone" runat="server" GroupName="HorizontalAttic" />
                        Already done
                        <asp:RadioButton ID="rdo_HorizontalAttic_WillDo" runat="server" GroupName="HorizontalAttic" />
                        Will do &nbsp; &nbsp; Location:
                        <asp:TextBox ID="txt_HorizontalAttic_Location" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;"></asp:TextBox>
                        Weather Stripping
                        <asp:RadioButton ID="rdo_HorizontalAttic_WeatherStripping_Exist" runat="server" GroupName="HorizontalAttic_WeatherStripping" />
                        Existing
                        <asp:RadioButton ID="rdo_HorizontalAttic_WeatherStripping_add" runat="server" GroupName="HorizontalAttic_WeatherStripping" />
                        Add
                        <br />
                        <br />
                        # of accesses existing:<asp:TextBox ID="txt_HorizontalAttic_AccesExist" runat="server"
                            Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                            color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        &nbsp; &nbsp; # of accesses to be added:<asp:TextBox ID="txt_HorizontalAttic_AccesAdd"
                            runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                            color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Vertical openings - insulate to equivalent R value of surrounding surfaces
                    </td>
                    <td>
                        <asp:RadioButton ID="rdo_VerticalOpening_AlreadyDone" runat="server" GroupName="VerticalOpening" />
                        Already done
                        <asp:RadioButton ID="rdo_VerticalOpening_WillDo" runat="server" GroupName="VerticalOpening" />
                        Will do &nbsp; &nbsp; Location:
                        <asp:TextBox ID="txt_VerticalOpening_Location" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;"></asp:TextBox>
                        Weather Stripping
                        <asp:RadioButton ID="rdo_VerticalOpening_WeatherStripping_Exist" runat="server" GroupName="VerticalOpening_WeatherStripping" />
                        Existing
                        <asp:RadioButton ID="rdo_VerticalOpening_WeatherStripping_Add" runat="server" GroupName="VerticalOpening_WeatherStripping" />
                        Add
                    </td>
                </tr>
                <tr>
                    <td>
                        Pull down stairs - insulate to at least equivalent R value of surrounding surfaces
                    </td>
                    <td>
                        <asp:RadioButton ID="rdo_PullDownStairs_AlreadyDone" runat="server" GroupName="PullDownStairs" />
                        Already done
                        <asp:RadioButton ID="rdo_PullDownStairs_WillDo" runat="server" GroupName="PullDownStairs" />
                        Will do &nbsp; &nbsp; Location:
                        <asp:TextBox ID="txt_PullDownStairs_Location" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;"></asp:TextBox>
                        Weather Stripping
                        <asp:RadioButton ID="rdo_PullDownStairs_WeatherStripping_Exist" runat="server" GroupName="PullDownStairs_WeatherStripping" />
                        Existing
                        <asp:RadioButton ID="rdo_PullDownStairs_WeatherStripping_Add" runat="server" GroupName="PullDownStairs_WeatherStripping" />
                        Add
                    </td>
                </tr>
                <tr>
                    <td>
                        <i>Be sure to dam the access if it will remain operable.</i>
                    </td>
                    <td>
                        Recommended?
                        <asp:RadioButton ID="rdo_Recommended_Yes" runat="server" GroupName="Recommended" />
                        Yes
                        <asp:RadioButton ID="rdo_Recommended_No" runat="server" GroupName="Recommended" />
                        No
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <strong>Heat Producing Fixtures</strong>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Are there recessed heat producing fixtures:
                        <asp:RadioButton ID="rdo_RecessedHeatProducingFixtures_Yes" runat="server" GroupName="RecessedHeatProducingFixtures" />
                        Yes
                        <asp:RadioButton ID="rdo_RecessedHeatProducingFixtures_No" runat="server" GroupName="RecessedHeatProducingFixtures" />
                        No
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        How many recessed fixtures are there?
                        <asp:TextBox ID="txt_ManyRecessedFixtures" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        # of lights
                        <asp:TextBox ID="txt_RecessedFixtures_Light" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;"></asp:TextBox>
                        # of fans
                        <asp:TextBox ID="txt_RecessedFixtures_Fans" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        # other
                        <asp:TextBox ID="txt_RecessedFixtures_Other" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <strong>If you are going to insulate the attic floor or air seal the fixtures, please
                            continue.</strong>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        How many are IC rated?
                        <asp:TextBox ID="txt_IC_Rated" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        How many are non-IC rated?
                        <asp:TextBox ID="txt_Non_IC_Rated" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                        How many have an unknown rating?
                        <asp:TextBox ID="txt_Unknown_IC_Rated" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        How many will be dammed to protect them from insulation?<asp:TextBox ID="txt_Protect_Insulation"
                            runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                            color: rgb(0, 0, 0); width: 80px;"></asp:TextBox>
                        How many will be air sealed either with sealed dams or with air tight inserts?<asp:TextBox
                            ID="txt_AirSealed" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 80px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Will customer allow recessed light(s) to be changed out?
                        <asp:RadioButton ID="rdo_RecessedLightChange_Yes" runat="server" GroupName="RecessedLightChange" />
                        Yes
                        <asp:RadioButton ID="rdo_RecessedLightChange_No" runat="server" GroupName="RecessedLightChange" />
                        No
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        How many will be replaced with either air tight, IC rated recessed fixtures, or
                        surface mounted fixtures?
                        <asp:TextBox ID="txt_Replace_AirTightICRatedRecessedFixtures" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        How many are under the floored attic and protected with metal dam blocking or fiberglass
                        batt blocking?
                        <asp:TextBox ID="txt_HorizontalAttic_DamBlock" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 90px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <i>When complete, the recessed fixtures must not leak air into the attic and dams must
                            be able to be seen from the attic unless they are under the attic floor.</i>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Be sure to dam any chimney flues. Recommended?
                        <asp:RadioButton ID="rdo_DamChimneyFlues_Yes" runat="server" GroupName="DamChimneyFlues" />
                        Yes
                        <asp:RadioButton ID="rdo_DamChimneyFlues_No" runat="server" GroupName="DamChimneyFlues" />
                        No &nbsp; &nbsp; # of chimneys:
                        <asp:TextBox ID="txt_DamChimneyFlues" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            font-weight: normal; color: rgb(0, 0, 0); width: 80px;"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="newtable" style="border: 1px solid #000; height: auto; margin-top: 3px;">
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        <strong>Cantilever Overhangs</strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        Are there cantilever overhangs?
                        <asp:RadioButton ID="rdo_CantileverOverhangs_Yes" runat="server" GroupName="CantileverOverhangs" />
                        Yes
                        <asp:RadioButton ID="rdo_CantileverOverhangs_No" runat="server" GroupName="CantileverOverhangs" />
                        No &nbsp; &nbsp; Is the underside blocked with an impermeable air barrier?
                        <asp:RadioButton ID="rdo_ImpermeableAirBarrier_Yes" runat="server" GroupName="ImpermeableAirBarrier" />
                        Yes
                        <asp:RadioButton ID="rdo_ImpermeableAirBarrier_No" runat="server" GroupName="ImpermeableAirBarrier" />
                        No
                    </td>
                </tr>
                <tr>
                    <td>
                        Are floor joists bays blocked?
                        <asp:RadioButton ID="rdo_JoistsBaysBlocke_Yes" runat="server" GroupName="JoistsBaysBlocke" />
                        Yes
                        <asp:RadioButton ID="rdo_JoistsBaysBlocke_No" runat="server" GroupName="JoistsBaysBlocke" />
                        No &nbsp; &nbsp; If no, please block these joist bays and insulate.
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="1" cellspacing="0" cellpadding="5">
                            <tr>
                                <td align="center" width="15%">
                                    Area
                                </td>
                                <td align="center" width="15%">
                                    Location
                                </td>
                                <td align="center">
                                    Sq Ft
                                </td>
                                <td align="center" width="15%">
                                    Existing Effective R Value
                                </td>
                                <td align="center">
                                    Add R
                                </td>
                                <td align="center" width="15%">
                                    New Insulation Type
                                </td>
                                <td align="center" width="30%">
                                    Comments
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    Cantilever
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever1_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever1_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever1_ExistEffect_R" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever1_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever1_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever1_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    Cantilever
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever2_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever2_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever2_ExistEffect_R" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever2_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever2_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_Cantilever2_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    Bay Window
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_BayWindow_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_BayWindow_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_BayWindow_ExistEffect_R" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_BayWindow_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_BayWindow_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_BayWindow_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div class="newtable" style="border: 1px solid #000; height: auto;">
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        <strong>Side walls</strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        Siding Type:
                        <asp:CheckBox ID="chk_Siding_Wood" runat="server" />
                        Wood
                        <asp:CheckBox ID="chk_Siding_Asphalt" runat="server" />
                        Asphalt
                        <asp:CheckBox ID="chk_Siding_Stucco" runat="server" />
                        Stucco
                        <asp:CheckBox ID="chk_Siding_Aluminum" runat="server" />
                        Aluminum
                        <asp:CheckBox ID="chk_Siding_Vinyl" runat="server" />
                        Vinyl
                        <asp:CheckBox ID="chk_Siding_Brick" runat="server" />
                        Brick &nbsp; &nbsp; Other
                        <asp:TextBox ID="txt_Siding_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Interior Wall Material:
                        <asp:TextBox ID="txt_InteriorWallMaterial" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                            width: 79%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Can side walls be insulated?
                        <asp:RadioButton ID="rdo_SideWallInsulated_Yes" runat="server" GroupName="SideWallInsulated" />
                        Yes
                        <asp:RadioButton ID="rdo_SideWallInsulated_No" runat="server" GroupName="SideWallInsulated" />
                        No &nbsp; &nbsp; If not, why?
                        <asp:TextBox ID="txt_SideWallInsulated_IfNot" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        If yes, list the facing direction of the side walls you want to insulate &nbsp;
                        North
                        <asp:TextBox ID="txt_FaceDirection_Wall_North" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 40px;"></asp:TextBox>
                        sq ft &nbsp; South
                        <asp:TextBox ID="txt_FaceDirection_Wall_South" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 40px;"></asp:TextBox>
                        sq ft &nbsp; East
                        <asp:TextBox ID="txt_FaceDirection_Wall_East" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 40px;"></asp:TextBox>
                        sq ft &nbsp; West
                        <asp:TextBox ID="txt_FaceDirection_Wall_West" runat="server" Style="border: none;
                            border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal; color: rgb(0, 0, 0);
                            width: 40px;"></asp:TextBox>
                        &nbsp; sq ft
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="27%" valign="top">
                                    Document side wall issues such as weak
                                    <br />
                                    walls, open cavities, electrical issues, etc:
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_SideWallIssue" runat="server" Height="50px" Width="100%" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div class="newtable" style="border: 1px solid #000; height: auto;">
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                        <strong>Other Zones such as attached garage</strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        Insulation:
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="1" cellspacing="0" cellpadding="5">
                            <tr>
                                <td width="15%" align="center">
                                    Area
                                </td>
                                <td align="center">
                                    Sq Ft
                                </td>
                                <td width="15%" align="center">
                                    Existing Effective R Value
                                </td>
                                <td align="center">
                                    Add R
                                </td>
                                <td width="15%" align="center">
                                    New Insulation Type
                                </td>
                                <td width="40%" align="center">
                                    Comments
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    Garage Ceiling
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_GarageCeiling_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_GarageCeiling_ExistEffect_R" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_GarageCeiling_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_GarageCeiling_Insulation" runat="server" Style="width: 100%;
                                        border: none;"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txt_GarageCeiling_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        Is garage isolated from thermal envelope?
                        <asp:RadioButton ID="rdo_GarageIsolatedThermal_Envelope_Yes" runat="server" GroupName="GarageIsolatedThermal_Envelope" />
                        Yes
                        <asp:RadioButton ID="rdo_GarageIsolatedThermal_Envelope_No" runat="server" GroupName="GarageIsolatedThermal_Envelope" />
                        No &nbsp; &nbsp; If no, air seal &nbsp; &nbsp; Health and Safety?
                        <asp:RadioButton ID="rdo_HealthSafety_Yes" runat="server" GroupName="HealthSafety" />
                        Yes
                        <asp:RadioButton ID="rdo_HealthSafety_No" runat="server" GroupName="HealthSafety" />
                        No
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="20%">
                                    Other Zones outside Thermal and Pressure Boundaries, ie porches, bay windows
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ZonesOutsideThermal" runat="server" TextMode="MultiLine" Height="50px"
                                        Width="100%"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script type="text/javascript">

        $(function() {
            document.getElementById('Page15').classList.add("ui-selected");
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
