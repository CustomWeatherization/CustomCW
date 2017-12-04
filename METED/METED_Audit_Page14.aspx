<%@ Page Language="C#" MasterPageFile="~/METED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page14.aspx.cs" Inherits="METED_METED_Audit_Page14" Title="METED_Audit_Page14" %>

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
        <strong>Basement/Crawl Spaces/Mobile Home Belly</strong>
        <br />
        <br />
        <div class="newtable" style="border: 1px solid #000; height: auto;">
            <strong>Basement Air Sealing:</strong>
            <br />
            <br />
            <asp:CheckBox ID="chk_BasementAirSealing_Perimeter" runat="server" onclick="ChkBox_BasementAirSealing(this.id)" />
            Perimeter (doors, windows, rim joist, walls)
            <asp:CheckBox ID="chk_BasementAirSealing_Ceiling" runat="server" onclick="ChkBox_BasementAirSealing(this.id)" />
            Ceiling
            <asp:CheckBox ID="chk_BasementAirSealing_Ducts" runat="server" onclick="ChkBox_BasementAirSealing(this.id)" />
            Ducts
            <asp:CheckBox ID="chk_BasementAirSealing_Other" runat="server" onclick="ChkBox_BasementAirSealing(this.id)" />
            Other
            <asp:TextBox ID="txt_BasementAirSealing_Other" runat="server" Style="border: none;
                border-bottom: solid 1px rgb(0, 0, 0); width: 30%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
            <br />
            <br />
            Decide if the basement and/or crawl space is inside/outside the thermal and pressure
            boundaries. Then decide if air sealing/insulation should be at the basement and/or
            crawl space perimeter or at ceiling.
            <br />
            <strong>Insulation:</strong>
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td align="center">
                        Area
                    </td>
                    <td align="center">
                        Location
                    </td>
                    <td align="center">
                        Sq Ft
                    </td>
                    <td align="center">
                        Existing Effective R Value
                    </td>
                    <td align="center">
                        Add R
                    </td>
                    <td align="center">
                        New Insulation Type
                    </td>
                    <td align="center">
                        Comments (such as joists running lengthwise or widthwise - 16" or 24" joist bay
                        size)
                    </td>
                </tr>
                <tr>
                    <td align="center" width="12%">
                        Floor/Crawl Space
                    </td>
                    <td width="14%">
                        <asp:TextBox ID="txt_FloorCrawlSpace_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td width="7%">
                        <asp:TextBox ID="txt_FloorCrawlSpace_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td width="14%">
                        <asp:TextBox ID="txt_FloorCrawlSpace_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td width="7%">
                        <asp:TextBox ID="txt_FloorCrawlSpace_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td width="15%">
                        <asp:TextBox ID="txt_FloorCrawlSpace_Insulation" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FloorCrawlSpace_Comment" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Perimeter
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Perimeter_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Perimeter_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Perimeter_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Perimeter_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Perimeter_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Perimeter_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Other
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Other_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Other_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Other_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Other_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Other_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Other_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Belly
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Belly_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Belly_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Belly_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Belly_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Belly_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Belly_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            Install ground cover:
            <asp:RadioButton ID="rdo_GroundCover_Yes" runat="server" GroupName="GroundCover" />
            Yes
            <asp:RadioButton ID="rdo_GroundCover_No" runat="server" GroupName="GroundCover" />
            No &nbsp; &nbsp; If so, sq ft installed:<asp:TextBox ID="txt_GroundCover_SqFt_Instal"
                runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0); font-weight: normal;
                color: rgb(0, 0, 0); width: 90px;"></asp:TextBox>
            <br />
            <br />
        </div>
        <strong>Are there any kneewalls?</strong>
        <asp:RadioButton ID="rdo_AnyKneewall_Yes" runat="server" GroupName="AnyKneewall" />
        Yes
        <asp:RadioButton ID="rdo_AnyKneewall_No" runat="server" GroupName="AnyKneewall" />
        No &nbsp; &nbsp; <strong>Are they air sealed or blocked at the joist bays?</strong>
        <asp:RadioButton ID="rdo_JoistBays_Yes" runat="server" GroupName="JoistBays" />
        Yes
        <asp:RadioButton ID="rdo_JoistBays_No" runat="server" GroupName="JoistBays" />
        No &nbsp; &nbsp; <strong>If not, please block them!</strong>
        <br />
        <br />
        <strong>Insulation:</strong>
        <asp:CheckBox ID="chk_Insulation_Heating" runat="server" onclick="ChkBox_Insulation(this.id)" />
        Heating
        <asp:CheckBox ID="chk_Insulation_Cooling" runat="server" onclick="ChkBox_Insulation(this.id)" />
        Cooling
        <div class="newtable">
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td align="center">
                        Area
                    </td>
                    <td align="center">
                        Location
                    </td>
                    <td align="center">
                        Sq Ft
                    </td>
                    <td align="center">
                        Existing Effective R Value
                    </td>
                    <td align="center">
                        Add R
                    </td>
                    <td align="center">
                        New Insulation Type
                    </td>
                    <td align="center">
                        Comments
                    </td>
                </tr>
                <tr>
                    <td align="center" width="12%">
                        Unfloored Attic 1
                    </td>
                    <td width="14%">
                        <asp:TextBox ID="txt_UnflooredAttic1_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td width="7%">
                        <asp:TextBox ID="txt_UnflooredAttic1_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td width="15%">
                        <asp:TextBox ID="txt_UnflooredAttic1_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td width="7%">
                        <asp:TextBox ID="txt_UnflooredAttic1_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td width="14%">
                        <asp:TextBox ID="txt_UnflooredAttic1_Insulation" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic1_Comment" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Unfloored Attic 2
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic2_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic2_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic2_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic2_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic2_Insulation" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic2_Comment" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Unfloored Attic 3
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic3_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic3_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic3_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic3_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic3_Insulation" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_UnflooredAttic3_Comment" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Floored Attic 1
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic1_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic1_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic1_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic1_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic1_Insulation" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic1_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Floored Attic 2
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic2_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic2_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic2_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic2_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic2_Insulation" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FlooredAttic2_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Cathedral
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Cathedral_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Cathedral_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Cathedral_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Cathedral_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Cathedral_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Cathedral_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Finished Attic
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FinishedAttic_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FinishedAttic_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FinishedAttic_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FinishedAttic_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FinishedAttic_Insulation" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_FinishedAttic_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Kneewall Floored
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallFloored_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallFloored_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallFloored_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallFloored_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallFloored_Insulation" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallFloored_Comment" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Kneewall Unfloored
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallUnfloored_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallUnfloored_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallUnfloored_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallUnfloored_Add_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallUnfloored_Insulation" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_KneewallUnfloored_Comment" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Slopes
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Slope_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Slope_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Slope_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Slope_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Slope_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Slope_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Vertical Kneewall
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall_Insulation" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall_Comment" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Vertical Kneewall
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall2_Location" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall2_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall2_ExistEffect_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall2_Add_R" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall2_Insulation" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_VerticalKneewall2_Comment" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Area1" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area1_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area1_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area1_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area1_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area1_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area1_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Area2" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area2_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area2_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area2_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area2_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area2_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area2_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Area3" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area3_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area3_SqFt" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area3_ExistEffect_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area3_Add_R" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area3_Insulation" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Area3_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <p>
                <strong>Attic Ventilation</strong></p>
            <table width="100%" border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td align="center">
                        Ventilation Type
                    </td>
                    <td align="center">
                        Proposed Additional Ventilation
                    </td>
                    <td align="center">
                        Location
                    </td>
                    <td align="center">
                        Comments
                    </td>
                </tr>
                <tr>
                    <td align="center" width="25%">
                        Roof Vent
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_RoofVent_PropeseAddVent" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td width="25%">
                        <asp:TextBox ID="txt_RoofVent_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_RoofVent_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Gable Vent
                    </td>
                    <td>
                        <asp:TextBox ID="txt_GableVent_PropeseAddVent" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_GableVent_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_GableVent_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Soffit Vent
                    </td>
                    <td>
                        <asp:TextBox ID="txt_SoffitVent_ProposeAddVent" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_SoffitVent_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_SoffitVent_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Ridge Vent
                    </td>
                    <td>
                        <asp:TextBox ID="txt_RidgeVent_ProposeAddVent" runat="server" Style="width: 100%;
                            border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_RidgeVent_Location" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_RidgeVent_Comment" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top" style="width: 10%;">
                    Comments: &nbsp; &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txt_Comment" runat="server" Height="60px" Width="97%" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
    
     $(function() {
            document.getElementById('Page14').classList.add("ui-selected");
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
        
        function ChkBox_BasementAirSealing(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_BasementAirSealing_Perimeter.ClientID %>').checked = false;
                document.getElementById('<%=chk_BasementAirSealing_Ceiling.ClientID %>').checked = false;
                document.getElementById('<%=chk_BasementAirSealing_Ducts.ClientID %>').checked = false;
                document.getElementById('<%=chk_BasementAirSealing_Other.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
        function ChkBox_Insulation(ID) {

            var CheckBox = document.getElementById(ID);
            if (!CheckBox.checked) {
                CheckBox.checked = false;
            }
            else {
                document.getElementById('<%=chk_Insulation_Heating.ClientID %>').checked = false;
                document.getElementById('<%=chk_Insulation_Cooling.ClientID %>').checked = false;
                CheckBox.checked = true;
            }
        }
    </script>

</asp:Content>
