<%@ Page Language="C#" MasterPageFile="~/METED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page21.aspx.cs" Inherits="METED_METED_Audit_Page21" Title="METED_Audit_Page 21" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style>
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
        <h3>
            House Air Sealing</h3>
        <div class="newtable">
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="center">
                        UI/Lin. Ft/#
                    </td>
                    <td align="center">
                        Location(s)
                    </td>
                    <td align="center">
                        Materials
                    </td>
                    <td align="center">
                        Labor Hrs
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="center">
                        <h3>
                            Doors:</h3>
                    </td>
                    <td width="10%">
                    </td>
                    <td width="10%">
                        <asp:TextBox ID="txt_Door_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_Door_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_Door_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Door_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_DoorReplace" runat="server" />
                        Replace
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_DoorReplace_Repair" runat="server" />
                        Repair
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorReplace_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorReplace_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorReplace_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorReplace_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_DoorWeatherstrip" runat="server" />
                        Weatherstrip
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorWeatherstrip_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorWeatherstrip_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorWeatherstrip_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorWeatherstrip_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorWeatherstrip_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_DoorSweep" runat="server" />
                        Sweep(s)
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorSweep_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorSweep_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorSweep_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorSweep_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorSweep_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_DoorThreshold" runat="server" />
                        Threshold(s)
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorThreshold_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorThreshold_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorThreshold_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorThreshold_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorThreshold_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_DoorSealing" runat="server" />
                        Sealing
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorSealing_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorSealing_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorSealing_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorSealing_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_DoorSealing_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <h3>
                            Windows:</h3>
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Windows_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Windows_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Windows_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Windows_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_WindowsReplace" runat="server" />
                        Replace
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_WindowsReplace_Repair" runat="server" />
                        Repair
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReplace_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReplace_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReplace_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReplace_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_WindowsReplace_BrokenGlass" runat="server" />
                        Replace broken glass
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReplace_BrokenGlass_Blank" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReplace_BrokenGlass_UI" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReplace_BrokenGlass_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReplace_BrokenGlass_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReplace_BrokenGlass_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_WindowsReglaze" runat="server" />
                        Reglaze
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReglaze_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReglaze_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReglaze_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReglaze_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsReglaze_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_WindowsWeatherstrip" runat="server" />
                        Weatherstrip
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsWeatherstrip_Blank" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsWeatherstrip_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsWeatherstrip_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsWeatherstrip_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsWeatherstrip_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_WindowsSashLock" runat="server" />
                        Sash lock(s)
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsSashLock_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsSashLock_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsSashLock_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsSashLock_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsSashLock_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_WindowsSealing" runat="server" />
                        Sealing
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsSealing_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsSealing_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsSealing_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsSealing_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_WindowsSealing_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <h3>
                            Other:</h3>
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Other_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Other_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Other_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Other_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_OtherDryerOtherVents" runat="server" />
                        Dryer/Other Vents
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherDryerOtherVents_Blank" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherDryerOtherVents_UI" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherDryerOtherVents_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherDryerOtherVents_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherDryerOtherVents_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_OtherFireplace" runat="server" />
                        Fireplace
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherFireplace_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherFireplace_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherFireplace_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherFireplace_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherFireplace_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_OtherPlumbing" runat="server" />
                        Plumbing
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherPlumbing_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherPlumbing_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherPlumbing_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherPlumbing_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherPlumbing_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_OtherElectrical" runat="server" />
                        Electrical
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherElectrical_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherElectrical_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherElectrical_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherElectrical_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherElectrical_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_OtherWall" runat="server" />
                        Walls
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherWall_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherWall_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherWall_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherWall_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherWall_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_OtherStairs" runat="server" />
                        Stairs
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherStairs_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherStairs_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherStairs_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherStairs_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherStairs_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_OtherOther" runat="server" />
                        Other
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherOther_Blank" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherOther_UI" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherOther_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherOther_Material" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_OtherOther_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <b>Attics</b> Indicate areas where air sealing is needed and/or performed:
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td align="center" width="35%">
                        Air Sealing Measures:
                    </td>
                    <td align="center" width="50%">
                        Materials
                    </td>
                    <td>
                        Labor hrs Optional
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_AirSealing_TopPlates" runat="server" />
                        Top Plates
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_TopPlates_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_TopPlates_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_AirSealing_Plumbing" runat="server" />
                        Plumbing Penetrations
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_Plumbing_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_Plumbing_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_AirSealing_Electrical" runat="server" />
                        Electrical Penetrations
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_Electrical_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_Electrical_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_AirSealing_DropCeiling" runat="server" />
                        Dropped Ceilings
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_DropCeiling_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_DropCeiling_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_AirSealing_BulkheadSoffits" runat="server" />
                        Bulkhead soffits
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_BulkheadSoffits_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_BulkheadSoffits_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_AirSealing_RecessedFixtures" runat="server" />
                        Recessed fixtures
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_RecessedFixtures_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_RecessedFixtures_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_AirSealing_Access" runat="server" />
                        Access
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_Access_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_Access_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_AirSealing_Ducts" runat="server" />
                        Ducts
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_Ducts_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_Ducts_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_AirSealing_AcHtg" runat="server" />
                        AC or htg system air handler
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_AcHtg_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_AcHtg_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_AirSealing_OpenChaseways" runat="server" />
                        Open Chaseways
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_OpenChaseways_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_OpenChaseways_LaborHr" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_AirSealing_Other" runat="server" />
                        Other
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_Other_Material" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_AirSealing_LaborHr" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td valign="top" width="10%">
                        Notes:
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txt_Comment" Height="50px" Width="97%" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script type="text/javascript">
    
     $(function() {
            document.getElementById('Page21').classList.add("ui-selected");
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
