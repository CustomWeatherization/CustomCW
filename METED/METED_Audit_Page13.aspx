<%@ Page Language="C#" MasterPageFile="~/METED/METED_Audit_MasterPage.master" AutoEventWireup="true"
    CodeFile="METED_Audit_Page13.aspx.cs" Inherits="METED_METED_Audit_Page13" Title="METED_Audit_Page13" %>

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
        <div style="border: 1px solid #000; width: 100%; height: auto;">
            <div style="border-right: 1px solid #000; width: 50%; float: left; min-height: 400px;">
                <strong>Attic</strong></div>
            <div style="width: 49%; float: left;">
                <strong>2nd Fl</strong></div>
            <div class="clear">
            </div>
        </div>
        <div style="border: 1px solid #000; width: 100%; height: auto; margin-bottom: 20px;">
            <div style="border-right: 1px solid #000; width: 50%; float: left; min-height: 400px;">
                <strong>Basement</strong></div>
            <div style="width: 49%; float: left;">
                <strong>1st Fl</strong></div>
            <div class="clear">
            </div>
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="10">
            <tr>
                <td>
                    <span class="round_shape">A</span>
                </td>
                <td>
                    Access
                </td>
                <td>
                    <span class="round_shape">V</span>
                </td>
                <td>
                    Ventilation
                </td>
            </tr>
            <tr>
                <td>
                    <span class="round_shape">H</span>
                </td>
                <td>
                    Recessed heat producing device
                </td>
                <td>
                    <span class="round_shape2">01</span>
                </td>
                <td>
                    Other
                    <asp:TextBox ID="txt_Line1_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <span class="round_shape">D</span>
                </td>
                <td>
                    Dropped soffit/ceiling/bulkhead
                </td>
                <td>
                    <span class="round_shape2">02</span>
                </td>
                <td>
                    Other
                    <asp:TextBox ID="txt_Line2_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <span class="round_shape3">I</span>
                </td>
                <td>
                    Existing insulation
                </td>
                <td>
                    <span class="round_shape2">03</span>
                </td>
                <td>
                    Other
                    <asp:TextBox ID="txt_Line3_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <span class="round_shape">S</span>
                </td>
                <td>
                    Stored Items
                </td>
                <td>
                    <span class="round_shape2">04</span>
                </td>
                <td>
                    Other
                    <asp:TextBox ID="txt_Line4_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <span class="round_shape">F</span>
                </td>
                <td>
                    Floor
                </td>
                <td>
                    <span class="round_shape2">05</span>
                </td>
                <td>
                    Other
                    <asp:TextBox ID="txt_Line15_Other" runat="server" Style="border: none; border-bottom: solid 1px rgb(0, 0, 0);
                        width: 45%; font-weight: normal; color: rgb(0, 0, 0);"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
     
      $(function() {
            document.getElementById('Page13').classList.add("ui-selected");
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
