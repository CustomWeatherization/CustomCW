<%@ Page Title="" Language="C#" MasterPageFile="~/NewMETED/METED_Audit_MasterPage.master" AutoEventWireup="true" CodeFile="METED_Audit_Page5.aspx.cs" Inherits="NewMETED_METED_Audit_NewPage5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        
        #tblmy{ border-right:1px solid #000;
                border-left:1px solid #000;
                border-bottom:1px solid #000;
                }
        #tblmy tr td
        {        
           
            border:0 !important;
            border-right:0 !important;
            }
             
        h2 {
            font-size: 20px;
            padding-left: 20px;
        }

        body {
            font-size: 13px;
        }

        input[type="radio"] {
            margin-left: 10px;
        }

        input[type="checkbox"] {
            margin: 0 0 10px 10px;
        }

        .newtable table {
            border: 0 none;
        }

            .newtable table tr td {
                border: 1px solid #999999;
            }

            .newtable table tr th {
                border: 1px solid #999999;
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
             <div style="width:100%;">
                   <div style="width:40%; float:left;margin-top: 16px;"><strong >Replacement Wattage</strong></div>
                 <div style="width:60%; float:left;"> <h3><u>LED Bulbs</u></h3></div>
                 
                
             </div>
            
           
             
       
 
        <p style="text-align: center;">
            <%--<h3> Note: All measures are required to be installed by the contractor.</h3>--%>
        </p>
        <!-- form section -->
        <div class="newtable">
            <table>
                <tr>
                    <td style="width: 40px"></td>
                    <td style="width: 40px">
                        <b>LE 1</b>
                    </td>
                    <td style="width: 40px">
                        <b>LE 2</b>
                    </td>
                    <td style="width: 40px">
                        <b>LE 3</b>
                    </td>
                    <td style="width: 40px">
                        <b>LE 4</b>
                    </td>
                    <td style="width: 80px">
                        <b>LE 5</b>
                    </td>
                    <td style="width: 40px">
                        <b>LE 6</b>
                    </td>
                    <td style="width: 40px">
                        <b>LE 7</b>
                    </td>
                    <td style="width: 40px">
                        <b>LE 8</b>
                    </td>
                    <td style="width: 40px">
                        <b>LE 9</b>
                    </td>
                    <td>
                        <b></b>
                    </td>
                </tr>
                <tr>

                    <td style="width: 40px">
                        <b>Total</b>
                    </td>
                    <td style="width: 40px">
                        <b>6-8 Standard</b>
                    </td>
                    <td style="width: 40px">
                        <b>9-13 Standard</b>
                    </td>
                    <td style="width: 40px">
                        <b>8 Flood</b>
                    </td>
                    <td style="width: 40px">
                        <b>13 - 14 Flood</b>
                    </td>
                    <td style="width: 40px">
                        <b>17 Flood</b>
                    </td>
                    <td style="width: 40px">
                        <b>3.7 - 4.8 Candelabra</b>
                    </td>
                    <td style="width: 40px">
                        <b>2.3 Globe</b>
                    </td>
                    <td style="width: 80px">
                        <b>3.5 Med-Base Torpedo</b>
                    </td>
                    <td style="width: 40px">
                        <b>Retrofit Kit</b>
                    </td>


                    <td>
                        <b>Location</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line1_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line1_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line1_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line1_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line1_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line1_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line1_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line1_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line1_35MidBase" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line1_RetroKit" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox ID="txt_Line1_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line2_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line2_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line2_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line2_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line2_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line2_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line2_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line2_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line2_35MedBase" runat="server" />
                    </td>


                    <td>
                        <asp:CheckBox ID="Chk_Line2_RetroKit" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox ID="txt_Line2_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line3_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line3_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line3_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line3_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line3_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line3_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line3_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line3_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line3_35MedBase" runat="server" />
                    </td>


                    <td>
                        <asp:CheckBox ID="Chk_Line3_RetroKit" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox ID="txt_Line3_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line4_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line4_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line4_913Standard" runat="server" />
                    </td>

                    <td>
                        <asp:CheckBox ID="Chk_Line4_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line4_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line4_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line4_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line4_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line4_35MedBase" runat="server" />
                    </td>



                    <td>
                        <asp:CheckBox ID="Chk_Line4_RetroKit" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox ID="txt_Line4_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line5_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line5_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line5_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line5_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line5_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line5_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line5_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line5_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line5_35MedBase" runat="server" />
                    </td>

                    <td>
                        <asp:CheckBox ID="Chk_Line5_RetroKit" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox ID="txt_Line5_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line6_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line6_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line6_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line6_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line6_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line6_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line6_Candelabra" runat="server" />
                    </td>
                    <td>

                        <asp:CheckBox ID="Chk_Line6_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line6_35MedBase" runat="server" />
                    </td>


                    <td>
                        <asp:CheckBox ID="Chk_Line6_RetroKit" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox ID="txt_Line6_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line7_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line7_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line7_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line7_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line7_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line7_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line7_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line7_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line7_35MedBase" runat="server" />
                    </td>


                    <td>
                        <asp:CheckBox ID="Chk_Line7_RetroKit" runat="server" />
                    </td>


                    <td>
                        <asp:TextBox ID="txt_Line7_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line8_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line8_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line8_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line8_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line8_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line8_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line8_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line8_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line8_35MedBase" runat="server" />
                    </td>

                    <td>
                        <asp:CheckBox ID="Chk_Line8_RetroKit" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox ID="txt_Line8_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line9_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line9_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line9_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line9_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line9_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line9_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line9_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line9_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line9_35MedBase" runat="server" />
                    </td>


                    <td>
                        <asp:CheckBox ID="Chk_Line9_RetroKit" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line9_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line10_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line10_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line10_913Standard" runat="server" />
                    </td>

                    <td>
                        <asp:CheckBox ID="Chk_Line10_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line10_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line10_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line10_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line10_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line10_35MedBase" runat="server" />
                    </td>


                    <td>
                        <asp:CheckBox ID="Chk_Line10_RetroKit" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox ID="txt_Line10_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line11_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line11_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line11_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line11_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line11_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line11_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line11_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line11_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line11_35MedBase" runat="server" />
                    </td>



                    <td>
                        <asp:CheckBox ID="Chk_Line11_RetroKit" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Line11_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line12_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line12_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line12_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line12_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line12_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line12_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line12_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line12_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line12_35MedBase" runat="server" />
                    </td>


                    <td>
                        <asp:CheckBox ID="Chk_Line12_RetroKit" runat="server" />
                    </td>


                    <td>
                        <asp:TextBox ID="txt_Line12_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line13_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line13_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line13_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line13_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line13_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line13_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line13_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line13_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line13_35MedBase" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line13_RetroKit" runat="server" />
                    </td>


                    <td>
                        <asp:TextBox ID="txt_Line13_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_Line14_Total" runat="server" Style="width: 100%; border: none;"
                            onkeyup="AddLedBulbs()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line14_68Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line14_913Standard" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line14_8Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line14_13Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line14_17Flood" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line14_Candelabra" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line14_23Globe" runat="server" />
                    </td>
                    <td>
                        <asp:CheckBox ID="Chk_Line14_35MedBase" runat="server" />
                    </td>


                    <td>
                        <asp:CheckBox ID="Chk_Line14_RetroKit" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox ID="txt_Line14_Location_LedBlub" runat="server" Style="width: 100%; border: none;"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            Number of LED Bulbs Installed:<asp:TextBox ID="txt_TotalLedInstallBulb" runat="server"
                Style="border: none; border: solid 1px rgb(0, 0, 0); width: 40px; text-align: center; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
            <br />
      

            <p style="text-align: center;">
                <b>LED Night Lights - Smart Power Strips - Furnace Whistles - CO Alarms </b>
            </p>
            <br />
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr style="text-align:center;">
                    <td width="75%" style="border:0; text-align:center">
                        <%--border: 1px Solid; --%>
                        <br />
                        <a><strong> Installed Furnace Filter Whistle?</strong></a>
                        <asp:RadioButton ID="rdo_FilterWhistle_Yes" runat="server" GroupName="FilterWhistle" />
                        Yes
                        <asp:RadioButton ID="rdo_FilterWhistle_No" runat="server" GroupName="FilterWhistle" />
                        No
                        <br />
                        <p style="text-align:left!important"><strong>Act 129</strong></p>
                        <table width="100%"  cellspacing="0" cellpadding="5" style="text-align:left!important; border-right:0;">
                            <tr>
                                <td width="50%">
                                    <strong>LED Night Lights:</strong><asp:TextBox ID="txt_LedNightLight" runat="server"
                                        Style="width: 40px; text-align: center; border: none; border: solid 1px rgb(0, 0, 0);"></asp:TextBox><sup>(No
                                    install limit, no warranty)</sup>
                                    <br />
                                    <br />
                                    Location:
                                    <asp:TextBox ID="txt_LedNightLight_Location1" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 62%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:TextBox ID="txt_LedNightLight_Location2" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 92%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <br />
                                    <br />
                                    
                                    <asp:TextBox ID="txt_LedNightLight_Location3" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 92%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><br />
                                    <br />
                                    <asp:TextBox ID="txt_LedNightLight_Location4" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 92%; font-weight: normal; margin-bottom:14px; color: rgb(0, 0, 0);"></asp:TextBox>
                                <br />
                                </td>
                                <td style="border-right:0;">
                                    <strong>Smart Power Strip:</strong>
                                    <asp:TextBox ID="txt_SmartPowerStrip" runat="server" Style="width: 40px; text-align: center; border: none; border: solid 1px rgb(0, 0, 0);"></asp:TextBox>
                                    <sup>Up to 4/household SPS</sup>
                                    <%--Installation required by auditor or crew.--%>
                                    <br />
                                    <br />
                                    Location:
                                    <asp:TextBox ID="txt_SmartPower_Location1" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 27%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                  
                                    <asp:RadioButton ID="rdo_Line1_6_9_Outlet" runat="server" GroupName="Line1SmartPower" />
                                    6-9 Outlet
                                    <asp:RadioButton ID="rdo_Line1_10_Outlet" runat="server" GroupName="Line1SmartPower" />
                                    10+ Outlet
                                    <br />
                                    <br />
                                    <asp:TextBox ID="txt_SmartPower_Location2" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <asp:RadioButton ID="rdo_Line2_6_9_Outlet" runat="server" GroupName="Line2SmartPower" />
                                    6-9 Outlet
                                    <asp:RadioButton ID="rdo_Line2_10_Outlet" runat="server" GroupName="Line2SmartPower" />
                                    10+ Outlet
                                    <br />
                                    <br />
                                    <asp:TextBox ID="txt_SmartPower_Location3" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    <asp:RadioButton ID="rdo_Line3_6_9_Outlet" runat="server" GroupName="Line3SmartPower" />
                                    6-9 Outlet
                                    <asp:RadioButton ID="rdo_Line3_10_Outlet" runat="server" GroupName="Line3SmartPower" />
                                    10+ Outlet
                                    <br />
                                    <br />
                                    <asp:TextBox ID="txt_SmartPower_Location4" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 45%; font-weight: normal; color: rgb(0, 0, 0); margin-bottom:14px;"></asp:TextBox>
                                    <asp:RadioButton ID="rdo_Line4_6_9_Outlet" runat="server" GroupName="Line4SmartPower" />
                                    6-9 Outlet
                                    <asp:RadioButton ID="rdo_Line4_10_Outlet" runat="server" GroupName="Line4SmartPower" />
                                    10+ Outlet
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="border: 0 !important;" valign="top">
                        <table width="100%" cellspacing="0" cellpadding="5" id="tblmy">
                            <tr >
                               <th colspan="2" style="border-left:0;border-right:0;"> CO Alarms</th>
                               
                            </tr>
                            <tr>
                           
                             <td># of Existing Alarms  less than 5 years old:</td>                                 
                                
                             <td>
                                   <asp:TextBox ID="txt_ExistingAlarms" runat="server" Style="width: 40px; text-align: center; border: none; border: solid 1px rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                           
                               
                            </tr>
                            <tr>
                                <td>Total NEW Alarms installed # </td>
                                  <td>  <asp:TextBox ID="txt_NewAlarms" runat="server" Style="width: 40px; text-align: center; border: none; border: solid 1px rgb(0, 0, 0);"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Location of new:</td>
                                   <td> <asp:TextBox ID="txt_COAlarms_Location1" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 45px; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2">
                                    <asp:TextBox ID="txt_COAlarms_Location2" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                    
                                    </td></tr>
                                    <tr><td colspan="2"><asp:TextBox ID="txt_COAlarms_Location3" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><br />
                                    </td></tr>
                                   <tr><td colspan="2"> <asp:TextBox ID="txt_COAlarms_Location4" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox><br />
                                    </td></tr>
                                    <tr><td colspan="2"><asp:TextBox ID="txt_COAlarms_Location5" runat="server" Style="border: none; border: solid 1px rgb(0, 0, 0); width: 90%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                                </td></tr>
                            
                        </table>
                    </td>
                </tr>
            </table>

        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            document.getElementById('Page5').classList.add("ui-selected");
        });
        function AddLedBulbs() {

            var line1 = document.getElementById('<%= txt_Line1_Total.ClientID %>').value;
                    if (line1 == '') {
                        line1 = 0;
                    }
                    var line2 = document.getElementById('<%= txt_Line2_Total.ClientID %>').value;
            if (line2 == '') {
                line2 = 0;
            }
            var line3 = document.getElementById('<%= txt_Line3_Total.ClientID %>').value;
            if (line3 == '') {
                line3 = 0;
            }
            var line4 = document.getElementById('<%= txt_Line4_Total.ClientID %>').value;
            if (line4 == '') {
                line4 = 0;
            }
            var line5 = document.getElementById('<%= txt_Line5_Total.ClientID %>').value;
            if (line5 == '') {
                line5 = 0;
            }
            var line6 = document.getElementById('<%= txt_Line6_Total.ClientID %>').value;
            if (line6 == '') {
                line6 = 0;
            }
            var line7 = document.getElementById('<%= txt_Line7_Total.ClientID %>').value;
            if (line7 == '') {
                line7 = 0;
            }
            var line8 = document.getElementById('<%= txt_Line8_Total.ClientID %>').value;
            if (line8 == '') {
                line8 = 0;
            }
            var line9 = document.getElementById('<%= txt_Line9_Total.ClientID %>').value;
            if (line9 == '') {
                line9 = 0;
            }
            var line10 = document.getElementById('<%= txt_Line10_Total.ClientID %>').value;
            if (line10 == '') {
                line10 = 0;
            }
            var line11 = document.getElementById('<%= txt_Line11_Total.ClientID %>').value;
            if (line11 == '') {
                line11 = 0;
            }
            var line12 = document.getElementById('<%= txt_Line12_Total.ClientID %>').value;
            if (line12 == '') {
                line12 = 0;
            }
            var line13 = document.getElementById('<%= txt_Line13_Total.ClientID %>').value;
            if (line13 == '') {
                line13 = 0;
            }
            var line14 = document.getElementById('<%= txt_Line14_Total.ClientID %>').value;
            if (line14 == '') {
                line14 = 0;
            }

            document.getElementById('<%= txt_TotalLedInstallBulb.ClientID %>').value = parseInt(line1) + parseInt(line2) + parseInt(line3) + parseInt(line4) + parseInt(line5) + parseInt(line6) + parseInt(line7) + parseInt(line8) + parseInt(line9) + parseInt(line10) + parseInt(line11) + parseInt(line12) + parseInt(line13) + parseInt(line14)
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

