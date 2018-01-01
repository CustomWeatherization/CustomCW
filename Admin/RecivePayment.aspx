<%@ Page Language="C#" MasterPageFile="~/Admin/Admin_Master_Page.master" AutoEventWireup="true"
    CodeFile="RecivePayment.aspx.cs" Inherits="Admin_RecivePayment" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <script type='text/javascript'>
        function Comma(Num_) { //function to add commas to textboxes
            var Num = Num_.replace(/\$/g, '');
            Num += '';
            Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
            Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
            x = Num.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1))
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            myFunction();
            return '$' + x1 + x2;
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".btn_payselectclass").css('display', 'none');
            myFunction();
        });


        function GetChekedID() {
            var checkedValues = $('input:checkbox:checked').map(function () {
                return this.id;
            }).get();
               $('#<%=hdnID.ClientID %>').val(checkedValues);
             
        }
        function myFunction() {
            var ids = "";
            var amount = 0;
            var checkedValues = $('input:checkbox:checked').map(function () {
                ids = ids + '-' + this.id;
                localStorage.setItem("ChkBoxesId", "");
                //amount = amount + parseFloat(this.value); TA=value,paid,remain,activ,kp.


                if (($(this).attr("activ")) == "True" && ($(this).attr("kp")) == "Y") {
                    amount = amount + parseFloat($(this).attr("paid"))
                }
                else if (parseFloat($(this).attr("paid")) == 0 && (parseFloat(this.value) == parseFloat($(this).attr("remain")))) {
                    amount = amount + parseFloat(this.value);
                }
                else if (($(this).attr("kp")) == "N" && ($(this).attr("activ")) == "False") {
                    //alert(parseFloat($(this).attr("paid")));
                    amount = amount + parseFloat($(this).attr("paid"))
                }
                else if (($(this).attr("kp")) == "Y" && ($(this).attr("activ")) == "False") {
                    amount = amount + parseFloat($(this).attr("paid"))
                }
                else if (($(this).attr("kp")) == "New" && ($(this).attr("activ")) == "False") {
                    amount = amount + parseFloat($(this).attr("remain"))
                }
                return this.value;
            }).get();

            var txtAmt =document.getElementById('<%= txt_Amount.ClientID %>').value;
            txtAmt = txtAmt.replace(/\$/g, '');
            txtAmt = txtAmt.replace(/\,/g, '');
            if (amount == txtAmt) {
                $("#btn_PaySelect2").css('display', 'none');
                $(".btn_payselectclass").css('display', 'block');
            } else {
                $(".btn_payselectclass").css('display', 'none');
                $("#btn_PaySelect2").css('display', 'block');
            }
            var lclStrg = parseFloat(amount) - parseFloat(txtAmt);
            localStorage.setItem("TCount", lclStrg);
            $(".lblAmountClass").text(amount.toFixed(2));
            //document.getElementById('<%=lblTotalAmount.ClientID%>').value  =  String(amount.toFixed(2));
            localStorage.setItem("ChkBoxesId", ids);
            MakeVirtualURL();
        }
        //
        function GetChekedIID() {
            var checkedValues = $('input:checkbox:checked').map(function () {
                return this.id;
            }).get();
            alert('check amount and total amount does not match !');
            $('#<%=hdnID.ClientID %>').val(checkedValues);
          
        }


        function FunPaymentMethod() {
            var e = document.getElementById('<%= DDL_PaymentMethod.ClientID %>');
            var lclStrg = e.options[e.selectedIndex].value;
           
            if (lclStrg == "Credit Card") {
                localStorage.setItem("LSCN", "");
            }
            localStorage.setItem("LSPT", lclStrg);
        }

        function FunPCheckNo() {
            var lclStrg = document.getElementById('<%= txt_CheckNo.ClientID %>').value;
            localStorage.setItem("LSCN", lclStrg);
        }


        function MakeVirtualURL() {
            var PriUrl = "";
            var DRF = document.getElementById('<%= DDL_ReceiveFrom.ClientID %>');
            PriUrl = 'RF=' + DRF.options[DRF.selectedIndex].value;

            var TD = 'D=' + document.getElementById('<%= txt_Date.ClientID %>').value;
            PriUrl = PriUrl + '*' + TD;

            var TA = 'A=' + document.getElementById('<%= txt_Amount.ClientID %>').value;
            PriUrl = PriUrl + '*' + TA;

            var DPT = document.getElementById('<%= DDL_PaymentMethod.ClientID %>');
            var VDPT = DPT.options[DPT.selectedIndex].value;            
            PriUrl = PriUrl + '*' + 'PT=' + VDPT;
            if (VDPT == "Check") {
                var TCH = 'CH=' + document.getElementById('<%= txt_CheckNo.ClientID %>').value;
                PriUrl = PriUrl + '*' + TCH;
            }
            var allIds = localStorage.getItem("ChkBoxesId");
            PriUrl = PriUrl + '*AllId= ' + allIds;
            //localStorage.setItem("PriUrl", PriUrl);
            //$("#ctl00_ContentPlaceHolder1_hdnUrl").val(PriUrl);
           
          $('#<%=hdnUrl.ClientID %>').val(PriUrl);
            
        }

    </script>

    <%--<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />--%>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>

    <style type="text/css">
        .style4
        {
            width: 8%;
        }
        .style5
        {
            width: 9%;
        }
        .style7
        {
            width: 1%;
        }
        .style8
        {
            width: 15%;
        }
        .style9
        {
            width: 101px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
   
    <fieldset style="width: 28%; margin-left: 332px;" hidden>
        <legend>Temporary Mechanism </legend>
        <table align="center">
            <tr>
                <td>
                    Job Number
                </td>
                <td>
                    <asp:TextBox ID="txtJN" runat="server" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                        font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0; width: 146px;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_txtJN" runat="server" ControlToValidate="txtJN"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="G14"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnTempSave" runat="server" ValidationGroup="G14" Style="width: 65%"
                        class="btn_all" Text="Import" OnClick="btnTempSave_Click" />
                </td>
            </tr>
        </table>
          <br />
    <br />
    </fieldset>
  
    <h1>
        Receive Payments</h1>
    <asp:HiddenField ID="hdnID" Value="" runat="server" />
    <asp:HiddenField ID="hdnUrl" Value="" runat="server" />
    <table align="center">
        <tr>
            <td>
                <strong>Receive From: </strong>
            </td>
            <td>
                <asp:DropDownList ID="DDL_ReceiveFrom" runat="server" Width="150px" Style="border: 1px solid #ccc;
                    font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                    padding: 8px; margin: 0; width: 150px;" OnSelectedIndexChanged="DDL_ReceiveFrom_SelectedIndexChanged"
                    onchange="MakeVirtualURL()" AutoPostBack="true">
                    <asp:ListItem Text="All" Value="Select"></asp:ListItem>
                    <asp:ListItem Text="CACLV" Value="CACLV"></asp:ListItem>
                    <asp:ListItem Text="PPL Z1" Value="PPL Z1"></asp:ListItem>
                    <asp:ListItem Text="PPL Z2" Value="PPL Z2"></asp:ListItem>
                    <asp:ListItem Text="PPL Z1 & Z2" Value="PPL Z1Z2"></asp:ListItem>
                    <asp:ListItem Text="BCOC" Value="BCOC"></asp:ListItem>
                    <asp:ListItem Text="Private" Value="Private"></asp:ListItem>
                </asp:DropDownList>
                <%-- <asp:RequiredFieldValidator ID="rfv_DDL_ReceiveFrom" runat="server" ControlToValidate="DDL_ReceiveFrom"
                    InitialValue="Select" Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>--%>
            </td>
            <td>
                <strong>Date:</strong>
            </td>
            <td>
                <asp:TextBox ID="txt_Date" onchange="MakeVirtualURL()" runat="server" Width="146px"
                    Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                    color: black; border-radius: 5px; padding: 8px; margin: 0; width: 146px;"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txt_DateCalendr" runat="server" TargetControlID="txt_Date">
                </ajaxToolkit:CalendarExtender>
                <asp:RequiredFieldValidator ID="rfv_txt_Date" runat="server" ControlToValidate="txt_Date"
                    Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <strong>Amount:</strong>
            </td>
            <td>
                <asp:TextBox ID="txt_Amount" runat="server" Width="132px" onchange="MakeVirtualURL()"
                    Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
                    color: black; border-radius: 5px; padding: 8px; margin: 0;" onkeyup="javascript:this.value=Comma(this.value);"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txt_Amount" runat="server" ControlToValidate="txt_Amount"
                    Display="Dynamic" ErrorMessage="*" ValidationGroup="G"></asp:RequiredFieldValidator>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <asp:UpdatePanel ID="upPnl" runat="server">
                <ContentTemplate>
                    <td>
                        <strong>Payment Type:</strong>
                    </td>
                    <td>
                        <asp:DropDownList ID="DDL_PaymentMethod" runat="server" Width="150px" Style="border: 1px solid #ccc;
                            font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: black; border-radius: 5px;
                            padding: 8px; margin: 0;" OnSelectedIndexChanged="DDL_PaymentMethod_SelectedIndexChanged"
                            onchange="FunPaymentMethod()" AutoPostBack="true">
                            <asp:ListItem Text="Select" Value="Select">
                            </asp:ListItem>
                            <asp:ListItem Text="Check" Value="Check">
                            </asp:ListItem>
                            <asp:ListItem Text="Credit Card" Value="Credit Card">
                            </asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_DDL_PaymentMethod" runat="server" ControlToValidate="DDL_PaymentMethod"
                            Display="Dynamic" ErrorMessage="*" ValidationGroup="G" InitialValue="Select"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <strong id="stng_Check" runat="server" visible="false">Check #:</strong>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_CheckNo" runat="server" onkeyup="FunPCheckNo()" Visible="false"
                            Width="146px" Style="border: 1px solid #ccc; font-family: Arial, Helvetica, sans-serif;
                            font-size: 14px; color: black; border-radius: 5px; padding: 8px; margin: 0;"></asp:TextBox>
                    </td>
                </ContentTemplate>
            </asp:UpdatePanel>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Button ID="btn_PaySelect" runat="server" Text="Pay Selected" ValidationGroup="G"
                    Style="display: none;" OnClientClick="GetChekedID();" class="btn_all btn_payselectclass" OnClick="btn_PaySelect_Click" />
                <input id="btn_PaySelect2" type="button" value="Pay Selected" class="btn_all" onclick="GetChekedIID();" />
            </td>
        </tr>
        <tr>
            <td align="left">
                Total Amount
            </td>
            <td colspan="3" align="left">
                <asp:Label ID="lblTotalAmount" Text="0.00" runat="server" class="lblAmountClass" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    
    <div class="grid">
    
        <table width="93%" border="0" cellspacing="0" cellpadding="0" style="position:absolute;">
            <tr>
                <th class="style8">
                    Customer Name
                </th>
                <th class="style5">
                    Job Number
                </th>
                <th style="width: 3%;">
                   
                </th>
                <th class="style5">
                    Job Type 
                </th>
                <th class="style9">
                   Total Amount
                </th>
                <th class="style5">
                    Paid Amount
                </th>
                <th class="style5">
                    Remaining Amount
                </th>
              <%--  <th style="width: 7%;">
                    Payment Type
                </th>
                <th style="width: 7%;">
                    Payment No
                </th>--%>
                <%--<th>
                    Status
                </th>--%>
                <th class="style5">
                    Return Date
                </th>
                <th style="width: 7%;" align="left">
                    Manage
                </th>
            </tr>
            </table><br /><br /><br /><br />
            
            <% if (dtRed != null)
               {
                   if (dtRed.Rows.Count > 0)
                   {
                       for (int i = 0; i < dtRed.Rows.Count; i++)
                       {
                           decimal str_total;
                           string strTotal = dtRed.Rows[i]["PaidTotalAmount"].ToString();
                           if (strTotal == "")
                           {
                               strTotal = "0.00";
                               str_total = Convert.ToDecimal(strTotal);
                           }
                           else
                           {
                               str_total = Convert.ToDecimal(strTotal);
                           }
                           TotalAmt += str_total;
                           
            %>
               <div style="width: 100%; overflow: auto; max-height: 370px;" >
            <table style="width: 100%;">
            <tr class="red">
                <td class="bold" style="width: 14%;">
                    <%=dtRed.Rows[i]["FirstName"].ToString()%>
                    <%=dtRed.Rows[i]["Lastname"].ToString()%>
                </td>
                <td class="style5">
                 <a style="color: inherit;" href="../AddNewJob.aspx?Back=JobsStatus&Jobs=<%=dtRed.Rows[i]["JobNumber"].ToString()%>&UC=<%=dtRed.Rows[i]["UtilityCompany"].ToString()%>">
                           <%=dtRed.Rows[i]["JobNumber"].ToString()%></a>
                   
                </td>
                <td class="style7">
                    <%--<asp:CheckBox ID="chk_RecivePayment" value="<%=dtRed.Rows[i]["JobId"].ToString()%>"    onclick="myFunction()" runat="server" />--%>
                    <% if (dtRed.Rows[i]["PaidStatus"].ToString() == "Paid")
                       {
                       }
                       else
                       {%>
                    <input type="checkbox" id="chk_RecivePayment_<%=dtRed.Rows[i]["PaidID"].ToString()%>"
                        <%=dtRed.Rows[i]["Checked"].ToString()%> value="<%=dtRed.Rows[i]["PaidTotalAmount"].ToString()%>"
                        kp="<%=dtRed.Rows[i]["KeepRemain"].ToString()%>" paid="<%=dtRed.Rows[i]["PaidAmount"].ToString()%>"
                        remain="<%=dtRed.Rows[i]["PaidRemainingAmount"].ToString()%>" activ="<%= Convert.ToString(dtRed.Rows[i]["IsActive"])%>"
                        onclick="myFunction()" /><%} %>
                </td>
                <%--<td><a href="AddNewJob.aspx?Jobs=<%=dtRed.Rows[i]["JobNumber"].ToString()%>&UC=<%=Request.QueryString["UC"].ToString()%>"><%=dtRed.Rows[i]["JobNumber"].ToString()%></a></td>--%>
                <td class="style4">
                    <%if (Convert.ToBoolean(dtRed.Rows[i]["LowCost"]) == true)
                      { %>
                    Low Cost
                    <%}
                      else if (Convert.ToBoolean(dtRed.Rows[i]["FullCost"]) == true)
                      { %>
                    FullCost
                    <%} %>
                </td>
                <td style="width: 10%;">
                    <%=dtRed.Rows[i]["PaidTotalAmount"].ToString()%>
                </td>
                <td class="style4">
                    <%=dtRed.Rows[i]["PaidAmount"].ToString()%>
                </td>
                <td class="style5">
                    <%=dtRed.Rows[i]["PaidRemainingAmount"].ToString()%>
                </td>
               <%-- <td class="style6">
                    <%=dtRed.Rows[i]["Payment_Type"].ToString()%>
                </td>
                <td style="width: 7%;">
                    <%=dtRed.Rows[i]["PaymentType_No"].ToString()%>
                </td>--%>
                <%--<td>
                    <%=dtRed.Rows[i]["PaidStatus"].ToString()%>
                </td>--%>
                <td style="width: 10%;">
                    <% if (Convert.ToDateTime(dtRed.Rows[i]["CWReturnDate"]).ToString("MM-dd-yyy") != "01-01-1900")
                       {%>
                    <%=Convert.ToDateTime(dtRed.Rows[i]["CWReturnDate"]).ToString("MM-dd-yyy")%>
                    <% }%>
                </td>
                <td style="width: 7%;">
                    <% if (dtRed.Rows[i]["PaidStatus"].ToString() == "Paid")
                       {
                       }
                       else
                       {   
                    %>
                    <%--<a href="ManagePaidReport.aspx?VUrl=<%= hdnUrl.Value %> &JobID=<%=dtRed.Rows[i]["JobId"].ToString()%>&UC=<%= dtRed.Rows[i]["UtilityCompany"].ToString() %>&NoOfInvoice=<%= dtRed.Rows[i]["NoOfInvoice"].ToString() %>">Manage</a>--%>
                    <%--<a onclick="callFun(<%= dtRed.Rows[i]["UtilityCompany"].ToString() %>,<%= dtRed.Rows[i]["JobId"].ToString()%>,<%= dtRed.Rows[i]["NoOfInvoice"].ToString() %>)" style="cursor: pointer;">Manage</a>--%>
                    <a onclick="callFun('<%= dtRed.Rows[i]["UtilityCompany"].ToString() %>',<%= dtRed.Rows[i]["JobId"].ToString()%>,<%= dtRed.Rows[i]["NoOfInvoice"].ToString() %>)"
                        style="cursor: pointer;">Manage</a>
                    <%} %>
                    <%-- <div id="dialog">
                    </div>--%>
                </td>
            </tr>
            <%}
                   }
               }%>
            <tr>
                <td colspan="11" align="center">
                    <strong>Total:-&nbsp;
                        <%= TotalAmt %>
                    </strong>
                </td>
            </tr>
        </table>
    </div>
</div>
    <script language="javascript" type="text/javascript">
        function callFun(UC, JobID, NoOfInvoice) {
            //var val = $("#ctl00_ContentPlaceHolder1_hdnUrl").val();
            var val = document.getElementById("<%=hdnUrl.ClientID%>").value;
            window.location.href = ("ManagePaidReport.aspx?VUrl=" + val + "&JobID=" + JobID + "&UC=" + UC + "&NoOfInvoice=" + NoOfInvoice);
        
//        $('#dialog').load('&#34;ManagePaidReport.aspx?VUrl=&#34; + val + &#34;&JobID=&#34; + JobID + &#34;&UC=&#34; + UC + &#34;&NoOfInvoice=&#34; + NoOfInvoice', function() {
//    $(this).dialog({
//        modal: true,
//        height: 600,
//        width: 980
//    });
//});
 }
    </script>

</asp:Content>
