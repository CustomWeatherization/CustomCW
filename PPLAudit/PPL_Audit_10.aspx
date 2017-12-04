<%@ Page Language="C#" MasterPageFile="~/PPLAudit/PPLMasterPage.master" AutoEventWireup="true"
    CodeFile="PPL_Audit_10.aspx.cs" Inherits="PPLAudit_PPL_Audit_10" Title="PPL-Audit 10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h2
        {
            font-size: 20px;
        }
        table
        {
            border: 0;
        }
        p span
        {
            font-size: 18px;
            color: #000000;
            text-decoration: underline;
        }
        table tr td span
        {
            font-size: 14px;
            font-weight: bold;
            color: #000000;
            text-decoration: underline;
        }
        .txt_name
        {
            border: none;
            border-bottom: solid 1px rgb(219, 219, 219);
            font-weight: normal;
            color: rgb(153, 153, 153);
            width: 100%;
        }
        .txt_name
        {
            border-bottom: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- form section -->
    <div class="fontbold">
        <div id="DivPrint">
            <%--<h1 class="heading_text" style="color: Red;">
                Select System Type FIRST</h1>--%>
            <h2 align="center">
                DUCT TESTING, REPAIR & SEALING FORM</h2>
            <br />
            <div class="newtable">
                <!--newtable begin-->
                <table width="100%" border="1" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="100px">
                            &nbsp; <strong><u>System Type </u></strong>
                        </td>
                        <td>
                            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td>
                                        Heat Pump:
                                        <asp:CheckBox ID="Chk_SystemType_HeatPump" runat="server" onclick="SystemType(this.id)" />
                                    </td>
                                    <td>
                                        Central Air Only
                                        <asp:CheckBox ID="Chk_SystemType_CentralAirOnly" runat="server" onclick="SystemType(this.id)" />
                                    </td>
                                    <td>
                                        Elec. Furnace
                                        <asp:CheckBox ID="Chk_SystemType_ElecFurnace" runat="server" onclick="SystemType(this.id)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        Other
                                        <asp:CheckBox ID="Chk_SystemType_Other" runat="server" onclick="SystemType(this.id)" />
                                        <asp:TextBox ID="txt_SystemType_OtherDesc" runat="server" Style="border: none; border-bottom: solid 1px rgb(219, 219, 219);
                                            width: 78%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td>
                                        <u><strong>Supply Duct Locations</strong></u>
                                    </td>
                                    <td>
                                        Basement / Walls
                                        <br />
                                        <asp:TextBox ID="txt_SupplyDuctLocation_BasementWalls" runat="server" Style="width: 80px;
                                            text-align: center; border: none; border-bottom: solid 1px rgb(219, 219, 219);"></asp:TextBox>
                                    </td>
                                    <td>
                                        Attic
                                        <br />
                                        <asp:TextBox ID="txt_SupplyDuctLocation_Attic" runat="server" Style="width: 80px;
                                            text-align: center; border: none; border-bottom: solid 1px rgb(219, 219, 219);"></asp:TextBox>
                                    </td>
                                    <td>
                                        Garage
                                        <br />
                                        <asp:TextBox ID="txt_SupplyDuctLocation_Garage" runat="server" Style="width: 80px;
                                            text-align: center; border: none; border-bottom: solid 1px rgb(219, 219, 219);"></asp:TextBox>
                                    </td>
                                    <td>
                                        Vented Crawl
                                        <br />
                                        <asp:TextBox ID="txt_SupplyDuctLocation_VentedCrawl" runat="server" Style="width: 80px;
                                            text-align: center; border: none; border-bottom: solid 1px rgb(219, 219, 219);"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" height="45">
                            &nbsp; <u><strong>Air Handler Location</strong> </u>
                            <br />
                            <asp:TextBox ID="txt_AirHandlerLocation" runat="server" Style="border: none; border-bottom: solid 1px rgb(0,0,0);
                                width: 60%; font-weight: normal; color: rgb(0,0,0);"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td>
                                        <u><strong>Duct Materials</strong></u>
                                    </td>
                                    <td>
                                        Metal
                                        <asp:CheckBox ID="chk_DuctMaterials_Metal" runat="server" />
                                    </td>
                                    <td>
                                        Duct Board
                                        <asp:CheckBox ID="chk_DuctMaterials_DuctBoard" runat="server" />
                                    </td>
                                    <td>
                                        Flex
                                        <asp:CheckBox ID="chk_DuctMaterials_Flex" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td>
                                        &nbsp; <u><strong>Filter Locations</strong></u>
                                    </td>
                                    <td>
                                        In Cabinet
                                        <asp:CheckBox ID="chk_FilterLocations_InCabinet" runat="server" onclick="FilterLocations(this.id)" />
                                    </td>
                                    <td>
                                        Ext. Slot
                                        <asp:CheckBox ID="chk_FilterLocations_ExtSlot" runat="server" onclick="FilterLocations(this.id)" />
                                    </td>
                                    <td align="right">
                                        <u><strong>Return Register Slot Covered</strong></u>
                                        <asp:CheckBox ID="chk_FilterLocations_ReturnRegisterSlotCoveredY" runat="server"
                                            onclick="ReturnRegisterSlotCovered(this.id)" />
                                        Yes
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_FilterLocations_ReturnRegisterSlotCoveredN" runat="server"
                                            onclick="ReturnRegisterSlotCovered(this.id)" />
                                        No
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" height="40">
                            &nbsp; <strong><u>Situation I:</u> Ducts are all in basement or walls and there is a
                                single or no return register</strong>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <ul>
                                <li>Re-connect accessible disconnected ducts</li>
                                <li>Support sagging ducts with wire or strap</li>
                                <li>Run the air handler fan and seal <i><b>large</b></i> supply and return leaks</li>
                                <li>If there is no return, either create one or vent basement to living space</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" height="40">
                            &nbsp; <strong><u>Situation II:</u> Ducts are all in basement or walls and there are
                                multiple return registers</strong>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <ul>
                                <li>Open basement door and depressurize house to 25 Pascals</li>
                                <li>Pressure pan all return registers and enter pressures in table</li>
                                <li>For all registers with pressure &gt; 1 Pascal, seal accessible leaks between the
                                    building cavity containing the register and exterior zones. To locate leaks, run
                                    the air handler fan and use smoke</li>
                                <li>Enter final pressure pan reading in table</li>
                                <li>Do <i><b>NOT</b></i> seal leaks in basement returns unless they are big enough to
                                    depressurize the basement at least 2 Pascals with the air handler fan</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" height="40">
                            &nbsp; <strong><u>Situation III:</u> There is duct work in exterior zones</strong>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <ul>
                                <li>If there is ductwork in the basement, open the basement door</li>
                                <li>Depressurize house to 25 Pascals abd oressure pan all supply and return registers.
                                    Enter the pressure in the table</li>
                                <li>Seal leaks between ducts/building cavities and exterior zones until all pressure
                                    pan readings are below 1 Pascal or no further sealing is practical. If leakage is
                                    sever, some drywall demolition/replacement may be justified</li>
                                <li>Enter pressure pan readings in table</li>
                            </ul>
                        </td>
                    </tr>
                </table>
                <div class="botom_tab">
                    <table width="100%" border="1" cellspacing="0" cellpadding="1">
                        <tr>
                            <td>
                                Register Number
                            </td>
                            <td>
                                #1
                            </td>
                            <td>
                                #2
                            </td>
                            <td>
                                #3
                            </td>
                            <td>
                                #4
                            </td>
                            <td>
                                #5
                            </td>
                            <td>
                                #6
                            </td>
                            <td>
                                #7
                            </td>
                            <td>
                                #8
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Room
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegisterNoRoom1" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegisterNoRoom2" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegisterNoRoom3" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegisterNoRoom4" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegisterNoRoom5" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegisterNoRoom6" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegisterNoRoom7" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegisterNoRoom8" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Read
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="51">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="51">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="51">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="51">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="52">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="52">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="52">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="52">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Supply
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_1" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_1" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_2" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_2" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_3" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_3" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_4" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_4" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_5" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_5" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_6" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_6" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_7" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_7" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_8" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_8" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Return
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_1" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_1" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_2" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_2" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_3" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_3" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_4" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_4" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_5" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_5" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_6" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_6" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_7" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_7" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_8" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_8" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Register Number
                            </td>
                            <td>
                                #9
                            </td>
                            <td>
                                #10
                            </td>
                            <td>
                                #11
                            </td>
                            <td>
                                #12
                            </td>
                            <td>
                                #13
                            </td>
                            <td>
                                #14
                            </td>
                            <td>
                                #15
                            </td>
                            <td>
                                #16
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Room
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegNo_Room9" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegNo_Room10" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegNo_Room11" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegNo_Room12" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegNo_Room13" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegNo_Room14" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegNo_Room15" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_RegNo_Room16" runat="server" Style="border: none; width: 43px;
                                    font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Read
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="51">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="51">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="51">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="51">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="52">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="52">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="52">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="52">
                                            Pre
                                        </td>
                                        <td>
                                            Post
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Supply
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_9" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_9" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_10" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_10" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_11" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_11" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_12" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_12" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_13" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_13" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_14" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_14" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_15" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_15" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Pre_16" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Supply_Post_16" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Return
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_9" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_9" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_10" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_10" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_11" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_11" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_12" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_12" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_13" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_13" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_14" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_14" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_15" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_15" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Pre_16" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_RegNo_Return_Post_16" runat="server" Style="border: none; width: 43px;
                                                font-weight: normal; color: rgb(0, 0, 0);" Width="39px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <div class="top_links" runat="server" id="TopBtnDiv">
                        <b><span id="spnFinal" runat="server" style="color: Red; font-size: medium;"></span>
                        </b>
                        <br />
                        <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" class="top_btn" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click"
                            class="top_btn" />&nbsp;&nbsp;
                        <asp:Button ID="btn_print" runat="server" Text="Print" class="top_btn" OnClientClick="ClickHereToPrintFull()" />
                    </div>
                    <br />
                    <strong><u>Note:</u> Number registers by floor going away from Air Handler Unit (AHU).
                        Register # will always be the one closest to AHU.</strong>
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
    <!--newtable end-->

    <script type="text/javascript">

        $(function() {
            document.getElementById('Page10').classList.add("ui-selected");
        });
        
    </script>

    <script type="text/ecmascript">

        function SystemType(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= Chk_SystemType_HeatPump.ClientID %>').checked = false;
                document.getElementById('<%= Chk_SystemType_CentralAirOnly.ClientID %>').checked = false;
                document.getElementById('<%= Chk_SystemType_ElecFurnace.ClientID %>').checked = false;
                document.getElementById('<%= Chk_SystemType_Other.ClientID %>').checked = false;
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


        function FilterLocations(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_FilterLocations_InCabinet.ClientID %>').checked = false;
                document.getElementById('<%= chk_FilterLocations_ExtSlot.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }


        function ReturnRegisterSlotCovered(ID) {
            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%= chk_FilterLocations_ReturnRegisterSlotCoveredY.ClientID %>').checked = false;
                document.getElementById('<%= chk_FilterLocations_ReturnRegisterSlotCoveredN.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        
    </script>

    <script type="text/javascript">
        document.getElementById("Page10").setAttribute("class", "ui-selected");   
    </script>

</asp:Content>
